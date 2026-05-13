Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4801D3E869A
	for <oe-kbuild-all@lists.linux.dev>; Wed, 13 May 2026 09:40:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778665217; cv=none; b=q+pCY12Oq07unFMewh3FkpvjXdnMD9ELEtcvRTwcAKnD4ovre6rE/SwVDFPSOqbUdTJ4/AN8q9g3AccpxWTPPikgLvW7U+a/A3pFcB5KUMN5o2vwEq3IvI7EfFlQ+W1ik/T7FSUYGmN3grAk/B+3uILg40cuG8U2j1yVa8zkfqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778665217; c=relaxed/simple;
	bh=1iFCWrwy5Y8XnWMfwqokMaG9o9/kv8QI5VhWYyO8VT8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=JNWn2Zo0ZGwzdVcOrWLHZ0Pfee4KohK609fUgwzABGqgUNx0/3480EhqfdRtHWKW5eXiHNNMFY9JAPZgF58RrLnNacQWhzcmYGkr6ph+cf0TrBE7RoG2Wvxm26O99AYUq1JhmjrFkoMV3ZcBuy/zEWCBE8HZ58bempGvP9OR7eI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FAsQxLaj; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FAsQxLaj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778665215; x=1810201215;
  h=date:from:to:cc:subject:message-id;
  bh=1iFCWrwy5Y8XnWMfwqokMaG9o9/kv8QI5VhWYyO8VT8=;
  b=FAsQxLajpK4CGB/jRFJKjNmo50zblttidb73bcB3e2KtZXTrfg8fIFqU
   rb14Q3ILTp7P1eOnMLjOGNGSiV3DfrCGcoZ+gWGwKvB1wO5Kd2a4tilja
   CNnFrI9pKVpnfURGSvF09i5/92jggTSBwWRwUdtcCmhRvSMsFUe7ZhCrm
   0hRS6Wmff47AgOFqL3icSrqmpHeg2JNg6DqUHfSlke5n0pP20RLQgq04R
   CdzOk4fcp91zuFeQvT88anNhA5u0UN419ErznIhhRyOSRV7js+awnr3ub
   CAcaDvs5mCfX1asdpfwKSvQ7BEnmkctD9DF6OdNRe1c9Pi0rlr2V7hzLD
   g==;
X-CSE-ConnectionGUID: E8XtgY8uS0WapYu0oW6n7g==
X-CSE-MsgGUID: 4GcJzDTuQPePTrAH5M17lg==
X-IronPort-AV: E=McAfee;i="6800,10657,11784"; a="97155794"
X-IronPort-AV: E=Sophos;i="6.23,232,1770624000"; 
   d="scan'208";a="97155794"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2026 02:40:12 -0700
X-CSE-ConnectionGUID: +qTpw/NrSyGDYLxwlHHaAw==
X-CSE-MsgGUID: As7ZEZG3TZKHS2wi1A9shQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,232,1770624000"; 
   d="scan'208";a="242991166"
Received: from lkp-server01.sh.intel.com (HELO dca79079c3eb) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 13 May 2026 02:40:10 -0700
Received: from kbuild by dca79079c3eb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wN64V-000000003qj-2BIN;
	Wed, 13 May 2026 09:40:07 +0000
Date: Wed, 13 May 2026 17:39:56 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-desktop 94/94]
 include/linux/sched.h:1645:2: error: static assertion failed due to
 requirement 'sizeof(struct task_struct::(unnamed at
 include/linux/sched.h:1645:2)) <= sizeof(struct task_struct::(unnamed at
 include/linux/sched.h:1645:2))': include/linux/sched.h:1645: c...
