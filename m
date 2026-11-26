Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795668221;
	b=AoBMZgQaSmkluq7CCcRdWDFs6+hM15s799xJ9rR1JFAw1o+1ALZW5p0kyrxZNnb3W+vk
	 MjTLy9qfG6J8jUy1tyu21WlLHYER8HpeCB4hd30YoFvRPf/FOvauo+SBrL1U2RnCMW1/G
	 wYaN7kjPACCzuJzEWIQZNve+CTT8lkGJ22JANy61ZeyP/QECzzftFXeoM1LxXfjydiu83
	 8FAur7z9LvyA3j19hRatWuZlU1TeV6WzfTnuqFv8kx/gDYM8Hr+Gf16kmRAF/wPorncU5
	 aHIkMo89KWwNC3T4AqzeNa8ewevNaohORCmohbXFMDVjgYKtQQn8zdE7LaEJDM0dXUA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795668221;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=wqxC7ecQ2Te0979ALhYdTDSc2dTw1QTBl/dHrGrxHws=;
	b=tfMoOMPeKxr10f8OPynlDdpiXD15WB2x+3J4GQi+q+XgDirPjHt6lz476fer3+N32u9q
	 pGvHQj/j9MfRkJ/xNq3SV+L4N1flXVM6W3G1yMS1s4pVN2cvGUL2lIrcz6sDd/axQ2pgP
	 K4eQzYOwVfxjmN40hxoEejdH6MO+77RrSDrPtIXdrh75jL9uPst8KFIaUYtaEdjlrdtJK
	 5hn62Vbw72pE9X88qftIGUi7PO2QoO7HDz9oCPmIAc2dcEcoAtfusvzZzS1/JVZxVLZNn
	 AuXYNuCMUZnirhevsVO40LCK0aITWNwRRz84xVa0/CO4IqprFXjYYZZA6PKqWJ7G9Ug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=bdlkaMvh;
	arc=none smtp.remote-ip=192.198.163.16
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAB52606A31C
	for <oe-kbuild-all@lists.linux.dev>; Thu, 26 Nov 2026 04:43:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CAB52606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=bdlkaMvh
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795668221; x=1827204221;
  h=date:from:to:cc:subject:message-id;
  bh=QO1uV7LyWoex6IrLleJUtZ9Xd+RGtOI2vuFeCz2Lc1w=;
  b=bdlkaMvhdRf+8NKElJUYGsWOL/i3iS6ewBMAFpTwPRk0HocXZELfaGeN
   gj+ZDueBdw95Vd99mlNgQhhEAjv9bG5BBmI3rQqVkvq+RtucuYZaRETYc
   JVOPjwHtHoVSltTBkeq5NCxzgEsUGV5p2Kt+9NPnQWqpCeF063PT8lieT
   q/qbUPw6F7Y56lKVszwU32Cm9ODQZGya/o3URt31opoCT1wbMTGilGMF9
   74vCxrTZT+iykFcdv023Aowlqld5EIOAqfAfpAQsboQy8b/oWaRHz+xt7
   0REg0kJfmFGeW9ANbkqOnSGNaNf7PKz7dMBuI8ceGfDrSEmhRU0ZF/SmF
   g==;
X-CSE-ConnectionGUID: 3HBy8DL9TUqgVYDZ1/9MPQ==
X-CSE-MsgGUID: kSEBfyZ8SpClT7sEKheonw==
X-IronPort-AV: E=McAfee;i="6800,10657,11977"; a="4586345"
X-IronPort-AV: E=Sophos;i="6.27,234,1787036400"; 
   d="scan'208";a="4586345"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2026 20:43:40 -0800
X-CSE-ConnectionGUID: aM13+FEDQief10KqeSmAmg==
X-CSE-MsgGUID: PsEFB7mvSJ6trgSWgYKbow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,234,1787036400"; 
   d="scan'208";a="12101142"
Received: from igk-lkp-server01.igk.intel.com (HELO a03d4d989450) ([10.211.93.152])
  by orviesa002.jf.intel.com with ESMTP; 25 Nov 2026 20:43:39 -0800
Received: from kbuild by a03d4d989450 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xWRKa-000000000EJ-2x1Z;
	Thu, 26 Nov 2026 04:43:36 +0000
Date: Thu, 26 Nov 2026 05:43:35 +0100
From: kernel test robot <lkp@intel.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ardb:efi-zboot-elf 21/22]
 drivers/firmware/efi/libstub/zboot.c:78:16: warning: cast to pointer from
 integer of different size
