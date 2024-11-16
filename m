Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A49E9194A59
	for <oe-kbuild-all@lists.linux.dev>; Sat, 16 Nov 2024 23:10:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731798624; cv=none; b=WB5+T8US7JR1fffSoM8ptf1b9wxoBSIJ6QaPiTNDMOHbnyJOcN+GEwMzNpPxLs49oG1nTMK5B8zrlYRpmL54oBWRFO1LB+g/WoHuv10rKivzkfNMrIOytKXXnWqQrORdumYBu9Diox4xC0DmEg49ttqtRebb184U1a6TdWr6VkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731798624; c=relaxed/simple;
	bh=uh3j5UFQ1iRR/d5B8827/pj8ATxtasfgfRSKnfbgG5Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rUG0DqXAAtZsa+vHqi7uYNKQTNcJgAE6lBZ4xdfJkniT4MCW0H4Zb80mZcrltKKC9+60gV2DU1nhVD5MV6Fc3xejo7lKoiNbss0Am8DriM8ZPmj9gToG6hwIgPV7DGwF8qj5t6QXei11UVuH8Ba7VX1NkZ/rIZ3Ob3z+fpmhLNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ImfvPDCn; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ImfvPDCn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731798622; x=1763334622;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uh3j5UFQ1iRR/d5B8827/pj8ATxtasfgfRSKnfbgG5Q=;
  b=ImfvPDCnUIutZ7fItauKTA+kO+RQS9cxbvcAtW+gXbKlmNVrhcNuKOOo
   Dn89oQc6OgJuV3TgybHZ98vy931uKq2Ak49+bkXRpK5jIAP3UTGX/xOWf
   6YrgAJ0YY7/kSqV7xxtgUYbzEoYCuqv76i3Nby7AmZe48CE8OUTSvtAKN
   818760d/c96eU51CHULqPhv36zxiV/V7pInKLW6OCRFN84yrqWfCRP2Nw
   0aPTa2nGzw6HHiL5TlUdFWtrWhWVjVE5rRzo72Ziv28CgYB3EeIDzisUL
   RtQiCVH/cBf2DjnJndrelbd5N3ZdViFkZNWueGlIxQLz9VMCKgruHuwmH
   w==;
X-CSE-ConnectionGUID: nLyA1bIhQEKrJ6aaPxoFeQ==
X-CSE-MsgGUID: dlj+7gAtTSWY/dG8c8k7XQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11258"; a="31936053"
X-IronPort-AV: E=Sophos;i="6.12,160,1728975600"; 
   d="scan'208";a="31936053"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2024 15:10:19 -0800
X-CSE-ConnectionGUID: NB5X6JUpTu6SOAUNiyvE+A==
X-CSE-MsgGUID: dVMgcxndQe2Ejaa1WphBTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,160,1728975600"; 
   d="scan'208";a="88636103"
Received: from lkp-server01.sh.intel.com (HELO 1e3cc1889ffb) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 16 Nov 2024 15:10:17 -0800
Received: from kbuild by 1e3cc1889ffb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tCRvi-0001A3-2z;
	Sat, 16 Nov 2024 23:10:14 +0000
Date: Sun, 17 Nov 2024 07:09:44 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zheng Yejian <zhengyejian1@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 1474/1474] kernel/livepatch/core.c:1689:12:
 warning: no previous prototype for function 'arch_klp_check_activeness_func'
Message-ID: <202411170755.dWPSfLjC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   7c547c6bbe6b6a9cedf63d7cdadb2529404df633
commit: 8c7d888bedbc3642dcfa0ae682bb9fb2337de170 [1474/1474] livepatch/arm64: Support livepatch without ftrace
config: arm64-randconfig-003-20241117 (https://download.01.org/0day-ci/archive/20241117/202411170755.dWPSfLjC-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241117/202411170755.dWPSfLjC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411170755.dWPSfLjC-lkp@intel.com/

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
