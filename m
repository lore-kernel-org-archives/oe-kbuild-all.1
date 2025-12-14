Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0601C2D73A3
	for <oe-kbuild-all@lists.linux.dev>; Sun, 14 Dec 2025 17:17:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765732659; cv=none; b=TWkDjB0uOnvFnM23vvoY+h+BjiDm3f4wgM+5NhE6PSTKpfHj7fWVzUjayH1vSs1kFI7QpWoOBZnf9zMKq+a6/dBO7wLSSJ5+g5TWo04cU+zbrtMw0sJPvCHTiwH4k+2vui1lxpPpgI6sN35l3jBBt1o0r+R9m+OlOtXe8RHXU30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765732659; c=relaxed/simple;
	bh=dZXMAK2uhyD4wWmzFE0uV6cBD9R2TXznzcXRQ6kODNg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KP9xZfEfHtyTrtDpMMseY8JJ6Zephhiip2wA5+EOSMATt/9moknWDnfP0gUfYbr+DD9cK9ZCoKbeGJKqfFNeQwHl0CbophdSnJMVm3InwNWOqfiT5PHdbQ8JPlnc81L18slfQ0SGrqJY1Kc9XmTXYnAWFkH1bMvoTWXqIA1/fvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GDn98+Jc; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GDn98+Jc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765732657; x=1797268657;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dZXMAK2uhyD4wWmzFE0uV6cBD9R2TXznzcXRQ6kODNg=;
  b=GDn98+JcuE4AGIrbQqNygioFXQtdhVDYUv7Il/yenfFQA6NsxNmlDaaP
   bTYNMaE9THfk11CAHi0r/v7OpYRtqjv3z2MwNifGMRjkleKu6eGghTYW0
   3+ojmr7wvPGPNvM35Ij9+Exn+I9jm4edTywit3cfGxlz+J59Rk5I/3lcY
   21hl9J96pPCV+Fp1QrRZ7oPZq5vmJqfDZFTPCIK9cNomfU4VRsuFvQggv
   nHi3WgFdGjQlXllAhYTuVcfGLMpR9UED4BSnwKp9Dd1XeDNCZ5kBEb+bI
   nviR1SY4uUHYMbL3U4CHXQ3Dshvy+o9o7ioZLog3xZ6ajBxy8OX9vcD8k
   g==;
X-CSE-ConnectionGUID: PRdP2Z3XRO+ZJs+RGS07eQ==
X-CSE-MsgGUID: s/cFrdvFTjKwxDGp7q78ng==
X-IronPort-AV: E=McAfee;i="6800,10657,11642"; a="70230775"
X-IronPort-AV: E=Sophos;i="6.21,148,1763452800"; 
   d="scan'208";a="70230775"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2025 09:17:36 -0800
X-CSE-ConnectionGUID: SmFH/LjYQNWs6G9I2cIdoQ==
X-CSE-MsgGUID: HtncSLCBRcqwHlFEOFgo4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,148,1763452800"; 
   d="scan'208";a="202642192"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 14 Dec 2025 09:17:35 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUpiu-000000009Dp-1uM9;
	Sun, 14 Dec 2025 17:17:32 +0000
Date: Mon, 15 Dec 2025 01:16:44 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zheng Yejian <zhengyejian1@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3541/3541] kernel/livepatch/core.c:1689:12:
 warning: no previous prototype for function 'arch_klp_check_activeness_func'
Message-ID: <202512150123.LJIfaupb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Zheng,

