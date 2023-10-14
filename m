Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1886567F
	for <oe-kbuild-all@lists.linux.dev>; Sat, 14 Oct 2023 08:07:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="h8krmrFL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697270832; x=1728806832;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yc4E7B2bCDgYvw/nt4sRLHVg0YT0QZHggaZ/AlbzxqU=;
  b=h8krmrFLNwwuugQbboEI2Cj+cixgaaLjjrqIKEEl0RIuOzwWAsvNvm8L
   9g8Hrz6FRv15YNVaFw8y2aRWZe3A8+hWrVFmCbFf0H+q8n6U2RpEECzLL
   yarBiHZYdvtfmXjqDwgwIWWOIsoDoMHx0O52bc/UyFgBeTbsJEDcgDOmT
   O7C1Hbj6mc1bvM48V7zWY2ef1CQ6uTYfeFBl18ae+xz2V6/YwwTau26Bm
   L2qrnT2wxgxFdpeA9Paev6CcSrxx+2PgnidvCz0Dwdn0LIkLv3McUPE0C
   D4eaZEpg49hL2L0Gr5wPpvJm56+3gSb7ajd+FubfSR+k6cwJeDw/HRLpN
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="384181240"
X-IronPort-AV: E=Sophos;i="6.03,224,1694761200"; 
   d="scan'208";a="384181240"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2023 01:07:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="871395253"
X-IronPort-AV: E=Sophos;i="6.03,224,1694761200"; 
   d="scan'208";a="871395253"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 14 Oct 2023 01:07:10 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qrZfw-0005rP-1y;
	Sat, 14 Oct 2023 08:07:08 +0000
Date: Sat, 14 Oct 2023 16:06:44 +0800
From: kernel test robot <lkp@intel.com>
To: Hector Martin <marcan@marcan.st>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [asahilinux:sound/speaker-safety 175/199]
 sound/soc/apple/macaudio.c:1346:5: warning: no previous prototype for
 'macaudio_slk_get'
Message-ID: <202310141616.Rxcx0Iep-lkp@intel.com>
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
commit: 1aeb9e0673cd84aaa56d56d2b552733ab191afd5 [175/199] macaudio: Add a getter for the interlock
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20231014/202310141616.Rxcx0Iep-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231014/202310141616.Rxcx0Iep-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310141616.Rxcx0Iep-lkp@intel.com/

All warnings (new ones prefixed by >>):

   sound/soc/apple/macaudio.c:196:6: warning: no previous prototype for 'macaudio_vlimit_unlock' [-Wmissing-prototypes]
     196 | void macaudio_vlimit_unlock(struct macaudio_snd_data *ma, bool unlock)
         |      ^~~~~~~~~~~~~~~~~~~~~~
   sound/soc/apple/macaudio.c:218:6: warning: no previous prototype for 'macaudio_vlimit_update' [-Wmissing-prototypes]
     218 | void macaudio_vlimit_update(struct macaudio_snd_data *ma)
         |      ^~~~~~~~~~~~~~~~~~~~~~
   sound/soc/apple/macaudio.c:1279:5: warning: no previous prototype for 'macaudio_sss_info' [-Wmissing-prototypes]
    1279 | int macaudio_sss_info(struct snd_kcontrol *kcontrol, struct snd_ctl_elem_info *uinfo)
         |     ^~~~~~~~~~~~~~~~~
   sound/soc/apple/macaudio.c:1289:5: warning: no previous prototype for 'macaudio_sss_get' [-Wmissing-prototypes]
    1289 | int macaudio_sss_get(struct snd_kcontrol *kcontrol, struct snd_ctl_elem_value *uvalue)
         |     ^~~~~~~~~~~~~~~~
   sound/soc/apple/macaudio.c:1304:5: warning: no previous prototype for 'macaudio_slk_info' [-Wmissing-prototypes]
    1304 | int macaudio_slk_info(struct snd_kcontrol *kcontrol, struct snd_ctl_elem_info *uinfo)
         |     ^~~~~~~~~~~~~~~~~
   sound/soc/apple/macaudio.c:1314:5: warning: no previous prototype for 'macaudio_slk_put' [-Wmissing-prototypes]
    1314 | int macaudio_slk_put(struct snd_kcontrol *kcontrol, struct snd_ctl_elem_value *uvalue)
         |     ^~~~~~~~~~~~~~~~
