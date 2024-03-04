Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8482E19A
	for <oe-kbuild-all@lists.linux.dev>; Mon,  4 Mar 2024 00:10:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709511044; cv=none; b=SJRarQhJXuVzCk5AD3wO9W2Uvzs5URL6IWSAElN4nsKoq1tuebL6Nq29OIICwEUi0Q2nyQelrgwCEWRM4mBygRrqKdXratM8Lw8zDXuG6jR8954t2ddt2+QkXOHt3rCJ0Co8aazGhPLLnPLtovxyYe1Mxe0G2ON4DnyJRjBkcPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709511044; c=relaxed/simple;
	bh=JRdVk+a9Ye+XwSZ119qR/7/pU2o6DEq8Tf/+zNBZsLk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZWvWZHV/yo9/fF8DVjNzMjDV3KcQDRuAy9/0kUN1wKF2UkiQhuDmkwQLo21vMjlA3Z9d9AnNrvAqt8k1D1F7NhhvQwgIOzmS3oBc+ci7UEiT7ams2Yt5NC3WuaXsRGeukYh06sJMAGrN4IURoJShjzUxVUsWYbAWLH/PdriZcl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=D0dcjV0X; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="D0dcjV0X"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709511042; x=1741047042;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JRdVk+a9Ye+XwSZ119qR/7/pU2o6DEq8Tf/+zNBZsLk=;
  b=D0dcjV0XxFrYa6srQ8pflKEOXrvsUssqoScU40vKQyNZ0vW0MG0cDgbb
   k1VVBvBa/qNMtS9GCSSoRcSvcrhlT37ZwUxvPXemRtDzQxfw4Hf7lfvpW
   /KqxhwSFA89xEdJFjly6hB8V9eEFXqlyUDmSS3odUNqUJ8Tvsxss8q1Qr
   i2vYD/jtpO1xPHZ/oNGDH+JaiBxEea0NkK/mFNRnIgmbirWLwO6/EENMm
   y+n6iGTz3memdCRfGa6KeudEp1AUt+Xtrr3fdQpJfThhM52KcFkyLI2fX
   B2wvQDqwy5wupNMGzVKl5mQrxbXKcm7UVCQ7Pyxnu5YFn8MSB7bHL8/oR
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11002"; a="4112211"
X-IronPort-AV: E=Sophos;i="6.06,201,1705392000"; 
   d="scan'208";a="4112211"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2024 16:10:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,201,1705392000"; 
   d="scan'208";a="39810349"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 03 Mar 2024 16:10:34 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rgvua-0002CO-0U;
	Mon, 04 Mar 2024 00:10:32 +0000
Date: Mon, 4 Mar 2024 08:10:23 +0800
From: kernel test robot <lkp@intel.com>
To: jasperwang@tencent.com, kaixuxia@tencent.com, frankjpliu@tencent.com,
	kasong@tencent.com, sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: drivers/net/ethernet/broadcom/bnxt/bnxt.c:603:30: sparse: sparse:
 incorrect type in assignment (different address spaces)
