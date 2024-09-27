Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEE93A2D
	for <oe-kbuild-all@lists.linux.dev>; Fri, 27 Sep 2024 15:37:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727451452; cv=none; b=uJ7HNRnj2tFS8781AwT9WoEKBdWQdEZ0gQCs04BhHeP+lz+ERJnRykfw7QgzsfI0TzzzCLwORxlBxKE5Oi0a7f6t0YDwqi1EXTL1lued2hR2yDTlX93oR9bg0mg0jsp5XHBMJjbRBWzIlA0NHjndDCNPPjVPt/lUo+F8J2oHoMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727451452; c=relaxed/simple;
	bh=c3FETgR+Lo0reYg1YPT5xgTAjTEiuet9H8icdM8hdXs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sox15GViHe+Xxbui8JF7uvrZRxl3tRCJyHQZqg7L9aD9bfpUDmnG2mwb7HgugRNOOdOsRY6Ok/+D0AoZcQmSmcO52Bd3c48LZ2sscbg8yuUT+KcHbD4TCquGC8sYkvaLLc3gM8ntf1HS+YeGhyPseKTchG/2XrIwzKF6lc7xdbU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dPMswZ3W; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dPMswZ3W"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727451451; x=1758987451;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=c3FETgR+Lo0reYg1YPT5xgTAjTEiuet9H8icdM8hdXs=;
  b=dPMswZ3WYYdF9oET08j5d+xCGXLzJPKPMAtNGVN0qX+qkyI4qucyp8/B
   sZbaLprjsvW2jbVK+n9x7AOhNu27ITQYXHg9gjr2B2c9muxmHuTcnxHKh
   zh+JGg6gjpIbIFsWusZrBXD/0qnC7/WfmqCcTsqlwD/oKbH6NlWkJrZGc
   BhhcMJASb5KtulC3NmEij5O4MuQol2nFLOZtzxWKyQ3YL/jb7lUWXcePZ
   K362bKPb678zIl+Faal6dqqmMTETGdpo9idq4y7JezgZ5W3dcXJg2hsIg
   t2IW9ZwReYO2x8syVDmUwfnNpzYHjpWQXWc243uKKi1xSZ+4H6YDFg8zg
   Q==;
X-CSE-ConnectionGUID: FJZ7xF0mTaqiZR6NeZjL+Q==
X-CSE-MsgGUID: 9HlUTKEySL6onmRqWL2dFg==
X-IronPort-AV: E=McAfee;i="6700,10204,11208"; a="26771686"
X-IronPort-AV: E=Sophos;i="6.11,159,1725346800"; 
   d="scan'208";a="26771686"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2024 08:37:30 -0700
X-CSE-ConnectionGUID: 31moTDzTSyqENonYl7gjsQ==
X-CSE-MsgGUID: kgL97SnNRl+nO4PCG+TcfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,159,1725346800"; 
   d="scan'208";a="77080515"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 27 Sep 2024 08:37:28 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1suD26-000MJ5-0h;
	Fri, 27 Sep 2024 15:37:26 +0000
Date: Fri, 27 Sep 2024 23:37:07 +0800
From: kernel test robot <lkp@intel.com>
To: Venkateshwar Rao Gannavarapu <venkateshwar.rao.gannavarapu@xilinx.com>
Cc: oe-kbuild-all@lists.linux.dev, git@amd.com,
	Michal Simek <monstr@monstr.eu>,
	Vishal Sagar <vishal.sagar@xilinx.com>
Subject: [xilinx-xlnx:xlnx_rebase_v6.6_LTS_2024.1_update 453/1001]
 drivers/gpu/drm/xlnx/xlnx_pl_disp.c:613:9: warning: 'strncpy' specified
 bound 4 equals destination size
