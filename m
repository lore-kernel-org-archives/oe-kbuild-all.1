Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8DB822D4D9
	for <oe-kbuild-all@lists.linux.dev>; Fri, 25 Apr 2025 06:55:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745564146; cv=none; b=plzq95uYiFxTmcC1eIXb1m0u5JEVatxThy6XkhRP6SCKrdGNSTJ7o67RJ+6FIkdN0J+tpNiS0TKlxvnD8Xp8h01BJim2PHuLgYqbCUIxrzLfaqNk7MJxCjVc1piFk+vvsegHaEW+FXaLRnyWU3vOZSaYqvWD9t1De5Tbt681W4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745564146; c=relaxed/simple;
	bh=Wmn64HiayioNtpfTjqhKK7duyBEgHi/Cf836maYE0nU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Q1LRldOxTQuADg949WLqfrYjWgSoZDTC7SDqoApv2M9xq48utOxQNE08fM4XYvEz37FObv39Z45+JZPrDc/zIPjhPKKOalXF+UGZvlrTqlBXeBqSo0/9d02USBY4XWJ5GxRgG+3lZqxbxQ8AU/TLiyzFMbMoeVjrJ+l+nspAvGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LB3oQUlQ; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LB3oQUlQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745564144; x=1777100144;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Wmn64HiayioNtpfTjqhKK7duyBEgHi/Cf836maYE0nU=;
  b=LB3oQUlQ+qQ3T7ckJea0FpH/nYZe5mC3xTHVbuXgfBKUWdhddTp7hziK
   GQzgbEMTAxE7lUi6zawKtu/V4Wrcw3KXPPljwB1N0C7XuSVhHfrupL76K
   X2MMfLrT42ng9+fMEN2OnH24Bt62BAOYJAPBiCgKFEo2FWhcM3Ss3VKiX
   ytwoBCXhJUEi5BzwBDsPgqxLQenFXNlmI365zWN0A1ZZKuaC5hlo2ncoQ
   YLOPGOcwY+aND9WVZN0pYQa3p+vhuZMSfgRXFzyN5EjrEppmwoIjRMvJH
   PdN8B4mgu2/ufU7lCsz7pXxjSSx8cPQWMn/IKITJFVfipy/SOPoF/TD8i
   g==;
X-CSE-ConnectionGUID: v+wzFFg4Qv29OUfOo3YtgQ==
X-CSE-MsgGUID: 1Rk+PIWCSVq/j9hSC/Geyg==
X-IronPort-AV: E=McAfee;i="6700,10204,11413"; a="47346325"
X-IronPort-AV: E=Sophos;i="6.15,238,1739865600"; 
   d="scan'208";a="47346325"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2025 23:55:44 -0700
X-CSE-ConnectionGUID: aeRoTtmVQa22zlMGUndeaQ==
X-CSE-MsgGUID: 7cBYwVA3S4C7fYEW+Y4wsQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,238,1739865600"; 
   d="scan'208";a="163885479"
Received: from lkp-server01.sh.intel.com (HELO 050dd05385d1) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 24 Apr 2025 23:55:43 -0700
Received: from kbuild by 050dd05385d1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u8CyK-0004tx-1a;
	Fri, 25 Apr 2025 06:55:40 +0000
Date: Fri, 25 Apr 2025 14:55:02 +0800
From: kernel test robot <lkp@intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [morimoto:sound-cleanup-2025-04-23 104/116]
 sound/soc/codecs/simple-mux.c:37:38: warning: initialization makes pointer
 from integer without a cast
Message-ID: <202504251452.LjtXHKj3-lkp@intel.com>
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
commit: 30fb5bcc9ac75eb759c5494a4e5636464e90e38c [104/116] ASoC: soc-dapm: remove compatibility definition for dapm
config: s390-randconfig-002-20250425 (https://download.01.org/0day-ci/archive/20250425/202504251452.LjtXHKj3-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250425/202504251452.LjtXHKj3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504251452.LjtXHKj3-lkp@intel.com/

All warnings (new ones prefixed by >>):

   sound/soc/codecs/simple-mux.c: In function 'simple_mux_control_get':
   sound/soc/codecs/simple-mux.c:37:38: error: implicit declaration of function 'snd_soc_dapm_kcontrol_dapm'; did you mean 'snd_soc_dapm_kcontrol_to_dapm'? [-Werror=implicit-function-declaration]
     struct snd_soc_dapm_context *dapm = snd_soc_dapm_kcontrol_dapm(kcontrol);
                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~
                                         snd_soc_dapm_kcontrol_to_dapm
>> sound/soc/codecs/simple-mux.c:37:38: warning: initialization makes pointer from integer without a cast [-Wint-conversion]
   sound/soc/codecs/simple-mux.c: In function 'simple_mux_control_put':
   sound/soc/codecs/simple-mux.c:49:38: warning: initialization makes pointer from integer without a cast [-Wint-conversion]
     struct snd_soc_dapm_context *dapm = snd_soc_dapm_kcontrol_dapm(kcontrol);
                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +37 sound/soc/codecs/simple-mux.c

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

:::::: The code at line 37 was first introduced by commit
:::::: 342fbb7578d1741ff646d7b08e14e8753267b9fa ASoC: add simple-mux

:::::: TO: Alexandre Belloni <alexandre.belloni@bootlin.com>
:::::: CC: Mark Brown <broonie@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
