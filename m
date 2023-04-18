Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B76B2572
	for <oe-kbuild-all@lists.linux.dev>; Tue, 18 Apr 2023 12:51:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681822304; x=1713358304;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GBKJEC+ZPcoj66tygiGyDP2sQUwGZ0jrINXPTNTkdho=;
  b=iQXdIbO1CtsFuf4e2nmncZDjJfTpD+ARVEt4bpLPFAR+UKRDQLLVMn8r
   NRrZBj6ykbRaRaR02qbeMdXoXwo78GibxjAVhIlEmOAKSLZv1zjWmC793
   fIajsKb0XVCk3iSFKg6p1+TAgiXw1u+TKJNQ/a62H/txZGGIBNk7Mfj+9
   69PGtLTwWsaLi7ClNpAKAeKjAPrcKLgiz/MJRavB6KmBzwU+OYypFSg3h
   3vAiXuoSKw4/lgviXAarsWL1D3QHKn1nkeagN8QD+khrSdMTVwc624pT5
   sTjkl+M4THzZ9cGnGif++P7j+cT/5JrWlutucuRxMTayRsaQMkwcuOWpr
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10684"; a="431445717"
X-IronPort-AV: E=Sophos;i="5.99,207,1677571200"; 
   d="scan'208";a="431445717"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Apr 2023 05:51:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10684"; a="780499445"
X-IronPort-AV: E=Sophos;i="5.99,207,1677571200"; 
   d="scan'208";a="780499445"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 18 Apr 2023 05:51:42 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1poko9-000dS7-2M;
	Tue, 18 Apr 2023 12:51:41 +0000
Date: Tue, 18 Apr 2023 20:51:00 +0800
From: kernel test robot <lkp@intel.com>
To: Ryder Lee <ryder.lee@mediatek.com>
Cc: oe-kbuild-all@lists.linux.dev, Felix Fietkau <nbd@nbd.name>
Subject: [nbd168-wireless:mt76 51/57]
 drivers/net/wireless/mediatek/mt76/mt7996/mac.c:1000:26: warning: variable
 'mphy' set but not used
