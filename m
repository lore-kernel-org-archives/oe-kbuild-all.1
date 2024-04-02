Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E18315B12B
	for <oe-kbuild-all@lists.linux.dev>; Tue,  2 Apr 2024 18:58:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712084329; cv=none; b=nUOKiAo0DE6HmTooSchUCnY2yZnC0RUh2FzlSp56LysynJRuaL+OJgE/ICMNbsc14FbPcm9foxbTRE9EITqX+azTZqgpZNktZCrn3NQsGChbxcRpyz5qj+ZeE3pzTqwun/5ndg+nqCn5g1EzdiyovnDLDnZgPVERfaJ2YyxND5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712084329; c=relaxed/simple;
	bh=WDros/Wdz1x6mKOVE+UYycaXkiFNPvPWCkd5FchxvRk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gT/SMRmcmd6vJXMfJ6XTREVQIzTvs4h8GP89JeI3za/HCXGIyQAftQY0JpOGryUg84NSYneWnyOrbJ3qWKEO/8vBUo7V1ZkcL8S6SNdnsMV6iqC+6zhtUPEHMtXz4kDXiVP5Xw6Ip3/lPgwxI7ES8Faad/IsJm81y68ec7rDsWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=oFQ7WsoH; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="oFQ7WsoH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712084327; x=1743620327;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WDros/Wdz1x6mKOVE+UYycaXkiFNPvPWCkd5FchxvRk=;
  b=oFQ7WsoHmxFlT6fA1KXfxUoussWyzl/VXG+UsIJ3QbVq7wzYZPtKTrSI
   fYbh8Gb6UG7YGw4tqAd2zUPMjcTd5MkqrzsB5x/grR6QsVzBElVFnVN3H
   NlPzyUQdcw+2igOqTRpbAhGdSj5jXfT6p+ehqKcQCI5Um0hEZR8Pyd4Ma
   SankrJ1X+1nu0sfWawKsK00d0oDY4VQIIUmrqi8b6DlsvGM2pdg4JaEi0
   Ct/uU0bhjg+YIqO3WdwxXv8FVFgKFLCm1JRXWFWXLUlCKVfQHK2su5KQf
   0KY5ILImzeBsnrZLGf286RFcKHN0yUo4gMqtZSkLRKR6N+Hx0PaYpH0ra
   g==;
X-CSE-ConnectionGUID: 2dxeQupTRq67DZe//+sfKQ==
X-CSE-MsgGUID: 3wWB0be8Q9qe2AgnyI5wmw==
X-IronPort-AV: E=McAfee;i="6600,9927,11032"; a="18435807"
X-IronPort-AV: E=Sophos;i="6.07,175,1708416000"; 
   d="scan'208";a="18435807"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2024 11:58:46 -0700
X-CSE-ConnectionGUID: A6QCi3wuR8iVS3pVoYeqtA==
X-CSE-MsgGUID: NX7Q2buISsiDIWdzLuh/lQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,175,1708416000"; 
   d="scan'208";a="18629874"
Received: from lkp-server02.sh.intel.com (HELO 90ee3aa53dbd) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 02 Apr 2024 11:58:44 -0700
Received: from kbuild by 90ee3aa53dbd with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rrjLG-0001Ru-0N;
	Tue, 02 Apr 2024 18:58:42 +0000
Date: Wed, 3 Apr 2024 02:58:21 +0800
From: kernel test robot <lkp@intel.com>
To: Boris Brezillon <bbrezillon@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, dri-devel@lists.freedesktop.org,
	Liviu Dudau <liviu.dudau@arm.com>,
	Steven Price <steven.price@arm.com>
Subject: [drm-misc:for-linux-next 3/4]
 drivers/gpu/drm/panthor/panthor_device.h:326:13: warning: unused variable
 'cookie'
Message-ID: <202404030209.n8lhzYfk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://anongit.freedesktop.org/drm/drm-misc for-linux-next
head:   10021ef27310279c850cf6cb38542c443a995e92
commit: 962f88b9c91647f3ff4a0d3709662641baed5164 [3/4] drm/panthor: Drop the dev_enter/exit() sections in _irq_suspend/resume()
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20240403/202404030209.n8lhzYfk-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240403/202404030209.n8lhzYfk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404030209.n8lhzYfk-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/gpu/drm/panthor/panthor_fw.c:19:
   drivers/gpu/drm/panthor/panthor_fw.c: In function 'panthor_job_irq_suspend':
