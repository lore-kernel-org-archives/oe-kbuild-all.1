Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A21C6175A60
	for <oe-kbuild-all@lists.linux.dev>; Tue,  5 May 2026 12:13:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777983233; cv=none; b=fQoGpKvCQlXTxww81fZqaEErmHhnIHtMn68ATHOSyaIKhGDERN5wInCHNHY8Ft1aoT80tZqajMYz2+0PxYGROvQcWXQVF8vDNdDezFpKJ5PuvrS3h+llu61/v4L9ss6C3NnvQz0pFhPXy7WVmgCh8sT9ZXwZOfgvcuxe/RqZpbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777983233; c=relaxed/simple;
	bh=Gkyoq4R9pCYHQdgGS6nHBOebNJ67o+/AAXFpLvLfkvc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Q7vQoE7Lz6CUK9/0LUrLv+f4dqLR/Xs6mKEn0dEJmd1eYU5EWVZcnGRhh2E93e/MEmxx18+HxIFrOZN4jAPASMnIDPfcJavcCOXqCERI2g0R2Fyg1klEBp5e4gG74DMJwL2gZlcuY1CMB1aMWxtLJL0vhKlVCKJgt3BAGsFFrX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=N5uXuu+H; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="N5uXuu+H"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777983231; x=1809519231;
  h=date:from:to:cc:subject:message-id;
  bh=Gkyoq4R9pCYHQdgGS6nHBOebNJ67o+/AAXFpLvLfkvc=;
  b=N5uXuu+HzZsKQr5ApHA3tAghlG1WuQvGQR33tPUs5GCePPaB8rGgyPkC
   +ler2dL+WsMh+6McPfMkKICRZEKp0GTVAKWsC5AUvtY5gayhZUZEgrvsW
   agEP1v4CWt8H95ldhEEmdnFDdgL5wnCk61GKL3SdoOuhCzB0/CvAgt9DR
   gtCAvLjDqproJLZfm7jzZd1T6WXapeavMZrTuWKKNi0HlQEJTslj4rpPp
   5EPhzBTtcWGC/inaYjxyZP9vsqyMZ4Hhet38XQ0eIBG6EX6qGdrOaYySg
   CMojVFUAYhzOzgOT3GGCCqcPipSnLv1tGh7jnKPKsVZcmoz/QilI8o1tW
   w==;
X-CSE-ConnectionGUID: W+sy500BSkO7QUZAl1grmg==
X-CSE-MsgGUID: BPMYSUR8SAyBVdij0NIRBA==
X-IronPort-AV: E=McAfee;i="6800,10657,11776"; a="82702313"
X-IronPort-AV: E=Sophos;i="6.23,217,1770624000"; 
   d="scan'208";a="82702313"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2026 05:13:51 -0700
X-CSE-ConnectionGUID: 6FvHUXDHQVeKTKC8YE329g==
X-CSE-MsgGUID: kCEeYXzSQ9e8gTA2EY4jzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,217,1770624000"; 
   d="scan'208";a="240093834"
Received: from lkp-server01.sh.intel.com (HELO 9ec114424ce8) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 05 May 2026 05:13:49 -0700
Received: from kbuild by 9ec114424ce8 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wKEeo-0000000007d-3ZSm;
	Tue, 05 May 2026 12:13:46 +0000
Date: Tue, 05 May 2026 20:13:40 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android-mainline-desktop 166/166]
 drivers/staging/android/ashmem-legacy.c:924:34: warning: format specifies
 type 'long' but the argument has type 'u64' (aka 'unsigned long long')
Message-ID: <202605052002.wuv5nPDN-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Carlos,

First bad commit (maybe != root cause):

tree:   https://android.googlesource.com/kernel/common android-mainline-desktop
head:   446cfce1bd48badcbed1499c5bc3c444214790ab
commit: be18d47ba7a6d22f0d5a93ff4811002e05321306 [166/166] Merge b7d74ea0fdaa ("Merge tag 'vfs-7.1-rc1.kino' of git://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs") into android-mainline
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20260505/202605052002.wuv5nPDN-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260505/202605052002.wuv5nPDN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605052002.wuv5nPDN-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/staging/android/ashmem-legacy.c:924:34: warning: format specifies type 'long' but the argument has type 'u64' (aka 'unsigned long long') [-Wformat]
     924 |                 seq_printf(m, "inode:\t%ld\n", file_inode(asma->file)->i_ino);
         |                                        ~~~     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                        %llu
   1 warning generated.


vim +924 drivers/staging/android/ashmem-legacy.c

