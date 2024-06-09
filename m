Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 716FD14265
	for <oe-kbuild-all@lists.linux.dev>; Sun,  9 Jun 2024 21:07:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717967253; cv=none; b=Ff5xVpypf64NA+A6ZrukcdoEf5/b9MPio9LHUvb8CQFJ4cE5h/LHw0I0N6nf09wJIqeiiG+rJMjbFR8fIiN6Rr+Xf1cWlXiQJKGE31I5lz9i19sXK0ulZrnhqqnwqc31cMz3kY7MQ7L2yanjyzolG+wBozRzitmnamdNGsrniKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717967253; c=relaxed/simple;
	bh=Uz9zeymEmflanB2upo6W3oNlXCWdTl9aE9FK2xS0Pa8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CYu5w5Ks0FkdlRCfMzALSUiXypEq7J+Pjn4SWjkQ8QlSYpSuCb6zSjA+YvcAMlnCQjZv9DMjiaJflytBYdbt9K/5/vo/X87tzW7a0/vkRFXn8XL6WA8m+/Fi8C0qMvofCrODSOIixc5Ktcd6n5T3OVzqs2dqTmAfQ/osfCZ/uoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A5e8nKnz; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A5e8nKnz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717967251; x=1749503251;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Uz9zeymEmflanB2upo6W3oNlXCWdTl9aE9FK2xS0Pa8=;
  b=A5e8nKnznCeZPLlSE2IyQCTzxcME4QOJ/BOHzAxORAtq91uxcoQ5yeGb
   wJmYq+cS3Gq2WnCmLi/a/xsKK+YUCKhOvwNAZEowt+CfdUaDkzLDyGVqn
   0fC7xJacP4KvR1kgJB5EGiGPAAponINCWsFuSLqPxZoSmeLkdBxqMxMS2
   uRYfmTat9pb6HdaC+S9Ak1n8+3yBgwMiwkKqARreeSXURTeouae7FvGmd
   a944HwXdiDbB/ajdF4Ao5pO2tAIrmzw0qg0/w8I66oNZ7Krgn1npFkH5/
   A7jwIbTaSzWeR6KAaLlmL5Q/5IiOSLoZfjE1nzbkyGhVUdwzrW5XOzUK4
   g==;
X-CSE-ConnectionGUID: EJsul15QT2S3MrR8tVUf5w==
X-CSE-MsgGUID: wScnNkkzTieY8M5q4hj4/w==
X-IronPort-AV: E=McAfee;i="6600,9927,11098"; a="14801137"
X-IronPort-AV: E=Sophos;i="6.08,226,1712646000"; 
   d="scan'208";a="14801137"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2024 14:07:31 -0700
X-CSE-ConnectionGUID: 50TNhL5CRhCyC7tn0CoAbw==
X-CSE-MsgGUID: Blx/xPeRSoWS5H67XPGgkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,226,1712646000"; 
   d="scan'208";a="43432693"
Received: from lkp-server01.sh.intel.com (HELO 8967fbab76b3) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 09 Jun 2024 14:07:29 -0700
Received: from kbuild by 8967fbab76b3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sGPl9-0001bA-1S;
	Sun, 09 Jun 2024 21:07:27 +0000
Date: Mon, 10 Jun 2024 05:06:51 +0800
From: kernel test robot <lkp@intel.com>
To: FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, dri-devel@lists.freedesktop.org,
	Danilo Krummrich <dakr@redhat.com>,
	Philipp Stanner <pstanner@redhat.com>
Subject: [drm-misc:topic/rust-drm 12/20] error: cannot find macro
 `define_pci_id_table` in this scope
