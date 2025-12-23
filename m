Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCABA33A9D7
	for <oe-kbuild-all@lists.linux.dev>; Tue, 23 Dec 2025 16:55:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766508931; cv=none; b=lPOipw3WlloM8MxXPRSYoaEq3i0SV4/Ba+ilMc/s9lw+I8qZyUoE/Hdx/XaHIfyQSPMesV5mgn1Ff87ZgwBXf73ArNIi+7JHK65vWfiwDdan4Pp1ykjFdzlqC8MugG9SeDWHeBnQWTzC0R3kl8lu8zxU79SA+I8VePW5s0e8++k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766508931; c=relaxed/simple;
	bh=bKdoNJRO05eE+Luk6gBENO+4N1aINAUytQgG7tLt6ho=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ZVkja8LeH0WF/bB+bqChbiG3mxPeZ4bxiQO54nNpvqJWiqTeswyfFrjZHkBViNZEZiL75V1Y2iJERbUHQ+2gZpGZ8qS3NCa33b3TtGy27GRF4KK1par35Nm+CmpJYNHnopbM60l3kx6FBv0bwtIR5O/oCW13+8RQNOJJgrSYKAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nWwuUn5H; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nWwuUn5H"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766508928; x=1798044928;
  h=date:from:to:cc:subject:message-id;
  bh=bKdoNJRO05eE+Luk6gBENO+4N1aINAUytQgG7tLt6ho=;
  b=nWwuUn5HLydZ/5g8BnXvVXb2f1Zf1mz8MtKzh6w3QpO6QQ8iWvxkyEjj
   9kJ61MeFqp25QECfevQNgHLBnR9qXaAFSE7qNdDYdUX4xpLHtwlc0U9Pk
   TWPpYFQb8rZYM7E8Mva5x1kYg04Tui4DrNuLRtplceZlbqyseAFtbzZjJ
   rXVSE5MWNTifALXDKCIzANzfKz/7UIFH69CTFFlrIIk1FhMsIqLAR4oBp
   Mu8k00BmENpuI6Tc6Ux5WMz7eu1w73CEhyolob2uhtzVFGGrt0yG9cMY7
   +bOrFivUjV6myEYLwLF0g+bQqDwAPWDzWKrQSYgE2gWbqveG2p4e8YXXd
   Q==;
X-CSE-ConnectionGUID: vxXI0HLLTyyk/AC2q/cMSw==
X-CSE-MsgGUID: ShKJ9AZMTh6dED+alvJJlw==
X-IronPort-AV: E=McAfee;i="6800,10657,11651"; a="68513705"
X-IronPort-AV: E=Sophos;i="6.21,171,1763452800"; 
   d="scan'208";a="68513705"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Dec 2025 08:55:27 -0800
X-CSE-ConnectionGUID: E0ba10XLQdG2mMd3ZkJIoQ==
X-CSE-MsgGUID: I0ZWPMzlTOC43o+wLevRdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,171,1763452800"; 
   d="scan'208";a="230482204"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 23 Dec 2025 08:55:25 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vY5fO-000000002Be-4Bqc;
	Tue, 23 Dec 2025 16:55:23 +0000
Date: Wed, 24 Dec 2025 00:54:23 +0800
From: kernel test robot <lkp@intel.com>
To: Marco Elver <elver@google.com>
Cc: oe-kbuild-all@lists.linux.dev, Peter Zijlstra <peterz@infradead.org>
Subject: [peterz-queue:locking/core 32/39] kernel/kcov.c:411:9:
 sparse: sparse: incorrect type in argument 1 (different base types)
