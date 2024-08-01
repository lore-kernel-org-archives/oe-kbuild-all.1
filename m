Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E240C1A4F35
	for <oe-kbuild-all@lists.linux.dev>; Thu,  1 Aug 2024 14:39:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722523177; cv=none; b=o5JhK/tjhEd3FXKEvzf5UZ9Gqkb3ZfaFqu7UfEnfssSl3Ppl8XPgtIht3fE+T7ANpwvR4dmLXhc07FZGGwMJdjU04jhTXva15Y23s/2porO2s2HhbwNwz43fTvcNUIn1I7dsSFGii5DNHSlTJgxDjP5tP4GYAD8zE5+qWlNBW9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722523177; c=relaxed/simple;
	bh=i6AEXntsmuQ6Nukyaa4Vs8122yNa3FQ/0FXsnFo3Duw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=I7cMNSDuaPO086ARZYb8FvhDkm/EzOv4FP0f6OxR3cZN4IMaMELcB3E2ka65j5kLPDBE119pcOr732/PeLHFOVxSBjf0Ic/m1eO9fq7FuXiCA4Nvz3JUYzKyxxU4H6tJngUw4aPhzcJCX/Hh3b+rkPWg7gxk8mlLfvuaoXrMA+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=i8f/j1t2; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="i8f/j1t2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722523175; x=1754059175;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=i6AEXntsmuQ6Nukyaa4Vs8122yNa3FQ/0FXsnFo3Duw=;
  b=i8f/j1t2I2e0mcME+QOPNNUckwYHPKEkK1cjo/d2ZFmmgqH7XXze8BvA
   J+MaixyxHrua3VlnYPDLfaESUrG1nrNoP2/HuvVQFb9RheSH5xx++hh9r
   mH/+Y6W2s5SJO86sR8EAcVOKx2vXMdHGm2DeRVWR0jEaYmQl+1sdZcukc
   vn+Gzt7Cm1/pqXG/RTK5xd3mwpvfyfTY6UiJ20NKpCQwEYi7LsCm+MVF7
   YAISjVCc3d7DSorwz9RnQUner2zYkEk/L8hHU9Mt7VRVugejlis996wv+
   84OJmUXIagDzJIxISbu/vAKzL3KFG2nqVJBRS+LLDcJZr+4M7nujC5DCo
   A==;
X-CSE-ConnectionGUID: cenrkVFyQd2JOcQ/pXBrBQ==
X-CSE-MsgGUID: ode8eg5AT1W0APRuHwLy0Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11151"; a="20164521"
X-IronPort-AV: E=Sophos;i="6.09,254,1716274800"; 
   d="scan'208";a="20164521"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Aug 2024 07:39:34 -0700
X-CSE-ConnectionGUID: LxgKaW6GR+OAg1Pwg1XUTA==
X-CSE-MsgGUID: 4Es7ObtxRXu56MxYIgSnXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,254,1716274800"; 
   d="scan'208";a="55840567"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 01 Aug 2024 07:39:33 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sZWxm-000vey-1b;
	Thu, 01 Aug 2024 14:39:30 +0000
Date: Thu, 1 Aug 2024 22:39:08 +0800
From: kernel test robot <lkp@intel.com>
To: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
Cc: oe-kbuild-all@lists.linux.dev, Bjorn Andersson <andersson@kernel.org>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: [qcom:clk-for-6.12 8/15] drivers/clk/qcom/camcc-sm8150.c:2141:36:
 error: passing argument 1 of 'qcom_cc_really_probe' from incompatible
 pointer type
Message-ID: <202408012234.vggzO9in-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux clk-for-6.12
head:   802b83205519e4253b873bef5c095b147cd69dad
commit: ea73b7aceff69c4426c5d13bbdd785c5dc1e2960 [8/15] clk: qcom: Add camera clock controller driver for SM8150
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20240801/202408012234.vggzO9in-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240801/202408012234.vggzO9in-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408012234.vggzO9in-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/clk/qcom/camcc-sm8150.c: In function 'cam_cc_sm8150_probe':
>> drivers/clk/qcom/camcc-sm8150.c:2141:36: error: passing argument 1 of 'qcom_cc_really_probe' from incompatible pointer type [-Wincompatible-pointer-types]
    2141 |         ret = qcom_cc_really_probe(pdev, &cam_cc_sm8150_desc, regmap);
         |                                    ^~~~
         |                                    |
         |                                    struct platform_device *
   In file included from drivers/clk/qcom/camcc-sm8150.c:21:
   drivers/clk/qcom/common.h:72:48: note: expected 'struct device *' but argument is of type 'struct platform_device *'
      72 | extern int qcom_cc_really_probe(struct device *dev,
         |                                 ~~~~~~~~~~~~~~~^~~


vim +/qcom_cc_really_probe +2141 drivers/clk/qcom/camcc-sm8150.c

  2112	
  2113	static int cam_cc_sm8150_probe(struct platform_device *pdev)
  2114	{
  2115		struct regmap *regmap;
  2116		int ret;
  2117	
  2118		ret = devm_pm_runtime_enable(&pdev->dev);
  2119		if (ret)
  2120			return ret;
  2121	
  2122		ret = pm_runtime_resume_and_get(&pdev->dev);
  2123		if (ret)
  2124			return ret;
  2125	
  2126		regmap = qcom_cc_map(pdev, &cam_cc_sm8150_desc);
  2127		if (IS_ERR(regmap)) {
  2128			pm_runtime_put(&pdev->dev);
  2129			return PTR_ERR(regmap);
  2130		}
  2131	
  2132		clk_trion_pll_configure(&cam_cc_pll0, regmap, &cam_cc_pll0_config);
  2133		clk_trion_pll_configure(&cam_cc_pll1, regmap, &cam_cc_pll1_config);
  2134		clk_regera_pll_configure(&cam_cc_pll2, regmap, &cam_cc_pll2_config);
  2135		clk_trion_pll_configure(&cam_cc_pll3, regmap, &cam_cc_pll3_config);
  2136		clk_trion_pll_configure(&cam_cc_pll4, regmap, &cam_cc_pll4_config);
  2137	
  2138		/* Keep the critical clock always-on */
  2139		qcom_branch_set_clk_en(regmap, 0xc1e4); /* cam_cc_gdsc_clk */
  2140	
> 2141		ret = qcom_cc_really_probe(pdev, &cam_cc_sm8150_desc, regmap);
  2142	
  2143		pm_runtime_put(&pdev->dev);
  2144	
  2145		return ret;
  2146	}
  2147	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
