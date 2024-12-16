Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C55313D502
	for <oe-kbuild-all@lists.linux.dev>; Mon, 16 Dec 2024 08:15:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734336940; cv=none; b=tXeafTb8quanflOx78XcRP2b4zqwRwAGgCm7QsgcnCCmAv2g0GKZ2AlLkZIrXWTiwP9kmW5paUgVajefI+f9vl9eEKYhhywWHNt5cGR9vdaZpXRnG4+PiV7Ta6tWneTd6njlqff3Dotko/FCLslh7zB+G6nkkqhpX25dvkwvKcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734336940; c=relaxed/simple;
	bh=ILnwtwjIrJE8a8EMG8oQsjw7vZG1p/W1xmOrNnnM4Qc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=clZ3Y/KHVhgmzyakH93xdPVjbgN5Ylbk5Tbgq2UDOLuS2+cMZ9JEm/K0KDyij/Ow6FNXgtVpcK18JSOYv1D4DVY4tF5hX78aCk5YnV0WWj8xjUg+n4gBFVZc6TSv/PROH1oJVAmPOkr2je/JiKYvuGyOqBab6UvNxodBu3bSCnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VRHANzvL; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VRHANzvL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734336939; x=1765872939;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ILnwtwjIrJE8a8EMG8oQsjw7vZG1p/W1xmOrNnnM4Qc=;
  b=VRHANzvLzeFbSs0OqzbiWfTuPHpXuH7Fw/RuXzDl6f4of7EV5m87zFvB
   feLucH25+OARraBKdx6kz+nicQtzHnqNDISqWh+RtXJwnugWfUJwYqDEe
   RTxL5hCvSE0/V1wX8av9H5rwN7O7YB294L33S8pqEkNIqnv+oJ3tiWJza
   q8TqFjEoEPWxVqMMpcYh9SdY2QHKlLVlB2KB28dwMhriWI4YR5yYk/29w
   HuKUWRywKdps9C8ZkS41zZfLu99nFKvSSdONiJyKjAf0gtIzvZWJvEl4/
   CdZIFPlIxD8Y2+bPZbyU5JYxrzwp9ycBNyZmdov3b3G+sN/y9tHIpd/Dv
   Q==;
X-CSE-ConnectionGUID: M93qHgkiS5unSfK3lJuxTA==
X-CSE-MsgGUID: ZVqpBC7dQb+wl7TOVDdPgg==
X-IronPort-AV: E=McAfee;i="6700,10204,11287"; a="34849106"
X-IronPort-AV: E=Sophos;i="6.12,238,1728975600"; 
   d="scan'208";a="34849106"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2024 00:15:38 -0800
X-CSE-ConnectionGUID: wMOrLi+gRLi0jxmRfdeoRw==
X-CSE-MsgGUID: cBzWh78cTMyMC3pwWZfx/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="101697799"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 16 Dec 2024 00:15:37 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tN6GN-000E6a-0S;
	Mon, 16 Dec 2024 08:15:35 +0000
Date: Mon, 16 Dec 2024 16:15:10 +0800
From: kernel test robot <lkp@intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [morimoto:sound-new-daifmt-20241216 13/44]
 sound/soc/sunxi/sun8i-codec-analog.c:400:25: error: 'dev' undeclared; did
 you mean 'cdev'?
