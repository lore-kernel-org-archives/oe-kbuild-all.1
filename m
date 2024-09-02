Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD7F738DD8
	for <oe-kbuild-all@lists.linux.dev>; Mon,  2 Sep 2024 07:50:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725263452; cv=none; b=MVlUYAMsthAKfJAhKz+A3skeZGpimSRg0KYzlUUyv9v86xbJOELVRk40sgiDPmE8IHV79q3jUSAzipGoRCocOSOEXnk7z/tFYIOv5k/iRGvFu7mGUuLfCrCuLxgiE7NBaZJJyCPFIYG8UpOdHCJMM7P1Oky1NpSX2ObGudZVoPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725263452; c=relaxed/simple;
	bh=yDjuTy8hfmyb/aRWx9Qf0ezIYN9Mbu/PKw/C0N2Fsus=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BIsglDGPAXQA4tt/aO8jmHJYoW+D9BL65IKt/4tQGJAhzRRs5XWZAM/mDYIH26J3/roqTK23iNncT9Un7a8JHnli3eLKFzqlXDJDvZL1HsGp7ZrsyhbloMUxtOiifs2tkx6ilCdleNJ6f14/mgSL7PbmWzPCxATAlzcRe8gdXpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A9TX4HmD; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A9TX4HmD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725263451; x=1756799451;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yDjuTy8hfmyb/aRWx9Qf0ezIYN9Mbu/PKw/C0N2Fsus=;
  b=A9TX4HmDa1JfhLIJz6Q0IeR95dvk87qgYABPU+Vc9U9NxiT4H4F+mWxU
   dNMbj4JwdDMaimvWiCIIJxRlmKxhNImoi7ybrQJgmitoKw+jlwd7zO2hk
   0nNuoaJe1rO1KQOja9ZIFCDj2Bl8M/QTAswGw2jujqJe3GHV6f+9eHyOK
   0MqsoOhPV4NMD8N1j0xayedP+uuDdSfljZvATWDPccNa8Sx8zcLYXzh6Z
   Ddp65nnCaEKHs+TzvjdQxoi/HxqOB9AcCnOFXhPWtpik9/G/voUwZPUdT
   cjn0MUuTCI/bXg5TSEyTUKrE0bhG4N70CAVtV9oWGWLaOv2lLV7yZxUFK
   Q==;
X-CSE-ConnectionGUID: 7DHDb90gRFqw4qXM9G5IXA==
X-CSE-MsgGUID: ELY5jQ7lQ+GflfAuCCU81g==
X-IronPort-AV: E=McAfee;i="6700,10204,11182"; a="23707947"
X-IronPort-AV: E=Sophos;i="6.10,195,1719903600"; 
   d="scan'208";a="23707947"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2024 00:50:49 -0700
X-CSE-ConnectionGUID: +CUIRTTpSby4tM2fHYtXmg==
X-CSE-MsgGUID: osimtiePR2iMWlr2W5ZBDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,195,1719903600"; 
   d="scan'208";a="64499967"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 02 Sep 2024 00:50:47 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sl1pl-0005GJ-0l;
	Mon, 02 Sep 2024 07:50:45 +0000
Date: Mon, 2 Sep 2024 15:49:48 +0800
From: kernel test robot <lkp@intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Subject: [morimoto:for_each_port-2024-08-30 9/12]
 drivers/media/platform/xilinx/xilinx-tpg.c:715:29: warning: unused variable
 'port'
Message-ID: <202409021544.ilW1ZfT7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/morimoto/linux for_each_port-2024-08-30
head:   5e2a67e369f0bcdf5c52187dea66dbb20b2c7bcf
commit: 90664b8aba5ac0e979a19bd97bfa2872a96628d4 [9/12] media: xilinx-tpg: use new of_graph functions
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20240902/202409021544.ilW1ZfT7-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240902/202409021544.ilW1ZfT7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409021544.ilW1ZfT7-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/media/platform/xilinx/xilinx-tpg.c: In function 'xtpg_parse_of':
>> drivers/media/platform/xilinx/xilinx-tpg.c:715:29: warning: unused variable 'port' [-Wunused-variable]
     715 |         struct device_node *port;
         |                             ^~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for OMAP2PLUS_MBOX
   Depends on [n]: MAILBOX [=y] && (ARCH_OMAP2PLUS || ARCH_K3)
   Selected by [m]:
   - TI_K3_M4_REMOTEPROC [=m] && REMOTEPROC [=y] && (ARCH_K3 || COMPILE_TEST [=y])


vim +/port +715 drivers/media/platform/xilinx/xilinx-tpg.c

