Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9ABF17BA5
	for <oe-kbuild-all@lists.linux.dev>; Sat,  2 Aug 2025 22:29:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754173796; cv=none; b=dQ5dr98KAigag6VznCKG4DbwCc4EssIvHFh+RuA6Z0g8Y8Yf+IKKtoBnTlxMdrqdfXzmYJj1GD8MbEoobiq5jllpf0GbVn6RWdwhjLRJ/BfjHrmnj/8oArCexvcKa38xfm+yjHv0BNoid0RD0jO+Mnj28FpS5lSDwoKlMYVJbaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754173796; c=relaxed/simple;
	bh=2y82VdY0nQWJpna0kVM+g/CMRjb9AMLLeM7aWVWcSCE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WjabPswspKiKufmU2F0koO3XP0R8NRQzk9g3Urlxh1kesESRSs7KNzDO1axoi/W+gsL9k/Vt4KMCKMXkstTxdDYsfmBMFSftKH8eevX+v2kcBq29ilMd9fr5GWNbGA78lzrnqJMZR/qB/xuTgi888AH2g6FTaPnKW1p/roT+QY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OgsnyLRe; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OgsnyLRe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754173792; x=1785709792;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2y82VdY0nQWJpna0kVM+g/CMRjb9AMLLeM7aWVWcSCE=;
  b=OgsnyLReG90G4LJE20EE8XLPLgpS0kuL0fvZtNc9T6Lx16HveKMl/gBF
   3my6D9J7w/g2HvPU1Oc6fBe1woSC7KbnfnwBHgQtnsYgqQKdVRzMiWVIr
   vjrSK/o+sYMha4tJDtgypwXFk0kEU1EEWqYRtpmXoQnaaCIwJPJ6BymN5
   cs3+2Myiqju4pEGhcAO9D9LnEJA6xZHwSq9jejaTrS2wB6puH0WIxvCgL
   OXOqXlmpgxm+6g4I06d8mO+8fKwC35dN81oRzXungTmzskc0/a6uGpufA
   97rq2pYcJKO6LiKeJY8Ux6scO5tqgTcZHAsALLJNOHBq1A8J7GfjQwZJu
   A==;
X-CSE-ConnectionGUID: s3W8jrUbQAqRZdl2sjRF0w==
X-CSE-MsgGUID: ppJOMomJQCSD6Yv6CTfIOQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11510"; a="56562664"
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="56562664"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Aug 2025 15:29:51 -0700
X-CSE-ConnectionGUID: Bvlc+u4lQUe0AlKk4IKleA==
X-CSE-MsgGUID: Wk8dPSfST16QTMDlGn4Sbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="187537661"
Received: from lkp-server01.sh.intel.com (HELO 160750d4a34c) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 02 Aug 2025 15:29:49 -0700
Received: from kbuild by 160750d4a34c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uiKjb-0005dG-0t;
	Sat, 02 Aug 2025 22:29:47 +0000
Date: Sun, 3 Aug 2025 06:29:38 +0800
From: kernel test robot <lkp@intel.com>
To: elver@google.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [melver:cap-analysis/dev 32/33] crypto/crypto_engine.c:48:17:
 sparse: sparse: incorrect type in argument 1 (different base types)