Message-ID: <20261126054123.bwonqnCJ-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git efi-zboot-elf
head:   ee915eebcaa3ed159fd8a2e4d07cc33e348a6531
commit: 71668402cb4161b23740dc1f8a88d286e8917665 [21/22] efi/zboot: Add support for ELF payloads
config: loongarch-randconfig-r2300-20261126 (https://download.01.org/0day-ci/archive/20261126/20261126054123.bwonqnCJ-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 16.2.0
sparse: v0.6.5-rc1-21-g84ec0658
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261126/20261126054123.bwonqnCJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/20261126054123.bwonqnCJ-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/firmware/efi/libstub/zboot.c: In function 'zboot_prepare_elf':
>> drivers/firmware/efi/libstub/zboot.c:78:16: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
      78 |         phdr = (const Elf64_Phdr *)(*head_buf + ehdr->e_phoff);
         |                ^

sparse warnings: (new ones prefixed by >>)
   command-line: note: in included file:
   builtin:1:9: sparse: sparse: preprocessor token __STDC_HOSTED__ redefined
   builtin:0:0: sparse: this was the original definition
>> drivers/firmware/efi/libstub/zboot.c:78:49: sparse: sparse: non size-preserving integer to pointer cast

vim +78 drivers/firmware/efi/libstub/zboot.c

    12	
    13	static efi_status_t zboot_prepare_elf(unsigned long body_size,
    14					      unsigned long *head_buf,
    15					      unsigned long *head_size,
    16					      unsigned long *tail_size,
    17					      unsigned long *image_size,
    18					      unsigned long *elf_align)
    19	{
    20		unsigned long head_clen = _gzdata_start - _elfdata_start;
    21		unsigned long tail_clen = _elfdata_end - _gzdata_end;
    22		const Elf64_Phdr *phdr, *load = NULL;
    23		const Elf64_Ehdr *ehdr;
    24		unsigned long total;
    25		efi_status_t status;
    26	
    27		if (!IS_ENABLED(CONFIG_EFI_ZBOOT_ELF)) {
    28			*image_size = body_size;
    29			*head_buf = *head_size = *tail_size = *elf_align = 0;
    30			return EFI_SUCCESS;
    31		}
    32	
    33		status = efi_zboot_decompress_size(_elfdata_start, head_clen,
    34						   head_size);
    35		if (status != EFI_SUCCESS)
    36			return status;
    37	
    38		if (*head_size < sizeof(Elf64_Ehdr))
    39			return EFI_LOAD_ERROR;
    40	
    41		status = efi_zboot_decompress_size(_gzdata_end, tail_clen,
    42						   tail_size);
    43		if (status != EFI_SUCCESS)
    44			return status;
    45	
    46		if (check_add_overflow(*head_size, body_size, &total) ||
    47		    check_add_overflow(total, *tail_size, &total))
    48			return EFI_LOAD_ERROR;
    49	
    50		status = efi_allocate_pages(*head_size, head_buf, ULONG_MAX);
    51		if (status != EFI_SUCCESS)
    52			return status;
    53	
    54		status = efi_zboot_decompress(_elfdata_start, head_clen,
    55					      (u8 *)*head_buf, *head_size);
    56		if (status != EFI_SUCCESS)
    57			goto err;
    58	
    59		ehdr = (const Elf64_Ehdr *)*head_buf;
    60		if (memcmp(ehdr->e_ident, ELFMAG, SELFMAG) != 0 ||
    61		    ehdr->e_ident[EI_CLASS] != ELF_CLASS ||
    62		    ehdr->e_ident[EI_DATA] != ELF_DATA ||
    63		    ehdr->e_machine != ELF_ARCH) {
    64			efi_err("Payload is not an ELF image for this architecture\n");
    65			status = EFI_LOAD_ERROR;
    66			goto err;
    67		}
    68	
    69		if (ehdr->e_phentsize != sizeof(Elf64_Phdr) ||
    70		    ehdr->e_phnum == 0 ||
    71		    ehdr->e_phoff > *head_size ||
    72		    ehdr->e_phnum > (*head_size - ehdr->e_phoff) / sizeof(Elf64_Phdr)) {
    73			efi_err("Unexpected ELF header layout\n");
    74			status = EFI_LOAD_ERROR;
    75			goto err;
    76		}
    77	
  > 78		phdr = (const Elf64_Phdr *)(*head_buf + ehdr->e_phoff);
    79		for (int i = 0; i < ehdr->e_phnum; i++) {
    80			if (phdr[i].p_type != PT_LOAD)
    81				continue;
    82			if (load) {
    83				efi_err("Multiple ELF PT_LOAD segments not supported\n");
    84				status = EFI_LOAD_ERROR;
    85				goto err;
    86			}
    87			load = &phdr[i];
    88		}
    89	
    90		if (!load || load->p_offset != *head_size ||
    91		    load->p_filesz != body_size ||
    92		    load->p_filesz > load->p_memsz ||
    93		    (load->p_align > 1 && !is_power_of_2(load->p_align))) {
    94			efi_err("Invalid ELF PT_LOAD header\n");
    95			status = EFI_LOAD_ERROR;
    96			goto err;
    97		}
    98	
    99		efi_info("ELF zboot payload detected\n");
   100	
   101		*image_size = load->p_memsz;
   102		*elf_align = load->p_align;
   103		return EFI_SUCCESS;
   104	err:
   105		efi_free(*head_size, *head_buf);
   106		return status;
   107	}
   108	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
