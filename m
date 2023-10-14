Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C120523B
	for <oe-kbuild-all@lists.linux.dev>; Sat, 14 Oct 2023 06:50:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Y3BxaifE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697266211; x=1728802211;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=0Uv50ZzTg/FSqRz9ZHpB2dKFUN1e47ehpPeM1GkFqIY=;
  b=Y3BxaifEfETxXOZb+MTdTTX1qUw+tFncb+ZAw670FANB6zBV+A85x9c2
   fukDGW0Nj00qrbcCx4NcLiVQkE5UBUav6yrjAHCo9gkDOqMEHTefXUxOU
   3zP41quRz+9Qaxuglh0PeOmVlG+ZN0Aqi8OpsVEo0jC8e19LCuv147PMW
   eMrehjUJRysu45FAPB1RKopfToMEck0UX52oKisTA/F1n8YA42vH7I+TR
   5aPPJgdww9UAj4h9I9F0MtS9YAOUA5upoMxf81ZdtHLvHDB4u0xJ7/zLn
   BGkWlnKEqASR+/IfBHzThAl0KY1w1u5y6i2dI756w9FYDEmwgf6JtnS6B
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="370378624"
X-IronPort-AV: E=Sophos;i="6.03,224,1694761200"; 
   d="scan'208";a="370378624"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2023 23:50:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="754967477"
X-IronPort-AV: E=Sophos;i="6.03,224,1694761200"; 
   d="scan'208";a="754967477"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 13 Oct 2023 23:50:07 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qrYTM-0005nQ-2k;
	Sat, 14 Oct 2023 06:50:04 +0000
Date: Sat, 14 Oct 2023 14:49:05 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:pr/643 4124/15767] drivers/crypto/caam/ctrl.c:450:
 warning: Function parameter or member 'perfmon' not described in
 'caam_get_era'
Message-ID: <202310141448.HzgIwosi-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://github.com/Freescale/linux-fslc pr/643
head:   1fef7a26b48f767bcda4f5147cea10e83903ecf6
commit: f80c2c0f4e002e3e0b562bbd8864b42e3dbe86bd [4124/15767] MLKU-114-1 crypto: caam - reduce page 0 regs access to minimum
config: arm-randconfig-004-20231014 (https://download.01.org/0day-ci/archive/20231014/202310141448.HzgIwosi-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231014/202310141448.HzgIwosi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310141448.HzgIwosi-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/crypto/caam/ctrl.c:450: warning: Function parameter or member 'perfmon' not described in 'caam_get_era'
>> drivers/crypto/caam/ctrl.c:450: warning: Excess function parameter 'ctrl' description in 'caam_get_era'


vim +450 drivers/crypto/caam/ctrl.c

654f2b937b3892 Fabio Estevam       2018-04-11  439  
82c2f9607b8a46 Alex Porosanu       2012-07-11  440  /**
82c2f9607b8a46 Alex Porosanu       2012-07-11  441   * caam_get_era() - Return the ERA of the SEC on SoC, based
654f2b937b3892 Fabio Estevam       2018-04-11  442   * on "sec-era" optional property in the DTS. This property is updated
654f2b937b3892 Fabio Estevam       2018-04-11  443   * by u-boot.
654f2b937b3892 Fabio Estevam       2018-04-11  444   * In case this property is not passed an attempt to retrieve the CAAM
654f2b937b3892 Fabio Estevam       2018-04-11  445   * era via register reads will be made.
319936bf8f83c0 Krzysztof Kozlowski 2020-09-10  446   *
319936bf8f83c0 Krzysztof Kozlowski 2020-09-10  447   * @ctrl:	controller region
319936bf8f83c0 Krzysztof Kozlowski 2020-09-10  448   */
f80c2c0f4e002e Horia Geantă        2019-09-24  449  static int caam_get_era(struct caam_perfmon __iomem *perfmon)
82c2f9607b8a46 Alex Porosanu       2012-07-11 @450  {
883619a931e9f5 Alex Porosanu       2014-02-06  451  	struct device_node *caam_node;
e27513eb61bae7 Alex Porosanu       2015-07-17  452  	int ret;
e27513eb61bae7 Alex Porosanu       2015-07-17  453  	u32 prop;
e27513eb61bae7 Alex Porosanu       2015-07-17  454  
e27513eb61bae7 Alex Porosanu       2015-07-17  455  	caam_node = of_find_compatible_node(NULL, NULL, "fsl,sec-v4.0");
e27513eb61bae7 Alex Porosanu       2015-07-17  456  	ret = of_property_read_u32(caam_node, "fsl,sec-era", &prop);
e27513eb61bae7 Alex Porosanu       2015-07-17  457  	of_node_put(caam_node);
82c2f9607b8a46 Alex Porosanu       2012-07-11  458  
654f2b937b3892 Fabio Estevam       2018-04-11  459  	if (!ret)
654f2b937b3892 Fabio Estevam       2018-04-11  460  		return prop;
654f2b937b3892 Fabio Estevam       2018-04-11  461  	else
f80c2c0f4e002e Horia Geantă        2019-09-24  462  		return caam_get_era_from_hw(perfmon);
82c2f9607b8a46 Alex Porosanu       2012-07-11  463  }
82c2f9607b8a46 Alex Porosanu       2012-07-11  464  

:::::: The code at line 450 was first introduced by commit
:::::: 82c2f9607b8a4667e9d89613478748f4e2b7288b crypto: caam - ERA retrieval and printing for SEC device

:::::: TO: Alex Porosanu <alexandru.porosanu@freescale.com>
:::::: CC: Herbert Xu <herbert@gondor.apana.org.au>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
