#!/usr/bin/env node

const { readFile } = require('fs');
const { join } = require('path');

const identity = x => x;
const error = (err) => new Error('Error: Cannot find version in package.json', err);
const packageJsonPath = join(__dirname, './package.json');

const readVersion = (cb = identity) => {
  readFile(packageJsonPath, 'utf8', (err, data) => {
    if (err) {
      throw error(err);
    }
    const packageJson = JSON.parse(data)
    if (!packageJson || !packageJson.version) {
      throw error(err);
    }
    cb(packageJson.version)
  });
}

readVersion(console.log)
