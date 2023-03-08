Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AB118BF3
	for <oe-kbuild-all@lists.linux.dev>; Wed,  8 Mar 2023 19:27:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678303678; x=1709839678;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4F0gIyg3Y1t5fbu6ahwg0XpeLM4u+uJXOdKL9v1kE20=;
  b=KmAfkXVwTj9z4F5F3RjGKLJwr6lXf0uN31fdzbZzmH0iHOOFjo6bavS9
   dJDkB1BlwD//R2/DmiEydEstoIiyyi5WC9FX1IPXkpQV+dW5mIMMurY1d
   PBLOcUxr1xjPpPZ4bV5BregPao3e23OZ4yhRoAmrZnlDE/SQldHATWahl
   9PiZJC+Zgjvl74KlnU0iV+/94Z9JYOD69WpYRtMCisAzgW8YoKHeCryZc
   OhEcROiAjtAv9vf3FU1GdCuck2WZKysK6Vi2Gq4sE8HxufeULqch0Kpj9
   ABkWTJ0JVkUOEgHa79mqnFQA09pljHbTXHqDWFsOTBppDXNggr06cm8k/
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10643"; a="333723273"
X-IronPort-AV: E=Sophos;i="5.98,244,1673942400"; 
   d="scan'208";a="333723273"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2023 11:27:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10643"; a="654469468"
X-IronPort-AV: E=Sophos;i="5.98,244,1673942400"; 
   d="scan'208";a="654469468"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 08 Mar 2023 11:27:56 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pZzS8-0002MX-0M;
	Wed, 08 Mar 2023 19:27:56 +0000
Date: Thu, 9 Mar 2023 03:27:52 +0800
From: kernel test robot <lkp@intel.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [krzk-github:n/audio-wsa884x-on-top-of-wip-sm8450-hdmi-audio-on-qcomlt
 344/639] drivers/clk/qcom/clk-cbf-8996.c:403:16: error: too many arguments
 to function 'qcom_msm8996_cbf_icc_register'
Message-ID: <202303090311.FGrNUJXB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/krzk/linux n/audio-wsa884x-on-top-of-wip-sm8450-hdmi-audio-on-qcomlt
head:   bc291a97d070700f8a5b4504fe3de4c2cea6a888
commit: e7fac1ad7827402e38be0fba7c195b93afa32f55 [344/639] clk: qcom: cbf-msm8996: scale CBF clock according to the CPUfreq
config: arm64-randconfig-c004-20230308 (https://download.01.org/0day-ci/archive/20230309/202303090311.FGrNUJXB-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/krzk/linux/commit/e7fac1ad7827402e38be0fba7c195b93afa32f55
        git remote add krzk-github https://github.com/krzk/linux
        git fetch --no-tags krzk-github n/audio-wsa884x-on-top-of-wip-sm8450-hdmi-audio-on-qcomlt
        git checkout e7fac1ad7827402e38be0fba7c195b93afa32f55
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash drivers/clk/qcom/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303090311.FGrNUJXB-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/clk/qcom/clk-cbf-8996.c: In function 'qcom_msm8996_cbf_probe':
>> drivers/clk/qcom/clk-cbf-8996.c:403:16: error: too many arguments to function 'qcom_msm8996_cbf_icc_register'
     403 |         return qcom_msm8996_cbf_icc_register(pdev, &cbf_mux.clkr.hw);
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/qcom/clk-cbf-8996.c:344:12: note: declared here
     344 | static int qcom_msm8996_cbf_icc_register(struct platform_device *pdev)
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/qcom/clk-cbf-8996.c: At top level:
>> drivers/clk/qcom/clk-cbf-8996.c:423:31: error: 'icc_sync_state' undeclared here (not in a function)
     423 |                 .sync_state = icc_sync_state,
         |                               ^~~~~~~~~~~~~~


vim +/qcom_msm8996_cbf_icc_register +403 drivers/clk/qcom/clk-cbf-8996.c

   352	
   353	static int qcom_msm8996_cbf_probe(struct platform_device *pdev)
   354	{
   355		void __iomem *base;
   356		struct regmap *regmap;
   357		struct device *dev = &pdev->dev;
   358		int i, ret;
   359	
   360		base = devm_platform_ioremap_resource(pdev, 0);
   361		if (IS_ERR(base))
   362			return PTR_ERR(base);
   363	
   364		regmap = devm_regmap_init_mmio(dev, base, &cbf_msm8996_regmap_config);
   365		if (IS_ERR(regmap))
   366			return PTR_ERR(regmap);
   367	
   368		/* Select GPLL0 for 300MHz for the CBF clock */
   369		regmap_write(regmap, CBF_MUX_OFFSET, 0x3);
   370	
   371		/* Ensure write goes through before PLLs are reconfigured */
   372		udelay(5);
   373	
   374		clk_alpha_pll_configure(&cbf_pll, regmap, &cbfpll_config);
   375	
   376		/* Wait for PLL(s) to lock */
   377	        udelay(50);
   378	
   379		/* Switch CBF to use the primary PLL */
   380		regmap_update_bits(regmap, CBF_MUX_OFFSET,
   381				   CBF_MUX_PARENT_MASK, 0x1);
   382	
   383		for (i = 0; i < ARRAY_SIZE(cbf_msm8996_hw_clks); i++) {
   384			ret = devm_clk_hw_register(dev, cbf_msm8996_hw_clks[i]);
   385			if (ret)
   386				return ret;
   387		}
   388	
   389		for (i = 0; i < ARRAY_SIZE(cbf_msm8996_clks); i++) {
   390			ret = devm_clk_register_regmap(dev, cbf_msm8996_clks[i]);
   391			if (ret)
   392				return ret;
   393		}
   394	
   395		ret = devm_clk_notifier_register(dev, cbf_mux.clkr.hw.clk, &cbf_mux.nb);
   396		if (ret)
   397			return ret;
   398	
   399		ret = devm_of_clk_add_hw_provider(dev, of_clk_hw_simple_get, &cbf_mux.clkr.hw);
   400		if (ret)
   401			return ret;
   402	
 > 403		return qcom_msm8996_cbf_icc_register(pdev, &cbf_mux.clkr.hw);
   404	}
   405	
   406	static int qcom_msm8996_cbf_remove(struct platform_device *pdev)
   407	{
   408		return qcom_msm8996_cbf_icc_remove(pdev);
   409	}
   410	
   411	static const struct of_device_id qcom_msm8996_cbf_match_table[] = {
   412		{ .compatible = "qcom,msm8996-cbf" },
   413		{ /* sentinel */ },
   414	};
   415	MODULE_DEVICE_TABLE(of, qcom_msm8996_cbf_match_table);
   416	
   417	static struct platform_driver qcom_msm8996_cbf_driver = {
   418		.probe = qcom_msm8996_cbf_probe,
   419		.remove = qcom_msm8996_cbf_remove,
   420		.driver = {
   421			.name = "qcom-msm8996-cbf",
   422			.of_match_table = qcom_msm8996_cbf_match_table,
 > 423			.sync_state = icc_sync_state,
   424		},
   425	};
   426	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
