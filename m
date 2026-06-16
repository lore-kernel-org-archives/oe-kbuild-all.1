Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBCAE4657C2
	for <oe-kbuild-all@lists.linux.dev>; Tue, 16 Jun 2026 18:47:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781635627; cv=none; b=mPm+t1wrsoFc0xW3Z1xHjrOD0K1zSWqDgic2vjs67v5aDhofP7HrQD7wk1IswOt4ETiL5Z+tbE6XRfhsXW0fmSRcNO/+J6ErmkvhAUJ5Rj/2oASBBAjTaPcgI8xlBZRtKUpjORDWaoFSGyc53nr3I50jlPrhQry5DIx0M2r7oDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781635627; c=relaxed/simple;
	bh=a0lUA4y/EWanNH6n4s1lRArsaHcERmo6OqRRvbS7bNU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=E4wTwwu+y1+3K6d5EmL8nPiP2zP6V86Jv/J/wsMVr1AnBdZELR/GLYO1pkBgIzSaXnqenzej4J46zMB6rVd1JX1koEUwI564oYkPZyUZNE1bTdmg/hYqOCZyESU1f2vZqv/jPgyt9GAV8bFiBQ1M8KNHxdQdf4vEHXDnOqGitt0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LDbvfYmJ; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LDbvfYmJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781635626; x=1813171626;
  h=date:from:to:cc:subject:message-id;
  bh=a0lUA4y/EWanNH6n4s1lRArsaHcERmo6OqRRvbS7bNU=;
  b=LDbvfYmJ0aauRqdG3j/v3v64A8jFxar+zMZKFC/iYa1jmNFna0pWjoZ3
   M1QjeeKt0KRQn/y8i5SefwLoErFDaJKP50XdsbBGb7s96IbQND8sDo6Nb
   P9mxBxnF7ya994ItoX83PwEjF/qA5SErbtQ++EoKIEZ87grlBNM0wtANO
   QZf4gC7EKeVDJ8BdSIKLjLhGt5zia3LfY+tuAcUAbOdQjAqJcGH1Qd64B
   xER+6dtqHF9lqasO5pHSkV1IF8ruWvRq3vR7wND5SKM1Z5iXE/X2GxHjB
   q4PTtyfF5+MqHS35C2A3tN9ZdfdVP6MphoqKDmFwMnfRQi40aVUJ9sOzm
   A==;
X-CSE-ConnectionGUID: Mzbuf91NRwiAXFfQZiwmkA==
X-CSE-MsgGUID: 7c8UtzotTPqo8NIrwWQfjQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11819"; a="93794838"
X-IronPort-AV: E=Sophos;i="6.24,208,1774335600"; 
   d="scan'208";a="93794838"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2026 11:47:03 -0700
X-CSE-ConnectionGUID: beGg7eFBQrSpOf1iBXTFiw==
X-CSE-MsgGUID: X6DXBrhfR6KFey41qgycRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,208,1774335600"; 
   d="scan'208";a="247932840"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by orviesa009.jf.intel.com with ESMTP; 16 Jun 2026 11:47:02 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wZYoN-000000005AT-32Qk;
	Tue, 16 Jun 2026 18:46:59 +0000
Date: Tue, 16 Jun 2026 20:46:48 +0200
From: kernel test robot <lkp@intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [morimoto:sound-cleanup-2026-06-16 322/326]
 sound/soc/soc-devres.c:16:9: error: implicit declaration of function
 'snd_soc_unregister_component_by_driver'; did you mean
 'snd_soc_component_to_driver'?
Message-ID: <202606162027.yEULXfYF-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/morimoto/linux sound-cleanup-2026-06-16
head:   5ce50ac7d0a59c6fb15e1baa7e6824ac096fe092
commit: 05b5b2a6efd5a6e54abc6f45325da66dd0680510 [322/326] ASoC: soc-component: remove compatible definition
config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20260616/202606162027.yEULXfYF-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260616/202606162027.yEULXfYF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606162027.yEULXfYF-lkp@intel.com/

All errors (new ones prefixed by >>):

   sound/soc/soc-devres.c: In function 'devm_component_release':
>> sound/soc/soc-devres.c:16:9: error: implicit declaration of function 'snd_soc_unregister_component_by_driver'; did you mean 'snd_soc_component_to_driver'? [-Wimplicit-function-declaration]
      16 |         snd_soc_unregister_component_by_driver(dev, *cmpnt_drv);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |         snd_soc_component_to_driver
   sound/soc/soc-devres.c: In function 'devm_snd_soc_component_register5':
>> sound/soc/soc-devres.c:40:15: error: implicit declaration of function 'snd_soc_register_component'; did you mean 'snd_soc_dai_to_component'? [-Wimplicit-function-declaration]
      40 |         ret = snd_soc_register_component(dev, cmpnt_drv, dai_drv, num_dai, priv);
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~~
         |               snd_soc_dai_to_component
--
>> drivers/soundwire/amd_manager.c:900:10: error: 'const struct snd_soc_component_driver' has no member named 'name'
     900 |         .name = "soundwire",
         |          ^~~~
--
>> drivers/soundwire/intel.c:1010:10: error: 'const struct snd_soc_component_driver' has no member named 'name'
    1010 |         .name                   = "soundwire",
         |          ^~~~
--
>> drivers/soundwire/intel_ace2x.c:949:10: error: 'const struct snd_soc_component_driver' has no member named 'name'
     949 |         .name                   = "soundwire",
         |          ^~~~
