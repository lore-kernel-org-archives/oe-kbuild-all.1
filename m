Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA52A17547
	for <oe-kbuild-all@lists.linux.dev>; Sun, 14 Apr 2024 03:54:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713066876; cv=none; b=d3hdReFxD6H5UnPd8aHtr1GHyHTFh6aDd2AMcWYTuL7hxxc7LIDX2VpYgbJoitxBK24LJ20Aj5Od1eTBRvhdm307rxElSMfhLEeaZgRaEUrkpTRn5rKyiW+fdL5ogTJ50eBNlEEhuL1v3MjfI85dXGhkRf7Eki+lmjZuLdUGZao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713066876; c=relaxed/simple;
	bh=eWmqN3dKNRSrLM+Ad+pfqzvY+yYWPEbP/Prn9D2NbyY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=I/GOLBGWYeSCIMwWJE6oM25slUNX9wVwDG4CfTnEP2WuKLE1h1WUHDep/lcPXVxS/KKbRVOjXt5po5d49sLDSNfyDX8gsEaHG0amLzdn1sFfiLv3uUmkTtU4roT2s8vJ04vqauKDwEMmzULHUY5P7DkycBCKAL27xWRWvDm3B58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gIRHJnAY; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gIRHJnAY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713066875; x=1744602875;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=eWmqN3dKNRSrLM+Ad+pfqzvY+yYWPEbP/Prn9D2NbyY=;
  b=gIRHJnAYTybBxLfkoHgl1zzbSMl/wGKA8N+9Vq2A2l/f52ELlH02GMqo
   v4A4BLZSqi/6CGg/I8s+mEVF79G9m6G0aBOk+rvavV55A48EPhTjiVP5I
   uhUR9yz7NdQcvFCP9Gkgrng7GiXDJ7qQ6Zfp7QCsZnGfXDEfbmkSfBwRp
   fS2hLO8lNmXc1vCKxpVlQKFkSp0cXBtECvJqo16bd9Eq69wXQvD6BMazx
   +TT+ogYvLU/NbQygCoNFiY+3SS3xvYQ353odXxcgTCfmzBphHZP8rRDED
   KmqiyOqIzwtNDa/N3bbPmE6yTc82KiXr9jS4jquFqxv95L9rsn3nQ1GB9
   A==;
X-CSE-ConnectionGUID: SJjlrpIXSaqryk62vRes3Q==
X-CSE-MsgGUID: O3uGvBxpTe68xJk+Y7CsbQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11043"; a="19626840"
X-IronPort-AV: E=Sophos;i="6.07,200,1708416000"; 
   d="scan'208";a="19626840"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2024 20:54:32 -0700
X-CSE-ConnectionGUID: OiCCWFzqR6CMqOqJFEKhiQ==
X-CSE-MsgGUID: i9yRqKj1SNKEIW2oUgqZ6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,200,1708416000"; 
   d="scan'208";a="26139093"
Received: from unknown (HELO 23c141fc0fd8) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 13 Apr 2024 20:54:30 -0700
Received: from kbuild by 23c141fc0fd8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rvqwl-0003Gg-2i;
	Sun, 14 Apr 2024 03:54:27 +0000
Date: Sun, 14 Apr 2024 11:53:37 +0800
From: kernel test robot <lkp@intel.com>
To: Andrew Davis <afd@ti.com>
Cc: oe-kbuild-all@lists.linux.dev, vigneshr@ti.com, nm@ti.com,
	Praneeth Bajjuri <praneeth@ti.com>
Subject: [ti:ti-linux-6.6.y-wip 16/18] ld.lld: error: undefined symbol:
 dma_buf_get
Message-ID: <202404141126.zfjPm4ps-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git ti-linux-6.6.y-wip
head:   6b3bec4539bd706892be36c3b481b9aa7cbe27a8
commit: cde91a89becee656867b8c8a86e627241dc91449 [16/18] remoteproc: core: Add DMA-BUF attachment interface to cdev
config: i386-randconfig-012-20240414 (https://download.01.org/0day-ci/archive/20240414/202404141126.zfjPm4ps-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240414/202404141126.zfjPm4ps-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404141126.zfjPm4ps-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: dma_buf_get
   >>> referenced by remoteproc_cdev.c:93 (drivers/remoteproc/remoteproc_cdev.c:93)
   >>>               drivers/remoteproc/remoteproc_cdev.o:(rproc_device_ioctl) in archive vmlinux.a
--
>> ld.lld: error: undefined symbol: dma_buf_put
   >>> referenced by remoteproc_cdev.c:0 (drivers/remoteproc/remoteproc_cdev.c:0)
   >>>               drivers/remoteproc/remoteproc_cdev.o:(rproc_device_ioctl) in archive vmlinux.a
   >>> referenced by remoteproc_cdev.c:115 (drivers/remoteproc/remoteproc_cdev.c:115)
   >>>               drivers/remoteproc/remoteproc_cdev.o:(rproc_device_ioctl) in archive vmlinux.a
   >>> referenced by remoteproc_cdev.c:161 (drivers/remoteproc/remoteproc_cdev.c:161)
   >>>               drivers/remoteproc/remoteproc_cdev.o:(rproc_cdev_release) in archive vmlinux.a
--
>> ld.lld: error: undefined symbol: dma_buf_attach
   >>> referenced by remoteproc_core.c:948 (drivers/remoteproc/remoteproc_core.c:948)
   >>>               drivers/remoteproc/remoteproc_core.o:(rproc_attach_dmabuf) in archive vmlinux.a
--
>> ld.lld: error: undefined symbol: dma_buf_map_attachment
   >>> referenced by remoteproc_core.c:955 (drivers/remoteproc/remoteproc_core.c:955)
   >>>               drivers/remoteproc/remoteproc_core.o:(rproc_attach_dmabuf) in archive vmlinux.a
--
>> ld.lld: error: undefined symbol: dma_buf_detach
   >>> referenced by remoteproc_core.c:985 (drivers/remoteproc/remoteproc_core.c:985)
   >>>               drivers/remoteproc/remoteproc_core.o:(rproc_attach_dmabuf) in archive vmlinux.a
   >>> referenced by remoteproc_core.c:996 (drivers/remoteproc/remoteproc_core.c:996)
   >>>               drivers/remoteproc/remoteproc_core.o:(rproc_detach_dmabuf) in archive vmlinux.a
   >>> referenced by remoteproc_core.c:996 (drivers/remoteproc/remoteproc_core.c:996)
   >>>               drivers/remoteproc/remoteproc_core.o:(rproc_resource_cleanup) in archive vmlinux.a
--
>> ld.lld: error: undefined symbol: dma_buf_unmap_attachment
   >>> referenced by remoteproc_core.c:983 (drivers/remoteproc/remoteproc_core.c:983)
   >>>               drivers/remoteproc/remoteproc_core.o:(rproc_attach_dmabuf) in archive vmlinux.a
   >>> referenced by remoteproc_core.c:994 (drivers/remoteproc/remoteproc_core.c:994)
   >>>               drivers/remoteproc/remoteproc_core.o:(rproc_detach_dmabuf) in archive vmlinux.a
   >>> referenced by remoteproc_core.c:994 (drivers/remoteproc/remoteproc_core.c:994)
   >>>               drivers/remoteproc/remoteproc_core.o:(rproc_resource_cleanup) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
