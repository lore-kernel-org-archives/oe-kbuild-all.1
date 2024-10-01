Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8B76193406
	for <oe-kbuild-all@lists.linux.dev>; Tue,  1 Oct 2024 02:45:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727750752; cv=none; b=aMHiiYaPnQa9RsVcBJnkRI8izFFsx0yKetQplV8WzT5awsqlpSSN1fD/2PAYz0fP+NjrC6JNmCGPusYGqPb9o+vYTPVu7C/yZ0eeZFbaqx+V0JtVlaAoHb2pmKJjlNkTyW0JQ0D2WBMCWsqVI09auEeuKT9pZpYY32QZe/1G6do=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727750752; c=relaxed/simple;
	bh=BJR+W/pGAzmuSyQ/j7X4Md5v3M4kghyHW8LBkY6zdK8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MndMQ1AuKs8zCAA+jhxPSWll+WMW+IRHyyoMK/FKOLfj3CW5aWv1mFtM4DlET/IwTg1xPNehC0y3g+c5HxcSZfAU/ff72fyLJk5jltVxDQXHP3WvOqJv7oYOOqPCoKAgXCcPENWzReG0QGF6YsdPZiGvRq+66brgBu0yvCcerWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NmQ5THPI; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NmQ5THPI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727750751; x=1759286751;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BJR+W/pGAzmuSyQ/j7X4Md5v3M4kghyHW8LBkY6zdK8=;
  b=NmQ5THPI7iea+Dvksa7W6TZ60yUndIgzC7DxSngPBrab6erkaIhmN3vP
   PqzR0IPvcui8tSzpdJACr7aQAHHUuV6tyUKhdywmeGLsVoCNrY4WhZcRQ
   YzdT5yTKQ2OD7UANpe3qyOTWTV/MSsVNvTAkjByHgGcZ4gnGjzJbM05/E
   ipeFF+xOWldCSjHbHsqlmvtfQhf4NtfP+1IBSxdqCQLdF3T/6Ri3mK5X5
   VyKzSq9oGXxARtElb8EQQl99cjU8NITRflpUKZ5pRy9whpngA9n1mYPJl
   oOvU0gsBtN4VPba7hpFLIYRXP0wuXdm/AKIIPM9qeaQbK6lEtCG5iiH5K
   Q==;
X-CSE-ConnectionGUID: Oyks3iPeQV2Mm03jtno9Eg==
X-CSE-MsgGUID: bHRQdlq6RTCbOI81jfjgsw==
X-IronPort-AV: E=McAfee;i="6700,10204,11211"; a="38006113"
X-IronPort-AV: E=Sophos;i="6.11,167,1725346800"; 
   d="scan'208";a="38006113"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2024 19:45:50 -0700
X-CSE-ConnectionGUID: B8BylABdR3S+ahQ9uSSLGw==
X-CSE-MsgGUID: f74OkecAQgi7LYczld86mw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,167,1725346800"; 
   d="scan'208";a="104285922"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 30 Sep 2024 19:45:48 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1svStW-000QAh-1Q;
	Tue, 01 Oct 2024 02:45:46 +0000
Date: Tue, 1 Oct 2024 10:45:13 +0800
From: kernel test robot <lkp@intel.com>
To: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Mike Rapoport <rppt@kernel.org>
Subject: [rppt:execmem/x86-rox/v4 5/8] include/linux/set_memory.h:38:1:
 error: expected identifier or '('
Message-ID: <202410011059.ANTXhRCQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rppt/linux.git execmem/x86-rox/v4
head:   c90f89d40fd21ce040b5cf1485ec6913d1b4ea5d
commit: 394ca992d5179367add42d631858f72a3bf4870d [5/8] arch: introduce set_direct_map_valid_noflush()
config: powerpc-allyesconfig (https://download.01.org/0day-ci/archive/20241001/202410011059.ANTXhRCQ-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 7773243d9916f98ba0ffce0c3a960e4aa9f03e81)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241001/202410011059.ANTXhRCQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410011059.ANTXhRCQ-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from mm/vmalloc.c:12:
   In file included from include/linux/mm.h:2213:
   include/linux/vmstat.h:504:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     504 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     505 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:511:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     511 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     512 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:524:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     524 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     525 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   In file included from mm/vmalloc.c:21:
>> include/linux/set_memory.h:38:1: error: expected identifier or '('
      38 | {
         | ^
   In file included from mm/vmalloc.c:50:
   In file included from mm/internal.h:13:
   include/linux/mm_inline.h:47:41: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
      47 |         __mod_lruvec_state(lruvec, NR_LRU_BASE + lru, nr_pages);
         |                                    ~~~~~~~~~~~ ^ ~~~
   include/linux/mm_inline.h:49:22: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
      49 |                                 NR_ZONE_LRU_BASE + lru, nr_pages);
         |                                 ~~~~~~~~~~~~~~~~ ^ ~~~
   6 warnings and 1 error generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for MODVERSIONS
   Depends on [n]: MODULES [=y] && !COMPILE_TEST [=y]
   Selected by [y]:
   - RANDSTRUCT_FULL [=y] && (CC_HAS_RANDSTRUCT [=y] || GCC_PLUGINS [=n]) && MODULES [=y]


vim +38 include/linux/set_memory.h

    36	
    37	int set_direct_map_valid_noflush(struct page *page, unsigned nr, bool valid);
  > 38	{
    39		return 0;
    40	}
    41	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
