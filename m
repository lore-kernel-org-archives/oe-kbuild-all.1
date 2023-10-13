Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19656A3F
	for <oe-kbuild-all@lists.linux.dev>; Fri, 13 Oct 2023 03:58:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GBB3Biy4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697169489; x=1728705489;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SztYi9ml9f+qXb1c1f5C39UcpPvF9qeG0mCjS83rv3E=;
  b=GBB3Biy4R3csKDmOoexJ7uGWipVfrAPOEbJUb14neG/bTr/dzJN6eD0Y
   55h4ZGl+7aa2SqtgGSLbsQQBa50YRvDjPoUDe2vc+4025wE9uOli+koaO
   KrO3ZK6AjL2a+PkK35Qy52As7p7udLO6g7eglSX07q+PqzmiudvBFEo47
   DTd2UESOwPDoVRxWObrFR8xu79OvaEe9bvrgRXIcPWeCh9JiJeoSdCrsC
   1eB0fuh+nk8yZxbNPiqAFe8eTNoO1E4GUltrYGnxEje39OzfAh4q3nv7Z
   zJzRpEzN/HDmyMA2pcmcgrKjxmkme9Hxk5q+91s4uZAIoY9cGaTDNL+s+
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="387953703"
X-IronPort-AV: E=Sophos;i="6.03,219,1694761200"; 
   d="scan'208";a="387953703"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2023 20:57:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="1001777249"
X-IronPort-AV: E=Sophos;i="6.03,219,1694761200"; 
   d="scan'208";a="1001777249"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 12 Oct 2023 20:57:51 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qr9J7-0004JP-29;
	Fri, 13 Oct 2023 03:57:49 +0000
Date: Fri, 13 Oct 2023 11:57:41 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:pr/642 2472/30000]
 drivers/bus/fsl-mc/fsl-mc-bus.c:602: warning: Function parameter or member
 'driver_override' not described in 'fsl_mc_device_add'
