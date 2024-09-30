Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D33705684
	for <oe-kbuild-all@lists.linux.dev>; Mon, 30 Sep 2024 02:12:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727662379; cv=none; b=M2ZwLfT4k6qzadQnR5PPURZE13w0mAtbFme8EYWERWjoBgJPNuTVVOIeakcoDMvx+1mHCcjUh42oS/jqhG6zAzgKbuzkEgxKapez3QKUhscJUSFgHm2cP5kO45xFCxtk55lfFbvGT+tyd7XmI0O5chuFM7+dhFnAT3rCY5ja8IE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727662379; c=relaxed/simple;
	bh=4d5nozQrxaK+FQ4KRnw7bMYuBd8bfyEmNDo9Eh61jHs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MsP7L5OE7y4DGlE2rrDhfHY/yv4MN/p+w4xZmjNCVJKzFiAXnbJKBo6Ej8463RLknpCG4+9KnFo6JKXwWn2C86V/kKAtD3YyDX4hyWTTpiIz7optEqqVAcnenqWdCbsf/2d/NHXPLhQoKr7jNfidaCZSWWXks/irpRkPhg69h/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CwQBrIc+; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CwQBrIc+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727662374; x=1759198374;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4d5nozQrxaK+FQ4KRnw7bMYuBd8bfyEmNDo9Eh61jHs=;
  b=CwQBrIc+pnocJogbp8Wyj161iqMiw3iZyatPhLpt47QSqRrBUWIen7op
   4ekou9fqkATHEWKIi6iVdQDPEBk5DAgY3r2ts8ZW82vmn4ssjqNSt0/8Y
   EBwjj1Vm4yjvhAXa3VRHJKyLB6w7NNZ215/cYZQVqAaIxOPOJUYu3rUBO
   uXroX6uKFVxuxyoXuo3FCawFffs+qy6VewwAJLmGPc2i4DopErGV4X9X5
   Zys4W81mMjZcNmp97vJMdc5mkXR2GhzpeKaubB2Kdwbo93T+C5w+QAOit
   e+DApN5J4Zfw/6QwnnbeWdrG+WAxhzFwj45LQ7Dd3VSWlrISMg71axPPR
   w==;
X-CSE-ConnectionGUID: xl1NtElQT9Gj+5tpXrLotA==
X-CSE-MsgGUID: Jtjcg8G7RFaUDx4Bq/nShw==
X-IronPort-AV: E=McAfee;i="6700,10204,11210"; a="26609850"
X-IronPort-AV: E=Sophos;i="6.11,164,1725346800"; 
   d="scan'208";a="26609850"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2024 19:12:46 -0700
X-CSE-ConnectionGUID: 9z7nlHwHTcSHWvsh+Nhngg==
X-CSE-MsgGUID: mlUehlh0TWWos63YoY9ZxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,164,1725346800"; 
   d="scan'208";a="73925681"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 29 Sep 2024 19:12:42 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sv5tv-000Oud-0g;
	Mon, 30 Sep 2024 02:12:39 +0000
Date: Mon, 30 Sep 2024 10:11:43 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.6-2.0.x-imx 5782/16788]
 drivers/staging/media/imx/imx8-media-dev.c:625:6: warning: no previous
 prototype for 'mxc_sensor_notify'
