Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34898A929
	for <oe-kbuild-all@lists.linux.dev>; Mon, 20 May 2024 22:37:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716244667; cv=none; b=Yq6+k4L30Ka9nP9dYdaGqDeMRVpecf+9WLJQpef+4ex83D+WoVq1Tn4Bjri8UY32VHtUjp0/YtwukUSBHSKBZaR4n3JTG1x9WHUcxzz/LUXq/EvMNtFC5m/hxbqByyGGxKxvEeIzu9vAhyd5MTeCoV4fiL65xdTCGLzGj6idiGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716244667; c=relaxed/simple;
	bh=uXrk1i7gOfCJfm3QvNLxJHE3+L4Tdmjpmt6Kkt357eU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Kbnh6U/ZyWJJ/bmO+o412ATxIGkhXWs+OyNCtCoeXfveowgplEMg/dGn6/dGEnsu23bSB/lHHjBFmgQdRA1e4TdGbCkqOzigRSsxOfllf0/HE447v6LDIcvihictDhqQZhInZ6ojbcKlRAJx5olEUuzb2z1HTfd+OwmSPyeLweI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=moozTM3p; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="moozTM3p"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716244665; x=1747780665;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uXrk1i7gOfCJfm3QvNLxJHE3+L4Tdmjpmt6Kkt357eU=;
  b=moozTM3pifP2Dlgmrh6bSyKatOrmm4f0y7SQhChaDDaepAPLUJkj2dIr
   wmztY7hYBU8+xkzS2d6SPptl9riXRQkeiaywSeOIcborN5ev7EFcLL6d7
   2HS0Cu1VKnhlnK0w9eOn1NDK3x/FP7sN7cbLyLFnXtlGyCDIW0GVTbIkc
   g2wp7HiWVD3d3C9Qj/j7NeWg4Xn9kwrTkbayTdZmMUp8JLlyQmzoXfltl
   JcZpGZOHLqZN3DEW++tOXwuKWoYbJNkuGPCctqu8JyjEI1/fLz8CZxeqH
   xmdzw36INMFqQs9LlX+vGy3FPF7BXxDAB68UyrF6VMD9D7CVOjMTbByAJ
   Q==;
X-CSE-ConnectionGUID: BVM8Ts+0S/ujPvZI9aoXTA==
X-CSE-MsgGUID: dBdtgCNETIyOzruG5lzjGg==
X-IronPort-AV: E=McAfee;i="6600,9927,11078"; a="29927559"
X-IronPort-AV: E=Sophos;i="6.08,176,1712646000"; 
   d="scan'208";a="29927559"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2024 15:37:45 -0700
X-CSE-ConnectionGUID: kTe2G0R3ReePKTiZr5uh+g==
X-CSE-MsgGUID: A3A6WKopReazsyFdVRLdNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,176,1712646000"; 
   d="scan'208";a="32591796"
Received: from unknown (HELO 108735ec233b) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 20 May 2024 15:37:42 -0700
Received: from kbuild by 108735ec233b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s9BdT-0005DY-0t;
	Mon, 20 May 2024 22:37:39 +0000
Date: Tue, 21 May 2024 06:36:45 +0800
From: kernel test robot <lkp@intel.com>
To: jasperwang@tencent.com, kaixuxia@tencent.com, frankjpliu@tencent.com,
	kasong@tencent.com, sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:next 6470/6637]
 drivers/net/ethernet/3snic/sssnic/nic/../hw/sss_hwdev_export.c:137:15:
 sparse: sparse: dubious: !x & y
