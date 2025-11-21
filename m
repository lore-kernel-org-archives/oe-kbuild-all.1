Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DDBE2BE64A
	for <oe-kbuild-all@lists.linux.dev>; Fri, 21 Nov 2025 21:45:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763761551; cv=none; b=fU3GNvjE65GrPguPQMMDJT+uHS9XLiepzVVSStsMnFTtevGMoxcWoWzSrs4+4I3RdoimDOYRJrprGSKcY/Zv1QlmwTBCuT5N1IiLq0tM8Bw1HArSy8ZMLiaonZABglZ6bNzRsJmID1qYwmspNGMuFCIJlE4RfxxcUyutKrxdL6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763761551; c=relaxed/simple;
	bh=iVkR+2ngZlcSF7BTUjn4tFwa5ZT6gfUwd4SF9zkOUrU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=eOm/A4yDvtM3Si2m2GcjjR+UbDD0uTw4u5ysZ5mI94ab+Fj6Y5uQyTikcRNj6DyeHwuY99mmmmbaolOlXVzBXpOpv2cZen3mtZwFUdg1osHSxt2T7pxyJU+hLtLfOXNwjs2jV0iXwPN16a/iugNx6hNOL/7QUKX2wlZfJ0vuxkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=M0GF6TIe; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M0GF6TIe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763761549; x=1795297549;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=iVkR+2ngZlcSF7BTUjn4tFwa5ZT6gfUwd4SF9zkOUrU=;
  b=M0GF6TIeVegVCEYMpEWNMEh27ILeqR6kRYh14CUCJOqetsYo7kk0PJWU
   xkTU0HfGVTMu4GJuv5/q1jX684vw1k+NRAIVmiUv8D0gZc+3rgxEtzXN1
   RQxqvMolgIw4haLZfWZhY7YSgpCtmO25bmPDTd5PJLZudQ7Q44T5YSPPN
   wGGAtI/EhR+j4oXdtuETnliVKNPJ1C3B1B4mPl6fvk8O2w4gVVffyr5KX
   4GEayZyMd9Gj4iBmAeOtTNl1UitCmRifX3brz+EbtrbfNm7EChDtIq/EP
   G4owOwUZfQm3bR+jSxb5lY8HqraR35coYdpR+OBqqdIO5XdnS7ueQgzx2
   w==;
X-CSE-ConnectionGUID: 1Ey06btWTtiWs2OawFkoAA==
X-CSE-MsgGUID: 2vj0cscfQsSnjaBI/adMUQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11620"; a="76473893"
X-IronPort-AV: E=Sophos;i="6.20,216,1758610800"; 
   d="scan'208";a="76473893"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2025 13:45:47 -0800
X-CSE-ConnectionGUID: fr6uHteyTyu0fuWNOFxQtA==
X-CSE-MsgGUID: ZCBUthDhR/yEot8KpKoRUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,216,1758610800"; 
   d="scan'208";a="196082222"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 21 Nov 2025 13:45:46 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vMYwq-0006uV-0C;
	Fri, 21 Nov 2025 21:45:44 +0000
Date: Sat, 22 Nov 2025 05:44:45 +0800
From: kernel test robot <lkp@intel.com>
To: elver@google.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [melver:for-test 31/36] lib/rhashtable.c:1039:9: sparse: sparse:
 incorrect type in argument 1 (different base types)
