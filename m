Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9347A3B19DB
	for <oe-kbuild-all@lists.linux.dev>; Thu, 26 Mar 2026 08:23:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774513391; cv=none; b=CNjtNZugR7k8ixXsvboEUomiodkAEJqrvnuCRw0DFI8fo27D3O+VQ+2rStBQyeMFqHPLx8t7De6za3LYl90US9D8gk3mr7dn+IdASwDeTOvN2mqYvdompNzu2HcBxk34w5F/xVnu5GZnKuQwcqk0BvJ3G2I4iXqEhkbOaFG4zos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774513391; c=relaxed/simple;
	bh=WMs72QMm3g5k6y27dUjoPleodN6/IjYoAJPPTrZ3BDc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=EjRuQ7+e7Obh+nzBd7kDvd2aM6iRuKdOxIuTdaNV98IQVnyKU6piE56CJFLI2Ocwa8eSVmEN9N1FSezZBwxfx3mEdoNd+ypbBu3eM1JhugBiU5CtM4UHqQp/M71RCqIpUdMwtvPDBNgvtDbDLZettniUgb49jZhGMum3GkhmmWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Pqj2OU8Q; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Pqj2OU8Q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774513391; x=1806049391;
  h=date:from:to:cc:subject:message-id;
  bh=WMs72QMm3g5k6y27dUjoPleodN6/IjYoAJPPTrZ3BDc=;
  b=Pqj2OU8QRmpsfaMltzecX9A3uPWuxYG4lcecO9B1aMGcQ867WaPXFLnZ
   4vfClxnusY/roY+6sgE0yNQbIiaFmGjtyH/9UcGmDvc1yvtxDZeRibDab
   e8q8PCVMPvGSSJPmLom9peFoAT3mkHHILxQNMGujXUGwTd+DeY/YD3siH
   btzQCLSOeJ2wXNLkQ1zfWlo3TsnjJ6MhPf7Hm4tOabhpPZKhHw2GvD9Xp
   /r8zr/yVOFaRSx68Pr5FEi3sfAW9ELMh76cIc3V3qMcFwB2D+reV6XBuY
   sb0B2F//gVEt/hzVhjImI3V9AN22m0do/+5ddxbmdu9G+GwB7BoP6ceI4
   g==;
X-CSE-ConnectionGUID: PrpD0XAUTl6a8jJiVq/JrA==
X-CSE-MsgGUID: jsYCqNxvRpeXulWsSmq6iQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11740"; a="87040574"
X-IronPort-AV: E=Sophos;i="6.23,141,1770624000"; 
   d="scan'208";a="87040574"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2026 01:23:10 -0700
X-CSE-ConnectionGUID: ZIOUoQfVRv6CYYs9iWFXsg==
X-CSE-MsgGUID: s64I1IIYRfCCdQ4oVo6ZKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,141,1770624000"; 
   d="scan'208";a="222031425"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 26 Mar 2026 01:23:08 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w5fze-000000008fN-26Gj;
	Thu, 26 Mar 2026 08:23:06 +0000
Date: Thu, 26 Mar 2026 16:22:50 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6-2026-01 1/1]
 drivers/pmdomain/imx/gpc.c:228:11: warning: initializer-string for array of
 'char' truncates NUL terminator but destination lacks 'nonstring' attribute
 (21 chars into 20 available)
Message-ID: <202603261603.jGjwP25P-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Ulf,

First bad commit (maybe != root cause):

tree:   https://android.googlesource.com/kernel/common android15-6.6-2026-01
head:   b606433ab56b6c4c3f16018b9e83340cf155184b
commit: e2ad626f8f409899baf1bf192d0533a851128b19 [1/1] pmdomain: Rename the genpd subsystem to pmdomain
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20260326/202603261603.jGjwP25P-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260326/202603261603.jGjwP25P-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603261603.jGjwP25P-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/pmdomain/imx/gpc.c:228:11: warning: initializer-string for array of 'char' truncates NUL terminator but destination lacks 'nonstring' attribute (21 chars into 20 available) [-Wunterminated-string-initialization]
     228 |         { "imx-pgc-power-domain"},
         |           ^~~~~~~~~~~~~~~~~~~~~~


vim +228 drivers/pmdomain/imx/gpc.c

721cabf6c6600db drivers/soc/imx/gpc.c Lucas Stach 2017-02-17  226  
721cabf6c6600db drivers/soc/imx/gpc.c Lucas Stach 2017-02-17  227  static const struct platform_device_id imx_pgc_power_domain_id[] = {
721cabf6c6600db drivers/soc/imx/gpc.c Lucas Stach 2017-02-17 @228  	{ "imx-pgc-power-domain"},
721cabf6c6600db drivers/soc/imx/gpc.c Lucas Stach 2017-02-17  229  	{ },
721cabf6c6600db drivers/soc/imx/gpc.c Lucas Stach 2017-02-17  230  };
721cabf6c6600db drivers/soc/imx/gpc.c Lucas Stach 2017-02-17  231  

:::::: The code at line 228 was first introduced by commit
:::::: 721cabf6c6600dbe689ee2782bc087270e97e652 soc: imx: move PGC handling to a new GPC driver

:::::: TO: Lucas Stach <l.stach@pengutronix.de>
:::::: CC: Shawn Guo <shawnguo@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
