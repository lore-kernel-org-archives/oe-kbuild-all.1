Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 214B727FB1C
	for <oe-kbuild-all@lists.linux.dev>; Mon,  1 Jun 2026 20:18:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780345111; cv=none; b=CzuOoVhUczzt735EZ5H0m3oapTQyOgt2n0Rhf3ro2UH8fyBAmwIwlaNzr2Scd/1iMOJna2Wr/7Q73CoToqV/isvRxU9uAktEEMtEQ2FVaX7t7emFTzHimuHjYfAKgD/s2CwtQN16asHSsjH1VrclO7t4348tKGEUxqyJToZuEWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780345111; c=relaxed/simple;
	bh=shSis1mescrbaGQRGV8jhIj8XS9sPA4qMqgPfXu0Azc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=CfuVJUhq7x9lZiGzwtRwtU6pGdBEY07eM5TMD4SiFYBZuOqEoPWIjcAzCIN7DyqJ7Ut/Y+v2DLgkXCQ40zpetrBohJFltxLMtxom0exUq6fv+wBzSBHG0iRAIwEPyDoATd8537cQqsBhizhK9BbyI1WZdXOvrL3RnUGiw1y8x98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=d4IclNGT; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d4IclNGT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780345109; x=1811881109;
  h=date:from:to:cc:subject:message-id;
  bh=shSis1mescrbaGQRGV8jhIj8XS9sPA4qMqgPfXu0Azc=;
  b=d4IclNGTKQVUu4NymM3oB2A6oe5VHjZ8+Ds781cCJto7BwXCTS14oeGM
   4SB5s5AxtAUnfip2Uff8m+1Fi4xLY/u1dNi4PRwpFaTrYepz3aQcFKb8/
   OZXoSIj6MKX+lNdHaH9XCTqGV4uqNsMfY/Ufc0cqWuBIq/b/a+FnLZB0K
   /8VxfSAUcj1YGLAVVLRHEKTqfGUNLRNp4bCHPuLhYjhNMPKd5FmByFuIA
   6UUhTOMOHDCCtnGAKhLf+HtR7wR0V5kSv4T2yCCab3fxfePzEGhVUoDvm
   44OXS4xqvBvnwN/lSei1vyXk7lwnFOFV5rOeiWfGsS1OcW2fGUfH8uUim
   w==;
X-CSE-ConnectionGUID: LZSizHUWTY+rEcjQtOx29w==
X-CSE-MsgGUID: vBqhHf1gTPKjiJDpnP3S3Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11804"; a="68651167"
X-IronPort-AV: E=Sophos;i="6.24,181,1774335600"; 
   d="scan'208";a="68651167"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2026 13:18:28 -0700
X-CSE-ConnectionGUID: e+Sb2qpnQI2FhvGLZGePjA==
X-CSE-MsgGUID: 8Pfeuzm/T1yPrEP58Od02A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,181,1774335600"; 
   d="scan'208";a="248603900"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 01 Jun 2026 13:18:27 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wU95c-00000000B3U-1Jec;
	Mon, 01 Jun 2026 20:18:24 +0000
Date: Tue, 02 Jun 2026 04:17:39 +0800
From: kernel test robot <lkp@intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [morimoto:sound-cleanup-2026-06-01-3 290/290]
 sound/soc/codecs/rt722-sdca.c:586:43: error: dereferencing pointer to
 incomplete type 'struct snd_soc_component'
