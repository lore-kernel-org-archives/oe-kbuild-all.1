Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794450264;
	b=wadtu/J9EfVQqFV1yprcoUUDLi9g9TN51xcV90TDPNCpWZqPxP1g7YAMZ8eagXGz23h2
	 MMaNhoA7j5HmAHZSc0ZekxYiFHe5DzwFdUrAOauhWrA6ammtLkm0SDUvsbv0E/aDBy/sJ
	 gzBJ1Hs1J15aXbn62urLzuV7oOtcohJrJzJELlTdObGizRtlCgEqRNpqWkW0ZHnAlJFFA
	 q1teYuO2Nh39V8tfbQKgHo5hudU78w9DPxAcyNSlhxqRlTAn+l7j2GUm1jhmkN/e4+nUt
	 2ubPkPgM3KMaV0ZS/iQBpf8r4OkSac1SxiEER7Uum9YsY3M/qhrRkq1TByOKBgLMVtw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794450264;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=6iEp1RcAExs3M2B96Cr0Ngj7G/YzPS34fVZFttA+c9o=;
	b=nJ++FSq8CFeCj2Yr5EfXz24jJKMP0wWojcwvr0+1bcLDZlRagOx5SBIIBVLE0PRiMt2j
	 mLKYpM20yHmg4lxx7IjuXFwE3cIw1XxcxTIOCBkX4MTLBX8dyIZcLbvTr9t6vU99G7hr+
	 3A6qHW2DavKvDyjLdb0+6L4/EyRw8PtpB4eq02JRRcYnvokwYO3Pd0le9sJmFGkL3mquJ
	 RQbt6qRuYaw5MkZ+OWp7PZCDSdzfQtlQFw+mTd/D0/3lxuJ95LlQ+OLbIqi4vO1QvS7hh
	 O6GJ0C0JvHpLzM9QN2Tbw0Lt/KcKdbXupp1vvA0C7WHPlPJGsF2hsc9nfaFvaI62h8A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=FAZrGhV2;
	arc=none smtp.remote-ip=192.198.163.12
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5E47606A327
	for <oe-kbuild-all@lists.linux.dev>; Thu, 12 Nov 2026 02:24:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C5E47606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=FAZrGhV2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794450264; x=1825986264;
  h=date:from:to:cc:subject:message-id;
  bh=Ulhv5imC8/f1eo/AxFjsOo+ktXyro7iaXhJZ4kND9iY=;
  b=FAZrGhV2/FcYQnIEdYUkYVqEnsLhHCnR1vsXhtd4QEZC3ttiVG5OPHMo
   NXjfv61OJevP5HDOBInZU4+IIVnTnvf5DMkSALWd5ryWOZz5E+FkXUu4X
   UTxCJm1A+MGZu32VdHPBoxCB6DqozNnkdPgh/PV29UDTj+4/rvAWCTAj3
   n0XFqZzzP3bAta8j+y6ipRJCDT0jHCRpO94hcZDbHhEA2OT9y0iI1eHcA
   0fI1sNUbY+1B15DB245QkRlObIxH7s4hpafjQGNKii//xx3KmaN9tSbe6
   No7O6aYJLUQCuO1kqNtN2HllBgqDuqKn0g8ChhH5NuTxnEvsdEO60Ddo5
   Q==;
X-CSE-ConnectionGUID: BAArCnAURCa+ev76a60zSQ==
X-CSE-MsgGUID: ESLncS8oTSOk4AW9QflUbw==
X-IronPort-AV: E=McAfee;i="6800,10657,11963"; a="3132571"
X-IronPort-AV: E=Sophos;i="6.27,208,1787036400"; 
   d="scan'208";a="3132571"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2026 18:24:23 -0800
X-CSE-ConnectionGUID: yEyr7d8gTWCW9omW8YLhrg==
X-CSE-MsgGUID: cdgg3LZeRPyHoUxLGAyv8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,208,1787036400"; 
   d="scan'208";a="8421582"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by orviesa003.jf.intel.com with ESMTP; 11 Nov 2026 18:24:22 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xRKU7-000000000md-1PMJ;
	Thu, 12 Nov 2026 02:24:19 +0000