Message-ID: <202406100506.3t1KzbEQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://anongit.freedesktop.org/drm/drm-misc topic/rust-drm
head:   508348922df19178b613531fb6cc7beb624642ae
commit: 40ece0eeffd16953a9a20d50a4a3b35f87016556 [12/20] rust: add basic PCI driver abstractions
config: riscv-randconfig-r121-20240609 (https://download.01.org/0day-ci/archive/20240610/202406100506.3t1KzbEQ-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project d7d2d4f53fc79b4b58e8d8d08151b577c3699d4a)
reproduce: (https://download.01.org/0day-ci/archive/20240610/202406100506.3t1KzbEQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406100506.3t1KzbEQ-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error[E0412]: cannot find type `MyDriver` in this scope
   --> rust/doctests_kernel_generated.rs:2331:23
   |
   2331 |  impl pci::Driver for MyDriver {
   |                       ^^^^^^^^ not found in this scope
--
>> error[E0412]: cannot find type `Arc` in this scope
   --> rust/doctests_kernel_generated.rs:2332:18
   |
   2332 |      type Data = Arc<MyDeviceData>;
   |                  ^^^ not found in this scope
   |
   help: consider importing this struct
   |
   3    + use kernel::sync::Arc;
   |
--
>> error[E0412]: cannot find type `MyDeviceData` in this scope
   --> rust/doctests_kernel_generated.rs:2332:22
   |
   2332 |      type Data = Arc<MyDeviceData>;
   |                      ^^^^^^^^^^^^ not found in this scope
   |
   help: you might be missing a type parameter
   |
   2331 |  impl<MyDeviceData> pci::Driver for MyDriver {
   |      ++++++++++++++
--
>> error[E0412]: cannot find type `Arc` in this scope
   --> rust/doctests_kernel_generated.rs:2345:18
   |
   2345 |      ) -> Result<Arc<Self::Data>> {
   |                  ^^^ not found in this scope
   |
   help: consider importing this struct
   |
   3    + use kernel::sync::Arc;
   |
--
>> error[E0412]: cannot find type `MyDriver` in this scope
   --> rust/doctests_kernel_generated.rs:2355:12
   |
   2355 |      type: MyDriver,
   |            ^^^^^^^^ not found in this scope
--
>> error: missing type for `static` item
   --> rust/doctests_kernel_generated.rs:2354:2
   |
   2354 | /  kernel::module_pci_driver! {
   2355 | |      type: MyDriver,
   2356 | |      name: "Module name",
   2357 | |      author: "Author name",
   2358 | |      description: "Description",
   2359 | |      license: "GPL v2",
   2360 | |  }
   | |__^ help: provide a type for the item: `: <type>`
   |
   = note: this error originates in the macro `$crate::prelude::module` which comes from the expansion of the macro `kernel::module_pci_driver` (in Nightly builds, run with -Z macro-backtrace for more info)
--
>> error: unexpected token: `...`
   --> rust/doctests_kernel_generated.rs:2346:10
   |
   2346 |          ...
   |          ^^^
   |
   help: use `..` for an exclusive range
   |
   2346 |          ..
   |
   help: or `..=` for an inclusive range
   |
   2346 |          ..=
   |
--
>> error[E0586]: inclusive range with no end
   --> rust/doctests_kernel_generated.rs:2346:10
   |
   2346 |          ...
   |          ^^^ help: use `..` instead
   |
   = note: inclusive ranges must be bounded at the end (`..=b` or `a..=b`)
--
>> error: unexpected token: `...`
   --> rust/doctests_kernel_generated.rs:2350:10
   |
   2350 |          ...
   |          ^^^
   |
   help: use `..` for an exclusive range
   |
   2350 |          ..
   |
   help: or `..=` for an inclusive range
   |
   2350 |          ..=
   |
--
>> error[E0586]: inclusive range with no end
   --> rust/doctests_kernel_generated.rs:2350:10
   |
   2350 |          ...
   |          ^^^ help: use `..` instead
   |
   = note: inclusive ranges must be bounded at the end (`..=b` or `a..=b`)
--
>> error: expected one of `:`, `;`, or `=`, found `name_initcall`
   --> rust/doctests_kernel_generated.rs:2354:2
   |
   2354 | /  kernel::module_pci_driver! {
   2355 | |      type: MyDriver,
   2356 | |      name: "Module name",
   2357 | |      author: "Author name",
   2358 | |      description: "Description",
   2359 | |      license: "GPL v2",
   2360 | |  }
   | |__^ expected one of `:`, `;`, or `=`
   |
   = note: this error originates in the macro `$crate::prelude::module` which comes from the expansion of the macro `kernel::module_pci_driver` (in Nightly builds, run with -Z macro-backtrace for more info)
..

sparse warnings: (new ones prefixed by >>)
>> rust/helpers.c:203:5: sparse: sparse: symbol 'rust_helper_pci_resource_len' was not declared. Should it be static?
   rust/helpers.c:62:6: sparse: sparse: context imbalance in 'rust_helper_spin_lock' - wrong count at exit
   rust/helpers.c:68:6: sparse: sparse: context imbalance in 'rust_helper_spin_unlock' - unexpected unlock
   rust/helpers.c:172:6: sparse: sparse: context imbalance in 'rust_helper_rcu_read_lock' - wrong count at exit
   rust/helpers.c:178:6: sparse: sparse: context imbalance in 'rust_helper_rcu_read_unlock' - unexpected unlock

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
