Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C80C8F64
	for <oe-kbuild-all@lists.linux.dev>; Thu, 19 Oct 2023 00:32:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H553+hAm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697675560; x=1729211560;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1eIM3fYzViDsU1HsyF3bIYGB40F7jdZhUwf9VPzQuJc=;
  b=H553+hAmb5GU+p3Y+AUMV993dWiUiBrAv4pupzfKxeGUCz5Xj+g2zyVN
   AZWiz7gPrK2MsaSYJLj75Fhzbd/47yMWNQH9lAfdYx+ZixfE+/9g1H3WU
   ZVcS9HC9ZumHBgXefzHZZtQKMqIpSAbAuVBWJ5QOJhFtNBGQy9/hjlU3n
   L0b7AX3I5LAXHKxlBoP/2tlolHSEP7ziWyxHPwbI6OkNcCKM5ioBapvFY
   mxVzSdAdctsr32qIx0SUSYOmYgiNktnhhVIOhTFLsIsSxse8iO0cVFxre
   I2RX+sSV88Vc7NqYLQ6ja0rZRjlXhYAEdKKoZdZmeGk12KCT2wok7kmPr
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10867"; a="452616615"
X-IronPort-AV: E=Sophos;i="6.03,236,1694761200"; 
   d="scan'208";a="452616615"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2023 17:32:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10867"; a="1088175288"
X-IronPort-AV: E=Sophos;i="6.03,236,1694761200"; 
   d="scan'208";a="1088175288"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 18 Oct 2023 17:32:36 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qtGxm-0001Km-1n;
	Thu, 19 Oct 2023 00:32:34 +0000
Date: Thu, 19 Oct 2023 08:32:05 +0800
From: kernel test robot <lkp@intel.com>
To: Yi-Chia Hsieh <yi-chia.hsieh@mediatek.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Felix Fietkau <nbd@nbd.name>, Money Wang <Money.Wang@mediatek.com>,
	Peter Chiu <chui-hao.chiu@mediatek.com>,
	Evelyn Tsai <evelyn.tsai@mediatek.com>,
	Ryder Lee <ryder.lee@mediatek.com>
Subject: [linux-next:master 7709/13299]
 drivers/net/wireless/mediatek/mt76/mt7996/mcu.c:483:61: warning: array
 subscript <unknown> is outside array bounds of 'struct <anonymous>[0]'
