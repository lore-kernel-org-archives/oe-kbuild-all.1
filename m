Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90A6A1CD1ED
	for <oe-kbuild-all@lists.linux.dev>; Thu,  5 Dec 2024 21:45:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733435107; cv=none; b=BUPGUw9m6Vpl5/+h3pSclYVuomyIoNhU/euLMYj3DS7U/HMXcpzyTCdWpZehihq3dLapnijDv3wi27l6JWVnZK08eldEt95hWXfPNMOm0Dfjjeu1qKqNZPVZqazRGIppiTTpFvPYv2elA+AYDMiEcPhvaNNpdGy37sbMRL8O+SI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733435107; c=relaxed/simple;
	bh=o9CpY8swGTc9028KWW6Fx38gKeeyrYhFx6EJNhIKZBg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tOCswlDDkMgbPcVVX/YG0mowOeladPxGBIvrpMFxPoE6o9pWa/54O1VbEJHjMaT/hn8OfiAqtwE05y4DhKDJf1CZ1i84e/4tPGysFHQuHDsY3pGXLgSZ1Bfd404m2dG/QgiW8lEtd6C9QhrSDL4I0dLrYte8eZLKfQKIkl6qJjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=by/OnjMR; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="by/OnjMR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733435105; x=1764971105;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=o9CpY8swGTc9028KWW6Fx38gKeeyrYhFx6EJNhIKZBg=;
  b=by/OnjMRDa4Q6Y3GatyiDvq9e4qCJPOYFuppi+bnaM7TboPZxmV4lXlB
   dY6yIf2H+4eWBDxuNbnpfRyhJ39bJ3xR7xIGMupbP+UU3Kfy23EduRhSj
   mQ4NQLVtt7tmbfKdoPdmf/eTaDrh6mWR4KzNqweH6q8A7YdX30YGIrEC6
   GBex3rEPj8tbPOkcV7C3ppeTBZX4M+OgLvil1Gx7O/nWjFY7wyGS9pd03
   3VokhdFCx01tlDv95c0HmDZKYf5t9D7ZGmGVb/+guE1wDXTuMZKcofEXa
   nhgPKaF7S0UgJIXq2yz7jYA4PQgJkjbVwVFrp1Af3NqwU6cKj00E9YbBW
   Q==;
X-CSE-ConnectionGUID: k+vCY7wMSueAcUVZxCxYDw==
X-CSE-MsgGUID: 2lwmEKpJTBuUbbWUqXQzPg==
X-IronPort-AV: E=McAfee;i="6700,10204,11277"; a="45152885"
X-IronPort-AV: E=Sophos;i="6.12,211,1728975600"; 
   d="scan'208";a="45152885"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2024 13:45:04 -0800
X-CSE-ConnectionGUID: /UwhIwGSTeeq6uuuWZeezQ==
X-CSE-MsgGUID: v34mGFmvTpOFnIlfwPpxHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,211,1728975600"; 
   d="scan'208";a="98668280"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 05 Dec 2024 13:45:02 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tJJee-0000Pp-0P;
	Thu, 05 Dec 2024 21:45:00 +0000
Date: Fri, 6 Dec 2024 05:44:14 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zheng Zengkai <zhengzengkai@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2544/2544] kernel/livepatch/core.c:1420:13:
 warning: no previous prototype for function 'arch_klp_set_brk_func'
