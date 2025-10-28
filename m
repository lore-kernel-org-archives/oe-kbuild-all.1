Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AD8D238D54
	for <oe-kbuild-all@lists.linux.dev>; Tue, 28 Oct 2025 06:42:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761633750; cv=none; b=lavWlFg0ObF2lh0JDEkO3rReGhN6GdyOVpOYOVSskuEmiko+7mf7QZlhF0eT8ANUQT0dO+ppwXtMXORXWz34S2NIIKUIRsLtPD+9qFupHawjCl8Ocr1ubGPUUM3c3KKCYkIjYnDiaHI9j6jtB7gCHWUbWM8d//4riyX5d9rxZYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761633750; c=relaxed/simple;
	bh=lqPdvGUei5pwi9s93hlZiicx253KcDem47GChRgmAv0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GV9LZtJNqN+/VpNTOqOBiX2Shei1b5FTTSt5K8mEgzbs72Z/QOXRWtdjG9irOPuMzRFwawT2Bhw8/im3GssaNOW1fpWM9F2C4JzbL8sen2B5fJA2fVK60KPmSVwJMpoGyBoWX16rQYvt1DvG+Y3Hbn+3AwCjkMeyXi0R/yu2slY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SuX6ime1; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SuX6ime1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761633748; x=1793169748;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lqPdvGUei5pwi9s93hlZiicx253KcDem47GChRgmAv0=;
  b=SuX6ime1zf2Ig2b4/uHZzOo0WlGSkrQtrYOAzWcBGSMXJdL2wVux30r3
   3YtOfF+gKcpNCBU93BLIsk08A3WNusSuSb9rOO8e3cWJKcpw7HR/eNThU
   vCFUeufkB4te1gaw80aM+ftQ497bGOCcLYMbzyFlu5RafrTGUau4WHkcM
   ODXP47DVvxBomrPRYmlR3PiRhob0Puh5/ntv26W2IQLSWBE2QQfZjX11Q
   ysQrBNRxNYoyD9FRLvBDmXVOy9Al7FzgzbMwtfWN71aQlhJZAYIADL4KZ
   1pyqoFBoyOS0erefVT16mAF+0fQkltOuM+ODM3CsJa8NfWiBeKd12B/FD
   g==;
X-CSE-ConnectionGUID: qi61IFkrRE2ML6kVSckR6g==
X-CSE-MsgGUID: UBYjbvpfSAWSqW9xw03JIA==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63875956"
X-IronPort-AV: E=Sophos;i="6.19,260,1754982000"; 
   d="scan'208";a="63875956"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2025 23:42:27 -0700
X-CSE-ConnectionGUID: UINJQ+evQ/y99g6LRP/UVA==
X-CSE-MsgGUID: OrZ1W6ZVQ2649Tq6ecf94g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,260,1754982000"; 
   d="scan'208";a="184890497"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 27 Oct 2025 23:42:26 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vDdOe-000Ir5-2Z;
	Tue, 28 Oct 2025 06:41:44 +0000
Date: Tue, 28 Oct 2025 14:36:56 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3050/3050]
 drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_sysfs.c:23:12: sparse:
 sparse: symbol 'nbl_sysfs_qos_name' was not declared. Should it be static?
Message-ID: <202510281430.S9EMJbna-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   cb364ed0578ca246dd52b84bed98cfaa40affb38
commit: 468b0cd7b1e1c131b3ee7d2ea8b96521d3faad8b [3050/3050] net:nebula-matrix:Add S1000 SNIC driver support
config: x86_64-randconfig-123-20251028 (https://download.01.org/0day-ci/archive/20251028/202510281430.S9EMJbna-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251028/202510281430.S9EMJbna-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510281430.S9EMJbna-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_sysfs.c:23:12: sparse: sparse: symbol 'nbl_sysfs_qos_name' was not declared. Should it be static?
>> drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_sysfs.c:47:12: sparse: sparse: symbol 'nbl_sysfs_mirror_name' was not declared. Should it be static?
--
>> drivers/net/ethernet/nebula-matrix/nbl/nbl_channel/nbl_cmdq.c:345:21: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] block:5 @@     got restricted __le16 [usertype] @@
   drivers/net/ethernet/nebula-matrix/nbl/nbl_channel/nbl_cmdq.c:345:21: sparse:     expected unsigned int [usertype] block:5
   drivers/net/ethernet/nebula-matrix/nbl/nbl_channel/nbl_cmdq.c:345:21: sparse:     got restricted __le16 [usertype]
