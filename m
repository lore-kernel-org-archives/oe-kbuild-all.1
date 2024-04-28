Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16551EED0
	for <oe-kbuild-all@lists.linux.dev>; Sun, 28 Apr 2024 07:56:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714290985; cv=none; b=EyYoKGiaRgjXz+yybxFvM7gl2RFc+bMHo5Nqc0xuqF0VM2fd/EzmsHm3sutwH1z5Yf9vVYYLop3QTa7EausNV+2RkYuLxk662Q3Je0dSMRdRkekkv4Foi7gtg0GCaBv0Nt6mQMUu3vw8gZzL8WHB1IO2whXDPrBEb8QaOtdTwaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714290985; c=relaxed/simple;
	bh=pm4l6JFtJBslej9SFvFMETFwGFTlod1+mSafV/e2xfs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kWN7NHZWeimv0u5zR3/Qdv+xbRp6obS2jpIoPdtTw+cDs+GodpAuZlVRx33LRKqzn3UWSMGVkEc9c0FsY93GjOHful0JV+8I1FXLoHaSQIFijCEoSPG1r8bZSSz0pyWRla4KugWiYsU6GPxsVQS4WpbzjaaOcprppEm3eYH0BSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=D8vlAqcC; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="D8vlAqcC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714290983; x=1745826983;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pm4l6JFtJBslej9SFvFMETFwGFTlod1+mSafV/e2xfs=;
  b=D8vlAqcCM5hS1WXEpR6BmUFGjotW7gDQDdsX3MnlKfCYFPamNGr3OybU
   Jda5msMzRUsIvKv/GN1CLkhq4kD0oksX45s8NnRpTRhQb5jRMX8Qe8IPv
   tCRBMiIrtwiAPBB1i6uYxt84N1GG5KqjdlcPqSSkgJwZcb0mS5JkqpqAX
   CtS0xJpJi3pTnDl7z03bRJv0d9XqnISV5lJ5zULq0DN5QPPK6xOhqj0vS
   LjbGRgd9eXlb5z04tkCEahVZdBxm0lGPYAiv0i2zwU7zykJMA+/+pgeVG
   Gh+GlVcgVebFjo88oBYmED7/EsEcOPF0HQJTFcWQzywntVLQxvdbYvV+w
   w==;
X-CSE-ConnectionGUID: oBs6feMQRd2Fgdsisiq0kw==
X-CSE-MsgGUID: 1Xr1tpLuRfqbGhMcra5iOQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11057"; a="13765038"
X-IronPort-AV: E=Sophos;i="6.07,237,1708416000"; 
   d="scan'208";a="13765038"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2024 00:56:22 -0700
X-CSE-ConnectionGUID: WhFjgzIfTs6GDPegxbHilA==
X-CSE-MsgGUID: NmSHtK0+RW++P2GDAnUtkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,237,1708416000"; 
   d="scan'208";a="30625179"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 28 Apr 2024 00:56:20 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s0zOU-0005za-0Y;
	Sun, 28 Apr 2024 07:56:18 +0000
Date: Sun, 28 Apr 2024 15:55:23 +0800
From: kernel test robot <lkp@intel.com>
To: Andrew Davis <afd@ti.com>
Cc: oe-kbuild-all@lists.linux.dev, vigneshr@ti.com, nm@ti.com,
	Praneeth Bajjuri <praneeth@ti.com>
Subject: [ti:ti-linux-6.6.y-wip 16/18] remoteproc_core.c:undefined reference
 to `dma_buf_unmap_attachment'
Message-ID: <202404281527.XCTroHBJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git ti-linux-6.6.y-wip
head:   05cbc220aa99152ad80a750e73f08c0d96ec4ded
commit: cde91a89becee656867b8c8a86e627241dc91449 [16/18] remoteproc: core: Add DMA-BUF attachment interface to cdev
config: xtensa-randconfig-001-20240428 (https://download.01.org/0day-ci/archive/20240428/202404281527.XCTroHBJ-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240428/202404281527.XCTroHBJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404281527.XCTroHBJ-lkp@intel.com/

All errors (new ones prefixed by >>):

   xtensa-linux-ld: drivers/remoteproc/remoteproc_core.o: in function `devm_rproc_alloc':
>> remoteproc_core.c:(.text+0x122c): undefined reference to `dma_buf_unmap_attachment'
   xtensa-linux-ld: drivers/remoteproc/remoteproc_core.o: in function `rproc_release_dmabuf.isra.0':
   remoteproc_core.c:(.text+0x1288): undefined reference to `dma_buf_unmap_attachment'
   xtensa-linux-ld: drivers/remoteproc/remoteproc_core.o: in function `devm_rproc_alloc':
>> remoteproc_core.c:(.text+0x1238): undefined reference to `dma_buf_detach'
   xtensa-linux-ld: drivers/remoteproc/remoteproc_core.o: in function `rproc_release_dmabuf.isra.0':
   remoteproc_core.c:(.text+0x12a6): undefined reference to `dma_buf_detach'
   xtensa-linux-ld: drivers/remoteproc/remoteproc_core.o: in function `rproc_handle_trace':
>> remoteproc_core.c:(.text+0x2a18): undefined reference to `dma_buf_attach'
   xtensa-linux-ld: drivers/remoteproc/remoteproc_core.o: in function `rproc_attach_dmabuf':
   remoteproc_core.c:(.text+0x2acf): undefined reference to `dma_buf_attach'
   xtensa-linux-ld: drivers/remoteproc/remoteproc_core.o: in function `rproc_handle_trace':
>> remoteproc_core.c:(.text+0x2a28): undefined reference to `dma_buf_map_attachment'
   xtensa-linux-ld: drivers/remoteproc/remoteproc_core.o: in function `rproc_attach_dmabuf':
   remoteproc_core.c:(.text+0x2aff): undefined reference to `dma_buf_map_attachment'
   xtensa-linux-ld: drivers/remoteproc/remoteproc_core.o: in function `rproc_handle_trace':
   remoteproc_core.c:(.text+0x2a44): undefined reference to `dma_buf_unmap_attachment'
   xtensa-linux-ld: drivers/remoteproc/remoteproc_core.o: in function `rproc_attach_dmabuf':
   remoteproc_core.c:(.text+0x2b52): undefined reference to `dma_buf_unmap_attachment'
   xtensa-linux-ld: drivers/remoteproc/remoteproc_core.o: in function `rproc_handle_trace':
   remoteproc_core.c:(.text+0x2a68): undefined reference to `dma_buf_detach'
   xtensa-linux-ld: drivers/remoteproc/remoteproc_core.o: in function `rproc_attach_dmabuf':
   remoteproc_core.c:(.text+0x2be6): undefined reference to `dma_buf_detach'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
