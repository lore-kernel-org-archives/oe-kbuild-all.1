Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FF176ADD
	for <oe-kbuild-all@lists.linux.dev>; Sun, 13 Jul 2025 14:28:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752416930; cv=none; b=GHfSXYaW8+Bj5pO3EUMcn/uRG62Tr7S15HbRdm9qJlIDa0nY95pTjSePnrj3XzuX2hKY0nJxQ+GY12hKumuIr3PKFdaHiFuWnlTypzndSSQzC1UCWNsL8qsAAgc9IGuTek/cTbeWgbe6c/3yEBLu2Zpw0n7n9r5o+IERj2BApBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752416930; c=relaxed/simple;
	bh=moh5ZoghPy0F85aBhNvHeUvYaUbsi47MHJB6eGhHb1k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KlPSut+yB8iS4OA6NoS7zXG32/R42fKmI55/Gs1WqQF1/3g4na0L84nypVKVyDNaik2W244DHA+juKwkeECESNv2WyXQXibgst/b5RQANWNGuehK1hjQ4QRsYIxEWiN6Vg+qQMnc0Vx4+L/0ZJVvuua3Iw0bpDBq6CNh8C7vzkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XfYvwAPg; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XfYvwAPg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752416928; x=1783952928;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=moh5ZoghPy0F85aBhNvHeUvYaUbsi47MHJB6eGhHb1k=;
  b=XfYvwAPgowTzAJUC9tMmM2g8X1hXmTPMs+nDgz/E6PQlshLc6rPjT4hu
   6AldgXdBDrl1YsGUZZtXSTVAQfOBDQIUn5IGhCZaLnRhXja1WZuzhgoqa
   hfJeq08LAOk24oZrK5ILHoJwAqaXWs8Qp/yjvUmDWBBlVA96aATU/QPWT
   hUdLWAPgPgL+UNlMm/DNZPndUS/zaObA90QRrtogadXtAd29C5TEBE4NZ
   bj3TDYL7VtiPAjQ4zIuq//cnzOD/CqvO/jGmCGmx7AHtFKjB/qNjw+N6Y
   sVqYRkEY5TB3hw5NPmkxFkmdcW+ec31H0BJJQ3kwk67bpL2gasSD0a0EY
   w==;
X-CSE-ConnectionGUID: v+AUw/InREiRZL35K5TO1A==
X-CSE-MsgGUID: xAkVM+cYRhSaFHBGo4oG8g==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="72075731"
X-IronPort-AV: E=Sophos;i="6.16,308,1744095600"; 
   d="scan'208";a="72075731"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jul 2025 07:28:48 -0700
X-CSE-ConnectionGUID: z99CHPJfRo68dzA2456x3A==
X-CSE-MsgGUID: YcTPcHkrQmWVYq0PMRL6sg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,308,1744095600"; 
   d="scan'208";a="156825383"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 13 Jul 2025 07:28:47 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uaxh6-00087D-34;
	Sun, 13 Jul 2025 14:28:44 +0000
Date: Sun, 13 Jul 2025 22:27:46 +0800
From: kernel test robot <lkp@intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [morimoto:sound-cleanup-2025-07-08 29/38]
 sound/soc/codecs/aw88399.c:2007:36: error: call to undeclared function
 'snd_soc_kcontrol_component'; ISO C99 and later do not support implicit
 function declarations
Message-ID: <202507132207.yZjpyQO8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/morimoto/linux sound-cleanup-2025-07-08
head:   9db3f6e0748555d16c8cc99f7ba5f1278eaa0469
commit: b6cf9d4b757a85581edc443238feb1528a5082ed [29/38] ASoC: soc.h: remove snd_soc_kcontrol_component()
config: i386-randconfig-062-20250713 (https://download.01.org/0day-ci/archive/20250713/202507132207.yZjpyQO8-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250713/202507132207.yZjpyQO8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507132207.yZjpyQO8-lkp@intel.com/

All errors (new ones prefixed by >>):

>> sound/soc/codecs/aw88399.c:2007:36: error: call to undeclared function 'snd_soc_kcontrol_component'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    2007 |         struct snd_soc_component *codec = snd_soc_kcontrol_component(kcontrol);
         |                                           ^
>> sound/soc/codecs/aw88399.c:2007:28: error: incompatible integer to pointer conversion initializing 'struct snd_soc_component *' with an expression of type 'int' [-Wint-conversion]
    2007 |         struct snd_soc_component *codec = snd_soc_kcontrol_component(kcontrol);
         |                                   ^       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/codecs/aw88399.c:2019:36: error: call to undeclared function 'snd_soc_kcontrol_component'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    2019 |         struct snd_soc_component *codec = snd_soc_kcontrol_component(kcontrol);
         |                                           ^
   sound/soc/codecs/aw88399.c:2019:28: error: incompatible integer to pointer conversion initializing 'struct snd_soc_component *' with an expression of type 'int' [-Wint-conversion]
    2019 |         struct snd_soc_component *codec = snd_soc_kcontrol_component(kcontrol);
         |                                   ^       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/codecs/aw88399.c:2041:36: error: call to undeclared function 'snd_soc_kcontrol_component'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    2041 |         struct snd_soc_component *codec = snd_soc_kcontrol_component(kcontrol);
         |                                           ^
   sound/soc/codecs/aw88399.c:2041:28: error: incompatible integer to pointer conversion initializing 'struct snd_soc_component *' with an expression of type 'int' [-Wint-conversion]
    2041 |         struct snd_soc_component *codec = snd_soc_kcontrol_component(kcontrol);
         |                                   ^       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   6 errors generated.


vim +/snd_soc_kcontrol_component +2007 sound/soc/codecs/aw88399.c

8ade6cc7e26175 Weidong Wang 2023-10-25  2003  
29ddce17e90977 Weidong Wang 2025-06-27  2004  static int aw88399_calib_switch_get(struct snd_kcontrol *kcontrol,
29ddce17e90977 Weidong Wang 2025-06-27  2005  				struct snd_ctl_elem_value *ucontrol)
29ddce17e90977 Weidong Wang 2025-06-27  2006  {
29ddce17e90977 Weidong Wang 2025-06-27 @2007  	struct snd_soc_component *codec = snd_soc_kcontrol_component(kcontrol);
29ddce17e90977 Weidong Wang 2025-06-27  2008  	struct aw88399 *aw88399 = snd_soc_component_get_drvdata(codec);
29ddce17e90977 Weidong Wang 2025-06-27  2009  	struct aw_device *aw_dev = aw88399->aw_pa;
29ddce17e90977 Weidong Wang 2025-06-27  2010  
29ddce17e90977 Weidong Wang 2025-06-27  2011  	ucontrol->value.integer.value[0] = aw_dev->cali_desc.cali_switch;
29ddce17e90977 Weidong Wang 2025-06-27  2012  
29ddce17e90977 Weidong Wang 2025-06-27  2013  	return 0;
29ddce17e90977 Weidong Wang 2025-06-27  2014  }
29ddce17e90977 Weidong Wang 2025-06-27  2015  

:::::: The code at line 2007 was first introduced by commit
:::::: 29ddce17e909779633f856ad1c2f111fbf71c0df ASoC: codecs: Add calibration function to aw88399 chip

:::::: TO: Weidong Wang <wangweidong.a@awinic.com>
:::::: CC: Mark Brown <broonie@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
