Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A8101DDC22
	for <oe-kbuild-all@lists.linux.dev>; Mon,  6 Jan 2025 12:25:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736166353; cv=none; b=iE+Y+J6vzq7yK/d9ekislKUIGUhCn8I2hphvqyzL099lS1W+qUaw0PX2DV8DUoXsQXVRjkcMmDGqsU1Zp6YzQz+IAacG79N5Np0tumrcXx4iIN9xzAI65myM0DYGwZs+8w1Fl9Lr0g+/VKDELBgCN5u5OJh/ZfRUxGAzvt/mFVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736166353; c=relaxed/simple;
	bh=fVkaLjzi8hevhuUnbv+shpLDGjH7gmc+cZd7dVB3dbM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lbERCGTqd0yHoQkVCuYdAcdkvbKaeaD32FP7E9tVzo35CyGpiuiy1aVDi5wr9HXj1h05AnAnD2pC9kw86SFOww44xiaMY1X/a1Zh4fGwfDSS2afu1eJXwIl2rGOng+9GfCUKx88mdjjmuFvAhTUiTO1HDt+qWhRLVZLCKWD8LKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=D6KU2BXJ; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="D6KU2BXJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736166350; x=1767702350;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fVkaLjzi8hevhuUnbv+shpLDGjH7gmc+cZd7dVB3dbM=;
  b=D6KU2BXJbis5RGYf1mLPs1sA9+veKL8icBA8YSqzU165D5MHnEZ0pL6E
   SNTJdEu3MuV7MOo2J4muW4ZknuYaxqGjVjH8tDYEXLpZVevBEGpl9OFMo
   OUKf1LgV1DTLeesoAvqtl83FqVsJKrO33v+9G+VyjxU8j31YE+KMhUxHt
   NPAbYdNqZQHPQF95Vf59BvF29nxO2/d6KE2vmtzmatNOV/3aMqcI2o2Uz
   Tk9Jaiog+JPoVPRvzW/QGBdjdePKPOVbiUXPR5Wra+GaRxP7bLR5qPNmv
   wZLOUuAsD/nMo6mNiGPcSksY7RV9PmkI2yZQx+DLDVT4CiAb0Ii/LYcBh
   Q==;
X-CSE-ConnectionGUID: HnCYQDBWS4SfWd35paHKbQ==
X-CSE-MsgGUID: /Baa4HWOT4W//0aPWD/XDA==
X-IronPort-AV: E=McAfee;i="6700,10204,11307"; a="53730142"
X-IronPort-AV: E=Sophos;i="6.12,292,1728975600"; 
   d="scan'208";a="53730142"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jan 2025 04:25:49 -0800
X-CSE-ConnectionGUID: dRP3L2JlRmmHcEQ8qVOGDQ==
X-CSE-MsgGUID: Dtr4mmsgQwGS+E/S4Heeqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,292,1728975600"; 
   d="scan'208";a="107395047"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 06 Jan 2025 04:25:48 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tUmAz-000CZj-1O;
	Mon, 06 Jan 2025 12:25:45 +0000
Date: Mon, 6 Jan 2025 20:25:29 +0800
From: kernel test robot <lkp@intel.com>
To: Greg Ungerer <gerg@linux-m68k.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: fs/binfmt_elf_fdpic.c:1027:52: warning: variable 'excess1' set but
 not used
