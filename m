Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EAFE18B0F
	for <oe-kbuild-all@lists.linux.dev>; Thu, 17 Apr 2025 08:20:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744878038; cv=none; b=mRyCSrYHnFcQtzOmmMgHF882PF9SVbZ8rFO4szb1cSTbmWqUjy/9AyjhFl7o/RFtN8VYpz5mj3QuCdJXNt/2sBjyzTo2muP17V+vNzw55eewwkdyoGwxLrtVr/PqbF+GaiRSOSl3fU1sxw2CwHHh9OSI90Cjr1Xwn6O77GcK0a4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744878038; c=relaxed/simple;
	bh=KpV8B4f+MP2n+h6N2iZUnLrzFOG2/MGSWhKmRYmeqr0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YP8HH+NUfMGWunLDF2i9Jolge6yXVoORQZSx9iK2k5kIVbCjyFrsoXhf3b42HtAuhvCl7bH5YGmJ6ybgF7X28Zi7CTByn4uUyWE64QzGDzeHJ3uQVn5rnfgYYCF44Y9KLpR9SBNUmCjcnaMGoDM2olxQp5oTx4GxYie3uGzQMpc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UUeEwFNU; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UUeEwFNU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744878037; x=1776414037;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KpV8B4f+MP2n+h6N2iZUnLrzFOG2/MGSWhKmRYmeqr0=;
  b=UUeEwFNU9YUwWysT7nZQ4EAmV0gGADZrIhNSw6l8cbBOQ8h/E0rTNSVc
   lsIlnROOPonQ38yJZGgcB3VRWvJ5f0noWR0F2SoFN7drwTobQanYJA5lb
   cJaStG0Mjbl7Nzea3vcn94IclitiwJO8xIrlQqcR8oCX0sGfmaj7C1mvU
   6LZXQAlchXtP7s1V5w5xMgGZW1HqgAGtvn+w1pd0oYnwsiiTCwxcsuy/O
   htIfZjBu4r34hApeIcALgoTEHzRJ/Xg2NTzmZHHBnQLcQAYfD/g9ncLjY
   HsGDAFZPqquMagzHs0ndxkXMBiUG2Fcq88Gm00bsMt16h+alS6Y3XeVA3
   A==;
X-CSE-ConnectionGUID: TcbaqfBpQYSEtOajT2hEAw==
X-CSE-MsgGUID: c88cm1vfTxecB59xtiIVDA==
X-IronPort-AV: E=McAfee;i="6700,10204,11405"; a="57838258"
X-IronPort-AV: E=Sophos;i="6.15,218,1739865600"; 
   d="scan'208";a="57838258"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2025 01:20:36 -0700
X-CSE-ConnectionGUID: Ey7QUAF/TPqsUDAm38rS1Q==
X-CSE-MsgGUID: z5irhYpGQtmZt1U08nKa6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,218,1739865600"; 
   d="scan'208";a="130723908"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 17 Apr 2025 01:20:34 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u5KU4-000LyK-26;
	Thu, 17 Apr 2025 08:20:32 +0000
Date: Thu, 17 Apr 2025 16:19:45 +0800
From: kernel test robot <lkp@intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [morimoto:sound-cleanup-2025-04-16 73/221]
 sound/soc/soc-dapm.c:1010: warning: expecting prototype for
 snd_soc_dapm_set_bias_level(). Prototype was for dapm_set_bias_level()
 instead
