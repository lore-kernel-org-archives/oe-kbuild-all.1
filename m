Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68A1216F82B
	for <oe-kbuild-all@lists.linux.dev>; Fri, 31 May 2024 16:43:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717173785; cv=none; b=LwEiUy53rBEyHcFIJIopCg628Qdolk+WNV8EJ8iq7+0eZxjpuF3MPQAOFjNbZSRjiJXJj9oEsuKNzNVJrQblAYIzx6Fon3lsoZQJ5xVQP6L7hRwIH9Dy7wjZRkzryKfZnH+cj8d8QPhVTmXwLkjFF1+bYFLahCj2ACEi6yQq8mM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717173785; c=relaxed/simple;
	bh=Wcr20VooTMm+vS0jb6dxxpuIcVG0AJll5xMfGY/THTk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jW9TfoJcVkoOj+DE9drIGjRQgtAl2f1kyokdNNNrzUHOapktp5YinkwDIOScK2z235mRGKokf8RvVRmMZ8DcHzrw1GKhfS+mbbWARuOU36OoNvhII7vJaTPZsgc1Adwb+3PM2bW/1Y5hh1RemosgiYSc4r7ZS3xhYkm6b7SEdhQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FFkvFL2/; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FFkvFL2/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717173783; x=1748709783;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Wcr20VooTMm+vS0jb6dxxpuIcVG0AJll5xMfGY/THTk=;
  b=FFkvFL2/rTX85b0g3q8OJEYxyaNpzhQgW1ItZO0PaCL7AEyt7V3Ob3uX
   zOQvIrs6zJfMM+KFPWKPvrRvykW+2WBiWckDTUwv7PFcH1C4Mt3W2Sv3M
   iIDR20OMK4KAi87+DL9GZgT5k+8pazXq/OwHB00trbw7G5ot7KSMLHInB
   tYaNQgT4YVsiTp04tb2y/XMIwbNp1KKPWFL0Xekvgk3GOB7waiC3CrDX9
   rEllHV/0H1g0FirRHnlKw0p6kkCOcn5UEDUsoyXj0ypdVr31/2SwsA4R5
   mBAjjNB2MNPJfOV8ngy/Yo6GMzva0uUGdCdSAsvkH7XlUgRwkJTy4KT8Y
   Q==;
X-CSE-ConnectionGUID: iRlZ8VHORsqDeRC8uyJ3aQ==
X-CSE-MsgGUID: FBn90AAXRdeJfz9C61Gegw==
X-IronPort-AV: E=McAfee;i="6600,9927,11089"; a="13849036"
X-IronPort-AV: E=Sophos;i="6.08,204,1712646000"; 
   d="scan'208";a="13849036"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2024 09:43:03 -0700
X-CSE-ConnectionGUID: wft/6zXpS+KGVdjU0COACw==
X-CSE-MsgGUID: 31boE8VLTSyH/lNp2e1Wfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,204,1712646000"; 
   d="scan'208";a="36320814"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 31 May 2024 09:43:01 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sD5L5-000HMz-20;
	Fri, 31 May 2024 16:42:52 +0000
Date: Sat, 1 Jun 2024 00:40:31 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Chen Siyu <chensiyu1321@phytium.com.cn>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 21243/22626]
 drivers/net/can/phytium/phytium_can.c:366:28: sparse: sparse: incorrect type
 in argument 1 (different base types)
