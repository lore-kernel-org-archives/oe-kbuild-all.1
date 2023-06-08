Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3D812DBB6
	for <oe-kbuild-all@lists.linux.dev>; Thu,  8 Jun 2023 20:26:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686255999; x=1717791999;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/JXtvPf6Ub9wbsIWwKpbuUmqyRdGq5+ANcH6AuZ1fWA=;
  b=ej0t7xslwg0/FQ2IBf9xnGiy6as4Ltmb9TpMMZ7SXu9BeeMBVBj3mu1v
   IG4+6obmn0mvHCNY4UMp5LW5diJ1fRKhmWUzXby1l9UJpoIsTs6s6ODfu
   9elor5gwrSDG5Rt9Xhqa0yJfaQd+95+2IPJibIJgbXwpG1NTk3lN47Z7L
   r86xlvazKXxwRlCzZOm5tC+4jUCplPpAfWoXBCAmsfp/Jqkwr0tj0hzzu
   iETm1SbrwYLO4arxamWM4TjWcNcFSRE1Mq9z1HLoawWJm6bJAPoVDlObL
   WNyzlAWvRzHyZEr+8fURigmvFKD/Pl8K+5fmBnSs2AlQij+pJLc7P9DrQ
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10735"; a="359907928"
X-IronPort-AV: E=Sophos;i="6.00,227,1681196400"; 
   d="scan'208";a="359907928"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jun 2023 13:26:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10735"; a="956872024"
X-IronPort-AV: E=Sophos;i="6.00,227,1681196400"; 
   d="scan'208";a="956872024"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 08 Jun 2023 13:26:38 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q7MDN-0008Ep-1f;
	Thu, 08 Jun 2023 20:26:37 +0000
Date: Fri, 9 Jun 2023 04:26:04 +0800
From: kernel test robot <lkp@intel.com>
To: "Mike Rapoport (IBM)" <rppt@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Mike Rapoport <rppt@kernel.org>
Subject: [rppt:jitalloc/v1.1 3/8] arch/parisc/kernel/module.c:268:6: warning:
 no previous prototype for 'module_arch_freeing_init'
