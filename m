Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83EAE15B122
	for <oe-kbuild-all@lists.linux.dev>; Mon,  9 Dec 2024 04:29:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733718562; cv=none; b=SgqExfTjsFB1vYDg27ua0ZbIBa1bdIbr/VM0tyCRY0YkR9TF3HCysGoXh9QNMmA0FxJjp32ZhuZOuWfIpDh/WuhV6Uvln0dY+pukQur4vvBE15LqmEIckmGalEOdRyqpI4A1JFoYIWf/XS3xQkYsGvsb4veyeaFRQOz6+4GmTBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733718562; c=relaxed/simple;
	bh=43g3uLMB7k6vCoFAi4gXt3uT3Wu6zf7lcFFtFykVsgE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=E2StcZy490EmXvjuUkh8pzJ65Ku6TN39DNly/fExdYhwlwjGW2fGo68JLySKcAlfOFuVyQr9zrsXv9J0YZMY9N25fzufiUfJ2W8RP/zVGgrnoL5VFhTuuoKOcQ1qubpIbCcPL0S4MBneopkt4kFMtZt9sWkp1G8y8p2v0dYsylA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JRaBYyY3; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JRaBYyY3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733718560; x=1765254560;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=43g3uLMB7k6vCoFAi4gXt3uT3Wu6zf7lcFFtFykVsgE=;
  b=JRaBYyY32nbZSH+LPjtQN1NEdwsF/zlGtIhutTJbNS54ZV0rPhrEYRs0
   jZ0VpjxVtdkBqIhHhr33c4VB/6CJF31YjKoxQN/oyirM23Fo8Lp1od+ig
   wtsiBkolBbSyOx9N9DpXArEzQkt+JJf/2LlQIoRsvDN8RI7se9FtO/JkJ
   xehx+AkMkWr8F85kJboHWAsX/gSNDbQwKb8+BHx7Ib7t5DaEQJLF6PMHH
   FT78F3+Q+00f7kN/mm7iWQyyIhD15a6GvZRIWewyVhEGQLutKnTzU/I5i
   2BbxP0fLLIz0mrSkS4Ef5XuGqIhB5Lf6G+2fiiuY8BFsxVRiCzbeGPLFh
   g==;
X-CSE-ConnectionGUID: g7An73i4SBy5vUSWVoka4Q==
X-CSE-MsgGUID: 83gCd7R9QmmrnYDl8vDNig==
X-IronPort-AV: E=McAfee;i="6700,10204,11280"; a="34236764"
X-IronPort-AV: E=Sophos;i="6.12,218,1728975600"; 
   d="scan'208";a="34236764"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2024 20:29:19 -0800
X-CSE-ConnectionGUID: J/s7sq1FQgeCWQXdH3viaw==
X-CSE-MsgGUID: ir1ebuktR3+mytBci+wSyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,218,1728975600"; 
   d="scan'208";a="95429294"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 08 Dec 2024 20:29:18 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tKVOV-0003rS-2k;
	Mon, 09 Dec 2024 04:29:15 +0000
Date: Mon, 9 Dec 2024 12:28:35 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zheng Yejian <zhengyejian1@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2544/2544] arch/x86/kernel/livepatch.c:315:5:
 warning: no previous prototype for function 'arch_klp_check_calltrace'
