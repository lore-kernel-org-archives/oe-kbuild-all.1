Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C080C15A8
	for <oe-kbuild-all@lists.linux.dev>; Fri, 22 Nov 2024 01:14:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732238067; cv=none; b=EZl81g5aybRT0FDuF80ze9CIovSo5T7KxrVJRVKoSTh3aF1+5OoP5oGAojGkJBwRkFQ0xDHCG1gAOxS1NY/FRi3TfU7xWV4rpc9vilf1LGMijWEfRS/A1+6BdHfY4MHWH2/ydTgUS3hs5e2NBPYSp1Z0ZHhznTMrbhN21YlQ6mk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732238067; c=relaxed/simple;
	bh=i1auueKFu2++cUE92GTzdbQ9okyEcFjUqnJl8iOxK48=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gcNKhv/LQzAqLVPkAXzy3hXKz9somRj3zrp/VgyA7EuldirwgC9BSkwCq29SkXhBQ3UJNHPhdUMd6TKziYy3HsQVpwK730pW7JfJx/FHO8ZiAzEO+PxHZt3XwhFMBaCDGcRS05USDsC+gZFMHQnhP9t4urY2pCdZchb17BU2mhE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OjjlX1LG; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OjjlX1LG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732238065; x=1763774065;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=i1auueKFu2++cUE92GTzdbQ9okyEcFjUqnJl8iOxK48=;
  b=OjjlX1LG3FBKC2gXYY0UdB3ei4RYMH/EBDt1VyVx5j+nurT952LEDfKQ
   p98uA3R6HGfNmTfFw5Ck/9z7Ynv2RCMJgarZgwjLkpzUm6IrfX6Is32JS
   TBXME2kxc8qU/4eShKId0YlfQBgYWsjtP2y0tgNjHj8RWuNYO5EKciA2C
   jyNMSbGhNA2IuEh08IHNK6pSt2Tp2umWc1giVWBsU+pWPsaLYicDuk9Nu
   Yiteu4qrk1Dqn2WfpHCCqQNQFQndEU7dEetjUKcqYIe8wNDiRts7Fw0/n
   TjISe+W8HpD91nI6Mvl6xm6Ej/eh/9HMbRFOmltL69IFQwa8IloGJymbn
   w==;
X-CSE-ConnectionGUID: xibVJVuuSpC/mjl8VRQEHg==
X-CSE-MsgGUID: Qh+fcVMvQ9W5cc+UAIvWfg==
X-IronPort-AV: E=McAfee;i="6700,10204,11263"; a="43022728"
X-IronPort-AV: E=Sophos;i="6.12,174,1728975600"; 
   d="scan'208";a="43022728"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2024 17:14:24 -0800
X-CSE-ConnectionGUID: KbpHY2gKQSuMOR3Mtz3wMQ==
X-CSE-MsgGUID: FYHHTIkATVejTy8VH6ZIyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,174,1728975600"; 
   d="scan'208";a="90065663"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 21 Nov 2024 17:14:22 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tEIFY-0003XT-26;
	Fri, 22 Nov 2024 01:14:20 +0000
Date: Fri, 22 Nov 2024 09:13:26 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Xie XiuQi <xiexiuqi@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1304/1304]
 drivers/mailbox/qcom-apcs-ipc-mailbox.c:65:35: warning:
 'apcs_clk_match_table' defined but not used
Message-ID: <202411220931.AgGtoYjF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   81e029d5dd0cae934243168eee37ef303ebcce38
commit: c41cf355c959721c7269cc5ee7c6901cb47424a7 [1304/1304] mbox: qcom: add APCS child device for QCS404
config: x86_64-buildonly-randconfig-001-20241122 (https://download.01.org/0day-ci/archive/20241122/202411220931.AgGtoYjF-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241122/202411220931.AgGtoYjF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411220931.AgGtoYjF-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/mailbox/qcom-apcs-ipc-mailbox.c: In function 'qcom_apcs_ipc_probe':
   drivers/mailbox/qcom-apcs-ipc-mailbox.c:65:35: warning: unused variable 'apcs_clk_match_table' [-Wunused-variable]
      65 |         const struct of_device_id apcs_clk_match_table[] = {
         |                                   ^~~~~~~~~~~~~~~~~~~~
   drivers/mailbox/qcom-apcs-ipc-mailbox.c: At top level:
>> drivers/mailbox/qcom-apcs-ipc-mailbox.c:65:35: warning: 'apcs_clk_match_table' defined but not used [-Wunused-const-variable=]


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
