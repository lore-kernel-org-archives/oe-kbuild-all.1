Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E05AF1FC114
	for <oe-kbuild-all@lists.linux.dev>; Fri, 10 Jan 2025 16:33:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736526816; cv=none; b=f+NxmWNQFf70O+D8o3Jd4kGILZsIdfe0SG+s9a2VoUNSiB/qKVs2MkAmUI5YcEaCdWdZe0vF7Ek6njHuZj+p/NSf4RR+tWI/yx2JXCPkD9IB6CzhoWB3HTs+zL+srHV61TZvaKBDLhubSqJrb89ofXvk9Hg/PjZb40gJ3h7mXNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736526816; c=relaxed/simple;
	bh=6eQNJW0dOh7uDnz7+gL0fk6Bp/PMjY1Y1MT+U/Q+6dc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Xes2PDUrcrITblxMOE1ncp8EpgSGqiRdvxJo/tuVeh8VqsrNFlIORr+G4v3Nw7sWNHhTJyVX6hHuQqOXL6cn16FeYSpnC2oIAMrAXawDInctHyCRkDpy7xuXcf6fT3YOHMeGJQuKdGxWkZxm9T+vWBK/ZZ7j0Uqk7pDsnDYSCM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YiVCqft1; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YiVCqft1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736526815; x=1768062815;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6eQNJW0dOh7uDnz7+gL0fk6Bp/PMjY1Y1MT+U/Q+6dc=;
  b=YiVCqft1knqwLpNTTjeEejqAhjnDu4NUL+ixg2LifltrHHpIAWODZQJE
   uVdSCSIQ/rzTLaYrKLpQTWVcFkoRh1FN52zd4Afd2udspeS2OBakN/Sqg
   O1+H9JgpnLWv+WkSRNrkeSEVv0BBizLQp/ewUVWZSMjF+173CQxZ8KXlt
   lNkQeIhgiDxT1aSV9jQ6cZ+gHKLcObhThj+LEOygICab7d9jjZw3okpOK
   qCzKodr4fmVna5yCYDxv8ukVwRYbghlmXIQl4KQX4UhHMyYeh5Y+rmiE7
   Lnec8bybI7EI5PKMmVW7WwGKqAHi9DIfCFTALJhM7EIVRwpApdJVZ4Lec
   A==;
X-CSE-ConnectionGUID: DJ+hVbr2RQyglS2Lr3x56Q==
X-CSE-MsgGUID: oDfSZ6WGTASlbWiIDc3hyQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11311"; a="59304960"
X-IronPort-AV: E=Sophos;i="6.12,303,1728975600"; 
   d="scan'208";a="59304960"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jan 2025 08:33:34 -0800
X-CSE-ConnectionGUID: W8j4MKw8SBKJa2LjInxXIw==
X-CSE-MsgGUID: vDwGgJJrQvWG/W9bc1Llfw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,303,1728975600"; 
   d="scan'208";a="108687178"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 10 Jan 2025 08:33:32 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tWHww-000JTv-1A;
	Fri, 10 Jan 2025 16:33:30 +0000
Date: Sat, 11 Jan 2025 00:33:04 +0800
From: kernel test robot <lkp@intel.com>
To: Appana Durga Kedareswara Rao <appana.durga.rao@xilinx.com>
Cc: oe-kbuild-all@lists.linux.dev, git@amd.com,
	Michal Simek <monstr@monstr.eu>,
	Radhey Shyam Pandey <radheys@xilinx.com>
Subject: [xilinx-xlnx:lkp_test 70/504] drivers/dma/xilinx/vdmatest.c:89:
 warning: expecting prototype for struct vdmatest_slave_thread. Prototype was
 for struct xilinx_vdmatest_slave_thread instead
Message-ID: <202501110054.HJmq2XdY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Xilinx/linux-xlnx lkp_test
head:   9ac6b4acf9144465ac1408d4d799635dec0223a0
commit: 4a3c6908ff0fc31948a14581241be863a4d2d876 [70/504] dmaengine: xilinx: Add vdmatest test client code
config: s390-allyesconfig (https://download.01.org/0day-ci/archive/20250111/202501110054.HJmq2XdY-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250111/202501110054.HJmq2XdY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501110054.HJmq2XdY-lkp@intel.com/

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
