Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DD083630A5
	for <oe-kbuild-all@lists.linux.dev>; Tue, 31 Mar 2026 21:34:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774992891; cv=none; b=Lu6KKYmbACc/3+DpDFyLpCN4cFl5dMZjWH8M/64hIdeOJFcwz2VP9RMp/XeugSNHut4zSKw7me2/+qMjRNR2v3virZyuQaZFmOiVgKo3J9oJRuYq4Jyu3eRqQXYJxZDEKXV8Am48ELEvSwOPFhVJewIFUhQ3esZDKPSPDQtnauw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774992891; c=relaxed/simple;
	bh=aS6fIDR3F3CPWEQwF6maCQ6g1thMbIBFGXqRPCdP/mY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=bXc/GXvQafQ4MIrgeZQjIeZgkB76HTVWMCWa6tBTHpEtgWtjJjQCy6joOx9NBGLaeDfJrk/dUVG0AARN5lOAnlrX2JaaPql+b4n4mwZhaHHp+lesq8ihcs8EwxHcH6YQSIp8IlUlJJ1h6K9LS6hY6/XU+osKxy77m7aEaGXCUP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dayuz+Mo; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dayuz+Mo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774992888; x=1806528888;
  h=date:from:to:cc:subject:message-id;
  bh=aS6fIDR3F3CPWEQwF6maCQ6g1thMbIBFGXqRPCdP/mY=;
  b=dayuz+MoS/ILJMlGrw7z3JLMHtsZCfzTH4H7/MYIi+u/PF2G+D2tq3tP
   kUOQTcpRW36HlXha96ilW5zTXp2PCEC/Z/Y9mqwKxtrHduvEcFbFNRmqG
   fccMBgqmZJHBvHcQEk2Ee7AMuJF1MNJfX09/czvsp+NokCykVyF+5/WZe
   29oiUrDIsZPY8QdaKiygUsu5nGoA0q0AOCmd3j3Z2bz29AHPVdSVYruyh
   ibKDRHrq2Qej5wvmONpOhdM9mVhNgC9X7mIbrM7PKoqx80NFXalMujuVi
   qDnfL7kNoi7xG110vzqknSa1/HqcEOznW6YfxIO1n9VxcANmWVz66Z4br
   Q==;
X-CSE-ConnectionGUID: e85ebwLsQwGS6wfF5x213w==
X-CSE-MsgGUID: 4FnBll7+R0642gNBf6xcPQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11745"; a="75057553"
X-IronPort-AV: E=Sophos;i="6.23,152,1770624000"; 
   d="scan'208";a="75057553"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2026 14:34:47 -0700
X-CSE-ConnectionGUID: 3DuFTsa/Rr2N9KLJoE7D6g==
X-CSE-MsgGUID: /il+8i/sRPKOOuImJcfeZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,152,1770624000"; 
   d="scan'208";a="226353134"
Received: from lkp-server01.sh.intel.com (HELO 283bf2e1b94a) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 31 Mar 2026 14:34:47 -0700
Received: from kbuild by 283bf2e1b94a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w7gjT-000000004JD-2IH8;
	Tue, 31 Mar 2026 21:34:43 +0000
Date: Wed, 01 Apr 2026 05:34:09 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android-mainline-desktop 0/1]
 drivers/staging/android/ashmem-legacy.c:397:17: warning: variable 'inode' set
 but not used
Message-ID: <202604010546.99ysF4rU-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Isaac,

First bad commit (maybe != root cause):

