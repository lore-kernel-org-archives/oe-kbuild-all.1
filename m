Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 856391427E
	for <oe-kbuild-all@lists.linux.dev>; Sun, 19 Nov 2023 16:53:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Pg2sVYtB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700412791; x=1731948791;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WtUowJ6/oCasU8edE3gk3KxFtrzstfCMrKA6tRAj4h8=;
  b=Pg2sVYtB+OCBG8rzvgcx08co+xv82Gaz/U0UNdA/N2ROg5WgR3bkSCbw
   sneH4awFl8V395f9ak9R+hqDEdcGrKyU3no+p85u16tKJqoNrLe3YJCwP
   ojON3aIuPlcUwqtJk7HrPrlRCArsryCkDv6a70p4vx5ZPhszxzvYudeQI
   aKocdNB0Zpkr6YS9tPOATOEUKeSaduadiOkLG5wi4devuYSE0n9AJGqR0
   siLQrySXkx7hmjY81/cJb1KEJtbyhrG7rTCJDZ6T1NlHHUxxD0MVeN/52
   kP0MYD8+d9MyDWvVX7/X8F0Q0IJN8W0zt1ZJIOlxnJvPBd5Nlegra9dFQ
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10899"; a="422603291"
X-IronPort-AV: E=Sophos;i="6.04,210,1695711600"; 
   d="scan'208";a="422603291"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2023 08:53:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10899"; a="909885787"
X-IronPort-AV: E=Sophos;i="6.04,210,1695711600"; 
   d="scan'208";a="909885787"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 19 Nov 2023 08:53:06 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r4l2e-0005KP-1b;
	Sun, 19 Nov 2023 16:53:04 +0000
Date: Mon, 20 Nov 2023 00:52:54 +0800
From: kernel test robot <lkp@intel.com>
To: Janne Grunau <j@jannau.net>
Cc: oe-kbuild-all@lists.linux.dev, Hector Martin <marcan@marcan.st>
Subject: [asahilinux:bits/170-atcphy 6/10] drivers/phy/apple/atc.c:1146:41:
 warning: variable 'rx_top' set but not used
Message-ID: <202311200004.dX0rBpQL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Janne,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://github.com/AsahiLinux/linux bits/170-atcphy
head:   8d5aa5ac58d74bbab31f6e180ad02d227b8bfeca
commit: c68fe6bed5ec0117be3dab2be93038af61cf5c7c [6/10] phy: apple: atc: Split atcphy_dp_configure_lane()
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20231120/202311200004.dX0rBpQL-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231120/202311200004.dX0rBpQL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311200004.dX0rBpQL-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/phy/apple/atc.c: In function 'atcphy_dp_configure_lane':
>> drivers/phy/apple/atc.c:1146:41: warning: variable 'rx_top' set but not used [-Wunused-but-set-variable]
    1146 |         void __iomem *tx_shm, *rx_shm, *rx_top;
         |                                         ^~~~~~
>> drivers/phy/apple/atc.c:1146:32: warning: variable 'rx_shm' set but not used [-Wunused-but-set-variable]
    1146 |         void __iomem *tx_shm, *rx_shm, *rx_top;
         |                                ^~~~~~
   drivers/phy/apple/atc.c: In function 'atcphy_dp_configure_lane2':
>> drivers/phy/apple/atc.c:1256:23: warning: variable 'tx_shm' set but not used [-Wunused-but-set-variable]
    1256 |         void __iomem *tx_shm, *rx_shm, *rx_top;
         |                       ^~~~~~
   drivers/phy/apple/atc.c: In function 'atcphy_usb3_power_on':
   drivers/phy/apple/atc.c:1607:13: warning: variable 'ret' set but not used [-Wunused-but-set-variable]
    1607 |         int ret = 0;
         |             ^~~


vim +/rx_top +1146 drivers/phy/apple/atc.c

