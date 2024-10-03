Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D94BF12E7E
	for <oe-kbuild-all@lists.linux.dev>; Thu,  3 Oct 2024 02:20:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727922054; cv=none; b=IJ784rhsWM7yC3W+RyXAEE0KzY5wuMOB/5C6W3uXENh3ETJA8Ef/gaVFzF/RUNbzwNNONc7FE6ZpHZ/hFX5C7uhxe/dAmyo1Rb+88c2hRGGGISFiNo5P1wL3rOpyXY1GQG9sIlIbBYRpK4Aw6eeq+CEeYmJD6Qw3VYE1gGttXpM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727922054; c=relaxed/simple;
	bh=seCc86fkk2BlxoZwO0DuLlduo0AuSIZNTOEzxo2cEFk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=O+9TjBfbsP1AqcdspkqIdMrmoAhLj5aPrkBHR9LM7U6WqAQ6+1XZ05+G9J/S1ilQi3vKbhVfoE8AfF7YIewqxHZtUMVGVN6Wt0j1avQlsehl3CMTtJT/Xkiei2lDAFFw1PiqZspdV7/tmt33Ijdq6DDrWmxar1MVV+PUQONP2Bs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hRtENM6x; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hRtENM6x"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727922052; x=1759458052;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=seCc86fkk2BlxoZwO0DuLlduo0AuSIZNTOEzxo2cEFk=;
  b=hRtENM6xOQ+Vw8sDC0+WCcMDybr7KwnxV2P25bYXc0vcqd5jKdgycKIn
   DPnymuzdeBNk8rmjtdn3xBny4mmfKD7HecO0IIZM5zC/KGpObQGZ4lcj0
   o13YHv98xBxBj0CNx68DoWyMpkVQwqYTQvNVksUwXYNMgGgu3rXw5iceT
   yWEdYfGWm315gesyxZDTvs26lFGEgUiQeaGSa1zV5w+w5ySAuFjQr0sc2
   mpE+ytovRry2FbE1m/T1ezfUTXa9SCABJ//osUw+EMooRz31+x+K9eb4l
   G/zFhP+SQK2fMWRLi9yLA3C3Bx83aYNh0j7REhJiUI92TgVoLPB010Nwv
   Q==;
X-CSE-ConnectionGUID: eCUuNp9MTYilIiQssnYDxQ==
X-CSE-MsgGUID: gN5Gi7bHT4WJ9J3Vg65iMA==
X-IronPort-AV: E=McAfee;i="6700,10204,11213"; a="27237869"
X-IronPort-AV: E=Sophos;i="6.11,173,1725346800"; 
   d="scan'208";a="27237869"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2024 19:20:51 -0700
X-CSE-ConnectionGUID: 4QekZO39QqeSvNUmq50vuQ==
X-CSE-MsgGUID: 1LMEHxn9RvmolzA3qmGIxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,173,1725346800"; 
   d="scan'208";a="73786972"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 02 Oct 2024 19:20:50 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1swBSR-000UpV-2W;
	Thu, 03 Oct 2024 02:20:47 +0000
Date: Thu, 3 Oct 2024 10:20:24 +0800
From: kernel test robot <lkp@intel.com>
To: Appana Durga Kedareswara Rao <appana.durga.rao@xilinx.com>
Cc: oe-kbuild-all@lists.linux.dev, git@amd.com,
	Michal Simek <monstr@monstr.eu>,
	Radhey Shyam Pandey <radheys@xilinx.com>
Subject: [xilinx-xlnx:xlnx_rebase_v6.6_LTS_2024.1_update 101/1001]
 drivers/dma/xilinx/vdmatest.c:89: warning: expecting prototype for struct
 vdmatest_slave_thread. Prototype was for struct xilinx_vdmatest_slave_thread
 instead
Message-ID: <202410031008.yGHxwKHe-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Xilinx/linux-xlnx xlnx_rebase_v6.6_LTS_2024.1_update
head:   5365c13a86998da06d845c918f849b30b8735538
commit: 60078bf56586e0017e42bed20d4d2d03c4ea30e5 [101/1001] dmaengine: xilinx: Add vdmatest test client code
config: i386-allyesconfig (https://download.01.org/0day-ci/archive/20241003/202410031008.yGHxwKHe-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241003/202410031008.yGHxwKHe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410031008.yGHxwKHe-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/dma/xilinx/vdmatest.c:89: warning: expecting prototype for struct vdmatest_slave_thread. Prototype was for struct xilinx_vdmatest_slave_thread instead
>> drivers/dma/xilinx/vdmatest.c:101: warning: expecting prototype for struct vdmatest_chan. Prototype was for struct xilinx_vdmatest_chan instead


vim +89 drivers/dma/xilinx/vdmatest.c

    69	
    70	/**
    71	 * struct vdmatest_slave_thread - VDMA test thread
    72	 * @node: Thread node
    73	 * @task: Task structure pointer
    74	 * @tx_chan: Tx channel pointer
    75	 * @rx_chan: Rx Channel pointer
    76	 * @srcs: Source buffer
    77	 * @dsts: Destination buffer
    78	 * @type: DMA transaction type
    79	 */
    80	struct xilinx_vdmatest_slave_thread {
    81		struct list_head node;
    82		struct task_struct *task;
    83		struct dma_chan *tx_chan;
    84		struct dma_chan *rx_chan;
    85		u8 **srcs;
    86		u8 **dsts;
    87		enum dma_transaction_type type;
    88		bool done;
  > 89	};
    90	
    91	/**
    92	 * struct vdmatest_chan - VDMA Test channel
    93	 * @node: Channel node
    94	 * @chan: DMA channel pointer
    95	 * @threads: List of VDMA test threads
    96	 */
    97	struct xilinx_vdmatest_chan {
    98		struct list_head node;
    99		struct dma_chan *chan;
   100		struct list_head threads;
 > 101	};
   102	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
