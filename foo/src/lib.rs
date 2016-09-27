pub fn bar() -> u32 {
    42
}

#[cfg(test)]
mod tests {
    #[test]
    fn it_works() {
        assert_eq!(super::bar(), 42);
    }
}
