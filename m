Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5464A24B29
	for <oe-kbuild-all@lists.linux.dev>; Sun,  7 Jul 2024 14:38:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720363116; cv=none; b=Bn0pO1aG+s6YpDelmHDL8eCYUmd86SeTXzbVPkP3ONeLr8y71pawTzEpIjQayCHeCngt9+QvLzuPVQMl0yiTVYd7G0nnRaqpPw1vPwCczQUcdPo0ESTawV+eFa12tB43pub9maAeUc84HM2vldv8V9O8MpnfAs+HXMVCsGrBsJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720363116; c=relaxed/simple;
	bh=NN2UlufQ5O7Q8XOk3+81dv76rSVEh8fhH02IUyAO1fw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pVRWU0FZRQvGoDO2KBJYn6CWjypK4jJuoOe0exWi+MfhSXwxdQ71ly039tRyj02SeWGJcaEGU6trAbU3iB1DSu8FwpRjLhq3VPWgsewEwt3xfeTAjCaP47H49MVXlpL5nlyd8NR++f5tCHJOUABwAFxNbGqm7Sv+etWeePiKkIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lG56SHvW; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lG56SHvW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720363114; x=1751899114;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NN2UlufQ5O7Q8XOk3+81dv76rSVEh8fhH02IUyAO1fw=;
  b=lG56SHvWGCPL22hc1AReBumxZWRuo+tJ587TSobDHR8kO1AL66oBHRbm
   xh5YWdMnWIj2jAPGwkU6u/y/abue/3JWurIHBEEZO+4xXZ1EEBD+VyohM
   Of4IZiXiCwD+qQhwrePWNmJnvpqOFmoi9p9vjpoD8YS33kOpJ+HpQWy1R
   ONTUrKEQyZvSTm3jH/42oraYQUGAexCp8V6MNbpZY1MINTFxaxf+Qsq7e
   8RCNdvnlG+DhaGpnR3xfmC7kiBOM/mwWNZ6REDF/2J1eE9BO4+x5BZJKS
   U5yRyiqvKhwNquOKVloUFIDoYYbhM/M0NfCLlyEjNttUuWHQ6nR79BM2z
   w==;
X-CSE-ConnectionGUID: 1sUSb8gMTb6E413meXicxA==
X-CSE-MsgGUID: 0ocyaJXIRAKV14X6mwww3Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11126"; a="17404021"
X-IronPort-AV: E=Sophos;i="6.09,190,1716274800"; 
   d="scan'208";a="17404021"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2024 07:38:31 -0700
X-CSE-ConnectionGUID: DSsVdlvLRqGBkRxt2m8z/Q==
X-CSE-MsgGUID: dZ84UGD/Q3S+9Ww9cXTJLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,190,1716274800"; 
   d="scan'208";a="47698159"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 07 Jul 2024 07:38:30 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sQT23-000V18-0m;
	Sun, 07 Jul 2024 14:38:27 +0000
Date: Sun, 7 Jul 2024 22:37:28 +0800
From: kernel test robot <lkp@intel.com>
To: Jagadeesh Kona <quic_jkona@quicinc.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Subject: [linux-next:master 7766/10451]
 drivers/clk/qcom/camcc-sm8650.c:3573:36: error: passing argument 1 of
 'qcom_cc_really_probe' from incompatible pointer type
Message-ID: <202407072212.WptVaUDt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   0b58e108042b0ed28a71cd7edf5175999955b233
commit: 09ea421652a832083ea380a72addf383965f3682 [7766/10451] clk: qcom: camcc-sm8650: Add SM8650 camera clock controller driver
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20240707/202407072212.WptVaUDt-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240707/202407072212.WptVaUDt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407072212.WptVaUDt-lkp@intel.com/

Note: the linux-next/master HEAD 0b58e108042b0ed28a71cd7edf5175999955b233 builds fine.
      It may have been fixed somewhere.

