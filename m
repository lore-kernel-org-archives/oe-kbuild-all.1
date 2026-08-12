Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54A0C2F290A
	for <oe-kbuild-all@lists.linux.dev>; Wed, 12 Aug 2026 18:21:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786558910; cv=none; b=lvcvJDk4OqWVHsezOImS9NikppKoZg6PrJMvT6JJL54qPrLaGGomvH0mt3qgdqaIVS/PrV84KEjmw6N8uwLCG1L07FSpTICvjLpetQpR8ziajhyKxNGYfJtKLBnKJqeSz/2cF3mphPYozf/Gl2MEf6DB4djUmdkSwZ5mpWeeucg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786558910; c=relaxed/simple;
	bh=g58SXWzZ0Nxr9J/kTvwMUviPyFQ6fjL8U2nd3tf8Bls=;
	h=Date:From:To:Cc:Subject:Message-ID; b=h577EUdayqQIR6jZISLh2ru/86p7WLWucBhCrfgVF6qT8kU8nSkGv04C7RzyPdrUghXBmI9zWZc/EEposHtHHvHWmxX6eFf0sLHX41HR6zysG+hu0eIk54AjpRiEbX1HB07GP5XJaYD4C/TDEFqk5VD2Y9hC6nTLT8Nq1btumQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Hyl6IWnp; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Hyl6IWnp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786558908; x=1818094908;
  h=date:from:to:cc:subject:message-id;
  bh=g58SXWzZ0Nxr9J/kTvwMUviPyFQ6fjL8U2nd3tf8Bls=;
  b=Hyl6IWnpo5N3F1bvBIE5xhLFpIS7gypU6t4zqt5Ci4f1TiRYEg6XTK4G
   cfNGbLpVvWgFBarzT3ONvi8rfCboehcB7iQbKeFSXtwrBCnOrxrrQFcqK
   7cc+jlStn1h5wT0FniaVgsR3u+mWnmFogI4zaGeM69q7cgva5S3EcQ83i
   7MmCRN5YBtUBXRCh/d0Dl8R3CUv8Ly0ys6sr8XO1sgE0k4c8u75BigUKz
   bEhcgc7NGM6dUetcBxwZwNLWUY8/bM3HoXEu/QkdEwZ1+TQMXl/kB7Mpu
   vDAPAjYQn3/ykCacJ2AHYwv43p1SUE/h3pB3/OQWJImDBOLmTlDQfBfrZ
   w==;
X-CSE-ConnectionGUID: je8RCuT9TMyua+/dIE1I2A==
X-CSE-MsgGUID: 8Plfn7i6TRyoN+9ICic1dg==
X-IronPort-AV: E=McAfee;i="6800,10657,11873"; a="87003241"
X-IronPort-AV: E=Sophos;i="6.25,219,1779174000"; 
   d="scan'208";a="87003241"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2026 11:21:47 -0700
X-CSE-ConnectionGUID: aVrGEOmSSoqwlEdFVASQHQ==
X-CSE-MsgGUID: wFDXG+slQTueWVp1v0lv5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,219,1779174000"; 
   d="scan'208";a="259885868"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 12 Aug 2026 11:21:46 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wuDaB-00000000RKg-2ejH;
	Wed, 12 Aug 2026 18:21:43 +0000
Date: Thu, 13 Aug 2026 02:21:19 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-desktop 1/1]
 sound/soc/codecs/rt-sdw-common.c:87: warning: Function parameter or struct
 member 'val' not described in 'rt_sdca_index_update_bits'
Message-ID: <202608130256.dUbLEbni-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Jack,

First bad commit (maybe != root cause):

tree:   https://android.googlesource.com/kernel/common android16-6.12-desktop
head:   24c37396da197463e1ff2bc69bb789e34dacad53
commit: ba46a64341209fd14a19c13e35a61bca6f571812 [1/1] UPSTREAM: ASoC: rt721-sdca: Add RT721 SDCA driver
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20260813/202608130256.dUbLEbni-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260813/202608130256.dUbLEbni-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608130256.dUbLEbni-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> sound/soc/codecs/rt-sdw-common.c:87: warning: Function parameter or struct member 'val' not described in 'rt_sdca_index_update_bits'
>> sound/soc/codecs/rt-sdw-common.c:87: warning: Excess function parameter 'value' description in 'rt_sdca_index_update_bits'


vim +87 sound/soc/codecs/rt-sdw-common.c

cbc3cb613e4044c Jack Yu 2024-10-01  71  
cbc3cb613e4044c Jack Yu 2024-10-01  72  /**
cbc3cb613e4044c Jack Yu 2024-10-01  73   * rt_sdca_index_update_bits - Update value on Realtek defined register.
cbc3cb613e4044c Jack Yu 2024-10-01  74   *
cbc3cb613e4044c Jack Yu 2024-10-01  75   * @map: map for setting.
cbc3cb613e4044c Jack Yu 2024-10-01  76   * @nid: Realtek-defined ID.
cbc3cb613e4044c Jack Yu 2024-10-01  77   * @reg: register.
cbc3cb613e4044c Jack Yu 2024-10-01  78   * @mask: Bitmask to change
cbc3cb613e4044c Jack Yu 2024-10-01  79   * @value: New value for bitmask
cbc3cb613e4044c Jack Yu 2024-10-01  80   *
cbc3cb613e4044c Jack Yu 2024-10-01  81   * A value of zero will be returned on success, a negative errno will
cbc3cb613e4044c Jack Yu 2024-10-01  82   * be returned in error cases.
cbc3cb613e4044c Jack Yu 2024-10-01  83   */
cbc3cb613e4044c Jack Yu 2024-10-01  84  
cbc3cb613e4044c Jack Yu 2024-10-01  85  int rt_sdca_index_update_bits(struct regmap *map,
cbc3cb613e4044c Jack Yu 2024-10-01  86  	unsigned int nid, unsigned int reg, unsigned int mask, unsigned int val)
cbc3cb613e4044c Jack Yu 2024-10-01 @87  {
cbc3cb613e4044c Jack Yu 2024-10-01  88  	unsigned int tmp;
cbc3cb613e4044c Jack Yu 2024-10-01  89  	int ret;
cbc3cb613e4044c Jack Yu 2024-10-01  90  
cbc3cb613e4044c Jack Yu 2024-10-01  91  	ret = rt_sdca_index_read(map, nid, reg, &tmp);
cbc3cb613e4044c Jack Yu 2024-10-01  92  	if (ret < 0)
cbc3cb613e4044c Jack Yu 2024-10-01  93  		return ret;
cbc3cb613e4044c Jack Yu 2024-10-01  94  
cbc3cb613e4044c Jack Yu 2024-10-01  95  	set_mask_bits(&tmp, mask, val);
cbc3cb613e4044c Jack Yu 2024-10-01  96  	return rt_sdca_index_write(map, nid, reg, tmp);
cbc3cb613e4044c Jack Yu 2024-10-01  97  }
cbc3cb613e4044c Jack Yu 2024-10-01  98  EXPORT_SYMBOL_GPL(rt_sdca_index_update_bits);
cbc3cb613e4044c Jack Yu 2024-10-01  99  

:::::: The code at line 87 was first introduced by commit
:::::: cbc3cb613e4044c076c6648ce0934818cba52545 UPSTREAM: ASoC: rt-sdw-common: Common functions for Realtek soundwire driver

:::::: TO: Jack Yu <jack.yu@realtek.com>
:::::: CC: Treehugger Robot <android-test-infra-autosubmit@system.gserviceaccount.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