Message-ID: <202511220541.TuAZrPot-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/melver/linux.git for-test
head:   10da1cb636df659be0b839e78c48037968cc5cc6
commit: e550511666b00afe6292da4b3007baecf2c4dc27 [31/36] rhashtable: Enable context analysis
config: arm-randconfig-r122-20251121 (https://download.01.org/0day-ci/archive/20251122/202511220541.TuAZrPot-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9e9fe08b16ea2c4d9867fb4974edf2a3776d6ece)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251122/202511220541.TuAZrPot-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511220541.TuAZrPot-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   include/linux/rwsem.h:48:1: sparse:  the previous one is here
   lib/rhashtable.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:13:1: sparse: sparse: multiple definitions for function '__release_ctx_guard'
   lib/rhashtable.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/rwsem.h:48:1: sparse:  the previous one is here
   lib/rhashtable.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:13:1: sparse: sparse: multiple definitions for function '__release_shared_ctx_guard'
   lib/rhashtable.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/rwsem.h:48:1: sparse:  the previous one is here
   lib/rhashtable.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:13:1: sparse: sparse: multiple definitions for function '__assume_ctx_guard'
   lib/rhashtable.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/rwsem.h:48:1: sparse:  the previous one is here
   lib/rhashtable.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:13:1: sparse: sparse: multiple definitions for function '__assume_shared_ctx_guard'
   lib/rhashtable.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/rwsem.h:48:1: sparse:  the previous one is here
   lib/rhashtable.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:22:1: sparse: sparse: multiple definitions for function '__acquire_ctx_guard'
   include/linux/local_lock_internal.h:13:1: sparse:  the previous one is here
   include/linux/local_lock_internal.h:22:1: sparse: sparse: multiple definitions for function '__acquire_shared_ctx_guard'
   include/linux/local_lock_internal.h:13:1: sparse:  the previous one is here
   include/linux/local_lock_internal.h:22:1: sparse: sparse: multiple definitions for function '__try_acquire_ctx_guard'
   include/linux/local_lock_internal.h:13:1: sparse:  the previous one is here
   include/linux/local_lock_internal.h:22:1: sparse: sparse: multiple definitions for function '__try_acquire_shared_ctx_guard'
   include/linux/local_lock_internal.h:13:1: sparse:  the previous one is here
   include/linux/local_lock_internal.h:22:1: sparse: sparse: multiple definitions for function '__release_ctx_guard'
   include/linux/local_lock_internal.h:13:1: sparse:  the previous one is here
   include/linux/local_lock_internal.h:22:1: sparse: sparse: multiple definitions for function '__release_shared_ctx_guard'
   include/linux/local_lock_internal.h:13:1: sparse:  the previous one is here
   include/linux/local_lock_internal.h:22:1: sparse: sparse: multiple definitions for function '__assume_ctx_guard'
   include/linux/local_lock_internal.h:13:1: sparse:  the previous one is here
   include/linux/local_lock_internal.h:22:1: sparse: sparse: multiple definitions for function '__assume_shared_ctx_guard'
   include/linux/local_lock_internal.h:13:1: sparse:  the previous one is here
   include/linux/local_lock_internal.h:332:40: sparse: sparse: multiple definitions for function '__this_cpu_local_lock'
   include/linux/local_lock_internal.h:326:37: sparse:  the previous one is here
   lib/rhashtable.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse: sparse: multiple definitions for function '__acquire_ctx_guard'
   lib/rhashtable.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:22:1: sparse:  the previous one is here
   lib/rhashtable.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse: sparse: multiple definitions for function '__acquire_shared_ctx_guard'
   lib/rhashtable.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:22:1: sparse:  the previous one is here
   lib/rhashtable.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse: sparse: multiple definitions for function '__try_acquire_ctx_guard'
   lib/rhashtable.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:22:1: sparse:  the previous one is here
   lib/rhashtable.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse: sparse: multiple definitions for function '__try_acquire_shared_ctx_guard'
   lib/rhashtable.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:22:1: sparse:  the previous one is here
   lib/rhashtable.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse: sparse: multiple definitions for function '__release_ctx_guard'
   lib/rhashtable.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:22:1: sparse:  the previous one is here
   lib/rhashtable.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse: sparse: multiple definitions for function '__release_shared_ctx_guard'
   lib/rhashtable.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:22:1: sparse:  the previous one is here
   lib/rhashtable.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse: sparse: multiple definitions for function '__assume_ctx_guard'
   lib/rhashtable.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:22:1: sparse:  the previous one is here
   lib/rhashtable.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse: sparse: multiple definitions for function '__assume_shared_ctx_guard'
   lib/rhashtable.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:22:1: sparse:  the previous one is here
   lib/rhashtable.c: note: in included file (through include/linux/mm.h):
   include/linux/bit_spinlock.h:19:1: sparse: sparse: multiple definitions for function '__acquire_ctx_guard'
   lib/rhashtable.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse:  the previous one is here
   lib/rhashtable.c: note: in included file (through include/linux/mm.h):
   include/linux/bit_spinlock.h:19:1: sparse: sparse: multiple definitions for function '__acquire_shared_ctx_guard'
   lib/rhashtable.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse:  the previous one is here
   lib/rhashtable.c: note: in included file (through include/linux/mm.h):
   include/linux/bit_spinlock.h:19:1: sparse: sparse: multiple definitions for function '__try_acquire_ctx_guard'
   lib/rhashtable.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse:  the previous one is here
   lib/rhashtable.c: note: in included file (through include/linux/mm.h):
   include/linux/bit_spinlock.h:19:1: sparse: sparse: multiple definitions for function '__try_acquire_shared_ctx_guard'
   lib/rhashtable.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse:  the previous one is here
   lib/rhashtable.c: note: in included file (through include/linux/mm.h):
   include/linux/bit_spinlock.h:19:1: sparse: sparse: multiple definitions for function '__release_ctx_guard'
   lib/rhashtable.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse:  the previous one is here
   lib/rhashtable.c: note: in included file (through include/linux/mm.h):
   include/linux/bit_spinlock.h:19:1: sparse: sparse: multiple definitions for function '__release_shared_ctx_guard'
   lib/rhashtable.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse:  the previous one is here
   lib/rhashtable.c: note: in included file (through include/linux/mm.h):
   include/linux/bit_spinlock.h:19:1: sparse: sparse: multiple definitions for function '__assume_ctx_guard'
   lib/rhashtable.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse:  the previous one is here
   lib/rhashtable.c: note: in included file (through include/linux/mm.h):
   include/linux/bit_spinlock.h:19:1: sparse: sparse: multiple definitions for function '__assume_shared_ctx_guard'
   lib/rhashtable.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse:  the previous one is here
>> lib/rhashtable.c:1039:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct __context_bitlock const *var @@     got struct mutex * @@
   lib/rhashtable.c:1039:9: sparse:     expected struct __context_bitlock const *var
   lib/rhashtable.c:1039:9: sparse:     got struct mutex *
>> lib/rhashtable.c:1040:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct __context_bitlock const *var @@     got struct spinlock * @@
   lib/rhashtable.c:1040:9: sparse:     expected struct __context_bitlock const *var
   lib/rhashtable.c:1040:9: sparse:     got struct spinlock *
   lib/rhashtable.c: note: in included file (through include/linux/sched.h):
>> include/linux/spinlock.h:344:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct mutex const *var @@     got struct raw_spinlock * @@
   include/linux/spinlock.h:344:9: sparse:     expected struct mutex const *var
   include/linux/spinlock.h:344:9: sparse:     got struct raw_spinlock *
   include/linux/spinlock.h:392:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct mutex const *var @@     got struct raw_spinlock * @@
   include/linux/spinlock.h:392:9: sparse:     expected struct mutex const *var
   include/linux/spinlock.h:392:9: sparse:     got struct raw_spinlock *
>> include/linux/spinlock.h:344:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct mutex const *var @@     got struct raw_spinlock * @@
   include/linux/spinlock.h:344:9: sparse:     expected struct mutex const *var
   include/linux/spinlock.h:344:9: sparse:     got struct raw_spinlock *
   include/linux/spinlock.h:392:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct mutex const *var @@     got struct raw_spinlock * @@
   include/linux/spinlock.h:392:9: sparse:     expected struct mutex const *var
   include/linux/spinlock.h:392:9: sparse:     got struct raw_spinlock *
>> include/linux/spinlock.h:344:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct mutex const *var @@     got struct raw_spinlock * @@
   include/linux/spinlock.h:344:9: sparse:     expected struct mutex const *var
   include/linux/spinlock.h:344:9: sparse:     got struct raw_spinlock *
   include/linux/spinlock.h:392:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct mutex const *var @@     got struct raw_spinlock * @@
   include/linux/spinlock.h:392:9: sparse:     expected struct mutex const *var
   include/linux/spinlock.h:392:9: sparse:     got struct raw_spinlock *
>> include/linux/spinlock.h:344:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct mutex const *var @@     got struct raw_spinlock * @@
   include/linux/spinlock.h:344:9: sparse:     expected struct mutex const *var
   include/linux/spinlock.h:344:9: sparse:     got struct raw_spinlock *
   include/linux/spinlock.h:392:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct mutex const *var @@     got struct raw_spinlock * @@
   include/linux/spinlock.h:392:9: sparse:     expected struct mutex const *var
   include/linux/spinlock.h:392:9: sparse:     got struct raw_spinlock *
>> include/linux/spinlock.h:344:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct mutex const *var @@     got struct raw_spinlock * @@
   include/linux/spinlock.h:344:9: sparse:     expected struct mutex const *var
   include/linux/spinlock.h:344:9: sparse:     got struct raw_spinlock *
   include/linux/spinlock.h:392:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct mutex const *var @@     got struct raw_spinlock * @@
   include/linux/spinlock.h:392:9: sparse:     expected struct mutex const *var
   include/linux/spinlock.h:392:9: sparse:     got struct raw_spinlock *

vim +1039 lib/rhashtable.c

31ccde2dacea83 Herbert Xu       2015-03-24   985  
7e1e77636e3607 Thomas Graf      2014-08-02   986  /**
7e1e77636e3607 Thomas Graf      2014-08-02   987   * rhashtable_init - initialize a new hash table
7e1e77636e3607 Thomas Graf      2014-08-02   988   * @ht:		hash table to be initialized
7e1e77636e3607 Thomas Graf      2014-08-02   989   * @params:	configuration parameters
7e1e77636e3607 Thomas Graf      2014-08-02   990   *
7e1e77636e3607 Thomas Graf      2014-08-02   991   * Initializes a new hash table based on the provided configuration
7e1e77636e3607 Thomas Graf      2014-08-02   992   * parameters. A table can be configured either with a variable or
7e1e77636e3607 Thomas Graf      2014-08-02   993   * fixed length key:
7e1e77636e3607 Thomas Graf      2014-08-02   994   *
7e1e77636e3607 Thomas Graf      2014-08-02   995   * Configuration Example 1: Fixed length keys
7e1e77636e3607 Thomas Graf      2014-08-02   996   * struct test_obj {
7e1e77636e3607 Thomas Graf      2014-08-02   997   *	int			key;
7e1e77636e3607 Thomas Graf      2014-08-02   998   *	void *			my_member;
7e1e77636e3607 Thomas Graf      2014-08-02   999   *	struct rhash_head	node;
7e1e77636e3607 Thomas Graf      2014-08-02  1000   * };
7e1e77636e3607 Thomas Graf      2014-08-02  1001   *
7e1e77636e3607 Thomas Graf      2014-08-02  1002   * struct rhashtable_params params = {
7e1e77636e3607 Thomas Graf      2014-08-02  1003   *	.head_offset = offsetof(struct test_obj, node),
7e1e77636e3607 Thomas Graf      2014-08-02  1004   *	.key_offset = offsetof(struct test_obj, key),
7e1e77636e3607 Thomas Graf      2014-08-02  1005   *	.key_len = sizeof(int),
87545899b52f9c Daniel Borkmann  2014-12-10  1006   *	.hashfn = jhash,
7e1e77636e3607 Thomas Graf      2014-08-02  1007   * };
7e1e77636e3607 Thomas Graf      2014-08-02  1008   *
7e1e77636e3607 Thomas Graf      2014-08-02  1009   * Configuration Example 2: Variable length keys
7e1e77636e3607 Thomas Graf      2014-08-02  1010   * struct test_obj {
7e1e77636e3607 Thomas Graf      2014-08-02  1011   *	[...]
7e1e77636e3607 Thomas Graf      2014-08-02  1012   *	struct rhash_head	node;
7e1e77636e3607 Thomas Graf      2014-08-02  1013   * };
7e1e77636e3607 Thomas Graf      2014-08-02  1014   *
49f7b33e63fec9 Patrick McHardy  2015-03-25  1015   * u32 my_hash_fn(const void *data, u32 len, u32 seed)
7e1e77636e3607 Thomas Graf      2014-08-02  1016   * {
7e1e77636e3607 Thomas Graf      2014-08-02  1017   *	struct test_obj *obj = data;
7e1e77636e3607 Thomas Graf      2014-08-02  1018   *
7e1e77636e3607 Thomas Graf      2014-08-02  1019   *	return [... hash ...];
7e1e77636e3607 Thomas Graf      2014-08-02  1020   * }
7e1e77636e3607 Thomas Graf      2014-08-02  1021   *
7e1e77636e3607 Thomas Graf      2014-08-02  1022   * struct rhashtable_params params = {
7e1e77636e3607 Thomas Graf      2014-08-02  1023   *	.head_offset = offsetof(struct test_obj, node),
87545899b52f9c Daniel Borkmann  2014-12-10  1024   *	.hashfn = jhash,
7e1e77636e3607 Thomas Graf      2014-08-02  1025   *	.obj_hashfn = my_hash_fn,
7e1e77636e3607 Thomas Graf      2014-08-02  1026   * };
7e1e77636e3607 Thomas Graf      2014-08-02  1027   */
9e54dd8b64dccd Kent Overstreet  2024-03-21  1028  int rhashtable_init_noprof(struct rhashtable *ht,
488fb86ee91d3b Herbert Xu       2015-03-20  1029  		    const struct rhashtable_params *params)
7e1e77636e3607 Thomas Graf      2014-08-02  1030  {
7e1e77636e3607 Thomas Graf      2014-08-02  1031  	struct bucket_table *tbl;
7e1e77636e3607 Thomas Graf      2014-08-02  1032  	size_t size;
7e1e77636e3607 Thomas Graf      2014-08-02  1033  
31ccde2dacea83 Herbert Xu       2015-03-24  1034  	if ((!params->key_len && !params->obj_hashfn) ||
02fd97c3d4a8a1 Herbert Xu       2015-03-20  1035  	    (params->obj_hashfn && !params->obj_cmpfn))
7e1e77636e3607 Thomas Graf      2014-08-02  1036  		return -EINVAL;
7e1e77636e3607 Thomas Graf      2014-08-02  1037  
97defe1ecf868b Thomas Graf      2015-01-02  1038  	memset(ht, 0, sizeof(*ht));
97defe1ecf868b Thomas Graf      2015-01-02 @1039  	mutex_init(&ht->mutex);
ba7c95ea3870fe Herbert Xu       2015-03-24 @1040  	spin_lock_init(&ht->lock);
97defe1ecf868b Thomas Graf      2015-01-02  1041  	memcpy(&ht->p, params, sizeof(*params));
97defe1ecf868b Thomas Graf      2015-01-02  1042  
9e54dd8b64dccd Kent Overstreet  2024-03-21  1043  	alloc_tag_record(ht->alloc_tag);
9e54dd8b64dccd Kent Overstreet  2024-03-21  1044  
a998f712f77ea4 Thomas Graf      2015-03-19  1045  	if (params->min_size)
a998f712f77ea4 Thomas Graf      2015-03-19  1046  		ht->p.min_size = roundup_pow_of_two(params->min_size);
a998f712f77ea4 Thomas Graf      2015-03-19  1047  
6d684e54690cae Herbert Xu       2017-04-27  1048  	/* Cap total entries at 2^31 to avoid nelems overflow. */
6d684e54690cae Herbert Xu       2017-04-27  1049  	ht->max_elems = 1u << 31;
2d2ab658d2debc Herbert Xu       2017-04-28  1050  
2d2ab658d2debc Herbert Xu       2017-04-28  1051  	if (params->max_size) {
2d2ab658d2debc Herbert Xu       2017-04-28  1052  		ht->p.max_size = rounddown_pow_of_two(params->max_size);
6d684e54690cae Herbert Xu       2017-04-27  1053  		if (ht->p.max_size < ht->max_elems / 2)
6d684e54690cae Herbert Xu       2017-04-27  1054  			ht->max_elems = ht->p.max_size * 2;
2d2ab658d2debc Herbert Xu       2017-04-28  1055  	}
6d684e54690cae Herbert Xu       2017-04-27  1056  
48e75b430670eb Florian Westphal 2017-05-01  1057  	ht->p.min_size = max_t(u16, ht->p.min_size, HASH_MIN_SIZE);
a998f712f77ea4 Thomas Graf      2015-03-19  1058  
3a324606bbabfc Herbert Xu       2015-12-16  1059  	size = rounded_hashtable_size(&ht->p);
3a324606bbabfc Herbert Xu       2015-12-16  1060  
31ccde2dacea83 Herbert Xu       2015-03-24  1061  	ht->key_len = ht->p.key_len;
31ccde2dacea83 Herbert Xu       2015-03-24  1062  	if (!params->hashfn) {
31ccde2dacea83 Herbert Xu       2015-03-24  1063  		ht->p.hashfn = jhash;
31ccde2dacea83 Herbert Xu       2015-03-24  1064  
31ccde2dacea83 Herbert Xu       2015-03-24  1065  		if (!(ht->key_len & (sizeof(u32) - 1))) {
31ccde2dacea83 Herbert Xu       2015-03-24  1066  			ht->key_len /= sizeof(u32);
31ccde2dacea83 Herbert Xu       2015-03-24  1067  			ht->p.hashfn = rhashtable_jhash2;
31ccde2dacea83 Herbert Xu       2015-03-24  1068  		}
31ccde2dacea83 Herbert Xu       2015-03-24  1069  	}
31ccde2dacea83 Herbert Xu       2015-03-24  1070  
2d22ecf6db1c39 Davidlohr Bueso  2018-08-21  1071  	/*
2d22ecf6db1c39 Davidlohr Bueso  2018-08-21  1072  	 * This is api initialization and thus we need to guarantee the
2d22ecf6db1c39 Davidlohr Bueso  2018-08-21  1073  	 * initial rhashtable allocation. Upon failure, retry with the
2d22ecf6db1c39 Davidlohr Bueso  2018-08-21  1074  	 * smallest possible size with __GFP_NOFAIL semantics.
2d22ecf6db1c39 Davidlohr Bueso  2018-08-21  1075  	 */
b9ecfdaa1090b5 Herbert Xu       2015-03-24  1076  	tbl = bucket_table_alloc(ht, size, GFP_KERNEL);
2d22ecf6db1c39 Davidlohr Bueso  2018-08-21  1077  	if (unlikely(tbl == NULL)) {
2d22ecf6db1c39 Davidlohr Bueso  2018-08-21  1078  		size = max_t(u16, ht->p.min_size, HASH_MIN_SIZE);
2d22ecf6db1c39 Davidlohr Bueso  2018-08-21  1079  		tbl = bucket_table_alloc(ht, size, GFP_KERNEL | __GFP_NOFAIL);
2d22ecf6db1c39 Davidlohr Bueso  2018-08-21  1080  	}
7e1e77636e3607 Thomas Graf      2014-08-02  1081  
545a148e43bed6 Ying Xue         2015-01-07  1082  	atomic_set(&ht->nelems, 0);
a5b6846f9e1a08 Daniel Borkmann  2015-03-12  1083  
7e1e77636e3607 Thomas Graf      2014-08-02  1084  	RCU_INIT_POINTER(ht->tbl, tbl);
7e1e77636e3607 Thomas Graf      2014-08-02  1085  
57699a40b4f269 Ying Xue         2015-01-16  1086  	INIT_WORK(&ht->run_work, rht_deferred_worker);
97defe1ecf868b Thomas Graf      2015-01-02  1087  
7e1e77636e3607 Thomas Graf      2014-08-02  1088  	return 0;
7e1e77636e3607 Thomas Graf      2014-08-02  1089  }
9e54dd8b64dccd Kent Overstreet  2024-03-21  1090  EXPORT_SYMBOL_GPL(rhashtable_init_noprof);
7e1e77636e3607 Thomas Graf      2014-08-02  1091  

:::::: The code at line 1039 was first introduced by commit
:::::: 97defe1ecf868b8127f8e62395499d6a06e4c4b1 rhashtable: Per bucket locks & deferred expansion/shrinking

:::::: TO: Thomas Graf <tgraf@suug.ch>
:::::: CC: David S. Miller <davem@davemloft.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
