Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4348625
	for <oe-kbuild-all@lists.linux.dev>; Sun,  3 May 2026 00:08:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777766930; cv=none; b=vEC8iNIBzacuNSchfNgKUSut1ztmd95Ai1yupOiteQMCVwtbedD/SfSfeKvK1fdkYATvdX14lxWTH+XpTcut+kIV9XweCARlp2Kf+bqb7Yzzwt6YEj6fbjzi8kjP0O4cltKDA0I8x+4U4qVHCCn8npdogCzPuglPpIiZeNhOhxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777766930; c=relaxed/simple;
	bh=4WrvdrFksmJcMTc/99PSk9lsxfxZdH0Ns6myASq/3Pk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ho92rwLS0hn4wks3ZSGIkUsGsCqz8nfI6/CGfNWp6sGrxY12PS1OAGmZ3SmBsg7Bn5m+Igo3RfE46A/sK3BBPd+QtU1BP00LKAtEYVCrkMPwafQdRC6fK9t/Jp+lp9Py0oP5FL4TGc885KqEHXzlbxxy4uRxqmDF9GEFNMWwClM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HqqQPdbf; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HqqQPdbf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777766929; x=1809302929;
  h=date:from:to:cc:subject:message-id;
  bh=4WrvdrFksmJcMTc/99PSk9lsxfxZdH0Ns6myASq/3Pk=;
  b=HqqQPdbfx1bzzsyKUJBAzjyjoCZO+kH1hZv7hQISjqN6JxL2wnug8yum
   V/R3NCMQualXdbDqQTVlh0PPaD1b0Yg98OblQO8xhKh8NKvLsnLuvH6Ff
   h9cGCPdobBbyDgxTBx84GfP5MBFBWrpvwjohgCj2MpoNgxT4mqJKcm1s1
   M9iO1Z/KTL+UH2Ake3H+dNrT1G7hdatkPGgOexZjvrFqHVP/KpR4NBeL5
   he/w6HtsjuMkv1PZkHYAQjLzFKNqscpysCK3Vd2tykAs1Rf1Cjcu30xTz
   mrf5ASs4vfOwZOkw3x6tdiAC5YE69XBGvMiZie00fQc3c+yUExPWvPowa
   A==;
X-CSE-ConnectionGUID: Hup7FAmkSPKiHawo98N6WA==
X-CSE-MsgGUID: OcWKSucNSLWpCvHtBWPczw==
X-IronPort-AV: E=McAfee;i="6800,10657,11774"; a="77842280"
X-IronPort-AV: E=Sophos;i="6.23,212,1770624000"; 
   d="scan'208";a="77842280"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 May 2026 17:08:48 -0700
X-CSE-ConnectionGUID: onU2rVUuTB+5sAUSc+F6Zw==
X-CSE-MsgGUID: xT0uolkWTdqBYVfj7yqFPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,212,1770624000"; 
   d="scan'208";a="273281125"
Received: from lkp-server01.sh.intel.com (HELO 781826d00641) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 02 May 2026 17:08:47 -0700
Received: from kbuild by 781826d00641 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wJKO4-000000001vf-1aJZ;
	Sun, 03 May 2026 00:08:44 +0000
Date: Sun, 03 May 2026 08:08:06 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-2026-03 1/1]
 drivers/block/zram/zram_ioctl.c:128:23: error: alignment may not be specified
 for 'pidfd'
Message-ID: <202605030729.RJZ7T9Go-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android16-6.12-2026-03
head:   af91b3a15f39c51c11eb9f95702c8cb351a4f488
commit: bb39a9ace3eece55e88caf4ef221550fb778edbd [1/1] ANDROID: zram: Add ZRAM_ANDROID_IOC_PROCESS_PREFETCH ioctl
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20260503/202605030729.RJZ7T9Go-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260503/202605030729.RJZ7T9Go-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605030729.RJZ7T9Go-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/block/zram/zram_ioctl.c:128:23: error: alignment may not be specified for 'pidfd'
     128 |         __aligned_u64 pidfd,

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for INTEL_MEI_ME
   Depends on [n]: X86 && PCI [=y]
   Selected by [y]:
   - INTEL_MEI_HDCP [=y] && (DRM_I915 [=n] || DRM_XE [=y])
   - INTEL_MEI_PXP [=y] && (DRM_I915 [=n] || DRM_XE [=y])


vim +/pidfd +128 drivers/block/zram/zram_ioctl.c

   126	
   127	static int zram_ioctl_process_scan(struct zram *zram, unsigned int cmd,
 > 128		__aligned_u64 pidfd,
   129		struct zram_android_ioc_process_range_writeback *prwb,
   130		struct zram_pp_ctl *ctl)
   131	{
   132		struct mm_struct *mm;
   133		struct vm_area_struct *vma;
   134		struct task_struct *task;
   135		unsigned long start_addr = 0;
   136		u64 nr_remaining_pages = 0;
   137		unsigned int f_flags;
   138		int ret = 0;
   139	
   140		struct zram_process_walk_private private = {
   141			.zram = zram,
   142			.pp_ctl = ctl,
   143			.cmd = cmd,
   144		};
   145	
   146		if (cmd == ZRAM_ANDROID_IOC_PROCESS_RANGE_WRITEBACK) {
   147			start_addr = (unsigned long)prwb->start_addr;
   148			nr_remaining_pages = DIV_ROUND_UP_POW2(prwb->size, PAGE_SIZE);
   149		}
   150	
   151		if (!nr_remaining_pages)
   152			private.nr_remaining_pages = NR_PAGES_UNLIMITED;
   153		else
   154			private.nr_remaining_pages = nr_remaining_pages;
   155	
   156		task = pidfd_get_task(pidfd, &f_flags);
   157		if (IS_ERR(task))
   158			return PTR_ERR(task);
   159	
   160		mm = get_task_mm(task);
   161		if (!mm) {
   162			ret = -ESRCH;
   163			goto release_task;
   164		}
   165	
   166		if (start_addr >= mm->task_size) {
   167			ret = -EINVAL;
   168			goto release_mm;
   169		}
   170	
   171		if (!IS_ALIGNED(start_addr, PAGE_SIZE)) {
   172			ret = -EINVAL;
   173			goto release_mm;
   174		}
   175	
   176		VMA_ITERATOR(vmi, mm, start_addr);
   177		/* Iterates through all the VMAs of the process */
   178		mmap_read_lock(mm);
   179		for_each_vma(vmi, vma) {
   180			unsigned long start = max(vma->vm_start, start_addr);
   181	
   182			if (!vma_is_anonymous(vma) && (!can_do_file_pageout(vma) &&
   183						       (vma->vm_flags & VM_MAYSHARE)))
   184				continue;
   185	
   186			ret = walk_page_range(mm, start, vma->vm_end,
   187					      &zram_walk_ops, &private);
   188			if (ret)
   189				break;
   190		}
   191	
   192		if (cmd == ZRAM_ANDROID_IOC_PROCESS_RANGE_WRITEBACK) {
   193			if (ret > 0) {
   194				prwb->next_addr = private.next_addr;
   195				ret = 0;
   196			} else {
   197				prwb->next_addr = 0;
   198			}
   199		}
   200	
   201		mmap_read_unlock(mm);
   202	release_mm:
   203		mmput(mm);
   204	release_task:
   205		put_task_struct(task);
   206	
   207		return ret;
   208	}
   209	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
