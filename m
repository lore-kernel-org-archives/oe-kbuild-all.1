Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FEE230F529
	for <oe-kbuild-all@lists.linux.dev>; Tue, 16 Sep 2025 16:28:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758040110; cv=none; b=bnvo27lzILg8DfBhLbDgCE/nj5wVEMUbOMZYYbNeSBvUKuGWcT8Xgq0Gr9DSYx/7Ls6i30WoLuodX+wCw8CZvNKeDnqLB62doJko5TdYrstciJ4WZCHpi038GtXszmNQ1/yUDo1ubLz3Smre02NEqEfs4pGTJHMh3lzlYH5Oeas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758040110; c=relaxed/simple;
	bh=gSPT2rgTaYBv+HzdTfihacv7cx731FCRxqiUUcPms7Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Gm8rAROI5y+F/yzR+iGzZwcXyCRWAkmQ19nrA6SSwCv+/zxhwqJfx+BcLizykgBxfK0gz06X6Aba5VYn5XWoWcvFIGkGimUCA6U2c3IA2RUKbR8jSC5pjgDtS9Jt/H3totgMD9cP0WeDY6FC/HIcHA6BK7IRuc1IwLOhNT/Vyo4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lRfLXl7t; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lRfLXl7t"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758040107; x=1789576107;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gSPT2rgTaYBv+HzdTfihacv7cx731FCRxqiUUcPms7Q=;
  b=lRfLXl7tsre9dFNiSYSzvX/BG9DZOXYH1or1rV1q8x0mtNI5Ls9/2TF0
   x8mUfojtC+pUjS7/1qcPNmfAoKPPDpE6uFoyLcfKP79aE8YKTYvYVI4iZ
   BF84c1A5f+NOOm68eqTBGQa5g8phYOZx/fZcXgTTYXC+1pTlzHfFC4TUp
   P3TzDYu7HxqvI/tBskZJTmnCNm/hKw+HR5oL8IojTmJCRWLyonZXrvQ3W
   A+HERx5uS5RXeEhZplRilC4aSpLwXuD04cfOJmJ4cARPiaiWzCK9Lf1n9
   F3+rd6L7pExzcEixwGF+sXKXjuStbRs+vDSG+uQxFKAX69VA9MWXpWSMA
   g==;
X-CSE-ConnectionGUID: CGylD6DFSOOcqp12zXjXaA==
X-CSE-MsgGUID: cbD1tmNkQt6hjN1me9fbMQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="60274525"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="60274525"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2025 09:28:26 -0700
X-CSE-ConnectionGUID: uIu76Z+NSJ6msIO+EuBluA==
X-CSE-MsgGUID: 0o7blQuySvuKhixj1v+TJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,269,1751266800"; 
   d="scan'208";a="174918905"
Received: from lkp-server01.sh.intel.com (HELO 84a20bd60769) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 16 Sep 2025 09:28:24 -0700
Received: from kbuild by 84a20bd60769 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uyYXV-0000V9-2n;
	Tue, 16 Sep 2025 16:28:21 +0000
Date: Wed, 17 Sep 2025 00:27:30 +0800
From: kernel test robot <lkp@intel.com>
To: elver@google.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [melver:cap-analysis/dev 35/36] crypto/scompress.c:236:46: sparse:
 sparse: incorrect type in argument 1 (different base types)
