Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E16F93AEF5F
	for <oe-kbuild-all@lists.linux.dev>; Wed, 15 Apr 2026 13:32:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776259932; cv=none; b=qGHfH3VKy88SW1ivtNnmIW9qFt2ryJ23jCmOAgEDw3VBqi9Qdr3tCQH95+O9o9wxVirJ3xWjFaMpw3eSkgt8RCmJISNbfw1gmyYZr+ig7uMflake2uMwDIVc5DCvqQsdg5V7cpOAySi+S8X6R4JnSpG5iKWndgwi1KOmJc44VgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776259932; c=relaxed/simple;
	bh=aXkGhsVy594aYIb+ZwNsUstG2giINOKSNBMf9ItvRJc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=sAHpxOPJLNrqcrWPfVCyZh9bW5cdIprWmW2URnm+mmYl1hDrg4CN8bXASy5TmzbG+NV67GtbRHQATlu4NjV7oRmBPBUoZRDLhCn9keb5WQr+92gVekJ+aXsYqQB5bWWVQCl7GSPamrywVFfKq055E+c3W0P1j+2ANqJ7KQBlUS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aAjdRksY; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aAjdRksY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776259930; x=1807795930;
  h=date:from:to:cc:subject:message-id;
  bh=aXkGhsVy594aYIb+ZwNsUstG2giINOKSNBMf9ItvRJc=;
  b=aAjdRksY/g6D4YzkZG11Anz4GroIMNWo9BI3wi+P8/+H+T89kYAoXvzO
   bCqC6UEPqq+C6pprFUDAIvoDFz0tb2kpQKKpWtBpCtCUHGLgL7QPk3IOi
   SEKi8NsF2pcDdNM+nJM/Lvfe2tKxrUKOtEPc35M02MGvRyOYb+Dx5GfMs
   3TzF/zZRGQNUnPlemFo7fKQLB6MGpr1AXl7qTdpTAYMtis49l5Z3Lx225
   9gUqEjn2BKAJc4/kz2t7ALqHRPkSFSqqo9WZHM59q0vyBuuMUyz7zmL5A
   krU55UOqMsJH8T/6cq29d+SyeodEwyBztd0CnTJBwCASMTc+fA8ROC8mS
   g==;
X-CSE-ConnectionGUID: HTfR4yiHR1SfIutE+jW8Pg==
X-CSE-MsgGUID: J6ujE4rJQRiuHLG42cV5vg==
X-IronPort-AV: E=McAfee;i="6800,10657,11759"; a="77260502"
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; 
   d="scan'208";a="77260502"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2026 06:32:10 -0700
X-CSE-ConnectionGUID: lExZ/GPKTMaB/tf6TKYkEA==
X-CSE-MsgGUID: yDOAGoRoTEOysZQUyRSm7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; 
   d="scan'208";a="227253158"
Received: from lkp-server01.sh.intel.com (HELO 7f3b36e5d6a5) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 15 Apr 2026 06:32:08 -0700
Received: from kbuild by 7f3b36e5d6a5 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wD0Ld-000000000Xf-33x5;
	Wed, 15 Apr 2026 13:32:05 +0000
Date: Wed, 15 Apr 2026 21:31:13 +0800
From: kernel test robot <lkp@intel.com>
To: Muchun Song <songmuchun@bytedance.com>
Cc: oe-kbuild-all@lists.linux.dev, David Hildenbrand <david@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Linux Memory Management List <linux-mm@kvack.org>
Subject: [akpm-mm:mm-new 159/160] include/linux/mmzone.h:2052:18:
 sparse: sparse: incorrect type in return expression (different address
 spaces)
Message-ID: <202604152138.zbTaYxbG-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-new
head:   f358e95febcb2f3d7ac6aafab0a2b9ace9cc8b7c
commit: 085038a33b6f00e4c43cceab8116315d1d42380c [159/160] mm/sparse: fix race on mem_section->usage in pfn walkers
config: i386-randconfig-r132-20260415 (https://download.01.org/0day-ci/archive/20260415/202604152138.zbTaYxbG-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260415/202604152138.zbTaYxbG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604152138.zbTaYxbG-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   mm/sparse.c: note: in included file:
>> mm/internal.h:987:19: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct mem_section_usage [noderef] __rcu *usage @@     got struct mem_section_usage *usage @@
   mm/internal.h:987:19: sparse:     expected struct mem_section_usage [noderef] __rcu *usage
   mm/internal.h:987:19: sparse:     got struct mem_section_usage *usage
--
   mm/page_alloc.c: note: in included file (through include/linux/gfp.h, include/linux/mm.h):
>> include/linux/mmzone.h:2052:18: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected unsigned long * @@     got unsigned long [noderef] __rcu * @@
   include/linux/mmzone.h:2052:18: sparse:     expected unsigned long *
   include/linux/mmzone.h:2052:18: sparse:     got unsigned long [noderef] __rcu *
>> include/linux/mmzone.h:2052:18: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected unsigned long * @@     got unsigned long [noderef] __rcu * @@
   include/linux/mmzone.h:2052:18: sparse:     expected unsigned long *
   include/linux/mmzone.h:2052:18: sparse:     got unsigned long [noderef] __rcu *
>> include/linux/mmzone.h:2052:18: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected unsigned long * @@     got unsigned long [noderef] __rcu * @@
   include/linux/mmzone.h:2052:18: sparse:     expected unsigned long *
   include/linux/mmzone.h:2052:18: sparse:     got unsigned long [noderef] __rcu *
>> include/linux/mmzone.h:2052:18: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected unsigned long * @@     got unsigned long [noderef] __rcu * @@
   include/linux/mmzone.h:2052:18: sparse:     expected unsigned long *
   include/linux/mmzone.h:2052:18: sparse:     got unsigned long [noderef] __rcu *
>> include/linux/mmzone.h:2052:18: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected unsigned long * @@     got unsigned long [noderef] __rcu * @@
   include/linux/mmzone.h:2052:18: sparse:     expected unsigned long *
   include/linux/mmzone.h:2052:18: sparse:     got unsigned long [noderef] __rcu *

vim +2052 include/linux/mmzone.h

d41dee369bff3b Andy Whitcroft 2005-06-23  2049  
f1eca35a0dc7cb Dan Williams   2019-07-18  2050  static inline unsigned long *section_to_usemap(struct mem_section *ms)
f1eca35a0dc7cb Dan Williams   2019-07-18  2051  {
f1eca35a0dc7cb Dan Williams   2019-07-18 @2052  	return ms->usage->pageblock_flags;
f1eca35a0dc7cb Dan Williams   2019-07-18  2053  }
f1eca35a0dc7cb Dan Williams   2019-07-18  2054  

:::::: The code at line 2052 was first introduced by commit
:::::: f1eca35a0dc7cb3cdb00c88c8c5e5138a65face0 mm/sparsemem: introduce struct mem_section_usage

:::::: TO: Dan Williams <dan.j.williams@intel.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
