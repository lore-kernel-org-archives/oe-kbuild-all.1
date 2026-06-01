Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFE62366570
	for <oe-kbuild-all@lists.linux.dev>; Mon,  1 Jun 2026 22:19:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780352350; cv=none; b=EEb4TBzeeBKG1tS5ktjy23bR3ySPM1VePGhUHtpC+yh7eEcgXV7/cNzVAFagfbDysIsf2ufckmTtfGAagXlllvIbhXUA4SsLlxEDMr/SbmsYLfodP1/ow2XHsrgKoM5oeCdxNCjq+Qt+xCPRxpUxgVnBoQ/nlyHb923elairWkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780352350; c=relaxed/simple;
	bh=nyxiL++nbRMc6pE60ZskcuvWiFuq8NZIcmmJXr/rqgU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=IavbI6hc2LGpIcOBChAPXUuU2wHWXfgsHEzfP3N2WUDlkukgOWOlRwMcR5XB4Pw2QPoWW9PLiXYykMNmO641W7QxFvAKITsW3jk/1PmSaGOtb2VecpyxGUPLjQAdLb3Tbau/mUa54eJ+dgXFOY7InRsYgMy8MonYDO2QOo4mMcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hAN+cXAv; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hAN+cXAv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780352349; x=1811888349;
  h=date:from:to:cc:subject:message-id;
  bh=nyxiL++nbRMc6pE60ZskcuvWiFuq8NZIcmmJXr/rqgU=;
  b=hAN+cXAveFQVn3f21+dR6AFpFQeBRwOMTzgf9mcv+sH/yrjAbYeERT2F
   Po6qxqUkApzytbSOuAkv+Ul4fre/5NskrjNWYteQpECYlUhvyFV0W3r4x
   eg+nD1C+AHDfjk3xomowtxGeJHKcsOUVa2t8nxk2ozrJn3ff4rdulkAU6
   aBCezDXlRQTdCY4Pz8w/dUkd7Lx6zQnOnnHM2An/LmVGAj35f00pAsfvy
   C9kzs1j9ZfXgfD1ScA+AzlHEoC6XPgCWldKSG2XABGHyTcWcZTQ1BuEzf
   5L3o8qLQ++QRUEHKJuOaZA32/WRPBhwtcui96I3WTorYMQLSCyAMSLLdq
   g==;
X-CSE-ConnectionGUID: ZhwsWP9TRJa+GN2h+fHTqg==
X-CSE-MsgGUID: CxWb3cmoQs6B7gvnZRDGwQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11804"; a="83699727"
X-IronPort-AV: E=Sophos;i="6.24,182,1774335600"; 
   d="scan'208";a="83699727"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2026 15:19:08 -0700
X-CSE-ConnectionGUID: udw4cVzxToutMyvJg+ZtrA==
X-CSE-MsgGUID: mV3WNR3iS/KZN8enpx3x1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,182,1774335600"; 
   d="scan'208";a="237349236"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 01 Jun 2026 15:19:07 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wUAyO-00000000B9i-2vaO;
	Mon, 01 Jun 2026 22:19:04 +0000
Date: Tue, 02 Jun 2026 06:18:27 +0800
From: kernel test robot <lkp@intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [morimoto:sound-cleanup-2026-06-01-3 290/290]
 sound/soc/codecs/rt712-sdca.c:271:20: error: dereferencing pointer to
 incomplete type 'struct snd_soc_card'
