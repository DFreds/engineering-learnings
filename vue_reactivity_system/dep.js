/*
  Class to track the dependency between an observable property and any dependant subscribers/watchers
*/

class Dep {
  static target; // class variable that is set to the subscriber/watcher being registered, see watcher.js and observable.js for why a static variable is used

  constructor () {
    this.subscribers = [];
  }

  depend() { // register a dependency between an observable property and its dependant subscriber/watcher(or watcher)
    if (Dep.target && !this.subscribers.includes(Dep.target)) {
      this.subscribers.push(Dep.target);
    } 
  }

  notify() { // re-run all dependent subscribers/watchers for the given observable property
    this.subscribers.forEach(sub => sub());
  }
}

module.exports = Dep;