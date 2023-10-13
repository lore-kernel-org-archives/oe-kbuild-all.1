Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEDBA200AB
	for <oe-kbuild-all@lists.linux.dev>; Fri, 13 Oct 2023 23:25:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AGcIsui9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697239517; x=1728775517;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Un25vHU5dwoLhf4RrTTnwDBfuzLwKIJAA5hOFHXhsLY=;
  b=AGcIsui9bVMWBjAZIsLSm8bTav6J5QMlNV0VjC2otn20ZzHCXG8ksMwa
   e7TUHN2PoiskOPSEJ7W0OS+3mFgvch1Zdap8F/h0oBSynXc4nurgEIFTt
   uFa8b+4xSQcrrFcxOkv9NUIU/f0o0v8cqSUOsvf24cMyDNY0knnFGrqT7
   OcdJ1pkbN+mgeJr9Pqo8ct0cDFD/hTPVil26IaBeCWGmJm+0Xhtrhc8ZQ
   Jl3ilXYdcr06BAzwM6Rq1gMPVSIADPo3MYBCCNtfTgiy8rGzYD52pRvEq
   ccbRCO51swhPtOCgJPDkHyj/PdOjJH+fFfP86hL2sjmapHzIHjnJaHxpt
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="364648693"
X-IronPort-AV: E=Sophos;i="6.03,223,1694761200"; 
   d="scan'208";a="364648693"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2023 16:25:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="825227371"
X-IronPort-AV: E=Sophos;i="6.03,223,1694761200"; 
   d="scan'208";a="825227371"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 13 Oct 2023 16:25:15 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qrRWr-0005Vj-2N;
	Fri, 13 Oct 2023 23:25:13 +0000
Date: Sat, 14 Oct 2023 07:24:39 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.1-2.1.x-imx 4742/15768]
 drivers/staging/media/imx/imx8-media-dev.c:727:1: warning: no previous
 prototype for 'mxc_md_parse_hdmi_rx_entity'
Message-ID: <202310140705.1OE3HM5G-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Dong,

FYI, the error/warning still remains.

