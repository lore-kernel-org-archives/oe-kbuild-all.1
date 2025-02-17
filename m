Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 967DD1494DF
	for <oe-kbuild-all@lists.linux.dev>; Mon, 17 Feb 2025 15:26:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739806015; cv=none; b=SQcXaxf4m/lqu025l6V9fu/NLvG9g5EMxdqYxtdeRiqdU6zaldweBa3+jvfOCUMrwLjMh2M3BoXMZ3paDWkfI/8/LTQbGWOZ4kDXv1M0gpMbdtX9ISsRe8SckZKGHThfeI63jfiycUCouzA4V82yF34KRR7Pcgf7J2LW1bocYDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739806015; c=relaxed/simple;
	bh=6MK/kiVc16jrKrtTt9lk600bvixwdhIApMa1zj69HsQ=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FQkNh8KxwrYR5iwN2i2TTzvF0AadVQXJ6l9HdP2zWOskb4ocWlZTebN+cHhEj6HzxzAkrVrwGaA3k+aWfnRsXKWfcOLLeQ7esYScvKNmFmf5agSBJJ2jAEZC0el1zBG5LgxYybo+oKa0iZige8Xl/JD/H4K9HOto2GsSL+iaJo0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=H8tTA9qB; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H8tTA9qB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739806013; x=1771342013;
  h=date:from:cc:subject:message-id:mime-version;
  bh=6MK/kiVc16jrKrtTt9lk600bvixwdhIApMa1zj69HsQ=;
  b=H8tTA9qBCAy4yVxhPWqpy1KCgqNZVaO4blWvhi3V9mfLj4G8nxmd+tzU
   DstZENWdrWQSYmRDxibG5Yat9A8XjylwU3goY/vTKnVoyBJJwTJW+KJJt
   GCDf/EVruo6pVbWyIX4FGZAmP2oMUJTzU1xgMYBDCvtAYdk8KwVsL1+5F
   Xhfhth70wqcnDi5CJ5tXMAlmYaVWggPFc/Pf3EqUbJa5Y5Km+k8PeH96X
   w2/kiZCXMMN6skGTzjwKijdRfGw+zYj6OWxBp4MaAcuwCU/7rsMR0NtkL
   UBrB8JzBRKL8Jt9JQjrS1ZwS/swFo2tp+hmff/hxW55tCanNAJWb/wL2u
   Q==;
X-CSE-ConnectionGUID: uQy0RJTiTmqvwY1Zy4IIlA==
X-CSE-MsgGUID: sjY6rZtBRh64/ZUYBIFy6w==
X-IronPort-AV: E=McAfee;i="6700,10204,11348"; a="44419784"
X-IronPort-AV: E=Sophos;i="6.13,293,1732608000"; 
   d="scan'208";a="44419784"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2025 07:26:52 -0800
X-CSE-ConnectionGUID: WjNVGvqESbSUnFl3hdjm9w==
X-CSE-MsgGUID: BN8XCM6xRb+d8cYeB91aYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,293,1732608000"; 
   d="scan'208";a="119150928"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 17 Feb 2025 07:26:52 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tk31F-001DHL-2M
	for oe-kbuild-all@lists.linux.dev;
	Mon, 17 Feb 2025 15:26:49 +0000
Date: Mon, 17 Feb 2025 23:26:38 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [intel-lts:pr/57 1/1] drivers/iio/dac/ad5758.c:585:22: warning:
 variable 'dc_dc_mode' set but not used
Message-ID: <202502172338.glcpjJ7B-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/linux-intel-lts.git pr/57
head:   6fe7458ff80d33a5dba8b386c88d33ffd2ccb47d
commit: edde945257e28104cf865d7d2b9b239f87d815d4 [1/1] iio: dac: ad5758: Modifications for new revision
config: x86_64-buildonly-randconfig-001-20250217 (https://download.01.org/0day-ci/archive/20250217/202502172338.glcpjJ7B-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250217/202502172338.glcpjJ7B-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502172338.glcpjJ7B-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/iio/dac/ad5758.c: In function 'ad5758_write_powerdown':
>> drivers/iio/dac/ad5758.c:585:22: warning: variable 'dc_dc_mode' set but not used [-Wunused-but-set-variable]
     585 |         unsigned int dc_dc_mode, dac_config_mode, val;
         |                      ^~~~~~~~~~


vim +/dc_dc_mode +585 drivers/iio/dac/ad5758.c

   577	
   578	static ssize_t ad5758_write_powerdown(struct iio_dev *indio_dev,
   579					      uintptr_t priv,
   580					      struct iio_chan_spec const *chan,
   581					      const char *buf, size_t len)
   582	{
   583		struct ad5758_state *st = iio_priv(indio_dev);
   584		bool pwr_down;
 > 585		unsigned int dc_dc_mode, dac_config_mode, val;
   586		unsigned long int dac_config_msk;
   587		int ret;
   588	
   589		ret = kstrtobool(buf, &pwr_down);
   590		if (ret)
   591			return ret;
   592	
   593		mutex_lock(&st->lock);
   594		if (pwr_down) {
   595			dc_dc_mode = AD5758_DCDC_MODE_POWER_OFF;
   596			val = 0;
   597		} else {
   598			dc_dc_mode = st->dc_dc_mode;
   599			val = 1;
   600		}
   601	
   602		dac_config_mode = AD5758_DAC_CONFIG_OUT_EN_MODE(val) |
   603				  AD5758_DAC_CONFIG_INT_EN_MODE(val);
   604		dac_config_msk = AD5758_DAC_CONFIG_OUT_EN_MSK |
   605				 AD5758_DAC_CONFIG_INT_EN_MSK;
   606	
   607		ret = ad5758_spi_write_mask(st, AD5758_DAC_CONFIG,
   608					    dac_config_msk,
   609					    dac_config_mode);
   610		if (ret < 0)
   611			goto err_unlock;
   612	
   613		st->pwr_down = pwr_down;
   614	
   615	err_unlock:
   616		mutex_unlock(&st->lock);
   617	
   618		return ret ? ret : len;
   619	}
   620	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
