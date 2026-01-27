Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6512C1D63E4
	for <oe-kbuild-all@lists.linux.dev>; Tue, 27 Jan 2026 00:36:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769474204; cv=none; b=KeHhzZNX6XFYzUXmY8FKK1K/h2Br+/VtRCDO+sbEc4/REvqIwHTI+lzz6/uPbgOcsWphh7NRc+0ZxMy3cSYEclOyjpd3Yx3UBfO41QLMD3zJ+12mnbMKSaBY9o+vndXa48MUP4HnwNzB9vw5WbT8VE6nXXCQNzQlJoTjMtIKINc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769474204; c=relaxed/simple;
	bh=52zjGz1Ke01vp+JOrIwffodOmOQr1D0rdBiN7aGOFf8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=XNPv4zFiYsvsmjbchW6qlxaCvpA8r//bhBW2DjyfnuJBs+5r38i5VgTktApMHHDM+4vea6eP53XVrFZ0n8m4M78RVRxLYNx5vvUrt+TS3Y+CYWWVLWBO4osi0tcpuN/A5pcctIt1Rg7j6H9DSJbfYgvE+pRK4ER82U+sddGp8c8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CQmX78RL; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CQmX78RL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769474202; x=1801010202;
  h=date:from:to:cc:subject:message-id;
  bh=52zjGz1Ke01vp+JOrIwffodOmOQr1D0rdBiN7aGOFf8=;
  b=CQmX78RLBz+XzSLEUNUTAIEcF/9ltgax52ksKp1gIeqRJrInE2xljjce
   UlG0nXJH+DgCbOXGbd0qByRDSgbPBECU03yVpfQ5+fx18vAaH1BlLvA1h
   z2kYtjPmh3+6/OvvY0Y4Hr5QhlBi4Km907LFARGd7ALU32wGQu/kjCh4d
   Gaor9BlEJ+dxClLBsNtCkqdJHJ78wryZL/04ON92z9g4h5D+6uqVddcqR
   gD5QpRxKaXXu9PfdpYTpVvxzNXzWwyO6GEcCByLu+nAMXhu1k7uSHagU3
   V5y9kvj8YvUM1RhI+r82hpqGfq4m8w4sVGTZKTzuyt+yKgc8fVM89KADx
   Q==;
X-CSE-ConnectionGUID: KN5YcOg5TdKeMIm45KweQA==
X-CSE-MsgGUID: G/+L8R33RFm0JaqVYM4vbQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11683"; a="82028036"
X-IronPort-AV: E=Sophos;i="6.21,256,1763452800"; 
   d="scan'208";a="82028036"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2026 16:36:41 -0800
X-CSE-ConnectionGUID: dzg7tok3Sgqljx+ZCvyTHw==
X-CSE-MsgGUID: +rmG+Y5OSwuKOTFxD1NE3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,256,1763452800"; 
   d="scan'208";a="207701752"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 26 Jan 2026 16:36:40 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vkX4Q-00000000Xnw-0Iqp;
	Tue, 27 Jan 2026 00:36:38 +0000
Date: Tue, 27 Jan 2026 08:36:21 +0800
From: kernel test robot <lkp@intel.com>
To: Ido Schimmel <idosch@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev, Petr Machata <petrm@nvidia.com>
Subject: [jpirko-mlxsw:combined_queue 10/10]
 drivers/message/fusion/mptlan.c:1177:21: sparse: sparse: cast to restricted
 __le16
Message-ID: <202601270833.btA1NTge-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/jpirko/linux_mlxsw combined_queue
head:   06ab0cafbab0b7f660ddbcbcbf3f7f9e3610260c
commit: 06ab0cafbab0b7f660ddbcbcbf3f7f9e3610260c [10/10] TMP: Revert "module: Add compile-time check for embedded NUL characters"
config: loongarch-randconfig-r122-20260127 (https://download.01.org/0day-ci/archive/20260127/202601270833.btA1NTge-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260127/202601270833.btA1NTge-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601270833.btA1NTge-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/message/fusion/mptlan.c:1177:21: sparse: sparse: cast to restricted __le16
>> drivers/message/fusion/mptlan.c:1240:52: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] TransactionContext @@     got restricted __le32 [usertype] @@
   drivers/message/fusion/mptlan.c:1240:52: sparse:     expected unsigned int [usertype] TransactionContext
   drivers/message/fusion/mptlan.c:1240:52: sparse:     got restricted __le32 [usertype]
