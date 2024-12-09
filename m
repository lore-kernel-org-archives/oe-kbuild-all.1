Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42E3615746F
	for <oe-kbuild-all@lists.linux.dev>; Mon,  9 Dec 2024 04:32:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733718744; cv=none; b=A5MsSCrmHQJNF2wSpqRJlpU0NeEOZlUkzooqnOf2D3awzmvYX6uNETenT90yCNyQEEvNdVxbrC8IaHer3c5S2MdChLe1ZQcOe60vYbPpp0+6/+f4/Azx0cGsTi91p4RaJ02s9klJff9ujW/NnpgPabNV0YH/dQiA+KvdP5cimVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733718744; c=relaxed/simple;
	bh=gpqzAfVtT2mA5KN0VxeB7cIvPeOnRASMIiIOdO5guL8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=STx4wjUVFD8l17Cb22ztPpqlRvBU/UUhK6VAAVpazCAr7IuWTr3eEzP3yZFxDhbOTryaJsTKv5PrmO5NOHBLrGWnU6rqPmqXKB4DRifo6wc1sAexunUZafx4sMiO/bJdj8gIC3gchoP38hiRfCIeGT+KvGn7TEDVj8xvHXM6sno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ew+EawhH; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ew+EawhH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733718743; x=1765254743;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gpqzAfVtT2mA5KN0VxeB7cIvPeOnRASMIiIOdO5guL8=;
  b=ew+EawhHTGEgjuKdxZU+sNf83zg4n9nHEKvXPZ/AVrwK/Sj7gclKlkkd
   9fDbRkjpUQ/S+TMOvwF2V3ah3C9olX37O/eqnIZZqmQliT1EKc2OqzBuW
   6kvo8pI+CRy7lVKbkEzj10ixogCzL++MPvpGJHMincJKIpZHk+ShKSr0Z
   8MoYwaghVOnC+N7usTnZicclQJ5u+nFXAKMKfgPy8aEQYYTHfWImaL00w
   miZii67fV2Tz3tBSte6JZZEOVtnbqpM1NP6tVqo54iA/zz1XYs1X+fpew
   /DpK1CUJfXcWvP+o9n499vpJNsbtQWNilMFf9x4mgdTs+ptfnbU/iinVU
   A==;
X-CSE-ConnectionGUID: EPNKZlMQQaWKK55o636xUw==
X-CSE-MsgGUID: /QFwK2deTAqhowl37crAnQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11280"; a="45013694"
X-IronPort-AV: E=Sophos;i="6.12,218,1728975600"; 
   d="scan'208";a="45013694"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2024 20:32:20 -0800
X-CSE-ConnectionGUID: Qyvx4FHFQuihdlGC4CNWZQ==
X-CSE-MsgGUID: C0fYf8toS3CfGyizWIBQVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,218,1728975600"; 
   d="scan'208";a="95048611"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 08 Dec 2024 20:32:18 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tKVRQ-0003s9-0v;
	Mon, 09 Dec 2024 04:32:16 +0000
Date: Mon, 9 Dec 2024 12:32:06 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zheng Yejian <zhengyejian1@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2544/2544] arch/x86/kernel/livepatch.c:55:6:
 warning: no previous prototype for function 'arch_check_jump_insn'
