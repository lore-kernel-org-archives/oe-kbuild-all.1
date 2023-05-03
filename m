Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B03F4FBFB
	for <oe-kbuild-all@lists.linux.dev>; Wed,  3 May 2023 23:11:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683155507; x=1714691507;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zjASLe0uc/nkUkaFL3EGaDbRNEIKCjDk+SCI+jmbNi8=;
  b=LR/H2yOKYLYG3gnYR2+m8hg7epgQELv7PK9xpIUWBdOjDrhURpPqwKrt
   VWyii9zTZgg9Nzkq3kyQoT9fEkVd3KoEnRaekoOs004as2OkUFe4s6iw8
   zJ5Up32UOkds5XBfIVbLiW83A1AXumXkt430F1QvVxFmu9yemk73D+Tb1
   UVrTPhZxuL5CJ6FIclbN9xeYhn/w2w9C0RuvwfX42GmrVx5PhkpOOZaH6
   lSEVTI8M9HzPacmXosv4/zA4oEEp7NjaNPrqQ+xTDpBCsK1TUNaIuoNk5
   HdYdmEKQcCmTRiCF+kGzG9EXDpl3OlCfnZwdmGozNpTwOs8XUzUUAWLlw
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10699"; a="329146085"
X-IronPort-AV: E=Sophos;i="5.99,248,1677571200"; 
   d="scan'208";a="329146085"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 May 2023 16:11:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10699"; a="840873286"
X-IronPort-AV: E=Sophos;i="5.99,248,1677571200"; 
   d="scan'208";a="840873286"
Received: from lkp-server01.sh.intel.com (HELO e3434d64424d) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 03 May 2023 16:11:37 -0700
Received: from kbuild by e3434d64424d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1puLdI-0002LQ-21;
	Wed, 03 May 2023 23:11:36 +0000
Date: Thu, 4 May 2023 07:11:21 +0800
From: kernel test robot <lkp@intel.com>
To: Tushar Nimkar <quic_tnimkar@quicinc.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Bjorn Andersson <andersson@kernel.org>
Subject: drivers/soc/qcom/rpmh-rsc.c:1076 rpmh_rsc_probe() warn: always true
 condition '(drv->ver.minor >= 0) => (0-u32max >= 0)'