Message-ID: <202406010039.Hfpe41SX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   d2901c3f0ff7d121adf97d64bd2cc3789821600d
commit: db0908f0353219c48495233e71e676da2cefee44 [21243/22626] can: can controller driver for phytium CPUs
config: arm64-randconfig-r122-20240531 (https://download.01.org/0day-ci/archive/20240601/202406010039.Hfpe41SX-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20240601/202406010039.Hfpe41SX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406010039.Hfpe41SX-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/net/can/phytium/phytium_can.c:366:28: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected restricted __be32 const [usertype] *p @@     got unsigned int * @@
   drivers/net/can/phytium/phytium_can.c:366:28: sparse:     expected restricted __be32 const [usertype] *p
   drivers/net/can/phytium/phytium_can.c:366:28: sparse:     got unsigned int *
   drivers/net/can/phytium/phytium_can.c:370:37: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected restricted __be32 const [usertype] *p @@     got unsigned int * @@
   drivers/net/can/phytium/phytium_can.c:370:37: sparse:     expected restricted __be32 const [usertype] *p
   drivers/net/can/phytium/phytium_can.c:370:37: sparse:     got unsigned int *
>> drivers/net/can/phytium/phytium_can.c:436:51: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __be32 [usertype] @@     got unsigned int @@
   drivers/net/can/phytium/phytium_can.c:436:51: sparse:     expected restricted __be32 [usertype]
   drivers/net/can/phytium/phytium_can.c:436:51: sparse:     got unsigned int
>> drivers/net/can/phytium/phytium_can.c:568:31: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int @@     got restricted __be32 @@
   drivers/net/can/phytium/phytium_can.c:568:31: sparse:     expected unsigned int
   drivers/net/can/phytium/phytium_can.c:568:31: sparse:     got restricted __be32
   drivers/net/can/phytium/phytium_can.c:569:31: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int @@     got restricted __be32 @@
   drivers/net/can/phytium/phytium_can.c:569:31: sparse:     expected unsigned int
   drivers/net/can/phytium/phytium_can.c:569:31: sparse:     got restricted __be32
   drivers/net/can/phytium/phytium_can.c:601:31: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int @@     got restricted __be32 @@
   drivers/net/can/phytium/phytium_can.c:601:31: sparse:     expected unsigned int
   drivers/net/can/phytium/phytium_can.c:601:31: sparse:     got restricted __be32
>> drivers/net/can/phytium/phytium_can.c:612:43: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __be32 [usertype] @@
   drivers/net/can/phytium/phytium_can.c:612:43: sparse:     expected unsigned int [usertype] val
   drivers/net/can/phytium/phytium_can.c:612:43: sparse:     got restricted __be32 [usertype]
   drivers/net/can/phytium/phytium_can.c:1050: warning: Function parameter or member 'skb' not described in 'phytium_can_start_xmit'
   drivers/net/can/phytium/phytium_can.c:1050: warning: Function parameter or member 'dev' not described in 'phytium_can_start_xmit'

vim +366 drivers/net/can/phytium/phytium_can.c

   355	
   356	static int phytium_can_read_fifo(struct net_device *dev)
   357	{
   358		struct net_device_stats *stats = &dev->stats;
   359		struct phytium_can_dev *cdev = netdev_priv(dev);
   360		struct canfd_frame *cf;
   361		struct sk_buff *skb;
   362		u32 id, dlc, i;
   363	
   364		/* Read the frame header from FIFO */
   365		id = phytium_can_read(cdev, CAN_RX_FIFO);
 > 366		id = be32_to_cpup(&id);
   367		if (id & CAN_IDE_MASK) {
   368			/* Received an extended frame */
   369			dlc = phytium_can_read(cdev, CAN_RX_FIFO);
   370			dlc = be32_to_cpup(&dlc);
   371			if (dlc & CAN_ID2_FDF_MASK)
   372				skb = alloc_canfd_skb(dev, &cf);
   373			else
   374				skb = alloc_can_skb(dev, (struct can_frame **)&cf);
   375	
   376			if (unlikely(!skb)) {
   377				stats->rx_dropped++;
   378				return 0;
   379			}
   380	
   381			if (dlc & CAN_ID2_FDF_MASK) {
   382				/* CAN FD extended frame */
   383				if (dlc & CANFD_ID2_BRS_MASK)
   384					cf->flags |= CANFD_BRS;
   385				if (dlc & CANFD_ID2_ESI_MASK)
   386					cf->flags |= CANFD_ESI;
   387				cf->len = can_dlc2len((dlc & CANFD_ID2_DLC_MASK) >>
   388						CANFD_ID2_DLC_OFF);
   389			} else {
   390				/* CAN extended frame */
   391				cf->len = get_can_dlc((dlc & CAN_ID2_DLC_MASK) >>
   392						CAN_ID2_DLC_OFF);
   393			}
   394	
   395			cf->can_id = (id & CAN_ID1_MASK) >> 3;
   396			cf->can_id |= (id & CAN_ID2_MASK) >> 1;
   397			cf->can_id |= CAN_EFF_FLAG;
   398	
   399			if (id & CAN_ID2_RTR_MASK)
   400				cf->can_id |= CAN_RTR_FLAG;
   401		} else {
   402			/* Received a standard frame */
   403			if (id & CAN_ID1_FDF_MASK)
   404				skb = alloc_canfd_skb(dev, &cf);
   405			else
   406				skb = alloc_can_skb(dev, (struct can_frame **)&cf);
   407	
   408			if (unlikely(!skb)) {
   409				stats->rx_dropped++;
   410				return 0;
   411			}
   412	
   413			if (id & CAN_ID1_FDF_MASK) {
   414				/* CAN FD extended frame */
   415				if (id & CANFD_ID1_BRS_MASK)
   416					cf->flags |= CANFD_BRS;
   417				if (id & CANFD_ID1_ESI_MASK)
   418					cf->flags |= CANFD_ESI;
   419				cf->len = can_dlc2len((id & CANFD_ID1_DLC_MASK) >>
   420						CANFD_ID1_DLC_OFF);
   421			} else {
   422				/* CAN extended frame */
   423				cf->len = get_can_dlc((id & CAN_ID1_DLC_MASK) >>
   424						CAN_ID1_DLC_OFF);
   425			}
   426	
   427			cf->can_id = (id & CAN_ID1_MASK) >> 21;
   428	
   429			if (id & CAN_ID1_RTR_MASK)
   430				cf->can_id |= CAN_RTR_FLAG;
   431		}
   432	
   433		if (!(cf->can_id & CAN_RTR_FLAG))
   434			/* Receive data frames */
   435			for (i = 0; i < cf->len; i += 4)
 > 436				*(__be32 *)(cf->data + i) = phytium_can_read(cdev,
   437						CAN_RX_FIFO);
   438	
   439		stats->rx_packets++;
   440		stats->rx_bytes += cf->len;
   441		netif_receive_skb(skb);
   442	
   443		return 1;
   444	}
   445	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
