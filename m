Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12170283FE3
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Dec 2025 09:13:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765444425; cv=none; b=f8/3NtM/hlWx/KtrWWnHrDvWUlz1nhVnCKOGZcvYDWuUuIBx6Alg4An9OOSFvOOthWgOi5IZxwPwF7B9Z3If17Y5dMwJg9nQChIYrQ6Irvc5nZ8ASs0qxTuFuNhAds50McLOU/JB+Ct1YQmfUpDZ12Qn7ijVu1p5mastu1rdEfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765444425; c=relaxed/simple;
	bh=hEUupVvPIoMS71wjxIXZwMFeUORjrz6dCJ9hWV5FSaQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CFjdc3bKKW5bYL8sxdVv+juHraR/6ioYRUBEYxPojcxJryScdniN1F3OzRAoEo3V20p+byV/Z2SmHfHCJ08BKCrWqPDgEhE5xhS43UFJIqsX7d+iNalX86d88dggVvGr0IOTpIwfhojQNkgWcaQ6Bf6oh/N9CX241IOEgqDBoLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=h7yoqfqY; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="h7yoqfqY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765444424; x=1796980424;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hEUupVvPIoMS71wjxIXZwMFeUORjrz6dCJ9hWV5FSaQ=;
  b=h7yoqfqYUbcfYT5n7J2qUtLae5LWLRFmDAY9ydDqcJOoBEailc3t922+
   Df8RPY2ZiXdzC7HT+1GEovkU0pgR0m2wQrVcr42GxOiSWw2vhQAof7X0B
   AEk1SWmHwWNOT3gQso/yFvJBi2o9BP3Z3KkEkXHsB8zVJiIpk2uN5tOht
   h9rr8JWyLonJztvG+AhpAFaCSEiqFkOkVW5KsWCeohwaPy/aCNufu/Thw
   rd27uylwxvVFPCrMR/GiXkkMfXt7uQXOLMw95fETXKj68UFHFSBK6sNss
   x0zOPh32gDlQFkTDi0AzUfoxiPNEB1BAHi8UNsnxbxL4RF4pb9YyAFEcH
   Q==;
X-CSE-ConnectionGUID: xbaP1LFuR4elm/I6j2Czpw==
X-CSE-MsgGUID: C1OgSyI0S6CSA6qaJj3FxQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11638"; a="66423921"
X-IronPort-AV: E=Sophos;i="6.20,265,1758610800"; 
   d="scan'208";a="66423921"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2025 01:13:43 -0800
X-CSE-ConnectionGUID: Wshn39kcSj+nlneKzPDWQg==
X-CSE-MsgGUID: dR/2vT7vSpqMDxPtBA2Tsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,265,1758610800"; 
   d="scan'208";a="200913382"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by orviesa003.jf.intel.com with ESMTP; 11 Dec 2025 01:13:43 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vTcjz-000000000yy-3oFt;
	Thu, 11 Dec 2025 09:13:39 +0000
Date: Thu, 11 Dec 2025 10:13:11 +0100
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Long Li <leo.lilong@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3508/3508] fs/xfs/libxfs/xfs_alloc.c:102:1:
 warning: no previous prototype for function 'xfs_ag_fixup_aside'
Message-ID: <202512111045.b5aNBn0b-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi yangerkun,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   5930fa3740c518a9f6ba688fd0c1873d6f3adbce
commit: 8c6e9756375dff2e96d3b598992b2f0e8b3682ee [3508/3508] xfs: fix xfs shutdown since we reserve more blocks in agfl fixup
config: arm64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20251211/202512111045.b5aNBn0b-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 4125e73cdc6188cca4c1c72b72e2b2d85c157483)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251211/202512111045.b5aNBn0b-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512111045.b5aNBn0b-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from <built-in>:3:
   In file included from ././include/linux/compiler_types.h:150:
   ./include/linux/compiler-clang.h:33:9: warning: '__SANITIZE_ADDRESS__' macro redefined [-Wmacro-redefined]
      33 | #define __SANITIZE_ADDRESS__
         |         ^
   <built-in>:367:9: note: previous definition is here
     367 | #define __SANITIZE_ADDRESS__ 1
         |         ^
   In file included from fs/xfs/libxfs/xfs_alloc.c:6:
   In file included from ./fs/xfs/xfs.h:22:
   In file included from ./fs/xfs/xfs_linux.h:24:
   In file included from ./fs/xfs/kmem.h:11:
   In file included from ./include/linux/mm.h:2181:
   ./include/linux/vmstat.h:508:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     508 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     509 |                            item];
         |                            ~~~~
   ./include/linux/vmstat.h:515:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     515 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     516 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   ./include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   ./include/linux/vmstat.h:527:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     527 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     528 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   ./include/linux/vmstat.h:536:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     536 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     537 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> fs/xfs/libxfs/xfs_alloc.c:102:1: warning: no previous prototype for function 'xfs_ag_fixup_aside' [-Wmissing-prototypes]
     102 | xfs_ag_fixup_aside(
         | ^
   fs/xfs/libxfs/xfs_alloc.c:101:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     101 | xfs_extlen_t
         | ^
         | static 
   7 warnings generated.


vim +/xfs_ag_fixup_aside +102 fs/xfs/libxfs/xfs_alloc.c

    94	
    95	/*
    96	 * Twice fixup for the same ag may happen within exact one tp, and the consume
    97	 * of agfl after first fixup may trigger second fixup's failure, then xfs will
    98	 * shutdown. To avoid that, we reserve blocks which can satisfy the second
    99	 * fixup.
   100	 */
   101	xfs_extlen_t
 > 102	xfs_ag_fixup_aside(
   103			struct xfs_mount	*mp)
   104	{
   105		xfs_extlen_t ret;
   106	
   107		ret = 2 * mp->m_alloc_maxlevels;
   108		if (xfs_has_rmapbt(mp))
   109			ret += mp->m_rmap_maxlevels;
   110	
   111		return ret;
   112	}
   113	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