Message-ID: <202508030653.EJ9Q7Nqh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/melver/linux.git cap-analysis/dev
head:   fdd3a307f8bbbf8727a633b44c3d6a31103e1938
commit: 2c56e090ffa701a43db01da9e65a53d4db11329b [32/33] crypto: Enable capability analysis
config: sparc64-randconfig-r133-20250802 (https://download.01.org/0day-ci/archive/20250803/202508030653.EJ9Q7Nqh-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 8f09b03aebb71c154f3bbe725c29e3f47d37c26e)
reproduce: (https://download.01.org/0day-ci/archive/20250803/202508030653.EJ9Q7Nqh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508030653.EJ9Q7Nqh-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   crypto/crypto_engine.c: note: in included file (through include/linux/rbtree.h, include/linux/mm_types.h, include/linux/mmzone.h, ...):
   include/linux/rcupdate.h:34:1: sparse: sparse: multiple definitions for function '__assume_shared_cap'
   crypto/crypto_engine.c: note: in included file (through include/linux/seqlock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/seqlock_types.h:84:1: sparse:  the previous one is here
   crypto/crypto_engine.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/rwsem.h:48:1: sparse: sparse: multiple definitions for function '__acquire_cap'
   crypto/crypto_engine.c: note: in included file (through include/linux/rbtree.h, include/linux/mm_types.h, include/linux/mmzone.h, ...):
   include/linux/rcupdate.h:34:1: sparse:  the previous one is here
   crypto/crypto_engine.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/rwsem.h:48:1: sparse: sparse: multiple definitions for function '__acquire_shared_cap'
   crypto/crypto_engine.c: note: in included file (through include/linux/rbtree.h, include/linux/mm_types.h, include/linux/mmzone.h, ...):
   include/linux/rcupdate.h:34:1: sparse:  the previous one is here
   crypto/crypto_engine.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/rwsem.h:48:1: sparse: sparse: multiple definitions for function '__release_cap'
   crypto/crypto_engine.c: note: in included file (through include/linux/rbtree.h, include/linux/mm_types.h, include/linux/mmzone.h, ...):
   include/linux/rcupdate.h:34:1: sparse:  the previous one is here
   crypto/crypto_engine.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/rwsem.h:48:1: sparse: sparse: multiple definitions for function '__release_shared_cap'
   crypto/crypto_engine.c: note: in included file (through include/linux/rbtree.h, include/linux/mm_types.h, include/linux/mmzone.h, ...):
   include/linux/rcupdate.h:34:1: sparse:  the previous one is here
   crypto/crypto_engine.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/rwsem.h:48:1: sparse: sparse: multiple definitions for function '__assume_cap'
   crypto/crypto_engine.c: note: in included file (through include/linux/rbtree.h, include/linux/mm_types.h, include/linux/mmzone.h, ...):
   include/linux/rcupdate.h:34:1: sparse:  the previous one is here
   crypto/crypto_engine.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/rwsem.h:48:1: sparse: sparse: multiple definitions for function '__assume_shared_cap'
   crypto/crypto_engine.c: note: in included file (through include/linux/rbtree.h, include/linux/mm_types.h, include/linux/mmzone.h, ...):
   include/linux/rcupdate.h:34:1: sparse:  the previous one is here
   crypto/crypto_engine.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:13:1: sparse: sparse: multiple definitions for function '__acquire_cap'
   crypto/crypto_engine.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/rwsem.h:48:1: sparse:  the previous one is here
   crypto/crypto_engine.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:13:1: sparse: sparse: multiple definitions for function '__acquire_shared_cap'
   crypto/crypto_engine.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/rwsem.h:48:1: sparse:  the previous one is here
   crypto/crypto_engine.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:13:1: sparse: sparse: multiple definitions for function '__release_cap'
   crypto/crypto_engine.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/rwsem.h:48:1: sparse:  the previous one is here
   crypto/crypto_engine.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:13:1: sparse: sparse: multiple definitions for function '__release_shared_cap'
   crypto/crypto_engine.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/rwsem.h:48:1: sparse:  the previous one is here
   crypto/crypto_engine.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:13:1: sparse: sparse: multiple definitions for function '__assume_cap'
   crypto/crypto_engine.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/rwsem.h:48:1: sparse:  the previous one is here
   crypto/crypto_engine.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:13:1: sparse: sparse: multiple definitions for function '__assume_shared_cap'
   crypto/crypto_engine.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/rwsem.h:48:1: sparse:  the previous one is here
   crypto/crypto_engine.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse: sparse: multiple definitions for function '__acquire_cap'
   crypto/crypto_engine.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:13:1: sparse:  the previous one is here
   crypto/crypto_engine.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse: sparse: multiple definitions for function '__acquire_shared_cap'
   crypto/crypto_engine.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:13:1: sparse:  the previous one is here
   crypto/crypto_engine.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse: sparse: multiple definitions for function '__release_cap'
   crypto/crypto_engine.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:13:1: sparse:  the previous one is here
   crypto/crypto_engine.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse: sparse: multiple definitions for function '__release_shared_cap'
   crypto/crypto_engine.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:13:1: sparse:  the previous one is here
   crypto/crypto_engine.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse: sparse: multiple definitions for function '__assume_cap'
   crypto/crypto_engine.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:13:1: sparse:  the previous one is here
   crypto/crypto_engine.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse: sparse: multiple definitions for function '__assume_shared_cap'
   crypto/crypto_engine.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:13:1: sparse:  the previous one is here
   crypto/crypto_engine.c: note: in included file (through include/linux/mm.h, include/linux/scatterlist.h, include/crypto/hash.h, ...):
   include/linux/bit_spinlock.h:19:1: sparse: sparse: multiple definitions for function '__acquire_cap'
   crypto/crypto_engine.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse:  the previous one is here
   crypto/crypto_engine.c: note: in included file (through include/linux/mm.h, include/linux/scatterlist.h, include/crypto/hash.h, ...):
   include/linux/bit_spinlock.h:19:1: sparse: sparse: multiple definitions for function '__acquire_shared_cap'
   crypto/crypto_engine.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse:  the previous one is here
   crypto/crypto_engine.c: note: in included file (through include/linux/mm.h, include/linux/scatterlist.h, include/crypto/hash.h, ...):
   include/linux/bit_spinlock.h:19:1: sparse: sparse: multiple definitions for function '__release_cap'
   crypto/crypto_engine.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse:  the previous one is here
   crypto/crypto_engine.c: note: in included file (through include/linux/mm.h, include/linux/scatterlist.h, include/crypto/hash.h, ...):
   include/linux/bit_spinlock.h:19:1: sparse: sparse: multiple definitions for function '__release_shared_cap'
   crypto/crypto_engine.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse:  the previous one is here
   crypto/crypto_engine.c: note: in included file (through include/linux/mm.h, include/linux/scatterlist.h, include/crypto/hash.h, ...):
   include/linux/bit_spinlock.h:19:1: sparse: sparse: multiple definitions for function '__assume_cap'
   crypto/crypto_engine.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse:  the previous one is here
   crypto/crypto_engine.c: note: in included file (through include/linux/mm.h, include/linux/scatterlist.h, include/crypto/hash.h, ...):
   include/linux/bit_spinlock.h:19:1: sparse: sparse: multiple definitions for function '__assume_shared_cap'
   crypto/crypto_engine.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse:  the previous one is here
>> crypto/crypto_engine.c:48:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct __capability_bitlock const *var @@     got struct raw_spinlock [usertype] * @@
   crypto/crypto_engine.c:48:17: sparse:     expected struct __capability_bitlock const *var
   crypto/crypto_engine.c:48:17: sparse:     got struct raw_spinlock [usertype] *
>> crypto/crypto_engine.c:48:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct __capability_bitlock const *var @@     got struct spinlock * @@
   crypto/crypto_engine.c:48:17: sparse:     expected struct __capability_bitlock const *var
   crypto/crypto_engine.c:48:17: sparse:     got struct spinlock *
   crypto/crypto_engine.c:80:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct __capability_bitlock const *var @@     got struct raw_spinlock [usertype] * @@
   crypto/crypto_engine.c:80:9: sparse:     expected struct __capability_bitlock const *var
   crypto/crypto_engine.c:80:9: sparse:     got struct raw_spinlock [usertype] *
   crypto/crypto_engine.c:80:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct __capability_bitlock const *var @@     got struct spinlock * @@
   crypto/crypto_engine.c:80:9: sparse:     expected struct __capability_bitlock const *var
   crypto/crypto_engine.c:80:9: sparse:     got struct spinlock *
   crypto/crypto_engine.c:112:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct __capability_bitlock const *var @@     got struct raw_spinlock [usertype] * @@
   crypto/crypto_engine.c:112:17: sparse:     expected struct __capability_bitlock const *var
   crypto/crypto_engine.c:112:17: sparse:     got struct raw_spinlock [usertype] *
   crypto/crypto_engine.c:112:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct __capability_bitlock const *var @@     got struct spinlock * @@
   crypto/crypto_engine.c:112:17: sparse:     expected struct __capability_bitlock const *var
   crypto/crypto_engine.c:112:17: sparse:     got struct spinlock *
   crypto/crypto_engine.c:167:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct __capability_bitlock const *var @@     got struct raw_spinlock [usertype] * @@
   crypto/crypto_engine.c:167:17: sparse:     expected struct __capability_bitlock const *var
   crypto/crypto_engine.c:167:17: sparse:     got struct raw_spinlock [usertype] *
   crypto/crypto_engine.c:167:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct __capability_bitlock const *var @@     got struct spinlock * @@
   crypto/crypto_engine.c:167:17: sparse:     expected struct __capability_bitlock const *var
   crypto/crypto_engine.c:167:17: sparse:     got struct spinlock *
   crypto/crypto_engine.c:190:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct __capability_bitlock const *var @@     got struct raw_spinlock [usertype] * @@
   crypto/crypto_engine.c:190:17: sparse:     expected struct __capability_bitlock const *var
   crypto/crypto_engine.c:190:17: sparse:     got struct raw_spinlock [usertype] *
   crypto/crypto_engine.c:190:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct __capability_bitlock const *var @@     got struct spinlock * @@
   crypto/crypto_engine.c:190:17: sparse:     expected struct __capability_bitlock const *var
   crypto/crypto_engine.c:190:17: sparse:     got struct spinlock *
   crypto/crypto_engine.c:233:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct __capability_bitlock const *var @@     got struct raw_spinlock [usertype] * @@
   crypto/crypto_engine.c:233:9: sparse:     expected struct __capability_bitlock const *var
   crypto/crypto_engine.c:233:9: sparse:     got struct raw_spinlock [usertype] *
   crypto/crypto_engine.c:233:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct __capability_bitlock const *var @@     got struct spinlock * @@
   crypto/crypto_engine.c:233:9: sparse:     expected struct __capability_bitlock const *var
   crypto/crypto_engine.c:233:9: sparse:     got struct spinlock *
   crypto/crypto_engine.c:405:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct __capability_bitlock const *var @@     got struct raw_spinlock [usertype] * @@
   crypto/crypto_engine.c:405:9: sparse:     expected struct __capability_bitlock const *var
   crypto/crypto_engine.c:405:9: sparse:     got struct raw_spinlock [usertype] *
   crypto/crypto_engine.c:405:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct __capability_bitlock const *var @@     got struct spinlock * @@
   crypto/crypto_engine.c:405:9: sparse:     expected struct __capability_bitlock const *var
   crypto/crypto_engine.c:405:9: sparse:     got struct spinlock *
   crypto/crypto_engine.c:433:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct __capability_bitlock const *var @@     got struct raw_spinlock [usertype] * @@
   crypto/crypto_engine.c:433:9: sparse:     expected struct __capability_bitlock const *var
   crypto/crypto_engine.c:433:9: sparse:     got struct raw_spinlock [usertype] *
   crypto/crypto_engine.c:433:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct __capability_bitlock const *var @@     got struct spinlock * @@
   crypto/crypto_engine.c:433:9: sparse:     expected struct __capability_bitlock const *var
   crypto/crypto_engine.c:433:9: sparse:     got struct spinlock *
   crypto/crypto_engine.c:442:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct __capability_bitlock const *var @@     got struct raw_spinlock [usertype] * @@
   crypto/crypto_engine.c:442:17: sparse:     expected struct __capability_bitlock const *var
   crypto/crypto_engine.c:442:17: sparse:     got struct raw_spinlock [usertype] *
   crypto/crypto_engine.c:442:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct __capability_bitlock const *var @@     got struct spinlock * @@
   crypto/crypto_engine.c:442:17: sparse:     expected struct __capability_bitlock const *var
   crypto/crypto_engine.c:442:17: sparse:     got struct spinlock *
   crypto/crypto_engine.c:507:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct __capability_bitlock const *var @@     got struct spinlock * @@
   crypto/crypto_engine.c:507:9: sparse:     expected struct __capability_bitlock const *var
   crypto/crypto_engine.c:507:9: sparse:     got struct spinlock *
--
   crypto/geniv.c: note: in included file (through include/linux/rbtree.h, include/linux/mm_types.h, include/linux/mmzone.h, ...):
   include/linux/rcupdate.h:34:1: sparse: sparse: multiple definitions for function '__assume_shared_cap'
   crypto/geniv.c: note: in included file (through include/linux/seqlock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/seqlock_types.h:84:1: sparse:  the previous one is here
   crypto/geniv.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/rwsem.h:48:1: sparse: sparse: multiple definitions for function '__acquire_cap'
   crypto/geniv.c: note: in included file (through include/linux/rbtree.h, include/linux/mm_types.h, include/linux/mmzone.h, ...):
   include/linux/rcupdate.h:34:1: sparse:  the previous one is here
   crypto/geniv.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/rwsem.h:48:1: sparse: sparse: multiple definitions for function '__acquire_shared_cap'
   crypto/geniv.c: note: in included file (through include/linux/rbtree.h, include/linux/mm_types.h, include/linux/mmzone.h, ...):
   include/linux/rcupdate.h:34:1: sparse:  the previous one is here
   crypto/geniv.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/rwsem.h:48:1: sparse: sparse: multiple definitions for function '__release_cap'
   crypto/geniv.c: note: in included file (through include/linux/rbtree.h, include/linux/mm_types.h, include/linux/mmzone.h, ...):
   include/linux/rcupdate.h:34:1: sparse:  the previous one is here
   crypto/geniv.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/rwsem.h:48:1: sparse: sparse: multiple definitions for function '__release_shared_cap'
   crypto/geniv.c: note: in included file (through include/linux/rbtree.h, include/linux/mm_types.h, include/linux/mmzone.h, ...):
   include/linux/rcupdate.h:34:1: sparse:  the previous one is here
   crypto/geniv.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/rwsem.h:48:1: sparse: sparse: multiple definitions for function '__assume_cap'
   crypto/geniv.c: note: in included file (through include/linux/rbtree.h, include/linux/mm_types.h, include/linux/mmzone.h, ...):
   include/linux/rcupdate.h:34:1: sparse:  the previous one is here
   crypto/geniv.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/rwsem.h:48:1: sparse: sparse: multiple definitions for function '__assume_shared_cap'
   crypto/geniv.c: note: in included file (through include/linux/rbtree.h, include/linux/mm_types.h, include/linux/mmzone.h, ...):
   include/linux/rcupdate.h:34:1: sparse:  the previous one is here
   crypto/geniv.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:13:1: sparse: sparse: multiple definitions for function '__acquire_cap'
   crypto/geniv.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/rwsem.h:48:1: sparse:  the previous one is here
   crypto/geniv.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:13:1: sparse: sparse: multiple definitions for function '__acquire_shared_cap'
   crypto/geniv.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/rwsem.h:48:1: sparse:  the previous one is here
   crypto/geniv.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:13:1: sparse: sparse: multiple definitions for function '__release_cap'
   crypto/geniv.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/rwsem.h:48:1: sparse:  the previous one is here
   crypto/geniv.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:13:1: sparse: sparse: multiple definitions for function '__release_shared_cap'
   crypto/geniv.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/rwsem.h:48:1: sparse:  the previous one is here
   crypto/geniv.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:13:1: sparse: sparse: multiple definitions for function '__assume_cap'
   crypto/geniv.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/rwsem.h:48:1: sparse:  the previous one is here
   crypto/geniv.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:13:1: sparse: sparse: multiple definitions for function '__assume_shared_cap'
   crypto/geniv.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/rwsem.h:48:1: sparse:  the previous one is here
   crypto/geniv.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse: sparse: multiple definitions for function '__acquire_cap'
   crypto/geniv.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:13:1: sparse:  the previous one is here
   crypto/geniv.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse: sparse: multiple definitions for function '__acquire_shared_cap'
   crypto/geniv.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:13:1: sparse:  the previous one is here
   crypto/geniv.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse: sparse: multiple definitions for function '__release_cap'
   crypto/geniv.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:13:1: sparse:  the previous one is here
   crypto/geniv.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse: sparse: multiple definitions for function '__release_shared_cap'
   crypto/geniv.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:13:1: sparse:  the previous one is here
   crypto/geniv.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse: sparse: multiple definitions for function '__assume_cap'
   crypto/geniv.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:13:1: sparse:  the previous one is here
   crypto/geniv.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse: sparse: multiple definitions for function '__assume_shared_cap'
   crypto/geniv.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:13:1: sparse:  the previous one is here
   crypto/geniv.c: note: in included file (through include/linux/list_bl.h, include/linux/rculist_bl.h, include/linux/dcache.h, ...):
   include/linux/bit_spinlock.h:19:1: sparse: sparse: multiple definitions for function '__acquire_cap'
   crypto/geniv.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse:  the previous one is here
   crypto/geniv.c: note: in included file (through include/linux/list_bl.h, include/linux/rculist_bl.h, include/linux/dcache.h, ...):
   include/linux/bit_spinlock.h:19:1: sparse: sparse: multiple definitions for function '__acquire_shared_cap'
   crypto/geniv.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse:  the previous one is here
   crypto/geniv.c: note: in included file (through include/linux/list_bl.h, include/linux/rculist_bl.h, include/linux/dcache.h, ...):
   include/linux/bit_spinlock.h:19:1: sparse: sparse: multiple definitions for function '__release_cap'
   crypto/geniv.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse:  the previous one is here
   crypto/geniv.c: note: in included file (through include/linux/list_bl.h, include/linux/rculist_bl.h, include/linux/dcache.h, ...):
   include/linux/bit_spinlock.h:19:1: sparse: sparse: multiple definitions for function '__release_shared_cap'
   crypto/geniv.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse:  the previous one is here
   crypto/geniv.c: note: in included file (through include/linux/list_bl.h, include/linux/rculist_bl.h, include/linux/dcache.h, ...):
   include/linux/bit_spinlock.h:19:1: sparse: sparse: multiple definitions for function '__assume_cap'
   crypto/geniv.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse:  the previous one is here
   crypto/geniv.c: note: in included file (through include/linux/list_bl.h, include/linux/rculist_bl.h, include/linux/dcache.h, ...):
   include/linux/bit_spinlock.h:19:1: sparse: sparse: multiple definitions for function '__assume_shared_cap'
   crypto/geniv.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse:  the previous one is here
>> crypto/geniv.c:115:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct __capability_bitlock const *var @@     got struct spinlock * @@
   crypto/geniv.c:115:9: sparse:     expected struct __capability_bitlock const *var
   crypto/geniv.c:115:9: sparse:     got struct spinlock *
--
   crypto/acompress.c: note: in included file (through include/linux/rbtree.h, include/linux/mm_types.h, include/linux/mmzone.h, ...):
   include/linux/rcupdate.h:34:1: sparse: sparse: multiple definitions for function '__assume_shared_cap'
   crypto/acompress.c: note: in included file (through include/linux/seqlock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/seqlock_types.h:84:1: sparse:  the previous one is here
   crypto/acompress.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/rwsem.h:48:1: sparse: sparse: multiple definitions for function '__acquire_cap'
   crypto/acompress.c: note: in included file (through include/linux/rbtree.h, include/linux/mm_types.h, include/linux/mmzone.h, ...):
   include/linux/rcupdate.h:34:1: sparse:  the previous one is here
   crypto/acompress.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/rwsem.h:48:1: sparse: sparse: multiple definitions for function '__acquire_shared_cap'
   crypto/acompress.c: note: in included file (through include/linux/rbtree.h, include/linux/mm_types.h, include/linux/mmzone.h, ...):
   include/linux/rcupdate.h:34:1: sparse:  the previous one is here
   crypto/acompress.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/rwsem.h:48:1: sparse: sparse: multiple definitions for function '__release_cap'
   crypto/acompress.c: note: in included file (through include/linux/rbtree.h, include/linux/mm_types.h, include/linux/mmzone.h, ...):
   include/linux/rcupdate.h:34:1: sparse:  the previous one is here
   crypto/acompress.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/rwsem.h:48:1: sparse: sparse: multiple definitions for function '__release_shared_cap'
   crypto/acompress.c: note: in included file (through include/linux/rbtree.h, include/linux/mm_types.h, include/linux/mmzone.h, ...):
   include/linux/rcupdate.h:34:1: sparse:  the previous one is here
   crypto/acompress.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/rwsem.h:48:1: sparse: sparse: multiple definitions for function '__assume_cap'
   crypto/acompress.c: note: in included file (through include/linux/rbtree.h, include/linux/mm_types.h, include/linux/mmzone.h, ...):
   include/linux/rcupdate.h:34:1: sparse:  the previous one is here
   crypto/acompress.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/rwsem.h:48:1: sparse: sparse: multiple definitions for function '__assume_shared_cap'
   crypto/acompress.c: note: in included file (through include/linux/rbtree.h, include/linux/mm_types.h, include/linux/mmzone.h, ...):
   include/linux/rcupdate.h:34:1: sparse:  the previous one is here
   crypto/acompress.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:13:1: sparse: sparse: multiple definitions for function '__acquire_cap'
   crypto/acompress.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/rwsem.h:48:1: sparse:  the previous one is here
   crypto/acompress.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:13:1: sparse: sparse: multiple definitions for function '__acquire_shared_cap'
   crypto/acompress.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/rwsem.h:48:1: sparse:  the previous one is here
   crypto/acompress.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:13:1: sparse: sparse: multiple definitions for function '__release_cap'
   crypto/acompress.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/rwsem.h:48:1: sparse:  the previous one is here
   crypto/acompress.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:13:1: sparse: sparse: multiple definitions for function '__release_shared_cap'
   crypto/acompress.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/rwsem.h:48:1: sparse:  the previous one is here
   crypto/acompress.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:13:1: sparse: sparse: multiple definitions for function '__assume_cap'
   crypto/acompress.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/rwsem.h:48:1: sparse:  the previous one is here
   crypto/acompress.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:13:1: sparse: sparse: multiple definitions for function '__assume_shared_cap'
   crypto/acompress.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/rwsem.h:48:1: sparse:  the previous one is here
   crypto/acompress.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse: sparse: multiple definitions for function '__acquire_cap'
   crypto/acompress.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:13:1: sparse:  the previous one is here
   crypto/acompress.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse: sparse: multiple definitions for function '__acquire_shared_cap'
   crypto/acompress.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:13:1: sparse:  the previous one is here
   crypto/acompress.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse: sparse: multiple definitions for function '__release_cap'
   crypto/acompress.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:13:1: sparse:  the previous one is here
   crypto/acompress.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse: sparse: multiple definitions for function '__release_shared_cap'
   crypto/acompress.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:13:1: sparse:  the previous one is here
   crypto/acompress.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse: sparse: multiple definitions for function '__assume_cap'
   crypto/acompress.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:13:1: sparse:  the previous one is here
   crypto/acompress.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse: sparse: multiple definitions for function '__assume_shared_cap'
   crypto/acompress.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:13:1: sparse:  the previous one is here
   crypto/acompress.c: note: in included file (through include/linux/mm.h, include/linux/scatterlist.h, include/crypto/acompress.h, ...):
   include/linux/bit_spinlock.h:19:1: sparse: sparse: multiple definitions for function '__acquire_cap'
   crypto/acompress.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse:  the previous one is here
   crypto/acompress.c: note: in included file (through include/linux/mm.h, include/linux/scatterlist.h, include/crypto/acompress.h, ...):
   include/linux/bit_spinlock.h:19:1: sparse: sparse: multiple definitions for function '__acquire_shared_cap'
   crypto/acompress.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse:  the previous one is here
   crypto/acompress.c: note: in included file (through include/linux/mm.h, include/linux/scatterlist.h, include/crypto/acompress.h, ...):
   include/linux/bit_spinlock.h:19:1: sparse: sparse: multiple definitions for function '__release_cap'
   crypto/acompress.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse:  the previous one is here
   crypto/acompress.c: note: in included file (through include/linux/mm.h, include/linux/scatterlist.h, include/crypto/acompress.h, ...):
   include/linux/bit_spinlock.h:19:1: sparse: sparse: multiple definitions for function '__release_shared_cap'
   crypto/acompress.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse:  the previous one is here
   crypto/acompress.c: note: in included file (through include/linux/mm.h, include/linux/scatterlist.h, include/crypto/acompress.h, ...):
   include/linux/bit_spinlock.h:19:1: sparse: sparse: multiple definitions for function '__assume_cap'
   crypto/acompress.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse:  the previous one is here
   crypto/acompress.c: note: in included file (through include/linux/mm.h, include/linux/scatterlist.h, include/crypto/acompress.h, ...):
   include/linux/bit_spinlock.h:19:1: sparse: sparse: multiple definitions for function '__assume_shared_cap'
   crypto/acompress.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse:  the previous one is here
>> crypto/acompress.c:442:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct __capability_bitlock const *var @@     got struct spinlock * @@
   crypto/acompress.c:442:17: sparse:     expected struct __capability_bitlock const *var
   crypto/acompress.c:442:17: sparse:     got struct spinlock *
--
   crypto/scompress.c: note: in included file (through include/linux/rbtree.h, include/linux/mm_types.h, include/linux/mmzone.h, ...):
   include/linux/rcupdate.h:34:1: sparse: sparse: multiple definitions for function '__assume_shared_cap'
   crypto/scompress.c: note: in included file (through include/linux/seqlock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/seqlock_types.h:84:1: sparse:  the previous one is here
   crypto/scompress.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/rwsem.h:48:1: sparse: sparse: multiple definitions for function '__acquire_cap'
   crypto/scompress.c: note: in included file (through include/linux/rbtree.h, include/linux/mm_types.h, include/linux/mmzone.h, ...):
   include/linux/rcupdate.h:34:1: sparse:  the previous one is here
   crypto/scompress.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/rwsem.h:48:1: sparse: sparse: multiple definitions for function '__acquire_shared_cap'
   crypto/scompress.c: note: in included file (through include/linux/rbtree.h, include/linux/mm_types.h, include/linux/mmzone.h, ...):
   include/linux/rcupdate.h:34:1: sparse:  the previous one is here
   crypto/scompress.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/rwsem.h:48:1: sparse: sparse: multiple definitions for function '__release_cap'
   crypto/scompress.c: note: in included file (through include/linux/rbtree.h, include/linux/mm_types.h, include/linux/mmzone.h, ...):
   include/linux/rcupdate.h:34:1: sparse:  the previous one is here
   crypto/scompress.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/rwsem.h:48:1: sparse: sparse: multiple definitions for function '__release_shared_cap'
   crypto/scompress.c: note: in included file (through include/linux/rbtree.h, include/linux/mm_types.h, include/linux/mmzone.h, ...):
   include/linux/rcupdate.h:34:1: sparse:  the previous one is here
   crypto/scompress.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/rwsem.h:48:1: sparse: sparse: multiple definitions for function '__assume_cap'
   crypto/scompress.c: note: in included file (through include/linux/rbtree.h, include/linux/mm_types.h, include/linux/mmzone.h, ...):
   include/linux/rcupdate.h:34:1: sparse:  the previous one is here
   crypto/scompress.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/rwsem.h:48:1: sparse: sparse: multiple definitions for function '__assume_shared_cap'
   crypto/scompress.c: note: in included file (through include/linux/rbtree.h, include/linux/mm_types.h, include/linux/mmzone.h, ...):
   include/linux/rcupdate.h:34:1: sparse:  the previous one is here
   crypto/scompress.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:13:1: sparse: sparse: multiple definitions for function '__acquire_cap'
   crypto/scompress.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/rwsem.h:48:1: sparse:  the previous one is here
   crypto/scompress.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:13:1: sparse: sparse: multiple definitions for function '__acquire_shared_cap'
   crypto/scompress.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/rwsem.h:48:1: sparse:  the previous one is here
   crypto/scompress.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:13:1: sparse: sparse: multiple definitions for function '__release_cap'
   crypto/scompress.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/rwsem.h:48:1: sparse:  the previous one is here
   crypto/scompress.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:13:1: sparse: sparse: multiple definitions for function '__release_shared_cap'
   crypto/scompress.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/rwsem.h:48:1: sparse:  the previous one is here
   crypto/scompress.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:13:1: sparse: sparse: multiple definitions for function '__assume_cap'
   crypto/scompress.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/rwsem.h:48:1: sparse:  the previous one is here
   crypto/scompress.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:13:1: sparse: sparse: multiple definitions for function '__assume_shared_cap'
   crypto/scompress.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/rwsem.h:48:1: sparse:  the previous one is here
   crypto/scompress.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse: sparse: multiple definitions for function '__acquire_cap'
   crypto/scompress.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:13:1: sparse:  the previous one is here
   crypto/scompress.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse: sparse: multiple definitions for function '__acquire_shared_cap'
   crypto/scompress.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:13:1: sparse:  the previous one is here
   crypto/scompress.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse: sparse: multiple definitions for function '__release_cap'
   crypto/scompress.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:13:1: sparse:  the previous one is here
   crypto/scompress.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse: sparse: multiple definitions for function '__release_shared_cap'
   crypto/scompress.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:13:1: sparse:  the previous one is here
   crypto/scompress.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse: sparse: multiple definitions for function '__assume_cap'
   crypto/scompress.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:13:1: sparse:  the previous one is here
   crypto/scompress.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse: sparse: multiple definitions for function '__assume_shared_cap'
   crypto/scompress.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:13:1: sparse:  the previous one is here
   crypto/scompress.c: note: in included file (through include/linux/mm.h, include/linux/scatterlist.h, include/crypto/acompress.h, ...):
   include/linux/bit_spinlock.h:19:1: sparse: sparse: multiple definitions for function '__acquire_cap'
   crypto/scompress.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse:  the previous one is here
   crypto/scompress.c: note: in included file (through include/linux/mm.h, include/linux/scatterlist.h, include/crypto/acompress.h, ...):
   include/linux/bit_spinlock.h:19:1: sparse: sparse: multiple definitions for function '__acquire_shared_cap'
   crypto/scompress.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse:  the previous one is here
   crypto/scompress.c: note: in included file (through include/linux/mm.h, include/linux/scatterlist.h, include/crypto/acompress.h, ...):
   include/linux/bit_spinlock.h:19:1: sparse: sparse: multiple definitions for function '__release_cap'
   crypto/scompress.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse:  the previous one is here
   crypto/scompress.c: note: in included file (through include/linux/mm.h, include/linux/scatterlist.h, include/crypto/acompress.h, ...):
   include/linux/bit_spinlock.h:19:1: sparse: sparse: multiple definitions for function '__release_shared_cap'
   crypto/scompress.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse:  the previous one is here
   crypto/scompress.c: note: in included file (through include/linux/mm.h, include/linux/scatterlist.h, include/crypto/acompress.h, ...):
   include/linux/bit_spinlock.h:19:1: sparse: sparse: multiple definitions for function '__assume_cap'
   crypto/scompress.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse:  the previous one is here
   crypto/scompress.c: note: in included file (through include/linux/mm.h, include/linux/scatterlist.h, include/crypto/acompress.h, ...):
   include/linux/bit_spinlock.h:19:1: sparse: sparse: multiple definitions for function '__assume_shared_cap'
   crypto/scompress.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse:  the previous one is here
>> crypto/scompress.c:237:46: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct __capability_bitlock const *var @@     got struct spinlock * @@
   crypto/scompress.c:237:46: sparse:     expected struct __capability_bitlock const *var
   crypto/scompress.c:237:46: sparse:     got struct spinlock *
   crypto/scompress.c:240:49: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct __capability_bitlock const *var @@     got struct spinlock * @@
   crypto/scompress.c:240:49: sparse:     expected struct __capability_bitlock const *var
   crypto/scompress.c:240:49: sparse:     got struct spinlock *
--
   crypto/deflate.c: note: in included file (through include/linux/rbtree.h, include/linux/mm_types.h, include/linux/mmzone.h, ...):
   include/linux/rcupdate.h:34:1: sparse: sparse: multiple definitions for function '__assume_shared_cap'
   crypto/deflate.c: note: in included file (through include/linux/seqlock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/seqlock_types.h:84:1: sparse:  the previous one is here
   crypto/deflate.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/rwsem.h:48:1: sparse: sparse: multiple definitions for function '__acquire_cap'
   crypto/deflate.c: note: in included file (through include/linux/rbtree.h, include/linux/mm_types.h, include/linux/mmzone.h, ...):
   include/linux/rcupdate.h:34:1: sparse:  the previous one is here
   crypto/deflate.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/rwsem.h:48:1: sparse: sparse: multiple definitions for function '__acquire_shared_cap'
   crypto/deflate.c: note: in included file (through include/linux/rbtree.h, include/linux/mm_types.h, include/linux/mmzone.h, ...):
   include/linux/rcupdate.h:34:1: sparse:  the previous one is here
   crypto/deflate.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/rwsem.h:48:1: sparse: sparse: multiple definitions for function '__release_cap'
   crypto/deflate.c: note: in included file (through include/linux/rbtree.h, include/linux/mm_types.h, include/linux/mmzone.h, ...):
   include/linux/rcupdate.h:34:1: sparse:  the previous one is here
   crypto/deflate.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/rwsem.h:48:1: sparse: sparse: multiple definitions for function '__release_shared_cap'
   crypto/deflate.c: note: in included file (through include/linux/rbtree.h, include/linux/mm_types.h, include/linux/mmzone.h, ...):
   include/linux/rcupdate.h:34:1: sparse:  the previous one is here
   crypto/deflate.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/rwsem.h:48:1: sparse: sparse: multiple definitions for function '__assume_cap'
   crypto/deflate.c: note: in included file (through include/linux/rbtree.h, include/linux/mm_types.h, include/linux/mmzone.h, ...):
   include/linux/rcupdate.h:34:1: sparse:  the previous one is here
   crypto/deflate.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/rwsem.h:48:1: sparse: sparse: multiple definitions for function '__assume_shared_cap'
   crypto/deflate.c: note: in included file (through include/linux/rbtree.h, include/linux/mm_types.h, include/linux/mmzone.h, ...):
   include/linux/rcupdate.h:34:1: sparse:  the previous one is here
   crypto/deflate.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:13:1: sparse: sparse: multiple definitions for function '__acquire_cap'
   crypto/deflate.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/rwsem.h:48:1: sparse:  the previous one is here
   crypto/deflate.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:13:1: sparse: sparse: multiple definitions for function '__acquire_shared_cap'
   crypto/deflate.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/rwsem.h:48:1: sparse:  the previous one is here
   crypto/deflate.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:13:1: sparse: sparse: multiple definitions for function '__release_cap'
   crypto/deflate.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/rwsem.h:48:1: sparse:  the previous one is here
   crypto/deflate.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:13:1: sparse: sparse: multiple definitions for function '__release_shared_cap'
   crypto/deflate.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/rwsem.h:48:1: sparse:  the previous one is here
   crypto/deflate.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:13:1: sparse: sparse: multiple definitions for function '__assume_cap'
   crypto/deflate.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/rwsem.h:48:1: sparse:  the previous one is here
   crypto/deflate.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:13:1: sparse: sparse: multiple definitions for function '__assume_shared_cap'
   crypto/deflate.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/rwsem.h:48:1: sparse:  the previous one is here
   crypto/deflate.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse: sparse: multiple definitions for function '__acquire_cap'
   crypto/deflate.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:13:1: sparse:  the previous one is here
   crypto/deflate.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse: sparse: multiple definitions for function '__acquire_shared_cap'
   crypto/deflate.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:13:1: sparse:  the previous one is here
   crypto/deflate.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse: sparse: multiple definitions for function '__release_cap'
   crypto/deflate.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:13:1: sparse:  the previous one is here
   crypto/deflate.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse: sparse: multiple definitions for function '__release_shared_cap'
   crypto/deflate.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:13:1: sparse:  the previous one is here
   crypto/deflate.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse: sparse: multiple definitions for function '__assume_cap'
   crypto/deflate.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:13:1: sparse:  the previous one is here
   crypto/deflate.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse: sparse: multiple definitions for function '__assume_shared_cap'
   crypto/deflate.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:13:1: sparse:  the previous one is here
   crypto/deflate.c: note: in included file (through include/linux/mm.h, include/linux/scatterlist.h, include/crypto/acompress.h, ...):
   include/linux/bit_spinlock.h:19:1: sparse: sparse: multiple definitions for function '__acquire_cap'
   crypto/deflate.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse:  the previous one is here
   crypto/deflate.c: note: in included file (through include/linux/mm.h, include/linux/scatterlist.h, include/crypto/acompress.h, ...):
   include/linux/bit_spinlock.h:19:1: sparse: sparse: multiple definitions for function '__acquire_shared_cap'
   crypto/deflate.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse:  the previous one is here
   crypto/deflate.c: note: in included file (through include/linux/mm.h, include/linux/scatterlist.h, include/crypto/acompress.h, ...):
   include/linux/bit_spinlock.h:19:1: sparse: sparse: multiple definitions for function '__release_cap'
   crypto/deflate.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse:  the previous one is here
   crypto/deflate.c: note: in included file (through include/linux/mm.h, include/linux/scatterlist.h, include/crypto/acompress.h, ...):
   include/linux/bit_spinlock.h:19:1: sparse: sparse: multiple definitions for function '__release_shared_cap'
   crypto/deflate.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse:  the previous one is here
   crypto/deflate.c: note: in included file (through include/linux/mm.h, include/linux/scatterlist.h, include/crypto/acompress.h, ...):
   include/linux/bit_spinlock.h:19:1: sparse: sparse: multiple definitions for function '__assume_cap'
   crypto/deflate.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse:  the previous one is here
   crypto/deflate.c: note: in included file (through include/linux/mm.h, include/linux/scatterlist.h, include/crypto/acompress.h, ...):
   include/linux/bit_spinlock.h:19:1: sparse: sparse: multiple definitions for function '__assume_shared_cap'
   crypto/deflate.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse:  the previous one is here
>> crypto/deflate.c:112:41: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct __capability_bitlock const *var @@     got struct spinlock * @@
   crypto/deflate.c:112:41: sparse:     expected struct __capability_bitlock const *var
   crypto/deflate.c:112:41: sparse:     got struct spinlock *
   crypto/deflate.c:192:41: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct __capability_bitlock const *var @@     got struct spinlock * @@
   crypto/deflate.c:192:41: sparse:     expected struct __capability_bitlock const *var
   crypto/deflate.c:192:41: sparse:     got struct spinlock *
--
   crypto/ansi_cprng.c: note: in included file (through include/linux/seqlock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/seqlock_types.h:84:1: sparse: sparse: multiple definitions for function '__assume_shared_cap'
   crypto/ansi_cprng.c: note: in included file (through include/linux/mutex.h, include/linux/seqlock.h, include/linux/mmzone.h, ...):
   include/linux/mutex_types.h:41:1: sparse:  the previous one is here
   crypto/ansi_cprng.c: note: in included file (through include/linux/rbtree.h, include/linux/mm_types.h, include/linux/mmzone.h, ...):
   include/linux/rcupdate.h:34:1: sparse: sparse: multiple definitions for function '__acquire_cap'
   crypto/ansi_cprng.c: note: in included file (through include/linux/seqlock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/seqlock_types.h:84:1: sparse:  the previous one is here
   crypto/ansi_cprng.c: note: in included file (through include/linux/rbtree.h, include/linux/mm_types.h, include/linux/mmzone.h, ...):
   include/linux/rcupdate.h:34:1: sparse: sparse: multiple definitions for function '__acquire_shared_cap'
   crypto/ansi_cprng.c: note: in included file (through include/linux/seqlock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/seqlock_types.h:84:1: sparse:  the previous one is here
   crypto/ansi_cprng.c: note: in included file (through include/linux/rbtree.h, include/linux/mm_types.h, include/linux/mmzone.h, ...):
   include/linux/rcupdate.h:34:1: sparse: sparse: multiple definitions for function '__release_cap'
   crypto/ansi_cprng.c: note: in included file (through include/linux/seqlock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/seqlock_types.h:84:1: sparse:  the previous one is here
   crypto/ansi_cprng.c: note: in included file (through include/linux/rbtree.h, include/linux/mm_types.h, include/linux/mmzone.h, ...):
   include/linux/rcupdate.h:34:1: sparse: sparse: multiple definitions for function '__release_shared_cap'
   crypto/ansi_cprng.c: note: in included file (through include/linux/seqlock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/seqlock_types.h:84:1: sparse:  the previous one is here
   crypto/ansi_cprng.c: note: in included file (through include/linux/rbtree.h, include/linux/mm_types.h, include/linux/mmzone.h, ...):
   include/linux/rcupdate.h:34:1: sparse: sparse: multiple definitions for function '__assume_cap'
   crypto/ansi_cprng.c: note: in included file (through include/linux/seqlock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/seqlock_types.h:84:1: sparse:  the previous one is here
   crypto/ansi_cprng.c: note: in included file (through include/linux/rbtree.h, include/linux/mm_types.h, include/linux/mmzone.h, ...):
   include/linux/rcupdate.h:34:1: sparse: sparse: multiple definitions for function '__assume_shared_cap'
   crypto/ansi_cprng.c: note: in included file (through include/linux/seqlock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/seqlock_types.h:84:1: sparse:  the previous one is here
   crypto/ansi_cprng.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/rwsem.h:48:1: sparse: sparse: multiple definitions for function '__acquire_cap'
   crypto/ansi_cprng.c: note: in included file (through include/linux/rbtree.h, include/linux/mm_types.h, include/linux/mmzone.h, ...):
   include/linux/rcupdate.h:34:1: sparse:  the previous one is here
   crypto/ansi_cprng.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/rwsem.h:48:1: sparse: sparse: multiple definitions for function '__acquire_shared_cap'
   crypto/ansi_cprng.c: note: in included file (through include/linux/rbtree.h, include/linux/mm_types.h, include/linux/mmzone.h, ...):
   include/linux/rcupdate.h:34:1: sparse:  the previous one is here
   crypto/ansi_cprng.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/rwsem.h:48:1: sparse: sparse: multiple definitions for function '__release_cap'
   crypto/ansi_cprng.c: note: in included file (through include/linux/rbtree.h, include/linux/mm_types.h, include/linux/mmzone.h, ...):
   include/linux/rcupdate.h:34:1: sparse:  the previous one is here
   crypto/ansi_cprng.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/rwsem.h:48:1: sparse: sparse: multiple definitions for function '__release_shared_cap'
   crypto/ansi_cprng.c: note: in included file (through include/linux/rbtree.h, include/linux/mm_types.h, include/linux/mmzone.h, ...):
   include/linux/rcupdate.h:34:1: sparse:  the previous one is here
   crypto/ansi_cprng.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/rwsem.h:48:1: sparse: sparse: multiple definitions for function '__assume_cap'
   crypto/ansi_cprng.c: note: in included file (through include/linux/rbtree.h, include/linux/mm_types.h, include/linux/mmzone.h, ...):
   include/linux/rcupdate.h:34:1: sparse:  the previous one is here
   crypto/ansi_cprng.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/rwsem.h:48:1: sparse: sparse: multiple definitions for function '__assume_shared_cap'
   crypto/ansi_cprng.c: note: in included file (through include/linux/rbtree.h, include/linux/mm_types.h, include/linux/mmzone.h, ...):
   include/linux/rcupdate.h:34:1: sparse:  the previous one is here
   crypto/ansi_cprng.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:13:1: sparse: sparse: multiple definitions for function '__acquire_cap'
   crypto/ansi_cprng.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/rwsem.h:48:1: sparse:  the previous one is here
   crypto/ansi_cprng.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:13:1: sparse: sparse: multiple definitions for function '__acquire_shared_cap'
   crypto/ansi_cprng.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/rwsem.h:48:1: sparse:  the previous one is here
   crypto/ansi_cprng.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:13:1: sparse: sparse: multiple definitions for function '__release_cap'
   crypto/ansi_cprng.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/rwsem.h:48:1: sparse:  the previous one is here
   crypto/ansi_cprng.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:13:1: sparse: sparse: multiple definitions for function '__release_shared_cap'
   crypto/ansi_cprng.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/rwsem.h:48:1: sparse:  the previous one is here
   crypto/ansi_cprng.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:13:1: sparse: sparse: multiple definitions for function '__assume_cap'
   crypto/ansi_cprng.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/rwsem.h:48:1: sparse:  the previous one is here
   crypto/ansi_cprng.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:13:1: sparse: sparse: multiple definitions for function '__assume_shared_cap'
   crypto/ansi_cprng.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/rwsem.h:48:1: sparse:  the previous one is here
   crypto/ansi_cprng.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse: sparse: multiple definitions for function '__acquire_cap'
   crypto/ansi_cprng.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:13:1: sparse:  the previous one is here
   crypto/ansi_cprng.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse: sparse: multiple definitions for function '__acquire_shared_cap'
   crypto/ansi_cprng.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:13:1: sparse:  the previous one is here
   crypto/ansi_cprng.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse: sparse: multiple definitions for function '__release_cap'
   crypto/ansi_cprng.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:13:1: sparse:  the previous one is here
   crypto/ansi_cprng.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse: sparse: multiple definitions for function '__release_shared_cap'
   crypto/ansi_cprng.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:13:1: sparse:  the previous one is here
   crypto/ansi_cprng.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse: sparse: multiple definitions for function '__assume_cap'
   crypto/ansi_cprng.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:13:1: sparse:  the previous one is here
   crypto/ansi_cprng.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse: sparse: multiple definitions for function '__assume_shared_cap'
   crypto/ansi_cprng.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:13:1: sparse:  the previous one is here
>> crypto/ansi_cprng.c:324:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct srcu_struct const *var @@     got struct spinlock * @@
   crypto/ansi_cprng.c:324:9: sparse:     expected struct srcu_struct const *var
   crypto/ansi_cprng.c:324:9: sparse:     got struct spinlock *
--
   crypto/jitterentropy-kcapi.c: note: in included file (through include/linux/rbtree.h, include/linux/mm_types.h, include/linux/mmzone.h, ...):
   include/linux/rcupdate.h:34:1: sparse: sparse: multiple definitions for function '__assume_shared_cap'
   crypto/jitterentropy-kcapi.c: note: in included file (through include/linux/seqlock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/seqlock_types.h:84:1: sparse:  the previous one is here
   crypto/jitterentropy-kcapi.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/rwsem.h:48:1: sparse: sparse: multiple definitions for function '__acquire_cap'
   crypto/jitterentropy-kcapi.c: note: in included file (through include/linux/rbtree.h, include/linux/mm_types.h, include/linux/mmzone.h, ...):
   include/linux/rcupdate.h:34:1: sparse:  the previous one is here
   crypto/jitterentropy-kcapi.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/rwsem.h:48:1: sparse: sparse: multiple definitions for function '__acquire_shared_cap'
   crypto/jitterentropy-kcapi.c: note: in included file (through include/linux/rbtree.h, include/linux/mm_types.h, include/linux/mmzone.h, ...):
   include/linux/rcupdate.h:34:1: sparse:  the previous one is here
   crypto/jitterentropy-kcapi.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/rwsem.h:48:1: sparse: sparse: multiple definitions for function '__release_cap'
   crypto/jitterentropy-kcapi.c: note: in included file (through include/linux/rbtree.h, include/linux/mm_types.h, include/linux/mmzone.h, ...):
   include/linux/rcupdate.h:34:1: sparse:  the previous one is here
   crypto/jitterentropy-kcapi.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/rwsem.h:48:1: sparse: sparse: multiple definitions for function '__release_shared_cap'
   crypto/jitterentropy-kcapi.c: note: in included file (through include/linux/rbtree.h, include/linux/mm_types.h, include/linux/mmzone.h, ...):
   include/linux/rcupdate.h:34:1: sparse:  the previous one is here
   crypto/jitterentropy-kcapi.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/rwsem.h:48:1: sparse: sparse: multiple definitions for function '__assume_cap'
   crypto/jitterentropy-kcapi.c: note: in included file (through include/linux/rbtree.h, include/linux/mm_types.h, include/linux/mmzone.h, ...):
   include/linux/rcupdate.h:34:1: sparse:  the previous one is here
   crypto/jitterentropy-kcapi.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/rwsem.h:48:1: sparse: sparse: multiple definitions for function '__assume_shared_cap'
   crypto/jitterentropy-kcapi.c: note: in included file (through include/linux/rbtree.h, include/linux/mm_types.h, include/linux/mmzone.h, ...):
   include/linux/rcupdate.h:34:1: sparse:  the previous one is here
   crypto/jitterentropy-kcapi.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:13:1: sparse: sparse: multiple definitions for function '__acquire_cap'
   crypto/jitterentropy-kcapi.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/rwsem.h:48:1: sparse:  the previous one is here
   crypto/jitterentropy-kcapi.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:13:1: sparse: sparse: multiple definitions for function '__acquire_shared_cap'
   crypto/jitterentropy-kcapi.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/rwsem.h:48:1: sparse:  the previous one is here
   crypto/jitterentropy-kcapi.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:13:1: sparse: sparse: multiple definitions for function '__release_cap'
   crypto/jitterentropy-kcapi.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/rwsem.h:48:1: sparse:  the previous one is here
   crypto/jitterentropy-kcapi.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:13:1: sparse: sparse: multiple definitions for function '__release_shared_cap'
   crypto/jitterentropy-kcapi.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/rwsem.h:48:1: sparse:  the previous one is here
   crypto/jitterentropy-kcapi.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:13:1: sparse: sparse: multiple definitions for function '__assume_cap'
   crypto/jitterentropy-kcapi.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/rwsem.h:48:1: sparse:  the previous one is here
   crypto/jitterentropy-kcapi.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:13:1: sparse: sparse: multiple definitions for function '__assume_shared_cap'
   crypto/jitterentropy-kcapi.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/rwsem.h:48:1: sparse:  the previous one is here
   crypto/jitterentropy-kcapi.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse: sparse: multiple definitions for function '__acquire_cap'
   crypto/jitterentropy-kcapi.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:13:1: sparse:  the previous one is here
   crypto/jitterentropy-kcapi.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse: sparse: multiple definitions for function '__acquire_shared_cap'
   crypto/jitterentropy-kcapi.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:13:1: sparse:  the previous one is here
   crypto/jitterentropy-kcapi.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse: sparse: multiple definitions for function '__release_cap'
   crypto/jitterentropy-kcapi.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:13:1: sparse:  the previous one is here
   crypto/jitterentropy-kcapi.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse: sparse: multiple definitions for function '__release_shared_cap'
   crypto/jitterentropy-kcapi.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:13:1: sparse:  the previous one is here
   crypto/jitterentropy-kcapi.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse: sparse: multiple definitions for function '__assume_cap'
   crypto/jitterentropy-kcapi.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:13:1: sparse:  the previous one is here
   crypto/jitterentropy-kcapi.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse: sparse: multiple definitions for function '__assume_shared_cap'
   crypto/jitterentropy-kcapi.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:13:1: sparse:  the previous one is here
   crypto/jitterentropy-kcapi.c: note: in included file (through include/linux/mm.h, include/linux/scatterlist.h, include/crypto/hash.h):
   include/linux/bit_spinlock.h:19:1: sparse: sparse: multiple definitions for function '__acquire_cap'
   crypto/jitterentropy-kcapi.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse:  the previous one is here
   crypto/jitterentropy-kcapi.c: note: in included file (through include/linux/mm.h, include/linux/scatterlist.h, include/crypto/hash.h):
   include/linux/bit_spinlock.h:19:1: sparse: sparse: multiple definitions for function '__acquire_shared_cap'
   crypto/jitterentropy-kcapi.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse:  the previous one is here
   crypto/jitterentropy-kcapi.c: note: in included file (through include/linux/mm.h, include/linux/scatterlist.h, include/crypto/hash.h):
   include/linux/bit_spinlock.h:19:1: sparse: sparse: multiple definitions for function '__release_cap'
   crypto/jitterentropy-kcapi.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse:  the previous one is here
   crypto/jitterentropy-kcapi.c: note: in included file (through include/linux/mm.h, include/linux/scatterlist.h, include/crypto/hash.h):
   include/linux/bit_spinlock.h:19:1: sparse: sparse: multiple definitions for function '__release_shared_cap'
   crypto/jitterentropy-kcapi.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse:  the previous one is here
   crypto/jitterentropy-kcapi.c: note: in included file (through include/linux/mm.h, include/linux/scatterlist.h, include/crypto/hash.h):
   include/linux/bit_spinlock.h:19:1: sparse: sparse: multiple definitions for function '__assume_cap'
   crypto/jitterentropy-kcapi.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse:  the previous one is here
   crypto/jitterentropy-kcapi.c: note: in included file (through include/linux/mm.h, include/linux/scatterlist.h, include/crypto/hash.h):
   include/linux/bit_spinlock.h:19:1: sparse: sparse: multiple definitions for function '__assume_shared_cap'
   crypto/jitterentropy-kcapi.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse:  the previous one is here
>> crypto/jitterentropy-kcapi.c:229:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct __capability_bitlock const *var @@     got struct spinlock * @@
   crypto/jitterentropy-kcapi.c:229:9: sparse:     expected struct __capability_bitlock const *var
   crypto/jitterentropy-kcapi.c:229:9: sparse:     got struct spinlock *
   crypto/jitterentropy-kcapi.c:266:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct __capability_bitlock const *var @@     got struct spinlock * @@
   crypto/jitterentropy-kcapi.c:266:9: sparse:     expected struct __capability_bitlock const *var
   crypto/jitterentropy-kcapi.c:266:9: sparse:     got struct spinlock *
--
   crypto/drbg.c: note: in included file (through include/linux/rbtree.h, include/linux/mm_types.h, include/linux/mmzone.h, ...):
   include/linux/rcupdate.h:34:1: sparse: sparse: multiple definitions for function '__assume_shared_cap'
   crypto/drbg.c: note: in included file (through include/linux/seqlock.h, include/linux/mmzone.h, include/linux/gfp.h, include/linux/mm.h, ...):
   include/linux/seqlock_types.h:84:1: sparse:  the previous one is here
   crypto/drbg.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/rwsem.h:48:1: sparse: sparse: multiple definitions for function '__acquire_cap'
   crypto/drbg.c: note: in included file (through include/linux/rbtree.h, include/linux/mm_types.h, include/linux/mmzone.h, ...):
   include/linux/rcupdate.h:34:1: sparse:  the previous one is here
   crypto/drbg.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/rwsem.h:48:1: sparse: sparse: multiple definitions for function '__acquire_shared_cap'
   crypto/drbg.c: note: in included file (through include/linux/rbtree.h, include/linux/mm_types.h, include/linux/mmzone.h, ...):
   include/linux/rcupdate.h:34:1: sparse:  the previous one is here
   crypto/drbg.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/rwsem.h:48:1: sparse: sparse: multiple definitions for function '__release_cap'
   crypto/drbg.c: note: in included file (through include/linux/rbtree.h, include/linux/mm_types.h, include/linux/mmzone.h, ...):
   include/linux/rcupdate.h:34:1: sparse:  the previous one is here
   crypto/drbg.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/rwsem.h:48:1: sparse: sparse: multiple definitions for function '__release_shared_cap'
   crypto/drbg.c: note: in included file (through include/linux/rbtree.h, include/linux/mm_types.h, include/linux/mmzone.h, ...):
   include/linux/rcupdate.h:34:1: sparse:  the previous one is here
   crypto/drbg.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/rwsem.h:48:1: sparse: sparse: multiple definitions for function '__assume_cap'
   crypto/drbg.c: note: in included file (through include/linux/rbtree.h, include/linux/mm_types.h, include/linux/mmzone.h, ...):
   include/linux/rcupdate.h:34:1: sparse:  the previous one is here
   crypto/drbg.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/rwsem.h:48:1: sparse: sparse: multiple definitions for function '__assume_shared_cap'
   crypto/drbg.c: note: in included file (through include/linux/rbtree.h, include/linux/mm_types.h, include/linux/mmzone.h, ...):
   include/linux/rcupdate.h:34:1: sparse:  the previous one is here
   crypto/drbg.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:13:1: sparse: sparse: multiple definitions for function '__acquire_cap'
   crypto/drbg.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/rwsem.h:48:1: sparse:  the previous one is here
   crypto/drbg.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:13:1: sparse: sparse: multiple definitions for function '__acquire_shared_cap'
   crypto/drbg.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/rwsem.h:48:1: sparse:  the previous one is here
   crypto/drbg.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:13:1: sparse: sparse: multiple definitions for function '__release_cap'
   crypto/drbg.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/rwsem.h:48:1: sparse:  the previous one is here
   crypto/drbg.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:13:1: sparse: sparse: multiple definitions for function '__release_shared_cap'
   crypto/drbg.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/rwsem.h:48:1: sparse:  the previous one is here
   crypto/drbg.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:13:1: sparse: sparse: multiple definitions for function '__assume_cap'
   crypto/drbg.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/rwsem.h:48:1: sparse:  the previous one is here
   crypto/drbg.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:13:1: sparse: sparse: multiple definitions for function '__assume_shared_cap'
   crypto/drbg.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/rwsem.h:48:1: sparse:  the previous one is here
   crypto/drbg.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse: sparse: multiple definitions for function '__acquire_cap'
   crypto/drbg.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:13:1: sparse:  the previous one is here
   crypto/drbg.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse: sparse: multiple definitions for function '__acquire_shared_cap'
   crypto/drbg.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:13:1: sparse:  the previous one is here
   crypto/drbg.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse: sparse: multiple definitions for function '__release_cap'
   crypto/drbg.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:13:1: sparse:  the previous one is here
   crypto/drbg.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse: sparse: multiple definitions for function '__release_shared_cap'
   crypto/drbg.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:13:1: sparse:  the previous one is here
   crypto/drbg.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse: sparse: multiple definitions for function '__assume_cap'
   crypto/drbg.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:13:1: sparse:  the previous one is here
   crypto/drbg.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse: sparse: multiple definitions for function '__assume_shared_cap'
   crypto/drbg.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:13:1: sparse:  the previous one is here
   crypto/drbg.c: note: in included file (through include/linux/mm.h, include/linux/scatterlist.h, include/crypto/drbg.h):
   include/linux/bit_spinlock.h:19:1: sparse: sparse: multiple definitions for function '__acquire_cap'
   crypto/drbg.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse:  the previous one is here
   crypto/drbg.c: note: in included file (through include/linux/mm.h, include/linux/scatterlist.h, include/crypto/drbg.h):
   include/linux/bit_spinlock.h:19:1: sparse: sparse: multiple definitions for function '__acquire_shared_cap'
   crypto/drbg.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse:  the previous one is here
   crypto/drbg.c: note: in included file (through include/linux/mm.h, include/linux/scatterlist.h, include/crypto/drbg.h):
   include/linux/bit_spinlock.h:19:1: sparse: sparse: multiple definitions for function '__release_cap'
   crypto/drbg.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse:  the previous one is here
   crypto/drbg.c: note: in included file (through include/linux/mm.h, include/linux/scatterlist.h, include/crypto/drbg.h):
   include/linux/bit_spinlock.h:19:1: sparse: sparse: multiple definitions for function '__release_shared_cap'
   crypto/drbg.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse:  the previous one is here
   crypto/drbg.c: note: in included file (through include/linux/mm.h, include/linux/scatterlist.h, include/crypto/drbg.h):
   include/linux/bit_spinlock.h:19:1: sparse: sparse: multiple definitions for function '__assume_cap'
   crypto/drbg.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse:  the previous one is here
   crypto/drbg.c: note: in included file (through include/linux/mm.h, include/linux/scatterlist.h, include/crypto/drbg.h):
   include/linux/bit_spinlock.h:19:1: sparse: sparse: multiple definitions for function '__assume_shared_cap'
   crypto/drbg.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse:  the previous one is here
>> crypto/drbg.c:1919:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct __capability_bitlock const *var @@     got struct mutex * @@
   crypto/drbg.c:1919:9: sparse:     expected struct __capability_bitlock const *var
   crypto/drbg.c:1919:9: sparse:     got struct mutex *
   crypto/drbg.c:2023:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct __capability_bitlock const *var @@     got struct mutex * @@
   crypto/drbg.c:2023:9: sparse:     expected struct __capability_bitlock const *var
   crypto/drbg.c:2023:9: sparse:     got struct mutex *

vim +48 crypto/crypto_engine.c

e5e7eb023f2465 Herbert Xu     2023-08-13  30  
218d1cc1860c45 Corentin LABBE 2018-01-26  31  /**
218d1cc1860c45 Corentin LABBE 2018-01-26  32   * crypto_finalize_request - finalize one request if the request is done
218d1cc1860c45 Corentin LABBE 2018-01-26  33   * @engine: the hardware engine
218d1cc1860c45 Corentin LABBE 2018-01-26  34   * @req: the request need to be finalized
218d1cc1860c45 Corentin LABBE 2018-01-26  35   * @err: error number
218d1cc1860c45 Corentin LABBE 2018-01-26  36   */
218d1cc1860c45 Corentin LABBE 2018-01-26  37  static void crypto_finalize_request(struct crypto_engine *engine,
218d1cc1860c45 Corentin LABBE 2018-01-26  38  				    struct crypto_async_request *req, int err)
218d1cc1860c45 Corentin LABBE 2018-01-26  39  {
218d1cc1860c45 Corentin LABBE 2018-01-26  40  	unsigned long flags;
218d1cc1860c45 Corentin LABBE 2018-01-26  41  
6a89f492f8e509 Iuliana Prodan 2020-04-28  42  	/*
6a89f492f8e509 Iuliana Prodan 2020-04-28  43  	 * If hardware cannot enqueue more requests
6a89f492f8e509 Iuliana Prodan 2020-04-28  44  	 * and retry mechanism is not supported
6a89f492f8e509 Iuliana Prodan 2020-04-28  45  	 * make sure we are completing the current request
6a89f492f8e509 Iuliana Prodan 2020-04-28  46  	 */
6a89f492f8e509 Iuliana Prodan 2020-04-28  47  	if (!engine->retry_support) {
218d1cc1860c45 Corentin LABBE 2018-01-26 @48  		spin_lock_irqsave(&engine->queue_lock, flags);
6a89f492f8e509 Iuliana Prodan 2020-04-28  49  		if (engine->cur_req == req) {
6a89f492f8e509 Iuliana Prodan 2020-04-28  50  			engine->cur_req = NULL;
6a89f492f8e509 Iuliana Prodan 2020-04-28  51  		}
218d1cc1860c45 Corentin LABBE 2018-01-26  52  		spin_unlock_irqrestore(&engine->queue_lock, flags);
6a89f492f8e509 Iuliana Prodan 2020-04-28  53  	}
218d1cc1860c45 Corentin LABBE 2018-01-26  54  
4058cf08945c18 Corentin Labbe 2022-02-21  55  	lockdep_assert_in_softirq();
6909823d47c17c Herbert Xu     2023-01-31  56  	crypto_request_complete(req, err);
218d1cc1860c45 Corentin LABBE 2018-01-26  57  
218d1cc1860c45 Corentin LABBE 2018-01-26  58  	kthread_queue_work(engine->kworker, &engine->pump_requests);
218d1cc1860c45 Corentin LABBE 2018-01-26  59  }
218d1cc1860c45 Corentin LABBE 2018-01-26  60  

:::::: The code at line 48 was first introduced by commit
:::::: 218d1cc1860c45b77f6814b44f6f0ffb9e40a82f crypto: engine - Permit to enqueue all async requests

:::::: TO: Corentin LABBE <clabbe.montjoie@gmail.com>
:::::: CC: Herbert Xu <herbert@gondor.apana.org.au>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