>> drivers/message/fusion/mptlan.c:1244:46: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] FlagsLength @@     got restricted __le32 [usertype] @@
   drivers/message/fusion/mptlan.c:1244:46: sparse:     expected unsigned int [usertype] FlagsLength
   drivers/message/fusion/mptlan.c:1244:46: sparse:     got restricted __le32 [usertype]
>> drivers/message/fusion/mptlan.c:1248:46: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] Low @@     got restricted __le32 [usertype] @@
   drivers/message/fusion/mptlan.c:1248:46: sparse:     expected unsigned int [usertype] Low
   drivers/message/fusion/mptlan.c:1248:46: sparse:     got restricted __le32 [usertype]
>> drivers/message/fusion/mptlan.c:1250:55: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] High @@     got restricted __le32 [usertype] @@
   drivers/message/fusion/mptlan.c:1250:55: sparse:     expected unsigned int [usertype] High
   drivers/message/fusion/mptlan.c:1250:55: sparse:     got restricted __le32 [usertype]
>> drivers/message/fusion/mptlan.c:1264:38: sparse: sparse: invalid assignment: |=
   drivers/message/fusion/mptlan.c:1264:38: sparse:    left side has type unsigned int
   drivers/message/fusion/mptlan.c:1264:38: sparse:    right side has type restricted __le32
>> drivers/message/fusion/mptlan.c:1266:39: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] BucketCount @@     got restricted __le32 [usertype] @@
   drivers/message/fusion/mptlan.c:1266:39: sparse:     expected unsigned int [usertype] BucketCount
   drivers/message/fusion/mptlan.c:1266:39: sparse:     got restricted __le32 [usertype]
>> drivers/message/fusion/mptlan.c:969:25: sparse: sparse: cast to restricted __le32
   drivers/message/fusion/mptlan.c:974:9: sparse: sparse: cast to restricted __le16
   drivers/message/fusion/mptlan.c:977:14: sparse: sparse: cast to restricted __le16
   drivers/message/fusion/mptlan.c:981:15: sparse: sparse: cast to restricted __le32
   drivers/message/fusion/mptlan.c:986:17: sparse: sparse: cast to restricted __le16
   drivers/message/fusion/mptlan.c:991:18: sparse: sparse: cast to restricted __le32
   drivers/message/fusion/mptlan.c:995:18: sparse: sparse: cast to restricted __le32
   drivers/message/fusion/mptlan.c:1025:31: sparse: sparse: cast to restricted __le32
   drivers/message/fusion/mptlan.c:612:9: sparse: sparse: cast to restricted __le16
   drivers/message/fusion/mptlan.c:617:17: sparse: sparse: cast to restricted __le16
   drivers/message/fusion/mptlan.c:641:23: sparse: sparse: cast to restricted __le32
   drivers/message/fusion/mptlan.c:346:17: sparse: sparse: cast to restricted __le32
>> drivers/message/fusion/mptlan.c:1500:27: sparse: sparse: restricted __be16 degrades to integer
>> drivers/message/fusion/mptlan.c:1537:29: sparse: sparse: incorrect type in return expression (different base types) @@     expected unsigned short @@     got restricted __be16 [usertype] ethertype @@
   drivers/message/fusion/mptlan.c:1537:29: sparse:     expected unsigned short
   drivers/message/fusion/mptlan.c:1537:29: sparse:     got restricted __be16 [usertype] ethertype
>> drivers/message/fusion/mptlan.c:1540:16: sparse: sparse: incorrect type in return expression (different base types) @@     expected unsigned short @@     got restricted __be16 [usertype] @@
   drivers/message/fusion/mptlan.c:1540:16: sparse:     expected unsigned short
   drivers/message/fusion/mptlan.c:1540:16: sparse:     got restricted __be16 [usertype]
   drivers/message/fusion/mptlan.c:746:36: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] TransactionContext @@     got restricted __le32 [usertype] @@
   drivers/message/fusion/mptlan.c:746:36: sparse:     expected unsigned int [usertype] TransactionContext
   drivers/message/fusion/mptlan.c:746:36: sparse:     got restricted __le32 [usertype]