a5562f65b1371a Laurent Pinchart  2013-05-15  706  
a5562f65b1371a Laurent Pinchart  2013-05-15  707  /* -----------------------------------------------------------------------------
a5562f65b1371a Laurent Pinchart  2013-05-15  708   * Platform Device Driver
a5562f65b1371a Laurent Pinchart  2013-05-15  709   */
a5562f65b1371a Laurent Pinchart  2013-05-15  710  
a5562f65b1371a Laurent Pinchart  2013-05-15  711  static int xtpg_parse_of(struct xtpg_device *xtpg)
a5562f65b1371a Laurent Pinchart  2013-05-15  712  {
a5562f65b1371a Laurent Pinchart  2013-05-15  713  	struct device *dev = xtpg->xvip.dev;
a5562f65b1371a Laurent Pinchart  2013-05-15  714  	struct device_node *node = xtpg->xvip.dev->of_node;
a5562f65b1371a Laurent Pinchart  2013-05-15 @715  	struct device_node *port;
a5562f65b1371a Laurent Pinchart  2013-05-15  716  	unsigned int nports = 0;
a5562f65b1371a Laurent Pinchart  2013-05-15  717  	bool has_endpoint = false;
a5562f65b1371a Laurent Pinchart  2013-05-15  718  
90664b8aba5ac0 Kuninori Morimoto 2024-01-15  719  	for_each_of_graph_port(node, port) {
a5562f65b1371a Laurent Pinchart  2013-05-15  720  		const struct xvip_video_format *format;
a5562f65b1371a Laurent Pinchart  2013-05-15  721  		struct device_node *endpoint;
a5562f65b1371a Laurent Pinchart  2013-05-15  722  
a5562f65b1371a Laurent Pinchart  2013-05-15  723  		format = xvip_of_get_format(port);
a5562f65b1371a Laurent Pinchart  2013-05-15  724  		if (IS_ERR(format)) {
a5562f65b1371a Laurent Pinchart  2013-05-15  725  			dev_err(dev, "invalid format in DT");
cc331d37fe3a7b Julia Lawall      2015-10-25  726  			of_node_put(port);
a5562f65b1371a Laurent Pinchart  2013-05-15  727  			return PTR_ERR(format);
a5562f65b1371a Laurent Pinchart  2013-05-15  728  		}
a5562f65b1371a Laurent Pinchart  2013-05-15  729  
a5562f65b1371a Laurent Pinchart  2013-05-15  730  		/* Get and check the format description */
a5562f65b1371a Laurent Pinchart  2013-05-15  731  		if (!xtpg->vip_format) {
a5562f65b1371a Laurent Pinchart  2013-05-15  732  			xtpg->vip_format = format;
a5562f65b1371a Laurent Pinchart  2013-05-15  733  		} else if (xtpg->vip_format != format) {
a5562f65b1371a Laurent Pinchart  2013-05-15  734  			dev_err(dev, "in/out format mismatch in DT");
cc331d37fe3a7b Julia Lawall      2015-10-25  735  			of_node_put(port);
a5562f65b1371a Laurent Pinchart  2013-05-15  736  			return -EINVAL;
a5562f65b1371a Laurent Pinchart  2013-05-15  737  		}
a5562f65b1371a Laurent Pinchart  2013-05-15  738  
a5562f65b1371a Laurent Pinchart  2013-05-15  739  		if (nports == 0) {
90664b8aba5ac0 Kuninori Morimoto 2024-01-15  740  			endpoint = of_graph_get_next_port_endpoint(port, NULL);
a5562f65b1371a Laurent Pinchart  2013-05-15  741  			if (endpoint)
a5562f65b1371a Laurent Pinchart  2013-05-15  742  				has_endpoint = true;
a5562f65b1371a Laurent Pinchart  2013-05-15  743  			of_node_put(endpoint);
a5562f65b1371a Laurent Pinchart  2013-05-15  744  		}
a5562f65b1371a Laurent Pinchart  2013-05-15  745  
a5562f65b1371a Laurent Pinchart  2013-05-15  746  		/* Count the number of ports. */
a5562f65b1371a Laurent Pinchart  2013-05-15  747  		nports++;
a5562f65b1371a Laurent Pinchart  2013-05-15  748  	}
a5562f65b1371a Laurent Pinchart  2013-05-15  749  
a5562f65b1371a Laurent Pinchart  2013-05-15  750  	if (nports != 1 && nports != 2) {
a5562f65b1371a Laurent Pinchart  2013-05-15  751  		dev_err(dev, "invalid number of ports %u\n", nports);
a5562f65b1371a Laurent Pinchart  2013-05-15  752  		return -EINVAL;
a5562f65b1371a Laurent Pinchart  2013-05-15  753  	}
a5562f65b1371a Laurent Pinchart  2013-05-15  754  
a5562f65b1371a Laurent Pinchart  2013-05-15  755  	xtpg->npads = nports;
a5562f65b1371a Laurent Pinchart  2013-05-15  756  	if (nports == 2 && has_endpoint)
a5562f65b1371a Laurent Pinchart  2013-05-15  757  		xtpg->has_input = true;
a5562f65b1371a Laurent Pinchart  2013-05-15  758  
a5562f65b1371a Laurent Pinchart  2013-05-15  759  	return 0;
a5562f65b1371a Laurent Pinchart  2013-05-15  760  }
a5562f65b1371a Laurent Pinchart  2013-05-15  761  

:::::: The code at line 715 was first introduced by commit
:::::: a5562f65b1371a0988b707c10c44fcc2bba56990 [media] v4l: xilinx: Add Test Pattern Generator driver

:::::: TO: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
:::::: CC: Mauro Carvalho Chehab <mchehab@osg.samsung.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