Message-ID: <202412161652.L518x0Gt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/morimoto/linux sound-new-daifmt-20241216
head:   3593000c508ad86b18f89bca8b4e6ae589ac9529
commit: 48f91ba23b46ee9c33a5459a4e9aea728461ee7d [13/44] ASoC: error message cleanup (snd_soc_dapm_new_controls())
config: arm-randconfig-002-20241216 (https://download.01.org/0day-ci/archive/20241216/202412161652.L518x0Gt-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241216/202412161652.L518x0Gt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412161652.L518x0Gt-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/device.h:15,
                    from include/linux/platform_device.h:13,
                    from sound/soc/sunxi/sun8i-codec-analog.c:13:
   sound/soc/sunxi/sun8i-codec-analog.c: In function 'sun8i_codec_add_headphone':
>> sound/soc/sunxi/sun8i-codec-analog.c:400:25: error: 'dev' undeclared (first use in this function); did you mean 'cdev'?
     400 |                 dev_err(dev, "Failed to add Headphone controls: %d\n", ret);
         |                         ^~~
   include/linux/dev_printk.h:110:25: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                         ^~~
   sound/soc/sunxi/sun8i-codec-analog.c:400:17: note: in expansion of macro 'dev_err'
     400 |                 dev_err(dev, "Failed to add Headphone controls: %d\n", ret);
         |                 ^~~~~~~
   sound/soc/sunxi/sun8i-codec-analog.c:400:25: note: each undeclared identifier is reported only once for each function it appears in
     400 |                 dev_err(dev, "Failed to add Headphone controls: %d\n", ret);
         |                         ^~~
   include/linux/dev_printk.h:110:25: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                         ^~~
   sound/soc/sunxi/sun8i-codec-analog.c:400:17: note: in expansion of macro 'dev_err'
     400 |                 dev_err(dev, "Failed to add Headphone controls: %d\n", ret);
         |                 ^~~~~~~
   sound/soc/sunxi/sun8i-codec-analog.c: In function 'sun8i_codec_add_linein':
   sound/soc/sunxi/sun8i-codec-analog.c:481:25: error: 'dev' undeclared (first use in this function); did you mean 'cdev'?
     481 |                 dev_err(dev, "Failed to add Line In controls: %d\n", ret);
         |                         ^~~
   include/linux/dev_printk.h:110:25: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                         ^~~
   sound/soc/sunxi/sun8i-codec-analog.c:481:17: note: in expansion of macro 'dev_err'
     481 |                 dev_err(dev, "Failed to add Line In controls: %d\n", ret);
         |                 ^~~~~~~
   sound/soc/sunxi/sun8i-codec-analog.c: In function 'sun8i_codec_add_lineout':
   sound/soc/sunxi/sun8i-codec-analog.c:559:25: error: 'dev' undeclared (first use in this function); did you mean 'cdev'?
     559 |                 dev_err(dev, "Failed to add Line Out controls: %d\n", ret);
         |                         ^~~
   include/linux/dev_printk.h:110:25: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                         ^~~
   sound/soc/sunxi/sun8i-codec-analog.c:559:17: note: in expansion of macro 'dev_err'
     559 |                 dev_err(dev, "Failed to add Line Out controls: %d\n", ret);
         |                 ^~~~~~~
   sound/soc/sunxi/sun8i-codec-analog.c: In function 'sun8i_codec_add_mic2':
   sound/soc/sunxi/sun8i-codec-analog.c:621:25: error: 'dev' undeclared (first use in this function); did you mean 'cdev'?
     621 |                 dev_err(dev, "Failed to add MIC2 controls: %d\n", ret);
         |                         ^~~
   include/linux/dev_printk.h:110:25: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                         ^~~
   sound/soc/sunxi/sun8i-codec-analog.c:621:17: note: in expansion of macro 'dev_err'
     621 |                 dev_err(dev, "Failed to add MIC2 controls: %d\n", ret);
         |                 ^~~~~~~
   sound/soc/sunxi/sun8i-codec-analog.c: In function 'sun8i_codec_analog_add_mixer':
   sound/soc/sunxi/sun8i-codec-analog.c:694:25: error: 'dev' undeclared (first use in this function); did you mean 'cdev'?
     694 |                 dev_err(dev, "Failed to add Mixer DAPM routes: %d\n", ret);
         |                         ^~~
   include/linux/dev_printk.h:110:25: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                         ^~~
   sound/soc/sunxi/sun8i-codec-analog.c:694:17: note: in expansion of macro 'dev_err'
     694 |                 dev_err(dev, "Failed to add Mixer DAPM routes: %d\n", ret);
         |                 ^~~~~~~


vim +400 sound/soc/sunxi/sun8i-codec-analog.c

ba2ff3027b5ab4a Chen-Yu Tsai      2016-11-12  390  
ba2ff3027b5ab4a Chen-Yu Tsai      2016-11-12  391  static int sun8i_codec_add_headphone(struct snd_soc_component *cmpnt)
ba2ff3027b5ab4a Chen-Yu Tsai      2016-11-12  392  {
ba2ff3027b5ab4a Chen-Yu Tsai      2016-11-12  393  	struct snd_soc_dapm_context *dapm = snd_soc_component_get_dapm(cmpnt);
ba2ff3027b5ab4a Chen-Yu Tsai      2016-11-12  394  	int ret;
ba2ff3027b5ab4a Chen-Yu Tsai      2016-11-12  395  
ba2ff3027b5ab4a Chen-Yu Tsai      2016-11-12  396  	ret = snd_soc_add_component_controls(cmpnt,
ba2ff3027b5ab4a Chen-Yu Tsai      2016-11-12  397  					     sun8i_codec_headphone_controls,
ba2ff3027b5ab4a Chen-Yu Tsai      2016-11-12  398  					     ARRAY_SIZE(sun8i_codec_headphone_controls));
ba2ff3027b5ab4a Chen-Yu Tsai      2016-11-12  399  	if (ret) {
ba2ff3027b5ab4a Chen-Yu Tsai      2016-11-12 @400  		dev_err(dev, "Failed to add Headphone controls: %d\n", ret);
ba2ff3027b5ab4a Chen-Yu Tsai      2016-11-12  401  		return ret;
ba2ff3027b5ab4a Chen-Yu Tsai      2016-11-12  402  	}
ba2ff3027b5ab4a Chen-Yu Tsai      2016-11-12  403  
ba2ff3027b5ab4a Chen-Yu Tsai      2016-11-12  404  	ret = snd_soc_dapm_new_controls(dapm, sun8i_codec_headphone_widgets,
ba2ff3027b5ab4a Chen-Yu Tsai      2016-11-12  405  					ARRAY_SIZE(sun8i_codec_headphone_widgets));
48f91ba23b46ee9 Kuninori Morimoto 2024-09-10  406  	if (ret)
ba2ff3027b5ab4a Chen-Yu Tsai      2016-11-12  407  		return ret;
ba2ff3027b5ab4a Chen-Yu Tsai      2016-11-12  408  
ba2ff3027b5ab4a Chen-Yu Tsai      2016-11-12  409  	ret = snd_soc_dapm_add_routes(dapm, sun8i_codec_headphone_routes,
ba2ff3027b5ab4a Chen-Yu Tsai      2016-11-12  410  				      ARRAY_SIZE(sun8i_codec_headphone_routes));
ba2ff3027b5ab4a Chen-Yu Tsai      2016-11-12  411  	if (ret) {
ba2ff3027b5ab4a Chen-Yu Tsai      2016-11-12  412  		dev_err(dev, "Failed to add Headphone DAPM routes: %d\n", ret);
ba2ff3027b5ab4a Chen-Yu Tsai      2016-11-12  413  		return ret;
ba2ff3027b5ab4a Chen-Yu Tsai      2016-11-12  414  	}
ba2ff3027b5ab4a Chen-Yu Tsai      2016-11-12  415  
ba2ff3027b5ab4a Chen-Yu Tsai      2016-11-12  416  	return 0;
ba2ff3027b5ab4a Chen-Yu Tsai      2016-11-12  417  }
ba2ff3027b5ab4a Chen-Yu Tsai      2016-11-12  418  

:::::: The code at line 400 was first introduced by commit
:::::: ba2ff3027b5ab4a96b9d2832822311c3ccbf3011 ASoC: sunxi: Add support for A23/A33/H3 codec's analog path controls

:::::: TO: Chen-Yu Tsai <wens@csie.org>
:::::: CC: Mark Brown <broonie@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