Message-ID: <202412060504.AIlPmrzd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   220bfa0ea761db9406a3cfde3064aa029e829221
commit: b25272c022a17ee12688d001375e7a483385c568 [2544/2544] livepatch: Use breakpoint exception to optimize enabling livepatch
config: x86_64-randconfig-123-20241205 (https://download.01.org/0day-ci/archive/20241206/202412060504.AIlPmrzd-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241206/202412060504.AIlPmrzd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412060504.AIlPmrzd-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from kernel/livepatch/core.c:16:
   In file included from include/linux/kallsyms.h:12:
   In file included from include/linux/mm.h:1557:
   include/linux/vmstat.h:431:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     431 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   kernel/livepatch/core.c:70:16: warning: no previous prototype for function 'klp_check_patch_kprobed' [-Wmissing-prototypes]
      70 | struct kprobe *klp_check_patch_kprobed(struct klp_patch *patch)
         |                ^
   kernel/livepatch/core.c:70:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      70 | struct kprobe *klp_check_patch_kprobed(struct klp_patch *patch)
         | ^
         | static 
   kernel/livepatch/core.c:941:12: warning: no previous prototype for function 'arch_klp_func_can_patch' [-Wmissing-prototypes]
     941 | int __weak arch_klp_func_can_patch(struct klp_func *func)
         |            ^
   kernel/livepatch/core.c:941:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     941 | int __weak arch_klp_func_can_patch(struct klp_func *func)
         | ^
         | static 
   kernel/livepatch/core.c:946:12: warning: no previous prototype for function 'arch_klp_init_func' [-Wmissing-prototypes]
     946 | int __weak arch_klp_init_func(struct klp_object *obj, struct klp_func *func)
         |            ^
   kernel/livepatch/core.c:946:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     946 | int __weak arch_klp_init_func(struct klp_object *obj, struct klp_func *func)
         | ^
         | static 
   kernel/livepatch/core.c:1349:5: warning: no previous prototype for function 'klp_try_disable_patch' [-Wmissing-prototypes]
    1349 | int klp_try_disable_patch(void *data)
         |     ^
   kernel/livepatch/core.c:1349:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1349 | int klp_try_disable_patch(void *data)
         | ^
         | static 
   kernel/livepatch/core.c:1383:13: warning: no previous prototype for function 'arch_klp_code_modify_prepare' [-Wmissing-prototypes]
    1383 | void __weak arch_klp_code_modify_prepare(void)
         |             ^
   kernel/livepatch/core.c:1383:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1383 | void __weak arch_klp_code_modify_prepare(void)
         | ^
         | static 
   kernel/livepatch/core.c:1387:13: warning: no previous prototype for function 'arch_klp_code_modify_post_process' [-Wmissing-prototypes]
    1387 | void __weak arch_klp_code_modify_post_process(void)
         |             ^
   kernel/livepatch/core.c:1387:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1387 | void __weak arch_klp_code_modify_post_process(void)
         | ^
         | static 
   kernel/livepatch/core.c:1391:14: warning: no previous prototype for function 'arch_klp_mem_alloc' [-Wmissing-prototypes]
    1391 | void __weak *arch_klp_mem_alloc(size_t size)
         |              ^
   kernel/livepatch/core.c:1391:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1391 | void __weak *arch_klp_mem_alloc(size_t size)
         | ^
         | static 
   kernel/livepatch/core.c:1396:13: warning: no previous prototype for function 'arch_klp_mem_free' [-Wmissing-prototypes]
    1396 | void __weak arch_klp_mem_free(void *mem)
         |             ^
   kernel/livepatch/core.c:1396:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1396 | void __weak arch_klp_mem_free(void *mem)
         | ^
         | static 
   kernel/livepatch/core.c:1406:12: warning: no previous prototype for function 'arch_klp_check_breakpoint' [-Wmissing-prototypes]
    1406 | int __weak arch_klp_check_breakpoint(struct arch_klp_data *arch_data, void *old_func)
         |            ^
   kernel/livepatch/core.c:1406:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1406 | int __weak arch_klp_check_breakpoint(struct arch_klp_data *arch_data, void *old_func)
         | ^
         | static 
   kernel/livepatch/core.c:1411:12: warning: no previous prototype for function 'arch_klp_add_breakpoint' [-Wmissing-prototypes]
    1411 | int __weak arch_klp_add_breakpoint(struct arch_klp_data *arch_data, void *old_func)
         |            ^
   kernel/livepatch/core.c:1411:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1411 | int __weak arch_klp_add_breakpoint(struct arch_klp_data *arch_data, void *old_func)
         | ^
         | static 
   kernel/livepatch/core.c:1416:13: warning: no previous prototype for function 'arch_klp_remove_breakpoint' [-Wmissing-prototypes]
    1416 | void __weak arch_klp_remove_breakpoint(struct arch_klp_data *arch_data, void *old_func)
         |             ^
   kernel/livepatch/core.c:1416:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1416 | void __weak arch_klp_remove_breakpoint(struct arch_klp_data *arch_data, void *old_func)
         | ^
         | static 
>> kernel/livepatch/core.c:1420:13: warning: no previous prototype for function 'arch_klp_set_brk_func' [-Wmissing-prototypes]
    1420 | void __weak arch_klp_set_brk_func(struct klp_func_node *func_node, void *new_func)
         |             ^
   kernel/livepatch/core.c:1420:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1420 | void __weak arch_klp_set_brk_func(struct klp_func_node *func_node, void *new_func)
         | ^
         | static 
   kernel/livepatch/core.c:1809:5: warning: no previous prototype for function 'klp_try_enable_patch' [-Wmissing-prototypes]
    1809 | int klp_try_enable_patch(void *data)
         |     ^
   kernel/livepatch/core.c:1809:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1809 | int klp_try_enable_patch(void *data)
         | ^
         | static 
   14 warnings generated.


vim +/arch_klp_set_brk_func +1420 kernel/livepatch/core.c

  1419	
> 1420	void __weak arch_klp_set_brk_func(struct klp_func_node *func_node, void *new_func)
  1421	{
  1422		func_node->brk_func = new_func;
  1423	}
  1424	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
