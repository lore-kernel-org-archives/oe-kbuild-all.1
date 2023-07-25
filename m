Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 088F314260
	for <oe-kbuild-all@lists.linux.dev>; Tue, 25 Jul 2023 08:18:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690273134; x=1721809134;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Y/WJ300QRN66iLInKSOyrWPMs3HyjIyiI2y30nzRpMs=;
  b=KmFc1RgHT37sZ4VMX1pdCfizGWG+AaciGAULI7W9cBCPFuMObG2ivgML
   nfkT/OXc46mSi9shM+uapHN4VdKPJ4NxvqPTJM0i/sIyHAFDLqx7QXcbJ
   nCg3VZC1o75mB4gh3u/i4xpGRNMqTONLD8lXSXp1BMD7LflSqhW+pxZOV
   hfifMjKCgztzTpGtowPIQGOeXckMuP7UAbiauWqlNObdgviVMVPQeIrs9
   WqAIu4JdxhOH7IgXyDgoi0EI4qpr1yAlacruHImblehuFC2C9Z5Oq396B
   5Fgk0XvrF4Yvzh/qpHU7akh062hERTfpQFSeX+4SDKBNEux1KhRmxq75F
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10781"; a="367677130"
X-IronPort-AV: E=Sophos;i="6.01,230,1684825200"; 
   d="scan'208";a="367677130"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jul 2023 01:18:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10781"; a="839780646"
X-IronPort-AV: E=Sophos;i="6.01,230,1684825200"; 
   d="scan'208";a="839780646"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 25 Jul 2023 01:18:47 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qODFm-000ASR-26;
	Tue, 25 Jul 2023 08:18:46 +0000
Date: Tue, 25 Jul 2023 16:17:51 +0800
From: kernel test robot <lkp@intel.com>
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sudeep-holla:ffa_notify 10/16]
 drivers/firmware/arm_ffa/driver.c:986:35: sparse: sparse: incorrect type in
 argument 4 (different address spaces)
Message-ID: <202307251655.AnAfpBZC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux.git ffa_notify
head:   50176e212a1e52a7fc37c2ea8f7e0d5937c62955
commit: bf078b6d8dd9366c0033b6f337a751a49b00d15b [10/16] firmware: arm_ffa: Initial support for Scheduler Receiver Interrupt
config: arm64-randconfig-r083-20230723 (https://download.01.org/0day-ci/archive/20230725/202307251655.AnAfpBZC-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230725/202307251655.AnAfpBZC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307251655.AnAfpBZC-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/firmware/arm_ffa/driver.c:986:35: sparse: sparse: incorrect type in argument 4 (different address spaces) @@     expected void [noderef] __percpu *percpu_dev_id @@     got int * @@
   drivers/firmware/arm_ffa/driver.c:986:35: sparse:     expected void [noderef] __percpu *percpu_dev_id
   drivers/firmware/arm_ffa/driver.c:986:35: sparse:     got int *

vim +986 drivers/firmware/arm_ffa/driver.c

   949	
   950	static int ffa_setup_notifications(void)
   951	{
   952		int sr_intid;
   953		int irq;
   954		int ret;
   955		struct of_phandle_args oirq = {};
   956		struct device_node *gic;
   957	
   958		/* Call FFA Features to get ID to be used for Scheduler Receiver */
   959		ret = ffa_features(FFA_FEAT_SCHED_RECV_INT, 0, &sr_intid, NULL);
   960		if (ret < 0) {
   961			if (ret != -EOPNOTSUPP)
   962				pr_err("Failed to retrieve scheduler Rx interupt\n");
   963			return ret;
   964		}
   965	
   966		/* Create Mappings for IRQ */
   967		gic = of_find_compatible_node(NULL, NULL, "arm,gic-v3");
   968		if (!gic)
   969			return -ENXIO;
   970	
   971		oirq.np = gic;
   972		oirq.args_count = 1;
   973		oirq.args[0] = sr_intid;
   974		irq = irq_create_of_mapping(&oirq);
   975		of_node_put(gic);
   976	
   977		if (!irq) {
   978			pr_err("Failed to create mapping!\n");
   979			return -ENODATA;
   980		}
   981	
   982		/* Store schedule receiver interrupt ID globally*/
   983		ffa_sched_recv_int_id = irq;
   984	
   985		ret = request_percpu_irq(ffa_sched_recv_int_id, irq_handler, "ARM-FFA",
 > 986					 &sr_intid);
   987	
   988		if (ret != 0) {
   989			pr_err("Error registering notification IRQ %d: %d\n",
   990			       sr_intid, ret);
   991			return ENODATA;
   992		}
   993	
   994		/* Enable handler on all cpus. */
   995		on_each_cpu(__enable_schedule_receiver_interrupt, NULL, 1);
   996	
   997		return 0;
   998	}
   999	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