Message-ID: <202405210643.VadGGPur-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git next
head:   ab414f954e57ae54df9e871de06eaa10dc57215b
commit: af04f5fda50a643c0dc483584bc5be97f2117d36 [6470/6637] add 3snic 3s9xx driver
config: x86_64-randconfig-122-20240521 (https://download.01.org/0day-ci/archive/20240521/202405210643.VadGGPur-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240521/202405210643.VadGGPur-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405210643.VadGGPur-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/net/ethernet/3snic/sssnic/nic/../hw/sss_hwdev_export.c:38:11: sparse: sparse: symbol 'sss_rx_buf_size_level' was not declared. Should it be static?
>> drivers/net/ethernet/3snic/sssnic/nic/../hw/sss_hwdev_export.c:137:15: sparse: sparse: dubious: !x & y
--
>> drivers/net/ethernet/3snic/sssnic/nic/../hw/sss_hwif_ctrlq.c:311:54: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected unsigned char [usertype] *db_base @@     got unsigned char [noderef] [usertype] __iomem *db_base @@
   drivers/net/ethernet/3snic/sssnic/nic/../hw/sss_hwif_ctrlq.c:311:54: sparse:     expected unsigned char [usertype] *db_base
   drivers/net/ethernet/3snic/sssnic/nic/../hw/sss_hwif_ctrlq.c:311:54: sparse:     got unsigned char [noderef] [usertype] __iomem *db_base
>> drivers/net/ethernet/3snic/sssnic/nic/../hw/sss_hwif_ctrlq.c:320:31: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got unsigned char [usertype] * @@
   drivers/net/ethernet/3snic/sssnic/nic/../hw/sss_hwif_ctrlq.c:320:31: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/3snic/sssnic/nic/../hw/sss_hwif_ctrlq.c:320:31: sparse:     got unsigned char [usertype] *
   drivers/net/ethernet/3snic/sssnic/nic/../hw/sss_hwif_ctrlq.c:533:12: sparse: sparse: context imbalance in 'sss_ctrlq_msg_lock' - different lock contexts for basic block
   drivers/net/ethernet/3snic/sssnic/nic/../hw/sss_hwif_ctrlq.c:547:13: sparse: sparse: context imbalance in 'sss_ctrlq_msg_unlock' - unexpected unlock
--
>> drivers/net/ethernet/3snic/sssnic/nic/../hw/sss_hwif_ctrlq_init.c:328:41: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void [noderef] __iomem **db_base @@     got void [noderef] __iomem * @@
   drivers/net/ethernet/3snic/sssnic/nic/../hw/sss_hwif_ctrlq_init.c:328:41: sparse:     expected void [noderef] __iomem **db_base
   drivers/net/ethernet/3snic/sssnic/nic/../hw/sss_hwif_ctrlq_init.c:328:41: sparse:     got void [noderef] __iomem *
--
>> drivers/net/ethernet/3snic/sssnic/nic/../hw/sss_hwif_mbx.c:294:30: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int val @@     got restricted __be32 [usertype] @@
   drivers/net/ethernet/3snic/sssnic/nic/../hw/sss_hwif_mbx.c:294:30: sparse:     expected unsigned int val
   drivers/net/ethernet/3snic/sssnic/nic/../hw/sss_hwif_mbx.c:294:30: sparse:     got restricted __be32 [usertype]
>> drivers/net/ethernet/3snic/sssnic/nic/../hw/sss_hwif_mbx.c:294:73: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got unsigned char [usertype] * @@
   drivers/net/ethernet/3snic/sssnic/nic/../hw/sss_hwif_mbx.c:294:73: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/3snic/sssnic/nic/../hw/sss_hwif_mbx.c:294:73: sparse:     got unsigned char [usertype] *
   drivers/net/ethernet/3snic/sssnic/nic/../hw/sss_hwif_mbx.c:312:30: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int val @@     got restricted __be32 [usertype] @@
   drivers/net/ethernet/3snic/sssnic/nic/../hw/sss_hwif_mbx.c:312:30: sparse:     expected unsigned int val
   drivers/net/ethernet/3snic/sssnic/nic/../hw/sss_hwif_mbx.c:312:30: sparse:     got restricted __be32 [usertype]
   drivers/net/ethernet/3snic/sssnic/nic/../hw/sss_hwif_mbx.c:313:67: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got unsigned char [usertype] * @@
   drivers/net/ethernet/3snic/sssnic/nic/../hw/sss_hwif_mbx.c:313:67: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/3snic/sssnic/nic/../hw/sss_hwif_mbx.c:313:67: sparse:     got unsigned char [usertype] *
>> drivers/net/ethernet/3snic/sssnic/nic/../hw/sss_hwif_mbx.c:364:19: sparse: sparse: cast to restricted __be64
--
>> drivers/net/ethernet/3snic/sssnic/nic/../hw/sss_hwif_mbx_init.c:346:24: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected unsigned char [usertype] *data @@     got unsigned char [noderef] [usertype] __iomem * @@
   drivers/net/ethernet/3snic/sssnic/nic/../hw/sss_hwif_mbx_init.c:346:24: sparse:     expected unsigned char [usertype] *data
   drivers/net/ethernet/3snic/sssnic/nic/../hw/sss_hwif_mbx_init.c:346:24: sparse:     got unsigned char [noderef] [usertype] __iomem *
--
>> drivers/net/ethernet/3snic/sssnic/nic/../hw/sss_hwif_adm.c:213:31: sparse: sparse: cast to restricted __be64
>> drivers/net/ethernet/3snic/sssnic/nic/../hw/sss_hwif_adm.c:275:20: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long long [usertype] @@     got restricted __be64 [usertype] @@
   drivers/net/ethernet/3snic/sssnic/nic/../hw/sss_hwif_adm.c:275:20: sparse:     expected unsigned long long [usertype]
   drivers/net/ethernet/3snic/sssnic/nic/../hw/sss_hwif_adm.c:275:20: sparse:     got restricted __be64 [usertype]
>> drivers/net/ethernet/3snic/sssnic/nic/../hw/sss_hwif_adm.c:327:20: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long long [usertype] desc @@     got restricted __be64 [usertype] @@
   drivers/net/ethernet/3snic/sssnic/nic/../hw/sss_hwif_adm.c:327:20: sparse:     expected unsigned long long [usertype] desc
   drivers/net/ethernet/3snic/sssnic/nic/../hw/sss_hwif_adm.c:327:20: sparse:     got restricted __be64 [usertype]
>> drivers/net/ethernet/3snic/sssnic/nic/../hw/sss_hwif_adm.c:367:20: sparse: sparse: cast to restricted __be32
   drivers/net/ethernet/3snic/sssnic/nic/../hw/sss_hwif_adm.c:371:25: sparse: sparse: cast to restricted __be64
   drivers/net/ethernet/3snic/sssnic/nic/../hw/sss_hwif_adm.c:408:23: sparse: sparse: cast to restricted __be64
   drivers/net/ethernet/3snic/sssnic/nic/../hw/sss_hwif_adm.c:499:9: sparse: sparse: context imbalance in 'sss_adm_msg_lock' - wrong count at exit
   drivers/net/ethernet/3snic/sssnic/nic/../hw/sss_hwif_adm.c:508:28: sparse: sparse: context imbalance in 'sss_adm_msg_unlock' - unexpected unlock
--
>> drivers/net/ethernet/3snic/sssnic/nic/../hw/sss_hwif_adm_init.c:272:34: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long long [usertype] hw_msg_paddr @@     got restricted __be64 [usertype] @@
   drivers/net/ethernet/3snic/sssnic/nic/../hw/sss_hwif_adm_init.c:272:34: sparse:     expected unsigned long long [usertype] hw_msg_paddr
   drivers/net/ethernet/3snic/sssnic/nic/../hw/sss_hwif_adm_init.c:272:34: sparse:     got restricted __be64 [usertype]
>> drivers/net/ethernet/3snic/sssnic/nic/../hw/sss_hwif_adm_init.c:288:38: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long long [usertype] hw_wb_reply_paddr @@     got restricted __be64 [usertype] @@
   drivers/net/ethernet/3snic/sssnic/nic/../hw/sss_hwif_adm_init.c:288:38: sparse:     expected unsigned long long [usertype] hw_wb_reply_paddr
   drivers/net/ethernet/3snic/sssnic/nic/../hw/sss_hwif_adm_init.c:288:38: sparse:     got restricted __be64 [usertype]
   drivers/net/ethernet/3snic/sssnic/nic/../hw/sss_hwif_adm_init.c:310:33: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long long [usertype] hw_msg_paddr @@     got restricted __be64 [usertype] @@
   drivers/net/ethernet/3snic/sssnic/nic/../hw/sss_hwif_adm_init.c:310:33: sparse:     expected unsigned long long [usertype] hw_msg_paddr
   drivers/net/ethernet/3snic/sssnic/nic/../hw/sss_hwif_adm_init.c:310:33: sparse:     got restricted __be64 [usertype]
   drivers/net/ethernet/3snic/sssnic/nic/../hw/sss_hwif_adm_init.c:328:38: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long long [usertype] hw_wb_reply_paddr @@     got restricted __be64 [usertype] @@
   drivers/net/ethernet/3snic/sssnic/nic/../hw/sss_hwif_adm_init.c:328:38: sparse:     expected unsigned long long [usertype] hw_wb_reply_paddr
   drivers/net/ethernet/3snic/sssnic/nic/../hw/sss_hwif_adm_init.c:328:38: sparse:     got restricted __be64 [usertype]
>> drivers/net/ethernet/3snic/sssnic/nic/../hw/sss_hwif_adm_init.c:391:50: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long long [usertype] next_elem_paddr @@     got restricted __be64 [usertype] @@
   drivers/net/ethernet/3snic/sssnic/nic/../hw/sss_hwif_adm_init.c:391:50: sparse:     expected unsigned long long [usertype] next_elem_paddr
   drivers/net/ethernet/3snic/sssnic/nic/../hw/sss_hwif_adm_init.c:391:50: sparse:     got restricted __be64 [usertype]
   drivers/net/ethernet/3snic/sssnic/nic/../hw/sss_hwif_adm_init.c:400:31: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long long [usertype] next_elem_paddr @@     got restricted __be64 [usertype] @@
   drivers/net/ethernet/3snic/sssnic/nic/../hw/sss_hwif_adm_init.c:400:31: sparse:     expected unsigned long long [usertype] next_elem_paddr
   drivers/net/ethernet/3snic/sssnic/nic/../hw/sss_hwif_adm_init.c:400:31: sparse:     got restricted __be64 [usertype]
>> drivers/net/ethernet/3snic/sssnic/nic/../hw/sss_hwif_adm_init.c:463:45: sparse: sparse: incorrect type in argument 4 (different base types) @@     expected unsigned int flag @@     got restricted gfp_t @@
   drivers/net/ethernet/3snic/sssnic/nic/../hw/sss_hwif_adm_init.c:463:45: sparse:     expected unsigned int flag
   drivers/net/ethernet/3snic/sssnic/nic/../hw/sss_hwif_adm_init.c:463:45: sparse:     got restricted gfp_t
   drivers/net/ethernet/3snic/sssnic/nic/../hw/sss_hwif_adm_init.c:580:6: sparse: sparse: symbol 'sss_destroy_adm_msg' was not declared. Should it be static?
--
>> drivers/net/ethernet/3snic/sssnic/nic/../hw/sss_hwif_init.c:311:32: sparse: sparse: cast removes address space '__iomem' of expression
>> drivers/net/ethernet/3snic/sssnic/nic/../hw/sss_hwif_init.c:309:54: sparse: sparse: incompatible types in conditional expression (different address spaces):
   drivers/net/ethernet/3snic/sssnic/nic/../hw/sss_hwif_init.c:309:54: sparse:    void [noderef] __iomem *
   drivers/net/ethernet/3snic/sssnic/nic/../hw/sss_hwif_init.c:309:54: sparse:    unsigned char [usertype] *
--
>> drivers/net/ethernet/3snic/sssnic/nic/../hw/sss_hwif_api.c:31:24: sparse: sparse: cast to restricted __be32
   drivers/net/ethernet/3snic/sssnic/nic/../hw/sss_hwif_api.c:34:24: sparse: sparse: cast to restricted __be32
>> drivers/net/ethernet/3snic/sssnic/nic/../hw/sss_hwif_api.c:41:24: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int val @@     got restricted __be32 [usertype] @@
   drivers/net/ethernet/3snic/sssnic/nic/../hw/sss_hwif_api.c:41:24: sparse:     expected unsigned int val
   drivers/net/ethernet/3snic/sssnic/nic/../hw/sss_hwif_api.c:41:24: sparse:     got restricted __be32 [usertype]
   drivers/net/ethernet/3snic/sssnic/nic/../hw/sss_hwif_api.c:44:24: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int val @@     got restricted __be32 [usertype] @@
   drivers/net/ethernet/3snic/sssnic/nic/../hw/sss_hwif_api.c:44:24: sparse:     expected unsigned int val
   drivers/net/ethernet/3snic/sssnic/nic/../hw/sss_hwif_api.c:44:24: sparse:     got restricted __be32 [usertype]
--
>> drivers/net/ethernet/3snic/sssnic/nic/../hw/sss_hwif_eq.c:138:67: sparse: sparse: incorrect type in argument 4 (different base types) @@     expected unsigned int flag @@     got restricted gfp_t @@
   drivers/net/ethernet/3snic/sssnic/nic/../hw/sss_hwif_eq.c:138:67: sparse:     expected unsigned int flag
   drivers/net/ethernet/3snic/sssnic/nic/../hw/sss_hwif_eq.c:138:67: sparse:     got restricted gfp_t
--
>> drivers/net/ethernet/3snic/sssnic/nic/../hw/sss_hwif_aeq.c:153:18: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] init_val @@     got restricted __be32 [usertype] @@
   drivers/net/ethernet/3snic/sssnic/nic/../hw/sss_hwif_aeq.c:153:18: sparse:     expected unsigned int [usertype] init_val
   drivers/net/ethernet/3snic/sssnic/nic/../hw/sss_hwif_aeq.c:153:18: sparse:     got restricted __be32 [usertype]
