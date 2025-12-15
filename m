Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 231A1271A94
	for <oe-kbuild-all@lists.linux.dev>; Mon, 15 Dec 2025 01:14:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765761300; cv=none; b=Tk2MO3yc2DiGRixY0zeB8EnPxWGzn3XTbK/Lgqano6XyAc8d+LptvLgKBEk42Q735RWjLo6G/3F2W/lKF21qsGrhy8ZCE5VkFFq+p7vaG9m/lS+V9X30V06chjFzIsEaKdT/nPPRvXOYtsPVY5Q/zJsi/MxA38GZiLXDFIrHDJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765761300; c=relaxed/simple;
	bh=4qiY2h2z6ujFCPtQa9pihUYggd0wGVsyVGXrbRTkWxc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=py2Ufe39d4vbnf132uRSZtv7/njyXnUtLOQUA/5psiD6e4bAS+j0OjVRRwIt7V4iCHuf7HOzAPrLjnD5Jzl3E26QHAuQDBg3bydGCzrAmb2qcnShYZrbo5WP1zzIeY2cW2P005wHZnv5d+hW1J8Wl9qA+LBG8kcnOt0S9bpAGr4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=no+aZ4g3; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="no+aZ4g3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765761298; x=1797297298;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4qiY2h2z6ujFCPtQa9pihUYggd0wGVsyVGXrbRTkWxc=;
  b=no+aZ4g3eUgYFq349zp7ZecFQCOT4BM7EXitDr064Nxvg5PkvnQwkpIX
   N0EdVhpziTt7PD0zEY5du00EUzXXy2kNg/ye6n9ehBm2/b5otO/AwpWDL
   35uPo1hg/lwejuJxt9/MFl3g9WIRrqWYQzy30pSRZXQLBBvRd0L8lhQHt
   ofi4QbM8z7WtZrD1Oc4pspJJf4/WwzZshzsSnxvh5BfrAbgZ1n3A2Z04G
   5hxjzhXG3hkV4rpr7aYFhDkGG4AekueeUxB0p3hWRA5Kb+OYLeFixZEiM
   Squp8QpXQ/sw+B7/gTknkf2btdpKG/+DGcSA2iLMLUM8vBPplIWDrxbmO
   Q==;
X-CSE-ConnectionGUID: jzgyh4KLR3a0wcLnVX/aVA==
X-CSE-MsgGUID: NI/8zfOeSL2QRpc5EM4BUw==
X-IronPort-AV: E=McAfee;i="6800,10657,11642"; a="77976167"
X-IronPort-AV: E=Sophos;i="6.21,148,1763452800"; 
   d="scan'208";a="77976167"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2025 17:14:57 -0800
X-CSE-ConnectionGUID: zuZ22krOSa+w+AmS8j4sKg==
X-CSE-MsgGUID: qM51vc69SPOsWGXidK8w+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,148,1763452800"; 
   d="scan'208";a="197645090"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 14 Dec 2025 17:14:56 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUxAs-000000009YR-10hq;
	Mon, 15 Dec 2025 01:14:54 +0000
Date: Mon, 15 Dec 2025 09:14:26 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3541/3541] kernel/livepatch/core.c:216:13:
 warning: no previous prototype for function 'arch_klp_skip_resolve'
Message-ID: <202512150919.EC4St0LR-lkp@intel.com>
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
head:   cd9eb9b4365b71652b2c2ac58293bea47c9f9302
commit: b8f3220637be1736c165c289c634f27841ac4e01 [3541/3541] livepatch: add arch hook before doing klp_resolve_symbols
config: arm64-randconfig-001-20251212 (https://download.01.org/0day-ci/archive/20251215/202512150919.EC4St0LR-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251215/202512150919.EC4St0LR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512150919.EC4St0LR-lkp@intel.com/

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
   kernel/livepatch/core.c:2032:13: warning: no previous prototype for function 'arch_klp_code_modify_prepare' [-Wmissing-prototypes]
    2032 | void __weak arch_klp_code_modify_prepare(void)
         |             ^
   kernel/livepatch/core.c:2032:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    2032 | void __weak arch_klp_code_modify_prepare(void)
         | ^
         | static 
   kernel/livepatch/core.c:2036:13: warning: no previous prototype for function 'arch_klp_code_modify_post_process' [-Wmissing-prototypes]
    2036 | void __weak arch_klp_code_modify_post_process(void)
         |             ^
   kernel/livepatch/core.c:2036:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    2036 | void __weak arch_klp_code_modify_post_process(void)
         | ^
         | static 
   kernel/livepatch/core.c:2049:12: warning: no previous prototype for function 'arch_klp_check_breakpoint' [-Wmissing-prototypes]
    2049 | int __weak arch_klp_check_breakpoint(struct arch_klp_data *arch_data, void *old_func)
         |            ^
   kernel/livepatch/core.c:2049:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    2049 | int __weak arch_klp_check_breakpoint(struct arch_klp_data *arch_data, void *old_func)
         | ^
         | static 
   kernel/livepatch/core.c:2063:13: warning: no previous prototype for function 'arch_klp_set_brk_func' [-Wmissing-prototypes]
    2063 | void __weak arch_klp_set_brk_func(struct klp_func_node *func_node, void *new_func)
         |             ^
   kernel/livepatch/core.c:2063:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    2063 | void __weak arch_klp_set_brk_func(struct klp_func_node *func_node, void *new_func)
         | ^
         | static 
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
