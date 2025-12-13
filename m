Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A78D79CF
	for <oe-kbuild-all@lists.linux.dev>; Sat, 13 Dec 2025 09:02:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765616557; cv=none; b=dr3LyCV4RRLPTsvEBKWSjng0x6convUJ87yT0rbaXikkGuFyhqZyLbxgvyRmLRIomCcpE4vL2MGGHZ8EsdkRe/dyTpnwwL29MWUshXyfWmIZ0ATcGypRTmJbTOr1iZz4BN4T8t5HtXuXA+4PwgLNnVrDQjvI2Q1xT0irRrnSBcw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765616557; c=relaxed/simple;
	bh=vS6tc/T8dTwQa6gr8NKQnQGtg7CSf0EQY41SgFrgKYc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=eYcV5yXFSi3wZf1fV42dA1Ri+3Ux5EeB9lAeP8FRkI9EX/ga1gqJ5nFthjD/LfvO43Q6k3OAKICiy5LYro4I5DdTRG4mii+Tfy+XtSRVcDl4+vQiN/PDVZIXbC/SvWZlnpDVmk0uH5ZoqW+sLo223BC48G4sARuA3NCx4M3Cago=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SeqI5P7u; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SeqI5P7u"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765616554; x=1797152554;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vS6tc/T8dTwQa6gr8NKQnQGtg7CSf0EQY41SgFrgKYc=;
  b=SeqI5P7uHOcap78RTWglgaNdi8G27FbaNWDCfmDFUV/wWz0MGGFQ5QMt
   WQfzyKzlobXpqZnm061Jy2MIpH1AiuRHQ3OXxy/i8ivBJk21r5zvI26LA
   uVDx0XpCfupX+Y1g7nHAgwf/QJMnVZwHQYEXvybBKUhzNg6jW7BKyz3F6
   AfV+AfK9QoF/Yr26b0t13nydmp52CRsjYgik02DPNgbfEci3RahmiNgEW
   IyojcdGfBi+Ag1NYV+MTCCLvLQWBk+sKJQRgyoLe2GHH6p56Jt0COYCrh
   PoSfQgHJnDWTMc/3H0fnCaq/1MDomu75mF18lmn8lWpRYEAT7S8L7c6C3
   A==;
X-CSE-ConnectionGUID: p1dAeS02TKaoj5R7sbgW1A==
X-CSE-MsgGUID: yQKHPgpSTL25ldB9lSXdDw==
X-IronPort-AV: E=McAfee;i="6800,10657,11640"; a="66778407"
X-IronPort-AV: E=Sophos;i="6.21,146,1763452800"; 
   d="scan'208";a="66778407"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2025 01:02:24 -0800
X-CSE-ConnectionGUID: XfLJs/KzSsOg/+BcVadyuA==
X-CSE-MsgGUID: LJ1zmCV7TCe50EoxT32RcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,146,1763452800"; 
   d="scan'208";a="197282230"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 13 Dec 2025 01:02:23 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vULW8-000000007OE-1I8X;
	Sat, 13 Dec 2025 09:02:20 +0000
Date: Sat, 13 Dec 2025 17:02:14 +0800
From: kernel test robot <lkp@intel.com>
To: Tiwei Bie <tiwei.btw@antgroup.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Johannes Berg <johannes.berg@intel.com>
Subject: drivers/hwspinlock/stm32_hwspinlock.c:30:39: sparse: sparse:
 incorrect type in initializer (different address spaces)
