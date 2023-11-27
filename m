Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE6BA171D6
	for <oe-kbuild-all@lists.linux.dev>; Mon, 27 Nov 2023 09:44:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RiL2BIVx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701078246; x=1732614246;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QHmfE3sURaZX1XmaFZeb57IeTXr9pburwQFdvPySoyQ=;
  b=RiL2BIVxe6EwtkJ4vZ1f1un1JZl7+KZbO6esG/L1a2+/3ON82c3wBh0/
   Elm7IPB6QqvrP+HzDIAn8MHLsytlMa/RJxQdOwffgwy3PqptzLnmhwl+7
   N37/DS6vRBeFwuPHD5KjWxInWviRSlvV4CwMESY42fGpTdeZ+oZrk8l8/
   70YaZZdLr0oboUre6ozStXib7+UlbkB2a2+grAqzbVSl7BI5vbiCyHaHQ
   ONp7PMxu3M26X3Guyt26fXQefP2Q16qo0RLRLEwVoJ8+9WQqvUOoGLRNi
   Ol+VsEY7VRKXL6wArHZ3Nh8tpWjCktVn3zdo4+bEJ/Zc6gqySMMFP61G8
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10906"; a="389815970"
X-IronPort-AV: E=Sophos;i="6.04,230,1695711600"; 
   d="scan'208";a="389815970"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2023 01:44:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10906"; a="797198459"
X-IronPort-AV: E=Sophos;i="6.04,230,1695711600"; 
   d="scan'208";a="797198459"
Received: from lkp-server01.sh.intel.com (HELO d584ee6ebdcc) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 27 Nov 2023 01:44:03 -0800
Received: from kbuild by d584ee6ebdcc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r7Y9p-00067Y-1a;
	Mon, 27 Nov 2023 09:44:01 +0000
Date: Mon, 27 Nov 2023 17:43:44 +0800
From: kernel test robot <lkp@intel.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 3550/3551] arch/sparc/kernel/module.c:62:15:
 warning: variable 'strtab' set but not used