>> drivers/net/ethernet/3snic/sssnic/nic/../hw/sss_hwif_aeq.c:238:24: sparse: sparse: cast to restricted __be32
   drivers/net/ethernet/3snic/sssnic/nic/../hw/sss_hwif_aeq.c:408:17: sparse: sparse: cast to restricted __be32
   drivers/net/ethernet/3snic/sssnic/nic/../hw/sss_hwif_aeq.c: note: in included file (through drivers/net/ethernet/3snic/sssnic/hw/include/sss_hwdev.h):
   drivers/net/ethernet/3snic/sssnic/include/hw/sss_hw_common.h:99:26: sparse: sparse: cast to restricted __be32
   drivers/net/ethernet/3snic/sssnic/include/hw/sss_hw_common.h:99:26: sparse: sparse: cast to restricted __be32
--
>> drivers/net/ethernet/3snic/sssnic/nic/../hw/sss_common.c:30:14: sparse: sparse: incorrect type in argument 4 (different base types) @@     expected restricted gfp_t [usertype] gfp @@     got unsigned int flag @@
   drivers/net/ethernet/3snic/sssnic/nic/../hw/sss_common.c:30:14: sparse:     expected restricted gfp_t [usertype] gfp
   drivers/net/ethernet/3snic/sssnic/nic/../hw/sss_common.c:30:14: sparse:     got unsigned int flag
   drivers/net/ethernet/3snic/sssnic/nic/../hw/sss_common.c:42:14: sparse: sparse: incorrect type in argument 4 (different base types) @@     expected restricted gfp_t [usertype] gfp @@     got unsigned int flag @@
   drivers/net/ethernet/3snic/sssnic/nic/../hw/sss_common.c:42:14: sparse:     expected restricted gfp_t [usertype] gfp
   drivers/net/ethernet/3snic/sssnic/nic/../hw/sss_common.c:42:14: sparse:     got unsigned int flag
