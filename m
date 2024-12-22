Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DBC11891A9
	for <oe-kbuild-all@lists.linux.dev>; Sun, 22 Dec 2024 23:58:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734911897; cv=none; b=Yw97BMjqaLSkFkPYnpyyVQkBlTrcUZXGy7jhtPO39PDxbPCCJXJjBEgpAyX9aWh+wHgXvnTSiSGRs7pYHdF1jvxaEQH2FARiimgb24O3YBn2fT93Gzsv2SVEeWo/YzUCSUwnRHD3NUTe/COyfKhceyvgMjQ+S9CHeaEec1igJsg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734911897; c=relaxed/simple;
	bh=eCfo1cdBujYfR54EIcEjotOh3gqswvM1sPSm6BCirYg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tHEBWL4AI6YWn2Zvut/d3RYDmPCeLDfFXCJyuP6YLYLpzFbE/+FcwkW7PJ7r0WAKKZGy9qpRcc66zax5YxudMf39JldVo6lLfz4o/RK/L6yGI6THAD4tA5yCTUjmwhlJ8voWR+X3NpuQj711ZssfzGO6A/3F/v7lUV3N31vNeFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Z+V4YHpG; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Z+V4YHpG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734911896; x=1766447896;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=eCfo1cdBujYfR54EIcEjotOh3gqswvM1sPSm6BCirYg=;
  b=Z+V4YHpG1ZLwYiKWdlgSKnG+jz39c0qfXpxC0wDIRvpAMN7NRo11NyE5
   /m0f39YmrqHAWuB569fhbGgBAREHMiWgynXovfZFQyqGkgMaTS5uN2jYa
   ECIgStv46NYx0wSQP+qkH2yR96FmPe3uPq7zB8swrVScbNTWo+IcTzgsY
   13Qx9NDJ5bti1ZkXCl8k/ULK4WJJySlNpNv34wB/ccIt9gvlnnlRFS94Q
   t2qKxhrJTFtPWJXtLc5O9UlwQ5w7MXlvnIMHO/94DJQMqnJ6766de2DJe
   toNu9t7+sPibLEbWxCqSThFsFhLcZmWucY7/QF9iRJ9lHSW2OdMvNm+JU
   Q==;
X-CSE-ConnectionGUID: kzHWww5DT6y/mWL+5zx3sg==
X-CSE-MsgGUID: egNBGMfVTfioOjOxMCTttA==
X-IronPort-AV: E=McAfee;i="6700,10204,11294"; a="45979551"
X-IronPort-AV: E=Sophos;i="6.12,256,1728975600"; 
   d="scan'208";a="45979551"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2024 15:58:10 -0800
X-CSE-ConnectionGUID: WBZ7vuHeTqO0B6GLg8UVDQ==
X-CSE-MsgGUID: 3395XK/0T7Oq6gTqbJFO8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="130015976"
Received: from lkp-server01.sh.intel.com (HELO a46f226878e0) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 22 Dec 2024 15:58:08 -0800
Received: from kbuild by a46f226878e0 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tPVpm-0003Hj-1j;
	Sun, 22 Dec 2024 23:58:06 +0000
Date: Mon, 23 Dec 2024 07:57:34 +0800
From: kernel test robot <lkp@intel.com>
To: Louis Chauvet <louis.chauvet@bootlin.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Vinod Koul <vkoul@kernel.org>
Subject: drivers/dma/xilinx/xdma.c:76: warning: Function parameter or struct
 member 'last_interrupt' not described in 'xdma_chan'
Message-ID: <202412230745.NH8G1nhv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   bcde95ce32b666478d6737219caa4f8005a8f201
commit: 6a40fb8245965b481b4dcce011cd63f20bf91ee0 dmaengine: xilinx: xdma: Fix synchronization issue
date:   9 months ago
config: nios2-randconfig-001-20241220 (https://download.01.org/0day-ci/archive/20241223/202412230745.NH8G1nhv-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241223/202412230745.NH8G1nhv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412230745.NH8G1nhv-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/dma/xilinx/xdma.c:76: warning: Function parameter or struct member 'last_interrupt' not described in 'xdma_chan'
>> drivers/dma/xilinx/xdma.c:76: warning: Function parameter or struct member 'stop_requested' not described in 'xdma_chan'


vim +76 drivers/dma/xilinx/xdma.c

17ce252266c7f0 Lizhi Hou     2023-01-19  53  
17ce252266c7f0 Lizhi Hou     2023-01-19  54  /**
17ce252266c7f0 Lizhi Hou     2023-01-19  55   * struct xdma_chan - Driver specific DMA channel structure
17ce252266c7f0 Lizhi Hou     2023-01-19  56   * @vchan: Virtual channel
17ce252266c7f0 Lizhi Hou     2023-01-19  57   * @xdev_hdl: Pointer to DMA device structure
17ce252266c7f0 Lizhi Hou     2023-01-19  58   * @base: Offset of channel registers
17ce252266c7f0 Lizhi Hou     2023-01-19  59   * @desc_pool: Descriptor pool
17ce252266c7f0 Lizhi Hou     2023-01-19  60   * @busy: Busy flag of the channel
17ce252266c7f0 Lizhi Hou     2023-01-19  61   * @dir: Transferring direction of the channel
17ce252266c7f0 Lizhi Hou     2023-01-19  62   * @cfg: Transferring config of the channel
17ce252266c7f0 Lizhi Hou     2023-01-19  63   * @irq: IRQ assigned to the channel
17ce252266c7f0 Lizhi Hou     2023-01-19  64   */
17ce252266c7f0 Lizhi Hou     2023-01-19  65  struct xdma_chan {
17ce252266c7f0 Lizhi Hou     2023-01-19  66  	struct virt_dma_chan		vchan;
17ce252266c7f0 Lizhi Hou     2023-01-19  67  	void				*xdev_hdl;
17ce252266c7f0 Lizhi Hou     2023-01-19  68  	u32				base;
17ce252266c7f0 Lizhi Hou     2023-01-19  69  	struct dma_pool			*desc_pool;
17ce252266c7f0 Lizhi Hou     2023-01-19  70  	bool				busy;
17ce252266c7f0 Lizhi Hou     2023-01-19  71  	enum dma_transfer_direction	dir;
17ce252266c7f0 Lizhi Hou     2023-01-19  72  	struct dma_slave_config		cfg;
17ce252266c7f0 Lizhi Hou     2023-01-19  73  	u32				irq;
6a40fb8245965b Louis Chauvet 2024-03-27  74  	struct completion		last_interrupt;
6a40fb8245965b Louis Chauvet 2024-03-27  75  	bool				stop_requested;
17ce252266c7f0 Lizhi Hou     2023-01-19 @76  };
17ce252266c7f0 Lizhi Hou     2023-01-19  77  

:::::: The code at line 76 was first introduced by commit
:::::: 17ce252266c7f016ece026492c45838f852ddc79 dmaengine: xilinx: xdma: Add xilinx xdma driver

:::::: TO: Lizhi Hou <lizhi.hou@amd.com>
:::::: CC: Vinod Koul <vkoul@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
