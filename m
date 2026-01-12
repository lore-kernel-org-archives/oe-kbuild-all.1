Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A87FD145A05
	for <oe-kbuild-all@lists.linux.dev>; Mon, 12 Jan 2026 01:17:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768180664; cv=none; b=ESqz1blw33SgLWlxdaPRcvfL+ErUO8oYTiSvL5QXdS3Bg6A5RY9G4oTRXqIfrQ3he1uGkhG+qomeZArIhtVymW1RpEIWjW/V1gDoMzdeu+excmrr1dMj/cnZfxVYEDCd+5GiZCnOmhtM+ev8elpmHde7b22AQqoKGhOGSzRxvi4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768180664; c=relaxed/simple;
	bh=aOa78xeADb8E4/I+NAcm6BVvFtP61kwOPiB4GWl1rDY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=AVqVhWAAv0joK37V5k8Q5lpG5yCDfd9x0ChQdiyAlbfPqdKHeGLtGbzN/0fZ6ysA5Q1+3qdhnqMF64eGiTrXbY0Jsi7okC8Fv/kJ0CrTU6+8J9Ppj5W0wb1TDlcfzdKXvpFQUnEWd8DTlqNlPsphUTCRNWqDAPZqlq5gnO489dY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dkbE3Otx; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dkbE3Otx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768180663; x=1799716663;
  h=date:from:to:cc:subject:message-id;
  bh=aOa78xeADb8E4/I+NAcm6BVvFtP61kwOPiB4GWl1rDY=;
  b=dkbE3OtxZPdfQ6VwfB/i3KQOi5yyUgD819lZWrzxJ3Kg5cIubwYfLGC0
   VaPU3In/LpTnZcUaj00BZUqbMJwUiFcITuSX4CC8RGUnS1zrutT53D+/c
   ihgZbIOKWpo48/0JrGV6K4EiJiOkWQM+WPxdSfh6wPdc2euwBU/N5HlOS
   atPaiOPKYQBQyY0znVU+etXQowBvT/QJ2FgG2AIhX6WCJc/JOZWjpKCsz
   GON+4m4Z6TukYRdglhUC/lPPjAwNNPOwjCOPnK1XNtKFbJfJlYeF9ZaWT
   6OrzmROruuofuajeq7S+QVTxNizRZiTUuADRXJU6+rqwxmatGJYrM8ndc
   Q==;
X-CSE-ConnectionGUID: fuZXj6oNTIOqvQc69GOYkA==
X-CSE-MsgGUID: u1p87I13QUeoRMhvZJPQ0Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11668"; a="92122499"
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; 
   d="scan'208";a="92122499"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jan 2026 17:17:42 -0800
X-CSE-ConnectionGUID: vRzAk9jnSnW3Ks8wi/Ma1w==
X-CSE-MsgGUID: 1OSqRe4uSmqlQRCudHqGug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; 
   d="scan'208";a="227243250"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 11 Jan 2026 17:17:40 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vf6Ys-00000000Cpg-18TR;
	Mon, 12 Jan 2026 01:17:38 +0000
Date: Mon, 12 Jan 2026 09:17:02 +0800
From: kernel test robot <lkp@intel.com>
To: Gary Guo <gary@garyguo.net>
Cc: oe-kbuild-all@lists.linux.dev, Benno Lossin <lossin@kernel.org>
Subject: [nbdd0121:macros 5/12] error[E0080]: could not evaluate
 static initializer
Message-ID: <202601120913.Mdla6GrL-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/nbdd0121/linux macros
head:   0b7011a368888a9d6d60e48e574bc6a2f55d7f83
commit: 45d1d64ad977fa31b0ffa2f34057c3e0a247bb43 [5/12] rust: macros: use `quote!` for `module!` macro
config: loongarch-randconfig-r073-20260110 (https://download.01.org/0day-ci/archive/20260112/202601120913.Mdla6GrL-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
smatch version: v0.5.0-8985-g2614ff1a
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260112/202601120913.Mdla6GrL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601120913.Mdla6GrL-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error[E0080]: could not evaluate static initializer
   --> rust/doctests_kernel_generated.rs:5992:1
   |
   5992 | / module! {
   5993 | |    type: MyModule,
   5994 | |    name: "module_firmware_test",
   5995 | |    authors: ["Rust for Linux"],
   5996 | |    description: "module_firmware! test module",
   5997 | |    license: "GPL",
   5998 | | }
   | |_^ encountered static that tried to initialize itself with itself
   |
   = note: this error originates in the macro `module` (in Nightly builds, run with -Z macro-backtrace for more info)
--
>> error[E0080]: could not evaluate static initializer
   --> samples/rust/rust_minimal.rs:7:1
   |
   7  | / module! {
   8  | |     type: RustMinimal,
   9  | |     name: "rust_minimal",
   10 | |     authors: ["Rust for Linux Contributors"],
   ...  |
   18 | |     },
   19 | | }
   | |_^ encountered static that tried to initialize itself with itself
   |
   = note: this error originates in the macro `module` (in Nightly builds, run with -Z macro-backtrace for more info)
--
>> error[E0080]: could not evaluate static initializer
   --> samples/rust/rust_misc_device.rs:117:1
   |
   117 | / module! {
   118 | |     type: RustMiscDeviceModule,
   119 | |     name: "rust_misc_device",
   120 | |     authors: ["Lee Jones"],
   121 | |     description: "Rust misc device sample",
   122 | |     license: "GPL",
   123 | | }
   | |_^ encountered static that tried to initialize itself with itself
   |
   = note: this error originates in the macro `module` (in Nightly builds, run with -Z macro-backtrace for more info)