--
>> drivers/net/ethernet/3snic/sssnic/nic/../hw/sss_wq.c:48:36: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long long [usertype] @@     got restricted __be64 [usertype] @@
   drivers/net/ethernet/3snic/sssnic/nic/../hw/sss_wq.c:48:36: sparse:     expected unsigned long long [usertype]
   drivers/net/ethernet/3snic/sssnic/nic/../hw/sss_wq.c:48:36: sparse:     got restricted __be64 [usertype]
>> drivers/net/ethernet/3snic/sssnic/nic/../hw/sss_wq.c:72:68: sparse: sparse: incorrect type in argument 4 (different base types) @@     expected unsigned int flag @@     got restricted gfp_t @@
   drivers/net/ethernet/3snic/sssnic/nic/../hw/sss_wq.c:72:68: sparse:     expected unsigned int flag
   drivers/net/ethernet/3snic/sssnic/nic/../hw/sss_wq.c:72:68: sparse:     got restricted gfp_t
--
>> drivers/net/ethernet/3snic/sssnic/nic/../hw/sss_hwif_ceq.c:102:18: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] init_val @@     got restricted __be32 [usertype] @@
   drivers/net/ethernet/3snic/sssnic/nic/../hw/sss_hwif_ceq.c:102:18: sparse:     expected unsigned int [usertype] init_val
   drivers/net/ethernet/3snic/sssnic/nic/../hw/sss_hwif_ceq.c:102:18: sparse:     got restricted __be32 [usertype]
   drivers/net/ethernet/3snic/sssnic/nic/../hw/sss_hwif_ceq.c:95:6: sparse: sparse: symbol 'sss_init_ceqe_desc' was not declared. Should it be static?
   drivers/net/ethernet/3snic/sssnic/nic/../hw/sss_hwif_ceq.c:130:13: sparse: sparse: symbol 'sss_ceq_intr_handle' was not declared. Should it be static?
