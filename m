Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C62CCFBEA
	for <oe-kbuild-all@lists.linux.dev>; Thu, 27 Jun 2024 02:56:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719456979; cv=none; b=moFE2jBvCp3gTvEPcTnSAWojd2MBB13bMIf6cwkIDehDr/ipZps9vuscJwSrKI8BcPJHuI4HNBLvfdTSS3taQkpwf2PplzY1r01nVGnT+ntCXPWZsboa7kM/QpQEy3niM8wHpR/RFEXkbzqJbP7WCLl10E4dB8KU0/gQA21HfCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719456979; c=relaxed/simple;
	bh=x5GuM3g7N7p0PJNy2UXfLBsuFGvU2dbqfNM6yQQLpd8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=S0oMgOJQyWfWnk6uFTAwMw60IvQuF4SPfQx2eTu4nQ5MYzs3jBIIxaQ16nh9n3wiJHNrGPCP7MJeFdmPK3zPsKGmd4iRR9Tk4bgtbYPhceP5SsVnKTBRPw5AL0nnhUMw0jWIYptbXvgO/6gk1R6lY+1RH447CNO0X6ub3/UhzjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=V1HJvacN; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="V1HJvacN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719456977; x=1750992977;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=x5GuM3g7N7p0PJNy2UXfLBsuFGvU2dbqfNM6yQQLpd8=;
  b=V1HJvacNNoFwdNuzxvNNFI5DK76+VryxeuHu57mV55zgqtqZlpCOLmso
   cz+WxulL1Ood1iQ4dTjaxDGyTtwt6Qv4HVVuJwO+qHoOpLBLSf+OLaoZM
   7d1EXX3NFSs4RB8e+VbofmAr4ccWb0jhataW0N5v/wPJD10rWinJD8qvS
   dL3BDzZETO6g2e2CS6t+NHMFtjND+tksG6DVHdHH1QGvRnfjuhd0Rnccu
   DO/Lc57gTvBIaGcB/KZDxcqxN55Ki27tIWiYtdQeeyfOlWQdZOYwe5zo/
   awrxO1c2XcxkF1QZBnsx6P2eLuOr9Esq6xwKOKTw2L7S46EX5T9fxlQQh
   g==;
X-CSE-ConnectionGUID: s/ZowW+dTWmX5CdBPNW47Q==
X-CSE-MsgGUID: HQGM0ScHRPWbCtZUMHUQoA==
X-IronPort-AV: E=McAfee;i="6700,10204,11115"; a="16708311"
X-IronPort-AV: E=Sophos;i="6.08,268,1712646000"; 
   d="scan'208";a="16708311"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2024 19:56:17 -0700
X-CSE-ConnectionGUID: 3jjKOb1CSSWlSiLFECBotA==
X-CSE-MsgGUID: IfcnbpIGRECv3pzR4fODyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,268,1712646000"; 
   d="scan'208";a="44874220"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 26 Jun 2024 19:56:16 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sMfIz-000FoK-2C;
	Thu, 27 Jun 2024 02:56:13 +0000
Date: Thu, 27 Jun 2024 10:55:37 +0800
From: kernel test robot <lkp@intel.com>
To: Nuno Sa <nuno.sa@analog.com>
Cc: oe-kbuild-all@lists.linux.dev, Nuno Sa <noname.nuno@gmail.com>
Subject: [nsa:b4/dev-iio-ad9467-new-devs 4/9]
 drivers/iio/dac/ad9739a.c:416:44: error: passing argument 1 of
 'iio_backend_extend_chan_spec' from incompatible pointer type
