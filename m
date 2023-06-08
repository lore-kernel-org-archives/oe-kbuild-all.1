Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7A211429A
	for <oe-kbuild-all@lists.linux.dev>; Thu,  8 Jun 2023 20:47:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686257260; x=1717793260;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=N2FKxxPZqSbN3X4/2OudR9d9irNwgLB8MUpO4VCm6CI=;
  b=kWqnUcDSCRMCXMfC2r7CU1hF0ie3hLh+D7cKuKa/6ZpS508D2s+ljZTN
   w7LT7SaGVA1Zji9HR+Rj5OkSc6b3u//s938xl893UWsYCe9U/RvUJ5HZC
   c84/sghG53SN4HMhC/NdgK8bTLYVglQyKKnrzZWAzaytAUtAVtTuQuAeH
   y7szuZ61a47p1gZHwqG2wQQXg5oCLq4nFyTjMVJpDDMHMDMQjWb/eosNe
   F0bM+YFXzDKiTgWCjlTWxSUvc5hGouA1olpNuT0mJx8GU48Zp0hj4wiaC
   5B1QrJnAuELnJs1PW9l2GLRRfSN8jEvV4jzv3B2hSE1nhyw8S0PifgDQ7
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10735"; a="385781323"
X-IronPort-AV: E=Sophos;i="6.00,227,1681196400"; 
   d="scan'208";a="385781323"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jun 2023 13:47:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10735"; a="710105032"
X-IronPort-AV: E=Sophos;i="6.00,227,1681196400"; 
   d="scan'208";a="710105032"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 08 Jun 2023 13:47:38 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q7MXi-0008Fc-0T;
	Thu, 08 Jun 2023 20:47:38 +0000
Date: Fri, 9 Jun 2023 04:46:47 +0800
From: kernel test robot <lkp@intel.com>
To: "Mike Rapoport (IBM)" <rppt@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Mike Rapoport <rppt@kernel.org>
Subject: [rppt:jitalloc/v1.1 5/8] arch/x86/kernel/module.c:250:5: warning: no
 previous prototype for 'apply_relocate_add'
