Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A6EA1A275
	for <oe-kbuild-all@lists.linux.dev>; Fri, 10 Oct 2025 00:53:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760057600; cv=none; b=bDk2G1+YWnEoObtCT9ysQByz4i6hzSi/wBRDmz7L0qFM/tV/vQe9OxKL7dRs3079ZKOWEX11lnNVeGlpOfCH4aTBOsk3Mzk/gNyrSxWvowJviN7UGiQLGwyUYSubsUIoC2vNkZGSjWr6XkG2/TNbvOXhrx5e1eb2dAwhQos05EU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760057600; c=relaxed/simple;
	bh=CUP8xx8Hg7QE/ahBCrQtJQXTTxQU5dweGPmdyuV0cws=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UNk5+nts4D8KuZhyJH1SL/1euLnsdpRHccdNJgydiIacbJWYUBUiEUJePWTE9kdRpqYfMw0rLsepeprV5KyqUuTo8nu8yACrgsld4tRz2haPjQocb+rLaCbqfvSgiexle5A8HkqYJ1qxSnYpKEw7t2vn23JI2G3lrkRepAdDdqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=B7h/LLuc; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B7h/LLuc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760057599; x=1791593599;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CUP8xx8Hg7QE/ahBCrQtJQXTTxQU5dweGPmdyuV0cws=;
  b=B7h/LLucACGIZA+wSCrthEajnNPrp0xGN0sp3gPJibTY23kuAK2rF8ye
   VDeMEtX+UIgidSiryTuZpDnaWC7byQMVeo54fIb9IeRj/z9S2XmhdQVhG
   7F7/ltv2j9IwSxt/Z6cgSPMjIEOdGtfxgGQy8AGBNP8IkP0lrt1xiWP5s
   ym8vZC3di0v45y96/4cArHCyL6T5Ft+KoJ/3zR5QcpSUEmdZuY3fCV7zE
   gyEVfL60aqUOM+VMx+3HyXIRkg0dhv/qjCuaS2ZXWcrhiBPx+5++8Qbb0
   mM1/Ra3G8p8mc+8AWG2CPr2o8Pq3mRO8SYx8uPpo/5JAs9N1V77dYvIx+
   g==;
X-CSE-ConnectionGUID: UW4P1pxDTNONhW0XzWGnvQ==
X-CSE-MsgGUID: 9AMCEERBTxyR9I0GHUsIuw==
X-IronPort-AV: E=McAfee;i="6800,10657,11577"; a="64898209"
X-IronPort-AV: E=Sophos;i="6.19,217,1754982000"; 
   d="scan'208";a="64898209"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2025 17:53:18 -0700
X-CSE-ConnectionGUID: 2VpkrCQ3RsyOmKQzs8Dv6A==
X-CSE-MsgGUID: 7FvmNxu7Q/yuDB44ArQlWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,217,1754982000"; 
   d="scan'208";a="211497282"
Received: from lkp-server01.sh.intel.com (HELO 6a630e8620ab) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 09 Oct 2025 17:53:17 -0700
Received: from kbuild by 6a630e8620ab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v71Ni-0001h9-2O;
	Fri, 10 Oct 2025 00:53:14 +0000
Date: Fri, 10 Oct 2025 08:52:19 +0800
From: kernel test robot <lkp@intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [morimoto:sound-cleanup-2025-10-01 147/152]
 sound/soc/ti/rx51.c:45:34: error: dereferencing pointer to incomplete type
 'struct snd_soc_dapm_context'