Message-ID: <202605131702.WFQLVq5q-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android16-6.12-desktop
head:   20a1d6f1c48a1cdea99c1ffff1d7812dbbf3e0d1
commit: ae5c7798539542105ed20abef9f78d8a978f2d4e [94/94] ANDROID: arm64: tlb: Move the SME DVMsync cpumask into task_struct
config: arm64-randconfig-004-20260513 (https://download.01.org/0day-ci/archive/20260513/202605131702.WFQLVq5q-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260513/202605131702.WFQLVq5q-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605131702.WFQLVq5q-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/arm64/kernel/asm-offsets.c:11:
   In file included from include/linux/arm_sdei.h:8:
   In file included from include/acpi/ghes.h:5:
   In file included from include/acpi/apei.h:9:
   In file included from include/linux/acpi.h:13:
   In file included from include/linux/resource_ext.h:11:
   In file included from include/linux/slab.h:16:
   In file included from include/linux/gfp.h:7:
   In file included from include/linux/mmzone.h:23:
   In file included from include/linux/mm_types.h:19:
   In file included from include/linux/workqueue.h:9:
   In file included from include/linux/timer.h:6:
   In file included from include/linux/ktime.h:25:
   In file included from include/linux/jiffies.h:10:
   In file included from include/linux/time.h:60:
   In file included from include/linux/time32.h:13:
   In file included from include/linux/timex.h:67:
   In file included from arch/arm64/include/asm/timex.h:8:
   In file included from arch/arm64/include/asm/arch_timer.h:18:
   In file included from include/linux/percpu.h:12:
>> include/linux/sched.h:1645:2: error: static assertion failed due to requirement 'sizeof(struct task_struct::(unnamed at include/linux/sched.h:1645:2)) <= sizeof(struct task_struct::(unnamed at include/linux/sched.h:1645:2))': include/linux/sched.h:1645: cpumask_var_t cpumask_sme_dvmsync is larger than u64 __kabi_reserved2
    1645 |         ANDROID_KABI_USE(2, cpumask_var_t cpumask_sme_dvmsync);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/android_kabi.h:170:2: note: expanded from macro 'ANDROID_KABI_USE'
     170 |         _ANDROID_KABI_REPLACE(ANDROID_KABI_RESERVE(number), _new)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/android_kabi.h:79:3: note: expanded from macro '_ANDROID_KABI_REPLACE'
      79 |                 _ANDROID_KABI_NORMAL_SIZE_ALIGN(_orig, _new); \
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/android_kabi.h:61:4: note: expanded from macro '_ANDROID_KABI_NORMAL_SIZE_ALIGN'
      61 |                         sizeof(struct { _new; }) <=                     \
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      62 |                                 sizeof(struct { _orig; }),              \
         |                                 ~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/sched.h:1645:2: note: expression evaluates to '32 <= 8'
    1645 |         ANDROID_KABI_USE(2, cpumask_var_t cpumask_sme_dvmsync);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/android_kabi.h:170:2: note: expanded from macro 'ANDROID_KABI_USE'
     170 |         _ANDROID_KABI_REPLACE(ANDROID_KABI_RESERVE(number), _new)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/android_kabi.h:79:3: note: expanded from macro '_ANDROID_KABI_REPLACE'
      79 |                 _ANDROID_KABI_NORMAL_SIZE_ALIGN(_orig, _new); \
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/android_kabi.h:61:29: note: expanded from macro '_ANDROID_KABI_NORMAL_SIZE_ALIGN'
      61 |                         sizeof(struct { _new; }) <=                     \
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~
      62 |                                 sizeof(struct { _orig; }),              \
         |                                 ~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from arch/arm64/kernel/asm-offsets.c:11:
   In file included from include/linux/arm_sdei.h:8:
   In file included from include/acpi/ghes.h:5:
   In file included from include/acpi/apei.h:9:
   In file included from include/linux/acpi.h:14:
   In file included from include/linux/device.h:32:
   In file included from include/linux/device/driver.h:21:
   In file included from include/linux/module.h:19:
   In file included from include/linux/elf.h:6:
   In file included from arch/arm64/include/asm/elf.h:141:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:98:11: warning: array index 3 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
      98 |                 return (set->sig[3] | set->sig[2] |
         |                         ^        ~
   include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
      62 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/arm64/kernel/asm-offsets.c:11:
   In file included from include/linux/arm_sdei.h:8:
   In file included from include/acpi/ghes.h:5:
   In file included from include/acpi/apei.h:9:
   In file included from include/linux/acpi.h:14:
   In file included from include/linux/device.h:32:
   In file included from include/linux/device/driver.h:21:
   In file included from include/linux/module.h:19:
   In file included from include/linux/elf.h:6:
   In file included from arch/arm64/include/asm/elf.h:141:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:98:25: warning: array index 2 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
      98 |                 return (set->sig[3] | set->sig[2] |
         |                                       ^        ~
   include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
      62 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/arm64/kernel/asm-offsets.c:11:
   In file included from include/linux/arm_sdei.h:8:
   In file included from include/acpi/ghes.h:5:
   In file included from include/acpi/apei.h:9:
   In file included from include/linux/acpi.h:14:
   In file included from include/linux/device.h:32:
   In file included from include/linux/device/driver.h:21:
   In file included from include/linux/module.h:19:
   In file included from include/linux/elf.h:6:
   In file included from arch/arm64/include/asm/elf.h:141:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:99:4: warning: array index 1 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
      99 |                         set->sig[1] | set->sig[0]) == 0;
         |                         ^        ~
   include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
      62 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/arm64/kernel/asm-offsets.c:11:
   In file included from include/linux/arm_sdei.h:8:
   In file included from include/acpi/ghes.h:5:
   In file included from include/acpi/apei.h:9:
   In file included from include/linux/acpi.h:14:
   In file included from include/linux/device.h:32:
   In file included from include/linux/device/driver.h:21:
   In file included from include/linux/module.h:19:
   In file included from include/linux/elf.h:6:
   In file included from arch/arm64/include/asm/elf.h:141:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for USB_PHY
   Depends on [n]: USB_SUPPORT [=n]
   Selected by [y]:
   - GKI_HIDDEN_USB_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_IEC958
   Depends on [n]: SOUND [=n] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_SOC_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_COMPRESS_ACCEL
   Depends on [n]: SOUND [=n] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_JACK
   Depends on [n]: SOUND [=n] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_VMASTER
   Depends on [n]: SOUND [=n] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_JACK_INPUT_DEV
   Depends on [n]: SOUND [=n] && SND [=n] && SND_JACK [=y]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_ELD
   Depends on [n]: SOUND [=n] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]


vim +1645 include/linux/sched.h

  1628	
  1629	#ifdef CONFIG_ARCH_HAS_PARANOID_L1D_FLUSH
  1630		/*
  1631		 * If L1D flush is supported on mm context switch
  1632		 * then we use this callback head to queue kill work
  1633		 * to kill tasks that are not running on SMT disabled
  1634		 * cores
  1635		 */
  1636		struct callback_head		l1d_flush_kill;
  1637	#endif
  1638		ANDROID_KABI_USE(1, struct task_dma_buf_info *dmabuf_info);
  1639	#ifdef CONFIG_ARM64_ERRATUM_4193714
  1640		/*
  1641		 * Track CPUs that need SME DVMSync on completion of this batch.
  1642		 * Otherwise, the arm64 HW can do tlb shootdown, so we don't need to
  1643		 * record cpumask for sending IPI
  1644		 */
> 1645		ANDROID_KABI_USE(2, cpumask_var_t cpumask_sme_dvmsync);
  1646	#else
  1647		ANDROID_KABI_RESERVE(2);
  1648	#endif
  1649		ANDROID_KABI_RESERVE(3);
  1650		ANDROID_KABI_RESERVE(4);
  1651		ANDROID_KABI_RESERVE(5);
  1652		ANDROID_KABI_RESERVE(6);
  1653		ANDROID_KABI_RESERVE(7);
  1654		ANDROID_KABI_RESERVE(8);
  1655	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
