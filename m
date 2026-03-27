Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E14F03BD651
	for <oe-kbuild-all@lists.linux.dev>; Fri, 27 Mar 2026 06:38:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774593490; cv=none; b=ZdtQEFL+b/yxrdGtzMBZZmrj151bEeRx/isrF8o1w3EqEGQh+e2QpkxOqaAXPqmh5KPsQXjIdvPslzTifE8TsbjrMnhJ30bpRt43BIpUWoV2IhmgBLpY1235B9DPF1MPGPOm9g2JL0oPV+xMEfQwFJKXCJCj3f/10xWu3Qd51So=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774593490; c=relaxed/simple;
	bh=tyMX3LXg4anTa4lMF4gwpF8nIwngi77aP2VaOWe8tK8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=H13DWRu0ZPTG48I7rAZvSFCxpsmfWt7m++IdjaQPyl+I+yKuRL1WjoLIOOItnwOYznabxN4mHgAabHqKbqXyCq5TS1Webi34wTx1mKInq4EWNJHau5GslzRR3Kky7XikwO+HIZS9dArzzg7CkdGEBRG+hHii6LEWmTdvyYEbyek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QWdf+BKs; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QWdf+BKs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774593481; x=1806129481;
  h=date:from:to:cc:subject:message-id;
  bh=tyMX3LXg4anTa4lMF4gwpF8nIwngi77aP2VaOWe8tK8=;
  b=QWdf+BKs6NwpjwsHUPMWFqM7xAiLLEBSMCGWsKYK755l3vXM2mgKThGI
   pkfd6/R4pkFpAYJPI5q0y0zyh7dk/bH0SFXZAqsGhUOaVOIltmYEQ4vye
   LEwR66K7EYw/GV53bZ6sjGObZYTzeD6RIiJtddGjRWI8KXl8E3SRHBEV1
   8/exuQJtGw77YRH5boIwj+vgyg0Tohxhho4eIdpRMxQ70C8nvuxP3srrX
   Ez0g3rDAicUJEYmDWFtcHAiAkRn3zpB7V+MjVXCFTUUyOLAQo8fcrJ/7/
   jBbf+Zj6t2cNx4l/kp++NJ60RB74D3O8Gm0HbSI1xxpGPqZQW0yxLYx+q
   A==;
X-CSE-ConnectionGUID: G66i1Z3eQnOfaFUHS6229Q==
X-CSE-MsgGUID: b8mZ1yqaQO2sh0Wxc1zGlQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11741"; a="86357441"
X-IronPort-AV: E=Sophos;i="6.23,143,1770624000"; 
   d="scan'208";a="86357441"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2026 23:37:59 -0700
X-CSE-ConnectionGUID: F4MDUC/YSvKdP9F60zf+lQ==
X-CSE-MsgGUID: aISyuXJDTyqooh4e1nlyAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,143,1770624000"; 
   d="scan'208";a="229296421"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 26 Mar 2026 23:37:57 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w60pO-000000009sH-39zR;
	Fri, 27 Mar 2026 06:37:54 +0000
Date: Fri, 27 Mar 2026 14:37:47 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [axboe:rw_iter 453/525] drivers/gpu/drm/adp/adp_drv.c:85:3:
 error: 'const struct file_operations' has no member named 'read'
Message-ID: <202603271444.h565k7iI-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux.git rw_iter
head:   520344cda122ca1903fafb19768f56509e3db8b1
commit: e3309869a43c350b1fa73f117cf7f86246e70ccc [453/525] fs: finally remove ->read() and ->write() from file_operations
config: arm64-randconfig-003-20260327 (https://download.01.org/0day-ci/archive/20260327/202603271444.h565k7iI-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 9.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260327/202603271444.h565k7iI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603271444.h565k7iI-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/adp/adp_drv.c:85:3: error: 'const struct file_operations' has no member named 'read'
      85 |  .read           = drm_read,
         |   ^~~~
>> drivers/gpu/drm/adp/adp_drv.c:85:20: error: positional initialization of field in 'struct' declared with 'designated_init' attribute [-Werror=designated-init]
      85 |  .read           = drm_read,
         |                    ^~~~~~~~
   drivers/gpu/drm/adp/adp_drv.c:85:20: note: (near initialization for 'adp_fops')
>> drivers/gpu/drm/adp/adp_drv.c:85:20: error: initialization of 'long int (*)(struct file *, unsigned int,  long unsigned int)' from incompatible pointer type 'ssize_t (*)(struct kiocb *, struct iov_iter *)' {aka 'long int (*)(struct kiocb *, struct iov_iter *)'} [-Werror=incompatible-pointer-types]
   drivers/gpu/drm/adp/adp_drv.c:85:20: note: (near initialization for 'adp_fops.unlocked_ioctl')
   drivers/gpu/drm/adp/adp_drv.c:85:20: warning: initialized field overwritten [-Woverride-init]
   drivers/gpu/drm/adp/adp_drv.c:85:20: note: (near initialization for 'adp_fops.unlocked_ioctl')
   cc1: some warnings being treated as errors


vim +85 drivers/gpu/drm/adp/adp_drv.c

332122eba628d5 Sasha Finkelstein 2025-02-24  77  
332122eba628d5 Sasha Finkelstein 2025-02-24  78  static const struct file_operations adp_fops = {
332122eba628d5 Sasha Finkelstein 2025-02-24  79  	.owner          = THIS_MODULE,
332122eba628d5 Sasha Finkelstein 2025-02-24  80  	.open           = adp_open,
332122eba628d5 Sasha Finkelstein 2025-02-24  81  	.release        = drm_release,
332122eba628d5 Sasha Finkelstein 2025-02-24  82  	.unlocked_ioctl = drm_ioctl,
332122eba628d5 Sasha Finkelstein 2025-02-24  83  	.compat_ioctl   = drm_compat_ioctl,
332122eba628d5 Sasha Finkelstein 2025-02-24  84  	.poll           = drm_poll,
01dd04d608e847 Jens Axboe        2026-03-04 @85  	.read           = drm_read,
332122eba628d5 Sasha Finkelstein 2025-02-24  86  	.llseek         = noop_llseek,
332122eba628d5 Sasha Finkelstein 2025-02-24  87  	.mmap           = drm_gem_mmap,
332122eba628d5 Sasha Finkelstein 2025-02-24  88  	.fop_flags      = FOP_UNSIGNED_OFFSET,
332122eba628d5 Sasha Finkelstein 2025-02-24  89  	DRM_GEM_DMA_UNMAPPED_AREA_FOPS
332122eba628d5 Sasha Finkelstein 2025-02-24  90  };
332122eba628d5 Sasha Finkelstein 2025-02-24  91  

:::::: The code at line 85 was first introduced by commit
:::::: 01dd04d608e847467c9faf9cd5959e56fa8947bf drm: convert remaining fops to read/write iterators

:::::: TO: Jens Axboe <axboe@kernel.dk>
:::::: CC: Jens Axboe <axboe@kernel.dk>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
