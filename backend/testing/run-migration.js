const mysql = require('mysql2/promise');
const fs = require('fs');
const path = require('path');
require('dotenv').config();

async function runMigration() {
  let connection;
  
  try {
    console.log('Connecting to database...');
    connection = await mysql.createConnection({
      host: process.env.DB_HOST || 'localhost',
      user: process.env.DB_USER || 'sa',
      password: process.env.DB_PASSWORD || '123',
      database: process.env.DB_NAME || 'wattpad',
      port: process.env.DB_PORT || 3306,
      charset: 'utf8mb4',
      multipleStatements: true
    });

    console.log('✅ Connected to database\n');

    // Read and execute the migration SQL
    const sqlPath = path.join(__dirname, '../database', 'add_chapter_comments.sql');
    const sql = fs.readFileSync(sqlPath, 'utf8');

    console.log('Running migration: add_chapter_comments.sql');
    await connection.query(sql);

    console.log('✅ Migration completed successfully!\n');

    // Verify the table was created
    const [tables] = await connection.query("SHOW TABLES LIKE 'comments'");
    if (tables.length > 0) {
      console.log('✅ Comments table exists in database');
      
      // Show table structure
      const [columns] = await connection.query('DESCRIBE comments');
      console.log('\nTable structure:');
      console.log('='.repeat(60));
      columns.forEach(col => {
        console.log(`${col.Field.padEnd(15)} ${col.Type.padEnd(20)} ${col.Null === 'YES' ? 'NULL' : 'NOT NULL'}`);
      });
    }

  } catch (err) {
    console.error('❌ Error:', err.message);
    if (err.code === 'ECONNREFUSED') {
      console.error('\n💡 Database connection refused. Please check:');
      console.error('   - Is MySQL running?');
      console.error('   - Check your .env file for correct credentials');
    }
  } finally {
    if (connection) {
      await connection.end();
      console.log('\n✅ Database connection closed');
    }
  }
}

runMigration().catch(console.error);