Message-ID: <202412080615.LTPtfUgh-lkp@intel.com>
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
commit: 6b65db0bde760a026bd93ae93f5bcacfece087cb [2544/2544] livepatch: Fix huge_depth in arch_klp_check_activeness_func()
config: x86_64-randconfig-123-20241205 (https://download.01.org/0day-ci/archive/20241208/202412080615.LTPtfUgh-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241208/202412080615.LTPtfUgh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412080615.LTPtfUgh-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/x86/kernel/livepatch.c:21:
   In file included from include/linux/kallsyms.h:12:
   In file included from include/linux/mm.h:1581:
   include/linux/vmstat.h:431:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     431 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> arch/x86/kernel/livepatch.c:55:6: warning: no previous prototype for function 'arch_check_jump_insn' [-Wmissing-prototypes]
      55 | bool arch_check_jump_insn(unsigned long func_addr)
         |      ^
   arch/x86/kernel/livepatch.c:55:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      55 | bool arch_check_jump_insn(unsigned long func_addr)
         | ^
         | static 
   arch/x86/kernel/livepatch.c:224:5: warning: no previous prototype for function 'arch_klp_check_calltrace' [-Wmissing-prototypes]
     224 | int arch_klp_check_calltrace(bool (*check_func)(void *, int *, unsigned long), void *data)
         |     ^
   arch/x86/kernel/livepatch.c:224:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     224 | int arch_klp_check_calltrace(bool (*check_func)(void *, int *, unsigned long), void *data)
         | ^
         | static 
   arch/x86/kernel/livepatch.c:309:6: warning: no previous prototype for function 'arch_klp_code_modify_prepare' [-Wmissing-prototypes]
     309 | void arch_klp_code_modify_prepare(void)
         |      ^
   arch/x86/kernel/livepatch.c:309:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     309 | void arch_klp_code_modify_prepare(void)
         | ^
         | static 
   arch/x86/kernel/livepatch.c:315:6: warning: no previous prototype for function 'arch_klp_code_modify_post_process' [-Wmissing-prototypes]
     315 | void arch_klp_code_modify_post_process(void)
         |      ^
   arch/x86/kernel/livepatch.c:315:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     315 | void arch_klp_code_modify_post_process(void)
         | ^
         | static 
   5 warnings generated.
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
   kernel/livepatch/core.c:1342:12: warning: no previous prototype for function 'arch_klp_check_calltrace' [-Wmissing-prototypes]
    1342 | int __weak arch_klp_check_calltrace(bool (*fn)(void *, int *, unsigned long), void *data)
         |            ^
   kernel/livepatch/core.c:1342:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1342 | int __weak arch_klp_check_calltrace(bool (*fn)(void *, int *, unsigned long), void *data)
         | ^
         | static 
>> kernel/livepatch/core.c:1347:13: warning: no previous prototype for function 'arch_check_jump_insn' [-Wmissing-prototypes]
    1347 | bool __weak arch_check_jump_insn(unsigned long func_addr)
         |             ^
   kernel/livepatch/core.c:1347:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1347 | bool __weak arch_check_jump_insn(unsigned long func_addr)
         | ^
         | static 
   kernel/livepatch/core.c:1352:12: warning: no previous prototype for function 'arch_klp_check_activeness_func' [-Wmissing-prototypes]
    1352 | int __weak arch_klp_check_activeness_func(struct klp_func *func, int enable,
         |            ^
   kernel/livepatch/core.c:1352:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1352 | int __weak arch_klp_check_activeness_func(struct klp_func *func, int enable,
         | ^
         | static 
   kernel/livepatch/core.c:1621:5: warning: no previous prototype for function 'klp_try_disable_patch' [-Wmissing-prototypes]
    1621 | int klp_try_disable_patch(void *data)
         |     ^
   kernel/livepatch/core.c:1621:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1621 | int klp_try_disable_patch(void *data)
         | ^
         | static 
   kernel/livepatch/core.c:1655:13: warning: no previous prototype for function 'arch_klp_code_modify_prepare' [-Wmissing-prototypes]
    1655 | void __weak arch_klp_code_modify_prepare(void)
         |             ^
   kernel/livepatch/core.c:1655:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1655 | void __weak arch_klp_code_modify_prepare(void)
         | ^
         | static 
   kernel/livepatch/core.c:1659:13: warning: no previous prototype for function 'arch_klp_code_modify_post_process' [-Wmissing-prototypes]
    1659 | void __weak arch_klp_code_modify_post_process(void)
         |             ^
   kernel/livepatch/core.c:1659:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1659 | void __weak arch_klp_code_modify_post_process(void)
         | ^
         | static 
   kernel/livepatch/core.c:1663:14: warning: no previous prototype for function 'arch_klp_mem_alloc' [-Wmissing-prototypes]
    1663 | void __weak *arch_klp_mem_alloc(size_t size)
         |              ^
   kernel/livepatch/core.c:1663:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1663 | void __weak *arch_klp_mem_alloc(size_t size)
         | ^
         | static 
   kernel/livepatch/core.c:1668:13: warning: no previous prototype for function 'arch_klp_mem_free' [-Wmissing-prototypes]
    1668 | void __weak arch_klp_mem_free(void *mem)
         |             ^
   kernel/livepatch/core.c:1668:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1668 | void __weak arch_klp_mem_free(void *mem)
         | ^
         | static 
   kernel/livepatch/core.c:1696:13: warning: no previous prototype for function 'arch_klp_set_brk_func' [-Wmissing-prototypes]
    1696 | void __weak arch_klp_set_brk_func(struct klp_func_node *func_node, void *new_func)
         |             ^
   kernel/livepatch/core.c:1696:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1696 | void __weak arch_klp_set_brk_func(struct klp_func_node *func_node, void *new_func)
         | ^
         | static 
   kernel/livepatch/core.c:2108:5: warning: no previous prototype for function 'klp_try_enable_patch' [-Wmissing-prototypes]
    2108 | int klp_try_enable_patch(void *data)
         |     ^
   kernel/livepatch/core.c:2108:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    2108 | int klp_try_enable_patch(void *data)
         | ^
         | static 
   13 warnings generated.


vim +/arch_check_jump_insn +55 arch/x86/kernel/livepatch.c

    54	
  > 55	bool arch_check_jump_insn(unsigned long func_addr)
    56	{
    57		int len = JMP_E9_INSN_SIZE;
    58		struct insn insn;
    59		u8 *addr = (u8*)func_addr;
    60	
    61		do {
    62			if (is_jump_insn(addr))
    63				return true;
    64			insn_init(&insn, addr, MAX_INSN_SIZE, 1);
    65			insn_get_length(&insn);
    66			if (!insn.length || !insn_complete(&insn))
    67				return true;
    68			len -= insn.length;
    69			addr += insn.length;
    70		} while (len > 0);
    71	
    72		return false;
    73	}
    74	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