Message-ID: <202304182033.iPfgUNAT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/nbd168/wireless mt76
head:   c9042a94dc1358156578491789053b38f9a37369
commit: 1a486bab8dd82f55eecca5f10ae181d6b977a0ed [51/57] wifi: mt76: mt7996: enable BSS_CHANGED_BASIC_RATES support
config: ia64-allyesconfig (https://download.01.org/0day-ci/archive/20230418/202304182033.iPfgUNAT-lkp@intel.com/config)
compiler: ia64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/nbd168/wireless/commit/1a486bab8dd82f55eecca5f10ae181d6b977a0ed
        git remote add nbd168-wireless https://github.com/nbd168/wireless
        git fetch --no-tags nbd168-wireless mt76
        git checkout 1a486bab8dd82f55eecca5f10ae181d6b977a0ed
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=ia64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=ia64 SHELL=/bin/bash drivers/net/wireless/mediatek/mt76/mt7996/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304182033.iPfgUNAT-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/net/wireless/mediatek/mt76/mt7996/mac.c: In function 'mt7996_mac_write_txwi':
>> drivers/net/wireless/mediatek/mt76/mt7996/mac.c:1000:26: warning: variable 'mphy' set but not used [-Wunused-but-set-variable]
    1000 |         struct mt76_phy *mphy = &dev->mphy;
         |                          ^~~~


vim +/mphy +1000 drivers/net/wireless/mediatek/mt76/mt7996/mac.c

98686cd21624c7 Shayne Chen 2022-11-22   991  
98686cd21624c7 Shayne Chen 2022-11-22   992  void mt7996_mac_write_txwi(struct mt7996_dev *dev, __le32 *txwi,
d0b6f86fdbefa6 Shayne Chen 2023-03-03   993  			   struct sk_buff *skb, struct mt76_wcid *wcid,
d0b6f86fdbefa6 Shayne Chen 2023-03-03   994  			   struct ieee80211_key_conf *key, int pid,
d0b6f86fdbefa6 Shayne Chen 2023-03-03   995  			   enum mt76_txq_id qid, u32 changed)
98686cd21624c7 Shayne Chen 2022-11-22   996  {
98686cd21624c7 Shayne Chen 2022-11-22   997  	struct ieee80211_tx_info *info = IEEE80211_SKB_CB(skb);
98686cd21624c7 Shayne Chen 2022-11-22   998  	struct ieee80211_vif *vif = info->control.vif;
1a486bab8dd82f Ryder Lee   2023-04-14   999  	struct mt7996_vif *mvif = (struct mt7996_vif *)vif->drv_priv;
98686cd21624c7 Shayne Chen 2022-11-22 @1000  	struct mt76_phy *mphy = &dev->mphy;
98686cd21624c7 Shayne Chen 2022-11-22  1001  	u8 band_idx = (info->hw_queue & MT_TX_HW_QUEUE_PHY) >> 2;
98686cd21624c7 Shayne Chen 2022-11-22  1002  	u8 p_fmt, q_idx, omac_idx = 0, wmm_idx = 0;
98686cd21624c7 Shayne Chen 2022-11-22  1003  	bool is_8023 = info->flags & IEEE80211_TX_CTL_HW_80211_ENCAP;
98686cd21624c7 Shayne Chen 2022-11-22  1004  	u16 tx_count = 15;
98686cd21624c7 Shayne Chen 2022-11-22  1005  	u32 val;
98686cd21624c7 Shayne Chen 2022-11-22  1006  	bool beacon = !!(changed & (BSS_CHANGED_BEACON |
98686cd21624c7 Shayne Chen 2022-11-22  1007  				    BSS_CHANGED_BEACON_ENABLED));
98686cd21624c7 Shayne Chen 2022-11-22  1008  	bool inband_disc = !!(changed & (BSS_CHANGED_UNSOL_BCAST_PROBE_RESP |
98686cd21624c7 Shayne Chen 2022-11-22  1009  					 BSS_CHANGED_FILS_DISCOVERY));
98686cd21624c7 Shayne Chen 2022-11-22  1010  
98686cd21624c7 Shayne Chen 2022-11-22  1011  	if (vif) {
98686cd21624c7 Shayne Chen 2022-11-22  1012  		omac_idx = mvif->mt76.omac_idx;
98686cd21624c7 Shayne Chen 2022-11-22  1013  		wmm_idx = mvif->mt76.wmm_idx;
98686cd21624c7 Shayne Chen 2022-11-22  1014  		band_idx = mvif->mt76.band_idx;
98686cd21624c7 Shayne Chen 2022-11-22  1015  	}
98686cd21624c7 Shayne Chen 2022-11-22  1016  
98686cd21624c7 Shayne Chen 2022-11-22  1017  	mphy = mt76_dev_phy(&dev->mt76, band_idx);
98686cd21624c7 Shayne Chen 2022-11-22  1018  
98686cd21624c7 Shayne Chen 2022-11-22  1019  	if (inband_disc) {
98686cd21624c7 Shayne Chen 2022-11-22  1020  		p_fmt = MT_TX_TYPE_FW;
98686cd21624c7 Shayne Chen 2022-11-22  1021  		q_idx = MT_LMAC_ALTX0;
98686cd21624c7 Shayne Chen 2022-11-22  1022  	} else if (beacon) {
98686cd21624c7 Shayne Chen 2022-11-22  1023  		p_fmt = MT_TX_TYPE_FW;
98686cd21624c7 Shayne Chen 2022-11-22  1024  		q_idx = MT_LMAC_BCN0;
d0b6f86fdbefa6 Shayne Chen 2023-03-03  1025  	} else if (qid >= MT_TXQ_PSD) {
98686cd21624c7 Shayne Chen 2022-11-22  1026  		p_fmt = MT_TX_TYPE_CT;
98686cd21624c7 Shayne Chen 2022-11-22  1027  		q_idx = MT_LMAC_ALTX0;
98686cd21624c7 Shayne Chen 2022-11-22  1028  	} else {
98686cd21624c7 Shayne Chen 2022-11-22  1029  		p_fmt = MT_TX_TYPE_CT;
98686cd21624c7 Shayne Chen 2022-11-22  1030  		q_idx = wmm_idx * MT7996_MAX_WMM_SETS +
98686cd21624c7 Shayne Chen 2022-11-22  1031  			mt76_connac_lmac_mapping(skb_get_queue_mapping(skb));
98686cd21624c7 Shayne Chen 2022-11-22  1032  	}
98686cd21624c7 Shayne Chen 2022-11-22  1033  
98686cd21624c7 Shayne Chen 2022-11-22  1034  	val = FIELD_PREP(MT_TXD0_TX_BYTES, skb->len + MT_TXD_SIZE) |
98686cd21624c7 Shayne Chen 2022-11-22  1035  	      FIELD_PREP(MT_TXD0_PKT_FMT, p_fmt) |
98686cd21624c7 Shayne Chen 2022-11-22  1036  	      FIELD_PREP(MT_TXD0_Q_IDX, q_idx);
98686cd21624c7 Shayne Chen 2022-11-22  1037  	txwi[0] = cpu_to_le32(val);
98686cd21624c7 Shayne Chen 2022-11-22  1038  
98686cd21624c7 Shayne Chen 2022-11-22  1039  	val = FIELD_PREP(MT_TXD1_WLAN_IDX, wcid->idx) |
98686cd21624c7 Shayne Chen 2022-11-22  1040  	      FIELD_PREP(MT_TXD1_OWN_MAC, omac_idx);
98686cd21624c7 Shayne Chen 2022-11-22  1041  
98686cd21624c7 Shayne Chen 2022-11-22  1042  	if (band_idx)
98686cd21624c7 Shayne Chen 2022-11-22  1043  		val |= FIELD_PREP(MT_TXD1_TGID, band_idx);
98686cd21624c7 Shayne Chen 2022-11-22  1044  
98686cd21624c7 Shayne Chen 2022-11-22  1045  	txwi[1] = cpu_to_le32(val);
98686cd21624c7 Shayne Chen 2022-11-22  1046  	txwi[2] = 0;
98686cd21624c7 Shayne Chen 2022-11-22  1047  
98686cd21624c7 Shayne Chen 2022-11-22  1048  	val = MT_TXD3_SW_POWER_MGMT |
98686cd21624c7 Shayne Chen 2022-11-22  1049  	      FIELD_PREP(MT_TXD3_REM_TX_COUNT, tx_count);
98686cd21624c7 Shayne Chen 2022-11-22  1050  	if (key)
98686cd21624c7 Shayne Chen 2022-11-22  1051  		val |= MT_TXD3_PROTECT_FRAME;
98686cd21624c7 Shayne Chen 2022-11-22  1052  	if (info->flags & IEEE80211_TX_CTL_NO_ACK)
98686cd21624c7 Shayne Chen 2022-11-22  1053  		val |= MT_TXD3_NO_ACK;
98686cd21624c7 Shayne Chen 2022-11-22  1054  	if (wcid->amsdu)
98686cd21624c7 Shayne Chen 2022-11-22  1055  		val |= MT_TXD3_HW_AMSDU;
98686cd21624c7 Shayne Chen 2022-11-22  1056  
98686cd21624c7 Shayne Chen 2022-11-22  1057  	txwi[3] = cpu_to_le32(val);
98686cd21624c7 Shayne Chen 2022-11-22  1058  	txwi[4] = 0;
98686cd21624c7 Shayne Chen 2022-11-22  1059  
98686cd21624c7 Shayne Chen 2022-11-22  1060  	val = FIELD_PREP(MT_TXD5_PID, pid);
98686cd21624c7 Shayne Chen 2022-11-22  1061  	if (pid >= MT_PACKET_ID_FIRST)
98686cd21624c7 Shayne Chen 2022-11-22  1062  		val |= MT_TXD5_TX_STATUS_HOST;
98686cd21624c7 Shayne Chen 2022-11-22  1063  	txwi[5] = cpu_to_le32(val);
98686cd21624c7 Shayne Chen 2022-11-22  1064  
98686cd21624c7 Shayne Chen 2022-11-22  1065  	val = MT_TXD6_DIS_MAT | MT_TXD6_DAS |
98686cd21624c7 Shayne Chen 2022-11-22  1066  	      FIELD_PREP(MT_TXD6_MSDU_CNT, 1);
98686cd21624c7 Shayne Chen 2022-11-22  1067  	txwi[6] = cpu_to_le32(val);
98686cd21624c7 Shayne Chen 2022-11-22  1068  	txwi[7] = 0;
98686cd21624c7 Shayne Chen 2022-11-22  1069  
98686cd21624c7 Shayne Chen 2022-11-22  1070  	if (is_8023)
98686cd21624c7 Shayne Chen 2022-11-22  1071  		mt7996_mac_write_txwi_8023(dev, txwi, skb, wcid);
98686cd21624c7 Shayne Chen 2022-11-22  1072  	else
98686cd21624c7 Shayne Chen 2022-11-22  1073  		mt7996_mac_write_txwi_80211(dev, txwi, skb, key);
98686cd21624c7 Shayne Chen 2022-11-22  1074  
98686cd21624c7 Shayne Chen 2022-11-22  1075  	if (txwi[1] & cpu_to_le32(MT_TXD1_FIXED_RATE)) {
1a486bab8dd82f Ryder Lee   2023-04-14  1076  		u8 idx = mvif->basic_rates_idx;
98686cd21624c7 Shayne Chen 2022-11-22  1077  
1a486bab8dd82f Ryder Lee   2023-04-14  1078  		txwi[6] |= FIELD_PREP(MT_TXD6_TX_RATE, idx);
98686cd21624c7 Shayne Chen 2022-11-22  1079  		txwi[3] |= cpu_to_le32(MT_TXD3_BA_DISABLE);
98686cd21624c7 Shayne Chen 2022-11-22  1080  	}
98686cd21624c7 Shayne Chen 2022-11-22  1081  }
98686cd21624c7 Shayne Chen 2022-11-22  1082  

:::::: The code at line 1000 was first introduced by commit
:::::: 98686cd21624c75a043e96812beadddf4f6f48e5 wifi: mt76: mt7996: add driver for MediaTek Wi-Fi 7 (802.11be) devices

:::::: TO: Shayne Chen <shayne.chen@mediatek.com>
:::::: CC: Felix Fietkau <nbd@nbd.name>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