>> sound/soc/apple/macaudio.c:1346:5: warning: no previous prototype for 'macaudio_slk_get' [-Wmissing-prototypes]
    1346 | int macaudio_slk_get(struct snd_kcontrol *kcontrol, struct snd_ctl_elem_value *uvalue)
         |     ^~~~~~~~~~~~~~~~
   sound/soc/apple/macaudio.c:1356:5: warning: no previous prototype for 'macaudio_slk_lock' [-Wmissing-prototypes]
    1356 | int macaudio_slk_lock(struct snd_kcontrol *kcontrol, struct snd_ctl_file *owner)
         |     ^~~~~~~~~~~~~~~~~
   sound/soc/apple/macaudio.c:1375:6: warning: no previous prototype for 'macaudio_slk_unlock' [-Wmissing-prototypes]
    1375 | void macaudio_slk_unlock(struct snd_kcontrol *kcontrol)
         |      ^~~~~~~~~~~~~~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for APPLE_ADMAC
   Depends on [n]: DMADEVICES [=n] && (ARCH_APPLE || COMPILE_TEST [=y])
   Selected by [m]:
   - SND_SOC_APPLE_MACAUDIO [=m] && SOUND [=m] && !UML && SND [=m] && SND_SOC [=m] && (ARCH_APPLE || COMPILE_TEST [=y])


vim +/macaudio_slk_get +1346 sound/soc/apple/macaudio.c

  1288	
> 1289	int macaudio_sss_get(struct snd_kcontrol *kcontrol, struct snd_ctl_elem_value *uvalue)
  1290	{
  1291		struct snd_soc_card *card = snd_kcontrol_chip(kcontrol);
  1292		struct macaudio_snd_data *ma = snd_soc_card_get_drvdata(card);
  1293	
  1294		/*
  1295		 * TODO: Check if any locking is in order here. I would
  1296		 * assume there is some ALSA-level lock, but DAPM implementations
  1297		 * of kcontrol ops do explicit locking, so look into it.
  1298		 */
  1299		uvalue->value.integer.value[0] = ma->speaker_sample_rate;
  1300	
  1301		return 0;
  1302	}
  1303	
  1304	int macaudio_slk_info(struct snd_kcontrol *kcontrol, struct snd_ctl_elem_info *uinfo)
  1305	{
  1306		uinfo->type = SNDRV_CTL_ELEM_TYPE_INTEGER;
  1307		uinfo->count = 1;
  1308		uinfo->value.integer.min = INT_MIN;
  1309		uinfo->value.integer.max = INT_MAX;
  1310	
  1311		return 0;
  1312	}
  1313	
  1314	int macaudio_slk_put(struct snd_kcontrol *kcontrol, struct snd_ctl_elem_value *uvalue)
  1315	{
  1316		struct snd_soc_card *card = snd_kcontrol_chip(kcontrol);
  1317		struct macaudio_snd_data *ma = snd_soc_card_get_drvdata(card);
  1318	
  1319		if (!ma->speaker_lock_owner)
  1320			return -EPERM;
  1321	
  1322		if (uvalue->value.integer.value[0] != SPEAKER_MAGIC_VALUE)
  1323			return -EINVAL;
  1324	
  1325		/* Serves as a notification that the lock was lost at some point */
  1326		if (ma->speaker_volume_was_locked) {
  1327			ma->speaker_volume_was_locked = false;
  1328			return -ETIMEDOUT;
  1329		}
  1330	
  1331		cancel_delayed_work(&ma->lock_timeout_work);
  1332	
  1333		ma->speaker_lock_remain = ms_to_ktime(SPEAKER_LOCK_TIMEOUT);
  1334		ma->speaker_lock_timeout = ktime_add(ktime_get(), ma->speaker_lock_remain);
  1335		macaudio_vlimit_update(ma);
  1336	
  1337		if (ma->speaker_lock_timeout_enabled) {
  1338			dev_dbg(ma->card.dev, "Volume limit timeout ping: %ld us left\n",
  1339				(long)ktime_to_us(ma->speaker_lock_remain));
  1340			schedule_delayed_work(&ma->lock_timeout_work, usecs_to_jiffies(ktime_to_us(ma->speaker_lock_remain)));
  1341		}
  1342	
  1343		return 0;
  1344	}
  1345	
> 1346	int macaudio_slk_get(struct snd_kcontrol *kcontrol, struct snd_ctl_elem_value *uvalue)
  1347	{
  1348		struct snd_soc_card *card = snd_kcontrol_chip(kcontrol);
  1349		struct macaudio_snd_data *ma = snd_soc_card_get_drvdata(card);
  1350	
  1351		uvalue->value.integer.value[0] = ma->speaker_volume_unlocked ? 1 : 0;
  1352	
  1353		return 0;
  1354	}
  1355	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
