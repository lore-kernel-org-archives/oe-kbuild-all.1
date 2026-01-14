Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9529831326A
	for <oe-kbuild-all@lists.linux.dev>; Wed, 14 Jan 2026 02:37:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768358227; cv=none; b=EuEVUDc+81QdYmEA/bg20iRGsHhwGQUF5Vc8d9qjJnK41Yz6f9MFkJpcT8nXP4fF9GMSLh+YLx/jKqkB0IY6oIix5ZRHVWxyAaFLghO/fhAOkzKqsKV7fKHHPJR/HnoBTTqKqK8gahYeUU0YVebsNI3Wr9uRVyQiMUEGg03bCPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768358227; c=relaxed/simple;
	bh=3FDnQELFL+jHmELDXTRkuqPVUWU/NRPPzC4fRah3/H0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=M2IXbj7N4um4yNHjrsBapZkslSVnXii9V/2FkzX+MV84SimZDNSfsHLklzXrxuX7r1DrHxLgMM8wZ/eoUpGfgIbOnTIYvOpbYDggFIvJlWxh4wDoi2NWiMQBstLIhsTcf7v4llIsct6gPMT4Fr6qKTR+hd/SEYV4aPriOYi9hJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FdnAJ7F+; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FdnAJ7F+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768358226; x=1799894226;
  h=date:from:to:cc:subject:message-id;
  bh=3FDnQELFL+jHmELDXTRkuqPVUWU/NRPPzC4fRah3/H0=;
  b=FdnAJ7F+ThoVGmf1FjIfKMj+01OHjKUT/LBiELh/zCWwieJfQzMj9uxx
   Oaor8eTtQtRFBPRV82LOPPpdTcFUB84C4iZ6IWVE0420XXXwAqnkGzaIA
   iB65T53rqHz3Ux5Rm40i5XbEqXWs7V+yzY5qnEmomNoYiG4h1TX5OYI0v
   XBExXYc3khkZrV+BX9osxVhhbGHCuUIiF2mPhXbiSW6i3dVM5PJnIY2WA
   3a0AxF+90X37QQWbhhre1VfEwNsedFEKgOwhkb/sore8nf04bQNKg9vh3
   ctmbjdd9vUWil5rwCCQRIykZzNfAcgfMmFTF97bxPbqqig85x+gLQNNe6
   w==;
X-CSE-ConnectionGUID: s5jeCzwBRoeSJmbkiuNiHg==
X-CSE-MsgGUID: +D51wLY4S3yq/rfOQJ6n0g==
X-IronPort-AV: E=McAfee;i="6800,10657,11670"; a="80763809"
X-IronPort-AV: E=Sophos;i="6.21,224,1763452800"; 
   d="scan'208";a="80763809"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2026 18:37:05 -0800
X-CSE-ConnectionGUID: NBZh8DmNSwymGtsgAm0thQ==
X-CSE-MsgGUID: vMvOPLvNSJCkcjlmGzjZMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,224,1763452800"; 
   d="scan'208";a="209599326"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 13 Jan 2026 18:37:03 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vfqkm-00000000FgK-421r;
	Wed, 14 Jan 2026 02:37:00 +0000
Date: Wed, 14 Jan 2026 10:36:40 +0800
From: kernel test robot <lkp@intel.com>
To: Ido Schimmel <idosch@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev, Petr Machata <petrm@nvidia.com>
Subject: [jpirko-mlxsw:combined_queue 23/23]
 drivers/remoteproc/rcar_rproc.c:29:12: sparse: sparse: incorrect type in
 assignment (different address spaces)
