Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4747A38F252
	for <oe-kbuild-all@lists.linux.dev>; Tue,  5 May 2026 11:37:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777981072; cv=none; b=AhvGdCDAz6uFrA0w5xS109fP0apNfABGtl4/9NJX+eSj9p9r+c4W+pB9h0pgH4F+Wip3eMblJYSpnN0U/x4Fi3QvYAqJkq69vTqy5fS/E4XQ9fAju7OPW7r8653EIEzElOX/ujJDeXMXG2JZTmRlfcE1+XzIOm+YvVMy9bkVaHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777981072; c=relaxed/simple;
	bh=xDHxIuXHf2Ewk2pQejnf8QDohuUnUtNhuGybEsUzcE8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Ce+iliP/i2ZWPxZYv6/BRX0xZMIn+lukte8+TS2LcDCKY/y/e7FHA4XpwOYz+cta9fgoU+/WUpmJ3Zt2YBiXpqlKn21prR97cLX6poCwSfqNWkS0c61QxcRHZMItC9T3QHYtN45QaRdsBOgxlDoG9EMCKHP0IxEoIwMWF9nxy9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Hjhb49v8; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Hjhb49v8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777981070; x=1809517070;
  h=date:from:to:cc:subject:message-id;
  bh=xDHxIuXHf2Ewk2pQejnf8QDohuUnUtNhuGybEsUzcE8=;
  b=Hjhb49v82ghnZsmdnrFFnUgF/etVkJf6ivxTIlv/DfEuzF93GIy1vOXf
   B93FdqdrnkhyzNvbrkbfYvUl9bsVi3r3mfErjX5sg/3dDdMNqoaONV7hw
   R5NQkQ37Q4qhieqrA4i/vcrJQrdRjItZv2F3Akn70hUAi1tuGVJLxJGf8
   9KR3lTtKHJ41KTJNxshcytBE6UQXved5SdilWlR/XRNcAxtXh1UBV9GMV
   IFIG+IvmlmATJJ6J/B5zJJjyfcrv3vlXLUO0IK26PossSfBy6KxQjfrnG
   1VOdTAOjF4aYAlt6e7ChP+EnMpKu0c2/FbEyX8PKq9VhUldbnD4HvSBrg
   g==;
X-CSE-ConnectionGUID: 6Bq2R4quQmWiwHXm+ZLymw==
X-CSE-MsgGUID: 4dbHvWk1Qcy2lzdr0cwvDQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11776"; a="82716261"
X-IronPort-AV: E=Sophos;i="6.23,217,1770624000"; 
   d="scan'208";a="82716261"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2026 04:37:50 -0700
X-CSE-ConnectionGUID: jWjsQn+nT7+3YcDqXTF2Aw==
X-CSE-MsgGUID: NVl+tn6ETwaX53H7uJdeig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,217,1770624000"; 
   d="scan'208";a="234921065"
Received: from lkp-server01.sh.intel.com (HELO 9ec114424ce8) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 05 May 2026 04:37:48 -0700
Received: from kbuild by 9ec114424ce8 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wKE5x-0000000006n-3RnO;
	Tue, 05 May 2026 11:37:45 +0000