Message-ID: <202412080435.e0zBQYor-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   c8dbb3a6e214ad66d5d6099bf76e1f1c6eefc06f
commit: a224a248cd1c2627ea20b02c1a8f33edc217881c [2544/2544] livepatch/x86: Move 'struct klp_func_list' related codes out of arch
config: x86_64-randconfig-123-20241205 (https://download.01.org/0day-ci/archive/20241208/202412080435.e0zBQYor-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241208/202412080435.e0zBQYor-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412080435.e0zBQYor-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/x86/kernel/livepatch.c:21:
   In file included from include/linux/kallsyms.h:12:
   In file included from include/linux/mm.h:1581:
   include/linux/vmstat.h:431:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     431 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   arch/x86/kernel/livepatch.c:137:12: error: implicit declaration of function 'add_func_to_list' [-Werror,-Wimplicit-function-declaration]
     137 |                                         ret = add_func_to_list(check_funcs, &pcheck, old_func,
         |                                               ^
   arch/x86/kernel/livepatch.c:137:29: error: use of undeclared identifier 'check_funcs'
     137 |                                         ret = add_func_to_list(check_funcs, &pcheck, old_func,
         |                                                                ^
   arch/x86/kernel/livepatch.c:75:5: warning: no previous prototype for function 'arch_klp_check_activeness_func' [-Wmissing-prototypes]
      75 | int arch_klp_check_activeness_func(struct klp_patch *patch, int enable,
         |     ^
   arch/x86/kernel/livepatch.c:75:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      75 | int arch_klp_check_activeness_func(struct klp_patch *patch, int enable,
         | ^
         | static 
>> arch/x86/kernel/livepatch.c:315:5: warning: no previous prototype for function 'arch_klp_check_calltrace' [-Wmissing-prototypes]
     315 | int arch_klp_check_calltrace(bool (*check_func)(void *, int *, unsigned long), void *data)
         |     ^
   arch/x86/kernel/livepatch.c:315:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     315 | int arch_klp_check_calltrace(bool (*check_func)(void *, int *, unsigned long), void *data)
         | ^
         | static 
   arch/x86/kernel/livepatch.c:400:6: warning: no previous prototype for function 'arch_klp_code_modify_prepare' [-Wmissing-prototypes]
     400 | void arch_klp_code_modify_prepare(void)
         |      ^
   arch/x86/kernel/livepatch.c:400:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     400 | void arch_klp_code_modify_prepare(void)
         | ^
         | static 
   arch/x86/kernel/livepatch.c:406:6: warning: no previous prototype for function 'arch_klp_code_modify_post_process' [-Wmissing-prototypes]
     406 | void arch_klp_code_modify_post_process(void)
         |      ^
   arch/x86/kernel/livepatch.c:406:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     406 | void arch_klp_code_modify_post_process(void)
         | ^
         | static 
   5 warnings and 2 errors generated.
--
   In file included from kernel/livepatch/core.c:16:
   In file included from include/linux/kallsyms.h:12:
   In file included from include/linux/mm.h:1581:
   include/linux/vmstat.h:431:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     431 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   kernel/livepatch/core.c:71:16: warning: no previous prototype for function 'klp_check_patch_kprobed' [-Wmissing-prototypes]
      71 | struct kprobe *klp_check_patch_kprobed(struct klp_patch *patch)
         |                ^
   kernel/livepatch/core.c:71:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      71 | struct kprobe *klp_check_patch_kprobed(struct klp_patch *patch)
         | ^
         | static 
   kernel/livepatch/core.c:942:12: warning: no previous prototype for function 'arch_klp_init_func' [-Wmissing-prototypes]
     942 | int __weak arch_klp_init_func(struct klp_object *obj, struct klp_func *func)
         |            ^
   kernel/livepatch/core.c:942:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     942 | int __weak arch_klp_init_func(struct klp_object *obj, struct klp_func *func)
         | ^
         | static 
>> kernel/livepatch/core.c:1342:12: warning: no previous prototype for function 'arch_klp_check_calltrace' [-Wmissing-prototypes]
    1342 | int __weak arch_klp_check_calltrace(bool (*fn)(void *, int *, unsigned long), void *data)
         |            ^
   kernel/livepatch/core.c:1342:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1342 | int __weak arch_klp_check_calltrace(bool (*fn)(void *, int *, unsigned long), void *data)
         | ^
         | static 
>> kernel/livepatch/core.c:1347:12: warning: no previous prototype for function 'arch_klp_check_activeness_func' [-Wmissing-prototypes]
    1347 | int __weak arch_klp_check_activeness_func(struct klp_patch *patch, int enable,
         |            ^
   kernel/livepatch/core.c:1347:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1347 | int __weak arch_klp_check_activeness_func(struct klp_patch *patch, int enable,
         | ^
         | static 
   kernel/livepatch/core.c:1412:12: warning: no previous prototype for function 'klp_check_calltrace' [-Wmissing-prototypes]
    1412 | int __weak klp_check_calltrace(struct klp_patch *patch, int enable)
         |            ^
   kernel/livepatch/core.c:1412:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1412 | int __weak klp_check_calltrace(struct klp_patch *patch, int enable)
         | ^
         | static 
   kernel/livepatch/core.c:1506:5: warning: no previous prototype for function 'klp_try_disable_patch' [-Wmissing-prototypes]
    1506 | int klp_try_disable_patch(void *data)
         |     ^
   kernel/livepatch/core.c:1506:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1506 | int klp_try_disable_patch(void *data)
         | ^
         | static 
   kernel/livepatch/core.c:1540:13: warning: no previous prototype for function 'arch_klp_code_modify_prepare' [-Wmissing-prototypes]
    1540 | void __weak arch_klp_code_modify_prepare(void)
         |             ^
   kernel/livepatch/core.c:1540:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1540 | void __weak arch_klp_code_modify_prepare(void)
         | ^
         | static 
   kernel/livepatch/core.c:1544:13: warning: no previous prototype for function 'arch_klp_code_modify_post_process' [-Wmissing-prototypes]
    1544 | void __weak arch_klp_code_modify_post_process(void)
         |             ^
   kernel/livepatch/core.c:1544:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1544 | void __weak arch_klp_code_modify_post_process(void)
         | ^
         | static 
   kernel/livepatch/core.c:1548:14: warning: no previous prototype for function 'arch_klp_mem_alloc' [-Wmissing-prototypes]
    1548 | void __weak *arch_klp_mem_alloc(size_t size)
         |              ^
   kernel/livepatch/core.c:1548:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1548 | void __weak *arch_klp_mem_alloc(size_t size)
         | ^
         | static 
   kernel/livepatch/core.c:1553:13: warning: no previous prototype for function 'arch_klp_mem_free' [-Wmissing-prototypes]
    1553 | void __weak arch_klp_mem_free(void *mem)
         |             ^
   kernel/livepatch/core.c:1553:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1553 | void __weak arch_klp_mem_free(void *mem)
         | ^
         | static 
   kernel/livepatch/core.c:1581:13: warning: no previous prototype for function 'arch_klp_set_brk_func' [-Wmissing-prototypes]
    1581 | void __weak arch_klp_set_brk_func(struct klp_func_node *func_node, void *new_func)
         |             ^
   kernel/livepatch/core.c:1581:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1581 | void __weak arch_klp_set_brk_func(struct klp_func_node *func_node, void *new_func)
         | ^
         | static 
   kernel/livepatch/core.c:1993:5: warning: no previous prototype for function 'klp_try_enable_patch' [-Wmissing-prototypes]
    1993 | int klp_try_enable_patch(void *data)
         |     ^
   kernel/livepatch/core.c:1993:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1993 | int klp_try_enable_patch(void *data)
         | ^
         | static 
   13 warnings generated.


vim +/arch_klp_check_calltrace +315 arch/x86/kernel/livepatch.c

   314	
 > 315	int arch_klp_check_calltrace(bool (*check_func)(void *, int *, unsigned long), void *data)
   316	{
   317		return do_check_calltrace(check_func, data);
   318	}
   319	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
