Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 685EB10F2
	for <oe-kbuild-all@lists.linux.dev>; Sun, 17 Dec 2023 04:03:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cL4GrPYj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702785801; x=1734321801;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8wIdZ4llQXpLY5ONcZhKNameXtD1aG3v/SEIlCUD3wc=;
  b=cL4GrPYjSL6W+scVu9/WVlYPYSHYlSMB3bPCxcAOByKFpuZY6VN8xSS/
   cepTglZapXT9WpPJqxUFYmt12107dIXdCK6D1uTlmLEQLe7CMdzhgCSSn
   de8sVEtkwzx161juj4ecnI4nEK5pZma/dVojr/V6A2J9P6OyZmYfijCAE
   LxCDbQF9+PdqQj/hpW4tMAQ+nTjXKSV/caZ/pNhk02VH0AFRtRrY6J/HS
   pN1JsK2tjMF3mAwJj+FndUPh7mnhNw0Exj+tOVTcHveXuOxQaFLrrQMRQ
   //+VBYM6DmfVIm/ACDcwk2AYkXkN4U1Ee6kEWaCjh2yH9UncyJtb6aU5V
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10926"; a="375551367"
X-IronPort-AV: E=Sophos;i="6.04,282,1695711600"; 
   d="scan'208";a="375551367"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2023 20:03:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10926"; a="768443177"
X-IronPort-AV: E=Sophos;i="6.04,282,1695711600"; 
   d="scan'208";a="768443177"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 16 Dec 2023 20:03:18 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rEiN2-0002c4-0H;
	Sun, 17 Dec 2023 04:03:16 +0000
Date: Sun, 17 Dec 2023 12:02:31 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.1-2.1.x-imx 3028/16025]
 drivers/leds/leds-pca995x.c:280:34: warning: unused variable
 'of_pca995x_match'
Message-ID: <202312171114.fMfV6lrD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc 6.1-2.1.x-imx
head:   241e2f51bd87beb652196d1db92f0387c1209bfb
commit: c040dc570d616ad62326276e8ddfe2e494d14f2a [3028/16025] LF-6247-3: driver: leds: pca995x: Add support for PCA995X chips
config: i386-buildonly-randconfig-001-20231217 (https://download.01.org/0day-ci/archive/20231217/202312171114.fMfV6lrD-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231217/202312171114.fMfV6lrD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312171114.fMfV6lrD-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/leds/leds-pca995x.c:280:34: warning: unused variable 'of_pca995x_match' [-Wunused-const-variable]
   static const struct of_device_id of_pca995x_match[] = {
                                    ^
   1 warning generated.


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
