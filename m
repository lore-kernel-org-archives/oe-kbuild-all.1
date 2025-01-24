Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E7421D5146
	for <oe-kbuild-all@lists.linux.dev>; Fri, 24 Jan 2025 01:09:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737680963; cv=none; b=GjlqkiQQqtCgj5k5Ct6d14wnyeobeuwaSujrJX7mRiBQ9ePZGsahoKtgRTEdYEgqGi4Cz/2I4BkRPZ5k7uXaGtCtbLW6yVMYXcDFURoN0u8tkWp7UI2SblJKN0yi8aGH0bsZ4SMojwu8bCdKcSTwzL5aqe/mwwpzrvnYOGoWF+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737680963; c=relaxed/simple;
	bh=/+Z/7NfhrwFnnP2bYzj418rAcHuKuR/MB5nVb4fBr6c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GU8pM1KQ3rNlJHPYiJB/DFf+A9nsrFc4YcRPKbgDcCX1RAeRPnPbT2lWAfTNLN4/3EpmJz3dOVzyofhUk1ELYHkAV5rMhJcnJVkDydWDdvwQY/WExf7NkXiXIku+AiO1mJBgD4hmtGmX8+JZNMbeGXycj9wrmvPP3EBdxPgzJdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bOnMGJQ4; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bOnMGJQ4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737680962; x=1769216962;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/+Z/7NfhrwFnnP2bYzj418rAcHuKuR/MB5nVb4fBr6c=;
  b=bOnMGJQ4Hx48UYVgw8gq/mpD0R0Yx4JRsKNGj3rAPytV97MjkN2TNZGm
   a8H2LwzHDQIj/kJWvFhA9ynGintvB/YClvQb9Av959nrdg3lBK0Pblh1N
   qqmC/rNw5kvsiDknGYnz4JCfPPwxQ/FzshcbdIGTQLIsaCaqA1V+piRRg
   zsTTantiGWQEaB3B0+6+rppAAi7/m1AVpJjZLQHoVeTyuYEa3IS1fwz5r
   vdE/MNVOHcFrdQ+JydcQzlEAdf9eyJ9isPKjotCHR/EX2Sddu2RUvhFm9
   ADuNfCyala/7gA59bbzMQQBMOd2M4hknR4auoIbEic8muE2gL+wpVJEDZ
   w==;
X-CSE-ConnectionGUID: G85CXYpGSqu3BcOx30KptQ==
X-CSE-MsgGUID: Z/itloyYRSKg9RJSMeh6zw==
X-IronPort-AV: E=McAfee;i="6700,10204,11324"; a="25812914"
X-IronPort-AV: E=Sophos;i="6.13,230,1732608000"; 
   d="scan'208";a="25812914"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2025 17:09:19 -0800
X-CSE-ConnectionGUID: ++q19gvpRU2qmHgEUmHC/w==
X-CSE-MsgGUID: OG42mcz6QXue4MiMxIxMpg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="108508961"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 23 Jan 2025 17:09:17 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tb8CB-000bwe-0f;
	Fri, 24 Jan 2025 01:09:15 +0000
Date: Fri, 24 Jan 2025 09:08:41 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Mark Brown <broonie@kernel.org>
Subject: kismet: WARNING: unmet direct dependencies detected for
 SND_SOC_DA7210 when selected by SH_ECOVEC
Message-ID: <202501240836.OvXqmANX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   8883957b3c9de2087fb6cf9691c1188cccf1ac9c
commit: ce0c97f8a2936d05951da7093b881c8eaaee72e0 ASoC: Fix SND_SOC_ALL_CODECS imply SPI fallout
date:   4 years, 11 months ago
config: sh-kismet-CONFIG_SND_SOC_DA7210-CONFIG_SH_ECOVEC-0-0 (https://download.01.org/0day-ci/archive/20250124/202501240836.OvXqmANX-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20250124/202501240836.OvXqmANX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501240836.OvXqmANX-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for SND_SOC_DA7210 when selected by SH_ECOVEC
   WARNING: unmet direct dependencies detected for SND_SOC_DA7210
     Depends on [n]: SOUND [=y] && !UML && SND [=y] && SND_SOC [=y] && I2C [=n]
     Selected by [y]:
     - SH_ECOVEC [=y] && CPU_SUBTYPE_SH7724 [=y] && SND_SIMPLE_CARD [=y]
   
   WARNING: unmet direct dependencies detected for SND_SOC_AK4642
     Depends on [n]: SOUND [=y] && !UML && SND [=y] && SND_SOC [=y] && I2C [=n]
     Selected by [y]:
     - SH_7724_SOLUTION_ENGINE [=y] && CPU_SUBTYPE_SH7724 [=y] && SND_SIMPLE_CARD [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
