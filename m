Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6B8D275B0F
	for <oe-kbuild-all@lists.linux.dev>; Tue, 28 Oct 2025 15:05:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761663911; cv=none; b=DxNEjSzq0Fz+inwRcGbN/LioUlieujYQ2W2YDE9S0HACfDwGw8S6V+9N+8W87gAVzgpmENXbwZfXSeUNVmsQf7u07IXwlVdNecc1QfT3RaQJwK56+YLCbCRekcvsRDiZu36X3OmkNh1u6/3odypmP7JSlu0hzJ2WHXQ1m9F+8GE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761663911; c=relaxed/simple;
	bh=h206awTnUrWLV2XeP2yKAXIDIuodp4XBbJy8kyByzrg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fSZQf64yjTSwjVlnohEDw7Thx0yzAiitqdBxSlUUFQrRYNLEUVrX3cF8luEYgvtNBF7zo0w7v+a4vDuO+83lkUbzW8PXPkCUNjDH+r21SLWicXv9dy+Xurrv/dXKZ8tPDFhitLSvn7EpI2P4Q9pmXq8HfMyrfrnqVSvfrdgvhOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IB65MUFc; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IB65MUFc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761663909; x=1793199909;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=h206awTnUrWLV2XeP2yKAXIDIuodp4XBbJy8kyByzrg=;
  b=IB65MUFcB59ZLu+zL6y9J5vfdXdBak68ZOQJCS69u8C5MeEOcAAH9ByQ
   //D4Y/2ruJQcW1sJq011pwemrePQ+RA1Nnuza/9Q+6LrYA8EOCUNP8umB
   ziWo02HUXpv1APhmlCGyQpoz0ASErj8y2wzlsTDTmkCs9jbJNasUyurtB
   TOku1052g0hCXCCEqIH58YAm9mo9+RvaYjNdnnbgRYbUkrEDekhI+nNJ5
   T2ntvMcrl4eEVo5XVXJay8mmFQT9Wn1FZGsBnudDraPpCuN9EVM4Ka87S
   Ttd4sspWfWtIcK/Y108IZ9jyRpglFJee4yzVqSthcjMTX5C8JEdtuwYX6
   g==;
X-CSE-ConnectionGUID: nAN9GNKDQdKCHCmTqZDz6Q==
X-CSE-MsgGUID: LCjRWtPUQbmNJf62iZNtgQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="74365830"
X-IronPort-AV: E=Sophos;i="6.19,261,1754982000"; 
   d="scan'208";a="74365830"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2025 08:05:07 -0700
X-CSE-ConnectionGUID: 6TRWl7ZWTf6Ewr39BrBONw==
X-CSE-MsgGUID: OEa2CPCcQdWvb9fcBnBoPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,261,1754982000"; 
   d="scan'208";a="189722461"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 28 Oct 2025 08:05:06 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vDlFv-000JHF-1K;
	Tue, 28 Oct 2025 15:05:03 +0000
Date: Tue, 28 Oct 2025 23:04:37 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3050/3050]
 drivers/net/ethernet/nebula-matrix/nbl/nbl_channel/nbl_cmdq.c:345:21:
 sparse: sparse: incorrect type in assignment (different base types)