Message-ID: <202512240004.qVGsTEP2-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git locking/core
head:   77b4ebc9e43b02f3c50dab48963d969964ea83ef
commit: 10611422ecfa0800824d1c065caa564ee868fcb1 [32/39] kcov: Enable context analysis
config: um-randconfig-r134-20251223 (https://download.01.org/0day-ci/archive/20251224/202512240004.qVGsTEP2-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 4ef602d446057dabf5f61fb221669ecbeda49279)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251224/202512240004.qVGsTEP2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512240004.qVGsTEP2-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   include/linux/local_lock_internal.h:22:1: sparse: sparse: multiple definitions for function '__assume_shared_ctx_lock'
   include/linux/local_lock_internal.h:13:1: sparse:  the previous one is here
   include/linux/local_lock_internal.h:332:40: sparse: sparse: multiple definitions for function '__this_cpu_local_lock'
   include/linux/local_lock_internal.h:326:37: sparse:  the previous one is here
   kernel/kcov.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse: sparse: multiple definitions for function '__acquire_ctx_lock'
   kernel/kcov.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:22:1: sparse:  the previous one is here
   kernel/kcov.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse: sparse: multiple definitions for function '__acquire_shared_ctx_lock'
   kernel/kcov.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:22:1: sparse:  the previous one is here
   kernel/kcov.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse: sparse: multiple definitions for function '__try_acquire_ctx_lock'
   kernel/kcov.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:22:1: sparse:  the previous one is here
   kernel/kcov.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse: sparse: multiple definitions for function '__try_acquire_shared_ctx_lock'
   kernel/kcov.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:22:1: sparse:  the previous one is here
   kernel/kcov.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse: sparse: multiple definitions for function '__release_ctx_lock'
   kernel/kcov.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:22:1: sparse:  the previous one is here
   kernel/kcov.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse: sparse: multiple definitions for function '__release_shared_ctx_lock'
   kernel/kcov.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:22:1: sparse:  the previous one is here
   kernel/kcov.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse: sparse: multiple definitions for function '__assume_ctx_lock'
   kernel/kcov.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:22:1: sparse:  the previous one is here
   kernel/kcov.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse: sparse: multiple definitions for function '__assume_shared_ctx_lock'
   kernel/kcov.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:22:1: sparse:  the previous one is here
   kernel/kcov.c: note: in included file (through include/linux/list_bl.h, include/linux/fs/super_types.h, include/linux/fs/super.h, ...):
   include/linux/bit_spinlock.h:19:1: sparse: sparse: multiple definitions for function '__acquire_ctx_lock'
   kernel/kcov.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse:  the previous one is here
   kernel/kcov.c: note: in included file (through include/linux/list_bl.h, include/linux/fs/super_types.h, include/linux/fs/super.h, ...):
   include/linux/bit_spinlock.h:19:1: sparse: sparse: multiple definitions for function '__acquire_shared_ctx_lock'
   kernel/kcov.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse:  the previous one is here
   kernel/kcov.c: note: in included file (through include/linux/list_bl.h, include/linux/fs/super_types.h, include/linux/fs/super.h, ...):
   include/linux/bit_spinlock.h:19:1: sparse: sparse: multiple definitions for function '__try_acquire_ctx_lock'
   kernel/kcov.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse:  the previous one is here
   kernel/kcov.c: note: in included file (through include/linux/list_bl.h, include/linux/fs/super_types.h, include/linux/fs/super.h, ...):
   include/linux/bit_spinlock.h:19:1: sparse: sparse: multiple definitions for function '__try_acquire_shared_ctx_lock'
   kernel/kcov.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse:  the previous one is here
   kernel/kcov.c: note: in included file (through include/linux/list_bl.h, include/linux/fs/super_types.h, include/linux/fs/super.h, ...):
   include/linux/bit_spinlock.h:19:1: sparse: sparse: multiple definitions for function '__release_ctx_lock'
   kernel/kcov.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse:  the previous one is here
   kernel/kcov.c: note: in included file (through include/linux/list_bl.h, include/linux/fs/super_types.h, include/linux/fs/super.h, ...):
   include/linux/bit_spinlock.h:19:1: sparse: sparse: multiple definitions for function '__release_shared_ctx_lock'
   kernel/kcov.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse:  the previous one is here
   kernel/kcov.c: note: in included file (through include/linux/list_bl.h, include/linux/fs/super_types.h, include/linux/fs/super.h, ...):
   include/linux/bit_spinlock.h:19:1: sparse: sparse: multiple definitions for function '__assume_ctx_lock'
   kernel/kcov.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse:  the previous one is here
   kernel/kcov.c: note: in included file (through include/linux/list_bl.h, include/linux/fs/super_types.h, include/linux/fs/super.h, ...):
   include/linux/bit_spinlock.h:19:1: sparse: sparse: multiple definitions for function '__assume_shared_ctx_lock'
   kernel/kcov.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse:  the previous one is here
   kernel/kcov.c: note: in included file:
   include/linux/debugfs.h:242:1: sparse: sparse: multiple definitions for function '__acquire_ctx_lock'
   kernel/kcov.c: note: in included file (through include/linux/list_bl.h, include/linux/fs/super_types.h, include/linux/fs/super.h, ...):
   include/linux/bit_spinlock.h:19:1: sparse:  the previous one is here
   kernel/kcov.c: note: in included file:
   include/linux/debugfs.h:242:1: sparse: sparse: multiple definitions for function '__acquire_shared_ctx_lock'
   kernel/kcov.c: note: in included file (through include/linux/list_bl.h, include/linux/fs/super_types.h, include/linux/fs/super.h, ...):
   include/linux/bit_spinlock.h:19:1: sparse:  the previous one is here
   kernel/kcov.c: note: in included file:
   include/linux/debugfs.h:242:1: sparse: sparse: multiple definitions for function '__try_acquire_ctx_lock'
   kernel/kcov.c: note: in included file (through include/linux/list_bl.h, include/linux/fs/super_types.h, include/linux/fs/super.h, ...):
   include/linux/bit_spinlock.h:19:1: sparse:  the previous one is here
   kernel/kcov.c: note: in included file:
   include/linux/debugfs.h:242:1: sparse: sparse: multiple definitions for function '__try_acquire_shared_ctx_lock'
   kernel/kcov.c: note: in included file (through include/linux/list_bl.h, include/linux/fs/super_types.h, include/linux/fs/super.h, ...):
   include/linux/bit_spinlock.h:19:1: sparse:  the previous one is here
   kernel/kcov.c: note: in included file:
   include/linux/debugfs.h:242:1: sparse: sparse: multiple definitions for function '__release_ctx_lock'
   kernel/kcov.c: note: in included file (through include/linux/list_bl.h, include/linux/fs/super_types.h, include/linux/fs/super.h, ...):
   include/linux/bit_spinlock.h:19:1: sparse:  the previous one is here
   kernel/kcov.c: note: in included file:
   include/linux/debugfs.h:242:1: sparse: sparse: multiple definitions for function '__release_shared_ctx_lock'
   kernel/kcov.c: note: in included file (through include/linux/list_bl.h, include/linux/fs/super_types.h, include/linux/fs/super.h, ...):
   include/linux/bit_spinlock.h:19:1: sparse:  the previous one is here
   kernel/kcov.c: note: in included file:
   include/linux/debugfs.h:242:1: sparse: sparse: multiple definitions for function '__assume_ctx_lock'
   kernel/kcov.c: note: in included file (through include/linux/list_bl.h, include/linux/fs/super_types.h, include/linux/fs/super.h, ...):
   include/linux/bit_spinlock.h:19:1: sparse:  the previous one is here
   kernel/kcov.c: note: in included file:
   include/linux/debugfs.h:242:1: sparse: sparse: multiple definitions for function '__assume_shared_ctx_lock'
   kernel/kcov.c: note: in included file (through include/linux/list_bl.h, include/linux/fs/super_types.h, include/linux/fs/super.h, ...):
   include/linux/bit_spinlock.h:19:1: sparse:  the previous one is here
>> kernel/kcov.c:411:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct debugfs_cancellation const *var @@     got struct raw_spinlock [usertype] * @@
   kernel/kcov.c:411:9: sparse:     expected struct debugfs_cancellation const *var
   kernel/kcov.c:411:9: sparse:     got struct raw_spinlock [usertype] *
>> kernel/kcov.c:411:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct debugfs_cancellation const *var @@     got struct spinlock * @@
   kernel/kcov.c:411:9: sparse:     expected struct debugfs_cancellation const *var
   kernel/kcov.c:411:9: sparse:     got struct spinlock *
   kernel/kcov.c:459:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct debugfs_cancellation const *var @@     got struct raw_spinlock [usertype] * @@
   kernel/kcov.c:459:9: sparse:     expected struct debugfs_cancellation const *var
   kernel/kcov.c:459:9: sparse:     got struct raw_spinlock [usertype] *
   kernel/kcov.c:459:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct debugfs_cancellation const *var @@     got struct spinlock * @@
   kernel/kcov.c:459:9: sparse:     expected struct debugfs_cancellation const *var
   kernel/kcov.c:459:9: sparse:     got struct spinlock *
   kernel/kcov.c:502:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct debugfs_cancellation const *var @@     got struct raw_spinlock [usertype] * @@
   kernel/kcov.c:502:9: sparse:     expected struct debugfs_cancellation const *var
   kernel/kcov.c:502:9: sparse:     got struct raw_spinlock [usertype] *
   kernel/kcov.c:502:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct debugfs_cancellation const *var @@     got struct spinlock * @@
   kernel/kcov.c:502:9: sparse:     expected struct debugfs_cancellation const *var
   kernel/kcov.c:502:9: sparse:     got struct spinlock *
   kernel/kcov.c:533:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct debugfs_cancellation const *var @@     got struct spinlock * @@
   kernel/kcov.c:533:9: sparse:     expected struct debugfs_cancellation const *var
   kernel/kcov.c:533:9: sparse:     got struct spinlock *
   kernel/kcov.c:659:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct debugfs_cancellation const *var @@     got struct raw_spinlock [usertype] * @@
   kernel/kcov.c:659:17: sparse:     expected struct debugfs_cancellation const *var
   kernel/kcov.c:659:17: sparse:     got struct raw_spinlock [usertype] *
   kernel/kcov.c:659:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct debugfs_cancellation const *var @@     got struct spinlock * @@
   kernel/kcov.c:659:17: sparse:     expected struct debugfs_cancellation const *var
   kernel/kcov.c:659:17: sparse:     got struct spinlock *
   kernel/kcov.c:729:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct debugfs_cancellation const *var @@     got struct raw_spinlock [usertype] * @@
   kernel/kcov.c:729:17: sparse:     expected struct debugfs_cancellation const *var
   kernel/kcov.c:729:17: sparse:     got struct raw_spinlock [usertype] *
   kernel/kcov.c:729:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct debugfs_cancellation const *var @@     got struct spinlock * @@
   kernel/kcov.c:729:17: sparse:     expected struct debugfs_cancellation const *var
   kernel/kcov.c:729:17: sparse:     got struct spinlock *
   kernel/kcov.c:762:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct debugfs_cancellation const *var @@     got struct raw_spinlock [usertype] * @@
   kernel/kcov.c:762:17: sparse:     expected struct debugfs_cancellation const *var
   kernel/kcov.c:762:17: sparse:     got struct raw_spinlock [usertype] *
   kernel/kcov.c:762:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct debugfs_cancellation const *var @@     got struct spinlock * @@
   kernel/kcov.c:762:17: sparse:     expected struct debugfs_cancellation const *var
   kernel/kcov.c:762:17: sparse:     got struct spinlock *
>> kernel/kcov.c:877:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct local_trylock [noderef] [usertype] __percpu *base @@     got struct local_lock [noderef] __percpu * @@
   kernel/kcov.c:877:9: sparse:     expected struct local_trylock [noderef] [usertype] __percpu *base
   kernel/kcov.c:877:9: sparse:     got struct local_lock [noderef] __percpu *
>> kernel/kcov.c:877:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct local_trylock [noderef] [usertype] __percpu *base @@     got struct local_lock [noderef] __percpu * @@
   kernel/kcov.c:877:9: sparse:     expected struct local_trylock [noderef] [usertype] __percpu *base
   kernel/kcov.c:877:9: sparse:     got struct local_lock [noderef] __percpu *
>> kernel/kcov.c:877:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct local_trylock [noderef] [usertype] __percpu *base @@     got struct local_lock [noderef] __percpu * @@
   kernel/kcov.c:877:9: sparse:     expected struct local_trylock [noderef] [usertype] __percpu *base
   kernel/kcov.c:877:9: sparse:     got struct local_lock [noderef] __percpu *
>> kernel/kcov.c:877:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct debugfs_cancellation const *var @@     got struct local_trylock [usertype] * @@
   kernel/kcov.c:877:9: sparse:     expected struct debugfs_cancellation const *var
   kernel/kcov.c:877:9: sparse:     got struct local_trylock [usertype] *
   kernel/kcov.c:885:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct local_trylock [noderef] [usertype] __percpu *base @@     got struct local_lock [noderef] __percpu * @@
   kernel/kcov.c:885:17: sparse:     expected struct local_trylock [noderef] [usertype] __percpu *base
   kernel/kcov.c:885:17: sparse:     got struct local_lock [noderef] __percpu *
   kernel/kcov.c:885:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct debugfs_cancellation const *var @@     got struct local_trylock [usertype] * @@
   kernel/kcov.c:885:17: sparse:     expected struct debugfs_cancellation const *var
   kernel/kcov.c:885:17: sparse:     got struct local_trylock [usertype] *
   kernel/kcov.c:885:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct local_trylock [noderef] [usertype] __percpu *base @@     got struct local_lock [noderef] __percpu * @@
   kernel/kcov.c:885:17: sparse:     expected struct local_trylock [noderef] [usertype] __percpu *base
   kernel/kcov.c:885:17: sparse:     got struct local_lock [noderef] __percpu *
   kernel/kcov.c:885:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct local_trylock [noderef] [usertype] __percpu *base @@     got struct local_lock [noderef] __percpu * @@
   kernel/kcov.c:885:17: sparse:     expected struct local_trylock [noderef] [usertype] __percpu *base
   kernel/kcov.c:885:17: sparse:     got struct local_lock [noderef] __percpu *
   kernel/kcov.c:894:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct local_trylock [noderef] [usertype] __percpu *base @@     got struct local_lock [noderef] __percpu * @@
   kernel/kcov.c:894:17: sparse:     expected struct local_trylock [noderef] [usertype] __percpu *base
   kernel/kcov.c:894:17: sparse:     got struct local_lock [noderef] __percpu *
   kernel/kcov.c:894:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct debugfs_cancellation const *var @@     got struct local_trylock [usertype] * @@
   kernel/kcov.c:894:17: sparse:     expected struct debugfs_cancellation const *var
   kernel/kcov.c:894:17: sparse:     got struct local_trylock [usertype] *
   kernel/kcov.c:894:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct local_trylock [noderef] [usertype] __percpu *base @@     got struct local_lock [noderef] __percpu * @@
   kernel/kcov.c:894:17: sparse:     expected struct local_trylock [noderef] [usertype] __percpu *base
   kernel/kcov.c:894:17: sparse:     got struct local_lock [noderef] __percpu *
   kernel/kcov.c:894:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct local_trylock [noderef] [usertype] __percpu *base @@     got struct local_lock [noderef] __percpu * @@
   kernel/kcov.c:894:17: sparse:     expected struct local_trylock [noderef] [usertype] __percpu *base
   kernel/kcov.c:894:17: sparse:     got struct local_lock [noderef] __percpu *
   kernel/kcov.c:902:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct local_trylock [noderef] [usertype] __percpu *base @@     got struct local_lock [noderef] __percpu * @@
   kernel/kcov.c:902:17: sparse:     expected struct local_trylock [noderef] [usertype] __percpu *base
   kernel/kcov.c:902:17: sparse:     got struct local_lock [noderef] __percpu *
   kernel/kcov.c:902:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct debugfs_cancellation const *var @@     got struct local_trylock [usertype] * @@
   kernel/kcov.c:902:17: sparse:     expected struct debugfs_cancellation const *var
   kernel/kcov.c:902:17: sparse:     got struct local_trylock [usertype] *
   kernel/kcov.c:902:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct local_trylock [noderef] [usertype] __percpu *base @@     got struct local_lock [noderef] __percpu * @@
   kernel/kcov.c:902:17: sparse:     expected struct local_trylock [noderef] [usertype] __percpu *base
   kernel/kcov.c:902:17: sparse:     got struct local_lock [noderef] __percpu *
   kernel/kcov.c:902:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct local_trylock [noderef] [usertype] __percpu *base @@     got struct local_lock [noderef] __percpu * @@
   kernel/kcov.c:902:17: sparse:     expected struct local_trylock [noderef] [usertype] __percpu *base
   kernel/kcov.c:902:17: sparse:     got struct local_lock [noderef] __percpu *
   kernel/kcov.c:929:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct local_trylock [noderef] [usertype] __percpu *base @@     got struct local_lock [noderef] __percpu * @@
   kernel/kcov.c:929:17: sparse:     expected struct local_trylock [noderef] [usertype] __percpu *base
   kernel/kcov.c:929:17: sparse:     got struct local_lock [noderef] __percpu *
   kernel/kcov.c:929:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct debugfs_cancellation const *var @@     got struct local_trylock [usertype] * @@
   kernel/kcov.c:929:17: sparse:     expected struct debugfs_cancellation const *var
   kernel/kcov.c:929:17: sparse:     got struct local_trylock [usertype] *
   kernel/kcov.c:929:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct local_trylock [noderef] [usertype] __percpu *base @@     got struct local_lock [noderef] __percpu * @@
   kernel/kcov.c:929:17: sparse:     expected struct local_trylock [noderef] [usertype] __percpu *base
   kernel/kcov.c:929:17: sparse:     got struct local_lock [noderef] __percpu *
   kernel/kcov.c:929:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct local_trylock [noderef] [usertype] __percpu *base @@     got struct local_lock [noderef] __percpu * @@
   kernel/kcov.c:929:17: sparse:     expected struct local_trylock [noderef] [usertype] __percpu *base
   kernel/kcov.c:929:17: sparse:     got struct local_lock [noderef] __percpu *
   kernel/kcov.c:935:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct local_trylock [noderef] [usertype] __percpu *base @@     got struct local_lock [noderef] __percpu * @@
   kernel/kcov.c:935:17: sparse:     expected struct local_trylock [noderef] [usertype] __percpu *base
   kernel/kcov.c:935:17: sparse:     got struct local_lock [noderef] __percpu *
   kernel/kcov.c:935:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct local_trylock [noderef] [usertype] __percpu *base @@     got struct local_lock [noderef] __percpu * @@
   kernel/kcov.c:935:17: sparse:     expected struct local_trylock [noderef] [usertype] __percpu *base
   kernel/kcov.c:935:17: sparse:     got struct local_lock [noderef] __percpu *
   kernel/kcov.c:935:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct local_trylock [noderef] [usertype] __percpu *base @@     got struct local_lock [noderef] __percpu * @@
   kernel/kcov.c:935:17: sparse:     expected struct local_trylock [noderef] [usertype] __percpu *base
   kernel/kcov.c:935:17: sparse:     got struct local_lock [noderef] __percpu *
   kernel/kcov.c:935:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct debugfs_cancellation const *var @@     got struct local_trylock [usertype] * @@
   kernel/kcov.c:935:17: sparse:     expected struct debugfs_cancellation const *var
   kernel/kcov.c:935:17: sparse:     got struct local_trylock [usertype] *
   kernel/kcov.c:947:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct local_trylock [noderef] [usertype] __percpu *base @@     got struct local_lock [noderef] __percpu * @@
   kernel/kcov.c:947:9: sparse:     expected struct local_trylock [noderef] [usertype] __percpu *base
   kernel/kcov.c:947:9: sparse:     got struct local_lock [noderef] __percpu *
   kernel/kcov.c:947:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct debugfs_cancellation const *var @@     got struct local_trylock [usertype] * @@
   kernel/kcov.c:947:9: sparse:     expected struct debugfs_cancellation const *var
   kernel/kcov.c:947:9: sparse:     got struct local_trylock [usertype] *
   kernel/kcov.c:947:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct local_trylock [noderef] [usertype] __percpu *base @@     got struct local_lock [noderef] __percpu * @@
   kernel/kcov.c:947:9: sparse:     expected struct local_trylock [noderef] [usertype] __percpu *base
   kernel/kcov.c:947:9: sparse:     got struct local_lock [noderef] __percpu *
   kernel/kcov.c:947:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct local_trylock [noderef] [usertype] __percpu *base @@     got struct local_lock [noderef] __percpu * @@
   kernel/kcov.c:947:9: sparse:     expected struct local_trylock [noderef] [usertype] __percpu *base
   kernel/kcov.c:947:9: sparse:     got struct local_lock [noderef] __percpu *
   kernel/kcov.c:1030:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct local_trylock [noderef] [usertype] __percpu *base @@     got struct local_lock [noderef] __percpu * @@
   kernel/kcov.c:1030:9: sparse:     expected struct local_trylock [noderef] [usertype] __percpu *base
   kernel/kcov.c:1030:9: sparse:     got struct local_lock [noderef] __percpu *
   kernel/kcov.c:1030:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct local_trylock [noderef] [usertype] __percpu *base @@     got struct local_lock [noderef] __percpu * @@
   kernel/kcov.c:1030:9: sparse:     expected struct local_trylock [noderef] [usertype] __percpu *base
   kernel/kcov.c:1030:9: sparse:     got struct local_lock [noderef] __percpu *
   kernel/kcov.c:1030:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct local_trylock [noderef] [usertype] __percpu *base @@     got struct local_lock [noderef] __percpu * @@
   kernel/kcov.c:1030:9: sparse:     expected struct local_trylock [noderef] [usertype] __percpu *base
   kernel/kcov.c:1030:9: sparse:     got struct local_lock [noderef] __percpu *
   kernel/kcov.c:1030:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct debugfs_cancellation const *var @@     got struct local_trylock [usertype] * @@
   kernel/kcov.c:1030:9: sparse:     expected struct debugfs_cancellation const *var
   kernel/kcov.c:1030:9: sparse:     got struct local_trylock [usertype] *
   kernel/kcov.c:1035:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct local_trylock [noderef] [usertype] __percpu *base @@     got struct local_lock [noderef] __percpu * @@
   kernel/kcov.c:1035:17: sparse:     expected struct local_trylock [noderef] [usertype] __percpu *base
   kernel/kcov.c:1035:17: sparse:     got struct local_lock [noderef] __percpu *
   kernel/kcov.c:1035:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct debugfs_cancellation const *var @@     got struct local_trylock [usertype] * @@
   kernel/kcov.c:1035:17: sparse:     expected struct debugfs_cancellation const *var
   kernel/kcov.c:1035:17: sparse:     got struct local_trylock [usertype] *
   kernel/kcov.c:1035:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct local_trylock [noderef] [usertype] __percpu *base @@     got struct local_lock [noderef] __percpu * @@
   kernel/kcov.c:1035:17: sparse:     expected struct local_trylock [noderef] [usertype] __percpu *base
   kernel/kcov.c:1035:17: sparse:     got struct local_lock [noderef] __percpu *
   kernel/kcov.c:1035:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct local_trylock [noderef] [usertype] __percpu *base @@     got struct local_lock [noderef] __percpu * @@
   kernel/kcov.c:1035:17: sparse:     expected struct local_trylock [noderef] [usertype] __percpu *base
   kernel/kcov.c:1035:17: sparse:     got struct local_lock [noderef] __percpu *
   kernel/kcov.c:1043:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct local_trylock [noderef] [usertype] __percpu *base @@     got struct local_lock [noderef] __percpu * @@
   kernel/kcov.c:1043:17: sparse:     expected struct local_trylock [noderef] [usertype] __percpu *base

vim +411 kernel/kcov.c

eec028c9386ed1 Andrey Konovalov 2019-12-04  402  
eec028c9386ed1 Andrey Konovalov 2019-12-04  403  static void kcov_remote_reset(struct kcov *kcov)
10611422ecfa08 Marco Elver      2025-12-19  404  	__must_hold(&kcov->lock)
eec028c9386ed1 Andrey Konovalov 2019-12-04  405  {
eec028c9386ed1 Andrey Konovalov 2019-12-04  406  	int bkt;
eec028c9386ed1 Andrey Konovalov 2019-12-04  407  	struct kcov_remote *remote;
eec028c9386ed1 Andrey Konovalov 2019-12-04  408  	struct hlist_node *tmp;
5ff3b30ab57da8 Andrey Konovalov 2020-06-04  409  	unsigned long flags;
eec028c9386ed1 Andrey Konovalov 2019-12-04  410  
5ff3b30ab57da8 Andrey Konovalov 2020-06-04 @411  	spin_lock_irqsave(&kcov_remote_lock, flags);
eec028c9386ed1 Andrey Konovalov 2019-12-04  412  	hash_for_each_safe(kcov_remote_map, bkt, tmp, remote, hnode) {
eec028c9386ed1 Andrey Konovalov 2019-12-04  413  		if (remote->kcov != kcov)
eec028c9386ed1 Andrey Konovalov 2019-12-04  414  			continue;
eec028c9386ed1 Andrey Konovalov 2019-12-04  415  		hash_del(&remote->hnode);
eec028c9386ed1 Andrey Konovalov 2019-12-04  416  		kfree(remote);
eec028c9386ed1 Andrey Konovalov 2019-12-04  417  	}
eec028c9386ed1 Andrey Konovalov 2019-12-04  418  	/* Do reset before unlock to prevent races with kcov_remote_start(). */
eec028c9386ed1 Andrey Konovalov 2019-12-04  419  	kcov_reset(kcov);
5ff3b30ab57da8 Andrey Konovalov 2020-06-04  420  	spin_unlock_irqrestore(&kcov_remote_lock, flags);
eec028c9386ed1 Andrey Konovalov 2019-12-04  421  }
eec028c9386ed1 Andrey Konovalov 2019-12-04  422  

:::::: The code at line 411 was first introduced by commit
:::::: 5ff3b30ab57da82d8db4f14662a2858cabfbc2c0 kcov: collect coverage from interrupts

:::::: TO: Andrey Konovalov <andreyknvl@google.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
