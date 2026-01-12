Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C22B311C36
	for <oe-kbuild-all@lists.linux.dev>; Mon, 12 Jan 2026 20:01:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768248121; cv=none; b=UPvhSVo15AeYmXX4EnhNzr9Jp3oJDVQqAtSb5c91cQO5SSA9Sj8hIgIv74CC0UF3OIqrm+gQixF58diP3u9Fhahch83GJsN5+2NbYxkg/67ulb34voFwQENpOCNDlKYVUelBQ7pglZzT9GGivxUoqu5suxNPKJ8SeOBeMmiu0Bs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768248121; c=relaxed/simple;
	bh=kWKSRLmjyu1Ccg/o0fzvarupVYO9CnqQzYT6hkLCD1E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aCzZvFq81IwgStXLrAlL8jXpva84ny9Ne7tI4ewCVxdMfWk922jwplm01l3RFIcp96Zsg8v4eyM3nBhP0EX2mCFORiuvKgNSU0SzMITv+NFKI1H4BnLF8dgk9czSef8kr96VnygHAKh2/6vYHhx8REpb2gvsfSGKKRjwrNBDBB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=j5DuZpt6; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="j5DuZpt6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768248119; x=1799784119;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=kWKSRLmjyu1Ccg/o0fzvarupVYO9CnqQzYT6hkLCD1E=;
  b=j5DuZpt6p3gRM6pG6f2nrNIg8QpyVxjUw8R+t6v4qXZPbLgbtiA6BaQf
   j8mTgQcIe0g0T5+mREUpPxTWffqAWC+HSwV/rjfOL34NJF2M80OgpgdzH
   MWvifi48GhURhbavBhGTzXx8SG4XiKhx68ceZtConOjz1/zWEPoBB8T27
   0jVdy+wAzfN3K6uiqV32KBalS9GZ5C+M5cY9PtGThPe/t+sXvlSX4vqil
   urzLmot9elPANhyA5Ig+tiP32M6PVKK7HF0WU6VP+QXwJlL96APJUOu5i
   TtDkmMs6WEpf2SoNbXCX5tB2HV183FGqcyP77uyRm4WOXo7bXppts7LUP
   g==;
X-CSE-ConnectionGUID: O86ferZxS3yS3KUkYBe8iQ==
X-CSE-MsgGUID: ud6zi3hbTp69BOF8aD7zXw==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="80894224"
X-IronPort-AV: E=Sophos;i="6.21,221,1763452800"; 
   d="scan'208";a="80894224"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2026 12:01:58 -0800
X-CSE-ConnectionGUID: 30uJNCQYRvCepGFtu7BTGQ==
X-CSE-MsgGUID: oKM/SPFRR7uZkJjQqyfb4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,221,1763452800"; 
   d="scan'208";a="209253675"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 12 Jan 2026 12:01:52 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vfO6m-00000000DpA-3tJM;
	Mon, 12 Jan 2026 20:01:48 +0000
Date: Tue, 13 Jan 2026 04:01:12 +0800
From: kernel test robot <lkp@intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Mark Brown <broonie@kernel.org>,
	Varshini Rajendran <varshini.rajendran@microchip.com>,
	Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Sunny Luo <sunny.luo@amlogic.com>, Janne Grunau <j@jannau.net>,
	Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>,
	CL Wang <cl634@andestech.com>,
	Manikandan Muralidharan <manikandan.m@microchip.com>,
	David Lechner <dlechner@baylibre.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Jonas Gorski <jonas.gorski@gmail.com>, Hang Zhou <929513338@qq.com>,
	Jun Guo <jun.guo@cixtech.com>, Philipp Stanner <phasta@kernel.org>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Bartosz Golaszewski <brgl@kernel.org>,
	=?iso-8859-1?Q?Beno=EEt?= Monin <benoit.monin@bootlin.com>,
	Shiji Yang <yangshiji66@outlook.com>,
	James Clark <james.clark@linaro.org>,
	Jonathan Marek <jonathan@marek.ca>,
	Carlos Song <carlos.song@nxp.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	Xianwei Zhao <xianwei.zhao@amlogic.com>,
	Prajna Rajendra Kumar <prajna.rajendrakumar@microchip.com>,
	Sergio Perez Gonzalez <sperezglz@gmail.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Qianfeng Rong <rongqianfeng@vivo.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v1 4/4] spi: Drop duplicate device_set_node() call
