Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36408D2E2
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Jan 2024 07:06:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Hk5fUJpO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704956772; x=1736492772;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/Ppfa/Fyphs9kzPVLw21Nk1kWn6P1Hvl8+ACViwAffQ=;
  b=Hk5fUJpO3J4UB1QI7us/7RsTwOLYTpXfpTbZ7GKyV5QMpzE7AZf0tEZs
   Qo9AdI/yWRqOODasu7m9oc1UySXCOo/Fd6UMzRMIRIRBLkIQcfGLcf3e7
   DyGj+6rZkXS57Ir03Q2dmAjLeoAZlVdi/sZZ+iSYXwVmw35A/kskknyfp
   IOJAV1H4SkU4xsT8QUDUN2NeCRBLrKK5DMQimq92embebzm6KZ3gKMeg0
   4yrJUJC24bjmL6wr9ZJ5NoZ9PUdzD5DvrRUbDmnzcUmf9ZOp92EXTEYVu
   iSOEIBiOqJsvgexGQ0Cpuo01s84n60G8skJKCPdlilm9iojFbcpLlhIvz
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10949"; a="395909023"
X-IronPort-AV: E=Sophos;i="6.04,185,1695711600"; 
   d="scan'208";a="395909023"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jan 2024 23:06:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,185,1695711600"; 
   d="scan'208";a="24529577"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 10 Jan 2024 23:06:10 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rNp8f-0007w8-2i;
	Thu, 11 Jan 2024 07:06:06 +0000
Date: Thu, 11 Jan 2024 15:06:00 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 13138/21542]
 arch/x86/kernel/livepatch.c:225:5: warning: no previous prototype for
 'arch_klp_init_func'
Message-ID: <202401111415.LckCd1Fu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   9b8b6ad39cc58aa26fb70284f482daec61e17c22
commit: 7e2ab91ea07673f855f16b54b7c6e6853b2efc1c [13138/21542] livepatch/x86: support livepatch without ftrace
config: x86_64-openeuler_defconfig (https://download.01.org/0day-ci/archive/20240111/202401111415.LckCd1Fu-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240111/202401111415.LckCd1Fu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401111415.LckCd1Fu-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/x86/kernel/livepatch.c:225:5: warning: no previous prototype for 'arch_klp_init_func' [-Wmissing-prototypes]
     225 | int arch_klp_init_func(struct klp_object *obj, struct klp_func *func)
         |     ^~~~~~~~~~~~~~~~~~
>> arch/x86/kernel/livepatch.c:230:6: warning: no previous prototype for 'arch_klp_free_func' [-Wmissing-prototypes]
     230 | void arch_klp_free_func(struct klp_object *obj, struct klp_func *limit)
         |      ^~~~~~~~~~~~~~~~~~
>> arch/x86/kernel/livepatch.c:258:6: warning: no previous prototype for 'arch_klp_code_modify_prepare' [-Wmissing-prototypes]
     258 | void arch_klp_code_modify_prepare(void)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> arch/x86/kernel/livepatch.c:264:6: warning: no previous prototype for 'arch_klp_code_modify_post_process' [-Wmissing-prototypes]
     264 | void arch_klp_code_modify_post_process(void)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--
>> kernel/livepatch/core.c:75:16: warning: no previous prototype for 'klp_check_patch_kprobed' [-Wmissing-prototypes]
      75 | struct kprobe *klp_check_patch_kprobed(struct klp_patch *patch)
         |                ^~~~~~~~~~~~~~~~~~~~~~~
>> kernel/livepatch/core.c:402:5: warning: no previous prototype for 'klp_try_disable_patch' [-Wmissing-prototypes]
     402 | int klp_try_disable_patch(void *data)
         |     ^~~~~~~~~~~~~~~~~~~~~
   kernel/livepatch/core.c: In function 'klp_try_disable_patch':
   kernel/livepatch/core.c:435:38: warning: suggest braces around empty body in an 'if' statement [-Wempty-body]
     435 |                         klp_smp_isb();
         |                                      ^
   kernel/livepatch/core.c: At top level:
>> kernel/livepatch/core.c:441:13: warning: no previous prototype for 'arch_klp_code_modify_prepare' [-Wmissing-prototypes]
     441 | void __weak arch_klp_code_modify_prepare(void)
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> kernel/livepatch/core.c:445:13: warning: no previous prototype for 'arch_klp_code_modify_post_process' [-Wmissing-prototypes]
     445 | void __weak arch_klp_code_modify_post_process(void)
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> kernel/livepatch/core.c:617:5: warning: no previous prototype for 'klp_try_enable_patch' [-Wmissing-prototypes]
     617 | int klp_try_enable_patch(void *data)
         |     ^~~~~~~~~~~~~~~~~~~~
   kernel/livepatch/core.c: In function 'klp_try_enable_patch':
   kernel/livepatch/core.c:650:38: warning: suggest braces around empty body in an 'if' statement [-Wempty-body]
     650 |                         klp_smp_isb();
         |                                      ^
   kernel/livepatch/core.c: At top level:
>> kernel/livepatch/core.c:1013:12: warning: no previous prototype for 'arch_klp_func_can_patch' [-Wmissing-prototypes]
    1013 | int __weak arch_klp_func_can_patch(struct klp_func *func)
         |            ^~~~~~~~~~~~~~~~~~~~~~~


vim +/arch_klp_init_func +225 arch/x86/kernel/livepatch.c

   224	
 > 225	int arch_klp_init_func(struct klp_object *obj, struct klp_func *func)
   226	{
   227		return 0;
   228	}
   229	
 > 230	void arch_klp_free_func(struct klp_object *obj, struct klp_func *limit)
   231	{
   232	
   233	}
   234	
   235	static int klp_calc_offset(long pc, long addr)
   236	{
   237		return (int)(addr - pc);
   238	}
   239	
   240	static unsigned char *klp_jmp_code(unsigned long ip, unsigned long addr)
   241	{
   242		static union klp_code_union calc;
   243	
   244		calc.e9 = 0xe9;
   245		calc.offset = klp_calc_offset(ip + JMP_E9_INSN_SIZE, addr);
   246	
   247		return calc.code;
   248	}
   249	
   250	static unsigned char *klp_old_code(unsigned char *code)
   251	{
   252		static union klp_code_union old_code;
   253	
   254		strncpy(old_code.code, code, JMP_E9_INSN_SIZE);
   255		return old_code.code;
   256	}
   257	
 > 258	void arch_klp_code_modify_prepare(void)
   259	{
   260		set_kernel_text_rw();
   261		set_all_modules_text_rw();
   262	}
   263	
 > 264	void arch_klp_code_modify_post_process(void)
   265	{
   266		set_all_modules_text_ro();
   267		set_kernel_text_ro();
   268	}
   269	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
