Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A89817740
	for <oe-kbuild-all@lists.linux.dev>; Thu,  8 Jun 2023 20:04:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686254686; x=1717790686;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kQkFXmqkK5JTsoODrS/t5cumLo+xl+L7WgrdNaskZKw=;
  b=IbqHSbmz8fnh5xiz01YVkDL2C33NcpFo3v2gRM18/2WALZZTEzB42Sdw
   N35bYTZy9PRuDICQNA64Rm+qU4Bcg67kb8c+ffMyJ7EB5vEIC6svCYO36
   7Jsd2PExW5mzMkuQy7WCLE+uE1Bih1Ntpfa1GB4a0+0e50+VtTMMppB1d
   R0PkjzmvFzSv/B04MJuJFSlikZyPPwwuU7DFRVW67g3lfF5olKO18Zbiy
   wsj0M3DS9geA7YhzgaG1AceR8vS0/h+nu2qoEGtTP/GEZPN16D6pvJfTj
   VBHcBPiKyWS+fFbeR3p7xaco+T9yAhN0tVyna9uJlsmua/mmz7gsRjnhR
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10735"; a="359902861"
X-IronPort-AV: E=Sophos;i="6.00,227,1681196400"; 
   d="scan'208";a="359902861"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jun 2023 13:04:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10735"; a="956869061"
X-IronPort-AV: E=Sophos;i="6.00,227,1681196400"; 
   d="scan'208";a="956869061"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 08 Jun 2023 13:04:43 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q7LsB-0008Dc-0N;
	Thu, 08 Jun 2023 20:04:43 +0000
Date: Fri, 9 Jun 2023 04:04:26 +0800
From: kernel test robot <lkp@intel.com>
To: "Mike Rapoport (IBM)" <rppt@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Mike Rapoport <rppt@kernel.org>
Subject: [rppt:jitalloc/v1.1 4/8] arch/arm/kernel/module.c:60:6: warning: no
 previous prototype for 'module_init_section'