Message-ID: <202409272301.71OyfrQq-lkp@intel.com>
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
commit: a688ad3a36831b2c1530d177c729caac8c3d775f [453/1001] drm: xlnx: pl_disp: Add strict check of video format in dt parsing.
config: sparc-allmodconfig (https://download.01.org/0day-ci/archive/20240927/202409272301.71OyfrQq-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240927/202409272301.71OyfrQq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409272301.71OyfrQq-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/xlnx/xlnx_pl_disp.c: In function 'xlnx_pl_disp_probe':
>> drivers/gpu/drm/xlnx/xlnx_pl_disp.c:613:9: warning: 'strncpy' specified bound 4 equals destination size [-Wstringop-truncation]
     613 |         strncpy((char *)&xlnx_pl_disp->fmt, vformat, XLNX_PL_DISP_VFMT_SIZE);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/strncpy +613 drivers/gpu/drm/xlnx/xlnx_pl_disp.c

   579	
   580	static int xlnx_pl_disp_probe(struct platform_device *pdev)
   581	{
   582		struct device *dev = &pdev->dev;
   583		struct device_node *vtc_node;
   584		struct xlnx_pl_disp *xlnx_pl_disp;
   585		int ret;
   586		const char *vformat;
   587		struct dma_chan *dma_chan;
   588		struct xlnx_dma_chan *xlnx_dma_chan;
   589		const struct drm_format_info *info;
   590	
   591		xlnx_pl_disp = devm_kzalloc(dev, sizeof(*xlnx_pl_disp), GFP_KERNEL);
   592		if (!xlnx_pl_disp)
   593			return -ENOMEM;
   594	
   595		dma_chan = of_dma_request_slave_channel(dev->of_node, "dma0");
   596		if (IS_ERR_OR_NULL(dma_chan)) {
   597			dev_err(dev, "failed to request dma channel\n");
   598			return PTR_ERR(dma_chan);
   599		}
   600	
   601		xlnx_dma_chan = devm_kzalloc(dev, sizeof(*xlnx_dma_chan), GFP_KERNEL);
   602		if (!xlnx_dma_chan)
   603			return -ENOMEM;
   604	
   605		xlnx_dma_chan->dma_chan = dma_chan;
   606		xlnx_pl_disp->chan = xlnx_dma_chan;
   607		ret = of_property_read_string(dev->of_node, "xlnx,vformat", &vformat);
   608		if (ret) {
   609			dev_err(dev, "No xlnx,vformat value in dts\n");
   610			goto err_dma;
   611		}
   612	
 > 613		strncpy((char *)&xlnx_pl_disp->fmt, vformat, XLNX_PL_DISP_VFMT_SIZE);
   614		info = drm_format_info(xlnx_pl_disp->fmt);
   615		if (!info) {
   616			dev_err(dev, "Invalid video format in dts\n");
   617			ret = -EINVAL;
   618			goto err_dma;
   619		}
   620	
   621		/* VTC Bridge support */
   622		vtc_node = of_parse_phandle(dev->of_node, "xlnx,bridge", 0);
   623		if (vtc_node) {
   624			xlnx_pl_disp->vtc_bridge = of_xlnx_bridge_get(vtc_node);
   625			if (!xlnx_pl_disp->vtc_bridge) {
   626				dev_info(dev, "Didn't get vtc bridge instance\n");
   627				ret = -EPROBE_DEFER;
   628				goto err_dma;
   629			}
   630		} else {
   631			dev_info(dev, "vtc bridge property not present\n");
   632		}
   633	
   634		xlnx_pl_disp->dev = dev;
   635		platform_set_drvdata(pdev, xlnx_pl_disp);
   636	
   637		ret = component_add(dev, &xlnx_pl_disp_component_ops);
   638		if (ret)
   639			goto err_dma;
   640	
   641		xlnx_pl_disp->master = xlnx_drm_pipeline_init(pdev);
   642		if (IS_ERR(xlnx_pl_disp->master)) {
   643			ret = PTR_ERR(xlnx_pl_disp->master);
   644			dev_err(dev, "failed to initialize the drm pipeline\n");
   645			goto err_component;
   646		}
   647	
   648		dev_info(&pdev->dev, "Xlnx PL display driver probed\n");
   649	
   650		return 0;
   651	
   652	err_component:
   653		component_del(dev, &xlnx_pl_disp_component_ops);
   654	err_dma:
   655		dma_release_channel(xlnx_pl_disp->chan->dma_chan);
   656	
   657		return ret;
   658	}
   659	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
