Results do not match other implementations

The following queries provide results that do not match those of other implementations of JSONPath
(compare https://cburgmer.github.io/json-path-comparison/):

- [ ] `$[1:10]`
  Input:
  ```
  ["first", "second", "third"]
  ```
  Expected output:
  ```
  ["second", "third"]
  ```
  Error:
  ```
  index [to] out of range: len: 3, to: 10
  ```

- [ ] `$[:2]`
  Input:
  ```
  ["first", "second", "third", "forth", "fifth"]
  ```
  Expected output:
  ```
  ["first", "second"]
  ```
  Actual output:
  ```
  ["first", "second", "third"]
  ```

- [ ] `$[1:3]`
  Input:
  ```
  ["first", "second", "third", "forth", "fifth"]
  ```
  Expected output:
  ```
  ["second", "third"]
  ```
  Actual output:
  ```
  ["second", "third", "forth"]
  ```

- [ ] `$[0:3:2]`
  Input:
  ```
  ["first", "second", "third", "forth", "fifth"]
  ```
  Expected output:
  ```
  ["first", "third"]
  ```
  Error:
  ```
  only support one range(from, to): [0 3 2]
  ```

- [ ] `$[0:3:1]`
  Input:
  ```
  ["first", "second", "third", "forth", "fifth"]
  ```
  Expected output:
  ```
  ["first", "second", "third"]
  ```
  Error:
  ```
  only support one range(from, to): [0 3 1]
  ```

- [ ] `$[0:1]`
  Input:
  ```
  ["first", "second"]
  ```
  Expected output:
  ```
  ["first"]
  ```
  Actual output:
  ```
  ["first", "second"]
  ```

- [ ] `$[::2]`
  Input:
  ```
  ["first", "second", "third", "forth", "fifth"]
  ```
  Expected output:
  ```
  ["first", "third", "fifth"]
  ```
  Error:
  ```
  only support one range(from, to): [  2]
  ```

- [ ] `$[?(@.key>42)]`
  Input:
  ```
  [{"key": 0}, {"key": 42}, {"key": -1}, {"key": 41}, {"key": 43}, {"key": 42.0001}, {"key": 41.9999}, {"key": 100}]
  ```
  Expected output:
  ```
  [{"key": 43}, {"key": 42.0001}, {"key": 100}]
  ```
  Actual output:
  ```
  []
  ```

- [ ] `$[?(@.key<42)]`
  Input:
  ```
  [{"key": 0}, {"key": 42}, {"key": -1}, {"key": 41}, {"key": 43}, {"key": 42.0001}, {"key": 41.9999}, {"key": 100}, {"some": "value"}]
  ```
  Expected output:
  ```
  [{"key": 0}, {"key": -1}, {"key": 41}, {"key": 41.9999}]
  ```
  Actual output:
  ```
  []
  ```

- [ ] `$[?(@.key)]`
  Input:
  ```
  [{"some": "some value"}, {"key": "value"}]
  ```
  Expected output:
  ```
  [{"key": "value"}]
  ```
  Actual output:
  ```
  []
  ```

- [ ] `$['key']`
  Input:
  ```
  {"key": "value"}
  ```
  Expected output:
  ```
  ["value"]
  ```
  Error:
  ```
  strconv.Atoi: parsing "'key'": invalid syntax
  Expecting value: line 1 column 1 (char 0)
  ```

- [ ] `$['0']`
  Input:
  ```
  {"0": "value"}
  ```
  Expected output:
  ```
  ["value"]
  ```
  Error:
  ```
  strconv.Atoi: parsing "'0'": invalid syntax
  Expecting value: line 1 column 1 (char 0)
  ```

- [ ] `$['special:"chars']`
  Input:
  ```
  {"special:\"chars": "value"}
  ```
  Expected output:
  ```
  ["value"]
  ```
  Error:
  ```
  strconv.Atoi: parsing "\"chars'": invalid syntax
  Expecting value: line 1 column 1 (char 0)
  ```

- [ ] `$['*']`
  Input:
  ```
  {"*": "value"}
  ```
  Expected output:
  ```
  ["value"]
  ```
  Error:
  ```
  strconv.Atoi: parsing "'*'": invalid syntax
  Expecting value: line 1 column 1 (char 0)
  ```

- [ ] `$..key`
  Input:
  ```
  {"object": {"key": "value", "array": [{"key": "something"}, {"key": {"key": "russian dolls"}}]}, "key": "top"}
  ```
  Expected output:
  ```
  ["top", "value", "something", {"key": "russian dolls"}, "russian dolls"]
  ```
  Error:
  ```
  expression don't support in filter
  ```

- [ ] `$.store..price`
  Input:
  ```
  {"store": {"book": [{"category": "reference", "author": "Nigel Rees", "title": "Sayings of the Century", "price": 8.95}, {"category": "fiction", "author": "Evelyn Waugh", "title": "Sword of Honour", "price": 12.99}, {"category": "fiction", "author": "Herman Melville", "title": "Moby Dick", "isbn": "0-553-21311-3", "price": 8.99}, {"category": "fiction", "author": "J. R. R. Tolkien", "title": "The Lord of the Rings", "isbn": "0-395-19395-8", "price": 22.99}], "bicycle": {"color": "red", "price": 19.95}}}
  ```
  Expected output:
  ```
  [8.95, 12.99, 8.99, 22.99, 19.95]
  ```
  Error:
  ```
  expression don't support in filter
  ```

- [ ] `$..*`
  Input:
  ```
  {"key": "value", "another key": {"complex": "string", "primitives": [0, 1]}}
  ```
  Expected output:
  ```
  ["value", {"complex": "string", "primitives": [0, 1]}, "string", [0, 1], 0, 1]
  ```
  Error:
  ```
  expression don't support in filter
  ```

- [ ] `$..*`
  Input:
  ```
  [40, null, 42]
  ```
  Expected output:
  ```
  [40, null, 42]
  ```
  Error:
  ```
  expression don't support in filter
  ```

- [ ] `$[*]`
  Input:
  ```
  {"some": "string", "int": 42, "object": {"key": "value"}, "array": [0, 1]}
  ```
  Expected output:
  ```
  ["string", 42, {"key": "value"}, [0, 1]]
  ```
  Error:
  ```
  object is not Slice
  ```

- [ ] `$.*`
  Input:
  ```
  ["string", 42, {"key": "value"}, [0, 1]]
  ```
  Expected output:
  ```
  ["string", 42, {"key": "value"}, [0, 1]]
  ```
  Error:
  ```
  expression don't support in filter
  ```

- [ ] `$.*`
  Input:
  ```
  {"some": "string", "int": 42, "object": {"key": "value"}, "array": [0, 1]}
  ```
  Expected output:
  ```
  ["string", 42, {"key": "value"}, [0, 1]]
  ```
  Error:
  ```
  expression don't support in filter
  ```


For reference, the output was generated by the program in https://github.com/cburgmer/json-path-comparison/tree/master/implementations/Golang_github.com-oliveagle-jsonpath.