Message-ID: <202305040742.9ZtlciO9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   fa31fc82fb775445c176e576304c4098222f47f2
commit: 88704a0cd71909c3107561261412a5d5beb23358 soc: qcom: rpmh-rsc: Support RSC v3 minor versions
date:   4 weeks ago
config: nios2-randconfig-m031-20230503 (https://download.01.org/0day-ci/archive/20230504/202305040742.9ZtlciO9-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305040742.9ZtlciO9-lkp@intel.com/

New smatch warnings:
drivers/soc/qcom/rpmh-rsc.c:1076 rpmh_rsc_probe() warn: always true condition '(drv->ver.minor >= 0) => (0-u32max >= 0)'

Old smatch warnings:
arch/nios2/include/asm/thread_info.h:62 current_thread_info() error: uninitialized symbol 'sp'.

vim +1076 drivers/soc/qcom/rpmh-rsc.c

  1031	
  1032	static int rpmh_rsc_probe(struct platform_device *pdev)
  1033	{
  1034		struct device_node *dn = pdev->dev.of_node;
  1035		struct rsc_drv *drv;
  1036		char drv_id[10] = {0};
  1037		int ret, irq;
  1038		u32 solver_config;
  1039		u32 rsc_id;
  1040	
  1041		/*
  1042		 * Even though RPMh doesn't directly use cmd-db, all of its children
  1043		 * do. To avoid adding this check to our children we'll do it now.
  1044		 */
  1045		ret = cmd_db_ready();
  1046		if (ret) {
  1047			if (ret != -EPROBE_DEFER)
  1048				dev_err(&pdev->dev, "Command DB not available (%d)\n",
  1049										ret);
  1050			return ret;
  1051		}
  1052	
  1053		drv = devm_kzalloc(&pdev->dev, sizeof(*drv), GFP_KERNEL);
  1054		if (!drv)
  1055			return -ENOMEM;
  1056	
  1057		ret = of_property_read_u32(dn, "qcom,drv-id", &drv->id);
  1058		if (ret)
  1059			return ret;
  1060	
  1061		drv->name = of_get_property(dn, "label", NULL);
  1062		if (!drv->name)
  1063			drv->name = dev_name(&pdev->dev);
  1064	
  1065		snprintf(drv_id, ARRAY_SIZE(drv_id), "drv-%d", drv->id);
  1066		drv->base = devm_platform_ioremap_resource_byname(pdev, drv_id);
  1067		if (IS_ERR(drv->base))
  1068			return PTR_ERR(drv->base);
  1069	
  1070		rsc_id = readl_relaxed(drv->base + RSC_DRV_ID);
  1071		drv->ver.major = rsc_id & (MAJOR_VER_MASK << MAJOR_VER_SHIFT);
  1072		drv->ver.major >>= MAJOR_VER_SHIFT;
  1073		drv->ver.minor = rsc_id & (MINOR_VER_MASK << MINOR_VER_SHIFT);
  1074		drv->ver.minor >>= MINOR_VER_SHIFT;
  1075	
> 1076		if (drv->ver.major == 3 && drv->ver.minor >= 0)
  1077			drv->regs = rpmh_rsc_reg_offset_ver_3_0;
  1078		else
  1079			drv->regs = rpmh_rsc_reg_offset_ver_2_7;
  1080	
  1081		ret = rpmh_probe_tcs_config(pdev, drv);
  1082		if (ret)
  1083			return ret;
  1084	
  1085		spin_lock_init(&drv->lock);
  1086		init_waitqueue_head(&drv->tcs_wait);
  1087		bitmap_zero(drv->tcs_in_use, MAX_TCS_NR);
  1088	
  1089		irq = platform_get_irq(pdev, drv->id);
  1090		if (irq < 0)
  1091			return irq;
  1092	
  1093		ret = devm_request_irq(&pdev->dev, irq, tcs_tx_done,
  1094				       IRQF_TRIGGER_HIGH | IRQF_NO_SUSPEND,
  1095				       drv->name, drv);
  1096		if (ret)
  1097			return ret;
  1098	
  1099		/*
  1100		 * CPU PM/genpd notification are not required for controllers that support
  1101		 * 'HW solver' mode where they can be in autonomous mode executing low
  1102		 * power mode to power down.
  1103		 */
  1104		solver_config = readl_relaxed(drv->base + drv->regs[DRV_SOLVER_CONFIG]);
  1105		solver_config &= DRV_HW_SOLVER_MASK << DRV_HW_SOLVER_SHIFT;
  1106		solver_config = solver_config >> DRV_HW_SOLVER_SHIFT;
  1107		if (!solver_config) {
  1108			if (pdev->dev.pm_domain) {
  1109				ret = rpmh_rsc_pd_attach(drv, &pdev->dev);
  1110				if (ret)
  1111					return ret;
  1112			} else {
  1113				drv->rsc_pm.notifier_call = rpmh_rsc_cpu_pm_callback;
  1114				cpu_pm_register_notifier(&drv->rsc_pm);
  1115			}
  1116		}
  1117	
  1118		/* Enable the active TCS to send requests immediately */
  1119		writel_relaxed(drv->tcs[ACTIVE_TCS].mask,
  1120			       drv->tcs_base + drv->regs[RSC_DRV_IRQ_ENABLE]);
  1121	
  1122		spin_lock_init(&drv->client.cache_lock);
  1123		INIT_LIST_HEAD(&drv->client.cache);
  1124		INIT_LIST_HEAD(&drv->client.batch_cache);
  1125	
  1126		dev_set_drvdata(&pdev->dev, drv);
  1127		drv->dev = &pdev->dev;
  1128	
  1129		ret = devm_of_platform_populate(&pdev->dev);
  1130		if (ret && pdev->dev.pm_domain) {
  1131			dev_pm_genpd_remove_notifier(&pdev->dev);
  1132			pm_runtime_disable(&pdev->dev);
  1133		}
  1134	
  1135		return ret;
  1136	}
  1137	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