>> drivers/gpu/drm/panthor/panthor_device.h:326:13: warning: unused variable 'cookie' [-Wunused-variable]
     326 |         int cookie;                                                                             \
         |             ^~~~~~
   drivers/gpu/drm/panthor/panthor_fw.c:979:1: note: in expansion of macro 'PANTHOR_IRQ_HANDLER'
     979 | PANTHOR_IRQ_HANDLER(job, JOB, panthor_job_irq_handler);
         | ^~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/panthor/panthor_fw.c: In function 'panthor_job_irq_resume':
   drivers/gpu/drm/panthor/panthor_device.h:336:13: warning: unused variable 'cookie' [-Wunused-variable]
     336 |         int cookie;                                                                             \
         |             ^~~~~~
   drivers/gpu/drm/panthor/panthor_fw.c:979:1: note: in expansion of macro 'PANTHOR_IRQ_HANDLER'
     979 | PANTHOR_IRQ_HANDLER(job, JOB, panthor_job_irq_handler);
         | ^~~~~~~~~~~~~~~~~~~
--
   In file included from drivers/gpu/drm/panthor/panthor_gpu.c:19:
   drivers/gpu/drm/panthor/panthor_gpu.c: In function 'panthor_gpu_irq_suspend':
>> drivers/gpu/drm/panthor/panthor_device.h:326:13: warning: unused variable 'cookie' [-Wunused-variable]
     326 |         int cookie;                                                                             \
         |             ^~~~~~
   drivers/gpu/drm/panthor/panthor_gpu.c:166:1: note: in expansion of macro 'PANTHOR_IRQ_HANDLER'
     166 | PANTHOR_IRQ_HANDLER(gpu, GPU, panthor_gpu_irq_handler);
         | ^~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/panthor/panthor_gpu.c: In function 'panthor_gpu_irq_resume':
   drivers/gpu/drm/panthor/panthor_device.h:336:13: warning: unused variable 'cookie' [-Wunused-variable]
     336 |         int cookie;                                                                             \
         |             ^~~~~~
   drivers/gpu/drm/panthor/panthor_gpu.c:166:1: note: in expansion of macro 'PANTHOR_IRQ_HANDLER'
     166 | PANTHOR_IRQ_HANDLER(gpu, GPU, panthor_gpu_irq_handler);
         | ^~~~~~~~~~~~~~~~~~~
--
   In file included from drivers/gpu/drm/panthor/panthor_mmu.c:30:
   drivers/gpu/drm/panthor/panthor_mmu.c: In function 'panthor_mmu_irq_suspend':
>> drivers/gpu/drm/panthor/panthor_device.h:326:13: warning: unused variable 'cookie' [-Wunused-variable]
     326 |         int cookie;                                                                             \
         |             ^~~~~~
   drivers/gpu/drm/panthor/panthor_mmu.c:1689:1: note: in expansion of macro 'PANTHOR_IRQ_HANDLER'
    1689 | PANTHOR_IRQ_HANDLER(mmu, MMU, panthor_mmu_irq_handler);
         | ^~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/panthor/panthor_mmu.c: In function 'panthor_mmu_irq_resume':
   drivers/gpu/drm/panthor/panthor_device.h:336:13: warning: unused variable 'cookie' [-Wunused-variable]
     336 |         int cookie;                                                                             \
         |             ^~~~~~
   drivers/gpu/drm/panthor/panthor_mmu.c:1689:1: note: in expansion of macro 'PANTHOR_IRQ_HANDLER'
    1689 | PANTHOR_IRQ_HANDLER(mmu, MMU, panthor_mmu_irq_handler);
         | ^~~~~~~~~~~~~~~~~~~


vim +/cookie +326 drivers/gpu/drm/panthor/panthor_device.h

