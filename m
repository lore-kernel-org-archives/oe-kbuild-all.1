Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8122417A314
	for <oe-kbuild-all@lists.linux.dev>; Fri, 25 Apr 2025 07:50:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745567450; cv=none; b=d/s6uzw0WM0j2RpOZMEE0Q6xE9um6IEBRCM+ozaeG/PIQN4tgo0ut6HNMMeJSIAvqbrKRgedLKojHZmoC+rhAFREKk5oy3mXI5i7qb8Zq02PyF+edwZ4YX/XHvigGa76I7is6gLZVG03TDvAsi4A30hSclyIiZI7osEwmqM0CHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745567450; c=relaxed/simple;
	bh=S/a2dhN/34+HwuNQQAVTLlnlBgSZwJDaqTz9D4Zcsa0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QCL5NraE2cmc8o09iAgTEhN4ToZdRFac+eCTfoBEf6vlfLhBP4UzXGkJ6o8Cu4WyS8GU89romsot5CQI4Y7V5yH/OaJwLsQbJlsMhOILQMuy/Uo3E83YM0whzWb+AH8y+kgQHGRpctpHAZsYzeIlS0IgPr7X+BSv7M0ZiB//9Fs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VP0pLP1v; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VP0pLP1v"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745567448; x=1777103448;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=S/a2dhN/34+HwuNQQAVTLlnlBgSZwJDaqTz9D4Zcsa0=;
  b=VP0pLP1v803z6p4TE2A1yfdORD5Va8cAeTVbhTNdjRjX4rSpntLGvJBu
   GqSPl0UlTzGr6XOuoxE480A/xp7u8iVaIjWk9W+yO2dCyyQRLP0BDFFVN
   GhmB5KPNOxybKQ6GWx4EhmytNnLJ/6YdG8xmtz4eSHBHiELpp95FVKYvZ
   eV1RV7MKUR4Yhm8i2w+rkZ8S1ZINXC9l2ipTyewYYzjoW1C6bPaJUty2P
   1tN1Iq/OwcGrM4H6a6/dR5B1/f4Z+0KzaYpIZHOPD3dAkeeloLICLWes2
   ta/M7gaKjUW1uSxq7UMIRvNyfdMOLqVnH5W8c6EVyNFgHGZmnLghilvVG
   g==;
X-CSE-ConnectionGUID: 2vaZwyjwQmSIMYM5e/7rHw==
X-CSE-MsgGUID: 45Aat7z0SF22NpeducWDpg==
X-IronPort-AV: E=McAfee;i="6700,10204,11413"; a="47315305"
X-IronPort-AV: E=Sophos;i="6.15,238,1739865600"; 
   d="scan'208";a="47315305"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2025 00:50:47 -0700
X-CSE-ConnectionGUID: ceLnXWX+T++Yfl7Ts633aQ==
X-CSE-MsgGUID: CyVXlUEkTbW8wd17Ra2+nw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,238,1739865600"; 
   d="scan'208";a="132583647"
Received: from lkp-server01.sh.intel.com (HELO 050dd05385d1) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 25 Apr 2025 00:50:47 -0700
Received: from kbuild by 050dd05385d1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u8Dpc-0004vq-23;
	Fri, 25 Apr 2025 07:50:44 +0000
Date: Fri, 25 Apr 2025 15:50:29 +0800
From: kernel test robot <lkp@intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [morimoto:sound-cleanup-2025-04-23 111/116]
 sound/soc/codecs/simple-mux.c:62:48: error: dereferencing pointer to
 incomplete type 'struct snd_soc_dapm_context'
