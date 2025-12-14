Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCE992A1BF
	for <oe-kbuild-all@lists.linux.dev>; Sun, 14 Dec 2025 13:36:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765719375; cv=none; b=aVeGGEVNI3ylR6jzcFJ9rY5Cp9HwvZv2XVZqd0cX89tMjCFRUVvsUiWBtgR8t1AF26UIb1Xo7YHoDrHNbFUyWkz6utCF2tgGMqjkHZ0zb7XvC9cWJjFqG1Gm82CUQkAXM191eTz0k2PUpWRQWGf608mEJBug4AI3qYHDFMU++WY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765719375; c=relaxed/simple;
	bh=RGg7vgXaSa6uZqfGgl1GowyhiaUPViqqfUvtwQSWowo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kQrKbm1Z9lDpTJHF3SrVVvJyoInDT8145nAFhaoEgZhAiLH1wFaMFx4Sz/tNZjbAkR0mb4mojfxCexlTCAhaIDSPkfm7dLBCQXyDW4pqsNgmp30Cndzh4RIJ9W8wPE1qI2fpIeN/IUPh9NogeNYTFkN2VXwNnBybQPineOu0m2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bQ206PGR; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bQ206PGR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765719374; x=1797255374;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RGg7vgXaSa6uZqfGgl1GowyhiaUPViqqfUvtwQSWowo=;
  b=bQ206PGRy6ZwWMP1c3DCH12Em71Mis5HlMIyzgBrXtd2+rSrhJ4jSWr8
   TIE6aN1VDfrXSaXmn0PDTG1PkLUdlIxjZAWHSFJjPGmNBKrZNDll0G4B8
   JvVLJPZWPHs9n0E4EPoS1/dHldOz9hCBpBl0LJIrSMyzoRcmCJerpSs6R
   RjpzyGSzZ+6H0TZDOzzJI5PZhLHw5Mi5hl5Q6wWl8zq+oLtQHEbJ/rX2F
   nEBkUJMc9M3z6plsoYiyaRqxSs/s2tSJY1fVuJ6EAUb+1UgLVMtMJW/1m
   VrfZIjfpgrsZVpSSetFhKPJWc9GaMkek2XX9pdU5XJegGdctjcL1xckp8
   A==;
X-CSE-ConnectionGUID: TCqFFyBzTOOP99DfYLHvug==
X-CSE-MsgGUID: RDvwQjDtTyWJplzcvpM7tA==
X-IronPort-AV: E=McAfee;i="6800,10657,11642"; a="78348017"
X-IronPort-AV: E=Sophos;i="6.21,148,1763452800"; 
   d="scan'208";a="78348017"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2025 05:36:12 -0800
X-CSE-ConnectionGUID: N+4HQ85+RvKrJgkb9vJM+g==
X-CSE-MsgGUID: QTqwH9tjS/qXxogVjY/1Sw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,148,1763452800"; 
   d="scan'208";a="202608533"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 14 Dec 2025 05:36:10 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUmGe-00000000933-2xOp;
	Sun, 14 Dec 2025 13:36:08 +0000
Date: Sun, 14 Dec 2025 21:35:29 +0800
From: kernel test robot <lkp@intel.com>
To: Uros Bizjak <ubizjak@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, Ingo Molnar <mingo@kernel.org>
Subject: [mingo-tip:WIP.x86/cpu 15/15] mm/slub.c:4385:9: error: expected ')'
Message-ID: <202512142118.3K6CZE1O-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mingo/tip.git WIP.x86/cpu
head:   ff1735ccc470808033db2520554f2ca090a12393
commit: ff1735ccc470808033db2520554f2ca090a12393 [15/15] x86/percpu: Remove !CONFIG_X86_CX8 methods
config: i386-randconfig-141-20251214 (https://download.01.org/0day-ci/archive/20251214/202512142118.3K6CZE1O-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251214/202512142118.3K6CZE1O-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512142118.3K6CZE1O-lkp@intel.com/

All errors (new ones prefixed by >>):

>> mm/slub.c:4385:9: error: expected ')'
    4385 |         return this_cpu_try_cmpxchg_freelist(s->cpu_slab->freelist_tid,
         |                ^
   mm/slab.h:31:39: note: expanded from macro 'this_cpu_try_cmpxchg_freelist'
      31 | #define this_cpu_try_cmpxchg_freelist   this_cpu_try_cmpxchg64
         |                                         ^
   arch/x86/include/asm/percpu.h:378:50: note: expanded from macro 'this_cpu_try_cmpxchg64'
     378 | #define this_cpu_try_cmpxchg64(pcp, ovalp, nval)        percpu_try_cmpxchg64_op(8, volatile, pcp, ovalp, nval)
         |                                                         ^
   arch/x86/include/asm/percpu.h:365:3: note: expanded from macro 'percpu_try_cmpxchg64_op'
     365 |                 CC_SET(z)                                               \
         |                 ^
   1 error generated.


vim +4385 mm/slub.c

0b303fb402862d Vlastimil Babka 2021-05-08  4376  
6801be4f2653e5 Peter Zijlstra  2023-05-31  4377  static inline bool
6801be4f2653e5 Peter Zijlstra  2023-05-31  4378  __update_cpu_freelist_fast(struct kmem_cache *s,
6801be4f2653e5 Peter Zijlstra  2023-05-31  4379  			   void *freelist_old, void *freelist_new,
6801be4f2653e5 Peter Zijlstra  2023-05-31  4380  			   unsigned long tid)
6801be4f2653e5 Peter Zijlstra  2023-05-31  4381  {
b244358e9a1cd6 Vlastimil Babka 2025-11-07  4382  	struct freelist_tid old = { .freelist = freelist_old, .tid = tid };
b244358e9a1cd6 Vlastimil Babka 2025-11-07  4383  	struct freelist_tid new = { .freelist = freelist_new, .tid = next_tid(tid) };
6801be4f2653e5 Peter Zijlstra  2023-05-31  4384  
b244358e9a1cd6 Vlastimil Babka 2025-11-07 @4385  	return this_cpu_try_cmpxchg_freelist(s->cpu_slab->freelist_tid,
b244358e9a1cd6 Vlastimil Babka 2025-11-07  4386  					     &old.freelist_tid, new.freelist_tid);
6801be4f2653e5 Peter Zijlstra  2023-05-31  4387  }
6801be4f2653e5 Peter Zijlstra  2023-05-31  4388  

:::::: The code at line 4385 was first introduced by commit
:::::: b244358e9a1cd61276b8785b1b4275f1f45a1dc2 slab: separate struct freelist_tid from kmem_cache_cpu

:::::: TO: Vlastimil Babka <vbabka@suse.cz>
:::::: CC: Vlastimil Babka <vbabka@suse.cz>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
