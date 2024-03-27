Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03840171AA
	for <oe-kbuild-all@lists.linux.dev>; Wed, 27 Mar 2024 01:01:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711501273; cv=none; b=bHeFGLQZ76cBaYqo5unpoNCwkgArVb3JFQrLT8kqArYa7TG9ayQPZrcLqzd5lSnRtYe9rOK/A/O8dH9BoZL9OEmzbF3hvCeqxWZ2HNQPjnBoAGQeNzChljFES5xBnthdlkKZot8KT4ayoVzOFYn6IKOEe6jeXfP7SuPHX2G8Udg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711501273; c=relaxed/simple;
	bh=8mRiUXcP75lcRj/m4FiTqHh2YfJqtd2st2rjUlF0ygg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dLkGnRJVdtCUw4rH8KOP7j2cQoSiDFRYIzNRTQZpJZY9ZD/c6JKYOAdYllICCPgrj4YyLjD2LATOHBBp9b35SKTynqh8AK5+ro2zBdiMF+Lzq5UTyl34CjeLjKk43jBg9uFsoPFZA1Wz+tLPB2s1cVOAkt+ECAt/5AD4VHDjomc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=f8CyT73V; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="f8CyT73V"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711501270; x=1743037270;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8mRiUXcP75lcRj/m4FiTqHh2YfJqtd2st2rjUlF0ygg=;
  b=f8CyT73VbpgmxRmrFjow44pAcHHY+PuQl3v2SQlLs+stiHH82FM+w0Km
   tx66INRNNPv7FC0ATdVmNVX5fKbXsU6Vl/B5Q30rBRp+s5U/U7gnxQEMD
   uxj5Av7+Iv6DOBBjS7zEnNOVvPUgu+BYPEHCxuI7m0WCPLy3EXykCAI+h
   9zuI83EjOHRTW5y7ilwS2PnnLsBux356VofN1tOYfsADoT2CngwAMRKeE
   W7DvQlm1Vrz1Kvc0VHErDr14FcluAddc2LJEzIETGe01BYXyI7cFFTWPQ
   YiB6pWliPtfxkApR9jkjK3hiab5OtW4RjJZ8mFQo82Cp5UbzZxfh+368R
   Q==;
X-CSE-ConnectionGUID: tNcYk3wKS/myXEv4CNNqbg==
X-CSE-MsgGUID: ePgcqehFRt+yDzRxopNuiw==
X-IronPort-AV: E=McAfee;i="6600,9927,11025"; a="6439393"
X-IronPort-AV: E=Sophos;i="6.07,157,1708416000"; 
   d="scan'208";a="6439393"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2024 18:01:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,157,1708416000"; 
   d="scan'208";a="20788223"
Received: from lkp-server01.sh.intel.com (HELO be39aa325d23) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 26 Mar 2024 18:01:07 -0700
Received: from kbuild by be39aa325d23 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rpHf6-0000ai-1V;
	Wed, 27 Mar 2024 01:01:04 +0000
Date: Wed, 27 Mar 2024 09:01:01 +0800
From: kernel test robot <lkp@intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Mark Brown <broonie@kernel.org>
Subject: [broonie-ci:fileECoqy0 5/6]
 sound/soc/generic/simple-card-utils.c:755:20: error: 'struct
 snd_soc_jack_gpio' has no member named 'gpio'