Message-ID: <202510100845.o1pgi3FN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/morimoto/linux sound-cleanup-2025-10-01
head:   6b18c74e14487da71e1ab1920248c4356df5674a
commit: 4e56cf0b4ae325c38b78e2cace8b93b0c09250ed [147/152] ASoC: soc-dapm: move struct snd_soc_dapm_context
config: arm-randconfig-003-20251010 (https://download.01.org/0day-ci/archive/20251010/202510100845.o1pgi3FN-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251010/202510100845.o1pgi3FN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510100845.o1pgi3FN-lkp@intel.com/

All errors (new ones prefixed by >>):

   sound/soc/ti/rx51.c: In function 'rx51_ext_control':
>> sound/soc/ti/rx51.c:45:34: error: dereferencing pointer to incomplete type 'struct snd_soc_dapm_context'
     struct snd_soc_card *card = dapm->card;
                                     ^~


vim +45 sound/soc/ti/rx51.c

49100c98359a56 sound/soc/omap/rx51.c Jarkko Nikula       2010-05-05  42  
022658beab5581 sound/soc/omap/rx51.c Liam Girdwood       2012-02-03  43  static void rx51_ext_control(struct snd_soc_dapm_context *dapm)
49100c98359a56 sound/soc/omap/rx51.c Jarkko Nikula       2010-05-05  44  {
386e81ab3b4d6f sound/soc/omap/rx51.c Sebastian Reichel   2014-04-28 @45  	struct snd_soc_card *card = dapm->card;
386e81ab3b4d6f sound/soc/omap/rx51.c Sebastian Reichel   2014-04-28  46  	struct rx51_audio_pdata *pdata = snd_soc_card_get_drvdata(card);
31164c7cf11907 sound/soc/omap/rx51.c Jarkko Nikula       2011-02-14  47  	int hp = 0, hs = 0, tvout = 0;
48529b3b7ca76e sound/soc/omap/rx51.c Jarkko Nikula       2011-01-27  48  
48529b3b7ca76e sound/soc/omap/rx51.c Jarkko Nikula       2011-01-27  49  	switch (rx51_jack_func) {
48529b3b7ca76e sound/soc/omap/rx51.c Jarkko Nikula       2011-01-27  50  	case RX51_JACK_TVOUT:
48529b3b7ca76e sound/soc/omap/rx51.c Jarkko Nikula       2011-01-27  51  		tvout = 1;
31164c7cf11907 sound/soc/omap/rx51.c Jarkko Nikula       2011-02-14  52  		hp = 1;
31164c7cf11907 sound/soc/omap/rx51.c Jarkko Nikula       2011-02-14  53  		break;
31164c7cf11907 sound/soc/omap/rx51.c Jarkko Nikula       2011-02-14  54  	case RX51_JACK_HS:
31164c7cf11907 sound/soc/omap/rx51.c Jarkko Nikula       2011-02-14  55  		hs = 1;
df561f6688fef7 sound/soc/ti/rx51.c   Gustavo A. R. Silva 2020-08-23  56  		fallthrough;
48529b3b7ca76e sound/soc/omap/rx51.c Jarkko Nikula       2011-01-27  57  	case RX51_JACK_HP:
48529b3b7ca76e sound/soc/omap/rx51.c Jarkko Nikula       2011-01-27  58  		hp = 1;
48529b3b7ca76e sound/soc/omap/rx51.c Jarkko Nikula       2011-01-27  59  		break;
48529b3b7ca76e sound/soc/omap/rx51.c Jarkko Nikula       2011-01-27  60  	}
ce6120cca2589e sound/soc/omap/rx51.c Liam Girdwood       2010-11-05  61  
9dd2bb3fdb38c4 sound/soc/omap/rx51.c Charles Keepax      2014-02-18  62  	snd_soc_dapm_mutex_lock(dapm);
9dd2bb3fdb38c4 sound/soc/omap/rx51.c Charles Keepax      2014-02-18  63  
49100c98359a56 sound/soc/omap/rx51.c Jarkko Nikula       2010-05-05  64  	if (rx51_spk_func)
9dd2bb3fdb38c4 sound/soc/omap/rx51.c Charles Keepax      2014-02-18  65  		snd_soc_dapm_enable_pin_unlocked(dapm, "Ext Spk");
49100c98359a56 sound/soc/omap/rx51.c Jarkko Nikula       2010-05-05  66  	else
9dd2bb3fdb38c4 sound/soc/omap/rx51.c Charles Keepax      2014-02-18  67  		snd_soc_dapm_disable_pin_unlocked(dapm, "Ext Spk");
49100c98359a56 sound/soc/omap/rx51.c Jarkko Nikula       2010-05-05  68  	if (rx51_dmic_func)
9dd2bb3fdb38c4 sound/soc/omap/rx51.c Charles Keepax      2014-02-18  69  		snd_soc_dapm_enable_pin_unlocked(dapm, "DMic");
49100c98359a56 sound/soc/omap/rx51.c Jarkko Nikula       2010-05-05  70  	else
9dd2bb3fdb38c4 sound/soc/omap/rx51.c Charles Keepax      2014-02-18  71  		snd_soc_dapm_disable_pin_unlocked(dapm, "DMic");
48529b3b7ca76e sound/soc/omap/rx51.c Jarkko Nikula       2011-01-27  72  	if (hp)
9dd2bb3fdb38c4 sound/soc/omap/rx51.c Charles Keepax      2014-02-18  73  		snd_soc_dapm_enable_pin_unlocked(dapm, "Headphone Jack");
48529b3b7ca76e sound/soc/omap/rx51.c Jarkko Nikula       2011-01-27  74  	else
9dd2bb3fdb38c4 sound/soc/omap/rx51.c Charles Keepax      2014-02-18  75  		snd_soc_dapm_disable_pin_unlocked(dapm, "Headphone Jack");
31164c7cf11907 sound/soc/omap/rx51.c Jarkko Nikula       2011-02-14  76  	if (hs)
9dd2bb3fdb38c4 sound/soc/omap/rx51.c Charles Keepax      2014-02-18  77  		snd_soc_dapm_enable_pin_unlocked(dapm, "HS Mic");
31164c7cf11907 sound/soc/omap/rx51.c Jarkko Nikula       2011-02-14  78  	else
9dd2bb3fdb38c4 sound/soc/omap/rx51.c Charles Keepax      2014-02-18  79  		snd_soc_dapm_disable_pin_unlocked(dapm, "HS Mic");
49100c98359a56 sound/soc/omap/rx51.c Jarkko Nikula       2010-05-05  80  
386e81ab3b4d6f sound/soc/omap/rx51.c Sebastian Reichel   2014-04-28  81  	gpiod_set_value(pdata->tvout_selection_gpio, tvout);
4eb5470326ca09 sound/soc/omap/rx51.c Jarkko Nikula       2010-06-21  82  
9dd2bb3fdb38c4 sound/soc/omap/rx51.c Charles Keepax      2014-02-18  83  	snd_soc_dapm_sync_unlocked(dapm);
9dd2bb3fdb38c4 sound/soc/omap/rx51.c Charles Keepax      2014-02-18  84  
9dd2bb3fdb38c4 sound/soc/omap/rx51.c Charles Keepax      2014-02-18  85  	snd_soc_dapm_mutex_unlock(dapm);
49100c98359a56 sound/soc/omap/rx51.c Jarkko Nikula       2010-05-05  86  }
49100c98359a56 sound/soc/omap/rx51.c Jarkko Nikula       2010-05-05  87  

:::::: The code at line 45 was first introduced by commit
:::::: 386e81ab3b4d6f50064d0ce0b3d82a4ea9a26296 ASoC: omap: rx51: get GPIO numbers via gpiod API

:::::: TO: Sebastian Reichel <sre@kernel.org>
:::::: CC: Mark Brown <broonie@linaro.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
