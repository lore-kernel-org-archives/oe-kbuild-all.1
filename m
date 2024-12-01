Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97A4279C0
	for <oe-kbuild-all@lists.linux.dev>; Sun,  1 Dec 2024 01:20:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733016007; cv=none; b=gyktb11dmjpa7ISdPfBbOtY/ObLuqkcl/fvCf2rY29QxrAFTptwqGZMgWVxgH1M96vGwnGkAyDZXQtYv5A5Mu98hzhuRk+nJxCDJn6tgtq9fjDBhrJRD0aqQIR7+06aNs4PHoxWUZYVLZu/zSQEWi6XpzIBh6UjceVUMsvdElUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733016007; c=relaxed/simple;
	bh=Nio/H02e7FKcOA/V8QDKVlzhB0f+FqEJgfh5MPUxzTE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LFpsWBjgWhkPeQbvsFGy3wIpRjJXnF9XncauQIh1UO5tKdzObtknk30ptUNveEhzcjFTd50kncU7UsOlNzVpn6SnLRjJGF6B+tpmLnqxdcYQiidz3mh6f+41mMO1n4nwqnHAgcL3fh21t0oPrnBOkzUz1Zgy852Zhh7pCEH/au0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RZOxRb01; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RZOxRb01"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733016005; x=1764552005;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Nio/H02e7FKcOA/V8QDKVlzhB0f+FqEJgfh5MPUxzTE=;
  b=RZOxRb01Ei868VJnuWCge5y415bOjuxqTuPcHVjwpEBbJw1tjG9UQw2S
   m9L2mwrFcrZsKprkr+peihTTOw7T5/CELQmk4/VMapwTuaBvbjLc16uLG
   lqeNMRVCYyAVaC8VQyX0psEptpjzA01Zw4B5ScQutA8eOYKWDEpGJ/vZp
   b1J0k+QAlNVOOUji4EzaPYKl+F59T8kAIcvwSBzsQ+q/ZFluMIOWrAL3h
   ugXp+Vx0+uWEcguBEs0gheUo/DA/WJgPCMrWrwMcP6A8P82cJoQwO+jxK
   sepDH2a+kS2gLvlwUeVKPJ8buHoFeQDEeAyDYpBTZ/blUIkrXO7BtHM9J
   w==;
X-CSE-ConnectionGUID: p7lkXMELRo2WZd+IKoA70Q==
X-CSE-MsgGUID: D+K7WTFZTeeSBMROVojQ3g==
X-IronPort-AV: E=McAfee;i="6700,10204,11272"; a="33134698"
X-IronPort-AV: E=Sophos;i="6.12,199,1728975600"; 
   d="scan'208";a="33134698"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2024 17:20:04 -0800
X-CSE-ConnectionGUID: C0ZAQePsQIKe0QJw7ZEUYA==
X-CSE-MsgGUID: av+A6bsRRdudWfLZInX+iw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,199,1728975600"; 
   d="scan'208";a="92584716"
Received: from lkp-server02.sh.intel.com (HELO 36a1563c48ff) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 30 Nov 2024 17:20:02 -0800
Received: from kbuild by 36a1563c48ff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tHYcy-00016b-1U;
	Sun, 01 Dec 2024 01:20:00 +0000
Date: Sun, 1 Dec 2024 09:19:00 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zheng Yejian <zhengyejian1@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 1474/1474] kernel/livepatch/core.c:1689:12:
 warning: no previous prototype for function 'arch_klp_check_activeness_func'