First bad commit (maybe != root cause):

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   cd9eb9b4365b71652b2c2ac58293bea47c9f9302
commit: 8c7d888bedbc3642dcfa0ae682bb9fb2337de170 [3541/3541] livepatch/arm64: Support livepatch without ftrace
config: arm64-randconfig-001-20251212 (https://download.01.org/0day-ci/archive/20251215/202512150123.LJIfaupb-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251215/202512150123.LJIfaupb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512150123.LJIfaupb-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/livepatch/core.c:1689:12: warning: no previous prototype for function 'arch_klp_check_activeness_func' [-Wmissing-prototypes]
    1689 | int __weak arch_klp_check_activeness_func(struct klp_func *func, int enable,
         |            ^
   kernel/livepatch/core.c:1689:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1689 | int __weak arch_klp_check_activeness_func(struct klp_func *func, int enable,
         | ^
         | static 
>> kernel/livepatch/core.c:1913:14: warning: no previous prototype for function 'arch_klp_mem_alloc' [-Wmissing-prototypes]
    1913 | void __weak *arch_klp_mem_alloc(size_t size)
         |              ^
   kernel/livepatch/core.c:1913:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1913 | void __weak *arch_klp_mem_alloc(size_t size)
         | ^
         | static 
>> kernel/livepatch/core.c:1918:13: warning: no previous prototype for function 'arch_klp_mem_free' [-Wmissing-prototypes]
    1918 | void __weak arch_klp_mem_free(void *mem)
         |             ^
   kernel/livepatch/core.c:1918:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1918 | void __weak arch_klp_mem_free(void *mem)
         | ^
         | static 
>> kernel/livepatch/core.c:1923:13: warning: no previous prototype for function 'arch_klp_code_modify_prepare' [-Wmissing-prototypes]
    1923 | void __weak arch_klp_code_modify_prepare(void)
         |             ^
   kernel/livepatch/core.c:1923:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1923 | void __weak arch_klp_code_modify_prepare(void)
         | ^
         | static 
>> kernel/livepatch/core.c:1927:13: warning: no previous prototype for function 'arch_klp_code_modify_post_process' [-Wmissing-prototypes]
    1927 | void __weak arch_klp_code_modify_post_process(void)
         |             ^
   kernel/livepatch/core.c:1927:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1927 | void __weak arch_klp_code_modify_post_process(void)
         | ^
         | static 
   5 warnings generated.


vim +/arch_klp_check_activeness_func +1689 kernel/livepatch/core.c

583e6e55fb6aa19 Zheng Yejian 2023-12-23  1688  
583e6e55fb6aa19 Zheng Yejian 2023-12-23 @1689  int __weak arch_klp_check_activeness_func(struct klp_func *func, int enable,
583e6e55fb6aa19 Zheng Yejian 2023-12-23  1690  					  klp_add_func_t add_func,
583e6e55fb6aa19 Zheng Yejian 2023-12-23  1691  					  struct list_head *func_list)
583e6e55fb6aa19 Zheng Yejian 2023-12-23  1692  {
583e6e55fb6aa19 Zheng Yejian 2023-12-23  1693  	int ret;
583e6e55fb6aa19 Zheng Yejian 2023-12-23  1694  	unsigned long func_addr = 0;
583e6e55fb6aa19 Zheng Yejian 2023-12-23  1695  	unsigned long func_size;
583e6e55fb6aa19 Zheng Yejian 2023-12-23  1696  	struct klp_func_node *func_node = NULL;
583e6e55fb6aa19 Zheng Yejian 2023-12-23  1697  	unsigned long old_func = (unsigned long)func->old_func;
583e6e55fb6aa19 Zheng Yejian 2023-12-23  1698  
583e6e55fb6aa19 Zheng Yejian 2023-12-23  1699  	func_node = func->func_node;
583e6e55fb6aa19 Zheng Yejian 2023-12-23  1700  	/* Check func address in stack */
583e6e55fb6aa19 Zheng Yejian 2023-12-23  1701  	if (enable) {
583e6e55fb6aa19 Zheng Yejian 2023-12-23  1702  		if (func->patched || func->force == KLP_ENFORCEMENT)
583e6e55fb6aa19 Zheng Yejian 2023-12-23  1703  			return 0;
583e6e55fb6aa19 Zheng Yejian 2023-12-23  1704  		/*
583e6e55fb6aa19 Zheng Yejian 2023-12-23  1705  		 * When enable, checking the currently active functions.
583e6e55fb6aa19 Zheng Yejian 2023-12-23  1706  		 */
583e6e55fb6aa19 Zheng Yejian 2023-12-23  1707  		if (list_empty(&func_node->func_stack)) {
583e6e55fb6aa19 Zheng Yejian 2023-12-23  1708  			/*
583e6e55fb6aa19 Zheng Yejian 2023-12-23  1709  			 * Not patched on this function [the origin one]
583e6e55fb6aa19 Zheng Yejian 2023-12-23  1710  			 */
583e6e55fb6aa19 Zheng Yejian 2023-12-23  1711  			func_addr = old_func;
583e6e55fb6aa19 Zheng Yejian 2023-12-23  1712  			func_size = func->old_size;
583e6e55fb6aa19 Zheng Yejian 2023-12-23  1713  		} else {
583e6e55fb6aa19 Zheng Yejian 2023-12-23  1714  			/*
583e6e55fb6aa19 Zheng Yejian 2023-12-23  1715  			 * Previously patched function [the active one]
583e6e55fb6aa19 Zheng Yejian 2023-12-23  1716  			 */
583e6e55fb6aa19 Zheng Yejian 2023-12-23  1717  			struct klp_func *prev;
583e6e55fb6aa19 Zheng Yejian 2023-12-23  1718  
583e6e55fb6aa19 Zheng Yejian 2023-12-23  1719  			prev = list_first_or_null_rcu(&func_node->func_stack,
583e6e55fb6aa19 Zheng Yejian 2023-12-23  1720  						      struct klp_func, stack_node);
583e6e55fb6aa19 Zheng Yejian 2023-12-23  1721  			func_addr = (unsigned long)prev->new_func;
583e6e55fb6aa19 Zheng Yejian 2023-12-23  1722  			func_size = prev->new_size;
583e6e55fb6aa19 Zheng Yejian 2023-12-23  1723  		}
583e6e55fb6aa19 Zheng Yejian 2023-12-23  1724  		/*
583e6e55fb6aa19 Zheng Yejian 2023-12-23  1725  		 * When preemption is disabled and the replacement area
583e6e55fb6aa19 Zheng Yejian 2023-12-23  1726  		 * does not contain a jump instruction, the migration
583e6e55fb6aa19 Zheng Yejian 2023-12-23  1727  		 * thread is scheduled to run stop machine only after the
583e6e55fb6aa19 Zheng Yejian 2023-12-23  1728  		 * execution of instructions to be replaced is complete.
583e6e55fb6aa19 Zheng Yejian 2023-12-23  1729  		 */
583e6e55fb6aa19 Zheng Yejian 2023-12-23  1730  		if (IS_ENABLED(CONFIG_PREEMPTION) ||
583e6e55fb6aa19 Zheng Yejian 2023-12-23  1731  		    (func->force == KLP_NORMAL_FORCE) ||
583e6e55fb6aa19 Zheng Yejian 2023-12-23  1732  		    arch_check_jump_insn(func_addr)) {
583e6e55fb6aa19 Zheng Yejian 2023-12-23  1733  			ret = add_func(func_list, func_addr, func_size,
583e6e55fb6aa19 Zheng Yejian 2023-12-23  1734  				       func->old_name, func->force);
583e6e55fb6aa19 Zheng Yejian 2023-12-23  1735  			if (ret)
583e6e55fb6aa19 Zheng Yejian 2023-12-23  1736  				return ret;
583e6e55fb6aa19 Zheng Yejian 2023-12-23  1737  			if (func_addr != old_func) {
583e6e55fb6aa19 Zheng Yejian 2023-12-23  1738  				ret = add_func(func_list, old_func, KLP_MAX_REPLACE_SIZE,
583e6e55fb6aa19 Zheng Yejian 2023-12-23  1739  						func->old_name, func->force);
583e6e55fb6aa19 Zheng Yejian 2023-12-23  1740  				if (ret)
583e6e55fb6aa19 Zheng Yejian 2023-12-23  1741  					return ret;
583e6e55fb6aa19 Zheng Yejian 2023-12-23  1742  			}
583e6e55fb6aa19 Zheng Yejian 2023-12-23  1743  		}
583e6e55fb6aa19 Zheng Yejian 2023-12-23  1744  	} else {
583e6e55fb6aa19 Zheng Yejian 2023-12-23  1745  #ifdef CONFIG_PREEMPTION
583e6e55fb6aa19 Zheng Yejian 2023-12-23  1746  		/*
583e6e55fb6aa19 Zheng Yejian 2023-12-23  1747  		 * No scheduling point in the replacement instructions. Therefore,
583e6e55fb6aa19 Zheng Yejian 2023-12-23  1748  		 * when preemption is not enabled, atomic execution is performed
583e6e55fb6aa19 Zheng Yejian 2023-12-23  1749  		 * and these instructions will not appear on the stack.
583e6e55fb6aa19 Zheng Yejian 2023-12-23  1750  		 */
583e6e55fb6aa19 Zheng Yejian 2023-12-23  1751  		if (list_is_singular(&func_node->func_stack)) {
583e6e55fb6aa19 Zheng Yejian 2023-12-23  1752  			func_addr = old_func;
583e6e55fb6aa19 Zheng Yejian 2023-12-23  1753  			func_size = func->old_size;
583e6e55fb6aa19 Zheng Yejian 2023-12-23  1754  		} else {
583e6e55fb6aa19 Zheng Yejian 2023-12-23  1755  			struct klp_func *prev;
583e6e55fb6aa19 Zheng Yejian 2023-12-23  1756  
583e6e55fb6aa19 Zheng Yejian 2023-12-23  1757  			prev = list_first_or_null_rcu(
583e6e55fb6aa19 Zheng Yejian 2023-12-23  1758  					&func_node->func_stack,
583e6e55fb6aa19 Zheng Yejian 2023-12-23  1759  					struct klp_func, stack_node);
583e6e55fb6aa19 Zheng Yejian 2023-12-23  1760  			func_addr = (unsigned long)prev->new_func;
583e6e55fb6aa19 Zheng Yejian 2023-12-23  1761  			func_size = prev->new_size;
583e6e55fb6aa19 Zheng Yejian 2023-12-23  1762  		}
583e6e55fb6aa19 Zheng Yejian 2023-12-23  1763  		ret = add_func(func_list, func_addr,
583e6e55fb6aa19 Zheng Yejian 2023-12-23  1764  				func_size, func->old_name, 0);
583e6e55fb6aa19 Zheng Yejian 2023-12-23  1765  		if (ret)
583e6e55fb6aa19 Zheng Yejian 2023-12-23  1766  			return ret;
583e6e55fb6aa19 Zheng Yejian 2023-12-23  1767  		if (func_addr != old_func) {
583e6e55fb6aa19 Zheng Yejian 2023-12-23  1768  			ret = add_func(func_list, old_func, KLP_MAX_REPLACE_SIZE,
583e6e55fb6aa19 Zheng Yejian 2023-12-23  1769  					func->old_name, 0);
583e6e55fb6aa19 Zheng Yejian 2023-12-23  1770  			if (ret)
583e6e55fb6aa19 Zheng Yejian 2023-12-23  1771  				return ret;
583e6e55fb6aa19 Zheng Yejian 2023-12-23  1772  		}
583e6e55fb6aa19 Zheng Yejian 2023-12-23  1773  #endif
583e6e55fb6aa19 Zheng Yejian 2023-12-23  1774  
583e6e55fb6aa19 Zheng Yejian 2023-12-23  1775  		func_addr = (unsigned long)func->new_func;
583e6e55fb6aa19 Zheng Yejian 2023-12-23  1776  		func_size = func->new_size;
583e6e55fb6aa19 Zheng Yejian 2023-12-23  1777  		ret = add_func(func_list, func_addr,
583e6e55fb6aa19 Zheng Yejian 2023-12-23  1778  				func_size, func->old_name, 0);
583e6e55fb6aa19 Zheng Yejian 2023-12-23  1779  		if (ret)
583e6e55fb6aa19 Zheng Yejian 2023-12-23  1780  			return ret;
583e6e55fb6aa19 Zheng Yejian 2023-12-23  1781  	}
583e6e55fb6aa19 Zheng Yejian 2023-12-23  1782  	return 0;
583e6e55fb6aa19 Zheng Yejian 2023-12-23  1783  }
583e6e55fb6aa19 Zheng Yejian 2023-12-23  1784  

:::::: The code at line 1689 was first introduced by commit
:::::: 583e6e55fb6aa193b1a82909069e8028c5d5653d livepatch/x86: Support livepatch without ftrace

:::::: TO: Zheng Yejian <zhengyejian1@huawei.com>
:::::: CC: Zheng Yejian <zhengyejian1@huawei.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
