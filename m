Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC6E5398915
	for <oe-kbuild-all@lists.linux.dev>; Wed, 14 Oct 2026 03:27:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791948438; cv=none; b=tg4miDUrXF3elWN7n947c7zK2bzb1p6+HuX2qFy8/XR0pTTMRkHaXKORwRpJU4lv4EDqAu9O1yicj7kzJfv+QzTL7jjqtz/rjlsPHW11KQ8/c8WYPGhZvyqeNQ4m/9ADgYKk+9v0l08ZCAcBmStwC+Jb+aJF2kYduhSLzqkikx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791948438; c=relaxed/simple;
	bh=q/V43Ju1vMbWgz0TpMcYyr9oU8jPw9uf1WKzib+L44M=;
	h=Date:From:To:Cc:Subject:Message-ID; b=WzB/031nxzRq0xP3BT6IlTIRUwQF1nQT26tZ/8dmcl7kKNeQmqDtno+0dqAsTGlGUwRXH+9wustHmWPrDHiITkP6BQQxRv4h+51smm9kUemnRJcx5ejlp/4Ml7wQcGqiHIg06QfKERhY5TIYN64nCb1aykP2t6mKd3RNFKvmLGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=N9oxHLZg; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="N9oxHLZg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791948437; x=1823484437;
  h=date:from:to:cc:subject:message-id;
  bh=q/V43Ju1vMbWgz0TpMcYyr9oU8jPw9uf1WKzib+L44M=;
  b=N9oxHLZgldk879OUCTouxezgNQbhod145OSTvOotE6agFGHmv9ZgCyAG
   QPWYSMI8AMQLKfpkZjztumFGfXOk0Z/rWaITVZCJ7eS3/zuTGWFyavJ4w
   8Ewbe/63R6PVTL7lKBZxwmQvVFnP+uBQYYnMZQb5SRdyku8ROKelFQ8uP
   +1MKtenXSa/OgeEX74z607b8rF9YXT+st19b1lEsc/DW5+CkLgX7sX2Vz
   XNuL36k1KWsBYpTGgb3EW5peQzG1DqA///KabFYd9cia4gmYjtpY9ei7P
   qZQ4YWyRWKlEs3nPdD3AYEZWK+iuC5bdjPR5du6Vd7aw9WuQEzX5j+2A8
   A==;
X-CSE-ConnectionGUID: YEI58kd/QSmptzdz+O+LHg==
X-CSE-MsgGUID: PRhKFkPeRbWMKN7kErYOlQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11934"; a="571918"
X-IronPort-AV: E=Sophos;i="6.27,156,1787036400"; 
   d="scan'208";a="571918"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2026 20:27:14 -0700
X-CSE-ConnectionGUID: bPITJAV0ROO2RFyvW/Dufg==
X-CSE-MsgGUID: lnDKVfadQ1yNbVbftvc/Ww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,156,1787036400"; 
   d="scan'208";a="1531734"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by fmviesa001.fm.intel.com with ESMTP; 13 Oct 2026 20:27:12 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xGpe1-00000000Aq1-2RIj;
	Wed, 14 Oct 2026 03:27:09 +0000
Date: Wed, 14 Oct 2026 05:26:41 +0200
From: kernel test robot <lkp@intel.com>
To: Leon Romanovsky <leonro@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [leon-rdma:rxe-rust-v1 65/106]
 rust/helpers/net/device.c:36:9: error: invalid application of 'sizeof' to
 bit-field