5fe909cae118a7 Boris Brezillon 2024-02-29  271  
5fe909cae118a7 Boris Brezillon 2024-02-29  272  const char *panthor_exception_name(struct panthor_device *ptdev,
5fe909cae118a7 Boris Brezillon 2024-02-29  273  				   u32 exception_code);
5fe909cae118a7 Boris Brezillon 2024-02-29  274  
5fe909cae118a7 Boris Brezillon 2024-02-29  275  /**
5fe909cae118a7 Boris Brezillon 2024-02-29  276   * PANTHOR_IRQ_HANDLER() - Define interrupt handlers and the interrupt
5fe909cae118a7 Boris Brezillon 2024-02-29  277   * registration function.
5fe909cae118a7 Boris Brezillon 2024-02-29  278   *
5fe909cae118a7 Boris Brezillon 2024-02-29  279   * The boiler-plate to gracefully deal with shared interrupts is
5fe909cae118a7 Boris Brezillon 2024-02-29  280   * auto-generated. All you have to do is call PANTHOR_IRQ_HANDLER()
5fe909cae118a7 Boris Brezillon 2024-02-29  281   * just after the actual handler. The handler prototype is:
5fe909cae118a7 Boris Brezillon 2024-02-29  282   *
5fe909cae118a7 Boris Brezillon 2024-02-29  283   * void (*handler)(struct panthor_device *, u32 status);
5fe909cae118a7 Boris Brezillon 2024-02-29  284   */
5fe909cae118a7 Boris Brezillon 2024-02-29  285  #define PANTHOR_IRQ_HANDLER(__name, __reg_prefix, __handler)					\
5fe909cae118a7 Boris Brezillon 2024-02-29  286  static irqreturn_t panthor_ ## __name ## _irq_raw_handler(int irq, void *data)			\
5fe909cae118a7 Boris Brezillon 2024-02-29  287  {												\
5fe909cae118a7 Boris Brezillon 2024-02-29  288  	struct panthor_irq *pirq = data;							\
5fe909cae118a7 Boris Brezillon 2024-02-29  289  	struct panthor_device *ptdev = pirq->ptdev;						\
5fe909cae118a7 Boris Brezillon 2024-02-29  290  												\
5fe909cae118a7 Boris Brezillon 2024-02-29  291  	if (atomic_read(&pirq->suspended))							\
5fe909cae118a7 Boris Brezillon 2024-02-29  292  		return IRQ_NONE;								\
5fe909cae118a7 Boris Brezillon 2024-02-29  293  	if (!gpu_read(ptdev, __reg_prefix ## _INT_STAT))					\
5fe909cae118a7 Boris Brezillon 2024-02-29  294  		return IRQ_NONE;								\
5fe909cae118a7 Boris Brezillon 2024-02-29  295  												\
5fe909cae118a7 Boris Brezillon 2024-02-29  296  	gpu_write(ptdev, __reg_prefix ## _INT_MASK, 0);						\
5fe909cae118a7 Boris Brezillon 2024-02-29  297  	return IRQ_WAKE_THREAD;									\
5fe909cae118a7 Boris Brezillon 2024-02-29  298  }												\
5fe909cae118a7 Boris Brezillon 2024-02-29  299  												\
5fe909cae118a7 Boris Brezillon 2024-02-29  300  static irqreturn_t panthor_ ## __name ## _irq_threaded_handler(int irq, void *data)		\
5fe909cae118a7 Boris Brezillon 2024-02-29  301  {												\
5fe909cae118a7 Boris Brezillon 2024-02-29  302  	struct panthor_irq *pirq = data;							\
5fe909cae118a7 Boris Brezillon 2024-02-29  303  	struct panthor_device *ptdev = pirq->ptdev;						\
5fe909cae118a7 Boris Brezillon 2024-02-29  304  	irqreturn_t ret = IRQ_NONE;								\
5fe909cae118a7 Boris Brezillon 2024-02-29  305  												\
5fe909cae118a7 Boris Brezillon 2024-02-29  306  	while (true) {										\
5fe909cae118a7 Boris Brezillon 2024-02-29  307  		u32 status = gpu_read(ptdev, __reg_prefix ## _INT_RAWSTAT) & pirq->mask;	\
5fe909cae118a7 Boris Brezillon 2024-02-29  308  												\
5fe909cae118a7 Boris Brezillon 2024-02-29  309  		if (!status)									\
5fe909cae118a7 Boris Brezillon 2024-02-29  310  			break;									\
5fe909cae118a7 Boris Brezillon 2024-02-29  311  												\
5fe909cae118a7 Boris Brezillon 2024-02-29  312  		gpu_write(ptdev, __reg_prefix ## _INT_CLEAR, status);				\
5fe909cae118a7 Boris Brezillon 2024-02-29  313  												\
5fe909cae118a7 Boris Brezillon 2024-02-29  314  		__handler(ptdev, status);							\
5fe909cae118a7 Boris Brezillon 2024-02-29  315  		ret = IRQ_HANDLED;								\
5fe909cae118a7 Boris Brezillon 2024-02-29  316  	}											\
5fe909cae118a7 Boris Brezillon 2024-02-29  317  												\
5fe909cae118a7 Boris Brezillon 2024-02-29  318  	if (!atomic_read(&pirq->suspended))							\
5fe909cae118a7 Boris Brezillon 2024-02-29  319  		gpu_write(ptdev, __reg_prefix ## _INT_MASK, pirq->mask);			\
5fe909cae118a7 Boris Brezillon 2024-02-29  320  												\
5fe909cae118a7 Boris Brezillon 2024-02-29  321  	return ret;										\
5fe909cae118a7 Boris Brezillon 2024-02-29  322  }												\
5fe909cae118a7 Boris Brezillon 2024-02-29  323  												\
5fe909cae118a7 Boris Brezillon 2024-02-29  324  static inline void panthor_ ## __name ## _irq_suspend(struct panthor_irq *pirq)			\
5fe909cae118a7 Boris Brezillon 2024-02-29  325  {												\
5fe909cae118a7 Boris Brezillon 2024-02-29 @326  	int cookie;										\
5fe909cae118a7 Boris Brezillon 2024-02-29  327  												\
1de434e0b27570 Boris Brezillon 2024-03-26  328  	pirq->mask = 0;										\
5fe909cae118a7 Boris Brezillon 2024-02-29  329  	gpu_write(pirq->ptdev, __reg_prefix ## _INT_MASK, 0);					\
5fe909cae118a7 Boris Brezillon 2024-02-29  330  	synchronize_irq(pirq->irq);								\
1de434e0b27570 Boris Brezillon 2024-03-26  331  	atomic_set(&pirq->suspended, true);							\
5fe909cae118a7 Boris Brezillon 2024-02-29  332  }												\
5fe909cae118a7 Boris Brezillon 2024-02-29  333  												\
5fe909cae118a7 Boris Brezillon 2024-02-29  334  static inline void panthor_ ## __name ## _irq_resume(struct panthor_irq *pirq, u32 mask)	\
5fe909cae118a7 Boris Brezillon 2024-02-29  335  {												\
5fe909cae118a7 Boris Brezillon 2024-02-29  336  	int cookie;										\
5fe909cae118a7 Boris Brezillon 2024-02-29  337  												\
5fe909cae118a7 Boris Brezillon 2024-02-29  338  	atomic_set(&pirq->suspended, false);							\
5fe909cae118a7 Boris Brezillon 2024-02-29  339  	pirq->mask = mask;									\
5fe909cae118a7 Boris Brezillon 2024-02-29  340  	gpu_write(pirq->ptdev, __reg_prefix ## _INT_CLEAR, mask);				\
5fe909cae118a7 Boris Brezillon 2024-02-29  341  	gpu_write(pirq->ptdev, __reg_prefix ## _INT_MASK, mask);				\
5fe909cae118a7 Boris Brezillon 2024-02-29  342  }												\
5fe909cae118a7 Boris Brezillon 2024-02-29  343  												\
5fe909cae118a7 Boris Brezillon 2024-02-29  344  static int panthor_request_ ## __name ## _irq(struct panthor_device *ptdev,			\
5fe909cae118a7 Boris Brezillon 2024-02-29  345  					      struct panthor_irq *pirq,				\
5fe909cae118a7 Boris Brezillon 2024-02-29  346  					      int irq, u32 mask)				\
5fe909cae118a7 Boris Brezillon 2024-02-29  347  {												\
5fe909cae118a7 Boris Brezillon 2024-02-29  348  	pirq->ptdev = ptdev;									\
5fe909cae118a7 Boris Brezillon 2024-02-29  349  	pirq->irq = irq;									\
5fe909cae118a7 Boris Brezillon 2024-02-29  350  	panthor_ ## __name ## _irq_resume(pirq, mask);						\
5fe909cae118a7 Boris Brezillon 2024-02-29  351  												\
5fe909cae118a7 Boris Brezillon 2024-02-29  352  	return devm_request_threaded_irq(ptdev->base.dev, irq,					\
5fe909cae118a7 Boris Brezillon 2024-02-29  353  					 panthor_ ## __name ## _irq_raw_handler,		\
5fe909cae118a7 Boris Brezillon 2024-02-29  354  					 panthor_ ## __name ## _irq_threaded_handler,		\
5fe909cae118a7 Boris Brezillon 2024-02-29  355  					 IRQF_SHARED, KBUILD_MODNAME "-" # __name,		\
5fe909cae118a7 Boris Brezillon 2024-02-29  356  					 pirq);							\
5fe909cae118a7 Boris Brezillon 2024-02-29  357  }
5fe909cae118a7 Boris Brezillon 2024-02-29  358  

:::::: The code at line 326 was first introduced by commit
:::::: 5fe909cae118a757a77afb37174b99436a36d2e2 drm/panthor: Add the device logical block

:::::: TO: Boris Brezillon <boris.brezillon@collabora.com>
:::::: CC: Boris Brezillon <boris.brezillon@collabora.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