Message-ID: <202504251554.i61pYFGx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/morimoto/linux sound-cleanup-2025-04-23
head:   66104ef95f2f8e651b29bf32aaa483868492887e
commit: a3f4e8cf9db06f4768bb6a874cfe3c3378b4836c [111/116] hoge
config: s390-randconfig-002-20250425 (https://download.01.org/0day-ci/archive/20250425/202504251554.i61pYFGx-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250425/202504251554.i61pYFGx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504251554.i61pYFGx-lkp@intel.com/

All errors (new ones prefixed by >>):

   sound/soc/codecs/simple-mux.c: In function 'simple_mux_control_get':
   sound/soc/codecs/simple-mux.c:37:38: error: implicit declaration of function 'snd_soc_dapm_kcontrol_dapm'; did you mean 'snd_soc_dapm_kcontrol_to_dapm'? [-Werror=implicit-function-declaration]
     struct snd_soc_dapm_context *dapm = snd_soc_dapm_kcontrol_dapm(kcontrol);
                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~
                                         snd_soc_dapm_kcontrol_to_dapm
   sound/soc/codecs/simple-mux.c:37:38: warning: initialization makes pointer from integer without a cast [-Wint-conversion]
   sound/soc/codecs/simple-mux.c: In function 'simple_mux_control_put':
   sound/soc/codecs/simple-mux.c:49:38: warning: initialization makes pointer from integer without a cast [-Wint-conversion]
     struct snd_soc_dapm_context *dapm = snd_soc_dapm_kcontrol_dapm(kcontrol);
                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~
>> sound/soc/codecs/simple-mux.c:62:48: error: dereferencing pointer to incomplete type 'struct snd_soc_dapm_context'
     if (priv->idle_state != MUX_IDLE_AS_IS && dapm->bias_level < SND_SOC_BIAS_PREPARE)
                                                   ^~
   cc1: some warnings being treated as errors


vim +62 sound/soc/codecs/simple-mux.c

342fbb7578d174 Alexandre Belloni 2020-12-05  33  
342fbb7578d174 Alexandre Belloni 2020-12-05  34  static int simple_mux_control_get(struct snd_kcontrol *kcontrol,
342fbb7578d174 Alexandre Belloni 2020-12-05  35  				  struct snd_ctl_elem_value *ucontrol)
342fbb7578d174 Alexandre Belloni 2020-12-05  36  {
342fbb7578d174 Alexandre Belloni 2020-12-05 @37  	struct snd_soc_dapm_context *dapm = snd_soc_dapm_kcontrol_dapm(kcontrol);
342fbb7578d174 Alexandre Belloni 2020-12-05  38  	struct snd_soc_component *c = snd_soc_dapm_to_component(dapm);
342fbb7578d174 Alexandre Belloni 2020-12-05  39  	struct simple_mux *priv = snd_soc_component_get_drvdata(c);
342fbb7578d174 Alexandre Belloni 2020-12-05  40  
342fbb7578d174 Alexandre Belloni 2020-12-05  41  	ucontrol->value.enumerated.item[0] = priv->mux;
342fbb7578d174 Alexandre Belloni 2020-12-05  42  
342fbb7578d174 Alexandre Belloni 2020-12-05  43  	return 0;
342fbb7578d174 Alexandre Belloni 2020-12-05  44  }
342fbb7578d174 Alexandre Belloni 2020-12-05  45  
342fbb7578d174 Alexandre Belloni 2020-12-05  46  static int simple_mux_control_put(struct snd_kcontrol *kcontrol,
342fbb7578d174 Alexandre Belloni 2020-12-05  47  				  struct snd_ctl_elem_value *ucontrol)
342fbb7578d174 Alexandre Belloni 2020-12-05  48  {
342fbb7578d174 Alexandre Belloni 2020-12-05  49  	struct snd_soc_dapm_context *dapm = snd_soc_dapm_kcontrol_dapm(kcontrol);
342fbb7578d174 Alexandre Belloni 2020-12-05  50  	struct soc_enum *e = (struct soc_enum *)kcontrol->private_value;
342fbb7578d174 Alexandre Belloni 2020-12-05  51  	struct snd_soc_component *c = snd_soc_dapm_to_component(dapm);
342fbb7578d174 Alexandre Belloni 2020-12-05  52  	struct simple_mux *priv = snd_soc_component_get_drvdata(c);
342fbb7578d174 Alexandre Belloni 2020-12-05  53  
342fbb7578d174 Alexandre Belloni 2020-12-05  54  	if (ucontrol->value.enumerated.item[0] > e->items)
342fbb7578d174 Alexandre Belloni 2020-12-05  55  		return -EINVAL;
342fbb7578d174 Alexandre Belloni 2020-12-05  56  
342fbb7578d174 Alexandre Belloni 2020-12-05  57  	if (priv->mux == ucontrol->value.enumerated.item[0])
342fbb7578d174 Alexandre Belloni 2020-12-05  58  		return 0;
342fbb7578d174 Alexandre Belloni 2020-12-05  59  
342fbb7578d174 Alexandre Belloni 2020-12-05  60  	priv->mux = ucontrol->value.enumerated.item[0];
342fbb7578d174 Alexandre Belloni 2020-12-05  61  
2b974284aa073d Hendrik v. Raven  2024-11-14 @62  	if (priv->idle_state != MUX_IDLE_AS_IS && dapm->bias_level < SND_SOC_BIAS_PREPARE)
2b974284aa073d Hendrik v. Raven  2024-11-14  63  		return 0;
2b974284aa073d Hendrik v. Raven  2024-11-14  64  
342fbb7578d174 Alexandre Belloni 2020-12-05  65  	gpiod_set_value_cansleep(priv->gpiod_mux, priv->mux);
342fbb7578d174 Alexandre Belloni 2020-12-05  66  
342fbb7578d174 Alexandre Belloni 2020-12-05  67  	return snd_soc_dapm_mux_update_power(dapm, kcontrol,
342fbb7578d174 Alexandre Belloni 2020-12-05  68  					     ucontrol->value.enumerated.item[0],
342fbb7578d174 Alexandre Belloni 2020-12-05  69  					     e, NULL);
342fbb7578d174 Alexandre Belloni 2020-12-05  70  }
342fbb7578d174 Alexandre Belloni 2020-12-05  71  

:::::: The code at line 62 was first introduced by commit
:::::: 2b974284aa073d6e2936f9032e8ad7b99480b5b8 ASoc: simple-mux: add idle-state support

:::::: TO: Hendrik v. Raven <h.v.raven@merzmedtech.de>
:::::: CC: Mark Brown <broonie@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
