Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87D2F1384
	for <oe-kbuild-all@lists.linux.dev>; Tue,  8 Aug 2023 03:45:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691466342; x=1723002342;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Oh0/1MbOyZr5XYP6jDQCd6NwZmQ4wqIkRfFcJQiFawE=;
  b=GKzf20qJclHtWq42gqS/wtNFC17erxCPhoqCqmJMagMLZ1jPKwAbEHkg
   4PAEFCWpDOTdVPJEcuQUmh9ql7kERZmCucYTr4hpyecSyhTpkz2NEyClJ
   AmiPfFBVSapGC9QJIn5jQhibVC8LjilUo6IHjQs5TBEndcTSUBptKHs3M
   3Eo5E7Iyu07HQYWTDaqu8eWwQVt58wEev/iVggyBrPxzpzeyjALgzW706
   pwn0EPNS/bL/ai6+Faezrq9miFapzDFLIooVy+jAn1o5fu0ILa27Js2CH
   oG5607pzEYCC8KdRDngh3FvXUQ8LPswAXZiHgPNHuM+skxr/8mUR+/KDA
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="368163492"
X-IronPort-AV: E=Sophos;i="6.01,263,1684825200"; 
   d="scan'208";a="368163492"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2023 20:45:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="821199170"
X-IronPort-AV: E=Sophos;i="6.01,263,1684825200"; 
   d="scan'208";a="821199170"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 07 Aug 2023 20:45:39 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qTDf8-00054K-2U;
	Tue, 08 Aug 2023 03:45:38 +0000
Date: Tue, 8 Aug 2023 11:45:37 +0800
From: kernel test robot <lkp@intel.com>
To: Eric DeVolder <eric.devolder@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>,
	Sourabh Jain <sourabhjain@linux.ibm.com>
Subject: [akpm-mm:mm-nonmm-unstable 56/63] kernel/crash_core.c:331:23: error:
 invalid use of undefined type 'struct crash_mem'
