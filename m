Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D72C1514CE
	for <oe-kbuild-all@lists.linux.dev>; Sat, 12 Oct 2024 09:53:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728726786; cv=none; b=gFLallJv+XDCqNWDzk/ZX9I07nvZdzazkb3XnxEvtXKzTFWiw5A0fReWBzwXjfdEX+8DgC20Dx55FDPU+YsqA69Qc8O9opKF9HtIzQTaRIB4omqCVQPDI2N3w0b2ElGUGr6EaeLvICyYlaThw4i9zHn+0BdEbS4pzkL2qNDwC2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728726786; c=relaxed/simple;
	bh=UWQyxGmNOutkAPkxdve9al4GbOEWLoGm0+NkPfQUrJI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uilgRWyL7n7gDn/9UEw1HpTr71fe06TYcTHn3hYQFnFwVSIOBsbOfpBU33l+lfYstpSMT9U0uqioJ54C7wvxkeTxyo781+qMztoz+pdegptomJuoODspGPgzGkb4oW+dMv7mPnbPW3hI9UbLVHXxh4Ah3EQnudlL8s5gLhtFx/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UKG0KCW5; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UKG0KCW5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728726784; x=1760262784;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=UWQyxGmNOutkAPkxdve9al4GbOEWLoGm0+NkPfQUrJI=;
  b=UKG0KCW59idiE25fMbM/smtPLsOWehIEyk1+J/ccS009tJDVWgCk2hlN
   xfDWllKKu1+WFdcygQoUI52kmuwKKERZhhGcANm19xa6qEGMOtjXv59kf
   fUb7ETspAIT2Pk1PcPganl1k7A5q+quklvbWB10lATTxoPEs4lFXCuH3q
   gZwEqBmkvf55jwZHiL9siMMHEszbQwN4lqSb4LneckcxaSxKoU4CAXd82
   0NZS/I0VfMIM6fTLnYvmv/GhyqRo/AkZWY8FHboY2ZrEJzhAaXTICq3Ub
   QYR9kFzmNuD9IRpPBQcHWYAWu4oxSYQpz13RnR7ruMfWZvrHqSb5uQOgz
   w==;
X-CSE-ConnectionGUID: iXIll81cT0CcZxaPFFh/oQ==
X-CSE-MsgGUID: 65rpLvvjTSC1smvuDBKvqA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="39249821"
X-IronPort-AV: E=Sophos;i="6.11,198,1725346800"; 
   d="scan'208";a="39249821"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2024 02:53:00 -0700
X-CSE-ConnectionGUID: lqUPXNaGQimAVbcFnzNPtg==
X-CSE-MsgGUID: B1CG9o/ITFmjQ+mxHxyHhA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,198,1725346800"; 
   d="scan'208";a="77133635"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 12 Oct 2024 02:52:59 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1szYnx-000DG5-1W;
	Sat, 12 Oct 2024 09:52:57 +0000
Date: Sat, 12 Oct 2024 17:52:21 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [thomas-weissschuh:vdso/store 37/75] arch/mips/kernel/vdso.c:146:28:
 warning: variable 'vma' is uninitialized when used here