Message-ID: <202310131139.PXewSVsC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc pr/642
head:   c8b7cf62c7fea8456dec789d550b8006d73b8f04
commit: 01d718af32df5087b9d83defe0796c040258f827 [2472/30000] bus: fsl-mc: Propagate driver_override for a child DPRC's children
config: powerpc-randconfig-003-20231013 (https://download.01.org/0day-ci/archive/20231013/202310131139.PXewSVsC-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231013/202310131139.PXewSVsC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310131139.PXewSVsC-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/bus/fsl-mc/fsl-mc-bus.c:119: warning: Function parameter or member 'dev' not described in 'fsl_mc_bus_uevent'
   drivers/bus/fsl-mc/fsl-mc-bus.c:119: warning: Function parameter or member 'env' not described in 'fsl_mc_bus_uevent'
   drivers/bus/fsl-mc/fsl-mc-bus.c:325: warning: Function parameter or member 'mc_driver' not described in '__fsl_mc_driver_register'
   drivers/bus/fsl-mc/fsl-mc-bus.c:325: warning: Function parameter or member 'owner' not described in '__fsl_mc_driver_register'
   drivers/bus/fsl-mc/fsl-mc-bus.c:356: warning: Function parameter or member 'mc_driver' not described in 'fsl_mc_driver_unregister'
   drivers/bus/fsl-mc/fsl-mc-bus.c:402: warning: Function parameter or member 'dev' not described in 'fsl_mc_get_root_dprc'
   drivers/bus/fsl-mc/fsl-mc-bus.c:402: warning: Function parameter or member 'root_dprc_dev' not described in 'fsl_mc_get_root_dprc'
   drivers/bus/fsl-mc/fsl-mc-bus.c:573: warning: Function parameter or member 'dev' not described in 'fsl_mc_is_root_dprc'
   drivers/bus/fsl-mc/fsl-mc-bus.c:602: warning: Function parameter or member 'obj_desc' not described in 'fsl_mc_device_add'
   drivers/bus/fsl-mc/fsl-mc-bus.c:602: warning: Function parameter or member 'mc_io' not described in 'fsl_mc_device_add'
   drivers/bus/fsl-mc/fsl-mc-bus.c:602: warning: Function parameter or member 'parent_dev' not described in 'fsl_mc_device_add'
>> drivers/bus/fsl-mc/fsl-mc-bus.c:602: warning: Function parameter or member 'driver_override' not described in 'fsl_mc_device_add'
   drivers/bus/fsl-mc/fsl-mc-bus.c:602: warning: Function parameter or member 'new_mc_dev' not described in 'fsl_mc_device_add'
   drivers/bus/fsl-mc/fsl-mc-bus.c:868: warning: Function parameter or member 'pdev' not described in 'fsl_mc_bus_probe'
   drivers/bus/fsl-mc/fsl-mc-bus.c:959: warning: Function parameter or member 'pdev' not described in 'fsl_mc_bus_remove'


vim +602 drivers/bus/fsl-mc/fsl-mc-bus.c

95b3523b723e53 drivers/staging/fsl-mc/bus/fsl-mc-bus.c Laurentiu Tudor    2017-02-07  593  
bbf9d17d987544 drivers/staging/fsl-mc/bus/mc-bus.c     J. German Rivera   2015-03-05  594  /**
58caaac1f50331 drivers/staging/fsl-mc/bus/fsl-mc-bus.c Stuart Yoder       2016-10-26  595   * Add a newly discovered fsl-mc device to be visible in Linux
bbf9d17d987544 drivers/staging/fsl-mc/bus/mc-bus.c     J. German Rivera   2015-03-05  596   */
0cf9f5096da220 drivers/staging/fsl-mc/bus/fsl-mc-bus.c Laurentiu Tudor    2017-06-27  597  int fsl_mc_device_add(struct fsl_mc_obj_desc *obj_desc,
bbf9d17d987544 drivers/staging/fsl-mc/bus/mc-bus.c     J. German Rivera   2015-03-05  598  		      struct fsl_mc_io *mc_io,
bbf9d17d987544 drivers/staging/fsl-mc/bus/mc-bus.c     J. German Rivera   2015-03-05  599  		      struct device *parent_dev,
01d718af32df50 drivers/bus/fsl-mc/fsl-mc-bus.c         Laurentiu Tudor    2018-04-13  600  		      const char *driver_override,
bbf9d17d987544 drivers/staging/fsl-mc/bus/mc-bus.c     J. German Rivera   2015-03-05  601  		      struct fsl_mc_device **new_mc_dev)
bbf9d17d987544 drivers/staging/fsl-mc/bus/mc-bus.c     J. German Rivera   2015-03-05 @602  {
bbf9d17d987544 drivers/staging/fsl-mc/bus/mc-bus.c     J. German Rivera   2015-03-05  603  	int error;
bbf9d17d987544 drivers/staging/fsl-mc/bus/mc-bus.c     J. German Rivera   2015-03-05  604  	struct fsl_mc_device *mc_dev = NULL;
bbf9d17d987544 drivers/staging/fsl-mc/bus/mc-bus.c     J. German Rivera   2015-03-05  605  	struct fsl_mc_bus *mc_bus = NULL;
bbf9d17d987544 drivers/staging/fsl-mc/bus/mc-bus.c     J. German Rivera   2015-03-05  606  	struct fsl_mc_device *parent_mc_dev;
bbf9d17d987544 drivers/staging/fsl-mc/bus/mc-bus.c     J. German Rivera   2015-03-05  607  
df5e9b5fbc4e68 drivers/staging/fsl-mc/bus/mc-bus.c     Nipun Gupta        2016-06-29  608  	if (dev_is_fsl_mc(parent_dev))
bbf9d17d987544 drivers/staging/fsl-mc/bus/mc-bus.c     J. German Rivera   2015-03-05  609  		parent_mc_dev = to_fsl_mc_device(parent_dev);
bbf9d17d987544 drivers/staging/fsl-mc/bus/mc-bus.c     J. German Rivera   2015-03-05  610  	else
bbf9d17d987544 drivers/staging/fsl-mc/bus/mc-bus.c     J. German Rivera   2015-03-05  611  		parent_mc_dev = NULL;
bbf9d17d987544 drivers/staging/fsl-mc/bus/mc-bus.c     J. German Rivera   2015-03-05  612  
bbf9d17d987544 drivers/staging/fsl-mc/bus/mc-bus.c     J. German Rivera   2015-03-05  613  	if (strcmp(obj_desc->type, "dprc") == 0) {
bbf9d17d987544 drivers/staging/fsl-mc/bus/mc-bus.c     J. German Rivera   2015-03-05  614  		/*
bbf9d17d987544 drivers/staging/fsl-mc/bus/mc-bus.c     J. German Rivera   2015-03-05  615  		 * Allocate an MC bus device object:
bbf9d17d987544 drivers/staging/fsl-mc/bus/mc-bus.c     J. German Rivera   2015-03-05  616  		 */
dc341c4ec2bf7c drivers/staging/fsl-mc/bus/fsl-mc-bus.c Laurentiu Tudor    2017-02-07  617  		mc_bus = kzalloc(sizeof(*mc_bus), GFP_KERNEL);
bbf9d17d987544 drivers/staging/fsl-mc/bus/mc-bus.c     J. German Rivera   2015-03-05  618  		if (!mc_bus)
bbf9d17d987544 drivers/staging/fsl-mc/bus/mc-bus.c     J. German Rivera   2015-03-05  619  			return -ENOMEM;
bbf9d17d987544 drivers/staging/fsl-mc/bus/mc-bus.c     J. German Rivera   2015-03-05  620  
bbf9d17d987544 drivers/staging/fsl-mc/bus/mc-bus.c     J. German Rivera   2015-03-05  621  		mc_dev = &mc_bus->mc_dev;
bbf9d17d987544 drivers/staging/fsl-mc/bus/mc-bus.c     J. German Rivera   2015-03-05  622  	} else {
bbf9d17d987544 drivers/staging/fsl-mc/bus/mc-bus.c     J. German Rivera   2015-03-05  623  		/*
bbf9d17d987544 drivers/staging/fsl-mc/bus/mc-bus.c     J. German Rivera   2015-03-05  624  		 * Allocate a regular fsl_mc_device object:
bbf9d17d987544 drivers/staging/fsl-mc/bus/mc-bus.c     J. German Rivera   2015-03-05  625  		 */
9b65332e0e3f83 drivers/staging/fsl-mc/bus/fsl-mc-bus.c Laurentiu Tudor    2017-02-07  626  		mc_dev = kzalloc(sizeof(*mc_dev), GFP_KERNEL);
bbf9d17d987544 drivers/staging/fsl-mc/bus/mc-bus.c     J. German Rivera   2015-03-05  627  		if (!mc_dev)
bbf9d17d987544 drivers/staging/fsl-mc/bus/mc-bus.c     J. German Rivera   2015-03-05  628  			return -ENOMEM;
bbf9d17d987544 drivers/staging/fsl-mc/bus/mc-bus.c     J. German Rivera   2015-03-05  629  	}
bbf9d17d987544 drivers/staging/fsl-mc/bus/mc-bus.c     J. German Rivera   2015-03-05  630  
bbf9d17d987544 drivers/staging/fsl-mc/bus/mc-bus.c     J. German Rivera   2015-03-05  631  	mc_dev->obj_desc = *obj_desc;
bbf9d17d987544 drivers/staging/fsl-mc/bus/mc-bus.c     J. German Rivera   2015-03-05  632  	mc_dev->mc_io = mc_io;
01d718af32df50 drivers/bus/fsl-mc/fsl-mc-bus.c         Laurentiu Tudor    2018-04-13  633  
01d718af32df50 drivers/bus/fsl-mc/fsl-mc-bus.c         Laurentiu Tudor    2018-04-13  634  	if (driver_override) {
01d718af32df50 drivers/bus/fsl-mc/fsl-mc-bus.c         Laurentiu Tudor    2018-04-13  635  		/*
01d718af32df50 drivers/bus/fsl-mc/fsl-mc-bus.c         Laurentiu Tudor    2018-04-13  636  		 * We trust driver_override, so we don't need to use
01d718af32df50 drivers/bus/fsl-mc/fsl-mc-bus.c         Laurentiu Tudor    2018-04-13  637  		 * kstrndup() here
01d718af32df50 drivers/bus/fsl-mc/fsl-mc-bus.c         Laurentiu Tudor    2018-04-13  638  		 */
01d718af32df50 drivers/bus/fsl-mc/fsl-mc-bus.c         Laurentiu Tudor    2018-04-13  639  		mc_dev->driver_override = kstrdup(driver_override, GFP_KERNEL);
01d718af32df50 drivers/bus/fsl-mc/fsl-mc-bus.c         Laurentiu Tudor    2018-04-13  640  		if (!mc_dev->driver_override) {
01d718af32df50 drivers/bus/fsl-mc/fsl-mc-bus.c         Laurentiu Tudor    2018-04-13  641  			error = -ENOMEM;
01d718af32df50 drivers/bus/fsl-mc/fsl-mc-bus.c         Laurentiu Tudor    2018-04-13  642  			goto error_cleanup_dev;
01d718af32df50 drivers/bus/fsl-mc/fsl-mc-bus.c         Laurentiu Tudor    2018-04-13  643  		}
01d718af32df50 drivers/bus/fsl-mc/fsl-mc-bus.c         Laurentiu Tudor    2018-04-13  644  	}
01d718af32df50 drivers/bus/fsl-mc/fsl-mc-bus.c         Laurentiu Tudor    2018-04-13  645  
bbf9d17d987544 drivers/staging/fsl-mc/bus/mc-bus.c     J. German Rivera   2015-03-05  646  	device_initialize(&mc_dev->dev);
bbf9d17d987544 drivers/staging/fsl-mc/bus/mc-bus.c     J. German Rivera   2015-03-05  647  	mc_dev->dev.parent = parent_dev;
bbf9d17d987544 drivers/staging/fsl-mc/bus/mc-bus.c     J. German Rivera   2015-03-05  648  	mc_dev->dev.bus = &fsl_mc_bus_type;
95b3523b723e53 drivers/staging/fsl-mc/bus/fsl-mc-bus.c Laurentiu Tudor    2017-02-07  649  	mc_dev->dev.release = fsl_mc_device_release;
47433b630b7b30 drivers/staging/fsl-mc/bus/fsl-mc-bus.c Laurentiu Tudor    2017-11-17  650  	mc_dev->dev.type = fsl_mc_get_device_type(obj_desc->type);
47433b630b7b30 drivers/staging/fsl-mc/bus/fsl-mc-bus.c Laurentiu Tudor    2017-11-17  651  	if (!mc_dev->dev.type) {
fb17be96eed821 drivers/staging/fsl-mc/bus/fsl-mc-bus.c Greg Kroah-Hartman 2017-11-27  652  		error = -ENODEV;
47433b630b7b30 drivers/staging/fsl-mc/bus/fsl-mc-bus.c Laurentiu Tudor    2017-11-17  653  		dev_err(parent_dev, "unknown device type %s\n", obj_desc->type);
47433b630b7b30 drivers/staging/fsl-mc/bus/fsl-mc-bus.c Laurentiu Tudor    2017-11-17  654  		goto error_cleanup_dev;
47433b630b7b30 drivers/staging/fsl-mc/bus/fsl-mc-bus.c Laurentiu Tudor    2017-11-17  655  	}
77371fbd440f48 drivers/staging/fsl-mc/bus/mc-bus.c     J. German Rivera   2015-03-27  656  	dev_set_name(&mc_dev->dev, "%s.%d", obj_desc->type, obj_desc->id);
bbf9d17d987544 drivers/staging/fsl-mc/bus/mc-bus.c     J. German Rivera   2015-03-05  657  
bbf9d17d987544 drivers/staging/fsl-mc/bus/mc-bus.c     J. German Rivera   2015-03-05  658  	if (strcmp(obj_desc->type, "dprc") == 0) {
bbf9d17d987544 drivers/staging/fsl-mc/bus/mc-bus.c     J. German Rivera   2015-03-05  659  		struct fsl_mc_io *mc_io2;
bbf9d17d987544 drivers/staging/fsl-mc/bus/mc-bus.c     J. German Rivera   2015-03-05  660  
bbf9d17d987544 drivers/staging/fsl-mc/bus/mc-bus.c     J. German Rivera   2015-03-05  661  		mc_dev->flags |= FSL_MC_IS_DPRC;
bbf9d17d987544 drivers/staging/fsl-mc/bus/mc-bus.c     J. German Rivera   2015-03-05  662  
bbf9d17d987544 drivers/staging/fsl-mc/bus/mc-bus.c     J. German Rivera   2015-03-05  663  		/*
bbf9d17d987544 drivers/staging/fsl-mc/bus/mc-bus.c     J. German Rivera   2015-03-05  664  		 * To get the DPRC's ICID, we need to open the DPRC
bbf9d17d987544 drivers/staging/fsl-mc/bus/mc-bus.c     J. German Rivera   2015-03-05  665  		 * in get_dprc_icid(). For child DPRCs, we do so using the
bbf9d17d987544 drivers/staging/fsl-mc/bus/mc-bus.c     J. German Rivera   2015-03-05  666  		 * parent DPRC's MC portal instead of the child DPRC's MC
bbf9d17d987544 drivers/staging/fsl-mc/bus/mc-bus.c     J. German Rivera   2015-03-05  667  		 * portal, in case the child DPRC is already opened with
bbf9d17d987544 drivers/staging/fsl-mc/bus/mc-bus.c     J. German Rivera   2015-03-05  668  		 * its own portal (e.g., the DPRC used by AIOP).
bbf9d17d987544 drivers/staging/fsl-mc/bus/mc-bus.c     J. German Rivera   2015-03-05  669  		 *
bbf9d17d987544 drivers/staging/fsl-mc/bus/mc-bus.c     J. German Rivera   2015-03-05  670  		 * NOTE: There cannot be more than one active open for a
bbf9d17d987544 drivers/staging/fsl-mc/bus/mc-bus.c     J. German Rivera   2015-03-05  671  		 * given MC object, using the same MC portal.
bbf9d17d987544 drivers/staging/fsl-mc/bus/mc-bus.c     J. German Rivera   2015-03-05  672  		 */
bbf9d17d987544 drivers/staging/fsl-mc/bus/mc-bus.c     J. German Rivera   2015-03-05  673  		if (parent_mc_dev) {
bbf9d17d987544 drivers/staging/fsl-mc/bus/mc-bus.c     J. German Rivera   2015-03-05  674  			/*
bbf9d17d987544 drivers/staging/fsl-mc/bus/mc-bus.c     J. German Rivera   2015-03-05  675  			 * device being added is a child DPRC device
bbf9d17d987544 drivers/staging/fsl-mc/bus/mc-bus.c     J. German Rivera   2015-03-05  676  			 */
bbf9d17d987544 drivers/staging/fsl-mc/bus/mc-bus.c     J. German Rivera   2015-03-05  677  			mc_io2 = parent_mc_dev->mc_io;
bbf9d17d987544 drivers/staging/fsl-mc/bus/mc-bus.c     J. German Rivera   2015-03-05  678  		} else {
bbf9d17d987544 drivers/staging/fsl-mc/bus/mc-bus.c     J. German Rivera   2015-03-05  679  			/*
bbf9d17d987544 drivers/staging/fsl-mc/bus/mc-bus.c     J. German Rivera   2015-03-05  680  			 * device being added is the root DPRC device
bbf9d17d987544 drivers/staging/fsl-mc/bus/mc-bus.c     J. German Rivera   2015-03-05  681  			 */
a385dd7b37174a drivers/staging/fsl-mc/bus/fsl-mc-bus.c Laurentiu Tudor    2017-11-17  682  			if (!mc_io) {
bbf9d17d987544 drivers/staging/fsl-mc/bus/mc-bus.c     J. German Rivera   2015-03-05  683  				error = -EINVAL;
bbf9d17d987544 drivers/staging/fsl-mc/bus/mc-bus.c     J. German Rivera   2015-03-05  684  				goto error_cleanup_dev;
bbf9d17d987544 drivers/staging/fsl-mc/bus/mc-bus.c     J. German Rivera   2015-03-05  685  			}
bbf9d17d987544 drivers/staging/fsl-mc/bus/mc-bus.c     J. German Rivera   2015-03-05  686  
bbf9d17d987544 drivers/staging/fsl-mc/bus/mc-bus.c     J. German Rivera   2015-03-05  687  			mc_io2 = mc_io;
bbf9d17d987544 drivers/staging/fsl-mc/bus/mc-bus.c     J. German Rivera   2015-03-05  688  		}
bbf9d17d987544 drivers/staging/fsl-mc/bus/mc-bus.c     J. German Rivera   2015-03-05  689  
bbf9d17d987544 drivers/staging/fsl-mc/bus/mc-bus.c     J. German Rivera   2015-03-05  690  		error = get_dprc_icid(mc_io2, obj_desc->id, &mc_dev->icid);
bbf9d17d987544 drivers/staging/fsl-mc/bus/mc-bus.c     J. German Rivera   2015-03-05  691  		if (error < 0)
bbf9d17d987544 drivers/staging/fsl-mc/bus/mc-bus.c     J. German Rivera   2015-03-05  692  			goto error_cleanup_dev;
bbf9d17d987544 drivers/staging/fsl-mc/bus/mc-bus.c     J. German Rivera   2015-03-05  693  	} else {
bbf9d17d987544 drivers/staging/fsl-mc/bus/mc-bus.c     J. German Rivera   2015-03-05  694  		/*
58caaac1f50331 drivers/staging/fsl-mc/bus/fsl-mc-bus.c Stuart Yoder       2016-10-26  695  		 * A non-DPRC object has to be a child of a DPRC, use the
58caaac1f50331 drivers/staging/fsl-mc/bus/fsl-mc-bus.c Stuart Yoder       2016-10-26  696  		 * parent's ICID and interrupt domain.
bbf9d17d987544 drivers/staging/fsl-mc/bus/mc-bus.c     J. German Rivera   2015-03-05  697  		 */
bbf9d17d987544 drivers/staging/fsl-mc/bus/mc-bus.c     J. German Rivera   2015-03-05  698  		mc_dev->icid = parent_mc_dev->icid;
bbf9d17d987544 drivers/staging/fsl-mc/bus/mc-bus.c     J. German Rivera   2015-03-05  699  		mc_dev->dma_mask = FSL_MC_DEFAULT_DMA_MASK;
bbf9d17d987544 drivers/staging/fsl-mc/bus/mc-bus.c     J. German Rivera   2015-03-05  700  		mc_dev->dev.dma_mask = &mc_dev->dma_mask;
761ba8ed114b23 drivers/bus/fsl-mc/fsl-mc-bus.c         Nipun Gupta        2018-09-10  701  		mc_dev->dev.coherent_dma_mask = mc_dev->dma_mask;
660a24bf60821c drivers/staging/fsl-mc/bus/mc-bus.c     J. German Rivera   2016-01-06  702  		dev_set_msi_domain(&mc_dev->dev,
660a24bf60821c drivers/staging/fsl-mc/bus/mc-bus.c     J. German Rivera   2016-01-06  703  				   dev_get_msi_domain(&parent_mc_dev->dev));
bbf9d17d987544 drivers/staging/fsl-mc/bus/mc-bus.c     J. German Rivera   2015-03-05  704  	}
bbf9d17d987544 drivers/staging/fsl-mc/bus/mc-bus.c     J. German Rivera   2015-03-05  705  
bbf9d17d987544 drivers/staging/fsl-mc/bus/mc-bus.c     J. German Rivera   2015-03-05  706  	/*
bbf9d17d987544 drivers/staging/fsl-mc/bus/mc-bus.c     J. German Rivera   2015-03-05  707  	 * Get MMIO regions for the device from the MC:
bbf9d17d987544 drivers/staging/fsl-mc/bus/mc-bus.c     J. German Rivera   2015-03-05  708  	 *
bbf9d17d987544 drivers/staging/fsl-mc/bus/mc-bus.c     J. German Rivera   2015-03-05  709  	 * NOTE: the root DPRC is a special case as its MMIO region is
bbf9d17d987544 drivers/staging/fsl-mc/bus/mc-bus.c     J. German Rivera   2015-03-05  710  	 * obtained from the device tree
bbf9d17d987544 drivers/staging/fsl-mc/bus/mc-bus.c     J. German Rivera   2015-03-05  711  	 */
bbf9d17d987544 drivers/staging/fsl-mc/bus/mc-bus.c     J. German Rivera   2015-03-05  712  	if (parent_mc_dev && obj_desc->region_count != 0) {
bbf9d17d987544 drivers/staging/fsl-mc/bus/mc-bus.c     J. German Rivera   2015-03-05  713  		error = fsl_mc_device_get_mmio_regions(mc_dev,
bbf9d17d987544 drivers/staging/fsl-mc/bus/mc-bus.c     J. German Rivera   2015-03-05  714  						       parent_mc_dev);
bbf9d17d987544 drivers/staging/fsl-mc/bus/mc-bus.c     J. German Rivera   2015-03-05  715  		if (error < 0)
bbf9d17d987544 drivers/staging/fsl-mc/bus/mc-bus.c     J. German Rivera   2015-03-05  716  			goto error_cleanup_dev;
bbf9d17d987544 drivers/staging/fsl-mc/bus/mc-bus.c     J. German Rivera   2015-03-05  717  	}
bbf9d17d987544 drivers/staging/fsl-mc/bus/mc-bus.c     J. German Rivera   2015-03-05  718  
bbf9d17d987544 drivers/staging/fsl-mc/bus/mc-bus.c     J. German Rivera   2015-03-05  719  	/*
bbf9d17d987544 drivers/staging/fsl-mc/bus/mc-bus.c     J. German Rivera   2015-03-05  720  	 * The device-specific probe callback will get invoked by device_add()
bbf9d17d987544 drivers/staging/fsl-mc/bus/mc-bus.c     J. German Rivera   2015-03-05  721  	 */
bbf9d17d987544 drivers/staging/fsl-mc/bus/mc-bus.c     J. German Rivera   2015-03-05  722  	error = device_add(&mc_dev->dev);
bbf9d17d987544 drivers/staging/fsl-mc/bus/mc-bus.c     J. German Rivera   2015-03-05  723  	if (error < 0) {
bbf9d17d987544 drivers/staging/fsl-mc/bus/mc-bus.c     J. German Rivera   2015-03-05  724  		dev_err(parent_dev,
bbf9d17d987544 drivers/staging/fsl-mc/bus/mc-bus.c     J. German Rivera   2015-03-05  725  			"device_add() failed for device %s: %d\n",
bbf9d17d987544 drivers/staging/fsl-mc/bus/mc-bus.c     J. German Rivera   2015-03-05  726  			dev_name(&mc_dev->dev), error);
bbf9d17d987544 drivers/staging/fsl-mc/bus/mc-bus.c     J. German Rivera   2015-03-05  727  		goto error_cleanup_dev;
bbf9d17d987544 drivers/staging/fsl-mc/bus/mc-bus.c     J. German Rivera   2015-03-05  728  	}
bbf9d17d987544 drivers/staging/fsl-mc/bus/mc-bus.c     J. German Rivera   2015-03-05  729  
e3494af5ce5f7c drivers/staging/fsl-mc/bus/fsl-mc-bus.c Stuart Yoder       2016-10-26  730  	dev_dbg(parent_dev, "added %s\n", dev_name(&mc_dev->dev));
bbf9d17d987544 drivers/staging/fsl-mc/bus/mc-bus.c     J. German Rivera   2015-03-05  731  
bbf9d17d987544 drivers/staging/fsl-mc/bus/mc-bus.c     J. German Rivera   2015-03-05  732  	*new_mc_dev = mc_dev;
bbf9d17d987544 drivers/staging/fsl-mc/bus/mc-bus.c     J. German Rivera   2015-03-05  733  	return 0;
bbf9d17d987544 drivers/staging/fsl-mc/bus/mc-bus.c     J. German Rivera   2015-03-05  734  
bbf9d17d987544 drivers/staging/fsl-mc/bus/mc-bus.c     J. German Rivera   2015-03-05  735  error_cleanup_dev:
bbf9d17d987544 drivers/staging/fsl-mc/bus/mc-bus.c     J. German Rivera   2015-03-05  736  	kfree(mc_dev->regions);
dc341c4ec2bf7c drivers/staging/fsl-mc/bus/fsl-mc-bus.c Laurentiu Tudor    2017-02-07  737  	kfree(mc_bus);
9b65332e0e3f83 drivers/staging/fsl-mc/bus/fsl-mc-bus.c Laurentiu Tudor    2017-02-07  738  	kfree(mc_dev);
bbf9d17d987544 drivers/staging/fsl-mc/bus/mc-bus.c     J. German Rivera   2015-03-05  739  
bbf9d17d987544 drivers/staging/fsl-mc/bus/mc-bus.c     J. German Rivera   2015-03-05  740  	return error;
bbf9d17d987544 drivers/staging/fsl-mc/bus/mc-bus.c     J. German Rivera   2015-03-05  741  }
bbf9d17d987544 drivers/staging/fsl-mc/bus/mc-bus.c     J. German Rivera   2015-03-05  742  EXPORT_SYMBOL_GPL(fsl_mc_device_add);
bbf9d17d987544 drivers/staging/fsl-mc/bus/mc-bus.c     J. German Rivera   2015-03-05  743  

:::::: The code at line 602 was first introduced by commit
:::::: bbf9d17d987544bd784fa0a6b99d756b0492e715 staging: fsl-mc: Freescale Management Complex (fsl-mc) bus driver

:::::: TO: J. German Rivera <German.Rivera@freescale.com>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