Message-ID: <202510282211.DtAqTWgc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   ab8573e771fc00691b546bfb1b7432ed6b19f9bc
commit: 468b0cd7b1e1c131b3ee7d2ea8b96521d3faad8b [3050/3050] net:nebula-matrix:Add S1000 SNIC driver support
config: x86_64-randconfig-123-20251028 (https://download.01.org/0day-ci/archive/20251028/202510282211.DtAqTWgc-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251028/202510282211.DtAqTWgc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510282211.DtAqTWgc-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
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
>> drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_sysfs.c:23:12: sparse: sparse: symbol 'nbl_sysfs_qos_name' was not declared. Should it be static?
>> drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_sysfs.c:47:12: sparse: sparse: symbol 'nbl_sysfs_mirror_name' was not declared. Should it be static?
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

vim +345 drivers/net/ethernet/nebula-matrix/nbl/nbl_channel/nbl_cmdq.c

   327	
   328	static enum nbl_cmd_status
   329	nbl_cmdq_execution_nolock(struct nbl_cmd_queue *queue,
   330				  struct nbl_cmd_ring *ring,
   331				  const struct nbl_cmd_hdr *hdr,
   332				  struct nbl_cmd_desc *desc,
   333				  const struct nbl_cmd_content *cmd)
   334	{
   335		struct nbl_phy_ops *phy_ops = NBL_CHAN_MGT_TO_PHY_OPS(queue->chan_mgt);
   336		struct nbl_common_info *common = queue->chan_mgt->common;
   337	
   338		/* clean the cmd send queue to reclaim descriptors */
   339		if (nbl_cmdq_clean_sq_ring(queue) == 0) {
   340			nbl_err(common, NBL_DEBUG_FLOW, "tc flow cmd send queue full!");
   341			return NBL_CMDQ_CQ_FULL;
   342		}
   343	
   344		/* fill descriptor */
 > 345		desc->block = cpu_to_le16(hdr->block);
 > 346		desc->module = cpu_to_le16(hdr->module);
 > 347		desc->table = cpu_to_le16(hdr->table);
 > 348		desc->opcode = cpu_to_le16(hdr->opcode);
 > 349		desc->param_high = cpu_to_le32(NBL_CMDQ_HI_DWORD(cmd->in_params));
 > 350		desc->param_low = cpu_to_le32(NBL_CMDQ_LO_DWORD(cmd->in_params));
   351		desc->flags = 0;
   352		desc->seq = g_seq_index++;
   353		if (g_seq_index == 16)
   354			g_seq_index = 0;
   355	
   356		/* data to send */
   357		if (cmd->in_va && cmd->in) {
   358			desc->datalen = cmd->in_length + NBL_CMDQ_HALF_DESC_LENGTH;
 > 359			desc->flags |= cpu_to_le16(NBL_CMDQ_DESC_FLAG_BUF_IN);
 > 360			desc->send_high = cpu_to_le32(NBL_CMDQ_HI_DWORD(cmd->in));
 > 361			desc->send_low = cpu_to_le32(NBL_CMDQ_LO_DWORD(cmd->in));
   362		}
   363	
   364		/* data to receive */
   365		if (cmd->out_va && cmd->out) {
 > 366			desc->flags |= cpu_to_le16(NBL_CMDQ_DESC_FLAG_BUF_OUT);
 > 367			desc->recv_high = cpu_to_le32(NBL_CMDQ_HI_DWORD(cmd->out));
 > 368			desc->recv_low = cpu_to_le32(NBL_CMDQ_LO_DWORD(cmd->out));
   369		}
   370	
   371		/* update next_to_use */
   372		(ring->next_to_use)++;
   373		(ring->doorbell)++;
   374		if (ring->next_to_use == ring->count)
   375			ring->next_to_use = 0;
   376	
   377		/* wmb for cmdq notify */
   378		wmb();
   379		phy_ops->update_cmdq_tail(NBL_CHAN_MGT_TO_PHY_PRIV(queue->chan_mgt),
   380					  (ring->doorbell) & NBL_CMDQ_DOORBELL_MASK);
   381		return NBL_CMDQ_SUCCESS;
   382	}
   383	
   384	static inline enum nbl_cmd_status
   385	nbl_cmdq_check_content(const struct nbl_cmd_queue *queue,
   386			       const struct nbl_cmd_hdr *hdr,
   387			       const struct nbl_cmd_content *cmd)
   388	{
   389		enum nbl_cmd_status status = NBL_CMDQ_SUCCESS;
   390	
   391		if ((cmd->in_va && !cmd->in_length) ||
   392		    (!cmd->in_va && cmd->in_length) ||
   393		    (cmd->in_va && cmd->in_length > queue->sq_buf_size)) {
   394			status = NBL_CMDQ_CQ_ERR_PARAMS;
   395		}
   396	
   397		/* check parameters: the receiving part */
   398		if ((hdr->opcode == NBL_CMD_OP_READ ||
   399		     hdr->opcode == NBL_CMD_OP_SEARCH) && !cmd->out_va)
   400			status = NBL_CMDQ_CQ_ERR_PARAMS;
   401	
   402		return status;
   403	}
   404	
   405	static inline enum nbl_cmd_status
   406	nbl_cmdq_check_interface_error(struct nbl_cmd_desc *desc,
   407				       struct nbl_common_info *common)
   408	{
   409		u8 interface_err = 0;
   410		enum nbl_cmd_status status = NBL_CMDQ_SUCCESS;
   411	
   412		/* flag error bit: error in firmware cmdq interface */
   413		if (nbl_cmdq_flag_check_interface_error(desc)) {
   414			/* mark current desc as done by driver */
   415			nbl_cmdq_flag_mark_cmd_done(desc);
   416	
   417			status = NBL_CMDQ_FAILED;
   418			interface_err = (desc->flags >> NBL_CMDQ_DESC_FLAG_IF_ERR_OFT) &
   419					NBL_CMDQ_DESC_FLAG_IF_ERR_MASK;
   420			switch (interface_err) {
   421			case 0b00:
   422				/* dma error, re-send command */
   423				/* abort if failed sending command 3 times in a row */
   424				status = NBL_CMDQ_NEED_RESEND;
   425				break;
   426			case 0b01:
   427				/* driver data error, dont re-send */
   428				status = NBL_CMDQ_NOBUF_ERR;
   429				break;
   430			case 0b10:
   431			case 0b11:
   432				/* firmware sequence error, reset cmdq */
   433				status = NBL_CMDQ_NEED_RESET;
   434				break;
   435			default:
   436				/* unknown error */
   437				nbl_err(common, NBL_DEBUG_FLOW,
   438					"tc flow cmdq unknown error from firmware interface");
   439				break;
   440			}
   441		}
   442	
   443		return status;
   444	}
   445	
   446	static enum nbl_cmd_status
   447	nbl_cmdq_fetch_response(struct nbl_cmd_queue *queue, struct nbl_cmd_desc *desc,
   448				struct nbl_cmd_content *cmd, struct nbl_cmdq_dma_mem *buffer)
   449	{
   450		u8 error_code;
   451		const char *buf_start;
   452		enum nbl_cmd_status status = NBL_CMDQ_SUCCESS;
   453		struct nbl_common_info *common = queue->chan_mgt->common;
   454	
   455		/* check descriptor flag error bit for firmware business */
   456		if (nbl_cmdq_flag_check_error(desc)) {
   457			status = NBL_CMDQ_FAILED;
   458			error_code = desc->errorcode;
   459			if (error_code) {
   460				nbl_err(common, NBL_DEBUG_FLOW, "tc flow cmdq error code: %d",
   461					error_code);
   462			} else {
   463				nbl_err(common, NBL_DEBUG_FLOW,
   464					"tc flow cmdq desc error in flag but no errorcode");
   465			}
   466	
   467			goto fetch_response_end;
   468		}
   469	
   470		/* check return buffer flag bit */
   471		if (cmd->out_va && cmd->out && !nbl_cmdq_flag_check_out_buffer(desc)) {
   472			nbl_err(common, NBL_DEBUG_FLOW, "tc flow cmdq response buffer bit not matched");
   473			status = NBL_CMDQ_NOBUF_ERR;
   474			goto fetch_response_end;
   475		}
   476	
   477		/* process out buffer */
   478		if (cmd->out_va && cmd->out && buffer) {
 > 479			cmd->out_length = le16_to_cpu(desc->datalen) - NBL_CMDQ_HALF_DESC_LENGTH;
   480			if (cmd->out_length > queue->sq_buf_size) {
   481				nbl_err(common, NBL_DEBUG_FLOW,
   482					"tc flow cmdq buffer larger than allowed.\n");
   483				status = NBL_CMDQ_CQ_ERR_BUFFER;
   484				goto fetch_response_end;
   485			}
   486	
   487			if ((desc->opcode == NBL_CMD_OP_READ ||
   488			     desc->opcode == NBL_CMD_OP_SEARCH) && cmd->out_va) {
   489				buf_start = (char *)buffer->va + NBL_CMDQ_HALF_DESC_LENGTH;
   490				memcpy(cmd->out_va, buf_start, cmd->out_length);
   491			}
   492		}
   493	
   494	fetch_response_end:
   495		queue->sq_last_status = status;
   496		return status;
   497	}
   498	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
