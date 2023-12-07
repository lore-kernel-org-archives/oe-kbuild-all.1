Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 805D415A8
	for <oe-kbuild-all@lists.linux.dev>; Thu,  7 Dec 2023 02:08:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YFB9Pufq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701914918; x=1733450918;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GyNqOV1OpqU9i/BdIYe1A9CHB3PzoNKhguuC3bJ+cHs=;
  b=YFB9PufqgdYjQYk6lRg0dy70nXSOufjpRs/H7uTrWefoxPNtyal5N2XE
   +4iPuF7n5DrNtacqcvWI/L/yzZKb1FfvFT0gKXIXpSqeOatrNGi6zNNaZ
   aj3rM+mP098cVOw53txD6TVINH0ZIV0coBKyqbuJ4emZ2si/eO/c8ePpt
   m7IOYWgq+JQSpowKPq395EMzvRnVYFauQbnVvc9yIaocFL/HVJSUWyBCi
   B7DcTrgqvfTAQfrEVILqjg2Jwiq+wbxxUxIOVJavWsqTtKWit/Zc2Zq5a
   5taHonuZchU9rwH5li/QvialZeKtRkroxy3ffZvgt+Lu/OM/EdrV6Csf/
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="1258169"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; 
   d="scan'208";a="1258169"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Dec 2023 18:08:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="800556002"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; 
   d="scan'208";a="800556002"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 06 Dec 2023 18:08:36 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rB3oX-000Bi0-1W;
	Thu, 07 Dec 2023 02:08:33 +0000
Date: Thu, 7 Dec 2023 10:08:18 +0800
From: kernel test robot <lkp@intel.com>
To: Hector Martin <marcan@marcan.st>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [asahilinux:bits/070-audio 71/104]
 sound/soc/apple/macaudio.c:1386:5: sparse: sparse: symbol 'macaudio_slk_get'
 was not declared. Should it be static?