tree:   https://android.googlesource.com/kernel/common android-mainline-desktop
head:   5a9c9e4d03fdceddbdb6e2cf9180ffc3f9c13dde
commit: 97f1681cbca0ccce07e5c9ef0b450ea340867291 [0/1] ANDROID: staging: ashmem: Cleanup kconfig options and rename source files
config: i386-buildonly-randconfig-006-20260401 (https://download.01.org/0day-ci/archive/20260401/202604010546.99ysF4rU-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260401/202604010546.99ysF4rU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604010546.99ysF4rU-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/staging/android/ashmem-legacy.c:397:17: warning: variable 'inode' set but not used [-Wunused-but-set-variable]
     397 |                 struct inode *inode;
         |                               ^
   1 warning generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for USB_PHY
   Depends on [n]: USB_SUPPORT [=n]
   Selected by [y]:
   - GKI_HIDDEN_USB_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_JACK_INPUT_DEV
   Depends on [n]: SOUND [=y] && SND [=n] && SND_JACK [=y]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_ELD
   Depends on [n]: SOUND [=y] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for BALLOON_COMPACTION
   Depends on [n]: COMPACTION [=n] && MEMORY_BALLOON [=y]
   Selected by [y]:
   - GKI_HIDDEN_MM_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_IEC958
   Depends on [n]: SOUND [=y] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_SOC_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for IOMMU_SVA
   Depends on [n]: IOMMU_SUPPORT [=n]
   Selected by [y]:
   - GKI_HIDDEN_IOMMU_CONFIGS [=y] && (ARM64 || X86 [=y])
   WARNING: unmet direct dependencies detected for SND_COMPRESS_ACCEL
   Depends on [n]: SOUND [=y] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_JACK
   Depends on [n]: SOUND [=y] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for P2SB
   Depends on [n]: PCI [=n] && X86 [=y]
   Selected by [y]:
   - GKI_HIDDEN_X86_CONFIGS [=y] && X86 [=y]
   WARNING: unmet direct dependencies detected for SND_VMASTER
   Depends on [n]: SOUND [=y] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for CAN_RX_OFFLOAD
   Depends on [n]: NETDEVICES [=y] && CAN_DEV [=n] && CAN_NETLINK [=n]
   Selected by [y]:
   - GKI_HIDDEN_MCP251XFD_CONFIGS [=y]


vim +/inode +397 drivers/staging/android/ashmem-legacy.c

4b3275bbb3dda00 drivers/staging/android/ashmem.c Isaac J. Manjarres 2026-03-26  365  
4b3275bbb3dda00 drivers/staging/android/ashmem.c Isaac J. Manjarres 2026-03-26  366  static int ashmem_mmap(struct file *file, struct vm_area_struct *vma)
4b3275bbb3dda00 drivers/staging/android/ashmem.c Isaac J. Manjarres 2026-03-26  367  {
4b3275bbb3dda00 drivers/staging/android/ashmem.c Isaac J. Manjarres 2026-03-26  368  	static struct file_operations vmfile_fops;
4b3275bbb3dda00 drivers/staging/android/ashmem.c Isaac J. Manjarres 2026-03-26  369  	struct ashmem_area *asma = file->private_data;
4b3275bbb3dda00 drivers/staging/android/ashmem.c Isaac J. Manjarres 2026-03-26  370  	int ret = 0;
4b3275bbb3dda00 drivers/staging/android/ashmem.c Isaac J. Manjarres 2026-03-26  371  
4b3275bbb3dda00 drivers/staging/android/ashmem.c Isaac J. Manjarres 2026-03-26  372  	mutex_lock(&ashmem_mutex);
4b3275bbb3dda00 drivers/staging/android/ashmem.c Isaac J. Manjarres 2026-03-26  373  
4b3275bbb3dda00 drivers/staging/android/ashmem.c Isaac J. Manjarres 2026-03-26  374  	/* user needs to SET_SIZE before mapping */
4b3275bbb3dda00 drivers/staging/android/ashmem.c Isaac J. Manjarres 2026-03-26  375  	if (!asma->size) {
4b3275bbb3dda00 drivers/staging/android/ashmem.c Isaac J. Manjarres 2026-03-26  376  		ret = -EINVAL;
4b3275bbb3dda00 drivers/staging/android/ashmem.c Isaac J. Manjarres 2026-03-26  377  		goto out;
4b3275bbb3dda00 drivers/staging/android/ashmem.c Isaac J. Manjarres 2026-03-26  378  	}
4b3275bbb3dda00 drivers/staging/android/ashmem.c Isaac J. Manjarres 2026-03-26  379  
4b3275bbb3dda00 drivers/staging/android/ashmem.c Isaac J. Manjarres 2026-03-26  380  	/* requested mapping size larger than object size */
4b3275bbb3dda00 drivers/staging/android/ashmem.c Isaac J. Manjarres 2026-03-26  381  	if (vma->vm_end - vma->vm_start > PAGE_ALIGN(asma->size)) {
4b3275bbb3dda00 drivers/staging/android/ashmem.c Isaac J. Manjarres 2026-03-26  382  		ret = -EINVAL;
4b3275bbb3dda00 drivers/staging/android/ashmem.c Isaac J. Manjarres 2026-03-26  383  		goto out;
4b3275bbb3dda00 drivers/staging/android/ashmem.c Isaac J. Manjarres 2026-03-26  384  	}
4b3275bbb3dda00 drivers/staging/android/ashmem.c Isaac J. Manjarres 2026-03-26  385  
4b3275bbb3dda00 drivers/staging/android/ashmem.c Isaac J. Manjarres 2026-03-26  386  	/* requested protection bits must match our allowed protection mask */
4b3275bbb3dda00 drivers/staging/android/ashmem.c Isaac J. Manjarres 2026-03-26  387  	if ((vma->vm_flags & ~calc_vm_prot_bits(asma->prot_mask, 0)) &
4b3275bbb3dda00 drivers/staging/android/ashmem.c Isaac J. Manjarres 2026-03-26  388  	    calc_vm_prot_bits(PROT_MASK, 0)) {
4b3275bbb3dda00 drivers/staging/android/ashmem.c Isaac J. Manjarres 2026-03-26  389  		ret = -EPERM;
4b3275bbb3dda00 drivers/staging/android/ashmem.c Isaac J. Manjarres 2026-03-26  390  		goto out;
4b3275bbb3dda00 drivers/staging/android/ashmem.c Isaac J. Manjarres 2026-03-26  391  	}
4b3275bbb3dda00 drivers/staging/android/ashmem.c Isaac J. Manjarres 2026-03-26  392  	vm_flags_clear(vma, calc_vm_may_flags(~asma->prot_mask));
4b3275bbb3dda00 drivers/staging/android/ashmem.c Isaac J. Manjarres 2026-03-26  393  
4b3275bbb3dda00 drivers/staging/android/ashmem.c Isaac J. Manjarres 2026-03-26  394  	if (!asma->file) {
4b3275bbb3dda00 drivers/staging/android/ashmem.c Isaac J. Manjarres 2026-03-26  395  		char *name = ASHMEM_NAME_DEF;
4b3275bbb3dda00 drivers/staging/android/ashmem.c Isaac J. Manjarres 2026-03-26  396  		struct file *vmfile;
4b3275bbb3dda00 drivers/staging/android/ashmem.c Isaac J. Manjarres 2026-03-26 @397  		struct inode *inode;
4b3275bbb3dda00 drivers/staging/android/ashmem.c Isaac J. Manjarres 2026-03-26  398  
4b3275bbb3dda00 drivers/staging/android/ashmem.c Isaac J. Manjarres 2026-03-26  399  		if (asma->name[ASHMEM_NAME_PREFIX_LEN] != '\0')
4b3275bbb3dda00 drivers/staging/android/ashmem.c Isaac J. Manjarres 2026-03-26  400  			name = asma->name;
4b3275bbb3dda00 drivers/staging/android/ashmem.c Isaac J. Manjarres 2026-03-26  401  
4b3275bbb3dda00 drivers/staging/android/ashmem.c Isaac J. Manjarres 2026-03-26  402  		/* ... and allocate the backing shmem file */
4b3275bbb3dda00 drivers/staging/android/ashmem.c Isaac J. Manjarres 2026-03-26  403  		vmfile = shmem_file_setup(name, asma->size, vma->vm_flags);
4b3275bbb3dda00 drivers/staging/android/ashmem.c Isaac J. Manjarres 2026-03-26  404  		if (IS_ERR(vmfile)) {
4b3275bbb3dda00 drivers/staging/android/ashmem.c Isaac J. Manjarres 2026-03-26  405  			ret = PTR_ERR(vmfile);
4b3275bbb3dda00 drivers/staging/android/ashmem.c Isaac J. Manjarres 2026-03-26  406  			goto out;
4b3275bbb3dda00 drivers/staging/android/ashmem.c Isaac J. Manjarres 2026-03-26  407  		}
4b3275bbb3dda00 drivers/staging/android/ashmem.c Isaac J. Manjarres 2026-03-26  408  		vmfile->f_mode |= FMODE_LSEEK;
4b3275bbb3dda00 drivers/staging/android/ashmem.c Isaac J. Manjarres 2026-03-26  409  		inode = file_inode(vmfile);
4b3275bbb3dda00 drivers/staging/android/ashmem.c Isaac J. Manjarres 2026-03-26  410  		lockdep_set_class(&inode->i_rwsem, &backing_shmem_inode_class);
4b3275bbb3dda00 drivers/staging/android/ashmem.c Isaac J. Manjarres 2026-03-26  411  		asma->file = vmfile;
4b3275bbb3dda00 drivers/staging/android/ashmem.c Isaac J. Manjarres 2026-03-26  412  		/*
4b3275bbb3dda00 drivers/staging/android/ashmem.c Isaac J. Manjarres 2026-03-26  413  		 * override mmap operation of the vmfile so that it can't be
4b3275bbb3dda00 drivers/staging/android/ashmem.c Isaac J. Manjarres 2026-03-26  414  		 * remapped which would lead to creation of a new vma with no
4b3275bbb3dda00 drivers/staging/android/ashmem.c Isaac J. Manjarres 2026-03-26  415  		 * asma permission checks. Have to override get_unmapped_area
4b3275bbb3dda00 drivers/staging/android/ashmem.c Isaac J. Manjarres 2026-03-26  416  		 * as well to prevent VM_BUG_ON check for f_ops modification.
4b3275bbb3dda00 drivers/staging/android/ashmem.c Isaac J. Manjarres 2026-03-26  417  		 */
4b3275bbb3dda00 drivers/staging/android/ashmem.c Isaac J. Manjarres 2026-03-26  418  		if (!vmfile_fops.mmap) {
4b3275bbb3dda00 drivers/staging/android/ashmem.c Isaac J. Manjarres 2026-03-26  419  			vmfile_fops = *vmfile->f_op;
4b3275bbb3dda00 drivers/staging/android/ashmem.c Isaac J. Manjarres 2026-03-26  420  			vmfile_fops.mmap = ashmem_vmfile_mmap;
4b3275bbb3dda00 drivers/staging/android/ashmem.c Isaac J. Manjarres 2026-03-26  421  			vmfile_fops.get_unmapped_area =	mm_get_unmapped_area;
4b3275bbb3dda00 drivers/staging/android/ashmem.c Isaac J. Manjarres 2026-03-26  422  		}
4b3275bbb3dda00 drivers/staging/android/ashmem.c Isaac J. Manjarres 2026-03-26  423  		vmfile->f_op = &vmfile_fops;
4b3275bbb3dda00 drivers/staging/android/ashmem.c Isaac J. Manjarres 2026-03-26  424  	}
4b3275bbb3dda00 drivers/staging/android/ashmem.c Isaac J. Manjarres 2026-03-26  425  	get_file(asma->file);
4b3275bbb3dda00 drivers/staging/android/ashmem.c Isaac J. Manjarres 2026-03-26  426  
4b3275bbb3dda00 drivers/staging/android/ashmem.c Isaac J. Manjarres 2026-03-26  427  	/*
4b3275bbb3dda00 drivers/staging/android/ashmem.c Isaac J. Manjarres 2026-03-26  428  	 * XXX - Reworked to use shmem_zero_setup() instead of
4b3275bbb3dda00 drivers/staging/android/ashmem.c Isaac J. Manjarres 2026-03-26  429  	 * shmem_set_file while we're in staging. -jstultz
4b3275bbb3dda00 drivers/staging/android/ashmem.c Isaac J. Manjarres 2026-03-26  430  	 */
4b3275bbb3dda00 drivers/staging/android/ashmem.c Isaac J. Manjarres 2026-03-26  431  	if (vma->vm_flags & VM_SHARED) {
4b3275bbb3dda00 drivers/staging/android/ashmem.c Isaac J. Manjarres 2026-03-26  432  		ret = shmem_zero_setup(vma);
4b3275bbb3dda00 drivers/staging/android/ashmem.c Isaac J. Manjarres 2026-03-26  433  		if (ret) {
4b3275bbb3dda00 drivers/staging/android/ashmem.c Isaac J. Manjarres 2026-03-26  434  			fput(asma->file);
4b3275bbb3dda00 drivers/staging/android/ashmem.c Isaac J. Manjarres 2026-03-26  435  			goto out;
4b3275bbb3dda00 drivers/staging/android/ashmem.c Isaac J. Manjarres 2026-03-26  436  		}
4b3275bbb3dda00 drivers/staging/android/ashmem.c Isaac J. Manjarres 2026-03-26  437  	} else {
4b3275bbb3dda00 drivers/staging/android/ashmem.c Isaac J. Manjarres 2026-03-26  438  		vma_set_anonymous(vma);
4b3275bbb3dda00 drivers/staging/android/ashmem.c Isaac J. Manjarres 2026-03-26  439  	}
4b3275bbb3dda00 drivers/staging/android/ashmem.c Isaac J. Manjarres 2026-03-26  440  
4b3275bbb3dda00 drivers/staging/android/ashmem.c Isaac J. Manjarres 2026-03-26  441  	vma_set_file(vma, asma->file);
4b3275bbb3dda00 drivers/staging/android/ashmem.c Isaac J. Manjarres 2026-03-26  442  	/* XXX: merge this with the get_file() above if possible */
4b3275bbb3dda00 drivers/staging/android/ashmem.c Isaac J. Manjarres 2026-03-26  443  	fput(asma->file);
4b3275bbb3dda00 drivers/staging/android/ashmem.c Isaac J. Manjarres 2026-03-26  444  
4b3275bbb3dda00 drivers/staging/android/ashmem.c Isaac J. Manjarres 2026-03-26  445  out:
4b3275bbb3dda00 drivers/staging/android/ashmem.c Isaac J. Manjarres 2026-03-26  446  	mutex_unlock(&ashmem_mutex);
4b3275bbb3dda00 drivers/staging/android/ashmem.c Isaac J. Manjarres 2026-03-26  447  	return ret;
4b3275bbb3dda00 drivers/staging/android/ashmem.c Isaac J. Manjarres 2026-03-26  448  }
4b3275bbb3dda00 drivers/staging/android/ashmem.c Isaac J. Manjarres 2026-03-26  449  

:::::: The code at line 397 was first introduced by commit
:::::: 4b3275bbb3dda0062c3ba6146b6f56a9234c64da Revert "ANDROID: ashmem: Remove C version of the ashmem driver"

:::::: TO: Isaac J. Manjarres <isaacmanjarres@google.com>
:::::: CC: Treehugger Robot <android-test-infra-autosubmit@system.gserviceaccount.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
