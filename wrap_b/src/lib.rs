extern crate foo;

pub fn result() -> u32 {
    foo::bar() + 10
}

#[cfg(test)]
mod tests {
    #[test]
    fn it_works() {
        assert_eq!(super::result(), 52);
    }
}
