Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E78A4654C
	for <oe-kbuild-all@lists.linux.dev>; Thu,  7 Dec 2023 16:14:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cRkn675h"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701965677; x=1733501677;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=x3Ijyd0k6mUgVehCzmRatnt2xwAFmbrBk0pID4mjh2c=;
  b=cRkn675hyjIZJ5fLMdfpjAKkhaszD/GnDoZ2LvprSJs9eTalbo8G1+Ec
   9nKzRVKJoV7NWeKBTJMgjiu4ZWrRk0gb4newk25+32QHLAiAtxOtaHx5O
   9P/1hNMkfEpB0FCJzWC70EpcemssUcYve6w/gNImj6fM1VOnsWVK1w6AB
   chuhmqtpnz/tdPkdAGHh2QYmy0eYB0HJ6+U91gNiF9D19d0swioqwoIuZ
   R4t6DfXXCF1sbTlcKyHcX9yzS48R+Mn7z/aHJ1qQ6a7laDoHRa5eSqInn
   /lOZf/B0tylN5rKtwhtceReZtd3qrgdn+gUgaou5K7qcPofBm8slbHdcm
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="12964233"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; 
   d="scan'208";a="12964233"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Dec 2023 08:14:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="721516520"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; 
   d="scan'208";a="721516520"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 07 Dec 2023 08:14:34 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rBH1E-000CTY-1M;
	Thu, 07 Dec 2023 16:14:32 +0000
Date: Fri, 8 Dec 2023 00:13:51 +0800
From: kernel test robot <lkp@intel.com>
To: Rob Herring <robh@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [robh:for-next 6/7] drivers/auxdisplay/img-ascii-lcd.c:234:15:
 warning: assignment to 'const struct of_device_id *' from 'int' makes
 pointer from integer without a cast