Message-ID: <202601141056.sPFx1D88-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/jpirko/linux_mlxsw combined_queue
head:   7bb22c4701b3639ef7e7aa8434d807c60b6fe8f9
commit: 7bb22c4701b3639ef7e7aa8434d807c60b6fe8f9 [23/23] TMP: Revert "module: Add compile-time check for embedded NUL characters"
config: sparc64-randconfig-r121-20260114 (https://download.01.org/0day-ci/archive/20260114/202601141056.sPFx1D88-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260114/202601141056.sPFx1D88-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601141056.sPFx1D88-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/remoteproc/rcar_rproc.c:29:12: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void *va @@     got void [noderef] __iomem * @@
   drivers/remoteproc/rcar_rproc.c:29:12: sparse:     expected void *va
   drivers/remoteproc/rcar_rproc.c:29:12: sparse:     got void [noderef] __iomem *
   drivers/remoteproc/rcar_rproc.c:46:20: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void *va @@
   drivers/remoteproc/rcar_rproc.c:46:20: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/remoteproc/rcar_rproc.c:46:20: sparse:     got void *va
--
>> drivers/rpmsg/qcom_glink_smem.c:108:48: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const volatile [noderef] __iomem *src @@     got void * @@
   drivers/rpmsg/qcom_glink_smem.c:108:48: sparse:     expected void const volatile [noderef] __iomem *src
   drivers/rpmsg/qcom_glink_smem.c:108:48: sparse:     got void *
   drivers/rpmsg/qcom_glink_smem.c:111:47: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const volatile [noderef] __iomem *src @@     got void *fifo @@
   drivers/rpmsg/qcom_glink_smem.c:111:47: sparse:     expected void const volatile [noderef] __iomem *src
   drivers/rpmsg/qcom_glink_smem.c:111:47: sparse:     got void *fifo
--
>> drivers/rpmsg/qcom_smd.c:510:53: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const [noderef] __iomem *src @@     got void * @@
   drivers/rpmsg/qcom_smd.c:510:53: sparse:     expected void const [noderef] __iomem *src
   drivers/rpmsg/qcom_smd.c:510:53: sparse:     got void *
   drivers/rpmsg/qcom_smd.c:517:43: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const [noderef] __iomem *src @@     got void *rx_fifo @@
   drivers/rpmsg/qcom_smd.c:517:43: sparse:     expected void const [noderef] __iomem *src
   drivers/rpmsg/qcom_smd.c:517:43: sparse:     got void *rx_fifo
>> drivers/rpmsg/qcom_smd.c:711:51: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void [noderef] __iomem *dst @@     got void * @@
   drivers/rpmsg/qcom_smd.c:711:51: sparse:     expected void [noderef] __iomem *dst
   drivers/rpmsg/qcom_smd.c:711:51: sparse:     got void *
   drivers/rpmsg/qcom_smd.c:718:41: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void [noderef] __iomem *dst @@     got void *tx_fifo @@
   drivers/rpmsg/qcom_smd.c:718:41: sparse:     expected void [noderef] __iomem *dst
   drivers/rpmsg/qcom_smd.c:718:41: sparse:     got void *tx_fifo
--
>> drivers/mmc/host/dw_mmc.c:606:29: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got unsigned int * @@
   drivers/mmc/host/dw_mmc.c:606:29: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/mmc/host/dw_mmc.c:606:29: sparse:     got unsigned int *
>> drivers/mmc/host/dw_mmc.c:619:25: sparse: sparse: restricted __le32 degrades to integer
>> drivers/mmc/host/dw_mmc.c:619:25: sparse: sparse: restricted __le32 degrades to integer
>> drivers/mmc/host/dw_mmc.c:678:29: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got restricted __le32 * @@
   drivers/mmc/host/dw_mmc.c:678:29: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/mmc/host/dw_mmc.c:678:29: sparse:     got restricted __le32 *
   drivers/mmc/host/dw_mmc.c:678:29: sparse: sparse: restricted __le32 degrades to integer
--
>> drivers/hid/usbhid/usbkbd.c:164:108: sparse: sparse: dubious: x | !y
--
>> drivers/pinctrl/renesas/pinctrl-rzn1.c:187:52: sparse: sparse: dubious: x | !y
   drivers/pinctrl/renesas/pinctrl-rzn1.c:193:52: sparse: sparse: dubious: x | !y
--
>> drivers/soc/qcom/smsm.c:159:32: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got unsigned int [usertype] *local_state @@
   drivers/soc/qcom/smsm.c:159:32: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/soc/qcom/smsm.c:159:32: sparse:     got unsigned int [usertype] *local_state
>> drivers/soc/qcom/smsm.c:171:25: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got unsigned int [usertype] *local_state @@
   drivers/soc/qcom/smsm.c:171:25: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/soc/qcom/smsm.c:171:25: sparse:     got unsigned int [usertype] *local_state
   drivers/soc/qcom/smsm.c:181:48: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got unsigned int [usertype] * @@
   drivers/soc/qcom/smsm.c:181:48: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/soc/qcom/smsm.c:181:48: sparse:     got unsigned int [usertype] *
   drivers/soc/qcom/smsm.c:219:26: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got unsigned int [usertype] *remote_state @@
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
>> drivers/soc/qcom/smp2p.c:255:34: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got unsigned int [usertype] *value @@
   drivers/soc/qcom/smp2p.c:255:34: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/soc/qcom/smp2p.c:255:34: sparse:     got unsigned int [usertype] *value
   drivers/soc/qcom/smp2p.c:419:33: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got unsigned int [usertype] *value @@
   drivers/soc/qcom/smp2p.c:419:33: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/soc/qcom/smp2p.c:419:33: sparse:     got unsigned int [usertype] *value
   drivers/soc/qcom/smp2p.c:422:26: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got unsigned int [usertype] *value @@
   drivers/soc/qcom/smp2p.c:422:26: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/soc/qcom/smp2p.c:422:26: sparse:     got unsigned int [usertype] *value
--
   drivers/video/fbdev/grvga.c:150:26: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got unsigned int * @@
   drivers/video/fbdev/grvga.c:150:26: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/video/fbdev/grvga.c:150:26: sparse:     got unsigned int *
   drivers/video/fbdev/grvga.c:153:26: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got unsigned int * @@
   drivers/video/fbdev/grvga.c:153:26: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/video/fbdev/grvga.c:153:26: sparse:     got unsigned int *
   drivers/video/fbdev/grvga.c:156:26: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got unsigned int * @@
   drivers/video/fbdev/grvga.c:156:26: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/video/fbdev/grvga.c:156:26: sparse:     got unsigned int *
   drivers/video/fbdev/grvga.c:160:26: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got unsigned int * @@
   drivers/video/fbdev/grvga.c:160:26: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/video/fbdev/grvga.c:160:26: sparse:     got unsigned int *
   drivers/video/fbdev/grvga.c:181:26: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got unsigned int * @@
   drivers/video/fbdev/grvga.c:181:26: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/video/fbdev/grvga.c:181:26: sparse:     got unsigned int *
   drivers/video/fbdev/grvga.c:214:34: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got unsigned int * @@
   drivers/video/fbdev/grvga.c:214:34: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/video/fbdev/grvga.c:214:34: sparse:     got unsigned int *
   drivers/video/fbdev/grvga.c:248:26: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got unsigned int * @@
   drivers/video/fbdev/grvga.c:248:26: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/video/fbdev/grvga.c:248:26: sparse:     got unsigned int *
>> drivers/video/fbdev/grvga.c:387:19: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct grvga_regs *regs @@     got void [noderef] __iomem * @@
   drivers/video/fbdev/grvga.c:387:19: sparse:     expected struct grvga_regs *regs
   drivers/video/fbdev/grvga.c:387:19: sparse:     got void [noderef] __iomem *
   drivers/video/fbdev/grvga.c:482:42: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got unsigned int * @@
   drivers/video/fbdev/grvga.c:482:42: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/video/fbdev/grvga.c:482:42: sparse:     got unsigned int *
   drivers/video/fbdev/grvga.c:483:38: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got unsigned int * @@
   drivers/video/fbdev/grvga.c:483:38: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/video/fbdev/grvga.c:483:38: sparse:     got unsigned int *
   drivers/video/fbdev/grvga.c:484:26: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got unsigned int * @@
   drivers/video/fbdev/grvga.c:484:26: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/video/fbdev/grvga.c:484:26: sparse:     got unsigned int *
   drivers/video/fbdev/grvga.c:490:26: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/video/fbdev/grvga.c:490:26: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/video/fbdev/grvga.c:490:26: sparse:     got void *
>> drivers/video/fbdev/grvga.c:496:42: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void [noderef] __iomem *base @@     got struct grvga_regs *regs @@
   drivers/video/fbdev/grvga.c:496:42: sparse:     expected void [noderef] __iomem *base
   drivers/video/fbdev/grvga.c:496:42: sparse:     got struct grvga_regs *regs
   drivers/video/fbdev/grvga.c:514:53: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void [noderef] __iomem *base @@     got struct grvga_regs *regs @@
   drivers/video/fbdev/grvga.c:514:53: sparse:     expected void [noderef] __iomem *base
   drivers/video/fbdev/grvga.c:514:53: sparse:     got struct grvga_regs *regs
>> drivers/video/fbdev/grvga.c:520:32: sparse: sparse: cast removes address space '__iomem' of expression
--
>> drivers/usb/misc/sisusbvga/sisusbvga.c:528:9: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short header @@     got restricted __le16 [usertype] @@
   drivers/usb/misc/sisusbvga/sisusbvga.c:528:9: sparse:     expected unsigned short header
   drivers/usb/misc/sisusbvga/sisusbvga.c:528:9: sparse:     got restricted __le16 [usertype]
>> drivers/usb/misc/sisusbvga/sisusbvga.c:528:9: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] address @@     got restricted __le32 [usertype] @@
   drivers/usb/misc/sisusbvga/sisusbvga.c:528:9: sparse:     expected unsigned int [usertype] address
   drivers/usb/misc/sisusbvga/sisusbvga.c:528:9: sparse:     got restricted __le32 [usertype]
