Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0733BEA4
	for <oe-kbuild-all@lists.linux.dev>; Sun, 16 Jul 2023 06:32:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689489146; x=1721025146;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Hg2D4sectUmezzVdzcK/ZJBzxrkYBuGsZJ35jEqfN6k=;
  b=G33tgEt2c/sC6QD5diP4cTCC/cjkZYaUCLJRWtL+jt9YVYGMZ/kmYOhD
   94cgHCPMBa1Q5prhhmw9cUttJr8iUNWbxf/Na38pgoSnNAHCCDAIOp50S
   fR7Jpf82PqGt6QXFPwXNI6fQf0a8jgcxKyD29yxuTtGrLD83BRoPgjmKB
   zbAIVn22+WuA/Z9h0FmPLBjx2C7N9qqAUjwrWHA7Mc5NeRdXBch9IbpxA
   frJWTG4RqLcPZdWyIHUvgI8wpHeU5f27kAJ5VDTSC/As5oxEs5+60KmDL
   WI+kwZpdKwDb50QoTlNwYd3j9FUCH3mSsstTn8DJS3yiiAu4KTLta+qKy
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10772"; a="350600634"
X-IronPort-AV: E=Sophos;i="6.01,210,1684825200"; 
   d="scan'208";a="350600634"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2023 23:32:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10772"; a="792845477"
X-IronPort-AV: E=Sophos;i="6.01,210,1684825200"; 
   d="scan'208";a="792845477"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 15 Jul 2023 23:32:18 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qKvIn-0008fv-14;
	Sun, 16 Jul 2023 06:32:17 +0000
Date: Sun, 16 Jul 2023 14:31:58 +0800
From: kernel test robot <lkp@intel.com>
To: Laurent FERT <laurent.fert@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, "Pan, Kris" <kris.pan@intel.com>
Subject: [intel-lts:4.19/android_t 4329/30000]
 drivers/hwtracing/intel_th/gth.c:678 intel_th_gth_probe() warn: inconsistent
 indenting
Message-ID: <202307161457.rHxWZQEa-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/linux-intel-lts.git 4.19/android_t
head:   0f6dab7d9f97996aec10a8e2e854ec3bd628d550
commit: eb0a4b303e3ef7ad0d08bc96bce5168c80d27f2b [4329/30000] Do not reset trace hub on probe
config: x86_64-randconfig-m001-20230716 (https://download.01.org/0day-ci/archive/20230716/202307161457.rHxWZQEa-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230716/202307161457.rHxWZQEa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307161457.rHxWZQEa-lkp@intel.com/

New smatch warnings:
drivers/hwtracing/intel_th/gth.c:678 intel_th_gth_probe() warn: inconsistent indenting

Old smatch warnings:
drivers/hwtracing/intel_th/gth.c:215 master_attr_store() warn: potential spectre issue 'gth->output' [w] (local cap)

vim +678 drivers/hwtracing/intel_th/gth.c

   640	
   641	static int intel_th_gth_probe(struct intel_th_device *thdev)
   642	{
   643		struct device *dev = &thdev->dev;
   644		struct intel_th *th = dev_get_drvdata(dev->parent);
   645		struct gth_device *gth;
   646		struct resource *res;
   647		void __iomem *base;
   648		int i, ret;
   649		u32 scratchpad;
   650	
   651		res = intel_th_device_get_resource(thdev, IORESOURCE_MEM, 0);
   652		if (!res)
   653			return -ENODEV;
   654	
   655		base = devm_ioremap(dev, res->start, resource_size(res));
   656		if (!base)
   657			return -ENOMEM;
   658	
   659		gth = devm_kzalloc(dev, sizeof(*gth), GFP_KERNEL);
   660		if (!gth)
   661			return -ENOMEM;
   662	
   663		gth->dev = dev;
   664		gth->base = base;
   665		spin_lock_init(&gth->gth_lock);
   666	
   667	       dev_set_drvdata(dev, gth);
   668	
   669	       /*
   670	        * Host mode can be signalled via SW means or via SCRPD_DEBUGGER_IN_USE
   671	        * bit. Either way, don't reset HW in this case, and don't export any
   672	        * capture configuration attributes. Also, refuse to assign output
   673	        * drivers to ports, see intel_th_gth_assign().
   674	        */
   675	       if (thdev->host_mode)
   676	               return 0;
   677	
 > 678		scratchpad = ioread32(gth->base + REG_GTH_SCRPD0);
   679		if (scratchpad & SCRPD_DEBUGGER_IN_USE)
   680			return -EBUSY;
   681	
   682		for (i = 0; i < TH_CONFIGURABLE_MASTERS + 1; i++)
   683			gth->master[i] = gth_master_get(gth, i);
   684	
   685		for (i = 0; i < TH_POSSIBLE_OUTPUTS; i++) {
   686			gth->output[i].gth = gth;
   687			gth->output[i].index = i;
   688			gth->output[i].port_type =
   689				gth_output_parm_get(gth, i, TH_OUTPUT_PARM(port));
   690			if (gth->output[i].port_type == GTH_NONE)
   691				continue;
   692	
   693			ret = intel_th_output_enable(th, gth->output[i].port_type);
   694			/* -ENODEV is ok, we just won't have that device enumerated */
   695			if (ret && ret != -ENODEV)
   696				return ret;
   697		}
   698	
   699		if (intel_th_output_attributes(gth) ||
   700		    intel_th_master_attributes(gth)) {
   701			pr_warn("Can't initialize sysfs attributes\n");
   702	
   703			if (gth->output_group.attrs)
   704				sysfs_remove_group(&gth->dev->kobj, &gth->output_group);
   705			return -ENOMEM;
   706		}
   707	
   708		return 0;
   709	}
   710	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
