Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51F7B17C8D
	for <oe-kbuild-all@lists.linux.dev>; Wed,  8 May 2024 01:37:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715132222; cv=none; b=FUszmhjwl2dfu2Fk17vmk10Cq6zWekxuoussqXhl+BBjFpLcQhKXq61OwU3IXkMPf+BzgS7lRphHV39SYc95cmdmx2H4yoRIuAlIXqIzuJ46Uh4iyh0y1IKTBzpPUML05JW1EJqG5GjXv4VprzhVL0OPxQqvnX8Q5L8BlXWG0GM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715132222; c=relaxed/simple;
	bh=0O5mHqelYp4LqL1Bk1VS2RYa9c6QrT03ky2vWeWJra4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LW0DGjC0xjKPnJeID7BfrHNVoYQ+Q9SafWU/vJuS2a7MwYOuGCrxUjNCZcYRAm9h5VAnwZOzV+4GB+B8CAdBBEjJ47TZEFDFqJ4Xgwuh4fmCfRcUUnocXQceALYyhQn8kY1Sit62+1S4m9A4pvaPFfYBhvNyEhQQl9dTxyLMDIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GAAssr4u; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GAAssr4u"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715132221; x=1746668221;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0O5mHqelYp4LqL1Bk1VS2RYa9c6QrT03ky2vWeWJra4=;
  b=GAAssr4uaJAXxlU4vBzlKoHtkGZOJAmTv/aq5PCmhqi1lD1IV2iAdmUk
   wsgly5UJwomfCHLk5wUcNCVoHyUTvIaKOPlT4LP/aNlJosSocDLuY5Vj1
   6o1rM0yjQS0cketOOYdz/PkVJyvQmLq2bwKsIsYuhRgpx+8XzGpE7YULK
   fcbWs1/BVm9lYqIve1xfA6TIooiuwGAQnTBN0hSuHK4wG0jR8O3kqN51p
   xLkKJGKq/u+NQJDyYc+/S3EIhP4dmg+Hg3s/HHkVu0ZlHPqGxuaoymeg+
   b59Imi4Bu3KBFwNTBvuoH08rQemtzq1NqwGw+lQF9ocFPivyUConA4J5G
   Q==;
X-CSE-ConnectionGUID: FZBe844qRTebDbetqGtPrw==
X-CSE-MsgGUID: 7zdnsFm9Q3utIhIXI5KKMA==
X-IronPort-AV: E=McAfee;i="6600,9927,11066"; a="22121547"
X-IronPort-AV: E=Sophos;i="6.08,143,1712646000"; 
   d="scan'208";a="22121547"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2024 18:37:00 -0700
X-CSE-ConnectionGUID: Ubba5CdtQgCmDoSmV/rPmA==
X-CSE-MsgGUID: g1segyXLRzS0PGLT0Y804Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,143,1712646000"; 
   d="scan'208";a="33238380"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 07 May 2024 18:36:57 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s4WEq-0002pP-0G;
	Wed, 08 May 2024 01:36:56 +0000
Date: Wed, 8 May 2024 09:36:46 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zheng Yejian <zhengyejian1@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 1786/7652] kernel/livepatch/core.c:2006:12:
 warning: no previous prototype for function 'arch_klp_check_breakpoint'