Message-ID: <202606020424.v3QArvun-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/morimoto/linux sound-cleanup-2026-06-01-3
head:   1ef39bbdce9099b285b9702e22c4defc277e42dd
commit: a9f127425c2b0e25ca695cfacf153f06744e2f80 [290/290] ASoC: soc-component: capsuling Component
config: arm-randconfig-002-20260602 (https://download.01.org/0day-ci/archive/20260602/202606020424.v3QArvun-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260602/202606020424.v3QArvun-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606020424.v3QArvun-lkp@intel.com/

All errors (new ones prefixed by >>):

   sound/soc/codecs/rt722-sdca.c: In function 'rt722_cae_update_put':
   sound/soc/codecs/rt722-sdca.c:579:34: error: implicit declaration of function 'snd_soc_component_get_drvdata'; did you mean 'snd_soc_component_set_jack'? [-Werror=implicit-function-declaration]
     struct rt722_sdca_priv *rt722 = snd_soc_component_get_drvdata(component);
                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                                     snd_soc_component_set_jack
   sound/soc/codecs/rt722-sdca.c:579:34: warning: initialization of 'struct rt722_sdca_priv *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
>> sound/soc/codecs/rt722-sdca.c:586:43: error: dereferencing pointer to incomplete type 'struct snd_soc_component'
     ret = pm_runtime_resume_and_get(component->dev);
                                              ^~
   sound/soc/codecs/rt722-sdca.c: In function 'rt722_cae_update_get':
   sound/soc/codecs/rt722-sdca.c:617:34: warning: initialization of 'struct rt722_sdca_priv *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     struct rt722_sdca_priv *rt722 = snd_soc_component_get_drvdata(component);
                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/codecs/rt722-sdca.c: In function 'rt722_sdca_fu06_playback_get':
   sound/soc/codecs/rt722-sdca.c:829:34: warning: initialization of 'struct rt722_sdca_priv *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     struct rt722_sdca_priv *rt722 = snd_soc_component_get_drvdata(component);
                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/codecs/rt722-sdca.c: In function 'rt722_sdca_fu06_playback_put':
   sound/soc/codecs/rt722-sdca.c:840:34: warning: initialization of 'struct rt722_sdca_priv *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     struct rt722_sdca_priv *rt722 = snd_soc_component_get_drvdata(component);
                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +586 sound/soc/codecs/rt722-sdca.c

14b5795b633ca0 Jack Yu 2026-05-20  574  
14b5795b633ca0 Jack Yu 2026-05-20  575  static int rt722_cae_update_put(struct snd_kcontrol *kcontrol,
14b5795b633ca0 Jack Yu 2026-05-20  576  				 struct snd_ctl_elem_value *ucontrol)
14b5795b633ca0 Jack Yu 2026-05-20  577  {
14b5795b633ca0 Jack Yu 2026-05-20  578  	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
14b5795b633ca0 Jack Yu 2026-05-20  579  	struct rt722_sdca_priv *rt722 = snd_soc_component_get_drvdata(component);
14b5795b633ca0 Jack Yu 2026-05-20  580  	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
14b5795b633ca0 Jack Yu 2026-05-20  581  	int ret, changed = 0;
14b5795b633ca0 Jack Yu 2026-05-20  582  
14b5795b633ca0 Jack Yu 2026-05-20  583  	if (!rt722->hw_init)
14b5795b633ca0 Jack Yu 2026-05-20  584  		return 0;
14b5795b633ca0 Jack Yu 2026-05-20  585  
14b5795b633ca0 Jack Yu 2026-05-20 @586  	ret = pm_runtime_resume_and_get(component->dev);
14b5795b633ca0 Jack Yu 2026-05-20  587  	if (ret < 0 && ret != -EACCES)
14b5795b633ca0 Jack Yu 2026-05-20  588  		return ret;
14b5795b633ca0 Jack Yu 2026-05-20  589  
14b5795b633ca0 Jack Yu 2026-05-20  590  	if (ucontrol->value.integer.value[0]) {
14b5795b633ca0 Jack Yu 2026-05-20  591  		if (snd_soc_dapm_get_bias_level(dapm) == SND_SOC_BIAS_OFF) {
14b5795b633ca0 Jack Yu 2026-05-20  592  			ret = rt722_cae_load(rt722);
14b5795b633ca0 Jack Yu 2026-05-20  593  			if (ret) {
14b5795b633ca0 Jack Yu 2026-05-20  594  				dev_err(component->dev, "CAE load failed: %d\n", ret);
14b5795b633ca0 Jack Yu 2026-05-20  595  				goto out;
14b5795b633ca0 Jack Yu 2026-05-20  596  			} else
14b5795b633ca0 Jack Yu 2026-05-20  597  				changed = 1;
14b5795b633ca0 Jack Yu 2026-05-20  598  		}
14b5795b633ca0 Jack Yu 2026-05-20  599  	} else {
14b5795b633ca0 Jack Yu 2026-05-20  600  		if (rt722->cae_update_done) {
14b5795b633ca0 Jack Yu 2026-05-20  601  			rt722->cae_update_done = 0;
14b5795b633ca0 Jack Yu 2026-05-20  602  			changed = 1;
14b5795b633ca0 Jack Yu 2026-05-20  603  		}
14b5795b633ca0 Jack Yu 2026-05-20  604  	}
14b5795b633ca0 Jack Yu 2026-05-20  605  
14b5795b633ca0 Jack Yu 2026-05-20  606  out:
14b5795b633ca0 Jack Yu 2026-05-20  607  	pm_runtime_mark_last_busy(component->dev);
14b5795b633ca0 Jack Yu 2026-05-20  608  	pm_runtime_put_autosuspend(component->dev);
14b5795b633ca0 Jack Yu 2026-05-20  609  
14b5795b633ca0 Jack Yu 2026-05-20  610  	return ret < 0 ? ret : changed;
14b5795b633ca0 Jack Yu 2026-05-20  611  }
14b5795b633ca0 Jack Yu 2026-05-20  612  

:::::: The code at line 586 was first introduced by commit
:::::: 14b5795b633ca0a5af4d3d94cbe2ac98598df18a ASoC: rt722-sdca: Add a control to support CAE firmware update

:::::: TO: Jack Yu <jack.yu@realtek.com>
:::::: CC: Mark Brown <broonie@kernel.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