>> drivers/message/fusion/mptlan.c:754:39: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int @@     got restricted __le32 [usertype] @@
   drivers/message/fusion/mptlan.c:754:39: sparse:     expected unsigned int
   drivers/message/fusion/mptlan.c:754:39: sparse:     got restricted __le32 [usertype]
   drivers/message/fusion/mptlan.c:757:39: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int @@     got restricted __le32 [usertype] @@
   drivers/message/fusion/mptlan.c:757:39: sparse:     expected unsigned int
   drivers/message/fusion/mptlan.c:757:39: sparse:     got restricted __le32 [usertype]
   drivers/message/fusion/mptlan.c:767:30: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] FlagsLength @@     got restricted __le32 [usertype] @@
   drivers/message/fusion/mptlan.c:767:30: sparse:     expected unsigned int [usertype] FlagsLength
   drivers/message/fusion/mptlan.c:767:30: sparse:     got restricted __le32 [usertype]
   drivers/message/fusion/mptlan.c:776:30: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] Low @@     got restricted __le32 [usertype] @@
   drivers/message/fusion/mptlan.c:776:30: sparse:     expected unsigned int [usertype] Low
   drivers/message/fusion/mptlan.c:776:30: sparse:     got restricted __le32 [usertype]
   drivers/message/fusion/mptlan.c:778:39: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] High @@     got restricted __le32 [usertype] @@
   drivers/message/fusion/mptlan.c:778:39: sparse:     expected unsigned int [usertype] High
   drivers/message/fusion/mptlan.c:778:39: sparse:     got restricted __le32 [usertype]
   drivers/message/fusion/mptlan.c:785:9: sparse: sparse: cast to restricted __le32
>> drivers/message/fusion/mptlan.c:820:23: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __be16 [usertype] protocol @@     got unsigned short @@
   drivers/message/fusion/mptlan.c:820:23: sparse:     expected restricted __be16 [usertype] protocol
   drivers/message/fusion/mptlan.c:820:23: sparse:     got unsigned short
   drivers/message/fusion/mptlan.c:924:23: sparse: sparse: cast to restricted __le32

vim +1177 drivers/message/fusion/mptlan.c

