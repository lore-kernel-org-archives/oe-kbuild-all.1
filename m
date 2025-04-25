Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1415722E3F3
	for <oe-kbuild-all@lists.linux.dev>; Fri, 25 Apr 2025 07:40:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745566850; cv=none; b=D2TlBxa5ccK2WgmF0w49CRfQ5sRep+Q757goV3ib0o+GwrftgSMKh2bsDOlZDrR9u/M00mpy4Er2vELimLVcpfhILut+xc4KsaJkfYTKGh8Zj9Dgcj9zcfMJ0K2PmihPxxwwcRZ58gvxoy+7KAIRWI9BEEgtzBrt2pq4IE5fmqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745566850; c=relaxed/simple;
	bh=spupJs7OkE8M51uwE3da+d5uC1+sytc+72OfR2NJBMA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SUoL5CJKeQ/bi4XaBT5YumWyvm/FkKHVdXNAxR22qziOEgNuc/bnA1MFXaxBR2wedtl0Z5fpxmPMIcXopl+gG+ERXjmRTZSGaX1Yn+bUW30RWeAjzwiYYArZXg878NMxOQW5LhHWDcAB+QSM+jm4rUrEpYIIa7VRfLGDqsGeoHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lmjrceXE; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lmjrceXE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745566848; x=1777102848;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=spupJs7OkE8M51uwE3da+d5uC1+sytc+72OfR2NJBMA=;
  b=lmjrceXE/0frTn67VGEeMHwhjGkkCKVSPtzJg0Vghem2cdhIw66/Zzf/
   DW/kMnTNJ55R07wW2f75H2l9yHle/hleXDWNXHi4YktnbAkmp5oPWS6Jn
   qDlnvRIEHrAdTi72JyFIht77rydiFuPMdQDPIQKqQHeksyEZ5o8odfG1S
   eVxriV+QzjLMu/pz/1UmEF1vSksQ6hHn5zC/tstcdV9mAnradWL4Y00Qj
   Njli/eYz6BqhwH1IngXLE4viMhY2lk5uva72UUa5/nzWToPVaIfdq0695
   oaRMTOOhqM4hcvXhsD9TlA4ah6+6JuYB1T707zuzjW2s3aG+mjBZz9UdV
   g==;
X-CSE-ConnectionGUID: QEnr0yoAREuMFyBA3O08ZQ==
X-CSE-MsgGUID: zn4pHPvSRYCy2rXhIIlbBA==
X-IronPort-AV: E=McAfee;i="6700,10204,11413"; a="46454302"
X-IronPort-AV: E=Sophos;i="6.15,238,1739865600"; 
   d="scan'208";a="46454302"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2025 00:40:47 -0700
X-CSE-ConnectionGUID: bcQwHDKjQ2Wx8Ntxyq1fxg==
X-CSE-MsgGUID: H09JQtMoSeq4spri0gJ29w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,238,1739865600"; 
   d="scan'208";a="137830955"
Received: from lkp-server01.sh.intel.com (HELO 050dd05385d1) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 25 Apr 2025 00:40:46 -0700
Received: from kbuild by 050dd05385d1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u8Dfv-0004vN-29;
	Fri, 25 Apr 2025 07:40:43 +0000
Date: Fri, 25 Apr 2025 15:39:50 +0800
From: kernel test robot <lkp@intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [morimoto:sound-cleanup-2025-04-23 110/116]
 sound/soc/codecs/simple-mux.c:62:55: error: invalid use of undefined type
 'struct snd_soc_dapm_context'
Message-ID: <202504251524.MfNbiDhY-lkp@intel.com>
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
commit: cd5502a8955a4d68f36c94affdeecf657f767438 [110/116] ASoC: soc-dapm: move struct snd_soc_dapm_context
config: arc-randconfig-001-20250425 (https://download.01.org/0day-ci/archive/20250425/202504251524.MfNbiDhY-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250425/202504251524.MfNbiDhY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504251524.MfNbiDhY-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from sound/soc/codecs/simple-mux.c:11:
   include/sound/soc.h: In function '_snd_soc_dapm_mutex_lock_root_d':
   include/sound/soc.h:1485:45: error: invalid use of undefined type 'struct snd_soc_dapm_context'
    1485 |         _snd_soc_dapm_mutex_lock_root_c(dapm->card);
         |                                             ^~
   include/sound/soc.h: In function '_snd_soc_dapm_mutex_lock_d':
   include/sound/soc.h:1490:40: error: invalid use of undefined type 'struct snd_soc_dapm_context'
    1490 |         _snd_soc_dapm_mutex_lock_c(dapm->card);
         |                                        ^~
   include/sound/soc.h: In function '_snd_soc_dapm_mutex_unlock_d':
   include/sound/soc.h:1495:42: error: invalid use of undefined type 'struct snd_soc_dapm_context'
    1495 |         _snd_soc_dapm_mutex_unlock_c(dapm->card);
         |                                          ^~
   include/sound/soc.h: In function '_snd_soc_dapm_mutex_assert_held_d':
   include/sound/soc.h:1500:47: error: invalid use of undefined type 'struct snd_soc_dapm_context'
    1500 |         _snd_soc_dapm_mutex_assert_held_c(dapm->card);
         |                                               ^~
   sound/soc/codecs/simple-mux.c: In function 'simple_mux_control_get':
   sound/soc/codecs/simple-mux.c:37:45: error: implicit declaration of function 'snd_soc_dapm_kcontrol_dapm'; did you mean 'snd_soc_dapm_kcontrol_to_dapm'? [-Wimplicit-function-declaration]
      37 |         struct snd_soc_dapm_context *dapm = snd_soc_dapm_kcontrol_dapm(kcontrol);
         |                                             ^~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                             snd_soc_dapm_kcontrol_to_dapm
   sound/soc/codecs/simple-mux.c:37:45: error: initialization of 'struct snd_soc_dapm_context *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
   sound/soc/codecs/simple-mux.c: In function 'simple_mux_control_put':
   sound/soc/codecs/simple-mux.c:49:45: error: initialization of 'struct snd_soc_dapm_context *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
      49 |         struct snd_soc_dapm_context *dapm = snd_soc_dapm_kcontrol_dapm(kcontrol);
         |                                             ^~~~~~~~~~~~~~~~~~~~~~~~~~
>> sound/soc/codecs/simple-mux.c:62:55: error: invalid use of undefined type 'struct snd_soc_dapm_context'
      62 |         if (priv->idle_state != MUX_IDLE_AS_IS && dapm->bias_level < SND_SOC_BIAS_PREPARE)
         |                                                       ^~


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