Message-ID: <202412010915.p20h2tra-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Zheng,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   df4c334beecb4cf58e4e8d63b491aa5ac0a84f46
commit: 8c7d888bedbc3642dcfa0ae682bb9fb2337de170 [1474/1474] livepatch/arm64: Support livepatch without ftrace
config: arm64-randconfig-003-20241117 (https://download.01.org/0day-ci/archive/20241201/202412010915.p20h2tra-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241201/202412010915.p20h2tra-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412010915.p20h2tra-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/livepatch/core.c:1689:12: warning: no previous prototype for function 'arch_klp_check_activeness_func' [-Wmissing-prototypes]
   int __weak arch_klp_check_activeness_func(struct klp_func *func, int enable,
              ^
   kernel/livepatch/core.c:1689:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int __weak arch_klp_check_activeness_func(struct klp_func *func, int enable,
   ^
   static 
>> kernel/livepatch/core.c:1913:14: warning: no previous prototype for function 'arch_klp_mem_alloc' [-Wmissing-prototypes]
   void __weak *arch_klp_mem_alloc(size_t size)
                ^
   kernel/livepatch/core.c:1913:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void __weak *arch_klp_mem_alloc(size_t size)
   ^
   static 
>> kernel/livepatch/core.c:1918:13: warning: no previous prototype for function 'arch_klp_mem_free' [-Wmissing-prototypes]
   void __weak arch_klp_mem_free(void *mem)
               ^
   kernel/livepatch/core.c:1918:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void __weak arch_klp_mem_free(void *mem)
   ^
   static 
>> kernel/livepatch/core.c:1923:13: warning: no previous prototype for function 'arch_klp_code_modify_prepare' [-Wmissing-prototypes]
   void __weak arch_klp_code_modify_prepare(void)
               ^
   kernel/livepatch/core.c:1923:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void __weak arch_klp_code_modify_prepare(void)
   ^
   static 
>> kernel/livepatch/core.c:1927:13: warning: no previous prototype for function 'arch_klp_code_modify_post_process' [-Wmissing-prototypes]
   void __weak arch_klp_code_modify_post_process(void)
               ^
   kernel/livepatch/core.c:1927:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void __weak arch_klp_code_modify_post_process(void)
   ^
   static 
   5 warnings generated.


vim +/arch_klp_check_activeness_func +1689 kernel/livepatch/core.c

583e6e55fb6aa1 Zheng Yejian 2023-12-23  1688  
583e6e55fb6aa1 Zheng Yejian 2023-12-23 @1689  int __weak arch_klp_check_activeness_func(struct klp_func *func, int enable,
583e6e55fb6aa1 Zheng Yejian 2023-12-23  1690  					  klp_add_func_t add_func,
583e6e55fb6aa1 Zheng Yejian 2023-12-23  1691  					  struct list_head *func_list)
583e6e55fb6aa1 Zheng Yejian 2023-12-23  1692  {
583e6e55fb6aa1 Zheng Yejian 2023-12-23  1693  	int ret;
583e6e55fb6aa1 Zheng Yejian 2023-12-23  1694  	unsigned long func_addr = 0;
583e6e55fb6aa1 Zheng Yejian 2023-12-23  1695  	unsigned long func_size;
583e6e55fb6aa1 Zheng Yejian 2023-12-23  1696  	struct klp_func_node *func_node = NULL;
583e6e55fb6aa1 Zheng Yejian 2023-12-23  1697  	unsigned long old_func = (unsigned long)func->old_func;
583e6e55fb6aa1 Zheng Yejian 2023-12-23  1698  
583e6e55fb6aa1 Zheng Yejian 2023-12-23  1699  	func_node = func->func_node;
583e6e55fb6aa1 Zheng Yejian 2023-12-23  1700  	/* Check func address in stack */
583e6e55fb6aa1 Zheng Yejian 2023-12-23  1701  	if (enable) {
583e6e55fb6aa1 Zheng Yejian 2023-12-23  1702  		if (func->patched || func->force == KLP_ENFORCEMENT)
583e6e55fb6aa1 Zheng Yejian 2023-12-23  1703  			return 0;
583e6e55fb6aa1 Zheng Yejian 2023-12-23  1704  		/*
583e6e55fb6aa1 Zheng Yejian 2023-12-23  1705  		 * When enable, checking the currently active functions.
583e6e55fb6aa1 Zheng Yejian 2023-12-23  1706  		 */
583e6e55fb6aa1 Zheng Yejian 2023-12-23  1707  		if (list_empty(&func_node->func_stack)) {
583e6e55fb6aa1 Zheng Yejian 2023-12-23  1708  			/*
583e6e55fb6aa1 Zheng Yejian 2023-12-23  1709  			 * Not patched on this function [the origin one]
583e6e55fb6aa1 Zheng Yejian 2023-12-23  1710  			 */
583e6e55fb6aa1 Zheng Yejian 2023-12-23  1711  			func_addr = old_func;
583e6e55fb6aa1 Zheng Yejian 2023-12-23  1712  			func_size = func->old_size;
583e6e55fb6aa1 Zheng Yejian 2023-12-23  1713  		} else {
583e6e55fb6aa1 Zheng Yejian 2023-12-23  1714  			/*
583e6e55fb6aa1 Zheng Yejian 2023-12-23  1715  			 * Previously patched function [the active one]
583e6e55fb6aa1 Zheng Yejian 2023-12-23  1716  			 */
583e6e55fb6aa1 Zheng Yejian 2023-12-23  1717  			struct klp_func *prev;
583e6e55fb6aa1 Zheng Yejian 2023-12-23  1718  
583e6e55fb6aa1 Zheng Yejian 2023-12-23  1719  			prev = list_first_or_null_rcu(&func_node->func_stack,
583e6e55fb6aa1 Zheng Yejian 2023-12-23  1720  						      struct klp_func, stack_node);
583e6e55fb6aa1 Zheng Yejian 2023-12-23  1721  			func_addr = (unsigned long)prev->new_func;
583e6e55fb6aa1 Zheng Yejian 2023-12-23  1722  			func_size = prev->new_size;
583e6e55fb6aa1 Zheng Yejian 2023-12-23  1723  		}
583e6e55fb6aa1 Zheng Yejian 2023-12-23  1724  		/*
583e6e55fb6aa1 Zheng Yejian 2023-12-23  1725  		 * When preemption is disabled and the replacement area
583e6e55fb6aa1 Zheng Yejian 2023-12-23  1726  		 * does not contain a jump instruction, the migration
583e6e55fb6aa1 Zheng Yejian 2023-12-23  1727  		 * thread is scheduled to run stop machine only after the
583e6e55fb6aa1 Zheng Yejian 2023-12-23  1728  		 * execution of instructions to be replaced is complete.
583e6e55fb6aa1 Zheng Yejian 2023-12-23  1729  		 */
583e6e55fb6aa1 Zheng Yejian 2023-12-23  1730  		if (IS_ENABLED(CONFIG_PREEMPTION) ||
583e6e55fb6aa1 Zheng Yejian 2023-12-23  1731  		    (func->force == KLP_NORMAL_FORCE) ||
583e6e55fb6aa1 Zheng Yejian 2023-12-23  1732  		    arch_check_jump_insn(func_addr)) {
583e6e55fb6aa1 Zheng Yejian 2023-12-23  1733  			ret = add_func(func_list, func_addr, func_size,
583e6e55fb6aa1 Zheng Yejian 2023-12-23  1734  				       func->old_name, func->force);
583e6e55fb6aa1 Zheng Yejian 2023-12-23  1735  			if (ret)
583e6e55fb6aa1 Zheng Yejian 2023-12-23  1736  				return ret;
583e6e55fb6aa1 Zheng Yejian 2023-12-23  1737  			if (func_addr != old_func) {
583e6e55fb6aa1 Zheng Yejian 2023-12-23  1738  				ret = add_func(func_list, old_func, KLP_MAX_REPLACE_SIZE,
583e6e55fb6aa1 Zheng Yejian 2023-12-23  1739  						func->old_name, func->force);
583e6e55fb6aa1 Zheng Yejian 2023-12-23  1740  				if (ret)
583e6e55fb6aa1 Zheng Yejian 2023-12-23  1741  					return ret;
583e6e55fb6aa1 Zheng Yejian 2023-12-23  1742  			}
583e6e55fb6aa1 Zheng Yejian 2023-12-23  1743  		}
583e6e55fb6aa1 Zheng Yejian 2023-12-23  1744  	} else {
583e6e55fb6aa1 Zheng Yejian 2023-12-23  1745  #ifdef CONFIG_PREEMPTION
583e6e55fb6aa1 Zheng Yejian 2023-12-23  1746  		/*
583e6e55fb6aa1 Zheng Yejian 2023-12-23  1747  		 * No scheduling point in the replacement instructions. Therefore,
583e6e55fb6aa1 Zheng Yejian 2023-12-23  1748  		 * when preemption is not enabled, atomic execution is performed
583e6e55fb6aa1 Zheng Yejian 2023-12-23  1749  		 * and these instructions will not appear on the stack.
583e6e55fb6aa1 Zheng Yejian 2023-12-23  1750  		 */
583e6e55fb6aa1 Zheng Yejian 2023-12-23  1751  		if (list_is_singular(&func_node->func_stack)) {
583e6e55fb6aa1 Zheng Yejian 2023-12-23  1752  			func_addr = old_func;
583e6e55fb6aa1 Zheng Yejian 2023-12-23  1753  			func_size = func->old_size;
583e6e55fb6aa1 Zheng Yejian 2023-12-23  1754  		} else {
583e6e55fb6aa1 Zheng Yejian 2023-12-23  1755  			struct klp_func *prev;
583e6e55fb6aa1 Zheng Yejian 2023-12-23  1756  
583e6e55fb6aa1 Zheng Yejian 2023-12-23  1757  			prev = list_first_or_null_rcu(
583e6e55fb6aa1 Zheng Yejian 2023-12-23  1758  					&func_node->func_stack,
583e6e55fb6aa1 Zheng Yejian 2023-12-23  1759  					struct klp_func, stack_node);
583e6e55fb6aa1 Zheng Yejian 2023-12-23  1760  			func_addr = (unsigned long)prev->new_func;
583e6e55fb6aa1 Zheng Yejian 2023-12-23  1761  			func_size = prev->new_size;
583e6e55fb6aa1 Zheng Yejian 2023-12-23  1762  		}
583e6e55fb6aa1 Zheng Yejian 2023-12-23  1763  		ret = add_func(func_list, func_addr,
583e6e55fb6aa1 Zheng Yejian 2023-12-23  1764  				func_size, func->old_name, 0);
583e6e55fb6aa1 Zheng Yejian 2023-12-23  1765  		if (ret)
583e6e55fb6aa1 Zheng Yejian 2023-12-23  1766  			return ret;
583e6e55fb6aa1 Zheng Yejian 2023-12-23  1767  		if (func_addr != old_func) {
583e6e55fb6aa1 Zheng Yejian 2023-12-23  1768  			ret = add_func(func_list, old_func, KLP_MAX_REPLACE_SIZE,
583e6e55fb6aa1 Zheng Yejian 2023-12-23  1769  					func->old_name, 0);
583e6e55fb6aa1 Zheng Yejian 2023-12-23  1770  			if (ret)
583e6e55fb6aa1 Zheng Yejian 2023-12-23  1771  				return ret;
583e6e55fb6aa1 Zheng Yejian 2023-12-23  1772  		}
583e6e55fb6aa1 Zheng Yejian 2023-12-23  1773  #endif
583e6e55fb6aa1 Zheng Yejian 2023-12-23  1774  
583e6e55fb6aa1 Zheng Yejian 2023-12-23  1775  		func_addr = (unsigned long)func->new_func;
583e6e55fb6aa1 Zheng Yejian 2023-12-23  1776  		func_size = func->new_size;
583e6e55fb6aa1 Zheng Yejian 2023-12-23  1777  		ret = add_func(func_list, func_addr,
583e6e55fb6aa1 Zheng Yejian 2023-12-23  1778  				func_size, func->old_name, 0);
583e6e55fb6aa1 Zheng Yejian 2023-12-23  1779  		if (ret)
583e6e55fb6aa1 Zheng Yejian 2023-12-23  1780  			return ret;
583e6e55fb6aa1 Zheng Yejian 2023-12-23  1781  	}
583e6e55fb6aa1 Zheng Yejian 2023-12-23  1782  	return 0;
583e6e55fb6aa1 Zheng Yejian 2023-12-23  1783  }
583e6e55fb6aa1 Zheng Yejian 2023-12-23  1784  

:::::: The code at line 1689 was first introduced by commit
:::::: 583e6e55fb6aa193b1a82909069e8028c5d5653d livepatch/x86: Support livepatch without ftrace

:::::: TO: Zheng Yejian <zhengyejian1@huawei.com>
:::::: CC: Zheng Yejian <zhengyejian1@huawei.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