Message-ID: <202403040808.vCNKRzXl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git linux-5.4/lts/5.4.119-20.0009
head:   3bf5c3f6e32e9cfe13f09bac3ae93b8e39d472c1
commit: 3218a487da04a90ebaac8870a044d48e293215de net: update bnxt_en driver
date:   3 years ago
config: x86_64-randconfig-121-20240303 (https://download.01.org/0day-ci/archive/20240304/202403040808.vCNKRzXl-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240304/202403040808.vCNKRzXl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403040808.vCNKRzXl-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/net/ethernet/broadcom/bnxt/bnxt.c:603:30: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void [noderef] <asn:2> *doorbell @@     got void * @@
   drivers/net/ethernet/broadcom/bnxt/bnxt.c:603:30: sparse:     expected void [noderef] <asn:2> *doorbell
   drivers/net/ethernet/broadcom/bnxt/bnxt.c:603:30: sparse:     got void *
>> drivers/net/ethernet/broadcom/bnxt/bnxt.c:604:34: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void [noderef] <asn:2> *tx_push_wcb @@     got void * @@
   drivers/net/ethernet/broadcom/bnxt/bnxt.c:604:34: sparse:     expected void [noderef] <asn:2> *tx_push_wcb
   drivers/net/ethernet/broadcom/bnxt/bnxt.c:604:34: sparse:     got void *
>> drivers/net/ethernet/broadcom/bnxt/bnxt.c:1178:19: sparse: sparse: symbol 'bnxt_get_agg' was not declared. Should it be static?
>> drivers/net/ethernet/broadcom/bnxt/bnxt.c:1189:19: sparse: sparse: symbol 'bnxt_get_tpa_agg_p5' was not declared. Should it be static?
>> drivers/net/ethernet/broadcom/bnxt/bnxt.c:2331:58: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected unsigned int [usertype] pkt_ts @@     got restricted __le32 [usertype] rx_cmp_unused3 @@
   drivers/net/ethernet/broadcom/bnxt/bnxt.c:2331:58: sparse:     expected unsigned int [usertype] pkt_ts
   drivers/net/ethernet/broadcom/bnxt/bnxt.c:2331:58: sparse:     got restricted __le32 [usertype] rx_cmp_unused3
>> drivers/net/ethernet/broadcom/bnxt/bnxt.c:5382:31: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [usertype] l2_ivlan @@     got unsigned short [usertype] vlan @@
   drivers/net/ethernet/broadcom/bnxt/bnxt.c:5382:31: sparse:     expected restricted __le16 [usertype] l2_ivlan
   drivers/net/ethernet/broadcom/bnxt/bnxt.c:5382:31: sparse:     got unsigned short [usertype] vlan
>> drivers/net/ethernet/broadcom/bnxt/bnxt.c:5383:36: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [usertype] l2_ivlan_mask @@     got int @@
   drivers/net/ethernet/broadcom/bnxt/bnxt.c:5383:36: sparse:     expected restricted __le16 [usertype] l2_ivlan_mask
   drivers/net/ethernet/broadcom/bnxt/bnxt.c:5383:36: sparse:     got int
>> drivers/net/ethernet/broadcom/bnxt/bnxt.c:8485:25: sparse: sparse: cast to restricted __le32
>> drivers/net/ethernet/broadcom/bnxt/bnxt.c:10884:6: sparse: sparse: symbol '__bnxt_close_nic' was not declared. Should it be static?
   drivers/net/ethernet/broadcom/bnxt/bnxt.c:10987:24: sparse: sparse: cast to restricted __le32
>> drivers/net/ethernet/broadcom/bnxt/bnxt.c:10987:24: sparse: sparse: cast from restricted __le16
>> drivers/net/ethernet/broadcom/bnxt/bnxt.c:11660:23: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] @@     got restricted __le32 [usertype] producer_index @@
   drivers/net/ethernet/broadcom/bnxt/bnxt.c:11660:23: sparse:     expected unsigned int [usertype]
   drivers/net/ethernet/broadcom/bnxt/bnxt.c:11660:23: sparse:     got restricted __le32 [usertype] producer_index
>> drivers/net/ethernet/broadcom/bnxt/bnxt.c:11661:23: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] @@     got restricted __le32 [usertype] consumer_index @@
   drivers/net/ethernet/broadcom/bnxt/bnxt.c:11661:23: sparse:     expected unsigned int [usertype]
   drivers/net/ethernet/broadcom/bnxt/bnxt.c:11661:23: sparse:     got restricted __le32 [usertype] consumer_index
--
>> drivers/net/ethernet/broadcom/bnxt/bnxt_ethtool.c:1231:28: sparse: sparse: cast from restricted __be16
>> drivers/net/ethernet/broadcom/bnxt/bnxt_ethtool.c:1231:26: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short [addressable] [assigned] [usertype] vlan @@     got restricted __be16 [usertype] @@
   drivers/net/ethernet/broadcom/bnxt/bnxt_ethtool.c:1231:26: sparse:     expected unsigned short [addressable] [assigned] [usertype] vlan
   drivers/net/ethernet/broadcom/bnxt/bnxt_ethtool.c:1231:26: sparse:     got restricted __be16 [usertype]