Message-ID: <202306090412.dl35Uf3V-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rppt/linux.git jitalloc/v1.1
head:   b334b84f00b0afae4aeed25189d4d2fefd0256be
commit: 5b7fe9711576234e7d362e9c44019767f4978739 [5/8] modules, execmem: drop module_alloc
config: x86_64-randconfig-r032-20230608 (https://download.01.org/0day-ci/archive/20230609/202306090412.dl35Uf3V-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build):
        # https://git.kernel.org/pub/scm/linux/kernel/git/rppt/linux.git/commit/?id=5b7fe9711576234e7d362e9c44019767f4978739
        git remote add rppt https://git.kernel.org/pub/scm/linux/kernel/git/rppt/linux.git
        git fetch --no-tags rppt jitalloc/v1.1
        git checkout 5b7fe9711576234e7d362e9c44019767f4978739
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash arch/x86/kernel/

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306090412.dl35Uf3V-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/x86/kernel/module.c:250:5: warning: no previous prototype for 'apply_relocate_add' [-Wmissing-prototypes]
     250 | int apply_relocate_add(Elf64_Shdr *sechdrs,
         |     ^~~~~~~~~~~~~~~~~~
>> arch/x86/kernel/module.c:272:5: warning: no previous prototype for 'module_finalize' [-Wmissing-prototypes]
     272 | int module_finalize(const Elf_Ehdr *hdr,
         |     ^~~~~~~~~~~~~~~
>> arch/x86/kernel/module.c:377:6: warning: no previous prototype for 'module_arch_cleanup' [-Wmissing-prototypes]
     377 | void module_arch_cleanup(struct module *mod)
         |      ^~~~~~~~~~~~~~~~~~~


vim +/apply_relocate_add +250 arch/x86/kernel/module.c

88fc078a7a8f67 Peter Zijlstra  2020-04-29  249  
0c05e7bd2d017a Song Liu        2023-01-25 @250  int apply_relocate_add(Elf64_Shdr *sechdrs,
0c05e7bd2d017a Song Liu        2023-01-25  251  		   const char *strtab,
0c05e7bd2d017a Song Liu        2023-01-25  252  		   unsigned int symindex,
0c05e7bd2d017a Song Liu        2023-01-25  253  		   unsigned int relsec,
0c05e7bd2d017a Song Liu        2023-01-25  254  		   struct module *me)
0c05e7bd2d017a Song Liu        2023-01-25  255  {
0c05e7bd2d017a Song Liu        2023-01-25  256  	return write_relocate_add(sechdrs, strtab, symindex, relsec, me, true);
0c05e7bd2d017a Song Liu        2023-01-25  257  }
0c05e7bd2d017a Song Liu        2023-01-25  258  
0c05e7bd2d017a Song Liu        2023-01-25  259  #ifdef CONFIG_LIVEPATCH
0c05e7bd2d017a Song Liu        2023-01-25  260  void clear_relocate_add(Elf64_Shdr *sechdrs,
0c05e7bd2d017a Song Liu        2023-01-25  261  			const char *strtab,
0c05e7bd2d017a Song Liu        2023-01-25  262  			unsigned int symindex,
0c05e7bd2d017a Song Liu        2023-01-25  263  			unsigned int relsec,
0c05e7bd2d017a Song Liu        2023-01-25  264  			struct module *me)
0c05e7bd2d017a Song Liu        2023-01-25  265  {
0c05e7bd2d017a Song Liu        2023-01-25  266  	write_relocate_add(sechdrs, strtab, symindex, relsec, me, false);
0c05e7bd2d017a Song Liu        2023-01-25  267  }
0c05e7bd2d017a Song Liu        2023-01-25  268  #endif
0c05e7bd2d017a Song Liu        2023-01-25  269  
0fdc83b950df9e Amerigo Wang    2009-06-03  270  #endif
0fdc83b950df9e Amerigo Wang    2009-06-03  271  
2d5bf28fb9e3c1 Amerigo Wang    2009-06-03 @272  int module_finalize(const Elf_Ehdr *hdr,
2d5bf28fb9e3c1 Amerigo Wang    2009-06-03  273  		    const Elf_Shdr *sechdrs,
2d5bf28fb9e3c1 Amerigo Wang    2009-06-03  274  		    struct module *me)
2d5bf28fb9e3c1 Amerigo Wang    2009-06-03  275  {
be84d8ed3f04e9 Julian Pidancet 2022-10-27  276  	const Elf_Shdr *s, *alt = NULL, *locks = NULL,
7508500900814d Peter Zijlstra  2021-10-26  277  		*para = NULL, *orc = NULL, *orc_ip = NULL,
eaf44c816ed8d1 Thomas Gleixner 2022-09-15  278  		*retpolines = NULL, *returns = NULL, *ibt_endbr = NULL,
931ab63664f02b Peter Zijlstra  2022-10-27  279  		*calls = NULL, *cfi = NULL;
2d5bf28fb9e3c1 Amerigo Wang    2009-06-03  280  	char *secstrings = (void *)hdr + sechdrs[hdr->e_shstrndx].sh_offset;
2d5bf28fb9e3c1 Amerigo Wang    2009-06-03  281  
2d5bf28fb9e3c1 Amerigo Wang    2009-06-03  282  	for (s = sechdrs; s < sechdrs + hdr->e_shnum; s++) {
2d5bf28fb9e3c1 Amerigo Wang    2009-06-03  283  		if (!strcmp(".altinstructions", secstrings + s->sh_name))
2d5bf28fb9e3c1 Amerigo Wang    2009-06-03  284  			alt = s;
2d5bf28fb9e3c1 Amerigo Wang    2009-06-03  285  		if (!strcmp(".smp_locks", secstrings + s->sh_name))
2d5bf28fb9e3c1 Amerigo Wang    2009-06-03  286  			locks = s;
2d5bf28fb9e3c1 Amerigo Wang    2009-06-03  287  		if (!strcmp(".parainstructions", secstrings + s->sh_name))
2d5bf28fb9e3c1 Amerigo Wang    2009-06-03  288  			para = s;
ee9f8fce996408 Josh Poimboeuf  2017-07-24  289  		if (!strcmp(".orc_unwind", secstrings + s->sh_name))
ee9f8fce996408 Josh Poimboeuf  2017-07-24  290  			orc = s;
ee9f8fce996408 Josh Poimboeuf  2017-07-24  291  		if (!strcmp(".orc_unwind_ip", secstrings + s->sh_name))
ee9f8fce996408 Josh Poimboeuf  2017-07-24  292  			orc_ip = s;
7508500900814d Peter Zijlstra  2021-10-26  293  		if (!strcmp(".retpoline_sites", secstrings + s->sh_name))
7508500900814d Peter Zijlstra  2021-10-26  294  			retpolines = s;
15e67227c49a57 Peter Zijlstra  2022-06-14  295  		if (!strcmp(".return_sites", secstrings + s->sh_name))
15e67227c49a57 Peter Zijlstra  2022-06-14  296  			returns = s;
eaf44c816ed8d1 Thomas Gleixner 2022-09-15  297  		if (!strcmp(".call_sites", secstrings + s->sh_name))
eaf44c816ed8d1 Thomas Gleixner 2022-09-15  298  			calls = s;
931ab63664f02b Peter Zijlstra  2022-10-27  299  		if (!strcmp(".cfi_sites", secstrings + s->sh_name))
931ab63664f02b Peter Zijlstra  2022-10-27  300  			cfi = s;
ed53a0d971926e Peter Zijlstra  2022-03-08  301  		if (!strcmp(".ibt_endbr_seal", secstrings + s->sh_name))
ed53a0d971926e Peter Zijlstra  2022-03-08  302  			ibt_endbr = s;
2d5bf28fb9e3c1 Amerigo Wang    2009-06-03  303  	}
2d5bf28fb9e3c1 Amerigo Wang    2009-06-03  304  
5adf349439d29f Peter Zijlstra  2022-03-03  305  	/*
5adf349439d29f Peter Zijlstra  2022-03-03  306  	 * See alternative_instructions() for the ordering rules between the
5adf349439d29f Peter Zijlstra  2022-03-03  307  	 * various patching types.
5adf349439d29f Peter Zijlstra  2022-03-03  308  	 */
5adf349439d29f Peter Zijlstra  2022-03-03  309  	if (para) {
5adf349439d29f Peter Zijlstra  2022-03-03  310  		void *pseg = (void *)para->sh_addr;
5adf349439d29f Peter Zijlstra  2022-03-03  311  		apply_paravirt(pseg, pseg + para->sh_size);
5adf349439d29f Peter Zijlstra  2022-03-03  312  	}
931ab63664f02b Peter Zijlstra  2022-10-27  313  	if (retpolines || cfi) {
931ab63664f02b Peter Zijlstra  2022-10-27  314  		void *rseg = NULL, *cseg = NULL;
931ab63664f02b Peter Zijlstra  2022-10-27  315  		unsigned int rsize = 0, csize = 0;
931ab63664f02b Peter Zijlstra  2022-10-27  316  
931ab63664f02b Peter Zijlstra  2022-10-27  317  		if (retpolines) {
931ab63664f02b Peter Zijlstra  2022-10-27  318  			rseg = (void *)retpolines->sh_addr;
931ab63664f02b Peter Zijlstra  2022-10-27  319  			rsize = retpolines->sh_size;
931ab63664f02b Peter Zijlstra  2022-10-27  320  		}
931ab63664f02b Peter Zijlstra  2022-10-27  321  
931ab63664f02b Peter Zijlstra  2022-10-27  322  		if (cfi) {
931ab63664f02b Peter Zijlstra  2022-10-27  323  			cseg = (void *)cfi->sh_addr;
931ab63664f02b Peter Zijlstra  2022-10-27  324  			csize = cfi->sh_size;
931ab63664f02b Peter Zijlstra  2022-10-27  325  		}
931ab63664f02b Peter Zijlstra  2022-10-27  326  
931ab63664f02b Peter Zijlstra  2022-10-27  327  		apply_fineibt(rseg, rseg + rsize, cseg, cseg + csize);
931ab63664f02b Peter Zijlstra  2022-10-27  328  	}
7508500900814d Peter Zijlstra  2021-10-26  329  	if (retpolines) {
7508500900814d Peter Zijlstra  2021-10-26  330  		void *rseg = (void *)retpolines->sh_addr;
7508500900814d Peter Zijlstra  2021-10-26  331  		apply_retpolines(rseg, rseg + retpolines->sh_size);
7508500900814d Peter Zijlstra  2021-10-26  332  	}
15e67227c49a57 Peter Zijlstra  2022-06-14  333  	if (returns) {
15e67227c49a57 Peter Zijlstra  2022-06-14  334  		void *rseg = (void *)returns->sh_addr;
15e67227c49a57 Peter Zijlstra  2022-06-14  335  		apply_returns(rseg, rseg + returns->sh_size);
15e67227c49a57 Peter Zijlstra  2022-06-14  336  	}
2d5bf28fb9e3c1 Amerigo Wang    2009-06-03  337  	if (alt) {
2d5bf28fb9e3c1 Amerigo Wang    2009-06-03  338  		/* patch .altinstructions */
2d5bf28fb9e3c1 Amerigo Wang    2009-06-03  339  		void *aseg = (void *)alt->sh_addr;
2d5bf28fb9e3c1 Amerigo Wang    2009-06-03  340  		apply_alternatives(aseg, aseg + alt->sh_size);
2d5bf28fb9e3c1 Amerigo Wang    2009-06-03  341  	}
eaf44c816ed8d1 Thomas Gleixner 2022-09-15  342  	if (calls || para) {
eaf44c816ed8d1 Thomas Gleixner 2022-09-15  343  		struct callthunk_sites cs = {};
eaf44c816ed8d1 Thomas Gleixner 2022-09-15  344  
eaf44c816ed8d1 Thomas Gleixner 2022-09-15  345  		if (calls) {
eaf44c816ed8d1 Thomas Gleixner 2022-09-15  346  			cs.call_start = (void *)calls->sh_addr;
eaf44c816ed8d1 Thomas Gleixner 2022-09-15  347  			cs.call_end = (void *)calls->sh_addr + calls->sh_size;
eaf44c816ed8d1 Thomas Gleixner 2022-09-15  348  		}
eaf44c816ed8d1 Thomas Gleixner 2022-09-15  349  
eaf44c816ed8d1 Thomas Gleixner 2022-09-15  350  		if (para) {
eaf44c816ed8d1 Thomas Gleixner 2022-09-15  351  			cs.pv_start = (void *)para->sh_addr;
eaf44c816ed8d1 Thomas Gleixner 2022-09-15  352  			cs.pv_end = (void *)para->sh_addr + para->sh_size;
eaf44c816ed8d1 Thomas Gleixner 2022-09-15  353  		}
eaf44c816ed8d1 Thomas Gleixner 2022-09-15  354  
eaf44c816ed8d1 Thomas Gleixner 2022-09-15  355  		callthunks_patch_module_calls(&cs, me);
eaf44c816ed8d1 Thomas Gleixner 2022-09-15  356  	}
ed53a0d971926e Peter Zijlstra  2022-03-08  357  	if (ibt_endbr) {
ed53a0d971926e Peter Zijlstra  2022-03-08  358  		void *iseg = (void *)ibt_endbr->sh_addr;
ed53a0d971926e Peter Zijlstra  2022-03-08  359  		apply_ibt_endbr(iseg, iseg + ibt_endbr->sh_size);
ed53a0d971926e Peter Zijlstra  2022-03-08  360  	}
be84d8ed3f04e9 Julian Pidancet 2022-10-27  361  	if (locks) {
2d5bf28fb9e3c1 Amerigo Wang    2009-06-03  362  		void *lseg = (void *)locks->sh_addr;
ac3b4328392344 Song Liu        2023-02-06  363  		void *text = me->mem[MOD_TEXT].base;
ac3b4328392344 Song Liu        2023-02-06  364  		void *text_end = text + me->mem[MOD_TEXT].size;
2d5bf28fb9e3c1 Amerigo Wang    2009-06-03  365  		alternatives_smp_module_add(me, me->name,
2d5bf28fb9e3c1 Amerigo Wang    2009-06-03  366  					    lseg, lseg + locks->sh_size,
be84d8ed3f04e9 Julian Pidancet 2022-10-27  367  					    text, text_end);
2d5bf28fb9e3c1 Amerigo Wang    2009-06-03  368  	}
2d5bf28fb9e3c1 Amerigo Wang    2009-06-03  369  
ee9f8fce996408 Josh Poimboeuf  2017-07-24  370  	if (orc && orc_ip)
ee9f8fce996408 Josh Poimboeuf  2017-07-24  371  		unwind_module_init(me, (void *)orc_ip->sh_addr, orc_ip->sh_size,
ee9f8fce996408 Josh Poimboeuf  2017-07-24  372  				   (void *)orc->sh_addr, orc->sh_size);
ee9f8fce996408 Josh Poimboeuf  2017-07-24  373  
5336377d622595 Linus Torvalds  2010-10-05  374  	return 0;
2d5bf28fb9e3c1 Amerigo Wang    2009-06-03  375  }
2d5bf28fb9e3c1 Amerigo Wang    2009-06-03  376  
2d5bf28fb9e3c1 Amerigo Wang    2009-06-03 @377  void module_arch_cleanup(struct module *mod)

:::::: The code at line 250 was first introduced by commit
:::::: 0c05e7bd2d017a3a9a0f4e9a19ad4acf1f616f12 livepatch,x86: Clear relocation targets on a module removal

:::::: TO: Song Liu <song@kernel.org>
:::::: CC: Petr Mladek <pmladek@suse.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
