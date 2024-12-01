Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19C904C66
	for <oe-kbuild-all@lists.linux.dev>; Sun,  1 Dec 2024 05:02:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733029372; cv=none; b=LlyPtRQOrjN9Gg/ytQgZM4uQNYz6jYO/Ium8XZujP4Bg57GyPys1MtJCVEk9+4YzFHGHVmm5Fp25xqh7S1Om5D2ZLifXVsrlYdi3fXzVCcheuW0CH+RTPNUU+2UAAIKR6t7UiAG4H1jLGNgELAtCRx8MEW0gRgkfVHGh3k/JAy4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733029372; c=relaxed/simple;
	bh=8PRgN56N+0Bd0VkX/pdCPtVO37Jhyyn7Gv4Taf6LccQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nrx0sNDKhxSWcHM4ikkVglrChju4HHJ+RNvTgk6CSiGv1Fa7tLRDX/SyU11ZEf+dH4orZI8FXhV7ltbztqPEvL+1rUvswk0BsnEinBA6fUcnV87Kwsx+YaiL9hGQ/CqFwyO78Nfyx+pc1fLrpFYum3wkuUPk01bAB+oYugXfglk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OJHvMFu1; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OJHvMFu1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733029370; x=1764565370;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8PRgN56N+0Bd0VkX/pdCPtVO37Jhyyn7Gv4Taf6LccQ=;
  b=OJHvMFu1hIBGmRflcHqwrV9lLguYV377ALAS5SDUWVB+gPdC7GmDxwUA
   HjI0Mih7lTGPTi5Rp6AGOlKELU9Cbvy99uQc3NyXe/1nEptHeU+SYTAg6
   /FpD3Yn/+iEWQNAcUULyNcqVmV98lX/b7tm7EY4xPU3odxmk+OD07CnbL
   qT8fsQwh0oby+KD0BD5u9CCjshQbhkLulW/PspIfquFp/J0SRbBDocb1S
   AkhTh0UAU5DjIVQHIxa9AeC8QGbE7KCOWdGhUHJCynwX7pQxu3IOM7Tue
   4ngqQFO0ZP+BD09Ap5fXl9qPCjiYPiY9viSVUtWfWBjyfW+iFmMy+5x6a
   w==;
X-CSE-ConnectionGUID: 5IrLI50JQ1mCxLHG9bVeIw==
X-CSE-MsgGUID: f5uAgrGkQp2/0oFjRxc2fA==
X-IronPort-AV: E=McAfee;i="6700,10204,11272"; a="44250911"
X-IronPort-AV: E=Sophos;i="6.12,199,1728975600"; 
   d="scan'208";a="44250911"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2024 21:02:49 -0800
X-CSE-ConnectionGUID: wfvGqOYIRu+EltNwnpHjRA==
X-CSE-MsgGUID: kMLE1BDhSv+tAHt3kYQIiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,199,1728975600"; 
   d="scan'208";a="97212794"
Received: from lkp-server02.sh.intel.com (HELO 36a1563c48ff) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 30 Nov 2024 21:02:45 -0800
Received: from kbuild by 36a1563c48ff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tHc4y-0001Fr-0a;
	Sun, 01 Dec 2024 05:01:27 +0000
Date: Sun, 1 Dec 2024 12:59:36 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zheng Yejian <zhengyejian1@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 1474/1474] kernel/livepatch/core.c:97:12:
 warning: no previous prototype for function 'arch_klp_init_func'
Message-ID: <202412011224.cLtYmSDE-lkp@intel.com>
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
commit: eabc33c6f2c91168537f10e9275b0921c9f78c45 [1474/1474] livepatch/ppc64: Implement livepatch without ftrace for ppc64be
config: arm64-randconfig-003-20241117 (https://download.01.org/0day-ci/archive/20241201/202412011224.cLtYmSDE-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241201/202412011224.cLtYmSDE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412011224.cLtYmSDE-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/livepatch/core.c:97:12: warning: no previous prototype for function 'arch_klp_init_func' [-Wmissing-prototypes]
   int __weak arch_klp_init_func(struct klp_object *obj, struct klp_func *func)
              ^
   kernel/livepatch/core.c:97:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int __weak arch_klp_init_func(struct klp_object *obj, struct klp_func *func)
   ^
   static 
   kernel/livepatch/core.c:1756:12: warning: no previous prototype for function 'arch_klp_check_activeness_func' [-Wmissing-prototypes]
   int __weak arch_klp_check_activeness_func(struct klp_func *func, int enable,
              ^
   kernel/livepatch/core.c:1756:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int __weak arch_klp_check_activeness_func(struct klp_func *func, int enable,
   ^
   static 
   kernel/livepatch/core.c:2011:14: warning: no previous prototype for function 'arch_klp_mem_alloc' [-Wmissing-prototypes]
   void __weak *arch_klp_mem_alloc(size_t size)
                ^
   kernel/livepatch/core.c:2011:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void __weak *arch_klp_mem_alloc(size_t size)
   ^
   static 
   kernel/livepatch/core.c:2016:13: warning: no previous prototype for function 'arch_klp_mem_free' [-Wmissing-prototypes]
   void __weak arch_klp_mem_free(void *mem)
               ^
   kernel/livepatch/core.c:2016:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void __weak arch_klp_mem_free(void *mem)
   ^
   static 
   kernel/livepatch/core.c:2021:13: warning: no previous prototype for function 'arch_klp_code_modify_prepare' [-Wmissing-prototypes]
   void __weak arch_klp_code_modify_prepare(void)
               ^
   kernel/livepatch/core.c:2021:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void __weak arch_klp_code_modify_prepare(void)
   ^
   static 
   kernel/livepatch/core.c:2025:13: warning: no previous prototype for function 'arch_klp_code_modify_post_process' [-Wmissing-prototypes]
   void __weak arch_klp_code_modify_post_process(void)
               ^
   kernel/livepatch/core.c:2025:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void __weak arch_klp_code_modify_post_process(void)
   ^
   static 
   kernel/livepatch/core.c:2038:12: warning: no previous prototype for function 'arch_klp_check_breakpoint' [-Wmissing-prototypes]
   int __weak arch_klp_check_breakpoint(struct arch_klp_data *arch_data, void *old_func)
              ^
   kernel/livepatch/core.c:2038:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int __weak arch_klp_check_breakpoint(struct arch_klp_data *arch_data, void *old_func)
   ^
   static 
   kernel/livepatch/core.c:2052:13: warning: no previous prototype for function 'arch_klp_set_brk_func' [-Wmissing-prototypes]
   void __weak arch_klp_set_brk_func(struct klp_func_node *func_node, void *new_func)
               ^
   kernel/livepatch/core.c:2052:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void __weak arch_klp_set_brk_func(struct klp_func_node *func_node, void *new_func)
   ^
   static 
   8 warnings generated.


vim +/arch_klp_init_func +97 kernel/livepatch/core.c

    96	
  > 97	int __weak arch_klp_init_func(struct klp_object *obj, struct klp_func *func)
    98	{
    99		return 0;
   100	}
   101	#endif /* CONFIG_LIVEPATCH_FTRACE */
   102	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
