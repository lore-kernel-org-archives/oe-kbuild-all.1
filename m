Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56C8A5D495
	for <oe-kbuild-all@lists.linux.dev>; Tue, 12 Dec 2023 11:30:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SUTpxDs7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702380633; x=1733916633;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9XGkbZb5NmF+efiCmQjf8wiwMyZdTkay2QO8JV6Wp6E=;
  b=SUTpxDs7NMziPZeYhf1WFr+u0LA4WZLekrjq7wgPn1gNNf00OoiY4A5n
   RBmNihCh/AVsrD3OoFTf2fvLSSvwjS2nBIfG9otK71tAs68x/MFHXcNxc
   FcRpqyxQr1RgPNSgimOx7K2H6wbMTGpD2Vy6i044lJgNkISX2pnNlda4M
   GgDwFEVabLm1kZDq8WDFQF2WB+OWEmG+eW74JM4KOSm+vZxAyMtqy9Vv/
   M6L47NBSPwqZaKDPZFfvJTHK2oBJwH/j+pMyt02ACjE9Ms8q3uS50g1yP
   Ia/3PvW53Gryvh5gR/nmz7zpLip82cTbt/CW/Tx+Z/ECdI5K9LDFwNlgG
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10921"; a="1632157"
X-IronPort-AV: E=Sophos;i="6.04,270,1695711600"; 
   d="scan'208";a="1632157"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2023 03:30:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10921"; a="896889077"
X-IronPort-AV: E=Sophos;i="6.04,270,1695711600"; 
   d="scan'208";a="896889077"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 12 Dec 2023 03:30:28 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rD0y1-000J6f-2v;
	Tue, 12 Dec 2023 11:30:25 +0000
Date: Tue, 12 Dec 2023 19:28:52 +0800
From: kernel test robot <lkp@intel.com>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Mark Brown <broonie@kernel.org>
Subject: [linux-next:master 6484/6946] sound/soc/codecs/cs42l43.c:142:6:
 sparse: sparse: symbol 'cs42l43_hp_ilimit_clear_work' was not declared.
 Should it be static?
Message-ID: <202312121926.GC7OYtbZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   abb240f7a2bd14567ab53e602db562bb683391e6
commit: bbbc18d8c27cc9d40cc9a3b03b61e4df85311146 [6484/6946] ASoC: cs42l43: Allow HP amp to cool off after current limit
config: alpha-randconfig-r113-20231212 (https://download.01.org/0day-ci/archive/20231212/202312121926.GC7OYtbZ-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231212/202312121926.GC7OYtbZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312121926.GC7OYtbZ-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> sound/soc/codecs/cs42l43.c:142:6: sparse: sparse: symbol 'cs42l43_hp_ilimit_clear_work' was not declared. Should it be static?
>> sound/soc/codecs/cs42l43.c:159:6: sparse: sparse: symbol 'cs42l43_hp_ilimit_work' was not declared. Should it be static?

vim +/cs42l43_hp_ilimit_clear_work +142 sound/soc/codecs/cs42l43.c

   141	
 > 142	void cs42l43_hp_ilimit_clear_work(struct work_struct *work)
   143	{
   144		struct cs42l43_codec *priv = container_of(work, struct cs42l43_codec,
   145							  hp_ilimit_clear_work.work);
   146		struct snd_soc_dapm_context *dapm = snd_soc_component_get_dapm(priv->component);
   147	
   148		snd_soc_dapm_mutex_lock(dapm);
   149	
   150		priv->hp_ilimit_count--;
   151	
   152		if (priv->hp_ilimit_count)
   153			queue_delayed_work(system_wq, &priv->hp_ilimit_clear_work,
   154					   msecs_to_jiffies(CS42L43_HP_ILIMIT_DECAY_MS));
   155	
   156		snd_soc_dapm_mutex_unlock(dapm);
   157	}
   158	
 > 159	void cs42l43_hp_ilimit_work(struct work_struct *work)
   160	{
   161		struct cs42l43_codec *priv = container_of(work, struct cs42l43_codec,
   162							  hp_ilimit_work);
   163		struct snd_soc_dapm_context *dapm = snd_soc_component_get_dapm(priv->component);
   164		struct cs42l43 *cs42l43 = priv->core;
   165	
   166		snd_soc_dapm_mutex_lock(dapm);
   167	
   168		if (priv->hp_ilimit_count < CS42L43_HP_ILIMIT_MAX_COUNT) {
   169			if (!priv->hp_ilimit_count)
   170				queue_delayed_work(system_wq, &priv->hp_ilimit_clear_work,
   171						   msecs_to_jiffies(CS42L43_HP_ILIMIT_DECAY_MS));
   172	
   173			priv->hp_ilimit_count++;
   174			snd_soc_dapm_mutex_unlock(dapm);
   175			return;
   176		}
   177	
   178		dev_err(priv->dev, "Disabling headphone for %dmS, due to frequent current limit\n",
   179			CS42L43_HP_ILIMIT_BACKOFF_MS);
   180	
   181		priv->hp_ilimited = true;
   182	
   183		// No need to wait for disable, as just disabling for a period of time
   184		regmap_update_bits(cs42l43->regmap, CS42L43_BLOCK_EN8,
   185				   CS42L43_HP_EN_MASK, 0);
   186	
   187		snd_soc_dapm_mutex_unlock(dapm);
   188	
   189		msleep(CS42L43_HP_ILIMIT_BACKOFF_MS);
   190	
   191		snd_soc_dapm_mutex_lock(dapm);
   192	
   193		if (priv->hp_ena && !priv->load_detect_running) {
   194			unsigned long time_left;
   195	
   196			reinit_completion(&priv->hp_startup);
   197	
   198			regmap_update_bits(cs42l43->regmap, CS42L43_BLOCK_EN8,
   199					   CS42L43_HP_EN_MASK, priv->hp_ena);
   200	
   201			time_left = wait_for_completion_timeout(&priv->hp_startup,
   202								msecs_to_jiffies(CS42L43_HP_TIMEOUT_MS));
   203			if (!time_left)
   204				dev_err(priv->dev, "ilimit HP restore timed out\n");
   205		}
   206	
   207		priv->hp_ilimited = false;
   208	
   209		snd_soc_dapm_mutex_unlock(dapm);
   210	}
   211	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
