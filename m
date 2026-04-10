Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4E9C392C4C
	for <oe-kbuild-all@lists.linux.dev>; Fri, 10 Apr 2026 23:58:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775865510; cv=none; b=el+QftjyPeARNkQMZwERWXKq0mvp+GU1Yq7hYSDORjJEXtkQT8HhWN03sE0gxUswYCYg1rTYR7eIQNJej0RepEVbeVbQvzRomkvsoMbOX/l7/eAgp7znBfsvn6ghUm7v8ST26dKmwyW7xMiAbTD4TMOu+Rg8xQyGW7IJzdywSxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775865510; c=relaxed/simple;
	bh=xJcFJimhQcUIYX9/XNOZ6LCJx4RPR8HEdJxJXsHfLcE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=OISdC1Z0edDsd7It3pFofCQPlQjQuSU/QMhYRNThItKkKsxPjif/5iHX/lYF+tbSPn+6vWuu2CQVO3pBYcoWd2kHDD7yPqTiEvZ6GHfZbq0rc8C/wh+QV/EU6jDXf9lcNWt2P5jCBToktFUnfhh5SKuO2AmWqjZWn4lq02Fevls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HMpERiGC; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HMpERiGC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775865509; x=1807401509;
  h=date:from:to:cc:subject:message-id;
  bh=xJcFJimhQcUIYX9/XNOZ6LCJx4RPR8HEdJxJXsHfLcE=;
  b=HMpERiGCy5qhFJfWwLF+baORTmUcxFmah2l9hi+D8c7jx7u6C/UoirIv
   NsFb+1l43bAmreO+jSHg+te5IejXCeGKwBNTk0QVE+AqxWgdB47h6rva1
   P/M2SuP9N0/oQBQZ5aow0r7i47aa7ak7y8f26QkxemAqIZflFVGUjkQ4s
   WVLZiwzixzdxy5V+55BoXySWBbe6xf7PUpfrsNnFaMRWe+oPMHR5Z79LI
   2DYORmNZHDGgZmPGzhboz8kfxSO6OfrsFb8S/dI5oAkE3o4C54131j7YA
   yQmghV00o1faeTe91YA84W8WX7bUR5HPrj+50bFE4xBpmMfXikDVGN+3P
   Q==;
X-CSE-ConnectionGUID: WbmImNh8Sn2Y/uO6KK8mKw==
X-CSE-MsgGUID: 2ABqlEqbSp2tG47X4FxEUA==
X-IronPort-AV: E=McAfee;i="6800,10657,11755"; a="88334398"
X-IronPort-AV: E=Sophos;i="6.23,172,1770624000"; 
   d="scan'208";a="88334398"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2026 16:58:27 -0700
X-CSE-ConnectionGUID: 65PndMwiRFGtcaB0R4NmdA==
X-CSE-MsgGUID: IsvrQkHPR6KyH33dJMiXpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,172,1770624000"; 
   d="scan'208";a="252616186"
Received: from lkp-server01.sh.intel.com (HELO 3eaaf1a74b89) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 10 Apr 2026 16:58:25 -0700
Received: from kbuild by 3eaaf1a74b89 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wBLjz-000000000Q3-1q93;
	Fri, 10 Apr 2026 23:58:23 +0000
Date: Sat, 11 Apr 2026 07:57:58 +0800
From: kernel test robot <lkp@intel.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [vireshk:virtio/msg-amp 19/22]
 drivers/virtio/virtio_msg_amp.c:361:9: sparse: sparse: incorrect type in
 argument 1 (different address spaces)