>> drivers/net/ethernet/3snic/sssnic/nic/../hw/sss_hwif_ceq.c:174:24: sparse: sparse: cast to restricted __be32
   drivers/net/ethernet/3snic/sssnic/nic/../hw/sss_hwif_ceq.c:377:17: sparse: sparse: cast to restricted __be32
--
   drivers/net/ethernet/3snic/sssnic/nic/../hw/tool/sss_tool_main.c:80:6: sparse: sparse: symbol 'sss_tool_free_in_buf' was not declared. Should it be static?
   drivers/net/ethernet/3snic/sssnic/nic/../hw/tool/sss_tool_main.c:91:6: sparse: sparse: symbol 'sss_tool_free_out_buf' was not declared. Should it be static?
   drivers/net/ethernet/3snic/sssnic/nic/../hw/tool/sss_tool_main.c:104:5: sparse: sparse: symbol 'sss_tool_alloc_in_buf' was not declared. Should it be static?
   drivers/net/ethernet/3snic/sssnic/nic/../hw/tool/sss_tool_main.c:146:5: sparse: sparse: symbol 'sss_tool_alloc_out_buf' was not declared. Should it be static?
>> drivers/net/ethernet/3snic/sssnic/nic/../hw/tool/sss_tool_main.c:189:42: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void [noderef] __user *to @@     got void *out_buf @@
   drivers/net/ethernet/3snic/sssnic/nic/../hw/tool/sss_tool_main.c:189:42: sparse:     expected void [noderef] __user *to
   drivers/net/ethernet/3snic/sssnic/nic/../hw/tool/sss_tool_main.c:189:42: sparse:     got void *out_buf
   drivers/net/ethernet/3snic/sssnic/nic/../hw/tool/sss_tool_main.c:194:34: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void [noderef] __user *to @@     got void *out_buf @@
   drivers/net/ethernet/3snic/sssnic/nic/../hw/tool/sss_tool_main.c:194:34: sparse:     expected void [noderef] __user *to
   drivers/net/ethernet/3snic/sssnic/nic/../hw/tool/sss_tool_main.c:194:34: sparse:     got void *out_buf
   drivers/net/ethernet/3snic/sssnic/nic/../hw/tool/sss_tool_main.c:182:5: sparse: sparse: symbol 'sss_tool_copy_to_user' was not declared. Should it be static?
