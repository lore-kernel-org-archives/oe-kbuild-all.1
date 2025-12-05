Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57A8716DEB0
	for <oe-kbuild-all@lists.linux.dev>; Fri,  5 Dec 2025 00:32:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764894766; cv=none; b=LG/VBO2AbfpcIke/yrcUAaVZWsbbYr14sOiYFj55TdxAcMZBPA/5EUD5j6GHk456RJ3vbqqli8cffiU2GAd/P8e/BZajfS6SOAkaWyhY/9TX9rrTtLiBO7sywlyvoQMaQEQVYsKor6eRb4U4/jS86rV+BsOrsvPQsE0YkTEqB6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764894766; c=relaxed/simple;
	bh=OaUmSbSx2s5J6RyrnDZ5BbxMv3XVc/hooXSiv/e3lzA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rstFhtyy3WKnfrhBH6bymoJGNDYkSfHfULXq98if9L7+Zt/E+v4h5Q6uxCrokUu8x2Ijx1Ipjl5ZaxtkWYy+5H4QqNnSy+mpEOfdY5EM6ATiH20VhEIi4qszL70CLOY/2aofhm6LU38ipOIQRBs1j4IB6n2W0ovykOUIehNd85g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hJmkUlP6; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hJmkUlP6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764894764; x=1796430764;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OaUmSbSx2s5J6RyrnDZ5BbxMv3XVc/hooXSiv/e3lzA=;
  b=hJmkUlP68ANkg8/0/Yvr2cNhZYMIj8m5M5JhJc9cO6oNxuschoAU10qx
   zgZm4ncbP+qxLEGbzyA51cLFtD/gdQ7jCj0e3Zu/sBPbgzczbtvX5XJj7
   XpYU78lTvZTEwsPOy+apwa6lzXuvM6h5pO/FMRl8zCX2NHiTJ/7MvKN9d
   FwidzuXEUGGvMVT3SjaBNaPjQWtaSdrLjMxS04dxbIiHoXvv3bo18PaTY
   JPmFbK5zcNXbb3v0NfO9F1jDXbh89YjZrGE2Novyjf5pibQNJ4UssuoXV
   UHNIWuZDExOeJWVr6ijkU8dRQgp0Yvggv5t5VrfMpxtAK4Ga2ZiJz+Kdi
   g==;
X-CSE-ConnectionGUID: jOehjfTtRaWSSUclebLkXQ==
X-CSE-MsgGUID: 5vGMcSENTD6IwMKRK5TFuA==
X-IronPort-AV: E=McAfee;i="6800,10657,11632"; a="65928716"
X-IronPort-AV: E=Sophos;i="6.20,250,1758610800"; 
   d="scan'208";a="65928716"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2025 16:32:44 -0800
X-CSE-ConnectionGUID: hwrGq6/+TLifECfPQC0XwQ==
X-CSE-MsgGUID: XWjpzbdAQqerOoLDU8JWxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,250,1758610800"; 
   d="scan'208";a="195928642"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 04 Dec 2025 16:32:43 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vRJkW-00000000EO3-3Ty8;
	Fri, 05 Dec 2025 00:32:40 +0000
Date: Fri, 5 Dec 2025 08:32:40 +0800
From: kernel test robot <lkp@intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [morimoto:sound-cleanup-2025-12-04 17/18]
 sound/soc/codecs/wm8804.c:522:9: error: request for member
 'auto_selectable_formats' in something not a structure or union
Message-ID: <202512050820.CArR06et-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/morimoto/linux sound-cleanup-2025-12-04
head:   fb4e3e737845904b992450d498c56ca30359bb87
commit: 262df0b88156ac882137cf936a09df668c275f0a [17/18] hoge
config: um-randconfig-r052-20251205 (https://download.01.org/0day-ci/archive/20251205/202512050820.CArR06et-lkp@intel.com/config)
compiler: gcc-13 (Debian 13.3.0-16) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251205/202512050820.CArR06et-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512050820.CArR06et-lkp@intel.com/

All errors (new ones prefixed by >>):

>> sound/soc/codecs/wm8804.c:522:9: error: request for member 'auto_selectable_formats' in something not a structure or union
     522 |         .auto_selectable_formats = &wm8804_selectable_formats,
         |         ^


vim +/auto_selectable_formats +522 sound/soc/codecs/wm8804.c

   504	
   505	static const u64 wm8804_selectable_formats =
   506		SND_SOC_POSSIBLE_DAIFMT_I2S	|
   507		SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
   508		SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
   509		SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
   510		SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
   511		SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
   512		SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
   513		SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
   514		SND_SOC_POSSIBLE_DAIFMT_IB_IF;
   515	
   516	static const struct snd_soc_dai_ops wm8804_dai_ops = {
   517		.hw_params = wm8804_hw_params,
   518		.set_fmt = wm8804_set_fmt,
   519		.set_sysclk = wm8804_set_sysclk,
   520		.set_clkdiv = wm8804_set_clkdiv,
   521		.set_pll = wm8804_set_pll
 > 522		.auto_selectable_formats = &wm8804_selectable_formats,
   523		.num_auto_selectable_formats = 1,
   524	};
   525	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
