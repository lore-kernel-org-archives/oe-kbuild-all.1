Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02982182D0
	for <oe-kbuild-all@lists.linux.dev>; Thu,  1 Jun 2023 21:58:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685656727; x=1717192727;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PthM2b+e+/0t72is9TTB2Tk5FKelo0kJIr8YYt/X/AM=;
  b=W0cAQQFwTBDt5/EQrLgUb+D5FoWZ8sicsZV/PbAsoghDGsLe4wNHoI+/
   kvrRwF7X/ZlC4s2Q/DNwKZMx50bwaqCBOuNITBWM6tBeruDSZ+r4QMIA/
   8uPWNzGKCPteb6Pf27Ov2SSQ+dh1Wf4gANAfNztE5+y02H/RLS6lE6F79
   z66cu7edMMgJiBTvUuir4nOZ3Ku7Ry2M+YilSyk3RG5vsDu6r5BglVld5
   GXWiVYxz+WfjVxidfH71+xMz5igbNx7TlGS9E4c+ei0nyg66zKGBEtxSk
   92juV77SkhYwuFK97F6vsG+P3iP9+9vwjjS5SrSI4fBiF4wvh/ylG6i3w
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10728"; a="419223187"
X-IronPort-AV: E=Sophos;i="6.00,210,1681196400"; 
   d="scan'208";a="419223187"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2023 14:58:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10728"; a="851875770"
X-IronPort-AV: E=Sophos;i="6.00,210,1681196400"; 
   d="scan'208";a="851875770"
Received: from lkp-server01.sh.intel.com (HELO fb1ced2c09fb) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 01 Jun 2023 14:58:44 -0700
Received: from kbuild by fb1ced2c09fb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q4qJg-0002ii-0E;
	Thu, 01 Jun 2023 21:58:44 +0000
Date: Fri, 2 Jun 2023 05:58:04 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-6.1 2/3] drivers/mmc/core/mmc.c:1006:5:
 warning: no previous prototype for 'mmc_select_bus_width'
Message-ID: <202306020524.uCQZYtfF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android14-6.1
head:   87b384408e48cba1bc64922b7897185a7c65d4c7
commit: a3a743e67f3ded182826a65262af30ec11ec5bbe [2/3] ANDROID: mmc: core: Export core functions for kernel modules usage
config: i386-randconfig-i052-20230531 (https://download.01.org/0day-ci/archive/20230602/202306020524.uCQZYtfF-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build):
        git remote add android-common https://android.googlesource.com/kernel/common
        git fetch --no-tags android-common android14-6.1
        git checkout a3a743e67f3ded182826a65262af30ec11ec5bbe
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=i386 olddefconfig
        make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/mmc/core/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306020524.uCQZYtfF-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/mmc/core/mmc.c:1006:5: warning: no previous prototype for 'mmc_select_bus_width' [-Wmissing-prototypes]
    1006 | int mmc_select_bus_width(struct mmc_card *card)
         |     ^~~~~~~~~~~~~~~~~~~~
>> drivers/mmc/core/mmc.c:1076:5: warning: no previous prototype for 'mmc_select_hs' [-Wmissing-prototypes]
    1076 | int mmc_select_hs(struct mmc_card *card)
         |     ^~~~~~~~~~~~~
>> drivers/mmc/core/mmc.c:1095:5: warning: no previous prototype for 'mmc_select_hs_ddr' [-Wmissing-prototypes]
    1095 | int mmc_select_hs_ddr(struct mmc_card *card)
         |     ^~~~~~~~~~~~~~~~~
>> drivers/mmc/core/mmc.c:1166:5: warning: no previous prototype for 'mmc_select_hs400' [-Wmissing-prototypes]
    1166 | int mmc_select_hs400(struct mmc_card *card)
         |     ^~~~~~~~~~~~~~~~
>> drivers/mmc/core/mmc.c:1541:5: warning: no previous prototype for 'mmc_select_timing' [-Wmissing-prototypes]
    1541 | int mmc_select_timing(struct mmc_card *card)
         |     ^~~~~~~~~~~~~~~~~
>> drivers/mmc/core/mmc.c:1582:5: warning: no previous prototype for 'mmc_hs200_tuning' [-Wmissing-prototypes]
    1582 | int mmc_hs200_tuning(struct mmc_card *card)
         |     ^~~~~~~~~~~~~~~~


vim +/mmc_select_bus_width +1006 drivers/mmc/core/mmc.c

  1000	
  1001	/*
  1002	 * Select the bus width amoung 4-bit and 8-bit(SDR).
  1003	 * If the bus width is changed successfully, return the selected width value.
  1004	 * Zero is returned instead of error value if the wide width is not supported.
  1005	 */
> 1006	int mmc_select_bus_width(struct mmc_card *card)
  1007	{
  1008		static unsigned ext_csd_bits[] = {
  1009			EXT_CSD_BUS_WIDTH_8,
  1010			EXT_CSD_BUS_WIDTH_4,
  1011		};
  1012		static unsigned bus_widths[] = {
  1013			MMC_BUS_WIDTH_8,
  1014			MMC_BUS_WIDTH_4,
  1015		};
  1016		struct mmc_host *host = card->host;
  1017		unsigned idx, bus_width = 0;
  1018		int err = 0;
  1019	
  1020		if (!mmc_can_ext_csd(card) ||
  1021		    !(host->caps & (MMC_CAP_4_BIT_DATA | MMC_CAP_8_BIT_DATA)))
  1022			return 0;
  1023	
  1024		idx = (host->caps & MMC_CAP_8_BIT_DATA) ? 0 : 1;
  1025	
  1026		/*
  1027		 * Unlike SD, MMC cards dont have a configuration register to notify
  1028		 * supported bus width. So bus test command should be run to identify
  1029		 * the supported bus width or compare the ext csd values of current
  1030		 * bus width and ext csd values of 1 bit mode read earlier.
  1031		 */
  1032		for (; idx < ARRAY_SIZE(bus_widths); idx++) {
  1033			/*
  1034			 * Host is capable of 8bit transfer, then switch
  1035			 * the device to work in 8bit transfer mode. If the
  1036			 * mmc switch command returns error then switch to
  1037			 * 4bit transfer mode. On success set the corresponding
  1038			 * bus width on the host.
  1039			 */
  1040			err = mmc_switch(card, EXT_CSD_CMD_SET_NORMAL,
  1041					 EXT_CSD_BUS_WIDTH,
  1042					 ext_csd_bits[idx],
  1043					 card->ext_csd.generic_cmd6_time);
  1044			if (err)
  1045				continue;
  1046	
  1047			bus_width = bus_widths[idx];
  1048			mmc_set_bus_width(host, bus_width);
  1049	
  1050			/*
  1051			 * If controller can't handle bus width test,
  1052			 * compare ext_csd previously read in 1 bit mode
  1053			 * against ext_csd at new bus width
  1054			 */
  1055			if (!(host->caps & MMC_CAP_BUS_WIDTH_TEST))
  1056				err = mmc_compare_ext_csds(card, bus_width);
  1057			else
  1058				err = mmc_bus_test(card, bus_width);
  1059	
  1060			if (!err) {
  1061				err = bus_width;
  1062				break;
  1063			} else {
  1064				pr_warn("%s: switch to bus width %d failed\n",
  1065					mmc_hostname(host), 1 << bus_width);
  1066			}
  1067		}
  1068	
  1069		return err;
  1070	}
  1071	EXPORT_SYMBOL_GPL(mmc_select_bus_width);
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
