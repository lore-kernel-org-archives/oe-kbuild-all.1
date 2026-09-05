Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACB51289E13
	for <oe-kbuild-all@lists.linux.dev>; Sat,  5 Sep 2026 05:09:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788584943; cv=none; b=N9WjfsK3z+NuuGKd/hm13fAA89YanjLmWYv6SchJd/mDfMba4icOet57G0Qf9LXIgVR2UQKpfoxioTvmeknR5NJNpZtl65ztbDFJvTaKBDU/3S7O5nODDjQ49DsU7v8l/hEha++5p7wUcafTaZcDjIRPEMB81jv0x0/9pLhQnEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788584943; c=relaxed/simple;
	bh=v00KjyWoLTDw7Fs8aNoAr7ITX+Y47wPupYzjpeyhBqU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=eyp46cSyYpy71Oe9AeGEn7sHtQ7k9JQTNQkfMfO05b82mFU57F3ZTk36cs3HyVJpF5WuC9REZRJusOtf1K12hvEZSiBjj2xCdefdcTHJwgKO4EgErrONLPHDr6r+ex8iMoGIYsxvMb/oILoahPVN7C3GDLyDqqPj/6PmTrPYXGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=e5iL5Yud; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e5iL5Yud"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788584942; x=1820120942;
  h=date:from:to:cc:subject:message-id;
  bh=v00KjyWoLTDw7Fs8aNoAr7ITX+Y47wPupYzjpeyhBqU=;
  b=e5iL5YudqxS5mkmse24S4l40NwvzSLZ6vcvEQ04yDmem7rlUv/PPqTPp
   KJOJmYJTHgko3P+Y+y2g4Q2kxAbdy4699DTF/QMEvOBEjsRf/dNyGCnW8
   hbc5ikzIu8c1JTc/9rHjj+5PRKgxYvQfassqLQ1PEDpb5pyDLpZf7ptE+
   ZFTxTX3kVh+eRYBtqYgjnefYfyTQLlt2H4wxZgxSOQqSmyUsTh4cTDHck
   56rO2J+QTw3HkPEdp3wHRK5tQ5uO5vfJ34aS4+g3jugSHRK4FHj/YeX5H
   Bm+95eJngk5pFWNPiGvLZYookOyO6fBL/JgNLIN/Abh1GjYKsmvMl4mhz
   g==;
X-CSE-ConnectionGUID: VrTHW0xKSeWtyNf8+oXIvQ==
X-CSE-MsgGUID: VGWx96DIQnaZsxigCdbS5Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11896"; a="89205230"
X-IronPort-AV: E=Sophos;i="6.25,263,1779174000"; 
   d="scan'208";a="89205230"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2026 22:09:01 -0700
X-CSE-ConnectionGUID: qBznN7hKT/GuNWBmBVKYlw==
X-CSE-MsgGUID: 3qETkT7QSA2L2Sr9uWZcZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,263,1779174000"; 
   d="scan'208";a="270749416"
Received: from lkp-server01.sh.intel.com (HELO 73f3364bc37e) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 04 Sep 2026 22:08:59 -0700
Received: from kbuild by 73f3364bc37e with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x2ie8-0000000003f-3LdL;
	Sat, 05 Sep 2026 05:08:56 +0000
Date: Sat, 05 Sep 2026 13:08:25 +0800
From: kernel test robot <lkp@intel.com>
To: Golla Nagendra <nagendra.golla@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, Vinod Koul <vkoul@kernel.org>,
 Frank Li <Frank.Li@nxp.com>
Subject: [vkoul-dmaengine:next 16/37]
 drivers/dma/xilinx/zynqmp_dma.c:1169:1: warning: label 'err_disable_pm'
 defined but not used
Message-ID: <202609051320.h59EIE0M-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vkoul/dmaengine.git next
head:   256b61fdc708cfa34a84266a2c9bea64f44c534d
commit: 3f30db282c28cc35a502aa1cec34fb642854b057 [16/37] dmaengine: zynqmp_dma: Fix chan probe/remove error handling
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20260905/202609051320.h59EIE0M-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260905/202609051320.h59EIE0M-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609051320.h59EIE0M-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/dma/xilinx/zynqmp_dma.c: In function 'zynqmp_dma_probe':
>> drivers/dma/xilinx/zynqmp_dma.c:1169:1: warning: label 'err_disable_pm' defined but not used [-Wunused-label]
    1169 | err_disable_pm:
         | ^~~~~~~~~~~~~~