>> drivers/net/ethernet/broadcom/bnxt/bnxt_ethtool.c:4314:32: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] flags @@     got unsigned char [usertype] compress_flags @@
   drivers/net/ethernet/broadcom/bnxt/bnxt_ethtool.c:4314:32: sparse:     expected restricted __le32 [usertype] flags
   drivers/net/ethernet/broadcom/bnxt/bnxt_ethtool.c:4314:32: sparse:     got unsigned char [usertype] compress_flags
--
>> drivers/net/ethernet/broadcom/bnxt/bnxt_sriov.c:158:39: sparse: sparse: cast from restricted __le16
>> drivers/net/ethernet/broadcom/bnxt/bnxt_sriov.c:158:37: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short [usertype] func_qcfg_flags @@     got restricted __le16 [usertype] @@
   drivers/net/ethernet/broadcom/bnxt/bnxt_sriov.c:158:37: sparse:     expected unsigned short [usertype] func_qcfg_flags
   drivers/net/ethernet/broadcom/bnxt/bnxt_sriov.c:158:37: sparse:     got restricted __le16 [usertype]
>> drivers/net/ethernet/broadcom/bnxt/bnxt_sriov.c:595:12: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct bnxt_vf_info *vf @@     got struct bnxt_vf_info [noderef] <asn:4> * @@
   drivers/net/ethernet/broadcom/bnxt/bnxt_sriov.c:595:12: sparse:     expected struct bnxt_vf_info *vf
   drivers/net/ethernet/broadcom/bnxt/bnxt_sriov.c:595:12: sparse:     got struct bnxt_vf_info [noderef] <asn:4> *
   drivers/net/ethernet/broadcom/bnxt/bnxt_sriov.c:666:20: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct bnxt_vf_info *vf @@     got struct bnxt_vf_info [noderef] <asn:4> * @@
   drivers/net/ethernet/broadcom/bnxt/bnxt_sriov.c:666:20: sparse:     expected struct bnxt_vf_info *vf
   drivers/net/ethernet/broadcom/bnxt/bnxt_sriov.c:666:20: sparse:     got struct bnxt_vf_info [noderef] <asn:4> *
>> drivers/net/ethernet/broadcom/bnxt/bnxt_sriov.c:700:21: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const * @@     got struct bnxt_vf_info [noderef] <asn:4> *vf @@
   drivers/net/ethernet/broadcom/bnxt/bnxt_sriov.c:700:21: sparse:     expected void const *
   drivers/net/ethernet/broadcom/bnxt/bnxt_sriov.c:700:21: sparse:     got struct bnxt_vf_info [noderef] <asn:4> *vf
>> drivers/net/ethernet/broadcom/bnxt/bnxt_sriov.c:750:61: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct bnxt_vf_info *vf @@     got struct bnxt_vf_info [noderef] <asn:4> * @@
   drivers/net/ethernet/broadcom/bnxt/bnxt_sriov.c:750:61: sparse:     expected struct bnxt_vf_info *vf
   drivers/net/ethernet/broadcom/bnxt/bnxt_sriov.c:750:61: sparse:     got struct bnxt_vf_info [noderef] <asn:4> *
   drivers/net/ethernet/broadcom/bnxt/bnxt_sriov.c:799:12: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct bnxt_vf_info *vf @@     got struct bnxt_vf_info [noderef] <asn:4> * @@
   drivers/net/ethernet/broadcom/bnxt/bnxt_sriov.c:799:12: sparse:     expected struct bnxt_vf_info *vf
   drivers/net/ethernet/broadcom/bnxt/bnxt_sriov.c:799:12: sparse:     got struct bnxt_vf_info [noderef] <asn:4> *
