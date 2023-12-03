Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C8CCA34
	for <oe-kbuild-all@lists.linux.dev>; Sun,  3 Dec 2023 06:33:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SBqymdjZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701585182; x=1733121182;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6eKO4nEzLDasR26T3fYnDSXzeLrrAqL2IcrWWrvowXM=;
  b=SBqymdjZ/1rYKbVmN7WnxcmaL0kiAeWZ5xN6XOFIAE+i0uP/q97+OIQv
   vD5Gy+sh/Uc0Q0n2Un7iKabRF2d9y87lC7JZhTAwyj66PWMehpFT0Kjs8
   jZuTbyH0JBL+bniIa7yvMxVw8cu45YOXWkleCMaMMBa1INI6PSSrGtxFu
   l3sBT9l/YfSbd/WE85MRwxVrLN9jM+AkdR5PKSEZsY9iWxrEjkii+R7Cm
   TQQV+YIfyXYc8sR1QV3VGOMPIAb0yhBZxf377XBhwmau7/Kxi0uhEzE7T
   KIZG+hnKQXAEJZb6pcBmgxyjuC8zuUMFVxa6HLos8glL5yl5r2ZW+YsN9
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10912"; a="6906535"
X-IronPort-AV: E=Sophos;i="6.04,246,1695711600"; 
   d="scan'208";a="6906535"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2023 22:32:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10912"; a="770191166"
X-IronPort-AV: E=Sophos;i="6.04,246,1695711600"; 
   d="scan'208";a="770191166"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 02 Dec 2023 22:32:47 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r9g21-0006MO-0E;
	Sun, 03 Dec 2023 06:32:45 +0000
Date: Sun, 3 Dec 2023 14:32:02 +0800
From: kernel test robot <lkp@intel.com>
To: Kunal Rane <kunal.rane@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, git@amd.com,
	Michal Simek <monstr@monstr.eu>, Vishal Sagar <vishal.sagar@amd.co>
Subject: [xilinx-xlnx:master 21/32]
 drivers/media/platform/xilinx/xilinx-hdcp2x-rx.c:120:20: warning: assignment
 to 'struct xlnx_hdcp2x_config *' from 'int' makes pointer from integer
 without a cast
Message-ID: <202312031258.i5X8EayV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Xilinx/linux-xlnx master
head:   c8b3583bc86352009c6ac61e2ced0e12118f8ebb
commit: a89e660050e0a228670b89b0a59b5c2827a9e26e [21/32] v4l2: xilinx: dprx: Add HDCP2x support
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20231203/202312031258.i5X8EayV-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231203/202312031258.i5X8EayV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312031258.i5X8EayV-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/media/platform/xilinx/xilinx-hdcp2x-rx.c: In function 'xhdcp2x_rx_init':
   drivers/media/platform/xilinx/xilinx-hdcp2x-rx.c:120:22: error: implicit declaration of function 'kzalloc'; did you mean 'vzalloc'? [-Werror=implicit-function-declaration]
     120 |         xhdcp2x_rx = kzalloc(sizeof(*xhdcp2x_rx), GFP_KERNEL);
         |                      ^~~~~~~
         |                      vzalloc
>> drivers/media/platform/xilinx/xilinx-hdcp2x-rx.c:120:20: warning: assignment to 'struct xlnx_hdcp2x_config *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     120 |         xhdcp2x_rx = kzalloc(sizeof(*xhdcp2x_rx), GFP_KERNEL);
         |                    ^
   cc1: some warnings being treated as errors


vim +120 drivers/media/platform/xilinx/xilinx-hdcp2x-rx.c

