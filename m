Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43969156D4
	for <oe-kbuild-all@lists.linux.dev>; Thu, 21 Dec 2023 07:56:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U7eJZjkW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703145393; x=1734681393;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=P6doHAep5FKXLP7JwaHerRtXV9heJmrrPdoRkwnGqJ4=;
  b=U7eJZjkW2VhAMuVHyvIG2JjtBdphxTWyg71+HJFpmqJ0HArEZ2sXwXuK
   wq/vEWjCrKPgIy6M97TYWuDIKFj+ex1S9ems4fwH/Mt0rDp1Env4Vm9rj
   RyjKytZzCxZYaZ1Mc+zp41YhwL8BepPprblItjtCa5hU+cxJ7LzGMNz/Y
   6jcCqft60vn848soqmzN7LwvbIabMGBTTBz5fK0k2QmYvcVAr05AUFLog
   UJwOcVuNdFPrt3P/pGUCcL/lRqG9Det5bo6w9pTlwykFlLB9Di73h/9ir
   eFO2ANC6w813wFFM/bQvm+cxRRtDSx/ACZL4maTzgn237J4LVo+aQoRVt
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10930"; a="398721171"
X-IronPort-AV: E=Sophos;i="6.04,293,1695711600"; 
   d="scan'208";a="398721171"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2023 23:56:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10930"; a="842559283"
X-IronPort-AV: E=Sophos;i="6.04,293,1695711600"; 
   d="scan'208";a="842559283"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 20 Dec 2023 23:56:31 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rGDup-00086X-2m;
	Thu, 21 Dec 2023 07:56:24 +0000
Date: Thu, 21 Dec 2023 15:56:08 +0800
From: kernel test robot <lkp@intel.com>
To: James Morse <james.morse@arm.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [morse:mpam/snapshot/v6.7-rc2 106/110]
 drivers/perf/arm-cmn.c:2458:40: warning: passing argument 1 of 'PTR_ERR'
 makes pointer from integer without a cast
Message-ID: <202312211511.KdFOiV3s-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/morse/linux.git mpam/snapshot/v6.7-rc2
head:   b530deed244d9b45f3bce3cccde91f6ed0ebf7ea
commit: af8184da77bf79023a968bab12ad78de7f7311f1 [106/110] perf/arm-cmn: Stop claiming all the resources
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20231221/202312211511.KdFOiV3s-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231221/202312211511.KdFOiV3s-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312211511.KdFOiV3s-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/perf/arm-cmn.c: In function 'arm_cmn_probe':
>> drivers/perf/arm-cmn.c:2458:40: warning: passing argument 1 of 'PTR_ERR' makes pointer from integer without a cast [-Wint-conversion]
    2458 |                         return PTR_ERR(-EINVAL);
   In file included from include/linux/string.h:9,
                    from include/linux/bitmap.h:12,
                    from include/linux/cpumask.h:12,
                    from include/linux/smp.h:13,
                    from include/linux/lockdep.h:14,
                    from include/linux/spinlock.h:63,
                    from include/linux/mmzone.h:8,
                    from include/linux/gfp.h:7,
                    from include/linux/slab.h:16,
                    from include/linux/resource_ext.h:11,
                    from include/linux/acpi.h:13,
                    from drivers/perf/arm-cmn.c:5:
   include/linux/err.h:49:61: note: expected 'const void *' but argument is of type 'int'
      49 | static inline long __must_check PTR_ERR(__force const void *ptr)
         |                                                 ~~~~~~~~~~~~^~~


vim +/PTR_ERR +2458 drivers/perf/arm-cmn.c

  2429	
  2430	static int arm_cmn_probe(struct platform_device *pdev)
  2431	{
  2432		struct arm_cmn *cmn;
  2433		const char *name;
  2434		static atomic_t id;
  2435		struct resource *cfg;
  2436		int err, rootnode, this_id;
  2437	
  2438		cmn = devm_kzalloc(&pdev->dev, sizeof(*cmn), GFP_KERNEL);
  2439		if (!cmn)
  2440			return -ENOMEM;
  2441	
  2442		cmn->dev = &pdev->dev;
  2443		cmn->part = (unsigned long)device_get_match_data(cmn->dev);
  2444		platform_set_drvdata(pdev, cmn);
  2445	
  2446		if (cmn->part == PART_CMN600 && has_acpi_companion(cmn->dev)) {
  2447			rootnode = arm_cmn600_acpi_probe(pdev, cmn);
  2448		} else {
  2449			rootnode = 0;
  2450	
  2451			/*
  2452			 * Avoid registering resources as the PMUs registers are
  2453			 * scattered through CMN, and may appear either side of
  2454			 * registers for other 'devices'. (e.g. the MPAM MSC controls).
  2455			 */
  2456			cfg = platform_get_resource(pdev, IORESOURCE_MEM, 0);
  2457			if (!cfg)
> 2458				return PTR_ERR(-EINVAL);
  2459			cmn->base = devm_ioremap(&pdev->dev, cfg->start, resource_size(cfg));
  2460			if (IS_ERR(cmn->base))
  2461				return PTR_ERR(cmn->base);
  2462			if (cmn->part == PART_CMN600)
  2463				rootnode = arm_cmn600_of_probe(pdev->dev.of_node);
  2464		}
  2465		if (rootnode < 0)
  2466			return rootnode;
  2467	
  2468		err = arm_cmn_discover(cmn, rootnode);
  2469		if (err)
  2470			return err;
  2471	
  2472		err = arm_cmn_init_dtcs(cmn);
  2473		if (err)
  2474			return err;
  2475	
  2476		err = arm_cmn_init_irqs(cmn);
  2477		if (err)
  2478			return err;
  2479	
  2480		cmn->cpu = cpumask_local_spread(0, dev_to_node(cmn->dev));
  2481		cmn->pmu = (struct pmu) {
  2482			.module = THIS_MODULE,
  2483			.attr_groups = arm_cmn_attr_groups,
  2484			.capabilities = PERF_PMU_CAP_NO_EXCLUDE,
  2485			.task_ctx_nr = perf_invalid_context,
  2486			.pmu_enable = arm_cmn_pmu_enable,
  2487			.pmu_disable = arm_cmn_pmu_disable,
  2488			.event_init = arm_cmn_event_init,
  2489			.add = arm_cmn_event_add,
  2490			.del = arm_cmn_event_del,
  2491			.start = arm_cmn_event_start,
  2492			.stop = arm_cmn_event_stop,
  2493			.read = arm_cmn_event_read,
  2494			.start_txn = arm_cmn_start_txn,
  2495			.commit_txn = arm_cmn_commit_txn,
  2496			.cancel_txn = arm_cmn_end_txn,
  2497		};
  2498	
  2499		this_id = atomic_fetch_inc(&id);
  2500		name = devm_kasprintf(cmn->dev, GFP_KERNEL, "arm_cmn_%d", this_id);
  2501		if (!name)
  2502			return -ENOMEM;
  2503	
  2504		err = cpuhp_state_add_instance(arm_cmn_hp_state, &cmn->cpuhp_node);
  2505		if (err)
  2506			return err;
  2507	
  2508		err = perf_pmu_register(&cmn->pmu, name, -1);
  2509		if (err)
  2510			cpuhp_state_remove_instance_nocalls(arm_cmn_hp_state, &cmn->cpuhp_node);
  2511		else
  2512			arm_cmn_debugfs_init(cmn, this_id);
  2513	
  2514		return err;
  2515	}
  2516	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
