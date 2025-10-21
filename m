Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6742D27990B
	for <oe-kbuild-all@lists.linux.dev>; Tue, 21 Oct 2025 20:14:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761077684; cv=none; b=Xl8+7zFlU3ReUPeS5AhRmeCwKiBnbBxh5e0jv2X5btHa3YkoNqaaD+Qb9nbBEqGATVnNYb6XcCvGuCU5hOrBzypVr6ALdt74vxZEXLGBxhgie/V2I7G/SzVYQ6yxySlMVeIS3p+H42RpT/17gT3B/Ljdvzz9qK8C8HsK+s1jA68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761077684; c=relaxed/simple;
	bh=rqUO2KTPKrouh3SAcYLZzyFWIUWTGKsnaWIVJXf5bzU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=G9GuqDDAx7YGMlmfVnsefQvkH1SjxpFpPciRS8hcdKq4Bo/f/lowiTUDArQ2pK9QM8YECAfiA29MIv6Nk2Y9189fHCh69VGLG+4h9uZ1FmiVrSIeENhpjsJGLdewWuRpVUfP9Yrv/t+nqwHj1sIYppA5gIMfdNqit/ydFlEG8zs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AfkceJtY; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AfkceJtY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761077683; x=1792613683;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rqUO2KTPKrouh3SAcYLZzyFWIUWTGKsnaWIVJXf5bzU=;
  b=AfkceJtYyBebEYtzIfrNaS+2bHxa4KnwNtjC+IMYr9BtBcb+8gfByWQ8
   15iScAX7JDQbn+3mdA9RpaacGxLtmWhhgJ6fhjGajbb8rR577zNNk/MRV
   u9p89DMI3Or5IWioBtFbcRpAmQZIhjzteSKZwJ4QNDkb+KFeUU4Ub+mMs
   j6RtVqiA8xgBXJeRNmrplM3FPoX+KM+SFB+MsHOYZwJzz1Z39g40i4iQP
   TpCHhmOWuvieEvroCpN2LWrNWzkINoGdrTxXUxlZQfaR7Fq2q/fUrjCkP
   N7wxPV0IP70dOwRRUW6maTaCCjh3DRAZqVEHIYgWwRcZDqS03Cft1bSEx
   A==;
X-CSE-ConnectionGUID: hJtmthm0R7WcDxIhfv8QrA==
X-CSE-MsgGUID: xb6jJovrR+CmUUL8PXtPkg==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="74653015"
X-IronPort-AV: E=Sophos;i="6.19,245,1754982000"; 
   d="scan'208";a="74653015"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2025 13:14:42 -0700
X-CSE-ConnectionGUID: aEicjGRuRFey2B5sAOrvOA==
X-CSE-MsgGUID: 3gbMXkK0Svug5x4Vrlk6Mw==
X-ExtLoop1: 1
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 21 Oct 2025 13:14:41 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vBIkZ-000BZL-0W;
	Tue, 21 Oct 2025 20:14:32 +0000
Date: Wed, 22 Oct 2025 04:10:21 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-desktop 44/44]
 drivers/mfd/intel_soc_pmic_mrfld.c:94:undefined reference to
 `intel_scu_ipc_dev_iowrite8'
Message-ID: <202510220448.dbZK7wCQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android16-6.12-desktop
head:   f46f3581ac62d905b79a3eabe27557d6125f3630
commit: 80646a059eb38a5cd606e549940844bef477d3da [44/44] ANDROID: GKI: x86: Enable Intel SCU IPC as x86 hidden
config: i386-randconfig-141-20251022 (https://download.01.org/0day-ci/archive/20251022/202510220448.dbZK7wCQ-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251022/202510220448.dbZK7wCQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510220448.dbZK7wCQ-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: drivers/mfd/intel_soc_pmic_mrfld.o: in function `bcove_ipc_byte_reg_write':
>> drivers/mfd/intel_soc_pmic_mrfld.c:94:(.text+0xd): undefined reference to `intel_scu_ipc_dev_iowrite8'
   ld: drivers/mfd/intel_soc_pmic_mrfld.o: in function `bcove_ipc_byte_reg_read':