Message-ID: <202312070914.DSuxtjSi-lkp@intel.com>
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
commit: ba781f688d2d45d603340b2515236cd40fb0b41c [71/104] macaudio: Add a getter for the interlock
config: openrisc-randconfig-r132-20231207 (https://download.01.org/0day-ci/archive/20231207/202312070914.DSuxtjSi-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231207/202312070914.DSuxtjSi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312070914.DSuxtjSi-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   sound/soc/apple/macaudio.c:198:6: sparse: sparse: symbol 'macaudio_vlimit_unlock' was not declared. Should it be static?
   sound/soc/apple/macaudio.c:220:6: sparse: sparse: symbol 'macaudio_vlimit_update' was not declared. Should it be static?
   sound/soc/apple/macaudio.c:1113:30: sparse: sparse: symbol 'macaudio_j274_cfg' was not declared. Should it be static?
   sound/soc/apple/macaudio.c:1149:30: sparse: sparse: symbol 'macaudio_j313_cfg' was not declared. Should it be static?
   sound/soc/apple/macaudio.c:1194:30: sparse: sparse: symbol 'macaudio_j314_cfg' was not declared. Should it be static?
   sound/soc/apple/macaudio.c:1202:30: sparse: sparse: symbol 'macaudio_j413_cfg' was not declared. Should it be static?
   sound/soc/apple/macaudio.c:1212:30: sparse: sparse: symbol 'macaudio_j415_cfg' was not declared. Should it be static?
   sound/soc/apple/macaudio.c:1239:30: sparse: sparse: symbol 'macaudio_j375_cfg' was not declared. Should it be static?
   sound/soc/apple/macaudio.c:1261:30: sparse: sparse: symbol 'macaudio_j493_cfg' was not declared. Should it be static?
   sound/soc/apple/macaudio.c:1277:30: sparse: sparse: symbol 'macaudio_fallback_cfg' was not declared. Should it be static?
   sound/soc/apple/macaudio.c:1288:1: sparse: sparse: symbol 'macaudio_spk_mux_enum' was not declared. Should it be static?
   sound/soc/apple/macaudio.c:1298:1: sparse: sparse: symbol 'macaudio_hp_mux_enum' was not declared. Should it be static?
   sound/soc/apple/macaudio.c:1319:5: sparse: sparse: symbol 'macaudio_sss_info' was not declared. Should it be static?
   sound/soc/apple/macaudio.c:1329:5: sparse: sparse: symbol 'macaudio_sss_get' was not declared. Should it be static?
   sound/soc/apple/macaudio.c:1344:5: sparse: sparse: symbol 'macaudio_slk_info' was not declared. Should it be static?
   sound/soc/apple/macaudio.c:1354:5: sparse: sparse: symbol 'macaudio_slk_put' was not declared. Should it be static?
>> sound/soc/apple/macaudio.c:1386:5: sparse: sparse: symbol 'macaudio_slk_get' was not declared. Should it be static?
   sound/soc/apple/macaudio.c:1396:5: sparse: sparse: symbol 'macaudio_slk_lock' was not declared. Should it be static?
   sound/soc/apple/macaudio.c:1415:6: sparse: sparse: symbol 'macaudio_slk_unlock' was not declared. Should it be static?

vim +/macaudio_slk_get +1386 sound/soc/apple/macaudio.c

  1238	
> 1239	struct macaudio_platform_cfg macaudio_j375_cfg = {
  1240		.fixup = macaudio_j375_fixup_controls,
  1241	};
  1242	
  1243	static int macaudio_j493_fixup_controls(struct snd_soc_card *card)
  1244	{
  1245		struct macaudio_snd_data *ma = snd_soc_card_get_drvdata(card);
  1246	
  1247		if (ma->has_speakers) {
  1248			if (!please_blow_up_my_speakers) {
  1249				dev_err(card->dev, "driver can't assure safety on this model, refusing probe\n");
  1250				return -EINVAL;
  1251			}
  1252	
  1253			CHECK(snd_soc_limit_volume, "* Amp Gain Volume", 9); // 15 set by macOS, this is 3 dB below
  1254	
  1255			macaudio_vlimit_update(ma);
  1256		}
  1257	
  1258		return 0;	
  1259	}
  1260	
  1261	struct macaudio_platform_cfg macaudio_j493_cfg = {
  1262		.fixup = macaudio_j493_fixup_controls
  1263	};
  1264	
  1265	static int macaudio_fallback_fixup_controls(struct snd_soc_card *card)
  1266	{
  1267		struct macaudio_snd_data *ma = snd_soc_card_get_drvdata(card);
  1268	
  1269		if (ma->has_speakers && !please_blow_up_my_speakers) {
  1270			dev_err(card->dev, "driver can't assure safety on this model, refusing probe\n");
  1271			return -EINVAL;
  1272		}
  1273	
  1274		return 0;
  1275	}
  1276	
  1277	struct macaudio_platform_cfg macaudio_fallback_cfg = {
  1278		.fixup = macaudio_fallback_fixup_controls
  1279	};
  1280	
  1281	#undef CHECK
  1282	
  1283	static const char * const macaudio_spk_mux_texts[] = {
  1284		"Primary",
  1285		"Secondary"
  1286	};
  1287	
  1288	SOC_ENUM_SINGLE_VIRT_DECL(macaudio_spk_mux_enum, macaudio_spk_mux_texts);
  1289	
  1290	static const struct snd_kcontrol_new macaudio_spk_mux =
  1291		SOC_DAPM_ENUM("Speaker Playback Mux", macaudio_spk_mux_enum);
  1292	
  1293	static const char * const macaudio_hp_mux_texts[] = {
  1294		"Primary",
  1295		"Secondary"
  1296	};
  1297	
  1298	SOC_ENUM_SINGLE_VIRT_DECL(macaudio_hp_mux_enum, macaudio_hp_mux_texts);
  1299	
  1300	static const struct snd_kcontrol_new macaudio_hp_mux =
  1301		SOC_DAPM_ENUM("Headphones Playback Mux", macaudio_hp_mux_enum);
  1302	
  1303	static const struct snd_soc_dapm_widget macaudio_snd_widgets[] = {
  1304		SND_SOC_DAPM_SPK("Speaker", NULL),
  1305		SND_SOC_DAPM_SPK("Speaker (Static)", NULL),
  1306		SND_SOC_DAPM_HP("Headphone", NULL),
  1307		SND_SOC_DAPM_MIC("Headset Mic", NULL),
  1308	
  1309		SND_SOC_DAPM_MUX("Speaker Playback Mux", SND_SOC_NOPM, 0, 0, &macaudio_spk_mux),
  1310		SND_SOC_DAPM_MUX("Headphone Playback Mux", SND_SOC_NOPM, 0, 0, &macaudio_hp_mux),
  1311	
  1312		SND_SOC_DAPM_AIF_OUT("Speaker Playback", NULL, 0, SND_SOC_NOPM, 0, 0),
  1313		SND_SOC_DAPM_AIF_OUT("Headphone Playback", NULL, 0, SND_SOC_NOPM, 0, 0),
  1314	
  1315		SND_SOC_DAPM_AIF_IN("Headset Capture", NULL, 0, SND_SOC_NOPM, 0, 0),
  1316		SND_SOC_DAPM_AIF_IN("Speaker Sense Capture", NULL, 0, SND_SOC_NOPM, 0, 0),
  1317	};
  1318	
  1319	int macaudio_sss_info(struct snd_kcontrol *kcontrol, struct snd_ctl_elem_info *uinfo)
  1320	{
  1321		uinfo->type = SNDRV_CTL_ELEM_TYPE_INTEGER;
  1322		uinfo->count = 1;
  1323		uinfo->value.integer.min = 0;
  1324		uinfo->value.integer.max = 192000;
  1325	
  1326		return 0;
  1327	}
  1328	
  1329	int macaudio_sss_get(struct snd_kcontrol *kcontrol, struct snd_ctl_elem_value *uvalue)
  1330	{
  1331		struct snd_soc_card *card = snd_kcontrol_chip(kcontrol);
  1332		struct macaudio_snd_data *ma = snd_soc_card_get_drvdata(card);
  1333	
  1334		/*
  1335		 * TODO: Check if any locking is in order here. I would
  1336		 * assume there is some ALSA-level lock, but DAPM implementations
  1337		 * of kcontrol ops do explicit locking, so look into it.
  1338		 */
  1339		uvalue->value.integer.value[0] = ma->speaker_sample_rate;
  1340	
  1341		return 0;
  1342	}
  1343	
  1344	int macaudio_slk_info(struct snd_kcontrol *kcontrol, struct snd_ctl_elem_info *uinfo)
  1345	{
  1346		uinfo->type = SNDRV_CTL_ELEM_TYPE_INTEGER;
  1347		uinfo->count = 1;
  1348		uinfo->value.integer.min = INT_MIN;
  1349		uinfo->value.integer.max = INT_MAX;
  1350	
  1351		return 0;
  1352	}
  1353	
  1354	int macaudio_slk_put(struct snd_kcontrol *kcontrol, struct snd_ctl_elem_value *uvalue)
  1355	{
  1356		struct snd_soc_card *card = snd_kcontrol_chip(kcontrol);
  1357		struct macaudio_snd_data *ma = snd_soc_card_get_drvdata(card);
  1358	
  1359		if (!ma->speaker_lock_owner)
  1360			return -EPERM;
  1361	
  1362		if (uvalue->value.integer.value[0] != SPEAKER_MAGIC_VALUE)
  1363			return -EINVAL;
  1364	
  1365		/* Serves as a notification that the lock was lost at some point */
  1366		if (ma->speaker_volume_was_locked) {
  1367			ma->speaker_volume_was_locked = false;
  1368			return -ETIMEDOUT;
  1369		}
  1370	
  1371		cancel_delayed_work(&ma->lock_timeout_work);
  1372	
  1373		ma->speaker_lock_remain = ms_to_ktime(SPEAKER_LOCK_TIMEOUT);
  1374		ma->speaker_lock_timeout = ktime_add(ktime_get(), ma->speaker_lock_remain);
  1375		macaudio_vlimit_update(ma);
  1376	
  1377		if (ma->speaker_lock_timeout_enabled) {
  1378			dev_dbg(ma->card.dev, "Volume limit timeout ping: %ld us left\n",
  1379				(long)ktime_to_us(ma->speaker_lock_remain));
  1380			schedule_delayed_work(&ma->lock_timeout_work, usecs_to_jiffies(ktime_to_us(ma->speaker_lock_remain)));
  1381		}
  1382	
  1383		return 0;
  1384	}
  1385	
> 1386	int macaudio_slk_get(struct snd_kcontrol *kcontrol, struct snd_ctl_elem_value *uvalue)
  1387	{
  1388		struct snd_soc_card *card = snd_kcontrol_chip(kcontrol);
  1389		struct macaudio_snd_data *ma = snd_soc_card_get_drvdata(card);
  1390	
  1391		uvalue->value.integer.value[0] = ma->speaker_volume_unlocked ? 1 : 0;
  1392	
  1393		return 0;
  1394	}
  1395	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
