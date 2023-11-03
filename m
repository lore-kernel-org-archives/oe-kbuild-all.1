Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32FE22421C
	for <oe-kbuild-all@lists.linux.dev>; Fri,  3 Nov 2023 22:26:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EOqO1WMS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699050380; x=1730586380;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=UFiIUIQtxSDpBAFGAQ0MN5i18hTqs/RaF+24duO/53E=;
  b=EOqO1WMScCFvbPq/B2ffxyqUvAAAEfvpEBdyt4Ks/UnjREbZZu19Hzmo
   o3UFKmzkezP7Icy9zbVkrLI10MV3vShYVENaPIGQgKwWCHVVrD2PbHChF
   d85r2RZLVNqvi+1ilOQP4aiogcqpvfn0PEht2n0ggTmUmuE25GQiqHVXu
   jT+L8HO4hVfevMe+K1yBPCKoCoV9wZsWc12r22jiNhwEGEl5SfHUp4b92
   qZ8EKwmkjSk0Y2/6TK+WsF85oFRUrn/IQUmLnC7b9FBinjCCiTKM6uvkM
   ry3f0C3DpfiqeWecuhbVHCARnpCnFp2csVbnL707k5A7q5uyOiyaH29wF
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="388859587"
X-IronPort-AV: E=Sophos;i="6.03,275,1694761200"; 
   d="scan'208";a="388859587"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2023 15:26:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="796749258"
X-IronPort-AV: E=Sophos;i="6.03,275,1694761200"; 
   d="scan'208";a="796749258"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 03 Nov 2023 15:26:14 -0700
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qz2cG-00030J-0F;
	Fri, 03 Nov 2023 22:26:12 +0000
Date: Sat, 4 Nov 2023 06:25:05 +0800
From: kernel test robot <lkp@intel.com>
To: Luo Jie <quic_luoj@quicinc.com>, andersson@kernel.org,
	agross@kernel.org, konrad.dybcio@linaro.org,
	mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	catalin.marinas@arm.com, will@kernel.org, p.zabel@pengutronix.de
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, quic_srichara@quicinc.com,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: Re: [PATCH v11 3/4] clk: qcom: common: commonize qcom_cc_really_probe
Message-ID: <202311040623.9oyUHQ6A-lkp@intel.com>
References: <20231103104846.30875-4-quic_luoj@quicinc.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231103104846.30875-4-quic_luoj@quicinc.com>

Hi Luo,

kernel test robot noticed the following build errors:

[auto build test ERROR on ff269e2cd5adce4ae14f883fc9c8803bc43ee1e9]