>> drivers/net/ethernet/3snic/sssnic/nic/../hw/tool/sss_tool_main.c:211:45: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const [noderef] __user *from @@     got void *in_buf @@
   drivers/net/ethernet/3snic/sssnic/nic/../hw/tool/sss_tool_main.c:211:45: sparse:     expected void const [noderef] __user *from
   drivers/net/ethernet/3snic/sssnic/nic/../hw/tool/sss_tool_main.c:211:45: sparse:     got void *in_buf
   drivers/net/ethernet/3snic/sssnic/nic/../hw/tool/sss_tool_main.c:238:36: sparse: sparse: symbol 'g_deal_msg_handle' was not declared. Should it be static?
>> drivers/net/ethernet/3snic/sssnic/nic/../hw/tool/sss_tool_main.c:318:40: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const [noderef] __user *from @@     got void * @@
   drivers/net/ethernet/3snic/sssnic/nic/../hw/tool/sss_tool_main.c:318:40: sparse:     expected void const [noderef] __user *from
   drivers/net/ethernet/3snic/sssnic/nic/../hw/tool/sss_tool_main.c:318:40: sparse:     got void *
>> drivers/net/ethernet/3snic/sssnic/nic/../hw/tool/sss_tool_main.c:380:42: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void [noderef] __user *to @@     got struct sss_tool_ffm_record_info *ffm_rd @@
   drivers/net/ethernet/3snic/sssnic/nic/../hw/tool/sss_tool_main.c:380:42: sparse:     expected void [noderef] __user *to
   drivers/net/ethernet/3snic/sssnic/nic/../hw/tool/sss_tool_main.c:380:42: sparse:     got struct sss_tool_ffm_record_info *ffm_rd
   drivers/net/ethernet/3snic/sssnic/nic/../hw/tool/sss_tool_main.c:416:37: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const [noderef] __user *from @@     got void * @@
   drivers/net/ethernet/3snic/sssnic/nic/../hw/tool/sss_tool_main.c:416:37: sparse:     expected void const [noderef] __user *from
   drivers/net/ethernet/3snic/sssnic/nic/../hw/tool/sss_tool_main.c:416:37: sparse:     got void *
