Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3B6D25DB12
	for <oe-kbuild-all@lists.linux.dev>; Fri,  6 Mar 2026 09:38:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772789906; cv=none; b=TNPiO1fiBf/OWxwD1C/8915dFXS2rc8+/6G70jO2AiZx8iBIkNGN4BKUhUKRP1XM2zmUhhrIXk2AtTnE9m9yREOevc1SADNGRmy9yYhV7GdChNX1cpuunec6vrLDIY/OKT9k6dNZYmSh7ffmVcm8u0QjTbidVHjtl1sm6/YmRe0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772789906; c=relaxed/simple;
	bh=5IsUV8FU/QBD9pEm9NtKyBVYyS+9gIrvTjZNr/N1yVY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iMR3URoAM8j+/HcNg/Ry3ZZFO1hnkPAaH/wlYuF8cQ7EArlb0rnuwdKBM0GRtE3sqxH0xo1o8YTLflVnTRUVtc2DOMmzySYlDXt33EwiJpNMb+kXqCRdi5EAZI4bZpTuCoy13LeK3LpZoP7OG34cQC78diNI4qhNYczg2X/eIP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cpc4QFoe; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cpc4QFoe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772789904; x=1804325904;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5IsUV8FU/QBD9pEm9NtKyBVYyS+9gIrvTjZNr/N1yVY=;
  b=cpc4QFoeELvV+6cvSm1tzWvx4SO/0T1UQp8NIvW91gfYO883BcFPglcI
   RGTbgeQyut0XBsT1wbPxUqI7EazpP3FedImrBlkKlvu8EYIvVebN3bc9V
   Opw/F9ITco087sGqKOSeelpyJI5mdv1EmUD4MAKiuOR4064hwuM6pjvT1
   flCMsvYV9rEPMVZIj2kDY7bQY9xompRvOQZfZD3MeqH8JZVXINr6NPwRD
   UQIAhG99/DYT13FpWRwgrEkN6YI/amTiZ9Peog/YpIEbF6SVMA/5icUIY
   aWpaam+HgOJNVyffPBd4/5i8ZrN9rg+xDlV3k6ju8KVE2YVXB5kuZt/Wp
   A==;
X-CSE-ConnectionGUID: K3xsWTjmTia+q90cFOd0+w==
X-CSE-MsgGUID: zaoezF4zQACq7ZZaLUZpGw==
X-IronPort-AV: E=McAfee;i="6800,10657,11720"; a="73595951"
X-IronPort-AV: E=Sophos;i="6.23,104,1770624000"; 
   d="scan'208";a="73595951"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2026 01:38:24 -0800
X-CSE-ConnectionGUID: kohDIixYSMWSXQyh3OAIag==
X-CSE-MsgGUID: vJYmj2yeR82JerRUAl5ojQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,104,1770624000"; 
   d="scan'208";a="218953961"
Received: from lkp-server01.sh.intel.com (HELO 058beb05654c) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 06 Mar 2026 01:38:21 -0800
Received: from kbuild by 058beb05654c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vyRdT-000000000ez-0ocI;
	Fri, 06 Mar 2026 09:38:19 +0000
Date: Fri, 6 Mar 2026 17:37:21 +0800
From: kernel test robot <lkp@intel.com>
To: Frieder Schrempf <frieder@fris.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC 4/7] mtd: spinand: toshiba: Add RX sampling delay
 values
Message-ID: <202603061757.Ig1cxEXk-lkp@intel.com>
References: <20260303-fsl-qspi-rx-sampling-delay-v1-4-9326bbc492d6@kontron.de>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260303-fsl-qspi-rx-sampling-delay-v1-4-9326bbc492d6@kontron.de>

Hi Frieder,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on 11439c4635edd669ae435eec308f4ab8a0804808]

