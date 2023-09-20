Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA77842BE2
	for <oe-kbuild-all@lists.linux.dev>; Wed, 20 Sep 2023 22:28:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695248907; x=1726784907;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sZgbw2NPXjKEr66TPP+W5kacQEm1toqtpgHrn2xpDvg=;
  b=bh3mWYaHwvmPBJKVdpuS1Axiu8fn3DK0kAAWlHnem5+sxrviKodqOOP7
   wprG3fxPuD0z9XQNlhkTLsuz3vRFPiqFyskl3FtVMTnut1lJmpYgedPZi
   1Uluwblx2P2iW3dM6f38vM2O9fh+MCy0pRAmAKI+Fq9BzwEdJxW74r8RJ
   mm1vfrc5DpX1psxIfNLmEtGW8TUp30qje7LW4S9u06aFAHAjh2gpgBg4o
   LObXV14wahwSfM5jnnZ9Dth1CNDo/hxIKdL6P9rB0sjmia+5PS/q+gYzP
   GV5Fqok4JMHmHRcgjmZ1IZ0K8INVtAu6A23jnvYW45S3rOoXCk2DRGOFz
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="359738959"
X-IronPort-AV: E=Sophos;i="6.03,162,1694761200"; 
   d="scan'208";a="359738959"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Sep 2023 15:28:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="890120733"
X-IronPort-AV: E=Sophos;i="6.03,162,1694761200"; 
   d="scan'208";a="890120733"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 20 Sep 2023 15:27:35 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qj5gF-0009DI-09;
	Wed, 20 Sep 2023 22:28:23 +0000
Date: Thu, 21 Sep 2023 06:27:35 +0800
From: kernel test robot <lkp@intel.com>
To: Kunal Rane <kunal.rane@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, git@amd.com,
	Michal Simek <monstr@monstr.eu>, Vishal Sagar <vishal.sagar@amd.co>
Subject: [xilinx-xlnx:xlnx_rebase_v6.1_LTS 1359/1365]
 drivers/media/platform/xilinx/xilinx-hdcp2x-rx.c:120:22: error: implicit
 declaration of function 'kzalloc'; did you mean 'vzalloc'?
Message-ID: <202309210635.fM3RfkPc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Kunal,

First bad commit (maybe != root cause):

tree:   https://github.com/Xilinx/linux-xlnx xlnx_rebase_v6.1_LTS
head:   008e6788f5aa09862307822bfc396c926dc0dbac
commit: 63a2ddb4ca597d67d4e4e858761c1f7ff81ebd11 [1359/1365] v4l2: xilinx: dprx: Add HDCP2x support
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20230921/202309210635.fM3RfkPc-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230921/202309210635.fM3RfkPc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309210635.fM3RfkPc-lkp@intel.com/

Note: the xilinx-xlnx/xlnx_rebase_v6.1_LTS HEAD 008e6788f5aa09862307822bfc396c926dc0dbac builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

   drivers/media/platform/xilinx/xilinx-hdcp2x-rx.c: In function 'xhdcp2x_rx_init':
>> drivers/media/platform/xilinx/xilinx-hdcp2x-rx.c:120:22: error: implicit declaration of function 'kzalloc'; did you mean 'vzalloc'? [-Werror=implicit-function-declaration]
     120 |         xhdcp2x_rx = kzalloc(sizeof(*xhdcp2x_rx), GFP_KERNEL);
         |                      ^~~~~~~
         |                      vzalloc
   drivers/media/platform/xilinx/xilinx-hdcp2x-rx.c:120:20: warning: assignment to 'struct xlnx_hdcp2x_config *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     120 |         xhdcp2x_rx = kzalloc(sizeof(*xhdcp2x_rx), GFP_KERNEL);
         |                    ^
   cc1: some warnings being treated as errors


vim +120 drivers/media/platform/xilinx/xilinx-hdcp2x-rx.c

