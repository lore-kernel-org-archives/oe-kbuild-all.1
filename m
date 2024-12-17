Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FB4C1F6694
	for <oe-kbuild-all@lists.linux.dev>; Tue, 17 Dec 2024 15:08:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734448082; cv=none; b=OAvvpRMizUHk145oxdJ6W048X8lIF4uSTTY4IKcMfbIzchox4xwFTS6iMyJHUAEDi0aQXwKscJJ/spymvkok0+FGeIfqn0kaOUFOkCcPczLKqglgGbY/E0NKg691K9Pgk86Z7R5t/2a2xeUp6pZtGl6FARiTdWIUHEiBX+c4yPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734448082; c=relaxed/simple;
	bh=SrLf9QYyUPVtqe6JNIf5J1MDQhXletF00T2sn6k2SWk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=htOCVocaOJwkFkU6OPRnlM9n2bYc2WaBTvvyRvnzIaaXT7Yb1FT5AnHdemmBqNnWpouygJWPNmovDORhmsuYM06/tISJ6wrt7P3R5MDizY8z84Xe57+Q01b13zcRDrsCe8CNFICMyPtKYHzCmM/+rp3hkw9mP3wnk3wEbDcyR7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=W1q9NI3D; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="W1q9NI3D"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734448081; x=1765984081;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SrLf9QYyUPVtqe6JNIf5J1MDQhXletF00T2sn6k2SWk=;
  b=W1q9NI3D0ZojWGqcUU8lDtMZ4QgvL0qahJBioeBcguubYCwjpb16543G
   pKkWyDC760ckQavf7asH7N31XFbVut8MSqTKDjP3GJQ86kk3tNv81aqDD
   MMXzG4qOTqT65mMqxZaz353iM1uNTYpTB6OnQ8zMDEYmtFZDD4w3Gvog8
   iy4FyaBkrzqqUhmmaI0VLvmnPCXEPxIjVi8/IPEBrF5pRciMxgKUxfpY1
   0Bo4q0DfMIo4sYLPL/OAi9ZRayMoFb/vjqQT1zHhDFObC2DREU98E5x0x
   DBK7A/IbtQHZ2Zd0ZSvL3tEOJmfqOsBOK22SaGgspfVf0rGMFC3gsJptq
   A==;
X-CSE-ConnectionGUID: VSMbsnqASK+xxtNyHxUCDg==
X-CSE-MsgGUID: GX3C13iMRoeMb8Uxxiw3DA==
X-IronPort-AV: E=McAfee;i="6700,10204,11282"; a="45884172"
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="45884172"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2024 07:07:38 -0800
X-CSE-ConnectionGUID: u7+/BSBETui0yQwJdklzkA==
X-CSE-MsgGUID: V5CmsRWFQa63XgE7rRg4Wg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="134901880"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 17 Dec 2024 07:07:36 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tNZAc-000F5Q-0J;
	Tue, 17 Dec 2024 15:07:34 +0000
Date: Tue, 17 Dec 2024 23:06:28 +0800
From: kernel test robot <lkp@intel.com>
To: Tudor Ambarus <tudor.ambarus@microchip.com>
Cc: oe-kbuild-all@lists.linux.dev, Mark Brown <broonie@kernel.org>,
	Varshini Rajendran <varshini.rajendran@microchip.com>,
	=?iso-8859-1?B?Q3Pza+FzLA==?= Bence <csokas.bence@prolan.hu>
Subject: [broonie-ci:v3_20241128_csokas_bence_spi_atmel_quadspi_refactor_to_allow_supporting_sama7g5_o_qspi
 11/11] drivers/spi/atmel-quadspi.c:244: warning: Function parameter or
 struct member 'pclk_div' not described in 'atmel_qspi_pcal'
Message-ID: <202412172335.waixDMGG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/ci.git v3_20241128_csokas_bence_spi_atmel_quadspi_refactor_to_allow_supporting_sama7g5_o_qspi
head:   5af42209a4d23adc9a09e59e586d1b47fef3cc86
commit: 5af42209a4d23adc9a09e59e586d1b47fef3cc86 [11/11] spi: atmel-quadspi: Add support for sama7g5 QSPI
config: arm-randconfig-002-20241217 (https://download.01.org/0day-ci/archive/20241217/202412172335.waixDMGG-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241217/202412172335.waixDMGG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412172335.waixDMGG-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/spi/atmel-quadspi.c:244: warning: Function parameter or struct member 'pclk_div' not described in 'atmel_qspi_pcal'
>> drivers/spi/atmel-quadspi.c:244: warning: Excess struct member 'pclkdiv' description in 'atmel_qspi_pcal'


vim +244 drivers/spi/atmel-quadspi.c

   232	
   233	/* Use PIO for small transfers. */
   234	#define ATMEL_QSPI_DMA_MIN_BYTES	16
   235	/**
   236	 * struct atmel_qspi_pcal - Pad Calibration Clock Division
   237	 * @pclk_rate: peripheral clock rate.
   238	 * @pclkdiv: calibration clock division. The clock applied to the calibration
   239	 *           cell is divided by pclkdiv + 1.
   240	 */
   241	struct atmel_qspi_pcal {
   242		u32 pclk_rate;
   243		u8 pclk_div;
 > 244	};
   245	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
