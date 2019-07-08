Results do not match other implementations

The following queries provide results that do not match those of other implementations of JSONPath
(compare https://cburgmer.github.io/json-path-comparison/):

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
  Traceback (most recent call last):
    File "main.py", line 16, in <module>
      sys.exit(main())
    File "main.py", line 8, in main
      query = parse(selector)
    File "/usr/local/lib/python2.7/site-packages/jsonpath_rw/parser.py", line 14, in parse
      return JsonPathParser().parse(string)
    File "/usr/local/lib/python2.7/site-packages/jsonpath_rw/parser.py", line 32, in parse
      return self.parse_token_stream(lexer.tokenize(string))
    File "/usr/local/lib/python2.7/site-packages/jsonpath_rw/parser.py", line 55, in parse_token_stream
      return new_parser.parse(lexer = IteratorToTokenStream(token_iterator))
    File "/usr/local/lib/python2.7/site-packages/ply/yacc.py", line 333, in parse
      return self.parseopt_notrack(input, lexer, debug, tracking, tokenfunc)
    File "/usr/local/lib/python2.7/site-packages/ply/yacc.py", line 1201, in parseopt_notrack
      tok = call_errorfunc(self.errorfunc, errtoken, self)
    File "/usr/local/lib/python2.7/site-packages/ply/yacc.py", line 192, in call_errorfunc
      r = errorfunc(token)
    File "/usr/local/lib/python2.7/site-packages/jsonpath_rw/parser.py", line 69, in p_error
      raise Exception('Parse error at %s:%s near token %s (%s)' % (t.lineno, t.col, t.value, t.type)) 
  Exception: Parse error at 1:5 near token : (:)
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
  Traceback (most recent call last):
    File "main.py", line 16, in <module>
      sys.exit(main())
    File "main.py", line 8, in main
      query = parse(selector)
    File "/usr/local/lib/python2.7/site-packages/jsonpath_rw/parser.py", line 14, in parse
      return JsonPathParser().parse(string)
    File "/usr/local/lib/python2.7/site-packages/jsonpath_rw/parser.py", line 32, in parse
      return self.parse_token_stream(lexer.tokenize(string))
    File "/usr/local/lib/python2.7/site-packages/jsonpath_rw/parser.py", line 55, in parse_token_stream
      return new_parser.parse(lexer = IteratorToTokenStream(token_iterator))
    File "/usr/local/lib/python2.7/site-packages/ply/yacc.py", line 333, in parse
      return self.parseopt_notrack(input, lexer, debug, tracking, tokenfunc)
    File "/usr/local/lib/python2.7/site-packages/ply/yacc.py", line 1201, in parseopt_notrack
      tok = call_errorfunc(self.errorfunc, errtoken, self)
    File "/usr/local/lib/python2.7/site-packages/ply/yacc.py", line 192, in call_errorfunc
      r = errorfunc(token)
    File "/usr/local/lib/python2.7/site-packages/jsonpath_rw/parser.py", line 69, in p_error
      raise Exception('Parse error at %s:%s near token %s (%s)' % (t.lineno, t.col, t.value, t.type)) 
  Exception: Parse error at 1:5 near token : (:)
  ```

- [ ] `$[0:4:2]`
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
  Traceback (most recent call last):
    File "main.py", line 16, in <module>
      sys.exit(main())
    File "main.py", line 8, in main
      query = parse(selector)
    File "/usr/local/lib/python2.7/site-packages/jsonpath_rw/parser.py", line 14, in parse
      return JsonPathParser().parse(string)
    File "/usr/local/lib/python2.7/site-packages/jsonpath_rw/parser.py", line 32, in parse
      return self.parse_token_stream(lexer.tokenize(string))
    File "/usr/local/lib/python2.7/site-packages/jsonpath_rw/parser.py", line 55, in parse_token_stream
      return new_parser.parse(lexer = IteratorToTokenStream(token_iterator))
    File "/usr/local/lib/python2.7/site-packages/ply/yacc.py", line 333, in parse
      return self.parseopt_notrack(input, lexer, debug, tracking, tokenfunc)
    File "/usr/local/lib/python2.7/site-packages/ply/yacc.py", line 1201, in parseopt_notrack
      tok = call_errorfunc(self.errorfunc, errtoken, self)
    File "/usr/local/lib/python2.7/site-packages/ply/yacc.py", line 192, in call_errorfunc
      r = errorfunc(token)
    File "/usr/local/lib/python2.7/site-packages/jsonpath_rw/parser.py", line 69, in p_error
      raise Exception('Parse error at %s:%s near token %s (%s)' % (t.lineno, t.col, t.value, t.type)) 
  Exception: Parse error at 1:5 near token : (:)
  ```

- [ ] `$[0,1]`
  Input:
  ```
  ["first", "second", "third"]
  ```
  Expected output:
  ```
  ["first", "second"]
  ```
  Error:
  ```
  Traceback (most recent call last):
    File "main.py", line 16, in <module>
      sys.exit(main())
    File "main.py", line 8, in main
      query = parse(selector)
    File "/usr/local/lib/python2.7/site-packages/jsonpath_rw/parser.py", line 14, in parse
      return JsonPathParser().parse(string)
    File "/usr/local/lib/python2.7/site-packages/jsonpath_rw/parser.py", line 32, in parse
      return self.parse_token_stream(lexer.tokenize(string))
    File "/usr/local/lib/python2.7/site-packages/jsonpath_rw/parser.py", line 55, in parse_token_stream
      return new_parser.parse(lexer = IteratorToTokenStream(token_iterator))
    File "/usr/local/lib/python2.7/site-packages/ply/yacc.py", line 333, in parse
      return self.parseopt_notrack(input, lexer, debug, tracking, tokenfunc)
    File "/usr/local/lib/python2.7/site-packages/ply/yacc.py", line 1201, in parseopt_notrack
      tok = call_errorfunc(self.errorfunc, errtoken, self)
    File "/usr/local/lib/python2.7/site-packages/ply/yacc.py", line 192, in call_errorfunc
      r = errorfunc(token)
    File "/usr/local/lib/python2.7/site-packages/jsonpath_rw/parser.py", line 69, in p_error
      raise Exception('Parse error at %s:%s near token %s (%s)' % (t.lineno, t.col, t.value, t.type)) 
  Exception: Parse error at 1:3 near token , (,)
  ```

- [ ] `$[*]`
  Input:
  ```
  {"int": 42, "array": [0, 1], "object": {"key": "value"}, "some": "string"}
  ```
  Expected output:
  ```
  ["string", 42, {"key": "value"}, [0, 1]]
  ```
  Actual output:
  ```
  [{"int": 42, "array": [0, 1], "object": {"key": "value"}, "some": "string"}]
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
  Actual output:
  ```
  []
  ```

- [ ] `$.*`
  Input:
  ```
  {"int": 42, "array": [0, 1], "object": {"key": "value"}, "some": "string"}
  ```
  Expected output:
  ```
  ["string", 42, {"key": "value"}, [0, 1]]
  ```
  Actual output:
  ```
  [42, [0, 1], {"key": "value"}, "string"]
  ```


For reference, the output was generated by the program in https://github.com/cburgmer/json-path-comparison/tree/master/implementations/Python_jsonpath-rw.