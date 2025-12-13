Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A3832D6E7E
	for <oe-kbuild-all@lists.linux.dev>; Sat, 13 Dec 2025 16:15:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765642504; cv=none; b=IlB/d4cTyJsDx1J87rsPEXhqIhg47lfOc4EVOQP9kCddhYuFxGzz44SlPe9QKv0QzB2Cc9irSTdcmi2c/gbk+r4V+lSPs7l5lh6xCmf69uMFNw9hPvOjB9rhhVV/xNGkYjGmFxHuuaPYI00gM1WQkG2UY8wwKJCUgsVt1gu++fE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765642504; c=relaxed/simple;
	bh=XlqhjgUuSJKYO33qRUm2VTR9v9hk0UHS50cKLN3lFRA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XtQlORgTCAtqA+hd7e2GQ6B1KJ6eNv/IrJRz6o6gIjNmCphWu4zx96do89Gb+HUT15QiBLUeZHQjtiyxMm5nG/wiIjJy0jK7lEjuyBDz9RFp01540EVPpGfc0IT8WbmArwwZ5404s8wg4vianfK0Qjj3i4Rih3Qh1DkZ4Jn3eh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ra55LQAl; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ra55LQAl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765642503; x=1797178503;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XlqhjgUuSJKYO33qRUm2VTR9v9hk0UHS50cKLN3lFRA=;
  b=Ra55LQAl3N/1Sh7Qk61Bk2pcDzHJTrPWs5OQTEnqhChcxueqtjwlw4wn
   3x7jHGc4DLilY9FGinRIyOV95t+T08GfbD04a0SgiZis8um69UU6FXal7
   sLKk3qlBZVtcrdGz0dk2BmmNj4Yjre9C4aQhBrCxFLo0W8U0Wc8X6TBp4
   OUm00YS9RlmaOsLnAzFV88e7jX3bidRHLge0/bbg3l7sOw1GW0J7FYVzY
   ehrMspXjevnXAmsrI7/Qip8d3u/jL6vLCpWBHrtneLP85EoYMMtT6CGJ3
   IfVkhlWjRKvgR2WY4lPN9q8YJOEQoFAUo2HmTuQ63w4GmSGQJLg2+CzWl
   A==;
X-CSE-ConnectionGUID: F4EPSrwmQu2Hu2m4zpdm5A==
X-CSE-MsgGUID: IbKKcA2cSvKB1rGYYfLgMg==
X-IronPort-AV: E=McAfee;i="6800,10657,11635"; a="67556155"
X-IronPort-AV: E=Sophos;i="6.20,256,1758610800"; 
   d="scan'208";a="67556155"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2025 08:15:00 -0800
X-CSE-ConnectionGUID: obgzBSj/RgKpaWF0oIuC7w==
X-CSE-MsgGUID: qQ64nmpdR8uD9t22HDo6uA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,146,1763452800"; 
   d="scan'208";a="196952018"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 13 Dec 2025 08:14:59 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUSGm-000000007sl-2slR;
	Sat, 13 Dec 2025 16:14:56 +0000
Date: Sun, 14 Dec 2025 00:14:16 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-6.1 2/2] drivers/mmc/core/mmc.c:1076:5:
 warning: no previous prototype for function 'mmc_select_hs'
