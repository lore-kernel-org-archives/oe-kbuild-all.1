Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 325F9392
	for <oe-kbuild-all@lists.linux.dev>; Mon,  7 Aug 2023 01:22:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691371344; x=1722907344;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=AolYnn8169BcSG9q877x5L4uUa/7PqAdjoDXHCuCaDE=;
  b=Zqzavde+Ympa/okx+gQPijfVwYJZIQ4rmKpV4TUh1ehM1uceAVBujHcc
   BP/hskFjQub4e0M5IoooABtMomCkKBtNBHGkkMoM+WyxBCWqyUS9jY8oY
   jAKgEJoOF87WMWyKTd3BQ4ecg8JICq/NcCBX4Q6wC6QV0EgjMQpgc6Osd
   sN1/c7wSbr+YzuyHysj+sp/fRrmIFfFPoyz9T5wn0/xUyt2yW/DmWEzgu
   fGikyRaEOpqsO82c0YNEzW/xXicIsLq8hqq/6tbPtUNDY/pm8MdXRGuXg
   FLG0CA++It0nVphyroaU80z+UVb+SWQ4Mbg5jy1rJ+vLdGaxi0yKDvmhZ
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10794"; a="373179412"
X-IronPort-AV: E=Sophos;i="6.01,261,1684825200"; 
   d="scan'208";a="373179412"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2023 18:22:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10794"; a="680630419"
X-IronPort-AV: E=Sophos;i="6.01,261,1684825200"; 
   d="scan'208";a="680630419"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 06 Aug 2023 18:22:22 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qSowv-0004SX-1K;
	Mon, 07 Aug 2023 01:22:21 +0000
Date: Mon, 7 Aug 2023 09:22:13 +0800
From: kernel test robot <lkp@intel.com>
To: Sasha Levin <sashal@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sashal-stable:pending-5.15 11/60]
 drivers/firmware/arm_scmi/smc.c:116:34: error: 'irq' undeclared; did you
 mean 'rq'?