Message-ID: <202606020601.0JVv6psc-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/morimoto/linux sound-cleanup-2026-06-01-3
head:   1ef39bbdce9099b285b9702e22c4defc277e42dd
commit: 1ef39bbdce9099b285b9702e22c4defc277e42dd [290/290] ASoC: move struct snd_soc_card/snd_soc_card_driver to soc-card.[hc]
config: arm-randconfig-002-20260602 (https://download.01.org/0day-ci/archive/20260602/202606020601.0JVv6psc-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260602/202606020601.0JVv6psc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606020601.0JVv6psc-lkp@intel.com/

All errors (new ones prefixed by >>):

   sound/soc/codecs/rt712-sdca.c: In function 'rt712_sdca_jack_detect_handler':
>> sound/soc/codecs/rt712-sdca.c:271:20: error: dereferencing pointer to incomplete type 'struct snd_soc_card'
     if (!card || !card->instantiated)
                       ^~
--
   sound/soc/codecs/rt722-sdca.c: In function 'rt722_sdca_jack_detect_handler':
>> sound/soc/codecs/rt722-sdca.c:195:20: error: dereferencing pointer to incomplete type 'struct snd_soc_card'
     if (!card || !card->instantiated)
                       ^~
   sound/soc/codecs/rt722-sdca.c: In function 'rt722_cae_update_put':
   sound/soc/codecs/rt722-sdca.c:579:34: error: implicit declaration of function 'snd_soc_component_get_drvdata'; did you mean 'snd_soc_component_set_jack'? [-Werror=implicit-function-declaration]
     struct rt722_sdca_priv *rt722 = snd_soc_component_get_drvdata(component);
                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                                     snd_soc_component_set_jack
   sound/soc/codecs/rt722-sdca.c:579:34: warning: initialization of 'struct rt722_sdca_priv *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
   sound/soc/codecs/rt722-sdca.c:586:43: error: dereferencing pointer to incomplete type 'struct snd_soc_component'
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
--
   sound/soc/codecs/rt721-sdca.c: In function 'rt721_sdca_jack_detect_handler':
>> sound/soc/codecs/rt721-sdca.c:39:20: error: dereferencing pointer to incomplete type 'struct snd_soc_card'
     if (!card || !card->instantiated)
                       ^~


vim +271 sound/soc/codecs/rt712-sdca.c

6c39710da75caab Shuming Fan       2023-02-07  260  
6c39710da75caab Shuming Fan       2023-02-07  261  static void rt712_sdca_jack_detect_handler(struct work_struct *work)
6c39710da75caab Shuming Fan       2023-02-07  262  {
6c39710da75caab Shuming Fan       2023-02-07  263  	struct rt712_sdca_priv *rt712 =
6c39710da75caab Shuming Fan       2023-02-07  264  		container_of(work, struct rt712_sdca_priv, jack_detect_work.work);
f66a1b718fbcb75 Kuninori Morimoto 2026-06-01  265  	struct snd_soc_card *card = snd_soc_component_to_card(rt712->component);
6c39710da75caab Shuming Fan       2023-02-07  266  	int btn_type = 0, ret;
6c39710da75caab Shuming Fan       2023-02-07  267  
6c39710da75caab Shuming Fan       2023-02-07  268  	if (!rt712->hs_jack)
6c39710da75caab Shuming Fan       2023-02-07  269  		return;
6c39710da75caab Shuming Fan       2023-02-07  270  
f66a1b718fbcb75 Kuninori Morimoto 2026-06-01 @271  	if (!card || !card->instantiated)
6c39710da75caab Shuming Fan       2023-02-07  272  		return;
6c39710da75caab Shuming Fan       2023-02-07  273  
6c39710da75caab Shuming Fan       2023-02-07  274  	/* SDW_SCP_SDCA_INT_SDCA_0 is used for jack detection */
6c39710da75caab Shuming Fan       2023-02-07  275  	if (rt712->scp_sdca_stat1 & SDW_SCP_SDCA_INT_SDCA_0) {
6c39710da75caab Shuming Fan       2023-02-07  276  		ret = rt712_sdca_headset_detect(rt712);
6c39710da75caab Shuming Fan       2023-02-07  277  		if (ret < 0)
6c39710da75caab Shuming Fan       2023-02-07  278  			return;
6c39710da75caab Shuming Fan       2023-02-07  279  	}
6c39710da75caab Shuming Fan       2023-02-07  280  
6c39710da75caab Shuming Fan       2023-02-07  281  	/* SDW_SCP_SDCA_INT_SDCA_8 is used for button detection */
6c39710da75caab Shuming Fan       2023-02-07  282  	if (rt712->scp_sdca_stat2 & SDW_SCP_SDCA_INT_SDCA_8)
6c39710da75caab Shuming Fan       2023-02-07  283  		btn_type = rt712_sdca_button_detect(rt712);
6c39710da75caab Shuming Fan       2023-02-07  284  
6c39710da75caab Shuming Fan       2023-02-07  285  	if (rt712->jack_type == 0)
6c39710da75caab Shuming Fan       2023-02-07  286  		btn_type = 0;
6c39710da75caab Shuming Fan       2023-02-07  287  
6c39710da75caab Shuming Fan       2023-02-07  288  	dev_dbg(&rt712->slave->dev,
6c39710da75caab Shuming Fan       2023-02-07  289  		"in %s, jack_type=0x%x\n", __func__, rt712->jack_type);
6c39710da75caab Shuming Fan       2023-02-07  290  	dev_dbg(&rt712->slave->dev,
6c39710da75caab Shuming Fan       2023-02-07  291  		"in %s, btn_type=0x%x\n", __func__, btn_type);
6c39710da75caab Shuming Fan       2023-02-07  292  	dev_dbg(&rt712->slave->dev,
6c39710da75caab Shuming Fan       2023-02-07  293  		"in %s, scp_sdca_stat1=0x%x, scp_sdca_stat2=0x%x\n", __func__,
6c39710da75caab Shuming Fan       2023-02-07  294  		rt712->scp_sdca_stat1, rt712->scp_sdca_stat2);
6c39710da75caab Shuming Fan       2023-02-07  295  
6c39710da75caab Shuming Fan       2023-02-07  296  	snd_soc_jack_report(rt712->hs_jack, rt712->jack_type | btn_type,
6c39710da75caab Shuming Fan       2023-02-07  297  			SND_JACK_HEADSET |
6c39710da75caab Shuming Fan       2023-02-07  298  			SND_JACK_BTN_0 | SND_JACK_BTN_1 |
6c39710da75caab Shuming Fan       2023-02-07  299  			SND_JACK_BTN_2 | SND_JACK_BTN_3);
6c39710da75caab Shuming Fan       2023-02-07  300  
6c39710da75caab Shuming Fan       2023-02-07  301  	if (btn_type) {
6c39710da75caab Shuming Fan       2023-02-07  302  		/* button released */
6c39710da75caab Shuming Fan       2023-02-07  303  		snd_soc_jack_report(rt712->hs_jack, rt712->jack_type,
6c39710da75caab Shuming Fan       2023-02-07  304  			SND_JACK_HEADSET |
6c39710da75caab Shuming Fan       2023-02-07  305  			SND_JACK_BTN_0 | SND_JACK_BTN_1 |
6c39710da75caab Shuming Fan       2023-02-07  306  			SND_JACK_BTN_2 | SND_JACK_BTN_3);
6c39710da75caab Shuming Fan       2023-02-07  307  
6c39710da75caab Shuming Fan       2023-02-07  308  		mod_delayed_work(system_power_efficient_wq,
6c39710da75caab Shuming Fan       2023-02-07  309  			&rt712->jack_btn_check_work, msecs_to_jiffies(200));
6c39710da75caab Shuming Fan       2023-02-07  310  	}
6c39710da75caab Shuming Fan       2023-02-07  311  }
6c39710da75caab Shuming Fan       2023-02-07  312  

:::::: The code at line 271 was first introduced by commit
:::::: f66a1b718fbcb7553fef8ad2e807c9e84ca546e5 dai

:::::: TO: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
:::::: CC: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