tree:   https://github.com/Freescale/linux-fslc 6.1-2.1.x-imx
head:   3f41fbe42851375d3d5996e4bf9e9809e6c79517
commit: aa6e8979d728efcceef49ae02440bdda255e04e8 [4742/15768] Merge remote-tracking branch 'origin/capture/media-dev' into capture/next
config: sparc-allyesconfig (https://download.01.org/0day-ci/archive/20231014/202310140705.1OE3HM5G-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231014/202310140705.1OE3HM5G-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310140705.1OE3HM5G-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/staging/media/imx/imx8-media-dev.c:625:6: warning: no previous prototype for 'mxc_sensor_notify' [-Wmissing-prototypes]
     625 | void mxc_sensor_notify(struct v4l2_subdev *sd, unsigned int notification,
         |      ^~~~~~~~~~~~~~~~~
>> drivers/staging/media/imx/imx8-media-dev.c:727:1: warning: no previous prototype for 'mxc_md_parse_hdmi_rx_entity' [-Wmissing-prototypes]
     727 | mxc_md_parse_hdmi_rx_entity(struct mxc_md *mxc_md, struct device_node *node)
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/mxc_md_parse_hdmi_rx_entity +727 drivers/staging/media/imx/imx8-media-dev.c

fd112bb6a0c292 Guoniu.zhou 2019-01-22  624  
fd112bb6a0c292 Guoniu.zhou 2019-01-22 @625  void mxc_sensor_notify(struct v4l2_subdev *sd, unsigned int notification,
fd112bb6a0c292 Guoniu.zhou 2019-01-22  626  		       void *arg)
fd112bb6a0c292 Guoniu.zhou 2019-01-22  627  {
fd112bb6a0c292 Guoniu.zhou 2019-01-22  628  }
fd112bb6a0c292 Guoniu.zhou 2019-01-22  629  
fd112bb6a0c292 Guoniu.zhou 2019-01-22  630  static int mxc_md_link_notify(struct media_link *link, unsigned int flags,
fd112bb6a0c292 Guoniu.zhou 2019-01-22  631  			      unsigned int notification)
fd112bb6a0c292 Guoniu.zhou 2019-01-22  632  {
fd112bb6a0c292 Guoniu.zhou 2019-01-22  633  	return 0;
fd112bb6a0c292 Guoniu.zhou 2019-01-22  634  }
fd112bb6a0c292 Guoniu.zhou 2019-01-22  635  
fd112bb6a0c292 Guoniu.zhou 2019-01-22  636  static const struct media_device_ops mxc_md_ops = {
fd112bb6a0c292 Guoniu.zhou 2019-01-22  637  	.link_notify = mxc_md_link_notify,
fd112bb6a0c292 Guoniu.zhou 2019-01-22  638  };
fd112bb6a0c292 Guoniu.zhou 2019-01-22  639  
fd112bb6a0c292 Guoniu.zhou 2019-01-22  640  static struct mxc_isi_info *mxc_md_parse_isi_entity(struct mxc_md *mxc_md,
fd112bb6a0c292 Guoniu.zhou 2019-01-22  641  						    struct device_node *node)
fd112bb6a0c292 Guoniu.zhou 2019-01-22  642  {
f0aa407a227387 Guoniu.zhou 2020-06-19  643  	struct device *dev;
fd112bb6a0c292 Guoniu.zhou 2019-01-22  644  	struct mxc_isi_info *mxc_isi;
fd112bb6a0c292 Guoniu.zhou 2019-01-22  645  	struct device_node *child;
fd112bb6a0c292 Guoniu.zhou 2019-01-22  646  	int ret, id = -1;
fd112bb6a0c292 Guoniu.zhou 2019-01-22  647  
fd112bb6a0c292 Guoniu.zhou 2019-01-22  648  	if (!mxc_md || !node)
fd112bb6a0c292 Guoniu.zhou 2019-01-22  649  		return NULL;
fd112bb6a0c292 Guoniu.zhou 2019-01-22  650  
f0aa407a227387 Guoniu.zhou 2020-06-19  651  	dev = &mxc_md->pdev->dev;
f0aa407a227387 Guoniu.zhou 2020-06-19  652  
fd112bb6a0c292 Guoniu.zhou 2019-01-22  653  	id = of_alias_get_id(node, ISI_OF_NODE_NAME);
fd112bb6a0c292 Guoniu.zhou 2019-01-22  654  	if (id < 0 || id >= MXC_ISI_MAX_DEVS)
fd112bb6a0c292 Guoniu.zhou 2019-01-22  655  		return NULL;
fd112bb6a0c292 Guoniu.zhou 2019-01-22  656  
fd112bb6a0c292 Guoniu.zhou 2019-01-22  657  	mxc_isi = &mxc_md->mxc_isi[id];
fd112bb6a0c292 Guoniu.zhou 2019-01-22  658  
fd112bb6a0c292 Guoniu.zhou 2019-01-22  659  	child = of_get_child_by_name(node, "cap_device");
fd112bb6a0c292 Guoniu.zhou 2019-01-22  660  	if (!child) {
fd112bb6a0c292 Guoniu.zhou 2019-01-22  661  		dev_err(dev, "Can not get child node for %s.%d\n",
fd112bb6a0c292 Guoniu.zhou 2019-01-22  662  			ISI_OF_NODE_NAME, id);
fd112bb6a0c292 Guoniu.zhou 2019-01-22  663  		return NULL;
fd112bb6a0c292 Guoniu.zhou 2019-01-22  664  	}
fd112bb6a0c292 Guoniu.zhou 2019-01-22  665  	of_node_put(child);
fd112bb6a0c292 Guoniu.zhou 2019-01-22  666  
fd112bb6a0c292 Guoniu.zhou 2019-01-22  667  	mxc_isi->id = id;
fd112bb6a0c292 Guoniu.zhou 2019-01-22  668  	mxc_isi->node = child;
fd112bb6a0c292 Guoniu.zhou 2019-01-22  669  	sprintf(mxc_isi->sd_name, "mxc_isi.%d", mxc_isi->id);
fd112bb6a0c292 Guoniu.zhou 2019-01-22  670  	sprintf(mxc_isi->vdev_name, "mxc_isi.%d.capture", mxc_isi->id);
fd112bb6a0c292 Guoniu.zhou 2019-01-22  671  
fd112bb6a0c292 Guoniu.zhou 2019-01-22  672  	ret = of_property_read_u32_array(node, "interface",
fd112bb6a0c292 Guoniu.zhou 2019-01-22  673  					 mxc_isi->interface, 3);
fd112bb6a0c292 Guoniu.zhou 2019-01-22  674  	if (ret < 0) {
fd112bb6a0c292 Guoniu.zhou 2019-01-22  675  		dev_err(dev, "%s node has not interface property\n", child->name);
fd112bb6a0c292 Guoniu.zhou 2019-01-22  676  		return NULL;
fd112bb6a0c292 Guoniu.zhou 2019-01-22  677  	}
fd112bb6a0c292 Guoniu.zhou 2019-01-22  678  
fd112bb6a0c292 Guoniu.zhou 2019-01-22  679  	return mxc_isi;
fd112bb6a0c292 Guoniu.zhou 2019-01-22  680  }
fd112bb6a0c292 Guoniu.zhou 2019-01-22  681  
fd112bb6a0c292 Guoniu.zhou 2019-01-22  682  static struct mxc_mipi_csi2_info *
fd112bb6a0c292 Guoniu.zhou 2019-01-22  683  mxc_md_parse_csi_entity(struct mxc_md *mxc_md,
fd112bb6a0c292 Guoniu.zhou 2019-01-22  684  			struct device_node *node)
fd112bb6a0c292 Guoniu.zhou 2019-01-22  685  {
fd112bb6a0c292 Guoniu.zhou 2019-01-22  686  	struct mxc_mipi_csi2_info *mipi_csi2;
fd112bb6a0c292 Guoniu.zhou 2019-01-22  687  	int id = -1;
fd112bb6a0c292 Guoniu.zhou 2019-01-22  688  
fd112bb6a0c292 Guoniu.zhou 2019-01-22  689  	if (!mxc_md || !node)
fd112bb6a0c292 Guoniu.zhou 2019-01-22  690  		return NULL;
fd112bb6a0c292 Guoniu.zhou 2019-01-22  691  
fd112bb6a0c292 Guoniu.zhou 2019-01-22  692  	id = of_alias_get_id(node, MIPI_CSI2_OF_NODE_NAME);
fd112bb6a0c292 Guoniu.zhou 2019-01-22  693  	if (id < 0 || id >= MXC_MIPI_CSI2_MAX_DEVS)
fd112bb6a0c292 Guoniu.zhou 2019-01-22  694  		return NULL;
fd112bb6a0c292 Guoniu.zhou 2019-01-22  695  
fd112bb6a0c292 Guoniu.zhou 2019-01-22  696  	mipi_csi2 = &mxc_md->mipi_csi2[id];
fd112bb6a0c292 Guoniu.zhou 2019-01-22  697  	if (!mipi_csi2)
fd112bb6a0c292 Guoniu.zhou 2019-01-22  698  		return NULL;
fd112bb6a0c292 Guoniu.zhou 2019-01-22  699  
fd112bb6a0c292 Guoniu.zhou 2019-01-22  700  	mipi_csi2->vchannel = of_property_read_bool(node, "virtual-channel");
fd112bb6a0c292 Guoniu.zhou 2019-01-22  701  	mipi_csi2->id = id;
fd112bb6a0c292 Guoniu.zhou 2019-01-22  702  	mipi_csi2->node = node;
fd112bb6a0c292 Guoniu.zhou 2019-01-22  703  	sprintf(mipi_csi2->sd_name, "mxc-mipi-csi2.%d", mipi_csi2->id);
fd112bb6a0c292 Guoniu.zhou 2019-01-22  704  
fd112bb6a0c292 Guoniu.zhou 2019-01-22  705  	return mipi_csi2;
fd112bb6a0c292 Guoniu.zhou 2019-01-22  706  }
fd112bb6a0c292 Guoniu.zhou 2019-01-22  707  
fd112bb6a0c292 Guoniu.zhou 2019-01-22  708  static struct mxc_parallel_csi_info*
fd112bb6a0c292 Guoniu.zhou 2019-01-22  709  mxc_md_parse_pcsi_entity(struct mxc_md *mxc_md, struct device_node *node)
fd112bb6a0c292 Guoniu.zhou 2019-01-22  710  {
fd112bb6a0c292 Guoniu.zhou 2019-01-22  711  	struct mxc_parallel_csi_info *pcsidev;
fd112bb6a0c292 Guoniu.zhou 2019-01-22  712  
fd112bb6a0c292 Guoniu.zhou 2019-01-22  713  	if (!mxc_md || !node)
fd112bb6a0c292 Guoniu.zhou 2019-01-22  714  		return NULL;
fd112bb6a0c292 Guoniu.zhou 2019-01-22  715  
fd112bb6a0c292 Guoniu.zhou 2019-01-22  716  	pcsidev = &mxc_md->pcsidev;
fd112bb6a0c292 Guoniu.zhou 2019-01-22  717  	if (!pcsidev)
fd112bb6a0c292 Guoniu.zhou 2019-01-22  718  		return NULL;
fd112bb6a0c292 Guoniu.zhou 2019-01-22  719  
fd112bb6a0c292 Guoniu.zhou 2019-01-22  720  	pcsidev->node = node;
fd112bb6a0c292 Guoniu.zhou 2019-01-22  721  	sprintf(pcsidev->sd_name, "mxc-parallel-csi");
fd112bb6a0c292 Guoniu.zhou 2019-01-22  722  
fd112bb6a0c292 Guoniu.zhou 2019-01-22  723  	return pcsidev;
fd112bb6a0c292 Guoniu.zhou 2019-01-22  724  }
fd112bb6a0c292 Guoniu.zhou 2019-01-22  725  
ae19f942de1797 Sandor Yu   2020-11-16  726  struct mxc_hdmi_rx_info*
ae19f942de1797 Sandor Yu   2020-11-16 @727  mxc_md_parse_hdmi_rx_entity(struct mxc_md *mxc_md, struct device_node *node)
ae19f942de1797 Sandor Yu   2020-11-16  728  {
ae19f942de1797 Sandor Yu   2020-11-16  729  	struct mxc_hdmi_rx_info *hdmi_rx;
ae19f942de1797 Sandor Yu   2020-11-16  730  
ae19f942de1797 Sandor Yu   2020-11-16  731  	if (!mxc_md || !node)
ae19f942de1797 Sandor Yu   2020-11-16  732  		return NULL;
ae19f942de1797 Sandor Yu   2020-11-16  733  
ae19f942de1797 Sandor Yu   2020-11-16  734  	hdmi_rx = &mxc_md->hdmi_rx;
ae19f942de1797 Sandor Yu   2020-11-16  735  	if (!hdmi_rx)
ae19f942de1797 Sandor Yu   2020-11-16  736  		return NULL;
ae19f942de1797 Sandor Yu   2020-11-16  737  
ae19f942de1797 Sandor Yu   2020-11-16  738  	hdmi_rx->node = node;
ae19f942de1797 Sandor Yu   2020-11-16  739  	sprintf(hdmi_rx->sd_name, "mxc-hdmi-rx");
ae19f942de1797 Sandor Yu   2020-11-16  740  
ae19f942de1797 Sandor Yu   2020-11-16  741  	return hdmi_rx;
ae19f942de1797 Sandor Yu   2020-11-16  742  }
ae19f942de1797 Sandor Yu   2020-11-16  743  

:::::: The code at line 727 was first introduced by commit
:::::: ae19f942de17973a20994b89eeec1660548ad118 MLK-24081-04: staging: media: imx_csi: support hdmi rx for imx8qm

:::::: TO: Sandor Yu <Sandor.yu@nxp.com>
:::::: CC: Dong Aisheng <aisheng.dong@nxp.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
