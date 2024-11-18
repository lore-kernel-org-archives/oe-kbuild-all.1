Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D18E3198842
	for <oe-kbuild-all@lists.linux.dev>; Mon, 18 Nov 2024 12:44:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731933874; cv=none; b=k/vxkihrixz0lmHB5v9+8VRuLQAoUL2mu+SRYxItS1b8Yocj0JDa4Gv3JvSjEnd0FbUivd2U4nPpkbz7FAPWBIT1CKBZZC5IO6wevg+FDrN0VXuo4pORjmCTVmyudHM4W8h0elEt6jTB8eVdehGXi9eWNqOhh4KNq6c6dyOyAkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731933874; c=relaxed/simple;
	bh=WfGfLas8Jrn0Ssm2zj3Nscm75id2VCe2+pFMUfqA1XA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CfnOY1tPDww4dGhquePzfHfhVokXmMo3ITbStD8B9Rr2RZcgtYn9yM6H8CIaNqNOr3DpuTCTkLwuG9lpoyfnnxm7eLoMHem1vtL1x8auzc1hWJhjQ+yistsYcI5QFoP7I1aSLv62yZKD5Jcf4NgWstSbQC5o0gST1N2+7d4i1mw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QUn/muyp; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QUn/muyp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731933872; x=1763469872;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WfGfLas8Jrn0Ssm2zj3Nscm75id2VCe2+pFMUfqA1XA=;
  b=QUn/muypve/FX3amIHzXfcp2PwMiFxXcGFP9MAWlMzhUGptAxAjygPj0
   vOikSRoObzmQYaD3DwFmZZPVexhsGpvKWFcjKXBdKl/CSx0P+0zpMW4Ha
   Gem46NdVpinAO/lXJWcGejcbL+T+duhGBVce2q0M5TmZyPODNUc6IAec6
   e7pWhmjZyiCcRHIpJo3LJnaZ0jLWvEsgCIbyewzZnehE8RDOmEyXL8Sr4
   4XU0tfqbhQdZz1rpEm93m0RXbbwkEzGcGwNU6cTftXEasnTZMROl1CRs/
   cv1MDogT29KY7InLw2k0IXPn4dIeo0dqc3BKNQ82OdDDF7tdB+TjbK6Tk
   g==;
X-CSE-ConnectionGUID: lgIHye2VSRqjSzbBRMIcFg==
X-CSE-MsgGUID: y7IZcFGkQ12JQjo5ycnMhg==
X-IronPort-AV: E=McAfee;i="6700,10204,11259"; a="42522668"
X-IronPort-AV: E=Sophos;i="6.12,164,1728975600"; 
   d="scan'208";a="42522668"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2024 04:44:31 -0800
X-CSE-ConnectionGUID: rJAXrvBfQGCbBW6xUQBEgQ==
X-CSE-MsgGUID: qmSykMX2QAmx2UkNmysdVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,164,1728975600"; 
   d="scan'208";a="120062507"
Received: from lkp-server01.sh.intel.com (HELO 1e3cc1889ffb) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 18 Nov 2024 04:44:29 -0800
Received: from kbuild by 1e3cc1889ffb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tD17C-0002Qd-2e;
	Mon, 18 Nov 2024 12:44:26 +0000
Date: Mon, 18 Nov 2024 20:44:17 +0800
From: kernel test robot <lkp@intel.com>
To: Janne Grunau <j@jannau.net>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [asahilinux:bits/170-atcphy 7/17] drivers/phy/apple/atc.c:1146:41:
 warning: variable 'rx_top' set but not used
Message-ID: <202411182038.dKBcvdBK-lkp@intel.com>
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
head:   58c27a2b420c2f6e49fdef1ce8b065e01a10f00c
commit: 11891a78316192e51d64e9148222ff54a1d939b3 [7/17] phy: apple: atc: Split atcphy_dp_configure_lane()
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20241118/202411182038.dKBcvdBK-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241118/202411182038.dKBcvdBK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411182038.dKBcvdBK-lkp@intel.com/

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