Message-ID: <202512140032.5ql6TowU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android14-6.1
head:   6f1c2f8fd8c80fa50c9be0270d8474d6fa7412f2
commit: a3a743e67f3ded182826a65262af30ec11ec5bbe [2/2] ANDROID: mmc: core: Export core functions for kernel modules usage
config: arm-randconfig-r072-20251213 (https://download.01.org/0day-ci/archive/20251214/202512140032.5ql6TowU-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251214/202512140032.5ql6TowU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512140032.5ql6TowU-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/mmc/core/mmc.c:1006:5: warning: no previous prototype for function 'mmc_select_bus_width' [-Wmissing-prototypes]
   int mmc_select_bus_width(struct mmc_card *card)
       ^
   drivers/mmc/core/mmc.c:1006:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int mmc_select_bus_width(struct mmc_card *card)
   ^
   static 
>> drivers/mmc/core/mmc.c:1076:5: warning: no previous prototype for function 'mmc_select_hs' [-Wmissing-prototypes]
   int mmc_select_hs(struct mmc_card *card)
       ^
   drivers/mmc/core/mmc.c:1076:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int mmc_select_hs(struct mmc_card *card)
   ^
   static 
>> drivers/mmc/core/mmc.c:1095:5: warning: no previous prototype for function 'mmc_select_hs_ddr' [-Wmissing-prototypes]
   int mmc_select_hs_ddr(struct mmc_card *card)
       ^
   drivers/mmc/core/mmc.c:1095:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int mmc_select_hs_ddr(struct mmc_card *card)
   ^
   static 
>> drivers/mmc/core/mmc.c:1166:5: warning: no previous prototype for function 'mmc_select_hs400' [-Wmissing-prototypes]
   int mmc_select_hs400(struct mmc_card *card)
       ^
   drivers/mmc/core/mmc.c:1166:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int mmc_select_hs400(struct mmc_card *card)
   ^
   static 
   drivers/mmc/core/mmc.c:1541:5: warning: no previous prototype for function 'mmc_select_timing' [-Wmissing-prototypes]
   int mmc_select_timing(struct mmc_card *card)
       ^
   drivers/mmc/core/mmc.c:1541:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int mmc_select_timing(struct mmc_card *card)
   ^
   static 
   drivers/mmc/core/mmc.c:1582:5: warning: no previous prototype for function 'mmc_hs200_tuning' [-Wmissing-prototypes]
   int mmc_hs200_tuning(struct mmc_card *card)
       ^
   drivers/mmc/core/mmc.c:1582:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int mmc_hs200_tuning(struct mmc_card *card)
   ^
   static 
   6 warnings generated.


vim +/mmc_select_hs +1076 drivers/mmc/core/mmc.c

  1072	
  1073	/*
  1074	 * Switch to the high-speed mode
  1075	 */
> 1076	int mmc_select_hs(struct mmc_card *card)
  1077	{
  1078		int err;
  1079	
  1080		err = __mmc_switch(card, EXT_CSD_CMD_SET_NORMAL,
  1081				   EXT_CSD_HS_TIMING, EXT_CSD_TIMING_HS,
  1082				   card->ext_csd.generic_cmd6_time, MMC_TIMING_MMC_HS,
  1083				   true, true, MMC_CMD_RETRIES);
  1084		if (err)
  1085			pr_warn("%s: switch to high-speed failed, err:%d\n",
  1086				mmc_hostname(card->host), err);
  1087	
  1088		return err;
  1089	}
  1090	EXPORT_SYMBOL_GPL(mmc_select_hs);
  1091	
  1092	/*
  1093	 * Activate wide bus and DDR if supported.
  1094	 */
> 1095	int mmc_select_hs_ddr(struct mmc_card *card)
  1096	{
  1097		struct mmc_host *host = card->host;
  1098		u32 bus_width, ext_csd_bits;
  1099		int err = 0;
  1100	
  1101		if (!(card->mmc_avail_type & EXT_CSD_CARD_TYPE_DDR_52))
  1102			return 0;
  1103	
  1104		bus_width = host->ios.bus_width;
  1105		if (bus_width == MMC_BUS_WIDTH_1)
  1106			return 0;
  1107	
  1108		ext_csd_bits = (bus_width == MMC_BUS_WIDTH_8) ?
  1109			EXT_CSD_DDR_BUS_WIDTH_8 : EXT_CSD_DDR_BUS_WIDTH_4;
  1110	
  1111		err = __mmc_switch(card, EXT_CSD_CMD_SET_NORMAL,
  1112				   EXT_CSD_BUS_WIDTH,
  1113				   ext_csd_bits,
  1114				   card->ext_csd.generic_cmd6_time,
  1115				   MMC_TIMING_MMC_DDR52,
  1116				   true, true, MMC_CMD_RETRIES);
  1117		if (err) {
  1118			pr_err("%s: switch to bus width %d ddr failed\n",
  1119				mmc_hostname(host), 1 << bus_width);
  1120			return err;
  1121		}
  1122	
  1123		/*
  1124		 * eMMC cards can support 3.3V to 1.2V i/o (vccq)
  1125		 * signaling.
  1126		 *
  1127		 * EXT_CSD_CARD_TYPE_DDR_1_8V means 3.3V or 1.8V vccq.
  1128		 *
  1129		 * 1.8V vccq at 3.3V core voltage (vcc) is not required
  1130		 * in the JEDEC spec for DDR.
  1131		 *
  1132		 * Even (e)MMC card can support 3.3v to 1.2v vccq, but not all
  1133		 * host controller can support this, like some of the SDHCI
  1134		 * controller which connect to an eMMC device. Some of these
  1135		 * host controller still needs to use 1.8v vccq for supporting
  1136		 * DDR mode.
  1137		 *
  1138		 * So the sequence will be:
  1139		 * if (host and device can both support 1.2v IO)
  1140		 *	use 1.2v IO;
  1141		 * else if (host and device can both support 1.8v IO)
  1142		 *	use 1.8v IO;
  1143		 * so if host and device can only support 3.3v IO, this is the
  1144		 * last choice.
  1145		 *
  1146		 * WARNING: eMMC rules are NOT the same as SD DDR
  1147		 */
  1148		if (card->mmc_avail_type & EXT_CSD_CARD_TYPE_DDR_1_2V) {
  1149			err = mmc_set_signal_voltage(host, MMC_SIGNAL_VOLTAGE_120);
  1150			if (!err)
  1151				return 0;
  1152		}
  1153	
  1154		if (card->mmc_avail_type & EXT_CSD_CARD_TYPE_DDR_1_8V &&
  1155		    host->caps & MMC_CAP_1_8V_DDR)
  1156			err = mmc_set_signal_voltage(host, MMC_SIGNAL_VOLTAGE_180);
  1157	
  1158		/* make sure vccq is 3.3v after switching disaster */
  1159		if (err)
  1160			err = mmc_set_signal_voltage(host, MMC_SIGNAL_VOLTAGE_330);
  1161	
  1162		return err;
  1163	}
  1164	EXPORT_SYMBOL_GPL(mmc_select_hs_ddr);
  1165	
> 1166	int mmc_select_hs400(struct mmc_card *card)
  1167	{
  1168		struct mmc_host *host = card->host;
  1169		unsigned int max_dtr;
  1170		int err = 0;
  1171		u8 val;
  1172	
  1173		/*
  1174		 * HS400 mode requires 8-bit bus width
  1175		 */
  1176		if (!(card->mmc_avail_type & EXT_CSD_CARD_TYPE_HS400 &&
  1177		      host->ios.bus_width == MMC_BUS_WIDTH_8))
  1178			return 0;
  1179	
  1180		/* Switch card to HS mode */
  1181		val = EXT_CSD_TIMING_HS;
  1182		err = __mmc_switch(card, EXT_CSD_CMD_SET_NORMAL,
  1183				   EXT_CSD_HS_TIMING, val,
  1184				   card->ext_csd.generic_cmd6_time, 0,
  1185				   false, true, MMC_CMD_RETRIES);
  1186		if (err) {
  1187			pr_err("%s: switch to high-speed from hs200 failed, err:%d\n",
  1188				mmc_hostname(host), err);
  1189			return err;
  1190		}
  1191	
  1192		/* Prepare host to downgrade to HS timing */
  1193		if (host->ops->hs400_downgrade)
  1194			host->ops->hs400_downgrade(host);
  1195	
  1196		/* Set host controller to HS timing */
  1197		mmc_set_timing(host, MMC_TIMING_MMC_HS);
  1198	
  1199		/* Reduce frequency to HS frequency */
  1200		max_dtr = card->ext_csd.hs_max_dtr;
  1201		mmc_set_clock(host, max_dtr);
  1202	
  1203		err = mmc_switch_status(card, true);
  1204		if (err)
  1205			goto out_err;
  1206	
  1207		if (host->ops->hs400_prepare_ddr)
  1208			host->ops->hs400_prepare_ddr(host);
  1209	
  1210		/* Switch card to DDR */
  1211		err = mmc_switch(card, EXT_CSD_CMD_SET_NORMAL,
  1212				 EXT_CSD_BUS_WIDTH,
  1213				 EXT_CSD_DDR_BUS_WIDTH_8,
  1214				 card->ext_csd.generic_cmd6_time);
  1215		if (err) {
  1216			pr_err("%s: switch to bus width for hs400 failed, err:%d\n",
  1217				mmc_hostname(host), err);
  1218			return err;
  1219		}
  1220	
  1221		/* Switch card to HS400 */
  1222		val = EXT_CSD_TIMING_HS400 |
  1223		      card->drive_strength << EXT_CSD_DRV_STR_SHIFT;
  1224		err = __mmc_switch(card, EXT_CSD_CMD_SET_NORMAL,
  1225				   EXT_CSD_HS_TIMING, val,
  1226				   card->ext_csd.generic_cmd6_time, 0,
  1227				   false, true, MMC_CMD_RETRIES);
  1228		if (err) {
  1229			pr_err("%s: switch to hs400 failed, err:%d\n",
  1230				 mmc_hostname(host), err);
  1231			return err;
  1232		}
  1233	
  1234		/* Set host controller to HS400 timing and frequency */
  1235		mmc_set_timing(host, MMC_TIMING_MMC_HS400);
  1236		mmc_set_bus_speed(card);
  1237	
  1238		if (host->ops->execute_hs400_tuning) {
  1239			mmc_retune_disable(host);
  1240			err = host->ops->execute_hs400_tuning(host, card);
  1241			mmc_retune_enable(host);
  1242			if (err)
  1243				goto out_err;
  1244		}
  1245	
  1246		if (host->ops->hs400_complete)
  1247			host->ops->hs400_complete(host);
  1248	
  1249		err = mmc_switch_status(card, true);
  1250		if (err)
  1251			goto out_err;
  1252	
  1253		return 0;
  1254	
  1255	out_err:
  1256		pr_err("%s: %s failed, error %d\n", mmc_hostname(card->host),
  1257		       __func__, err);
  1258		return err;
  1259	}
  1260	EXPORT_SYMBOL_GPL(mmc_select_hs400);
  1261	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
