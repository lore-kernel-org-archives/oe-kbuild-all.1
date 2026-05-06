Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2B0F481AB1
	for <oe-kbuild-all@lists.linux.dev>; Wed,  6 May 2026 15:28:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778081297; cv=none; b=nJGUTeG76IfvToIJH2ZWWghx698jIpMumokJIF0f/q17SC6/6g8abWMONzK7cR85gsTuG7IupSA/zG2PT6e0ii94dYe2ZlORsbBc6aB8CiIVUwVg4q+j111FD3V3rJIzrFSU/ltpybwLoAulR1fqVrjstQZASu7l0iu4gNnZsn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778081297; c=relaxed/simple;
	bh=b6VKctdCvxVJbzAZKHMrHTfegof1M2fyQ0h5Yw4HCBo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=pAT7kHnpk12ozQGtahGmtiVGFXDtqA3tMhvHdztIqqh5OorJxxwtrEX657JGMayTl4i6vbnA/TzYn4ZaezD5fuoP0AKobebcn0QZjWvvFZLJ7K+/AjmCiGXcLLKO36RFMrSTCSiMsbo6VxcfOhbWdyzoekHJWCANGkzTP8xwfaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HdJX0q6v; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HdJX0q6v"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778081295; x=1809617295;
  h=date:from:to:cc:subject:message-id;
  bh=b6VKctdCvxVJbzAZKHMrHTfegof1M2fyQ0h5Yw4HCBo=;
  b=HdJX0q6vrRUin6UNRzzkIvhNwSilmFOCA+LK4xMph4LgDZzIJijcKQb5
   xCivpTQounpKIb14AJ4FHYZV1qZFaA2MAPNowS3uByrzq2OXf9pCebPXz
   fHaOL1g5PrYxbm8F8uCHuDNFSvxbexMRp0nclrLpOKEXfOYaOTVYPzSch
   tjgZeSs6cS8V82SnPyij6emKhr7wih4iUsl235UtgGPNiDPHSAQ2uOpon
   hmRf3MyhMxDyeHDKNjAUM3jYohm7OMtSLBcuKLFo0M4fVsR4lYWutQVv6
   V5fpIlE+JGYlDl78Kp/ma6DLZ4/9Fhf6k93NMxaNrp5Lq56Z6ueicA1i0
   Q==;
X-CSE-ConnectionGUID: Bx1djPo6TLWtQjJ8eGUl/A==
X-CSE-MsgGUID: 2zSQaCJuStCdnBlgnHXwUw==
X-IronPort-AV: E=McAfee;i="6800,10657,11778"; a="66546914"
X-IronPort-AV: E=Sophos;i="6.23,219,1770624000"; 
   d="scan'208";a="66546914"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2026 08:28:12 -0700
X-CSE-ConnectionGUID: OgHKtYxWQ6yKOhQj7BliNw==
X-CSE-MsgGUID: BzxqbFMzRD6j/j/cDZqm+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,219,1770624000"; 
   d="scan'208";a="266524113"
Received: from lkp-server01.sh.intel.com (HELO 9ec114424ce8) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 06 May 2026 08:28:11 -0700
Received: from kbuild by 9ec114424ce8 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wKeAS-00000000117-0OvR;
	Wed, 06 May 2026 15:28:08 +0000
Date: Wed, 06 May 2026 23:27:40 +0800
From: kernel test robot <lkp@intel.com>
To: Kanchan Joshi <joshi.k@samsung.com>
Cc: oe-kbuild-all@lists.linux.dev, Jens Axboe <axboe@kernel.dk>,
 Anuj Gupta <anuj20.g@samsung.com>
Subject: [axboe:nvme-raw-queues 6/16]
 drivers/nvme/host/pci.c:2421:10: error: 'const struct blk_mq_ops' has no
 member named 'register_queue'
Message-ID: <202605062305.jPFHNlXe-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux.git nvme-raw-queues
head:   38cfa7887dc8d403af2baa576d06c438408a192c
commit: 6c88c997f65b7435f11d31654c1d5007c6f82335 [6/16] pci: implement register/unregister functionality
config: parisc-randconfig-001-20260506 (https://download.01.org/0day-ci/archive/20260506/202605062305.jPFHNlXe-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 13.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260506/202605062305.jPFHNlXe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605062305.jPFHNlXe-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/nvme/host/pci.c:2421:10: error: 'const struct blk_mq_ops' has no member named 'register_queue'
    2421 |         .register_queue = nvme_pci_register_queue,
         |          ^~~~~~~~~~~~~~
>> drivers/nvme/host/pci.c:2421:27: error: initialization of 'void (*)(struct request *)' from incompatible pointer type 'int (*)(void *)' [-Werror=incompatible-pointer-types]
    2421 |         .register_queue = nvme_pci_register_queue,
         |                           ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/nvme/host/pci.c:2421:27: note: (near initialization for 'nvme_mq_ops.complete')
   drivers/nvme/host/pci.c:2421:27: warning: initialized field overwritten [-Woverride-init]
   drivers/nvme/host/pci.c:2421:27: note: (near initialization for 'nvme_mq_ops.complete')
>> drivers/nvme/host/pci.c:2422:10: error: 'const struct blk_mq_ops' has no member named 'unregister_queue'
    2422 |         .unregister_queue =  nvme_pci_unregister_queue,
         |          ^~~~~~~~~~~~~~~~
>> drivers/nvme/host/pci.c:2422:30: error: initialization of 'int (*)(struct blk_mq_hw_ctx *, void *, unsigned int)' from incompatible pointer type 'int (*)(void *, int)' [-Werror=incompatible-pointer-types]
    2422 |         .unregister_queue =  nvme_pci_unregister_queue,
         |                              ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/nvme/host/pci.c:2422:30: note: (near initialization for 'nvme_mq_ops.init_hctx')
   drivers/nvme/host/pci.c:2422:30: warning: initialized field overwritten [-Woverride-init]
   drivers/nvme/host/pci.c:2422:30: note: (near initialization for 'nvme_mq_ops.init_hctx')
   cc1: some warnings being treated as errors

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for MFD_STMFX
   Depends on [n]: HAS_IOMEM [=y] && I2C [=y] && OF [=n]
   Selected by [y]:
   - PINCTRL_STMFX [=y] && PINCTRL [=y] && I2C [=y] && HAS_IOMEM [=y]


vim +2421 drivers/nvme/host/pci.c

  2410	
  2411	static const struct blk_mq_ops nvme_mq_ops = {
  2412		.queue_rq	= nvme_queue_rq,
  2413		.queue_rqs	= nvme_queue_rqs,
  2414		.complete	= nvme_pci_complete_rq,
  2415		.commit_rqs	= nvme_commit_rqs,
  2416		.init_hctx	= nvme_init_hctx,
  2417		.init_request	= nvme_pci_init_request,
  2418		.map_queues	= nvme_pci_map_queues,
  2419		.timeout	= nvme_timeout,
  2420		.poll		= nvme_poll,
> 2421		.register_queue	= nvme_pci_register_queue,
> 2422		.unregister_queue =  nvme_pci_unregister_queue,
  2423	};
  2424	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
