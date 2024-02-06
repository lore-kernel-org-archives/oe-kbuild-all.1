Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B9C6134CC6
	for <oe-kbuild-all@lists.linux.dev>; Tue,  6 Feb 2024 16:17:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707236234; cv=none; b=o6LuK5at3DxMBksYOKusIn5uSiww+93uxro0dpooSU6zn87Ucd+nP2JoReJLNFGT65uUc5OehpfwqInfcrWWqKMn+d407+V6OgSYquwnbc04hoeuJXMKQnZ7OVwOuUS/siDrfTus0ndL0MF0hEFUz7X3RRySqq9zf3py5mEmXNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707236234; c=relaxed/simple;
	bh=46hY59ceP1sy1/T0mD68LIW7kZMVGte40/QnZ0gn3FI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DOOwsm5Eboey32rOU9uRdPj5Cqs7Ek0oZzOF4EB87oIK9Si6fN9rC5LWH/5Q413VNyeTHGw3y9EYMU8mQyAL9EUeDI9YJYtUMIzPrvXAZZ3hNYSL3a5f38h71+hCabMwP8yetYDx9ZV77K9q6nzZu8X+Vc0BdD7vFnRE3CP0Yu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DpAmn30V; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DpAmn30V"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707236233; x=1738772233;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=46hY59ceP1sy1/T0mD68LIW7kZMVGte40/QnZ0gn3FI=;
  b=DpAmn30VYGTqo1c774Qxp96WogwRiHZ/aUrkTD+LqzOyoxfjuAd+z3sX
   NIneWBiBufJJshT6qGQzZfU+pmehoyALgtJINg9fUH15F7ipsF7h+Esrw
   H/VjTZWtUMV2eRom6GjAl+uXb8/Sgvlyhd+p2LUPeAg32FVB7h59TztKL
   Cyndu2lvt/zAzaOZOhJhGmxCY9MoDHfC7e2BW4QkURvewRDXQFbVparGe
   Erm3ePIxFxQ9l1uQS4b5y98bxRcuqbQtMb46d1KXK37TwB4skvgBK+JcR
   i8HCeLZGw6+PtPBRFGml1ISw2Wn4OnYhm4ISTHj04/Ber7XDwOIPlgQOy
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10976"; a="930982"
X-IronPort-AV: E=Sophos;i="6.05,247,1701158400"; 
   d="scan'208";a="930982"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2024 08:17:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,247,1701158400"; 
   d="scan'208";a="1044820"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 06 Feb 2024 08:17:11 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rXO8C-0001Zm-21;
	Tue, 06 Feb 2024 16:17:08 +0000
Date: Wed, 7 Feb 2024 00:16:12 +0800
From: kernel test robot <lkp@intel.com>
To: Wolfram Sang <wsa-dev@sang-engineering.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [wsa:renesas/sdhi/tmio-simplification 3/5]
 drivers/mmc/host/tmio_mmc_core.c:1087:13: error: implicit declaration of
 function 'of_property_read_bool'
Message-ID: <202402070030.8cTK2Yee-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git renesas/sdhi/tmio-simplification
head:   cccb4dda1ee496a1baabb6283db1e5f52808b706
commit: a01061a0afbd18bce634e772e050c78ce6bd8fdc [3/5] mfd: tmio: update include files
config: i386-buildonly-randconfig-006-20240206 (https://download.01.org/0day-ci/archive/20240207/202402070030.8cTK2Yee-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240207/202402070030.8cTK2Yee-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402070030.8cTK2Yee-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/mmc/host/tmio_mmc_core.c: In function 'tmio_mmc_of_parse':
>> drivers/mmc/host/tmio_mmc_core.c:1087:13: error: implicit declaration of function 'of_property_read_bool' [-Werror=implicit-function-declaration]
    1087 |         if (of_property_read_bool(np, "toshiba,mmc-wrprotect-disable"))
         |             ^~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/of_property_read_bool +1087 drivers/mmc/host/tmio_mmc_core.c

b958a67c6bbe0a drivers/mmc/host/tmio_mmc_pio.c  Guennadi Liakhovetski 2012-06-20  1073  
5a00a971a2b12e drivers/mmc/host/tmio_mmc_pio.c  Guennadi Liakhovetski 2013-02-15  1074  static void tmio_mmc_of_parse(struct platform_device *pdev,
7c53b79766a463 drivers/mmc/host/tmio_mmc_core.c Masahiro Yamada       2018-01-18  1075  			      struct mmc_host *mmc)
5a00a971a2b12e drivers/mmc/host/tmio_mmc_pio.c  Guennadi Liakhovetski 2013-02-15  1076  {
5a00a971a2b12e drivers/mmc/host/tmio_mmc_pio.c  Guennadi Liakhovetski 2013-02-15  1077  	const struct device_node *np = pdev->dev.of_node;
f2218db8154854 drivers/mmc/host/tmio_mmc_core.c Simon Horman          2017-06-16  1078  
5a00a971a2b12e drivers/mmc/host/tmio_mmc_pio.c  Guennadi Liakhovetski 2013-02-15  1079  	if (!np)
5a00a971a2b12e drivers/mmc/host/tmio_mmc_pio.c  Guennadi Liakhovetski 2013-02-15  1080  		return;
5a00a971a2b12e drivers/mmc/host/tmio_mmc_pio.c  Guennadi Liakhovetski 2013-02-15  1081  
788778b0d21a6d drivers/mmc/host/tmio_mmc_core.c Masahiro Yamada       2018-01-18  1082  	/*
788778b0d21a6d drivers/mmc/host/tmio_mmc_core.c Masahiro Yamada       2018-01-18  1083  	 * DEPRECATED:
788778b0d21a6d drivers/mmc/host/tmio_mmc_core.c Masahiro Yamada       2018-01-18  1084  	 * For new platforms, please use "disable-wp" instead of
788778b0d21a6d drivers/mmc/host/tmio_mmc_core.c Masahiro Yamada       2018-01-18  1085  	 * "toshiba,mmc-wrprotect-disable"
788778b0d21a6d drivers/mmc/host/tmio_mmc_core.c Masahiro Yamada       2018-01-18  1086  	 */
ca6b5fe277e91e drivers/mmc/host/tmio_mmc_core.c Rob Herring           2023-03-10 @1087  	if (of_property_read_bool(np, "toshiba,mmc-wrprotect-disable"))
7c53b79766a463 drivers/mmc/host/tmio_mmc_core.c Masahiro Yamada       2018-01-18  1088  		mmc->caps2 |= MMC_CAP2_NO_WRITE_PROTECT;
5a00a971a2b12e drivers/mmc/host/tmio_mmc_pio.c  Guennadi Liakhovetski 2013-02-15  1089  }
5a00a971a2b12e drivers/mmc/host/tmio_mmc_pio.c  Guennadi Liakhovetski 2013-02-15  1090  

:::::: The code at line 1087 was first introduced by commit
:::::: ca6b5fe277e91ebca5101dc00c0e26755f0ed6c4 mmc: Use of_property_read_bool() for boolean properties

:::::: TO: Rob Herring <robh@kernel.org>
:::::: CC: Ulf Hansson <ulf.hansson@linaro.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