Date: Tue, 05 May 2026 19:36:45 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android-mainline 12/12]
 drivers/staging/android/ashmem-legacy.c:924:42: warning: format '%ld' expects
 argument of type 'long int', but argument 3 has type 'u64' {aka 'long long
 unsigned int'}
Message-ID: <202605051927.gHrHqjcr-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Carlos,

First bad commit (maybe != root cause):

tree:   https://android.googlesource.com/kernel/common android-mainline
head:   b300cda13ba0ea4ed936b40f4c31e01eaaa0e812
commit: be18d47ba7a6d22f0d5a93ff4811002e05321306 [12/12] Merge b7d74ea0fdaa ("Merge tag 'vfs-7.1-rc1.kino' of git://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs") into android-mainline
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20260505/202605051927.gHrHqjcr-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260505/202605051927.gHrHqjcr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605051927.gHrHqjcr-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/staging/android/ashmem-legacy.c: In function 'ashmem_show_fdinfo':
>> drivers/staging/android/ashmem-legacy.c:924:42: warning: format '%ld' expects argument of type 'long int', but argument 3 has type 'u64' {aka 'long long unsigned int'} [-Wformat=]
     924 |                 seq_printf(m, "inode:\t%ld\n", file_inode(asma->file)->i_ino);
         |                                        ~~^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                          |                           |
         |                                          long int                    u64 {aka long long unsigned int}
         |                                        %lld
   In file included from drivers/staging/android/ashmem-legacy.c:27:
   drivers/staging/android/ashmem.h: At top level:
   drivers/staging/android/ashmem.h:20:20: warning: 'RUST_CONST_HELPER___GFP_IO' defined but not used [-Wunused-const-variable=]
      20 | static const gfp_t RUST_CONST_HELPER___GFP_IO = ___GFP_IO;
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/android/ashmem.h:19:20: warning: 'RUST_CONST_HELPER___GFP_FS' defined but not used [-Wunused-const-variable=]
      19 | static const gfp_t RUST_CONST_HELPER___GFP_FS = ___GFP_FS;
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~


vim +924 drivers/staging/android/ashmem-legacy.c

4b3275bbb3dda0 drivers/staging/android/ashmem.c        Isaac J. Manjarres 2026-03-26  889  
4b3275bbb3dda0 drivers/staging/android/ashmem.c        Isaac J. Manjarres 2026-03-26  890  /* support of 32bit userspace on 64bit platforms */
4b3275bbb3dda0 drivers/staging/android/ashmem.c        Isaac J. Manjarres 2026-03-26  891  #ifdef CONFIG_COMPAT
4b3275bbb3dda0 drivers/staging/android/ashmem.c        Isaac J. Manjarres 2026-03-26  892  static long compat_ashmem_ioctl(struct file *file, unsigned int cmd,
4b3275bbb3dda0 drivers/staging/android/ashmem.c        Isaac J. Manjarres 2026-03-26  893  				unsigned long arg)
4b3275bbb3dda0 drivers/staging/android/ashmem.c        Isaac J. Manjarres 2026-03-26  894  {
897b372d5d731c drivers/staging/android/ashmem-legacy.c Isaac J. Manjarres 2026-04-23  895  	struct ashmem_area *asma = file->private_data;
897b372d5d731c drivers/staging/android/ashmem-legacy.c Isaac J. Manjarres 2026-04-23  896  	unsigned long ino;
897b372d5d731c drivers/staging/android/ashmem-legacy.c Isaac J. Manjarres 2026-04-23  897  	long ret;
897b372d5d731c drivers/staging/android/ashmem-legacy.c Isaac J. Manjarres 2026-04-23  898  
4b3275bbb3dda0 drivers/staging/android/ashmem.c        Isaac J. Manjarres 2026-03-26  899  	switch (cmd) {
4b3275bbb3dda0 drivers/staging/android/ashmem.c        Isaac J. Manjarres 2026-03-26  900  	case COMPAT_ASHMEM_SET_SIZE:
4b3275bbb3dda0 drivers/staging/android/ashmem.c        Isaac J. Manjarres 2026-03-26  901  		cmd = ASHMEM_SET_SIZE;
4b3275bbb3dda0 drivers/staging/android/ashmem.c        Isaac J. Manjarres 2026-03-26  902  		break;
4b3275bbb3dda0 drivers/staging/android/ashmem.c        Isaac J. Manjarres 2026-03-26  903  	case COMPAT_ASHMEM_SET_PROT_MASK:
4b3275bbb3dda0 drivers/staging/android/ashmem.c        Isaac J. Manjarres 2026-03-26  904  		cmd = ASHMEM_SET_PROT_MASK;
4b3275bbb3dda0 drivers/staging/android/ashmem.c        Isaac J. Manjarres 2026-03-26  905  		break;
897b372d5d731c drivers/staging/android/ashmem-legacy.c Isaac J. Manjarres 2026-04-23  906  	case COMPAT_ASHMEM_GET_FILE_ID:
897b372d5d731c drivers/staging/android/ashmem-legacy.c Isaac J. Manjarres 2026-04-23  907  		ret = get_file_id(asma, &ino);
897b372d5d731c drivers/staging/android/ashmem-legacy.c Isaac J. Manjarres 2026-04-23  908  		if (ret)
897b372d5d731c drivers/staging/android/ashmem-legacy.c Isaac J. Manjarres 2026-04-23  909  			return ret;
897b372d5d731c drivers/staging/android/ashmem-legacy.c Isaac J. Manjarres 2026-04-23  910  
897b372d5d731c drivers/staging/android/ashmem-legacy.c Isaac J. Manjarres 2026-04-23  911  		return put_user(ino, (compat_uptr_t __user *)compat_ptr(arg)) ? -EFAULT : 0;
4b3275bbb3dda0 drivers/staging/android/ashmem.c        Isaac J. Manjarres 2026-03-26  912  	}
4b3275bbb3dda0 drivers/staging/android/ashmem.c        Isaac J. Manjarres 2026-03-26  913  	return ashmem_ioctl(file, cmd, arg);
4b3275bbb3dda0 drivers/staging/android/ashmem.c        Isaac J. Manjarres 2026-03-26  914  }
4b3275bbb3dda0 drivers/staging/android/ashmem.c        Isaac J. Manjarres 2026-03-26  915  #endif
4b3275bbb3dda0 drivers/staging/android/ashmem.c        Isaac J. Manjarres 2026-03-26  916  #ifdef CONFIG_PROC_FS
4b3275bbb3dda0 drivers/staging/android/ashmem.c        Isaac J. Manjarres 2026-03-26  917  static void ashmem_show_fdinfo(struct seq_file *m, struct file *file)
4b3275bbb3dda0 drivers/staging/android/ashmem.c        Isaac J. Manjarres 2026-03-26  918  {
4b3275bbb3dda0 drivers/staging/android/ashmem.c        Isaac J. Manjarres 2026-03-26  919  	struct ashmem_area *asma = file->private_data;
4b3275bbb3dda0 drivers/staging/android/ashmem.c        Isaac J. Manjarres 2026-03-26  920  
4b3275bbb3dda0 drivers/staging/android/ashmem.c        Isaac J. Manjarres 2026-03-26  921  	mutex_lock(&ashmem_mutex);
4b3275bbb3dda0 drivers/staging/android/ashmem.c        Isaac J. Manjarres 2026-03-26  922  
4b3275bbb3dda0 drivers/staging/android/ashmem.c        Isaac J. Manjarres 2026-03-26  923  	if (asma->file)
4b3275bbb3dda0 drivers/staging/android/ashmem.c        Isaac J. Manjarres 2026-03-26 @924  		seq_printf(m, "inode:\t%ld\n", file_inode(asma->file)->i_ino);
4b3275bbb3dda0 drivers/staging/android/ashmem.c        Isaac J. Manjarres 2026-03-26  925  
4b3275bbb3dda0 drivers/staging/android/ashmem.c        Isaac J. Manjarres 2026-03-26  926  	if (asma->name[ASHMEM_NAME_PREFIX_LEN] != '\0')
4b3275bbb3dda0 drivers/staging/android/ashmem.c        Isaac J. Manjarres 2026-03-26  927  		seq_printf(m, "name:\t%s\n",
4b3275bbb3dda0 drivers/staging/android/ashmem.c        Isaac J. Manjarres 2026-03-26  928  			   asma->name + ASHMEM_NAME_PREFIX_LEN);
4b3275bbb3dda0 drivers/staging/android/ashmem.c        Isaac J. Manjarres 2026-03-26  929  
4b3275bbb3dda0 drivers/staging/android/ashmem.c        Isaac J. Manjarres 2026-03-26  930  	seq_printf(m, "size:\t%zu\n", asma->size);
4b3275bbb3dda0 drivers/staging/android/ashmem.c        Isaac J. Manjarres 2026-03-26  931  
4b3275bbb3dda0 drivers/staging/android/ashmem.c        Isaac J. Manjarres 2026-03-26  932  	mutex_unlock(&ashmem_mutex);
4b3275bbb3dda0 drivers/staging/android/ashmem.c        Isaac J. Manjarres 2026-03-26  933  }
4b3275bbb3dda0 drivers/staging/android/ashmem.c        Isaac J. Manjarres 2026-03-26  934  #endif
4b3275bbb3dda0 drivers/staging/android/ashmem.c        Isaac J. Manjarres 2026-03-26  935  static const struct file_operations ashmem_fops = {
4b3275bbb3dda0 drivers/staging/android/ashmem.c        Isaac J. Manjarres 2026-03-26  936  	.owner = THIS_MODULE,
4b3275bbb3dda0 drivers/staging/android/ashmem.c        Isaac J. Manjarres 2026-03-26  937  	.open = ashmem_open,
4b3275bbb3dda0 drivers/staging/android/ashmem.c        Isaac J. Manjarres 2026-03-26  938  	.release = ashmem_release,
4b3275bbb3dda0 drivers/staging/android/ashmem.c        Isaac J. Manjarres 2026-03-26  939  	.read_iter = ashmem_read_iter,
4b3275bbb3dda0 drivers/staging/android/ashmem.c        Isaac J. Manjarres 2026-03-26  940  	.llseek = ashmem_llseek,
4b3275bbb3dda0 drivers/staging/android/ashmem.c        Isaac J. Manjarres 2026-03-26  941  	.mmap = ashmem_mmap,
4b3275bbb3dda0 drivers/staging/android/ashmem.c        Isaac J. Manjarres 2026-03-26  942  	.unlocked_ioctl = ashmem_ioctl,
4b3275bbb3dda0 drivers/staging/android/ashmem.c        Isaac J. Manjarres 2026-03-26  943  #ifdef CONFIG_COMPAT
4b3275bbb3dda0 drivers/staging/android/ashmem.c        Isaac J. Manjarres 2026-03-26  944  	.compat_ioctl = compat_ashmem_ioctl,
4b3275bbb3dda0 drivers/staging/android/ashmem.c        Isaac J. Manjarres 2026-03-26  945  #endif
4b3275bbb3dda0 drivers/staging/android/ashmem.c        Isaac J. Manjarres 2026-03-26  946  #ifdef CONFIG_PROC_FS
4b3275bbb3dda0 drivers/staging/android/ashmem.c        Isaac J. Manjarres 2026-03-26  947  	.show_fdinfo = ashmem_show_fdinfo,
4b3275bbb3dda0 drivers/staging/android/ashmem.c        Isaac J. Manjarres 2026-03-26  948  #endif
4b3275bbb3dda0 drivers/staging/android/ashmem.c        Isaac J. Manjarres 2026-03-26  949  };
4b3275bbb3dda0 drivers/staging/android/ashmem.c        Isaac J. Manjarres 2026-03-26  950  

:::::: The code at line 924 was first introduced by commit
:::::: 4b3275bbb3dda0062c3ba6146b6f56a9234c64da Revert "ANDROID: ashmem: Remove C version of the ashmem driver"

:::::: TO: Isaac J. Manjarres <isaacmanjarres@google.com>
:::::: CC: Treehugger Robot <android-test-infra-autosubmit@system.gserviceaccount.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
