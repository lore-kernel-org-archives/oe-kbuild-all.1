Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.19
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795185178;
	b=j/iBIqU9Vusdcv3UB1uqBQiHmjgycP5f1T+8ce/CmPhhX1uBjYcmML0q/quQUIre0b6W
	 QC+1lj3nwyFPfGfQeubxh2Mwadfbmxdo20nsFbtNprFDYFzEwrUA8kDrP+C7IhsSLq+pr
	 9ZbQ8rbcUAleV7v74nVhY0wMLjoHJPyQUuMAXLPSQ9pAoB6S4nt0dqDBWv7XhmK9pFpZ4
	 PSekmYbhZPj3ZDFU0FyVedC1qPgAG2iQUDT2Ytul/O+V7BDbvYjnIVUKDuZg625/A3Sqk
	 5c/1k0Dk5vFKluCv+AJLQlMYXgnVl+TaGwpcIZM/HUZx7OuBiSmK+S50o9adjd8+Eog==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795185178;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=MyerHhdX6/a9InQGhd/kGAcY4FIR1t1RgrUc+qLZQAc=;
	b=ixUYOxmdoxL9SoBAq2rG4igDSDA1nR9FHFSpG97boUC6rAC/4VxdtA9bGee3hIWYMdzQ
	 z+SJu0G01vJVT4p7/gjHES5IL4VM69NYgsAyS/yg5DeysPl4WRw/y6/E8UAOd///02WW4
	 SAxH/GhbpiNoxDKfIyEt0l+3p6t4cdDD5lqI1XW1HWDICMfiusIAZnDNFngTteajqrqV8
	 GhrDiJL+Olbpg4uItjH2xss4HKoI+3lZvYRZrLhed4/nIGNZkxiAZ9GuQgJydnLs0cmk3
	 DevTL7WEI+B7MWGiYi3iL5NETF0hnpJdXJBoAU+PZb6HHLPkGACq0Djb8C0T/P4JcAw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=jrgOkJ5Q;
	arc=none smtp.remote-ip=192.198.163.19
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96C0E606A332
	for <oe-kbuild-all@lists.linux.dev>; Fri, 20 Nov 2026 14:32:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 96C0E606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=jrgOkJ5Q
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795185178; x=1826721178;
  h=date:from:to:cc:subject:message-id;
  bh=nEPSdP+GQUuYesXrih7dH8yr9XxmJOe0FKxtkdZLP78=;
  b=jrgOkJ5QnY3tAVdPvQlDUMY/J4wsiprteMLUyg8Rl2B3yz/j2fTmvUDk
   oAzFc2XdWRXYkfEzDyOBotCFNkp9eA8QL1BHFI+83GYR1wEw18gTdlGKt
   am9BxIn4uxli5CqP1pNKp9TK+fYYK7l4V5r4u/ljbHYWhkK95fVXrOMtJ
   8xtWOe181NA5ayCukjz4UO/Tkh6CwjiEpfZPT7oXFuID9hpTACHbHUlRx
   erPHt6pWS/lL6NJmplzwPdZaIw7SZfm01wOhahOZjtKPcavJLqHqAviqi
   U/KVeDH+mYnXP3V9/z+GaZnxRdRNdYwaiLJShXf1GFD4yl4pgur0Lz8ZT
   w==;
X-CSE-ConnectionGUID: BqYH/HjOSyu09bwbbblRMA==
X-CSE-MsgGUID: Lhk/MpJyRoylWKxDv3rY5A==
X-IronPort-AV: E=McAfee;i="6800,10657,11972"; a="4164090"
X-IronPort-AV: E=Sophos;i="6.27,223,1787036400"; 
   d="scan'208";a="4164090"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2026 06:32:56 -0800
X-CSE-ConnectionGUID: a28uAc+xRoChmDQ4xMzXWw==
X-CSE-MsgGUID: 6wNv1vfQQbmV4Ii8vCZnqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,223,1787036400"; 
   d="scan'208";a="10699073"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 20 Nov 2026 06:32:55 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xUPfY-00000000435-1Te2;
	Fri, 20 Nov 2026 14:32:52 +0000
Date: Fri, 20 Nov 2026 15:32:41 +0100
From: kernel test robot <lkp@intel.com>
To: Hao Li <hao.li@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev, Harry Yoo <harry@kernel.org>,
 "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
Subject: [mm-slab:slab/for-next 1/2] mm/slab_common.c:1012
 new_kmalloc_cache() warn: always true condition '(type >= 0) => (0-u32max >=
 0)'
Message-ID: <20261120153115.isoaU88H-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mm/slab.git slab/for-next
head:   c6e6bf9b097d69a06974b2f8b5400b33e1faeb31
commit: ec81fa8f7dbcf89d9b4112544f76f47c8eb5c725 [1/2] mm/slab: don't set SLAB_MAY_ACCOUNT for KMALLOC_PARTITION_CACHES
config: um-randconfig-2200-20261120 (https://download.01.org/0day-ci/archive/20261120/20261120153115.isoaU88H-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 8db60b003f961f25c5cafe91ee44176f61374279)
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/20261120153115.isoaU88H-lkp@intel.com/

smatch warnings:
mm/slab_common.c:1012 new_kmalloc_cache() warn: always true condition '(type >= 0) => (0-u32max >= 0)'

vim +1012 mm/slab_common.c

  1001	
  1002		/*
  1003		 * If memcg_kmem is enabled and this is a KMALLOC_NORMAL or
  1004		 * KMALLOC_PARTITION_CACHES cache and not aliased with any other type,
  1005		 * make sure it's never merged with any other cache.
  1006		 *
  1007		 * In other cases the kmalloc cache may end up being used for a
  1008		 * __GFP_ACCOUNT allocation so mark it as such. The exception is a
  1009		 * KMALLOC_NO_OBJ_EXT cache.
  1010		 */
  1011		if (!mem_cgroup_kmem_disabled()) {
> 1012			if (type >= KMALLOC_PARTITION_START &&
  1013			    type <= KMALLOC_PARTITION_END &&
  1014			    KMALLOC_RECLAIM != KMALLOC_NORMAL)
  1015				flags |= SLAB_NO_MERGE;
  1016			else if (!(flags & SLAB_NO_OBJ_EXT))
  1017				flags |= SLAB_MAY_ACCOUNT;
  1018		}
  1019	
  1020		if (minalign > ARCH_KMALLOC_MINALIGN) {
  1021			aligned_size = ALIGN(aligned_size, minalign);
  1022			aligned_idx = __kmalloc_index(aligned_size, false);
  1023		}
  1024	
  1025		if (!kmalloc_caches[type][aligned_idx])
  1026			kmalloc_caches[type][aligned_idx] = create_kmalloc_cache(
  1027						kmalloc_info[aligned_idx].name[type],
  1028						aligned_size, flags);
  1029		if (idx != aligned_idx)
  1030			kmalloc_caches[type][idx] = kmalloc_caches[type][aligned_idx];
  1031	}
  1032	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
