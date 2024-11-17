Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33208BE49
	for <oe-kbuild-all@lists.linux.dev>; Sun, 17 Nov 2024 03:27:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731814065; cv=none; b=YUM7b6DfSKru+oTt8qY6e/lF1fw2i2qmt1qBZLj3XIhT7jSzLTHef6hxb1RvnTLN+Jh2f1VTme9BPmwYas6HxlNTitRlOmqlLcHRGpMJ1N1v/ClhTnvJhvUdcRGfXsRttjVKdZjSyhCPfD2H5wRs3AGwx2/AymGl8Zo547R/C8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731814065; c=relaxed/simple;
	bh=2LJL7VUmIPJg7//5TqpSC9zwMy5DSn/vid8g5m99uj4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SDEtCaGQjvUmQwZNu2MA4FNeW1X9Odx9iNIbpRaKU72ciBUgyaywHCPnRHW9h9Lm5MQdxraA3Gy7GQfp1wgc+SGKKePWuDDG9BvhR4hOx7mIro2OaFEnI2STWFzRbnIxfDvrx6bEjhtcrzd/MNUu5ml9HQ7eWYyPL8H366zJ5T4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jLH47nEV; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jLH47nEV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731814063; x=1763350063;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2LJL7VUmIPJg7//5TqpSC9zwMy5DSn/vid8g5m99uj4=;
  b=jLH47nEVoSXL1qxmfNfUneldZYU7Pj0S0ycN3lm2DoilWSRE9/RZS6j8
   uxp5pSrFArr4OeNf849CN70MO35POGVFlBHxgiAQHuesmahsDlodtfN/N
   jnlJIclx0Af/0bfYxzF1l/TCCdL04ruA2gOdik5xJoab0LZsnZjqsyUNV
   7Vt3jSjXSzZf5a/61AuHnUWFAyVIUneDz7UXSKj4xtL5lA3lX9ej5edQg
   CFFpi178WsGRddlfqawW6MlEdRt6XUcy8sgnlf+AguCgxerIlx8YCIX2m
   8TYCTAKTXnlga7psBWb6ZGesYacitZofcHemYtFCnzXGLMYSBEwFUW+a1
   Q==;
X-CSE-ConnectionGUID: C0sUrC5kSCK/PPKfeXhMEw==
X-CSE-MsgGUID: yFcWwpvFRhOTzFtlNazV/Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11258"; a="54289152"
X-IronPort-AV: E=Sophos;i="6.12,161,1728975600"; 
   d="scan'208";a="54289152"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2024 19:27:42 -0800
X-CSE-ConnectionGUID: FarWNRtiQrikTCUA9RiITA==
X-CSE-MsgGUID: FnE9w136TvaHsVlVY9ZK3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,161,1728975600"; 
   d="scan'208";a="92983751"
Received: from lkp-server01.sh.intel.com (HELO 1e3cc1889ffb) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 16 Nov 2024 19:27:41 -0800
Received: from kbuild by 1e3cc1889ffb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tCVwp-0001Ku-0b;
	Sun, 17 Nov 2024 03:27:39 +0000
Date: Sun, 17 Nov 2024 11:26:42 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zheng Yejian <zhengyejian1@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 1474/1474] kernel/livepatch/core.c:97:12:
 warning: no previous prototype for function 'arch_klp_init_func'
Message-ID: <202411171106.SNb1bUTk-lkp@intel.com>
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
commit: eabc33c6f2c91168537f10e9275b0921c9f78c45 [1474/1474] livepatch/ppc64: Implement livepatch without ftrace for ppc64be
config: arm64-randconfig-003-20241117 (https://download.01.org/0day-ci/archive/20241117/202411171106.SNb1bUTk-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241117/202411171106.SNb1bUTk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411171106.SNb1bUTk-lkp@intel.com/

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
