Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E9ED36E473
	for <oe-kbuild-all@lists.linux.dev>; Tue, 21 Apr 2026 18:41:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776796896; cv=none; b=GCbxHzquPQGCDABuWmaskTJ7VY/xhkq8U5bFABPQ1EQqbK0j7pJ1IO7LMvl+VOZ8+MmE4ng8KjSYiaP+IEBJmPPw04tChdAfuUFeZid2+pfD/SkHpZFFVPaiFWVBwLFzYynIjJegMMNX/GX2VOwZfLRZsB7vXfG34TfSCevATAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776796896; c=relaxed/simple;
	bh=bFRrDauTraoYthtl96NPGv6aXjKvETzWGx9PtHNWz8I=;
	h=Date:From:To:Cc:Subject:Message-ID; b=UFEsmxyLpLORqQWRLrOJnIpGspFI3wCrHvFjBE3bvLEbeWOdWUfEAVd07HqBVT3VqRq6QVDrYOH/GhXed7gesAZ1amsarHfi/pwDR9vtFxgNb4Bfobi54etOMNOzISbnMc/lGtrCGn2Uemi+ZhQn2C/Ke2pSYQqxJp2KnFiP9BE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Fdb5vths; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Fdb5vths"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776796894; x=1808332894;
  h=date:from:to:cc:subject:message-id;
  bh=bFRrDauTraoYthtl96NPGv6aXjKvETzWGx9PtHNWz8I=;
  b=Fdb5vthsm6u4fkFxvUXFZ+2f1XbLdZp6LYf+aHFfgYz6XxBh2eUGAuFd
   qGZ6EVumuOjYlcF2L4TVdpWZDU1ppGFeSpFp+LwxDZ1NStMN6wUTPb/6m
   jj8yVovK0+VFXQqWo/cIM5ITWgr/nYL9l+tgkJU8XE/wJ9JZRbAA6aJVJ
   lRv31C3oBKQYtJxAvhGLnx1Xaqxieaoea4b/aPqLQBTVLNbw2PM7P4qIr
   nvqjfw5A+J43RxZ9RiK7QIxUZNUW3xcMNIXUXiTtlY2kF/3V5hNvffeQm
   HA+RfsRpB3cY4d2wDqk6OTph0zKmkTvhyE8i1AIRyPxlVXmrsq5p4y6Wf
   Q==;
X-CSE-ConnectionGUID: OQQoOndIR4KbVPNbcv+F5A==
X-CSE-MsgGUID: 5vBKCzoGQluDYQCQCQ+4Sg==
X-IronPort-AV: E=McAfee;i="6800,10657,11763"; a="100401374"
X-IronPort-AV: E=Sophos;i="6.23,192,1770624000"; 
   d="scan'208";a="100401374"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2026 11:41:33 -0700
X-CSE-ConnectionGUID: p3eCrN3PRyCIVe6oSLzVcA==
X-CSE-MsgGUID: Aq+YaZU1TtetOmY0F7ENsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,192,1770624000"; 
   d="scan'208";a="233894601"
Received: from lkp-server01.sh.intel.com (HELO 7e48d0ff8e22) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 21 Apr 2026 11:41:31 -0700
Received: from kbuild by 7e48d0ff8e22 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wFG2K-000000003rc-3gW4;
	Tue, 21 Apr 2026 18:41:28 +0000
Date: Wed, 22 Apr 2026 02:40:28 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 3/3] error[E0063]: missing
 field `__kabi_reserved1` in initializer of `kunit_loc`
Message-ID: <202604220230.Gf1mPyNn-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   0c92b4b15aea72b4ccb8cdd20702b9ca21ca05aa
commit: e3e946868864503f88b95a0d8ffe6d61b7df82d6 [3/3] ANDROID: update KABI macros for gendwarfksyms
config: x86_64-randconfig-002-20260421 (https://download.01.org/0day-ci/archive/20260422/202604220230.Gf1mPyNn-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260422/202604220230.Gf1mPyNn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604220230.Gf1mPyNn-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error[E0063]: missing field `__kabi_reserved1` in initializer of `kunit_loc`
   --> rust/doctests_kernel_generated.rs:50:1
   |
   50 | assert_eq!(*x, 24);
   | ^^^^^^^^^^^^^^^^^^ missing `__kabi_reserved1`
   |
   = note: this error originates in the macro `$crate::kunit_assert` which comes from the expansion of the macro `assert_eq` (in Nightly builds, run with -Z macro-backtrace for more info)
--
>> error[E0063]: missing field `__kabi_reserved1` in initializer of `kunit_assert`
   --> rust/doctests_kernel_generated.rs:50:1
   |
   50 | assert_eq!(*x, 24);
   | ^^^^^^^^^^^^^^^^^^ missing `__kabi_reserved1`
   |
   = note: this error originates in the macro `$crate::kunit_assert` which comes from the expansion of the macro `assert_eq` (in Nightly builds, run with -Z macro-backtrace for more info)
--
>> error[E0063]: missing field `__kabi_reserved1` in initializer of `kunit_loc`
   --> rust/doctests_kernel_generated.rs:152:1
   |
   152 | assert_eq!(*value, [1; 32]);
   | ^^^^^^^^^^^^^^^^^^^^^^^^^^^ missing `__kabi_reserved1`
   |
   = note: this error originates in the macro `$crate::kunit_assert` which comes from the expansion of the macro `assert_eq` (in Nightly builds, run with -Z macro-backtrace for more info)
--
>> error[E0063]: missing field `__kabi_reserved1` in initializer of `kunit_loc`
   --> rust/doctests_kernel_generated.rs:1153:97
   |
   1153 | } let test_return_value = _doctest_main__kbuild_src_consumer_rust_kernel_alloc_kvec_rs_798_0(); assert!(test_return_value.is_ok()); }
   |                                                                                                 ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ missing `__kabi_reserved1`
   |
   = note: this error originates in the macro `kernel::kunit_assert` which comes from the expansion of the macro `assert` (in Nightly builds, run with -Z macro-backtrace for more info)
