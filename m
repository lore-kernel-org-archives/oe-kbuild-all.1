Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60EC43F167C
	for <oe-kbuild-all@lists.linux.dev>; Fri, 27 Mar 2026 14:25:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774621544; cv=none; b=ADuP0wEDKkTNuptYYiS7VaPjGl84MheWLQdH3Fa/dWO0P/4qQ6eeSTx69eB92IG+gSypRKQzVyEPOyiqVp6IOCvLsNtw6+Oq3r21CtYkUaOs/SCMfxFhStf6xqmV7DMhohuVat0wlCP0InrWtvS54hVsE2SKefoIUkpwzbYRp2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774621544; c=relaxed/simple;
	bh=o83+cq9MbTtxpFwZsHDLJiYP+V6l7YLyJyF8hVdrkcY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=DdP0+1Rg67oSmz0KvEIbkPdmdoraz+FmEQsEfpEtEmr2pSTt8cSyTGMaP6XtmW0grqmtyQV88z2L3xo0ywm5RrM+BG+trL2EMA2sCBBxlqP31xvb6BV/cHAfXQ41tJphQcmxBdmpyOo1X/ikcwd4xIi/88WNZtHJDlf77e1z/9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WUjJmbj2; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WUjJmbj2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774621541; x=1806157541;
  h=date:from:to:cc:subject:message-id;
  bh=o83+cq9MbTtxpFwZsHDLJiYP+V6l7YLyJyF8hVdrkcY=;
  b=WUjJmbj2DuR0VCA3bQ8ypam1pj3DZEaatdKuld33tsNswwThwwR3tCvW
   jbGuFaRMrSzlrHM4+Yb9V2DrY7TOXYAu/EmYD5gH01qCdGnOZTw3AbVsl
   hB+yxtLtKn67flmiRZI209SGy1vhAruB9YusEjdMRw/ILARdSPulOjXnP
   f9JgHrTkobb3EWXyGTGFstZhWVvMUpSr3viov1a092V+JI/j3j6ANTkfb
   /LXlzRFpr71jCdDYd4y70zJ2z54fi2kHBObxur/X0ByevmZFuZTeoGwmE
   MLI+K4CxM+czT0p+jwCRgZ6beYbNX9/VPVIaxss41Dn08HpECIlETOmS1
   Q==;
X-CSE-ConnectionGUID: NS+ieULWTfSUEW7MghJpSQ==
X-CSE-MsgGUID: 4dT2If+TTP+deFUknKWztQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11741"; a="79556170"
X-IronPort-AV: E=Sophos;i="6.23,144,1770624000"; 
   d="scan'208";a="79556170"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2026 07:25:41 -0700
X-CSE-ConnectionGUID: mBC+y+5SRvyWw4tV0c32AQ==
X-CSE-MsgGUID: Ikzfn2CXTwyIuHE3J9rYRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,144,1770624000"; 
   d="scan'208";a="222458587"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 27 Mar 2026 07:25:40 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w6882-00000000AMD-07IC;
	Fri, 27 Mar 2026 14:25:38 +0000
Date: Fri, 27 Mar 2026 22:25:16 +0800
From: kernel test robot <lkp@intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [morimoto:sound-cleanup-2026-03-27 61/106]
 sound/soc/soc-component.c:1684:51: error: 'const struct
 snd_soc_component_driver' has no member named 'debugfs_prefix'
Message-ID: <202603272258.CzNpmJru-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/morimoto/linux sound-cleanup-2026-03-27
head:   b547ff73a13ed8ce92e8e208ccd27884077b160b
commit: 96ac5eb1c466226a2d0e2f1d8f681a46cbc97bc5 [61/106] ASoC: soc-component: add snd_soc_component_alloc()
config: arc-randconfig-001-20260327 (https://download.01.org/0day-ci/archive/20260327/202603272258.CzNpmJru-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260327/202603272258.CzNpmJru-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603272258.CzNpmJru-lkp@intel.com/

All errors (new ones prefixed by >>):

   sound/soc/soc-component.c: In function 'snd_soc_component_alloc':
>> sound/soc/soc-component.c:1684:51: error: 'const struct snd_soc_component_driver' has no member named 'debugfs_prefix'
    1684 |                 component->debugfs_prefix = driver->debugfs_prefix;
         |                                                   ^~


vim +1684 sound/soc/soc-component.c

  1643	
  1644	struct snd_soc_component *snd_soc_component_alloc(struct device *dev,
  1645							  const struct snd_soc_component_driver *driver,
  1646							  struct regmap *regmap,
  1647							  const char *name,
  1648							  const char *name_prefix,
  1649							  const char *debugfs_prefix)
  1650	{
  1651		struct snd_soc_component *component;
  1652		struct snd_soc_dapm_context *dapm;
  1653	
  1654		component = devm_kzalloc(dev, sizeof(*component), GFP_KERNEL);
  1655		if (!component)
  1656			return NULL;
  1657	
  1658		dapm = snd_soc_dapm_alloc(dev);
  1659		if (!dapm)
  1660			return NULL;
  1661	
  1662		if (!name)
  1663			name = soc_fmt_single_name(dev, NULL);
  1664	
  1665		if (!name)
  1666			return NULL;
  1667	
  1668		INIT_LIST_HEAD(&component->dai_list);
  1669		INIT_LIST_HEAD(&component->dobj_list);
  1670		INIT_LIST_HEAD(&component->card_list);
  1671		INIT_LIST_HEAD(&component->list);
  1672		INIT_LIST_HEAD(&component->card_aux_list);
  1673		mutex_init(&component->io_mutex);
  1674	
  1675		component->name		= name;
  1676		component->name_prefix	= name_prefix;
  1677		component->dapm		= dapm;
  1678		component->regmap	= regmap;
  1679		component->dev		= dev;
  1680		component->driver	= driver;
  1681	
  1682		component->debugfs_prefix = debugfs_prefix;
  1683		if (!component->debugfs_prefix)
> 1684			component->debugfs_prefix = driver->debugfs_prefix;
  1685	
  1686		return component;
  1687	}
  1688	EXPORT_SYMBOL_GPL(snd_soc_component_alloc);
  1689	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