url:    https://github.com/intel-lab-lkp/linux/commits/Luo-Jie/clk-qcom-branch-Add-clk_branch2_prepare_ops/20231103-185251
base:   ff269e2cd5adce4ae14f883fc9c8803bc43ee1e9
patch link:    https://lore.kernel.org/r/20231103104846.30875-4-quic_luoj%40quicinc.com
patch subject: [PATCH v11 3/4] clk: qcom: common: commonize qcom_cc_really_probe
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20231104/202311040623.9oyUHQ6A-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231104/202311040623.9oyUHQ6A-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311040623.9oyUHQ6A-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/clk/qcom/camcc-sm8550.c: In function 'cam_cc_sm8550_probe':
>> drivers/clk/qcom/camcc-sm8550.c:3547:36: error: passing argument 1 of 'qcom_cc_really_probe' from incompatible pointer type [-Werror=incompatible-pointer-types]
    3547 |         ret = qcom_cc_really_probe(pdev, &cam_cc_sm8550_desc, regmap);
         |                                    ^~~~
         |                                    |
         |                                    struct platform_device *
   In file included from drivers/clk/qcom/camcc-sm8550.c:19:
   drivers/clk/qcom/common.h:61:48: note: expected 'struct device *' but argument is of type 'struct platform_device *'
      61 | extern int qcom_cc_really_probe(struct device *dev,
         |                                 ~~~~~~~~~~~~~~~^~~
   cc1: some warnings being treated as errors


vim +/qcom_cc_really_probe +3547 drivers/clk/qcom/camcc-sm8550.c

ccc4e6a061a21d Jagadeesh Kona 2023-07-07  3505  
ccc4e6a061a21d Jagadeesh Kona 2023-07-07  3506  static int cam_cc_sm8550_probe(struct platform_device *pdev)
ccc4e6a061a21d Jagadeesh Kona 2023-07-07  3507  {
ccc4e6a061a21d Jagadeesh Kona 2023-07-07  3508  	struct regmap *regmap;
ccc4e6a061a21d Jagadeesh Kona 2023-07-07  3509  	int ret;
ccc4e6a061a21d Jagadeesh Kona 2023-07-07  3510  
ccc4e6a061a21d Jagadeesh Kona 2023-07-07  3511  	ret = devm_pm_runtime_enable(&pdev->dev);
ccc4e6a061a21d Jagadeesh Kona 2023-07-07  3512  	if (ret)
ccc4e6a061a21d Jagadeesh Kona 2023-07-07  3513  		return ret;
ccc4e6a061a21d Jagadeesh Kona 2023-07-07  3514  
ccc4e6a061a21d Jagadeesh Kona 2023-07-07  3515  	ret = pm_runtime_resume_and_get(&pdev->dev);
ccc4e6a061a21d Jagadeesh Kona 2023-07-07  3516  	if (ret)
ccc4e6a061a21d Jagadeesh Kona 2023-07-07  3517  		return ret;
ccc4e6a061a21d Jagadeesh Kona 2023-07-07  3518  
ccc4e6a061a21d Jagadeesh Kona 2023-07-07  3519  	regmap = qcom_cc_map(pdev, &cam_cc_sm8550_desc);
ccc4e6a061a21d Jagadeesh Kona 2023-07-07  3520  	if (IS_ERR(regmap)) {
ccc4e6a061a21d Jagadeesh Kona 2023-07-07  3521  		pm_runtime_put(&pdev->dev);
ccc4e6a061a21d Jagadeesh Kona 2023-07-07  3522  		return PTR_ERR(regmap);
ccc4e6a061a21d Jagadeesh Kona 2023-07-07  3523  	}
ccc4e6a061a21d Jagadeesh Kona 2023-07-07  3524  
ccc4e6a061a21d Jagadeesh Kona 2023-07-07  3525  	clk_lucid_ole_pll_configure(&cam_cc_pll0, regmap, &cam_cc_pll0_config);
ccc4e6a061a21d Jagadeesh Kona 2023-07-07  3526  	clk_lucid_ole_pll_configure(&cam_cc_pll1, regmap, &cam_cc_pll1_config);
ccc4e6a061a21d Jagadeesh Kona 2023-07-07  3527  	clk_rivian_evo_pll_configure(&cam_cc_pll2, regmap, &cam_cc_pll2_config);
ccc4e6a061a21d Jagadeesh Kona 2023-07-07  3528  	clk_lucid_ole_pll_configure(&cam_cc_pll3, regmap, &cam_cc_pll3_config);
ccc4e6a061a21d Jagadeesh Kona 2023-07-07  3529  	clk_lucid_ole_pll_configure(&cam_cc_pll4, regmap, &cam_cc_pll4_config);
ccc4e6a061a21d Jagadeesh Kona 2023-07-07  3530  	clk_lucid_ole_pll_configure(&cam_cc_pll5, regmap, &cam_cc_pll5_config);
ccc4e6a061a21d Jagadeesh Kona 2023-07-07  3531  	clk_lucid_ole_pll_configure(&cam_cc_pll6, regmap, &cam_cc_pll6_config);
ccc4e6a061a21d Jagadeesh Kona 2023-07-07  3532  	clk_lucid_ole_pll_configure(&cam_cc_pll7, regmap, &cam_cc_pll7_config);
ccc4e6a061a21d Jagadeesh Kona 2023-07-07  3533  	clk_lucid_ole_pll_configure(&cam_cc_pll8, regmap, &cam_cc_pll8_config);
ccc4e6a061a21d Jagadeesh Kona 2023-07-07  3534  	clk_lucid_ole_pll_configure(&cam_cc_pll9, regmap, &cam_cc_pll9_config);
ccc4e6a061a21d Jagadeesh Kona 2023-07-07  3535  	clk_lucid_ole_pll_configure(&cam_cc_pll10, regmap, &cam_cc_pll10_config);
ccc4e6a061a21d Jagadeesh Kona 2023-07-07  3536  	clk_lucid_ole_pll_configure(&cam_cc_pll11, regmap, &cam_cc_pll11_config);
ccc4e6a061a21d Jagadeesh Kona 2023-07-07  3537  	clk_lucid_ole_pll_configure(&cam_cc_pll12, regmap, &cam_cc_pll12_config);
ccc4e6a061a21d Jagadeesh Kona 2023-07-07  3538  
ccc4e6a061a21d Jagadeesh Kona 2023-07-07  3539  	/*
ccc4e6a061a21d Jagadeesh Kona 2023-07-07  3540  	 * Keep clocks always enabled:
ccc4e6a061a21d Jagadeesh Kona 2023-07-07  3541  	 *	cam_cc_gdsc_clk
ccc4e6a061a21d Jagadeesh Kona 2023-07-07  3542  	 *	cam_cc_sleep_clk
ccc4e6a061a21d Jagadeesh Kona 2023-07-07  3543  	 */
ccc4e6a061a21d Jagadeesh Kona 2023-07-07  3544  	regmap_update_bits(regmap, 0x1419c, BIT(0), BIT(0));
ccc4e6a061a21d Jagadeesh Kona 2023-07-07  3545  	regmap_update_bits(regmap, 0x142cc, BIT(0), BIT(0));
ccc4e6a061a21d Jagadeesh Kona 2023-07-07  3546  
ccc4e6a061a21d Jagadeesh Kona 2023-07-07 @3547  	ret = qcom_cc_really_probe(pdev, &cam_cc_sm8550_desc, regmap);
ccc4e6a061a21d Jagadeesh Kona 2023-07-07  3548  
ccc4e6a061a21d Jagadeesh Kona 2023-07-07  3549  	pm_runtime_put(&pdev->dev);
ccc4e6a061a21d Jagadeesh Kona 2023-07-07  3550  
ccc4e6a061a21d Jagadeesh Kona 2023-07-07  3551  	return ret;
ccc4e6a061a21d Jagadeesh Kona 2023-07-07  3552  }
ccc4e6a061a21d Jagadeesh Kona 2023-07-07  3553  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