>> drivers/net/ethernet/broadcom/bnxt/bnxt_sriov.c:901:31: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [usertype] max_msix @@     got int @@
   drivers/net/ethernet/broadcom/bnxt/bnxt_sriov.c:901:31: sparse:     expected restricted __le16 [usertype] max_msix
   drivers/net/ethernet/broadcom/bnxt/bnxt_sriov.c:901:31: sparse:     got int
   drivers/net/ethernet/broadcom/bnxt/bnxt_sriov.c:905:50: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct bnxt_vf_info *vf @@     got struct bnxt_vf_info [noderef] <asn:4> * @@
   drivers/net/ethernet/broadcom/bnxt/bnxt_sriov.c:905:50: sparse:     expected struct bnxt_vf_info *vf
   drivers/net/ethernet/broadcom/bnxt/bnxt_sriov.c:905:50: sparse:     got struct bnxt_vf_info [noderef] <asn:4> *
   drivers/net/ethernet/broadcom/bnxt/bnxt_sriov.c:1021:50: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct bnxt_vf_info *vf @@     got struct bnxt_vf_info [noderef] <asn:4> * @@
   drivers/net/ethernet/broadcom/bnxt/bnxt_sriov.c:1021:50: sparse:     expected struct bnxt_vf_info *vf
   drivers/net/ethernet/broadcom/bnxt/bnxt_sriov.c:1021:50: sparse:     got struct bnxt_vf_info [noderef] <asn:4> *
>> drivers/net/ethernet/broadcom/bnxt/bnxt_sriov.c:1555:19: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [assigned] [usertype] IANA @@     got int @@
   drivers/net/ethernet/broadcom/bnxt/bnxt_sriov.c:1555:19: sparse:     expected restricted __le32 [assigned] [usertype] IANA
   drivers/net/ethernet/broadcom/bnxt/bnxt_sriov.c:1555:19: sparse:     got int
   drivers/net/ethernet/broadcom/bnxt/bnxt_sriov.c:1556:25: sparse: sparse: cast from restricted __le16
>> drivers/net/ethernet/broadcom/bnxt/bnxt_sriov.c:1614:56: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct bnxt_vf_info *vf @@     got struct bnxt_vf_info [noderef] <asn:4> * @@
   drivers/net/ethernet/broadcom/bnxt/bnxt_sriov.c:1614:56: sparse:     expected struct bnxt_vf_info *vf
   drivers/net/ethernet/broadcom/bnxt/bnxt_sriov.c:1614:56: sparse:     got struct bnxt_vf_info [noderef] <asn:4> *
   drivers/net/ethernet/broadcom/bnxt/bnxt_sriov.c:60:28: sparse: sparse: context imbalance in 'bnxt_vf_ndo_prep' - wrong count at exit
   drivers/net/ethernet/broadcom/bnxt/bnxt_sriov.c:90:13: sparse: sparse: context imbalance in 'bnxt_vf_ndo_end' - wrong count at exit
   drivers/net/ethernet/broadcom/bnxt/bnxt_sriov.c:97:5: sparse: sparse: context imbalance in 'bnxt_set_vf_spoofchk' - different lock contexts for basic block
   drivers/net/ethernet/broadcom/bnxt/bnxt_sriov.c:193:5: sparse: sparse: context imbalance in 'bnxt_set_vf_trust' - wrong count at exit
   drivers/net/ethernet/broadcom/bnxt/bnxt_sriov.c:385:5: sparse: sparse: context imbalance in 'bnxt_get_vf_config' - wrong count at exit
   drivers/net/ethernet/broadcom/bnxt/bnxt_sriov.c:437:5: sparse: sparse: context imbalance in 'bnxt_set_vf_mac' - wrong count at exit
   drivers/net/ethernet/broadcom/bnxt/bnxt_sriov.c:472:5: sparse: sparse: context imbalance in 'bnxt_set_vf_vlan' - different lock contexts for basic block
   drivers/net/ethernet/broadcom/bnxt/bnxt_sriov.c:524:5: sparse: sparse: context imbalance in 'bnxt_set_vf_bw' - wrong count at exit
   drivers/net/ethernet/broadcom/bnxt/bnxt_sriov.c:619:5: sparse: sparse: context imbalance in 'bnxt_set_vf_link_state' - wrong count at exit
