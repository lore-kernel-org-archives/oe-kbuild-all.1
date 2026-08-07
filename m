Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE3EC1CD2C
	for <oe-kbuild-all@lists.linux.dev>; Fri,  7 Aug 2026 23:00:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786143655; cv=none; b=J/BMwM+96V1DauMHGsKrfgmhlqBE9M2T3fEZ133QOtzspfWnMM8jTDpzx89yKyhif2v467UfoWw6/SUchY7NUkLJrrT6OBQWz/d8vJMEG029rf/JSDBmriJubOL0PnYPQush35vDN65sTAutV4tUqPZBY12dtlE66J8azzwSWS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786143655; c=relaxed/simple;
	bh=ECQVWCstlWUww5z49UTENgQT2dtPkDMO9n8FkaElep8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=GRSG/p08Zm5aGXQHThnXyPcdzhJQXe6YNQv1C5h0OjQhyc9v/dWuDLT2mTvB/Ht8xgHFSrtZ14fBmXVYMS6fa4H5eMR9Gzisq+1SoQWVHA47vd0rDWOzvpsjjxvQKAXueZI4fpFOCg+13YSm9cAMxPAPtpFybvLTJIKRIvL8GmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dNHJZ5zp; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dNHJZ5zp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786143654; x=1817679654;
  h=date:from:to:cc:subject:message-id;
  bh=ECQVWCstlWUww5z49UTENgQT2dtPkDMO9n8FkaElep8=;
  b=dNHJZ5zpjSIAYxuJ5wiqf9dRGe7w0sVsoIW/g6MBTCWpGPu2tkw0JIA2
   ixBMRmLuB1YHdRhVcQTl9q7JvfNSLmdnXXbsBJTiw3OMfTaRilSUux8rT
   zUOW41yFYqhOYwDfXXAz0mmutr8bRr39Zj6bDh7uyCRWhTowJNhSOlOoT
   RZtEb8vqyJr4NZQNifslkubXrBFIjGwvOY1GahlW6O5AehnA6lY20FT1B
   q+R0YUMxOy6LXNI2Un+Iv20autaVMzYprxwWvKcKsLq8+rT1Ca+Y5NwYo
   mIQNHTRXvTvrAJh7WPVQVZJZQ8P2fW07NXXOkSbxYs3HmrLaODbG4dHaJ
   A==;
X-CSE-ConnectionGUID: m9rLlqR9QMOF5MD4pVSGjw==
X-CSE-MsgGUID: o6olQBdyQEmZOAv03El7nA==
X-IronPort-AV: E=McAfee;i="6800,10657,11868"; a="86699704"
X-IronPort-AV: E=Sophos;i="6.25,210,1779174000"; 
   d="scan'208";a="86699704"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2026 16:00:54 -0700
X-CSE-ConnectionGUID: 5eSO3vHyR9+Ak9HqorUw5A==
X-CSE-MsgGUID: NAnA+O8jT7GCX2S2r0O8kQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,210,1779174000"; 
   d="scan'208";a="259199154"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 07 Aug 2026 16:00:52 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wsTYW-00000000JRV-4B08;
	Fri, 07 Aug 2026 23:00:48 +0000
Date: Sat, 08 Aug 2026 07:00:48 +0800
From: kernel test robot <lkp@intel.com>
To: Valerio Setti <vsetti@baylibre.com>
Cc: oe-kbuild-all@lists.linux.dev, Mark Brown <broonie@kernel.org>,
 Jerome Brunet <jbrunet@baylibre.com>
Subject: [linux-next:master 1303/13846] sound/soc/meson/aiu.c:184:34:
 sparse: sparse: symbol 'aiu_formatter_i2s_drv' was not declared. Should it be
 static?
Message-ID: <202608080634.hf6aJGPB-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   6b8c8af514d739d0335f5579b585e02babe8a727
commit: 83b83024cdbfdddee104f4a84c2c2f1f8e6659f3 [1303/13846] ASoC: meson: aiu: use aiu-formatter-i2s to format I2S output data
config: nios2-randconfig-r122-20260807 (https://download.01.org/0day-ci/archive/20260808/202608080634.hf6aJGPB-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 8.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260808/202608080634.hf6aJGPB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608080634.hf6aJGPB-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> sound/soc/meson/aiu.c:184:34: sparse: sparse: symbol 'aiu_formatter_i2s_drv' was not declared. Should it be static?

vim +/aiu_formatter_i2s_drv +184 sound/soc/meson/aiu.c

   183	
 > 184	const struct gx_formatter_driver aiu_formatter_i2s_drv = {
   185		.regmap_cfg	= &aiu_regmap_cfg,
   186		.ops		= &aiu_formatter_i2s_ops,
   187	};
   188	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
