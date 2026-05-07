Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A641175A85
	for <oe-kbuild-all@lists.linux.dev>; Thu,  7 May 2026 00:41:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778114468; cv=none; b=cc6Sal5Q8ufwZ2MVKyDQp4jasuff1zJelbRcaoXHaUgqDBeHIClkT3xPZxEM6Quv0t0N/kDK2HERGYUJ0Jl9F+fvehs7Tv7BUev8wCktyvn1scHNOhYvtbBT2Gytgyy67O8MwxmLRV0Jqun1mlwEso6o4u2TnUMY7x9VGYoSq0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778114468; c=relaxed/simple;
	bh=e7o/fFNv4GIwuyW7zgGXFDt3Jmui0Qnt06FWsJYlL2k=;
	h=Date:From:To:Cc:Subject:Message-ID; b=hWb/9mYtkEvyOT8D8rnMzTbwzAuRxYHeKe7OcwY7w4ZoPGu0lAUK3fedYDCifJvT7fhYevzGi6GfV2dEyPYBNE2Rb7CdjjMeDhsacOOFf62Y2lmJcUs45HT3bSKZqXZIQHb997p3vsmZz11Rp97+0MX0UVPoeYdYIJFSWmhVvoc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=agZEGhRU; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="agZEGhRU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778114466; x=1809650466;
  h=date:from:to:cc:subject:message-id;
  bh=e7o/fFNv4GIwuyW7zgGXFDt3Jmui0Qnt06FWsJYlL2k=;
  b=agZEGhRU2Dz0HV7+/fL6CEdo0cHIHL2XfZRHoBLdkBabe4mjV7Gc6PS1
   krQxTKfdGB6Ya6WxrpMcbuB1178/nE9sfQYb1QO2aW+xDupv+DrAp9Tny
   jioFynSvfli8t0RpcqQHfZVax6xzFdC0ab24hh8y0ACxFZpIZ/M9btznm
   Xh4c9ygVhp5UZILYyKiAYDYklsx5dkgZEuhJ2ouHUUSMjMJ1bQu1go8IR
   FdTQdtzCGwcoSuQGc5T0FX6g7MfLFVWXH7GeU0kC5L3wJuiC/CamnL58s
   WHIMvcXFZobWJCcHlDFCURjRDTGBfR9wVStK+f9F9YXv1R23VQEdDI3ef
   w==;
X-CSE-ConnectionGUID: cvzly5xDTfe7rzPB4p29Cg==
X-CSE-MsgGUID: /JwMH1LEQLmFAfFVLBhBNQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11778"; a="82926991"
X-IronPort-AV: E=Sophos;i="6.23,220,1770624000"; 
   d="scan'208";a="82926991"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2026 17:41:05 -0700
X-CSE-ConnectionGUID: QLgY9FaoQYW/a8rYpo6FgA==
X-CSE-MsgGUID: SucmyO+xRMW8GQxIR9UO/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,220,1770624000"; 
   d="scan'208";a="231770906"
Received: from lkp-server01.sh.intel.com (HELO 9ec114424ce8) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 06 May 2026 17:41:03 -0700
Received: from kbuild by 9ec114424ce8 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wKmnV-000000001Mj-00u9;
	Thu, 07 May 2026 00:41:01 +0000
Date: Thu, 07 May 2026 08:13:16 +0800
From: kernel test robot <lkp@intel.com>
To: Kanchan Joshi <joshi.k@samsung.com>
Cc: oe-kbuild-all@lists.linux.dev, Jens Axboe <axboe@kernel.dk>,
 Anuj Gupta <anuj20.g@samsung.com>
Subject: [axboe:nvme-raw-queues 11/16]
 drivers/nvme/host/pci.c:1580:33: sparse: sparse: incorrect type in
 initializer (different base types)
