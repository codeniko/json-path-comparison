extern crate jsonpath;
extern crate serde_json;

use std::io;
use std::env;
use std::process;
use jsonpath::Selector;
use serde_json::Value;

fn main() {
    let query = env::args().nth(1).unwrap();

    let json = serde_json::from_reader(io::stdin()).unwrap();
    let selector = match Selector::new(&query) {
        Ok(r) => r,
        Err(e) => {
            println!("{}", e);
            process::exit(1);
        }
    };
    let result: Vec<&Value> = selector.find(&json).collect();

    serde_json::to_writer(io::stdout(), &result).unwrap();
}
