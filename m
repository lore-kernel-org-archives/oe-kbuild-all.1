Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D4A02DF701
	for <oe-kbuild-all@lists.linux.dev>; Sat, 30 May 2026 14:00:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780149637; cv=none; b=VIl01OIYqQGmk+7psFjKrHcD9Uc+7Hxqa8NZAi056KCgPEwdlnDKhj9vI0ruFNgirWjT0oPvo5vhq0aphQkG5PcqnspTHaqZ4vjN+eve8QHwCwPaNlzt/TU2q5aM7BNliUY/A03AfIkA4pcVItI8j9PJoPtdr5IQ8BvOaTchrB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780149637; c=relaxed/simple;
	bh=g9sapVZotdqCSjG4foBVq0LHxpJRwKphJvWNMo7YrzM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Gy5r2XqfsYJG+k7PFQ1q2sjGbWK54u/lrS9M/SYpVkXiS9BwQfW1shaCWclkltyr9IN2wXCMig2+Ap0fTrTf2rtZSV9YAFCbWS8NCaLiYUesf8EmnoOHj6zTWhkyyDkfohMd8A9Lc07/TEdvD9Yf1TNWB25/1s1Suchy7UaQqzg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iDXJmXKG; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iDXJmXKG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780149636; x=1811685636;
  h=date:from:to:cc:subject:message-id;
  bh=g9sapVZotdqCSjG4foBVq0LHxpJRwKphJvWNMo7YrzM=;
  b=iDXJmXKGBJpgWs1+g9KVpCqjlrtZ/jhu/IkjZ7OydrFWgHOlQdQ6BR17
   TNu9H3Rm+Xt4Yrrr7s3V6KooI8eCj751JvvqONGpmLshcEnZJgIRGbZew
   E7wu0CdnV/FOeLUTecWEeFBDTkF7hTn6SNephLPKTD1Di7xhuu4VBYVsK
   pLgOThXHzmWgcvvXoYmzE0P7JEOk6CNDAFX1J4W0uoNWXqnVeQKyt9IzG
   SsG3FFOGrgCDw79/SwnIw88qxvAgTte/67GtYnsRLsIuFL/gOJTzru5el
   IjmwP/bMkb6rjGHRHoYs7he6eOXYwCVGzkriw8gbr9OjANWz3yUy9rEyu
   g==;
X-CSE-ConnectionGUID: mx9p9SDrROultNRh656t/A==
X-CSE-MsgGUID: zripaouzRzahC8y3ZAp6ZA==
X-IronPort-AV: E=McAfee;i="6800,10657,11801"; a="81089230"
X-IronPort-AV: E=Sophos;i="6.24,177,1774335600"; 
   d="scan'208";a="81089230"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2026 07:00:35 -0700
X-CSE-ConnectionGUID: 1XDbfB6dTqyZREVpL1O06A==
X-CSE-MsgGUID: FaEnZNaRQJeTYYodwTAaOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,177,1774335600"; 
   d="scan'208";a="247112684"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 30 May 2026 07:00:33 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wTKEo-000000008UU-3wqk;
	Sat, 30 May 2026 14:00:30 +0000
Date: Sat, 30 May 2026 22:00:12 +0800
From: kernel test robot <lkp@intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [morimoto:sound-cleanup-2026-05-22 254/254]
 sound/soc/soc-component.c:1693:51: error: 'const struct
 snd_soc_component_driver' has no member named 'debugfs_prefix'
Message-ID: <202605302127.09cqlQ3R-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/morimoto/linux sound-cleanup-2026-05-22
head:   65ed982efb72231d8feca201fdeb06adb64515a0
commit: 67e2ce84d1ef5b96d2e6fe9789df531f97bb28a1 [254/254] ASoC: soc-component: add snd_soc_component_alloc()
config: nios2-randconfig-r052-20260530 (https://download.01.org/0day-ci/archive/20260530/202605302127.09cqlQ3R-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260530/202605302127.09cqlQ3R-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605302127.09cqlQ3R-lkp@intel.com/

All errors (new ones prefixed by >>):

   sound/soc/soc-component.c: In function 'snd_soc_component_alloc':
>> sound/soc/soc-component.c:1693:51: error: 'const struct snd_soc_component_driver' has no member named 'debugfs_prefix'
    1693 |                 component->debugfs_prefix = driver->debugfs_prefix;
         |                                                   ^~


vim +1693 sound/soc/soc-component.c

  1652	
  1653	struct snd_soc_component *snd_soc_component_alloc(struct device *dev,
  1654							  const struct snd_soc_component_driver *driver,
  1655							  struct regmap *regmap,
  1656							  const char *name,
  1657							  const char *name_prefix,
  1658							  const char *debugfs_prefix)
  1659	{
  1660		struct snd_soc_component *component;
  1661		struct snd_soc_dapm_context *dapm;
  1662	
  1663		component = devm_kzalloc(dev, sizeof(*component), GFP_KERNEL);
  1664		if (!component)
  1665			return NULL;
  1666	
  1667		dapm = snd_soc_dapm_alloc(dev);
  1668		if (!dapm)
  1669			return NULL;
  1670	
  1671		if (!name)
  1672			name = soc_fmt_single_name(dev, NULL);
  1673	
  1674		if (!name)
  1675			return NULL;
  1676	
  1677		INIT_LIST_HEAD(&component->dai_list);
  1678		INIT_LIST_HEAD(&component->dobj_list);
  1679		INIT_LIST_HEAD(&component->card_list);
  1680		INIT_LIST_HEAD(&component->list);
  1681		INIT_LIST_HEAD(&component->card_aux_list);
  1682		mutex_init(&component->io_mutex);
  1683	
  1684		component->name		= name;
  1685		component->name_prefix	= name_prefix;
  1686		component->dapm		= dapm;
  1687		component->regmap	= regmap;
  1688		component->dev		= dev;
  1689		component->driver	= driver;
  1690	
  1691		component->debugfs_prefix = debugfs_prefix;
  1692		if (!component->debugfs_prefix)
> 1693			component->debugfs_prefix = driver->debugfs_prefix;
  1694	
  1695		return component;
  1696	}
  1697	EXPORT_SYMBOL_GPL(snd_soc_component_alloc);
  1698	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
