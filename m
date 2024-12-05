Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 097C5217F3C
	for <oe-kbuild-all@lists.linux.dev>; Thu,  5 Dec 2024 18:00:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733421661; cv=none; b=X0Bei6Tio1BX2zgbplP+UkLSLYJjvKDMUQOZ2IUuMIOXBPE4wCW8B4fYmLB4S2jC6omoZKa9qpK6WNBS4sb/frpWB7KEznoMELKg9BO4fcjkngYiegAIPU6HGzYdTXd5F4dibEAxhqZ5qURcBcqmFVtPe6DWn4pmaFLH9/UejuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733421661; c=relaxed/simple;
	bh=HR2ASyDxsrriDC+tuHUR1zxlcJtg58kRTesonZQnjAI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=D80qu7aOpc4nzANokwifhGy2uRqwPyMGVNMbnPa/m7BziCPUyxHnBS7KlO0xcq+CVRgcIsFkF6P5aRL9o8Is0CFLDVA89sJfJpjnhg4aCrgGpPYClwf3Xj3yvqnvvKoD6XqyIkWFPr3z2R2B2W/wKvYR20jC/gPNjKb1onmWNmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=alux1QLC; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="alux1QLC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733421659; x=1764957659;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HR2ASyDxsrriDC+tuHUR1zxlcJtg58kRTesonZQnjAI=;
  b=alux1QLC+wsNUc4aiSoFkeo90ftywHEhS73SDEAyueJcHWhD5aBxY+Ak
   SZ5rDHztX1HUi6DHbweno6hn7S1W2YXAHCXTtC09EQ6dTXLMzElVuUO0Y
   sZhq4h37JYWOZ2/SPwniai786ohzzF99poUdj5wkXCn/6Pia+Uech99oF
   af0Jz+xrNsOXZ0xqWJx5sXL0cNWKEHCQOI7gMaBZl9rXeT5zNcjK0JRc/
   /u4vKO3nrjKY1qKZPDP50YJ7M5kj1kzZWFDJTlPHiR4blaYFXV9N8xmI8
   e4uoZqn49ARo1hW4amrbCN0lDU1ymhrtA6jE9pnmZLWUk0qxoRniXbHFj
   Q==;
X-CSE-ConnectionGUID: PhtKAzmpTUGRPbb6ZGaBcg==
X-CSE-MsgGUID: G502Ii3dTx6BPyFFulvICQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11277"; a="33635364"
X-IronPort-AV: E=Sophos;i="6.12,211,1728975600"; 
   d="scan'208";a="33635364"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2024 10:00:59 -0800
X-CSE-ConnectionGUID: V6/wdcXwTG+x7yNItuJ7/g==
X-CSE-MsgGUID: AtlzC87KRdm0sLGED+2G4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,211,1728975600"; 
   d="scan'208";a="124992840"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 05 Dec 2024 10:00:57 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tJG9l-0000Hb-39;
	Thu, 05 Dec 2024 18:00:53 +0000
Date: Fri, 6 Dec 2024 02:00:39 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zheng Zengkai <zhengzengkai@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2544/2544] kernel/livepatch/core.c:1330:14:
 warning: no previous prototype for function 'arch_klp_mem_alloc'
Message-ID: <202412060112.hYQNEbRS-lkp@intel.com>
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
commit: bfeb55fc4d6244f8e7cac9c6d0911cfb67089a35 [2544/2544] livepatch: Reduce duplicated arch_klp_mem_{prepare,recycle}
config: x86_64-randconfig-123-20241205 (https://download.01.org/0day-ci/archive/20241206/202412060112.hYQNEbRS-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241206/202412060112.hYQNEbRS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412060112.hYQNEbRS-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from kernel/livepatch/core.c:16:
   In file included from include/linux/kallsyms.h:12:
   In file included from include/linux/mm.h:1554:
   include/linux/vmstat.h:431:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     431 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   kernel/livepatch/core.c:68:16: warning: no previous prototype for function 'klp_check_patch_kprobed' [-Wmissing-prototypes]
      68 | struct kprobe *klp_check_patch_kprobed(struct klp_patch *patch)
         |                ^
   kernel/livepatch/core.c:68:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      68 | struct kprobe *klp_check_patch_kprobed(struct klp_patch *patch)
         | ^
         | static 
   kernel/livepatch/core.c:939:12: warning: no previous prototype for function 'arch_klp_func_can_patch' [-Wmissing-prototypes]
     939 | int __weak arch_klp_func_can_patch(struct klp_func *func)
         |            ^
   kernel/livepatch/core.c:939:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     939 | int __weak arch_klp_func_can_patch(struct klp_func *func)
         | ^
         | static 
   kernel/livepatch/core.c:944:12: warning: no previous prototype for function 'arch_klp_init_func' [-Wmissing-prototypes]
     944 | int __weak arch_klp_init_func(struct klp_object *obj, struct klp_func *func)
         |            ^
   kernel/livepatch/core.c:944:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     944 | int __weak arch_klp_init_func(struct klp_object *obj, struct klp_func *func)
         | ^
         | static 
   kernel/livepatch/core.c:1288:5: warning: no previous prototype for function 'klp_try_disable_patch' [-Wmissing-prototypes]
    1288 | int klp_try_disable_patch(void *data)
         |     ^
   kernel/livepatch/core.c:1288:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1288 | int klp_try_disable_patch(void *data)
         | ^
         | static 
   kernel/livepatch/core.c:1322:13: warning: no previous prototype for function 'arch_klp_code_modify_prepare' [-Wmissing-prototypes]
    1322 | void __weak arch_klp_code_modify_prepare(void)
         |             ^
   kernel/livepatch/core.c:1322:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1322 | void __weak arch_klp_code_modify_prepare(void)
         | ^
         | static 
   kernel/livepatch/core.c:1326:13: warning: no previous prototype for function 'arch_klp_code_modify_post_process' [-Wmissing-prototypes]
    1326 | void __weak arch_klp_code_modify_post_process(void)
         |             ^
   kernel/livepatch/core.c:1326:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1326 | void __weak arch_klp_code_modify_post_process(void)
         | ^
         | static 
>> kernel/livepatch/core.c:1330:14: warning: no previous prototype for function 'arch_klp_mem_alloc' [-Wmissing-prototypes]
    1330 | void __weak *arch_klp_mem_alloc(size_t size)
         |              ^
   kernel/livepatch/core.c:1330:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1330 | void __weak *arch_klp_mem_alloc(size_t size)
         | ^
         | static 
>> kernel/livepatch/core.c:1335:13: warning: no previous prototype for function 'arch_klp_mem_free' [-Wmissing-prototypes]
    1335 | void __weak arch_klp_mem_free(void *mem)
         |             ^
   kernel/livepatch/core.c:1335:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1335 | void __weak arch_klp_mem_free(void *mem)
         | ^
         | static 
   kernel/livepatch/core.c:1573:5: warning: no previous prototype for function 'klp_try_enable_patch' [-Wmissing-prototypes]
    1573 | int klp_try_enable_patch(void *data)
         |     ^
   kernel/livepatch/core.c:1573:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1573 | int klp_try_enable_patch(void *data)
         | ^
         | static 
   10 warnings generated.


vim +/arch_klp_mem_alloc +1330 kernel/livepatch/core.c

  1329	
> 1330	void __weak *arch_klp_mem_alloc(size_t size)
  1331	{
  1332		return kzalloc(size, GFP_ATOMIC);
  1333	}
  1334	
> 1335	void __weak arch_klp_mem_free(void *mem)
  1336	{
  1337		kfree(mem);
  1338	}
  1339	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
