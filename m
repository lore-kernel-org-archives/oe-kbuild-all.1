Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EE61171A7
	for <oe-kbuild-all@lists.linux.dev>; Tue, 30 Apr 2024 05:04:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714453453; cv=none; b=JivEhkuJN/rnjhSdbCpc6bPRL5HKn5wblHvisCiMfR8A4VuTtbqW8UWeXxtSqe6MTJ5oqA6GjFy+/fBUX+aGAxL9Zu2WTdmxLi/jEdlegBr9XqrUmeIsgs5wWijbWaI4OS69GTjWtK22wN1qXMVIGb0KSLyFc0jdOS0NncOcHgw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714453453; c=relaxed/simple;
	bh=kaLkYDRYrK02oDdvLGC2cJOh0qcoP26KW2K6hhQMwBk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rJRJX6dpFy9QWhBZPHzPDWBTlnBW3hXRleyshWzNuSfIgJ1sNrsLgDvGTcBKTBFptU8nYnulmQg6UObwMrMUYUbOZNCshtptdrRHc8ABuGddj7dNWL/cpxyMgG6YXh28VrALX5QzSxOQ8NYPPemefO+tqoCrxiZcpyJ8MbaMh3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Zs+dJyMh; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Zs+dJyMh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714453452; x=1745989452;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kaLkYDRYrK02oDdvLGC2cJOh0qcoP26KW2K6hhQMwBk=;
  b=Zs+dJyMhkt0EYI4tWaB+T3p+/w7jmVHSWJqi2rK/ukND0+SYWar/EGi7
   UQuNIBaqjVqdcaQWA1dGbLs8aXSCbyY8xJSLy1H8oRENSy+pbGpYfV1Xn
   JuQ/3zxl4f6mkNlkRE5zsZneQsdnSrbPhwwcMpKGDYVAOAmrsBdnJxWl9
   sj6kpuk7XS+9lK6cNQ2nYzmh1HSkB7wPux3SDsuNTYccdrL1W/GUTxtF9
   IoiKzOLc4wwGk6AUNz+gPlrkPn6x6guToGFPJQ9RYdMPisVTg/mulCjJ/
   aJsP6nH4k0aXDZXai71J8rWVFBiJDMOixGgnkrl0cIMJU4UA5khQ6nxZA
   Q==;
X-CSE-ConnectionGUID: yWfSSgDQSGWL/fSonsuRpQ==
X-CSE-MsgGUID: TotJPhgnSaaIbNmLq9UrIA==
X-IronPort-AV: E=McAfee;i="6600,9927,11059"; a="35528977"
X-IronPort-AV: E=Sophos;i="6.07,241,1708416000"; 
   d="scan'208";a="35528977"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2024 22:04:11 -0700
X-CSE-ConnectionGUID: qUa9yPcOQoCBCo9SRyA+tw==
X-CSE-MsgGUID: JRxIhvWvRgqooFjJbqYDIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,241,1708416000"; 
   d="scan'208";a="31131212"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 29 Apr 2024 22:04:10 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s1fex-0007ki-31;
	Tue, 30 Apr 2024 05:04:07 +0000
Date: Tue, 30 Apr 2024 13:03:15 +0800
From: kernel test robot <lkp@intel.com>
To: Roman Gushchin <roman.gushchin@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [rgushchin:page_counters.1 3/5] include/linux/page_counter.h:32:20:
 error: use of undeclared identifier 'HUGE_MAX_HSTATE'
Message-ID: <202404301245.zHW0n1pb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/rgushchin/linux.git page_counters.1
head:   0dd15dbe99f4eddd40cb83a908540b86501419b0
commit: e6ba7c642b12387e823e16e891c5e4ec8d01b668 [3/5] mm: memcg: merge multiple page_counters into a single structure
config: riscv-defconfig (https://download.01.org/0day-ci/archive/20240430/202404301245.zHW0n1pb-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 37ae4ad0eef338776c7e2cffb3896153d43dcd90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240430/202404301245.zHW0n1pb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404301245.zHW0n1pb-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from mm/page_counter.c:8:
>> include/linux/page_counter.h:32:20: error: use of undeclared identifier 'HUGE_MAX_HSTATE'
      32 |         MCT_HUGETLB_MAX = __MCT_HUGETLB_MAX,
         |                           ^
   include/linux/page_counter.h:20:28: note: expanded from macro '__MCT_HUGETLB_MAX'
      20 | #define __MCT_HUGETLB_MAX (HUGE_MAX_HSTATE * 2 - 1)
         |                            ^
   1 error generated.
--
   In file included from mm/memcontrol.c:28:
>> include/linux/page_counter.h:32:20: error: use of undeclared identifier 'HUGE_MAX_HSTATE'
      32 |         MCT_HUGETLB_MAX = __MCT_HUGETLB_MAX,
         |                           ^
   include/linux/page_counter.h:20:28: note: expanded from macro '__MCT_HUGETLB_MAX'
      20 | #define __MCT_HUGETLB_MAX (HUGE_MAX_HSTATE * 2 - 1)
         |                            ^
   In file included from mm/memcontrol.c:29:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:17:
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
   In file included from mm/memcontrol.c:29:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:17:
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
   In file included from mm/memcontrol.c:29:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:17:
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
   In file included from mm/memcontrol.c:29:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:17:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:101:11: warning: array index 1 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
     101 |                 return (set->sig[1] | set->sig[0]) == 0;
         |                         ^        ~
   include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
      62 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from mm/memcontrol.c:29:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:17:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:114:11: warning: array index 3 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
     114 |                 return  (set1->sig[3] == set2->sig[3]) &&
         |                          ^         ~
   include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
      62 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from mm/memcontrol.c:29:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:17:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:114:27: warning: array index 3 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
     114 |                 return  (set1->sig[3] == set2->sig[3]) &&
         |                                          ^         ~
   include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
      62 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from mm/memcontrol.c:29:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:17:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:115:5: warning: array index 2 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
     115 |                         (set1->sig[2] == set2->sig[2]) &&
         |                          ^         ~
   include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
      62 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from mm/memcontrol.c:29:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:17:
   In file included from include/linux/fs.h:33:


vim +/HUGE_MAX_HSTATE +32 include/linux/page_counter.h

    22	
    23	enum mem_counter_type {
    24	#ifdef CONFIG_MEMCG
    25		MCT_MEMORY,		/* cgroup v1 and v2 */
    26		MCT_SWAP,		/* cgroup v2 only */
    27		MCT_MEMSW = MCT_SWAP,	/* cgroup v1 only */
    28		MCT_KMEM,		/* cgroup v1 only */
    29		MCT_TCPMEM,		/* cgroup v1 only */
    30	#endif
    31	#ifdef CONFIG_CGROUP_HUGETLB
  > 32		MCT_HUGETLB_MAX = __MCT_HUGETLB_MAX,
    33	#endif
    34		__MCT_NR_ITEMS,
    35	};
    36	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