Date: Thu, 12 Nov 2026 03:24:05 +0100
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android-mainline-riscv64 1/1]
 drivers/staging/android/ashmem-legacy.c:397:17: warning: variable 'inode' set
 but not used
Message-ID: <202611120306.aAN5eSXz-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

Hi Isaac,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android-mainline-riscv64
head:   feccd7a4aac57b2b98a459c7903fd026e54a2b32
commit: 97f1681cbca0ccce07e5c9ef0b450ea340867291 [1/1] ANDROID: staging: ashmem: Cleanup kconfig options and rename source files
config: arm64-randconfig-2200-20261112 (https://download.01.org/0day-ci/archive/20261112/202611120306.aAN5eSXz-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 8621950157210c1fa68f20f0614cb51310ec9dff)
smatch: v0.5.0-9187-g5189e3fb
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261112/202611120306.aAN5eSXz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611120306.aAN5eSXz-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/staging/android/ashmem-legacy.c:397:17: warning: variable 'inode' set but not used [-Wunused-but-set-variable]
     397 |                 struct inode *inode;
         |                               ^
   1 warning generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for DRM_MIPI_DSI
   Depends on [n]: HAS_IOMEM [=y] && DRM [=n]
   Selected by [y]:
   - GKI_HIDDEN_DRM_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_VMASTER
   Depends on [n]: SOUND [=n] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for CAN_RX_OFFLOAD
   Depends on [n]: NETDEVICES [=n] && CAN_DEV [=n] && CAN_NETLINK [=n]
   Selected by [y]:
   - GKI_HIDDEN_MCP251XFD_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_JACK_INPUT_DEV
   Depends on [n]: SOUND [=n] && SND [=n] && SND_JACK [=y]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for IOMMU_IO_PGTABLE_LPAE
   Depends on [n]: IOMMU_SUPPORT [=n] && (ARM || ARM64 [=y] || COMPILE_TEST [=y]) && !GENERIC_ATOMIC64 [=n]
   Selected by [y]:
   - GKI_HIDDEN_QCOM_CONFIGS [=y] && ARCH_QCOM [=y] && 64BIT [=y]
   WARNING: unmet direct dependencies detected for WEXT_PROC
   Depends on [n]: NET [=y] && WIRELESS [=n] && PROC_FS [=y] && WEXT_CORE [=y]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_ELD
   Depends on [n]: SOUND [=n] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for WEXT_PRIV
   Depends on [n]: NET [=y] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for BALLOON_COMPACTION
   Depends on [n]: COMPACTION [=n] && MEMORY_BALLOON [=y]
   Selected by [y]:
   - GKI_HIDDEN_MM_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for PHYLINK
   Depends on [n]: NETDEVICES [=n]
   Selected by [y]:
   - GKI_HIDDEN_ETHERNET_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_IEC958
   Depends on [n]: SOUND [=n] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_SOC_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for IOMMU_SVA
   Depends on [n]: IOMMU_SUPPORT [=n]
   Selected by [y]:
   - GKI_HIDDEN_IOMMU_CONFIGS [=y] && (ARM64 [=y] || X86)
   WARNING: unmet direct dependencies detected for WIRELESS_EXT
   Depends on [n]: NET [=y] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for WEXT_CORE
   Depends on [n]: NET [=y] && WIRELESS [=n] && (CFG80211_WEXT [=n] || WIRELESS_EXT [=y])
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for SND_COMPRESS_ACCEL
   Depends on [n]: SOUND [=n] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_JACK
   Depends on [n]: SOUND [=n] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]


vim +/inode +397 drivers/staging/android/ashmem-legacy.c