Message-ID: <202405080901.aTVbuOkv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   afd82dd979acad2f99b9d30f8ce8463ca4153a05
commit: 470628a716984e1325b92bef4fa2140ff5a062a5 [1786/7652] livepatch: Use breakpoint exception to optimize enabling livepatch
config: arm64-randconfig-004-20240508 (https://download.01.org/0day-ci/archive/20240508/202405080901.aTVbuOkv-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 0ab4458df0688955620b72cc2c72a32dffad3615)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240508/202405080901.aTVbuOkv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405080901.aTVbuOkv-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from kernel/livepatch/core.c:17:
   In file included from include/linux/kallsyms.h:13:
   In file included from include/linux/mm.h:2181:
   include/linux/vmstat.h:508:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     508 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     509 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:515:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     515 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     516 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:527:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     527 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     528 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   kernel/livepatch/core.c:1728:12: warning: no previous prototype for function 'arch_klp_check_activeness_func' [-Wmissing-prototypes]
    1728 | int __weak arch_klp_check_activeness_func(struct klp_func *func, int enable,
         |            ^
   kernel/livepatch/core.c:1728:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1728 | int __weak arch_klp_check_activeness_func(struct klp_func *func, int enable,
         | ^
         | static 
   kernel/livepatch/core.c:1983:14: warning: no previous prototype for function 'arch_klp_mem_alloc' [-Wmissing-prototypes]
    1983 | void __weak *arch_klp_mem_alloc(size_t size)
         |              ^
   kernel/livepatch/core.c:1983:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1983 | void __weak *arch_klp_mem_alloc(size_t size)
         | ^
         | static 
   kernel/livepatch/core.c:1988:13: warning: no previous prototype for function 'arch_klp_mem_free' [-Wmissing-prototypes]
    1988 | void __weak arch_klp_mem_free(void *mem)
         |             ^
   kernel/livepatch/core.c:1988:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1988 | void __weak arch_klp_mem_free(void *mem)
         | ^
         | static 
   kernel/livepatch/core.c:1993:13: warning: no previous prototype for function 'arch_klp_code_modify_prepare' [-Wmissing-prototypes]
    1993 | void __weak arch_klp_code_modify_prepare(void)
         |             ^
   kernel/livepatch/core.c:1993:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1993 | void __weak arch_klp_code_modify_prepare(void)
         | ^
         | static 
   kernel/livepatch/core.c:1997:13: warning: no previous prototype for function 'arch_klp_code_modify_post_process' [-Wmissing-prototypes]
    1997 | void __weak arch_klp_code_modify_post_process(void)
         |             ^
   kernel/livepatch/core.c:1997:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1997 | void __weak arch_klp_code_modify_post_process(void)
         | ^
         | static 
>> kernel/livepatch/core.c:2006:12: warning: no previous prototype for function 'arch_klp_check_breakpoint' [-Wmissing-prototypes]
    2006 | int __weak arch_klp_check_breakpoint(struct arch_klp_data *arch_data, void *old_func)
         |            ^
   kernel/livepatch/core.c:2006:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    2006 | int __weak arch_klp_check_breakpoint(struct arch_klp_data *arch_data, void *old_func)
         | ^
         | static 
   kernel/livepatch/core.c:2011:12: warning: no previous prototype for function 'arch_klp_add_breakpoint' [-Wmissing-prototypes]
    2011 | int __weak arch_klp_add_breakpoint(struct arch_klp_data *arch_data, void *old_func)
         |            ^
   kernel/livepatch/core.c:2011:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    2011 | int __weak arch_klp_add_breakpoint(struct arch_klp_data *arch_data, void *old_func)
         | ^
         | static 
   kernel/livepatch/core.c:2016:13: warning: no previous prototype for function 'arch_klp_remove_breakpoint' [-Wmissing-prototypes]
    2016 | void __weak arch_klp_remove_breakpoint(struct arch_klp_data *arch_data, void *old_func)
         |             ^
   kernel/livepatch/core.c:2016:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    2016 | void __weak arch_klp_remove_breakpoint(struct arch_klp_data *arch_data, void *old_func)
         | ^
         | static 
   kernel/livepatch/core.c:2020:13: warning: no previous prototype for function 'arch_klp_set_brk_func' [-Wmissing-prototypes]
    2020 | void __weak arch_klp_set_brk_func(struct klp_func_node *func_node, void *new_func)
         |             ^
   kernel/livepatch/core.c:2020:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    2020 | void __weak arch_klp_set_brk_func(struct klp_func_node *func_node, void *new_func)
         | ^
         | static 
   13 warnings generated.


vim +/arch_klp_check_breakpoint +2006 kernel/livepatch/core.c

  2005	
> 2006	int __weak arch_klp_check_breakpoint(struct arch_klp_data *arch_data, void *old_func)
  2007	{
  2008		return 0;
  2009	}
  2010	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