>> drivers/net/ethernet/nebula-matrix/nbl/nbl_channel/nbl_cmdq.c:346:22: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] module:5 @@     got restricted __le16 [usertype] @@
   drivers/net/ethernet/nebula-matrix/nbl/nbl_channel/nbl_cmdq.c:346:22: sparse:     expected unsigned int [usertype] module:5
   drivers/net/ethernet/nebula-matrix/nbl/nbl_channel/nbl_cmdq.c:346:22: sparse:     got restricted __le16 [usertype]
>> drivers/net/ethernet/nebula-matrix/nbl/nbl_channel/nbl_cmdq.c:347:21: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] table:4 @@     got restricted __le16 [usertype] @@
   drivers/net/ethernet/nebula-matrix/nbl/nbl_channel/nbl_cmdq.c:347:21: sparse:     expected unsigned int [usertype] table:4
   drivers/net/ethernet/nebula-matrix/nbl/nbl_channel/nbl_cmdq.c:347:21: sparse:     got restricted __le16 [usertype]
>> drivers/net/ethernet/nebula-matrix/nbl/nbl_channel/nbl_cmdq.c:348:22: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] opcode:8 @@     got restricted __le16 [usertype] @@
   drivers/net/ethernet/nebula-matrix/nbl/nbl_channel/nbl_cmdq.c:348:22: sparse:     expected unsigned int [usertype] opcode:8
   drivers/net/ethernet/nebula-matrix/nbl/nbl_channel/nbl_cmdq.c:348:22: sparse:     got restricted __le16 [usertype]
>> drivers/net/ethernet/nebula-matrix/nbl/nbl_channel/nbl_cmdq.c:349:26: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] param_high @@     got restricted __le32 [usertype] @@
   drivers/net/ethernet/nebula-matrix/nbl/nbl_channel/nbl_cmdq.c:349:26: sparse:     expected unsigned int [usertype] param_high
   drivers/net/ethernet/nebula-matrix/nbl/nbl_channel/nbl_cmdq.c:349:26: sparse:     got restricted __le32 [usertype]
>> drivers/net/ethernet/nebula-matrix/nbl/nbl_channel/nbl_cmdq.c:350:25: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] param_low @@     got restricted __le32 [usertype] @@
   drivers/net/ethernet/nebula-matrix/nbl/nbl_channel/nbl_cmdq.c:350:25: sparse:     expected unsigned int [usertype] param_low
   drivers/net/ethernet/nebula-matrix/nbl/nbl_channel/nbl_cmdq.c:350:25: sparse:     got restricted __le32 [usertype]
>> drivers/net/ethernet/nebula-matrix/nbl/nbl_channel/nbl_cmdq.c:359:29: sparse: sparse: invalid assignment: |=
   drivers/net/ethernet/nebula-matrix/nbl/nbl_channel/nbl_cmdq.c:359:29: sparse:    left side has type unsigned int [usertype] :16
   drivers/net/ethernet/nebula-matrix/nbl/nbl_channel/nbl_cmdq.c:359:29: sparse:    right side has type restricted __le16
>> drivers/net/ethernet/nebula-matrix/nbl/nbl_channel/nbl_cmdq.c:360:33: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] send_high @@     got restricted __le32 [usertype] @@
   drivers/net/ethernet/nebula-matrix/nbl/nbl_channel/nbl_cmdq.c:360:33: sparse:     expected unsigned int [usertype] send_high
   drivers/net/ethernet/nebula-matrix/nbl/nbl_channel/nbl_cmdq.c:360:33: sparse:     got restricted __le32 [usertype]
>> drivers/net/ethernet/nebula-matrix/nbl/nbl_channel/nbl_cmdq.c:361:32: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] send_low @@     got restricted __le32 [usertype] @@
   drivers/net/ethernet/nebula-matrix/nbl/nbl_channel/nbl_cmdq.c:361:32: sparse:     expected unsigned int [usertype] send_low
   drivers/net/ethernet/nebula-matrix/nbl/nbl_channel/nbl_cmdq.c:361:32: sparse:     got restricted __le32 [usertype]
   drivers/net/ethernet/nebula-matrix/nbl/nbl_channel/nbl_cmdq.c:366:29: sparse: sparse: invalid assignment: |=
   drivers/net/ethernet/nebula-matrix/nbl/nbl_channel/nbl_cmdq.c:366:29: sparse:    left side has type unsigned int [usertype] :16
   drivers/net/ethernet/nebula-matrix/nbl/nbl_channel/nbl_cmdq.c:366:29: sparse:    right side has type restricted __le16
