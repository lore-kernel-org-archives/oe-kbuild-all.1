Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CFCA14281
	for <oe-kbuild-all@lists.linux.dev>; Fri, 13 Oct 2023 12:16:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K35kraWn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697199374; x=1728735374;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=M7apaaNMfWnAKpeLozAL4JbGge9QGPdyHMZUYHpl2s4=;
  b=K35kraWnMDXNHKoD7yG5tclZRkVaxqa2deTzkKlwoJsvxA+ecGm06n0C
   wYWsjLtEOMLgeWQTa4wkHK1qdxk4ZA0aBv+n54SMTeklBwwij9y398vO2
   GG+qASiENuVB5dFvXVBzvPHtXsu1u0ANBohBnDN2MhWBRlo2F11MinyVY
   WxPkQZNaC+PixiTFNApxfdjyaA9boWpeOqElemwQ5urQxVtMMsIXUJ3m+
   xTNpv7/l22euQca18AtP+CVq7aR5SgTn5v5dRd/C9VwNFLNAwC02i3PY+
   gLEw3LmNdj1xRBhGLmzkoRdEs3xLIgS1CAtucg6dagITYppnWt6pQridW
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="375517325"
X-IronPort-AV: E=Sophos;i="6.03,222,1694761200"; 
   d="scan'208";a="375517325"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2023 05:16:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="754688850"
X-IronPort-AV: E=Sophos;i="6.03,222,1694761200"; 
   d="scan'208";a="754688850"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 13 Oct 2023 05:16:12 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qrH5O-0004k5-0r;
	Fri, 13 Oct 2023 12:16:10 +0000
Date: Fri, 13 Oct 2023 20:15:40 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.1-2.1.x-imx 3028/15768]
 drivers/leds/leds-pca995x.c:280:34: warning: 'of_pca995x_match' defined but
 not used
Message-ID: <202310132053.TOlsmYIu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc 6.1-2.1.x-imx
head:   3f41fbe42851375d3d5996e4bf9e9809e6c79517
commit: c040dc570d616ad62326276e8ddfe2e494d14f2a [3028/15768] LF-6247-3: driver: leds: pca995x: Add support for PCA995X chips
config: x86_64-randconfig-003-20231013 (https://download.01.org/0day-ci/archive/20231013/202310132053.TOlsmYIu-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231013/202310132053.TOlsmYIu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310132053.TOlsmYIu-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/leds/leds-pca995x.c:280:34: warning: 'of_pca995x_match' defined but not used [-Wunused-const-variable=]
     280 | static const struct of_device_id of_pca995x_match[] = {
         |                                  ^~~~~~~~~~~~~~~~


vim +/of_pca995x_match +280 drivers/leds/leds-pca995x.c

   279	
 > 280	static const struct of_device_id of_pca995x_match[] = {
   281		{.compatible = "nxp,pca9955btw", .data = (void *) pca9955btw},
   282		{.compatible = "nxp,pca995xtw",  .data = (void *) pca995xtw},
   283		{},
   284	};
   285	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
