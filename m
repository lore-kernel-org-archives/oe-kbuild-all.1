Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16F9D2C15BF
	for <oe-kbuild-all@lists.linux.dev>; Tue, 12 Aug 2025 16:13:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755015232; cv=none; b=sr6g+X7A8Hvg90gk1qZ8WgyHXtE1kCQvVS3d3hsj3nk/uJ4LOrwGonFWsFk+M+HEmsAOBhfxMeV//C7/JSqTjIU97qdmHj0cXzmX4KTCleJuHqNgx6w6JnaBm9I813P6j5dX9+4ppvagNIkrtrqOY5S/N6pX2bvBYyZpSwDezwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755015232; c=relaxed/simple;
	bh=D0shSA8iqF4gEszl1Wa+a20jcl/18jsVkMWSvgIddEM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cAPQOO8EMBhoCiSMpOu5Apx8Iuv80YtUH4pBW7Uwv1WvrauQfZHQDC7lXO2SHpJ0UCwmhjkF4rQhRHMCJ40th5G7gz96+zonjFRFOnvyJBZVUg1BSk8BtNcXup/yKO1L0FvIIruDZSToX5hIzpWn2gLaB5Zh3GHVCjmDMT6CjVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TpdqkHSv; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TpdqkHSv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755015230; x=1786551230;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=D0shSA8iqF4gEszl1Wa+a20jcl/18jsVkMWSvgIddEM=;
  b=TpdqkHSvhmHWQcqMHus/ndDD2ClSoVHZifKRkwLC0LY9vzQ0LXYOc5GY
   RAaZsOzhe4bQ0iaSmdafJACaKiovbZOYBpu2CFPcbXPy4JXyipoNtilXZ
   vsSUZ9HReJ8Y/RlsXFg/f9I0j5GcoM5Ilsi0ODcSFaPoPe2Om7qa5WeQw
   t6HZes5OsAL0boeu2tTEvHnB86BWmeLJjoDCExn29nr8DEN4agQLf6Zzz
   mx47dxI1VEcrifzGOX7Y5FPwWxsiMsSp8e7XxFFqnutMYwTFejVTJpuus
   FxNbCbfe3K5hJji0QMNnZKP+9VrEoBVAk/8085EGzFI/H0yCm7ktOadxa
   w==;
X-CSE-ConnectionGUID: CkVUrzqEThKSDnc0fKLc3Q==
X-CSE-MsgGUID: K3cg/h7gR4mRFvbQICXzYA==
X-IronPort-AV: E=McAfee;i="6800,10657,11520"; a="44873520"
X-IronPort-AV: E=Sophos;i="6.17,284,1747724400"; 
   d="scan'208";a="44873520"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2025 09:13:49 -0700
X-CSE-ConnectionGUID: HN0suiI9RK2n7hjY7/0yVQ==
X-CSE-MsgGUID: 4uIGdexDTsihYhPDWK3P1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,284,1747724400"; 
   d="scan'208";a="170438239"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 12 Aug 2025 09:13:48 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ulrdC-0006yG-04;
	Tue, 12 Aug 2025 16:13:46 +0000
Date: Wed, 13 Aug 2025 00:12:59 +0800
From: kernel test robot <lkp@intel.com>
To: Wolfram Sang <wsa-dev@sang-engineering.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [wsa:wdt/no-register-err 6/6] drivers/watchdog/visconti_wdt.c:121:6:
 warning: unused variable 'ret'