>> drivers/usb/misc/sisusbvga/sisusbvga.c:528:9: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] data @@     got restricted __le32 [usertype] @@
   drivers/usb/misc/sisusbvga/sisusbvga.c:528:9: sparse:     expected unsigned int [usertype] data
   drivers/usb/misc/sisusbvga/sisusbvga.c:528:9: sparse:     got restricted __le32 [usertype]
   drivers/usb/misc/sisusbvga/sisusbvga.c:564:9: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short header @@     got restricted __le16 [usertype] @@
   drivers/usb/misc/sisusbvga/sisusbvga.c:564:9: sparse:     expected unsigned short header
   drivers/usb/misc/sisusbvga/sisusbvga.c:564:9: sparse:     got restricted __le16 [usertype]
   drivers/usb/misc/sisusbvga/sisusbvga.c:564:9: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] address @@     got restricted __le32 [usertype] @@
   drivers/usb/misc/sisusbvga/sisusbvga.c:564:9: sparse:     expected unsigned int [usertype] address
   drivers/usb/misc/sisusbvga/sisusbvga.c:564:9: sparse:     got restricted __le32 [usertype]
   drivers/usb/misc/sisusbvga/sisusbvga.c:564:9: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] data @@     got restricted __le32 [usertype] @@
   drivers/usb/misc/sisusbvga/sisusbvga.c:564:9: sparse:     expected unsigned int [usertype] data
   drivers/usb/misc/sisusbvga/sisusbvga.c:564:9: sparse:     got restricted __le32 [usertype]