Message-ID: <202512131607.OYx5Sxj6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   a859eca0e4cc96f63ff125dbe5388d961558b0e9
commit: a0e2cb6a90634f3dc80f16e882a683ee5761b0b0 um: Add VFIO-based virtual PCI driver
date:   7 months ago
config: um-randconfig-r111-20251213 (https://download.01.org/0day-ci/archive/20251213/202512131607.OYx5Sxj6-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251213/202512131607.OYx5Sxj6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512131607.OYx5Sxj6-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/hwspinlock/stm32_hwspinlock.c:30:39: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void [noderef] __iomem *lock_addr @@     got void *priv @@
   drivers/hwspinlock/stm32_hwspinlock.c:30:39: sparse:     expected void [noderef] __iomem *lock_addr
   drivers/hwspinlock/stm32_hwspinlock.c:30:39: sparse:     got void *priv
   drivers/hwspinlock/stm32_hwspinlock.c:41:39: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void [noderef] __iomem *lock_addr @@     got void *priv @@
   drivers/hwspinlock/stm32_hwspinlock.c:41:39: sparse:     expected void [noderef] __iomem *lock_addr
   drivers/hwspinlock/stm32_hwspinlock.c:41:39: sparse:     got void *priv
   drivers/hwspinlock/stm32_hwspinlock.c:110:39: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void *priv @@     got void [noderef] __iomem * @@
   drivers/hwspinlock/stm32_hwspinlock.c:110:39: sparse:     expected void *priv
   drivers/hwspinlock/stm32_hwspinlock.c:110:39: sparse:     got void [noderef] __iomem *
--
>> drivers/rpmsg/qcom_glink_smem.c:108:48: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/rpmsg/qcom_glink_smem.c:108:48: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/rpmsg/qcom_glink_smem.c:108:48: sparse:     got void *
>> drivers/rpmsg/qcom_glink_smem.c:111:47: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void *fifo @@
   drivers/rpmsg/qcom_glink_smem.c:111:47: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/rpmsg/qcom_glink_smem.c:111:47: sparse:     got void *fifo
--
   drivers/rpmsg/qcom_smd.c:510:53: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const [noderef] __iomem *src @@     got void * @@
   drivers/rpmsg/qcom_smd.c:510:53: sparse:     expected void const [noderef] __iomem *src
   drivers/rpmsg/qcom_smd.c:510:53: sparse:     got void *
>> drivers/rpmsg/qcom_smd.c:517:43: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const [noderef] __iomem *src @@     got void *rx_fifo @@
   drivers/rpmsg/qcom_smd.c:517:43: sparse:     expected void const [noderef] __iomem *src
   drivers/rpmsg/qcom_smd.c:517:43: sparse:     got void *rx_fifo
   drivers/rpmsg/qcom_smd.c:711:51: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void [noderef] __iomem *dst @@     got void * @@
   drivers/rpmsg/qcom_smd.c:711:51: sparse:     expected void [noderef] __iomem *dst
   drivers/rpmsg/qcom_smd.c:711:51: sparse:     got void *
>> drivers/rpmsg/qcom_smd.c:718:41: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void [noderef] __iomem *dst @@     got void *tx_fifo @@
   drivers/rpmsg/qcom_smd.c:718:41: sparse:     expected void [noderef] __iomem *dst
   drivers/rpmsg/qcom_smd.c:718:41: sparse:     got void *tx_fifo
--
   drivers/soc/qcom/smsm.c:159:32: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got unsigned int [usertype] *local_state @@
   drivers/soc/qcom/smsm.c:159:32: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/soc/qcom/smsm.c:159:32: sparse:     got unsigned int [usertype] *local_state
   drivers/soc/qcom/smsm.c:171:25: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got unsigned int [usertype] *local_state @@
   drivers/soc/qcom/smsm.c:171:25: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/soc/qcom/smsm.c:171:25: sparse:     got unsigned int [usertype] *local_state
   drivers/soc/qcom/smsm.c:181:48: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got unsigned int [usertype] * @@
   drivers/soc/qcom/smsm.c:181:48: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/soc/qcom/smsm.c:181:48: sparse:     got unsigned int [usertype] *
>> drivers/soc/qcom/smsm.c:219:26: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got unsigned int [usertype] *remote_state @@
   drivers/soc/qcom/smsm.c:219:26: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/soc/qcom/smsm.c:219:26: sparse:     got unsigned int [usertype] *remote_state
   drivers/soc/qcom/smsm.c:257:49: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got unsigned int [usertype] * @@
   drivers/soc/qcom/smsm.c:257:49: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/soc/qcom/smsm.c:257:49: sparse:     got unsigned int [usertype] *
   drivers/soc/qcom/smsm.c:259:49: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got unsigned int [usertype] * @@
   drivers/soc/qcom/smsm.c:259:49: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/soc/qcom/smsm.c:259:49: sparse:     got unsigned int [usertype] *
   drivers/soc/qcom/smsm.c:280:24: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got unsigned int [usertype] *remote_state @@
   drivers/soc/qcom/smsm.c:280:24: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/soc/qcom/smsm.c:280:24: sparse:     got unsigned int [usertype] *remote_state
   drivers/soc/qcom/smsm.c:288:49: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got unsigned int [usertype] * @@
   drivers/soc/qcom/smsm.c:288:49: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/soc/qcom/smsm.c:288:49: sparse:     got unsigned int [usertype] *
   drivers/soc/qcom/smsm.c:290:49: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got unsigned int [usertype] * @@
   drivers/soc/qcom/smsm.c:290:49: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/soc/qcom/smsm.c:290:49: sparse:     got unsigned int [usertype] *
   drivers/soc/qcom/smsm.c:330:26: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got unsigned int [usertype] *remote_state @@
   drivers/soc/qcom/smsm.c:330:26: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/soc/qcom/smsm.c:330:26: sparse:     got unsigned int [usertype] *remote_state
   drivers/soc/qcom/smsm.c:635:47: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got unsigned int [usertype] * @@
   drivers/soc/qcom/smsm.c:635:47: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/soc/qcom/smsm.c:635:47: sparse:     got unsigned int [usertype] *
--
>> drivers/usb/fotg210/fotg210-udc.c:681:33: sparse: sparse: restricted __le16 degrades to integer
   drivers/usb/fotg210/fotg210-udc.c:691:25: sparse: sparse: restricted __le16 degrades to integer
   drivers/usb/fotg210/fotg210-udc.c:747:29: sparse: sparse: restricted __le16 degrades to integer
--
>> drivers/usb/typec/ucsi/ucsi_glink.c:86:23: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] owner @@     got int @@
   drivers/usb/typec/ucsi/ucsi_glink.c:86:23: sparse:     expected restricted __le32 [usertype] owner
   drivers/usb/typec/ucsi/ucsi_glink.c:86:23: sparse:     got int
   drivers/usb/typec/ucsi/ucsi_glink.c:87:22: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] type @@     got int @@
   drivers/usb/typec/ucsi/ucsi_glink.c:87:22: sparse:     expected restricted __le32 [usertype] type
   drivers/usb/typec/ucsi/ucsi_glink.c:87:22: sparse:     got int
   drivers/usb/typec/ucsi/ucsi_glink.c:88:24: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] opcode @@     got int @@
   drivers/usb/typec/ucsi/ucsi_glink.c:88:24: sparse:     expected restricted __le32 [usertype] opcode
   drivers/usb/typec/ucsi/ucsi_glink.c:88:24: sparse:     got int
   drivers/usb/typec/ucsi/ucsi_glink.c:138:23: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] owner @@     got int @@
   drivers/usb/typec/ucsi/ucsi_glink.c:138:23: sparse:     expected restricted __le32 [usertype] owner
   drivers/usb/typec/ucsi/ucsi_glink.c:138:23: sparse:     got int
   drivers/usb/typec/ucsi/ucsi_glink.c:139:22: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] type @@     got int @@
   drivers/usb/typec/ucsi/ucsi_glink.c:139:22: sparse:     expected restricted __le32 [usertype] type
   drivers/usb/typec/ucsi/ucsi_glink.c:139:22: sparse:     got int
   drivers/usb/typec/ucsi/ucsi_glink.c:140:24: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] opcode @@     got int @@
   drivers/usb/typec/ucsi/ucsi_glink.c:140:24: sparse:     expected restricted __le32 [usertype] opcode
   drivers/usb/typec/ucsi/ucsi_glink.c:140:24: sparse:     got int