Message-ID: <202409301036.baHj5nC4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc 6.6-2.0.x-imx
head:   ac32ba5fe66266329914d2020570364afe217bec
commit: e4413f76878d2f4495067a3ae0287e2022212fcf [5782/16788] Merge remote-tracking branch 'origin/capture/media-dev' into capture/next
config: xtensa-allyesconfig (https://download.01.org/0day-ci/archive/20240930/202409301036.baHj5nC4-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240930/202409301036.baHj5nC4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409301036.baHj5nC4-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/staging/media/imx/imx8-mipi-csi2.c:1131:46: warning: 'mipi_csi2_sd_internal_ops' defined but not used [-Wunused-const-variable=]
    1131 | static const struct v4l2_subdev_internal_ops mipi_csi2_sd_internal_ops = {
         |                                              ^~~~~~~~~~~~~~~~~~~~~~~~~
--
   drivers/staging/media/imx/imx8-isi-core.c: In function 'mxc_isi_imx8mn_parse_resets':
>> drivers/staging/media/imx/imx8-isi-core.c:314:13: warning: variable 'len' set but not used [-Wunused-but-set-variable]
     314 |         u32 len, rstc_num = 0;
         |             ^~~
--
>> drivers/staging/media/imx/imx8-isi-cap.c:60:21: warning: no previous prototype for 'mxc_isi_get_format' [-Wmissing-prototypes]
      60 | struct mxc_isi_fmt *mxc_isi_get_format(unsigned int index)
         |                     ^~~~~~~~~~~~~~~~~~
>> drivers/staging/media/imx/imx8-isi-cap.c:68:21: warning: no previous prototype for 'mxc_isi_find_format' [-Wmissing-prototypes]
      68 | struct mxc_isi_fmt *mxc_isi_find_format(const u32 *pixelformat,
         |                     ^~~~~~~~~~~~~~~~~~~
>> drivers/staging/media/imx/imx8-isi-cap.c:91:21: warning: no previous prototype for 'mxc_isi_get_src_fmt' [-Wmissing-prototypes]
      91 | struct mxc_isi_fmt *mxc_isi_get_src_fmt(struct v4l2_subdev_format *sd_fmt)
         |                     ^~~~~~~~~~~~~~~~~~~
>> drivers/staging/media/imx/imx8-isi-cap.c:554:5: warning: no previous prototype for 'mxc_isi_ctrls_create' [-Wmissing-prototypes]
     554 | int mxc_isi_ctrls_create(struct mxc_isi_cap_dev *isi_cap)
         |     ^~~~~~~~~~~~~~~~~~~~
>> drivers/staging/media/imx/imx8-isi-cap.c:578:6: warning: no previous prototype for 'mxc_isi_ctrls_delete' [-Wmissing-prototypes]
     578 | void mxc_isi_ctrls_delete(struct mxc_isi_cap_dev *isi_cap)
         |      ^~~~~~~~~~~~~~~~~~~~
--
   drivers/staging/media/imx/imx8-isi-m2m.c: In function 'mxc_isi_m2m_frame_write_done':
>> drivers/staging/media/imx/imx8-isi-m2m.c:95:32: warning: variable 'src_buf' set but not used [-Wunused-but-set-variable]
      95 |         struct mxc_isi_buffer *src_buf, *dst_buf;
         |                                ^~~~~~~
   drivers/staging/media/imx/imx8-isi-m2m.c: At top level:
>> drivers/staging/media/imx/imx8-isi-m2m.c:1270:6: warning: no previous prototype for 'mxc_isi_m2m_ctrls_delete' [-Wmissing-prototypes]
    1270 | void mxc_isi_m2m_ctrls_delete(struct mxc_isi_m2m_dev *isi_m2m)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~
--
>> drivers/staging/media/imx/imx8-isi-hw.c:432:6: warning: no previous prototype for 'mxc_isi_channel_deinterlace_init' [-Wmissing-prototypes]
     432 | void mxc_isi_channel_deinterlace_init(struct mxc_isi_dev *mxc_isi)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--
>> drivers/staging/media/imx/imx8-media-dev.c:625:6: warning: no previous prototype for 'mxc_sensor_notify' [-Wmissing-prototypes]
     625 | void mxc_sensor_notify(struct v4l2_subdev *sd, unsigned int notification,
         |      ^~~~~~~~~~~~~~~~~
>> drivers/staging/media/imx/imx8-media-dev.c:727:1: warning: no previous prototype for 'mxc_md_parse_hdmi_rx_entity' [-Wmissing-prototypes]
     727 | mxc_md_parse_hdmi_rx_entity(struct mxc_md *mxc_md, struct device_node *node)
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/mxc_sensor_notify +625 drivers/staging/media/imx/imx8-media-dev.c

80819e7b37776d Guoniu.zhou 2019-01-22  624  
80819e7b37776d Guoniu.zhou 2019-01-22 @625  void mxc_sensor_notify(struct v4l2_subdev *sd, unsigned int notification,
80819e7b37776d Guoniu.zhou 2019-01-22  626  		       void *arg)
80819e7b37776d Guoniu.zhou 2019-01-22  627  {
80819e7b37776d Guoniu.zhou 2019-01-22  628  }
80819e7b37776d Guoniu.zhou 2019-01-22  629  
80819e7b37776d Guoniu.zhou 2019-01-22  630  static int mxc_md_link_notify(struct media_link *link, unsigned int flags,
80819e7b37776d Guoniu.zhou 2019-01-22  631  			      unsigned int notification)
80819e7b37776d Guoniu.zhou 2019-01-22  632  {
80819e7b37776d Guoniu.zhou 2019-01-22  633  	return 0;
80819e7b37776d Guoniu.zhou 2019-01-22  634  }
80819e7b37776d Guoniu.zhou 2019-01-22  635  
80819e7b37776d Guoniu.zhou 2019-01-22  636  static const struct media_device_ops mxc_md_ops = {
80819e7b37776d Guoniu.zhou 2019-01-22  637  	.link_notify = mxc_md_link_notify,
80819e7b37776d Guoniu.zhou 2019-01-22  638  };
80819e7b37776d Guoniu.zhou 2019-01-22  639  
80819e7b37776d Guoniu.zhou 2019-01-22  640  static struct mxc_isi_info *mxc_md_parse_isi_entity(struct mxc_md *mxc_md,
80819e7b37776d Guoniu.zhou 2019-01-22  641  						    struct device_node *node)
80819e7b37776d Guoniu.zhou 2019-01-22  642  {
53603616e3830b Guoniu.zhou 2020-06-19  643  	struct device *dev;
80819e7b37776d Guoniu.zhou 2019-01-22  644  	struct mxc_isi_info *mxc_isi;
80819e7b37776d Guoniu.zhou 2019-01-22  645  	struct device_node *child;
80819e7b37776d Guoniu.zhou 2019-01-22  646  	int ret, id = -1;
80819e7b37776d Guoniu.zhou 2019-01-22  647  
80819e7b37776d Guoniu.zhou 2019-01-22  648  	if (!mxc_md || !node)
80819e7b37776d Guoniu.zhou 2019-01-22  649  		return NULL;
80819e7b37776d Guoniu.zhou 2019-01-22  650  
53603616e3830b Guoniu.zhou 2020-06-19  651  	dev = &mxc_md->pdev->dev;
53603616e3830b Guoniu.zhou 2020-06-19  652  
80819e7b37776d Guoniu.zhou 2019-01-22  653  	id = of_alias_get_id(node, ISI_OF_NODE_NAME);
80819e7b37776d Guoniu.zhou 2019-01-22  654  	if (id < 0 || id >= MXC_ISI_MAX_DEVS)
80819e7b37776d Guoniu.zhou 2019-01-22  655  		return NULL;
80819e7b37776d Guoniu.zhou 2019-01-22  656  
80819e7b37776d Guoniu.zhou 2019-01-22  657  	mxc_isi = &mxc_md->mxc_isi[id];
80819e7b37776d Guoniu.zhou 2019-01-22  658  
80819e7b37776d Guoniu.zhou 2019-01-22  659  	child = of_get_child_by_name(node, "cap_device");
80819e7b37776d Guoniu.zhou 2019-01-22  660  	if (!child) {
80819e7b37776d Guoniu.zhou 2019-01-22  661  		dev_err(dev, "Can not get child node for %s.%d\n",
80819e7b37776d Guoniu.zhou 2019-01-22  662  			ISI_OF_NODE_NAME, id);
80819e7b37776d Guoniu.zhou 2019-01-22  663  		return NULL;
80819e7b37776d Guoniu.zhou 2019-01-22  664  	}
80819e7b37776d Guoniu.zhou 2019-01-22  665  	of_node_put(child);
80819e7b37776d Guoniu.zhou 2019-01-22  666  
80819e7b37776d Guoniu.zhou 2019-01-22  667  	mxc_isi->id = id;
80819e7b37776d Guoniu.zhou 2019-01-22  668  	mxc_isi->node = child;
80819e7b37776d Guoniu.zhou 2019-01-22  669  	sprintf(mxc_isi->sd_name, "mxc_isi.%d", mxc_isi->id);
80819e7b37776d Guoniu.zhou 2019-01-22  670  	sprintf(mxc_isi->vdev_name, "mxc_isi.%d.capture", mxc_isi->id);
80819e7b37776d Guoniu.zhou 2019-01-22  671  
80819e7b37776d Guoniu.zhou 2019-01-22  672  	ret = of_property_read_u32_array(node, "interface",
80819e7b37776d Guoniu.zhou 2019-01-22  673  					 mxc_isi->interface, 3);
80819e7b37776d Guoniu.zhou 2019-01-22  674  	if (ret < 0) {
80819e7b37776d Guoniu.zhou 2019-01-22  675  		dev_err(dev, "%s node has not interface property\n", child->name);
80819e7b37776d Guoniu.zhou 2019-01-22  676  		return NULL;
80819e7b37776d Guoniu.zhou 2019-01-22  677  	}
80819e7b37776d Guoniu.zhou 2019-01-22  678  
80819e7b37776d Guoniu.zhou 2019-01-22  679  	return mxc_isi;
80819e7b37776d Guoniu.zhou 2019-01-22  680  }
80819e7b37776d Guoniu.zhou 2019-01-22  681  
80819e7b37776d Guoniu.zhou 2019-01-22  682  static struct mxc_mipi_csi2_info *
80819e7b37776d Guoniu.zhou 2019-01-22  683  mxc_md_parse_csi_entity(struct mxc_md *mxc_md,
80819e7b37776d Guoniu.zhou 2019-01-22  684  			struct device_node *node)
80819e7b37776d Guoniu.zhou 2019-01-22  685  {
80819e7b37776d Guoniu.zhou 2019-01-22  686  	struct mxc_mipi_csi2_info *mipi_csi2;
80819e7b37776d Guoniu.zhou 2019-01-22  687  	int id = -1;
80819e7b37776d Guoniu.zhou 2019-01-22  688  
80819e7b37776d Guoniu.zhou 2019-01-22  689  	if (!mxc_md || !node)
80819e7b37776d Guoniu.zhou 2019-01-22  690  		return NULL;
80819e7b37776d Guoniu.zhou 2019-01-22  691  
80819e7b37776d Guoniu.zhou 2019-01-22  692  	id = of_alias_get_id(node, MIPI_CSI2_OF_NODE_NAME);
80819e7b37776d Guoniu.zhou 2019-01-22  693  	if (id < 0 || id >= MXC_MIPI_CSI2_MAX_DEVS)
80819e7b37776d Guoniu.zhou 2019-01-22  694  		return NULL;
80819e7b37776d Guoniu.zhou 2019-01-22  695  
80819e7b37776d Guoniu.zhou 2019-01-22  696  	mipi_csi2 = &mxc_md->mipi_csi2[id];
80819e7b37776d Guoniu.zhou 2019-01-22  697  	if (!mipi_csi2)
80819e7b37776d Guoniu.zhou 2019-01-22  698  		return NULL;
80819e7b37776d Guoniu.zhou 2019-01-22  699  
80819e7b37776d Guoniu.zhou 2019-01-22  700  	mipi_csi2->vchannel = of_property_read_bool(node, "virtual-channel");
80819e7b37776d Guoniu.zhou 2019-01-22  701  	mipi_csi2->id = id;
80819e7b37776d Guoniu.zhou 2019-01-22  702  	mipi_csi2->node = node;
80819e7b37776d Guoniu.zhou 2019-01-22  703  	sprintf(mipi_csi2->sd_name, "mxc-mipi-csi2.%d", mipi_csi2->id);
80819e7b37776d Guoniu.zhou 2019-01-22  704  
80819e7b37776d Guoniu.zhou 2019-01-22  705  	return mipi_csi2;
80819e7b37776d Guoniu.zhou 2019-01-22  706  }
80819e7b37776d Guoniu.zhou 2019-01-22  707  
80819e7b37776d Guoniu.zhou 2019-01-22  708  static struct mxc_parallel_csi_info*
80819e7b37776d Guoniu.zhou 2019-01-22  709  mxc_md_parse_pcsi_entity(struct mxc_md *mxc_md, struct device_node *node)
80819e7b37776d Guoniu.zhou 2019-01-22  710  {
80819e7b37776d Guoniu.zhou 2019-01-22  711  	struct mxc_parallel_csi_info *pcsidev;
80819e7b37776d Guoniu.zhou 2019-01-22  712  
80819e7b37776d Guoniu.zhou 2019-01-22  713  	if (!mxc_md || !node)
80819e7b37776d Guoniu.zhou 2019-01-22  714  		return NULL;
80819e7b37776d Guoniu.zhou 2019-01-22  715  
80819e7b37776d Guoniu.zhou 2019-01-22  716  	pcsidev = &mxc_md->pcsidev;
80819e7b37776d Guoniu.zhou 2019-01-22  717  	if (!pcsidev)
80819e7b37776d Guoniu.zhou 2019-01-22  718  		return NULL;
80819e7b37776d Guoniu.zhou 2019-01-22  719  
80819e7b37776d Guoniu.zhou 2019-01-22  720  	pcsidev->node = node;
80819e7b37776d Guoniu.zhou 2019-01-22  721  	sprintf(pcsidev->sd_name, "mxc-parallel-csi");
80819e7b37776d Guoniu.zhou 2019-01-22  722  
80819e7b37776d Guoniu.zhou 2019-01-22  723  	return pcsidev;
80819e7b37776d Guoniu.zhou 2019-01-22  724  }
80819e7b37776d Guoniu.zhou 2019-01-22  725  
efcd54e337a9a6 Sandor Yu   2020-11-16  726  struct mxc_hdmi_rx_info*
efcd54e337a9a6 Sandor Yu   2020-11-16 @727  mxc_md_parse_hdmi_rx_entity(struct mxc_md *mxc_md, struct device_node *node)
efcd54e337a9a6 Sandor Yu   2020-11-16  728  {
efcd54e337a9a6 Sandor Yu   2020-11-16  729  	struct mxc_hdmi_rx_info *hdmi_rx;
efcd54e337a9a6 Sandor Yu   2020-11-16  730  
efcd54e337a9a6 Sandor Yu   2020-11-16  731  	if (!mxc_md || !node)
efcd54e337a9a6 Sandor Yu   2020-11-16  732  		return NULL;
efcd54e337a9a6 Sandor Yu   2020-11-16  733  
efcd54e337a9a6 Sandor Yu   2020-11-16  734  	hdmi_rx = &mxc_md->hdmi_rx;
efcd54e337a9a6 Sandor Yu   2020-11-16  735  	if (!hdmi_rx)
efcd54e337a9a6 Sandor Yu   2020-11-16  736  		return NULL;
efcd54e337a9a6 Sandor Yu   2020-11-16  737  
efcd54e337a9a6 Sandor Yu   2020-11-16  738  	hdmi_rx->node = node;
efcd54e337a9a6 Sandor Yu   2020-11-16  739  	sprintf(hdmi_rx->sd_name, "mxc-hdmi-rx");
efcd54e337a9a6 Sandor Yu   2020-11-16  740  
efcd54e337a9a6 Sandor Yu   2020-11-16  741  	return hdmi_rx;
efcd54e337a9a6 Sandor Yu   2020-11-16  742  }
efcd54e337a9a6 Sandor Yu   2020-11-16  743  

:::::: The code at line 625 was first introduced by commit
:::::: 80819e7b37776dc87781062ceb8e7d4e8230af6a media: staging: imx: add media device driver support for IMX8

:::::: TO: Guoniu.zhou <guoniu.zhou@nxp.com>
:::::: CC: Dong Aisheng <aisheng.dong@nxp.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
