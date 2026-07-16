Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A12C23F58C6
	for <oe-kbuild-all@lists.linux.dev>; Thu, 16 Jul 2026 08:57:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784192246; cv=none; b=GIr7E7ovoKfM9eAu4CtK9QbpSXwfNqmSdwnrj9TU+XMS1JzHm1tn574hcQXK3nTLkObapTGsPO3T1ttthD1lu2+fd7whwNc8FTy0Oaw2a7jKpHBR02+JUUHWrh8LO4KMWR1mfbE8EsZfUh9awnmzN83JIJRm38x4ZXqY3ahIQ68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784192246; c=relaxed/simple;
	bh=9bQDI0XJ6Jc52X/617YfhJrjsHQnh45OspmFRbBGy2M=;
	h=Date:From:To:Cc:Subject:Message-ID; b=n3Su1xEzouMXyG42+wBYV6EKPksom2u9HHGEk8UQVRPC41455vNvzcz+gS9hB4Akl4a/Tb7o/0mwdjGPjU1T4aDyoVz4aSqXdLYMEL1M02lLymbJfavL6Gm8m3Cw/WEfM+GVniJF+5wzmvrGrTzZrt9BULcuR897eZSCiURx+Ic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=diDPY0Gh; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="diDPY0Gh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784192240; x=1815728240;
  h=date:from:to:cc:subject:message-id;
  bh=9bQDI0XJ6Jc52X/617YfhJrjsHQnh45OspmFRbBGy2M=;
  b=diDPY0GheoAb1jutwYwx5P0wFKS2FCthRdL+LzlS0Fp282re4EKhtIG/
   E8W8bHUohfP1QLG/861TefYStlXPL+RgaPki3m1kX2egUxcGVBgWhBwmC
   paC7PAL9sI4OBSiN2Zba0BpokUA+1Ah5JyL89djSmMUXIhHAJ2Yo6OxEU
   IW/GL76jOXhnA+8sw9yCxHfpfQBSIQiT2mJlRPg/dfc51ZMuZVJuG1jnb
   XG0c9XfnjEGPxe9qukKz2yJSieourSH0UH+LHk4C1S+lo8QCa7KydkOFf
   ygX0w842IEm/+KWziQ5EYlG3xOfkhyo/3pmu6jdEqFR+H2NtJHmP0swEN
   A==;
X-CSE-ConnectionGUID: D88tumHNStycLqZoCyeakw==
X-CSE-MsgGUID: rBeum0BBSfuLTLpBOnXQig==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="83966529"
X-IronPort-AV: E=Sophos;i="6.25,167,1779174000"; 
   d="scan'208";a="83966529"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jul 2026 01:57:08 -0700
X-CSE-ConnectionGUID: Me5AjzV2QMy4p5Y6dCC92w==
X-CSE-MsgGUID: ph75YajyTEWYvFyBCWVDeA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,167,1779174000"; 
   d="scan'208";a="253035834"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 16 Jul 2026 01:57:06 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wkHtw-00000000Oag-01mQ;
	Thu, 16 Jul 2026 08:57:04 +0000
Date: Thu, 16 Jul 2026 16:56:54 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android-mainline 0/1]
 drivers/staging/android/ashmem-legacy.c:397:31: warning: variable 'inode' set
 but not used
Message-ID: <202607161631.0n2wMAjo-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Isaac,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android-mainline
head:   2a04d824962f1bf2703a8ff94d7c5ee5f6b541b7
commit: 97f1681cbca0ccce07e5c9ef0b450ea340867291 [0/1] ANDROID: staging: ashmem: Cleanup kconfig options and rename source files
config: i386-buildonly-randconfig-001 (https://download.01.org/0day-ci/archive/20260716/202607161631.0n2wMAjo-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260716/202607161631.0n2wMAjo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607161631.0n2wMAjo-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/staging/android/ashmem-legacy.c: In function 'ashmem_mmap':
>> drivers/staging/android/ashmem-legacy.c:397:31: warning: variable 'inode' set but not used [-Wunused-but-set-variable]
     397 |                 struct inode *inode;
         |                               ^~~~~


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
