Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADCF515E96
	for <oe-kbuild-all@lists.linux.dev>; Sun, 17 Nov 2024 05:17:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731820622; cv=none; b=njWmYLhww9h1PiLrLGle05JPTqYtoty/n4Ey9ncdRo5ImivXz9FP20oQtYzC4KoeJtiRDmXuDGFN0GrQYaikXtqKJsK6WxPb1bDcxKx372gArAaMKE0hpSLh4KJ4oBPgaCRPu+0J2ydWtTWXNEEOjKxw0GdAQOXe7Gu2/J+kMpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731820622; c=relaxed/simple;
	bh=nLNGzpy/NZRtIK8Ur6sfjzbutqdR+dICxV25AD7NJ9o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bHUUvZ0VlSK+9gR4jAwhmAQzCArFblbC8GxV1QPtG93zhNhsWC646tPXNxjUG+hjWoJLS3nnhWZ8x5LkkA9tPWrK6CXFeHwBI1KxtZ8ulAov30jFih9fIw3ohAcOxWhbeJQVE9aVVfZJ+XC8ZP1KlZgRHV4WqAfj+0IJjVlPe78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jmuT7bqQ; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jmuT7bqQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731820621; x=1763356621;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nLNGzpy/NZRtIK8Ur6sfjzbutqdR+dICxV25AD7NJ9o=;
  b=jmuT7bqQk1wxL2WVfY4s2eupYV+/yBDwPpG3o3+tPCm17J2TFOsuM1M5
   JgwXtUTsNcZkX9Bw4oOM0kGUkj/7hLAFzutYjaWTp0pVCMi9qFnL4xNso
   0b71c3nomoj9uQhNFZCAxssboGMGFVYwYehbgWC2goPlkcspwv7iSoCrs
   zVjl6u65mkntSxgYHLtHvyYnUBNGp5ZBllAxqzHnCq3jIJeDUcj3CeGDR
   x5y3oScytY0VYKQ+PcaXisgs/2785QrBI3kLBjIlXfByBqt5dgucVsIcw
   BgdLyOi8r84xW3AY9eld8fgakAxwPqzhsckUASJTMOKndFOs9iqGX+Rf/
   g==;
X-CSE-ConnectionGUID: +Evpb+xCTfCP5IAJDO44Vg==
X-CSE-MsgGUID: LCJ3mvFCQX+fOwklTyGp3g==
X-IronPort-AV: E=McAfee;i="6700,10204,11258"; a="43182550"
X-IronPort-AV: E=Sophos;i="6.12,161,1728975600"; 
   d="scan'208";a="43182550"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2024 21:16:58 -0800
X-CSE-ConnectionGUID: NfGgMytCRX+BJ7lD4DK4Dg==
X-CSE-MsgGUID: PFsdeje3T4Whgg5UtqUHhw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,161,1728975600"; 
   d="scan'208";a="88677865"
Received: from lkp-server01.sh.intel.com (HELO 1e3cc1889ffb) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 16 Nov 2024 21:16:57 -0800
Received: from kbuild by 1e3cc1889ffb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tCXeY-0001Yt-2K;
	Sun, 17 Nov 2024 05:16:54 +0000
Date: Sun, 17 Nov 2024 13:16:12 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, laokz <laokz@foxmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 1474/1474] kernel/livepatch/core.c:216:13:
 warning: no previous prototype for function 'arch_klp_skip_resolve'
Message-ID: <202411171312.1qX29CJl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi laokz,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   7c547c6bbe6b6a9cedf63d7cdadb2529404df633
commit: b8f3220637be1736c165c289c634f27841ac4e01 [1474/1474] livepatch: add arch hook before doing klp_resolve_symbols
config: arm64-randconfig-003-20241117 (https://download.01.org/0day-ci/archive/20241117/202411171312.1qX29CJl-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241117/202411171312.1qX29CJl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411171312.1qX29CJl-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/livepatch/core.c:97:12: warning: no previous prototype for function 'arch_klp_init_func' [-Wmissing-prototypes]
   int __weak arch_klp_init_func(struct klp_object *obj, struct klp_func *func)
              ^
   kernel/livepatch/core.c:97:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int __weak arch_klp_init_func(struct klp_object *obj, struct klp_func *func)
   ^
   static 
>> kernel/livepatch/core.c:216:13: warning: no previous prototype for function 'arch_klp_skip_resolve' [-Wmissing-prototypes]
   bool __weak arch_klp_skip_resolve(unsigned int type)
               ^
   kernel/livepatch/core.c:216:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   bool __weak arch_klp_skip_resolve(unsigned int type)
   ^
   static 
   kernel/livepatch/core.c:1767:12: warning: no previous prototype for function 'arch_klp_check_activeness_func' [-Wmissing-prototypes]
   int __weak arch_klp_check_activeness_func(struct klp_func *func, int enable,
              ^
   kernel/livepatch/core.c:1767:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int __weak arch_klp_check_activeness_func(struct klp_func *func, int enable,
   ^
   static 
   kernel/livepatch/core.c:2022:14: warning: no previous prototype for function 'arch_klp_mem_alloc' [-Wmissing-prototypes]
   void __weak *arch_klp_mem_alloc(size_t size)
                ^
   kernel/livepatch/core.c:2022:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void __weak *arch_klp_mem_alloc(size_t size)
   ^
   static 
   kernel/livepatch/core.c:2027:13: warning: no previous prototype for function 'arch_klp_mem_free' [-Wmissing-prototypes]
   void __weak arch_klp_mem_free(void *mem)
               ^
   kernel/livepatch/core.c:2027:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void __weak arch_klp_mem_free(void *mem)
   ^
   static 
   kernel/livepatch/core.c:2032:13: warning: no previous prototype for function 'arch_klp_code_modify_prepare' [-Wmissing-prototypes]
   void __weak arch_klp_code_modify_prepare(void)
               ^
   kernel/livepatch/core.c:2032:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void __weak arch_klp_code_modify_prepare(void)
   ^
   static 
   kernel/livepatch/core.c:2036:13: warning: no previous prototype for function 'arch_klp_code_modify_post_process' [-Wmissing-prototypes]
   void __weak arch_klp_code_modify_post_process(void)
               ^
   kernel/livepatch/core.c:2036:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void __weak arch_klp_code_modify_post_process(void)
   ^
   static 
   kernel/livepatch/core.c:2049:12: warning: no previous prototype for function 'arch_klp_check_breakpoint' [-Wmissing-prototypes]
   int __weak arch_klp_check_breakpoint(struct arch_klp_data *arch_data, void *old_func)
              ^
   kernel/livepatch/core.c:2049:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int __weak arch_klp_check_breakpoint(struct arch_klp_data *arch_data, void *old_func)
   ^
   static 
   kernel/livepatch/core.c:2063:13: warning: no previous prototype for function 'arch_klp_set_brk_func' [-Wmissing-prototypes]
   void __weak arch_klp_set_brk_func(struct klp_func_node *func_node, void *new_func)
               ^
   kernel/livepatch/core.c:2063:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void __weak arch_klp_set_brk_func(struct klp_func_node *func_node, void *new_func)
   ^
   static 
   9 warnings generated.


vim +/arch_klp_skip_resolve +216 kernel/livepatch/core.c

   214	
   215	#ifdef CONFIG_LIVEPATCH_WO_FTRACE
 > 216	bool __weak arch_klp_skip_resolve(unsigned int type)
   217	{
   218		return false;
   219	}
   220	#endif
   221	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
