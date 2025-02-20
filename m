Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8AAA4C6C
	for <oe-kbuild-all@lists.linux.dev>; Thu, 20 Feb 2025 03:30:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740022239; cv=none; b=DvXtFz/Dt5tjKyyRKaY+817ezfCkTXyVySmHKZ3bdD2Kad75n3U2bxysOJ7UJAYMvwLimVO44RYpk9AFbDb6N/5R8MnuQZzBh8D7GESbtuh/pnHhcc3I94rSdIE4nUocAyZHeAMqZn8WxFJ6QhckUYMTC3FdLOhZeLisljCIPRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740022239; c=relaxed/simple;
	bh=1S3PKSIlHUUAUROFsNKAp1kHnpCJCPpgLFV7b2TGpfU=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cDNZRWY/78cB7xEXLKk5/IESyY4rVCTtKdgrmBtUCeMkWc6+wd+MAZMMS436NsNul4tq+Uh59v+X7N5iFNpGuC2YGgGswS6dyrJV0Jv5XSbNE3zwF1mZi6NadUFr16JNxNq9L4eI7WVGXHQGzW6KNIV6iuMUmO4sCeHZT5nh7Ak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BQ9OPglg; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BQ9OPglg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740022238; x=1771558238;
  h=date:from:cc:subject:message-id:mime-version;
  bh=1S3PKSIlHUUAUROFsNKAp1kHnpCJCPpgLFV7b2TGpfU=;
  b=BQ9OPglgJvxjeRIKNb7wIchrjDXBiNEPj0zSPS6ydoOYPsLdIH5EfD1H
   O4ZCSCwLxE0zCr4LaRH78qhmWy+ETlfh1cuP/dlUMpGDdRSZpICJZmI/0
   nyQeULn9KBeggawoz6TvSt6xtSSnITknDIz0xR9heJbFfEwIzBP7b6Uea
   mROjrjzxtbJWDS7dcW8u8O2DH+kx0ZDEY1b1szyV5VvA+BDtja6cPi97A
   zOhI2pkWAxKzcCJVLY5VEuUSu5ObTYe+UBvlk3xq0pnO4jMJkMcQpcxWB
   jWYfS8arFI7789dJkVPgkG+ArhTepqOfh0FxBF9Ncb9hV38NIhKiFUstt
   A==;
X-CSE-ConnectionGUID: pe8+N0qtRmeRKezYmGuLUQ==
X-CSE-MsgGUID: EPfAUnCJRK66uaywwpwslA==
X-IronPort-AV: E=McAfee;i="6700,10204,11350"; a="44435933"
X-IronPort-AV: E=Sophos;i="6.13,300,1732608000"; 
   d="scan'208";a="44435933"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Feb 2025 19:30:37 -0800
X-CSE-ConnectionGUID: SH2DM398SZ6NByY8+acLmw==
X-CSE-MsgGUID: KQ+953aZQuyb3pNXwr3Ewg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="114761632"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 19 Feb 2025 19:30:37 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tkxGi-0003ot-1M
	for oe-kbuild-all@lists.linux.dev;
	Thu, 20 Feb 2025 03:30:33 +0000
Date: Thu, 20 Feb 2025 11:30:15 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [intel-lts:pr/57 1/1]
 sound/soc/mediatek/mt8183/mt8183-da7219-max98357.c:148:40: warning:
 'mt8183_da7219_max98357_dapm_routes' defined but not used
Message-ID: <202502201152.A0xsFXsS-lkp@intel.com>
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
commit: ebbddc75bbe8d8eab64d3285b0480f5ae9232b2e [1/1] ASoC: Mediatek: MT8183: Add machine driver with DA7219
config: arm64-randconfig-003-20250217 (https://download.01.org/0day-ci/archive/20250220/202502201152.A0xsFXsS-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250220/202502201152.A0xsFXsS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502201152.A0xsFXsS-lkp@intel.com/

All warnings (new ones prefixed by >>):

   sound/soc/mediatek/mt8183/mt8183-da7219-max98357.c: In function 'mt8183_da7219_max98357_dev_probe':
   sound/soc/mediatek/mt8183/mt8183-da7219-max98357.c:413:27: error: 'struct snd_soc_dai_link' has no member named 'platform'; did you mean 'platforms'?
     413 |                 dai_link->platform = NULL;
         |                           ^~~~~~~~
         |                           platforms
   sound/soc/mediatek/mt8183/mt8183-da7219-max98357.c: At top level:
>> sound/soc/mediatek/mt8183/mt8183-da7219-max98357.c:148:40: warning: 'mt8183_da7219_max98357_dapm_routes' defined but not used [-Wunused-const-variable=]
     148 | static const struct snd_soc_dapm_route mt8183_da7219_max98357_dapm_routes[] = {
         |                                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> sound/soc/mediatek/mt8183/mt8183-da7219-max98357.c:144:1: warning: 'mt8183_da7219_max98357_dapm_widgets' defined but not used [-Wunused-const-variable=]
     144 | mt8183_da7219_max98357_dapm_widgets[] = {
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/mt8183_da7219_max98357_dapm_routes +148 sound/soc/mediatek/mt8183/mt8183-da7219-max98357.c

   142	
   143	static const struct snd_soc_dapm_widget
 > 144	mt8183_da7219_max98357_dapm_widgets[] = {
   145		SND_SOC_DAPM_OUTPUT("IT6505_8CH"),
   146	};
   147	
 > 148	static const struct snd_soc_dapm_route mt8183_da7219_max98357_dapm_routes[] = {
   149		{"IT6505_8CH", NULL, "TDM"},
   150	};
   151	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
