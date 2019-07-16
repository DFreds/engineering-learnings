/*
  Function to register a subscriber that gets called whenever any observable properties are updated
*/

const Dep = require('./dep');

const watcher = (watcherFn) => {
  Dep.target = watcherFn; // Set this so that the getter function of observable properties can register a dependency
  Dep.target();           // Calculate the initial value of the watcher & register observable dependencies
  Dep.target = null;      // Clear this so that observable getters don't register an invalid dependency
};

module.exports = watcher;