Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83944357735
	for <oe-kbuild-all@lists.linux.dev>; Tue,  7 Apr 2026 04:02:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775534560; cv=none; b=Q0zkgoHqMOfz4kGVsnPQKMiCpxHXEIKBWmKh6a4g0YpbC0hegA/xvgIGtCYXPnNrqTtV3/4ApWSY8zVlktd2AuPneLlY4Vk0mEVe+f0n8Gk4njflyvvYPL4xn84WWj+j3P+wi4tjaKBOH6zJjsb0xwF+nADkPklZekwW06yQcUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775534560; c=relaxed/simple;
	bh=Rk9akMV1ewq1RA8dV/e8ARL3U2nto2FR0ELUCH8UOY4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=bf/fVZ+z8vMEVYpwXa81SbXMUzfGu61nSgi2MHvBnn5bGIhHWENtg02l0vpwrvNRy8n4WGMrJlgmwOyzfnmlgGbIgbrthbr3QRUQbSMTGAovXgVO8wEvjkEDlrzA1kVrkAOfoRZig0CnWzo89eKkplVKil2bzlKvdWYUQ5QIqew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cGEB3ppf; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cGEB3ppf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775534560; x=1807070560;
  h=date:from:to:cc:subject:message-id;
  bh=Rk9akMV1ewq1RA8dV/e8ARL3U2nto2FR0ELUCH8UOY4=;
  b=cGEB3ppfF1NiM5YjDNOlljG7Lu2VGmOVvtSJBoiXnMQSwGTtCJZTsn/3
   qKJd2Y+I1arYO29vQmNLi5W4bnorOIVPtrQ7EiUd5yJRWGf7VOwdq8Kw7
   MOv8SpF9kQ8xoIdCH58qnlfc/nBYlKdJOEB1p0XZnE1JzNRsvnkv/FseO
   YInXs05qse7n15AJH+kf6nBFHDfhM6kOWZrDVYCPutbQMeYMocxU67qvq
   jdGEd70+hISw8L2tJCgwkzsAGvnaSaP36U4VYcCIm8267MSEYc0FcsCZY
   Nm50u3LWnOhHcbPqLi+LGUIBvLUxIY8OFjBTTT1OjxgN+lVpc3sfb6jOd
   g==;
X-CSE-ConnectionGUID: 7HHug42/RReokxiKGZUFOA==
X-CSE-MsgGUID: Y9V5XcVbQPmWJkkjqMdgGA==
X-IronPort-AV: E=McAfee;i="6800,10657,11751"; a="76386020"
X-IronPort-AV: E=Sophos;i="6.23,164,1770624000"; 
   d="scan'208";a="76386020"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2026 21:02:38 -0700
X-CSE-ConnectionGUID: hDN5JaADSR+G6kSUFiuj2Q==
X-CSE-MsgGUID: m/ZRTmsfRgqGZwFzPaZW0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,164,1770624000"; 
   d="scan'208";a="227957161"
Received: from lkp-server01.sh.intel.com (HELO d00eb8a6782a) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 06 Apr 2026 21:02:36 -0700
Received: from kbuild by d00eb8a6782a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w9xe5-00000000087-3c6R;
	Tue, 07 Apr 2026 04:02:33 +0000
Date: Tue, 07 Apr 2026 12:01:51 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-desktop 36/36]
 drivers/block/zram/zram_ioctl.c:128:23: error: alignment may not be specified
 for 'pidfd'
Message-ID: <202604060832.eGI4CqSI-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Richard,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android16-6.12-desktop
head:   80789ec92e27cff976d5fc1f92a536be1bb3b14c
commit: 160a4092db67397d85b790f102f375ae0e045257 [36/36] ANDROID: zram: Add ZRAM_ANDROID_IOC_PROCESS_PREFETCH ioctl
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20260406/202604060832.eGI4CqSI-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260406/202604060832.eGI4CqSI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604060832.eGI4CqSI-lkp@intel.com/

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