Message-ID: <202310190833.oIL4wrlx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   2dac75696c6da3c848daa118a729827541c89d33
commit: adde3eed4a75fe346d5ec1d78cd117e06bd70404 [7709/13299] wifi: mt76: mt7996: Add mcu commands for getting sta tx statistic
config: csky-allmodconfig (https://download.01.org/0day-ci/archive/20231019/202310190833.oIL4wrlx-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231019/202310190833.oIL4wrlx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310190833.oIL4wrlx-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/byteorder/little_endian.h:5,
                    from arch/csky/include/uapi/asm/byteorder.h:6,
                    from include/asm-generic/bitops/le.h:6,
                    from arch/csky/include/asm/bitops.h:77,
                    from include/linux/bitops.h:68,
                    from include/linux/log2.h:12,
                    from include/asm-generic/div64.h:55,
                    from ./arch/csky/include/generated/asm/div64.h:1,
                    from include/linux/math.h:6,
                    from include/linux/math64.h:6,
                    from include/linux/time64.h:5,
                    from include/linux/restart_block.h:10,
                    from include/linux/thread_info.h:14,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/csky/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:79,
                    from include/linux/spinlock.h:56,
                    from include/linux/mmzone.h:8,
                    from include/linux/gfp.h:7,
                    from include/linux/firmware.h:7,
                    from drivers/net/wireless/mediatek/mt76/mt7996/mcu.c:6:
   drivers/net/wireless/mediatek/mt76/mt7996/mcu.c: In function 'mt7996_mcu_rx_all_sta_info_event':
>> drivers/net/wireless/mediatek/mt76/mt7996/mcu.c:483:61: warning: array subscript <unknown> is outside array bounds of 'struct <anonymous>[0]' [-Warray-bounds=]
     483 |                         wlan_idx = le16_to_cpu(res->msdu_cnt[i].wlan_idx);
         |                                                ~~~~~~~~~~~~~^~~
   include/uapi/linux/byteorder/little_endian.h:37:51: note: in definition of macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
         |                                                   ^
   drivers/net/wireless/mediatek/mt76/mt7996/mcu.c:483:36: note: in expansion of macro 'le16_to_cpu'
     483 |                         wlan_idx = le16_to_cpu(res->msdu_cnt[i].wlan_idx);
         |                                    ^~~~~~~~~~~
   In file included from drivers/net/wireless/mediatek/mt76/mt7996/mcu.c:9:
   drivers/net/wireless/mediatek/mt76/mt7996/mcu.h:178:19: note: while referencing 'msdu_cnt'
     178 |                 } msdu_cnt[0];
         |                   ^~~~~~~~
   drivers/net/wireless/mediatek/mt76/mt7996/mcu.c:490:58: warning: array subscript <unknown> is outside array bounds of 'struct <anonymous>[0]' [-Warray-bounds=]
     490 |                                 le32_to_cpu(res->msdu_cnt[i].tx_msdu_cnt);
         |                                             ~~~~~~~~~~~~~^~~
   include/uapi/linux/byteorder/little_endian.h:35:51: note: in definition of macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   drivers/net/wireless/mediatek/mt76/mt7996/mcu.c:490:33: note: in expansion of macro 'le32_to_cpu'
     490 |                                 le32_to_cpu(res->msdu_cnt[i].tx_msdu_cnt);
         |                                 ^~~~~~~~~~~
   drivers/net/wireless/mediatek/mt76/mt7996/mcu.h:178:19: note: while referencing 'msdu_cnt'
     178 |                 } msdu_cnt[0];
         |                   ^~~~~~~~
   drivers/net/wireless/mediatek/mt76/mt7996/mcu.c:492:58: warning: array subscript <unknown> is outside array bounds of 'struct <anonymous>[0]' [-Warray-bounds=]
     492 |                                 le32_to_cpu(res->msdu_cnt[i].rx_msdu_cnt);
         |                                             ~~~~~~~~~~~~~^~~
   include/uapi/linux/byteorder/little_endian.h:35:51: note: in definition of macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   drivers/net/wireless/mediatek/mt76/mt7996/mcu.c:492:33: note: in expansion of macro 'le32_to_cpu'
     492 |                                 le32_to_cpu(res->msdu_cnt[i].rx_msdu_cnt);
         |                                 ^~~~~~~~~~~
   drivers/net/wireless/mediatek/mt76/mt7996/mcu.h:178:19: note: while referencing 'msdu_cnt'
     178 |                 } msdu_cnt[0];
         |                   ^~~~~~~~
   drivers/net/wireless/mediatek/mt76/mt7996/mcu.c:469:61: warning: array subscript <unknown> is outside array bounds of 'struct <anonymous>[0]' [-Warray-bounds=]
     469 |                         wlan_idx = le16_to_cpu(res->adm_stat[i].wlan_idx);
         |                                                ~~~~~~~~~~~~~^~~
   include/uapi/linux/byteorder/little_endian.h:37:51: note: in definition of macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
         |                                                   ^
   drivers/net/wireless/mediatek/mt76/mt7996/mcu.c:469:36: note: in expansion of macro 'le16_to_cpu'
     469 |                         wlan_idx = le16_to_cpu(res->adm_stat[i].wlan_idx);
         |                                    ^~~~~~~~~~~
   drivers/net/wireless/mediatek/mt76/mt7996/mcu.h:171:19: note: while referencing 'adm_stat'
     171 |                 } adm_stat[0];
         |                   ^~~~~~~~
   drivers/net/wireless/mediatek/mt76/mt7996/mcu.c:477:66: warning: array subscript <unknown> is outside array bounds of 'struct <anonymous>[0]' [-Warray-bounds=]
     477 |                                         le32_to_cpu(res->adm_stat[i].tx_bytes[ac]);
         |                                                     ~~~~~~~~~~~~~^~~
   include/uapi/linux/byteorder/little_endian.h:35:51: note: in definition of macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   drivers/net/wireless/mediatek/mt76/mt7996/mcu.c:477:41: note: in expansion of macro 'le32_to_cpu'
     477 |                                         le32_to_cpu(res->adm_stat[i].tx_bytes[ac]);
         |                                         ^~~~~~~~~~~
   drivers/net/wireless/mediatek/mt76/mt7996/mcu.h:171:19: note: while referencing 'adm_stat'
     171 |                 } adm_stat[0];
         |                   ^~~~~~~~
   drivers/net/wireless/mediatek/mt76/mt7996/mcu.c:479:66: warning: array subscript <unknown> is outside array bounds of 'struct <anonymous>[0]' [-Warray-bounds=]
     479 |                                         le32_to_cpu(res->adm_stat[i].rx_bytes[ac]);
         |                                                     ~~~~~~~~~~~~~^~~
   include/uapi/linux/byteorder/little_endian.h:35:51: note: in definition of macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   drivers/net/wireless/mediatek/mt76/mt7996/mcu.c:479:41: note: in expansion of macro 'le32_to_cpu'
     479 |                                         le32_to_cpu(res->adm_stat[i].rx_bytes[ac]);
         |                                         ^~~~~~~~~~~
   drivers/net/wireless/mediatek/mt76/mt7996/mcu.h:171:19: note: while referencing 'adm_stat'
     171 |                 } adm_stat[0];
         |                   ^~~~~~~~