4b3275bbb3dda00 drivers/staging/android/ashmem.c        Isaac J. Manjarres 2026-03-26  889  
4b3275bbb3dda00 drivers/staging/android/ashmem.c        Isaac J. Manjarres 2026-03-26  890  /* support of 32bit userspace on 64bit platforms */
4b3275bbb3dda00 drivers/staging/android/ashmem.c        Isaac J. Manjarres 2026-03-26  891  #ifdef CONFIG_COMPAT
4b3275bbb3dda00 drivers/staging/android/ashmem.c        Isaac J. Manjarres 2026-03-26  892  static long compat_ashmem_ioctl(struct file *file, unsigned int cmd,
4b3275bbb3dda00 drivers/staging/android/ashmem.c        Isaac J. Manjarres 2026-03-26  893  				unsigned long arg)
4b3275bbb3dda00 drivers/staging/android/ashmem.c        Isaac J. Manjarres 2026-03-26  894  {
897b372d5d731cc drivers/staging/android/ashmem-legacy.c Isaac J. Manjarres 2026-04-23  895  	struct ashmem_area *asma = file->private_data;
897b372d5d731cc drivers/staging/android/ashmem-legacy.c Isaac J. Manjarres 2026-04-23  896  	unsigned long ino;
897b372d5d731cc drivers/staging/android/ashmem-legacy.c Isaac J. Manjarres 2026-04-23  897  	long ret;
897b372d5d731cc drivers/staging/android/ashmem-legacy.c Isaac J. Manjarres 2026-04-23  898  
4b3275bbb3dda00 drivers/staging/android/ashmem.c        Isaac J. Manjarres 2026-03-26  899  	switch (cmd) {
4b3275bbb3dda00 drivers/staging/android/ashmem.c        Isaac J. Manjarres 2026-03-26  900  	case COMPAT_ASHMEM_SET_SIZE:
4b3275bbb3dda00 drivers/staging/android/ashmem.c        Isaac J. Manjarres 2026-03-26  901  		cmd = ASHMEM_SET_SIZE;
4b3275bbb3dda00 drivers/staging/android/ashmem.c        Isaac J. Manjarres 2026-03-26  902  		break;
4b3275bbb3dda00 drivers/staging/android/ashmem.c        Isaac J. Manjarres 2026-03-26  903  	case COMPAT_ASHMEM_SET_PROT_MASK:
4b3275bbb3dda00 drivers/staging/android/ashmem.c        Isaac J. Manjarres 2026-03-26  904  		cmd = ASHMEM_SET_PROT_MASK;
4b3275bbb3dda00 drivers/staging/android/ashmem.c        Isaac J. Manjarres 2026-03-26  905  		break;
897b372d5d731cc drivers/staging/android/ashmem-legacy.c Isaac J. Manjarres 2026-04-23  906  	case COMPAT_ASHMEM_GET_FILE_ID:
897b372d5d731cc drivers/staging/android/ashmem-legacy.c Isaac J. Manjarres 2026-04-23  907  		ret = get_file_id(asma, &ino);
897b372d5d731cc drivers/staging/android/ashmem-legacy.c Isaac J. Manjarres 2026-04-23  908  		if (ret)
897b372d5d731cc drivers/staging/android/ashmem-legacy.c Isaac J. Manjarres 2026-04-23  909  			return ret;
897b372d5d731cc drivers/staging/android/ashmem-legacy.c Isaac J. Manjarres 2026-04-23  910  
897b372d5d731cc drivers/staging/android/ashmem-legacy.c Isaac J. Manjarres 2026-04-23  911  		return put_user(ino, (compat_uptr_t __user *)compat_ptr(arg)) ? -EFAULT : 0;
4b3275bbb3dda00 drivers/staging/android/ashmem.c        Isaac J. Manjarres 2026-03-26  912  	}
4b3275bbb3dda00 drivers/staging/android/ashmem.c        Isaac J. Manjarres 2026-03-26  913  	return ashmem_ioctl(file, cmd, arg);
4b3275bbb3dda00 drivers/staging/android/ashmem.c        Isaac J. Manjarres 2026-03-26  914  }
4b3275bbb3dda00 drivers/staging/android/ashmem.c        Isaac J. Manjarres 2026-03-26  915  #endif
4b3275bbb3dda00 drivers/staging/android/ashmem.c        Isaac J. Manjarres 2026-03-26  916  #ifdef CONFIG_PROC_FS
4b3275bbb3dda00 drivers/staging/android/ashmem.c        Isaac J. Manjarres 2026-03-26  917  static void ashmem_show_fdinfo(struct seq_file *m, struct file *file)
4b3275bbb3dda00 drivers/staging/android/ashmem.c        Isaac J. Manjarres 2026-03-26  918  {
4b3275bbb3dda00 drivers/staging/android/ashmem.c        Isaac J. Manjarres 2026-03-26  919  	struct ashmem_area *asma = file->private_data;
4b3275bbb3dda00 drivers/staging/android/ashmem.c        Isaac J. Manjarres 2026-03-26  920  
4b3275bbb3dda00 drivers/staging/android/ashmem.c        Isaac J. Manjarres 2026-03-26  921  	mutex_lock(&ashmem_mutex);
4b3275bbb3dda00 drivers/staging/android/ashmem.c        Isaac J. Manjarres 2026-03-26  922  
4b3275bbb3dda00 drivers/staging/android/ashmem.c        Isaac J. Manjarres 2026-03-26  923  	if (asma->file)
4b3275bbb3dda00 drivers/staging/android/ashmem.c        Isaac J. Manjarres 2026-03-26 @924  		seq_printf(m, "inode:\t%ld\n", file_inode(asma->file)->i_ino);
4b3275bbb3dda00 drivers/staging/android/ashmem.c        Isaac J. Manjarres 2026-03-26  925  
4b3275bbb3dda00 drivers/staging/android/ashmem.c        Isaac J. Manjarres 2026-03-26  926  	if (asma->name[ASHMEM_NAME_PREFIX_LEN] != '\0')
4b3275bbb3dda00 drivers/staging/android/ashmem.c        Isaac J. Manjarres 2026-03-26  927  		seq_printf(m, "name:\t%s\n",
4b3275bbb3dda00 drivers/staging/android/ashmem.c        Isaac J. Manjarres 2026-03-26  928  			   asma->name + ASHMEM_NAME_PREFIX_LEN);
4b3275bbb3dda00 drivers/staging/android/ashmem.c        Isaac J. Manjarres 2026-03-26  929  
4b3275bbb3dda00 drivers/staging/android/ashmem.c        Isaac J. Manjarres 2026-03-26  930  	seq_printf(m, "size:\t%zu\n", asma->size);
4b3275bbb3dda00 drivers/staging/android/ashmem.c        Isaac J. Manjarres 2026-03-26  931  
4b3275bbb3dda00 drivers/staging/android/ashmem.c        Isaac J. Manjarres 2026-03-26  932  	mutex_unlock(&ashmem_mutex);
4b3275bbb3dda00 drivers/staging/android/ashmem.c        Isaac J. Manjarres 2026-03-26  933  }
4b3275bbb3dda00 drivers/staging/android/ashmem.c        Isaac J. Manjarres 2026-03-26  934  #endif
4b3275bbb3dda00 drivers/staging/android/ashmem.c        Isaac J. Manjarres 2026-03-26  935  static const struct file_operations ashmem_fops = {
4b3275bbb3dda00 drivers/staging/android/ashmem.c        Isaac J. Manjarres 2026-03-26  936  	.owner = THIS_MODULE,
4b3275bbb3dda00 drivers/staging/android/ashmem.c        Isaac J. Manjarres 2026-03-26  937  	.open = ashmem_open,
4b3275bbb3dda00 drivers/staging/android/ashmem.c        Isaac J. Manjarres 2026-03-26  938  	.release = ashmem_release,
4b3275bbb3dda00 drivers/staging/android/ashmem.c        Isaac J. Manjarres 2026-03-26  939  	.read_iter = ashmem_read_iter,
4b3275bbb3dda00 drivers/staging/android/ashmem.c        Isaac J. Manjarres 2026-03-26  940  	.llseek = ashmem_llseek,
4b3275bbb3dda00 drivers/staging/android/ashmem.c        Isaac J. Manjarres 2026-03-26  941  	.mmap = ashmem_mmap,
4b3275bbb3dda00 drivers/staging/android/ashmem.c        Isaac J. Manjarres 2026-03-26  942  	.unlocked_ioctl = ashmem_ioctl,
4b3275bbb3dda00 drivers/staging/android/ashmem.c        Isaac J. Manjarres 2026-03-26  943  #ifdef CONFIG_COMPAT
4b3275bbb3dda00 drivers/staging/android/ashmem.c        Isaac J. Manjarres 2026-03-26  944  	.compat_ioctl = compat_ashmem_ioctl,
4b3275bbb3dda00 drivers/staging/android/ashmem.c        Isaac J. Manjarres 2026-03-26  945  #endif
4b3275bbb3dda00 drivers/staging/android/ashmem.c        Isaac J. Manjarres 2026-03-26  946  #ifdef CONFIG_PROC_FS
4b3275bbb3dda00 drivers/staging/android/ashmem.c        Isaac J. Manjarres 2026-03-26  947  	.show_fdinfo = ashmem_show_fdinfo,
4b3275bbb3dda00 drivers/staging/android/ashmem.c        Isaac J. Manjarres 2026-03-26  948  #endif
4b3275bbb3dda00 drivers/staging/android/ashmem.c        Isaac J. Manjarres 2026-03-26  949  };
4b3275bbb3dda00 drivers/staging/android/ashmem.c        Isaac J. Manjarres 2026-03-26  950  

:::::: The code at line 924 was first introduced by commit
:::::: 4b3275bbb3dda0062c3ba6146b6f56a9234c64da Revert "ANDROID: ashmem: Remove C version of the ashmem driver"

:::::: TO: Isaac J. Manjarres <isaacmanjarres@google.com>
:::::: CC: Treehugger Robot <android-test-infra-autosubmit@system.gserviceaccount.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