Message-ID: <202306090416.neJrH4WP-lkp@intel.com>
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
commit: d5b9dd602e5b15d0391224763063709fcfca7f0e [3/8] mm/execmem, arch: convert simple overrides of module_alloc to execmem
config: parisc-allyesconfig (https://download.01.org/0day-ci/archive/20230609/202306090416.neJrH4WP-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 12.3.0
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/rppt/linux.git/commit/?id=d5b9dd602e5b15d0391224763063709fcfca7f0e
        git remote add rppt https://git.kernel.org/pub/scm/linux/kernel/git/rppt/linux.git
        git fetch --no-tags rppt jitalloc/v1.1
        git checkout d5b9dd602e5b15d0391224763063709fcfca7f0e
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=parisc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=parisc SHELL=/bin/bash arch/parisc/kernel/

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306090416.neJrH4WP-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/parisc/kernel/module.c:268:6: warning: no previous prototype for 'module_arch_freeing_init' [-Wmissing-prototypes]
     268 | void module_arch_freeing_init(struct module *mod)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~
>> arch/parisc/kernel/module.c:275:14: warning: no previous prototype for 'arch_mod_section_prepend' [-Wmissing-prototypes]
     275 | unsigned int arch_mod_section_prepend(struct module *mod,
         |              ^~~~~~~~~~~~~~~~~~~~~~~~
>> arch/parisc/kernel/module.c:285:5: warning: no previous prototype for 'module_frob_arch_sections' [-Wmissing-prototypes]
     285 | int module_frob_arch_sections(CONST Elf_Ehdr *hdr,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~
>> arch/parisc/kernel/module.c:507:5: warning: no previous prototype for 'apply_relocate_add' [-Wmissing-prototypes]
     507 | int apply_relocate_add(Elf_Shdr *sechdrs,
         |     ^~~~~~~~~~~~~~~~~~
>> arch/parisc/kernel/module.c:845:5: warning: no previous prototype for 'module_finalize' [-Wmissing-prototypes]
     845 | int module_finalize(const Elf_Ehdr *hdr,
         |     ^~~~~~~~~~~~~~~
   arch/parisc/kernel/module.c: In function 'module_finalize':
   arch/parisc/kernel/module.c:946:39: error: implicit declaration of function 'apply_relocate'; did you mean 'apply_relocate_add'? [-Werror=implicit-function-declaration]
     946 |                                 err = apply_relocate((Elf_Shdr *)sechdrs,
         |                                       ^~~~~~~~~~~~~~
         |                                       apply_relocate_add
   arch/parisc/kernel/module.c: At top level:
>> arch/parisc/kernel/module.c:961:6: warning: no previous prototype for 'module_arch_cleanup' [-Wmissing-prototypes]
     961 | void module_arch_cleanup(struct module *mod)
         |      ^~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/module_arch_freeing_init +268 arch/parisc/kernel/module.c

^1da177e4c3f41 Linus Torvalds 2005-04-16  267  
d453cded05ee21 Rusty Russell  2015-01-20 @268  void module_arch_freeing_init(struct module *mod)
^1da177e4c3f41 Linus Torvalds 2005-04-16  269  {
c298be74492bec Helge Deller   2009-01-01  270  	kfree(mod->arch.section);
c298be74492bec Helge Deller   2009-01-01  271  	mod->arch.section = NULL;
^1da177e4c3f41 Linus Torvalds 2005-04-16  272  }
^1da177e4c3f41 Linus Torvalds 2005-04-16  273  
c298be74492bec Helge Deller   2009-01-01  274  /* Additional bytes needed in front of individual sections */
c298be74492bec Helge Deller   2009-01-01 @275  unsigned int arch_mod_section_prepend(struct module *mod,
c298be74492bec Helge Deller   2009-01-01  276  				      unsigned int section)
c298be74492bec Helge Deller   2009-01-01  277  {
c298be74492bec Helge Deller   2009-01-01  278  	/* size needed for all stubs of this section (including
c298be74492bec Helge Deller   2009-01-01  279  	 * one additional for correct alignment of the stubs) */
c298be74492bec Helge Deller   2009-01-01  280  	return (mod->arch.section[section].stub_entries + 1)
c298be74492bec Helge Deller   2009-01-01  281  		* sizeof(struct stub_entry);
c298be74492bec Helge Deller   2009-01-01  282  }
c298be74492bec Helge Deller   2009-01-01  283  
^1da177e4c3f41 Linus Torvalds 2005-04-16  284  #define CONST
^1da177e4c3f41 Linus Torvalds 2005-04-16 @285  int module_frob_arch_sections(CONST Elf_Ehdr *hdr,
^1da177e4c3f41 Linus Torvalds 2005-04-16  286  			      CONST Elf_Shdr *sechdrs,
^1da177e4c3f41 Linus Torvalds 2005-04-16  287  			      CONST char *secstrings,
^1da177e4c3f41 Linus Torvalds 2005-04-16  288  			      struct module *me)
^1da177e4c3f41 Linus Torvalds 2005-04-16  289  {
c298be74492bec Helge Deller   2009-01-01  290  	unsigned long gots = 0, fdescs = 0, len;
^1da177e4c3f41 Linus Torvalds 2005-04-16  291  	unsigned int i;
ac3b4328392344 Song Liu       2023-02-06  292  	struct module_memory *mod_mem;
^1da177e4c3f41 Linus Torvalds 2005-04-16  293  
c298be74492bec Helge Deller   2009-01-01  294  	len = hdr->e_shnum * sizeof(me->arch.section[0]);
c298be74492bec Helge Deller   2009-01-01  295  	me->arch.section = kzalloc(len, GFP_KERNEL);
c298be74492bec Helge Deller   2009-01-01  296  	if (!me->arch.section)
c298be74492bec Helge Deller   2009-01-01  297  		return -ENOMEM;
c298be74492bec Helge Deller   2009-01-01  298  
^1da177e4c3f41 Linus Torvalds 2005-04-16  299  	for (i = 1; i < hdr->e_shnum; i++) {
c298be74492bec Helge Deller   2009-01-01  300  		const Elf_Rela *rels = (void *)sechdrs[i].sh_addr;
^1da177e4c3f41 Linus Torvalds 2005-04-16  301  		unsigned long nrels = sechdrs[i].sh_size / sizeof(*rels);
c298be74492bec Helge Deller   2009-01-01  302  		unsigned int count, s;
^1da177e4c3f41 Linus Torvalds 2005-04-16  303  
^1da177e4c3f41 Linus Torvalds 2005-04-16  304  		if (strncmp(secstrings + sechdrs[i].sh_name,
^1da177e4c3f41 Linus Torvalds 2005-04-16  305  			    ".PARISC.unwind", 14) == 0)
^1da177e4c3f41 Linus Torvalds 2005-04-16  306  			me->arch.unwind_section = i;
^1da177e4c3f41 Linus Torvalds 2005-04-16  307  
^1da177e4c3f41 Linus Torvalds 2005-04-16  308  		if (sechdrs[i].sh_type != SHT_RELA)
^1da177e4c3f41 Linus Torvalds 2005-04-16  309  			continue;
^1da177e4c3f41 Linus Torvalds 2005-04-16  310  
^1da177e4c3f41 Linus Torvalds 2005-04-16  311  		/* some of these are not relevant for 32-bit/64-bit
^1da177e4c3f41 Linus Torvalds 2005-04-16  312  		 * we leave them here to make the code common. the
^1da177e4c3f41 Linus Torvalds 2005-04-16  313  		 * compiler will do its thing and optimize out the
^1da177e4c3f41 Linus Torvalds 2005-04-16  314  		 * stuff we don't need
^1da177e4c3f41 Linus Torvalds 2005-04-16  315  		 */
^1da177e4c3f41 Linus Torvalds 2005-04-16  316  		gots += count_gots(rels, nrels);
^1da177e4c3f41 Linus Torvalds 2005-04-16  317  		fdescs += count_fdescs(rels, nrels);
c298be74492bec Helge Deller   2009-01-01  318  
c298be74492bec Helge Deller   2009-01-01  319  		/* XXX: By sorting the relocs and finding duplicate entries
c298be74492bec Helge Deller   2009-01-01  320  		 *  we could reduce the number of necessary stubs and save
c298be74492bec Helge Deller   2009-01-01  321  		 *  some memory. */
c298be74492bec Helge Deller   2009-01-01  322  		count = count_stubs(rels, nrels);
c298be74492bec Helge Deller   2009-01-01  323  		if (!count)
c298be74492bec Helge Deller   2009-01-01  324  			continue;
c298be74492bec Helge Deller   2009-01-01  325  
c298be74492bec Helge Deller   2009-01-01  326  		/* so we need relocation stubs. reserve necessary memory. */
c298be74492bec Helge Deller   2009-01-01  327  		/* sh_info gives the section for which we need to add stubs. */
c298be74492bec Helge Deller   2009-01-01  328  		s = sechdrs[i].sh_info;
c298be74492bec Helge Deller   2009-01-01  329  
c298be74492bec Helge Deller   2009-01-01  330  		/* each code section should only have one relocation section */
c298be74492bec Helge Deller   2009-01-01  331  		WARN_ON(me->arch.section[s].stub_entries);
c298be74492bec Helge Deller   2009-01-01  332  
c298be74492bec Helge Deller   2009-01-01  333  		/* store number of stubs we need for this section */
c298be74492bec Helge Deller   2009-01-01  334  		me->arch.section[s].stub_entries += count;
^1da177e4c3f41 Linus Torvalds 2005-04-16  335  	}
^1da177e4c3f41 Linus Torvalds 2005-04-16  336  
ac3b4328392344 Song Liu       2023-02-06  337  	mod_mem = &me->mem[MOD_TEXT];
^1da177e4c3f41 Linus Torvalds 2005-04-16  338  	/* align things a bit */
ac3b4328392344 Song Liu       2023-02-06  339  	mod_mem->size = ALIGN(mod_mem->size, 16);
ac3b4328392344 Song Liu       2023-02-06  340  	me->arch.got_offset = mod_mem->size;
ac3b4328392344 Song Liu       2023-02-06  341  	mod_mem->size += gots * sizeof(struct got_entry);
^1da177e4c3f41 Linus Torvalds 2005-04-16  342  
ac3b4328392344 Song Liu       2023-02-06  343  	mod_mem->size = ALIGN(mod_mem->size, 16);
ac3b4328392344 Song Liu       2023-02-06  344  	me->arch.fdesc_offset = mod_mem->size;
ac3b4328392344 Song Liu       2023-02-06  345  	mod_mem->size += fdescs * sizeof(Elf_Fdesc);
^1da177e4c3f41 Linus Torvalds 2005-04-16  346  
^1da177e4c3f41 Linus Torvalds 2005-04-16  347  	me->arch.got_max = gots;
^1da177e4c3f41 Linus Torvalds 2005-04-16  348  	me->arch.fdesc_max = fdescs;
^1da177e4c3f41 Linus Torvalds 2005-04-16  349  
^1da177e4c3f41 Linus Torvalds 2005-04-16  350  	return 0;
^1da177e4c3f41 Linus Torvalds 2005-04-16  351  }
^1da177e4c3f41 Linus Torvalds 2005-04-16  352  

:::::: The code at line 268 was first introduced by commit
:::::: d453cded05ee219b77815ea194dc36efa5398bca module_arch_freeing_init(): new hook for archs before module->module_init freed.

:::::: TO: Rusty Russell <rusty@rustcorp.com.au>
:::::: CC: Rusty Russell <rusty@rustcorp.com.au>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
