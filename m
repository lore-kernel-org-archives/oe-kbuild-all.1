Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D07CB7C
	for <oe-kbuild-all@lists.linux.dev>; Tue, 25 Jul 2023 02:10:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690251034; x=1721787034;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=REEJAqQXgVTVnDQKhFK1lOqsCLYaMpCSaY23SEP1Dzs=;
  b=PzggwqanX5rWOwfGZQpBNp6U9a765UG0gwg1H/4u/XapRg6spf4GsWrq
   jUUIATULToYzh5csE8tDxFbQuynTanLPnSRAGdWAZj+nOLzp2uiq9wQqa
   9+QYsXWJ9jrt3MA/ASr+fpBl/L0yt6GwKFHzheIzQgaSKmtg+JjtdmJfW
   m/YTSn9i2ZA2gjPpphkyosiMuZCOMZZnFYBJl0GaWLFBtyTykZx7JCyJ8
   Rtf9cGmIkh1cKn7Ziyv/gu4+2TNdS9qqiENOVaCJSjUe1WrMyJGeoG7/Q
   lyLzh2fodZnSHngbbpmPjZCDjnakiY2KYUlxeOU5KYVVjvhExuZA+nKqC
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10781"; a="371204906"
X-IronPort-AV: E=Sophos;i="6.01,229,1684825200"; 
   d="scan'208";a="371204906"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jul 2023 19:10:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10781"; a="849821027"
X-IronPort-AV: E=Sophos;i="6.01,229,1684825200"; 
   d="scan'208";a="849821027"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 24 Jul 2023 19:10:30 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qO7VA-000ACq-2G;
	Tue, 25 Jul 2023 02:10:25 +0000
Date: Tue, 25 Jul 2023 10:09:45 +0800
From: kernel test robot <lkp@intel.com>
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sudeep-holla:ffa_notify 10/16]
 drivers/firmware/arm_ffa/driver.c:986:35: sparse: sparse: incorrect type in
 argument 4 (different address spaces)
Message-ID: <202307251029.W0yN5jkX-lkp@intel.com>
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
config: arm64-randconfig-r083-20230723 (https://download.01.org/0day-ci/archive/20230725/202307251029.W0yN5jkX-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230725/202307251029.W0yN5jkX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307251029.W0yN5jkX-lkp@intel.com/

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