Message-ID: <202406271028.bc4bWSWL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/nunojsa/linux b4/dev-iio-ad9467-new-devs
head:   07a190d5bdd96dcb948ba00339145f0bb2b461e9
commit: 93939e195eb7ec55a0bdefa022c33008ccf95e3c [4/9] iio: backend: remove unused parameter
config: i386-buildonly-randconfig-002-20240627 (https://download.01.org/0day-ci/archive/20240627/202406271028.bc4bWSWL-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240627/202406271028.bc4bWSWL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406271028.bc4bWSWL-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/iio/dac/ad9739a.c: In function 'ad9739a_probe':
>> drivers/iio/dac/ad9739a.c:416:44: error: passing argument 1 of 'iio_backend_extend_chan_spec' from incompatible pointer type [-Werror=incompatible-pointer-types]
     416 |         ret = iio_backend_extend_chan_spec(indio_dev, st->back,
         |                                            ^~~~~~~~~
         |                                            |
         |                                            struct iio_dev *
   In file included from drivers/iio/dac/ad9739a.c:23:
   include/linux/iio/backend.h:145:54: note: expected 'struct iio_backend *' but argument is of type 'struct iio_dev *'
     145 | int iio_backend_extend_chan_spec(struct iio_backend *back,
         |                                  ~~~~~~~~~~~~~~~~~~~~^~~~
   drivers/iio/dac/ad9739a.c:416:57: error: passing argument 2 of 'iio_backend_extend_chan_spec' from incompatible pointer type [-Werror=incompatible-pointer-types]
     416 |         ret = iio_backend_extend_chan_spec(indio_dev, st->back,
         |                                                       ~~^~~~~~
         |                                                         |
         |                                                         struct iio_backend *
   include/linux/iio/backend.h:146:56: note: expected 'struct iio_chan_spec *' but argument is of type 'struct iio_backend *'
     146 |                                  struct iio_chan_spec *chan);
         |                                  ~~~~~~~~~~~~~~~~~~~~~~^~~~
>> drivers/iio/dac/ad9739a.c:416:15: error: too many arguments to function 'iio_backend_extend_chan_spec'
     416 |         ret = iio_backend_extend_chan_spec(indio_dev, st->back,
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/iio/backend.h:145:5: note: declared here
     145 | int iio_backend_extend_chan_spec(struct iio_backend *back,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for REGMAP_SPI
   Depends on [n]: SPI [=n]
   Selected by [y]:
   - AD9739A [=y] && IIO [=y] && (SPI [=n] || COMPILE_TEST [=y])


vim +/iio_backend_extend_chan_spec +416 drivers/iio/dac/ad9739a.c

e77603d5468b90 Nuno Sa 2024-04-19  361  
e77603d5468b90 Nuno Sa 2024-04-19  362  static int ad9739a_probe(struct spi_device *spi)
e77603d5468b90 Nuno Sa 2024-04-19  363  {
e77603d5468b90 Nuno Sa 2024-04-19  364  	struct device *dev = &spi->dev;
e77603d5468b90 Nuno Sa 2024-04-19  365  	struct iio_dev *indio_dev;
e77603d5468b90 Nuno Sa 2024-04-19  366  	struct ad9739a_state *st;
e77603d5468b90 Nuno Sa 2024-04-19  367  	unsigned int id;
e77603d5468b90 Nuno Sa 2024-04-19  368  	struct clk *clk;
e77603d5468b90 Nuno Sa 2024-04-19  369  	int ret;
e77603d5468b90 Nuno Sa 2024-04-19  370  
e77603d5468b90 Nuno Sa 2024-04-19  371  	indio_dev = devm_iio_device_alloc(dev, sizeof(*st));
e77603d5468b90 Nuno Sa 2024-04-19  372  	if (!indio_dev)
e77603d5468b90 Nuno Sa 2024-04-19  373  		return -ENOMEM;
e77603d5468b90 Nuno Sa 2024-04-19  374  
e77603d5468b90 Nuno Sa 2024-04-19  375  	st = iio_priv(indio_dev);
e77603d5468b90 Nuno Sa 2024-04-19  376  
e77603d5468b90 Nuno Sa 2024-04-19  377  	clk = devm_clk_get_enabled(dev, NULL);
e77603d5468b90 Nuno Sa 2024-04-19  378  	if (IS_ERR(clk))
e77603d5468b90 Nuno Sa 2024-04-19  379  		return dev_err_probe(dev, PTR_ERR(clk), "Could not get clkin\n");
e77603d5468b90 Nuno Sa 2024-04-19  380  
e77603d5468b90 Nuno Sa 2024-04-19  381  	st->sample_rate = clk_get_rate(clk);
e77603d5468b90 Nuno Sa 2024-04-19  382  	if (!in_range(st->sample_rate, AD9739A_MIN_DAC_CLK,
e77603d5468b90 Nuno Sa 2024-04-19  383  		      AD9739A_DAC_CLK_RANGE))
e77603d5468b90 Nuno Sa 2024-04-19  384  		return dev_err_probe(dev, -EINVAL,
e77603d5468b90 Nuno Sa 2024-04-19  385  				     "Invalid dac clk range(%lu) [%lu %lu]\n",
e77603d5468b90 Nuno Sa 2024-04-19  386  				     st->sample_rate, AD9739A_MIN_DAC_CLK,
e77603d5468b90 Nuno Sa 2024-04-19  387  				     AD9739A_MAX_DAC_CLK);
e77603d5468b90 Nuno Sa 2024-04-19  388  
e77603d5468b90 Nuno Sa 2024-04-19  389  	st->regmap = devm_regmap_init_spi(spi, &ad9739a_regmap_config);
e77603d5468b90 Nuno Sa 2024-04-19  390  	if (IS_ERR(st->regmap))
e77603d5468b90 Nuno Sa 2024-04-19  391  		return PTR_ERR(st->regmap);
e77603d5468b90 Nuno Sa 2024-04-19  392  
e77603d5468b90 Nuno Sa 2024-04-19  393  	ret = regmap_read(st->regmap, AD9739A_REG_ID, &id);
e77603d5468b90 Nuno Sa 2024-04-19  394  	if (ret)
e77603d5468b90 Nuno Sa 2024-04-19  395  		return ret;
e77603d5468b90 Nuno Sa 2024-04-19  396  
e77603d5468b90 Nuno Sa 2024-04-19  397  	if (id != AD9739A_ID)
e77603d5468b90 Nuno Sa 2024-04-19  398  		dev_warn(dev, "Unrecognized CHIP_ID 0x%X", id);
e77603d5468b90 Nuno Sa 2024-04-19  399  
e77603d5468b90 Nuno Sa 2024-04-19  400  	ret = ad9739a_reset(dev, st);
e77603d5468b90 Nuno Sa 2024-04-19  401  	if (ret)
e77603d5468b90 Nuno Sa 2024-04-19  402  		return ret;
e77603d5468b90 Nuno Sa 2024-04-19  403  
e77603d5468b90 Nuno Sa 2024-04-19  404  	ret = ad9739a_init(dev, st);
e77603d5468b90 Nuno Sa 2024-04-19  405  	if (ret)
e77603d5468b90 Nuno Sa 2024-04-19  406  		return ret;
e77603d5468b90 Nuno Sa 2024-04-19  407  
e77603d5468b90 Nuno Sa 2024-04-19  408  	st->back = devm_iio_backend_get(dev, NULL);
e77603d5468b90 Nuno Sa 2024-04-19  409  	if (IS_ERR(st->back))
e77603d5468b90 Nuno Sa 2024-04-19  410  		return PTR_ERR(st->back);
e77603d5468b90 Nuno Sa 2024-04-19  411  
e77603d5468b90 Nuno Sa 2024-04-19  412  	ret = devm_iio_backend_request_buffer(dev, st->back, indio_dev);
e77603d5468b90 Nuno Sa 2024-04-19  413  	if (ret)
e77603d5468b90 Nuno Sa 2024-04-19  414  		return ret;
e77603d5468b90 Nuno Sa 2024-04-19  415  
e77603d5468b90 Nuno Sa 2024-04-19 @416  	ret = iio_backend_extend_chan_spec(indio_dev, st->back,
e77603d5468b90 Nuno Sa 2024-04-19  417  					   &ad9739a_channels[0]);
e77603d5468b90 Nuno Sa 2024-04-19  418  	if (ret)
e77603d5468b90 Nuno Sa 2024-04-19  419  		return ret;
e77603d5468b90 Nuno Sa 2024-04-19  420  
e77603d5468b90 Nuno Sa 2024-04-19  421  	ret = iio_backend_set_sampling_freq(st->back, 0, st->sample_rate);
e77603d5468b90 Nuno Sa 2024-04-19  422  	if (ret)
e77603d5468b90 Nuno Sa 2024-04-19  423  		return ret;
e77603d5468b90 Nuno Sa 2024-04-19  424  
e77603d5468b90 Nuno Sa 2024-04-19  425  	ret = devm_iio_backend_enable(dev, st->back);
e77603d5468b90 Nuno Sa 2024-04-19  426  	if (ret)
e77603d5468b90 Nuno Sa 2024-04-19  427  		return ret;
e77603d5468b90 Nuno Sa 2024-04-19  428  
e77603d5468b90 Nuno Sa 2024-04-19  429  	indio_dev->name = "ad9739a";
e77603d5468b90 Nuno Sa 2024-04-19  430  	indio_dev->info = &ad9739a_info;
e77603d5468b90 Nuno Sa 2024-04-19  431  	indio_dev->channels = ad9739a_channels;
e77603d5468b90 Nuno Sa 2024-04-19  432  	indio_dev->num_channels = ARRAY_SIZE(ad9739a_channels);
e77603d5468b90 Nuno Sa 2024-04-19  433  	indio_dev->setup_ops = &ad9739a_buffer_setup_ops;
e77603d5468b90 Nuno Sa 2024-04-19  434  
e77603d5468b90 Nuno Sa 2024-04-19  435  	return devm_iio_device_register(&spi->dev, indio_dev);
e77603d5468b90 Nuno Sa 2024-04-19  436  }
e77603d5468b90 Nuno Sa 2024-04-19  437  

:::::: The code at line 416 was first introduced by commit
:::::: e77603d5468b9093c111a998a86604e21a9e7f48 iio: dac: support the ad9739a RF DAC

:::::: TO: Nuno Sa <nuno.sa@analog.com>
:::::: CC: Jonathan Cameron <Jonathan.Cameron@huawei.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