--
   drivers/gpu/drm/radeon/cik.c:1878:29: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/radeon/cik.c:1880:46: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/radeon/cik.c:1881:30: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/radeon/cik.c:1883:46: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/radeon/cik.c:3909:47: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/radeon/cik.c:3910:27: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/radeon/cik.c:3914:17: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/radeon/cik.c:3918:46: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/radeon/cik.c:3919:27: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/radeon/cik.c:3923:17: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/radeon/cik.c:3927:46: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/radeon/cik.c:3926:25: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 const [usertype] *[assigned] fw_data @@     got restricted __be32 const [usertype] * @@
   drivers/gpu/drm/radeon/cik.c:3926:25: sparse:     expected restricted __le32 const [usertype] *[assigned] fw_data
   drivers/gpu/drm/radeon/cik.c:3926:25: sparse:     got restricted __be32 const [usertype] *
   drivers/gpu/drm/radeon/cik.c:3928:27: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/radeon/cik.c:3932:17: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/radeon/cik.c:3933:17: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/radeon/cik.c:4265:47: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/radeon/cik.c:4266:27: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/radeon/cik.c:4270:17: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/radeon/cik.c:4279:34: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/radeon/cik.c:4280:35: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/radeon/cik.c:4284:25: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/radeon/cik.c:5943:47: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/radeon/cik.c:5947:24: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/radeon/cik.c:5951:17: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/radeon/cik.c:6433:62: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/radeon/cik.c:6434:48: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/radeon/cik.c:6435:46: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/radeon/cik.c:6439:63: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/radeon/cik.c:6440:48: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/radeon/cik.c:6441:46: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/radeon/cik.c:6445:62: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/radeon/cik.c:6446:48: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/radeon/cik.c:6447:46: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/radeon/cik.c:6451:63: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/radeon/cik.c:6452:48: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/radeon/cik.c:6453:46: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/radeon/cik.c:6457:64: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/radeon/cik.c:6458:48: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/radeon/cik.c:6459:46: sparse: sparse: cast to restricted __le32
