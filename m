Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 067993717D
	for <oe-kbuild-all@lists.linux.dev>; Wed, 10 Apr 2024 23:27:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712791677; cv=none; b=kz4jzO0+ammyvw9J6qmaQVEGIkuVPF4uKV3fErmdHiwSKBvHj34dqCRWPtwHm8tEzNGYHIg8YdU71yf/BUJkC4w9sxjtDTBtMyxkSOzQxP29K1Tr9hOqtmWDtCmWjxRLr1KVWvptsnEbvH4SPiCE7+/PTCzXmKNgbctLRLsNh4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712791677; c=relaxed/simple;
	bh=ex/+3Hh3Um1CsRbPaCEjlXVUURhyVvanXUSEDHMGJRs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Obq4c/wuhshOi7gnBlm0Y+Mff+Q+W5/GefNn/iPdV4a1p/7RgALmzJmPaIASYaZ3YdRg8I53JTckH73lkI/IanLNvNQK4MjXwY+9MBlLY7l2awCLuPaKJvegmS+8LYqrNkFpaRSSe0N+SlF3T+0Hp6kDrnKZrV5Io+CvKeFLplE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YZNIV2zJ; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YZNIV2zJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712791675; x=1744327675;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ex/+3Hh3Um1CsRbPaCEjlXVUURhyVvanXUSEDHMGJRs=;
  b=YZNIV2zJHVLFfouJQVbGOyOiFhdmwsL07GyImMnsT853P7b9Woj5RQWV
   onwfUnro7w9lzmxXih6lV7PXIz/UxPrmj42CCcnnhusprTu8r25EK5BsT
   pB4XF5s6A/t0UnGBcrO4z5F85Gh3KKyiOjlgYlaBvhOS9ckBNphS6jf9w
   YOdWNjOMsHEMN+ehzULcERoXsnldEASCGLS6QrUprBVXFReBBfJHRVQhp
   BszOZbpi3e0xZ3JkDW3+N4rFGGpDORdCAp3/7WdPMLAZA5If3Y0dtu/9z
   mkx8fSgs0InSuZJqSSGqjn/WuRpj3GzGm/H91d09rrG1sT6EOLCATUNgW
   Q==;
X-CSE-ConnectionGUID: KXNdE616S2CkWPglbNSMLQ==
X-CSE-MsgGUID: cl9erZyuSw+p6bq9YLTetg==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="8745657"
X-IronPort-AV: E=Sophos;i="6.07,191,1708416000"; 
   d="scan'208";a="8745657"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2024 16:27:54 -0700
X-CSE-ConnectionGUID: uHxfJ1fbSC64R8SfP3UfNg==
X-CSE-MsgGUID: n3l5km0QQk+0Ecfm0MUd+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,191,1708416000"; 
   d="scan'208";a="25196708"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 10 Apr 2024 16:27:53 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ruhM7-0007xG-0Q;
	Wed, 10 Apr 2024 23:27:51 +0000
Date: Thu, 11 Apr 2024 07:27:21 +0800
From: kernel test robot <lkp@intel.com>
To: Roman Gushchin <roman.gushchin@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [rgushchin:page_counters.1 4/6]
 arch/riscv/include/asm/pgtable-64.h:110:9: warning: 'HUGE_MAX_HSTATE' macro
 redefined
Message-ID: <202404110728.66ZiekLv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/rgushchin/linux.git page_counters.1
head:   00829e628b41b68dd6bf2c08e6c4111f2b8ae7ed
commit: 8787ea8cd6b9123d75582491425c4aa1584c6b1e [4/6] mm: memcg: merge multiple page_counters into a single structure
config: riscv-defconfig (https://download.01.org/0day-ci/archive/20240411/202404110728.66ZiekLv-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 8b3b4a92adee40483c27f26c478a384cd69c6f05)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240411/202404110728.66ZiekLv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404110728.66ZiekLv-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from mm/memcontrol.c:29:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:17:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:9:
   In file included from include/linux/sched/task.h:13:
   In file included from include/linux/uaccess.h:11:
   In file included from arch/riscv/include/asm/uaccess.h:12:
   In file included from arch/riscv/include/asm/pgtable.h:124:
>> arch/riscv/include/asm/pgtable-64.h:110:9: warning: 'HUGE_MAX_HSTATE' macro redefined [-Wmacro-redefined]
     110 | #define HUGE_MAX_HSTATE         (2 + (NAPOT_ORDER_MAX - NAPOT_CONT_ORDER_BASE))
         |         ^
   include/linux/page_counter.h:21:9: note: previous definition is here
      21 | #define HUGE_MAX_HSTATE 1
         |         ^
   In file included from mm/memcontrol.c:29:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:26:
   In file included from include/linux/kernel_stat.h:9:
   In file included from include/linux/interrupt.h:21:
   In file included from arch/riscv/include/asm/sections.h:9:
   In file included from include/linux/mm.h:2237:
   include/linux/vmstat.h:514:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     514 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from mm/memcontrol.c:59:
   include/linux/mm_inline.h:47:41: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
      47 |         __mod_lruvec_state(lruvec, NR_LRU_BASE + lru, nr_pages);
         |                                    ~~~~~~~~~~~ ^ ~~~
   include/linux/mm_inline.h:49:22: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
      49 |                                 NR_ZONE_LRU_BASE + lru, nr_pages);
         |                                 ~~~~~~~~~~~~~~~~ ^ ~~~
   mm/memcontrol.c:1757:4: warning: array index 2 is past the end of the array (that has type 'unsigned long[2]') [-Warray-bounds]
    1757 |                         memcg->memory.failcnt[MCT_KMEM]);
         |                         ^                     ~~~~~~~~
   include/linux/printk.h:530:34: note: expanded from macro 'pr_info'
     530 |         printk(KERN_INFO pr_fmt(fmt), ##__VA_ARGS__)
         |                                         ^~~~~~~~~~~
   include/linux/printk.h:457:60: note: expanded from macro 'printk'
     457 | #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
         |                                                            ^~~~~~~~~~~
   include/linux/printk.h:429:19: note: expanded from macro 'printk_index_wrap'
     429 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                                 ^~~~~~~~~~~
   include/linux/page_counter.h:60:2: note: array 'failcnt' declared here
      60 |         unsigned long failcnt[__MCT_NR_ITEMS];
         |         ^
   5 warnings generated.


vim +/HUGE_MAX_HSTATE +110 arch/riscv/include/asm/pgtable-64.h

23ad288aaf153a Qinglin Pan 2023-02-09  108  
23ad288aaf153a Qinglin Pan 2023-02-09  109  #ifdef CONFIG_RISCV_ISA_SVNAPOT
23ad288aaf153a Qinglin Pan 2023-02-09 @110  #define HUGE_MAX_HSTATE		(2 + (NAPOT_ORDER_MAX - NAPOT_CONT_ORDER_BASE))
23ad288aaf153a Qinglin Pan 2023-02-09  111  #else
23ad288aaf153a Qinglin Pan 2023-02-09  112  #define HUGE_MAX_HSTATE		2
23ad288aaf153a Qinglin Pan 2023-02-09  113  #endif
23ad288aaf153a Qinglin Pan 2023-02-09  114  

:::::: The code at line 110 was first introduced by commit
:::::: 23ad288aaf153a78b042e10062be1a6284909f95 riscv: mm: modify pte format for Svnapot

:::::: TO: Qinglin Pan <panqinglin2020@iscas.ac.cn>
:::::: CC: Palmer Dabbelt <palmer@rivosinc.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