Message-ID: <202504171612.pD6w1Uty-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Kuninori,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://github.com/morimoto/linux sound-cleanup-2025-04-16
head:   cba8f1d8e81ddaecb7edb22ec42de6e834e60329
commit: 82ec4a00dba0ddb0f6ec6b4fe23a3d888eaa84ef [73/221] ASoC: soc-dapm: rename snd_soc_dapm_set_bias_level() to dapm_set_bias_level()
config: arc-randconfig-001-20250417 (https://download.01.org/0day-ci/archive/20250417/202504171612.pD6w1Uty-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250417/202504171612.pD6w1Uty-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504171612.pD6w1Uty-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> sound/soc/soc-dapm.c:1010: warning: expecting prototype for snd_soc_dapm_set_bias_level(). Prototype was for dapm_set_bias_level() instead


vim +1010 sound/soc/soc-dapm.c

234c0b8fb0db79 Lars-Peter Clausen 2014-02-28   998  
685b6e884d2d0f Kuninori Morimoto  2025-04-15   999  /**
685b6e884d2d0f Kuninori Morimoto  2025-04-15  1000   * snd_soc_dapm_set_bias_level - set the bias level for the system
685b6e884d2d0f Kuninori Morimoto  2025-04-15  1001   * @dapm: DAPM context
685b6e884d2d0f Kuninori Morimoto  2025-04-15  1002   * @level: level to configure
685b6e884d2d0f Kuninori Morimoto  2025-04-15  1003   *
685b6e884d2d0f Kuninori Morimoto  2025-04-15  1004   * Configure the bias (power) levels for the SoC audio device.
685b6e884d2d0f Kuninori Morimoto  2025-04-15  1005   *
685b6e884d2d0f Kuninori Morimoto  2025-04-15  1006   * Returns 0 for success else error.
685b6e884d2d0f Kuninori Morimoto  2025-04-15  1007   */
82ec4a00dba0dd Kuninori Morimoto  2025-04-15  1008  static int dapm_set_bias_level(struct snd_soc_dapm_context *dapm,
685b6e884d2d0f Kuninori Morimoto  2025-04-15  1009  			       enum snd_soc_bias_level level)
2b97eabc09f42d Richard Purdie     2006-10-06 @1010  {
685b6e884d2d0f Kuninori Morimoto  2025-04-15  1011  	struct snd_soc_card *card = dapm->card;
685b6e884d2d0f Kuninori Morimoto  2025-04-15  1012  	int ret = 0;
2b97eabc09f42d Richard Purdie     2006-10-06  1013  
685b6e884d2d0f Kuninori Morimoto  2025-04-15  1014  	trace_snd_soc_bias_level_start(dapm, level);
685b6e884d2d0f Kuninori Morimoto  2025-04-15  1015  
685b6e884d2d0f Kuninori Morimoto  2025-04-15  1016  	ret = snd_soc_card_set_bias_level(card, dapm, level);
685b6e884d2d0f Kuninori Morimoto  2025-04-15  1017  	if (ret != 0)
685b6e884d2d0f Kuninori Morimoto  2025-04-15  1018  		goto out;
685b6e884d2d0f Kuninori Morimoto  2025-04-15  1019  
685b6e884d2d0f Kuninori Morimoto  2025-04-15  1020  	if (dapm != &card->dapm)
685b6e884d2d0f Kuninori Morimoto  2025-04-15  1021  		ret = snd_soc_dapm_force_bias_level(dapm, level);
685b6e884d2d0f Kuninori Morimoto  2025-04-15  1022  
685b6e884d2d0f Kuninori Morimoto  2025-04-15  1023  	if (ret != 0)
685b6e884d2d0f Kuninori Morimoto  2025-04-15  1024  		goto out;
685b6e884d2d0f Kuninori Morimoto  2025-04-15  1025  
685b6e884d2d0f Kuninori Morimoto  2025-04-15  1026  	ret = snd_soc_card_set_bias_level_post(card, dapm, level);
685b6e884d2d0f Kuninori Morimoto  2025-04-15  1027  out:
685b6e884d2d0f Kuninori Morimoto  2025-04-15  1028  	trace_snd_soc_bias_level_done(dapm, level);
685b6e884d2d0f Kuninori Morimoto  2025-04-15  1029  
685b6e884d2d0f Kuninori Morimoto  2025-04-15  1030  	return ret;
2b97eabc09f42d Richard Purdie     2006-10-06  1031  }
2b97eabc09f42d Richard Purdie     2006-10-06  1032  

:::::: The code at line 1010 was first introduced by commit
:::::: 2b97eabc09f42d0f63e8053636e34e1afa0d604e [ALSA] ASoC: dynamic audio power management (DAPM)

:::::: TO: Richard Purdie <rpurdie@rpsys.net>
:::::: CC: Jaroslav Kysela <perex@suse.cz>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
