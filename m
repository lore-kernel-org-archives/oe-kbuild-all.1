Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52560386549
	for <oe-kbuild-all@lists.linux.dev>; Tue,  3 Mar 2026 08:59:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772528403; cv=none; b=X/yFo0iegF8vj9LORCpmEVGWrovYWY9zMGjY2uOJYU7iO6wfGvNQPKGHnL3kbrFhWwSB/M7bCLyhmql3F3z8Uw+HrkNfLL27zyC4Ci1vlIaY7x/lVGbkUcA1PgUtM89zVE1ObmD4irmnQ5BPqU63pg5g8Uvx01nPu712jhU8A44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772528403; c=relaxed/simple;
	bh=IHgGEDraPs+OnJSNFJlsXXlf+3FzHlBWQ620b6NPRcw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=g3/zACUG1KkXtY/ipm4Mxg3yXg8v9NE+wIjDxi7T/k2OGo0WyDqiSrLw0VuT45UOjeJb7JaWcWvnSYYoYRpe5IBRdkT9MTU6P66ZZYAxx96ORioOdMg1oGaYc18Kk0ASJIWvz23MDCjhdNWA9x0HG/Fekdfdq1ui7xpxWwoEV5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gp0vLcvE; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gp0vLcvE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772528398; x=1804064398;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IHgGEDraPs+OnJSNFJlsXXlf+3FzHlBWQ620b6NPRcw=;
  b=gp0vLcvEDeADf2U3+v2TVKEv5ZQMAykIPUTr/OoJrzzYETdrwvkjv7ZC
   2VvWEiuBd24Fbp00LMrC38FgIhJVlfS+faE37q4JmOs44D2/F8GZwe7bZ
   iPAAuKprr83Q2hfn7ZX6+hNdrzjkTP/hqSMioA//YuBmnRZ2Eg4X+yFBm
   fNmH56b2W1ZAToq9cxcUp9wCA1Nc/VDriJTBELs7jdtnaxFNHWQgwoF0k
   fJhs4n/cwI7KBpOuAee/DjVGiElV/DbeI2EL5aGE86LUx3EKGyiRggYF0
   KDN6Dc78sOA5IIf7/SCTnVrn1ei8fHPCNrW16xhX6tAUBJ25l1EtqXZaF
   w==;
X-CSE-ConnectionGUID: RmSQLEw8TbC3UKDq4oUtsA==
X-CSE-MsgGUID: OveqzXMtSii9sZt+JnAXQQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11717"; a="73428815"
X-IronPort-AV: E=Sophos;i="6.21,321,1763452800"; 
   d="scan'208";a="73428815"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2026 00:59:56 -0800
X-CSE-ConnectionGUID: jKIBmJ2USzyMYwl9cAgC2Q==
X-CSE-MsgGUID: oPBtYMG3Tuui5oiJatOzuw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,321,1763452800"; 
   d="scan'208";a="255816242"
Received: from lkp-server01.sh.intel.com (HELO f27a57aa7a36) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 03 Mar 2026 00:59:54 -0800
Received: from kbuild by f27a57aa7a36 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vxLbb-000000001uj-3vsO;
	Tue, 03 Mar 2026 08:59:51 +0000
Date: Tue, 03 Mar 2026 16:59:19 +0800
From: kernel test robot <lkp@intel.com>
To: "Thomas =?utf-8?Q?Wei=C3=9Fschuh"?= <thomas.weissschuh@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [thomas-weissschuh:b4/uapi-reloc 21/29]
 arch/nios2/kernel/module.c:51:22: error: 'R_NIOS2_NONE' undeclared; did you
 mean 'R_MIPS_NONE'?
