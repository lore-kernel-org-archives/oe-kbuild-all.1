Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7118D14A085
	for <oe-kbuild-all@lists.linux.dev>; Tue, 21 May 2024 23:18:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716333532; cv=none; b=h74NMq6k/L5n6qqNHr75zMdnal20Sn/4vKBycjUgyEH0d5HFGtCKpFJIbuVD+NtxetpRJgNRwDA2UR1VqE4U16YkpUssc2VkeOEXyiAsRZM4BjMB6GCleGhGRsfRk0QHyl7850efBszV82fSqt2s3AxVrN1eWc/kklRhgkGMj+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716333532; c=relaxed/simple;
	bh=p+7oT0Iy0QT5smJIRKKO7XH8LJQZDp4IXNPqZbROjuY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jIde0QMkP5VOJ7e6+tX+mFVD3HubycEPIhL2n73vL3T2tIeuQEchI2BzE6NFDfgPQc8GDrZvX+TpKX+pA6y2xR1llcjymyi+mvePzONgGSCOzIipNCqv9QZ13fDyzXJWgLFhkKH+gx1E9zwi6RPKvTM1fiDlj84XzvRn8RhR1U4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OUmMwBC4; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OUmMwBC4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716333530; x=1747869530;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=p+7oT0Iy0QT5smJIRKKO7XH8LJQZDp4IXNPqZbROjuY=;
  b=OUmMwBC46s81IOsgIN5BOYN9LseOs3GiIwyUryW/mYEV0bDitRhGBiti
   LPhc+/j+DvDpblGBLEj+X2+cXdnqTpAY7q3Pc9gUAMrbjTe0Ja71ZwzBY
   4axiJHqBMCmqOjb2BHOtj/+zjl/L+O2EFxlWu+cRVafAJv3lyLMXe149r
   1ot+uOZOLKVZCs12C1dj6xQxdbg70CDJIuWQfJyWfCcZJrFkrarao9cpI
   w1Bha6doapMoIjjmoc9sxBkwciTl3SFOBoC6Bh2XIVZ7PZ/D0YtkotOs3
   DfZukXrOQjAwi4LQCoenuSzX62SOf4AUnRgR6rPqrcDEeljia9p6gdbDJ
   Q==;
X-CSE-ConnectionGUID: McTEtcF0Rpqc+hweCeggCw==
X-CSE-MsgGUID: Z3n6JlHVQ9enF2BbkoOXXw==
X-IronPort-AV: E=McAfee;i="6600,9927,11079"; a="12786978"
X-IronPort-AV: E=Sophos;i="6.08,179,1712646000"; 
   d="scan'208";a="12786978"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2024 16:18:50 -0700
X-CSE-ConnectionGUID: NX2dQH4US6iZa8lsK4ZT9g==
X-CSE-MsgGUID: 1ft8HrT3Tzu7WOHaf3r1zA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,179,1712646000"; 
   d="scan'208";a="70492446"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 21 May 2024 16:18:48 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s9Ykn-0000ph-1z;
	Tue, 21 May 2024 23:18:45 +0000
Date: Wed, 22 May 2024 07:18:38 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, laokz <laokz@foxmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 7647/9681] kernel/livepatch/core.c:216:13:
 warning: no previous prototype for function 'arch_klp_skip_resolve'
Message-ID: <202405220709.iFr8nwBK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   f3f9407325616af0ea4e2399d86d31f8571fa55f
commit: b8f3220637be1736c165c289c634f27841ac4e01 [7647/9681] livepatch: add arch hook before doing klp_resolve_symbols
config: x86_64-randconfig-073-20240521 (https://download.01.org/0day-ci/archive/20240522/202405220709.iFr8nwBK-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240522/202405220709.iFr8nwBK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405220709.iFr8nwBK-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/livepatch/core.c:97:12: warning: no previous prototype for function 'arch_klp_init_func' [-Wmissing-prototypes]
      97 | int __weak arch_klp_init_func(struct klp_object *obj, struct klp_func *func)
         |            ^
   kernel/livepatch/core.c:97:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      97 | int __weak arch_klp_init_func(struct klp_object *obj, struct klp_func *func)
         | ^
         | static 
>> kernel/livepatch/core.c:216:13: warning: no previous prototype for function 'arch_klp_skip_resolve' [-Wmissing-prototypes]
     216 | bool __weak arch_klp_skip_resolve(unsigned int type)
         |             ^
   kernel/livepatch/core.c:216:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     216 | bool __weak arch_klp_skip_resolve(unsigned int type)
         | ^
         | static 
   kernel/livepatch/core.c:1767:12: warning: no previous prototype for function 'arch_klp_check_activeness_func' [-Wmissing-prototypes]
    1767 | int __weak arch_klp_check_activeness_func(struct klp_func *func, int enable,
         |            ^
   kernel/livepatch/core.c:1767:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1767 | int __weak arch_klp_check_activeness_func(struct klp_func *func, int enable,
         | ^
         | static 
   kernel/livepatch/core.c:2022:14: warning: no previous prototype for function 'arch_klp_mem_alloc' [-Wmissing-prototypes]
    2022 | void __weak *arch_klp_mem_alloc(size_t size)
         |              ^
   kernel/livepatch/core.c:2022:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    2022 | void __weak *arch_klp_mem_alloc(size_t size)
         | ^
         | static 
   kernel/livepatch/core.c:2027:13: warning: no previous prototype for function 'arch_klp_mem_free' [-Wmissing-prototypes]
    2027 | void __weak arch_klp_mem_free(void *mem)
         |             ^
   kernel/livepatch/core.c:2027:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    2027 | void __weak arch_klp_mem_free(void *mem)
         | ^
         | static 
   kernel/livepatch/core.c:2063:13: warning: no previous prototype for function 'arch_klp_set_brk_func' [-Wmissing-prototypes]
    2063 | void __weak arch_klp_set_brk_func(struct klp_func_node *func_node, void *new_func)
         |             ^
   kernel/livepatch/core.c:2063:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    2063 | void __weak arch_klp_set_brk_func(struct klp_func_node *func_node, void *new_func)
         | ^
         | static 
   6 warnings generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for DRM_I915_DEBUG_GEM
   Depends on [n]: HAS_IOMEM [=y] && DRM_I915 [=m] && EXPERT [=y] && DRM_I915_WERROR [=n]
   Selected by [m]:
   - DRM_I915_DEBUG [=y] && HAS_IOMEM [=y] && DRM_I915 [=m] && EXPERT [=y] && !COMPILE_TEST [=n]


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