Message-ID: <202311271426.FJQQCgZw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   48bbaf8b793e0770798519f8ee1ea2908ff0943a
commit: 233d97f67e6525aff8a621735926a8acbd980ca1 [3550/3551] sparc: turn off Werror for now
config: sparc-sparc64_defconfig (https://download.01.org/0day-ci/archive/20231127/202311271426.FJQQCgZw-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231127/202311271426.FJQQCgZw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311271426.FJQQCgZw-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/sparc/kernel/module.c: In function 'module_frob_arch_sections':
>> arch/sparc/kernel/module.c:62:15: warning: variable 'strtab' set but not used [-Wunused-but-set-variable]
      62 |         char *strtab;
         |               ^~~~~~
--
   arch/sparc/mm/init_64.c: In function 'arch_hugetlb_valid_size':
>> arch/sparc/mm/init_64.c:361:24: warning: variable 'hv_pgsz_idx' set but not used [-Wunused-but-set-variable]
     361 |         unsigned short hv_pgsz_idx;
         |                        ^~~~~~~~~~~
   arch/sparc/mm/init_64.c: At top level:
   arch/sparc/mm/init_64.c:2644:6: warning: no previous prototype for 'vmemmap_free' [-Wmissing-prototypes]
    2644 | void vmemmap_free(unsigned long start, unsigned long end,
         |      ^~~~~~~~~~~~


vim +/strtab +62 arch/sparc/kernel/module.c

^1da177e4c3f41 arch/sparc64/kernel/module.c  Linus Torvalds  2005-04-16  53  
^1da177e4c3f41 arch/sparc64/kernel/module.c  Linus Torvalds  2005-04-16  54  /* Make generic code ignore STT_REGISTER dummy undefined symbols.  */
^1da177e4c3f41 arch/sparc64/kernel/module.c  Linus Torvalds  2005-04-16  55  int module_frob_arch_sections(Elf_Ehdr *hdr,
^1da177e4c3f41 arch/sparc64/kernel/module.c  Linus Torvalds  2005-04-16  56  			      Elf_Shdr *sechdrs,
^1da177e4c3f41 arch/sparc64/kernel/module.c  Linus Torvalds  2005-04-16  57  			      char *secstrings,
^1da177e4c3f41 arch/sparc64/kernel/module.c  Linus Torvalds  2005-04-16  58  			      struct module *mod)
^1da177e4c3f41 arch/sparc64/kernel/module.c  Linus Torvalds  2005-04-16  59  {
^1da177e4c3f41 arch/sparc64/kernel/module.c  Linus Torvalds  2005-04-16  60  	unsigned int symidx;
c45d1c209f7420 arch/sparc/kernel/module_64.c Sam Ravnborg    2008-12-26  61  	Elf_Sym *sym;
627bf2f678ba73 arch/sparc/kernel/module_64.c Sam Ravnborg    2008-12-26 @62  	char *strtab;
^1da177e4c3f41 arch/sparc64/kernel/module.c  Linus Torvalds  2005-04-16  63  	int i;
^1da177e4c3f41 arch/sparc64/kernel/module.c  Linus Torvalds  2005-04-16  64  
^1da177e4c3f41 arch/sparc64/kernel/module.c  Linus Torvalds  2005-04-16  65  	for (symidx = 0; sechdrs[symidx].sh_type != SHT_SYMTAB; symidx++) {
^1da177e4c3f41 arch/sparc64/kernel/module.c  Linus Torvalds  2005-04-16  66  		if (symidx == hdr->e_shnum-1) {
^1da177e4c3f41 arch/sparc64/kernel/module.c  Linus Torvalds  2005-04-16  67  			printk("%s: no symtab found.\n", mod->name);
^1da177e4c3f41 arch/sparc64/kernel/module.c  Linus Torvalds  2005-04-16  68  			return -ENOEXEC;
^1da177e4c3f41 arch/sparc64/kernel/module.c  Linus Torvalds  2005-04-16  69  		}
^1da177e4c3f41 arch/sparc64/kernel/module.c  Linus Torvalds  2005-04-16  70  	}
c45d1c209f7420 arch/sparc/kernel/module_64.c Sam Ravnborg    2008-12-26  71  	sym = (Elf_Sym *)sechdrs[symidx].sh_addr;
^1da177e4c3f41 arch/sparc64/kernel/module.c  Linus Torvalds  2005-04-16  72  	strtab = (char *)sechdrs[sechdrs[symidx].sh_link].sh_addr;
^1da177e4c3f41 arch/sparc64/kernel/module.c  Linus Torvalds  2005-04-16  73  
^1da177e4c3f41 arch/sparc64/kernel/module.c  Linus Torvalds  2005-04-16  74  	for (i = 1; i < sechdrs[symidx].sh_size / sizeof(Elf_Sym); i++) {
627bf2f678ba73 arch/sparc/kernel/module_64.c Sam Ravnborg    2008-12-26  75  		if (sym[i].st_shndx == SHN_UNDEF) {
1b35a57b1c1781 arch/sparc/kernel/module.c    David S. Miller 2012-05-15  76  			if (ELF_ST_TYPE(sym[i].st_info) == STT_REGISTER)
^1da177e4c3f41 arch/sparc64/kernel/module.c  Linus Torvalds  2005-04-16  77  				sym[i].st_shndx = SHN_ABS;
627bf2f678ba73 arch/sparc/kernel/module_64.c Sam Ravnborg    2008-12-26  78  		}
^1da177e4c3f41 arch/sparc64/kernel/module.c  Linus Torvalds  2005-04-16  79  	}
^1da177e4c3f41 arch/sparc64/kernel/module.c  Linus Torvalds  2005-04-16  80  	return 0;
^1da177e4c3f41 arch/sparc64/kernel/module.c  Linus Torvalds  2005-04-16  81  }
^1da177e4c3f41 arch/sparc64/kernel/module.c  Linus Torvalds  2005-04-16  82  

:::::: The code at line 62 was first introduced by commit
:::::: 627bf2f678ba7325461922af137ff5f20b6523eb sparc64: prepare module_64.c for unification

:::::: TO: Sam Ravnborg <sam@ravnborg.org>
:::::: CC: David S. Miller <davem@davemloft.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