Message-ID: <202604110735.HQPec6t6-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vireshk/linux.git virtio/msg-amp
head:   75bc54f772e3ac32677414b0f929df9ca6c2ed28
commit: 2ce35fa9d3c3c8491f54c3c13337f6576772da96 [19/22] virtio: msg: Add generic PCI transport driver for virtio-msg AMP
config: um-randconfig-r133-20260411 (https://download.01.org/0day-ci/archive/20260411/202604110735.HQPec6t6-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260411/202604110735.HQPec6t6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604110735.HQPec6t6-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/virtio/virtio_msg_amp.c:361:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const * @@     got void [noderef] __iomem *shmem @@
   drivers/virtio/virtio_msg_amp.c:361:9: sparse:     expected void const *
   drivers/virtio/virtio_msg_amp.c:361:9: sparse:     got void [noderef] __iomem *shmem
>> drivers/virtio/virtio_msg_amp.c:361:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const * @@     got void [noderef] __iomem *shmem @@
   drivers/virtio/virtio_msg_amp.c:361:9: sparse:     expected void const *
   drivers/virtio/virtio_msg_amp.c:361:9: sparse:     got void [noderef] __iomem *shmem
>> drivers/virtio/virtio_msg_amp.c:361:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void * @@     got void [noderef] __iomem *shmem @@
   drivers/virtio/virtio_msg_amp.c:361:9: sparse:     expected void *
   drivers/virtio/virtio_msg_amp.c:361:9: sparse:     got void [noderef] __iomem *shmem
>> drivers/virtio/virtio_msg_amp.c:373:37: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/virtio/virtio_msg_amp.c: note: in included file (through drivers/virtio/virtio_msg_amp.h):
>> drivers/virtio/spsc_queue.h:114:16: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct spsc_queue_shared *shm @@     got void [noderef] __iomem *mem @@
   drivers/virtio/spsc_queue.h:114:16: sparse:     expected struct spsc_queue_shared *shm
   drivers/virtio/spsc_queue.h:114:16: sparse:     got void [noderef] __iomem *mem
>> drivers/virtio/spsc_queue.h:114:16: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct spsc_queue_shared *shm @@     got void [noderef] __iomem *mem @@
   drivers/virtio/spsc_queue.h:114:16: sparse:     expected struct spsc_queue_shared *shm
   drivers/virtio/spsc_queue.h:114:16: sparse:     got void [noderef] __iomem *mem

vim +361 drivers/virtio/virtio_msg_amp.c

055d6b3f963669 Bill Mills 2024-11-02  355  
055d6b3f963669 Bill Mills 2024-11-02  356  int virtio_msg_amp_register(struct virtio_msg_amp *vmamp)
055d6b3f963669 Bill Mills 2024-11-02  357  {
055d6b3f963669 Bill Mills 2024-11-02  358  	int ret;
055d6b3f963669 Bill Mills 2024-11-02  359  
055d6b3f963669 Bill Mills 2024-11-02  360  	/* TODO: Is this required ? */
055d6b3f963669 Bill Mills 2024-11-02 @361  	memset(vmamp->shmem, 0, VIRTIO_MSG_AMP_PAGE_SIZE * 2);
055d6b3f963669 Bill Mills 2024-11-02  362  
055d6b3f963669 Bill Mills 2024-11-02  363  	vmamp->broken = false;
055d6b3f963669 Bill Mills 2024-11-02  364  	spin_lock_init(&vmamp->tx_lock);
055d6b3f963669 Bill Mills 2024-11-02  365  	init_completion(&vmamp->rdata.completion);
055d6b3f963669 Bill Mills 2024-11-02  366  	INIT_WORK(&vmamp->work, virtio_msg_amp_bus_event);
055d6b3f963669 Bill Mills 2024-11-02  367  	INIT_DELAYED_WORK(&vmamp->ping, ping_work);
055d6b3f963669 Bill Mills 2024-11-02  368  
055d6b3f963669 Bill Mills 2024-11-02  369  	/* create the structures that point to the message FIFOs in memory */
055d6b3f963669 Bill Mills 2024-11-02  370  	spsc_init(&vmamp->drv2dev, "drv2dev", spsc_capacity(VIRTIO_MSG_AMP_PAGE_SIZE),
055d6b3f963669 Bill Mills 2024-11-02  371  		  vmamp->shmem);
055d6b3f963669 Bill Mills 2024-11-02  372  	spsc_init(&vmamp->dev2drv, "dev2drv", spsc_capacity(VIRTIO_MSG_AMP_PAGE_SIZE),
055d6b3f963669 Bill Mills 2024-11-02 @373  		  (void __iomem *)((u8 *)vmamp->shmem + VIRTIO_MSG_AMP_PAGE_SIZE));
055d6b3f963669 Bill Mills 2024-11-02  374  
055d6b3f963669 Bill Mills 2024-11-02  375  	ret = virtio_msg_amp_add_devices(vmamp);
055d6b3f963669 Bill Mills 2024-11-02  376  	if (ret)
055d6b3f963669 Bill Mills 2024-11-02  377  		return ret;
055d6b3f963669 Bill Mills 2024-11-02  378  
055d6b3f963669 Bill Mills 2024-11-02  379  	if (ping_ms)
055d6b3f963669 Bill Mills 2024-11-02  380  		schedule_delayed_work(&vmamp->ping, msecs_to_jiffies(ping_ms));
055d6b3f963669 Bill Mills 2024-11-02  381  	return 0;
055d6b3f963669 Bill Mills 2024-11-02  382  }
055d6b3f963669 Bill Mills 2024-11-02  383  EXPORT_SYMBOL_GPL(virtio_msg_amp_register);
055d6b3f963669 Bill Mills 2024-11-02  384  

:::::: The code at line 361 was first introduced by commit
:::::: 055d6b3f963669e560f1da77be5e65f6011bb910 virtio: msg: Add AMP transport over shared memory

:::::: TO: Bill Mills <bill.mills@linaro.org>
:::::: CC: Viresh Kumar <viresh.kumar@linaro.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