Message-ID: <202410121758.KjlFQwXW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/linux.git vdso/store
head:   79c4677efae9ab2e20e0ff126c6528160f57b5eb
commit: 8830bfb25c08b3c2c5944cda1c9e2990d094e8f7 [37/75] MIPS: vdso: Switch to generic storage implementation
config: mips-randconfig-r072-20241012 (https://download.01.org/0day-ci/archive/20241012/202410121758.KjlFQwXW-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 70e0a7e7e6a8541bcc46908c592eed561850e416)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241012/202410121758.KjlFQwXW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410121758.KjlFQwXW-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/mips/kernel/vdso.c:13:
   In file included from include/linux/mm.h:2213:
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> arch/mips/kernel/vdso.c:146:28: warning: variable 'vma' is uninitialized when used here [-Wuninitialized]
     146 |                 ret = io_remap_pfn_range(vma, base, gic_pfn, gic_size,
         |                                          ^~~
   arch/mips/kernel/vdso.c:80:28: note: initialize the variable 'vma' to silence this warning
      80 |         struct vm_area_struct *vma;
         |                                   ^
         |                                    = NULL
   warning: MIPS-I support is experimental
   In file included from arch/mips/kernel/vdso.c:7:
   In file included from include/linux/binfmts.h:5:
   In file included from include/linux/sched.h:12:
   In file included from ./arch/mips/include/generated/asm/current.h:1:
   In file included from include/asm-generic/current.h:6:
   In file included from include/linux/thread_info.h:13:
   In file included from include/linux/bug.h:5:
   arch/mips/include/asm/bug.h:30:23: error: instruction requires a CPU feature not currently enabled
      30 |         __asm__ __volatile__("tne $0, %0, %1"
         |                              ^
   <inline asm>:1:2: note: instantiated into assembly here
       1 |         tne $0, $3, 12
         |         ^
   In file included from arch/mips/kernel/vdso.c:7:
   In file included from include/linux/binfmts.h:5:
   In file included from include/linux/sched.h:12:
   In file included from ./arch/mips/include/generated/asm/current.h:1:
   In file included from include/asm-generic/current.h:6:
   In file included from include/linux/thread_info.h:13:
   In file included from include/linux/bug.h:5:
   arch/mips/include/asm/bug.h:30:23: error: instruction requires a CPU feature not currently enabled
      30 |         __asm__ __volatile__("tne $0, %0, %1"
         |                              ^
   <inline asm>:1:2: note: instantiated into assembly here
       1 |         tne $0, $3, 12
         |         ^
   2 warnings and 2 errors generated.


vim +/vma +146 arch/mips/kernel/vdso.c

ea7e0480a4b695 Paul Burton       2018-09-25   74  
c52d0d30aef84a David Daney       2010-02-18   75  int arch_setup_additional_pages(struct linux_binprm *bprm, int uses_interp)
c52d0d30aef84a David Daney       2010-02-18   76  {
ebb5e78cc63417 Alex Smith        2015-10-21   77  	struct mips_vdso_image *image = current->thread.abi->vdso;
c52d0d30aef84a David Daney       2010-02-18   78  	struct mm_struct *mm = current->mm;
dfad83cb7193ef Florian Fainelli  2021-03-30   79  	unsigned long gic_size, vvar_size, size, base, data_addr, vdso_addr, gic_pfn, gic_base;
ebb5e78cc63417 Alex Smith        2015-10-21   80  	struct vm_area_struct *vma;
ebb5e78cc63417 Alex Smith        2015-10-21   81  	int ret;
c52d0d30aef84a David Daney       2010-02-18   82  
d8ed45c5dcd455 Michel Lespinasse 2020-06-08   83  	if (mmap_write_lock_killable(mm))
69048176078add Michal Hocko      2016-05-23   84  		return -EINTR;
c52d0d30aef84a David Daney       2010-02-18   85  
aebdc6ff3b2e79 Yousong Zhou      2020-03-24   86  	if (IS_ENABLED(CONFIG_MIPS_FP_SUPPORT)) {
432c6bacbd0c16 Paul Burton       2016-07-08   87  		/* Map delay slot emulation page */
432c6bacbd0c16 Paul Burton       2016-07-08   88  		base = mmap_region(NULL, STACK_TOP, PAGE_SIZE,
adcc81f148d733 Paul Burton       2018-12-20   89  				VM_READ | VM_EXEC |
432c6bacbd0c16 Paul Burton       2016-07-08   90  				VM_MAYREAD | VM_MAYWRITE | VM_MAYEXEC,
897ab3e0c49e24 Mike Rapoport     2017-02-24   91  				0, NULL);
432c6bacbd0c16 Paul Burton       2016-07-08   92  		if (IS_ERR_VALUE(base)) {
432c6bacbd0c16 Paul Burton       2016-07-08   93  			ret = base;
432c6bacbd0c16 Paul Burton       2016-07-08   94  			goto out;
432c6bacbd0c16 Paul Burton       2016-07-08   95  		}
aebdc6ff3b2e79 Yousong Zhou      2020-03-24   96  	}
432c6bacbd0c16 Paul Burton       2016-07-08   97  
a7f4df4e21dd8a Alex Smith        2015-10-21   98  	/*
a7f4df4e21dd8a Alex Smith        2015-10-21   99  	 * Determine total area size. This includes the VDSO data itself, the
a7f4df4e21dd8a Alex Smith        2015-10-21  100  	 * data page, and the GIC user page if present. Always create a mapping
a7f4df4e21dd8a Alex Smith        2015-10-21  101  	 * for the GIC user area if the GIC is present regardless of whether it
a7f4df4e21dd8a Alex Smith        2015-10-21  102  	 * is the current clocksource, in case it comes into use later on. We
a7f4df4e21dd8a Alex Smith        2015-10-21  103  	 * only map a page even though the total area is 64K, as we only need
a7f4df4e21dd8a Alex Smith        2015-10-21  104  	 * the counter registers at the start.
a7f4df4e21dd8a Alex Smith        2015-10-21  105  	 */
00578cd864d45a Paul Burton       2017-08-12  106  	gic_size = mips_gic_present() ? PAGE_SIZE : 0;
8830bfb25c08b3 Thomas Weiﬂschuh  2024-09-13  107  	vvar_size = gic_size + VDSO_NR_PAGES * PAGE_SIZE;
a7f4df4e21dd8a Alex Smith        2015-10-21  108  	size = vvar_size + image->size;
a7f4df4e21dd8a Alex Smith        2015-10-21  109  
0f02cfbc3d9e41 Paul Burton       2018-08-30  110  	/*
0f02cfbc3d9e41 Paul Burton       2018-08-30  111  	 * Find a region that's large enough for us to perform the
0f02cfbc3d9e41 Paul Burton       2018-08-30  112  	 * colour-matching alignment below.
0f02cfbc3d9e41 Paul Burton       2018-08-30  113  	 */
0f02cfbc3d9e41 Paul Burton       2018-08-30  114  	if (cpu_has_dc_aliases)
0f02cfbc3d9e41 Paul Burton       2018-08-30  115  		size += shm_align_mask + 1;
0f02cfbc3d9e41 Paul Burton       2018-08-30  116  
ea7e0480a4b695 Paul Burton       2018-09-25  117  	base = get_unmapped_area(NULL, vdso_base(), size, 0, 0);
ebb5e78cc63417 Alex Smith        2015-10-21  118  	if (IS_ERR_VALUE(base)) {
ebb5e78cc63417 Alex Smith        2015-10-21  119  		ret = base;
ebb5e78cc63417 Alex Smith        2015-10-21  120  		goto out;
ebb5e78cc63417 Alex Smith        2015-10-21  121  	}
ebb5e78cc63417 Alex Smith        2015-10-21  122  
0f02cfbc3d9e41 Paul Burton       2018-08-30  123  	/*
0f02cfbc3d9e41 Paul Burton       2018-08-30  124  	 * If we suffer from dcache aliasing, ensure that the VDSO data page
0f02cfbc3d9e41 Paul Burton       2018-08-30  125  	 * mapping is coloured the same as the kernel's mapping of that memory.
0f02cfbc3d9e41 Paul Burton       2018-08-30  126  	 * This ensures that when the kernel updates the VDSO data userland
0f02cfbc3d9e41 Paul Burton       2018-08-30  127  	 * will observe it without requiring cache invalidations.
0f02cfbc3d9e41 Paul Burton       2018-08-30  128  	 */
0f02cfbc3d9e41 Paul Burton       2018-08-30  129  	if (cpu_has_dc_aliases) {
0f02cfbc3d9e41 Paul Burton       2018-08-30  130  		base = __ALIGN_MASK(base, shm_align_mask);
24640f233b4660 Vincenzo Frascino 2019-06-21  131  		base += ((unsigned long)vdso_data - gic_size) & shm_align_mask;
0f02cfbc3d9e41 Paul Burton       2018-08-30  132  	}
0f02cfbc3d9e41 Paul Burton       2018-08-30  133  
a7f4df4e21dd8a Alex Smith        2015-10-21  134  	data_addr = base + gic_size;
8830bfb25c08b3 Thomas Weiﬂschuh  2024-09-13  135  	vdso_addr = data_addr + VDSO_NR_PAGES * PAGE_SIZE;
c52d0d30aef84a David Daney       2010-02-18  136  
8830bfb25c08b3 Thomas Weiﬂschuh  2024-09-13  137  	ret = vdso_install_vvar_mapping(mm, base);
8830bfb25c08b3 Thomas Weiﬂschuh  2024-09-13  138  	if (ret)
ebb5e78cc63417 Alex Smith        2015-10-21  139  		goto out;
c52d0d30aef84a David Daney       2010-02-18  140  
a7f4df4e21dd8a Alex Smith        2015-10-21  141  	/* Map GIC user page. */
a7f4df4e21dd8a Alex Smith        2015-10-21  142  	if (gic_size) {
dfad83cb7193ef Florian Fainelli  2021-03-30  143  		gic_base = (unsigned long)mips_gic_base + MIPS_GIC_USER_OFS;
8baa65126e19af Florian Fainelli  2022-07-07  144  		gic_pfn = PFN_DOWN(__pa(gic_base));
a7f4df4e21dd8a Alex Smith        2015-10-21  145  
00578cd864d45a Paul Burton       2017-08-12 @146  		ret = io_remap_pfn_range(vma, base, gic_pfn, gic_size,

:::::: The code at line 146 was first introduced by commit
:::::: 00578cd864d45ae4b8fa3f684f8d6f783dd8d15d MIPS: VDSO: Drop gic_get_usm_range() usage

:::::: TO: Paul Burton <paul.burton@imgtec.com>
:::::: CC: Ralf Baechle <ralf@linux-mips.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