>> drivers/mfd/intel_soc_pmic_mrfld.c:80:(.text+0x3d): undefined reference to `intel_scu_ipc_dev_ioread8'
   ld: drivers/mfd/intel_soc_pmic_mrfld.o: in function `bcove_probe':
>> drivers/mfd/intel_soc_pmic_mrfld.c:116:(.text+0xa4): undefined reference to `devm_intel_scu_ipc_dev_get'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for INTEL_SCU
   Depends on [n]: X86_PLATFORM_DEVICES [=n]
   Selected by [y]:
   - GKI_HIDDEN_X86_CONFIGS [=y] && X86 [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_IEC958
   Depends on [n]: SOUND [=y] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_SOC_CONFIGS [=y]


vim +94 drivers/mfd/intel_soc_pmic_mrfld.c

b9a801dfa59163 Andy Shevchenko 2019-08-01   72  
b9a801dfa59163 Andy Shevchenko 2019-08-01   73  static int bcove_ipc_byte_reg_read(void *context, unsigned int reg,
b9a801dfa59163 Andy Shevchenko 2019-08-01   74  				    unsigned int *val)
b9a801dfa59163 Andy Shevchenko 2019-08-01   75  {
5036208367cb3a Mika Westerberg 2020-04-16   76  	struct intel_soc_pmic *pmic = context;
b9a801dfa59163 Andy Shevchenko 2019-08-01   77  	u8 ipc_out;
b9a801dfa59163 Andy Shevchenko 2019-08-01   78  	int ret;
b9a801dfa59163 Andy Shevchenko 2019-08-01   79  
5036208367cb3a Mika Westerberg 2020-04-16  @80  	ret = intel_scu_ipc_dev_ioread8(pmic->scu, reg, &ipc_out);
b9a801dfa59163 Andy Shevchenko 2019-08-01   81  	if (ret)
b9a801dfa59163 Andy Shevchenko 2019-08-01   82  		return ret;
b9a801dfa59163 Andy Shevchenko 2019-08-01   83  
b9a801dfa59163 Andy Shevchenko 2019-08-01   84  	*val = ipc_out;
b9a801dfa59163 Andy Shevchenko 2019-08-01   85  	return 0;
b9a801dfa59163 Andy Shevchenko 2019-08-01   86  }
b9a801dfa59163 Andy Shevchenko 2019-08-01   87  
b9a801dfa59163 Andy Shevchenko 2019-08-01   88  static int bcove_ipc_byte_reg_write(void *context, unsigned int reg,
b9a801dfa59163 Andy Shevchenko 2019-08-01   89  				     unsigned int val)
b9a801dfa59163 Andy Shevchenko 2019-08-01   90  {
5036208367cb3a Mika Westerberg 2020-04-16   91  	struct intel_soc_pmic *pmic = context;
b9a801dfa59163 Andy Shevchenko 2019-08-01   92  	u8 ipc_in = val;
b9a801dfa59163 Andy Shevchenko 2019-08-01   93  
4ee1d9dc8073ac Xu Wang         2020-07-27  @94  	return intel_scu_ipc_dev_iowrite8(pmic->scu, reg, ipc_in);
b9a801dfa59163 Andy Shevchenko 2019-08-01   95  }
b9a801dfa59163 Andy Shevchenko 2019-08-01   96  
b9a801dfa59163 Andy Shevchenko 2019-08-01   97  static const struct regmap_config bcove_regmap_config = {
b9a801dfa59163 Andy Shevchenko 2019-08-01   98  	.reg_bits = 16,
b9a801dfa59163 Andy Shevchenko 2019-08-01   99  	.val_bits = 8,
b9a801dfa59163 Andy Shevchenko 2019-08-01  100  	.max_register = 0xff,
b9a801dfa59163 Andy Shevchenko 2019-08-01  101  	.reg_write = bcove_ipc_byte_reg_write,
b9a801dfa59163 Andy Shevchenko 2019-08-01  102  	.reg_read = bcove_ipc_byte_reg_read,
b9a801dfa59163 Andy Shevchenko 2019-08-01  103  };
b9a801dfa59163 Andy Shevchenko 2019-08-01  104  
b9a801dfa59163 Andy Shevchenko 2019-08-01  105  static int bcove_probe(struct platform_device *pdev)
b9a801dfa59163 Andy Shevchenko 2019-08-01  106  {
b9a801dfa59163 Andy Shevchenko 2019-08-01  107  	struct device *dev = &pdev->dev;
b9a801dfa59163 Andy Shevchenko 2019-08-01  108  	struct intel_soc_pmic *pmic;
b9a801dfa59163 Andy Shevchenko 2019-08-01  109  	unsigned int i;
b9a801dfa59163 Andy Shevchenko 2019-08-01  110  	int ret;
b9a801dfa59163 Andy Shevchenko 2019-08-01  111  
b9a801dfa59163 Andy Shevchenko 2019-08-01  112  	pmic = devm_kzalloc(dev, sizeof(*pmic), GFP_KERNEL);
b9a801dfa59163 Andy Shevchenko 2019-08-01  113  	if (!pmic)
b9a801dfa59163 Andy Shevchenko 2019-08-01  114  		return -ENOMEM;
b9a801dfa59163 Andy Shevchenko 2019-08-01  115  
5036208367cb3a Mika Westerberg 2020-04-16 @116  	pmic->scu = devm_intel_scu_ipc_dev_get(dev);
5036208367cb3a Mika Westerberg 2020-04-16  117  	if (!pmic->scu)
5036208367cb3a Mika Westerberg 2020-04-16  118  		return -ENOMEM;
5036208367cb3a Mika Westerberg 2020-04-16  119  
b9a801dfa59163 Andy Shevchenko 2019-08-01  120  	platform_set_drvdata(pdev, pmic);
b9a801dfa59163 Andy Shevchenko 2019-08-01  121  	pmic->dev = &pdev->dev;
b9a801dfa59163 Andy Shevchenko 2019-08-01  122  
b9a801dfa59163 Andy Shevchenko 2019-08-01  123  	pmic->regmap = devm_regmap_init(dev, NULL, pmic, &bcove_regmap_config);
b9a801dfa59163 Andy Shevchenko 2019-08-01  124  	if (IS_ERR(pmic->regmap))
b9a801dfa59163 Andy Shevchenko 2019-08-01  125  		return PTR_ERR(pmic->regmap);
b9a801dfa59163 Andy Shevchenko 2019-08-01  126  
b9a801dfa59163 Andy Shevchenko 2019-08-01  127  	for (i = 0; i < ARRAY_SIZE(irq_level2_resources); i++) {
b9a801dfa59163 Andy Shevchenko 2019-08-01  128  		ret = platform_get_irq(pdev, i);
b9a801dfa59163 Andy Shevchenko 2019-08-01  129  		if (ret < 0)
b9a801dfa59163 Andy Shevchenko 2019-08-01  130  			return ret;
b9a801dfa59163 Andy Shevchenko 2019-08-01  131  
b9a801dfa59163 Andy Shevchenko 2019-08-01  132  		irq_level2_resources[i].start = ret;
b9a801dfa59163 Andy Shevchenko 2019-08-01  133  		irq_level2_resources[i].end = ret;
b9a801dfa59163 Andy Shevchenko 2019-08-01  134  	}
b9a801dfa59163 Andy Shevchenko 2019-08-01  135  
b9a801dfa59163 Andy Shevchenko 2019-08-01  136  	return devm_mfd_add_devices(dev, PLATFORM_DEVID_NONE,
b9a801dfa59163 Andy Shevchenko 2019-08-01  137  				    bcove_dev, ARRAY_SIZE(bcove_dev),
b9a801dfa59163 Andy Shevchenko 2019-08-01  138  				    NULL, 0, NULL);
b9a801dfa59163 Andy Shevchenko 2019-08-01  139  }
b9a801dfa59163 Andy Shevchenko 2019-08-01  140  

:::::: The code at line 94 was first introduced by commit
:::::: 4ee1d9dc8073acd40f04e5fe3771a5dff978d077 mfd: intel_soc_pmic_mrfld: Simplify the return expression of intel_scu_ipc_dev_iowrite8()

:::::: TO: Xu Wang <vulab@iscas.ac.cn>
:::::: CC: Lee Jones <lee.jones@linaro.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