Message-ID: <202605070717.SZcbGE1q-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux.git nvme-raw-queues
head:   38cfa7887dc8d403af2baa576d06c438408a192c
commit: 106e34592f22c54533e7fe4ccd8374f5648ab9ca [11/16] pci: implement submission/completion for rawq commands
config: arm64-randconfig-r133-20260506 (https://download.01.org/0day-ci/archive/20260507/202605070717.SZcbGE1q-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260507/202605070717.SZcbGE1q-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605070717.SZcbGE1q-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/nvme/host/pci.c:1580:33: sparse: sparse: incorrect type in initializer (different base types) @@     expected unsigned long long [usertype] result @@     got restricted __le64 [usertype] u64 @@
   drivers/nvme/host/pci.c:1580:33: sparse:     expected unsigned long long [usertype] result
   drivers/nvme/host/pci.c:1580:33: sparse:     got restricted __le64 [usertype] u64
>> drivers/nvme/host/pci.c:1580:33: sparse: sparse: incorrect type in initializer (different base types) @@     expected unsigned long long [usertype] result @@     got restricted __le64 [usertype] u64 @@
   drivers/nvme/host/pci.c:1580:33: sparse:     expected unsigned long long [usertype] result
   drivers/nvme/host/pci.c:1580:33: sparse:     got restricted __le64 [usertype] u64
>> drivers/nvme/host/pci.c:1580:33: sparse: sparse: incorrect type in initializer (different base types) @@     expected unsigned long long [usertype] result @@     got restricted __le64 [usertype] u64 @@
   drivers/nvme/host/pci.c:1580:33: sparse:     expected unsigned long long [usertype] result
   drivers/nvme/host/pci.c:1580:33: sparse:     got restricted __le64 [usertype] u64
>> drivers/nvme/host/pci.c:1580:33: sparse: sparse: incorrect type in initializer (different base types) @@     expected unsigned long long [usertype] result @@     got restricted __le64 [usertype] u64 @@
   drivers/nvme/host/pci.c:1580:33: sparse:     expected unsigned long long [usertype] result
   drivers/nvme/host/pci.c:1580:33: sparse:     got restricted __le64 [usertype] u64
>> drivers/nvme/host/pci.c:1580:33: sparse: sparse: incorrect type in initializer (different base types) @@     expected unsigned long long [usertype] result @@     got restricted __le64 [usertype] u64 @@
   drivers/nvme/host/pci.c:1580:33: sparse:     expected unsigned long long [usertype] result
   drivers/nvme/host/pci.c:1580:33: sparse:     got restricted __le64 [usertype] u64

vim +1580 drivers/nvme/host/pci.c

  1573	
  1574	static inline void nvme_handle_cqe_rawq(struct nvme_queue *nvmeq,
  1575						struct nvme_completion *cqe,
  1576						__u16 command_id)
  1577	{
  1578		struct nvme_dev *dev = nvmeq->dev;
  1579		u32 status = le16_to_cpu(cqe->status) >> 1;
> 1580		u64 result = cqe->result.u64;
  1581		struct nvme_iod *iod;
  1582		int id, reg_id;
  1583	
  1584		reg_id = nvme_genctr_from_cid(command_id);
  1585		/* we should not encounter completions from past registration*/
  1586		WARN_ON_ONCE(nvmeq->reg_id != reg_id);
  1587	
  1588		id = nvme_tag_from_cid(command_id);
  1589		iod = &nvmeq->iod[id];
  1590	
  1591		if (iod->flags & IOD_SINGLE_SEGMENT)
  1592			dma_unmap_page(dev->dev,
  1593				le64_to_cpu(iod->cmd.common.dptr.prp1),
  1594				iod->total_len,
  1595				nvme_is_write(&iod->cmd) ? DMA_TO_DEVICE : DMA_FROM_DEVICE);
  1596	
  1597		nvme_pci_put_cmdid(nvmeq, id);
  1598		io_uring_cmd_done32(iod->ioucmd, status, result, IO_URING_F_UNLOCKED);
  1599	}
  1600	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
