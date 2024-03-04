Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8457B4688
	for <oe-kbuild-all@lists.linux.dev>; Mon,  4 Mar 2024 04:02:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709524927; cv=none; b=cX97+AlAM8x53++KQYD1hzbpEIZTqcDBjEsgaNBwmkmGE4cFKf9mAMiuiYzalw7A9WPj4ohr9MEX3pskC2uFL0Ykc2hU1P0IAvlP/HCAjJkA9za0qWO6VcRoABeAtE/LUzfSG6VpXuwfi6AnTveI1Dj4Jit3uO0OMHPRxamHBTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709524927; c=relaxed/simple;
	bh=JLmFIhUsLr9VGGeXNuu9v4s8x7Y9KYqEJjklzDUETZc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=is6SvWGRONv2gE1+oJUYszTRhiPKhftDf1XwhtYwiZm76ADXcQWX8Bqh6FLaWN3PEM1ygSGZF6sY0fwIdVM0tuKDbuVGWLjyR0F3xebRmDOPIbh/n01528pepmJ00pcLaAiFqruAxuvgvcB1oeQKnrlxcQMP1McLez9BOEyNuiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Xw5eyco+; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Xw5eyco+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709524925; x=1741060925;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JLmFIhUsLr9VGGeXNuu9v4s8x7Y9KYqEJjklzDUETZc=;
  b=Xw5eyco+I4elUb75em5VwHfqFZExDEW8g+a2x4vqaWdq9+oCybUCeDdS
   kQSNPCkyeG/2mgMR7Qk+Q0qgcF5OmrcptEho6TGOsixNfArQRQqlQdpk1
   FNIoxEMgNb+8pe015x2KeTDIM+OpFVPskYIg6Ksk1Erh/Bzw8+/aMeESF
   2BOlfWI1JgiUuqmoh1m+YxXXQkiJOSUkxMCA0mXU1AdI1hzHKI/lto6FP
   BPi7UKBaYt30SWsKUdLGaKmH7qDWTHh7Gv1fQJL2CHQx5JTd/AcZe1U9j
   rw+UCV6NUeF5qq1OazQZrP/JKdgdQooqXFOHov6ak3HFdeEfFudVfzjpQ
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11002"; a="4120729"
X-IronPort-AV: E=Sophos;i="6.06,203,1705392000"; 
   d="scan'208";a="4120729"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2024 20:02:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,203,1705392000"; 
   d="scan'208";a="8799564"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 03 Mar 2024 20:02:02 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rgzWa-0002KX-2o;
	Mon, 04 Mar 2024 04:02:00 +0000
Date: Mon, 4 Mar 2024 12:01:17 +0800
From: kernel test robot <lkp@intel.com>
To: Kunal Rane <kunal.rane@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, git@amd.com,
	Michal Simek <monstr@monstr.eu>, Vishal Sagar <vishal.sagar@amd.co>
Subject: [xilinx-xlnx:xlnx_rebase_v6.6 553/860]
 drivers/media/platform/xilinx/xilinx-hdcp2x-rx.c:120:22: error: implicit
 declaration of function 'kzalloc'; did you mean 'vzalloc'?
Message-ID: <202403041120.HXWIOYvb-lkp@intel.com>
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

