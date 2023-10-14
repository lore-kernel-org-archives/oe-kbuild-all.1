Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4E381877
	for <oe-kbuild-all@lists.linux.dev>; Sat, 14 Oct 2023 07:01:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ac8nbhTm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697266869; x=1728802869;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kGTz05GBDK26R9uMG9E3Enfa1aF15hadp3PL3bwuREw=;
  b=Ac8nbhTmaO5Y6d1aoEGGXf0zy9TSTFF2CsFwpC5FDRZ6gjx2qYaZrFcW
   OlNTw9QEgAVM3uRoNOkTesl3msAp2LZ8wzIO6ctTeNsSYsOk3sSKZ3uRT
   SEzVKOb3+RBVmcBhTjeR0r3/FaHc01i9oZOoQc1fphdyoSc/vYip42wQ+
   x4xOrWgglO4KGn99sb38bMbBTorOsPeDFHKsdFfAE72omlW1RJ3ZjMYI+
   4M/bfGc5YV4x5fMZlgWh1jkrbFZKP88fx/XTHrQhfiIaIhWY/QYcg6d4i
   942YQozf3zx0siG2fg/wKe3Qm1A4tWCkInXsLFbICzFfZx8RNvxlatyey
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="471538326"
X-IronPort-AV: E=Sophos;i="6.03,224,1694761200"; 
   d="scan'208";a="471538326"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2023 00:01:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="758739303"
X-IronPort-AV: E=Sophos;i="6.03,224,1694761200"; 
   d="scan'208";a="758739303"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 14 Oct 2023 00:01:07 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qrYe1-0005nr-0N;
	Sat, 14 Oct 2023 07:01:05 +0000
Date: Sat, 14 Oct 2023 15:00:24 +0800
From: kernel test robot <lkp@intel.com>
To: Hector Martin <marcan@marcan.st>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [asahilinux:sound/speaker-safety 173/199]
 sound/soc/apple/macaudio.c:196:6: warning: no previous prototype for
 'macaudio_vlimit_unlock'
Message-ID: <202310141437.0HWuI0R0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux sound/speaker-safety
head:   0c49093e19a678be51c7207bbf9da61b29173375
commit: c31d606e41375fb4436c6398e5ed421d1e809d82 [173/199] macaudio: speaker volume safety interlocks
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20231014/202310141437.0HWuI0R0-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231014/202310141437.0HWuI0R0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310141437.0HWuI0R0-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> sound/soc/apple/macaudio.c:196:6: warning: no previous prototype for 'macaudio_vlimit_unlock' [-Wmissing-prototypes]
     196 | void macaudio_vlimit_unlock(struct macaudio_snd_data *ma, bool unlock)
         |      ^~~~~~~~~~~~~~~~~~~~~~
>> sound/soc/apple/macaudio.c:218:6: warning: no previous prototype for 'macaudio_vlimit_update' [-Wmissing-prototypes]
     218 | void macaudio_vlimit_update(struct macaudio_snd_data *ma)
         |      ^~~~~~~~~~~~~~~~~~~~~~
   sound/soc/apple/macaudio.c:1277:5: warning: no previous prototype for 'macaudio_sss_info' [-Wmissing-prototypes]
    1277 | int macaudio_sss_info(struct snd_kcontrol *kcontrol, struct snd_ctl_elem_info *uinfo)
         |     ^~~~~~~~~~~~~~~~~
   sound/soc/apple/macaudio.c:1287:5: warning: no previous prototype for 'macaudio_sss_get' [-Wmissing-prototypes]
    1287 | int macaudio_sss_get(struct snd_kcontrol *kcontrol, struct snd_ctl_elem_value *uvalue)
         |     ^~~~~~~~~~~~~~~~
>> sound/soc/apple/macaudio.c:1302:5: warning: no previous prototype for 'macaudio_slk_info' [-Wmissing-prototypes]
    1302 | int macaudio_slk_info(struct snd_kcontrol *kcontrol, struct snd_ctl_elem_info *uinfo)
         |     ^~~~~~~~~~~~~~~~~
>> sound/soc/apple/macaudio.c:1312:5: warning: no previous prototype for 'macaudio_slk_put' [-Wmissing-prototypes]
    1312 | int macaudio_slk_put(struct snd_kcontrol *kcontrol, struct snd_ctl_elem_value *uvalue)
         |     ^~~~~~~~~~~~~~~~