--
>> error[E0080]: could not evaluate static initializer
   --> samples/rust/rust_print_main.rs:8:1
   |
   8  | / module! {
   9  | |     type: RustPrint,
   10 | |     name: "rust_print",
   11 | |     authors: ["Rust for Linux Contributors"],
   12 | |     description: "Rust printing macros sample",
   13 | |     license: "GPL",
   14 | | }
   | |_^ encountered static that tried to initialize itself with itself
   |
   = note: this error originates in the macro `module` (in Nightly builds, run with -Z macro-backtrace for more info)
--
>> error[E0080]: could not evaluate static initializer
   --> samples/rust/rust_debugfs.rs:44:1
   |
   44 | / kernel::module_platform_driver! {
   45 | |     type: RustDebugFs,
   46 | |     name: "rust_debugfs",
   47 | |     authors: ["Matthew Maurer"],
   48 | |     description: "Rust DebugFS usage sample",
   49 | |     license: "GPL",
   50 | | }
   | |_^ encountered static that tried to initialize itself with itself
   |
   = note: this error originates in the macro `$crate::prelude::module` which comes from the expansion of the macro `kernel::module_platform_driver` (in Nightly builds, run with -Z macro-backtrace for more info)
--
>> error[E0080]: could not evaluate static initializer
   --> samples/rust/rust_debugfs_scoped.rs:16:1
   |
   16 | / module! {
   17 | |     type: RustScopedDebugFs,
   18 | |     name: "rust_debugfs_scoped",
   19 | |     authors: ["Matthew Maurer"],
   20 | |     description: "Rust Scoped DebugFS usage sample",
   21 | |     license: "GPL",
   22 | | }
   | |_^ encountered static that tried to initialize itself with itself
   |
   = note: this error originates in the macro `module` (in Nightly builds, run with -Z macro-backtrace for more info)
--
>> error[E0080]: could not evaluate static initializer
   --> samples/rust/rust_dma.rs:115:1
   |
   115 | / kernel::module_pci_driver! {
   116 | |     type: DmaSampleDriver,
   117 | |     name: "rust_dma",
   118 | |     authors: ["Abdiel Janulgue"],
   119 | |     description: "Rust DMA test",
   120 | |     license: "GPL v2",
   121 | | }
   | |_^ encountered static that tried to initialize itself with itself
   |
   = note: this error originates in the macro `$crate::prelude::module` which comes from the expansion of the macro `kernel::module_pci_driver` (in Nightly builds, run with -Z macro-backtrace for more info)
--
>> error[E0080]: could not evaluate static initializer
   --> samples/rust/rust_driver_i2c.rs:68:1
   |
   68 | / kernel::module_i2c_driver! {
   69 | |     type: SampleDriver,
   70 | |     name: "rust_driver_i2c",
   71 | |     authors: ["Igor Korotin"],
   72 | |     description: "Rust I2C driver",
   73 | |     license: "GPL v2",
   74 | | }
   | |_^ encountered static that tried to initialize itself with itself
   |
   = note: this error originates in the macro `$crate::prelude::module` which comes from the expansion of the macro `kernel::module_i2c_driver` (in Nightly builds, run with -Z macro-backtrace for more info)
--
>> error[E0080]: could not evaluate static initializer
   --> samples/rust/rust_i2c_client.rs:141:1
   |
   141 | / kernel::module_platform_driver! {
   142 | |     type: SampleDriver,
   143 | |     name: "rust_device_i2c",
   144 | |     authors: ["Danilo Krummrich", "Igor Korotin"],
   145 | |     description: "Rust I2C client registration",
   146 | |     license: "GPL v2",
   147 | | }
   | |_^ encountered static that tried to initialize itself with itself
   |
   = note: this error originates in the macro `$crate::prelude::module` which comes from the expansion of the macro `kernel::module_platform_driver` (in Nightly builds, run with -Z macro-backtrace for more info)
--
>> error[E0080]: could not evaluate static initializer
   --> samples/rust/rust_driver_pci.rs:113:1
   |
   113 | / kernel::module_pci_driver! {
   114 | |     type: SampleDriver,
   115 | |     name: "rust_driver_pci",
   116 | |     authors: ["Danilo Krummrich"],
   117 | |     description: "Rust PCI driver",
   118 | |     license: "GPL v2",
   119 | | }
   | |_^ encountered static that tried to initialize itself with itself
   |
   = note: this error originates in the macro `$crate::prelude::module` which comes from the expansion of the macro `kernel::module_pci_driver` (in Nightly builds, run with -Z macro-backtrace for more info)
--
>> error[E0080]: could not evaluate static initializer
   --> samples/rust/rust_driver_platform.rs:185:1
   |
   185 | / kernel::module_platform_driver! {
   186 | |     type: SampleDriver,
   187 | |     name: "rust_driver_platform",
   188 | |     authors: ["Danilo Krummrich"],
   189 | |     description: "Rust Platform driver",
   190 | |     license: "GPL v2",
   191 | | }
   | |_^ encountered static that tried to initialize itself with itself
   |
   = note: this error originates in the macro `$crate::prelude::module` which comes from the expansion of the macro `kernel::module_platform_driver` (in Nightly builds, run with -Z macro-backtrace for more info)
..

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
