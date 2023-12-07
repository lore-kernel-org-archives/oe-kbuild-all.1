Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 905B137C
	for <oe-kbuild-all@lists.linux.dev>; Thu,  7 Dec 2023 01:00:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RELtMEnf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701910815; x=1733446815;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+o5isl1KQUCeexQXJu6MPY2yrHGKGgb7a/nI1IJGvzU=;
  b=RELtMEnfSwuZ6cnHaqJjvcCmOAqJ1zdtNdNJUroIZpEnwIJUz7v7RG82
   L/cYJ3arSnVuBeHctLAKdV2TdCDYZKIcD99dRga7xcuxvJT/4URVBGlFE
   ipO8gHbr1W6xhQ7ucxO6ASAzgFu+fOWsryRalYCjCeL80Z2cqS45AXXas
   gBZY//hhi9E7B5UGD2fAbCTZKiGLSrJiM1hquyz0blhXclL+RPhHvA8L4
   zb9g4JF9Rk3uGm/ZzjZ0O9m64b+OqNHceImcFGdMpFN2OUQAj9b8aXDbI
   wFmOrFYu3kx9lJdKzX5LOhJvJSsuoykOcrWkFH+FQG/LO+OdbTN49s6x/
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="460643401"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; 
   d="scan'208";a="460643401"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Dec 2023 17:00:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="915378291"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; 
   d="scan'208";a="915378291"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 06 Dec 2023 17:00:12 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rB2kM-000BeJ-2M;
	Thu, 07 Dec 2023 01:00:10 +0000
Date: Thu, 7 Dec 2023 08:59:31 +0800
From: kernel test robot <lkp@intel.com>
To: Hector Martin <marcan@marcan.st>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [asahilinux:bits/070-audio 69/104] sound/soc/apple/macaudio.c:198:6:
 sparse: sparse: symbol 'macaudio_vlimit_unlock' was not declared. Should it
 be static?