f22aab6b6fea09 Kunal Rane 2023-09-04  105  
f22aab6b6fea09 Kunal Rane 2023-09-04  106  int *xhdcp2x_rx_init(struct device *dev, void *protocol_ref, void __iomem *xhdcp_base_address,
f22aab6b6fea09 Kunal Rane 2023-09-04  107  		     enum xhdcp2x_rx_protocol protocol_rx, bool is_repeater, u8 lane_count)
f22aab6b6fea09 Kunal Rane 2023-09-04  108  {
f22aab6b6fea09 Kunal Rane 2023-09-04  109  	int status;
f22aab6b6fea09 Kunal Rane 2023-09-04  110  	struct xlnx_hdcp2x_config *xhdcp2x_rx;
f22aab6b6fea09 Kunal Rane 2023-09-04  111  
f22aab6b6fea09 Kunal Rane 2023-09-04  112  	if (!dev || !protocol_ref || !xhdcp_base_address)
f22aab6b6fea09 Kunal Rane 2023-09-04  113  		return ERR_PTR(-EINVAL);
f22aab6b6fea09 Kunal Rane 2023-09-04  114  
f22aab6b6fea09 Kunal Rane 2023-09-04  115  	if (is_repeater) {
f22aab6b6fea09 Kunal Rane 2023-09-04  116  		dev_info(dev, "Hdcp2x repeater functionality not supported\n");
f22aab6b6fea09 Kunal Rane 2023-09-04  117  		return ERR_PTR(-EINVAL);
f22aab6b6fea09 Kunal Rane 2023-09-04  118  	}
f22aab6b6fea09 Kunal Rane 2023-09-04  119  
f22aab6b6fea09 Kunal Rane 2023-09-04 @120  	xhdcp2x_rx = kzalloc(sizeof(*xhdcp2x_rx), GFP_KERNEL);
f22aab6b6fea09 Kunal Rane 2023-09-04  121  	if (!xhdcp2x_rx)
f22aab6b6fea09 Kunal Rane 2023-09-04  122  		return ERR_PTR(-ENOMEM);
f22aab6b6fea09 Kunal Rane 2023-09-04  123  
f22aab6b6fea09 Kunal Rane 2023-09-04  124  	xhdcp2x_rx->xhdcp2x_hw.hdcp2xcore_address = (void __iomem *)xhdcp_base_address;
f22aab6b6fea09 Kunal Rane 2023-09-04  125  	xhdcp2x_rx->dev = dev;
f22aab6b6fea09 Kunal Rane 2023-09-04  126  	xhdcp2x_rx->interface_ref = protocol_ref;
f22aab6b6fea09 Kunal Rane 2023-09-04  127  	xhdcp2x_rx->interface_base = xhdcp_base_address;
f22aab6b6fea09 Kunal Rane 2023-09-04  128  	xhdcp2x_rx->is_repeater = is_repeater ? 1 : 0;
f22aab6b6fea09 Kunal Rane 2023-09-04  129  	xhdcp2x_rx->lane_count = lane_count;
f22aab6b6fea09 Kunal Rane 2023-09-04  130  	xhdcp2x_rx->protocol = protocol_rx;
f22aab6b6fea09 Kunal Rane 2023-09-04  131  	xhdcp2x_rx->rx_caps[0] = HDCP_2_2_RX_CAPS_VERSION_VAL;
f22aab6b6fea09 Kunal Rane 2023-09-04  132  	xhdcp2x_rx->rx_caps[1] = 0x00;
f22aab6b6fea09 Kunal Rane 2023-09-04  133  	xhdcp2x_rx->rx_caps[2] = (xhdcp2x_rx->mode == xhdcp2x_rx_receiver) ?
f22aab6b6fea09 Kunal Rane 2023-09-04  134  				RXCAPS_HDCP_ENABLE :  RXCAPS_REPEATER;
f22aab6b6fea09 Kunal Rane 2023-09-04  135  	xhdcp2x_rx->keys_loaded = 0;
f22aab6b6fea09 Kunal Rane 2023-09-04  136  
f22aab6b6fea09 Kunal Rane 2023-09-04  137  	xhdcp2x_rx->xhdcp2x_hw.rng_inst.rng_coreaddress =
f22aab6b6fea09 Kunal Rane 2023-09-04  138  		xhdcp2x_rx->xhdcp2x_hw.hdcp2xcore_address + XHDCP2X_RNG_OFFSET;
f22aab6b6fea09 Kunal Rane 2023-09-04  139  	xhdcp2x_rx->xhdcp2x_hw.mmult_inst.mmult_coreaddress =
f22aab6b6fea09 Kunal Rane 2023-09-04  140  		xhdcp2x_rx->xhdcp2x_hw.hdcp2xcore_address + XHDCP2X_MMULT_OFFSET;
f22aab6b6fea09 Kunal Rane 2023-09-04  141  	xhdcp2x_rx->xhdcp2x_hw.cipher_inst.cipher_coreaddress =
f22aab6b6fea09 Kunal Rane 2023-09-04  142  		xhdcp2x_rx->xhdcp2x_hw.hdcp2xcore_address + XHDCP2X_CIPHER_OFFSET;
f22aab6b6fea09 Kunal Rane 2023-09-04  143  
f22aab6b6fea09 Kunal Rane 2023-09-04  144  	status = xlnx_hdcp2x_rng_cfg_init(&xhdcp2x_rx->xhdcp2x_hw.rng_inst);
f22aab6b6fea09 Kunal Rane 2023-09-04  145  	if (status < 0)
f22aab6b6fea09 Kunal Rane 2023-09-04  146  		return ERR_PTR(-EINVAL);
f22aab6b6fea09 Kunal Rane 2023-09-04  147  
f22aab6b6fea09 Kunal Rane 2023-09-04  148  	status = xlnx_hdcp2x_mmult_cfginit(&xhdcp2x_rx->xhdcp2x_hw.mmult_inst);
f22aab6b6fea09 Kunal Rane 2023-09-04  149  	if (status < 0)
f22aab6b6fea09 Kunal Rane 2023-09-04  150  		return ERR_PTR(-EINVAL);
f22aab6b6fea09 Kunal Rane 2023-09-04  151  
f22aab6b6fea09 Kunal Rane 2023-09-04  152  	status = xlnx_hdcp2x_cipher_cfg_init(&xhdcp2x_rx->xhdcp2x_hw.cipher_inst);
f22aab6b6fea09 Kunal Rane 2023-09-04  153  	if (status < 0)
f22aab6b6fea09 Kunal Rane 2023-09-04  154  		return ERR_PTR(-EINVAL);
f22aab6b6fea09 Kunal Rane 2023-09-04  155  
f22aab6b6fea09 Kunal Rane 2023-09-04  156  	xlnx_hdcp2x_rx_cipher_init(&xhdcp2x_rx->xhdcp2x_hw.cipher_inst);
f22aab6b6fea09 Kunal Rane 2023-09-04  157  
f22aab6b6fea09 Kunal Rane 2023-09-04  158  	mutex_init(&xhdcp2x_rx->hdcprx_mutex);
f22aab6b6fea09 Kunal Rane 2023-09-04  159  
f22aab6b6fea09 Kunal Rane 2023-09-04  160  	INIT_DELAYED_WORK(&xhdcp2x_rx->sm_work, xhdcp2x_sm_work_func);
f22aab6b6fea09 Kunal Rane 2023-09-04  161  
f22aab6b6fea09 Kunal Rane 2023-09-04  162  	return (void *)xhdcp2x_rx;
f22aab6b6fea09 Kunal Rane 2023-09-04  163  }
f22aab6b6fea09 Kunal Rane 2023-09-04  164  

:::::: The code at line 120 was first introduced by commit
:::::: f22aab6b6fea09fe2a51968c7f6687eb55886157 v4l2: xilinx: Add HDCP2x Rx support

:::::: TO: Kunal Rane <kunal.rane@amd.com>
:::::: CC: Michal Simek <michal.simek@amd.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
