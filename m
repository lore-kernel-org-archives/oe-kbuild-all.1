Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79B2A1B87C4
	for <oe-kbuild-all@lists.linux.dev>; Mon, 16 Dec 2024 09:28:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734341330; cv=none; b=kN0dsJqEzLw2I6l3bjQtJjEKCbTHY8CR3AU5knBIP7aXOWHp5NW98bYQWG7A8D5UNlhQYLJ/OvBzvxsIVYctl4QAKdBmyzxc2QKJQcQDJRIgw90xjp9R1/U+9QyD1gmafUrLW/qib8h3fLiVJsYGsO8gnMVsTa6LoK3IcLPLfog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734341330; c=relaxed/simple;
	bh=ez4Kdng64Xi/Bq9nzvnOz6uhB2HCd76esH2bJh+EUDY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iXrr7mUGVKM/PSYDTvpR50dFlN0RSy+aY6WY18CRj8HQRfod7dqeG9P4nc3fYgMXbSB0PyHiJ8m6UlhQeAgU81pQ6XYDZcGl2bvFj256R2lVBcMLYBrNNQHic2UH17sn/xzixMB12safAreWVL+cxnyWZ6jAGtU4i41aet2n/dk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Qxvletds; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Qxvletds"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734341329; x=1765877329;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ez4Kdng64Xi/Bq9nzvnOz6uhB2HCd76esH2bJh+EUDY=;
  b=Qxvletds7CbT60Hych0JRJn1GkeoN6ZqZOxCGjzzs3Gk60GeujiOgtk6
   QkJL8OsHSldTs6VVtCHlaGgOM7xa9MCe6ZOT/6982jwPgScKFzInzJf2q
   sYXhEB1jWhQwlJ2zk2cANd7cw13oOWoGbdJ6d8odBiixN0GbFQeWo/SnU
   DouYY2SrtpCXv0S+ofobr/1fg3ouNcOxZOwOLFnstSHQw8KY2n1hz3N3Q
   537Xyc+79NSu91VBNiYLjwhbtrkloazjKmi/lfug8xE86DUq3Wc+giQeU
   k74/QKCdCi9iuEkrctbr77RkxK3I8867orTwJPt7mTHi/fkihHByTunuk
   Q==;
X-CSE-ConnectionGUID: lL4ywJgrTE+3kytxLJvnGg==
X-CSE-MsgGUID: FTr4Ez+4R/yo91xy32mBYg==
X-IronPort-AV: E=McAfee;i="6700,10204,11287"; a="34040189"
X-IronPort-AV: E=Sophos;i="6.12,238,1728975600"; 
   d="scan'208";a="34040189"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2024 01:28:48 -0800
X-CSE-ConnectionGUID: 3whM7vdOS9apvL1oKpEhMQ==
X-CSE-MsgGUID: tTngjY4NSCqS5eG4woYAHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="97946884"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 16 Dec 2024 01:28:47 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tN7PA-000E7w-1g;
	Mon, 16 Dec 2024 09:28:44 +0000
Date: Mon, 16 Dec 2024 17:28:00 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-desktop 5337/7861] error[E0063]:
 missing field `android_kabi_reserved1` in initializer of `kunit_loc`