Message-ID: <202312070802.02VteWB1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux bits/070-audio
head:   88e53b5c13659b0092bc49020fbc8ebbfc1abfa6
commit: 4a448b9f1c264f3e73a32e569b519d3b0054ad30 [69/104] macaudio: speaker volume safety interlocks
config: openrisc-randconfig-r132-20231207 (https://download.01.org/0day-ci/archive/20231207/202312070802.02VteWB1-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231207/202312070802.02VteWB1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312070802.02VteWB1-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> sound/soc/apple/macaudio.c:198:6: sparse: sparse: symbol 'macaudio_vlimit_unlock' was not declared. Should it be static?
>> sound/soc/apple/macaudio.c:220:6: sparse: sparse: symbol 'macaudio_vlimit_update' was not declared. Should it be static?
>> sound/soc/apple/macaudio.c:1111:30: sparse: sparse: symbol 'macaudio_j274_cfg' was not declared. Should it be static?
>> sound/soc/apple/macaudio.c:1147:30: sparse: sparse: symbol 'macaudio_j313_cfg' was not declared. Should it be static?
   sound/soc/apple/macaudio.c:1192:30: sparse: sparse: symbol 'macaudio_j314_cfg' was not declared. Should it be static?
>> sound/soc/apple/macaudio.c:1200:30: sparse: sparse: symbol 'macaudio_j413_cfg' was not declared. Should it be static?
>> sound/soc/apple/macaudio.c:1210:30: sparse: sparse: symbol 'macaudio_j415_cfg' was not declared. Should it be static?
   sound/soc/apple/macaudio.c:1237:30: sparse: sparse: symbol 'macaudio_j375_cfg' was not declared. Should it be static?
>> sound/soc/apple/macaudio.c:1259:30: sparse: sparse: symbol 'macaudio_j493_cfg' was not declared. Should it be static?
>> sound/soc/apple/macaudio.c:1275:30: sparse: sparse: symbol 'macaudio_fallback_cfg' was not declared. Should it be static?
   sound/soc/apple/macaudio.c:1286:1: sparse: sparse: symbol 'macaudio_spk_mux_enum' was not declared. Should it be static?
   sound/soc/apple/macaudio.c:1296:1: sparse: sparse: symbol 'macaudio_hp_mux_enum' was not declared. Should it be static?
   sound/soc/apple/macaudio.c:1317:5: sparse: sparse: symbol 'macaudio_sss_info' was not declared. Should it be static?
   sound/soc/apple/macaudio.c:1327:5: sparse: sparse: symbol 'macaudio_sss_get' was not declared. Should it be static?
>> sound/soc/apple/macaudio.c:1342:5: sparse: sparse: symbol 'macaudio_slk_info' was not declared. Should it be static?
>> sound/soc/apple/macaudio.c:1352:5: sparse: sparse: symbol 'macaudio_slk_put' was not declared. Should it be static?
>> sound/soc/apple/macaudio.c:1384:5: sparse: sparse: symbol 'macaudio_slk_lock' was not declared. Should it be static?
>> sound/soc/apple/macaudio.c:1403:6: sparse: sparse: symbol 'macaudio_slk_unlock' was not declared. Should it be static?

vim +/macaudio_vlimit_unlock +198 sound/soc/apple/macaudio.c

   197	
 > 198	void macaudio_vlimit_unlock(struct macaudio_snd_data *ma, bool unlock)
   199	{
   200		int i, ret, max;
   201	
   202		for (i = 0; i < ARRAY_SIZE(ma->cfg->limits); i++) {
   203			const struct macaudio_limit_cfg *limit = &ma->cfg->limits[i];
   204	
   205			if (!limit->match)
   206				break;
   207	
   208			if (unlock)
   209				max = limit->max_unlimited;
   210			else
   211				max = limit->max_limited;
   212	
   213			ret = snd_soc_limit_volume(&ma->card, limit->match, max);
   214			if (ret < 0)
   215				dev_err(ma->card.dev, "Failed to %slock volume %s: %d\n",
   216					unlock ? "un" : "", limit->match, ret);
   217		}
   218	}
   219	
 > 220	void macaudio_vlimit_update(struct macaudio_snd_data *ma)
   221	{
   222		int i;
   223		bool unlock = true;
   224		struct snd_kcontrol *kctl;
   225		const char *reason;
   226	
   227		/* Do nothing if there are no limits configured */
   228		if (!ma->cfg->limits[0].match)
   229			return;
   230	
   231		/* Check that someone is holding the main lock */
   232		if (!ma->speaker_lock_owner) {
   233			reason = "Main control not locked";
   234			unlock = false;
   235		}
   236	
   237		/* Check that the control has been pinged within the timeout */
   238		if (ma->speaker_lock_remain <= 0) {
   239			reason = "Lock timeout";
   240			unlock = false;
   241		}
   242	
   243		/* Check that *every* limited control is locked by the same owner */
   244		list_for_each_entry(kctl, &ma->card.snd_card->controls, list) {
   245			bool is_limit = false;
   246	
   247			for (i = 0; i < ARRAY_SIZE(ma->cfg->limits); i++) {
   248				const struct macaudio_limit_cfg *limit = &ma->cfg->limits[i];
   249				if (!limit->match)
   250					break;
   251	
   252				is_limit = snd_soc_control_matches(kctl, limit->match);
   253				if (is_limit)
   254					break;
   255			}
   256	
   257			if (!is_limit)
   258				continue;
   259	
   260			for (i = 0; i < kctl->count; i++) {
   261				if (kctl->vd[i].owner != ma->speaker_lock_owner) {
   262					reason = "Not all child controls locked by the same process";
   263					unlock = false;
   264				}
   265			}
   266		}
   267	
   268	
   269		if (unlock != ma->speaker_volume_unlocked) {
   270			if (unlock) {
   271				dev_info(ma->card.dev, "Speaker volumes unlocked\n");
   272			} else  {
   273				dev_info(ma->card.dev, "Speaker volumes locked: %s\n", reason);
   274				ma->speaker_volume_was_locked = true;
   275			}
   276	
   277			macaudio_vlimit_unlock(ma, unlock);
   278			ma->speaker_volume_unlocked = unlock;
   279		}
   280	}
   281	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