Message-ID: <202601130336.1l5i5nlX-lkp@intel.com>
References: <20260108203004.3538449-5-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260108203004.3538449-5-andriy.shevchenko@linux.intel.com>

Hi Andy,

kernel test robot noticed the following build warnings:

[auto build test WARNING on broonie-spi/for-next]
[also build test WARNING on next-20260109]
[cannot apply to atorgue-stm32/stm32-next rockchip/for-next sunxi/sunxi/for-next linus/master v6.19-rc5]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Andy-Shevchenko/spi-Propagate-default-fwnode-to-the-SPI-controller-device/20260109-043406
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next
patch link:    https://lore.kernel.org/r/20260108203004.3538449-5-andriy.shevchenko%40linux.intel.com
patch subject: [PATCH v1 4/4] spi: Drop duplicate device_set_node() call
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20260113/202601130336.1l5i5nlX-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260113/202601130336.1l5i5nlX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601130336.1l5i5nlX-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/spi/spi-dln2.c: In function 'dln2_spi_probe':
>> drivers/spi/spi-dln2.c:685:24: warning: unused variable 'dev' [-Wunused-variable]
     685 |         struct device *dev = &pdev->dev;
         |                        ^~~


vim +/dev +685 drivers/spi/spi-dln2.c

3d8c0d749da326 Laurentiu Palcu 2014-12-08  679  
3d8c0d749da326 Laurentiu Palcu 2014-12-08  680  static int dln2_spi_probe(struct platform_device *pdev)
3d8c0d749da326 Laurentiu Palcu 2014-12-08  681  {
5ab7a7e37d2fe7 Yang Yingliang  2023-07-28  682  	struct spi_controller *host;
3d8c0d749da326 Laurentiu Palcu 2014-12-08  683  	struct dln2_spi *dln2;
3d8c0d749da326 Laurentiu Palcu 2014-12-08  684  	struct dln2_platform_data *pdata = dev_get_platdata(&pdev->dev);
83835fb07836ea Leonard Crestez 2016-04-15 @685  	struct device *dev = &pdev->dev;
3d8c0d749da326 Laurentiu Palcu 2014-12-08  686  	int ret;
3d8c0d749da326 Laurentiu Palcu 2014-12-08  687  
5ab7a7e37d2fe7 Yang Yingliang  2023-07-28  688  	host = spi_alloc_host(&pdev->dev, sizeof(*dln2));
5ab7a7e37d2fe7 Yang Yingliang  2023-07-28  689  	if (!host)
3d8c0d749da326 Laurentiu Palcu 2014-12-08  690  		return -ENOMEM;
3d8c0d749da326 Laurentiu Palcu 2014-12-08  691  
5ab7a7e37d2fe7 Yang Yingliang  2023-07-28  692  	platform_set_drvdata(pdev, host);
3d8c0d749da326 Laurentiu Palcu 2014-12-08  693  
5ab7a7e37d2fe7 Yang Yingliang  2023-07-28  694  	dln2 = spi_controller_get_devdata(host);
3d8c0d749da326 Laurentiu Palcu 2014-12-08  695  
3d8c0d749da326 Laurentiu Palcu 2014-12-08  696  	dln2->buf = devm_kmalloc(&pdev->dev, DLN2_SPI_BUF_SIZE, GFP_KERNEL);
3d8c0d749da326 Laurentiu Palcu 2014-12-08  697  	if (!dln2->buf) {
3d8c0d749da326 Laurentiu Palcu 2014-12-08  698  		ret = -ENOMEM;
5ab7a7e37d2fe7 Yang Yingliang  2023-07-28  699  		goto exit_free_host;
3d8c0d749da326 Laurentiu Palcu 2014-12-08  700  	}
3d8c0d749da326 Laurentiu Palcu 2014-12-08  701  
5ab7a7e37d2fe7 Yang Yingliang  2023-07-28  702  	dln2->host = host;
3d8c0d749da326 Laurentiu Palcu 2014-12-08  703  	dln2->pdev = pdev;
3d8c0d749da326 Laurentiu Palcu 2014-12-08  704  	dln2->port = pdata->port;
3d8c0d749da326 Laurentiu Palcu 2014-12-08  705  	/* cs/mode can never be 0xff, so the first transfer will set them */
3d8c0d749da326 Laurentiu Palcu 2014-12-08  706  	dln2->cs = 0xff;
3d8c0d749da326 Laurentiu Palcu 2014-12-08  707  	dln2->mode = 0xff;
3d8c0d749da326 Laurentiu Palcu 2014-12-08  708  
3d8c0d749da326 Laurentiu Palcu 2014-12-08  709  	/* disable SPI module before continuing with the setup */
3d8c0d749da326 Laurentiu Palcu 2014-12-08  710  	ret = dln2_spi_enable(dln2, false);
3d8c0d749da326 Laurentiu Palcu 2014-12-08  711  	if (ret < 0) {
3d8c0d749da326 Laurentiu Palcu 2014-12-08  712  		dev_err(&pdev->dev, "Failed to disable SPI module\n");
5ab7a7e37d2fe7 Yang Yingliang  2023-07-28  713  		goto exit_free_host;
3d8c0d749da326 Laurentiu Palcu 2014-12-08  714  	}
3d8c0d749da326 Laurentiu Palcu 2014-12-08  715  
5ab7a7e37d2fe7 Yang Yingliang  2023-07-28  716  	ret = dln2_spi_get_cs_num(dln2, &host->num_chipselect);
3d8c0d749da326 Laurentiu Palcu 2014-12-08  717  	if (ret < 0) {
3d8c0d749da326 Laurentiu Palcu 2014-12-08  718  		dev_err(&pdev->dev, "Failed to get number of CS pins\n");
5ab7a7e37d2fe7 Yang Yingliang  2023-07-28  719  		goto exit_free_host;
3d8c0d749da326 Laurentiu Palcu 2014-12-08  720  	}
3d8c0d749da326 Laurentiu Palcu 2014-12-08  721  
3d8c0d749da326 Laurentiu Palcu 2014-12-08  722  	ret = dln2_spi_get_speed_range(dln2,
5ab7a7e37d2fe7 Yang Yingliang  2023-07-28  723  				       &host->min_speed_hz,
5ab7a7e37d2fe7 Yang Yingliang  2023-07-28  724  				       &host->max_speed_hz);
3d8c0d749da326 Laurentiu Palcu 2014-12-08  725  	if (ret < 0) {
3d8c0d749da326 Laurentiu Palcu 2014-12-08  726  		dev_err(&pdev->dev, "Failed to read bus min/max freqs\n");
5ab7a7e37d2fe7 Yang Yingliang  2023-07-28  727  		goto exit_free_host;
3d8c0d749da326 Laurentiu Palcu 2014-12-08  728  	}
3d8c0d749da326 Laurentiu Palcu 2014-12-08  729  
3d8c0d749da326 Laurentiu Palcu 2014-12-08  730  	ret = dln2_spi_get_supported_frame_sizes(dln2,
5ab7a7e37d2fe7 Yang Yingliang  2023-07-28  731  						 &host->bits_per_word_mask);
3d8c0d749da326 Laurentiu Palcu 2014-12-08  732  	if (ret < 0) {
3d8c0d749da326 Laurentiu Palcu 2014-12-08  733  		dev_err(&pdev->dev, "Failed to read supported frame sizes\n");
5ab7a7e37d2fe7 Yang Yingliang  2023-07-28  734  		goto exit_free_host;
3d8c0d749da326 Laurentiu Palcu 2014-12-08  735  	}
3d8c0d749da326 Laurentiu Palcu 2014-12-08  736  
3d8c0d749da326 Laurentiu Palcu 2014-12-08  737  	ret = dln2_spi_cs_enable_all(dln2, true);
3d8c0d749da326 Laurentiu Palcu 2014-12-08  738  	if (ret < 0) {
3d8c0d749da326 Laurentiu Palcu 2014-12-08  739  		dev_err(&pdev->dev, "Failed to enable CS pins\n");
5ab7a7e37d2fe7 Yang Yingliang  2023-07-28  740  		goto exit_free_host;
3d8c0d749da326 Laurentiu Palcu 2014-12-08  741  	}
3d8c0d749da326 Laurentiu Palcu 2014-12-08  742  
5ab7a7e37d2fe7 Yang Yingliang  2023-07-28  743  	host->bus_num = -1;
5ab7a7e37d2fe7 Yang Yingliang  2023-07-28  744  	host->mode_bits = SPI_CPOL | SPI_CPHA;
5ab7a7e37d2fe7 Yang Yingliang  2023-07-28  745  	host->prepare_message = dln2_spi_prepare_message;
5ab7a7e37d2fe7 Yang Yingliang  2023-07-28  746  	host->transfer_one = dln2_spi_transfer_one;
5ab7a7e37d2fe7 Yang Yingliang  2023-07-28  747  	host->auto_runtime_pm = true;
3d8c0d749da326 Laurentiu Palcu 2014-12-08  748  
3d8c0d749da326 Laurentiu Palcu 2014-12-08  749  	/* enable SPI module, we're good to go */
3d8c0d749da326 Laurentiu Palcu 2014-12-08  750  	ret = dln2_spi_enable(dln2, true);
3d8c0d749da326 Laurentiu Palcu 2014-12-08  751  	if (ret < 0) {
3d8c0d749da326 Laurentiu Palcu 2014-12-08  752  		dev_err(&pdev->dev, "Failed to enable SPI module\n");
5ab7a7e37d2fe7 Yang Yingliang  2023-07-28  753  		goto exit_free_host;
3d8c0d749da326 Laurentiu Palcu 2014-12-08  754  	}
3d8c0d749da326 Laurentiu Palcu 2014-12-08  755  
3d8c0d749da326 Laurentiu Palcu 2014-12-08  756  	pm_runtime_set_autosuspend_delay(&pdev->dev,
3d8c0d749da326 Laurentiu Palcu 2014-12-08  757  					 DLN2_RPM_AUTOSUSPEND_TIMEOUT);
3d8c0d749da326 Laurentiu Palcu 2014-12-08  758  	pm_runtime_use_autosuspend(&pdev->dev);
3d8c0d749da326 Laurentiu Palcu 2014-12-08  759  	pm_runtime_set_active(&pdev->dev);
3d8c0d749da326 Laurentiu Palcu 2014-12-08  760  	pm_runtime_enable(&pdev->dev);
3d8c0d749da326 Laurentiu Palcu 2014-12-08  761  
5ab7a7e37d2fe7 Yang Yingliang  2023-07-28  762  	ret = devm_spi_register_controller(&pdev->dev, host);
3d8c0d749da326 Laurentiu Palcu 2014-12-08  763  	if (ret < 0) {
5ab7a7e37d2fe7 Yang Yingliang  2023-07-28  764  		dev_err(&pdev->dev, "Failed to register host\n");
3d8c0d749da326 Laurentiu Palcu 2014-12-08  765  		goto exit_register;
3d8c0d749da326 Laurentiu Palcu 2014-12-08  766  	}
3d8c0d749da326 Laurentiu Palcu 2014-12-08  767  
3d8c0d749da326 Laurentiu Palcu 2014-12-08  768  	return ret;
3d8c0d749da326 Laurentiu Palcu 2014-12-08  769  
3d8c0d749da326 Laurentiu Palcu 2014-12-08  770  exit_register:
3d8c0d749da326 Laurentiu Palcu 2014-12-08  771  	pm_runtime_disable(&pdev->dev);
3d8c0d749da326 Laurentiu Palcu 2014-12-08  772  	pm_runtime_set_suspended(&pdev->dev);
3d8c0d749da326 Laurentiu Palcu 2014-12-08  773  
3d8c0d749da326 Laurentiu Palcu 2014-12-08  774  	if (dln2_spi_enable(dln2, false) < 0)
3d8c0d749da326 Laurentiu Palcu 2014-12-08  775  		dev_err(&pdev->dev, "Failed to disable SPI module\n");
5ab7a7e37d2fe7 Yang Yingliang  2023-07-28  776  exit_free_host:
5ab7a7e37d2fe7 Yang Yingliang  2023-07-28  777  	spi_controller_put(host);
3d8c0d749da326 Laurentiu Palcu 2014-12-08  778  
3d8c0d749da326 Laurentiu Palcu 2014-12-08  779  	return ret;
3d8c0d749da326 Laurentiu Palcu 2014-12-08  780  }
3d8c0d749da326 Laurentiu Palcu 2014-12-08  781  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
