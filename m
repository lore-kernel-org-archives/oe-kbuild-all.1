Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A527E153836
	for <oe-kbuild-all@lists.linux.dev>; Mon, 18 Nov 2024 09:08:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731920936; cv=none; b=qdd1kTUHLuNONOvujsFgmMoB7RgOgGzdYpR5NEEp/2sA5V8PY1QTNRZrEFBPu7oIdcR26cJsW5wp2G3KX0lGCeqSKaJyMeXbfDAeBNYWf4HI7wZD9WSfecpCb0pfRaN4rHOGluWimZ5T9mZHhPwxsJ0bPfnOTZA3TGoyK2lPbHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731920936; c=relaxed/simple;
	bh=JtDqokNESDrIynZGZU+X9oe3y4a9t/bBkMVfnr1gCl4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=We2rHuIJsv/VKeNcrucV6+znFyyagECerbiJ9c1DwM4EgsUIiCEJzOCt8kIst52CgqbTH3cucAkV7xAOfTiy5HlDgQ1ic/hwCdy5LU9WRNKyOYWQywrKuBZa9ybLNBPxzd5PQBTLK86dlHJhfiYbrOE6km5iLBL8WTvjKKZNRZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LiftjREC; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LiftjREC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731920935; x=1763456935;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JtDqokNESDrIynZGZU+X9oe3y4a9t/bBkMVfnr1gCl4=;
  b=LiftjRECbPDWKTK8JD4JO+JVemlEXuFTF9GLeRZXqU2mSPytmCjqimtr
   61/AEl240XhTuNCkWZByj7RbFy861iYNAd0tdp2fPj2aj8b/sHNDfIND6
   78sCuV3oMVSZ2+9cll1ZNwcKgnZ3Me9CV4AYyTyMd5eE2QmQVZPBrITTD
   /wNinCEe5mhf210XMOZtUCBQuQL32J6fZ7qg/uDq0D4Fl5RrySxEjj+nh
   559d45FEVEbyrHGKR7himAn3U7mez0v4MSzmLr/cfWutz35/z0Vk9osVc
   YLyb1hBqzXVibeaYkgCJ6TsTfS2jhYoj/XqFH5Xahi2gf114CZb6R7aha
   g==;
X-CSE-ConnectionGUID: HoiuZWQaRNm+0ZPcTLYQQg==
X-CSE-MsgGUID: bEGfxgUhQWaSRfMJd+CjSw==
X-IronPort-AV: E=McAfee;i="6700,10204,11259"; a="34728335"
X-IronPort-AV: E=Sophos;i="6.12,163,1728975600"; 
   d="scan'208";a="34728335"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2024 01:08:42 -0800
X-CSE-ConnectionGUID: ayrQe+NaQhu/wFHh8m2ywA==
X-CSE-MsgGUID: q+HSzzcJSBepHefYRedDzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,163,1728975600"; 
   d="scan'208";a="89316987"
Received: from lkp-server01.sh.intel.com (HELO 1e3cc1889ffb) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 18 Nov 2024 01:08:41 -0800
Received: from kbuild by 1e3cc1889ffb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tCxkM-0002LH-07;
	Mon, 18 Nov 2024 09:08:38 +0000
Date: Mon, 18 Nov 2024 17:08:32 +0800
From: kernel test robot <lkp@intel.com>
To: Hector Martin <marcan@marcan.st>
Cc: oe-kbuild-all@lists.linux.dev, Janne Grunau <j@jannau.net>
Subject: [asahilinux:bits/070-audio 65/119]
 sound/soc/apple/macaudio.c:1111:30: sparse: sparse: symbol
 'macaudio_j274_cfg' was not declared. Should it be static?