>> drivers/gpu/drm/radeon/cik.c:6463:56: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int volatile [usertype] @@     got restricted __le32 [usertype] @@
   drivers/gpu/drm/radeon/cik.c:6463:56: sparse:     expected unsigned int volatile [usertype]
   drivers/gpu/drm/radeon/cik.c:6463:56: sparse:     got restricted __le32 [usertype]
   drivers/gpu/drm/radeon/cik.c:6486:56: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int volatile [usertype] @@     got restricted __le32 [usertype] @@
   drivers/gpu/drm/radeon/cik.c:6486:56: sparse:     expected unsigned int volatile [usertype]
   drivers/gpu/drm/radeon/cik.c:6486:56: sparse:     got restricted __le32 [usertype]
   drivers/gpu/drm/radeon/cik.c:6710:25: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int volatile [usertype] @@     got restricted __le32 [usertype] @@
   drivers/gpu/drm/radeon/cik.c:6710:25: sparse:     expected unsigned int volatile [usertype]
   drivers/gpu/drm/radeon/cik.c:6710:25: sparse:     got restricted __le32 [usertype]
   drivers/gpu/drm/radeon/cik.c:6711:25: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int volatile [usertype] @@     got restricted __le32 [usertype] @@
   drivers/gpu/drm/radeon/cik.c:6711:25: sparse:     expected unsigned int volatile [usertype]
   drivers/gpu/drm/radeon/cik.c:6711:25: sparse:     got restricted __le32 [usertype]
   drivers/gpu/drm/radeon/cik.c:6713:25: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int volatile [usertype] @@     got restricted __le32 [usertype] @@
   drivers/gpu/drm/radeon/cik.c:6713:25: sparse:     expected unsigned int volatile [usertype]
   drivers/gpu/drm/radeon/cik.c:6713:25: sparse:     got restricted __le32 [usertype]
   drivers/gpu/drm/radeon/cik.c:6714:25: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int volatile [usertype] @@     got restricted __le32 [usertype] @@
   drivers/gpu/drm/radeon/cik.c:6714:25: sparse:     expected unsigned int volatile [usertype]
   drivers/gpu/drm/radeon/cik.c:6714:25: sparse:     got restricted __le32 [usertype]
   drivers/gpu/drm/radeon/cik.c:6715:25: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int volatile [usertype] @@     got restricted __le32 [usertype] @@
   drivers/gpu/drm/radeon/cik.c:6715:25: sparse:     expected unsigned int volatile [usertype]
   drivers/gpu/drm/radeon/cik.c:6715:25: sparse:     got restricted __le32 [usertype]
   drivers/gpu/drm/radeon/cik.c:6720:49: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int volatile [usertype] @@     got restricted __le32 [usertype] @@
   drivers/gpu/drm/radeon/cik.c:6720:49: sparse:     expected unsigned int volatile [usertype]
   drivers/gpu/drm/radeon/cik.c:6720:49: sparse:     got restricted __le32 [usertype]
   drivers/gpu/drm/radeon/cik.c:6722:49: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int volatile [usertype] @@     got restricted __le32 [usertype] @@
   drivers/gpu/drm/radeon/cik.c:6722:49: sparse:     expected unsigned int volatile [usertype]
   drivers/gpu/drm/radeon/cik.c:6722:49: sparse:     got restricted __le32 [usertype]
   drivers/gpu/drm/radeon/cik.c:6724:57: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int volatile [usertype] @@     got restricted __le32 [usertype] @@
   drivers/gpu/drm/radeon/cik.c:6724:57: sparse:     expected unsigned int volatile [usertype]
   drivers/gpu/drm/radeon/cik.c:6724:57: sparse:     got restricted __le32 [usertype]
   drivers/gpu/drm/radeon/cik.c:6731:25: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int volatile [usertype] @@     got restricted __le32 [usertype] @@
   drivers/gpu/drm/radeon/cik.c:6731:25: sparse:     expected unsigned int volatile [usertype]
   drivers/gpu/drm/radeon/cik.c:6731:25: sparse:     got restricted __le32 [usertype]
   drivers/gpu/drm/radeon/cik.c:6732:25: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int volatile [usertype] @@     got restricted __le32 [usertype] @@
   drivers/gpu/drm/radeon/cik.c:6732:25: sparse:     expected unsigned int volatile [usertype]
   drivers/gpu/drm/radeon/cik.c:6732:25: sparse:     got restricted __le32 [usertype]
   drivers/gpu/drm/radeon/cik.c:6735:33: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int volatile [usertype] @@     got restricted __le32 [usertype] @@
   drivers/gpu/drm/radeon/cik.c:6735:33: sparse:     expected unsigned int volatile [usertype]
   drivers/gpu/drm/radeon/cik.c:6735:33: sparse:     got restricted __le32 [usertype]
   drivers/gpu/drm/radeon/cik.c:6736:33: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int volatile [usertype] @@     got restricted __le32 [usertype] @@
   drivers/gpu/drm/radeon/cik.c:6736:33: sparse:     expected unsigned int volatile [usertype]
   drivers/gpu/drm/radeon/cik.c:6736:33: sparse:     got restricted __le32 [usertype]
   drivers/gpu/drm/radeon/cik.c:6739:33: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int volatile [usertype] @@     got restricted __le32 [usertype] @@
   drivers/gpu/drm/radeon/cik.c:6739:33: sparse:     expected unsigned int volatile [usertype]
   drivers/gpu/drm/radeon/cik.c:6739:33: sparse:     got restricted __le32 [usertype]
   drivers/gpu/drm/radeon/cik.c:6740:33: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int volatile [usertype] @@     got restricted __le32 [usertype] @@
   drivers/gpu/drm/radeon/cik.c:6740:33: sparse:     expected unsigned int volatile [usertype]
   drivers/gpu/drm/radeon/cik.c:6740:33: sparse:     got restricted __le32 [usertype]
   drivers/gpu/drm/radeon/cik.c:6744:33: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int volatile [usertype] @@     got restricted __le32 [usertype] @@
   drivers/gpu/drm/radeon/cik.c:6744:33: sparse:     expected unsigned int volatile [usertype]
   drivers/gpu/drm/radeon/cik.c:6744:33: sparse:     got restricted __le32 [usertype]
   drivers/gpu/drm/radeon/cik.c:6745:33: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int volatile [usertype] @@     got restricted __le32 [usertype] @@
   drivers/gpu/drm/radeon/cik.c:6745:33: sparse:     expected unsigned int volatile [usertype]
   drivers/gpu/drm/radeon/cik.c:6745:33: sparse:     got restricted __le32 [usertype]
   drivers/gpu/drm/radeon/cik.c:6748:33: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int volatile [usertype] @@     got restricted __le32 [usertype] @@
   drivers/gpu/drm/radeon/cik.c:6748:33: sparse:     expected unsigned int volatile [usertype]
   drivers/gpu/drm/radeon/cik.c:6748:33: sparse:     got restricted __le32 [usertype]
   drivers/gpu/drm/radeon/cik.c:6749:33: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int volatile [usertype] @@     got restricted __le32 [usertype] @@
   drivers/gpu/drm/radeon/cik.c:6749:33: sparse:     expected unsigned int volatile [usertype]
   drivers/gpu/drm/radeon/cik.c:6749:33: sparse:     got restricted __le32 [usertype]
   drivers/gpu/drm/radeon/cik.c:6752:33: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int volatile [usertype] @@     got restricted __le32 [usertype] @@
   drivers/gpu/drm/radeon/cik.c:6752:33: sparse:     expected unsigned int volatile [usertype]
   drivers/gpu/drm/radeon/cik.c:6752:33: sparse:     got restricted __le32 [usertype]
   drivers/gpu/drm/radeon/cik.c:6753:33: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int volatile [usertype] @@     got restricted __le32 [usertype] @@
   drivers/gpu/drm/radeon/cik.c:6753:33: sparse:     expected unsigned int volatile [usertype]
   drivers/gpu/drm/radeon/cik.c:6753:33: sparse:     got restricted __le32 [usertype]
   drivers/gpu/drm/radeon/cik.c:6757:25: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int volatile [usertype] @@     got restricted __le32 [usertype] @@
   drivers/gpu/drm/radeon/cik.c:6757:25: sparse:     expected unsigned int volatile [usertype]
   drivers/gpu/drm/radeon/cik.c:6757:25: sparse:     got restricted __le32 [usertype]
   drivers/gpu/drm/radeon/cik.c:6758:25: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int volatile [usertype] @@     got restricted __le32 [usertype] @@
   drivers/gpu/drm/radeon/cik.c:6758:25: sparse:     expected unsigned int volatile [usertype]
   drivers/gpu/drm/radeon/cik.c:6758:25: sparse:     got restricted __le32 [usertype]
   drivers/gpu/drm/radeon/cik.c:6760:25: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int volatile [usertype] @@     got restricted __le32 [usertype] @@
   drivers/gpu/drm/radeon/cik.c:6760:25: sparse:     expected unsigned int volatile [usertype]
   drivers/gpu/drm/radeon/cik.c:6760:25: sparse:     got restricted __le32 [usertype]
   drivers/gpu/drm/radeon/cik.c:6761:25: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int volatile [usertype] @@     got restricted __le32 [usertype] @@
   drivers/gpu/drm/radeon/cik.c:6761:25: sparse:     expected unsigned int volatile [usertype]
   drivers/gpu/drm/radeon/cik.c:6761:25: sparse:     got restricted __le32 [usertype]
   drivers/gpu/drm/radeon/cik.c:7576:27: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/radeon/cik.c:7577:28: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/radeon/cik.c:7578:27: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/radeon/cik.c:7486:24: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/radeon/cik.c:7486:24: sparse: sparse: cast to restricted __le32
