Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7166880B
	for <oe-kbuild-all@lists.linux.dev>; Sat, 16 Nov 2024 17:15:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731777355; cv=none; b=KkJBcGkNMFM22fhv6BCfssWysFccDwxYnZyikkjlU/XJYsEXgPnrfRTZ9WcioVMKaS6NEHsE1kHyinHv/V3wOP/BwZ/dnGzaxItLbh6YhaIA0hmmV9Y0GTW4i51H/d9nCowgzyCrpIua1V9xZj7TWYUyiL1vswcBu43oRyu4MeE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731777355; c=relaxed/simple;
	bh=viDoSnJZ3WTLKzgW9i7RBo6+D+PYHc+wr4W1PAnr8ck=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SsruhXUEl15Ucocy3BCmL7t9a0OZhq9/+/GA1jrcwypoSj3Alx2nCXG4S5yn/DfKPxXSj6PkxCq+tEhzjOPP7cpgAyoyN7A5oQZ/RZaUpT17fJzv3t92dvhuugpyNA9U+0zHyYB281WtevSYfqiYb/xIfKNeRwVAoVkElYa2iLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iYX5kkyP; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iYX5kkyP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731777354; x=1763313354;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=viDoSnJZ3WTLKzgW9i7RBo6+D+PYHc+wr4W1PAnr8ck=;
  b=iYX5kkyPcIxN4W6jcRCcne9YwFZo6ftJtxWyCbnMmBZLSYL/i7ftf34C
   gybAQLutHjsz3JPzTZ34BglwP08WTWb18VBYZqQiOx62fMOrYLLV7Q85y
   uWBg2DhFDHIASN/VNbORbCem2wrmvayym3osMh9WwgfUkmyNd8poFhYpy
   A1wigu6cixsf689TL/wx2LizDjvnhpyFq4t0RekZfHo11ImiyL0hHlVII
   8TPO7SZcWku2e850p/Z8zU8jXIk7GIZQrNXA9KI4VvYTtNqDMEUYHtZj7
   ZrHcnJge5ffbUVqsq8P0J7o/8F9YJ9REFHpegtEIIiEKcM1ztYzBa1GgR
   w==;
X-CSE-ConnectionGUID: 7njqT5j1TB+QCA4NTp+Ppw==
X-CSE-MsgGUID: wnUvHPI5QMCye31HI944Yg==
X-IronPort-AV: E=McAfee;i="6700,10204,11258"; a="43166972"
X-IronPort-AV: E=Sophos;i="6.12,160,1728975600"; 
   d="scan'208";a="43166972"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2024 09:15:51 -0800
X-CSE-ConnectionGUID: 2FOR3Zz0Q6qffgWP9PzHow==
X-CSE-MsgGUID: dgqp4ljNR5KhES5MadhydA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,160,1728975600"; 
   d="scan'208";a="93928616"
Received: from lkp-server01.sh.intel.com (HELO 1e3cc1889ffb) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 16 Nov 2024 09:15:51 -0800
Received: from kbuild by 1e3cc1889ffb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tCMOh-000105-2J;
	Sat, 16 Nov 2024 17:15:47 +0000
Date: Sun, 17 Nov 2024 01:15:32 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6-desktop 15/67] mm/swap.c:722:2: error:
 call to undeclared function 'folio_update_drain'; ISO C99 and later do not
 support implicit function declarations
Message-ID: <202411170154.DTMW1N3e-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6-desktop
head:   e2b6daceb83c9b9ae90fca4b78fc265484ded662
commit: 502d91a72b9c5bef5d3ae1b7b2b3a9901a8a4e2f [15/67] CHROMIUM: mm/mglru: slow down promotion through page tables
config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/20241117/202411170154.DTMW1N3e-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241117/202411170154.DTMW1N3e-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411170154.DTMW1N3e-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from mm/swap.c:17:
   In file included from include/linux/mm.h:2253:
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from mm/swap.c:26:
   include/linux/mm_inline.h:49:41: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
      49 |         __mod_lruvec_state(lruvec, NR_LRU_BASE + lru, nr_pages);
         |                                    ~~~~~~~~~~~ ^ ~~~
   include/linux/mm_inline.h:51:22: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
      51 |                                 NR_ZONE_LRU_BASE + lru, nr_pages);
         |                                 ~~~~~~~~~~~~~~~~ ^ ~~~
>> mm/swap.c:722:2: error: call to undeclared function 'folio_update_drain'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     722 |         folio_update_drain(cpu);
         |         ^
   mm/swap.c:722:2: note: did you mean 'folio_activate_drain'?
   mm/swap.c:397:20: note: 'folio_activate_drain' declared here
     397 | static inline void folio_activate_drain(int cpu)
         |                    ^
   3 warnings and 1 error generated.


vim +/folio_update_drain +722 mm/swap.c

   685	
   686	/*
   687	 * Drain pages out of the cpu's folio_batch.
   688	 * Either "cpu" is the current CPU, and preemption has already been
   689	 * disabled; or "cpu" is being hot-unplugged, and is already dead.
   690	 */
   691	void lru_add_drain_cpu(int cpu)
   692	{
   693		struct cpu_fbatches *fbatches = &per_cpu(cpu_fbatches, cpu);
   694		struct folio_batch *fbatch = &fbatches->lru_add;
   695	
   696		if (folio_batch_count(fbatch))
   697			folio_batch_move_lru(fbatch, lru_add_fn);
   698	
   699		fbatch = &per_cpu(lru_rotate.fbatch, cpu);
   700		/* Disabling interrupts below acts as a compiler barrier. */
   701		if (data_race(folio_batch_count(fbatch))) {
   702			unsigned long flags;
   703	
   704			/* No harm done if a racing interrupt already did this */
   705			local_lock_irqsave(&lru_rotate.lock, flags);
   706			folio_batch_move_lru(fbatch, lru_move_tail_fn);
   707			local_unlock_irqrestore(&lru_rotate.lock, flags);
   708		}
   709	
   710		fbatch = &fbatches->lru_deactivate_file;
   711		if (folio_batch_count(fbatch))
   712			folio_batch_move_lru(fbatch, lru_deactivate_file_fn);
   713	
   714		fbatch = &fbatches->lru_deactivate;
   715		if (folio_batch_count(fbatch))
   716			folio_batch_move_lru(fbatch, lru_deactivate_fn);
   717	
   718		fbatch = &fbatches->lru_lazyfree;
   719		if (folio_batch_count(fbatch))
   720			folio_batch_move_lru(fbatch, lru_lazyfree_fn);
   721	
 > 722		folio_update_drain(cpu);
   723	}
   724	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
