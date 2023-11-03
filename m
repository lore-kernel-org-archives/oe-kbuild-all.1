Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0E87F508
	for <oe-kbuild-all@lists.linux.dev>; Fri,  3 Nov 2023 19:28:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O+vtLAJq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699039691; x=1730575691;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OXFVKD+a21dEi3pqZH3ICi61NtdYB7R4hPLWM5tv7sw=;
  b=O+vtLAJq76RreSVgbazUA9HEz/dfu7vRhrVJxEpWhcV6UhnTSugp6id/
   yVLsrhZ5kJEGIWyhbgLNkeS7uc1HNr0ssMylK+iGSNpcDvEa4ZM+M1pYV
   u0EXl1CvqoDPR9sQ54BKinCHTJptRufoqAsnJOALtFEyg9M/w5kwvguIS
   ShoNhKU3UUmY6nNexXIi8NVvByEuyiShfpzcxT31X/2F1Wl7v8yub35UC
   zPZmzMql4/eRyk1UvipgNKahZPazCRW/hsAdwU3tKor1skbIx9W+ocI06
   Km+2j2Iu5v2mfxRlseezS6nmkpMRP6wh/R2NiGMTllFUCSqvP5pB88vuK
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="453305915"
X-IronPort-AV: E=Sophos;i="6.03,275,1694761200"; 
   d="scan'208";a="453305915"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2023 12:28:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="738169218"
X-IronPort-AV: E=Sophos;i="6.03,275,1694761200"; 
   d="scan'208";a="738169218"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 03 Nov 2023 12:28:09 -0700
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qyzpv-0002sd-2a;
	Fri, 03 Nov 2023 19:28:07 +0000
Date: Sat, 4 Nov 2023 03:27:53 +0800
From: kernel test robot <lkp@intel.com>
To: Hector Martin <marcan@marcan.st>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [asahilinux:bits/070-audio 70/99] sound/soc/apple/macaudio.c:198:6:
 warning: no previous prototype for 'macaudio_vlimit_unlock'
Message-ID: <202311040312.1ndS6GG0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux bits/070-audio
head:   2939678d42065d8acc5d41bad705222dc76589cb
commit: 0618fe77e4bd81ddb3c43900e9bc949bc4c2ffea [70/99] macaudio: speaker volume safety interlocks
config: xtensa-allyesconfig (https://download.01.org/0day-ci/archive/20231104/202311040312.1ndS6GG0-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231104/202311040312.1ndS6GG0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311040312.1ndS6GG0-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> sound/soc/apple/macaudio.c:198:6: warning: no previous prototype for 'macaudio_vlimit_unlock' [-Wmissing-prototypes]
     198 | void macaudio_vlimit_unlock(struct macaudio_snd_data *ma, bool unlock)
         |      ^~~~~~~~~~~~~~~~~~~~~~
>> sound/soc/apple/macaudio.c:220:6: warning: no previous prototype for 'macaudio_vlimit_update' [-Wmissing-prototypes]
     220 | void macaudio_vlimit_update(struct macaudio_snd_data *ma)
         |      ^~~~~~~~~~~~~~~~~~~~~~
   sound/soc/apple/macaudio.c:1317:5: warning: no previous prototype for 'macaudio_sss_info' [-Wmissing-prototypes]
    1317 | int macaudio_sss_info(struct snd_kcontrol *kcontrol, struct snd_ctl_elem_info *uinfo)
         |     ^~~~~~~~~~~~~~~~~
   sound/soc/apple/macaudio.c:1327:5: warning: no previous prototype for 'macaudio_sss_get' [-Wmissing-prototypes]
    1327 | int macaudio_sss_get(struct snd_kcontrol *kcontrol, struct snd_ctl_elem_value *uvalue)
         |     ^~~~~~~~~~~~~~~~
   sound/soc/apple/macaudio.c:1342:5: warning: no previous prototype for 'macaudio_slk_info' [-Wmissing-prototypes]
    1342 | int macaudio_slk_info(struct snd_kcontrol *kcontrol, struct snd_ctl_elem_info *uinfo)
         |     ^~~~~~~~~~~~~~~~~
>> sound/soc/apple/macaudio.c:1352:5: warning: no previous prototype for 'macaudio_slk_put' [-Wmissing-prototypes]
    1352 | int macaudio_slk_put(struct snd_kcontrol *kcontrol, struct snd_ctl_elem_value *uvalue)
         |     ^~~~~~~~~~~~~~~~
>> sound/soc/apple/macaudio.c:1384:5: warning: no previous prototype for 'macaudio_slk_lock' [-Wmissing-prototypes]
    1384 | int macaudio_slk_lock(struct snd_kcontrol *kcontrol, struct snd_ctl_file *owner)
         |     ^~~~~~~~~~~~~~~~~
   sound/soc/apple/macaudio.c:1403:6: warning: no previous prototype for 'macaudio_slk_unlock' [-Wmissing-prototypes]
    1403 | void macaudio_slk_unlock(struct snd_kcontrol *kcontrol)
         |      ^~~~~~~~~~~~~~~~~~~


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
