Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F39742077
	for <oe-kbuild-all@lists.linux.dev>; Sat, 31 Aug 2024 20:00:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725134421; cv=none; b=NFLMZL8hK0mcEEmNn2hql/7r5scbpGhlPZ0Y7uAXL2MuG6eTlK40jm25RHpi5cV8TzB42lXdkCzLaDDghHrTn1Prqt+txm9F+LS9EuXQeY9T93OSisq9DddC0MfShp+GbJckM90r8wHqLJaPIVDiRo4Z8A4q/+EKYRVP5feqBp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725134421; c=relaxed/simple;
	bh=qMgVqxK0bhlYGI8KjeKGwUIfjQJWiD7maxTttCH/2yg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jqZvOA4vz2TOjIkj/LGdR68DBqyhA9GueKC7bstZRTE0efznoz9PDV1bB80gHmaTLyD/GQXbrPOSTd446XrYjwPmJTyqoMILXI8pkTAaQiKohSY9fF9p1MBX1Od8QNwv7La08CTiKAtIea8VPpRiiB0UtX7vJf5Vr8+b+bYACDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=U4/SgXJ3; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U4/SgXJ3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725134419; x=1756670419;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qMgVqxK0bhlYGI8KjeKGwUIfjQJWiD7maxTttCH/2yg=;
  b=U4/SgXJ3UI/GjGFN+Q1eY5wuOqOUjdAkFgTtvuE2/Qh266UWjppeAiny
   FzGoGWRjoK8cI33ZR4ey2ejGavFh2Dx1TMPL4+z4Fceu8TQCyu8gsuDnT
   k/+xKiOEaqHugVoCIhFx/hsFh8xKnLw+8xjZyMeMci0OB+zlV6gf7XhNa
   y5I6/6184leNTnT0Jz40czqHitmTbIZxtI0fbROAeQxOVN/r4l92Iul6c
   JwlFLp5rRezcNYEfIuQBXdDIJXqSobOWB+5DUIWM0xmf1P0/+Za4PVYV9
   VPbSACCub15Ww9FwCNJPJHjlOIUqSMhMvri2KKDZAshu/xnEmKT+pdXUJ
   Q==;
X-CSE-ConnectionGUID: wUaNVGukQXGxOpY3y7VZUw==
X-CSE-MsgGUID: 1Aicg8hoSO+cQX14vqxjfQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11181"; a="27518713"
X-IronPort-AV: E=Sophos;i="6.10,192,1719903600"; 
   d="scan'208";a="27518713"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2024 13:00:19 -0700
X-CSE-ConnectionGUID: 9z9c/JB8Tsq2akhUAp3rMg==
X-CSE-MsgGUID: TgMaaugRT+yM5Vf70BH35Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,192,1719903600"; 
   d="scan'208";a="68867888"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 31 Aug 2024 13:00:17 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1skUGd-00034U-1k;
	Sat, 31 Aug 2024 20:00:15 +0000
Date: Sun, 1 Sep 2024 03:59:23 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android-mainline 5337/5345] error[E0063]: missing
 field `android_kabi_reserved1` in initializer of `kunit_loc`
Message-ID: <202409010307.KUqldG1I-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android-mainline
head:   bc7af8b7bf7354696ec54c6329d62b1d2d3514dd
commit: 5677cab2b2a8016c85c8ca5863517afd7dd7f42e [5337/5345] ANDROID: Add padding to kunit structures exposed on the KMI
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20240901/202409010307.KUqldG1I-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240901/202409010307.KUqldG1I-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409010307.KUqldG1I-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error[E0063]: missing field `android_kabi_reserved1` in initializer of `kunit_loc`
   --> rust/doctests_kernel_generated.rs:47:1
   |
   47 | assert!(v.capacity() >= 20);
   | ^^^^^^^^^^^^^^^^^^^^^^^^^^^ missing `android_kabi_reserved1`
   |
   = note: this error originates in the macro `kernel::kunit_assert` which comes from the expansion of the macro `assert` (in Nightly builds, run with -Z macro-backtrace for more info)
--
>> error[E0063]: missing field `android_kabi_reserved1` in initializer of `kunit_assert`
   --> rust/doctests_kernel_generated.rs:47:1
   |
   47 | assert!(v.capacity() >= 20);
   | ^^^^^^^^^^^^^^^^^^^^^^^^^^^ missing `android_kabi_reserved1`
   |
   = note: this error originates in the macro `kernel::kunit_assert` which comes from the expansion of the macro `assert` (in Nightly builds, run with -Z macro-backtrace for more info)