vim +/err_disable_pm +1169 drivers/dma/xilinx/zynqmp_dma.c

64c6f7da8c2cab Kedareswara rao Appana 2017-12-07  1077  
b0cc417c163719 Kedareswara rao Appana 2016-07-01  1078  /**
b0cc417c163719 Kedareswara rao Appana 2016-07-01  1079   * zynqmp_dma_probe - Driver probe function
b0cc417c163719 Kedareswara rao Appana 2016-07-01  1080   * @pdev: Pointer to the platform_device structure
b0cc417c163719 Kedareswara rao Appana 2016-07-01  1081   *
b0cc417c163719 Kedareswara rao Appana 2016-07-01  1082   * Return: '0' on success and failure value on error
b0cc417c163719 Kedareswara rao Appana 2016-07-01  1083   */
b0cc417c163719 Kedareswara rao Appana 2016-07-01  1084  static int zynqmp_dma_probe(struct platform_device *pdev)
b0cc417c163719 Kedareswara rao Appana 2016-07-01  1085  {
b0cc417c163719 Kedareswara rao Appana 2016-07-01  1086  	struct zynqmp_dma_device *zdev;
b0cc417c163719 Kedareswara rao Appana 2016-07-01  1087  	struct dma_device *p;
b0cc417c163719 Kedareswara rao Appana 2016-07-01  1088  	int ret;
b0cc417c163719 Kedareswara rao Appana 2016-07-01  1089  
b0cc417c163719 Kedareswara rao Appana 2016-07-01  1090  	zdev = devm_kzalloc(&pdev->dev, sizeof(*zdev), GFP_KERNEL);
b0cc417c163719 Kedareswara rao Appana 2016-07-01  1091  	if (!zdev)
b0cc417c163719 Kedareswara rao Appana 2016-07-01  1092  		return -ENOMEM;
b0cc417c163719 Kedareswara rao Appana 2016-07-01  1093  
b0cc417c163719 Kedareswara rao Appana 2016-07-01  1094  	zdev->dev = &pdev->dev;
b0cc417c163719 Kedareswara rao Appana 2016-07-01  1095  	INIT_LIST_HEAD(&zdev->common.channels);
b0cc417c163719 Kedareswara rao Appana 2016-07-01  1096  
e9f92b99990551 Harini Katakam         2023-03-16  1097  	ret = dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(44));
e9f92b99990551 Harini Katakam         2023-03-16  1098  	if (ret) {
e9f92b99990551 Harini Katakam         2023-03-16  1099  		dev_err(&pdev->dev, "DMA not available for address range\n");
e9f92b99990551 Harini Katakam         2023-03-16  1100  		return ret;
e9f92b99990551 Harini Katakam         2023-03-16  1101  	}
b0cc417c163719 Kedareswara rao Appana 2016-07-01  1102  	dma_cap_set(DMA_MEMCPY, zdev->common.cap_mask);
b0cc417c163719 Kedareswara rao Appana 2016-07-01  1103  
b0cc417c163719 Kedareswara rao Appana 2016-07-01  1104  	p = &zdev->common;
b0cc417c163719 Kedareswara rao Appana 2016-07-01  1105  	p->device_prep_dma_memcpy = zynqmp_dma_prep_memcpy;
b0cc417c163719 Kedareswara rao Appana 2016-07-01  1106  	p->device_terminate_all = zynqmp_dma_device_terminate_all;
f2b816a1dfb8b4 Swati Agarwal          2022-09-15  1107  	p->device_synchronize = zynqmp_dma_synchronize;
b0cc417c163719 Kedareswara rao Appana 2016-07-01  1108  	p->device_issue_pending = zynqmp_dma_issue_pending;
b0cc417c163719 Kedareswara rao Appana 2016-07-01  1109  	p->device_alloc_chan_resources = zynqmp_dma_alloc_chan_resources;
b0cc417c163719 Kedareswara rao Appana 2016-07-01  1110  	p->device_free_chan_resources = zynqmp_dma_free_chan_resources;
b0cc417c163719 Kedareswara rao Appana 2016-07-01  1111  	p->device_tx_status = dma_cookie_status;
b0cc417c163719 Kedareswara rao Appana 2016-07-01  1112  	p->device_config = zynqmp_dma_device_config;
b0cc417c163719 Kedareswara rao Appana 2016-07-01  1113  	p->dev = &pdev->dev;
b0cc417c163719 Kedareswara rao Appana 2016-07-01  1114  
64c6f7da8c2cab Kedareswara rao Appana 2017-12-07  1115  	zdev->clk_main = devm_clk_get(&pdev->dev, "clk_main");
5637abaab994a9 Michael Tretter        2021-08-26  1116  	if (IS_ERR(zdev->clk_main))
5637abaab994a9 Michael Tretter        2021-08-26  1117  		return dev_err_probe(&pdev->dev, PTR_ERR(zdev->clk_main),
5637abaab994a9 Michael Tretter        2021-08-26  1118  				     "main clock not found.\n");
64c6f7da8c2cab Kedareswara rao Appana 2017-12-07  1119  
64c6f7da8c2cab Kedareswara rao Appana 2017-12-07  1120  	zdev->clk_apb = devm_clk_get(&pdev->dev, "clk_apb");
5637abaab994a9 Michael Tretter        2021-08-26  1121  	if (IS_ERR(zdev->clk_apb))
5637abaab994a9 Michael Tretter        2021-08-26  1122  		return dev_err_probe(&pdev->dev, PTR_ERR(zdev->clk_apb),
5637abaab994a9 Michael Tretter        2021-08-26  1123  				     "apb clock not found.\n");
64c6f7da8c2cab Kedareswara rao Appana 2017-12-07  1124  
b0cc417c163719 Kedareswara rao Appana 2016-07-01  1125  	platform_set_drvdata(pdev, zdev);
64c6f7da8c2cab Kedareswara rao Appana 2017-12-07  1126  	pm_runtime_set_autosuspend_delay(zdev->dev, ZDMA_PM_TIMEOUT);
64c6f7da8c2cab Kedareswara rao Appana 2017-12-07  1127  	pm_runtime_use_autosuspend(zdev->dev);
64c6f7da8c2cab Kedareswara rao Appana 2017-12-07  1128  	pm_runtime_enable(zdev->dev);
517a710ac8fe9c Radhey Shyam Pandey    2022-05-10  1129  	ret = pm_runtime_resume_and_get(zdev->dev);
517a710ac8fe9c Radhey Shyam Pandey    2022-05-10  1130  	if (ret < 0) {
517a710ac8fe9c Radhey Shyam Pandey    2022-05-10  1131  		dev_err(&pdev->dev, "device wakeup failed.\n");
517a710ac8fe9c Radhey Shyam Pandey    2022-05-10  1132  		pm_runtime_disable(zdev->dev);
517a710ac8fe9c Radhey Shyam Pandey    2022-05-10  1133  	}
64c6f7da8c2cab Kedareswara rao Appana 2017-12-07  1134  	if (!pm_runtime_enabled(zdev->dev)) {
64c6f7da8c2cab Kedareswara rao Appana 2017-12-07  1135  		ret = zynqmp_dma_runtime_resume(zdev->dev);
64c6f7da8c2cab Kedareswara rao Appana 2017-12-07  1136  		if (ret)
64c6f7da8c2cab Kedareswara rao Appana 2017-12-07  1137  			return ret;
64c6f7da8c2cab Kedareswara rao Appana 2017-12-07  1138  	}
b0cc417c163719 Kedareswara rao Appana 2016-07-01  1139  
b0cc417c163719 Kedareswara rao Appana 2016-07-01  1140  	ret = zynqmp_dma_chan_probe(zdev, pdev);
b0cc417c163719 Kedareswara rao Appana 2016-07-01  1141  	if (ret) {
5637abaab994a9 Michael Tretter        2021-08-26  1142  		dev_err_probe(&pdev->dev, ret, "Probing channel failed\n");
3f30db282c28cc Golla Nagendra         2026-08-14  1143  		goto free_chan_resources;
b0cc417c163719 Kedareswara rao Appana 2016-07-01  1144  	}
b0cc417c163719 Kedareswara rao Appana 2016-07-01  1145  
b0cc417c163719 Kedareswara rao Appana 2016-07-01  1146  	p->dst_addr_widths = BIT(zdev->chan->bus_width / 8);
b0cc417c163719 Kedareswara rao Appana 2016-07-01  1147  	p->src_addr_widths = BIT(zdev->chan->bus_width / 8);
b0cc417c163719 Kedareswara rao Appana 2016-07-01  1148  
9126518e0439bc Shravya Kumbham        2022-05-10  1149  	ret = dma_async_device_register(&zdev->common);
9126518e0439bc Shravya Kumbham        2022-05-10  1150  	if (ret) {
9126518e0439bc Shravya Kumbham        2022-05-10  1151  		dev_err(zdev->dev, "failed to register the dma device\n");
9126518e0439bc Shravya Kumbham        2022-05-10  1152  		goto free_chan_resources;
9126518e0439bc Shravya Kumbham        2022-05-10  1153  	}
b0cc417c163719 Kedareswara rao Appana 2016-07-01  1154  
b0cc417c163719 Kedareswara rao Appana 2016-07-01  1155  	ret = of_dma_controller_register(pdev->dev.of_node,
b0cc417c163719 Kedareswara rao Appana 2016-07-01  1156  					 of_zynqmp_dma_xlate, zdev);
b0cc417c163719 Kedareswara rao Appana 2016-07-01  1157  	if (ret) {
5637abaab994a9 Michael Tretter        2021-08-26  1158  		dev_err_probe(&pdev->dev, ret, "Unable to register DMA to DT\n");
b0cc417c163719 Kedareswara rao Appana 2016-07-01  1159  		dma_async_device_unregister(&zdev->common);
b0cc417c163719 Kedareswara rao Appana 2016-07-01  1160  		goto free_chan_resources;
b0cc417c163719 Kedareswara rao Appana 2016-07-01  1161  	}
b0cc417c163719 Kedareswara rao Appana 2016-07-01  1162  
64c6f7da8c2cab Kedareswara rao Appana 2017-12-07  1163  	pm_runtime_put_sync_autosuspend(zdev->dev);
64c6f7da8c2cab Kedareswara rao Appana 2017-12-07  1164  
b0cc417c163719 Kedareswara rao Appana 2016-07-01  1165  	return 0;
b0cc417c163719 Kedareswara rao Appana 2016-07-01  1166  
b0cc417c163719 Kedareswara rao Appana 2016-07-01  1167  free_chan_resources:
b0cc417c163719 Kedareswara rao Appana 2016-07-01  1168  	zynqmp_dma_chan_remove(zdev->chan);
64c6f7da8c2cab Kedareswara rao Appana 2017-12-07 @1169  err_disable_pm:
64c6f7da8c2cab Kedareswara rao Appana 2017-12-07  1170  	if (!pm_runtime_enabled(zdev->dev))
64c6f7da8c2cab Kedareswara rao Appana 2017-12-07  1171  		zynqmp_dma_runtime_suspend(zdev->dev);
64c6f7da8c2cab Kedareswara rao Appana 2017-12-07  1172  	pm_runtime_disable(zdev->dev);
b0cc417c163719 Kedareswara rao Appana 2016-07-01  1173  	return ret;
b0cc417c163719 Kedareswara rao Appana 2016-07-01  1174  }
b0cc417c163719 Kedareswara rao Appana 2016-07-01  1175  

:::::: The code at line 1169 was first introduced by commit
:::::: 64c6f7da8c2cab6bcf9c04b2eb8ea9afca31c186 dmaengine: zynqmp_dma: Add runtime pm support

:::::: TO: Kedareswara rao Appana <appana.durga.rao@xilinx.com>
:::::: CC: Vinod Koul <vinod.koul@intel.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