--
>> error[E0063]: missing field `__kabi_reserved1` in initializer of `kunit_assert`
   --> rust/doctests_kernel_generated.rs:1153:97
   |
   1153 | } let test_return_value = _doctest_main__kbuild_src_consumer_rust_kernel_alloc_kvec_rs_798_0(); assert!(test_return_value.is_ok()); }
   |                                                                                                 ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ missing `__kabi_reserved1`
   |
   = note: this error originates in the macro `kernel::kunit_assert` which comes from the expansion of the macro `assert` (in Nightly builds, run with -Z macro-backtrace for more info)
--
>> error[E0063]: missing field `__kabi_reserved1` in initializer of `kunit_loc`
   --> rust/doctests_kernel_generated.rs:1205:1
   |
   1205 | assert_eq!(iter.size_hint().0, size - 1);
   | ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ missing `__kabi_reserved1`
   |
   = note: this error originates in the macro `$crate::kunit_assert` which comes from the expansion of the macro `assert_eq` (in Nightly builds, run with -Z macro-backtrace for more info)
--
>> error[E0063]: missing field `__kabi_reserved1` in initializer of `kunit_assert`
   --> rust/doctests_kernel_generated.rs:1205:1
   |
   1205 | assert_eq!(iter.size_hint().0, size - 1);
   | ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ missing `__kabi_reserved1`
   |
   = note: this error originates in the macro `$crate::kunit_assert` which comes from the expansion of the macro `assert_eq` (in Nightly builds, run with -Z macro-backtrace for more info)
--
>> error[E0063]: missing field `__kabi_reserved1` in initializer of `kunit_loc`
   --> rust/doctests_kernel_generated.rs:1208:1
   |
   1208 | assert_eq!(iter.size_hint().0, size - 2);
   | ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ missing `__kabi_reserved1`
   |
   = note: this error originates in the macro `$crate::kunit_assert` which comes from the expansion of the macro `assert_eq` (in Nightly builds, run with -Z macro-backtrace for more info)
--
>> error[E0063]: missing field `__kabi_reserved1` in initializer of `kunit_assert`
   --> rust/doctests_kernel_generated.rs:1208:1
   |
   1208 | assert_eq!(iter.size_hint().0, size - 2);
   | ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ missing `__kabi_reserved1`
   |
   = note: this error originates in the macro `$crate::kunit_assert` which comes from the expansion of the macro `assert_eq` (in Nightly builds, run with -Z macro-backtrace for more info)
--
>> error[E0063]: missing field `__kabi_reserved1` in initializer of `kunit_loc`
   --> rust/doctests_kernel_generated.rs:1211:1
   |
   1211 | assert_eq!(iter.size_hint().0, size - 3);
   | ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ missing `__kabi_reserved1`
   |
   = note: this error originates in the macro `$crate::kunit_assert` which comes from the expansion of the macro `assert_eq` (in Nightly builds, run with -Z macro-backtrace for more info)
--
>> error[E0063]: missing field `__kabi_reserved1` in initializer of `kunit_assert`
   --> rust/doctests_kernel_generated.rs:1211:1
   |
   1211 | assert_eq!(iter.size_hint().0, size - 3);
   | ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ missing `__kabi_reserved1`
   |
   = note: this error originates in the macro `$crate::kunit_assert` which comes from the expansion of the macro `assert_eq` (in Nightly builds, run with -Z macro-backtrace for more info)
..

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for SND_PCM_IEC958
   Depends on [n]: SOUND [=y] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_SOC_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_COMPRESS_ACCEL
   Depends on [n]: SOUND [=y] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_JACK
   Depends on [n]: SOUND [=y] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_VMASTER
   Depends on [n]: SOUND [=y] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for CAN_RX_OFFLOAD
   Depends on [n]: NETDEVICES [=y] && CAN_DEV [=n] && CAN_NETLINK [=n]
   Selected by [y]:
   - GKI_HIDDEN_MCP251XFD_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_JACK_INPUT_DEV
   Depends on [n]: SOUND [=y] && SND [=n] && SND_JACK [=y]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_INTEL_NHLT
   Depends on [n]: SOUND [=y] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y] && ACPI [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_ELD
   Depends on [n]: SOUND [=y] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