Message-ID: <202403270859.Ew6NATlW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/ci.git fileECoqy0
head:   3c398a2eb9081a10c34a40701159a34319a35f19
commit: c81737adb6536b26ebf9176179b3551cb33be4c0 [5/6] ASoC: soc-jack: Get rid of legacy GPIO support
config: i386-buildonly-randconfig-003-20240325 (https://download.01.org/0day-ci/archive/20240327/202403270859.Ew6NATlW-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240327/202403270859.Ew6NATlW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403270859.Ew6NATlW-lkp@intel.com/

All errors (new ones prefixed by >>):

   sound/soc/generic/simple-card-utils.c: In function 'simple_util_init_jack':
>> sound/soc/generic/simple-card-utils.c:755:20: error: 'struct snd_soc_jack_gpio' has no member named 'gpio'
     755 |         sjack->gpio.gpio = -ENOENT;
         |                    ^


vim +755 sound/soc/generic/simple-card-utils.c

90194281ee8b01f Paul Cercueil     2019-04-26  738  
b5a95c5bf6d6953 Kuninori Morimoto 2023-09-11  739  int simple_util_init_jack(struct snd_soc_card *card,
b4b7de99c6da461 Kuninori Morimoto 2023-09-11  740  			  struct simple_util_jack *sjack,
764aafdb985b182 Shengjiu Wang     2020-07-15  741  			  int is_hp, char *prefix,
764aafdb985b182 Shengjiu Wang     2020-07-15  742  			  char *pin)
62c2c9fcac4341d Katsuhiro Suzuki  2018-06-11  743  {
62c2c9fcac4341d Katsuhiro Suzuki  2018-06-11  744  	struct device *dev = card->dev;
355beeed9319cf3 Dmitry Torokhov   2022-09-06  745  	struct gpio_desc *desc;
62c2c9fcac4341d Katsuhiro Suzuki  2018-06-11  746  	char prop[128];
62c2c9fcac4341d Katsuhiro Suzuki  2018-06-11  747  	char *pin_name;
62c2c9fcac4341d Katsuhiro Suzuki  2018-06-11  748  	char *gpio_name;
62c2c9fcac4341d Katsuhiro Suzuki  2018-06-11  749  	int mask;
355beeed9319cf3 Dmitry Torokhov   2022-09-06  750  	int error;
62c2c9fcac4341d Katsuhiro Suzuki  2018-06-11  751  
62c2c9fcac4341d Katsuhiro Suzuki  2018-06-11  752  	if (!prefix)
62c2c9fcac4341d Katsuhiro Suzuki  2018-06-11  753  		prefix = "";
62c2c9fcac4341d Katsuhiro Suzuki  2018-06-11  754  
62c2c9fcac4341d Katsuhiro Suzuki  2018-06-11 @755  	sjack->gpio.gpio = -ENOENT;
62c2c9fcac4341d Katsuhiro Suzuki  2018-06-11  756  
62c2c9fcac4341d Katsuhiro Suzuki  2018-06-11  757  	if (is_hp) {
355beeed9319cf3 Dmitry Torokhov   2022-09-06  758  		snprintf(prop, sizeof(prop), "%shp-det", prefix);
764aafdb985b182 Shengjiu Wang     2020-07-15  759  		pin_name	= pin ? pin : "Headphones";
62c2c9fcac4341d Katsuhiro Suzuki  2018-06-11  760  		gpio_name	= "Headphone detection";
62c2c9fcac4341d Katsuhiro Suzuki  2018-06-11  761  		mask		= SND_JACK_HEADPHONE;
62c2c9fcac4341d Katsuhiro Suzuki  2018-06-11  762  	} else {
355beeed9319cf3 Dmitry Torokhov   2022-09-06  763  		snprintf(prop, sizeof(prop), "%smic-det", prefix);
764aafdb985b182 Shengjiu Wang     2020-07-15  764  		pin_name	= pin ? pin : "Mic Jack";
62c2c9fcac4341d Katsuhiro Suzuki  2018-06-11  765  		gpio_name	= "Mic detection";
62c2c9fcac4341d Katsuhiro Suzuki  2018-06-11  766  		mask		= SND_JACK_MICROPHONE;
62c2c9fcac4341d Katsuhiro Suzuki  2018-06-11  767  	}
62c2c9fcac4341d Katsuhiro Suzuki  2018-06-11  768  
355beeed9319cf3 Dmitry Torokhov   2022-09-06  769  	desc = gpiod_get_optional(dev, prop, GPIOD_IN);
355beeed9319cf3 Dmitry Torokhov   2022-09-06  770  	error = PTR_ERR_OR_ZERO(desc);
355beeed9319cf3 Dmitry Torokhov   2022-09-06  771  	if (error)
355beeed9319cf3 Dmitry Torokhov   2022-09-06  772  		return error;
355beeed9319cf3 Dmitry Torokhov   2022-09-06  773  
355beeed9319cf3 Dmitry Torokhov   2022-09-06  774  	if (desc) {
355beeed9319cf3 Dmitry Torokhov   2022-09-06  775  		error = gpiod_set_consumer_name(desc, gpio_name);
355beeed9319cf3 Dmitry Torokhov   2022-09-06  776  		if (error)
355beeed9319cf3 Dmitry Torokhov   2022-09-06  777  			return error;
62c2c9fcac4341d Katsuhiro Suzuki  2018-06-11  778  
62c2c9fcac4341d Katsuhiro Suzuki  2018-06-11  779  		sjack->pin.pin		= pin_name;
62c2c9fcac4341d Katsuhiro Suzuki  2018-06-11  780  		sjack->pin.mask		= mask;
62c2c9fcac4341d Katsuhiro Suzuki  2018-06-11  781  
62c2c9fcac4341d Katsuhiro Suzuki  2018-06-11  782  		sjack->gpio.name	= gpio_name;
62c2c9fcac4341d Katsuhiro Suzuki  2018-06-11  783  		sjack->gpio.report	= mask;
355beeed9319cf3 Dmitry Torokhov   2022-09-06  784  		sjack->gpio.desc	= desc;
62c2c9fcac4341d Katsuhiro Suzuki  2018-06-11  785  		sjack->gpio.debounce_time = 150;
62c2c9fcac4341d Katsuhiro Suzuki  2018-06-11  786  
19aed2d6cdb72a7 Akihiko Odaki     2022-04-08  787  		snd_soc_card_jack_new_pins(card, pin_name, mask, &sjack->jack,
62c2c9fcac4341d Katsuhiro Suzuki  2018-06-11  788  					   &sjack->pin, 1);
62c2c9fcac4341d Katsuhiro Suzuki  2018-06-11  789  
355beeed9319cf3 Dmitry Torokhov   2022-09-06  790  		snd_soc_jack_add_gpios(&sjack->jack, 1, &sjack->gpio);
62c2c9fcac4341d Katsuhiro Suzuki  2018-06-11  791  	}
62c2c9fcac4341d Katsuhiro Suzuki  2018-06-11  792  
62c2c9fcac4341d Katsuhiro Suzuki  2018-06-11  793  	return 0;
62c2c9fcac4341d Katsuhiro Suzuki  2018-06-11  794  }
b5a95c5bf6d6953 Kuninori Morimoto 2023-09-11  795  EXPORT_SYMBOL_GPL(simple_util_init_jack);
62c2c9fcac4341d Katsuhiro Suzuki  2018-06-11  796  

:::::: The code at line 755 was first introduced by commit
:::::: 62c2c9fcac4341d306dda4cf400b77e7e124480a ASoC: simple-card-utils: move hp and mic detect gpios from simple-card

:::::: TO: Katsuhiro Suzuki <suzuki.katsuhiro@socionext.com>
:::::: CC: Mark Brown <broonie@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
