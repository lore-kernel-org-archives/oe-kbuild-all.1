Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA0AB1F4615
	for <oe-kbuild-all@lists.linux.dev>; Sun, 14 Dec 2025 04:08:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765685332; cv=none; b=gSRXN1VWY857HeOwYSnBSH2WE9fZqoRZiQQ7xS08NSt+hhSM+hJb2q85N78coLcEeFq+y9wbQlA2tgKZUbsMDN4ovPRsK75y+MrdBohrCES4/6aAGl5iO3RIK8YI2GrDCYFrT+LOthv7YsgtwYJt4NQ0bQkukFUutrBIljVHQQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765685332; c=relaxed/simple;
	bh=uwvqMntqzCVOaTVMzoJ+PqAWTiAb49sptWPt3bkbKNQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YO2kP87EjYIE/XP8zX5cCYZzgPzQ/pJyKtXAEzl3wO9OgG4I8AxbIiekbOHEW/iPOZB8IFtU4F4+k2k/hHy/zuGIriteGvMbbWesrXcbaWOOXjNdpOFXsoqOSGsdHbnmGLpbniy/MuL+qhQ3Xpvmo3u47frddwdInlFsWhifAV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CqeLo3UO; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CqeLo3UO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765685331; x=1797221331;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uwvqMntqzCVOaTVMzoJ+PqAWTiAb49sptWPt3bkbKNQ=;
  b=CqeLo3UOAD9V5tyYdPrgbjYX6yPDvtqET0+g89UhO4GPWmbu903MGFHi
   ct4v2+3DX/8MEhvG5HR5FefitVnW4EhDyCtvCXZksDQvb/m5rXeodxJZT
   dqmsXdeyRJJh0FLtQpxqLEzMtjX8iewt2H7g/FqTDDFx+s2EM52n+b9IV
   LE2iTAis5WTR8CYSYHoKsBzdpROtzGECiHojRKRRxpzkkefRFVv5BGPJa
   52H4daFlK2zld+/rg67IXPobuzCQ9RrLRV4HzIqJKzKS8Mj803ISMAyhA
   QO8e7WJLr46WZh1HCj2Q5H+gSNzXZlzXTt4/T9kTlYNnK+U7/rWqmkYD5
   w==;
X-CSE-ConnectionGUID: CHy9kxHbTaatBuNHVRJbow==
X-CSE-MsgGUID: heOKlINESaqA3QUDq3PEDg==
X-IronPort-AV: E=McAfee;i="6800,10657,11641"; a="79087701"
X-IronPort-AV: E=Sophos;i="6.21,147,1763452800"; 
   d="scan'208";a="79087701"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2025 20:08:49 -0800
X-CSE-ConnectionGUID: RSb605wDQfa2HYGH6u17lA==
X-CSE-MsgGUID: mXTg4McPQU6m7nNTeV0xCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,147,1763452800"; 
   d="scan'208";a="197054896"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 13 Dec 2025 20:08:47 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUdPZ-000000008YY-0FRV;
	Sun, 14 Dec 2025 04:08:45 +0000
Date: Sun, 14 Dec 2025 12:08:04 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Xie XiuQi <xiexiuqi@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1942/1942]
 drivers/mailbox/qcom-apcs-ipc-mailbox.c:65:28: warning: unused variable
 'apcs_clk_match_table'
Message-ID: <202512141257.ePsbbIqL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   5a399b91821faeec2466751db2d714b24f8eb17c
commit: c41cf355c959721c7269cc5ee7c6901cb47424a7 [1942/1942] mbox: qcom: add APCS child device for QCS404
config: x86_64-buildonly-randconfig-003-20251213 (https://download.01.org/0day-ci/archive/20251214/202512141257.ePsbbIqL-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 1335a05ab8bc8339ce24be3a9da89d8c3f4e0571)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251214/202512141257.ePsbbIqL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512141257.ePsbbIqL-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/mailbox/qcom-apcs-ipc-mailbox.c:65:28: warning: unused variable 'apcs_clk_match_table' [-Wunused-variable]
      65 |         const struct of_device_id apcs_clk_match_table[] = {
         |                                   ^~~~~~~~~~~~~~~~~~~~
   1 warning generated.


vim +/apcs_clk_match_table +65 drivers/mailbox/qcom-apcs-ipc-mailbox.c

    55	
    56	static int qcom_apcs_ipc_probe(struct platform_device *pdev)
    57	{
    58		struct qcom_apcs_ipc *apcs;
    59		struct regmap *regmap;
    60		struct resource *res;
    61		unsigned long offset;
    62		void __iomem *base;
    63		unsigned long i;
    64		int ret;
  > 65		const struct of_device_id apcs_clk_match_table[] = {
    66			{ .compatible = "qcom,msm8916-apcs-kpss-global", },
    67			{ .compatible = "qcom,qcs404-apcs-apps-global", },
    68			{}
    69		};
    70	
    71		apcs = devm_kzalloc(&pdev->dev, sizeof(*apcs), GFP_KERNEL);
    72		if (!apcs)
    73			return -ENOMEM;
    74	
    75		res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
    76		base = devm_ioremap_resource(&pdev->dev, res);
    77		if (IS_ERR(base))
    78			return PTR_ERR(base);
    79	
    80		regmap = devm_regmap_init_mmio(&pdev->dev, base, &apcs_regmap_config);
    81		if (IS_ERR(regmap))
    82			return PTR_ERR(regmap);
    83	
    84		offset = (unsigned long)of_device_get_match_data(&pdev->dev);
    85	
    86		apcs->regmap = regmap;
    87		apcs->offset = offset;
    88	
    89		/* Initialize channel identifiers */
    90		for (i = 0; i < ARRAY_SIZE(apcs->mbox_chans); i++)
    91			apcs->mbox_chans[i].con_priv = (void *)i;
    92	
    93		apcs->mbox.dev = &pdev->dev;
    94		apcs->mbox.ops = &qcom_apcs_ipc_ops;
    95		apcs->mbox.chans = apcs->mbox_chans;
    96		apcs->mbox.num_chans = ARRAY_SIZE(apcs->mbox_chans);
    97	
    98		ret = mbox_controller_register(&apcs->mbox);
    99		if (ret) {
   100			dev_err(&pdev->dev, "failed to register APCS IPC controller\n");
   101			return ret;
   102		}
   103	
   104		if (of_match_device(apcs_clk_match_table, &pdev->dev)) {
   105			apcs->clk = platform_device_register_data(&pdev->dev,
   106								  "qcom-apcs-msm8916-clk",
   107								  -1, NULL, 0);
   108			if (IS_ERR(apcs->clk))
   109				dev_err(&pdev->dev, "failed to register APCS clk\n");
   110		}
   111	
   112		platform_set_drvdata(pdev, apcs);
   113	
   114		return 0;
   115	}
   116	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
