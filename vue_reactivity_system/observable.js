/*
  Class that defines observable properties that automatically registers dependencies between
  watchers and observable properties, and updates all watchers when dependant properties change.
*/

const Dep = require('./dep');

class Observable {
  constructor(data) {
    Object.keys(data).forEach(key => this.defineReactiveProperty(key, data[key]));
  }

  defineReactiveProperty(key, value) {
    let internalValue = value;
    const dep = new Dep(); // each observable property maintains its own dependency object

    Object.defineProperty(this, key, {
      get() {
        if(Dep.target) { // Dep.target is set when registering a watcher, otherwise its null
          dep.depend();
        }

        return internalValue;
      },
      set(newVal) {
        internalValue = newVal;
        dep.notify(); // notify any dependant watchers to update
      }
    });
  }
}

module.exports = Observable;