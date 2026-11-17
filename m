Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794933048;
	b=dv3kyrfcpRxXye2DvFSgxno2yH2WoRPIHL3JsXvWG+BV9ICoXOO+gbSvhrJ1q7CzTCDV
	 sKBRuOFBKd1QaGq2WZz7L+AwhdbnZy7i3BgySBfWQ5GdzB1ZJWJpUWPGd1Maf7g+tI8+e
	 n5n76ZcfrKosZxzOMheNolqfrn53O/yxPFYYExECJCcOv+M/pirbPYcZ4F1iBDgXRgRJY
	 aOzgXmDIC2qscPQC3W0/sms/tZkl0qDR2oLcXR6pZrje7eTCOjvDrSq4joG3C6/EEhesc
	 3H2y90lTzMTJwSfg7zN/PgJRTlj6/OPnuDOCDSdNmEGeepoQLtAcisxcCRhQeELa05g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794933048;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=bWwJVvvllQi1bVRABZh/BEGf/BAPJktRc+5PFvbO2NY=;
	b=l6Xw/w8mm7Qlh5xyQBlqbktYZoXQgeGcKjpOn+eXSKgMke2cCocuttfQt6G9WGFVkgAY
	 sZm7rZml9GaWWW6faaABhMDYcULimGf1Kax+5L4FkLXb79wTE1P670T9t/MwD/ld103RS
	 TAezBzMjmvucISJJLduPSYZgsaLOGyPal0EWcrqLVksFfunR9dQEZsVvBsLQnHTjk97cU
	 ZXvd8SYI+E2MEXk9YujjHlvUa/QYi1WIHK+3FG2yyena3lr/x0kxTvAhFOpG3yNom0xC9
	 8oNpUFjyr3Zow3Hr+VMeCh1fp07jEjMgFQudJP4Fy7CNuXGI0Xv6I7CpZeXcvUCAcHg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=abLLVPLs;
	arc=none smtp.remote-ip=198.175.65.16
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CEF6606A31C
	for <oe-kbuild-all@lists.linux.dev>; Tue, 17 Nov 2026 16:30:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8CEF6606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=abLLVPLs
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794933047; x=1826469047;
  h=date:from:to:cc:subject:message-id;
  bh=7zSSvo/YsAJpaba7CfIGBsZvv4st7r2dt8C761+aEkk=;
  b=abLLVPLsBz2oP7m9Nj2nlNzabjnj4MBbiW0aeqxTNK+mA4So4efNmrnU
   2NIq7hQ7ZsLPAddF4M1tLOagAJjUwi3ahYqh0C+b3/9G6Vl5K/t3dIYb1
   KYSsofkuPQdElS1k3kh9K5a56cU7EzNdn20u6uffi57JgxcMk65C91FmY
   xF0PoDGekbzKOjvcsPscmzyPa7q0DwSK1pl5t6h4EMx4a3r5T8uw65HJb
   Th36A2qUXKGQpUUc9aZYEiRBABGxGJdHjns6iTtHZ6WhS5VpEuMAcj71t
   vZmk3WlNydqkScoucPTzMToRj0YgDcXh9ILd7bArzdmd6A7TT2NJ/Hqoc
   w==;
X-CSE-ConnectionGUID: Ty9MbA+RQ2G/5g2KG4bRGw==
X-CSE-MsgGUID: 6UltqFSoRTqKV2W3UqyghA==
X-IronPort-AV: E=McAfee;i="6800,10657,11969"; a="3705926"
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="3705926"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2026 08:30:46 -0800
X-CSE-ConnectionGUID: wG/N5oLISNeIaI+ziN5iOg==
X-CSE-MsgGUID: lBKwn97FTQy+eRCJZdHWiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="9940462"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 17 Nov 2026 08:30:45 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xTM4w-0000000039y-3pos;
	Tue, 17 Nov 2026 16:30:42 +0000
Date: Tue, 17 Nov 2026 17:30:18 +0100
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18-p3s 22/22]
 drivers/net/ethernet/marvell/octeontx2/nic/cn10k_ipsec.c:954:13: error:
 implicit declaration of function 'xfrm_input_state'; did you mean
 'xfrm_init_state'?
Message-ID: <20261117172050.5s0U6IML-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

Hi Mike,

First bad commit (maybe != root cause):

tree:   https://android.googlesource.com/kernel/common android17-6.18-p3s
head:   5966612bfc8614d7e2cd447ea586ee426cb2f822
commit: 3e1da3739d68558bacc60ea5f469fbddaf529c32 [22/22] ANDROID: GKI: Add GKI_HIDDEN_XFRM_OFFLOAD_CONFIGS
config: arm64-randconfig-r2308-20261117 (https://download.01.org/0day-ci/archive/20261117/20261117172050.5s0U6IML-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.5.0
sparse: v0.6.5-rc1-21-g84ec0658
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261117/20261117172050.5s0U6IML-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/20261117172050.5s0U6IML-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/net/ethernet/marvell/octeontx2/nic/cn10k_ipsec.c:7:
   include/net/xfrm.h: In function 'xfrm_dst_offload_ok':
   include/net/xfrm.h:2088:35: error: 'struct dst_entry' has no member named 'xfrm'
    2088 |         struct xfrm_state *x = dst->xfrm;
         |                                   ^~
   include/net/xfrm.h:2095:51: error: 'struct dst_entry' has no member named 'xfrm'
    2095 |         if (!x->xso.offload_handle && !xdst->child->xfrm)
         |                                                   ^~
   include/net/xfrm.h:2098:25: error: 'struct dst_entry' has no member named 'xfrm'
    2098 |             !xdst->child->xfrm)
         |                         ^~
   drivers/net/ethernet/marvell/octeontx2/nic/cn10k_ipsec.c: In function 'cn10k_ipsec_transmit':
