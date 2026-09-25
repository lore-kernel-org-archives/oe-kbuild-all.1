Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07D1A36E498
	for <oe-kbuild-all@lists.linux.dev>; Fri, 25 Sep 2026 02:59:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790305194; cv=none; b=iUc4rymyip2G6I/o8UXHlbPwBXviPcm+4SKaprcgkUMJOUKrtxdEOYw32CVDoIJOHtp5fqJscdJNZ/7rQmXNH8gyoxF1PX4NsUmG8Ag1jKB0GqDJ8pKx+zWB9DLADMBVrhAMb/i7UUwX9ufVIwJwrIS5UB04TW9f31nTTLnuNYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790305194; c=relaxed/simple;
	bh=oFwksy/1FwxYfbb8C//DF/btDL1BK1hlgP3nP69rgUM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=OB03ZyLHZT5PWkLw40aeZtdmXX+di7OH66jysBBZABfIwD3HgligvWaD/Ft4nLsZD124YLBUva4aDq9Qwm/sBPH82QV84YDeGO/qzOW5HZa1oNFHcxLdCjIWtH+qajWcIjN7eP1sAGNcGMTUKAEKz810sns4aDXynUzYfAkaR9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eW046Mb3; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eW046Mb3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790305193; x=1821841193;
  h=date:from:to:cc:subject:message-id;
  bh=oFwksy/1FwxYfbb8C//DF/btDL1BK1hlgP3nP69rgUM=;
  b=eW046Mb3HUYNIF7XCVBjUIjcxLMM2LXWzTK+TvLjDZYPE85nK0ZmDWTi
   Y5z87zaCpA1e9f0Ey+z+uOdll5Khd/A6eGp8ptyzajSMDlkZ2qw7EeVYJ
   ZJm/lyZrs+XtBBl6oX0KHCQTRLhwP/WJ+Fv60a7ixSZusMjtYViuiOdRn
   A38TZWHTT9oBtMlVjhZo/vGDhYyEPyA4Et8Y+wMtAf0ErYVOtQiGcZUwn
   1/R8EWPRBGyox12vUvV6csRqp/jZcHjtXfPopke+ELIh2KseHKrGbHFMx
   DhMVb0Tmk2brctX+Anax0IWjiP6Dqy7uZkj6gsF1xiQdltwNPv9SU6TRQ
   A==;
X-CSE-ConnectionGUID: 7jXzz0AYQt6XElkSk5u0IQ==
X-CSE-MsgGUID: pUij9nfgQVO4jV2BGEjKYQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11915"; a="90309152"
X-IronPort-AV: E=Sophos;i="6.27,121,1787036400"; 
   d="scan'208";a="90309152"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2026 19:59:53 -0700
X-CSE-ConnectionGUID: 0CkztU7RQ9OwmfHPyIKoHA==
X-CSE-MsgGUID: wBjqNsL+RACgUoaewF4TLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,121,1787036400"; 
   d="scan'208";a="272787784"
Received: from igk-lkp-server01.igk.intel.com (HELO a88263cc608e) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 24 Sep 2026 19:59:51 -0700
Received: from kbuild by a88263cc608e with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x9wA8-000000000ZK-3SgW;
	Fri, 25 Sep 2026 02:59:48 +0000
Date: Fri, 25 Sep 2026 04:58:51 +0200
From: kernel test robot <lkp@intel.com>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, Lee Jones <lee@kernel.org>
Subject: [lee-mfd:for-mfd-next 32/35]
 drivers/mfd/motorola-cpcap.c:267:19: warning: cast to smaller integer type
 'enum cpcap_variant' from 'const void *'
Message-ID: <202609250415.snVBsAsJ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git for-mfd-next
head:   319633b06ff2bfc2a7a60d2cfcab2e681a343b27
commit: 8b8035cbfbb8487087b87db78724a7b1a2ab1982 [32/35] mfd: motorola-cpcap: Diverge configuration per-board
config: x86_64-allmodconfig (https://download.01.org/0day-ci/archive/20260925/202609250415.snVBsAsJ-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260925/202609250415.snVBsAsJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609250415.snVBsAsJ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/mfd/motorola-cpcap.c:267:19: warning: cast to smaller integer type 'enum cpcap_variant' from 'const void *' [-Wvoid-pointer-to-enum-cast]
     267 |         cpcap->variant = (enum cpcap_variant)spi_get_device_match_data(spi);
         |                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 warning generated.


vim +267 drivers/mfd/motorola-cpcap.c

   255	
   256	static int cpcap_probe(struct spi_device *spi)
   257	{
   258		struct cpcap_ddata *cpcap;
   259		const struct mfd_cell *cells;
   260		unsigned int num_cells;
   261		int ret;
   262	
   263		cpcap = devm_kzalloc(&spi->dev, sizeof(*cpcap), GFP_KERNEL);
   264		if (!cpcap)
   265			return -ENOMEM;
   266	
 > 267		cpcap->variant = (enum cpcap_variant)spi_get_device_match_data(spi);
   268	
   269		switch (cpcap->variant) {
   270		case CPCAP_DEFAULT:
   271			cells = cpcap_default_devices;
   272			num_cells = ARRAY_SIZE(cpcap_default_devices);
   273			break;
   274		case CPCAP_MAPPHONE:
   275			cells = cpcap_mapphone_devices;
   276			num_cells = ARRAY_SIZE(cpcap_mapphone_devices);
   277			break;
   278		default:
   279			return dev_err_probe(&spi->dev, -ENODEV,
   280					     "Unknown device %d\n", cpcap->variant);
   281		}
   282	
   283		cpcap->spi = spi;
   284		spi_set_drvdata(spi, cpcap);
   285	
   286		spi->bits_per_word = 16;
   287		spi->mode = SPI_MODE_0 | SPI_CS_HIGH;
   288	
   289		ret = spi_setup(spi);
   290		if (ret)
   291			return ret;
   292	
   293		cpcap->regmap_conf = &cpcap_regmap_config;
   294		cpcap->regmap = devm_regmap_init_spi(spi, &cpcap_regmap_config);
   295		if (IS_ERR(cpcap->regmap)) {
   296			ret = PTR_ERR(cpcap->regmap);
   297			dev_err(&cpcap->spi->dev, "Failed to initialize regmap: %d\n",
   298				ret);
   299	
   300			return ret;
   301		}
   302	
   303		ret = cpcap_check_revision(cpcap);
   304		if (ret) {
   305			dev_err(&cpcap->spi->dev, "Failed to detect CPCAP: %i\n", ret);
   306			return ret;
   307		}
   308	
   309		ret = cpcap_init_irq(cpcap);
   310		if (ret)
   311			return ret;
   312	
   313		/* Parent SPI controller uses DMA, CPCAP and child devices do not */
   314		spi->dev.coherent_dma_mask = 0;
   315		spi->dev.dma_mask = &spi->dev.coherent_dma_mask;
   316	
   317		ret = devm_mfd_add_devices(&spi->dev, 0, cpcap_common_devices,
   318					   ARRAY_SIZE(cpcap_common_devices), NULL, 0, NULL);
   319		if (ret)
   320			return dev_err_probe(&spi->dev, ret,
   321					     "Failed to add common child devices\n");
   322	
   323		return devm_mfd_add_devices(&spi->dev, 0, cells, num_cells, NULL, 0, NULL);
   324	}
   325	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
