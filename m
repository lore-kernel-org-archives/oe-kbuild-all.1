Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CAB82F60CC
	for <oe-kbuild-all@lists.linux.dev>; Tue,  6 Oct 2026 21:44:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791323058; cv=none; b=aPu/5rsAxx66/xF4Jl70zrhertSJXweRYiBPYegOfACf4ks0r6QMFHYqPZTLK726S/QAIqXNyGagn9Bb060DH/z1ii57RjnhDfVgCdT8lKm1rFshKIrSR8riyX2ZCoQtXa1mVhxv3GR8OcE8Uqejx/1D2QQ5o+ARvnvfvUFN/p4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791323058; c=relaxed/simple;
	bh=Rk4hGqgq94hl6eh7c0gFk7TqxXCIN0/sB1ofnJ3IVAE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=bhmKsLkvu4LcLTwzdr3FwH+WI1aahNyhKQI/seyBhx9Q2lVyAHa8zPElTB+osKEmXTG3xPhFbFLm+18KhVp2Cy/86Nk2X/Rot8rYhfsuFTcYxZOkpCqc68SWdaBp7POf5X/vMhXiPVVYNof9JI2Gy3XVl79dF1HK8KIgyKUHUqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=D6GJtSxi; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="D6GJtSxi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791323057; x=1822859057;
  h=date:from:to:cc:subject:message-id;
  bh=Rk4hGqgq94hl6eh7c0gFk7TqxXCIN0/sB1ofnJ3IVAE=;
  b=D6GJtSxiDYl4Sr0SFDHkUtis2XmgBSHYSuQXeTGu5aSNLYmU7sPClYmU
   jTod4IK24WCavVqvhyVFPLyvvO1W20gi+PS9Tq2gqz9l2TntINlcxr1OI
   L61ym/jE1f1koAglxdUP2AYBd5LqQlk/NDkbdbjp//TWtwquq00bFo3qv
   +cw3NMsrZMgE6jszdaHQ4m/c4yBmX4uIvizYcDYxzn7tjIbOf+LYR1a+3
   ufCd6R0xszKnDnGCLfgX0YFP6N0aPru6IQlkxlyzw7XfcFNm2pxJnY2Fy
   7OHofae2hlfa0cYQFD0KDM7wHjOgqlBxeNw5VasIRhka4BQtikRVdBYhm
   A==;
X-CSE-ConnectionGUID: dZJZuzyjTN+vmI7Tbi0TYg==
X-CSE-MsgGUID: kNUZRQYqQhGhqNK30eTfpA==
X-IronPort-AV: E=McAfee;i="6800,10657,11927"; a="66238"
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; 
   d="scan'208";a="66238"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Oct 2026 14:44:16 -0700
X-CSE-ConnectionGUID: hFMZR/+2TwWVDbx0+uUcQg==
X-CSE-MsgGUID: n7Cj31SxTmGCXmLnRK/TWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; 
   d="scan'208";a="303546246"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 06 Oct 2026 14:44:14 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xECxH-000000002Aa-2xJr;
	Tue, 06 Oct 2026 21:44:11 +0000
Date: Wed, 07 Oct 2026 05:43:21 +0800
From: kernel test robot <lkp@intel.com>
To: Venkata Prasad Potturu <venkataprasad.potturu@amd.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Alexander Deucher <Alexander.Deucher@amd.com>
Subject: [agd5f:amd-staging-drm-next 3171/3485]
 sound/soc/amd/acp/acp-mach-common.c:907:34: warning: unused variable
 'drvdata'
