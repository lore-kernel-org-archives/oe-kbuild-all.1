Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81B267F0
	for <oe-kbuild-all@lists.linux.dev>; Sun,  6 Aug 2023 18:39:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691347157; x=1722883157;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=e41Ddhxv3ZuR62jOcnYljme+uGvyOqba7nBFbxn3P48=;
  b=l9UiHy+QZdM61lon3W+7fY48cNh9WgAnf6lbUGrQ2ROpMWvsLoVFCePA
   7wHpHBLqdhCenD7jhAg+e+kExsjVnpuAB+KPd3sURvKRhysbk/1BxAcc7
   ncUm5n1Kmt+J23Ro/liYxQFd3SvY8i9euDM9CHjwZ3zoM+OtRrPRn6fX+
   NTyiRC/GR4G5KwerxRe+Oi1YkqjGjNEuhiaIo4L7sUk4wb1RANo5ks0M5
   49zuPpYo6Uq8h/xj8YbX1kejyhFceXJMYZ0MqBmfvJ0CQmIjfu+6GuIP9
   TC/kqA0h2lMwLCAmzGhwUwdkLmIPonVIc3bG5k8F2zEoD1nNMR3zSuS9Z
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10794"; a="374065252"
X-IronPort-AV: E=Sophos;i="6.01,260,1684825200"; 
   d="scan'208";a="374065252"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2023 11:39:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10794"; a="904469895"
X-IronPort-AV: E=Sophos;i="6.01,260,1684825200"; 
   d="scan'208";a="904469895"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 06 Aug 2023 11:39:15 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qSieo-0004L1-1D;
	Sun, 06 Aug 2023 18:39:14 +0000
Date: Mon, 7 Aug 2023 02:39:07 +0800
From: kernel test robot <lkp@intel.com>
To: Sasha Levin <sashal@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sashal-stable:pending-5.15 11/60]
 drivers/firmware/arm_scmi/smc.c:39:6: error: duplicate member 'irq'
Message-ID: <202308070210.02YncwNG-lkp@intel.com>
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
config: arm-randconfig-r046-20230806 (https://download.01.org/0day-ci/archive/20230807/202308070210.02YncwNG-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce: (https://download.01.org/0day-ci/archive/20230807/202308070210.02YncwNG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308070210.02YncwNG-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/firmware/arm_scmi/smc.c:39:6: error: duplicate member 'irq'
           int irq;
               ^
   drivers/firmware/arm_scmi/smc.c:34:6: note: previous declaration is here
           int irq;
               ^
>> drivers/firmware/arm_scmi/smc.c:116:20: error: use of undeclared identifier 'irq'
                   scmi_info->irq = irq;
                                    ^
   2 errors generated.


vim +/irq +39 drivers/firmware/arm_scmi/smc.c

1dc6558062dadf Peng Fan         2020-03-08   20  
1dc6558062dadf Peng Fan         2020-03-08   21  /**
1dc6558062dadf Peng Fan         2020-03-08   22   * struct scmi_smc - Structure representing a SCMI smc transport
1dc6558062dadf Peng Fan         2020-03-08   23   *
9ee0700cb50085 Cristian Marussi 2023-07-19   24   * @irq: An optional IRQ for completion
1dc6558062dadf Peng Fan         2020-03-08   25   * @cinfo: SCMI channel info
1dc6558062dadf Peng Fan         2020-03-08   26   * @shmem: Transmit/Receive shared memory area
a4ee9d0194c245 Sudeep Holla     2020-07-09   27   * @shmem_lock: Lock to protect access to Tx/Rx shared memory area
1dc6558062dadf Peng Fan         2020-03-08   28   * @func_id: smc/hvc call function id
dd820ee21d5e07 Jim Quinlan      2020-12-22   29   * @irq: Optional; employed when platforms indicates msg completion by intr.
dd820ee21d5e07 Jim Quinlan      2020-12-22   30   * @tx_complete: Optional, employed only when irq is valid.
1dc6558062dadf Peng Fan         2020-03-08   31   */
1dc6558062dadf Peng Fan         2020-03-08   32  
1dc6558062dadf Peng Fan         2020-03-08   33  struct scmi_smc {
9ee0700cb50085 Cristian Marussi 2023-07-19   34  	int irq;
1dc6558062dadf Peng Fan         2020-03-08   35  	struct scmi_chan_info *cinfo;
1dc6558062dadf Peng Fan         2020-03-08   36  	struct scmi_shared_mem __iomem *shmem;
18988265b87615 Sudeep Holla     2020-03-27   37  	struct mutex shmem_lock;
1dc6558062dadf Peng Fan         2020-03-08   38  	u32 func_id;
dd820ee21d5e07 Jim Quinlan      2020-12-22  @39  	int irq;
dd820ee21d5e07 Jim Quinlan      2020-12-22   40  	struct completion tx_complete;
1dc6558062dadf Peng Fan         2020-03-08   41  };
1dc6558062dadf Peng Fan         2020-03-08   42  
dd820ee21d5e07 Jim Quinlan      2020-12-22   43  static irqreturn_t smc_msg_done_isr(int irq, void *data)
dd820ee21d5e07 Jim Quinlan      2020-12-22   44  {
dd820ee21d5e07 Jim Quinlan      2020-12-22   45  	struct scmi_smc *scmi_info = data;
dd820ee21d5e07 Jim Quinlan      2020-12-22   46  
dd820ee21d5e07 Jim Quinlan      2020-12-22   47  	complete(&scmi_info->tx_complete);
dd820ee21d5e07 Jim Quinlan      2020-12-22   48  
dd820ee21d5e07 Jim Quinlan      2020-12-22   49  	return IRQ_HANDLED;
dd820ee21d5e07 Jim Quinlan      2020-12-22   50  }
dd820ee21d5e07 Jim Quinlan      2020-12-22   51  
1dc6558062dadf Peng Fan         2020-03-08   52  static bool smc_chan_available(struct device *dev, int idx)
1dc6558062dadf Peng Fan         2020-03-08   53  {
8aa6e12bbf9dd6 Sudeep Holla     2020-03-27   54  	struct device_node *np = of_parse_phandle(dev->of_node, "shmem", 0);
8aa6e12bbf9dd6 Sudeep Holla     2020-03-27   55  	if (!np)
8aa6e12bbf9dd6 Sudeep Holla     2020-03-27   56  		return false;
8aa6e12bbf9dd6 Sudeep Holla     2020-03-27   57  
8aa6e12bbf9dd6 Sudeep Holla     2020-03-27   58  	of_node_put(np);
1dc6558062dadf Peng Fan         2020-03-08   59  	return true;
1dc6558062dadf Peng Fan         2020-03-08   60  }
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

:::::: The code at line 39 was first introduced by commit
:::::: dd820ee21d5e0795096a6e0e47c0183d96464949 firmware: arm_scmi: Augment SMC/HVC to allow optional interrupt

:::::: TO: Jim Quinlan <jim2101024@gmail.com>
:::::: CC: Sudeep Holla <sudeep.holla@arm.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