vim +483 drivers/net/wireless/mediatek/mt76/mt7996/mcu.c

   451	
   452	static void
   453	mt7996_mcu_rx_all_sta_info_event(struct mt7996_dev *dev, struct sk_buff *skb)
   454	{
   455		struct mt7996_mcu_all_sta_info_event *res;
   456		u16 i;
   457	
   458		skb_pull(skb, sizeof(struct mt7996_mcu_rxd));
   459	
   460		res = (struct mt7996_mcu_all_sta_info_event *)skb->data;
   461	
   462		for (i = 0; i < le16_to_cpu(res->sta_num); i++) {
   463			u8 ac;
   464			u16 wlan_idx;
   465			struct mt76_wcid *wcid;
   466	
   467			switch (le16_to_cpu(res->tag)) {
   468			case UNI_ALL_STA_TXRX_ADM_STAT:
   469				wlan_idx = le16_to_cpu(res->adm_stat[i].wlan_idx);
   470				wcid = rcu_dereference(dev->mt76.wcid[wlan_idx]);
   471	
   472				if (!wcid)
   473					break;
   474	
   475				for (ac = 0; ac < IEEE80211_NUM_ACS; ac++) {
   476					wcid->stats.tx_bytes +=
   477						le32_to_cpu(res->adm_stat[i].tx_bytes[ac]);
   478					wcid->stats.rx_bytes +=
   479						le32_to_cpu(res->adm_stat[i].rx_bytes[ac]);
   480				}
   481				break;
   482			case UNI_ALL_STA_TXRX_MSDU_COUNT:
 > 483				wlan_idx = le16_to_cpu(res->msdu_cnt[i].wlan_idx);
   484				wcid = rcu_dereference(dev->mt76.wcid[wlan_idx]);
   485	
   486				if (!wcid)
   487					break;
   488	
   489				wcid->stats.tx_packets +=
   490					le32_to_cpu(res->msdu_cnt[i].tx_msdu_cnt);
   491				wcid->stats.rx_packets +=
   492					le32_to_cpu(res->msdu_cnt[i].rx_msdu_cnt);
   493				break;
   494			default:
   495				break;
   496			}
   497		}
   498	}
   499	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