a219f81dd49e61 Sven Peter   2022-11-30  1141  
a219f81dd49e61 Sven Peter   2022-11-30  1142  static int
a219f81dd49e61 Sven Peter   2022-11-30  1143  atcphy_dp_configure_lane(struct apple_atcphy *atcphy, unsigned int lane,
a219f81dd49e61 Sven Peter   2022-11-30  1144  			 const struct atcphy_dp_link_rate_configuration *cfg)
a219f81dd49e61 Sven Peter   2022-11-30  1145  {
a219f81dd49e61 Sven Peter   2022-11-30 @1146  	void __iomem *tx_shm, *rx_shm, *rx_top;
a219f81dd49e61 Sven Peter   2022-11-30  1147  
a219f81dd49e61 Sven Peter   2022-11-30  1148  	switch (lane) {
a219f81dd49e61 Sven Peter   2022-11-30  1149  	case 0:
a219f81dd49e61 Sven Peter   2022-11-30  1150  		tx_shm = atcphy->regs.core + LN0_AUSPMA_TX_SHM;
a219f81dd49e61 Sven Peter   2022-11-30  1151  		rx_shm = atcphy->regs.core + LN0_AUSPMA_RX_SHM;
a219f81dd49e61 Sven Peter   2022-11-30  1152  		rx_top = atcphy->regs.core + LN0_AUSPMA_RX_TOP;
a219f81dd49e61 Sven Peter   2022-11-30  1153  		break;
a219f81dd49e61 Sven Peter   2022-11-30  1154  	case 1:
a219f81dd49e61 Sven Peter   2022-11-30  1155  		tx_shm = atcphy->regs.core + LN1_AUSPMA_TX_SHM;
a219f81dd49e61 Sven Peter   2022-11-30  1156  		rx_shm = atcphy->regs.core + LN1_AUSPMA_RX_SHM;
a219f81dd49e61 Sven Peter   2022-11-30  1157  		rx_top = atcphy->regs.core + LN1_AUSPMA_RX_TOP;
a219f81dd49e61 Sven Peter   2022-11-30  1158  		break;
a219f81dd49e61 Sven Peter   2022-11-30  1159  	default:
a219f81dd49e61 Sven Peter   2022-11-30  1160  		return -EINVAL;
a219f81dd49e61 Sven Peter   2022-11-30  1161  	}
a219f81dd49e61 Sven Peter   2022-11-30  1162  
a219f81dd49e61 Sven Peter   2022-11-30  1163  	set32(tx_shm + LN_AUSPMA_TX_SHM_TXA_LDOCLK, LN_LDOCLK_EN_SML);
a219f81dd49e61 Sven Peter   2022-11-30  1164  	set32(tx_shm + LN_AUSPMA_TX_SHM_TXA_LDOCLK, LN_LDOCLK_EN_SML_OV);
a219f81dd49e61 Sven Peter   2022-11-30  1165  	udelay(2);
a219f81dd49e61 Sven Peter   2022-11-30  1166  
a219f81dd49e61 Sven Peter   2022-11-30  1167  	set32(tx_shm + LN_AUSPMA_TX_SHM_TXA_LDOCLK, LN_LDOCLK_EN_BIG);
a219f81dd49e61 Sven Peter   2022-11-30  1168  	set32(tx_shm + LN_AUSPMA_TX_SHM_TXA_LDOCLK, LN_LDOCLK_EN_BIG_OV);
a219f81dd49e61 Sven Peter   2022-11-30  1169  	udelay(2);
a219f81dd49e61 Sven Peter   2022-11-30  1170  
a219f81dd49e61 Sven Peter   2022-11-30  1171  	if (cfg->bypass_txa_ldoclk) {
a219f81dd49e61 Sven Peter   2022-11-30  1172  		set32(tx_shm + LN_AUSPMA_TX_SHM_TXA_LDOCLK,
a219f81dd49e61 Sven Peter   2022-11-30  1173  		      LN_LDOCLK_BYPASS_SML);
a219f81dd49e61 Sven Peter   2022-11-30  1174  		set32(tx_shm + LN_AUSPMA_TX_SHM_TXA_LDOCLK,
a219f81dd49e61 Sven Peter   2022-11-30  1175  		      LN_LDOCLK_BYPASS_SML_OV);
a219f81dd49e61 Sven Peter   2022-11-30  1176  		udelay(2);
a219f81dd49e61 Sven Peter   2022-11-30  1177  
a219f81dd49e61 Sven Peter   2022-11-30  1178  		set32(tx_shm + LN_AUSPMA_TX_SHM_TXA_LDOCLK,
a219f81dd49e61 Sven Peter   2022-11-30  1179  		      LN_LDOCLK_BYPASS_BIG);
a219f81dd49e61 Sven Peter   2022-11-30  1180  		set32(tx_shm + LN_AUSPMA_TX_SHM_TXA_LDOCLK,
a219f81dd49e61 Sven Peter   2022-11-30  1181  		      LN_LDOCLK_BYPASS_BIG_OV);
a219f81dd49e61 Sven Peter   2022-11-30  1182  		udelay(2);
a219f81dd49e61 Sven Peter   2022-11-30  1183  	} else {
a219f81dd49e61 Sven Peter   2022-11-30  1184  		clear32(tx_shm + LN_AUSPMA_TX_SHM_TXA_LDOCLK,
a219f81dd49e61 Sven Peter   2022-11-30  1185  			LN_LDOCLK_BYPASS_SML);
a219f81dd49e61 Sven Peter   2022-11-30  1186  		clear32(tx_shm + LN_AUSPMA_TX_SHM_TXA_LDOCLK,
a219f81dd49e61 Sven Peter   2022-11-30  1187  			LN_LDOCLK_BYPASS_SML_OV);
a219f81dd49e61 Sven Peter   2022-11-30  1188  		udelay(2);
a219f81dd49e61 Sven Peter   2022-11-30  1189  
a219f81dd49e61 Sven Peter   2022-11-30  1190  		clear32(tx_shm + LN_AUSPMA_TX_SHM_TXA_LDOCLK,
a219f81dd49e61 Sven Peter   2022-11-30  1191  			LN_LDOCLK_BYPASS_BIG);
a219f81dd49e61 Sven Peter   2022-11-30  1192  		clear32(tx_shm + LN_AUSPMA_TX_SHM_TXA_LDOCLK,
a219f81dd49e61 Sven Peter   2022-11-30  1193  			LN_LDOCLK_BYPASS_BIG_OV);
a219f81dd49e61 Sven Peter   2022-11-30  1194  		udelay(2);
a219f81dd49e61 Sven Peter   2022-11-30  1195  	}
a219f81dd49e61 Sven Peter   2022-11-30  1196  
a219f81dd49e61 Sven Peter   2022-11-30  1197  	set32(tx_shm + LN_AUSPMA_TX_SHM_TXA_CFG_MAIN_REG0,
a219f81dd49e61 Sven Peter   2022-11-30  1198  	      LN_BYTECLK_RESET_SYNC_SEL_OV);
a219f81dd49e61 Sven Peter   2022-11-30  1199  	set32(tx_shm + LN_AUSPMA_TX_SHM_TXA_CFG_MAIN_REG0,
a219f81dd49e61 Sven Peter   2022-11-30  1200  	      LN_BYTECLK_RESET_SYNC_EN);
a219f81dd49e61 Sven Peter   2022-11-30  1201  	set32(tx_shm + LN_AUSPMA_TX_SHM_TXA_CFG_MAIN_REG0,
a219f81dd49e61 Sven Peter   2022-11-30  1202  	      LN_BYTECLK_RESET_SYNC_EN_OV);
a219f81dd49e61 Sven Peter   2022-11-30  1203  	clear32(tx_shm + LN_AUSPMA_TX_SHM_TXA_CFG_MAIN_REG0,
a219f81dd49e61 Sven Peter   2022-11-30  1204  		LN_BYTECLK_RESET_SYNC_CLR);
a219f81dd49e61 Sven Peter   2022-11-30  1205  	set32(tx_shm + LN_AUSPMA_TX_SHM_TXA_CFG_MAIN_REG0,
a219f81dd49e61 Sven Peter   2022-11-30  1206  	      LN_BYTECLK_RESET_SYNC_CLR_OV);
a219f81dd49e61 Sven Peter   2022-11-30  1207  
a219f81dd49e61 Sven Peter   2022-11-30  1208  	if (cfg->txa_div2_en)
a219f81dd49e61 Sven Peter   2022-11-30  1209  		set32(tx_shm + LN_AUSPMA_TX_SHM_TXA_CFG_MAIN_REG1,
a219f81dd49e61 Sven Peter   2022-11-30  1210  		      LN_TXA_DIV2_EN);
a219f81dd49e61 Sven Peter   2022-11-30  1211  	else
a219f81dd49e61 Sven Peter   2022-11-30  1212  		clear32(tx_shm + LN_AUSPMA_TX_SHM_TXA_CFG_MAIN_REG1,
a219f81dd49e61 Sven Peter   2022-11-30  1213  			LN_TXA_DIV2_EN);
a219f81dd49e61 Sven Peter   2022-11-30  1214  	set32(tx_shm + LN_AUSPMA_TX_SHM_TXA_CFG_MAIN_REG1, LN_TXA_DIV2_EN_OV);
a219f81dd49e61 Sven Peter   2022-11-30  1215  	set32(tx_shm + LN_AUSPMA_TX_SHM_TXA_CFG_MAIN_REG1, LN_TXA_CLK_EN);
a219f81dd49e61 Sven Peter   2022-11-30  1216  	set32(tx_shm + LN_AUSPMA_TX_SHM_TXA_CFG_MAIN_REG1, LN_TXA_CLK_EN_OV);
a219f81dd49e61 Sven Peter   2022-11-30  1217  	clear32(tx_shm + LN_AUSPMA_TX_SHM_TXA_CFG_MAIN_REG1, LN_TXA_DIV2_RESET);
a219f81dd49e61 Sven Peter   2022-11-30  1218  	set32(tx_shm + LN_AUSPMA_TX_SHM_TXA_CFG_MAIN_REG1,
a219f81dd49e61 Sven Peter   2022-11-30  1219  	      LN_TXA_DIV2_RESET_OV);
a219f81dd49e61 Sven Peter   2022-11-30  1220  
a219f81dd49e61 Sven Peter   2022-11-30  1221  	mask32(tx_shm + LN_AUSPMA_TX_SHM_TXA_IMP_REG0, LN_TXA_CAL_CTRL_BASE,
a219f81dd49e61 Sven Peter   2022-11-30  1222  	       FIELD_PREP(LN_TXA_CAL_CTRL_BASE, 0xf));
a219f81dd49e61 Sven Peter   2022-11-30  1223  	set32(tx_shm + LN_AUSPMA_TX_SHM_TXA_IMP_REG0, LN_TXA_CAL_CTRL_BASE_OV);
a219f81dd49e61 Sven Peter   2022-11-30  1224  	mask32(tx_shm + LN_AUSPMA_TX_SHM_TXA_IMP_REG0, LN_TXA_CAL_CTRL,
a219f81dd49e61 Sven Peter   2022-11-30  1225  	       FIELD_PREP(LN_TXA_CAL_CTRL, 0x3f)); // TODO: 3f?
a219f81dd49e61 Sven Peter   2022-11-30  1226  	set32(tx_shm + LN_AUSPMA_TX_SHM_TXA_IMP_REG0, LN_TXA_CAL_CTRL_OV);
a219f81dd49e61 Sven Peter   2022-11-30  1227  
a219f81dd49e61 Sven Peter   2022-11-30  1228  	clear32(tx_shm + LN_AUSPMA_TX_SHM_TXA_IMP_REG2, LN_TXA_MARGIN);
a219f81dd49e61 Sven Peter   2022-11-30  1229  	set32(tx_shm + LN_AUSPMA_TX_SHM_TXA_IMP_REG2, LN_TXA_MARGIN_OV);
a219f81dd49e61 Sven Peter   2022-11-30  1230  	clear32(tx_shm + LN_AUSPMA_TX_SHM_TXA_IMP_REG2, LN_TXA_MARGIN_2R);
a219f81dd49e61 Sven Peter   2022-11-30  1231  	set32(tx_shm + LN_AUSPMA_TX_SHM_TXA_IMP_REG2, LN_TXA_MARGIN_2R_OV);
a219f81dd49e61 Sven Peter   2022-11-30  1232  
a219f81dd49e61 Sven Peter   2022-11-30  1233  	clear32(tx_shm + LN_AUSPMA_TX_SHM_TXA_IMP_REG3, LN_TXA_MARGIN_POST);
a219f81dd49e61 Sven Peter   2022-11-30  1234  	set32(tx_shm + LN_AUSPMA_TX_SHM_TXA_IMP_REG3, LN_TXA_MARGIN_POST_OV);
a219f81dd49e61 Sven Peter   2022-11-30  1235  	clear32(tx_shm + LN_AUSPMA_TX_SHM_TXA_IMP_REG3, LN_TXA_MARGIN_POST_2R);
a219f81dd49e61 Sven Peter   2022-11-30  1236  	set32(tx_shm + LN_AUSPMA_TX_SHM_TXA_IMP_REG3, LN_TXA_MARGIN_POST_2R_OV);
a219f81dd49e61 Sven Peter   2022-11-30  1237  	clear32(tx_shm + LN_AUSPMA_TX_SHM_TXA_IMP_REG3, LN_TXA_MARGIN_POST_4R);
a219f81dd49e61 Sven Peter   2022-11-30  1238  	set32(tx_shm + LN_AUSPMA_TX_SHM_TXA_IMP_REG3, LN_TXA_MARGIN_POST_4R_OV);
a219f81dd49e61 Sven Peter   2022-11-30  1239  	clear32(tx_shm + LN_AUSPMA_TX_SHM_TXA_IMP_REG3, LN_TXA_MARGIN_PRE);
a219f81dd49e61 Sven Peter   2022-11-30  1240  	set32(tx_shm + LN_AUSPMA_TX_SHM_TXA_IMP_REG3, LN_TXA_MARGIN_PRE_OV);
a219f81dd49e61 Sven Peter   2022-11-30  1241  	clear32(tx_shm + LN_AUSPMA_TX_SHM_TXA_IMP_REG3, LN_TXA_MARGIN_PRE_2R);
a219f81dd49e61 Sven Peter   2022-11-30  1242  	set32(tx_shm + LN_AUSPMA_TX_SHM_TXA_IMP_REG3, LN_TXA_MARGIN_PRE_2R_OV);
a219f81dd49e61 Sven Peter   2022-11-30  1243  	clear32(tx_shm + LN_AUSPMA_TX_SHM_TXA_IMP_REG3, LN_TXA_MARGIN_PRE_4R);
a219f81dd49e61 Sven Peter   2022-11-30  1244  	set32(tx_shm + LN_AUSPMA_TX_SHM_TXA_IMP_REG3, LN_TXA_MARGIN_PRE_4R_OV);
a219f81dd49e61 Sven Peter   2022-11-30  1245  
a219f81dd49e61 Sven Peter   2022-11-30  1246  	clear32(tx_shm + LN_AUSPMA_TX_SHM_TXA_IMP_REG0, LN_TXA_HIZ);
a219f81dd49e61 Sven Peter   2022-11-30  1247  	set32(tx_shm + LN_AUSPMA_TX_SHM_TXA_IMP_REG0, LN_TXA_HIZ_OV);
a219f81dd49e61 Sven Peter   2022-11-30  1248  
c68fe6bed5ec01 Janne Grunau 2023-11-06  1249  	return 0;
c68fe6bed5ec01 Janne Grunau 2023-11-06  1250  }
c68fe6bed5ec01 Janne Grunau 2023-11-06  1251  
c68fe6bed5ec01 Janne Grunau 2023-11-06  1252  static int
c68fe6bed5ec01 Janne Grunau 2023-11-06  1253  atcphy_dp_configure_lane2(struct apple_atcphy *atcphy, unsigned int lane,
c68fe6bed5ec01 Janne Grunau 2023-11-06  1254  			 const struct atcphy_dp_link_rate_configuration *cfg)
c68fe6bed5ec01 Janne Grunau 2023-11-06  1255  {
c68fe6bed5ec01 Janne Grunau 2023-11-06 @1256  	void __iomem *tx_shm, *rx_shm, *rx_top;
c68fe6bed5ec01 Janne Grunau 2023-11-06  1257  
c68fe6bed5ec01 Janne Grunau 2023-11-06  1258  	switch (lane) {
c68fe6bed5ec01 Janne Grunau 2023-11-06  1259  	case 0:
c68fe6bed5ec01 Janne Grunau 2023-11-06  1260  		tx_shm = atcphy->regs.core + LN0_AUSPMA_TX_SHM;
c68fe6bed5ec01 Janne Grunau 2023-11-06  1261  		rx_shm = atcphy->regs.core + LN0_AUSPMA_RX_SHM;
c68fe6bed5ec01 Janne Grunau 2023-11-06  1262  		rx_top = atcphy->regs.core + LN0_AUSPMA_RX_TOP;
c68fe6bed5ec01 Janne Grunau 2023-11-06  1263  		break;
c68fe6bed5ec01 Janne Grunau 2023-11-06  1264  	case 1:
c68fe6bed5ec01 Janne Grunau 2023-11-06  1265  		tx_shm = atcphy->regs.core + LN1_AUSPMA_TX_SHM;
c68fe6bed5ec01 Janne Grunau 2023-11-06  1266  		rx_shm = atcphy->regs.core + LN1_AUSPMA_RX_SHM;
c68fe6bed5ec01 Janne Grunau 2023-11-06  1267  		rx_top = atcphy->regs.core + LN1_AUSPMA_RX_TOP;
c68fe6bed5ec01 Janne Grunau 2023-11-06  1268  		break;
c68fe6bed5ec01 Janne Grunau 2023-11-06  1269  	default:
c68fe6bed5ec01 Janne Grunau 2023-11-06  1270  		return -EINVAL;
c68fe6bed5ec01 Janne Grunau 2023-11-06  1271  	}
c68fe6bed5ec01 Janne Grunau 2023-11-06  1272  
a219f81dd49e61 Sven Peter   2022-11-30  1273  	clear32(rx_shm + LN_AUSPMA_RX_SHM_TJ_RXA_AFE_CTRL1,
a219f81dd49e61 Sven Peter   2022-11-30  1274  		LN_RX_DIV20_RESET_N);
a219f81dd49e61 Sven Peter   2022-11-30  1275  	set32(rx_shm + LN_AUSPMA_RX_SHM_TJ_RXA_AFE_CTRL1,
a219f81dd49e61 Sven Peter   2022-11-30  1276  	      LN_RX_DIV20_RESET_N_OV);
a219f81dd49e61 Sven Peter   2022-11-30  1277  	udelay(2);
a219f81dd49e61 Sven Peter   2022-11-30  1278  
a219f81dd49e61 Sven Peter   2022-11-30  1279  	set32(rx_shm + LN_AUSPMA_RX_SHM_TJ_RXA_AFE_CTRL1, LN_RX_DIV20_RESET_N);
a219f81dd49e61 Sven Peter   2022-11-30  1280  
a219f81dd49e61 Sven Peter   2022-11-30  1281  	set32(rx_shm + LN_AUSPMA_RX_SHM_TJ_RXA_DFE_CTRL12,
a219f81dd49e61 Sven Peter   2022-11-30  1282  	      LN_TX_BYTECLK_RESET_SYNC_EN);
a219f81dd49e61 Sven Peter   2022-11-30  1283  	set32(rx_shm + LN_AUSPMA_RX_SHM_TJ_RXA_DFE_CTRL12,
a219f81dd49e61 Sven Peter   2022-11-30  1284  	      LN_TX_BYTECLK_RESET_SYNC_EN_OV);
a219f81dd49e61 Sven Peter   2022-11-30  1285  
a219f81dd49e61 Sven Peter   2022-11-30  1286  	mask32(rx_shm + LN_AUSPMA_RX_SHM_TJ_RXA_SAVOS_CTRL16, LN_TX_CAL_CODE,
a219f81dd49e61 Sven Peter   2022-11-30  1287  	       FIELD_PREP(LN_TX_CAL_CODE, 6)); // TODO 6?
a219f81dd49e61 Sven Peter   2022-11-30  1288  	set32(rx_shm + LN_AUSPMA_RX_SHM_TJ_RXA_SAVOS_CTRL16, LN_TX_CAL_CODE_OV);
a219f81dd49e61 Sven Peter   2022-11-30  1289  
a219f81dd49e61 Sven Peter   2022-11-30  1290  	mask32(rx_shm + LN_AUSPMA_RX_SHM_TJ_RXA_TERM_CTRL19,
a219f81dd49e61 Sven Peter   2022-11-30  1291  	       LN_TX_CLK_DLY_CTRL_TAPGEN,
a219f81dd49e61 Sven Peter   2022-11-30  1292  	       FIELD_PREP(LN_TX_CLK_DLY_CTRL_TAPGEN, 3));
a219f81dd49e61 Sven Peter   2022-11-30  1293  
a219f81dd49e61 Sven Peter   2022-11-30  1294  	clear32(rx_shm + LN_AUSPMA_RX_SHM_TJ_RXA_DFE_CTRL10, LN_DTVREG_ADJUST);
a219f81dd49e61 Sven Peter   2022-11-30  1295  	set32(rx_shm + LN_AUSPMA_RX_SHM_TJ_RXA_DFE_CTRL13, LN_DTVREG_ADJUST_OV);
a219f81dd49e61 Sven Peter   2022-11-30  1296  
a219f81dd49e61 Sven Peter   2022-11-30  1297  	clear32(rx_shm + LN_AUSPMA_RX_SHM_TJ_RXA_SAVOS_CTRL16, LN_RXTERM_EN);
a219f81dd49e61 Sven Peter   2022-11-30  1298  	set32(rx_shm + LN_AUSPMA_RX_SHM_TJ_RXA_SAVOS_CTRL16, LN_RXTERM_EN_OV);
a219f81dd49e61 Sven Peter   2022-11-30  1299  
a219f81dd49e61 Sven Peter   2022-11-30  1300  	clear32(rx_shm + LN_AUSPMA_RX_SHM_TJ_RXA_TERM_CTRL19, LN_TX_TEST_EN);
a219f81dd49e61 Sven Peter   2022-11-30  1301  	set32(rx_shm + LN_AUSPMA_RX_SHM_TJ_RXA_TERM_CTRL19, LN_TX_TEST_EN_OV);
a219f81dd49e61 Sven Peter   2022-11-30  1302  
a219f81dd49e61 Sven Peter   2022-11-30  1303  	set32(rx_shm + LN_AUSPMA_RX_SHM_TJ_RXA_VREF_CTRL22,
a219f81dd49e61 Sven Peter   2022-11-30  1304  	      LN_VREF_TEST_RXLPBKDT_EN);
a219f81dd49e61 Sven Peter   2022-11-30  1305  	set32(rx_shm + LN_AUSPMA_RX_SHM_TJ_RXA_VREF_CTRL22,
a219f81dd49e61 Sven Peter   2022-11-30  1306  	      LN_VREF_TEST_RXLPBKDT_EN_OV);
a219f81dd49e61 Sven Peter   2022-11-30  1307  	mask32(rx_shm + LN_AUSPMA_RX_SHM_TJ_RXA_VREF_CTRL22,
a219f81dd49e61 Sven Peter   2022-11-30  1308  	       LN_VREF_LPBKIN_DATA, FIELD_PREP(LN_VREF_LPBKIN_DATA, 3));
a219f81dd49e61 Sven Peter   2022-11-30  1309  	mask32(rx_shm + LN_AUSPMA_RX_SHM_TJ_RXA_VREF_CTRL22, LN_VREF_BIAS_SEL,
a219f81dd49e61 Sven Peter   2022-11-30  1310  	       FIELD_PREP(LN_VREF_BIAS_SEL, 2));
a219f81dd49e61 Sven Peter   2022-11-30  1311  	set32(rx_shm + LN_AUSPMA_RX_SHM_TJ_RXA_VREF_CTRL22,
a219f81dd49e61 Sven Peter   2022-11-30  1312  	      LN_VREF_BIAS_SEL_OV);
a219f81dd49e61 Sven Peter   2022-11-30  1313  	mask32(rx_shm + LN_AUSPMA_RX_SHM_TJ_RXA_VREF_CTRL22,
a219f81dd49e61 Sven Peter   2022-11-30  1314  	       LN_VREF_ADJUST_GRAY, FIELD_PREP(LN_VREF_ADJUST_GRAY, 0x18));
a219f81dd49e61 Sven Peter   2022-11-30  1315  	set32(rx_shm + LN_AUSPMA_RX_SHM_TJ_RXA_VREF_CTRL22,
a219f81dd49e61 Sven Peter   2022-11-30  1316  	      LN_VREF_ADJUST_GRAY_OV);
a219f81dd49e61 Sven Peter   2022-11-30  1317  	set32(rx_shm + LN_AUSPMA_RX_SHM_TJ_RXA_VREF_CTRL22, LN_VREF_EN);
a219f81dd49e61 Sven Peter   2022-11-30  1318  	set32(rx_shm + LN_AUSPMA_RX_SHM_TJ_RXA_VREF_CTRL22, LN_VREF_EN_OV);
a219f81dd49e61 Sven Peter   2022-11-30  1319  	set32(rx_shm + LN_AUSPMA_RX_SHM_TJ_RXA_VREF_CTRL22, LN_VREF_BOOST_EN);
a219f81dd49e61 Sven Peter   2022-11-30  1320  	set32(rx_shm + LN_AUSPMA_RX_SHM_TJ_RXA_VREF_CTRL22,
a219f81dd49e61 Sven Peter   2022-11-30  1321  	      LN_VREF_BOOST_EN_OV);
a219f81dd49e61 Sven Peter   2022-11-30  1322  	udelay(2);
a219f81dd49e61 Sven Peter   2022-11-30  1323  
a219f81dd49e61 Sven Peter   2022-11-30  1324  	clear32(rx_shm + LN_AUSPMA_RX_SHM_TJ_RXA_VREF_CTRL22, LN_VREF_BOOST_EN);
a219f81dd49e61 Sven Peter   2022-11-30  1325  	set32(rx_shm + LN_AUSPMA_RX_SHM_TJ_RXA_VREF_CTRL22,
a219f81dd49e61 Sven Peter   2022-11-30  1326  	      LN_VREF_BOOST_EN_OV);
a219f81dd49e61 Sven Peter   2022-11-30  1327  	udelay(2);
a219f81dd49e61 Sven Peter   2022-11-30  1328  
a219f81dd49e61 Sven Peter   2022-11-30  1329  	clear32(rx_shm + LN_AUSPMA_RX_SHM_TJ_RXA_DFE_CTRL13, LN_TX_PRE_EN);
a219f81dd49e61 Sven Peter   2022-11-30  1330  	set32(rx_shm + LN_AUSPMA_RX_SHM_TJ_RXA_DFE_CTRL13, LN_TX_PRE_EN_OV);
a219f81dd49e61 Sven Peter   2022-11-30  1331  	clear32(rx_shm + LN_AUSPMA_RX_SHM_TJ_RXA_DFE_CTRL13, LN_TX_PST1_EN);
a219f81dd49e61 Sven Peter   2022-11-30  1332  	set32(rx_shm + LN_AUSPMA_RX_SHM_TJ_RXA_DFE_CTRL13, LN_TX_PST1_EN_OV);
a219f81dd49e61 Sven Peter   2022-11-30  1333  
a219f81dd49e61 Sven Peter   2022-11-30  1334  	clear32(rx_shm + LN_AUSPMA_RX_SHM_TJ_RXA_DFE_CTRL12, LN_TX_PBIAS_EN);
a219f81dd49e61 Sven Peter   2022-11-30  1335  	set32(rx_shm + LN_AUSPMA_RX_SHM_TJ_RXA_DFE_CTRL12, LN_TX_PBIAS_EN_OV);
a219f81dd49e61 Sven Peter   2022-11-30  1336  
a219f81dd49e61 Sven Peter   2022-11-30  1337  	clear32(rx_shm + LN_AUSPMA_RX_SHM_TJ_RXA_SAVOS_CTRL16,
a219f81dd49e61 Sven Peter   2022-11-30  1338  		LN_RXTERM_PULLUP_LEAK_EN);
a219f81dd49e61 Sven Peter   2022-11-30  1339  	set32(rx_shm + LN_AUSPMA_RX_SHM_TJ_RXA_SAVOS_CTRL16,
a219f81dd49e61 Sven Peter   2022-11-30  1340  	      LN_RXTERM_PULLUP_LEAK_EN_OV);
a219f81dd49e61 Sven Peter   2022-11-30  1341  
a219f81dd49e61 Sven Peter   2022-11-30  1342  	set32(rx_top + LN_AUSPMA_RX_TOP_TJ_CFG_RX_TXMODE, LN_RX_TXMODE);
a219f81dd49e61 Sven Peter   2022-11-30  1343  
a219f81dd49e61 Sven Peter   2022-11-30  1344  	if (cfg->txa_div2_en)
a219f81dd49e61 Sven Peter   2022-11-30  1345  		set32(rx_shm + LN_AUSPMA_RX_SHM_TJ_RXA_TERM_CTRL19,
a219f81dd49e61 Sven Peter   2022-11-30  1346  		      LN_TX_CLK_DIV2_EN);
a219f81dd49e61 Sven Peter   2022-11-30  1347  	else
a219f81dd49e61 Sven Peter   2022-11-30  1348  		clear32(rx_shm + LN_AUSPMA_RX_SHM_TJ_RXA_TERM_CTRL19,
a219f81dd49e61 Sven Peter   2022-11-30  1349  			LN_TX_CLK_DIV2_EN);
a219f81dd49e61 Sven Peter   2022-11-30  1350  	set32(rx_shm + LN_AUSPMA_RX_SHM_TJ_RXA_TERM_CTRL19,
a219f81dd49e61 Sven Peter   2022-11-30  1351  	      LN_TX_CLK_DIV2_EN_OV);
a219f81dd49e61 Sven Peter   2022-11-30  1352  
a219f81dd49e61 Sven Peter   2022-11-30  1353  	clear32(rx_shm + LN_AUSPMA_RX_SHM_TJ_RXA_TERM_CTRL19,
a219f81dd49e61 Sven Peter   2022-11-30  1354  		LN_TX_CLK_DIV2_RST);
a219f81dd49e61 Sven Peter   2022-11-30  1355  	set32(rx_shm + LN_AUSPMA_RX_SHM_TJ_RXA_TERM_CTRL19,
a219f81dd49e61 Sven Peter   2022-11-30  1356  	      LN_TX_CLK_DIV2_RST_OV);
a219f81dd49e61 Sven Peter   2022-11-30  1357  
a219f81dd49e61 Sven Peter   2022-11-30  1358  	clear32(rx_shm + LN_AUSPMA_RX_SHM_TJ_RXA_DFE_CTRL12, LN_TX_HRCLK_SEL);
a219f81dd49e61 Sven Peter   2022-11-30  1359  	set32(rx_shm + LN_AUSPMA_RX_SHM_TJ_RXA_DFE_CTRL12, LN_TX_HRCLK_SEL_OV);
a219f81dd49e61 Sven Peter   2022-11-30  1360  
a219f81dd49e61 Sven Peter   2022-11-30  1361  	clear32(rx_shm + LN_AUSPMA_RX_SHM_TJ_RXA_TX_CTRL17, LN_TX_MARGIN);
a219f81dd49e61 Sven Peter   2022-11-30  1362  	set32(rx_shm + LN_AUSPMA_RX_SHM_TJ_RXA_TX_CTRL17, LN_TX_MARGIN_OV);
a219f81dd49e61 Sven Peter   2022-11-30  1363  	clear32(rx_shm + LN_AUSPMA_RX_SHM_TJ_RXA_TX_CTRL17, LN_TX_MARGIN_LSB);
a219f81dd49e61 Sven Peter   2022-11-30  1364  	set32(rx_shm + LN_AUSPMA_RX_SHM_TJ_RXA_TX_CTRL17, LN_TX_MARGIN_LSB_OV);
a219f81dd49e61 Sven Peter   2022-11-30  1365  	clear32(rx_shm + LN_AUSPMA_RX_SHM_TJ_RXA_TX_CTRL17, LN_TX_MARGIN_P1);
a219f81dd49e61 Sven Peter   2022-11-30  1366  	set32(rx_shm + LN_AUSPMA_RX_SHM_TJ_RXA_TX_CTRL17, LN_TX_MARGIN_P1_OV);
a219f81dd49e61 Sven Peter   2022-11-30  1367  	clear32(rx_shm + LN_AUSPMA_RX_SHM_TJ_RXA_TX_CTRL17,
a219f81dd49e61 Sven Peter   2022-11-30  1368  		LN_TX_MARGIN_P1_LSB);
a219f81dd49e61 Sven Peter   2022-11-30  1369  	set32(rx_shm + LN_AUSPMA_RX_SHM_TJ_RXA_TX_CTRL17,
a219f81dd49e61 Sven Peter   2022-11-30  1370  	      LN_TX_MARGIN_P1_LSB_OV);
a219f81dd49e61 Sven Peter   2022-11-30  1371  
a219f81dd49e61 Sven Peter   2022-11-30  1372  	clear32(rx_shm + LN_AUSPMA_RX_SHM_TJ_RXA_TX_CTRL18, LN_TX_P1_CODE);
a219f81dd49e61 Sven Peter   2022-11-30  1373  	set32(rx_shm + LN_AUSPMA_RX_SHM_TJ_RXA_TX_CTRL18, LN_TX_P1_CODE_OV);
a219f81dd49e61 Sven Peter   2022-11-30  1374  	clear32(rx_shm + LN_AUSPMA_RX_SHM_TJ_RXA_TX_CTRL18, LN_TX_P1_LSB_CODE);
a219f81dd49e61 Sven Peter   2022-11-30  1375  	set32(rx_shm + LN_AUSPMA_RX_SHM_TJ_RXA_TX_CTRL18, LN_TX_P1_LSB_CODE_OV);
a219f81dd49e61 Sven Peter   2022-11-30  1376  	clear32(rx_shm + LN_AUSPMA_RX_SHM_TJ_RXA_TX_CTRL18, LN_TX_MARGIN_PRE);
a219f81dd49e61 Sven Peter   2022-11-30  1377  	set32(rx_shm + LN_AUSPMA_RX_SHM_TJ_RXA_TX_CTRL18, LN_TX_MARGIN_PRE_OV);
a219f81dd49e61 Sven Peter   2022-11-30  1378  	clear32(rx_shm + LN_AUSPMA_RX_SHM_TJ_RXA_TX_CTRL18,
a219f81dd49e61 Sven Peter   2022-11-30  1379  		LN_TX_MARGIN_PRE_LSB);
a219f81dd49e61 Sven Peter   2022-11-30  1380  	set32(rx_shm + LN_AUSPMA_RX_SHM_TJ_RXA_TX_CTRL18,
a219f81dd49e61 Sven Peter   2022-11-30  1381  	      LN_TX_MARGIN_PRE_LSB_OV);
a219f81dd49e61 Sven Peter   2022-11-30  1382  	clear32(rx_shm + LN_AUSPMA_RX_SHM_TJ_RXA_TX_CTRL18, LN_TX_PRE_LSB_CODE);
a219f81dd49e61 Sven Peter   2022-11-30  1383  	set32(rx_shm + LN_AUSPMA_RX_SHM_TJ_RXA_TX_CTRL18,
a219f81dd49e61 Sven Peter   2022-11-30  1384  	      LN_TX_PRE_LSB_CODE_OV);
a219f81dd49e61 Sven Peter   2022-11-30  1385  	clear32(rx_shm + LN_AUSPMA_RX_SHM_TJ_RXA_TX_CTRL18, LN_TX_PRE_CODE);
a219f81dd49e61 Sven Peter   2022-11-30  1386  	set32(rx_shm + LN_AUSPMA_RX_SHM_TJ_RXA_TX_CTRL18, LN_TX_PRE_CODE_OV);
a219f81dd49e61 Sven Peter   2022-11-30  1387  
a219f81dd49e61 Sven Peter   2022-11-30  1388  	set32(rx_shm + LN_AUSPMA_RX_SHM_TJ_RXA_DFE_CTRL11, LN_DTVREG_SML_EN);
a219f81dd49e61 Sven Peter   2022-11-30  1389  	set32(rx_shm + LN_AUSPMA_RX_SHM_TJ_RXA_DFE_CTRL11, LN_DTVREG_SML_EN_OV);
a219f81dd49e61 Sven Peter   2022-11-30  1390  	udelay(2);
a219f81dd49e61 Sven Peter   2022-11-30  1391  
a219f81dd49e61 Sven Peter   2022-11-30  1392  	set32(rx_shm + LN_AUSPMA_RX_SHM_TJ_RXA_DFE_CTRL11, LN_DTVREG_BIG_EN);
a219f81dd49e61 Sven Peter   2022-11-30  1393  	set32(rx_shm + LN_AUSPMA_RX_SHM_TJ_RXA_DFE_CTRL11, LN_DTVREG_BIG_EN_OV);
a219f81dd49e61 Sven Peter   2022-11-30  1394  	udelay(2);
a219f81dd49e61 Sven Peter   2022-11-30  1395  
a219f81dd49e61 Sven Peter   2022-11-30  1396  	mask32(rx_shm + LN_AUSPMA_RX_SHM_TJ_RXA_DFE_CTRL10, LN_DTVREG_ADJUST,
a219f81dd49e61 Sven Peter   2022-11-30  1397  	       FIELD_PREP(LN_DTVREG_ADJUST, 0xa));
a219f81dd49e61 Sven Peter   2022-11-30  1398  	set32(rx_shm + LN_AUSPMA_RX_SHM_TJ_RXA_DFE_CTRL13, LN_DTVREG_ADJUST_OV);
a219f81dd49e61 Sven Peter   2022-11-30  1399  	udelay(2);
a219f81dd49e61 Sven Peter   2022-11-30  1400  
a219f81dd49e61 Sven Peter   2022-11-30  1401  	set32(rx_shm + LN_AUSPMA_RX_SHM_TJ_RXA_TERM_CTRL19, LN_TX_EN);
a219f81dd49e61 Sven Peter   2022-11-30  1402  	set32(rx_shm + LN_AUSPMA_RX_SHM_TJ_RXA_TERM_CTRL19, LN_TX_EN_OV);
a219f81dd49e61 Sven Peter   2022-11-30  1403  	udelay(2);
a219f81dd49e61 Sven Peter   2022-11-30  1404  
a219f81dd49e61 Sven Peter   2022-11-30  1405  	set32(rx_shm + LN_AUSPMA_RX_SHM_TJ_RXA_CTLE_CTRL0, LN_TX_CLK_EN);
a219f81dd49e61 Sven Peter   2022-11-30  1406  	set32(rx_shm + LN_AUSPMA_RX_SHM_TJ_RXA_CTLE_CTRL0, LN_TX_CLK_EN_OV);
a219f81dd49e61 Sven Peter   2022-11-30  1407  
a219f81dd49e61 Sven Peter   2022-11-30  1408  	clear32(rx_shm + LN_AUSPMA_RX_SHM_TJ_RXA_DFE_CTRL12,
a219f81dd49e61 Sven Peter   2022-11-30  1409  		LN_TX_BYTECLK_RESET_SYNC_CLR);
a219f81dd49e61 Sven Peter   2022-11-30  1410  	set32(rx_shm + LN_AUSPMA_RX_SHM_TJ_RXA_DFE_CTRL12,
a219f81dd49e61 Sven Peter   2022-11-30  1411  	      LN_TX_BYTECLK_RESET_SYNC_CLR_OV);
a219f81dd49e61 Sven Peter   2022-11-30  1412  
a219f81dd49e61 Sven Peter   2022-11-30  1413  	return 0;
a219f81dd49e61 Sven Peter   2022-11-30  1414  }
a219f81dd49e61 Sven Peter   2022-11-30  1415  

:::::: The code at line 1146 was first introduced by commit
:::::: a219f81dd49e61ecdcc057dd6f2ced14baff44ac WIP: phy: apple: Add Apple Type-C PHY

:::::: TO: Sven Peter <sven@svenpeter.dev>
:::::: CC: Hector Martin <marcan@marcan.st>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