Message-ID: <202603031626.kgxPJjjn-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/linux.git b4/uapi-reloc
head:   33f42a1893f9a3bf636eca78853700f3e57e9e36
commit: eec9dfe8147b97eaa34c713fea1879d97e896e5e [21/29] hexagon: move relocation constants to the UAPI
config: nios2-allmodconfig (https://download.01.org/0day-ci/archive/20260303/202603031626.kgxPJjjn-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260303/202603031626.kgxPJjjn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603031626.kgxPJjjn-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/nios2/kernel/module.c: In function 'apply_relocate_add':
>> arch/nios2/kernel/module.c:51:22: error: 'R_NIOS2_NONE' undeclared (first use in this function); did you mean 'R_MIPS_NONE'?
      51 |                 case R_NIOS2_NONE:
         |                      ^~~~~~~~~~~~
         |                      R_MIPS_NONE
   arch/nios2/kernel/module.c:51:22: note: each undeclared identifier is reported only once for each function it appears in
>> arch/nios2/kernel/module.c:53:22: error: 'R_NIOS2_BFD_RELOC_32' undeclared (first use in this function)
      53 |                 case R_NIOS2_BFD_RELOC_32:
         |                      ^~~~~~~~~~~~~~~~~~~~
>> arch/nios2/kernel/module.c:56:22: error: 'R_NIOS2_PCREL16' undeclared (first use in this function); did you mean 'R_MIPS_GPREL16'?
      56 |                 case R_NIOS2_PCREL16:
         |                      ^~~~~~~~~~~~~~~
         |                      R_MIPS_GPREL16
>> arch/nios2/kernel/module.c:68:22: error: 'R_NIOS2_CALL26' undeclared (first use in this function); did you mean 'R_MIPS_CALL16'?
      68 |                 case R_NIOS2_CALL26:
         |                      ^~~~~~~~~~~~~~
         |                      R_MIPS_CALL16
>> arch/nios2/kernel/module.c:81:22: error: 'R_NIOS2_HI16' undeclared (first use in this function); did you mean 'R_MIPS_HI16'?
      81 |                 case R_NIOS2_HI16:
         |                      ^~~~~~~~~~~~
         |                      R_MIPS_HI16
>> arch/nios2/kernel/module.c:86:22: error: 'R_NIOS2_LO16' undeclared (first use in this function); did you mean 'R_MIPS_LO16'?
      86 |                 case R_NIOS2_LO16:
         |                      ^~~~~~~~~~~~
         |                      R_MIPS_LO16
>> arch/nios2/kernel/module.c:91:22: error: 'R_NIOS2_HIADJ16' undeclared (first use in this function)
      91 |                 case R_NIOS2_HIADJ16:
         |                      ^~~~~~~~~~~~~~~


vim +51 arch/nios2/kernel/module.c

42381bf1f2de13 Ley Foon Tan 2014-11-06   22  
42381bf1f2de13 Ley Foon Tan 2014-11-06   23  int apply_relocate_add(Elf32_Shdr *sechdrs, const char *strtab,
42381bf1f2de13 Ley Foon Tan 2014-11-06   24  			unsigned int symindex, unsigned int relsec,
42381bf1f2de13 Ley Foon Tan 2014-11-06   25  			struct module *mod)
42381bf1f2de13 Ley Foon Tan 2014-11-06   26  {
42381bf1f2de13 Ley Foon Tan 2014-11-06   27  	unsigned int i;
42381bf1f2de13 Ley Foon Tan 2014-11-06   28  	Elf32_Rela *rela = (void *)sechdrs[relsec].sh_addr;
42381bf1f2de13 Ley Foon Tan 2014-11-06   29  
42381bf1f2de13 Ley Foon Tan 2014-11-06   30  	pr_debug("Applying relocate section %u to %u\n", relsec,
42381bf1f2de13 Ley Foon Tan 2014-11-06   31  		 sechdrs[relsec].sh_info);
42381bf1f2de13 Ley Foon Tan 2014-11-06   32  
42381bf1f2de13 Ley Foon Tan 2014-11-06   33  	for (i = 0; i < sechdrs[relsec].sh_size / sizeof(*rela); i++) {
42381bf1f2de13 Ley Foon Tan 2014-11-06   34  		/* This is where to make the change */
42381bf1f2de13 Ley Foon Tan 2014-11-06   35  		uint32_t word;
42381bf1f2de13 Ley Foon Tan 2014-11-06   36  		uint32_t *loc
42381bf1f2de13 Ley Foon Tan 2014-11-06   37  			= ((void *)sechdrs[sechdrs[relsec].sh_info].sh_addr
42381bf1f2de13 Ley Foon Tan 2014-11-06   38  			   + rela[i].r_offset);
42381bf1f2de13 Ley Foon Tan 2014-11-06   39  		/* This is the symbol it is referring to.  Note that all
42381bf1f2de13 Ley Foon Tan 2014-11-06   40  		   undefined symbols have been resolved.  */
42381bf1f2de13 Ley Foon Tan 2014-11-06   41  		Elf32_Sym *sym
42381bf1f2de13 Ley Foon Tan 2014-11-06   42  			= ((Elf32_Sym *)sechdrs[symindex].sh_addr
42381bf1f2de13 Ley Foon Tan 2014-11-06   43  				+ ELF32_R_SYM(rela[i].r_info));
42381bf1f2de13 Ley Foon Tan 2014-11-06   44  		uint32_t v = sym->st_value + rela[i].r_addend;
42381bf1f2de13 Ley Foon Tan 2014-11-06   45  
42381bf1f2de13 Ley Foon Tan 2014-11-06   46  		pr_debug("reltype %d 0x%x name:<%s>\n",
42381bf1f2de13 Ley Foon Tan 2014-11-06   47  			ELF32_R_TYPE(rela[i].r_info),
42381bf1f2de13 Ley Foon Tan 2014-11-06   48  			rela[i].r_offset, strtab + sym->st_name);
42381bf1f2de13 Ley Foon Tan 2014-11-06   49  
42381bf1f2de13 Ley Foon Tan 2014-11-06   50  		switch (ELF32_R_TYPE(rela[i].r_info)) {
42381bf1f2de13 Ley Foon Tan 2014-11-06  @51  		case R_NIOS2_NONE:
42381bf1f2de13 Ley Foon Tan 2014-11-06   52  			break;
42381bf1f2de13 Ley Foon Tan 2014-11-06  @53  		case R_NIOS2_BFD_RELOC_32:
42381bf1f2de13 Ley Foon Tan 2014-11-06   54  			*loc += v;
42381bf1f2de13 Ley Foon Tan 2014-11-06   55  			break;
42381bf1f2de13 Ley Foon Tan 2014-11-06  @56  		case R_NIOS2_PCREL16:
42381bf1f2de13 Ley Foon Tan 2014-11-06   57  			v -= (uint32_t)loc + 4;
42381bf1f2de13 Ley Foon Tan 2014-11-06   58  			if ((int32_t)v > 0x7fff ||
42381bf1f2de13 Ley Foon Tan 2014-11-06   59  				(int32_t)v < -(int32_t)0x8000) {
42381bf1f2de13 Ley Foon Tan 2014-11-06   60  				pr_err("module %s: relocation overflow\n",
42381bf1f2de13 Ley Foon Tan 2014-11-06   61  					mod->name);
42381bf1f2de13 Ley Foon Tan 2014-11-06   62  				return -ENOEXEC;
42381bf1f2de13 Ley Foon Tan 2014-11-06   63  			}
42381bf1f2de13 Ley Foon Tan 2014-11-06   64  			word = *loc;
42381bf1f2de13 Ley Foon Tan 2014-11-06   65  			*loc = ((((word >> 22) << 16) | (v & 0xffff)) << 6) |
42381bf1f2de13 Ley Foon Tan 2014-11-06   66  				(word & 0x3f);
42381bf1f2de13 Ley Foon Tan 2014-11-06   67  			break;
42381bf1f2de13 Ley Foon Tan 2014-11-06  @68  		case R_NIOS2_CALL26:
42381bf1f2de13 Ley Foon Tan 2014-11-06   69  			if (v & 3) {
42381bf1f2de13 Ley Foon Tan 2014-11-06   70  				pr_err("module %s: dangerous relocation\n",
42381bf1f2de13 Ley Foon Tan 2014-11-06   71  					mod->name);
42381bf1f2de13 Ley Foon Tan 2014-11-06   72  				return -ENOEXEC;
42381bf1f2de13 Ley Foon Tan 2014-11-06   73  			}
42381bf1f2de13 Ley Foon Tan 2014-11-06   74  			if ((v >> 28) != ((uint32_t)loc >> 28)) {
42381bf1f2de13 Ley Foon Tan 2014-11-06   75  				pr_err("module %s: relocation overflow\n",
42381bf1f2de13 Ley Foon Tan 2014-11-06   76  					mod->name);
42381bf1f2de13 Ley Foon Tan 2014-11-06   77  				return -ENOEXEC;
42381bf1f2de13 Ley Foon Tan 2014-11-06   78  			}
42381bf1f2de13 Ley Foon Tan 2014-11-06   79  			*loc = (*loc & 0x3f) | ((v >> 2) << 6);
42381bf1f2de13 Ley Foon Tan 2014-11-06   80  			break;
42381bf1f2de13 Ley Foon Tan 2014-11-06  @81  		case R_NIOS2_HI16:
42381bf1f2de13 Ley Foon Tan 2014-11-06   82  			word = *loc;
42381bf1f2de13 Ley Foon Tan 2014-11-06   83  			*loc = ((((word >> 22) << 16) |
42381bf1f2de13 Ley Foon Tan 2014-11-06   84  				((v >> 16) & 0xffff)) << 6) | (word & 0x3f);
42381bf1f2de13 Ley Foon Tan 2014-11-06   85  			break;
42381bf1f2de13 Ley Foon Tan 2014-11-06  @86  		case R_NIOS2_LO16:
42381bf1f2de13 Ley Foon Tan 2014-11-06   87  			word = *loc;
42381bf1f2de13 Ley Foon Tan 2014-11-06   88  			*loc = ((((word >> 22) << 16) | (v & 0xffff)) << 6) |
42381bf1f2de13 Ley Foon Tan 2014-11-06   89  					(word & 0x3f);
42381bf1f2de13 Ley Foon Tan 2014-11-06   90  			break;
42381bf1f2de13 Ley Foon Tan 2014-11-06  @91  		case R_NIOS2_HIADJ16:
42381bf1f2de13 Ley Foon Tan 2014-11-06   92  			{
42381bf1f2de13 Ley Foon Tan 2014-11-06   93  				Elf32_Addr word2;
42381bf1f2de13 Ley Foon Tan 2014-11-06   94  
42381bf1f2de13 Ley Foon Tan 2014-11-06   95  				word = *loc;
42381bf1f2de13 Ley Foon Tan 2014-11-06   96  				word2 = ((v >> 16) + ((v >> 15) & 1)) & 0xffff;
42381bf1f2de13 Ley Foon Tan 2014-11-06   97  				*loc = ((((word >> 22) << 16) | word2) << 6) |
42381bf1f2de13 Ley Foon Tan 2014-11-06   98  						(word & 0x3f);
42381bf1f2de13 Ley Foon Tan 2014-11-06   99  			}
42381bf1f2de13 Ley Foon Tan 2014-11-06  100  			break;
42381bf1f2de13 Ley Foon Tan 2014-11-06  101  
42381bf1f2de13 Ley Foon Tan 2014-11-06  102  		default:
42381bf1f2de13 Ley Foon Tan 2014-11-06  103  			pr_err("module %s: Unknown reloc: %u\n",
42381bf1f2de13 Ley Foon Tan 2014-11-06  104  				mod->name, ELF32_R_TYPE(rela[i].r_info));
42381bf1f2de13 Ley Foon Tan 2014-11-06  105  			return -ENOEXEC;
42381bf1f2de13 Ley Foon Tan 2014-11-06  106  		}
42381bf1f2de13 Ley Foon Tan 2014-11-06  107  	}
42381bf1f2de13 Ley Foon Tan 2014-11-06  108  
42381bf1f2de13 Ley Foon Tan 2014-11-06  109  	return 0;
42381bf1f2de13 Ley Foon Tan 2014-11-06  110  }
42381bf1f2de13 Ley Foon Tan 2014-11-06  111  

:::::: The code at line 51 was first introduced by commit
:::::: 42381bf1f2de13bbfbdea74b78af9768ab65b80c nios2: Module support

:::::: TO: Ley Foon Tan <lftan@altera.com>
:::::: CC: Ley Foon Tan <lftan@altera.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