Message-ID: <202308081133.DyoThWwi-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-nonmm-unstable
head:   6a41fd4665e650c659412a54f90cf364c592039a
commit: 626775922a575bc420a5f1b5caf30f9898fe9cf6 [56/63] crash: move a few code bits to setup support of crash hotplug
config: arc-randconfig-r026-20230807 (https://download.01.org/0day-ci/archive/20230808/202308081133.DyoThWwi-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230808/202308081133.DyoThWwi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308081133.DyoThWwi-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> kernel/crash_core.c:318:40: warning: 'struct crash_mem' declared inside parameter list will not be visible outside of this definition or declaration
     318 | int crash_prepare_elf64_headers(struct crash_mem *mem, int need_kernel_map,
         |                                        ^~~~~~~~~
>> kernel/crash_core.c:318:5: warning: no previous prototype for 'crash_prepare_elf64_headers' [-Wmissing-prototypes]
     318 | int crash_prepare_elf64_headers(struct crash_mem *mem, int need_kernel_map,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/crash_core.c: In function 'crash_prepare_elf64_headers':
>> kernel/crash_core.c:331:23: error: invalid use of undefined type 'struct crash_mem'
     331 |         nr_phdr += mem->nr_ranges;
         |                       ^~
   In file included from include/vdso/const.h:5,
                    from include/linux/const.h:4,
                    from include/linux/align.h:5,
                    from include/linux/kernel.h:15,
                    from include/linux/cpumask.h:10,
                    from include/linux/mm_types_task.h:14,
                    from include/linux/mm_types.h:5,
                    from include/linux/buildid.h:5,
                    from kernel/crash_core.c:7:
>> kernel/crash_core.c:343:32: error: 'ELF_CORE_HEADER_ALIGN' undeclared (first use in this function)
     343 |         elf_sz = ALIGN(elf_sz, ELF_CORE_HEADER_ALIGN);
         |                                ^~~~~~~~~~~~~~~~~~~~~
   include/uapi/linux/const.h:32:50: note: in definition of macro '__ALIGN_KERNEL_MASK'
      32 | #define __ALIGN_KERNEL_MASK(x, mask)    (((x) + (mask)) & ~(mask))
         |                                                  ^~~~
   include/linux/align.h:8:33: note: in expansion of macro '__ALIGN_KERNEL'
       8 | #define ALIGN(x, a)             __ALIGN_KERNEL((x), (a))
         |                                 ^~~~~~~~~~~~~~
   kernel/crash_core.c:343:18: note: in expansion of macro 'ALIGN'
     343 |         elf_sz = ALIGN(elf_sz, ELF_CORE_HEADER_ALIGN);
         |                  ^~~~~
   kernel/crash_core.c:343:32: note: each undeclared identifier is reported only once for each function it appears in
     343 |         elf_sz = ALIGN(elf_sz, ELF_CORE_HEADER_ALIGN);
         |                                ^~~~~~~~~~~~~~~~~~~~~
   include/uapi/linux/const.h:32:50: note: in definition of macro '__ALIGN_KERNEL_MASK'
      32 | #define __ALIGN_KERNEL_MASK(x, mask)    (((x) + (mask)) & ~(mask))
         |                                                  ^~~~
   include/linux/align.h:8:33: note: in expansion of macro '__ALIGN_KERNEL'
       8 | #define ALIGN(x, a)             __ALIGN_KERNEL((x), (a))
         |                                 ^~~~~~~~~~~~~~
   kernel/crash_core.c:343:18: note: in expansion of macro 'ALIGN'
     343 |         elf_sz = ALIGN(elf_sz, ELF_CORE_HEADER_ALIGN);
         |                  ^~~~~
   kernel/crash_core.c:393:28: error: invalid use of undefined type 'struct crash_mem'
     393 |         for (i = 0; i < mem->nr_ranges; i++) {
         |                            ^~
   kernel/crash_core.c:394:29: error: invalid use of undefined type 'struct crash_mem'
     394 |                 mstart = mem->ranges[i].start;
         |                             ^~
   kernel/crash_core.c:395:27: error: invalid use of undefined type 'struct crash_mem'
     395 |                 mend = mem->ranges[i].end;
         |                           ^~
   kernel/crash_core.c: At top level:
   kernel/crash_core.c:417:36: warning: 'struct crash_mem' declared inside parameter list will not be visible outside of this definition or declaration
     417 | int crash_exclude_mem_range(struct crash_mem *mem,
         |                                    ^~~~~~~~~
>> kernel/crash_core.c:417:5: warning: no previous prototype for 'crash_exclude_mem_range' [-Wmissing-prototypes]
     417 | int crash_exclude_mem_range(struct crash_mem *mem,
         |     ^~~~~~~~~~~~~~~~~~~~~~~
   kernel/crash_core.c: In function 'crash_exclude_mem_range':
   kernel/crash_core.c:424:28: error: invalid use of undefined type 'struct crash_mem'
     424 |         for (i = 0; i < mem->nr_ranges; i++) {
         |                            ^~
   kernel/crash_core.c:425:28: error: invalid use of undefined type 'struct crash_mem'
     425 |                 start = mem->ranges[i].start;
         |                            ^~
   kernel/crash_core.c:426:26: error: invalid use of undefined type 'struct crash_mem'
     426 |                 end = mem->ranges[i].end;
         |                          ^~
   kernel/crash_core.c:441:28: error: invalid use of undefined type 'struct crash_mem'
     441 |                         mem->ranges[i].start = 0;
         |                            ^~
   kernel/crash_core.c:442:28: error: invalid use of undefined type 'struct crash_mem'
     442 |                         mem->ranges[i].end = 0;
         |                            ^~
   kernel/crash_core.c:443:36: error: invalid use of undefined type 'struct crash_mem'
     443 |                         if (i < mem->nr_ranges - 1) {
         |                                    ^~
   kernel/crash_core.c:445:52: error: invalid use of undefined type 'struct crash_mem'
     445 |                                 for (j = i; j < mem->nr_ranges - 1; j++) {
         |                                                    ^~
   kernel/crash_core.c:446:44: error: invalid use of undefined type 'struct crash_mem'
     446 |                                         mem->ranges[j].start =
         |                                            ^~
   kernel/crash_core.c:447:52: error: invalid use of undefined type 'struct crash_mem'
     447 |                                                 mem->ranges[j+1].start;
         |                                                    ^~
   kernel/crash_core.c:448:44: error: invalid use of undefined type 'struct crash_mem'
     448 |                                         mem->ranges[j].end =
         |                                            ^~
   kernel/crash_core.c:449:60: error: invalid use of undefined type 'struct crash_mem'
     449 |                                                         mem->ranges[j+1].end;
         |                                                            ^~
   kernel/crash_core.c:458:36: error: invalid use of undefined type 'struct crash_mem'
     458 |                                 mem->nr_ranges--;
         |                                    ^~
   kernel/crash_core.c:461:28: error: invalid use of undefined type 'struct crash_mem'
     461 |                         mem->nr_ranges--;
         |                            ^~
   kernel/crash_core.c:467:28: error: invalid use of undefined type 'struct crash_mem'
     467 |                         mem->ranges[i].end = p_start - 1;
         |                            ^~
   kernel/crash_core.c:471:28: error: invalid use of undefined type 'struct crash_mem'
     471 |                         mem->ranges[i].end = p_start - 1;
         |                            ^~
   kernel/crash_core.c:473:28: error: invalid use of undefined type 'struct crash_mem'
     473 |                         mem->ranges[i].start = p_end + 1;
         |                            ^~
   kernel/crash_core.c:482:21: error: invalid use of undefined type 'struct crash_mem'
     482 |         if (i == mem->max_nr_ranges - 1)
         |                     ^~
   kernel/crash_core.c:487:20: error: invalid use of undefined type 'struct crash_mem'
     487 |         if (j < mem->nr_ranges) {
         |                    ^~
   kernel/crash_core.c:489:29: error: invalid use of undefined type 'struct crash_mem'
     489 |                 for (i = mem->nr_ranges - 1; i >= j; i--)
         |                             ^~
   kernel/crash_core.c:490:28: error: invalid use of undefined type 'struct crash_mem'
     490 |                         mem->ranges[i + 1] = mem->ranges[i];
         |                            ^~
   kernel/crash_core.c:490:49: error: invalid use of undefined type 'struct crash_mem'
     490 |                         mem->ranges[i + 1] = mem->ranges[i];
         |                                                 ^~
   kernel/crash_core.c:493:12: error: invalid use of undefined type 'struct crash_mem'
     493 |         mem->ranges[j].start = temp_range.start;
         |            ^~
   kernel/crash_core.c:494:12: error: invalid use of undefined type 'struct crash_mem'
     494 |         mem->ranges[j].end = temp_range.end;
         |            ^~
   kernel/crash_core.c:495:12: error: invalid use of undefined type 'struct crash_mem'
     495 |         mem->nr_ranges++;
         |            ^~


vim +331 kernel/crash_core.c

   317	
 > 318	int crash_prepare_elf64_headers(struct crash_mem *mem, int need_kernel_map,
   319				  void **addr, unsigned long *sz)
   320	{
   321		Elf64_Ehdr *ehdr;
   322		Elf64_Phdr *phdr;
   323		unsigned long nr_cpus = num_possible_cpus(), nr_phdr, elf_sz;
   324		unsigned char *buf;
   325		unsigned int cpu, i;
   326		unsigned long long notes_addr;
   327		unsigned long mstart, mend;
   328	
   329		/* extra phdr for vmcoreinfo ELF note */
   330		nr_phdr = nr_cpus + 1;
 > 331		nr_phdr += mem->nr_ranges;
   332	
   333		/*
   334		 * kexec-tools creates an extra PT_LOAD phdr for kernel text mapping
   335		 * area (for example, ffffffff80000000 - ffffffffa0000000 on x86_64).
   336		 * I think this is required by tools like gdb. So same physical
   337		 * memory will be mapped in two ELF headers. One will contain kernel
   338		 * text virtual addresses and other will have __va(physical) addresses.
   339		 */
   340	
   341		nr_phdr++;
   342		elf_sz = sizeof(Elf64_Ehdr) + nr_phdr * sizeof(Elf64_Phdr);
 > 343		elf_sz = ALIGN(elf_sz, ELF_CORE_HEADER_ALIGN);
   344	
   345		buf = vzalloc(elf_sz);
   346		if (!buf)
   347			return -ENOMEM;
   348	
   349		ehdr = (Elf64_Ehdr *)buf;
   350		phdr = (Elf64_Phdr *)(ehdr + 1);
   351		memcpy(ehdr->e_ident, ELFMAG, SELFMAG);
   352		ehdr->e_ident[EI_CLASS] = ELFCLASS64;
   353		ehdr->e_ident[EI_DATA] = ELFDATA2LSB;
   354		ehdr->e_ident[EI_VERSION] = EV_CURRENT;
   355		ehdr->e_ident[EI_OSABI] = ELF_OSABI;
   356		memset(ehdr->e_ident + EI_PAD, 0, EI_NIDENT - EI_PAD);
   357		ehdr->e_type = ET_CORE;
   358		ehdr->e_machine = ELF_ARCH;
   359		ehdr->e_version = EV_CURRENT;
   360		ehdr->e_phoff = sizeof(Elf64_Ehdr);
   361		ehdr->e_ehsize = sizeof(Elf64_Ehdr);
   362		ehdr->e_phentsize = sizeof(Elf64_Phdr);
   363	
   364		/* Prepare one phdr of type PT_NOTE for each present CPU */
   365		for_each_present_cpu(cpu) {
   366			phdr->p_type = PT_NOTE;
   367			notes_addr = per_cpu_ptr_to_phys(per_cpu_ptr(crash_notes, cpu));
   368			phdr->p_offset = phdr->p_paddr = notes_addr;
   369			phdr->p_filesz = phdr->p_memsz = sizeof(note_buf_t);
   370			(ehdr->e_phnum)++;
   371			phdr++;
   372		}
   373	
   374		/* Prepare one PT_NOTE header for vmcoreinfo */
   375		phdr->p_type = PT_NOTE;
   376		phdr->p_offset = phdr->p_paddr = paddr_vmcoreinfo_note();
   377		phdr->p_filesz = phdr->p_memsz = VMCOREINFO_NOTE_SIZE;
   378		(ehdr->e_phnum)++;
   379		phdr++;
   380	
   381		/* Prepare PT_LOAD type program header for kernel text region */
   382		if (need_kernel_map) {
   383			phdr->p_type = PT_LOAD;
   384			phdr->p_flags = PF_R|PF_W|PF_X;
   385			phdr->p_vaddr = (unsigned long) _text;
   386			phdr->p_filesz = phdr->p_memsz = _end - _text;
   387			phdr->p_offset = phdr->p_paddr = __pa_symbol(_text);
   388			ehdr->e_phnum++;
   389			phdr++;
   390		}
   391	
   392		/* Go through all the ranges in mem->ranges[] and prepare phdr */
   393		for (i = 0; i < mem->nr_ranges; i++) {
   394			mstart = mem->ranges[i].start;
 > 395			mend = mem->ranges[i].end;
   396	
   397			phdr->p_type = PT_LOAD;
   398			phdr->p_flags = PF_R|PF_W|PF_X;
   399			phdr->p_offset  = mstart;
   400	
   401			phdr->p_paddr = mstart;
   402			phdr->p_vaddr = (unsigned long) __va(mstart);
   403			phdr->p_filesz = phdr->p_memsz = mend - mstart + 1;
   404			phdr->p_align = 0;
   405			ehdr->e_phnum++;
   406			pr_debug("Crash PT_LOAD ELF header. phdr=%p vaddr=0x%llx, paddr=0x%llx, sz=0x%llx e_phnum=%d p_offset=0x%llx\n",
   407				phdr, phdr->p_vaddr, phdr->p_paddr, phdr->p_filesz,
   408				ehdr->e_phnum, phdr->p_offset);
   409			phdr++;
   410		}
   411	
   412		*addr = buf;
   413		*sz = elf_sz;
   414		return 0;
   415	}
   416	
 > 417	int crash_exclude_mem_range(struct crash_mem *mem,
   418				    unsigned long long mstart, unsigned long long mend)
   419	{
   420		int i, j;
   421		unsigned long long start, end, p_start, p_end;
   422		struct range temp_range = {0, 0};
   423	
   424		for (i = 0; i < mem->nr_ranges; i++) {
   425			start = mem->ranges[i].start;
   426			end = mem->ranges[i].end;
   427			p_start = mstart;
   428			p_end = mend;
   429	
   430			if (mstart > end || mend < start)
   431				continue;
   432	
   433			/* Truncate any area outside of range */
   434			if (mstart < start)
   435				p_start = start;
   436			if (mend > end)
   437				p_end = end;
   438	
   439			/* Found completely overlapping range */
   440			if (p_start == start && p_end == end) {
   441				mem->ranges[i].start = 0;
   442				mem->ranges[i].end = 0;
   443				if (i < mem->nr_ranges - 1) {
   444					/* Shift rest of the ranges to left */
   445					for (j = i; j < mem->nr_ranges - 1; j++) {
   446						mem->ranges[j].start =
   447							mem->ranges[j+1].start;
   448						mem->ranges[j].end =
   449								mem->ranges[j+1].end;
   450					}
   451	
   452					/*
   453					 * Continue to check if there are another overlapping ranges
   454					 * from the current position because of shifting the above
   455					 * mem ranges.
   456					 */
   457					i--;
   458					mem->nr_ranges--;
   459					continue;
   460				}
   461				mem->nr_ranges--;
   462				return 0;
   463			}
   464	
   465			if (p_start > start && p_end < end) {
   466				/* Split original range */
   467				mem->ranges[i].end = p_start - 1;
   468				temp_range.start = p_end + 1;
   469				temp_range.end = end;
   470			} else if (p_start != start)
   471				mem->ranges[i].end = p_start - 1;
   472			else
   473				mem->ranges[i].start = p_end + 1;
   474			break;
   475		}
   476	
   477		/* If a split happened, add the split to array */
   478		if (!temp_range.end)
   479			return 0;
   480	
   481		/* Split happened */
   482		if (i == mem->max_nr_ranges - 1)
   483			return -ENOMEM;
   484	
   485		/* Location where new range should go */
   486		j = i + 1;
   487		if (j < mem->nr_ranges) {
   488			/* Move over all ranges one slot towards the end */
   489			for (i = mem->nr_ranges - 1; i >= j; i--)
   490				mem->ranges[i + 1] = mem->ranges[i];
   491		}
   492	
   493		mem->ranges[j].start = temp_range.start;
   494		mem->ranges[j].end = temp_range.end;
   495		mem->nr_ranges++;
   496		return 0;
   497	}
   498	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