All errors (new ones prefixed by >>):

   drivers/clk/qcom/camcc-sm8650.c: In function 'cam_cc_sm8650_probe':
>> drivers/clk/qcom/camcc-sm8650.c:3573:36: error: passing argument 1 of 'qcom_cc_really_probe' from incompatible pointer type [-Werror=incompatible-pointer-types]
    3573 |         ret = qcom_cc_really_probe(&pdev->dev, &cam_cc_sm8650_desc, regmap);
         |                                    ^~~~~~~~~~
         |                                    |
         |                                    struct device *
   In file included from drivers/clk/qcom/camcc-sm8650.c:19:
   drivers/clk/qcom/common.h:63:57: note: expected 'struct platform_device *' but argument is of type 'struct device *'
      63 | extern int qcom_cc_really_probe(struct platform_device *pdev,
         |                                 ~~~~~~~~~~~~~~~~~~~~~~~~^~~~
   cc1: some warnings being treated as errors


vim +/qcom_cc_really_probe +3573 drivers/clk/qcom/camcc-sm8650.c

  3535	
  3536	static int cam_cc_sm8650_probe(struct platform_device *pdev)
  3537	{
  3538		struct regmap *regmap;
  3539		int ret;
  3540	
  3541		ret = devm_pm_runtime_enable(&pdev->dev);
  3542		if (ret)
  3543			return ret;
  3544	
  3545		ret = pm_runtime_resume_and_get(&pdev->dev);
  3546		if (ret)
  3547			return ret;
  3548	
  3549		regmap = qcom_cc_map(pdev, &cam_cc_sm8650_desc);
  3550		if (IS_ERR(regmap)) {
  3551			pm_runtime_put(&pdev->dev);
  3552			return PTR_ERR(regmap);
  3553		}
  3554	
  3555		clk_lucid_ole_pll_configure(&cam_cc_pll0, regmap, &cam_cc_pll0_config);
  3556		clk_lucid_ole_pll_configure(&cam_cc_pll1, regmap, &cam_cc_pll1_config);
  3557		clk_rivian_evo_pll_configure(&cam_cc_pll2, regmap, &cam_cc_pll2_config);
  3558		clk_lucid_ole_pll_configure(&cam_cc_pll3, regmap, &cam_cc_pll3_config);
  3559		clk_lucid_ole_pll_configure(&cam_cc_pll4, regmap, &cam_cc_pll4_config);
  3560		clk_lucid_ole_pll_configure(&cam_cc_pll5, regmap, &cam_cc_pll5_config);
  3561		clk_lucid_ole_pll_configure(&cam_cc_pll6, regmap, &cam_cc_pll6_config);
  3562		clk_lucid_ole_pll_configure(&cam_cc_pll7, regmap, &cam_cc_pll7_config);
  3563		clk_lucid_ole_pll_configure(&cam_cc_pll8, regmap, &cam_cc_pll8_config);
  3564		clk_lucid_ole_pll_configure(&cam_cc_pll9, regmap, &cam_cc_pll9_config);
  3565		clk_lucid_ole_pll_configure(&cam_cc_pll10, regmap, &cam_cc_pll10_config);
  3566	
  3567		/* Keep clocks always enabled */
  3568		qcom_branch_set_clk_en(regmap, 0x13318); /* CAM_CC_DRV_AHB_CLK */
  3569		qcom_branch_set_clk_en(regmap, 0x13314); /* CAM_CC_DRV_XO_CLK */
  3570		qcom_branch_set_clk_en(regmap, 0x132ec); /* CAM_CC_GDSC_CLK */
  3571		qcom_branch_set_clk_en(regmap, 0x13308); /* CAM_CC_SLEEP_CLK */
  3572	
> 3573		ret = qcom_cc_really_probe(&pdev->dev, &cam_cc_sm8650_desc, regmap);
  3574	
  3575		pm_runtime_put(&pdev->dev);
  3576	
  3577		return ret;
  3578	}
  3579	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