Message-ID: <202610070505.UYyHDTGm-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://gitlab.freedesktop.org/agd5f/linux.git amd-staging-drm-next
head:   53750a937420a01acf41bf74010557666f679aab
commit: 89df31f218a11148943525cea7dfae02e881f2d3 [3171/3485] ASoC: amd: acp: Remove amp_codec_id condition check in acp_card_max98388_init
config: x86_64-randconfig-1007-20261006 (https://download.01.org/0day-ci/archive/20261007/202610070505.UYyHDTGm-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261007/202610070505.UYyHDTGm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610070505.UYyHDTGm-lkp@intel.com/

All warnings (new ones prefixed by >>):

   sound/soc/amd/acp/acp-mach-common.c: In function 'acp_card_max98388_init':
>> sound/soc/amd/acp/acp-mach-common.c:907:34: warning: unused variable 'drvdata' [-Wunused-variable]
     907 |         struct acp_card_drvdata *drvdata = card->drvdata;
         |                                  ^~~~~~~


vim +/drvdata +907 sound/soc/amd/acp/acp-mach-common.c

ac91c8c89782d7 Venkata Prasad Potturu 2023-07-07  902  
ac91c8c89782d7 Venkata Prasad Potturu 2023-07-07  903  static int acp_card_max98388_init(struct snd_soc_pcm_runtime *rtd)
ac91c8c89782d7 Venkata Prasad Potturu 2023-07-07  904  {
ac91c8c89782d7 Venkata Prasad Potturu 2023-07-07  905  	struct snd_soc_card *card = rtd->card;
6b1b50ed3c9409 Kuninori Morimoto      2025-11-11  906  	struct snd_soc_dapm_context *dapm = snd_soc_card_to_dapm(card);
ac91c8c89782d7 Venkata Prasad Potturu 2023-07-07 @907  	struct acp_card_drvdata *drvdata = card->drvdata;
ac91c8c89782d7 Venkata Prasad Potturu 2023-07-07  908  	int ret;
ac91c8c89782d7 Venkata Prasad Potturu 2023-07-07  909  
6b1b50ed3c9409 Kuninori Morimoto      2025-11-11  910  	ret = snd_soc_dapm_new_controls(dapm, max98388_widgets,
ac91c8c89782d7 Venkata Prasad Potturu 2023-07-07  911  					ARRAY_SIZE(max98388_widgets));
ac91c8c89782d7 Venkata Prasad Potturu 2023-07-07  912  
ac91c8c89782d7 Venkata Prasad Potturu 2023-07-07  913  	if (ret) {
ac91c8c89782d7 Venkata Prasad Potturu 2023-07-07  914  		dev_err(rtd->dev, "unable to add widget dapm controls, ret %d\n", ret);
ac91c8c89782d7 Venkata Prasad Potturu 2023-07-07  915  		/* Don't need to add routes if widget addition failed */
ac91c8c89782d7 Venkata Prasad Potturu 2023-07-07  916  		return ret;
ac91c8c89782d7 Venkata Prasad Potturu 2023-07-07  917  	}
919a4a941863c5 Alper Nebi Yasak       2023-08-18  918  
919a4a941863c5 Alper Nebi Yasak       2023-08-18  919  	ret = snd_soc_add_card_controls(card, max98388_controls,
919a4a941863c5 Alper Nebi Yasak       2023-08-18  920  					ARRAY_SIZE(max98388_controls));
919a4a941863c5 Alper Nebi Yasak       2023-08-18  921  	if (ret) {
919a4a941863c5 Alper Nebi Yasak       2023-08-18  922  		dev_err(rtd->dev, "unable to add card controls, ret %d\n", ret);
919a4a941863c5 Alper Nebi Yasak       2023-08-18  923  		return ret;
919a4a941863c5 Alper Nebi Yasak       2023-08-18  924  	}
919a4a941863c5 Alper Nebi Yasak       2023-08-18  925  
6b1b50ed3c9409 Kuninori Morimoto      2025-11-11  926  	return snd_soc_dapm_add_routes(dapm, max98388_map,
ac91c8c89782d7 Venkata Prasad Potturu 2023-07-07  927  				       ARRAY_SIZE(max98388_map));
ac91c8c89782d7 Venkata Prasad Potturu 2023-07-07  928  }
ac91c8c89782d7 Venkata Prasad Potturu 2023-07-07  929  

:::::: The code at line 907 was first introduced by commit
:::::: ac91c8c89782d7d0781120a74c9bd939e3ce2831 ASoC: amd: acp: Add machine driver support for max98388 codec

:::::: TO: Venkata Prasad Potturu <venkataprasad.potturu@amd.com>
:::::: CC: Mark Brown <broonie@kernel.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
