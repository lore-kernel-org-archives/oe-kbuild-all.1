Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67C562C9C
	for <oe-kbuild-all@lists.linux.dev>; Thu, 19 Jan 2023 08:20:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674116448; x=1705652448;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wmRcxDOyhPJVyfKCgFpTYszbOkVgWxHUYtlq1ySmbR8=;
  b=cY3Zs1FsfFyZEd+iu/83v5co1EwcoJiAWQUBI3Gaq2ZJQ/Y9+BgaF+7a
   KWpldiFaDgsCrn4ZXZ6plicNkiZvV74Fie3zTsVW062oV5x0sN5fG3zFX
   xrxRi3iHp+lXNFTUyO2ILfmE7/JEsXxKun6hIWvG1cWwJokoQiu5qMKJS
   Y5IxeJ0dhUa1XMu+L0/EPgactPZjX1VbeVAcSnR8cODUGsYzFaHjbyYmi
   OieJCOeraUBqXzlyJ8wgnIgK2fuK89O2DUBVumGLSDqFoz0RWrI4MkTQo
   BLNMaGOa6kolAcKnwD2dNwh8cOacVm27XCIwf2KCFGGMEkdtoBdFFei5q
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="304910091"
X-IronPort-AV: E=Sophos;i="5.97,228,1669104000"; 
   d="scan'208";a="304910091"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2023 00:20:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="728562419"
X-IronPort-AV: E=Sophos;i="5.97,228,1669104000"; 
   d="scan'208";a="728562419"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 19 Jan 2023 00:20:42 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pIQA5-0001I4-33;
	Thu, 19 Jan 2023 08:20:41 +0000
Date: Thu, 19 Jan 2023 16:20:28 +0800
From: kernel test robot <lkp@intel.com>
To: Jes Sorensen <Jes.Sorensen@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Kalle Valo <kvalo@kernel.org>,
	Andrea Merello <andrea.merello@gmail.com>,
	Taehee Yoo <ap420073@gmail.com>,
	Bitterblue Smith <rtl8821cerfe2@gmail.com>,
	Ping-Ke Shih <pkshih@realtek.com>
Subject: [linux-next:master 788/6276]
 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu_core.c:5198:24: sparse:
 sparse: invalid assignment: |=