44d2e75b8057a2 Sven Peter   2022-11-30  1141  
44d2e75b8057a2 Sven Peter   2022-11-30  1142  static int
44d2e75b8057a2 Sven Peter   2022-11-30  1143  atcphy_dp_configure_lane(struct apple_atcphy *atcphy, unsigned int lane,
44d2e75b8057a2 Sven Peter   2022-11-30  1144  			 const struct atcphy_dp_link_rate_configuration *cfg)
44d2e75b8057a2 Sven Peter   2022-11-30  1145  {
44d2e75b8057a2 Sven Peter   2022-11-30 @1146  	void __iomem *tx_shm, *rx_shm, *rx_top;
44d2e75b8057a2 Sven Peter   2022-11-30  1147  
44d2e75b8057a2 Sven Peter   2022-11-30  1148  	switch (lane) {
44d2e75b8057a2 Sven Peter   2022-11-30  1149  	case 0:
44d2e75b8057a2 Sven Peter   2022-11-30  1150  		tx_shm = atcphy->regs.core + LN0_AUSPMA_TX_SHM;
44d2e75b8057a2 Sven Peter   2022-11-30  1151  		rx_shm = atcphy->regs.core + LN0_AUSPMA_RX_SHM;
44d2e75b8057a2 Sven Peter   2022-11-30  1152  		rx_top = atcphy->regs.core + LN0_AUSPMA_RX_TOP;
44d2e75b8057a2 Sven Peter   2022-11-30  1153  		break;
44d2e75b8057a2 Sven Peter   2022-11-30  1154  	case 1:
44d2e75b8057a2 Sven Peter   2022-11-30  1155  		tx_shm = atcphy->regs.core + LN1_AUSPMA_TX_SHM;
44d2e75b8057a2 Sven Peter   2022-11-30  1156  		rx_shm = atcphy->regs.core + LN1_AUSPMA_RX_SHM;
44d2e75b8057a2 Sven Peter   2022-11-30  1157  		rx_top = atcphy->regs.core + LN1_AUSPMA_RX_TOP;
44d2e75b8057a2 Sven Peter   2022-11-30  1158  		break;
44d2e75b8057a2 Sven Peter   2022-11-30  1159  	default:
44d2e75b8057a2 Sven Peter   2022-11-30  1160  		return -EINVAL;
44d2e75b8057a2 Sven Peter   2022-11-30  1161  	}
44d2e75b8057a2 Sven Peter   2022-11-30  1162  
44d2e75b8057a2 Sven Peter   2022-11-30  1163  	set32(tx_shm + LN_AUSPMA_TX_SHM_TXA_LDOCLK, LN_LDOCLK_EN_SML);
44d2e75b8057a2 Sven Peter   2022-11-30  1164  	set32(tx_shm + LN_AUSPMA_TX_SHM_TXA_LDOCLK, LN_LDOCLK_EN_SML_OV);
44d2e75b8057a2 Sven Peter   2022-11-30  1165  	udelay(2);
44d2e75b8057a2 Sven Peter   2022-11-30  1166  
44d2e75b8057a2 Sven Peter   2022-11-30  1167  	set32(tx_shm + LN_AUSPMA_TX_SHM_TXA_LDOCLK, LN_LDOCLK_EN_BIG);
44d2e75b8057a2 Sven Peter   2022-11-30  1168  	set32(tx_shm + LN_AUSPMA_TX_SHM_TXA_LDOCLK, LN_LDOCLK_EN_BIG_OV);
44d2e75b8057a2 Sven Peter   2022-11-30  1169  	udelay(2);
44d2e75b8057a2 Sven Peter   2022-11-30  1170  
44d2e75b8057a2 Sven Peter   2022-11-30  1171  	if (cfg->bypass_txa_ldoclk) {
44d2e75b8057a2 Sven Peter   2022-11-30  1172  		set32(tx_shm + LN_AUSPMA_TX_SHM_TXA_LDOCLK,
44d2e75b8057a2 Sven Peter   2022-11-30  1173  		      LN_LDOCLK_BYPASS_SML);
44d2e75b8057a2 Sven Peter   2022-11-30  1174  		set32(tx_shm + LN_AUSPMA_TX_SHM_TXA_LDOCLK,
44d2e75b8057a2 Sven Peter   2022-11-30  1175  		      LN_LDOCLK_BYPASS_SML_OV);
44d2e75b8057a2 Sven Peter   2022-11-30  1176  		udelay(2);
44d2e75b8057a2 Sven Peter   2022-11-30  1177  
44d2e75b8057a2 Sven Peter   2022-11-30  1178  		set32(tx_shm + LN_AUSPMA_TX_SHM_TXA_LDOCLK,
44d2e75b8057a2 Sven Peter   2022-11-30  1179  		      LN_LDOCLK_BYPASS_BIG);
44d2e75b8057a2 Sven Peter   2022-11-30  1180  		set32(tx_shm + LN_AUSPMA_TX_SHM_TXA_LDOCLK,
44d2e75b8057a2 Sven Peter   2022-11-30  1181  		      LN_LDOCLK_BYPASS_BIG_OV);
44d2e75b8057a2 Sven Peter   2022-11-30  1182  		udelay(2);
44d2e75b8057a2 Sven Peter   2022-11-30  1183  	} else {
44d2e75b8057a2 Sven Peter   2022-11-30  1184  		clear32(tx_shm + LN_AUSPMA_TX_SHM_TXA_LDOCLK,
44d2e75b8057a2 Sven Peter   2022-11-30  1185  			LN_LDOCLK_BYPASS_SML);
44d2e75b8057a2 Sven Peter   2022-11-30  1186  		clear32(tx_shm + LN_AUSPMA_TX_SHM_TXA_LDOCLK,
44d2e75b8057a2 Sven Peter   2022-11-30  1187  			LN_LDOCLK_BYPASS_SML_OV);
44d2e75b8057a2 Sven Peter   2022-11-30  1188  		udelay(2);
44d2e75b8057a2 Sven Peter   2022-11-30  1189  
44d2e75b8057a2 Sven Peter   2022-11-30  1190  		clear32(tx_shm + LN_AUSPMA_TX_SHM_TXA_LDOCLK,
44d2e75b8057a2 Sven Peter   2022-11-30  1191  			LN_LDOCLK_BYPASS_BIG);
44d2e75b8057a2 Sven Peter   2022-11-30  1192  		clear32(tx_shm + LN_AUSPMA_TX_SHM_TXA_LDOCLK,
44d2e75b8057a2 Sven Peter   2022-11-30  1193  			LN_LDOCLK_BYPASS_BIG_OV);
44d2e75b8057a2 Sven Peter   2022-11-30  1194  		udelay(2);
44d2e75b8057a2 Sven Peter   2022-11-30  1195  	}
44d2e75b8057a2 Sven Peter   2022-11-30  1196  
44d2e75b8057a2 Sven Peter   2022-11-30  1197  	set32(tx_shm + LN_AUSPMA_TX_SHM_TXA_CFG_MAIN_REG0,
44d2e75b8057a2 Sven Peter   2022-11-30  1198  	      LN_BYTECLK_RESET_SYNC_SEL_OV);
44d2e75b8057a2 Sven Peter   2022-11-30  1199  	set32(tx_shm + LN_AUSPMA_TX_SHM_TXA_CFG_MAIN_REG0,
44d2e75b8057a2 Sven Peter   2022-11-30  1200  	      LN_BYTECLK_RESET_SYNC_EN);
44d2e75b8057a2 Sven Peter   2022-11-30  1201  	set32(tx_shm + LN_AUSPMA_TX_SHM_TXA_CFG_MAIN_REG0,
44d2e75b8057a2 Sven Peter   2022-11-30  1202  	      LN_BYTECLK_RESET_SYNC_EN_OV);
44d2e75b8057a2 Sven Peter   2022-11-30  1203  	clear32(tx_shm + LN_AUSPMA_TX_SHM_TXA_CFG_MAIN_REG0,
44d2e75b8057a2 Sven Peter   2022-11-30  1204  		LN_BYTECLK_RESET_SYNC_CLR);
44d2e75b8057a2 Sven Peter   2022-11-30  1205  	set32(tx_shm + LN_AUSPMA_TX_SHM_TXA_CFG_MAIN_REG0,
44d2e75b8057a2 Sven Peter   2022-11-30  1206  	      LN_BYTECLK_RESET_SYNC_CLR_OV);
44d2e75b8057a2 Sven Peter   2022-11-30  1207  
44d2e75b8057a2 Sven Peter   2022-11-30  1208  	if (cfg->txa_div2_en)
44d2e75b8057a2 Sven Peter   2022-11-30  1209  		set32(tx_shm + LN_AUSPMA_TX_SHM_TXA_CFG_MAIN_REG1,
44d2e75b8057a2 Sven Peter   2022-11-30  1210  		      LN_TXA_DIV2_EN);
44d2e75b8057a2 Sven Peter   2022-11-30  1211  	else
44d2e75b8057a2 Sven Peter   2022-11-30  1212  		clear32(tx_shm + LN_AUSPMA_TX_SHM_TXA_CFG_MAIN_REG1,
44d2e75b8057a2 Sven Peter   2022-11-30  1213  			LN_TXA_DIV2_EN);
44d2e75b8057a2 Sven Peter   2022-11-30  1214  	set32(tx_shm + LN_AUSPMA_TX_SHM_TXA_CFG_MAIN_REG1, LN_TXA_DIV2_EN_OV);
44d2e75b8057a2 Sven Peter   2022-11-30  1215  	set32(tx_shm + LN_AUSPMA_TX_SHM_TXA_CFG_MAIN_REG1, LN_TXA_CLK_EN);
44d2e75b8057a2 Sven Peter   2022-11-30  1216  	set32(tx_shm + LN_AUSPMA_TX_SHM_TXA_CFG_MAIN_REG1, LN_TXA_CLK_EN_OV);
44d2e75b8057a2 Sven Peter   2022-11-30  1217  	clear32(tx_shm + LN_AUSPMA_TX_SHM_TXA_CFG_MAIN_REG1, LN_TXA_DIV2_RESET);
44d2e75b8057a2 Sven Peter   2022-11-30  1218  	set32(tx_shm + LN_AUSPMA_TX_SHM_TXA_CFG_MAIN_REG1,
44d2e75b8057a2 Sven Peter   2022-11-30  1219  	      LN_TXA_DIV2_RESET_OV);
44d2e75b8057a2 Sven Peter   2022-11-30  1220  
44d2e75b8057a2 Sven Peter   2022-11-30  1221  	mask32(tx_shm + LN_AUSPMA_TX_SHM_TXA_IMP_REG0, LN_TXA_CAL_CTRL_BASE,
44d2e75b8057a2 Sven Peter   2022-11-30  1222  	       FIELD_PREP(LN_TXA_CAL_CTRL_BASE, 0xf));
44d2e75b8057a2 Sven Peter   2022-11-30  1223  	set32(tx_shm + LN_AUSPMA_TX_SHM_TXA_IMP_REG0, LN_TXA_CAL_CTRL_BASE_OV);
44d2e75b8057a2 Sven Peter   2022-11-30  1224  	mask32(tx_shm + LN_AUSPMA_TX_SHM_TXA_IMP_REG0, LN_TXA_CAL_CTRL,
44d2e75b8057a2 Sven Peter   2022-11-30  1225  	       FIELD_PREP(LN_TXA_CAL_CTRL, 0x3f)); // TODO: 3f?
44d2e75b8057a2 Sven Peter   2022-11-30  1226  	set32(tx_shm + LN_AUSPMA_TX_SHM_TXA_IMP_REG0, LN_TXA_CAL_CTRL_OV);
44d2e75b8057a2 Sven Peter   2022-11-30  1227  
44d2e75b8057a2 Sven Peter   2022-11-30  1228  	clear32(tx_shm + LN_AUSPMA_TX_SHM_TXA_IMP_REG2, LN_TXA_MARGIN);
44d2e75b8057a2 Sven Peter   2022-11-30  1229  	set32(tx_shm + LN_AUSPMA_TX_SHM_TXA_IMP_REG2, LN_TXA_MARGIN_OV);
44d2e75b8057a2 Sven Peter   2022-11-30  1230  	clear32(tx_shm + LN_AUSPMA_TX_SHM_TXA_IMP_REG2, LN_TXA_MARGIN_2R);
44d2e75b8057a2 Sven Peter   2022-11-30  1231  	set32(tx_shm + LN_AUSPMA_TX_SHM_TXA_IMP_REG2, LN_TXA_MARGIN_2R_OV);
44d2e75b8057a2 Sven Peter   2022-11-30  1232  
44d2e75b8057a2 Sven Peter   2022-11-30  1233  	clear32(tx_shm + LN_AUSPMA_TX_SHM_TXA_IMP_REG3, LN_TXA_MARGIN_POST);
44d2e75b8057a2 Sven Peter   2022-11-30  1234  	set32(tx_shm + LN_AUSPMA_TX_SHM_TXA_IMP_REG3, LN_TXA_MARGIN_POST_OV);
44d2e75b8057a2 Sven Peter   2022-11-30  1235  	clear32(tx_shm + LN_AUSPMA_TX_SHM_TXA_IMP_REG3, LN_TXA_MARGIN_POST_2R);
44d2e75b8057a2 Sven Peter   2022-11-30  1236  	set32(tx_shm + LN_AUSPMA_TX_SHM_TXA_IMP_REG3, LN_TXA_MARGIN_POST_2R_OV);
44d2e75b8057a2 Sven Peter   2022-11-30  1237  	clear32(tx_shm + LN_AUSPMA_TX_SHM_TXA_IMP_REG3, LN_TXA_MARGIN_POST_4R);
44d2e75b8057a2 Sven Peter   2022-11-30  1238  	set32(tx_shm + LN_AUSPMA_TX_SHM_TXA_IMP_REG3, LN_TXA_MARGIN_POST_4R_OV);
44d2e75b8057a2 Sven Peter   2022-11-30  1239  	clear32(tx_shm + LN_AUSPMA_TX_SHM_TXA_IMP_REG3, LN_TXA_MARGIN_PRE);
44d2e75b8057a2 Sven Peter   2022-11-30  1240  	set32(tx_shm + LN_AUSPMA_TX_SHM_TXA_IMP_REG3, LN_TXA_MARGIN_PRE_OV);
44d2e75b8057a2 Sven Peter   2022-11-30  1241  	clear32(tx_shm + LN_AUSPMA_TX_SHM_TXA_IMP_REG3, LN_TXA_MARGIN_PRE_2R);
44d2e75b8057a2 Sven Peter   2022-11-30  1242  	set32(tx_shm + LN_AUSPMA_TX_SHM_TXA_IMP_REG3, LN_TXA_MARGIN_PRE_2R_OV);
44d2e75b8057a2 Sven Peter   2022-11-30  1243  	clear32(tx_shm + LN_AUSPMA_TX_SHM_TXA_IMP_REG3, LN_TXA_MARGIN_PRE_4R);
44d2e75b8057a2 Sven Peter   2022-11-30  1244  	set32(tx_shm + LN_AUSPMA_TX_SHM_TXA_IMP_REG3, LN_TXA_MARGIN_PRE_4R_OV);
44d2e75b8057a2 Sven Peter   2022-11-30  1245  
44d2e75b8057a2 Sven Peter   2022-11-30  1246  	clear32(tx_shm + LN_AUSPMA_TX_SHM_TXA_IMP_REG0, LN_TXA_HIZ);
44d2e75b8057a2 Sven Peter   2022-11-30  1247  	set32(tx_shm + LN_AUSPMA_TX_SHM_TXA_IMP_REG0, LN_TXA_HIZ_OV);
44d2e75b8057a2 Sven Peter   2022-11-30  1248  
11891a78316192 Janne Grunau 2023-11-06  1249  	return 0;
11891a78316192 Janne Grunau 2023-11-06  1250  }
11891a78316192 Janne Grunau 2023-11-06  1251  
11891a78316192 Janne Grunau 2023-11-06  1252  static int
11891a78316192 Janne Grunau 2023-11-06  1253  atcphy_dp_configure_lane2(struct apple_atcphy *atcphy, unsigned int lane,
11891a78316192 Janne Grunau 2023-11-06  1254  			 const struct atcphy_dp_link_rate_configuration *cfg)
11891a78316192 Janne Grunau 2023-11-06  1255  {
11891a78316192 Janne Grunau 2023-11-06 @1256  	void __iomem *tx_shm, *rx_shm, *rx_top;
11891a78316192 Janne Grunau 2023-11-06  1257  
11891a78316192 Janne Grunau 2023-11-06  1258  	switch (lane) {
11891a78316192 Janne Grunau 2023-11-06  1259  	case 0:
11891a78316192 Janne Grunau 2023-11-06  1260  		tx_shm = atcphy->regs.core + LN0_AUSPMA_TX_SHM;
11891a78316192 Janne Grunau 2023-11-06  1261  		rx_shm = atcphy->regs.core + LN0_AUSPMA_RX_SHM;
11891a78316192 Janne Grunau 2023-11-06  1262  		rx_top = atcphy->regs.core + LN0_AUSPMA_RX_TOP;
11891a78316192 Janne Grunau 2023-11-06  1263  		break;
11891a78316192 Janne Grunau 2023-11-06  1264  	case 1:
11891a78316192 Janne Grunau 2023-11-06  1265  		tx_shm = atcphy->regs.core + LN1_AUSPMA_TX_SHM;
11891a78316192 Janne Grunau 2023-11-06  1266  		rx_shm = atcphy->regs.core + LN1_AUSPMA_RX_SHM;
11891a78316192 Janne Grunau 2023-11-06  1267  		rx_top = atcphy->regs.core + LN1_AUSPMA_RX_TOP;
11891a78316192 Janne Grunau 2023-11-06  1268  		break;
11891a78316192 Janne Grunau 2023-11-06  1269  	default:
11891a78316192 Janne Grunau 2023-11-06  1270  		return -EINVAL;
11891a78316192 Janne Grunau 2023-11-06  1271  	}
11891a78316192 Janne Grunau 2023-11-06  1272  
44d2e75b8057a2 Sven Peter   2022-11-30  1273  	clear32(rx_shm + LN_AUSPMA_RX_SHM_TJ_RXA_AFE_CTRL1,
44d2e75b8057a2 Sven Peter   2022-11-30  1274  		LN_RX_DIV20_RESET_N);
44d2e75b8057a2 Sven Peter   2022-11-30  1275  	set32(rx_shm + LN_AUSPMA_RX_SHM_TJ_RXA_AFE_CTRL1,
44d2e75b8057a2 Sven Peter   2022-11-30  1276  	      LN_RX_DIV20_RESET_N_OV);
44d2e75b8057a2 Sven Peter   2022-11-30  1277  	udelay(2);
44d2e75b8057a2 Sven Peter   2022-11-30  1278  
44d2e75b8057a2 Sven Peter   2022-11-30  1279  	set32(rx_shm + LN_AUSPMA_RX_SHM_TJ_RXA_AFE_CTRL1, LN_RX_DIV20_RESET_N);
44d2e75b8057a2 Sven Peter   2022-11-30  1280  
44d2e75b8057a2 Sven Peter   2022-11-30  1281  	set32(rx_shm + LN_AUSPMA_RX_SHM_TJ_RXA_DFE_CTRL12,
44d2e75b8057a2 Sven Peter   2022-11-30  1282  	      LN_TX_BYTECLK_RESET_SYNC_EN);
44d2e75b8057a2 Sven Peter   2022-11-30  1283  	set32(rx_shm + LN_AUSPMA_RX_SHM_TJ_RXA_DFE_CTRL12,
44d2e75b8057a2 Sven Peter   2022-11-30  1284  	      LN_TX_BYTECLK_RESET_SYNC_EN_OV);
44d2e75b8057a2 Sven Peter   2022-11-30  1285  
44d2e75b8057a2 Sven Peter   2022-11-30  1286  	mask32(rx_shm + LN_AUSPMA_RX_SHM_TJ_RXA_SAVOS_CTRL16, LN_TX_CAL_CODE,
44d2e75b8057a2 Sven Peter   2022-11-30  1287  	       FIELD_PREP(LN_TX_CAL_CODE, 6)); // TODO 6?
44d2e75b8057a2 Sven Peter   2022-11-30  1288  	set32(rx_shm + LN_AUSPMA_RX_SHM_TJ_RXA_SAVOS_CTRL16, LN_TX_CAL_CODE_OV);
44d2e75b8057a2 Sven Peter   2022-11-30  1289  
44d2e75b8057a2 Sven Peter   2022-11-30  1290  	mask32(rx_shm + LN_AUSPMA_RX_SHM_TJ_RXA_TERM_CTRL19,
44d2e75b8057a2 Sven Peter   2022-11-30  1291  	       LN_TX_CLK_DLY_CTRL_TAPGEN,
44d2e75b8057a2 Sven Peter   2022-11-30  1292  	       FIELD_PREP(LN_TX_CLK_DLY_CTRL_TAPGEN, 3));
44d2e75b8057a2 Sven Peter   2022-11-30  1293  
44d2e75b8057a2 Sven Peter   2022-11-30  1294  	clear32(rx_shm + LN_AUSPMA_RX_SHM_TJ_RXA_DFE_CTRL10, LN_DTVREG_ADJUST);
44d2e75b8057a2 Sven Peter   2022-11-30  1295  	set32(rx_shm + LN_AUSPMA_RX_SHM_TJ_RXA_DFE_CTRL13, LN_DTVREG_ADJUST_OV);
44d2e75b8057a2 Sven Peter   2022-11-30  1296  
44d2e75b8057a2 Sven Peter   2022-11-30  1297  	clear32(rx_shm + LN_AUSPMA_RX_SHM_TJ_RXA_SAVOS_CTRL16, LN_RXTERM_EN);
44d2e75b8057a2 Sven Peter   2022-11-30  1298  	set32(rx_shm + LN_AUSPMA_RX_SHM_TJ_RXA_SAVOS_CTRL16, LN_RXTERM_EN_OV);
44d2e75b8057a2 Sven Peter   2022-11-30  1299  
44d2e75b8057a2 Sven Peter   2022-11-30  1300  	clear32(rx_shm + LN_AUSPMA_RX_SHM_TJ_RXA_TERM_CTRL19, LN_TX_TEST_EN);
44d2e75b8057a2 Sven Peter   2022-11-30  1301  	set32(rx_shm + LN_AUSPMA_RX_SHM_TJ_RXA_TERM_CTRL19, LN_TX_TEST_EN_OV);
44d2e75b8057a2 Sven Peter   2022-11-30  1302  
44d2e75b8057a2 Sven Peter   2022-11-30  1303  	set32(rx_shm + LN_AUSPMA_RX_SHM_TJ_RXA_VREF_CTRL22,
44d2e75b8057a2 Sven Peter   2022-11-30  1304  	      LN_VREF_TEST_RXLPBKDT_EN);
44d2e75b8057a2 Sven Peter   2022-11-30  1305  	set32(rx_shm + LN_AUSPMA_RX_SHM_TJ_RXA_VREF_CTRL22,
44d2e75b8057a2 Sven Peter   2022-11-30  1306  	      LN_VREF_TEST_RXLPBKDT_EN_OV);
44d2e75b8057a2 Sven Peter   2022-11-30  1307  	mask32(rx_shm + LN_AUSPMA_RX_SHM_TJ_RXA_VREF_CTRL22,
44d2e75b8057a2 Sven Peter   2022-11-30  1308  	       LN_VREF_LPBKIN_DATA, FIELD_PREP(LN_VREF_LPBKIN_DATA, 3));
44d2e75b8057a2 Sven Peter   2022-11-30  1309  	mask32(rx_shm + LN_AUSPMA_RX_SHM_TJ_RXA_VREF_CTRL22, LN_VREF_BIAS_SEL,
44d2e75b8057a2 Sven Peter   2022-11-30  1310  	       FIELD_PREP(LN_VREF_BIAS_SEL, 2));
44d2e75b8057a2 Sven Peter   2022-11-30  1311  	set32(rx_shm + LN_AUSPMA_RX_SHM_TJ_RXA_VREF_CTRL22,
44d2e75b8057a2 Sven Peter   2022-11-30  1312  	      LN_VREF_BIAS_SEL_OV);
44d2e75b8057a2 Sven Peter   2022-11-30  1313  	mask32(rx_shm + LN_AUSPMA_RX_SHM_TJ_RXA_VREF_CTRL22,
44d2e75b8057a2 Sven Peter   2022-11-30  1314  	       LN_VREF_ADJUST_GRAY, FIELD_PREP(LN_VREF_ADJUST_GRAY, 0x18));
44d2e75b8057a2 Sven Peter   2022-11-30  1315  	set32(rx_shm + LN_AUSPMA_RX_SHM_TJ_RXA_VREF_CTRL22,
44d2e75b8057a2 Sven Peter   2022-11-30  1316  	      LN_VREF_ADJUST_GRAY_OV);
44d2e75b8057a2 Sven Peter   2022-11-30  1317  	set32(rx_shm + LN_AUSPMA_RX_SHM_TJ_RXA_VREF_CTRL22, LN_VREF_EN);
44d2e75b8057a2 Sven Peter   2022-11-30  1318  	set32(rx_shm + LN_AUSPMA_RX_SHM_TJ_RXA_VREF_CTRL22, LN_VREF_EN_OV);
44d2e75b8057a2 Sven Peter   2022-11-30  1319  	set32(rx_shm + LN_AUSPMA_RX_SHM_TJ_RXA_VREF_CTRL22, LN_VREF_BOOST_EN);
44d2e75b8057a2 Sven Peter   2022-11-30  1320  	set32(rx_shm + LN_AUSPMA_RX_SHM_TJ_RXA_VREF_CTRL22,
44d2e75b8057a2 Sven Peter   2022-11-30  1321  	      LN_VREF_BOOST_EN_OV);
44d2e75b8057a2 Sven Peter   2022-11-30  1322  	udelay(2);
44d2e75b8057a2 Sven Peter   2022-11-30  1323  
44d2e75b8057a2 Sven Peter   2022-11-30  1324  	clear32(rx_shm + LN_AUSPMA_RX_SHM_TJ_RXA_VREF_CTRL22, LN_VREF_BOOST_EN);
44d2e75b8057a2 Sven Peter   2022-11-30  1325  	set32(rx_shm + LN_AUSPMA_RX_SHM_TJ_RXA_VREF_CTRL22,
44d2e75b8057a2 Sven Peter   2022-11-30  1326  	      LN_VREF_BOOST_EN_OV);
44d2e75b8057a2 Sven Peter   2022-11-30  1327  	udelay(2);
44d2e75b8057a2 Sven Peter   2022-11-30  1328  
44d2e75b8057a2 Sven Peter   2022-11-30  1329  	clear32(rx_shm + LN_AUSPMA_RX_SHM_TJ_RXA_DFE_CTRL13, LN_TX_PRE_EN);
44d2e75b8057a2 Sven Peter   2022-11-30  1330  	set32(rx_shm + LN_AUSPMA_RX_SHM_TJ_RXA_DFE_CTRL13, LN_TX_PRE_EN_OV);
44d2e75b8057a2 Sven Peter   2022-11-30  1331  	clear32(rx_shm + LN_AUSPMA_RX_SHM_TJ_RXA_DFE_CTRL13, LN_TX_PST1_EN);
44d2e75b8057a2 Sven Peter   2022-11-30  1332  	set32(rx_shm + LN_AUSPMA_RX_SHM_TJ_RXA_DFE_CTRL13, LN_TX_PST1_EN_OV);
44d2e75b8057a2 Sven Peter   2022-11-30  1333  
44d2e75b8057a2 Sven Peter   2022-11-30  1334  	clear32(rx_shm + LN_AUSPMA_RX_SHM_TJ_RXA_DFE_CTRL12, LN_TX_PBIAS_EN);
44d2e75b8057a2 Sven Peter   2022-11-30  1335  	set32(rx_shm + LN_AUSPMA_RX_SHM_TJ_RXA_DFE_CTRL12, LN_TX_PBIAS_EN_OV);
44d2e75b8057a2 Sven Peter   2022-11-30  1336  
44d2e75b8057a2 Sven Peter   2022-11-30  1337  	clear32(rx_shm + LN_AUSPMA_RX_SHM_TJ_RXA_SAVOS_CTRL16,
44d2e75b8057a2 Sven Peter   2022-11-30  1338  		LN_RXTERM_PULLUP_LEAK_EN);
44d2e75b8057a2 Sven Peter   2022-11-30  1339  	set32(rx_shm + LN_AUSPMA_RX_SHM_TJ_RXA_SAVOS_CTRL16,
44d2e75b8057a2 Sven Peter   2022-11-30  1340  	      LN_RXTERM_PULLUP_LEAK_EN_OV);
44d2e75b8057a2 Sven Peter   2022-11-30  1341  
44d2e75b8057a2 Sven Peter   2022-11-30  1342  	set32(rx_top + LN_AUSPMA_RX_TOP_TJ_CFG_RX_TXMODE, LN_RX_TXMODE);
44d2e75b8057a2 Sven Peter   2022-11-30  1343  
44d2e75b8057a2 Sven Peter   2022-11-30  1344  	if (cfg->txa_div2_en)
44d2e75b8057a2 Sven Peter   2022-11-30  1345  		set32(rx_shm + LN_AUSPMA_RX_SHM_TJ_RXA_TERM_CTRL19,
44d2e75b8057a2 Sven Peter   2022-11-30  1346  		      LN_TX_CLK_DIV2_EN);
44d2e75b8057a2 Sven Peter   2022-11-30  1347  	else
44d2e75b8057a2 Sven Peter   2022-11-30  1348  		clear32(rx_shm + LN_AUSPMA_RX_SHM_TJ_RXA_TERM_CTRL19,
44d2e75b8057a2 Sven Peter   2022-11-30  1349  			LN_TX_CLK_DIV2_EN);
44d2e75b8057a2 Sven Peter   2022-11-30  1350  	set32(rx_shm + LN_AUSPMA_RX_SHM_TJ_RXA_TERM_CTRL19,
44d2e75b8057a2 Sven Peter   2022-11-30  1351  	      LN_TX_CLK_DIV2_EN_OV);
44d2e75b8057a2 Sven Peter   2022-11-30  1352  
44d2e75b8057a2 Sven Peter   2022-11-30  1353  	clear32(rx_shm + LN_AUSPMA_RX_SHM_TJ_RXA_TERM_CTRL19,
44d2e75b8057a2 Sven Peter   2022-11-30  1354  		LN_TX_CLK_DIV2_RST);
44d2e75b8057a2 Sven Peter   2022-11-30  1355  	set32(rx_shm + LN_AUSPMA_RX_SHM_TJ_RXA_TERM_CTRL19,
44d2e75b8057a2 Sven Peter   2022-11-30  1356  	      LN_TX_CLK_DIV2_RST_OV);
44d2e75b8057a2 Sven Peter   2022-11-30  1357  
44d2e75b8057a2 Sven Peter   2022-11-30  1358  	clear32(rx_shm + LN_AUSPMA_RX_SHM_TJ_RXA_DFE_CTRL12, LN_TX_HRCLK_SEL);
44d2e75b8057a2 Sven Peter   2022-11-30  1359  	set32(rx_shm + LN_AUSPMA_RX_SHM_TJ_RXA_DFE_CTRL12, LN_TX_HRCLK_SEL_OV);
44d2e75b8057a2 Sven Peter   2022-11-30  1360  
44d2e75b8057a2 Sven Peter   2022-11-30  1361  	clear32(rx_shm + LN_AUSPMA_RX_SHM_TJ_RXA_TX_CTRL17, LN_TX_MARGIN);
44d2e75b8057a2 Sven Peter   2022-11-30  1362  	set32(rx_shm + LN_AUSPMA_RX_SHM_TJ_RXA_TX_CTRL17, LN_TX_MARGIN_OV);
44d2e75b8057a2 Sven Peter   2022-11-30  1363  	clear32(rx_shm + LN_AUSPMA_RX_SHM_TJ_RXA_TX_CTRL17, LN_TX_MARGIN_LSB);
44d2e75b8057a2 Sven Peter   2022-11-30  1364  	set32(rx_shm + LN_AUSPMA_RX_SHM_TJ_RXA_TX_CTRL17, LN_TX_MARGIN_LSB_OV);
44d2e75b8057a2 Sven Peter   2022-11-30  1365  	clear32(rx_shm + LN_AUSPMA_RX_SHM_TJ_RXA_TX_CTRL17, LN_TX_MARGIN_P1);
44d2e75b8057a2 Sven Peter   2022-11-30  1366  	set32(rx_shm + LN_AUSPMA_RX_SHM_TJ_RXA_TX_CTRL17, LN_TX_MARGIN_P1_OV);
44d2e75b8057a2 Sven Peter   2022-11-30  1367  	clear32(rx_shm + LN_AUSPMA_RX_SHM_TJ_RXA_TX_CTRL17,
44d2e75b8057a2 Sven Peter   2022-11-30  1368  		LN_TX_MARGIN_P1_LSB);
44d2e75b8057a2 Sven Peter   2022-11-30  1369  	set32(rx_shm + LN_AUSPMA_RX_SHM_TJ_RXA_TX_CTRL17,
44d2e75b8057a2 Sven Peter   2022-11-30  1370  	      LN_TX_MARGIN_P1_LSB_OV);
44d2e75b8057a2 Sven Peter   2022-11-30  1371  
44d2e75b8057a2 Sven Peter   2022-11-30  1372  	clear32(rx_shm + LN_AUSPMA_RX_SHM_TJ_RXA_TX_CTRL18, LN_TX_P1_CODE);
44d2e75b8057a2 Sven Peter   2022-11-30  1373  	set32(rx_shm + LN_AUSPMA_RX_SHM_TJ_RXA_TX_CTRL18, LN_TX_P1_CODE_OV);
44d2e75b8057a2 Sven Peter   2022-11-30  1374  	clear32(rx_shm + LN_AUSPMA_RX_SHM_TJ_RXA_TX_CTRL18, LN_TX_P1_LSB_CODE);
44d2e75b8057a2 Sven Peter   2022-11-30  1375  	set32(rx_shm + LN_AUSPMA_RX_SHM_TJ_RXA_TX_CTRL18, LN_TX_P1_LSB_CODE_OV);
44d2e75b8057a2 Sven Peter   2022-11-30  1376  	clear32(rx_shm + LN_AUSPMA_RX_SHM_TJ_RXA_TX_CTRL18, LN_TX_MARGIN_PRE);
44d2e75b8057a2 Sven Peter   2022-11-30  1377  	set32(rx_shm + LN_AUSPMA_RX_SHM_TJ_RXA_TX_CTRL18, LN_TX_MARGIN_PRE_OV);
44d2e75b8057a2 Sven Peter   2022-11-30  1378  	clear32(rx_shm + LN_AUSPMA_RX_SHM_TJ_RXA_TX_CTRL18,
44d2e75b8057a2 Sven Peter   2022-11-30  1379  		LN_TX_MARGIN_PRE_LSB);
44d2e75b8057a2 Sven Peter   2022-11-30  1380  	set32(rx_shm + LN_AUSPMA_RX_SHM_TJ_RXA_TX_CTRL18,
44d2e75b8057a2 Sven Peter   2022-11-30  1381  	      LN_TX_MARGIN_PRE_LSB_OV);
44d2e75b8057a2 Sven Peter   2022-11-30  1382  	clear32(rx_shm + LN_AUSPMA_RX_SHM_TJ_RXA_TX_CTRL18, LN_TX_PRE_LSB_CODE);
44d2e75b8057a2 Sven Peter   2022-11-30  1383  	set32(rx_shm + LN_AUSPMA_RX_SHM_TJ_RXA_TX_CTRL18,
44d2e75b8057a2 Sven Peter   2022-11-30  1384  	      LN_TX_PRE_LSB_CODE_OV);
44d2e75b8057a2 Sven Peter   2022-11-30  1385  	clear32(rx_shm + LN_AUSPMA_RX_SHM_TJ_RXA_TX_CTRL18, LN_TX_PRE_CODE);
44d2e75b8057a2 Sven Peter   2022-11-30  1386  	set32(rx_shm + LN_AUSPMA_RX_SHM_TJ_RXA_TX_CTRL18, LN_TX_PRE_CODE_OV);
44d2e75b8057a2 Sven Peter   2022-11-30  1387  
44d2e75b8057a2 Sven Peter   2022-11-30  1388  	set32(rx_shm + LN_AUSPMA_RX_SHM_TJ_RXA_DFE_CTRL11, LN_DTVREG_SML_EN);
44d2e75b8057a2 Sven Peter   2022-11-30  1389  	set32(rx_shm + LN_AUSPMA_RX_SHM_TJ_RXA_DFE_CTRL11, LN_DTVREG_SML_EN_OV);
44d2e75b8057a2 Sven Peter   2022-11-30  1390  	udelay(2);
44d2e75b8057a2 Sven Peter   2022-11-30  1391  
44d2e75b8057a2 Sven Peter   2022-11-30  1392  	set32(rx_shm + LN_AUSPMA_RX_SHM_TJ_RXA_DFE_CTRL11, LN_DTVREG_BIG_EN);
44d2e75b8057a2 Sven Peter   2022-11-30  1393  	set32(rx_shm + LN_AUSPMA_RX_SHM_TJ_RXA_DFE_CTRL11, LN_DTVREG_BIG_EN_OV);
44d2e75b8057a2 Sven Peter   2022-11-30  1394  	udelay(2);
44d2e75b8057a2 Sven Peter   2022-11-30  1395  
44d2e75b8057a2 Sven Peter   2022-11-30  1396  	mask32(rx_shm + LN_AUSPMA_RX_SHM_TJ_RXA_DFE_CTRL10, LN_DTVREG_ADJUST,
44d2e75b8057a2 Sven Peter   2022-11-30  1397  	       FIELD_PREP(LN_DTVREG_ADJUST, 0xa));
44d2e75b8057a2 Sven Peter   2022-11-30  1398  	set32(rx_shm + LN_AUSPMA_RX_SHM_TJ_RXA_DFE_CTRL13, LN_DTVREG_ADJUST_OV);
44d2e75b8057a2 Sven Peter   2022-11-30  1399  	udelay(2);
44d2e75b8057a2 Sven Peter   2022-11-30  1400  
44d2e75b8057a2 Sven Peter   2022-11-30  1401  	set32(rx_shm + LN_AUSPMA_RX_SHM_TJ_RXA_TERM_CTRL19, LN_TX_EN);
44d2e75b8057a2 Sven Peter   2022-11-30  1402  	set32(rx_shm + LN_AUSPMA_RX_SHM_TJ_RXA_TERM_CTRL19, LN_TX_EN_OV);
44d2e75b8057a2 Sven Peter   2022-11-30  1403  	udelay(2);
44d2e75b8057a2 Sven Peter   2022-11-30  1404  
44d2e75b8057a2 Sven Peter   2022-11-30  1405  	set32(rx_shm + LN_AUSPMA_RX_SHM_TJ_RXA_CTLE_CTRL0, LN_TX_CLK_EN);
44d2e75b8057a2 Sven Peter   2022-11-30  1406  	set32(rx_shm + LN_AUSPMA_RX_SHM_TJ_RXA_CTLE_CTRL0, LN_TX_CLK_EN_OV);
44d2e75b8057a2 Sven Peter   2022-11-30  1407  
44d2e75b8057a2 Sven Peter   2022-11-30  1408  	clear32(rx_shm + LN_AUSPMA_RX_SHM_TJ_RXA_DFE_CTRL12,
44d2e75b8057a2 Sven Peter   2022-11-30  1409  		LN_TX_BYTECLK_RESET_SYNC_CLR);
44d2e75b8057a2 Sven Peter   2022-11-30  1410  	set32(rx_shm + LN_AUSPMA_RX_SHM_TJ_RXA_DFE_CTRL12,
44d2e75b8057a2 Sven Peter   2022-11-30  1411  	      LN_TX_BYTECLK_RESET_SYNC_CLR_OV);
44d2e75b8057a2 Sven Peter   2022-11-30  1412  
44d2e75b8057a2 Sven Peter   2022-11-30  1413  	return 0;
44d2e75b8057a2 Sven Peter   2022-11-30  1414  }
44d2e75b8057a2 Sven Peter   2022-11-30  1415  

:::::: The code at line 1146 was first introduced by commit
:::::: 44d2e75b8057a2d871fb6b76134828645f25df45 WIP: phy: apple: Add Apple Type-C PHY

:::::: TO: Sven Peter <sven@svenpeter.dev>
:::::: CC: Janne Grunau <j@jannau.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