4b3275bbb3dda0 drivers/staging/android/ashmem.c Isaac J. Manjarres 2026-03-26  365  
4b3275bbb3dda0 drivers/staging/android/ashmem.c Isaac J. Manjarres 2026-03-26  366  static int ashmem_mmap(struct file *file, struct vm_area_struct *vma)
4b3275bbb3dda0 drivers/staging/android/ashmem.c Isaac J. Manjarres 2026-03-26  367  {
4b3275bbb3dda0 drivers/staging/android/ashmem.c Isaac J. Manjarres 2026-03-26  368  	static struct file_operations vmfile_fops;
4b3275bbb3dda0 drivers/staging/android/ashmem.c Isaac J. Manjarres 2026-03-26  369  	struct ashmem_area *asma = file->private_data;
4b3275bbb3dda0 drivers/staging/android/ashmem.c Isaac J. Manjarres 2026-03-26  370  	int ret = 0;
4b3275bbb3dda0 drivers/staging/android/ashmem.c Isaac J. Manjarres 2026-03-26  371  
4b3275bbb3dda0 drivers/staging/android/ashmem.c Isaac J. Manjarres 2026-03-26  372  	mutex_lock(&ashmem_mutex);
4b3275bbb3dda0 drivers/staging/android/ashmem.c Isaac J. Manjarres 2026-03-26  373  
4b3275bbb3dda0 drivers/staging/android/ashmem.c Isaac J. Manjarres 2026-03-26  374  	/* user needs to SET_SIZE before mapping */
4b3275bbb3dda0 drivers/staging/android/ashmem.c Isaac J. Manjarres 2026-03-26  375  	if (!asma->size) {
4b3275bbb3dda0 drivers/staging/android/ashmem.c Isaac J. Manjarres 2026-03-26  376  		ret = -EINVAL;
4b3275bbb3dda0 drivers/staging/android/ashmem.c Isaac J. Manjarres 2026-03-26  377  		goto out;
4b3275bbb3dda0 drivers/staging/android/ashmem.c Isaac J. Manjarres 2026-03-26  378  	}
4b3275bbb3dda0 drivers/staging/android/ashmem.c Isaac J. Manjarres 2026-03-26  379  
4b3275bbb3dda0 drivers/staging/android/ashmem.c Isaac J. Manjarres 2026-03-26  380  	/* requested mapping size larger than object size */
4b3275bbb3dda0 drivers/staging/android/ashmem.c Isaac J. Manjarres 2026-03-26  381  	if (vma->vm_end - vma->vm_start > PAGE_ALIGN(asma->size)) {
4b3275bbb3dda0 drivers/staging/android/ashmem.c Isaac J. Manjarres 2026-03-26  382  		ret = -EINVAL;
4b3275bbb3dda0 drivers/staging/android/ashmem.c Isaac J. Manjarres 2026-03-26  383  		goto out;
4b3275bbb3dda0 drivers/staging/android/ashmem.c Isaac J. Manjarres 2026-03-26  384  	}
4b3275bbb3dda0 drivers/staging/android/ashmem.c Isaac J. Manjarres 2026-03-26  385  
4b3275bbb3dda0 drivers/staging/android/ashmem.c Isaac J. Manjarres 2026-03-26  386  	/* requested protection bits must match our allowed protection mask */
4b3275bbb3dda0 drivers/staging/android/ashmem.c Isaac J. Manjarres 2026-03-26  387  	if ((vma->vm_flags & ~calc_vm_prot_bits(asma->prot_mask, 0)) &
4b3275bbb3dda0 drivers/staging/android/ashmem.c Isaac J. Manjarres 2026-03-26  388  	    calc_vm_prot_bits(PROT_MASK, 0)) {
4b3275bbb3dda0 drivers/staging/android/ashmem.c Isaac J. Manjarres 2026-03-26  389  		ret = -EPERM;
4b3275bbb3dda0 drivers/staging/android/ashmem.c Isaac J. Manjarres 2026-03-26  390  		goto out;
4b3275bbb3dda0 drivers/staging/android/ashmem.c Isaac J. Manjarres 2026-03-26  391  	}
4b3275bbb3dda0 drivers/staging/android/ashmem.c Isaac J. Manjarres 2026-03-26  392  	vm_flags_clear(vma, calc_vm_may_flags(~asma->prot_mask));
4b3275bbb3dda0 drivers/staging/android/ashmem.c Isaac J. Manjarres 2026-03-26  393  
4b3275bbb3dda0 drivers/staging/android/ashmem.c Isaac J. Manjarres 2026-03-26  394  	if (!asma->file) {
4b3275bbb3dda0 drivers/staging/android/ashmem.c Isaac J. Manjarres 2026-03-26  395  		char *name = ASHMEM_NAME_DEF;
4b3275bbb3dda0 drivers/staging/android/ashmem.c Isaac J. Manjarres 2026-03-26  396  		struct file *vmfile;
4b3275bbb3dda0 drivers/staging/android/ashmem.c Isaac J. Manjarres 2026-03-26 @397  		struct inode *inode;
4b3275bbb3dda0 drivers/staging/android/ashmem.c Isaac J. Manjarres 2026-03-26  398  
4b3275bbb3dda0 drivers/staging/android/ashmem.c Isaac J. Manjarres 2026-03-26  399  		if (asma->name[ASHMEM_NAME_PREFIX_LEN] != '\0')
4b3275bbb3dda0 drivers/staging/android/ashmem.c Isaac J. Manjarres 2026-03-26  400  			name = asma->name;
4b3275bbb3dda0 drivers/staging/android/ashmem.c Isaac J. Manjarres 2026-03-26  401  
4b3275bbb3dda0 drivers/staging/android/ashmem.c Isaac J. Manjarres 2026-03-26  402  		/* ... and allocate the backing shmem file */
4b3275bbb3dda0 drivers/staging/android/ashmem.c Isaac J. Manjarres 2026-03-26  403  		vmfile = shmem_file_setup(name, asma->size, vma->vm_flags);
4b3275bbb3dda0 drivers/staging/android/ashmem.c Isaac J. Manjarres 2026-03-26  404  		if (IS_ERR(vmfile)) {
4b3275bbb3dda0 drivers/staging/android/ashmem.c Isaac J. Manjarres 2026-03-26  405  			ret = PTR_ERR(vmfile);
4b3275bbb3dda0 drivers/staging/android/ashmem.c Isaac J. Manjarres 2026-03-26  406  			goto out;
4b3275bbb3dda0 drivers/staging/android/ashmem.c Isaac J. Manjarres 2026-03-26  407  		}
4b3275bbb3dda0 drivers/staging/android/ashmem.c Isaac J. Manjarres 2026-03-26  408  		vmfile->f_mode |= FMODE_LSEEK;
4b3275bbb3dda0 drivers/staging/android/ashmem.c Isaac J. Manjarres 2026-03-26  409  		inode = file_inode(vmfile);
4b3275bbb3dda0 drivers/staging/android/ashmem.c Isaac J. Manjarres 2026-03-26  410  		lockdep_set_class(&inode->i_rwsem, &backing_shmem_inode_class);
4b3275bbb3dda0 drivers/staging/android/ashmem.c Isaac J. Manjarres 2026-03-26  411  		asma->file = vmfile;
4b3275bbb3dda0 drivers/staging/android/ashmem.c Isaac J. Manjarres 2026-03-26  412  		/*
4b3275bbb3dda0 drivers/staging/android/ashmem.c Isaac J. Manjarres 2026-03-26  413  		 * override mmap operation of the vmfile so that it can't be
4b3275bbb3dda0 drivers/staging/android/ashmem.c Isaac J. Manjarres 2026-03-26  414  		 * remapped which would lead to creation of a new vma with no
4b3275bbb3dda0 drivers/staging/android/ashmem.c Isaac J. Manjarres 2026-03-26  415  		 * asma permission checks. Have to override get_unmapped_area
4b3275bbb3dda0 drivers/staging/android/ashmem.c Isaac J. Manjarres 2026-03-26  416  		 * as well to prevent VM_BUG_ON check for f_ops modification.
4b3275bbb3dda0 drivers/staging/android/ashmem.c Isaac J. Manjarres 2026-03-26  417  		 */
4b3275bbb3dda0 drivers/staging/android/ashmem.c Isaac J. Manjarres 2026-03-26  418  		if (!vmfile_fops.mmap) {
4b3275bbb3dda0 drivers/staging/android/ashmem.c Isaac J. Manjarres 2026-03-26  419  			vmfile_fops = *vmfile->f_op;
4b3275bbb3dda0 drivers/staging/android/ashmem.c Isaac J. Manjarres 2026-03-26  420  			vmfile_fops.mmap = ashmem_vmfile_mmap;
4b3275bbb3dda0 drivers/staging/android/ashmem.c Isaac J. Manjarres 2026-03-26  421  			vmfile_fops.get_unmapped_area =	mm_get_unmapped_area;
4b3275bbb3dda0 drivers/staging/android/ashmem.c Isaac J. Manjarres 2026-03-26  422  		}
4b3275bbb3dda0 drivers/staging/android/ashmem.c Isaac J. Manjarres 2026-03-26  423  		vmfile->f_op = &vmfile_fops;
4b3275bbb3dda0 drivers/staging/android/ashmem.c Isaac J. Manjarres 2026-03-26  424  	}
4b3275bbb3dda0 drivers/staging/android/ashmem.c Isaac J. Manjarres 2026-03-26  425  	get_file(asma->file);
4b3275bbb3dda0 drivers/staging/android/ashmem.c Isaac J. Manjarres 2026-03-26  426  
4b3275bbb3dda0 drivers/staging/android/ashmem.c Isaac J. Manjarres 2026-03-26  427  	/*
4b3275bbb3dda0 drivers/staging/android/ashmem.c Isaac J. Manjarres 2026-03-26  428  	 * XXX - Reworked to use shmem_zero_setup() instead of
4b3275bbb3dda0 drivers/staging/android/ashmem.c Isaac J. Manjarres 2026-03-26  429  	 * shmem_set_file while we're in staging. -jstultz
4b3275bbb3dda0 drivers/staging/android/ashmem.c Isaac J. Manjarres 2026-03-26  430  	 */
4b3275bbb3dda0 drivers/staging/android/ashmem.c Isaac J. Manjarres 2026-03-26  431  	if (vma->vm_flags & VM_SHARED) {
4b3275bbb3dda0 drivers/staging/android/ashmem.c Isaac J. Manjarres 2026-03-26  432  		ret = shmem_zero_setup(vma);
4b3275bbb3dda0 drivers/staging/android/ashmem.c Isaac J. Manjarres 2026-03-26  433  		if (ret) {
4b3275bbb3dda0 drivers/staging/android/ashmem.c Isaac J. Manjarres 2026-03-26  434  			fput(asma->file);
4b3275bbb3dda0 drivers/staging/android/ashmem.c Isaac J. Manjarres 2026-03-26  435  			goto out;
4b3275bbb3dda0 drivers/staging/android/ashmem.c Isaac J. Manjarres 2026-03-26  436  		}
4b3275bbb3dda0 drivers/staging/android/ashmem.c Isaac J. Manjarres 2026-03-26  437  	} else {
4b3275bbb3dda0 drivers/staging/android/ashmem.c Isaac J. Manjarres 2026-03-26  438  		vma_set_anonymous(vma);
4b3275bbb3dda0 drivers/staging/android/ashmem.c Isaac J. Manjarres 2026-03-26  439  	}
4b3275bbb3dda0 drivers/staging/android/ashmem.c Isaac J. Manjarres 2026-03-26  440  
4b3275bbb3dda0 drivers/staging/android/ashmem.c Isaac J. Manjarres 2026-03-26  441  	vma_set_file(vma, asma->file);
4b3275bbb3dda0 drivers/staging/android/ashmem.c Isaac J. Manjarres 2026-03-26  442  	/* XXX: merge this with the get_file() above if possible */
4b3275bbb3dda0 drivers/staging/android/ashmem.c Isaac J. Manjarres 2026-03-26  443  	fput(asma->file);
4b3275bbb3dda0 drivers/staging/android/ashmem.c Isaac J. Manjarres 2026-03-26  444  
4b3275bbb3dda0 drivers/staging/android/ashmem.c Isaac J. Manjarres 2026-03-26  445  out:
4b3275bbb3dda0 drivers/staging/android/ashmem.c Isaac J. Manjarres 2026-03-26  446  	mutex_unlock(&ashmem_mutex);
4b3275bbb3dda0 drivers/staging/android/ashmem.c Isaac J. Manjarres 2026-03-26  447  	return ret;
4b3275bbb3dda0 drivers/staging/android/ashmem.c Isaac J. Manjarres 2026-03-26  448  }
4b3275bbb3dda0 drivers/staging/android/ashmem.c Isaac J. Manjarres 2026-03-26  449  

:::::: The code at line 397 was first introduced by commit
:::::: 4b3275bbb3dda0062c3ba6146b6f56a9234c64da Revert "ANDROID: ashmem: Remove C version of the ashmem driver"

:::::: TO: Isaac J. Manjarres <isaacmanjarres@google.com>
:::::: CC: Treehugger Robot <android-test-infra-autosubmit@system.gserviceaccount.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