Message-ID: <202508130035.9LtioUyg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git wdt/no-register-err
head:   c462756b3b70c001e5920601aa078ef3731fc291
commit: c462756b3b70c001e5920601aa078ef3731fc291 [6/6] watchdog: visconti: don't print superfluous errors
config: x86_64-buildonly-randconfig-001-20250812 (https://download.01.org/0day-ci/archive/20250813/202508130035.9LtioUyg-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250813/202508130035.9LtioUyg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508130035.9LtioUyg-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/watchdog/visconti_wdt.c:121:6: warning: unused variable 'ret' [-Wunused-variable]
     121 |         int ret;
         |             ^~~
   1 warning generated.


vim +/ret +121 drivers/watchdog/visconti_wdt.c

c5b8e4644607b0 Nobuhiro Iwamatsu  2020-10-05  114  
c5b8e4644607b0 Nobuhiro Iwamatsu  2020-10-05  115  static int visconti_wdt_probe(struct platform_device *pdev)
c5b8e4644607b0 Nobuhiro Iwamatsu  2020-10-05  116  {
c5b8e4644607b0 Nobuhiro Iwamatsu  2020-10-05  117  	struct watchdog_device *wdev;
c5b8e4644607b0 Nobuhiro Iwamatsu  2020-10-05  118  	struct visconti_wdt_priv *priv;
c5b8e4644607b0 Nobuhiro Iwamatsu  2020-10-05  119  	struct device *dev = &pdev->dev;
c5b8e4644607b0 Nobuhiro Iwamatsu  2020-10-05  120  	struct clk *clk;
c5b8e4644607b0 Nobuhiro Iwamatsu  2020-10-05 @121  	int ret;
c5b8e4644607b0 Nobuhiro Iwamatsu  2020-10-05  122  	unsigned long clk_freq;
c5b8e4644607b0 Nobuhiro Iwamatsu  2020-10-05  123  
c5b8e4644607b0 Nobuhiro Iwamatsu  2020-10-05  124  	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
c5b8e4644607b0 Nobuhiro Iwamatsu  2020-10-05  125  	if (!priv)
c5b8e4644607b0 Nobuhiro Iwamatsu  2020-10-05  126  		return -ENOMEM;
c5b8e4644607b0 Nobuhiro Iwamatsu  2020-10-05  127  
c5b8e4644607b0 Nobuhiro Iwamatsu  2020-10-05  128  	priv->base = devm_platform_ioremap_resource(pdev, 0);
c5b8e4644607b0 Nobuhiro Iwamatsu  2020-10-05  129  	if (IS_ERR(priv->base))
c5b8e4644607b0 Nobuhiro Iwamatsu  2020-10-05  130  		return PTR_ERR(priv->base);
c5b8e4644607b0 Nobuhiro Iwamatsu  2020-10-05  131  
8c5210dbdf7e92 Christophe JAILLET 2022-12-30  132  	clk = devm_clk_get_enabled(dev, NULL);
c5b8e4644607b0 Nobuhiro Iwamatsu  2020-10-05  133  	if (IS_ERR(clk))
c5b8e4644607b0 Nobuhiro Iwamatsu  2020-10-05  134  		return dev_err_probe(dev, PTR_ERR(clk), "Could not get clock\n");
c5b8e4644607b0 Nobuhiro Iwamatsu  2020-10-05  135  
c5b8e4644607b0 Nobuhiro Iwamatsu  2020-10-05  136  	clk_freq = clk_get_rate(clk);
c5b8e4644607b0 Nobuhiro Iwamatsu  2020-10-05  137  	if (!clk_freq)
c5b8e4644607b0 Nobuhiro Iwamatsu  2020-10-05  138  		return -EINVAL;
c5b8e4644607b0 Nobuhiro Iwamatsu  2020-10-05  139  
c5b8e4644607b0 Nobuhiro Iwamatsu  2020-10-05  140  	priv->div = clk_freq / VISCONTI_WDT_FREQ;
c5b8e4644607b0 Nobuhiro Iwamatsu  2020-10-05  141  
c5b8e4644607b0 Nobuhiro Iwamatsu  2020-10-05  142  	/* Initialize struct watchdog_device. */
c5b8e4644607b0 Nobuhiro Iwamatsu  2020-10-05  143  	wdev = &priv->wdev;
c5b8e4644607b0 Nobuhiro Iwamatsu  2020-10-05  144  	wdev->info = &visconti_wdt_info;
c5b8e4644607b0 Nobuhiro Iwamatsu  2020-10-05  145  	wdev->ops = &visconti_wdt_ops;
c5b8e4644607b0 Nobuhiro Iwamatsu  2020-10-05  146  	wdev->parent = dev;
c5b8e4644607b0 Nobuhiro Iwamatsu  2020-10-05  147  	wdev->min_timeout = 1;
c5b8e4644607b0 Nobuhiro Iwamatsu  2020-10-05  148  	wdev->max_timeout = 0xffffffff / VISCONTI_WDT_FREQ;
c5b8e4644607b0 Nobuhiro Iwamatsu  2020-10-05  149  	wdev->timeout = min(wdev->max_timeout, WDT_DEFAULT_TIMEOUT);
c5b8e4644607b0 Nobuhiro Iwamatsu  2020-10-05  150  
c5b8e4644607b0 Nobuhiro Iwamatsu  2020-10-05  151  	watchdog_set_drvdata(wdev, priv);
c5b8e4644607b0 Nobuhiro Iwamatsu  2020-10-05  152  	watchdog_set_nowayout(wdev, nowayout);
c5b8e4644607b0 Nobuhiro Iwamatsu  2020-10-05  153  	watchdog_stop_on_unregister(wdev);
c5b8e4644607b0 Nobuhiro Iwamatsu  2020-10-05  154  
c5b8e4644607b0 Nobuhiro Iwamatsu  2020-10-05  155  	/* This overrides the default timeout only if DT configuration was found */
c462756b3b70c0 Wolfram Sang       2025-08-12  156  	watchdog_init_timeout(wdev, 0, dev);
c5b8e4644607b0 Nobuhiro Iwamatsu  2020-10-05  157  
c5b8e4644607b0 Nobuhiro Iwamatsu  2020-10-05  158  	return devm_watchdog_register_device(dev, wdev);
c5b8e4644607b0 Nobuhiro Iwamatsu  2020-10-05  159  }
c5b8e4644607b0 Nobuhiro Iwamatsu  2020-10-05  160  

:::::: The code at line 121 was first introduced by commit
:::::: c5b8e4644607b0319fd86a36fb0caad54ee2021e watchdog: Add Toshiba Visconti watchdog driver

:::::: TO: Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
:::::: CC: Wim Van Sebroeck <wim@linux-watchdog.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