Message-ID: <202411181709.guPSxho2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux bits/070-audio
head:   a89c7c8788b938f7b52c6ca56449de45e92a056e
commit: 4da5f1457485098662c840c4ad8f6b2833a1cbb8 [65/119] macaudio: speaker volume safety interlocks
config: sparc64-randconfig-r122-20241118 (https://download.01.org/0day-ci/archive/20241118/202411181709.guPSxho2-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 14.2.0
reproduce: (https://download.01.org/0day-ci/archive/20241118/202411181709.guPSxho2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411181709.guPSxho2-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> sound/soc/apple/macaudio.c:1111:30: sparse: sparse: symbol 'macaudio_j274_cfg' was not declared. Should it be static?
>> sound/soc/apple/macaudio.c:1147:30: sparse: sparse: symbol 'macaudio_j313_cfg' was not declared. Should it be static?
>> sound/soc/apple/macaudio.c:1192:30: sparse: sparse: symbol 'macaudio_j314_cfg' was not declared. Should it be static?
>> sound/soc/apple/macaudio.c:1200:30: sparse: sparse: symbol 'macaudio_j413_cfg' was not declared. Should it be static?
>> sound/soc/apple/macaudio.c:1210:30: sparse: sparse: symbol 'macaudio_j415_cfg' was not declared. Should it be static?
   sound/soc/apple/macaudio.c:1237:30: sparse: sparse: symbol 'macaudio_j375_cfg' was not declared. Should it be static?
>> sound/soc/apple/macaudio.c:1259:30: sparse: sparse: symbol 'macaudio_j493_cfg' was not declared. Should it be static?
>> sound/soc/apple/macaudio.c:1275:30: sparse: sparse: symbol 'macaudio_fallback_cfg' was not declared. Should it be static?
   sound/soc/apple/macaudio.c:1286:1: sparse: sparse: symbol 'macaudio_spk_mux_enum' was not declared. Should it be static?
   sound/soc/apple/macaudio.c:1296:1: sparse: sparse: symbol 'macaudio_hp_mux_enum' was not declared. Should it be static?
   sound/soc/apple/macaudio.c:1384:5: sparse: sparse: symbol 'macaudio_slk_lock' was not declared. Should it be static?
   sound/soc/apple/macaudio.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, ...):
   include/linux/page-flags.h:235:46: sparse: sparse: self-comparison always evaluates to false
   include/linux/page-flags.h:235:46: sparse: sparse: self-comparison always evaluates to false

vim +/macaudio_j274_cfg +1111 sound/soc/apple/macaudio.c

  1110	
> 1111	struct macaudio_platform_cfg macaudio_j274_cfg = {
  1112		.fixup = macaudio_j274_fixup_controls,
  1113	};
  1114	
  1115	static int macaudio_j313_fixup_controls(struct snd_soc_card *card) {
  1116		struct macaudio_snd_data *ma = snd_soc_card_get_drvdata(card);
  1117	
  1118		if (ma->has_speakers) {
  1119			if (!please_blow_up_my_speakers) {
  1120				dev_err(card->dev, "driver can't assure safety on this model, refusing probe\n");
  1121				return -EINVAL;
  1122			}
  1123	
  1124			CHECK(snd_soc_set_enum_kctl, "* ASI1 Sel", "Left");
  1125			CHECK(snd_soc_deactivate_kctl, "* ASI1 Sel", 0);
  1126	
  1127			/* !!! This is copied from j274, not obtained by looking at
  1128			 *     what macOS sets.
  1129			 */
  1130			CHECK(snd_soc_limit_volume, "* Amp Gain Volume", 14);
  1131	
  1132			/*
  1133			 * Since we don't set the right slots yet to avoid
  1134			 * driver conflict on the I2S bus sending ISENSE/VSENSE
  1135			 * samples from the codecs back to us, disable the
  1136			 * controls.
  1137			 */
  1138			CHECK(snd_soc_deactivate_kctl, "* VSENSE Switch", 0);
  1139			CHECK(snd_soc_deactivate_kctl, "* ISENSE Switch", 0);
  1140	
  1141			macaudio_vlimit_update(ma);
  1142		}
  1143	
  1144		return 0;
  1145	}
  1146	
> 1147	struct macaudio_platform_cfg macaudio_j313_cfg = {
  1148		.fixup = macaudio_j313_fixup_controls,
  1149	};
  1150	
  1151	static int macaudio_j314_fixup_controls(struct snd_soc_card *card)
  1152	{
  1153		struct macaudio_snd_data *ma = snd_soc_card_get_drvdata(card);
  1154	
  1155		if (ma->has_speakers) {
  1156			if (!please_blow_up_my_speakers) {
  1157				dev_err(card->dev, "driver can't assure safety on this model, refusing probe\n");
  1158				return -EINVAL;
  1159			}
  1160	
  1161			CHECK(snd_soc_set_enum_kctl, "* ASI1 Sel", "Left");
  1162			CHECK(snd_soc_deactivate_kctl, "* ASI1 Sel", 0);
  1163			CHECK(snd_soc_limit_volume, "* Amp Gain Volume", 9); // 15 set by macOS, this is 3 dB below
  1164			CHECK(snd_soc_set_enum_kctl, "* Tweeter HPF Corner Frequency", "800 Hz");
  1165			CHECK(snd_soc_deactivate_kctl, "* Tweeter HPF Corner Frequency", 0);
  1166	
  1167			/*
  1168			 * The speaker amps suffer from spurious overcurrent
  1169			 * events on their unmute, so enable autoretry.
  1170			 */
  1171			CHECK(snd_soc_set_enum_kctl, "* OCE Handling", "Retry");
  1172			CHECK(snd_soc_deactivate_kctl, "* OCE Handling", 0);
  1173	
  1174			/*
  1175			 * Since we don't set the right slots yet to avoid
  1176			 * driver conflict on the I2S bus sending ISENSE/VSENSE
  1177			 * samples from the codecs back to us, disable the
  1178			 * controls.
  1179			 */
  1180	#if 0
  1181			CHECK(snd_soc_deactivate_kctl, "* VSENSE Switch", 0);
  1182			CHECK(snd_soc_deactivate_kctl, "* ISENSE Switch", 0);
  1183	#endif
  1184	
  1185			macaudio_vlimit_update(ma);
  1186		}
  1187	
  1188		return 0;
  1189	}
  1190	
  1191	
> 1192	struct macaudio_platform_cfg macaudio_j314_cfg = {
  1193		.fixup = macaudio_j314_fixup_controls,
  1194		.limits = {
  1195			{.match = "* Tweeter Speaker Volume", TAS2764_DB_REDUCTION(20), TAS2764_0DB},
  1196			{.match = "* Woofer Speaker Volume", TAS2764_DB_REDUCTION(20), TAS2764_0DB},
  1197		}
  1198	};
  1199	
> 1200	struct macaudio_platform_cfg macaudio_j413_cfg = {
  1201		.fixup = macaudio_j314_fixup_controls,
  1202		.limits = {
  1203			/* Min gain: -17.47 dB */
  1204			{.match = "* Tweeter Speaker Volume", TAS2764_DB_REDUCTION(20), TAS2764_0DB},
  1205			/* Min gain: -10.63 dB */
  1206			{.match = "* Woofer Speaker Volume", TAS2764_DB_REDUCTION(14), TAS2764_0DB},
  1207		}
  1208	};
  1209	
> 1210	struct macaudio_platform_cfg macaudio_j415_cfg = {
  1211		.fixup = macaudio_j314_fixup_controls,
  1212		.limits = {
  1213			{.match = "* Tweeter Speaker Volume", TAS2764_DB_REDUCTION(20), TAS2764_0DB},
  1214			{.match = "* Woofer 1 Speaker Volume", TAS2764_DB_REDUCTION(20), TAS2764_0DB},
  1215			{.match = "* Woofer 2 Speaker Volume", TAS2764_DB_REDUCTION(20), TAS2764_0DB},
  1216		}
  1217	};
  1218	
  1219	static int macaudio_j375_fixup_controls(struct snd_soc_card *card)
  1220	{
  1221		struct macaudio_snd_data *ma = snd_soc_card_get_drvdata(card);
  1222	
  1223		if (ma->has_speakers) {
  1224			if (!please_blow_up_my_speakers) {
  1225				dev_err(card->dev, "driver can't assure safety on this model, refusing probe\n");
  1226				return -EINVAL;
  1227			}
  1228	
  1229			CHECK(snd_soc_limit_volume, "* Amp Gain Volume", 14); // 20 set by macOS, this is 3 dB below
  1230	
  1231			macaudio_vlimit_update(ma);
  1232		}
  1233	
  1234		return 0;
  1235	}
  1236	
  1237	struct macaudio_platform_cfg macaudio_j375_cfg = {
  1238		.fixup = macaudio_j375_fixup_controls,
  1239	};
  1240	
  1241	static int macaudio_j493_fixup_controls(struct snd_soc_card *card)
  1242	{
  1243		struct macaudio_snd_data *ma = snd_soc_card_get_drvdata(card);
  1244	
  1245		if (ma->has_speakers) {
  1246			if (!please_blow_up_my_speakers) {
  1247				dev_err(card->dev, "driver can't assure safety on this model, refusing probe\n");
  1248				return -EINVAL;
  1249			}
  1250	
  1251			CHECK(snd_soc_limit_volume, "* Amp Gain Volume", 9); // 15 set by macOS, this is 3 dB below
  1252	
  1253			macaudio_vlimit_update(ma);
  1254		}
  1255	
  1256		return 0;	
  1257	}
  1258	
> 1259	struct macaudio_platform_cfg macaudio_j493_cfg = {
  1260		.fixup = macaudio_j493_fixup_controls
  1261	};
  1262	
  1263	static int macaudio_fallback_fixup_controls(struct snd_soc_card *card)
  1264	{
  1265		struct macaudio_snd_data *ma = snd_soc_card_get_drvdata(card);
  1266	
  1267		if (ma->has_speakers && !please_blow_up_my_speakers) {
  1268			dev_err(card->dev, "driver can't assure safety on this model, refusing probe\n");
  1269			return -EINVAL;
  1270		}
  1271	
  1272		return 0;
  1273	}
  1274	
> 1275	struct macaudio_platform_cfg macaudio_fallback_cfg = {
  1276		.fixup = macaudio_fallback_fixup_controls
  1277	};
  1278	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