Message-ID: <202301191616.R33Dvxk4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   aa5c49149a823599764e6953229b028e4bf6e9cc
commit: 3dfb8e844fa30cceb4b810613e2c35f628eb3e70 [788/6276] wifi: rtl8xxxu: Support new chip RTL8188EU
config: openrisc-randconfig-s043-20230119 (https://download.01.org/0day-ci/archive/20230119/202301191616.R33Dvxk4-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 12.1.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=3dfb8e844fa30cceb4b810613e2c35f628eb3e70
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 3dfb8e844fa30cceb4b810613e2c35f628eb3e70
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=openrisc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=openrisc SHELL=/bin/bash drivers/net/wireless/realtek/rtl8xxxu/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

sparse warnings: (new ones prefixed by >>)
>> drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu_core.c:5198:24: sparse: sparse: invalid assignment: |=
>> drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu_core.c:5198:24: sparse:    left side has type restricted __le16
>> drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu_core.c:5198:24: sparse:    right side has type restricted __le32

vim +5198 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu_core.c

  5110	
  5111	/*
  5112	 * Fill in v3 (gen1) specific TX descriptor bits.
  5113	 * This format is a hybrid between the v1 and v2 formats, only seen
  5114	 * on 8188eu devices so far.
  5115	 */
  5116	void
  5117	rtl8xxxu_fill_txdesc_v3(struct ieee80211_hw *hw, struct ieee80211_hdr *hdr,
  5118				struct ieee80211_tx_info *tx_info,
  5119				struct rtl8xxxu_txdesc32 *tx_desc, bool sgi,
  5120				bool short_preamble, bool ampdu_enable, u32 rts_rate)
  5121	{
  5122		struct ieee80211_rate *tx_rate = ieee80211_get_tx_rate(hw, tx_info);
  5123		struct rtl8xxxu_priv *priv = hw->priv;
  5124		struct device *dev = &priv->udev->dev;
  5125		u8 *qc = ieee80211_get_qos_ctl(hdr);
  5126		u8 tid = qc[0] & IEEE80211_QOS_CTL_TID_MASK;
  5127		u32 rate;
  5128		u16 rate_flags = tx_info->control.rates[0].flags;
  5129		u16 seq_number;
  5130	
  5131		if (rate_flags & IEEE80211_TX_RC_MCS &&
  5132		    !ieee80211_is_mgmt(hdr->frame_control))
  5133			rate = tx_info->control.rates[0].idx + DESC_RATE_MCS0;
  5134		else
  5135			rate = tx_rate->hw_value;
  5136	
  5137		seq_number = IEEE80211_SEQ_TO_SN(le16_to_cpu(hdr->seq_ctrl));
  5138	
  5139		if (ieee80211_is_data(hdr->frame_control)) {
  5140			rate = DESC_RATE_MCS7; /* TODO: software rate control */
  5141			tx_desc->txdw5 = cpu_to_le32(rate);
  5142			tx_desc->txdw4 |= cpu_to_le32(TXDESC32_USE_DRIVER_RATE);
  5143			/* Data/RTS rate FB limit */
  5144			tx_desc->txdw5 |= cpu_to_le32(0x0001ff00);
  5145		}
  5146	
  5147		if (rtl8xxxu_debug & RTL8XXXU_DEBUG_TX)
  5148			dev_info(dev, "%s: TX rate: %d, pkt size %d\n",
  5149				 __func__, rate, le16_to_cpu(tx_desc->pkt_size));
  5150	
  5151		tx_desc->txdw3 = cpu_to_le32((u32)seq_number << TXDESC32_SEQ_SHIFT);
  5152	
  5153		if (ampdu_enable && test_bit(tid, priv->tid_tx_operational))
  5154			tx_desc->txdw2 |= cpu_to_le32(TXDESC40_AGG_ENABLE);
  5155		else
  5156			tx_desc->txdw2 |= cpu_to_le32(TXDESC40_AGG_BREAK);
  5157	
  5158		if (ieee80211_is_mgmt(hdr->frame_control)) {
  5159			tx_desc->txdw5 = cpu_to_le32(rate);
  5160			tx_desc->txdw4 |= cpu_to_le32(TXDESC32_USE_DRIVER_RATE);
  5161			tx_desc->txdw5 |= cpu_to_le32(6 << TXDESC32_RETRY_LIMIT_SHIFT);
  5162			tx_desc->txdw5 |= cpu_to_le32(TXDESC32_RETRY_LIMIT_ENABLE);
  5163		}
  5164	
  5165		if (ieee80211_is_data_qos(hdr->frame_control)) {
  5166			tx_desc->txdw4 |= cpu_to_le32(TXDESC32_QOS);
  5167	
  5168			if (conf_is_ht40(&hw->conf)) {
  5169				tx_desc->txdw4 |= cpu_to_le32(TXDESC_DATA_BW);
  5170	
  5171				if (conf_is_ht40_minus(&hw->conf))
  5172					tx_desc->txdw4 |= cpu_to_le32(TXDESC_PRIME_CH_OFF_UPPER);
  5173				else
  5174					tx_desc->txdw4 |= cpu_to_le32(TXDESC_PRIME_CH_OFF_LOWER);
  5175			}
  5176		}
  5177	
  5178		if (short_preamble)
  5179			tx_desc->txdw4 |= cpu_to_le32(TXDESC32_SHORT_PREAMBLE);
  5180	
  5181		if (sgi)
  5182			tx_desc->txdw5 |= cpu_to_le32(TXDESC32_SHORT_GI);
  5183	
  5184		/*
  5185		 * rts_rate is zero if RTS/CTS or CTS to SELF are not enabled
  5186		 */
  5187		tx_desc->txdw4 |= cpu_to_le32(rts_rate << TXDESC32_RTS_RATE_SHIFT);
  5188		if (ampdu_enable || (rate_flags & IEEE80211_TX_RC_USE_RTS_CTS)) {
  5189			tx_desc->txdw4 |= cpu_to_le32(TXDESC32_RTS_CTS_ENABLE);
  5190			tx_desc->txdw4 |= cpu_to_le32(TXDESC32_HW_RTS_ENABLE);
  5191		} else if (rate_flags & IEEE80211_TX_RC_USE_CTS_PROTECT) {
  5192			tx_desc->txdw4 |= cpu_to_le32(TXDESC32_CTS_SELF_ENABLE);
  5193			tx_desc->txdw4 |= cpu_to_le32(TXDESC32_HW_RTS_ENABLE);
  5194		}
  5195	
  5196		tx_desc->txdw2 |= cpu_to_le32(TXDESC_ANTENNA_SELECT_A |
  5197					      TXDESC_ANTENNA_SELECT_B);
> 5198		tx_desc->txdw7 |= cpu_to_le32(TXDESC_ANTENNA_SELECT_C);
  5199	}
  5200	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