tree:   https://github.com/Xilinx/linux-xlnx xlnx_rebase_v6.6
head:   24eec56fe5bd68cae795c37c61276b4dcf218a53
commit: 1204997d6408fb1e0f0bf7420c58e4f0e0db33bb [553/860] v4l2: xilinx: dprx: Add HDCP2x support
config: arc-allmodconfig (https://download.01.org/0day-ci/archive/20240304/202403041120.HXWIOYvb-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240304/202403041120.HXWIOYvb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403041120.HXWIOYvb-lkp@intel.com/

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

cec9562010804d Kunal Rane 2023-09-04  105  
cec9562010804d Kunal Rane 2023-09-04  106  int *xhdcp2x_rx_init(struct device *dev, void *protocol_ref, void __iomem *xhdcp_base_address,
cec9562010804d Kunal Rane 2023-09-04  107  		     enum xhdcp2x_rx_protocol protocol_rx, bool is_repeater, u8 lane_count)
cec9562010804d Kunal Rane 2023-09-04  108  {
cec9562010804d Kunal Rane 2023-09-04  109  	int status;
cec9562010804d Kunal Rane 2023-09-04  110  	struct xlnx_hdcp2x_config *xhdcp2x_rx;
cec9562010804d Kunal Rane 2023-09-04  111  
cec9562010804d Kunal Rane 2023-09-04  112  	if (!dev || !protocol_ref || !xhdcp_base_address)
cec9562010804d Kunal Rane 2023-09-04  113  		return ERR_PTR(-EINVAL);
cec9562010804d Kunal Rane 2023-09-04  114  
cec9562010804d Kunal Rane 2023-09-04  115  	if (is_repeater) {
cec9562010804d Kunal Rane 2023-09-04  116  		dev_info(dev, "Hdcp2x repeater functionality not supported\n");
cec9562010804d Kunal Rane 2023-09-04  117  		return ERR_PTR(-EINVAL);
cec9562010804d Kunal Rane 2023-09-04  118  	}
cec9562010804d Kunal Rane 2023-09-04  119  
cec9562010804d Kunal Rane 2023-09-04 @120  	xhdcp2x_rx = kzalloc(sizeof(*xhdcp2x_rx), GFP_KERNEL);
cec9562010804d Kunal Rane 2023-09-04  121  	if (!xhdcp2x_rx)
cec9562010804d Kunal Rane 2023-09-04  122  		return ERR_PTR(-ENOMEM);
cec9562010804d Kunal Rane 2023-09-04  123  
cec9562010804d Kunal Rane 2023-09-04  124  	xhdcp2x_rx->xhdcp2x_hw.hdcp2xcore_address = (void __iomem *)xhdcp_base_address;
cec9562010804d Kunal Rane 2023-09-04  125  	xhdcp2x_rx->dev = dev;
cec9562010804d Kunal Rane 2023-09-04  126  	xhdcp2x_rx->interface_ref = protocol_ref;
cec9562010804d Kunal Rane 2023-09-04  127  	xhdcp2x_rx->interface_base = xhdcp_base_address;
cec9562010804d Kunal Rane 2023-09-04  128  	xhdcp2x_rx->is_repeater = is_repeater ? 1 : 0;
cec9562010804d Kunal Rane 2023-09-04  129  	xhdcp2x_rx->lane_count = lane_count;
cec9562010804d Kunal Rane 2023-09-04  130  	xhdcp2x_rx->protocol = protocol_rx;
cec9562010804d Kunal Rane 2023-09-04  131  	xhdcp2x_rx->rx_caps[0] = HDCP_2_2_RX_CAPS_VERSION_VAL;
cec9562010804d Kunal Rane 2023-09-04  132  	xhdcp2x_rx->rx_caps[1] = 0x00;
cec9562010804d Kunal Rane 2023-09-04  133  	xhdcp2x_rx->rx_caps[2] = (xhdcp2x_rx->mode == xhdcp2x_rx_receiver) ?
cec9562010804d Kunal Rane 2023-09-04  134  				RXCAPS_HDCP_ENABLE :  RXCAPS_REPEATER;
cec9562010804d Kunal Rane 2023-09-04  135  	xhdcp2x_rx->keys_loaded = 0;
cec9562010804d Kunal Rane 2023-09-04  136  
cec9562010804d Kunal Rane 2023-09-04  137  	xhdcp2x_rx->xhdcp2x_hw.rng_inst.rng_coreaddress =
cec9562010804d Kunal Rane 2023-09-04  138  		xhdcp2x_rx->xhdcp2x_hw.hdcp2xcore_address + XHDCP2X_RNG_OFFSET;
cec9562010804d Kunal Rane 2023-09-04  139  	xhdcp2x_rx->xhdcp2x_hw.mmult_inst.mmult_coreaddress =
cec9562010804d Kunal Rane 2023-09-04  140  		xhdcp2x_rx->xhdcp2x_hw.hdcp2xcore_address + XHDCP2X_MMULT_OFFSET;
cec9562010804d Kunal Rane 2023-09-04  141  	xhdcp2x_rx->xhdcp2x_hw.cipher_inst.cipher_coreaddress =
cec9562010804d Kunal Rane 2023-09-04  142  		xhdcp2x_rx->xhdcp2x_hw.hdcp2xcore_address + XHDCP2X_CIPHER_OFFSET;
cec9562010804d Kunal Rane 2023-09-04  143  
cec9562010804d Kunal Rane 2023-09-04  144  	status = xlnx_hdcp2x_rng_cfg_init(&xhdcp2x_rx->xhdcp2x_hw.rng_inst);
cec9562010804d Kunal Rane 2023-09-04  145  	if (status < 0)
cec9562010804d Kunal Rane 2023-09-04  146  		return ERR_PTR(-EINVAL);
cec9562010804d Kunal Rane 2023-09-04  147  
cec9562010804d Kunal Rane 2023-09-04  148  	status = xlnx_hdcp2x_mmult_cfginit(&xhdcp2x_rx->xhdcp2x_hw.mmult_inst);
cec9562010804d Kunal Rane 2023-09-04  149  	if (status < 0)
cec9562010804d Kunal Rane 2023-09-04  150  		return ERR_PTR(-EINVAL);
cec9562010804d Kunal Rane 2023-09-04  151  
cec9562010804d Kunal Rane 2023-09-04  152  	status = xlnx_hdcp2x_cipher_cfg_init(&xhdcp2x_rx->xhdcp2x_hw.cipher_inst);
cec9562010804d Kunal Rane 2023-09-04  153  	if (status < 0)
cec9562010804d Kunal Rane 2023-09-04  154  		return ERR_PTR(-EINVAL);
cec9562010804d Kunal Rane 2023-09-04  155  
cec9562010804d Kunal Rane 2023-09-04  156  	xlnx_hdcp2x_rx_cipher_init(&xhdcp2x_rx->xhdcp2x_hw.cipher_inst);
cec9562010804d Kunal Rane 2023-09-04  157  
cec9562010804d Kunal Rane 2023-09-04  158  	mutex_init(&xhdcp2x_rx->hdcprx_mutex);
cec9562010804d Kunal Rane 2023-09-04  159  
cec9562010804d Kunal Rane 2023-09-04  160  	INIT_DELAYED_WORK(&xhdcp2x_rx->sm_work, xhdcp2x_sm_work_func);
cec9562010804d Kunal Rane 2023-09-04  161  
cec9562010804d Kunal Rane 2023-09-04  162  	return (void *)xhdcp2x_rx;
cec9562010804d Kunal Rane 2023-09-04  163  }
cec9562010804d Kunal Rane 2023-09-04  164  

:::::: The code at line 120 was first introduced by commit
:::::: cec9562010804d75b0950a245e7d8e2d778510ba v4l2: xilinx: Add HDCP2x Rx support

:::::: TO: Kunal Rane <kunal.rane@amd.com>
:::::: CC: Michal Simek <michal.simek@amd.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
