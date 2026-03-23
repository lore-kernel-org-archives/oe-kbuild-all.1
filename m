Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 942B63BADB2
	for <oe-kbuild-all@lists.linux.dev>; Mon, 23 Mar 2026 16:48:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774284485; cv=none; b=l0JUX7DG7BxKfIvDXJfDOzs84K66LgEhUUAG5oweB/XkRcDf5fvwNARMRmL54sH+7Q59Ra6yhIBq+hUHbzPIt88t+OxcqgWuG2Xk3htWEfr18D9koRtSRSOZuRKkajS54uC+jyVlMS3B9qKCzE8Bx1K1k8SpaQaJAZz23IrFc/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774284485; c=relaxed/simple;
	bh=fhPL0MBeA2523nQ+abIPQP9BJRAETtmNY29ZtZLWDTY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=GcdH8uNWDh1nLvLJupNYASsO21DrdPWbOyZgA8ek48aUpSzfBM0wE0gl8feqeHIEvXHeTcxYktCzyICfn2lEIV4dkXdrf7Zc5dL6jybt5hTGkktGH2ELMjxHdWbUjs1/IMw2gHf/He+CL50Py6BwyVVsPPf1rrVBQMtB/uJTEvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=K/xKnhTk; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K/xKnhTk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774284483; x=1805820483;
  h=date:from:to:cc:subject:message-id;
  bh=fhPL0MBeA2523nQ+abIPQP9BJRAETtmNY29ZtZLWDTY=;
  b=K/xKnhTkxUrHUYETo9FR26WLrf99tQu7peQw9HgFRTJ4KE2ewF7X41i4
   7giB82JPL47TO2Rj/ngaeehFmK8WWrF3p+1SoUCjJTiDb8hPnEQOA5Pwc
   sTy6PHUChCKqO4ImZyhWSoYne8Pv29fmy3jE334JUqVzObVhFRo+j0u9l
   e5AonepudlHWNXTlcRxt1/ndMreY2o9/fOotrMgvpLwQ6Du+sWoGl2hjz
   +aY7ntCtjAEizpUMuexqEDa78r3wmXBA9WZYt7HTPuFZMxi3oPb9KMX9n
   YIwUJq6VFb1gjMnv5bNMnwEYz7H30A7hxrLkjIUCS6GCZLlI9AlKpo7YX
   A==;
X-CSE-ConnectionGUID: Xb7HusVpQ4md9RbxSaDtDA==
X-CSE-MsgGUID: L8/lhJZiR0SouaM8iXnndw==
X-IronPort-AV: E=McAfee;i="6800,10657,11738"; a="92861265"
X-IronPort-AV: E=Sophos;i="6.23,137,1770624000"; 
   d="scan'208";a="92861265"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2026 09:48:02 -0700
X-CSE-ConnectionGUID: FdQ3DFvNRXOwl3wnI5qSHA==
X-CSE-MsgGUID: sKmZWP5cRyWQF3aHbHfZjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,137,1770624000"; 
   d="scan'208";a="247818411"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 23 Mar 2026 09:48:01 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w4iRb-000000002ZF-2Dty;
	Mon, 23 Mar 2026 16:47:59 +0000
Date: Tue, 24 Mar 2026 00:47:28 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-kiwi-6.1 7/7]
 drivers/mmc/core/mmc.c:1006:5: warning: no previous prototype for
 'mmc_select_bus_width'
Message-ID: <202603240041.oDV3zaqq-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Sarthak,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android14-kiwi-6.1
head:   744b8dcec1ed5c6c8f7fe7eb209c7b0d644dc30f
commit: a3a743e67f3ded182826a65262af30ec11ec5bbe [7/7] ANDROID: mmc: core: Export core functions for kernel modules usage
config: arm64-randconfig-002-20260323 (https://download.01.org/0day-ci/archive/20260324/202603240041.oDV3zaqq-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260324/202603240041.oDV3zaqq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603240041.oDV3zaqq-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/mmc/core/mmc.c:1006:5: warning: no previous prototype for 'mmc_select_bus_width' [-Wmissing-prototypes]
    1006 | int mmc_select_bus_width(struct mmc_card *card)
         |     ^~~~~~~~~~~~~~~~~~~~
   drivers/mmc/core/mmc.c:1076:5: warning: no previous prototype for 'mmc_select_hs' [-Wmissing-prototypes]
    1076 | int mmc_select_hs(struct mmc_card *card)
         |     ^~~~~~~~~~~~~
>> drivers/mmc/core/mmc.c:1095:5: warning: no previous prototype for 'mmc_select_hs_ddr' [-Wmissing-prototypes]
    1095 | int mmc_select_hs_ddr(struct mmc_card *card)
         |     ^~~~~~~~~~~~~~~~~
   drivers/mmc/core/mmc.c:1166:5: warning: no previous prototype for 'mmc_select_hs400' [-Wmissing-prototypes]
    1166 | int mmc_select_hs400(struct mmc_card *card)
         |     ^~~~~~~~~~~~~~~~
   drivers/mmc/core/mmc.c:1541:5: warning: no previous prototype for 'mmc_select_timing' [-Wmissing-prototypes]
    1541 | int mmc_select_timing(struct mmc_card *card)
         |     ^~~~~~~~~~~~~~~~~
   drivers/mmc/core/mmc.c:1582:5: warning: no previous prototype for 'mmc_hs200_tuning' [-Wmissing-prototypes]
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
  1076	int mmc_select_hs(struct mmc_card *card)
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

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
