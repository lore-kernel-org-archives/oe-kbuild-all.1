Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD2D73ED109
	for <oe-kbuild-all@lists.linux.dev>; Wed,  6 May 2026 16:47:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778086043; cv=none; b=XjTduwlDU7AcLdF8psjsXufIm8ZfGfhb2ALJTKsbvDrrwz3FqGAaay0jUNjDWSKpuFtK/7uH2wFejf0Og0fgoNOh9fuJdr5YtS06aRKgKTgBBmGyaVElJPvZr6/JVfeyuzh32+zFb/UD4Q4/20WxXTicus6klADpvuER/VXKstk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778086043; c=relaxed/simple;
	bh=r+Gqi03Lm5zk1pijbzUrg+1qwZvxFfqiV2t3y9hrIUs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=rN6cJkaA/EiueMJQLj7emPR+gFBULstdTkS6m0e2OJt7TjDzDVZBoZptuS9wiipOHEoBvPFPMpb2vpa+fOlG3mYD4NoGZDxKykH52/047twnB5VI7xG2h03mzyMR2hCPs84HFuapfWM6WD9amnlE17zODw128xeehbmjr6SQhYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=k30xeyDf; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="k30xeyDf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778086042; x=1809622042;
  h=date:from:to:cc:subject:message-id;
  bh=r+Gqi03Lm5zk1pijbzUrg+1qwZvxFfqiV2t3y9hrIUs=;
  b=k30xeyDf25onVCoHg8zdohn+dttKKK42C8qd8P5SOIv3mQQVQN4Eo3jC
   CrJNqHtsWiRYkm58yNF8ge5iVDu5KtXjr1G9ft1OeEiz+0+LNq6YuBak6
   ReUnxnWxwyXmyItSqWJ9rhHuLc9Zk8SFJ048Lo1rpsoP5allSTBSheCyZ
   aAofkeuqEXZuj8+ZtlYpQRCi13dUAzu85bTlK/83i7FZsolbkGYeye0gw
   SJRFNNSlGYPwrdSZZaVIrHR3QtvssfvSByQ/s0n6gNm0oJHLgZMoVB6O+
   chizX6H1cjULPHyhule9TNkJ8JMCJWjQ7TNyJJcDEb25btIE0AAjcZVis
   Q==;
X-CSE-ConnectionGUID: lCB+6irhT4evwEM5XA5N7w==
X-CSE-MsgGUID: IkUK6HNtRomNsySIJX+rfw==
X-IronPort-AV: E=McAfee;i="6800,10657,11778"; a="79071589"
X-IronPort-AV: E=Sophos;i="6.23,219,1770624000"; 
   d="scan'208";a="79071589"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2026 09:47:20 -0700
X-CSE-ConnectionGUID: xFEXdfCJRiuZM2nUBu9h+g==
X-CSE-MsgGUID: H5TmHUXHTmGFNt3VSzLizA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,219,1770624000"; 
   d="scan'208";a="259891871"
Received: from lkp-server01.sh.intel.com (HELO 9ec114424ce8) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 06 May 2026 09:47:19 -0700
Received: from kbuild by 9ec114424ce8 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wKfP1-0000000014h-3EEV;
	Wed, 06 May 2026 16:47:15 +0000
Date: Thu, 07 May 2026 00:46:44 +0800
From: kernel test robot <lkp@intel.com>
To: Kanchan Joshi <joshi.k@samsung.com>
Cc: oe-kbuild-all@lists.linux.dev, Jens Axboe <axboe@kernel.dk>,
 Anuj Gupta <anuj20.g@samsung.com>
Subject: [axboe:nvme-raw-queues 11/16]
 drivers/nvme/host/pci.c:2635:10: error: 'const struct blk_mq_ops' has no
 member named 'queue_uring_cmd'