Message-ID: <202412161713.gTtDisFy-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Sid,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android16-6.12-desktop
head:   38fd3e02b4a1c15d7ae2d81574d3ff49cf6317ef
commit: 5677cab2b2a8016c85c8ca5863517afd7dd7f42e [5337/7861] ANDROID: Add padding to kunit structures exposed on the KMI
config: arm64-randconfig-004-20241216 (https://download.01.org/0day-ci/archive/20241216/202412161713.gTtDisFy-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241216/202412161713.gTtDisFy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412161713.gTtDisFy-lkp@intel.com/

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
   --> rust/doctests_kernel_generated.rs:3885:1
   |
   3885 | assert_eq!(e.d.lock().a, 20);
   | ^^^^^^^^^^^^^^^^^^^^^^^^^^^^ missing `android_kabi_reserved1`
   |
   = note: this error originates in the macro `$crate::kunit_assert` which comes from the expansion of the macro `assert_eq` (in Nightly builds, run with -Z macro-backtrace for more info)
--
>> error[E0063]: missing field `android_kabi_reserved1` in initializer of `kunit_assert`
   --> rust/doctests_kernel_generated.rs:3885:1
   |
   3885 | assert_eq!(e.d.lock().a, 20);
   | ^^^^^^^^^^^^^^^^^^^^^^^^^^^^ missing `android_kabi_reserved1`
   |
   = note: this error originates in the macro `$crate::kunit_assert` which comes from the expansion of the macro `assert_eq` (in Nightly builds, run with -Z macro-backtrace for more info)
--
>> error[E0063]: missing field `android_kabi_reserved1` in initializer of `kunit_loc`
   --> rust/doctests_kernel_generated.rs:3886:1
   |
   3886 | assert_eq!(e.d.lock().b, 30);
   | ^^^^^^^^^^^^^^^^^^^^^^^^^^^^ missing `android_kabi_reserved1`
   |
   = note: this error originates in the macro `$crate::kunit_assert` which comes from the expansion of the macro `assert_eq` (in Nightly builds, run with -Z macro-backtrace for more info)
--
>> error[E0063]: missing field `android_kabi_reserved1` in initializer of `kunit_assert`
   --> rust/doctests_kernel_generated.rs:3886:1
   |
   3886 | assert_eq!(e.d.lock().b, 30);
   | ^^^^^^^^^^^^^^^^^^^^^^^^^^^^ missing `android_kabi_reserved1`
   |
   = note: this error originates in the macro `$crate::kunit_assert` which comes from the expansion of the macro `assert_eq` (in Nightly builds, run with -Z macro-backtrace for more info)
--
>> error[E0063]: missing field `android_kabi_reserved1` in initializer of `kunit_loc`
   --> rust/doctests_kernel_generated.rs:3888:101
   |
   3888 | } let test_return_value = _doctest_main__kbuild_src_consumer_rust_kernel_sync_lock_mutex_rs_36_0(); assert!(test_return_value.is_ok()); }
   |                                                                                                     ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ missing `android_kabi_reserved1`
   |
   = note: this error originates in the macro `kernel::kunit_assert` which comes from the expansion of the macro `assert` (in Nightly builds, run with -Z macro-backtrace for more info)
--
>> error[E0063]: missing field `android_kabi_reserved1` in initializer of `kunit_assert`
   --> rust/doctests_kernel_generated.rs:3888:101
   |
   3888 | } let test_return_value = _doctest_main__kbuild_src_consumer_rust_kernel_sync_lock_mutex_rs_36_0(); assert!(test_return_value.is_ok()); }
   |                                                                                                     ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ missing `android_kabi_reserved1`
   |
   = note: this error originates in the macro `kernel::kunit_assert` which comes from the expansion of the macro `assert` (in Nightly builds, run with -Z macro-backtrace for more info)
--
>> error[E0063]: missing field `android_kabi_reserved1` in initializer of `kunit_loc`
   --> rust/doctests_kernel_generated.rs:4019:1
   |
   4019 | assert_eq!(e.c, 10);
   | ^^^^^^^^^^^^^^^^^^^ missing `android_kabi_reserved1`
   |
   = note: this error originates in the macro `$crate::kunit_assert` which comes from the expansion of the macro `assert_eq` (in Nightly builds, run with -Z macro-backtrace for more info)
--
>> error[E0063]: missing field `android_kabi_reserved1` in initializer of `kunit_assert`
   --> rust/doctests_kernel_generated.rs:4019:1
   |
   4019 | assert_eq!(e.c, 10);
   | ^^^^^^^^^^^^^^^^^^^ missing `android_kabi_reserved1`
   |
   = note: this error originates in the macro `$crate::kunit_assert` which comes from the expansion of the macro `assert_eq` (in Nightly builds, run with -Z macro-backtrace for more info)
..

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