Message-ID: <202308070912.4UYUVJVJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stable.git pending-5.15
head:   eec50650bd392904c7b2acbea142ac47dba8e4fd
commit: 9ee0700cb50085b8ea63c0fabd8c458c56e66a51 [11/60] firmware: arm_scmi: Fix chan_free cleanup on SMC
config: arm-allmodconfig (https://download.01.org/0day-ci/archive/20230807/202308070912.4UYUVJVJ-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230807/202308070912.4UYUVJVJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308070912.4UYUVJVJ-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/firmware/arm_scmi/smc.c:39:13: error: duplicate member 'irq'
      39 |         int irq;
         |             ^~~
   drivers/firmware/arm_scmi/smc.c: In function 'smc_chan_setup':
>> drivers/firmware/arm_scmi/smc.c:116:34: error: 'irq' undeclared (first use in this function); did you mean 'rq'?
     116 |                 scmi_info->irq = irq;
         |                                  ^~~
         |                                  rq
   drivers/firmware/arm_scmi/smc.c:116:34: note: each undeclared identifier is reported only once for each function it appears in


vim +116 drivers/firmware/arm_scmi/smc.c

1dc6558062dadf Peng Fan         2020-03-08   61  
1dc6558062dadf Peng Fan         2020-03-08   62  static int smc_chan_setup(struct scmi_chan_info *cinfo, struct device *dev,
1dc6558062dadf Peng Fan         2020-03-08   63  			  bool tx)
1dc6558062dadf Peng Fan         2020-03-08   64  {
1dc6558062dadf Peng Fan         2020-03-08   65  	struct device *cdev = cinfo->dev;
1dc6558062dadf Peng Fan         2020-03-08   66  	struct scmi_smc *scmi_info;
1dc6558062dadf Peng Fan         2020-03-08   67  	resource_size_t size;
1dc6558062dadf Peng Fan         2020-03-08   68  	struct resource res;
1dc6558062dadf Peng Fan         2020-03-08   69  	struct device_node *np;
1dc6558062dadf Peng Fan         2020-03-08   70  	u32 func_id;
9ee0700cb50085 Cristian Marussi 2023-07-19   71  	int ret;
1dc6558062dadf Peng Fan         2020-03-08   72  
1dc6558062dadf Peng Fan         2020-03-08   73  	if (!tx)
1dc6558062dadf Peng Fan         2020-03-08   74  		return -ENODEV;
1dc6558062dadf Peng Fan         2020-03-08   75  
1dc6558062dadf Peng Fan         2020-03-08   76  	scmi_info = devm_kzalloc(dev, sizeof(*scmi_info), GFP_KERNEL);
1dc6558062dadf Peng Fan         2020-03-08   77  	if (!scmi_info)
1dc6558062dadf Peng Fan         2020-03-08   78  		return -ENOMEM;
1dc6558062dadf Peng Fan         2020-03-08   79  
1dc6558062dadf Peng Fan         2020-03-08   80  	np = of_parse_phandle(cdev->of_node, "shmem", 0);
507cd4d2c5eb2d Sudeep Holla     2021-06-02   81  	if (!of_device_is_compatible(np, "arm,scmi-shmem"))
507cd4d2c5eb2d Sudeep Holla     2021-06-02   82  		return -ENXIO;
507cd4d2c5eb2d Sudeep Holla     2021-06-02   83  
1dc6558062dadf Peng Fan         2020-03-08   84  	ret = of_address_to_resource(np, 0, &res);
1dc6558062dadf Peng Fan         2020-03-08   85  	of_node_put(np);
1dc6558062dadf Peng Fan         2020-03-08   86  	if (ret) {
1dc6558062dadf Peng Fan         2020-03-08   87  		dev_err(cdev, "failed to get SCMI Tx shared memory\n");
1dc6558062dadf Peng Fan         2020-03-08   88  		return ret;
1dc6558062dadf Peng Fan         2020-03-08   89  	}
1dc6558062dadf Peng Fan         2020-03-08   90  
1dc6558062dadf Peng Fan         2020-03-08   91  	size = resource_size(&res);
1dc6558062dadf Peng Fan         2020-03-08   92  	scmi_info->shmem = devm_ioremap(dev, res.start, size);
1dc6558062dadf Peng Fan         2020-03-08   93  	if (!scmi_info->shmem) {
1dc6558062dadf Peng Fan         2020-03-08   94  		dev_err(dev, "failed to ioremap SCMI Tx shared memory\n");
1dc6558062dadf Peng Fan         2020-03-08   95  		return -EADDRNOTAVAIL;
1dc6558062dadf Peng Fan         2020-03-08   96  	}
1dc6558062dadf Peng Fan         2020-03-08   97  
1dc6558062dadf Peng Fan         2020-03-08   98  	ret = of_property_read_u32(dev->of_node, "arm,smc-id", &func_id);
1dc6558062dadf Peng Fan         2020-03-08   99  	if (ret < 0)
1dc6558062dadf Peng Fan         2020-03-08  100  		return ret;
1dc6558062dadf Peng Fan         2020-03-08  101  
dd820ee21d5e07 Jim Quinlan      2020-12-22  102  	/*
dd820ee21d5e07 Jim Quinlan      2020-12-22  103  	 * If there is an interrupt named "a2p", then the service and
dd820ee21d5e07 Jim Quinlan      2020-12-22  104  	 * completion of a message is signaled by an interrupt rather than by
dd820ee21d5e07 Jim Quinlan      2020-12-22  105  	 * the return of the SMC call.
dd820ee21d5e07 Jim Quinlan      2020-12-22  106  	 */
9ee0700cb50085 Cristian Marussi 2023-07-19  107  	scmi_info->irq = of_irq_get_byname(cdev->of_node, "a2p");
9ee0700cb50085 Cristian Marussi 2023-07-19  108  	if (scmi_info->irq > 0) {
9ee0700cb50085 Cristian Marussi 2023-07-19  109  		ret = request_irq(scmi_info->irq, smc_msg_done_isr,
9ee0700cb50085 Cristian Marussi 2023-07-19  110  				  IRQF_NO_SUSPEND, dev_name(dev), scmi_info);
dd820ee21d5e07 Jim Quinlan      2020-12-22  111  		if (ret) {
dd820ee21d5e07 Jim Quinlan      2020-12-22  112  			dev_err(dev, "failed to setup SCMI smc irq\n");
dd820ee21d5e07 Jim Quinlan      2020-12-22  113  			return ret;
dd820ee21d5e07 Jim Quinlan      2020-12-22  114  		}
dd820ee21d5e07 Jim Quinlan      2020-12-22  115  		init_completion(&scmi_info->tx_complete);
dd820ee21d5e07 Jim Quinlan      2020-12-22 @116  		scmi_info->irq = irq;
dd820ee21d5e07 Jim Quinlan      2020-12-22  117  	}
dd820ee21d5e07 Jim Quinlan      2020-12-22  118  
1dc6558062dadf Peng Fan         2020-03-08  119  	scmi_info->func_id = func_id;
1dc6558062dadf Peng Fan         2020-03-08  120  	scmi_info->cinfo = cinfo;
18988265b87615 Sudeep Holla     2020-03-27  121  	mutex_init(&scmi_info->shmem_lock);
1dc6558062dadf Peng Fan         2020-03-08  122  	cinfo->transport_info = scmi_info;
1dc6558062dadf Peng Fan         2020-03-08  123  
1dc6558062dadf Peng Fan         2020-03-08  124  	return 0;
1dc6558062dadf Peng Fan         2020-03-08  125  }
1dc6558062dadf Peng Fan         2020-03-08  126  

:::::: The code at line 116 was first introduced by commit
:::::: dd820ee21d5e0795096a6e0e47c0183d96464949 firmware: arm_scmi: Augment SMC/HVC to allow optional interrupt

:::::: TO: Jim Quinlan <jim2101024@gmail.com>
:::::: CC: Sudeep Holla <sudeep.holla@arm.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
