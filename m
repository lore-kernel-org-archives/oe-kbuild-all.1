Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3609F70805
	for <oe-kbuild-all@lists.linux.dev>; Wed, 23 Jul 2025 03:49:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753242564; cv=none; b=JcK00/e5R0r2A5EYc+rJVrLuB3iSCGXjWbDlABpiz/6l1BVm6zBU2QevX+Tfec5C4Fhfs3W5zt8pIXenybLjXqydUAmcY3RwwGvUz8vcxwS6yL12aGTdY8UMe8XyWCYFmMCJBowJXeO/a7o7194dJDCg8C3qNCDgmxC0KGp9T7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753242564; c=relaxed/simple;
	bh=G8lPw1EG0um2FS/j5wVF+wS1pPnoYpEOZ7uGENFrC+Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=N15w+9Z5A6f9kHjG+q1UbmF/aFqBXVaec3eQ68PBMtCSC4BtC+yn8zp5ONuruPNjJdrm+pTrdqmt3t6hEfhb7C2aImQJPv0ZkCPafVQv0+fp5l4km5K1t/3XB1EvVSt3CEzcUkZz/sF0eFImFziII/z16EPm5RvT19Ygb0MXG9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Hbdp11Hi; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Hbdp11Hi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753242562; x=1784778562;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=G8lPw1EG0um2FS/j5wVF+wS1pPnoYpEOZ7uGENFrC+Y=;
  b=Hbdp11Hi9rPMWi88MOfR5yaDOSLfVAo3wjH24oOnb+0XpiZgyPDOSSP+
   jJjiXEBDhcgoUQjGweDm5DkPe0UvO9dR+v+ewBGfi8UXRFhhqNIytQcUi
   /Au3T5Why2J0qW25yRZmmwjjcALjVl97Tn9FXu+9/lwyB2AzJwngUc+TA
   2skE4g1ZUVRr8O3dgEN26JSHLnE5wU2+9L+PfPaTrCMXpPSHzRlSxTBCj
   VoWVxaXs421LHFFmLpj8wXEaTs+fRlMEbU72K55gVAqcvqBtJ7EQMVTUq
   8B4WqisSvnNzy9gXbv/lHqMbY0WveOLAIhHj1qzUm7nJEQvRxgatWkhbk
   Q==;
X-CSE-ConnectionGUID: 2FpyytFlSKCdfqdb7c2yGA==
X-CSE-MsgGUID: ++c3TGJ/Sw+cbC7Z9wXprw==
X-IronPort-AV: E=McAfee;i="6800,10657,11500"; a="59312434"
X-IronPort-AV: E=Sophos;i="6.16,333,1744095600"; 
   d="scan'208";a="59312434"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jul 2025 20:49:22 -0700
X-CSE-ConnectionGUID: IswNAf0VQdGT6MBMxRXs4A==
X-CSE-MsgGUID: oFxkRgY2T5OgYrCLICAGAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,333,1744095600"; 
   d="scan'208";a="163592287"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 22 Jul 2025 20:49:20 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ueQTm-000Ivl-1f;
	Wed, 23 Jul 2025 03:49:18 +0000
Date: Wed, 23 Jul 2025 11:49:06 +0800
From: kernel test robot <lkp@intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [morimoto:sound-cleanup-2025-07-08-3 28/37]
 sound/soc/codecs/aw88399.c:2007:43: error: implicit declaration of function
 'snd_soc_kcontrol_component'; did you mean
 'snd_soc_dapm_kcontrol_component'?
Message-ID: <202507231113.NQNelPdG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/morimoto/linux sound-cleanup-2025-07-08-3
head:   5ee8e2ccfbdc736f9012d0af5ba8690a53e2d06f
commit: 819da28af50185d52aac895d5191d88fb800b185 [28/37] ASoC: soc.h: remove snd_soc_kcontrol_component()
config: mips-allyesconfig (https://download.01.org/0day-ci/archive/20250723/202507231113.NQNelPdG-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250723/202507231113.NQNelPdG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507231113.NQNelPdG-lkp@intel.com/

All errors (new ones prefixed by >>):

   sound/soc/codecs/aw88399.c: In function 'aw88399_calib_switch_get':
>> sound/soc/codecs/aw88399.c:2007:43: error: implicit declaration of function 'snd_soc_kcontrol_component'; did you mean 'snd_soc_dapm_kcontrol_component'? [-Wimplicit-function-declaration]
    2007 |         struct snd_soc_component *codec = snd_soc_kcontrol_component(kcontrol);
         |                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                           snd_soc_dapm_kcontrol_component
>> sound/soc/codecs/aw88399.c:2007:43: error: initialization of 'struct snd_soc_component *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
   sound/soc/codecs/aw88399.c: In function 'aw88399_calib_switch_set':
   sound/soc/codecs/aw88399.c:2019:43: error: initialization of 'struct snd_soc_component *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
    2019 |         struct snd_soc_component *codec = snd_soc_kcontrol_component(kcontrol);
         |                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/codecs/aw88399.c: In function 'aw88399_calib_set':
   sound/soc/codecs/aw88399.c:2041:43: error: initialization of 'struct snd_soc_component *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
    2041 |         struct snd_soc_component *codec = snd_soc_kcontrol_component(kcontrol);
         |                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~


vim +2007 sound/soc/codecs/aw88399.c

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
