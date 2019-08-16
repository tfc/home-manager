self: super: {
  lorri =
    let src =
      (super.fetchFromGitHub {
        owner = "target";
        repo = "lorri";
        rev = "2a0999bbb80eb777e058cf1ed88a85d609997125";
        sha256 = "1lg8a6fhk0ml43i272hcva1w7zhjlc36qp62swal1bmh63nis01w";
      });
    in super.callPackage src { inherit src; };
}
