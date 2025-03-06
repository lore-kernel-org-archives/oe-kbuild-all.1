Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 054691362
	for <oe-kbuild-all@lists.linux.dev>; Thu,  6 Mar 2025 03:22:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741231331; cv=none; b=np33+eT7TJXErhsuZf4NDwZ+8nq+tzbpFftKvgCUfBRdv6Uusoc0cMaylItrIRWka+IklLLBqL5vwHlv41J6ToarQH0i0EO/Lgr79/6ChTBoyfM5IiLE/YxjhRCbbObVORwAN4kSd7q6xv6DzJhqY3ZqViwgMKFyetyfsjABC5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741231331; c=relaxed/simple;
	bh=bPr8j8JhScCZBcq/TOxa6ISfVDoWENNyYpBaDvPg0SE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=epZATMDId0hYwrlKe57hkhGTorpep9LuTFKIkgpq8jdR2JRWnA/4lPT6obYV90WRXdBgv4GuKYDHJD5stM4MHYLH73n4nR+Y47I+zQa9C/smWUPqXsoJyW75jE2NsNtzF2wFufqPa8hvzejKdYPQ/TU3Y+CQyUxpbabPx9A1Ovc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dLFsZXTI; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dLFsZXTI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741231330; x=1772767330;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bPr8j8JhScCZBcq/TOxa6ISfVDoWENNyYpBaDvPg0SE=;
  b=dLFsZXTIg+bnx5No1NmT0DE7looyC1Kj7YeTTvgarx4S9DfKIUTE/OqA
   vHXGDq0NsaH+hKKcQOVnnqlfVxklprVEARekJaU3LoZuNH7T/X7A+L1Ps
   nyiwox+DpJLl6cEXPU1I4Xc5129DzjWqnRakr6JfcX9GsBC4HYkugniWO
   XtnvB9ARFH/XtWdUqNRkitgYvpVji/CpVRVVsmPXPuIUDpczOHItz/sUZ
   SPkd0tPkbUJ99riDbdHKqESMLUeVw9wA+m0Rcu0tynW8mR0spEM9q9sgQ
   Cw5HLShp2aurY50OwrV9M3TtH+0n56wSvvbaE2R/9lkyK0qhxNUbXIaDN
   w==;
X-CSE-ConnectionGUID: 4+drCea8SGS1PVLs59Iziw==
X-CSE-MsgGUID: 1uYqTQerSI2k/cyLhUR6HQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="53625590"
X-IronPort-AV: E=Sophos;i="6.14,224,1736841600"; 
   d="scan'208";a="53625590"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2025 19:22:09 -0800
X-CSE-ConnectionGUID: 9q410DpDSPWwDSyI38CvFQ==
X-CSE-MsgGUID: OqE1drnySxOlriCWFB0Y7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="118793974"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 05 Mar 2025 19:22:09 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tq1oE-000MT8-0R;
	Thu, 06 Mar 2025 03:22:06 +0000
Date: Thu, 6 Mar 2025 11:22:03 +0800
From: kernel test robot <lkp@intel.com>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: oe-kbuild-all@lists.linux.dev, Mark Brown <broonie@kernel.org>
Subject: [broonie-sound:for-6.15 18/50] sound/soc/codecs/adau17x1.c:275:8:
 sparse: sparse: symbol 'adau17x1_dac_mux' was not declared. Should it be
 static?
Message-ID: <202503061119.4QGlnOi6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-6.15
head:   c6141ba0110f98266106699aca071fed025c3d64
commit: c951b20766f019a263b3547b07627be52fff87b4 [18/50] ASoC: dapm: Use ASoC control macros where possible
config: i386-randconfig-063-20250305 (https://download.01.org/0day-ci/archive/20250306/202503061119.4QGlnOi6-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250306/202503061119.4QGlnOi6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503061119.4QGlnOi6-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> sound/soc/codecs/adau17x1.c:275:8: sparse: sparse: symbol 'adau17x1_dac_mux' was not declared. Should it be static?
>> sound/soc/codecs/adau17x1.c:278:8: sparse: sparse: symbol 'adau17x1_capture_mux' was not declared. Should it be static?

vim +/adau17x1_dac_mux +275 sound/soc/codecs/adau17x1.c

4101866c743a369 Lars-Peter Clausen 2014-05-27  274  
4101866c743a369 Lars-Peter Clausen 2014-05-27 @275  static DECLARE_ADAU17X1_DSP_MUX_CTRL(adau17x1_dac_mux, "DAC Playback Mux",
4101866c743a369 Lars-Peter Clausen 2014-05-27  276  	SNDRV_PCM_STREAM_PLAYBACK, adau17x1_dac_mux_text);
4101866c743a369 Lars-Peter Clausen 2014-05-27  277  
4101866c743a369 Lars-Peter Clausen 2014-05-27 @278  static DECLARE_ADAU17X1_DSP_MUX_CTRL(adau17x1_capture_mux, "Capture Mux",
4101866c743a369 Lars-Peter Clausen 2014-05-27  279  	SNDRV_PCM_STREAM_CAPTURE, adau17x1_capture_mux_text);
4101866c743a369 Lars-Peter Clausen 2014-05-27  280  

:::::: The code at line 275 was first introduced by commit
:::::: 4101866c743a3695666e8562b5713b4d7f341cbf ASoC: Add ADAU1X61 and ADAU1X81 CODECs common code

:::::: TO: Lars-Peter Clausen <lars@metafoo.de>
:::::: CC: Mark Brown <broonie@linaro.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
