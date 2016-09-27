extern crate wrap_a;
extern crate wrap_b;

pub fn result() -> u32 {
    wrap_a::result() + wrap_b::result()
}

#[cfg(test)]
mod tests {
    #[test]
    fn it_works() {
        assert_eq!(super::result(), 84);
    }
}