Message-ID: <202312080045.mMlUpLBt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
head:   6c26cfb1561efbf12fe3cf700ddc2e956866af45
commit: f793fea7761d32ed64767311c82f39f0798fe6d6 [6/7] of: Stop circularly including of_device.h and of_platform.h
config: x86_64-randconfig-161-20231207 (https://download.01.org/0day-ci/archive/20231208/202312080045.mMlUpLBt-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231208/202312080045.mMlUpLBt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312080045.mMlUpLBt-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/auxdisplay/img-ascii-lcd.c: In function 'img_ascii_lcd_probe':
   drivers/auxdisplay/img-ascii-lcd.c:234:17: error: implicit declaration of function 'of_match_device'; did you mean 'of_match_node'? [-Werror=implicit-function-declaration]
     234 |         match = of_match_device(img_ascii_lcd_matches, dev);
         |                 ^~~~~~~~~~~~~~~
         |                 of_match_node
>> drivers/auxdisplay/img-ascii-lcd.c:234:15: warning: assignment to 'const struct of_device_id *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     234 |         match = of_match_device(img_ascii_lcd_matches, dev);
         |               ^
   cc1: some warnings being treated as errors


vim +234 drivers/auxdisplay/img-ascii-lcd.c

0cad855fbd083e Paul Burton        2016-08-26  216  
0cad855fbd083e Paul Burton        2016-08-26  217  /**
0cad855fbd083e Paul Burton        2016-08-26  218   * img_ascii_lcd_probe() - probe an LCD display device
0cad855fbd083e Paul Burton        2016-08-26  219   * @pdev: the LCD platform device
0cad855fbd083e Paul Burton        2016-08-26  220   *
0cad855fbd083e Paul Burton        2016-08-26  221   * Probe an LCD display device, ensuring that we have the required resources in
0cad855fbd083e Paul Burton        2016-08-26  222   * order to access the LCD & setting up private data as well as sysfs files.
0cad855fbd083e Paul Burton        2016-08-26  223   *
0cad855fbd083e Paul Burton        2016-08-26  224   * Return: 0 on success, else -ERRNO
0cad855fbd083e Paul Burton        2016-08-26  225   */
0cad855fbd083e Paul Burton        2016-08-26  226  static int img_ascii_lcd_probe(struct platform_device *pdev)
0cad855fbd083e Paul Burton        2016-08-26  227  {
0cad855fbd083e Paul Burton        2016-08-26  228  	const struct of_device_id *match;
0cad855fbd083e Paul Burton        2016-08-26  229  	const struct img_ascii_lcd_config *cfg;
7b88e5530f4d9d Geert Uytterhoeven 2021-10-19  230  	struct device *dev = &pdev->dev;
0cad855fbd083e Paul Burton        2016-08-26  231  	struct img_ascii_lcd_ctx *ctx;
0cad855fbd083e Paul Burton        2016-08-26  232  	int err;
0cad855fbd083e Paul Burton        2016-08-26  233  
7b88e5530f4d9d Geert Uytterhoeven 2021-10-19 @234  	match = of_match_device(img_ascii_lcd_matches, dev);
0cad855fbd083e Paul Burton        2016-08-26  235  	if (!match)
0cad855fbd083e Paul Burton        2016-08-26  236  		return -ENODEV;
0cad855fbd083e Paul Burton        2016-08-26  237  
0cad855fbd083e Paul Burton        2016-08-26  238  	cfg = match->data;
7b88e5530f4d9d Geert Uytterhoeven 2021-10-19  239  	ctx = devm_kzalloc(dev, sizeof(*ctx) + cfg->num_chars, GFP_KERNEL);
0cad855fbd083e Paul Burton        2016-08-26  240  	if (!ctx)
0cad855fbd083e Paul Burton        2016-08-26  241  		return -ENOMEM;
0cad855fbd083e Paul Burton        2016-08-26  242  
0cad855fbd083e Paul Burton        2016-08-26  243  	if (cfg->external_regmap) {
7b88e5530f4d9d Geert Uytterhoeven 2021-10-19  244  		ctx->regmap = syscon_node_to_regmap(dev->parent->of_node);
0cad855fbd083e Paul Burton        2016-08-26  245  		if (IS_ERR(ctx->regmap))
0cad855fbd083e Paul Burton        2016-08-26  246  			return PTR_ERR(ctx->regmap);
0cad855fbd083e Paul Burton        2016-08-26  247  
7b88e5530f4d9d Geert Uytterhoeven 2021-10-19  248  		if (of_property_read_u32(dev->of_node, "offset", &ctx->offset))
0cad855fbd083e Paul Burton        2016-08-26  249  			return -EINVAL;
0cad855fbd083e Paul Burton        2016-08-26  250  	} else {
e8897e4fe8f27d Yangtao Li         2019-12-29  251  		ctx->base = devm_platform_ioremap_resource(pdev, 0);
0cad855fbd083e Paul Burton        2016-08-26  252  		if (IS_ERR(ctx->base))
0cad855fbd083e Paul Burton        2016-08-26  253  			return PTR_ERR(ctx->base);
0cad855fbd083e Paul Burton        2016-08-26  254  	}
0cad855fbd083e Paul Burton        2016-08-26  255  
7e76aece6f036c Geert Uytterhoeven 2021-10-19  256  	err = linedisp_register(&ctx->linedisp, dev, cfg->num_chars, ctx->curr,
7e76aece6f036c Geert Uytterhoeven 2021-10-19  257  				cfg->update);
0cad855fbd083e Paul Burton        2016-08-26  258  	if (err)
7e76aece6f036c Geert Uytterhoeven 2021-10-19  259  		return err;
0cad855fbd083e Paul Burton        2016-08-26  260  
7e76aece6f036c Geert Uytterhoeven 2021-10-19  261  	/* for backwards compatibility */
7e76aece6f036c Geert Uytterhoeven 2021-10-19  262  	err = compat_only_sysfs_link_entry_to_kobj(&dev->kobj,
7e76aece6f036c Geert Uytterhoeven 2021-10-19  263  						   &ctx->linedisp.dev.kobj,
7e76aece6f036c Geert Uytterhoeven 2021-10-19  264  						   "message", NULL);
0cad855fbd083e Paul Burton        2016-08-26  265  	if (err)
7e76aece6f036c Geert Uytterhoeven 2021-10-19  266  		goto err_unregister;
0cad855fbd083e Paul Burton        2016-08-26  267  
7e76aece6f036c Geert Uytterhoeven 2021-10-19  268  	platform_set_drvdata(pdev, ctx);
0cad855fbd083e Paul Burton        2016-08-26  269  	return 0;
7e76aece6f036c Geert Uytterhoeven 2021-10-19  270  
7e76aece6f036c Geert Uytterhoeven 2021-10-19  271  err_unregister:
7e76aece6f036c Geert Uytterhoeven 2021-10-19  272  	linedisp_unregister(&ctx->linedisp);
0cad855fbd083e Paul Burton        2016-08-26  273  	return err;
0cad855fbd083e Paul Burton        2016-08-26  274  }
0cad855fbd083e Paul Burton        2016-08-26  275  

:::::: The code at line 234 was first introduced by commit
:::::: 7b88e5530f4d9d636b33d776b753a52169cc5b42 auxdisplay: img-ascii-lcd: Add helper variable dev

:::::: TO: Geert Uytterhoeven <geert@linux-m68k.org>
:::::: CC: Miguel Ojeda <ojeda@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
