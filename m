Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C97735CBCB
	for <oe-kbuild-all@lists.linux.dev>; Tue, 16 Jun 2026 13:03:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781614981; cv=none; b=KuKrX4dP92ZmgqCKzogJK13TCIL4RblaUffT28LoDzulMxkBg804aHE9Lqxh/hfRPSe6eLN+n+zQZH+rljV0KJeTU3y5KfOICbrlb+censM43fsxTP1L9qlPM+/w4P5sxGOk3i0ZaxuoyZbT2L8mt0QhIbUhwq+zkdvkbErYCm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781614981; c=relaxed/simple;
	bh=L1NF/+rIuV+LlxwjpK5fYgno+xILfHRpVbyeAEIR+CE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=WruuhQw52twLcU45/sXGUCwVEOAFTL+DNnTNwuxhgDeu7Up8Vq+agN5nHC5k5ynfheHpRyiuN1xn3RcGXNYAD+uNCfJ4AqbAHdplJ8b7Ya97PYHyEW20LFGnHVKdgH6c6b5QPCiUKvNgRJL3VWxUMtlpCqX2Lum6VPFl/KlrWZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ur4eWPRX; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ur4eWPRX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781614981; x=1813150981;
  h=date:from:to:cc:subject:message-id;
  bh=L1NF/+rIuV+LlxwjpK5fYgno+xILfHRpVbyeAEIR+CE=;
  b=Ur4eWPRXBozZxMd6B57iRcEbq0sZN8egKD8efiUq25hCMmumMubroBjF
   /t9rG+5Qwfspd8melsUsmtZiNqWDqJwi4XKgzaCgF7Hno76MXGYOQbYfR
   oFlXHHgWSS+KjkJ4wUSwPrK/7TkBMMOecxRDYIvnPpClhE5wMWgBPoqcE
   F0XTSPTA/iYFwXKRuJ4asJrML3/19BA/g+G0B7Uk/HhukuaawNLFBE7Rd
   f2ZiNCNPWYJWri5+WhIujzxx8r5Oo5HuzBZb818eonpJW+GvMaNOtcfWQ
   arEXlkquhqta5zCFuK+n8NxizzlufWF/n1OTkEjy2pyQ2/S/SR3u7slER
   Q==;
X-CSE-ConnectionGUID: WdJnwPyUSA+TwsOhjQjwDg==
X-CSE-MsgGUID: 5r0qt8WNR4m28u60ITaBOw==
X-IronPort-AV: E=McAfee;i="6800,10657,11818"; a="105046304"
X-IronPort-AV: E=Sophos;i="6.24,208,1774335600"; 
   d="scan'208";a="105046304"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2026 06:03:00 -0700
X-CSE-ConnectionGUID: wLtulKTDTzSz+tEsRFZc9w==
X-CSE-MsgGUID: ULNxVil7TLWIcvw04SmWZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,208,1774335600"; 
   d="scan'208";a="247646639"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by orviesa008.jf.intel.com with ESMTP; 16 Jun 2026 06:02:59 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wZTRQ-0000000056j-2aMz;
	Tue, 16 Jun 2026 13:02:56 +0000
Date: Tue, 16 Jun 2026 15:01:59 +0200
From: kernel test robot <lkp@intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [morimoto:sound-cleanup-2026-06-16 313/326]
 sound/soc/codecs/rt5651.c:2113:9: error: implicit declaration of function
 'snd_soc_component_regmap_regcache_sync'; did you mean
 'snd_soc_component_regcache_sync'?
Message-ID: <202606161438.bQs1mXLi-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/morimoto/linux sound-cleanup-2026-06-16
head:   5ce50ac7d0a59c6fb15e1baa7e6824ac096fe092
commit: 4bbdf4f7c937878b634b01d362515e2a79053b52 [313/326] dai
config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20260616/202606161438.bQs1mXLi-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260616/202606161438.bQs1mXLi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606161438.bQs1mXLi-lkp@intel.com/

All errors (new ones prefixed by >>):

   sound/soc/codecs/rt5651.c: In function 'rt5651_resume':
>> sound/soc/codecs/rt5651.c:2113:9: error: implicit declaration of function 'snd_soc_component_regmap_regcache_sync'; did you mean 'snd_soc_component_regcache_sync'? [-Wimplicit-function-declaration]
    2113 |         snd_soc_component_regmap_regcache_sync(component);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |         snd_soc_component_regcache_sync


vim +2113 sound/soc/codecs/rt5651.c

  2106	
  2107	static int rt5651_resume(struct snd_soc_component *component)
  2108	{
  2109		struct device *dev = snd_soc_component_to_dev(component);
  2110		struct rt5651_priv *rt5651 = dev_get_drvdata(dev);
  2111	
  2112		regcache_cache_only(rt5651->regmap, false);
> 2113		snd_soc_component_regmap_regcache_sync(component);
  2114	
  2115		return 0;
  2116	}
  2117	#else
  2118	#define rt5651_suspend NULL
  2119	#define rt5651_resume NULL
  2120	#endif
  2121	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