--
   drivers/gpu/drm/radeon/r100.c:713:16: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] @@     got restricted __le32 [usertype] @@
   drivers/gpu/drm/radeon/r100.c:713:16: sparse:     expected unsigned int [usertype]
   drivers/gpu/drm/radeon/r100.c:713:16: sparse:     got restricted __le32 [usertype]
>> drivers/gpu/drm/radeon/r100.c:1099:24: sparse: sparse: cast to restricted __le32
--
>> drivers/video/fbdev/mb862xx/mb862xxfb_accel.c:105:55: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] @@     got restricted __be32 [usertype] @@
   drivers/video/fbdev/mb862xx/mb862xxfb_accel.c:105:55: sparse:     expected unsigned int [usertype]
   drivers/video/fbdev/mb862xx/mb862xxfb_accel.c:105:55: sparse:     got restricted __be32 [usertype]

vim +30 drivers/hwspinlock/stm32_hwspinlock.c

f24fcff1d267da0 Benjamin Gaignard 2018-11-14  27  
f24fcff1d267da0 Benjamin Gaignard 2018-11-14  28  static int stm32_hwspinlock_trylock(struct hwspinlock *lock)
f24fcff1d267da0 Benjamin Gaignard 2018-11-14  29  {
f24fcff1d267da0 Benjamin Gaignard 2018-11-14 @30  	void __iomem *lock_addr = lock->priv;
f24fcff1d267da0 Benjamin Gaignard 2018-11-14  31  	u32 status;
f24fcff1d267da0 Benjamin Gaignard 2018-11-14  32  
f24fcff1d267da0 Benjamin Gaignard 2018-11-14  33  	writel(STM32_MUTEX_LOCK_BIT | STM32_MUTEX_COREID, lock_addr);
f24fcff1d267da0 Benjamin Gaignard 2018-11-14  34  	status = readl(lock_addr);
f24fcff1d267da0 Benjamin Gaignard 2018-11-14  35  
f24fcff1d267da0 Benjamin Gaignard 2018-11-14  36  	return status == (STM32_MUTEX_LOCK_BIT | STM32_MUTEX_COREID);
f24fcff1d267da0 Benjamin Gaignard 2018-11-14  37  }
f24fcff1d267da0 Benjamin Gaignard 2018-11-14  38  

:::::: The code at line 30 was first introduced by commit
:::::: f24fcff1d267da08c4bbb3869e7f4b36ce916b76 hwspinlock: add STM32 hwspinlock device

:::::: TO: Benjamin Gaignard <benjamin.gaignard@st.com>
:::::: CC: Bjorn Andersson <bjorn.andersson@linaro.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