--
   drivers/net/ethernet/3snic/sssnic/nic/../hw/tool/sss_tool_chip.c:498:5: sparse: sparse: symbol 'sss_tool_send_clp_msg' was not declared. Should it be static?
>> drivers/net/ethernet/3snic/sssnic/nic/../hw/tool/sss_tool_chip.c:604:28: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [assigned] [usertype] val32 @@     got restricted __be32 [usertype] @@
   drivers/net/ethernet/3snic/sssnic/nic/../hw/tool/sss_tool_chip.c:604:28: sparse:     expected unsigned int [assigned] [usertype] val32
   drivers/net/ethernet/3snic/sssnic/nic/../hw/tool/sss_tool_chip.c:604:28: sparse:     got restricted __be32 [usertype]
   drivers/net/ethernet/3snic/sssnic/nic/../hw/tool/sss_tool_chip.c:606:28: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [assigned] [usertype] val32 @@     got restricted __be32 [usertype] @@
   drivers/net/ethernet/3snic/sssnic/nic/../hw/tool/sss_tool_chip.c:606:28: sparse:     expected unsigned int [assigned] [usertype] val32
   drivers/net/ethernet/3snic/sssnic/nic/../hw/tool/sss_tool_chip.c:606:28: sparse:     got restricted __be32 [usertype]
   drivers/net/ethernet/3snic/sssnic/nic/../hw/tool/sss_tool_chip.c:588:5: sparse: sparse: symbol 'sss_tool_adm_csr_rd32' was not declared. Should it be static?
   drivers/net/ethernet/3snic/sssnic/nic/../hw/tool/sss_tool_chip.c:635:28: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [assigned] [usertype] val32 @@     got restricted __be32 [usertype] @@
   drivers/net/ethernet/3snic/sssnic/nic/../hw/tool/sss_tool_chip.c:635:28: sparse:     expected unsigned int [assigned] [usertype] val32
   drivers/net/ethernet/3snic/sssnic/nic/../hw/tool/sss_tool_chip.c:635:28: sparse:     got restricted __be32 [usertype]
   drivers/net/ethernet/3snic/sssnic/nic/../hw/tool/sss_tool_chip.c:637:28: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [assigned] [usertype] val32 @@     got restricted __be32 [usertype] @@
   drivers/net/ethernet/3snic/sssnic/nic/../hw/tool/sss_tool_chip.c:637:28: sparse:     expected unsigned int [assigned] [usertype] val32
   drivers/net/ethernet/3snic/sssnic/nic/../hw/tool/sss_tool_chip.c:637:28: sparse:     got restricted __be32 [usertype]
   drivers/net/ethernet/3snic/sssnic/nic/../hw/tool/sss_tool_chip.c:621:5: sparse: sparse: symbol 'sss_tool_adm_csr_wr32' was not declared. Should it be static?
>> drivers/net/ethernet/3snic/sssnic/nic/../hw/tool/sss_tool_chip.c:704:35: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const [noderef] __user *from @@     got void * @@
   drivers/net/ethernet/3snic/sssnic/nic/../hw/tool/sss_tool_chip.c:704:35: sparse:     expected void const [noderef] __user *from
   drivers/net/ethernet/3snic/sssnic/nic/../hw/tool/sss_tool_chip.c:704:35: sparse:     got void *