Message-ID: <202610140512.pBbObSbF-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/leon/linux-rdma.git rxe-rust-v1
head:   bb839a6cc0506a07f63d8931ee7cf500e82f362a
commit: 5909e537a0a6265f69309aac377dd5ab2a3672c4 [65/106] rust: net: Add borrowed network devices and notifier registrations
config: um-randconfig-r2300-20261014 (https://download.01.org/0day-ci/archive/20261014/202610140512.pBbObSbF-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 285b36e5f279398c8a8f6081bee88a5e105ee07f)
rustc: rustc 1.96.0 (ac68faa20 2026-05-25)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261014/202610140512.pBbObSbF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610140512.pBbObSbF-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/sched/rq-offsets.c:5:
   In file included from kernel/sched/sched.h:28:
   In file included from include/linux/cgroup_api.h:1:
   In file included from include/linux/cgroup.h:27:
   In file included from include/linux/kernel_stat.h:8:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:24:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:12:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:1209:55: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   1209 |         return (port > MMIO_UPPER_LIMIT) ? NULL : PCI_IOBASE + port;
   |                                                   ~~~~~~~~~~ ^
   1 warning generated.
   In file included from rust/helpers/helpers.c:48:
   In file included from rust/helpers/blk.c:3:
   In file included from include/linux/blk-mq.h:5:
   In file included from include/linux/blkdev.h:9:
   In file included from include/linux/blk_types.h:10:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:24:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:12:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:1209:55: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   1209 |         return (port > MMIO_UPPER_LIMIT) ? NULL : PCI_IOBASE + port;
   |                                                   ~~~~~~~~~~ ^
   In file included from rust/helpers/helpers.c:80:
>> rust/helpers/net/device.c:36:9: error: invalid application of 'sizeof' to bit-field
   36 |         return READ_ONCE(dev->priv_flags) & IFF_802_1Q_VLAN;
   |                ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
   49 |         compiletime_assert_rwonce_type(x);                              \
   |         ^
   include/asm-generic/rwonce.h:36:21: note: expanded from macro 'compiletime_assert_rwonce_type'
   36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
   |                            ^
   include/linux/compiler_types.h:663:9: note: expanded from macro '__native_word'
   663 |         (sizeof(t) == sizeof(char) || sizeof(t) == sizeof(short) || \
   |                ^
   In file included from rust/helpers/helpers.c:80:
>> rust/helpers/net/device.c:36:9: error: invalid application of 'sizeof' to bit-field
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
   49 |         compiletime_assert_rwonce_type(x);                              \
   |         ^
   include/asm-generic/rwonce.h:36:21: note: expanded from macro 'compiletime_assert_rwonce_type'
   36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
   |                            ^
   include/linux/compiler_types.h:663:38: note: expanded from macro '__native_word'
   663 |         (sizeof(t) == sizeof(char) || sizeof(t) == sizeof(short) || \
   |                                             ^
   In file included from rust/helpers/helpers.c:80:
>> rust/helpers/net/device.c:36:9: error: invalid application of 'sizeof' to bit-field
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
   49 |         compiletime_assert_rwonce_type(x);                              \
   |         ^
   include/asm-generic/rwonce.h:36:21: note: expanded from macro 'compiletime_assert_rwonce_type'
   36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
   |                            ^
   include/linux/compiler_types.h:664:9: note: expanded from macro '__native_word'
   664 |          sizeof(t) == sizeof(int) || sizeof(t) == sizeof(long))
   |                ^
   In file included from rust/helpers/helpers.c:80:
>> rust/helpers/net/device.c:36:9: error: invalid application of 'sizeof' to bit-field
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
   49 |         compiletime_assert_rwonce_type(x);                              \
   |         ^
   include/asm-generic/rwonce.h:36:21: note: expanded from macro 'compiletime_assert_rwonce_type'
   36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
   |                            ^
   include/linux/compiler_types.h:664:37: note: expanded from macro '__native_word'
   664 |          sizeof(t) == sizeof(int) || sizeof(t) == sizeof(long))
   |                                            ^
   In file included from rust/helpers/helpers.c:80:
>> rust/helpers/net/device.c:36:9: error: invalid application of 'sizeof' to bit-field
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
   49 |         compiletime_assert_rwonce_type(x);                              \
   |         ^
   include/asm-generic/rwonce.h:36:47: note: expanded from macro 'compiletime_assert_rwonce_type'
   36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
   |                                                      ^
   In file included from rust/helpers/helpers.c:80:
>> rust/helpers/net/device.c:36:9: error: address of bit-field requested
   36 |         return READ_ONCE(dev->priv_flags) & IFF_802_1Q_VLAN;
   |                ^         ~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:50:2: note: expanded from macro 'READ_ONCE'
   50 |         __READ_ONCE(x);                                                 \
   |         ^           ~
   include/asm-generic/rwonce.h:44:70: note: expanded from macro '__READ_ONCE'
   44 | #define __READ_ONCE(x)  (*(const volatile __unqual_scalar_typeof(x) *)&(x))
   |                                                                       ^ ~
   In file included from rust/helpers/helpers.c:80:
>> rust/helpers/net/device.c:36:9: error: invalid application of 'typeof_unqual' to bit-field
   include/asm-generic/rwonce.h:50:2: note: expanded from macro 'READ_ONCE'
   50 |         __READ_ONCE(x);                                                 \
   |         ^
   include/asm-generic/rwonce.h:44:42: note: expanded from macro '__READ_ONCE'
   44 | #define __READ_ONCE(x)  (*(const volatile __unqual_scalar_typeof(x) *)&(x))
   |                                           ^
   include/linux/compiler_types.h:635:52: note: expanded from macro '__unqual_scalar_typeof'
   635 | #define __unqual_scalar_typeof(x) __typeof_unqual__(x)
   |                                                    ^
   1 warning and 7 errors generated.
   make[3]: *** [rust/Makefile:729: rust/helpers/helpers.o] Error 1 shuffle=2284638678
   clang diag: include/asm-generic/io.h:1209:55: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   clang diag: include/asm-generic/io.h:1209:55: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   include/asm-generic/io.h:1209:55: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
>> include/linux/compiler_types.h:663:9: error: invalid application of 'sizeof' to bit-field
   include/linux/compiler_types.h:663:38: error: invalid application of 'sizeof' to bit-field
   include/linux/compiler_types.h:664:9: error: invalid application of 'sizeof' to bit-field
   include/linux/compiler_types.h:664:37: error: invalid application of 'sizeof' to bit-field
>> include/asm-generic/rwonce.h:36:47: error: invalid application of 'sizeof' to bit-field
>> include/asm-generic/rwonce.h:44:70: error: address of bit-field requested
>> include/linux/compiler_types.h:635:52: error: invalid application of 'typeof_unqual' to bit-field
   clang diag: include/asm-generic/io.h:1209:55: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
>> Unable to generate bindings: clang diagnosed error: include/linux/compiler_types.h:663:9: error: invalid application of 'sizeof' to bit-field
   include/linux/compiler_types.h:663:38: error: invalid application of 'sizeof' to bit-field
   include/linux/compiler_types.h:664:9: error: invalid application of 'sizeof' to bit-field
   include/linux/compiler_types.h:664:37: error: invalid application of 'sizeof' to bit-field
>> include/asm-generic/rwonce.h:36:47: error: invalid application of 'sizeof' to bit-field
>> include/asm-generic/rwonce.h:44:70: error: address of bit-field requested
>> include/linux/compiler_types.h:635:52: error: invalid application of 'typeof_unqual' to bit-field


vim +/sizeof +36 rust/helpers/net/device.c

    32	
    33	__rust_helper bool rust_helper_is_vlan_dev(const struct net_device *dev)
    34	{
    35	#if IS_ENABLED(CONFIG_VLAN_8021Q)
  > 36		return READ_ONCE(dev->priv_flags) & IFF_802_1Q_VLAN;
    37	#else
    38		return false;
    39	#endif
    40	}
    41	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