>> drivers/net/ethernet/nebula-matrix/nbl/nbl_channel/nbl_cmdq.c:367:33: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] recv_high @@     got restricted __le32 [usertype] @@
   drivers/net/ethernet/nebula-matrix/nbl/nbl_channel/nbl_cmdq.c:367:33: sparse:     expected unsigned int [usertype] recv_high
   drivers/net/ethernet/nebula-matrix/nbl/nbl_channel/nbl_cmdq.c:367:33: sparse:     got restricted __le32 [usertype]
>> drivers/net/ethernet/nebula-matrix/nbl/nbl_channel/nbl_cmdq.c:368:32: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] recv_low @@     got restricted __le32 [usertype] @@
   drivers/net/ethernet/nebula-matrix/nbl/nbl_channel/nbl_cmdq.c:368:32: sparse:     expected unsigned int [usertype] recv_low
   drivers/net/ethernet/nebula-matrix/nbl/nbl_channel/nbl_cmdq.c:368:32: sparse:     got restricted __le32 [usertype]
>> drivers/net/ethernet/nebula-matrix/nbl/nbl_channel/nbl_cmdq.c:479:35: sparse: sparse: cast to restricted __le16
--
>> drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_fd.c:320:45: sparse: sparse: cast to restricted __be16
   drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_fd.c:321:45: sparse: sparse: cast to restricted __be16
>> drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_fd.c:324:41: sparse: sparse: cast to restricted __be32
   drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_fd.c:325:41: sparse: sparse: cast to restricted __be32
   drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_fd.c:328:41: sparse: sparse: cast to restricted __be32
   drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_fd.c:329:41: sparse: sparse: cast to restricted __be32
>> drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_fd.c:336:41: sparse: sparse: cast to restricted __be64
   drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_fd.c:337:41: sparse: sparse: cast to restricted __be64
   drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_fd.c:338:41: sparse: sparse: cast to restricted __be64
   drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_fd.c:339:41: sparse: sparse: cast to restricted __be64
   drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_fd.c:342:41: sparse: sparse: cast to restricted __be64
   drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_fd.c:343:41: sparse: sparse: cast to restricted __be64
   drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_fd.c:344:41: sparse: sparse: cast to restricted __be64
   drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_fd.c:345:41: sparse: sparse: cast to restricted __be64
   drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_fd.c:349:44: sparse: sparse: cast to restricted __be16
   drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_fd.c:350:44: sparse: sparse: cast to restricted __be16
   drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_fd.c:353:44: sparse: sparse: cast to restricted __be16
   drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_fd.c:354:44: sparse: sparse: cast to restricted __be16
>> drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_fd.c:832:6: sparse: sparse: symbol 'flow_type_name' was not declared. Should it be static?
--
>> drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_hw_leonis/nbl_tc_flow_filter_leonis.c:590:71: sparse: sparse: incorrect type in initializer (different base types) @@     expected unsigned int [usertype] *ip @@     got restricted __be32 * @@
   drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_hw_leonis/nbl_tc_flow_filter_leonis.c:590:71: sparse:     expected unsigned int [usertype] *ip
   drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_hw_leonis/nbl_tc_flow_filter_leonis.c:590:71: sparse:     got restricted __be32 *
>> drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_hw_leonis/nbl_tc_flow_filter_leonis.c:594:29: sparse: sparse: cast to restricted __be32
   drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_hw_leonis/nbl_tc_flow_filter_leonis.c:640:71: sparse: sparse: incorrect type in initializer (different base types) @@     expected unsigned int [usertype] *ip @@     got restricted __be32 * @@
   drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_hw_leonis/nbl_tc_flow_filter_leonis.c:640:71: sparse:     expected unsigned int [usertype] *ip
   drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_hw_leonis/nbl_tc_flow_filter_leonis.c:640:71: sparse:     got restricted __be32 *
   drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_hw_leonis/nbl_tc_flow_filter_leonis.c:644:29: sparse: sparse: cast to restricted __be32
--
   drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_txrx.c:49:27: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected unsigned char [noderef] [usertype] __iomem *notify_addr @@     got unsigned char [usertype] * @@
   drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_txrx.c:49:27: sparse:     expected unsigned char [noderef] [usertype] __iomem *notify_addr
   drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_txrx.c:49:27: sparse:     got unsigned char [usertype] *
>> drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_txrx.c:1340:22: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] len @@     got unsigned short [usertype] len @@
   drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_txrx.c:1340:22: sparse:     expected restricted __le32 [usertype] len
   drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_txrx.c:1340:22: sparse:     got unsigned short [usertype] len
   drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_txrx.c:1402:23: sparse: sparse: cast to restricted __le16
   drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_txrx.c:1658:39: sparse: sparse: cast to restricted __le16
   drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_txrx.c:1760:48: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got unsigned char [usertype] *irq_enable_base @@
   drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_txrx.c:1760:48: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_txrx.c:1760:48: sparse:     got unsigned char [usertype] *irq_enable_base
   drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_txrx.c:1977:22: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] len @@     got unsigned int [assigned] size @@
   drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_txrx.c:1977:22: sparse:     expected restricted __le32 [usertype] len
   drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_txrx.c:1977:22: sparse:     got unsigned int [assigned] size
   drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_txrx.c:2012:30: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] len @@     got unsigned int [assigned] size @@
   drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_txrx.c:2012:30: sparse:     expected restricted __le32 [usertype] len
   drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_txrx.c:2012:30: sparse:     got unsigned int [assigned] size
   drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_txrx.c:2680:33: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] len @@     got unsigned int [assigned] [usertype] pkthdr_len @@
   drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_txrx.c:2680:33: sparse:     expected restricted __le32 [usertype] len
   drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_txrx.c:2680:33: sparse:     got unsigned int [assigned] [usertype] pkthdr_len
   drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_txrx.c:2709:25: sparse: sparse: bad assignment (+=) to restricted __le32
>> drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_txrx.c:2862:36: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short [usertype] vlan_proto @@     got restricted __be16 [usertype] @@
   drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_txrx.c:2862:36: sparse:     expected unsigned short [usertype] vlan_proto
   drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_txrx.c:2862:36: sparse:     got restricted __be16 [usertype]
>> drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_txrx.c:2867:36: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short [usertype] vlan_proto @@     got restricted __be16 [usertype] vlan_proto @@
   drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_txrx.c:2867:36: sparse:     expected unsigned short [usertype] vlan_proto
   drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_txrx.c:2867:36: sparse:     got restricted __be16 [usertype] vlan_proto
>> drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_txrx.c:2871:54: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected restricted __be16 [usertype] vlan_proto @@     got unsigned short [usertype] vlan_proto @@
   drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_txrx.c:2871:54: sparse:     expected restricted __be16 [usertype] vlan_proto
   drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_txrx.c:2871:54: sparse:     got unsigned short [usertype] vlan_proto
   drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_txrx.c:3030:40: sparse: sparse: restricted __le32 degrades to integer
   drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_txrx.c:3031:32: sparse: sparse: restricted __le32 degrades to integer
   drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_txrx.c:3400:24: sparse: sparse: cast to restricted __le16
   drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_txrx.c:3562:56: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got unsigned char [usertype] *irq_enable_base @@
   drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_txrx.c:3562:56: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_txrx.c:3562:56: sparse:     got unsigned char [usertype] *irq_enable_base
   drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_txrx.c:1382:9: sparse: sparse: context imbalance in 'nbl_res_txrx_xmit_xdp_buff' - different lock contexts for basic block
   drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_txrx.c:1520:9: sparse: sparse: context imbalance in 'nbl_res_txrx_xdp_xmit' - different lock contexts for basic block
   drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_txrx.c:1535:9: sparse: sparse: context imbalance in 'nbl_res_txrx_update_xdp_tail_locked' - different lock contexts for basic block
   drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_txrx.c:1581:23: sparse: sparse: restricted __le32 degrades to integer

vim +/nbl_sysfs_qos_name +23 drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_sysfs.c

    22	
  > 23	const char *const nbl_sysfs_qos_name[] = {
    24		/* rdma */
    25		"save",
    26		"tc2pri",
    27		"sq_pri_map",
    28		"raq_pri_map",
    29		"pri_imap",
    30		"pfc_imap",
    31		"db_to_csch_en",
    32		"sw_db_csch_th",
    33		"csch_qlen_th",
    34		"poll_wgt",
    35		"sp_wrr",
    36		"tc_wgt",
    37	
    38		"pfc",
    39		"pfc_buffer",
    40		"trust",
    41		"dscp2prio",
    42		"rdma_bw",
    43		"rdma_rate",
    44		"net_rate",
    45	};
    46	
  > 47	const char *const nbl_sysfs_mirror_name[] = {
    48		"configure_down_mirror",
    49		"configure_up_mirror",
    50	};
    51	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
