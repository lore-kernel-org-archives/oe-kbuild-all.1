Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8793F37A494
	for <oe-kbuild-all@lists.linux.dev>; Thu, 30 Jul 2026 03:21:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785381666; cv=none; b=D+0ij1m7W/C3uMtlSAULsi6fcIIJz4IIgtvLflvePEdhaUEo7UmEovpW781vySsjgCrLnXrZOhB5G279JUFAoWshAIOGalreM6Oaj3ptGHWEf/iUxT65B2+fMHvb2PpLH1F1DneOmXapv+eiJts4SQ120OEfv+DX223S5ywV9Fg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785381666; c=relaxed/simple;
	bh=3w9dvYblR4tb5MRgPbHHIUGGGBcSwd9W39MfoP9Okm0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=n7uA0cF/DGT4Iwg8E0DLSQ09IR/YZY4PsUW56y633mUaULhcppbJN+1+WhdSIL1mZbqmgN4CWu7mykhnfnlSHxjTLzLDxjaJWwaJKq9YCb7NeFCck4DgQKQpb/raSgFuUYUvp1ShoUpELtp5U9YTs6EExOl7Ax+qV99oWemYRIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DNIXhAS7; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DNIXhAS7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785381664; x=1816917664;
  h=date:from:to:cc:subject:message-id;
  bh=3w9dvYblR4tb5MRgPbHHIUGGGBcSwd9W39MfoP9Okm0=;
  b=DNIXhAS7ggm5LIxMfmNXQ9AKshn6U6rQwUEWLodFThFPLcCrC5VwHefv
   r35ZXSK4Zo6faf0hJdBLzkHPRLzz8X2cN3scgTyJd4Y7kFS2YG65Ws63/
   J4RUxrrLKAGreNVIlDqmRkLEVfsujKA/sYAU5mDSn8fV8n9GsyIq475KA
   S7g1RQNqtehgIsSmyapWBtnTRxL8pzN6hD2ldR4WQuieMAD7sldpKp3Mo
   6tvI4xprH2h5S1ssR2ZBdNbI7mvrqrB3sMfIz9drPw/i827UExuMuEsR9
   MO7Q1tiX+4lc295XNN8W5zC26GOb+z/LnsQSp0e2geBF10YBpQsbmCQ/x
   Q==;
X-CSE-ConnectionGUID: /y0p1AJKRnSSrtX+GIQ9Xw==
X-CSE-MsgGUID: w7pgj/yoTSam8LWI90aZCQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="86186981"
X-IronPort-AV: E=Sophos;i="6.25,193,1779174000"; 
   d="scan'208";a="86186981"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2026 20:21:03 -0700
X-CSE-ConnectionGUID: PdZjyYjkTOW53KJlUobkig==
X-CSE-MsgGUID: 3THju9gFQ4eVadgQ8iNq4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,193,1779174000"; 
   d="scan'208";a="265237856"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 29 Jul 2026 20:21:01 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wpHK4-00000000fyY-4Bqt;
	Thu, 30 Jul 2026 03:20:57 +0000
Date: Thu, 30 Jul 2026 11:19:54 +0800
From: kernel test robot <lkp@intel.com>
To: Emery Hsin <emery.hsin@mediatek.com>
Cc: oe-kbuild-all@lists.linux.dev, Felix Fietkau <nbd@nbd.name>,
 Xiong <xiong.huang@mediatek.com>
Subject: [nbd168-wireless:mt76 18/135]
 drivers/net/wireless/mediatek/mt76/mt7925/mcu.c:450:4: error: a label can
 only be part of a statement and a declaration is not a statement
Message-ID: <202607301118.AhhCoyUN-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/nbd168/wireless mt76
head:   f9e4fb01b5467a48ec2f387b00dd5d1aa46d9fe4
commit: 8f3041ac57330f847889cf47070706aff98a1d49 [18/135] wifi: mt76: mt7925: add MT7928 TXD/TXS/TX_DONE support
config: arc-randconfig-r073-20260730 (https://download.01.org/0day-ci/archive/20260730/202607301118.AhhCoyUN-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 8.5.0
smatch: v0.5.0-9187-g5189e3fb
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260730/202607301118.AhhCoyUN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607301118.AhhCoyUN-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/net/wireless/mediatek/mt76/mt7925/mcu.c: In function 'mt7925_mcu_tx_done_event':
>> drivers/net/wireless/mediatek/mt76/mt7925/mcu.c:450:4: error: a label can only be part of a statement and a declaration is not a statement
       struct mt7928_uni_txdone_event *evt;
       ^~~~~~


vim +450 drivers/net/wireless/mediatek/mt76/mt7925/mcu.c

   429	
   430	static void
   431	mt7925_mcu_tx_done_event(struct mt792x_dev *dev, struct sk_buff *skb)
   432	{
   433	#define UNI_EVENT_TX_DONE_MSG 0
   434	#define UNI_EVENT_TX_DONE_RAW 1
   435		struct mt7925_mcu_txs_event {
   436			u8 ver;
   437			u8 rsv[3];
   438			u8 data[];
   439		} __packed * txs;
   440		struct tlv *tlv;
   441		u32 tlv_len;
   442	
   443		skb_pull(skb, sizeof(struct mt7925_mcu_rxd) + 4);
   444		tlv = (struct tlv *)skb->data;
   445		tlv_len = skb->len;
   446	
   447		while (tlv_len > 0 && le16_to_cpu(tlv->len) <= tlv_len) {
   448			switch (le16_to_cpu(tlv->tag)) {
   449			case UNI_EVENT_TX_DONE_MSG:
 > 450				struct mt7928_uni_txdone_event *evt;
   451	
   452				if (!is_mt7928(&dev->mt76))
   453					break;
   454	
   455				evt = (struct mt7928_uni_txdone_event *)tlv;
   456				if (evt->status) {
   457					dev_info(dev->mt76.dev,
   458						 "TxDone: pid=%u status=%#x sn=%#x wcid=%u "
   459						 "cnt=%u rate=%#x flag=%#x tid=%u pwr=%u "
   460						 "rsp_rate=%#x rate_idx=%u bw=%u flush=%#x "
   461						 "delay=%#x ts=%#x flags=%#x\n",
   462						 evt->pid, evt->status,
   463						 le16_to_cpu(evt->seq), evt->wcid,
   464						 evt->tx_count, le16_to_cpu(evt->tx_rate),
   465						 evt->flag, evt->tid, evt->tx_pwr,
   466						 evt->rsp_rate, evt->rate_tbl_idx,
   467						 evt->bw, evt->flush_reason,
   468						 le32_to_cpu(evt->tx_delay),
   469						 le32_to_cpu(evt->timestamp),
   470						 le32_to_cpu(evt->applied_flags));
   471				}
   472				mt7928_mac_add_txs_msg(dev, evt);
   473				break;
   474			case UNI_EVENT_TX_DONE_RAW:
   475				txs = (struct mt7925_mcu_txs_event *)tlv->data;
   476				mt7925_mac_add_txs(dev, txs->data);
   477				break;
   478			default:
   479				break;
   480			}
   481			tlv_len -= le16_to_cpu(tlv->len);
   482			tlv = (struct tlv *)((char *)(tlv) + le16_to_cpu(tlv->len));
   483		}
   484	}
   485	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