727d5d0c59572f Kunal Rane 2023-09-04  105  
727d5d0c59572f Kunal Rane 2023-09-04  106  int *xhdcp2x_rx_init(struct device *dev, void *protocol_ref, void __iomem *xhdcp_base_address,
727d5d0c59572f Kunal Rane 2023-09-04  107  		     enum xhdcp2x_rx_protocol protocol_rx, bool is_repeater, u8 lane_count)
727d5d0c59572f Kunal Rane 2023-09-04  108  {
727d5d0c59572f Kunal Rane 2023-09-04  109  	int status;
727d5d0c59572f Kunal Rane 2023-09-04  110  	struct xlnx_hdcp2x_config *xhdcp2x_rx;
727d5d0c59572f Kunal Rane 2023-09-04  111  
727d5d0c59572f Kunal Rane 2023-09-04  112  	if (!dev || !protocol_ref || !xhdcp_base_address)
727d5d0c59572f Kunal Rane 2023-09-04  113  		return ERR_PTR(-EINVAL);
727d5d0c59572f Kunal Rane 2023-09-04  114  
727d5d0c59572f Kunal Rane 2023-09-04  115  	if (is_repeater) {
727d5d0c59572f Kunal Rane 2023-09-04  116  		dev_info(dev, "Hdcp2x repeater functionality not supported\n");
727d5d0c59572f Kunal Rane 2023-09-04  117  		return ERR_PTR(-EINVAL);
727d5d0c59572f Kunal Rane 2023-09-04  118  	}
727d5d0c59572f Kunal Rane 2023-09-04  119  
727d5d0c59572f Kunal Rane 2023-09-04 @120  	xhdcp2x_rx = kzalloc(sizeof(*xhdcp2x_rx), GFP_KERNEL);
727d5d0c59572f Kunal Rane 2023-09-04  121  	if (!xhdcp2x_rx)
727d5d0c59572f Kunal Rane 2023-09-04  122  		return ERR_PTR(-ENOMEM);
727d5d0c59572f Kunal Rane 2023-09-04  123  
727d5d0c59572f Kunal Rane 2023-09-04  124  	xhdcp2x_rx->xhdcp2x_hw.hdcp2xcore_address = (void __iomem *)xhdcp_base_address;
727d5d0c59572f Kunal Rane 2023-09-04  125  	xhdcp2x_rx->dev = dev;
727d5d0c59572f Kunal Rane 2023-09-04  126  	xhdcp2x_rx->interface_ref = protocol_ref;
727d5d0c59572f Kunal Rane 2023-09-04  127  	xhdcp2x_rx->interface_base = xhdcp_base_address;
727d5d0c59572f Kunal Rane 2023-09-04  128  	xhdcp2x_rx->is_repeater = is_repeater ? 1 : 0;
727d5d0c59572f Kunal Rane 2023-09-04  129  	xhdcp2x_rx->lane_count = lane_count;
727d5d0c59572f Kunal Rane 2023-09-04  130  	xhdcp2x_rx->protocol = protocol_rx;
727d5d0c59572f Kunal Rane 2023-09-04  131  	xhdcp2x_rx->rx_caps[0] = HDCP_2_2_RX_CAPS_VERSION_VAL;
727d5d0c59572f Kunal Rane 2023-09-04  132  	xhdcp2x_rx->rx_caps[1] = 0x00;
727d5d0c59572f Kunal Rane 2023-09-04  133  	xhdcp2x_rx->rx_caps[2] = (xhdcp2x_rx->mode == xhdcp2x_rx_receiver) ?
727d5d0c59572f Kunal Rane 2023-09-04  134  				RXCAPS_HDCP_ENABLE :  RXCAPS_REPEATER;
727d5d0c59572f Kunal Rane 2023-09-04  135  	xhdcp2x_rx->keys_loaded = 0;
727d5d0c59572f Kunal Rane 2023-09-04  136  
727d5d0c59572f Kunal Rane 2023-09-04  137  	xhdcp2x_rx->xhdcp2x_hw.rng_inst.rng_coreaddress =
727d5d0c59572f Kunal Rane 2023-09-04  138  		xhdcp2x_rx->xhdcp2x_hw.hdcp2xcore_address + XHDCP2X_RNG_OFFSET;
727d5d0c59572f Kunal Rane 2023-09-04  139  	xhdcp2x_rx->xhdcp2x_hw.mmult_inst.mmult_coreaddress =
727d5d0c59572f Kunal Rane 2023-09-04  140  		xhdcp2x_rx->xhdcp2x_hw.hdcp2xcore_address + XHDCP2X_MMULT_OFFSET;
727d5d0c59572f Kunal Rane 2023-09-04  141  	xhdcp2x_rx->xhdcp2x_hw.cipher_inst.cipher_coreaddress =
727d5d0c59572f Kunal Rane 2023-09-04  142  		xhdcp2x_rx->xhdcp2x_hw.hdcp2xcore_address + XHDCP2X_CIPHER_OFFSET;
727d5d0c59572f Kunal Rane 2023-09-04  143  
727d5d0c59572f Kunal Rane 2023-09-04  144  	status = xlnx_hdcp2x_rng_cfg_init(&xhdcp2x_rx->xhdcp2x_hw.rng_inst);
727d5d0c59572f Kunal Rane 2023-09-04  145  	if (status < 0)
727d5d0c59572f Kunal Rane 2023-09-04  146  		return ERR_PTR(-EINVAL);
727d5d0c59572f Kunal Rane 2023-09-04  147  
727d5d0c59572f Kunal Rane 2023-09-04  148  	status = xlnx_hdcp2x_mmult_cfginit(&xhdcp2x_rx->xhdcp2x_hw.mmult_inst);
727d5d0c59572f Kunal Rane 2023-09-04  149  	if (status < 0)
727d5d0c59572f Kunal Rane 2023-09-04  150  		return ERR_PTR(-EINVAL);
727d5d0c59572f Kunal Rane 2023-09-04  151  
727d5d0c59572f Kunal Rane 2023-09-04  152  	status = xlnx_hdcp2x_cipher_cfg_init(&xhdcp2x_rx->xhdcp2x_hw.cipher_inst);
727d5d0c59572f Kunal Rane 2023-09-04  153  	if (status < 0)
727d5d0c59572f Kunal Rane 2023-09-04  154  		return ERR_PTR(-EINVAL);
727d5d0c59572f Kunal Rane 2023-09-04  155  
727d5d0c59572f Kunal Rane 2023-09-04  156  	xlnx_hdcp2x_rx_cipher_init(&xhdcp2x_rx->xhdcp2x_hw.cipher_inst);
727d5d0c59572f Kunal Rane 2023-09-04  157  
727d5d0c59572f Kunal Rane 2023-09-04  158  	mutex_init(&xhdcp2x_rx->hdcprx_mutex);
727d5d0c59572f Kunal Rane 2023-09-04  159  
727d5d0c59572f Kunal Rane 2023-09-04  160  	INIT_DELAYED_WORK(&xhdcp2x_rx->sm_work, xhdcp2x_sm_work_func);
727d5d0c59572f Kunal Rane 2023-09-04  161  
727d5d0c59572f Kunal Rane 2023-09-04  162  	return (void *)xhdcp2x_rx;
727d5d0c59572f Kunal Rane 2023-09-04  163  }
727d5d0c59572f Kunal Rane 2023-09-04  164  

:::::: The code at line 120 was first introduced by commit
:::::: 727d5d0c59572f086ee1f33334aac4b02205f87c v4l2: xilinx: Add HDCP2x Rx support

:::::: TO: Kunal Rane <kunal.rane@amd.com>
:::::: CC: Michal Simek <michal.simek@amd.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