>> sound/soc/apple/macaudio.c:1344:5: warning: no previous prototype for 'macaudio_slk_lock' [-Wmissing-prototypes]
    1344 | int macaudio_slk_lock(struct snd_kcontrol *kcontrol, struct snd_ctl_file *owner)
         |     ^~~~~~~~~~~~~~~~~
>> sound/soc/apple/macaudio.c:1363:6: warning: no previous prototype for 'macaudio_slk_unlock' [-Wmissing-prototypes]
    1363 | void macaudio_slk_unlock(struct snd_kcontrol *kcontrol)
         |      ^~~~~~~~~~~~~~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for APPLE_ADMAC
   Depends on [n]: DMADEVICES [=n] && (ARCH_APPLE || COMPILE_TEST [=y])
   Selected by [m]:
   - SND_SOC_APPLE_MACAUDIO [=m] && SOUND [=m] && !UML && SND [=m] && SND_SOC [=m] && (ARCH_APPLE || COMPILE_TEST [=y])


vim +/macaudio_vlimit_unlock +196 sound/soc/apple/macaudio.c

   195	
 > 196	void macaudio_vlimit_unlock(struct macaudio_snd_data *ma, bool unlock)
   197	{
   198		int i, ret, max;
   199	
   200		for (i = 0; i < ARRAY_SIZE(ma->cfg->limits); i++) {
   201			const struct macaudio_limit_cfg *limit = &ma->cfg->limits[i];
   202	
   203			if (!limit->match)
   204				break;
   205	
   206			if (unlock)
   207				max = limit->max_unlimited;
   208			else
   209				max = limit->max_limited;
   210	
   211			ret = snd_soc_limit_volume(&ma->card, limit->match, max);
   212			if (ret < 0)
   213				dev_err(ma->card.dev, "Failed to %slock volume %s: %d\n",
   214					unlock ? "un" : "", limit->match, ret);
   215		}
   216	}
   217	
 > 218	void macaudio_vlimit_update(struct macaudio_snd_data *ma)
   219	{
   220		int i;
   221		bool unlock = true;
   222		struct snd_kcontrol *kctl;
   223		const char *reason;
   224	
   225		/* Do nothing if there are no limits configured */
   226		if (!ma->cfg->limits[0].match)
   227			return;
   228	
   229		/* Check that someone is holding the main lock */
   230		if (!ma->speaker_lock_owner) {
   231			reason = "Main control not locked";
   232			unlock = false;
   233		}
   234	
   235		/* Check that the control has been pinged within the timeout */
   236		if (ma->speaker_lock_remain <= 0) {
   237			reason = "Lock timeout";
   238			unlock = false;
   239		}
   240	
   241		/* Check that *every* limited control is locked by the same owner */
   242		list_for_each_entry(kctl, &ma->card.snd_card->controls, list) {
   243			bool is_limit = false;
   244	
   245			for (i = 0; i < ARRAY_SIZE(ma->cfg->limits); i++) {
   246				const struct macaudio_limit_cfg *limit = &ma->cfg->limits[i];
   247				if (!limit->match)
   248					break;
   249	
   250				is_limit = snd_soc_control_matches(kctl, limit->match);
   251				if (is_limit)
   252					break;
   253			}
   254	
   255			if (!is_limit)
   256				continue;
   257	
   258			for (i = 0; i < kctl->count; i++) {
   259				if (kctl->vd[i].owner != ma->speaker_lock_owner) {
   260					reason = "Not all child controls locked by the same process";
   261					unlock = false;
   262				}
   263			}
   264		}
   265	
   266	
   267		if (unlock != ma->speaker_volume_unlocked) {
   268			if (unlock) {
   269				dev_info(ma->card.dev, "Speaker volumes unlocked\n");
   270			} else  {
   271				dev_info(ma->card.dev, "Speaker volumes locked: %s\n", reason);
   272				ma->speaker_volume_was_locked = true;
   273			}
   274	
   275			macaudio_vlimit_unlock(ma, unlock);
   276			ma->speaker_volume_unlocked = unlock;
   277		}
   278	}
   279	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
