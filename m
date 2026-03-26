Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA6C12DCC05
	for <oe-kbuild-all@lists.linux.dev>; Thu, 26 Mar 2026 01:13:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774487632; cv=none; b=bQPHPYK1DPgZtVGMdFBMDM42fcv5O+jiMKXlDGWU2tzbejNvx/Uyubxx78XrZNwuUtXxuWJTWRxR11qPUNifOvSISUIppda3Wp3wFe+Q8EXM4CYXJ4sTUIjcZS+RZPmCImd1PKL8K6otNutR13sXuw1lpfcjOXrrMSxv+haLFqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774487632; c=relaxed/simple;
	bh=mKKZ1ZREsyU+zPJ1I1FpC3WPYVAO6hbkWns/boQBcsU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=QxVah1ILjrWmbKWyIWNyPzRYFKVp1rgc5j087636s5RMRQjA2bnCOz1ZSDx2FCyQwa1Jw2odumaPklrkJzZh4vdtaS8vkZqL/2l5WtJYFD7WAS0p+p0CRrBaxrlfBTJbiBYFVxi8EqSUfoG0wwpA+dWklxQdO79v3yJDl6Wyiq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=W0FSXDbi; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="W0FSXDbi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774487630; x=1806023630;
  h=date:from:to:cc:subject:message-id;
  bh=mKKZ1ZREsyU+zPJ1I1FpC3WPYVAO6hbkWns/boQBcsU=;
  b=W0FSXDbiPGV4hs7GE23Qrd5X/ZrHHt36Jk1J6N4SWN9y1/d7B0Rj+jnK
   dKQOMunfrGebF+AFCJgyCpBvIcYJ/RiUMpnq2t4CjGqHdGZFvyRK2yhZZ
   RQoUtKKaxp8jQ3MptnmOs1JBYXixovdpVG72d9fz1e6GBDVQji0+vLY55
   FZ9HlYplLr6MIpFKjQ+f2UGzmbx0gZ2tKBjblhKGoe8zRtL4DtuGguNKI
   brXga9/Yh7egs1lTVXa87w8m2L8ZDDiNGDtxkd92VpeQt+xvBO4yP+twv
   jLW1ThnZyZMpGaW2LuHgYMaHrFTKTO42VGy5ppXSiSzZp1NNDZ93rvseN
   g==;
X-CSE-ConnectionGUID: qhqncpsdTFWpc0qHytU6NQ==
X-CSE-MsgGUID: V939dOxuQzWzp7H132nwyA==
X-IronPort-AV: E=McAfee;i="6800,10657,11740"; a="75425205"
X-IronPort-AV: E=Sophos;i="6.23,141,1770624000"; 
   d="scan'208";a="75425205"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2026 18:13:50 -0700
X-CSE-ConnectionGUID: KFKjuaKjTVqm7ADniuwWjw==
X-CSE-MsgGUID: 6HTD0itjRzelvgFDx0GJ3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,141,1770624000"; 
   d="scan'208";a="229305704"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 25 Mar 2026 18:13:49 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w5ZI9-000000007x3-47iX;
	Thu, 26 Mar 2026 01:13:45 +0000
Date: Thu, 26 Mar 2026 09:13:32 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-desktop 36/36]
 drivers/block/zram/zram_ioctl.c:128:23: error: alignment may not be specified
 for 'pidfd'
Message-ID: <202603260907.3cpvyJ4i-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android16-6.12-desktop
head:   f7b5f6381c3c4402de70d091e7db40ef4606c7c4
commit: 160a4092db67397d85b790f102f375ae0e045257 [36/36] ANDROID: zram: Add ZRAM_ANDROID_IOC_PROCESS_PREFETCH ioctl
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20260326/202603260907.3cpvyJ4i-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260326/202603260907.3cpvyJ4i-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603260907.3cpvyJ4i-lkp@intel.com/

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