^1da177e4c3f41 Linus Torvalds      2005-04-16  1139  
^1da177e4c3f41 Linus Torvalds      2005-04-16  1140  static void
c4028958b6ecad David Howells       2006-11-22  1141  mpt_lan_post_receive_buckets(struct mpt_lan_priv *priv)
^1da177e4c3f41 Linus Torvalds      2005-04-16  1142  {
c4028958b6ecad David Howells       2006-11-22  1143  	struct net_device *dev = priv->dev;
^1da177e4c3f41 Linus Torvalds      2005-04-16  1144  	MPT_ADAPTER *mpt_dev = priv->mpt_dev;
^1da177e4c3f41 Linus Torvalds      2005-04-16  1145  	MPT_FRAME_HDR *mf;
^1da177e4c3f41 Linus Torvalds      2005-04-16  1146  	LANReceivePostRequest_t *pRecvReq;
^1da177e4c3f41 Linus Torvalds      2005-04-16  1147  	SGETransaction32_t *pTrans;
^1da177e4c3f41 Linus Torvalds      2005-04-16  1148  	SGESimple64_t *pSimple;
^1da177e4c3f41 Linus Torvalds      2005-04-16  1149  	struct sk_buff *skb;
^1da177e4c3f41 Linus Torvalds      2005-04-16  1150  	dma_addr_t dma;
^1da177e4c3f41 Linus Torvalds      2005-04-16  1151  	u32 curr, buckets, count, max;
^1da177e4c3f41 Linus Torvalds      2005-04-16  1152  	u32 len = (dev->mtu + dev->hard_header_len + 4);
^1da177e4c3f41 Linus Torvalds      2005-04-16  1153  	unsigned long flags;
^1da177e4c3f41 Linus Torvalds      2005-04-16  1154  	int i;
^1da177e4c3f41 Linus Torvalds      2005-04-16  1155  
^1da177e4c3f41 Linus Torvalds      2005-04-16  1156  	curr = atomic_read(&priv->buckets_out);
^1da177e4c3f41 Linus Torvalds      2005-04-16  1157  	buckets = (priv->max_buckets_out - curr);
^1da177e4c3f41 Linus Torvalds      2005-04-16  1158  
^1da177e4c3f41 Linus Torvalds      2005-04-16  1159  	dioprintk((KERN_INFO MYNAM ": %s/%s: @%s, Start_buckets = %u, buckets_out = %u\n",
^1da177e4c3f41 Linus Torvalds      2005-04-16  1160  			IOC_AND_NETDEV_NAMES_s_s(dev),
cadbd4a5e36dde Harvey Harrison     2008-07-03  1161  			__func__, buckets, curr));
^1da177e4c3f41 Linus Torvalds      2005-04-16  1162  
^1da177e4c3f41 Linus Torvalds      2005-04-16  1163  	max = (mpt_dev->req_sz - MPT_LAN_RECEIVE_POST_REQUEST_SIZE) /
4e2e619f3c9e3c Gustavo A. R. Silva 2021-03-24  1164  			(sizeof(SGETransaction32_t) + sizeof(SGESimple64_t));
^1da177e4c3f41 Linus Torvalds      2005-04-16  1165  
^1da177e4c3f41 Linus Torvalds      2005-04-16  1166  	while (buckets) {
^1da177e4c3f41 Linus Torvalds      2005-04-16  1167  		mf = mpt_get_msg_frame(LanCtx, mpt_dev);
^1da177e4c3f41 Linus Torvalds      2005-04-16  1168  		if (mf == NULL) {
^1da177e4c3f41 Linus Torvalds      2005-04-16  1169  			printk (KERN_ERR "%s: Unable to alloc request frame\n",
cadbd4a5e36dde Harvey Harrison     2008-07-03  1170  				__func__);
^1da177e4c3f41 Linus Torvalds      2005-04-16  1171  			dioprintk((KERN_ERR "%s: %u buckets remaining\n",
cadbd4a5e36dde Harvey Harrison     2008-07-03  1172  				 __func__, buckets));
^1da177e4c3f41 Linus Torvalds      2005-04-16  1173  			goto out;
^1da177e4c3f41 Linus Torvalds      2005-04-16  1174  		}
^1da177e4c3f41 Linus Torvalds      2005-04-16  1175  		pRecvReq = (LANReceivePostRequest_t *) mf;
^1da177e4c3f41 Linus Torvalds      2005-04-16  1176  
e1fc2b5167f9c3 Eric Moore          2007-09-29 @1177  		i = le16_to_cpu(mf->u.frame.hwhdr.msgctxu.fld.req_idx);
e1fc2b5167f9c3 Eric Moore          2007-09-29  1178  		mpt_dev->RequestNB[i] = 0;
^1da177e4c3f41 Linus Torvalds      2005-04-16  1179  		count = buckets;
^1da177e4c3f41 Linus Torvalds      2005-04-16  1180  		if (count > max)
^1da177e4c3f41 Linus Torvalds      2005-04-16  1181  			count = max;
^1da177e4c3f41 Linus Torvalds      2005-04-16  1182  
^1da177e4c3f41 Linus Torvalds      2005-04-16  1183  		pRecvReq->Function    = MPI_FUNCTION_LAN_RECEIVE;
^1da177e4c3f41 Linus Torvalds      2005-04-16  1184  		pRecvReq->ChainOffset = 0;
^1da177e4c3f41 Linus Torvalds      2005-04-16  1185  		pRecvReq->MsgFlags    = 0;
^1da177e4c3f41 Linus Torvalds      2005-04-16  1186  		pRecvReq->PortNumber  = priv->pnum;
^1da177e4c3f41 Linus Torvalds      2005-04-16  1187  
^1da177e4c3f41 Linus Torvalds      2005-04-16  1188  		pTrans = (SGETransaction32_t *) pRecvReq->SG_List;
^1da177e4c3f41 Linus Torvalds      2005-04-16  1189  		pSimple = NULL;
^1da177e4c3f41 Linus Torvalds      2005-04-16  1190  
^1da177e4c3f41 Linus Torvalds      2005-04-16  1191  		for (i = 0; i < count; i++) {
^1da177e4c3f41 Linus Torvalds      2005-04-16  1192  			int ctx;
^1da177e4c3f41 Linus Torvalds      2005-04-16  1193  
^1da177e4c3f41 Linus Torvalds      2005-04-16  1194  			spin_lock_irqsave(&priv->rxfidx_lock, flags);
^1da177e4c3f41 Linus Torvalds      2005-04-16  1195  			if (priv->mpt_rxfidx_tail < 0) {
^1da177e4c3f41 Linus Torvalds      2005-04-16  1196  				printk (KERN_ERR "%s: Can't alloc context\n",
cadbd4a5e36dde Harvey Harrison     2008-07-03  1197  					__func__);
^1da177e4c3f41 Linus Torvalds      2005-04-16  1198  				spin_unlock_irqrestore(&priv->rxfidx_lock,
^1da177e4c3f41 Linus Torvalds      2005-04-16  1199  						       flags);
^1da177e4c3f41 Linus Torvalds      2005-04-16  1200  				break;
^1da177e4c3f41 Linus Torvalds      2005-04-16  1201  			}
^1da177e4c3f41 Linus Torvalds      2005-04-16  1202  
^1da177e4c3f41 Linus Torvalds      2005-04-16  1203  			ctx = priv->mpt_rxfidx[priv->mpt_rxfidx_tail--];
^1da177e4c3f41 Linus Torvalds      2005-04-16  1204  
^1da177e4c3f41 Linus Torvalds      2005-04-16  1205  			skb = priv->RcvCtl[ctx].skb;
^1da177e4c3f41 Linus Torvalds      2005-04-16  1206  			if (skb && (priv->RcvCtl[ctx].len != len)) {
b114dda6f2f10c Christophe JAILLET  2022-01-06  1207  				dma_unmap_single(&mpt_dev->pcidev->dev,
^1da177e4c3f41 Linus Torvalds      2005-04-16  1208  						 priv->RcvCtl[ctx].dma,
^1da177e4c3f41 Linus Torvalds      2005-04-16  1209  						 priv->RcvCtl[ctx].len,
b114dda6f2f10c Christophe JAILLET  2022-01-06  1210  						 DMA_FROM_DEVICE);
^1da177e4c3f41 Linus Torvalds      2005-04-16  1211  				dev_kfree_skb(priv->RcvCtl[ctx].skb);
^1da177e4c3f41 Linus Torvalds      2005-04-16  1212  				skb = priv->RcvCtl[ctx].skb = NULL;
^1da177e4c3f41 Linus Torvalds      2005-04-16  1213  			}
^1da177e4c3f41 Linus Torvalds      2005-04-16  1214  
^1da177e4c3f41 Linus Torvalds      2005-04-16  1215  			if (skb == NULL) {
^1da177e4c3f41 Linus Torvalds      2005-04-16  1216  				skb = dev_alloc_skb(len);
^1da177e4c3f41 Linus Torvalds      2005-04-16  1217  				if (skb == NULL) {
^1da177e4c3f41 Linus Torvalds      2005-04-16  1218  					printk (KERN_WARNING
^1da177e4c3f41 Linus Torvalds      2005-04-16  1219  						MYNAM "/%s: Can't alloc skb\n",
cadbd4a5e36dde Harvey Harrison     2008-07-03  1220  						__func__);
^1da177e4c3f41 Linus Torvalds      2005-04-16  1221  					priv->mpt_rxfidx[++priv->mpt_rxfidx_tail] = ctx;
^1da177e4c3f41 Linus Torvalds      2005-04-16  1222  					spin_unlock_irqrestore(&priv->rxfidx_lock, flags);
^1da177e4c3f41 Linus Torvalds      2005-04-16  1223  					break;
^1da177e4c3f41 Linus Torvalds      2005-04-16  1224  				}
^1da177e4c3f41 Linus Torvalds      2005-04-16  1225  
b114dda6f2f10c Christophe JAILLET  2022-01-06  1226  				dma = dma_map_single(&mpt_dev->pcidev->dev,
b114dda6f2f10c Christophe JAILLET  2022-01-06  1227  						     skb->data, len,
b114dda6f2f10c Christophe JAILLET  2022-01-06  1228  						     DMA_FROM_DEVICE);
^1da177e4c3f41 Linus Torvalds      2005-04-16  1229  
^1da177e4c3f41 Linus Torvalds      2005-04-16  1230  				priv->RcvCtl[ctx].skb = skb;
^1da177e4c3f41 Linus Torvalds      2005-04-16  1231  				priv->RcvCtl[ctx].dma = dma;
^1da177e4c3f41 Linus Torvalds      2005-04-16  1232  				priv->RcvCtl[ctx].len = len;
^1da177e4c3f41 Linus Torvalds      2005-04-16  1233  			}
^1da177e4c3f41 Linus Torvalds      2005-04-16  1234  
^1da177e4c3f41 Linus Torvalds      2005-04-16  1235  			spin_unlock_irqrestore(&priv->rxfidx_lock, flags);
^1da177e4c3f41 Linus Torvalds      2005-04-16  1236  
^1da177e4c3f41 Linus Torvalds      2005-04-16  1237  			pTrans->ContextSize   = sizeof(u32);
^1da177e4c3f41 Linus Torvalds      2005-04-16  1238  			pTrans->DetailsLength = 0;
^1da177e4c3f41 Linus Torvalds      2005-04-16  1239  			pTrans->Flags         = 0;
4e2e619f3c9e3c Gustavo A. R. Silva 2021-03-24 @1240  			pTrans->TransactionContext = cpu_to_le32(ctx);
^1da177e4c3f41 Linus Torvalds      2005-04-16  1241  
^1da177e4c3f41 Linus Torvalds      2005-04-16  1242  			pSimple = (SGESimple64_t *) pTrans->TransactionDetails;
^1da177e4c3f41 Linus Torvalds      2005-04-16  1243  
^1da177e4c3f41 Linus Torvalds      2005-04-16 @1244  			pSimple->FlagsLength = cpu_to_le32(
^1da177e4c3f41 Linus Torvalds      2005-04-16  1245  				((MPI_SGE_FLAGS_END_OF_BUFFER |
^1da177e4c3f41 Linus Torvalds      2005-04-16  1246  				  MPI_SGE_FLAGS_SIMPLE_ELEMENT |
^1da177e4c3f41 Linus Torvalds      2005-04-16  1247  				  MPI_SGE_FLAGS_64_BIT_ADDRESSING) << MPI_SGE_FLAGS_SHIFT) | len);
^1da177e4c3f41 Linus Torvalds      2005-04-16 @1248  			pSimple->Address.Low = cpu_to_le32((u32) priv->RcvCtl[ctx].dma);
^1da177e4c3f41 Linus Torvalds      2005-04-16  1249  			if (sizeof(dma_addr_t) > sizeof(u32))
^1da177e4c3f41 Linus Torvalds      2005-04-16 @1250  				pSimple->Address.High = cpu_to_le32((u32) ((u64) priv->RcvCtl[ctx].dma >> 32));
^1da177e4c3f41 Linus Torvalds      2005-04-16  1251  			else
^1da177e4c3f41 Linus Torvalds      2005-04-16  1252  				pSimple->Address.High = 0;
^1da177e4c3f41 Linus Torvalds      2005-04-16  1253  
^1da177e4c3f41 Linus Torvalds      2005-04-16  1254  			pTrans = (SGETransaction32_t *) (pSimple + 1);
^1da177e4c3f41 Linus Torvalds      2005-04-16  1255  		}
^1da177e4c3f41 Linus Torvalds      2005-04-16  1256  
^1da177e4c3f41 Linus Torvalds      2005-04-16  1257  		if (pSimple == NULL) {
^1da177e4c3f41 Linus Torvalds      2005-04-16  1258  /**/			printk (KERN_WARNING MYNAM "/%s: No buckets posted\n",
cadbd4a5e36dde Harvey Harrison     2008-07-03  1259  /**/				__func__);
^1da177e4c3f41 Linus Torvalds      2005-04-16  1260  			mpt_free_msg_frame(mpt_dev, mf);
^1da177e4c3f41 Linus Torvalds      2005-04-16  1261  			goto out;
^1da177e4c3f41 Linus Torvalds      2005-04-16  1262  		}
^1da177e4c3f41 Linus Torvalds      2005-04-16  1263  
^1da177e4c3f41 Linus Torvalds      2005-04-16 @1264  		pSimple->FlagsLength |= cpu_to_le32(MPI_SGE_FLAGS_END_OF_LIST << MPI_SGE_FLAGS_SHIFT);
^1da177e4c3f41 Linus Torvalds      2005-04-16  1265  
^1da177e4c3f41 Linus Torvalds      2005-04-16 @1266  		pRecvReq->BucketCount = cpu_to_le32(i);
^1da177e4c3f41 Linus Torvalds      2005-04-16  1267  

:::::: The code at line 1177 was first introduced by commit
:::::: e1fc2b5167f9c3614099e55d3f49763a26a5a339 [SCSI] mptlan: bug fix, only half the message frame is dma'd resulting in corruption

:::::: TO: Eric Moore <eric.moore@lsi.com>
:::::: CC: James Bottomley <jejb@mulgrave.localdomain>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