Message-ID: <202306090343.r7y8F2Nw-lkp@intel.com>
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
commit: 8c1d38fdb52242e4c41b67bd4344b5d1e0fd529b [4/8] mm/execmem, arch: convert remaining overrides of module_alloc to execmem
config: arm-buildonly-randconfig-r006-20230608 (https://download.01.org/0day-ci/archive/20230609/202306090343.r7y8F2Nw-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.3.0
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/rppt/linux.git/commit/?id=8c1d38fdb52242e4c41b67bd4344b5d1e0fd529b
        git remote add rppt https://git.kernel.org/pub/scm/linux/kernel/git/rppt/linux.git
        git fetch --no-tags rppt jitalloc/v1.1
        git checkout 8c1d38fdb52242e4c41b67bd4344b5d1e0fd529b
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash arch/arm/kernel/

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306090343.r7y8F2Nw-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/arm/kernel/module.c:60:6: warning: no previous prototype for 'module_init_section' [-Wmissing-prototypes]
      60 | bool module_init_section(const char *name)
         |      ^~~~~~~~~~~~~~~~~~~
>> arch/arm/kernel/module.c:67:6: warning: no previous prototype for 'module_exit_section' [-Wmissing-prototypes]
      67 | bool module_exit_section(const char *name)
         |      ^~~~~~~~~~~~~~~~~~~
>> arch/arm/kernel/module.c:113:1: warning: no previous prototype for 'apply_relocate' [-Wmissing-prototypes]
     113 | apply_relocate(Elf32_Shdr *sechdrs, const char *strtab, unsigned int symindex,
         | ^~~~~~~~~~~~~~
>> arch/arm/kernel/module.c:458:5: warning: no previous prototype for 'module_finalize' [-Wmissing-prototypes]
     458 | int module_finalize(const Elf32_Ehdr *hdr, const Elf_Shdr *sechdrs,
         |     ^~~~~~~~~~~~~~~
>> arch/arm/kernel/module.c:516:1: warning: no previous prototype for 'module_arch_cleanup' [-Wmissing-prototypes]
     516 | module_arch_cleanup(struct module *mod)
         | ^~~~~~~~~~~~~~~~~~~
>> arch/arm/kernel/module.c:531:13: warning: no previous prototype for 'module_arch_freeing_init' [-Wmissing-prototypes]
     531 | void __weak module_arch_freeing_init(struct module *mod)
         |             ^~~~~~~~~~~~~~~~~~~~~~~~


vim +/module_init_section +60 arch/arm/kernel/module.c

^1da177e4c3f41 Linus Torvalds     2005-04-16   59  
cdcb07e45a911a Vincent Whitchurch 2020-05-14  @60  bool module_init_section(const char *name)
cdcb07e45a911a Vincent Whitchurch 2020-05-14   61  {
cdcb07e45a911a Vincent Whitchurch 2020-05-14   62  	return strstarts(name, ".init") ||
cdcb07e45a911a Vincent Whitchurch 2020-05-14   63  		strstarts(name, ".ARM.extab.init") ||
cdcb07e45a911a Vincent Whitchurch 2020-05-14   64  		strstarts(name, ".ARM.exidx.init");
cdcb07e45a911a Vincent Whitchurch 2020-05-14   65  }
cdcb07e45a911a Vincent Whitchurch 2020-05-14   66  
70bac08d4157fd Matthias Schiffer  2019-06-07  @67  bool module_exit_section(const char *name)
70bac08d4157fd Matthias Schiffer  2019-06-07   68  {
70bac08d4157fd Matthias Schiffer  2019-06-07   69  	return strstarts(name, ".exit") ||
70bac08d4157fd Matthias Schiffer  2019-06-07   70  		strstarts(name, ".ARM.extab.exit") ||
70bac08d4157fd Matthias Schiffer  2019-06-07   71  		strstarts(name, ".ARM.exidx.exit");
70bac08d4157fd Matthias Schiffer  2019-06-07   72  }
70bac08d4157fd Matthias Schiffer  2019-06-07   73  
d6905849f87596 Ard Biesheuvel     2022-01-24   74  #ifdef CONFIG_ARM_HAS_GROUP_RELOCS
1fa8c4b19543ae Ard Biesheuvel     2021-11-24   75  /*
1fa8c4b19543ae Ard Biesheuvel     2021-11-24   76   * This implements the partitioning algorithm for group relocations as
1fa8c4b19543ae Ard Biesheuvel     2021-11-24   77   * documented in the ARM AArch32 ELF psABI (IHI 0044).
1fa8c4b19543ae Ard Biesheuvel     2021-11-24   78   *
1fa8c4b19543ae Ard Biesheuvel     2021-11-24   79   * A single PC-relative symbol reference is divided in up to 3 add or subtract
1fa8c4b19543ae Ard Biesheuvel     2021-11-24   80   * operations, where the final one could be incorporated into a load/store
1fa8c4b19543ae Ard Biesheuvel     2021-11-24   81   * instruction with immediate offset. E.g.,
1fa8c4b19543ae Ard Biesheuvel     2021-11-24   82   *
1fa8c4b19543ae Ard Biesheuvel     2021-11-24   83   *   ADD	Rd, PC, #...		or	ADD	Rd, PC, #...
1fa8c4b19543ae Ard Biesheuvel     2021-11-24   84   *   ADD	Rd, Rd, #...			ADD	Rd, Rd, #...
1fa8c4b19543ae Ard Biesheuvel     2021-11-24   85   *   LDR	Rd, [Rd, #...]			ADD	Rd, Rd, #...
1fa8c4b19543ae Ard Biesheuvel     2021-11-24   86   *
1fa8c4b19543ae Ard Biesheuvel     2021-11-24   87   * The latter has a guaranteed range of only 16 MiB (3x8 == 24 bits), so it is
1fa8c4b19543ae Ard Biesheuvel     2021-11-24   88   * of limited use in the kernel. However, the ADD/ADD/LDR combo has a range of
1fa8c4b19543ae Ard Biesheuvel     2021-11-24   89   * -/+ 256 MiB, (2x8 + 12 == 28 bits), which means it has sufficient range for
1fa8c4b19543ae Ard Biesheuvel     2021-11-24   90   * any in-kernel symbol reference (unless module PLTs are being used).
1fa8c4b19543ae Ard Biesheuvel     2021-11-24   91   *
1fa8c4b19543ae Ard Biesheuvel     2021-11-24   92   * The main advantage of this approach over the typical pattern using a literal
1fa8c4b19543ae Ard Biesheuvel     2021-11-24   93   * load is that literal loads may miss in the D-cache, and generally lead to
1fa8c4b19543ae Ard Biesheuvel     2021-11-24   94   * lower cache efficiency for variables that are referenced often from many
1fa8c4b19543ae Ard Biesheuvel     2021-11-24   95   * different places in the code.
1fa8c4b19543ae Ard Biesheuvel     2021-11-24   96   */
1fa8c4b19543ae Ard Biesheuvel     2021-11-24   97  static u32 get_group_rem(u32 group, u32 *offset)
1fa8c4b19543ae Ard Biesheuvel     2021-11-24   98  {
1fa8c4b19543ae Ard Biesheuvel     2021-11-24   99  	u32 val = *offset;
1fa8c4b19543ae Ard Biesheuvel     2021-11-24  100  	u32 shift;
1fa8c4b19543ae Ard Biesheuvel     2021-11-24  101  	do {
1fa8c4b19543ae Ard Biesheuvel     2021-11-24  102  		shift = val ? (31 - __fls(val)) & ~1 : 32;
1fa8c4b19543ae Ard Biesheuvel     2021-11-24  103  		*offset = val;
1fa8c4b19543ae Ard Biesheuvel     2021-11-24  104  		if (!val)
1fa8c4b19543ae Ard Biesheuvel     2021-11-24  105  			break;
1fa8c4b19543ae Ard Biesheuvel     2021-11-24  106  		val &= 0xffffff >> shift;
1fa8c4b19543ae Ard Biesheuvel     2021-11-24  107  	} while (group--);
1fa8c4b19543ae Ard Biesheuvel     2021-11-24  108  	return shift;
1fa8c4b19543ae Ard Biesheuvel     2021-11-24  109  }
d6905849f87596 Ard Biesheuvel     2022-01-24  110  #endif
1fa8c4b19543ae Ard Biesheuvel     2021-11-24  111  
^1da177e4c3f41 Linus Torvalds     2005-04-16  112  int
^1da177e4c3f41 Linus Torvalds     2005-04-16 @113  apply_relocate(Elf32_Shdr *sechdrs, const char *strtab, unsigned int symindex,
^1da177e4c3f41 Linus Torvalds     2005-04-16  114  	       unsigned int relindex, struct module *module)
^1da177e4c3f41 Linus Torvalds     2005-04-16  115  {
^1da177e4c3f41 Linus Torvalds     2005-04-16  116  	Elf32_Shdr *symsec = sechdrs + symindex;
^1da177e4c3f41 Linus Torvalds     2005-04-16  117  	Elf32_Shdr *relsec = sechdrs + relindex;
^1da177e4c3f41 Linus Torvalds     2005-04-16  118  	Elf32_Shdr *dstsec = sechdrs + relsec->sh_info;
^1da177e4c3f41 Linus Torvalds     2005-04-16  119  	Elf32_Rel *rel = (void *)relsec->sh_addr;
^1da177e4c3f41 Linus Torvalds     2005-04-16  120  	unsigned int i;
^1da177e4c3f41 Linus Torvalds     2005-04-16  121  
^1da177e4c3f41 Linus Torvalds     2005-04-16  122  	for (i = 0; i < relsec->sh_size / sizeof(Elf32_Rel); i++, rel++) {
^1da177e4c3f41 Linus Torvalds     2005-04-16  123  		unsigned long loc;
^1da177e4c3f41 Linus Torvalds     2005-04-16  124  		Elf32_Sym *sym;
68e6fad488ef21 Russell King       2011-01-11  125  		const char *symname;
d6905849f87596 Ard Biesheuvel     2022-01-24  126  #ifdef CONFIG_ARM_HAS_GROUP_RELOCS
1fa8c4b19543ae Ard Biesheuvel     2021-11-24  127  		u32 shift, group = 1;
d6905849f87596 Ard Biesheuvel     2022-01-24  128  #endif
^1da177e4c3f41 Linus Torvalds     2005-04-16  129  		s32 offset;
f592d323bc2353 Ben Dooks          2013-07-19  130  		u32 tmp;
b749315601b44a Catalin Marinas    2010-06-21  131  #ifdef CONFIG_THUMB2_KERNEL
adca6dc23bc620 Catalin Marinas    2009-07-24  132  		u32 upper, lower, sign, j1, j2;
b749315601b44a Catalin Marinas    2010-06-21  133  #endif
^1da177e4c3f41 Linus Torvalds     2005-04-16  134  
^1da177e4c3f41 Linus Torvalds     2005-04-16  135  		offset = ELF32_R_SYM(rel->r_info);
^1da177e4c3f41 Linus Torvalds     2005-04-16  136  		if (offset < 0 || offset > (symsec->sh_size / sizeof(Elf32_Sym))) {
68e6fad488ef21 Russell King       2011-01-11  137  			pr_err("%s: section %u reloc %u: bad relocation sym offset\n",
^1da177e4c3f41 Linus Torvalds     2005-04-16  138  				module->name, relindex, i);
^1da177e4c3f41 Linus Torvalds     2005-04-16  139  			return -ENOEXEC;
^1da177e4c3f41 Linus Torvalds     2005-04-16  140  		}
^1da177e4c3f41 Linus Torvalds     2005-04-16  141  
^1da177e4c3f41 Linus Torvalds     2005-04-16  142  		sym = ((Elf32_Sym *)symsec->sh_addr) + offset;
68e6fad488ef21 Russell King       2011-01-11  143  		symname = strtab + sym->st_name;
^1da177e4c3f41 Linus Torvalds     2005-04-16  144  
^1da177e4c3f41 Linus Torvalds     2005-04-16  145  		if (rel->r_offset < 0 || rel->r_offset > dstsec->sh_size - sizeof(u32)) {
68e6fad488ef21 Russell King       2011-01-11  146  			pr_err("%s: section %u reloc %u sym '%s': out of bounds relocation, offset %d size %u\n",
68e6fad488ef21 Russell King       2011-01-11  147  			       module->name, relindex, i, symname,
68e6fad488ef21 Russell King       2011-01-11  148  			       rel->r_offset, dstsec->sh_size);
^1da177e4c3f41 Linus Torvalds     2005-04-16  149  			return -ENOEXEC;
^1da177e4c3f41 Linus Torvalds     2005-04-16  150  		}
^1da177e4c3f41 Linus Torvalds     2005-04-16  151  
^1da177e4c3f41 Linus Torvalds     2005-04-16  152  		loc = dstsec->sh_addr + rel->r_offset;
^1da177e4c3f41 Linus Torvalds     2005-04-16  153  
^1da177e4c3f41 Linus Torvalds     2005-04-16  154  		switch (ELF32_R_TYPE(rel->r_info)) {
2e1926e7b5d39e Catalin Marinas    2009-02-11  155  		case R_ARM_NONE:
2e1926e7b5d39e Catalin Marinas    2009-02-11  156  			/* ignore */
2e1926e7b5d39e Catalin Marinas    2009-02-11  157  			break;
2e1926e7b5d39e Catalin Marinas    2009-02-11  158  
^1da177e4c3f41 Linus Torvalds     2005-04-16  159  		case R_ARM_ABS32:
55f0fb6adb83a5 Andrey Ryabinin    2014-08-08  160  		case R_ARM_TARGET1:
^1da177e4c3f41 Linus Torvalds     2005-04-16  161  			*(u32 *)loc += sym->st_value;
^1da177e4c3f41 Linus Torvalds     2005-04-16  162  			break;
^1da177e4c3f41 Linus Torvalds     2005-04-16  163  
^1da177e4c3f41 Linus Torvalds     2005-04-16  164  		case R_ARM_PC24:
c2e2611425a956 Daniel Jacobowitz  2005-12-14  165  		case R_ARM_CALL:
c2e2611425a956 Daniel Jacobowitz  2005-12-14  166  		case R_ARM_JUMP24:
2b8514d0a79285 Ard Biesheuvel     2014-11-24  167  			if (sym->st_value & 3) {
2b8514d0a79285 Ard Biesheuvel     2014-11-24  168  				pr_err("%s: section %u reloc %u sym '%s': unsupported interworking call (ARM -> Thumb)\n",
2b8514d0a79285 Ard Biesheuvel     2014-11-24  169  				       module->name, relindex, i, symname);
2b8514d0a79285 Ard Biesheuvel     2014-11-24  170  				return -ENOEXEC;
2b8514d0a79285 Ard Biesheuvel     2014-11-24  171  			}
2b8514d0a79285 Ard Biesheuvel     2014-11-24  172  
f592d323bc2353 Ben Dooks          2013-07-19  173  			offset = __mem_to_opcode_arm(*(u32 *)loc);
f592d323bc2353 Ben Dooks          2013-07-19  174  			offset = (offset & 0x00ffffff) << 2;
^1da177e4c3f41 Linus Torvalds     2005-04-16  175  			if (offset & 0x02000000)
^1da177e4c3f41 Linus Torvalds     2005-04-16  176  				offset -= 0x04000000;
^1da177e4c3f41 Linus Torvalds     2005-04-16  177  
^1da177e4c3f41 Linus Torvalds     2005-04-16  178  			offset += sym->st_value - loc;
7d485f647c1f4a Ard Biesheuvel     2014-11-24  179  
7d485f647c1f4a Ard Biesheuvel     2014-11-24  180  			/*
7d485f647c1f4a Ard Biesheuvel     2014-11-24  181  			 * Route through a PLT entry if 'offset' exceeds the
7d485f647c1f4a Ard Biesheuvel     2014-11-24  182  			 * supported range. Note that 'offset + loc + 8'
7d485f647c1f4a Ard Biesheuvel     2014-11-24  183  			 * contains the absolute jump target, i.e.,
7d485f647c1f4a Ard Biesheuvel     2014-11-24  184  			 * @sym + addend, corrected for the +8 PC bias.
7d485f647c1f4a Ard Biesheuvel     2014-11-24  185  			 */
7d485f647c1f4a Ard Biesheuvel     2014-11-24  186  			if (IS_ENABLED(CONFIG_ARM_MODULE_PLTS) &&
7d485f647c1f4a Ard Biesheuvel     2014-11-24  187  			    (offset <= (s32)0xfe000000 ||
7d485f647c1f4a Ard Biesheuvel     2014-11-24  188  			     offset >= (s32)0x02000000))
7d485f647c1f4a Ard Biesheuvel     2014-11-24  189  				offset = get_module_plt(module, loc,
7d485f647c1f4a Ard Biesheuvel     2014-11-24  190  							offset + loc + 8)
7d485f647c1f4a Ard Biesheuvel     2014-11-24  191  					 - loc - 8;
7d485f647c1f4a Ard Biesheuvel     2014-11-24  192  
2b8514d0a79285 Ard Biesheuvel     2014-11-24  193  			if (offset <= (s32)0xfe000000 ||
c5f125031f416b Kevin Welton       2007-05-08  194  			    offset >= (s32)0x02000000) {
68e6fad488ef21 Russell King       2011-01-11  195  				pr_err("%s: section %u reloc %u sym '%s': relocation %u out of range (%#lx -> %#x)\n",
68e6fad488ef21 Russell King       2011-01-11  196  				       module->name, relindex, i, symname,
68e6fad488ef21 Russell King       2011-01-11  197  				       ELF32_R_TYPE(rel->r_info), loc,
68e6fad488ef21 Russell King       2011-01-11  198  				       sym->st_value);
^1da177e4c3f41 Linus Torvalds     2005-04-16  199  				return -ENOEXEC;
^1da177e4c3f41 Linus Torvalds     2005-04-16  200  			}
^1da177e4c3f41 Linus Torvalds     2005-04-16  201  
^1da177e4c3f41 Linus Torvalds     2005-04-16  202  			offset >>= 2;
f592d323bc2353 Ben Dooks          2013-07-19  203  			offset &= 0x00ffffff;
^1da177e4c3f41 Linus Torvalds     2005-04-16  204  
f592d323bc2353 Ben Dooks          2013-07-19  205  			*(u32 *)loc &= __opcode_to_mem_arm(0xff000000);
f592d323bc2353 Ben Dooks          2013-07-19  206  			*(u32 *)loc |= __opcode_to_mem_arm(offset);
^1da177e4c3f41 Linus Torvalds     2005-04-16  207  			break;
^1da177e4c3f41 Linus Torvalds     2005-04-16  208  
4731f8b66dd34e Daniel Silverstone 2009-03-20  209  	       case R_ARM_V4BX:
4731f8b66dd34e Daniel Silverstone 2009-03-20  210  		       /* Preserve Rm and the condition code. Alter
4731f8b66dd34e Daniel Silverstone 2009-03-20  211  			* other bits to re-code instruction as
4731f8b66dd34e Daniel Silverstone 2009-03-20  212  			* MOV PC,Rm.
4731f8b66dd34e Daniel Silverstone 2009-03-20  213  			*/
f592d323bc2353 Ben Dooks          2013-07-19  214  		       *(u32 *)loc &= __opcode_to_mem_arm(0xf000000f);
f592d323bc2353 Ben Dooks          2013-07-19  215  		       *(u32 *)loc |= __opcode_to_mem_arm(0x01a0f000);
4731f8b66dd34e Daniel Silverstone 2009-03-20  216  		       break;
4731f8b66dd34e Daniel Silverstone 2009-03-20  217  
2e1926e7b5d39e Catalin Marinas    2009-02-11  218  		case R_ARM_PREL31:
050d18d1c65113 Ard Biesheuvel     2017-01-30  219  			offset = (*(s32 *)loc << 1) >> 1; /* sign extend */
050d18d1c65113 Ard Biesheuvel     2017-01-30  220  			offset += sym->st_value - loc;
050d18d1c65113 Ard Biesheuvel     2017-01-30  221  			if (offset >= 0x40000000 || offset < -0x40000000) {
050d18d1c65113 Ard Biesheuvel     2017-01-30  222  				pr_err("%s: section %u reloc %u sym '%s': relocation %u out of range (%#lx -> %#x)\n",
050d18d1c65113 Ard Biesheuvel     2017-01-30  223  				       module->name, relindex, i, symname,
050d18d1c65113 Ard Biesheuvel     2017-01-30  224  				       ELF32_R_TYPE(rel->r_info), loc,
050d18d1c65113 Ard Biesheuvel     2017-01-30  225  				       sym->st_value);
050d18d1c65113 Ard Biesheuvel     2017-01-30  226  				return -ENOEXEC;
050d18d1c65113 Ard Biesheuvel     2017-01-30  227  			}
050d18d1c65113 Ard Biesheuvel     2017-01-30  228  			*(u32 *)loc &= 0x80000000;
050d18d1c65113 Ard Biesheuvel     2017-01-30  229  			*(u32 *)loc |= offset & 0x7fffffff;
2e1926e7b5d39e Catalin Marinas    2009-02-11  230  			break;
2e1926e7b5d39e Catalin Marinas    2009-02-11  231  
22f2d23098f7d3 Ard Biesheuvel     2020-09-14  232  		case R_ARM_REL32:
22f2d23098f7d3 Ard Biesheuvel     2020-09-14  233  			*(u32 *)loc += sym->st_value - loc;
22f2d23098f7d3 Ard Biesheuvel     2020-09-14  234  			break;
22f2d23098f7d3 Ard Biesheuvel     2020-09-14  235  
ae51e609843f7d Paul Gortmaker     2009-05-07  236  		case R_ARM_MOVW_ABS_NC:
ae51e609843f7d Paul Gortmaker     2009-05-07  237  		case R_ARM_MOVT_ABS:
22f2d23098f7d3 Ard Biesheuvel     2020-09-14  238  		case R_ARM_MOVW_PREL_NC:
22f2d23098f7d3 Ard Biesheuvel     2020-09-14  239  		case R_ARM_MOVT_PREL:
f592d323bc2353 Ben Dooks          2013-07-19  240  			offset = tmp = __mem_to_opcode_arm(*(u32 *)loc);
ae51e609843f7d Paul Gortmaker     2009-05-07  241  			offset = ((offset & 0xf0000) >> 4) | (offset & 0xfff);
ae51e609843f7d Paul Gortmaker     2009-05-07  242  			offset = (offset ^ 0x8000) - 0x8000;
ae51e609843f7d Paul Gortmaker     2009-05-07  243  
ae51e609843f7d Paul Gortmaker     2009-05-07  244  			offset += sym->st_value;
22f2d23098f7d3 Ard Biesheuvel     2020-09-14  245  			if (ELF32_R_TYPE(rel->r_info) == R_ARM_MOVT_PREL ||
22f2d23098f7d3 Ard Biesheuvel     2020-09-14  246  			    ELF32_R_TYPE(rel->r_info) == R_ARM_MOVW_PREL_NC)
22f2d23098f7d3 Ard Biesheuvel     2020-09-14  247  				offset -= loc;
22f2d23098f7d3 Ard Biesheuvel     2020-09-14  248  			if (ELF32_R_TYPE(rel->r_info) == R_ARM_MOVT_ABS ||
22f2d23098f7d3 Ard Biesheuvel     2020-09-14  249  			    ELF32_R_TYPE(rel->r_info) == R_ARM_MOVT_PREL)
ae51e609843f7d Paul Gortmaker     2009-05-07  250  				offset >>= 16;
ae51e609843f7d Paul Gortmaker     2009-05-07  251  
f592d323bc2353 Ben Dooks          2013-07-19  252  			tmp &= 0xfff0f000;
f592d323bc2353 Ben Dooks          2013-07-19  253  			tmp |= ((offset & 0xf000) << 4) |
ae51e609843f7d Paul Gortmaker     2009-05-07  254  				(offset & 0x0fff);
f592d323bc2353 Ben Dooks          2013-07-19  255  
f592d323bc2353 Ben Dooks          2013-07-19  256  			*(u32 *)loc = __opcode_to_mem_arm(tmp);
ae51e609843f7d Paul Gortmaker     2009-05-07  257  			break;
ae51e609843f7d Paul Gortmaker     2009-05-07  258  

:::::: The code at line 60 was first introduced by commit
:::::: cdcb07e45a911a5be9d38bb1aff1f6de019503b2 ARM: 8975/1: module: fix handling of unwind init sections

:::::: TO: Vincent Whitchurch <vincent.whitchurch@axis.com>
:::::: CC: Russell King <rmk+kernel@armlinux.org.uk>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