vim +137 drivers/net/ethernet/3snic/sssnic/nic/../hw/sss_hwdev_export.c

    37	
  > 38	const int sss_rx_buf_size_level[] = {
    39		SSS_RX_BUF_SIZE_32B,
    40		SSS_RX_BUF_SIZE_64B,
    41		SSS_RX_BUF_SIZE_96B,
    42		SSS_RX_BUF_SIZE_128B,
    43		SSS_RX_BUF_SIZE_192B,
    44		SSS_RX_BUF_SIZE_256B,
    45		SSS_RX_BUF_SIZE_384B,
    46		SSS_RX_BUF_SIZE_512B,
    47		SSS_RX_BUF_SIZE_768B,
    48		SSS_RX_BUF_SIZE_1K,
    49		SSS_RX_BUF_SIZE_1_5K,
    50		SSS_RX_BUF_SIZE_2K,
    51		SSS_RX_BUF_SIZE_3K,
    52		SSS_RX_BUF_SIZE_4K,
    53		SSS_RX_BUF_SIZE_8K,
    54		SSS_RX_BUF_SIZE_16K,
    55	};
    56	
    57	static u16 sss_get_rx_buf_size_level(int buf_size)
    58	{
    59		u16 i;
    60		u16 cnt = ARRAY_LEN(sss_rx_buf_size_level);
    61	
    62		for (i = 0; i < cnt; i++) {
    63			if (sss_rx_buf_size_level[i] == buf_size)
    64				return i;
    65		}
    66	
    67		return SSS_DEFAULT_RX_BUF_SIZE_LEVEL; /* default 2K */
    68	}
    69	
    70	static int sss_chip_get_interrupt_cfg(void *hwdev,
    71					      struct sss_irq_cfg *intr_cfg, u16 channel)
    72	{
    73		int ret;
    74		struct sss_cmd_msix_config cmd_msix = {0};
    75		u16 out_len = sizeof(cmd_msix);
    76	
    77		cmd_msix.opcode = SSS_MGMT_MSG_GET_CMD;
    78		cmd_msix.func_id = sss_get_global_func_id(hwdev);
    79		cmd_msix.msix_index = intr_cfg->msix_id;
    80	
    81		ret = sss_sync_send_msg_ch(hwdev, SSS_COMM_MGMT_CMD_CFG_MSIX_CTRL_REG,
    82					   &cmd_msix, sizeof(cmd_msix), &cmd_msix, &out_len, channel);
    83		if (SSS_ASSERT_SEND_MSG_RETURN(ret, out_len, &cmd_msix)) {
    84			sdk_err(SSS_TO_DEV(hwdev),
    85				"Fail to get intr config, ret: %d, status: 0x%x, out_len: 0x%x, channel: 0x%x\n",
    86				ret, cmd_msix.head.state, out_len, channel);
    87			return -EINVAL;
    88		}
    89	
    90		intr_cfg->lli_credit = cmd_msix.lli_credit_cnt;
    91		intr_cfg->lli_timer = cmd_msix.lli_timer_cnt;
    92		intr_cfg->pending = cmd_msix.pending_cnt;
    93		intr_cfg->coalesc_timer = cmd_msix.coalesce_timer_cnt;
    94		intr_cfg->resend_timer = cmd_msix.resend_timer_cnt;
    95	
    96		return 0;
    97	}
    98	
    99	int sss_chip_set_msix_attr(void *hwdev,
   100				   struct sss_irq_cfg intr_cfg, u16 channel)
   101	{
   102		int ret;
   103		struct sss_irq_cfg temp_cfg = {0};
   104	
   105		if (!hwdev)
   106			return -EINVAL;
   107	
   108		temp_cfg.msix_id = intr_cfg.msix_id;
   109	
   110		ret = sss_chip_get_interrupt_cfg(hwdev, &temp_cfg, channel);
   111		if (ret != 0)
   112			return -EINVAL;
   113	
   114		if (intr_cfg.lli_set == 0) {
   115			intr_cfg.lli_credit = temp_cfg.lli_credit;
   116			intr_cfg.lli_timer = temp_cfg.lli_timer;
   117		}
   118	
   119		if (intr_cfg.coalesc_intr_set == 0) {
   120			intr_cfg.pending = temp_cfg.pending;
   121			intr_cfg.coalesc_timer = temp_cfg.coalesc_timer;
   122			intr_cfg.resend_timer = temp_cfg.resend_timer;
   123		}
   124	
   125		return sss_chip_set_eq_msix_attr(hwdev, &intr_cfg, channel);
   126	}
   127	EXPORT_SYMBOL(sss_chip_set_msix_attr);
   128	
   129	void sss_chip_clear_msix_resend_bit(void *hwdev, u16 msix_id, bool clear_en)
   130	{
   131		u32 val;
   132	
   133		if (!hwdev)
   134			return;
   135	
   136		val = SSS_SET_MSI_CLR_INDIR(msix_id, SIMPLE_INDIR_ID) |
 > 137		      SSS_SET_MSI_CLR_INDIR(!!clear_en, RESEND_TIMER_CLR);
   138	
   139		sss_chip_write_reg(SSS_TO_HWIF(hwdev), SSS_CSR_FUNC_MSI_CLR_WR_ADDR, val);
   140	}
   141	EXPORT_SYMBOL(sss_chip_clear_msix_resend_bit);
   142	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