--
>> error[E0063]: missing field `android_kabi_reserved1` in initializer of `kunit_loc`
   --> rust/doctests_kernel_generated.rs:150:1
   |
   150 | assert_eq!(&v, &[1, 20, 30, 40]);
   | ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ missing `android_kabi_reserved1`
   |
   = note: this error originates in the macro `$crate::kunit_assert` which comes from the expansion of the macro `assert_eq` (in Nightly builds, run with -Z macro-backtrace for more info)
--
>> error[E0063]: missing field `android_kabi_reserved1` in initializer of `kunit_loc`
   --> rust/doctests_kernel_generated.rs:3898:1
   |
   3898 | assert_eq!(e.d.lock().a, 20);
   | ^^^^^^^^^^^^^^^^^^^^^^^^^^^^ missing `android_kabi_reserved1`
   |
   = note: this error originates in the macro `$crate::kunit_assert` which comes from the expansion of the macro `assert_eq` (in Nightly builds, run with -Z macro-backtrace for more info)
--
>> error[E0063]: missing field `android_kabi_reserved1` in initializer of `kunit_assert`
   --> rust/doctests_kernel_generated.rs:3898:1
   |
   3898 | assert_eq!(e.d.lock().a, 20);
   | ^^^^^^^^^^^^^^^^^^^^^^^^^^^^ missing `android_kabi_reserved1`
   |
   = note: this error originates in the macro `$crate::kunit_assert` which comes from the expansion of the macro `assert_eq` (in Nightly builds, run with -Z macro-backtrace for more info)
--
>> error[E0063]: missing field `android_kabi_reserved1` in initializer of `kunit_loc`
   --> rust/doctests_kernel_generated.rs:3899:1
   |
   3899 | assert_eq!(e.d.lock().b, 30);
   | ^^^^^^^^^^^^^^^^^^^^^^^^^^^^ missing `android_kabi_reserved1`
   |
   = note: this error originates in the macro `$crate::kunit_assert` which comes from the expansion of the macro `assert_eq` (in Nightly builds, run with -Z macro-backtrace for more info)
--
>> error[E0063]: missing field `android_kabi_reserved1` in initializer of `kunit_assert`
   --> rust/doctests_kernel_generated.rs:3899:1
   |
   3899 | assert_eq!(e.d.lock().b, 30);
   | ^^^^^^^^^^^^^^^^^^^^^^^^^^^^ missing `android_kabi_reserved1`
   |
   = note: this error originates in the macro `$crate::kunit_assert` which comes from the expansion of the macro `assert_eq` (in Nightly builds, run with -Z macro-backtrace for more info)
--
>> error[E0063]: missing field `android_kabi_reserved1` in initializer of `kunit_loc`
   --> rust/doctests_kernel_generated.rs:3901:101
   |
   3901 | } let test_return_value = _doctest_main__kbuild_src_consumer_rust_kernel_sync_lock_mutex_rs_36_0(); assert!(test_return_value.is_ok()); }
   |                                                                                                     ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ missing `android_kabi_reserved1`
   |
   = note: this error originates in the macro `kernel::kunit_assert` which comes from the expansion of the macro `assert` (in Nightly builds, run with -Z macro-backtrace for more info)
--
>> error[E0063]: missing field `android_kabi_reserved1` in initializer of `kunit_assert`
   --> rust/doctests_kernel_generated.rs:3901:101
   |
   3901 | } let test_return_value = _doctest_main__kbuild_src_consumer_rust_kernel_sync_lock_mutex_rs_36_0(); assert!(test_return_value.is_ok()); }
   |                                                                                                     ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ missing `android_kabi_reserved1`
   |
   = note: this error originates in the macro `kernel::kunit_assert` which comes from the expansion of the macro `assert` (in Nightly builds, run with -Z macro-backtrace for more info)
--
>> error[E0063]: missing field `android_kabi_reserved1` in initializer of `kunit_loc`
   --> rust/doctests_kernel_generated.rs:4032:1
   |
   4032 | assert_eq!(e.c, 10);
   | ^^^^^^^^^^^^^^^^^^^ missing `android_kabi_reserved1`
   |
   = note: this error originates in the macro `$crate::kunit_assert` which comes from the expansion of the macro `assert_eq` (in Nightly builds, run with -Z macro-backtrace for more info)
--
>> error[E0063]: missing field `android_kabi_reserved1` in initializer of `kunit_assert`
   --> rust/doctests_kernel_generated.rs:4032:1
   |
   4032 | assert_eq!(e.c, 10);
   | ^^^^^^^^^^^^^^^^^^^ missing `android_kabi_reserved1`
   |
   = note: this error originates in the macro `$crate::kunit_assert` which comes from the expansion of the macro `assert_eq` (in Nightly builds, run with -Z macro-backtrace for more info)
..

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
