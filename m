Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC3A54A68B7
	for <oe-kbuild-all@lists.linux.dev>; Thu, 10 Sep 2026 15:43:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789055017; cv=none; b=NwDH29jszWstN092/ITBmFIWpDtJfaIF3RtJgpGFKdM/JqD85zyMVoyUC5yEe/MhYwu1xzLscyeUyWkCfxFznxEuoFzh2G5wSCiNtavuNOnBsqcS/LkvOkJd+ktvf6Hnqaf2SrciW+27GkpA9OPA7J+PLk6z+UPS4rHYppbd4HI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789055017; c=relaxed/simple;
	bh=kl710Ogpmd2+II85avk0ufWudsJiE1q8vjfpO/pbOOs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=uxs3R4TNz/4bybYRaCKdNpXwHZKSqOZMADbq38x2sgIt1M+eksKdKdRLxhwDCWgYSKAzE9gWh3ytcuMnBiJts6S0IzzhkJBqanteApEWBF8u3Gqak5ROB5eNF0/dn2zhx1417tONFq9B1dnrPL0NyXNsIQyl9Yatho6pgpymKiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ArDYqitM; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ArDYqitM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789055015; x=1820591015;
  h=date:from:to:cc:subject:message-id;
  bh=kl710Ogpmd2+II85avk0ufWudsJiE1q8vjfpO/pbOOs=;
  b=ArDYqitMJTi2gWrR7QFD4axIgbexErS+dizjsEw+Fe5/J+S8V5Qwr2wy
   sHxasQjiFDnU168EoJdcyCKmjvW2IDPsv19LT8sPrMaoEt3GwWw4OJfLh
   d3RTfSqFelm8Th2MO/4tRzACOixuQ4rIacjJwtpa0PfehSygfzXb6zNCs
   W9488noSuIvY/hbHBeTb2oJExchzJgtStp0E0KN1j/hBfLLYRaVlYqlNY
   6JYV9qEo5xqr7LHRBM0Ad0+txROb/raar7CnEtZtbpUwyfu2TR+8sK9rs
   cBcmzSaYaWFYJpn989vKu8P+IYl+OmoRFOOn8CRFQt3uLT5NDRZ5TD/JD
   w==;
X-CSE-ConnectionGUID: fF2La8nHQEir9S46VabRxw==
X-CSE-MsgGUID: vVAnFjQoRJS69gJYAbGp3Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11901"; a="93200680"
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; 
   d="scan'208";a="93200680"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2026 08:43:34 -0700
X-CSE-ConnectionGUID: 73AamxUcTFy3XN6APV26IQ==
X-CSE-MsgGUID: SFh3gaiUQn+2GCfL8nAJPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; 
   d="scan'208";a="301572123"
Received: from igk-lkp-server01.igk.intel.com (HELO 2232cf45ba3c) ([10.211.93.152])
  by orviesa002.jf.intel.com with ESMTP; 10 Sep 2026 08:43:32 -0700
Received: from kbuild by 2232cf45ba3c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x4gvy-000000000Rc-0PWd;
	Thu, 10 Sep 2026 15:43:30 +0000
Date: Thu, 10 Sep 2026 17:42:42 +0200
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 arm@kernel.org
Subject: [soc:board-remove-7.3 226/294]
 drivers/mtd/spi-nor/spansion.c:100:9: error: call to undeclared function
 'spi_nor_controller_ops_write_reg'; ISO C99 and later do not support implicit
 function declarations
Message-ID: <202609101458.dCAUeSAA-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git board-remove-7.3
head:   3ac93c1e700558259ea604f7d4f37e26820fba15
commit: 62e3b560c8fdcab6be5dce819f3b76df95cd95dc [226/294] mtd: spi-nor: remove controller_ops support
config: loongarch-allyesconfig (https://download.01.org/0day-ci/archive/20260910/202609101458.dCAUeSAA-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260910/202609101458.dCAUeSAA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609101458.dCAUeSAA-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/mtd/spi-nor/spansion.c:100:9: error: call to undeclared function 'spi_nor_controller_ops_write_reg'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     100 |                 ret = spi_nor_controller_ops_write_reg(nor, SPINOR_OP_CLSR,
         |                       ^
   1 error generated.
--
>> drivers/mtd/spi-nor/winbond.c:122:9: error: call to undeclared function 'spi_nor_controller_ops_write_reg'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     122 |                 ret = spi_nor_controller_ops_write_reg(nor,
         |                       ^
   drivers/mtd/spi-nor/winbond.c:424:9: error: call to undeclared function 'spi_nor_controller_ops_write_reg'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     424 |                 ret = spi_nor_controller_ops_write_reg(nor,
         |                       ^
   2 errors generated.


vim +/spi_nor_controller_ops_write_reg +100 drivers/mtd/spi-nor/spansion.c

d534fd9787d592 Takahiro Kuwano 2023-07-26   83  
91f3c430f622be Takahiro Kuwano 2023-04-07   84  /**
91f3c430f622be Takahiro Kuwano 2023-04-07   85   * spansion_nor_clear_sr() - Clear the Status Register.
91f3c430f622be Takahiro Kuwano 2023-04-07   86   * @nor:	pointer to 'struct spi_nor'.
91f3c430f622be Takahiro Kuwano 2023-04-07   87   */
91f3c430f622be Takahiro Kuwano 2023-04-07   88  static void spansion_nor_clear_sr(struct spi_nor *nor)
91f3c430f622be Takahiro Kuwano 2023-04-07   89  {
d534fd9787d592 Takahiro Kuwano 2023-07-26   90  	const struct spansion_nor_params *priv_params = nor->params->priv;
91f3c430f622be Takahiro Kuwano 2023-04-07   91  	int ret;
91f3c430f622be Takahiro Kuwano 2023-04-07   92  
91f3c430f622be Takahiro Kuwano 2023-04-07   93  	if (nor->spimem) {
d534fd9787d592 Takahiro Kuwano 2023-07-26   94  		struct spi_mem_op op = SPANSION_OP(priv_params->clsr);
91f3c430f622be Takahiro Kuwano 2023-04-07   95  
91f3c430f622be Takahiro Kuwano 2023-04-07   96  		spi_nor_spimem_setup_op(nor, &op, nor->reg_proto);
91f3c430f622be Takahiro Kuwano 2023-04-07   97  
91f3c430f622be Takahiro Kuwano 2023-04-07   98  		ret = spi_mem_exec_op(nor->spimem, &op);
91f3c430f622be Takahiro Kuwano 2023-04-07   99  	} else {
91f3c430f622be Takahiro Kuwano 2023-04-07 @100  		ret = spi_nor_controller_ops_write_reg(nor, SPINOR_OP_CLSR,
91f3c430f622be Takahiro Kuwano 2023-04-07  101  						       NULL, 0);
91f3c430f622be Takahiro Kuwano 2023-04-07  102  	}
91f3c430f622be Takahiro Kuwano 2023-04-07  103  
91f3c430f622be Takahiro Kuwano 2023-04-07  104  	if (ret)
91f3c430f622be Takahiro Kuwano 2023-04-07  105  		dev_dbg(nor->dev, "error %d clearing SR\n", ret);
91f3c430f622be Takahiro Kuwano 2023-04-07  106  }
91f3c430f622be Takahiro Kuwano 2023-04-07  107  

:::::: The code at line 100 was first introduced by commit
:::::: 91f3c430f622befb1b11f07df3bf7163f46adda6 mtd: spi-nor: spansion: Add a new ->ready() hook for multi-chip device

:::::: TO: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
:::::: CC: Tudor Ambarus <tudor.ambarus@linaro.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