--
>> sound/soc/codecs/rt5677.c:5191:10: error: 'const struct snd_soc_component_driver' has no member named 'name'
    5191 |         .name                   = RT5677_DRV_NAME,
         |          ^~~~
--
>> sound/soc/codecs/rt5677-spi.c:398:10: error: 'const struct snd_soc_component_driver' has no member named 'name'
     398 |         .name                   = DRV_NAME,
         |          ^~~~
--
>> sound/soc/codecs/ts3a227e.c:275:10: error: 'const struct snd_soc_component_driver' has no member named 'name'
     275 |         .name = "ti,ts3a227e",
         |          ^~~~
--
   sound/soc/sof/pcm.c: In function 'snd_sof_new_platform_drv':
>> sound/soc/sof/pcm.c:847:11: error: 'struct snd_soc_component_driver' has no member named 'name'
     847 |         pd->name = "sof-audio-component";
         |           ^~


vim +16 sound/soc/soc-devres.c

a0b03a616b08cf Mark Brown        2013-09-04  11  
a0b03a616b08cf Mark Brown        2013-09-04  12  static void devm_component_release(struct device *dev, void *res)
a0b03a616b08cf Mark Brown        2013-09-04  13  {
58f30150ffd6d9 Maxime Ripard     2020-07-07  14  	const struct snd_soc_component_driver **cmpnt_drv = res;
58f30150ffd6d9 Maxime Ripard     2020-07-07  15  
58f30150ffd6d9 Maxime Ripard     2020-07-07 @16  	snd_soc_unregister_component_by_driver(dev, *cmpnt_drv);
a0b03a616b08cf Mark Brown        2013-09-04  17  }
a0b03a616b08cf Mark Brown        2013-09-04  18  
a0b03a616b08cf Mark Brown        2013-09-04  19  /**
5596780b93cb79 Kuninori Morimoto 2026-06-03  20   * devm_snd_soc_component_register - resource managed component registration
a0b03a616b08cf Mark Brown        2013-09-04  21   * @dev: Device used to manage component
a0b03a616b08cf Mark Brown        2013-09-04  22   * @cmpnt_drv: Component driver
a0b03a616b08cf Mark Brown        2013-09-04  23   * @dai_drv: DAI driver
a0b03a616b08cf Mark Brown        2013-09-04  24   * @num_dai: Number of DAIs to register
a0b03a616b08cf Mark Brown        2013-09-04  25   *
a0b03a616b08cf Mark Brown        2013-09-04  26   * Register a component with automatic unregistration when the device is
a0b03a616b08cf Mark Brown        2013-09-04  27   * unregistered.
a0b03a616b08cf Mark Brown        2013-09-04  28   */
5596780b93cb79 Kuninori Morimoto 2026-06-03  29  int devm_snd_soc_component_register5(struct device *dev,
a0b03a616b08cf Mark Brown        2013-09-04  30  			 const struct snd_soc_component_driver *cmpnt_drv,
eb78d61d1569f8 Kuninori Morimoto 2026-06-03  31  			 struct snd_soc_dai_driver *dai_drv, int num_dai, void *priv)
a0b03a616b08cf Mark Brown        2013-09-04  32  {
58f30150ffd6d9 Maxime Ripard     2020-07-07  33  	const struct snd_soc_component_driver **ptr;
a0b03a616b08cf Mark Brown        2013-09-04  34  	int ret;
a0b03a616b08cf Mark Brown        2013-09-04  35  
a0b03a616b08cf Mark Brown        2013-09-04  36  	ptr = devres_alloc(devm_component_release, sizeof(*ptr), GFP_KERNEL);
a0b03a616b08cf Mark Brown        2013-09-04  37  	if (!ptr)
a0b03a616b08cf Mark Brown        2013-09-04  38  		return -ENOMEM;
a0b03a616b08cf Mark Brown        2013-09-04  39  
eb78d61d1569f8 Kuninori Morimoto 2026-06-03 @40  	ret = snd_soc_register_component(dev, cmpnt_drv, dai_drv, num_dai, priv);
a0b03a616b08cf Mark Brown        2013-09-04  41  	if (ret == 0) {
58f30150ffd6d9 Maxime Ripard     2020-07-07  42  		*ptr = cmpnt_drv;
a0b03a616b08cf Mark Brown        2013-09-04  43  		devres_add(dev, ptr);
a0b03a616b08cf Mark Brown        2013-09-04  44  	} else {
a0b03a616b08cf Mark Brown        2013-09-04  45  		devres_free(ptr);
a0b03a616b08cf Mark Brown        2013-09-04  46  	}
a0b03a616b08cf Mark Brown        2013-09-04  47  
a0b03a616b08cf Mark Brown        2013-09-04  48  	return ret;
a0b03a616b08cf Mark Brown        2013-09-04  49  }
5596780b93cb79 Kuninori Morimoto 2026-06-03  50  EXPORT_SYMBOL_GPL(devm_snd_soc_component_register5);
eb78d61d1569f8 Kuninori Morimoto 2026-06-03  51  

:::::: The code at line 16 was first introduced by commit
:::::: 58f30150ffd6d95efa524ff05bbcee4e95bfa870 ASoC: core: Remove only the registered component in devm functions

:::::: TO: Maxime Ripard <maxime@cerno.tech>
:::::: CC: Mark Brown <broonie@kernel.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