>> drivers/net/ethernet/marvell/octeontx2/nic/cn10k_ipsec.c:954:13: error: implicit declaration of function 'xfrm_input_state'; did you mean 'xfrm_init_state'? [-Werror=implicit-function-declaration]
     954 |         x = xfrm_input_state(skb);
         |             ^~~~~~~~~~~~~~~~
         |             xfrm_init_state
   drivers/net/ethernet/marvell/octeontx2/nic/cn10k_ipsec.c:954:11: warning: assignment to 'struct xfrm_state *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     954 |         x = xfrm_input_state(skb);
         |           ^
   cc1: some warnings being treated as errors

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for USB_PHY
   Depends on [n]: USB_SUPPORT [=n]
   Selected by [y]:
   - GKI_HIDDEN_USB_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_JACK_INPUT_DEV
   Depends on [n]: SOUND [=n] && SND [=n] && SND_JACK [=y]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for WEXT_PROC
   Depends on [n]: NET [=y] && WIRELESS [=n] && PROC_FS [=y] && WEXT_CORE [=y]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_ELD
   Depends on [n]: SOUND [=n] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for WEXT_PRIV
   Depends on [n]: NET [=y] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for BALLOON_COMPACTION
   Depends on [n]: COMPACTION [=n] && MEMORY_BALLOON [=y]
   Selected by [y]:
   - GKI_HIDDEN_MM_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_IEC958
   Depends on [n]: SOUND [=n] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_SOC_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for WIRELESS_EXT
   Depends on [n]: NET [=y] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for WEXT_CORE
   Depends on [n]: NET [=y] && WIRELESS [=n] && (CFG80211_WEXT [=n] || WIRELESS_EXT [=y])
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for SND_COMPRESS_ACCEL
   Depends on [n]: SOUND [=n] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_JACK
   Depends on [n]: SOUND [=n] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_VMASTER
   Depends on [n]: SOUND [=n] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for CAN_RX_OFFLOAD
   Depends on [n]: NETDEVICES [=y] && CAN_DEV [=y] && CAN_NETLINK [=n]
   Selected by [y]:
   - GKI_HIDDEN_MCP251XFD_CONFIGS [=y]


vim +954 drivers/net/ethernet/marvell/octeontx2/nic/cn10k_ipsec.c

6a77a158848a8c6 Bharat Bhushan 2024-12-04  929  
6a77a158848a8c6 Bharat Bhushan 2024-12-04  930  bool cn10k_ipsec_transmit(struct otx2_nic *pf, struct netdev_queue *txq,
6a77a158848a8c6 Bharat Bhushan 2024-12-04  931  			  struct otx2_snd_queue *sq, struct sk_buff *skb,
6a77a158848a8c6 Bharat Bhushan 2024-12-04  932  			  int num_segs, int size)
6a77a158848a8c6 Bharat Bhushan 2024-12-04  933  {
6a77a158848a8c6 Bharat Bhushan 2024-12-04  934  	struct cpt_inst_s inst;
6a77a158848a8c6 Bharat Bhushan 2024-12-04  935  	struct cpt_res_s *res;
6a77a158848a8c6 Bharat Bhushan 2024-12-04  936  	struct xfrm_state *x;
6a77a158848a8c6 Bharat Bhushan 2024-12-04  937  	struct qmem *sa_info;
6a77a158848a8c6 Bharat Bhushan 2024-12-04  938  	dma_addr_t dptr_iova;
6a77a158848a8c6 Bharat Bhushan 2024-12-04  939  	struct sec_path *sp;
6a77a158848a8c6 Bharat Bhushan 2024-12-04  940  	u8 encap_offset;
6a77a158848a8c6 Bharat Bhushan 2024-12-04  941  	u8 auth_offset;
6a77a158848a8c6 Bharat Bhushan 2024-12-04  942  	u8 gthr_size;
6a77a158848a8c6 Bharat Bhushan 2024-12-04  943  	u8 iv_offset;
6a77a158848a8c6 Bharat Bhushan 2024-12-04  944  	u16 dlen;
6a77a158848a8c6 Bharat Bhushan 2024-12-04  945  
6a77a158848a8c6 Bharat Bhushan 2024-12-04  946  	/* Check for IPSEC offload enabled */
6a77a158848a8c6 Bharat Bhushan 2024-12-04  947  	if (!(pf->flags & OTX2_FLAG_IPSEC_OFFLOAD_ENABLED))
6a77a158848a8c6 Bharat Bhushan 2024-12-04  948  		goto drop;
6a77a158848a8c6 Bharat Bhushan 2024-12-04  949  
6a77a158848a8c6 Bharat Bhushan 2024-12-04  950  	sp = skb_sec_path(skb);
6a77a158848a8c6 Bharat Bhushan 2024-12-04  951  	if (unlikely(!sp->len))
6a77a158848a8c6 Bharat Bhushan 2024-12-04  952  		goto drop;
6a77a158848a8c6 Bharat Bhushan 2024-12-04  953  
6a77a158848a8c6 Bharat Bhushan 2024-12-04 @954  	x = xfrm_input_state(skb);

:::::: The code at line 954 was first introduced by commit
:::::: 6a77a158848a8c68930df27b8840660db8531222 cn10k-ipsec: Process outbound ipsec crypto offload

:::::: TO: Bharat Bhushan <bbhushan2@marvell.com>
:::::: CC: David S. Miller <davem@davemloft.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