Message-ID: <202501062041.MriUcpLC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Greg,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   9d89551994a430b50c4fffcb1e617a057fa76e20
commit: 782f4c5c44e7d99d89740e272dc5ff84052c036a m68knommu: allow elf_fdpic loader to be selected
date:   2 years, 8 months ago
config: m68k-randconfig-m031-20230726 (https://download.01.org/0day-ci/archive/20250106/202501062041.MriUcpLC-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250106/202501062041.MriUcpLC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501062041.MriUcpLC-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/binfmt_elf_fdpic.c: In function 'elf_fdpic_map_file':
   fs/binfmt_elf_fdpic.c:748:23: warning: variable 'load_addr' set but not used [-Wunused-but-set-variable]
     748 |         unsigned long load_addr, stop;
         |                       ^~~~~~~~~
   fs/binfmt_elf_fdpic.c: In function 'elf_fdpic_map_file_by_direct_mmap':
>> fs/binfmt_elf_fdpic.c:1027:52: warning: variable 'excess1' set but not used [-Wunused-but-set-variable]
    1027 |                 unsigned long maddr, disp, excess, excess1;
         |                                                    ^~~~~~~


vim +/excess1 +1027 fs/binfmt_elf_fdpic.c

^1da177e4c3f41 Linus Torvalds    2005-04-16  1004  
^1da177e4c3f41 Linus Torvalds    2005-04-16  1005  /*****************************************************************************/
^1da177e4c3f41 Linus Torvalds    2005-04-16  1006  /*
^1da177e4c3f41 Linus Torvalds    2005-04-16  1007   * map a binary by direct mmap() of the individual PT_LOAD segments
^1da177e4c3f41 Linus Torvalds    2005-04-16  1008   */
^1da177e4c3f41 Linus Torvalds    2005-04-16  1009  static int elf_fdpic_map_file_by_direct_mmap(struct elf_fdpic_params *params,
^1da177e4c3f41 Linus Torvalds    2005-04-16  1010  					     struct file *file,
^1da177e4c3f41 Linus Torvalds    2005-04-16  1011  					     struct mm_struct *mm)
^1da177e4c3f41 Linus Torvalds    2005-04-16  1012  {
^1da177e4c3f41 Linus Torvalds    2005-04-16  1013  	struct elf32_fdpic_loadseg *seg;
^1da177e4c3f41 Linus Torvalds    2005-04-16  1014  	struct elf32_phdr *phdr;
^1da177e4c3f41 Linus Torvalds    2005-04-16  1015  	unsigned long load_addr, delta_vaddr;
e30c7c3b306312 Takuya Yoshikawa  2010-06-01  1016  	int loop, dvset;
^1da177e4c3f41 Linus Torvalds    2005-04-16  1017  
^1da177e4c3f41 Linus Torvalds    2005-04-16  1018  	load_addr = params->load_addr;
^1da177e4c3f41 Linus Torvalds    2005-04-16  1019  	delta_vaddr = 0;
^1da177e4c3f41 Linus Torvalds    2005-04-16  1020  	dvset = 0;
^1da177e4c3f41 Linus Torvalds    2005-04-16  1021  
^1da177e4c3f41 Linus Torvalds    2005-04-16  1022  	seg = params->loadmap->segs;
^1da177e4c3f41 Linus Torvalds    2005-04-16  1023  
^1da177e4c3f41 Linus Torvalds    2005-04-16  1024  	/* deal with each load segment separately */
^1da177e4c3f41 Linus Torvalds    2005-04-16  1025  	phdr = params->phdrs;
^1da177e4c3f41 Linus Torvalds    2005-04-16  1026  	for (loop = 0; loop < params->hdr.e_phnum; loop++, phdr++) {
^1da177e4c3f41 Linus Torvalds    2005-04-16 @1027  		unsigned long maddr, disp, excess, excess1;
^1da177e4c3f41 Linus Torvalds    2005-04-16  1028  		int prot = 0, flags;
^1da177e4c3f41 Linus Torvalds    2005-04-16  1029  
^1da177e4c3f41 Linus Torvalds    2005-04-16  1030  		if (phdr->p_type != PT_LOAD)
^1da177e4c3f41 Linus Torvalds    2005-04-16  1031  			continue;
^1da177e4c3f41 Linus Torvalds    2005-04-16  1032  
^1da177e4c3f41 Linus Torvalds    2005-04-16  1033  		kdebug("[LOAD] va=%lx of=%lx fs=%lx ms=%lx",
^1da177e4c3f41 Linus Torvalds    2005-04-16  1034  		       (unsigned long) phdr->p_vaddr,
^1da177e4c3f41 Linus Torvalds    2005-04-16  1035  		       (unsigned long) phdr->p_offset,
^1da177e4c3f41 Linus Torvalds    2005-04-16  1036  		       (unsigned long) phdr->p_filesz,
^1da177e4c3f41 Linus Torvalds    2005-04-16  1037  		       (unsigned long) phdr->p_memsz);
^1da177e4c3f41 Linus Torvalds    2005-04-16  1038  
^1da177e4c3f41 Linus Torvalds    2005-04-16  1039  		/* determine the mapping parameters */
^1da177e4c3f41 Linus Torvalds    2005-04-16  1040  		if (phdr->p_flags & PF_R) prot |= PROT_READ;
^1da177e4c3f41 Linus Torvalds    2005-04-16  1041  		if (phdr->p_flags & PF_W) prot |= PROT_WRITE;
^1da177e4c3f41 Linus Torvalds    2005-04-16  1042  		if (phdr->p_flags & PF_X) prot |= PROT_EXEC;
^1da177e4c3f41 Linus Torvalds    2005-04-16  1043  
4589ff7ca81516 David Hildenbrand 2021-04-23  1044  		flags = MAP_PRIVATE;
^1da177e4c3f41 Linus Torvalds    2005-04-16  1045  		maddr = 0;
^1da177e4c3f41 Linus Torvalds    2005-04-16  1046  
^1da177e4c3f41 Linus Torvalds    2005-04-16  1047  		switch (params->flags & ELF_FDPIC_FLAG_ARRANGEMENT) {
^1da177e4c3f41 Linus Torvalds    2005-04-16  1048  		case ELF_FDPIC_FLAG_INDEPENDENT:
^1da177e4c3f41 Linus Torvalds    2005-04-16  1049  			/* PT_LOADs are independently locatable */
^1da177e4c3f41 Linus Torvalds    2005-04-16  1050  			break;
^1da177e4c3f41 Linus Torvalds    2005-04-16  1051  
^1da177e4c3f41 Linus Torvalds    2005-04-16  1052  		case ELF_FDPIC_FLAG_HONOURVADDR:
^1da177e4c3f41 Linus Torvalds    2005-04-16  1053  			/* the specified virtual address must be honoured */
^1da177e4c3f41 Linus Torvalds    2005-04-16  1054  			maddr = phdr->p_vaddr;
^1da177e4c3f41 Linus Torvalds    2005-04-16  1055  			flags |= MAP_FIXED;
^1da177e4c3f41 Linus Torvalds    2005-04-16  1056  			break;
^1da177e4c3f41 Linus Torvalds    2005-04-16  1057  
^1da177e4c3f41 Linus Torvalds    2005-04-16  1058  		case ELF_FDPIC_FLAG_CONSTDISP:
^1da177e4c3f41 Linus Torvalds    2005-04-16  1059  			/* constant displacement
8a2ab7f5df76b9 David Howells     2006-07-10  1060  			 * - can be mapped anywhere, but must be mapped as a
8a2ab7f5df76b9 David Howells     2006-07-10  1061  			 *   unit
^1da177e4c3f41 Linus Torvalds    2005-04-16  1062  			 */
^1da177e4c3f41 Linus Torvalds    2005-04-16  1063  			if (!dvset) {
^1da177e4c3f41 Linus Torvalds    2005-04-16  1064  				maddr = load_addr;
^1da177e4c3f41 Linus Torvalds    2005-04-16  1065  				delta_vaddr = phdr->p_vaddr;
^1da177e4c3f41 Linus Torvalds    2005-04-16  1066  				dvset = 1;
8a2ab7f5df76b9 David Howells     2006-07-10  1067  			} else {
^1da177e4c3f41 Linus Torvalds    2005-04-16  1068  				maddr = load_addr + phdr->p_vaddr - delta_vaddr;
^1da177e4c3f41 Linus Torvalds    2005-04-16  1069  				flags |= MAP_FIXED;
^1da177e4c3f41 Linus Torvalds    2005-04-16  1070  			}
^1da177e4c3f41 Linus Torvalds    2005-04-16  1071  			break;
^1da177e4c3f41 Linus Torvalds    2005-04-16  1072  
^1da177e4c3f41 Linus Torvalds    2005-04-16  1073  		case ELF_FDPIC_FLAG_CONTIGUOUS:
^1da177e4c3f41 Linus Torvalds    2005-04-16  1074  			/* contiguity handled later */
^1da177e4c3f41 Linus Torvalds    2005-04-16  1075  			break;
^1da177e4c3f41 Linus Torvalds    2005-04-16  1076  
^1da177e4c3f41 Linus Torvalds    2005-04-16  1077  		default:
^1da177e4c3f41 Linus Torvalds    2005-04-16  1078  			BUG();
^1da177e4c3f41 Linus Torvalds    2005-04-16  1079  		}
^1da177e4c3f41 Linus Torvalds    2005-04-16  1080  
^1da177e4c3f41 Linus Torvalds    2005-04-16  1081  		maddr &= PAGE_MASK;
^1da177e4c3f41 Linus Torvalds    2005-04-16  1082  
^1da177e4c3f41 Linus Torvalds    2005-04-16  1083  		/* create the mapping */
^1da177e4c3f41 Linus Torvalds    2005-04-16  1084  		disp = phdr->p_vaddr & ~PAGE_MASK;
6be5ceb02e98ea Linus Torvalds    2012-04-20  1085  		maddr = vm_mmap(file, maddr, phdr->p_memsz + disp, prot, flags,
^1da177e4c3f41 Linus Torvalds    2005-04-16  1086  				phdr->p_offset - disp);
^1da177e4c3f41 Linus Torvalds    2005-04-16  1087  
^1da177e4c3f41 Linus Torvalds    2005-04-16  1088  		kdebug("mmap[%d] <file> sz=%lx pr=%x fl=%x of=%lx --> %08lx",
8a2ab7f5df76b9 David Howells     2006-07-10  1089  		       loop, phdr->p_memsz + disp, prot, flags,
8a2ab7f5df76b9 David Howells     2006-07-10  1090  		       phdr->p_offset - disp, maddr);
^1da177e4c3f41 Linus Torvalds    2005-04-16  1091  
8a2ab7f5df76b9 David Howells     2006-07-10  1092  		if (IS_ERR_VALUE(maddr))
^1da177e4c3f41 Linus Torvalds    2005-04-16  1093  			return (int) maddr;
^1da177e4c3f41 Linus Torvalds    2005-04-16  1094  
8a2ab7f5df76b9 David Howells     2006-07-10  1095  		if ((params->flags & ELF_FDPIC_FLAG_ARRANGEMENT) ==
8a2ab7f5df76b9 David Howells     2006-07-10  1096  		    ELF_FDPIC_FLAG_CONTIGUOUS)
^1da177e4c3f41 Linus Torvalds    2005-04-16  1097  			load_addr += PAGE_ALIGN(phdr->p_memsz + disp);
^1da177e4c3f41 Linus Torvalds    2005-04-16  1098  
^1da177e4c3f41 Linus Torvalds    2005-04-16  1099  		seg->addr = maddr + disp;
^1da177e4c3f41 Linus Torvalds    2005-04-16  1100  		seg->p_vaddr = phdr->p_vaddr;
^1da177e4c3f41 Linus Torvalds    2005-04-16  1101  		seg->p_memsz = phdr->p_memsz;
^1da177e4c3f41 Linus Torvalds    2005-04-16  1102  
^1da177e4c3f41 Linus Torvalds    2005-04-16  1103  		/* map the ELF header address if in this segment */
^1da177e4c3f41 Linus Torvalds    2005-04-16  1104  		if (phdr->p_offset == 0)
^1da177e4c3f41 Linus Torvalds    2005-04-16  1105  			params->elfhdr_addr = seg->addr;
^1da177e4c3f41 Linus Torvalds    2005-04-16  1106  
8a2ab7f5df76b9 David Howells     2006-07-10  1107  		/* clear the bit between beginning of mapping and beginning of
8a2ab7f5df76b9 David Howells     2006-07-10  1108  		 * PT_LOAD */
^1da177e4c3f41 Linus Torvalds    2005-04-16  1109  		if (prot & PROT_WRITE && disp > 0) {
^1da177e4c3f41 Linus Torvalds    2005-04-16  1110  			kdebug("clear[%d] ad=%lx sz=%lx", loop, maddr, disp);
e30c7c3b306312 Takuya Yoshikawa  2010-06-01  1111  			if (clear_user((void __user *) maddr, disp))
e30c7c3b306312 Takuya Yoshikawa  2010-06-01  1112  				return -EFAULT;
^1da177e4c3f41 Linus Torvalds    2005-04-16  1113  			maddr += disp;
^1da177e4c3f41 Linus Torvalds    2005-04-16  1114  		}
^1da177e4c3f41 Linus Torvalds    2005-04-16  1115  
^1da177e4c3f41 Linus Torvalds    2005-04-16  1116  		/* clear any space allocated but not loaded
^1da177e4c3f41 Linus Torvalds    2005-04-16  1117  		 * - on uClinux we can just clear the lot
^1da177e4c3f41 Linus Torvalds    2005-04-16  1118  		 * - on MMU linux we'll get a SIGBUS beyond the last page
^1da177e4c3f41 Linus Torvalds    2005-04-16  1119  		 *   extant in the file
^1da177e4c3f41 Linus Torvalds    2005-04-16  1120  		 */
^1da177e4c3f41 Linus Torvalds    2005-04-16  1121  		excess = phdr->p_memsz - phdr->p_filesz;
^1da177e4c3f41 Linus Torvalds    2005-04-16  1122  		excess1 = PAGE_SIZE - ((maddr + phdr->p_filesz) & ~PAGE_MASK);
^1da177e4c3f41 Linus Torvalds    2005-04-16  1123  

:::::: The code at line 1027 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