--
>> drivers/net/ethernet/broadcom/bnxt/bnxt_vfr.c:85:18: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [usertype] fid @@     got unsigned short [noderef] [usertype] <asn:4> fw_fid @@
   drivers/net/ethernet/broadcom/bnxt/bnxt_vfr.c:85:18: sparse:     expected restricted __le16 [usertype] fid
   drivers/net/ethernet/broadcom/bnxt/bnxt_vfr.c:85:18: sparse:     got unsigned short [noderef] [usertype] <asn:4> fw_fid
>> drivers/net/ethernet/broadcom/bnxt/bnxt_vfr.c:163:31: sparse: sparse: dereference of noderef expression
--
   drivers/net/ethernet/broadcom/bnxt/bnxt_tc.c: note: in included file:
>> drivers/net/ethernet/broadcom/bnxt/bnxt_vfr.h:28:25: sparse: sparse: dereference of noderef expression
>> drivers/net/ethernet/broadcom/bnxt/bnxt_tc.c:2564:30: sparse: sparse: dereference of noderef expression
   drivers/net/ethernet/broadcom/bnxt/bnxt_tc.c:2581:22: sparse: sparse: dereference of noderef expression
   drivers/net/ethernet/broadcom/bnxt/bnxt_tc.c:2585:18: sparse: sparse: dereference of noderef expression
>> drivers/net/ethernet/broadcom/bnxt/bnxt_tc.c:2564:30: sparse: sparse: dereference of noderef expression
   drivers/net/ethernet/broadcom/bnxt/bnxt_tc.c:2608:22: sparse: sparse: dereference of noderef expression
   drivers/net/ethernet/broadcom/bnxt/bnxt_tc.c:2608:53: sparse: sparse: dereference of noderef expression
   drivers/net/ethernet/broadcom/bnxt/bnxt_tc.c:2630:18: sparse: sparse: dereference of noderef expression
--
>> drivers/net/ethernet/broadcom/bnxt/bnxt_lfc.c:77:23: sparse: sparse: symbol 'lfc_device_notifier' was not declared. Should it be static?
>> drivers/net/ethernet/broadcom/bnxt/bnxt_lfc.c:886:5: sparse: sparse: symbol 'bnxt_eem_dmabuf_export_fd' was not declared. Should it be static?
--
>> drivers/net/ethernet/broadcom/bnxt/bnxt_netlink.c:129:14: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected unsigned short [usertype] req_type @@     got restricted __le16 [usertype] req_type @@
   drivers/net/ethernet/broadcom/bnxt/bnxt_netlink.c:129:14: sparse:     expected unsigned short [usertype] req_type
   drivers/net/ethernet/broadcom/bnxt/bnxt_netlink.c:129:14: sparse:     got restricted __le16 [usertype] req_type
>> drivers/net/ethernet/broadcom/bnxt/bnxt_netlink.c:152:52: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected int attrlen @@     got restricted __le16 [usertype] resp_len @@
   drivers/net/ethernet/broadcom/bnxt/bnxt_netlink.c:152:52: sparse:     expected int attrlen
   drivers/net/ethernet/broadcom/bnxt/bnxt_netlink.c:152:52: sparse:     got restricted __le16 [usertype] resp_len