url:    https://github.com/intel-lab-lkp/linux/commits/Frieder-Schrempf/spi-Add-rx_sampling_delay_ns-parameter-for-clock-to-RX-delay/20260304-004536
base:   11439c4635edd669ae435eec308f4ab8a0804808
patch link:    https://lore.kernel.org/r/20260303-fsl-qspi-rx-sampling-delay-v1-4-9326bbc492d6%40kontron.de
patch subject: [PATCH RFC 4/7] mtd: spinand: toshiba: Add RX sampling delay values
config: sparc64-randconfig-001-20260306 (https://download.01.org/0day-ci/archive/20260306/202603061757.Ig1cxEXk-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 14.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260306/202603061757.Ig1cxEXk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603061757.Ig1cxEXk-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> drivers/mtd/nand/spi/toshiba.c:328:3: error: unterminated argument list invoking macro "SPINAND_INFO"
     328 | };
         |   ^
>> drivers/mtd/nand/spi/toshiba.c:285:9: error: 'SPINAND_INFO' undeclared here (not in a function)
     285 |         SPINAND_INFO("TC58NYG0S3HBAI4",
         |         ^~~~~~~~~~~~
>> drivers/mtd/nand/spi/toshiba.c:329: error: expected '}' at end of input
   drivers/mtd/nand/spi/toshiba.c:110:60: note: to match this '{'
     110 | static const struct spinand_info toshiba_spinand_table[] = {
         |                                                            ^
>> drivers/mtd/nand/spi/toshiba.c:110:34: warning: 'toshiba_spinand_table' defined but not used [-Wunused-const-variable=]
     110 | static const struct spinand_info toshiba_spinand_table[] = {
         |                                  ^~~~~~~~~~~~~~~~~~~~~


vim +/SPINAND_INFO +328 drivers/mtd/nand/spi/toshiba.c

10949af1681d5bb Schrempf Frieder 2018-11-08  109  
10949af1681d5bb Schrempf Frieder 2018-11-08  110  static const struct spinand_info toshiba_spinand_table[] = {
798fcdd010006e8 Yoshio Furuyama  2020-03-24  111  	/* 3.3V 1Gb (1st generation) */
6b49e58d6d9dab0 Yoshio Furuyama  2020-03-24  112  	SPINAND_INFO("TC58CVG0S3HRAIG",
f1541773af49ecd Chuanhong Guo    2020-02-08  113  		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0xC2),
377e517b5fa5359 Boris Brezillon  2018-11-04  114  		     NAND_MEMORG(1, 2048, 128, 64, 1024, 20, 1, 1, 1),
db214513f62fd13 Yoshio Furuyama  2019-01-16  115  		     NAND_ECCREQ(8, 512),
db214513f62fd13 Yoshio Furuyama  2019-01-16  116  		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
db214513f62fd13 Yoshio Furuyama  2019-01-16  117  					      &write_cache_variants,
db214513f62fd13 Yoshio Furuyama  2019-01-16  118  					      &update_cache_variants),
db214513f62fd13 Yoshio Furuyama  2019-01-16  119  		     0,
6b49e58d6d9dab0 Yoshio Furuyama  2020-03-24  120  		     SPINAND_ECCINFO(&tx58cxgxsxraix_ooblayout,
b1a60738d0766b4 Frieder Schrempf 2026-03-03  121  				     tx58cxgxsxraix_ecc_get_status),
b1a60738d0766b4 Frieder Schrempf 2026-03-03  122  		     SPINAND_RX_SAMPLING_DELAY(6)),
798fcdd010006e8 Yoshio Furuyama  2020-03-24  123  	/* 3.3V 2Gb (1st generation) */
6b49e58d6d9dab0 Yoshio Furuyama  2020-03-24  124  	SPINAND_INFO("TC58CVG1S3HRAIG",
f1541773af49ecd Chuanhong Guo    2020-02-08  125  		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0xCB),
377e517b5fa5359 Boris Brezillon  2018-11-04  126  		     NAND_MEMORG(1, 2048, 128, 64, 2048, 40, 1, 1, 1),
db214513f62fd13 Yoshio Furuyama  2019-01-16  127  		     NAND_ECCREQ(8, 512),
db214513f62fd13 Yoshio Furuyama  2019-01-16  128  		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
db214513f62fd13 Yoshio Furuyama  2019-01-16  129  					      &write_cache_variants,
db214513f62fd13 Yoshio Furuyama  2019-01-16  130  					      &update_cache_variants),
db214513f62fd13 Yoshio Furuyama  2019-01-16  131  		     0,
6b49e58d6d9dab0 Yoshio Furuyama  2020-03-24  132  		     SPINAND_ECCINFO(&tx58cxgxsxraix_ooblayout,
b1a60738d0766b4 Frieder Schrempf 2026-03-03  133  				     tx58cxgxsxraix_ecc_get_status),
b1a60738d0766b4 Frieder Schrempf 2026-03-03  134  		     SPINAND_RX_SAMPLING_DELAY(8)),
798fcdd010006e8 Yoshio Furuyama  2020-03-24  135  	/* 3.3V 4Gb (1st generation) */
6b49e58d6d9dab0 Yoshio Furuyama  2020-03-24  136  	SPINAND_INFO("TC58CVG2S0HRAIG",
f1541773af49ecd Chuanhong Guo    2020-02-08  137  		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0xCD),
377e517b5fa5359 Boris Brezillon  2018-11-04  138  		     NAND_MEMORG(1, 4096, 256, 64, 2048, 40, 1, 1, 1),
9ee0f956cfbb87b Robert Marko     2020-01-03  139  		     NAND_ECCREQ(8, 512),
9ee0f956cfbb87b Robert Marko     2020-01-03  140  		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
9ee0f956cfbb87b Robert Marko     2020-01-03  141  					      &write_cache_variants,
9ee0f956cfbb87b Robert Marko     2020-01-03  142  					      &update_cache_variants),
9ee0f956cfbb87b Robert Marko     2020-01-03  143  		     0,
6b49e58d6d9dab0 Yoshio Furuyama  2020-03-24  144  		     SPINAND_ECCINFO(&tx58cxgxsxraix_ooblayout,
b1a60738d0766b4 Frieder Schrempf 2026-03-03  145  				     tx58cxgxsxraix_ecc_get_status),
b1a60738d0766b4 Frieder Schrempf 2026-03-03  146  		     SPINAND_RX_SAMPLING_DELAY(8)),
798fcdd010006e8 Yoshio Furuyama  2020-03-24  147  	/* 1.8V 1Gb (1st generation) */
6b49e58d6d9dab0 Yoshio Furuyama  2020-03-24  148  	SPINAND_INFO("TC58CYG0S3HRAIG",
f1541773af49ecd Chuanhong Guo    2020-02-08  149  		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0xB2),
377e517b5fa5359 Boris Brezillon  2018-11-04  150  		     NAND_MEMORG(1, 2048, 128, 64, 1024, 20, 1, 1, 1),
db214513f62fd13 Yoshio Furuyama  2019-01-16  151  		     NAND_ECCREQ(8, 512),
db214513f62fd13 Yoshio Furuyama  2019-01-16  152  		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
db214513f62fd13 Yoshio Furuyama  2019-01-16  153  					      &write_cache_variants,
db214513f62fd13 Yoshio Furuyama  2019-01-16  154  					      &update_cache_variants),
db214513f62fd13 Yoshio Furuyama  2019-01-16  155  		     0,
6b49e58d6d9dab0 Yoshio Furuyama  2020-03-24  156  		     SPINAND_ECCINFO(&tx58cxgxsxraix_ooblayout,
b1a60738d0766b4 Frieder Schrempf 2026-03-03  157  				     tx58cxgxsxraix_ecc_get_status),
b1a60738d0766b4 Frieder Schrempf 2026-03-03  158  		     SPINAND_RX_SAMPLING_DELAY(8)),
798fcdd010006e8 Yoshio Furuyama  2020-03-24  159  	/* 1.8V 2Gb (1st generation) */
6b49e58d6d9dab0 Yoshio Furuyama  2020-03-24  160  	SPINAND_INFO("TC58CYG1S3HRAIG",
f1541773af49ecd Chuanhong Guo    2020-02-08  161  		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0xBB),
377e517b5fa5359 Boris Brezillon  2018-11-04  162  		     NAND_MEMORG(1, 2048, 128, 64, 2048, 40, 1, 1, 1),
db214513f62fd13 Yoshio Furuyama  2019-01-16  163  		     NAND_ECCREQ(8, 512),
db214513f62fd13 Yoshio Furuyama  2019-01-16  164  		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
db214513f62fd13 Yoshio Furuyama  2019-01-16  165  					      &write_cache_variants,
db214513f62fd13 Yoshio Furuyama  2019-01-16  166  					      &update_cache_variants),
db214513f62fd13 Yoshio Furuyama  2019-01-16  167  		     0,
6b49e58d6d9dab0 Yoshio Furuyama  2020-03-24  168  		     SPINAND_ECCINFO(&tx58cxgxsxraix_ooblayout,
b1a60738d0766b4 Frieder Schrempf 2026-03-03  169  				     tx58cxgxsxraix_ecc_get_status),
b1a60738d0766b4 Frieder Schrempf 2026-03-03  170  		     SPINAND_RX_SAMPLING_DELAY(8)),
798fcdd010006e8 Yoshio Furuyama  2020-03-24  171  	/* 1.8V 4Gb (1st generation) */
6b49e58d6d9dab0 Yoshio Furuyama  2020-03-24  172  	SPINAND_INFO("TC58CYG2S0HRAIG",
f1541773af49ecd Chuanhong Guo    2020-02-08  173  		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0xBD),
377e517b5fa5359 Boris Brezillon  2018-11-04  174  		     NAND_MEMORG(1, 4096, 256, 64, 2048, 40, 1, 1, 1),
10949af1681d5bb Schrempf Frieder 2018-11-08  175  		     NAND_ECCREQ(8, 512),
10949af1681d5bb Schrempf Frieder 2018-11-08  176  		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
10949af1681d5bb Schrempf Frieder 2018-11-08  177  					      &write_cache_variants,
10949af1681d5bb Schrempf Frieder 2018-11-08  178  					      &update_cache_variants),
db214513f62fd13 Yoshio Furuyama  2019-01-16  179  		     0,
6b49e58d6d9dab0 Yoshio Furuyama  2020-03-24  180  		     SPINAND_ECCINFO(&tx58cxgxsxraix_ooblayout,
b1a60738d0766b4 Frieder Schrempf 2026-03-03  181  				     tx58cxgxsxraix_ecc_get_status),
b1a60738d0766b4 Frieder Schrempf 2026-03-03  182  		     SPINAND_RX_SAMPLING_DELAY(8)),
798fcdd010006e8 Yoshio Furuyama  2020-03-24  183  
798fcdd010006e8 Yoshio Furuyama  2020-03-24  184  	/*
798fcdd010006e8 Yoshio Furuyama  2020-03-24  185  	 * 2nd generation serial nand has HOLD_D which is equivalent to
798fcdd010006e8 Yoshio Furuyama  2020-03-24  186  	 * QE_BIT.
798fcdd010006e8 Yoshio Furuyama  2020-03-24  187  	 */
798fcdd010006e8 Yoshio Furuyama  2020-03-24  188  	/* 3.3V 1Gb (2nd generation) */
798fcdd010006e8 Yoshio Furuyama  2020-03-24  189  	SPINAND_INFO("TC58CVG0S3HRAIJ",
798fcdd010006e8 Yoshio Furuyama  2020-03-24  190  		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0xE2),
798fcdd010006e8 Yoshio Furuyama  2020-03-24  191  		     NAND_MEMORG(1, 2048, 128, 64, 1024, 20, 1, 1, 1),
798fcdd010006e8 Yoshio Furuyama  2020-03-24  192  		     NAND_ECCREQ(8, 512),
798fcdd010006e8 Yoshio Furuyama  2020-03-24  193  		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
798fcdd010006e8 Yoshio Furuyama  2020-03-24  194  					      &write_cache_x4_variants,
798fcdd010006e8 Yoshio Furuyama  2020-03-24  195  					      &update_cache_x4_variants),
798fcdd010006e8 Yoshio Furuyama  2020-03-24  196  		     SPINAND_HAS_QE_BIT,
798fcdd010006e8 Yoshio Furuyama  2020-03-24  197  		     SPINAND_ECCINFO(&tx58cxgxsxraix_ooblayout,
b1a60738d0766b4 Frieder Schrempf 2026-03-03  198  				     tx58cxgxsxraix_ecc_get_status),
b1a60738d0766b4 Frieder Schrempf 2026-03-03  199  		     SPINAND_RX_SAMPLING_DELAY(6)),
798fcdd010006e8 Yoshio Furuyama  2020-03-24  200  	/* 3.3V 2Gb (2nd generation) */
798fcdd010006e8 Yoshio Furuyama  2020-03-24  201  	SPINAND_INFO("TC58CVG1S3HRAIJ",
798fcdd010006e8 Yoshio Furuyama  2020-03-24  202  		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0xEB),
798fcdd010006e8 Yoshio Furuyama  2020-03-24  203  		     NAND_MEMORG(1, 2048, 128, 64, 2048, 40, 1, 1, 1),
798fcdd010006e8 Yoshio Furuyama  2020-03-24  204  		     NAND_ECCREQ(8, 512),
798fcdd010006e8 Yoshio Furuyama  2020-03-24  205  		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
798fcdd010006e8 Yoshio Furuyama  2020-03-24  206  					      &write_cache_x4_variants,
798fcdd010006e8 Yoshio Furuyama  2020-03-24  207  					      &update_cache_x4_variants),
798fcdd010006e8 Yoshio Furuyama  2020-03-24  208  		     SPINAND_HAS_QE_BIT,
798fcdd010006e8 Yoshio Furuyama  2020-03-24  209  		     SPINAND_ECCINFO(&tx58cxgxsxraix_ooblayout,
b1a60738d0766b4 Frieder Schrempf 2026-03-03  210  				     tx58cxgxsxraix_ecc_get_status),
b1a60738d0766b4 Frieder Schrempf 2026-03-03  211  		     SPINAND_RX_SAMPLING_DELAY(6)),
798fcdd010006e8 Yoshio Furuyama  2020-03-24  212  	/* 3.3V 4Gb (2nd generation) */
798fcdd010006e8 Yoshio Furuyama  2020-03-24  213  	SPINAND_INFO("TC58CVG2S0HRAIJ",
798fcdd010006e8 Yoshio Furuyama  2020-03-24  214  		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0xED),
798fcdd010006e8 Yoshio Furuyama  2020-03-24  215  		     NAND_MEMORG(1, 4096, 256, 64, 2048, 40, 1, 1, 1),
798fcdd010006e8 Yoshio Furuyama  2020-03-24  216  		     NAND_ECCREQ(8, 512),
798fcdd010006e8 Yoshio Furuyama  2020-03-24  217  		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
798fcdd010006e8 Yoshio Furuyama  2020-03-24  218  					      &write_cache_x4_variants,
798fcdd010006e8 Yoshio Furuyama  2020-03-24  219  					      &update_cache_x4_variants),
798fcdd010006e8 Yoshio Furuyama  2020-03-24  220  		     SPINAND_HAS_QE_BIT,
798fcdd010006e8 Yoshio Furuyama  2020-03-24  221  		     SPINAND_ECCINFO(&tx58cxgxsxraix_ooblayout,
b1a60738d0766b4 Frieder Schrempf 2026-03-03  222  				     tx58cxgxsxraix_ecc_get_status),
b1a60738d0766b4 Frieder Schrempf 2026-03-03  223  		     SPINAND_RX_SAMPLING_DELAY(6)),
798fcdd010006e8 Yoshio Furuyama  2020-03-24  224  	/* 3.3V 8Gb (2nd generation) */
798fcdd010006e8 Yoshio Furuyama  2020-03-24  225  	SPINAND_INFO("TH58CVG3S0HRAIJ",
798fcdd010006e8 Yoshio Furuyama  2020-03-24  226  		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0xE4),
798fcdd010006e8 Yoshio Furuyama  2020-03-24  227  		     NAND_MEMORG(1, 4096, 256, 64, 4096, 80, 1, 1, 1),
798fcdd010006e8 Yoshio Furuyama  2020-03-24  228  		     NAND_ECCREQ(8, 512),
798fcdd010006e8 Yoshio Furuyama  2020-03-24  229  		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
798fcdd010006e8 Yoshio Furuyama  2020-03-24  230  					      &write_cache_x4_variants,
798fcdd010006e8 Yoshio Furuyama  2020-03-24  231  					      &update_cache_x4_variants),
798fcdd010006e8 Yoshio Furuyama  2020-03-24  232  		     SPINAND_HAS_QE_BIT,
798fcdd010006e8 Yoshio Furuyama  2020-03-24  233  		     SPINAND_ECCINFO(&tx58cxgxsxraix_ooblayout,
b1a60738d0766b4 Frieder Schrempf 2026-03-03  234  				     tx58cxgxsxraix_ecc_get_status),
b1a60738d0766b4 Frieder Schrempf 2026-03-03  235  		     SPINAND_RX_SAMPLING_DELAY(6)),
798fcdd010006e8 Yoshio Furuyama  2020-03-24  236  	/* 1.8V 1Gb (2nd generation) */
798fcdd010006e8 Yoshio Furuyama  2020-03-24  237  	SPINAND_INFO("TC58CYG0S3HRAIJ",
798fcdd010006e8 Yoshio Furuyama  2020-03-24  238  		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0xD2),
798fcdd010006e8 Yoshio Furuyama  2020-03-24  239  		     NAND_MEMORG(1, 2048, 128, 64, 1024, 20, 1, 1, 1),
798fcdd010006e8 Yoshio Furuyama  2020-03-24  240  		     NAND_ECCREQ(8, 512),
798fcdd010006e8 Yoshio Furuyama  2020-03-24  241  		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
798fcdd010006e8 Yoshio Furuyama  2020-03-24  242  					      &write_cache_x4_variants,
798fcdd010006e8 Yoshio Furuyama  2020-03-24  243  					      &update_cache_x4_variants),
798fcdd010006e8 Yoshio Furuyama  2020-03-24  244  		     SPINAND_HAS_QE_BIT,
798fcdd010006e8 Yoshio Furuyama  2020-03-24  245  		     SPINAND_ECCINFO(&tx58cxgxsxraix_ooblayout,
b1a60738d0766b4 Frieder Schrempf 2026-03-03  246  				     tx58cxgxsxraix_ecc_get_status),
b1a60738d0766b4 Frieder Schrempf 2026-03-03  247  		     SPINAND_RX_SAMPLING_DELAY(6)),
798fcdd010006e8 Yoshio Furuyama  2020-03-24  248  	/* 1.8V 2Gb (2nd generation) */
798fcdd010006e8 Yoshio Furuyama  2020-03-24  249  	SPINAND_INFO("TC58CYG1S3HRAIJ",
798fcdd010006e8 Yoshio Furuyama  2020-03-24  250  		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0xDB),
798fcdd010006e8 Yoshio Furuyama  2020-03-24  251  		     NAND_MEMORG(1, 2048, 128, 64, 2048, 40, 1, 1, 1),
798fcdd010006e8 Yoshio Furuyama  2020-03-24  252  		     NAND_ECCREQ(8, 512),
798fcdd010006e8 Yoshio Furuyama  2020-03-24  253  		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
798fcdd010006e8 Yoshio Furuyama  2020-03-24  254  					      &write_cache_x4_variants,
798fcdd010006e8 Yoshio Furuyama  2020-03-24  255  					      &update_cache_x4_variants),
798fcdd010006e8 Yoshio Furuyama  2020-03-24  256  		     SPINAND_HAS_QE_BIT,
798fcdd010006e8 Yoshio Furuyama  2020-03-24  257  		     SPINAND_ECCINFO(&tx58cxgxsxraix_ooblayout,
b1a60738d0766b4 Frieder Schrempf 2026-03-03  258  				     tx58cxgxsxraix_ecc_get_status),
b1a60738d0766b4 Frieder Schrempf 2026-03-03  259  		     SPINAND_RX_SAMPLING_DELAY(6)),
798fcdd010006e8 Yoshio Furuyama  2020-03-24  260  	/* 1.8V 4Gb (2nd generation) */
798fcdd010006e8 Yoshio Furuyama  2020-03-24  261  	SPINAND_INFO("TC58CYG2S0HRAIJ",
798fcdd010006e8 Yoshio Furuyama  2020-03-24  262  		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0xDD),
798fcdd010006e8 Yoshio Furuyama  2020-03-24  263  		     NAND_MEMORG(1, 4096, 256, 64, 2048, 40, 1, 1, 1),
798fcdd010006e8 Yoshio Furuyama  2020-03-24  264  		     NAND_ECCREQ(8, 512),
798fcdd010006e8 Yoshio Furuyama  2020-03-24  265  		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
798fcdd010006e8 Yoshio Furuyama  2020-03-24  266  					      &write_cache_x4_variants,
798fcdd010006e8 Yoshio Furuyama  2020-03-24  267  					      &update_cache_x4_variants),
798fcdd010006e8 Yoshio Furuyama  2020-03-24  268  		     SPINAND_HAS_QE_BIT,
798fcdd010006e8 Yoshio Furuyama  2020-03-24  269  		     SPINAND_ECCINFO(&tx58cxgxsxraix_ooblayout,
b1a60738d0766b4 Frieder Schrempf 2026-03-03  270  				     tx58cxgxsxraix_ecc_get_status),
b1a60738d0766b4 Frieder Schrempf 2026-03-03  271  		     SPINAND_RX_SAMPLING_DELAY(6)),
798fcdd010006e8 Yoshio Furuyama  2020-03-24  272  	/* 1.8V 8Gb (2nd generation) */
798fcdd010006e8 Yoshio Furuyama  2020-03-24  273  	SPINAND_INFO("TH58CYG3S0HRAIJ",
798fcdd010006e8 Yoshio Furuyama  2020-03-24  274  		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0xD4),
798fcdd010006e8 Yoshio Furuyama  2020-03-24  275  		     NAND_MEMORG(1, 4096, 256, 64, 4096, 80, 1, 1, 1),
798fcdd010006e8 Yoshio Furuyama  2020-03-24  276  		     NAND_ECCREQ(8, 512),
798fcdd010006e8 Yoshio Furuyama  2020-03-24  277  		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
798fcdd010006e8 Yoshio Furuyama  2020-03-24  278  					      &write_cache_x4_variants,
798fcdd010006e8 Yoshio Furuyama  2020-03-24  279  					      &update_cache_x4_variants),
798fcdd010006e8 Yoshio Furuyama  2020-03-24  280  		     SPINAND_HAS_QE_BIT,
798fcdd010006e8 Yoshio Furuyama  2020-03-24  281  		     SPINAND_ECCINFO(&tx58cxgxsxraix_ooblayout,
b1a60738d0766b4 Frieder Schrempf 2026-03-03  282  				     tx58cxgxsxraix_ecc_get_status),
b1a60738d0766b4 Frieder Schrempf 2026-03-03  283  		     SPINAND_RX_SAMPLING_DELAY(6)),
dabd64be75ae38b Sridharan S N    2023-06-23  284  	/* 1.8V 1Gb (1st generation) */
dabd64be75ae38b Sridharan S N    2023-06-23 @285  	SPINAND_INFO("TC58NYG0S3HBAI4",
dabd64be75ae38b Sridharan S N    2023-06-23  286  		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0xA1),
dabd64be75ae38b Sridharan S N    2023-06-23  287  		     NAND_MEMORG(1, 2048, 128, 64, 1024, 20, 1, 1, 1),
dabd64be75ae38b Sridharan S N    2023-06-23  288  		     NAND_ECCREQ(8, 512),
dabd64be75ae38b Sridharan S N    2023-06-23  289  		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
dabd64be75ae38b Sridharan S N    2023-06-23  290  					      &write_cache_variants,
dabd64be75ae38b Sridharan S N    2023-06-23  291  					      &update_cache_variants),
dabd64be75ae38b Sridharan S N    2023-06-23  292  		     0,
dabd64be75ae38b Sridharan S N    2023-06-23  293  		     SPINAND_ECCINFO(&tx58cxgxsxraix_ooblayout,
b1a60738d0766b4 Frieder Schrempf 2026-03-03  294  				     tx58cxgxsxraix_ecc_get_status),
dabd64be75ae38b Sridharan S N    2023-06-23  295  	/* 1.8V 4Gb (1st generation) */
dabd64be75ae38b Sridharan S N    2023-06-23  296  	SPINAND_INFO("TH58NYG2S3HBAI4",
dabd64be75ae38b Sridharan S N    2023-06-23  297  		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0xAC),
dabd64be75ae38b Sridharan S N    2023-06-23  298  		     NAND_MEMORG(1, 2048, 128, 64, 4096, 80, 1, 2, 1),
dabd64be75ae38b Sridharan S N    2023-06-23  299  		     NAND_ECCREQ(8, 512),
dabd64be75ae38b Sridharan S N    2023-06-23  300  		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
dabd64be75ae38b Sridharan S N    2023-06-23  301  					      &write_cache_x4_variants,
dabd64be75ae38b Sridharan S N    2023-06-23  302  					      &update_cache_x4_variants),
dabd64be75ae38b Sridharan S N    2023-06-23  303  		     SPINAND_HAS_QE_BIT,
dabd64be75ae38b Sridharan S N    2023-06-23  304  		     SPINAND_ECCINFO(&tx58cxgxsxraix_ooblayout,
b1a60738d0766b4 Frieder Schrempf 2026-03-03  305  				     tx58cxgxsxraix_ecc_get_status),
dabd64be75ae38b Sridharan S N    2023-06-23  306  	/* 1.8V 8Gb (1st generation) */
dabd64be75ae38b Sridharan S N    2023-06-23  307  	SPINAND_INFO("TH58NYG3S0HBAI6",
dabd64be75ae38b Sridharan S N    2023-06-23  308  		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0xA3),
dabd64be75ae38b Sridharan S N    2023-06-23  309  		     NAND_MEMORG(1, 4096, 256, 64, 4096, 80, 1, 1, 1),
dabd64be75ae38b Sridharan S N    2023-06-23  310  		     NAND_ECCREQ(8, 512),
dabd64be75ae38b Sridharan S N    2023-06-23  311  		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
dabd64be75ae38b Sridharan S N    2023-06-23  312  					      &write_cache_x4_variants,
dabd64be75ae38b Sridharan S N    2023-06-23  313  					      &update_cache_x4_variants),
dabd64be75ae38b Sridharan S N    2023-06-23  314  		     SPINAND_HAS_QE_BIT,
dabd64be75ae38b Sridharan S N    2023-06-23  315  		     SPINAND_ECCINFO(&tx58cxgxsxraix_ooblayout,
b1a60738d0766b4 Frieder Schrempf 2026-03-03  316  				     tx58cxgxsxraix_ecc_get_status),
10949af1681d5bb Schrempf Frieder 2018-11-08  317  };
10949af1681d5bb Schrempf Frieder 2018-11-08  318  
10949af1681d5bb Schrempf Frieder 2018-11-08  319  static const struct spinand_manufacturer_ops toshiba_spinand_manuf_ops = {
10949af1681d5bb Schrempf Frieder 2018-11-08  320  };
10949af1681d5bb Schrempf Frieder 2018-11-08  321  
10949af1681d5bb Schrempf Frieder 2018-11-08  322  const struct spinand_manufacturer toshiba_spinand_manufacturer = {
10949af1681d5bb Schrempf Frieder 2018-11-08  323  	.id = SPINAND_MFR_TOSHIBA,
10949af1681d5bb Schrempf Frieder 2018-11-08  324  	.name = "Toshiba",
f1541773af49ecd Chuanhong Guo    2020-02-08  325  	.chips = toshiba_spinand_table,
f1541773af49ecd Chuanhong Guo    2020-02-08  326  	.nchips = ARRAY_SIZE(toshiba_spinand_table),
10949af1681d5bb Schrempf Frieder 2018-11-08  327  	.ops = &toshiba_spinand_manuf_ops,
10949af1681d5bb Schrempf Frieder 2018-11-08 @328  };

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