Message-ID: <202605070000.idE58K9H-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux.git nvme-raw-queues
head:   38cfa7887dc8d403af2baa576d06c438408a192c
commit: 106e34592f22c54533e7fe4ccd8374f5648ab9ca [11/16] pci: implement submission/completion for rawq commands
config: parisc-randconfig-001-20260506 (https://download.01.org/0day-ci/archive/20260507/202605070000.idE58K9H-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 13.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260507/202605070000.idE58K9H-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605070000.idE58K9H-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/nvme/host/pci.c:2633:10: error: 'const struct blk_mq_ops' has no member named 'register_queue'
    2633 |         .register_queue = nvme_pci_register_queue,
         |          ^~~~~~~~~~~~~~
   drivers/nvme/host/pci.c:2633:27: error: initialization of 'void (*)(struct request *)' from incompatible pointer type 'int (*)(void *)' [-Werror=incompatible-pointer-types]
    2633 |         .register_queue = nvme_pci_register_queue,
         |                           ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/nvme/host/pci.c:2633:27: note: (near initialization for 'nvme_mq_ops.complete')
   drivers/nvme/host/pci.c:2633:27: warning: initialized field overwritten [-Woverride-init]
   drivers/nvme/host/pci.c:2633:27: note: (near initialization for 'nvme_mq_ops.complete')
   drivers/nvme/host/pci.c:2634:10: error: 'const struct blk_mq_ops' has no member named 'unregister_queue'
    2634 |         .unregister_queue =  nvme_pci_unregister_queue,
         |          ^~~~~~~~~~~~~~~~
   drivers/nvme/host/pci.c:2634:30: error: initialization of 'int (*)(struct blk_mq_hw_ctx *, void *, unsigned int)' from incompatible pointer type 'int (*)(void *, int)' [-Werror=incompatible-pointer-types]
    2634 |         .unregister_queue =  nvme_pci_unregister_queue,
         |                              ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/nvme/host/pci.c:2634:30: note: (near initialization for 'nvme_mq_ops.init_hctx')
   drivers/nvme/host/pci.c:2634:30: warning: initialized field overwritten [-Woverride-init]
   drivers/nvme/host/pci.c:2634:30: note: (near initialization for 'nvme_mq_ops.init_hctx')
>> drivers/nvme/host/pci.c:2635:10: error: 'const struct blk_mq_ops' has no member named 'queue_uring_cmd'
    2635 |         .queue_uring_cmd = nvme_pci_queue_ucmd,
         |          ^~~~~~~~~~~~~~~
>> drivers/nvme/host/pci.c:2635:28: error: initialization of 'void (*)(struct blk_mq_hw_ctx *, unsigned int)' from incompatible pointer type 'int (*)(struct io_uring_cmd *, int,  unsigned int)' [-Werror=incompatible-pointer-types]
    2635 |         .queue_uring_cmd = nvme_pci_queue_ucmd,
         |                            ^~~~~~~~~~~~~~~~~~~
   drivers/nvme/host/pci.c:2635:28: note: (near initialization for 'nvme_mq_ops.exit_hctx')
>> drivers/nvme/host/pci.c:2636:10: error: 'const struct blk_mq_ops' has no member named 'poll_uring_cmd'
    2636 |         .poll_uring_cmd = nvme_poll_uring_cmd,
         |          ^~~~~~~~~~~~~~
>> drivers/nvme/host/pci.c:2636:27: error: initialization of 'int (*)(struct blk_mq_tag_set *, struct request *, unsigned int,  unsigned int)' from incompatible pointer type 'int (*)(struct io_uring_cmd *, int,  struct io_comp_batch *)' [-Werror=incompatible-pointer-types]
    2636 |         .poll_uring_cmd = nvme_poll_uring_cmd,
         |                           ^~~~~~~~~~~~~~~~~~~
   drivers/nvme/host/pci.c:2636:27: note: (near initialization for 'nvme_mq_ops.init_request')
   drivers/nvme/host/pci.c:2636:27: warning: initialized field overwritten [-Woverride-init]
   drivers/nvme/host/pci.c:2636:27: note: (near initialization for 'nvme_mq_ops.init_request')
   cc1: some warnings being treated as errors

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for MFD_STMFX
   Depends on [n]: HAS_IOMEM [=y] && I2C [=y] && OF [=n]
   Selected by [y]:
   - PINCTRL_STMFX [=y] && PINCTRL [=y] && I2C [=y] && HAS_IOMEM [=y]


vim +2635 drivers/nvme/host/pci.c

  2622	
  2623	static const struct blk_mq_ops nvme_mq_ops = {
  2624		.queue_rq	= nvme_queue_rq,
  2625		.queue_rqs	= nvme_queue_rqs,
  2626		.complete	= nvme_pci_complete_rq,
  2627		.commit_rqs	= nvme_commit_rqs,
  2628		.init_hctx	= nvme_init_hctx,
  2629		.init_request	= nvme_pci_init_request,
  2630		.map_queues	= nvme_pci_map_queues,
  2631		.timeout	= nvme_timeout,
  2632		.poll		= nvme_poll,
  2633		.register_queue	= nvme_pci_register_queue,
  2634		.unregister_queue =  nvme_pci_unregister_queue,
> 2635		.queue_uring_cmd = nvme_pci_queue_ucmd,
> 2636		.poll_uring_cmd	= nvme_poll_uring_cmd,
  2637	};
  2638	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