vim +603 drivers/net/ethernet/broadcom/bnxt/bnxt.c

   509	
   510	static int bnxt_push_xmit_p5(struct bnxt *bp, struct bnxt_tx_ring_info *txr,
   511				     struct netdev_queue *txq, struct sk_buff *skb,
   512				     u32 vlan_tag_flags, u32 cfa_action)
   513	{
   514		struct bnxt_db_info *db = &txr->tx_push_db;
   515		struct bnxt_sw_tx_bd *tx_buf;
   516		struct tx_bd_ext *txbd1;
   517		int i, push_len, bds;
   518		u16 prod, last_frag;
   519		unsigned int length;
   520		struct tx_bd *txbd;
   521		void *pdata;
   522		u64 *end;
   523		u32 len;
   524	
   525		if (unlikely(!db->doorbell))
   526			return -EOPNOTSUPP;
   527	
   528		length = skb->len;
   529		push_len = TX_PUSH_LEN(length);
   530		len = skb_headlen(skb);
   531		prod = txr->tx_prod;
   532	
   533		bds = TX_INLINE_BDS(push_len);
   534		if (bds > (TX_DESC_CNT - TX_IDX(prod)))
   535			return -E2BIG;
   536	
   537		txbd = &txr->tx_desc_ring[TX_RING(prod)][TX_IDX(prod)];
   538		tx_buf = &txr->tx_buf_ring[RING_TX(prod)];
   539		last_frag = skb_shinfo(skb)->nr_frags;
   540	
   541		/* Set COAL_NOW to be ready quickly for the next push */
   542		txbd->tx_bd_len_flags_type =
   543			cpu_to_le32((length << TX_BD_LEN_SHIFT) |
   544				    TX_BD_TYPE_LONG_TX_BD_INLINE |
   545				    TX_BD_FLAGS_LHINT_512_AND_SMALLER |
   546				    TX_BD_FLAGS_COAL_NOW | TX_BD_FLAGS_PACKET_END |
   547				    (bds << TX_BD_FLAGS_BD_CNT_SHIFT));
   548		txbd->tx_bd_opaque = prod;
   549		txbd->tx_bd_haddr = cpu_to_le64(0);
   550		txbd1 = (struct tx_bd_ext *) (txbd + 1);
   551	
   552		if (skb->ip_summed == CHECKSUM_PARTIAL)
   553			txbd1->tx_bd_hsize_lflags =
   554					cpu_to_le32(TX_BD_FLAGS_TCP_UDP_CHKSUM);
   555		else
   556			txbd1->tx_bd_hsize_lflags = 0;
   557	
   558		txbd1->tx_bd_mss = cpu_to_le32(0);
   559		txbd1->tx_bd_cfa_meta = cpu_to_le32(vlan_tag_flags);
   560		txbd1->tx_bd_cfa_action =
   561			cpu_to_le32(cfa_action << TX_BD_CFA_ACTION_SHIFT);
   562	
   563		pdata = txbd1 + 1;
   564		end = pdata + length;
   565		end = PTR_ALIGN(end, 8) - 1;
   566		*end = 0;
   567	
   568		skb_copy_from_linear_data(skb, pdata, len);
   569		pdata += len;
   570		for (i = 0; i < last_frag; i++) {
   571			skb_frag_t *frag = &skb_shinfo(skb)->frags[i];
   572			void *fptr;
   573	
   574			fptr = skb_frag_address_safe(frag);
   575			if (!fptr)
   576				return -EFAULT;
   577	
   578			memcpy(pdata, fptr, skb_frag_size(frag));
   579			pdata += skb_frag_size(frag);
   580		}
   581	
   582		txr->tx_prod = prod + bds;
   583	
   584		tx_buf->is_push = 1;
   585		tx_buf->inline_data_bds = bds - 2;
   586		netdev_tx_sent_queue(txq, length);
   587		wmb();	/* Sync is_push and byte queue before pushing data */
   588	
   589		push_len = DIV_ROUND_UP(push_len, 8);
   590	
   591		if (bp->tx_push_mode == BNXT_PUSH_MODE_WCB) {
   592			writeq(db->db_key64 | DBR_TYPE_PUSH_START |
   593			       DB_RING_IDX(db, prod), db->doorbell);
   594			__iowrite64_copy(txr->tx_push_wcb, txbd, push_len);
   595			writeq(db->db_key64 | DBR_TYPE_PUSH_END | DBR_PATH_L2 |
   596			       DB_RING_IDX(db, txr->tx_prod), db->doorbell);
   597		} else {
   598			bnxt_db_write_relaxed(bp, db, txr->tx_prod);
   599			writeq_relaxed(DB_PUSH_INFO(db, push_len, prod),
   600				       db->doorbell + sizeof(struct dbc_dbc));
   601			__iowrite64_copy(txr->tx_push_wcb, txbd, push_len);
   602			/* flip buffers */
 > 603			db->doorbell = (void *)((uintptr_t)db->doorbell ^ DB_PPP_SIZE);
 > 604			txr->tx_push_wcb = (void *)((uintptr_t)txr->tx_push_wcb ^ DB_PPP_SIZE);
   605		}
   606	
   607		return 0;
   608	}
   609	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