Message-ID: <202509170023.v98xAshX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/melver/linux.git cap-analysis/dev
head:   219a75ef543244c4335b6c050df8426ac8e15845
commit: 3f8865abd1b95660d7b300653619af698aafd287 [35/36] crypto: Enable capability analysis
config: hexagon-randconfig-r121-20250916 (https://download.01.org/0day-ci/archive/20250917/202509170023.v98xAshX-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 65ad21d730d25789454d18e811f8ff5db79cb5d4)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250917/202509170023.v98xAshX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509170023.v98xAshX-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
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
   crypto/scompress.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:22:1: sparse: sparse: multiple definitions for function '__acquire_cap'
   include/linux/local_lock_internal.h:13:1: sparse:  the previous one is here
   include/linux/local_lock_internal.h:22:1: sparse: sparse: multiple definitions for function '__acquire_shared_cap'
   include/linux/local_lock_internal.h:13:1: sparse:  the previous one is here
   include/linux/local_lock_internal.h:22:1: sparse: sparse: multiple definitions for function '__try_acquire_cap'
   include/linux/local_lock_internal.h:13:1: sparse:  the previous one is here
   include/linux/local_lock_internal.h:22:1: sparse: sparse: multiple definitions for function '__try_acquire_shared_cap'
   include/linux/local_lock_internal.h:13:1: sparse:  the previous one is here
   include/linux/local_lock_internal.h:22:1: sparse: sparse: multiple definitions for function '__release_cap'
   include/linux/local_lock_internal.h:13:1: sparse:  the previous one is here
   include/linux/local_lock_internal.h:22:1: sparse: sparse: multiple definitions for function '__release_shared_cap'
   include/linux/local_lock_internal.h:13:1: sparse:  the previous one is here
   include/linux/local_lock_internal.h:22:1: sparse: sparse: multiple definitions for function '__assume_cap'
   include/linux/local_lock_internal.h:13:1: sparse:  the previous one is here
   include/linux/local_lock_internal.h:22:1: sparse: sparse: multiple definitions for function '__assume_shared_cap'
   include/linux/local_lock_internal.h:13:1: sparse:  the previous one is here
   include/linux/local_lock_internal.h:322:40: sparse: sparse: multiple definitions for function '__this_cpu_local_lock'
   include/linux/local_lock_internal.h:316:37: sparse:  the previous one is here
   crypto/scompress.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse: sparse: multiple definitions for function '__acquire_cap'
   crypto/scompress.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:22:1: sparse:  the previous one is here
   crypto/scompress.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse: sparse: multiple definitions for function '__acquire_shared_cap'
   crypto/scompress.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:22:1: sparse:  the previous one is here
   crypto/scompress.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse: sparse: multiple definitions for function '__try_acquire_cap'
   crypto/scompress.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:22:1: sparse:  the previous one is here
   crypto/scompress.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse: sparse: multiple definitions for function '__try_acquire_shared_cap'
   crypto/scompress.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:22:1: sparse:  the previous one is here
   crypto/scompress.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse: sparse: multiple definitions for function '__release_cap'
   crypto/scompress.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:22:1: sparse:  the previous one is here
   crypto/scompress.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse: sparse: multiple definitions for function '__release_shared_cap'
   crypto/scompress.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:22:1: sparse:  the previous one is here
   crypto/scompress.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse: sparse: multiple definitions for function '__assume_cap'
   crypto/scompress.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:22:1: sparse:  the previous one is here
   crypto/scompress.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse: sparse: multiple definitions for function '__assume_shared_cap'
   crypto/scompress.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:22:1: sparse:  the previous one is here
   crypto/scompress.c: note: in included file (through include/linux/mm.h, include/linux/scatterlist.h, include/crypto/acompress.h, ...):
   include/linux/bit_spinlock.h:19:1: sparse: sparse: multiple definitions for function '__acquire_cap'
   crypto/scompress.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse:  the previous one is here
   crypto/scompress.c: note: in included file (through include/linux/mm.h, include/linux/scatterlist.h, include/crypto/acompress.h, ...):
   include/linux/bit_spinlock.h:19:1: sparse: sparse: multiple definitions for function '__acquire_shared_cap'
   crypto/scompress.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse:  the previous one is here
   crypto/scompress.c: note: in included file (through include/linux/mm.h, include/linux/scatterlist.h, include/crypto/acompress.h, ...):
   include/linux/bit_spinlock.h:19:1: sparse: sparse: multiple definitions for function '__try_acquire_cap'
   crypto/scompress.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse:  the previous one is here
   crypto/scompress.c: note: in included file (through include/linux/mm.h, include/linux/scatterlist.h, include/crypto/acompress.h, ...):
   include/linux/bit_spinlock.h:19:1: sparse: sparse: multiple definitions for function '__try_acquire_shared_cap'
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
>> crypto/scompress.c:236:46: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct __capability_bitlock const *var @@     got struct spinlock * @@
   crypto/scompress.c:236:46: sparse:     expected struct __capability_bitlock const *var
   crypto/scompress.c:236:46: sparse:     got struct spinlock *
   crypto/scompress.c:239:49: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct __capability_bitlock const *var @@     got struct spinlock * @@
   crypto/scompress.c:239:49: sparse:     expected struct __capability_bitlock const *var
   crypto/scompress.c:239:49: sparse:     got struct spinlock *
--
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
   crypto/geniv.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:22:1: sparse: sparse: multiple definitions for function '__acquire_cap'
   include/linux/local_lock_internal.h:13:1: sparse:  the previous one is here
   include/linux/local_lock_internal.h:22:1: sparse: sparse: multiple definitions for function '__acquire_shared_cap'
   include/linux/local_lock_internal.h:13:1: sparse:  the previous one is here
   include/linux/local_lock_internal.h:22:1: sparse: sparse: multiple definitions for function '__try_acquire_cap'
   include/linux/local_lock_internal.h:13:1: sparse:  the previous one is here
   include/linux/local_lock_internal.h:22:1: sparse: sparse: multiple definitions for function '__try_acquire_shared_cap'
   include/linux/local_lock_internal.h:13:1: sparse:  the previous one is here
   include/linux/local_lock_internal.h:22:1: sparse: sparse: multiple definitions for function '__release_cap'
   include/linux/local_lock_internal.h:13:1: sparse:  the previous one is here
   include/linux/local_lock_internal.h:22:1: sparse: sparse: multiple definitions for function '__release_shared_cap'
   include/linux/local_lock_internal.h:13:1: sparse:  the previous one is here
   include/linux/local_lock_internal.h:22:1: sparse: sparse: multiple definitions for function '__assume_cap'
   include/linux/local_lock_internal.h:13:1: sparse:  the previous one is here
   include/linux/local_lock_internal.h:22:1: sparse: sparse: multiple definitions for function '__assume_shared_cap'
   include/linux/local_lock_internal.h:13:1: sparse:  the previous one is here
   include/linux/local_lock_internal.h:322:40: sparse: sparse: multiple definitions for function '__this_cpu_local_lock'
   include/linux/local_lock_internal.h:316:37: sparse:  the previous one is here
   crypto/geniv.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse: sparse: multiple definitions for function '__acquire_cap'
   crypto/geniv.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:22:1: sparse:  the previous one is here
   crypto/geniv.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse: sparse: multiple definitions for function '__acquire_shared_cap'
   crypto/geniv.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:22:1: sparse:  the previous one is here
   crypto/geniv.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse: sparse: multiple definitions for function '__try_acquire_cap'
   crypto/geniv.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:22:1: sparse:  the previous one is here
   crypto/geniv.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse: sparse: multiple definitions for function '__try_acquire_shared_cap'
   crypto/geniv.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:22:1: sparse:  the previous one is here
   crypto/geniv.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse: sparse: multiple definitions for function '__release_cap'
   crypto/geniv.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:22:1: sparse:  the previous one is here
   crypto/geniv.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse: sparse: multiple definitions for function '__release_shared_cap'
   crypto/geniv.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:22:1: sparse:  the previous one is here
   crypto/geniv.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse: sparse: multiple definitions for function '__assume_cap'
   crypto/geniv.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:22:1: sparse:  the previous one is here
   crypto/geniv.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse: sparse: multiple definitions for function '__assume_shared_cap'
   crypto/geniv.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:22:1: sparse:  the previous one is here
   crypto/geniv.c: note: in included file (through include/linux/list_bl.h, include/linux/rculist_bl.h, include/linux/dcache.h, ...):
   include/linux/bit_spinlock.h:19:1: sparse: sparse: multiple definitions for function '__acquire_cap'
   crypto/geniv.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse:  the previous one is here
   crypto/geniv.c: note: in included file (through include/linux/list_bl.h, include/linux/rculist_bl.h, include/linux/dcache.h, ...):
   include/linux/bit_spinlock.h:19:1: sparse: sparse: multiple definitions for function '__acquire_shared_cap'
   crypto/geniv.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse:  the previous one is here
   crypto/geniv.c: note: in included file (through include/linux/list_bl.h, include/linux/rculist_bl.h, include/linux/dcache.h, ...):
   include/linux/bit_spinlock.h:19:1: sparse: sparse: multiple definitions for function '__try_acquire_cap'
   crypto/geniv.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse:  the previous one is here
   crypto/geniv.c: note: in included file (through include/linux/list_bl.h, include/linux/rculist_bl.h, include/linux/dcache.h, ...):
   include/linux/bit_spinlock.h:19:1: sparse: sparse: multiple definitions for function '__try_acquire_shared_cap'
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
   crypto/acompress.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:22:1: sparse: sparse: multiple definitions for function '__acquire_cap'
   include/linux/local_lock_internal.h:13:1: sparse:  the previous one is here
   include/linux/local_lock_internal.h:22:1: sparse: sparse: multiple definitions for function '__acquire_shared_cap'
   include/linux/local_lock_internal.h:13:1: sparse:  the previous one is here
   include/linux/local_lock_internal.h:22:1: sparse: sparse: multiple definitions for function '__try_acquire_cap'
   include/linux/local_lock_internal.h:13:1: sparse:  the previous one is here
   include/linux/local_lock_internal.h:22:1: sparse: sparse: multiple definitions for function '__try_acquire_shared_cap'
   include/linux/local_lock_internal.h:13:1: sparse:  the previous one is here
   include/linux/local_lock_internal.h:22:1: sparse: sparse: multiple definitions for function '__release_cap'
   include/linux/local_lock_internal.h:13:1: sparse:  the previous one is here
   include/linux/local_lock_internal.h:22:1: sparse: sparse: multiple definitions for function '__release_shared_cap'
   include/linux/local_lock_internal.h:13:1: sparse:  the previous one is here
   include/linux/local_lock_internal.h:22:1: sparse: sparse: multiple definitions for function '__assume_cap'
   include/linux/local_lock_internal.h:13:1: sparse:  the previous one is here
   include/linux/local_lock_internal.h:22:1: sparse: sparse: multiple definitions for function '__assume_shared_cap'
   include/linux/local_lock_internal.h:13:1: sparse:  the previous one is here
   include/linux/local_lock_internal.h:322:40: sparse: sparse: multiple definitions for function '__this_cpu_local_lock'
   include/linux/local_lock_internal.h:316:37: sparse:  the previous one is here
   crypto/acompress.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse: sparse: multiple definitions for function '__acquire_cap'
   crypto/acompress.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:22:1: sparse:  the previous one is here
   crypto/acompress.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse: sparse: multiple definitions for function '__acquire_shared_cap'
   crypto/acompress.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:22:1: sparse:  the previous one is here
   crypto/acompress.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse: sparse: multiple definitions for function '__try_acquire_cap'
   crypto/acompress.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:22:1: sparse:  the previous one is here
   crypto/acompress.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse: sparse: multiple definitions for function '__try_acquire_shared_cap'
   crypto/acompress.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:22:1: sparse:  the previous one is here
   crypto/acompress.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse: sparse: multiple definitions for function '__release_cap'
   crypto/acompress.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:22:1: sparse:  the previous one is here
   crypto/acompress.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse: sparse: multiple definitions for function '__release_shared_cap'
   crypto/acompress.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:22:1: sparse:  the previous one is here
   crypto/acompress.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse: sparse: multiple definitions for function '__assume_cap'
   crypto/acompress.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:22:1: sparse:  the previous one is here
   crypto/acompress.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse: sparse: multiple definitions for function '__assume_shared_cap'
   crypto/acompress.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:22:1: sparse:  the previous one is here
   crypto/acompress.c: note: in included file (through include/linux/mm.h, include/linux/scatterlist.h, include/crypto/acompress.h, ...):
   include/linux/bit_spinlock.h:19:1: sparse: sparse: multiple definitions for function '__acquire_cap'
   crypto/acompress.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse:  the previous one is here
   crypto/acompress.c: note: in included file (through include/linux/mm.h, include/linux/scatterlist.h, include/crypto/acompress.h, ...):
   include/linux/bit_spinlock.h:19:1: sparse: sparse: multiple definitions for function '__acquire_shared_cap'
   crypto/acompress.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse:  the previous one is here
   crypto/acompress.c: note: in included file (through include/linux/mm.h, include/linux/scatterlist.h, include/crypto/acompress.h, ...):
   include/linux/bit_spinlock.h:19:1: sparse: sparse: multiple definitions for function '__try_acquire_cap'
   crypto/acompress.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse:  the previous one is here
   crypto/acompress.c: note: in included file (through include/linux/mm.h, include/linux/scatterlist.h, include/crypto/acompress.h, ...):
   include/linux/bit_spinlock.h:19:1: sparse: sparse: multiple definitions for function '__try_acquire_shared_cap'
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
   crypto/deflate.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:22:1: sparse: sparse: multiple definitions for function '__acquire_cap'
   include/linux/local_lock_internal.h:13:1: sparse:  the previous one is here
   include/linux/local_lock_internal.h:22:1: sparse: sparse: multiple definitions for function '__acquire_shared_cap'
   include/linux/local_lock_internal.h:13:1: sparse:  the previous one is here
   include/linux/local_lock_internal.h:22:1: sparse: sparse: multiple definitions for function '__try_acquire_cap'
   include/linux/local_lock_internal.h:13:1: sparse:  the previous one is here
   include/linux/local_lock_internal.h:22:1: sparse: sparse: multiple definitions for function '__try_acquire_shared_cap'
   include/linux/local_lock_internal.h:13:1: sparse:  the previous one is here
   include/linux/local_lock_internal.h:22:1: sparse: sparse: multiple definitions for function '__release_cap'
   include/linux/local_lock_internal.h:13:1: sparse:  the previous one is here
   include/linux/local_lock_internal.h:22:1: sparse: sparse: multiple definitions for function '__release_shared_cap'
   include/linux/local_lock_internal.h:13:1: sparse:  the previous one is here
   include/linux/local_lock_internal.h:22:1: sparse: sparse: multiple definitions for function '__assume_cap'
   include/linux/local_lock_internal.h:13:1: sparse:  the previous one is here
   include/linux/local_lock_internal.h:22:1: sparse: sparse: multiple definitions for function '__assume_shared_cap'
   include/linux/local_lock_internal.h:13:1: sparse:  the previous one is here
   include/linux/local_lock_internal.h:322:40: sparse: sparse: multiple definitions for function '__this_cpu_local_lock'
   include/linux/local_lock_internal.h:316:37: sparse:  the previous one is here
   crypto/deflate.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse: sparse: multiple definitions for function '__acquire_cap'
   crypto/deflate.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:22:1: sparse:  the previous one is here
   crypto/deflate.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse: sparse: multiple definitions for function '__acquire_shared_cap'
   crypto/deflate.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:22:1: sparse:  the previous one is here
   crypto/deflate.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse: sparse: multiple definitions for function '__try_acquire_cap'
   crypto/deflate.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:22:1: sparse:  the previous one is here
   crypto/deflate.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse: sparse: multiple definitions for function '__try_acquire_shared_cap'
   crypto/deflate.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:22:1: sparse:  the previous one is here
   crypto/deflate.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse: sparse: multiple definitions for function '__release_cap'
   crypto/deflate.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:22:1: sparse:  the previous one is here
   crypto/deflate.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse: sparse: multiple definitions for function '__release_shared_cap'
   crypto/deflate.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:22:1: sparse:  the previous one is here
   crypto/deflate.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse: sparse: multiple definitions for function '__assume_cap'
   crypto/deflate.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:22:1: sparse:  the previous one is here
   crypto/deflate.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse: sparse: multiple definitions for function '__assume_shared_cap'
   crypto/deflate.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:22:1: sparse:  the previous one is here
   crypto/deflate.c: note: in included file (through include/linux/mm.h, include/linux/scatterlist.h, include/crypto/acompress.h, ...):
   include/linux/bit_spinlock.h:19:1: sparse: sparse: multiple definitions for function '__acquire_cap'
   crypto/deflate.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse:  the previous one is here
   crypto/deflate.c: note: in included file (through include/linux/mm.h, include/linux/scatterlist.h, include/crypto/acompress.h, ...):
   include/linux/bit_spinlock.h:19:1: sparse: sparse: multiple definitions for function '__acquire_shared_cap'
   crypto/deflate.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse:  the previous one is here
   crypto/deflate.c: note: in included file (through include/linux/mm.h, include/linux/scatterlist.h, include/crypto/acompress.h, ...):
   include/linux/bit_spinlock.h:19:1: sparse: sparse: multiple definitions for function '__try_acquire_cap'
   crypto/deflate.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse:  the previous one is here
   crypto/deflate.c: note: in included file (through include/linux/mm.h, include/linux/scatterlist.h, include/crypto/acompress.h, ...):
   include/linux/bit_spinlock.h:19:1: sparse: sparse: multiple definitions for function '__try_acquire_shared_cap'
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
>> crypto/deflate.c:121:13: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct __capability_bitlock const *var @@     got struct spinlock * @@
   crypto/deflate.c:121:13: sparse:     expected struct __capability_bitlock const *var
   crypto/deflate.c:121:13: sparse:     got struct spinlock *
   crypto/deflate.c:202:13: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct __capability_bitlock const *var @@     got struct spinlock * @@
   crypto/deflate.c:202:13: sparse:     expected struct __capability_bitlock const *var
   crypto/deflate.c:202:13: sparse:     got struct spinlock *
--
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
   crypto/jitterentropy-kcapi.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:22:1: sparse: sparse: multiple definitions for function '__acquire_cap'
   include/linux/local_lock_internal.h:13:1: sparse:  the previous one is here
   include/linux/local_lock_internal.h:22:1: sparse: sparse: multiple definitions for function '__acquire_shared_cap'
   include/linux/local_lock_internal.h:13:1: sparse:  the previous one is here
   include/linux/local_lock_internal.h:22:1: sparse: sparse: multiple definitions for function '__try_acquire_cap'
   include/linux/local_lock_internal.h:13:1: sparse:  the previous one is here
   include/linux/local_lock_internal.h:22:1: sparse: sparse: multiple definitions for function '__try_acquire_shared_cap'
   include/linux/local_lock_internal.h:13:1: sparse:  the previous one is here
   include/linux/local_lock_internal.h:22:1: sparse: sparse: multiple definitions for function '__release_cap'
   include/linux/local_lock_internal.h:13:1: sparse:  the previous one is here
   include/linux/local_lock_internal.h:22:1: sparse: sparse: multiple definitions for function '__release_shared_cap'
   include/linux/local_lock_internal.h:13:1: sparse:  the previous one is here
   include/linux/local_lock_internal.h:22:1: sparse: sparse: multiple definitions for function '__assume_cap'
   include/linux/local_lock_internal.h:13:1: sparse:  the previous one is here
   include/linux/local_lock_internal.h:22:1: sparse: sparse: multiple definitions for function '__assume_shared_cap'
   include/linux/local_lock_internal.h:13:1: sparse:  the previous one is here
   include/linux/local_lock_internal.h:322:40: sparse: sparse: multiple definitions for function '__this_cpu_local_lock'
   include/linux/local_lock_internal.h:316:37: sparse:  the previous one is here
   crypto/jitterentropy-kcapi.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse: sparse: multiple definitions for function '__acquire_cap'
   crypto/jitterentropy-kcapi.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:22:1: sparse:  the previous one is here
   crypto/jitterentropy-kcapi.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse: sparse: multiple definitions for function '__acquire_shared_cap'
   crypto/jitterentropy-kcapi.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:22:1: sparse:  the previous one is here
   crypto/jitterentropy-kcapi.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse: sparse: multiple definitions for function '__try_acquire_cap'
   crypto/jitterentropy-kcapi.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:22:1: sparse:  the previous one is here
   crypto/jitterentropy-kcapi.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse: sparse: multiple definitions for function '__try_acquire_shared_cap'
   crypto/jitterentropy-kcapi.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:22:1: sparse:  the previous one is here
   crypto/jitterentropy-kcapi.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse: sparse: multiple definitions for function '__release_cap'
   crypto/jitterentropy-kcapi.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:22:1: sparse:  the previous one is here
   crypto/jitterentropy-kcapi.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse: sparse: multiple definitions for function '__release_shared_cap'
   crypto/jitterentropy-kcapi.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:22:1: sparse:  the previous one is here
   crypto/jitterentropy-kcapi.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse: sparse: multiple definitions for function '__assume_cap'
   crypto/jitterentropy-kcapi.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:22:1: sparse:  the previous one is here
   crypto/jitterentropy-kcapi.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse: sparse: multiple definitions for function '__assume_shared_cap'
   crypto/jitterentropy-kcapi.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:22:1: sparse:  the previous one is here
   crypto/jitterentropy-kcapi.c: note: in included file (through include/linux/mm.h, include/linux/scatterlist.h, include/crypto/hash.h):
   include/linux/bit_spinlock.h:19:1: sparse: sparse: multiple definitions for function '__acquire_cap'
   crypto/jitterentropy-kcapi.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse:  the previous one is here
   crypto/jitterentropy-kcapi.c: note: in included file (through include/linux/mm.h, include/linux/scatterlist.h, include/crypto/hash.h):
   include/linux/bit_spinlock.h:19:1: sparse: sparse: multiple definitions for function '__acquire_shared_cap'
   crypto/jitterentropy-kcapi.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse:  the previous one is here
   crypto/jitterentropy-kcapi.c: note: in included file (through include/linux/mm.h, include/linux/scatterlist.h, include/crypto/hash.h):
   include/linux/bit_spinlock.h:19:1: sparse: sparse: multiple definitions for function '__try_acquire_cap'
   crypto/jitterentropy-kcapi.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse:  the previous one is here
   crypto/jitterentropy-kcapi.c: note: in included file (through include/linux/mm.h, include/linux/scatterlist.h, include/crypto/hash.h):
   include/linux/bit_spinlock.h:19:1: sparse: sparse: multiple definitions for function '__try_acquire_shared_cap'
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
>> crypto/jitterentropy-kcapi.c:230:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct __capability_bitlock const *var @@     got struct spinlock * @@
   crypto/jitterentropy-kcapi.c:230:9: sparse:     expected struct __capability_bitlock const *var
   crypto/jitterentropy-kcapi.c:230:9: sparse:     got struct spinlock *
   crypto/jitterentropy-kcapi.c:267:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct __capability_bitlock const *var @@     got struct spinlock * @@
   crypto/jitterentropy-kcapi.c:267:9: sparse:     expected struct __capability_bitlock const *var
   crypto/jitterentropy-kcapi.c:267:9: sparse:     got struct spinlock *
--
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
   crypto/drbg.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:22:1: sparse: sparse: multiple definitions for function '__acquire_cap'
   include/linux/local_lock_internal.h:13:1: sparse:  the previous one is here
   include/linux/local_lock_internal.h:22:1: sparse: sparse: multiple definitions for function '__acquire_shared_cap'
   include/linux/local_lock_internal.h:13:1: sparse:  the previous one is here
   include/linux/local_lock_internal.h:22:1: sparse: sparse: multiple definitions for function '__try_acquire_cap'
   include/linux/local_lock_internal.h:13:1: sparse:  the previous one is here
   include/linux/local_lock_internal.h:22:1: sparse: sparse: multiple definitions for function '__try_acquire_shared_cap'
   include/linux/local_lock_internal.h:13:1: sparse:  the previous one is here
   include/linux/local_lock_internal.h:22:1: sparse: sparse: multiple definitions for function '__release_cap'
   include/linux/local_lock_internal.h:13:1: sparse:  the previous one is here
   include/linux/local_lock_internal.h:22:1: sparse: sparse: multiple definitions for function '__release_shared_cap'
   include/linux/local_lock_internal.h:13:1: sparse:  the previous one is here
   include/linux/local_lock_internal.h:22:1: sparse: sparse: multiple definitions for function '__assume_cap'
   include/linux/local_lock_internal.h:13:1: sparse:  the previous one is here
   include/linux/local_lock_internal.h:22:1: sparse: sparse: multiple definitions for function '__assume_shared_cap'
   include/linux/local_lock_internal.h:13:1: sparse:  the previous one is here
   include/linux/local_lock_internal.h:322:40: sparse: sparse: multiple definitions for function '__this_cpu_local_lock'
   include/linux/local_lock_internal.h:316:37: sparse:  the previous one is here
   crypto/drbg.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse: sparse: multiple definitions for function '__acquire_cap'
   crypto/drbg.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:22:1: sparse:  the previous one is here
   crypto/drbg.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse: sparse: multiple definitions for function '__acquire_shared_cap'
   crypto/drbg.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:22:1: sparse:  the previous one is here
   crypto/drbg.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse: sparse: multiple definitions for function '__try_acquire_cap'
   crypto/drbg.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:22:1: sparse:  the previous one is here
   crypto/drbg.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse: sparse: multiple definitions for function '__try_acquire_shared_cap'
   crypto/drbg.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:22:1: sparse:  the previous one is here
   crypto/drbg.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse: sparse: multiple definitions for function '__release_cap'
   crypto/drbg.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:22:1: sparse:  the previous one is here
   crypto/drbg.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse: sparse: multiple definitions for function '__release_shared_cap'
   crypto/drbg.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:22:1: sparse:  the previous one is here
   crypto/drbg.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse: sparse: multiple definitions for function '__assume_cap'
   crypto/drbg.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:22:1: sparse:  the previous one is here
   crypto/drbg.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse: sparse: multiple definitions for function '__assume_shared_cap'
   crypto/drbg.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:22:1: sparse:  the previous one is here
   crypto/drbg.c: note: in included file (through include/linux/mm.h, include/linux/scatterlist.h, include/crypto/drbg.h):
   include/linux/bit_spinlock.h:19:1: sparse: sparse: multiple definitions for function '__acquire_cap'
   crypto/drbg.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse:  the previous one is here
   crypto/drbg.c: note: in included file (through include/linux/mm.h, include/linux/scatterlist.h, include/crypto/drbg.h):
   include/linux/bit_spinlock.h:19:1: sparse: sparse: multiple definitions for function '__acquire_shared_cap'
   crypto/drbg.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse:  the previous one is here
   crypto/drbg.c: note: in included file (through include/linux/mm.h, include/linux/scatterlist.h, include/crypto/drbg.h):
   include/linux/bit_spinlock.h:19:1: sparse: sparse: multiple definitions for function '__try_acquire_cap'
   crypto/drbg.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:24:1: sparse:  the previous one is here
   crypto/drbg.c: note: in included file (through include/linux/mm.h, include/linux/scatterlist.h, include/crypto/drbg.h):
   include/linux/bit_spinlock.h:19:1: sparse: sparse: multiple definitions for function '__try_acquire_shared_cap'
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

vim +236 crypto/scompress.c

   169	
   170	static int scomp_acomp_comp_decomp(struct acomp_req *req, int dir)
   171	{
   172		struct crypto_acomp *tfm = crypto_acomp_reqtfm(req);
   173		struct crypto_scomp **tfm_ctx = acomp_tfm_ctx(tfm);
   174		bool src_isvirt = acomp_request_src_isvirt(req);
   175		bool dst_isvirt = acomp_request_dst_isvirt(req);
   176		struct crypto_scomp *scomp = *tfm_ctx;
   177		unsigned int slen = req->slen;
   178		unsigned int dlen = req->dlen;
   179		struct page *spage, *dpage;
   180		unsigned int n;
   181		const u8 *src;
   182		size_t soff;
   183		size_t doff;
   184		u8 *dst;
   185		int ret;
   186	
   187		if (!req->src || !slen)
   188			return -EINVAL;
   189	
   190		if (!req->dst || !dlen)
   191			return -EINVAL;
   192	
   193		if (dst_isvirt)
   194			dst = req->dvirt;
   195		else {
   196			if (dlen <= req->dst->length) {
   197				dpage = sg_page(req->dst);
   198				doff = req->dst->offset;
   199			} else
   200				return -ENOSYS;
   201	
   202			dpage = nth_page(dpage, doff / PAGE_SIZE);
   203			doff = offset_in_page(doff);
   204	
   205			n = (dlen - 1) / PAGE_SIZE;
   206			n += (offset_in_page(dlen - 1) + doff) / PAGE_SIZE;
   207			if (PageHighMem(dpage + n) &&
   208			    size_add(doff, dlen) > PAGE_SIZE)
   209				return -ENOSYS;
   210			dst = kmap_local_page(dpage) + doff;
   211		}
   212	
   213		if (src_isvirt)
   214			src = req->svirt;
   215		else {
   216			src = NULL;
   217			do {
   218				if (slen <= req->src->length) {
   219					spage = sg_page(req->src);
   220					soff = req->src->offset;
   221				} else
   222					break;
   223	
   224				spage = nth_page(spage, soff / PAGE_SIZE);
   225				soff = offset_in_page(soff);
   226	
   227				n = (slen - 1) / PAGE_SIZE;
   228				n += (offset_in_page(slen - 1) + soff) / PAGE_SIZE;
   229				if (PageHighMem(nth_page(spage, n)) &&
   230				    size_add(soff, slen) > PAGE_SIZE)
   231					break;
   232				src = kmap_local_page(spage) + soff;
   233			} while (0);
   234		}
   235	
 > 236		struct crypto_acomp_stream *stream = crypto_acomp_lock_stream_bh(&crypto_scomp_alg(scomp)->streams);
   237	
   238		if (!src_isvirt && !src) {
   239			struct scomp_scratch *scratch = scomp_lock_scratch();
   240			const u8 *src = scratch->src;
   241	
   242			memcpy_from_sglist(scratch->src, req->src, 0, slen);
   243	
   244			if (dir)
   245				ret = crypto_scomp_compress(scomp, src, slen,
   246							    dst, &dlen, stream->ctx);
   247			else
   248				ret = crypto_scomp_decompress(scomp, src, slen,
   249							      dst, &dlen, stream->ctx);
   250	
   251			scomp_unlock_scratch(scratch);
   252		} else if (dir)
   253			ret = crypto_scomp_compress(scomp, src, slen,
   254						    dst, &dlen, stream->ctx);
   255		else
   256			ret = crypto_scomp_decompress(scomp, src, slen,
   257						      dst, &dlen, stream->ctx);
   258	
   259		crypto_acomp_unlock_stream_bh(stream);
   260	
   261		req->dlen = dlen;
   262	
   263		if (!src_isvirt && src)
   264			kunmap_local(src);
   265		if (!dst_isvirt) {
   266			kunmap_local(dst);
   267			dlen += doff;
   268			for (;;) {
   269				flush_dcache_page(dpage);
   270				if (dlen <= PAGE_SIZE)
   271					break;
   272				dlen -= PAGE_SIZE;
   273				dpage = nth_page(dpage, 1);
   274			}
   275		}
   276	
   277		return ret;
   278	}
   279	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