vim +29 drivers/remoteproc/rcar_rproc.c

285892a74f1370 Julien Massot 2021-12-07  21  
285892a74f1370 Julien Massot 2021-12-07  22  static int rcar_rproc_mem_alloc(struct rproc *rproc,
285892a74f1370 Julien Massot 2021-12-07  23  				 struct rproc_mem_entry *mem)
285892a74f1370 Julien Massot 2021-12-07  24  {
285892a74f1370 Julien Massot 2021-12-07  25  	struct device *dev = &rproc->dev;
285892a74f1370 Julien Massot 2021-12-07  26  	void *va;
285892a74f1370 Julien Massot 2021-12-07  27  
285892a74f1370 Julien Massot 2021-12-07  28  	dev_dbg(dev, "map memory: %pa+%zx\n", &mem->dma, mem->len);
285892a74f1370 Julien Massot 2021-12-07 @29  	va = ioremap_wc(mem->dma, mem->len);
285892a74f1370 Julien Massot 2021-12-07  30  	if (!va) {
285892a74f1370 Julien Massot 2021-12-07  31  		dev_err(dev, "Unable to map memory region: %pa+%zx\n",
285892a74f1370 Julien Massot 2021-12-07  32  			&mem->dma, mem->len);
285892a74f1370 Julien Massot 2021-12-07  33  		return -ENOMEM;
285892a74f1370 Julien Massot 2021-12-07  34  	}
285892a74f1370 Julien Massot 2021-12-07  35  
285892a74f1370 Julien Massot 2021-12-07  36  	/* Update memory entry va */
285892a74f1370 Julien Massot 2021-12-07  37  	mem->va = va;
285892a74f1370 Julien Massot 2021-12-07  38  
285892a74f1370 Julien Massot 2021-12-07  39  	return 0;
285892a74f1370 Julien Massot 2021-12-07  40  }
285892a74f1370 Julien Massot 2021-12-07  41  

:::::: The code at line 29 was first introduced by commit
:::::: 285892a74f1370a12249f765c6a4e3b16194852e remoteproc: Add Renesas rcar driver

:::::: TO: Julien Massot <julien.massot@iot.bzh>
:::::: CC: Mathieu Poirier <mathieu.poirier@linaro.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
