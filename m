Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34EFC1F8EEA
	for <oe-kbuild-all@lists.linux.dev>; Mon,  2 Dec 2024 06:50:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733122262; cv=none; b=uen2UitJIUY1Yjp1zHaRhNusxXzbxwIIUJWSDgy8mVm0tKMeQG53eRMRU42WHjxNUYzw2SGuGCM/Xt+gMWFkgRMyChhzRE12wTTdHJdY78sGzhaODp9+D9D2FamqLGQ1EFOkoPtWF7RNNXzvJe9l+ab5LHDXKEqU4oc7rTjej8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733122262; c=relaxed/simple;
	bh=EK1dGMcawueu/8qHdcYZHOYK5E1+dg7tBc1SSvKluqQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Bom0xs1cTddMIqLQkpt96RamN+n0ZIacrHLXAY6opkrPTGAdXmJxNtZ9RWi82BYw494eBAuywuYuI1nA5vg4X3EzXuXu1Va/5+y8h2+hdoErhUOf/z4xD5CFnfhC0qxfBagUGbjDdSPcjZE0HCq8aH/ZoIFxmgeGNsCTSLd9pdM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=n+VqHnyO; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="n+VqHnyO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733122259; x=1764658259;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EK1dGMcawueu/8qHdcYZHOYK5E1+dg7tBc1SSvKluqQ=;
  b=n+VqHnyOZjnw/J0VweiAsxTiU2kNV1gRV9WoPLLzs7CR2kvkukPYaTsE
   t/jYdBy/Uq9/CmxUM5zLDUzi55XdxNdEF141uymKg04u/RcNcBQ21Rti0
   xbh07IqD5fF2i0iJwjv1AwVl3ZGdAKo9FiIzjaaRX2J2q1jO1yb4mAqbh
   pOkTxRimqcAMmVqazq+Zvql13GzapfTz4DGbi5F8m3pFOVEwZ7u0Ssmba
   2pr74XVYRMe0aJiKmYIM1gG0fVi+pHLo1k6TarHmDw4mn6pmIDeWf0na+
   eeVqTZp0m2FO2u5jEtNet9kurCibm6boBCc/854roxfDk95j2Pn0HA4uN
   g==;
X-CSE-ConnectionGUID: 1i6VZTiSTE+D9SNH6y3a/Q==
X-CSE-MsgGUID: P9SPT1FJTkahtWVHiUegaQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11273"; a="33521476"
X-IronPort-AV: E=Sophos;i="6.12,201,1728975600"; 
   d="scan'208";a="33521476"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2024 22:50:56 -0800
X-CSE-ConnectionGUID: SzM8BJ1EQjiFOfIBInMocg==
X-CSE-MsgGUID: e8bxIhmsQYKDshY8WKM3hA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,201,1728975600"; 
   d="scan'208";a="97975499"
Received: from lkp-server02.sh.intel.com (HELO 36a1563c48ff) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 01 Dec 2024 22:50:55 -0800
Received: from kbuild by 36a1563c48ff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tI0Gh-00029a-2l;
	Mon, 02 Dec 2024 06:50:51 +0000
Date: Mon, 2 Dec 2024 14:50:47 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Bennie Yan <bennie.yan@nebula-matrix.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 1474/1474]
 drivers/net/ethernet/nebula-matrix/nbl/nbl_channel/nbl_channel.c:941:6:
 sparse: sparse: symbol 'nbl_chan_clean_queue_subtask' was not declared.
 Should it be static?
Message-ID: <202412021413.kHPyVNmN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Bennie,

First bad commit (maybe != root cause):

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   df4c334beecb4cf58e4e8d63b491aa5ac0a84f46
commit: 69181c3c9413ccaa4dab458057d13efda520cb60 [1474/1474] Net: nebula_matrix: fix ci build warning
config: x86_64-randconfig-121-20241118 (https://download.01.org/0day-ci/archive/20241202/202412021413.kHPyVNmN-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241202/202412021413.kHPyVNmN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412021413.kHPyVNmN-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/net/ethernet/nebula-matrix/nbl/nbl_channel/nbl_channel.c:941:6: sparse: sparse: symbol 'nbl_chan_clean_queue_subtask' was not declared. Should it be static?
--
>> drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_hw_leonis/nbl_flow_leonis.c:450:6: sparse: sparse: symbol 'nbl_flow_set_mt_input' was not declared. Should it be static?
>> drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_hw_leonis/nbl_flow_leonis.c:556:5: sparse: sparse: symbol 'nbl_flow_insert_pp_ht' was not declared. Should it be static?
>> drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_hw_leonis/nbl_flow_leonis.c:1264:6: sparse: sparse: symbol 'templete_name' was not declared. Should it be static?
   drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_hw_leonis/nbl_flow_leonis.c: note: in included file (through include/linux/rculist.h, include/linux/pid.h, include/linux/sched.h, ...):
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
--
>> drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_queue.c:39:9: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_queue.c:39:9: sparse:    int
   drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_queue.c:39:9: sparse:    void
--
>> drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_txrx.c:49:35: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected unsigned char [noderef] [usertype] __iomem *notify_addr @@     got unsigned char [usertype] * @@
   drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_txrx.c:49:35: sparse:     expected unsigned char [noderef] [usertype] __iomem *notify_addr
   drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_txrx.c:49:35: sparse:     got unsigned char [usertype] *
>> drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_txrx.c:15:5: sparse: sparse: symbol 'nbl_alloc_tx_rings' was not declared. Should it be static?
>> drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_txrx.c:976:39: sparse: sparse: cast to restricted __le16
>> drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_txrx.c:1049:48: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got unsigned char [usertype] *irq_enable_base @@
   drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_txrx.c:1049:48: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_txrx.c:1049:48: sparse:     got unsigned char [usertype] *irq_enable_base
>> drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_txrx.c:1291:22: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] len @@     got unsigned int [assigned] size @@
   drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_txrx.c:1291:22: sparse:     expected restricted __le32 [usertype] len
   drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_txrx.c:1291:22: sparse:     got unsigned int [assigned] size
   drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_txrx.c:1326:30: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] len @@     got unsigned int [assigned] size @@
   drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_txrx.c:1326:30: sparse:     expected restricted __le32 [usertype] len
   drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_txrx.c:1326:30: sparse:     got unsigned int [assigned] size
>> drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_txrx.c:1452:33: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] len @@     got unsigned int [assigned] [usertype] pkthdr_len @@
   drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_txrx.c:1452:33: sparse:     expected restricted __le32 [usertype] len
   drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_txrx.c:1452:33: sparse:     got unsigned int [assigned] [usertype] pkthdr_len
>> drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_txrx.c:1482:25: sparse: sparse: bad assignment (+=) to restricted __le32
>> drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_txrx.c:1748:40: sparse: sparse: restricted __le32 degrades to integer
   drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_txrx.c:1749:32: sparse: sparse: restricted __le32 degrades to integer
   drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_txrx.c:2063:24: sparse: sparse: cast to restricted __le16
--
>> drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_ethtool.c:308:6: sparse: sparse: symbol 'nbl_serv_adjust_interrpt_param' was not declared. Should it be static?
>> drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_ethtool.c:510:5: sparse: sparse: symbol 'nbl_get_eeprom_length' was not declared. Should it be static?
>> drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_ethtool.c:515:5: sparse: sparse: symbol 'nbl_get_eeprom' was not declared. Should it be static?
--
>> drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_service.c:32:5: sparse: sparse: symbol 'nbl_serv_setup_queues' was not declared. Should it be static?
>> drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_service.c:68:6: sparse: sparse: symbol 'nbl_serv_flush_rx_queues' was not declared. Should it be static?
>> drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_service.c:77:5: sparse: sparse: symbol 'nbl_serv_setup_rings' was not declared. Should it be static?
>> drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_service.c:124:6: sparse: sparse: symbol 'nbl_serv_stop_rings' was not declared. Should it be static?
>> drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_service.c:2116:6: sparse: sparse: symbol 'nbl_serv_pldmfw_op_pci_match_record' was not declared. Should it be static?
>> drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_service.c:2528:38: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const [noderef] __user *from @@     got void * @@
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_service.c:2528:38: sparse:     expected void const [noderef] __user *from
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_service.c:2528:38: sparse:     got void *
>> drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_service.c:2540:29: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void [noderef] __user *to @@     got void * @@
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_service.c:2540:29: sparse:     expected void [noderef] __user *to
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_service.c:2540:29: sparse:     got void *
>> drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_service.c:2851:5: sparse: sparse: symbol 'nbl_serv_get_vf_base_vsi_id' was not declared. Should it be static?
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_service.c: note: in included file (through include/linux/preempt.h, include/linux/spinlock.h, include/linux/mmzone.h, ...):
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_service.c: note: in included file (through arch/x86/include/asm/uaccess.h, include/linux/uaccess.h, include/linux/sched/task.h, ...):
   arch/x86/include/asm/uaccess_64.h:88:24: sparse: sparse: cast removes address space '__user' of expression
   arch/x86/include/asm/uaccess_64.h:88:24: sparse: sparse: cast removes address space '__user' of expression
--
>> drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dispatch.c:103:9: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dispatch.c:103:9: sparse:    int
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dispatch.c:103:9: sparse:    void
>> drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dispatch.c:103:9: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dispatch.c:103:9: sparse:    int
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dispatch.c:103:9: sparse:    void
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dispatch.c:186:9: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dispatch.c:186:9: sparse:    int
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dispatch.c:186:9: sparse:    void
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dispatch.c:186:9: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dispatch.c:186:9: sparse:    int
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dispatch.c:186:9: sparse:    void
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dispatch.c:245:9: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dispatch.c:245:9: sparse:    int
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dispatch.c:245:9: sparse:    void
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dispatch.c:245:9: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dispatch.c:245:9: sparse:    int
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dispatch.c:245:9: sparse:    void
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dispatch.c:449:9: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dispatch.c:449:9: sparse:    int
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dispatch.c:449:9: sparse:    void
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dispatch.c:449:9: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dispatch.c:449:9: sparse:    int
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dispatch.c:449:9: sparse:    void
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dispatch.c:549:9: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dispatch.c:549:9: sparse:    int
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dispatch.c:549:9: sparse:    void
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dispatch.c:549:9: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dispatch.c:549:9: sparse:    int
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dispatch.c:549:9: sparse:    void
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dispatch.c:610:9: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dispatch.c:610:9: sparse:    int
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dispatch.c:610:9: sparse:    void
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dispatch.c:610:9: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dispatch.c:610:9: sparse:    int
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dispatch.c:610:9: sparse:    void
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dispatch.c:688:9: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dispatch.c:688:9: sparse:    int
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dispatch.c:688:9: sparse:    void
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dispatch.c:688:9: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dispatch.c:688:9: sparse:    int
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dispatch.c:688:9: sparse:    void
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dispatch.c:804:9: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dispatch.c:804:9: sparse:    int
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dispatch.c:804:9: sparse:    void
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dispatch.c:804:9: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dispatch.c:804:9: sparse:    int
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dispatch.c:804:9: sparse:    void
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dispatch.c:962:9: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dispatch.c:962:9: sparse:    int
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dispatch.c:962:9: sparse:    void
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dispatch.c:1111:9: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dispatch.c:1111:9: sparse:    int
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dispatch.c:1111:9: sparse:    void
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dispatch.c:1155:9: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dispatch.c:1155:9: sparse:    int
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dispatch.c:1155:9: sparse:    void
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dispatch.c:1155:9: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dispatch.c:1155:9: sparse:    int
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dispatch.c:1155:9: sparse:    void
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dispatch.c:1193:9: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dispatch.c:1193:9: sparse:    int
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dispatch.c:1193:9: sparse:    void
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dispatch.c:1235:9: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dispatch.c:1235:9: sparse:    int
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dispatch.c:1235:9: sparse:    void
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dispatch.c:1276:9: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dispatch.c:1276:9: sparse:    int
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dispatch.c:1276:9: sparse:    void
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dispatch.c:1314:9: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dispatch.c:1314:9: sparse:    int
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dispatch.c:1314:9: sparse:    void
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dispatch.c:1351:9: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dispatch.c:1351:9: sparse:    int
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dispatch.c:1351:9: sparse:    void
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dispatch.c:1389:9: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dispatch.c:1389:9: sparse:    int
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dispatch.c:1389:9: sparse:    void
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dispatch.c:1551:9: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dispatch.c:1551:9: sparse:    int
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dispatch.c:1551:9: sparse:    void
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dispatch.c:1616:9: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dispatch.c:1616:9: sparse:    int
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dispatch.c:1616:9: sparse:    void
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dispatch.c:1616:9: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dispatch.c:1616:9: sparse:    int
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dispatch.c:1616:9: sparse:    void
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dispatch.c:1647:9: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dispatch.c:1647:9: sparse:    int
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dispatch.c:1647:9: sparse:    void
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dispatch.c:1647:9: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dispatch.c:1647:9: sparse:    int
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dispatch.c:1647:9: sparse:    void
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dispatch.c:1735:9: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dispatch.c:1735:9: sparse:    int
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dispatch.c:1735:9: sparse:    void
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dispatch.c:1769:9: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dispatch.c:1769:9: sparse:    int
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dispatch.c:1769:9: sparse:    void
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dispatch.c:1796:9: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dispatch.c:1796:9: sparse:    int
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dispatch.c:1796:9: sparse:    void
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dispatch.c:1824:9: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dispatch.c:1824:9: sparse:    int
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dispatch.c:1824:9: sparse:    void
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dispatch.c:1833:9: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dispatch.c:1833:9: sparse:    int
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dispatch.c:1833:9: sparse:    void
>> drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dispatch.c:1866:16: sparse: sparse: Using plain integer as NULL pointer
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dispatch.c:1877:9: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dispatch.c:1877:9: sparse:    int
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dispatch.c:1877:9: sparse:    void
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dispatch.c:1887:9: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dispatch.c:1887:9: sparse:    int
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dispatch.c:1887:9: sparse:    void
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dispatch.c:1897:9: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dispatch.c:1897:9: sparse:    int
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dispatch.c:1897:9: sparse:    void
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dispatch.c:1933:9: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dispatch.c:1933:9: sparse:    int
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dispatch.c:1933:9: sparse:    void
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dispatch.c:1933:9: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dispatch.c:1933:9: sparse:    int
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dispatch.c:1933:9: sparse:    void
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dispatch.c:1962:9: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dispatch.c:1962:9: sparse:    int
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dispatch.c:1962:9: sparse:    void
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dispatch.c:1962:9: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dispatch.c:1962:9: sparse:    int
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dispatch.c:1962:9: sparse:    void
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dispatch.c:1980:9: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dispatch.c:1980:9: sparse:    int
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dispatch.c:1980:9: sparse:    void
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dispatch.c:1980:9: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dispatch.c:1980:9: sparse:    int
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dispatch.c:1980:9: sparse:    void
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dispatch.c:2002:9: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dispatch.c:2002:9: sparse:    int
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dispatch.c:2002:9: sparse:    void
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dispatch.c:2002:9: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dispatch.c:2002:9: sparse:    int
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dispatch.c:2002:9: sparse:    void
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dispatch.c:2036:9: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dispatch.c:2036:9: sparse:    int
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dispatch.c:2036:9: sparse:    void
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dispatch.c:2036:9: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dispatch.c:2036:9: sparse:    int
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dispatch.c:2036:9: sparse:    void
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dispatch.c:2064:16: sparse: sparse: Using plain integer as NULL pointer
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dispatch.c:2092:9: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dispatch.c:2092:9: sparse:    int
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dispatch.c:2092:9: sparse:    void
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dispatch.c:2092:9: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dispatch.c:2092:9: sparse:    int
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dispatch.c:2092:9: sparse:    void
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dispatch.c:2120:9: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dispatch.c:2120:9: sparse:    int
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dispatch.c:2120:9: sparse:    void
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dispatch.c:2120:9: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dispatch.c:2120:9: sparse:    int
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dispatch.c:2120:9: sparse:    void
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dispatch.c:2138:9: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dispatch.c:2138:9: sparse:    int
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dispatch.c:2138:9: sparse:    void
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dispatch.c:2138:9: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dispatch.c:2138:9: sparse:    int
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dispatch.c:2138:9: sparse:    void
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dispatch.c:2148:9: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dispatch.c:2148:9: sparse:    int
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dispatch.c:2148:9: sparse:    void
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dispatch.c:2157:9: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dispatch.c:2157:9: sparse:    int
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dispatch.c:2157:9: sparse:    void
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dispatch.c:2157:9: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dispatch.c:2157:9: sparse:    int
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dispatch.c:2157:9: sparse:    void
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dispatch.c:2167:9: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dispatch.c:2167:9: sparse:    int
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dispatch.c:2167:9: sparse:    void
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dispatch.c:2167:9: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dispatch.c:2167:9: sparse:    int
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dispatch.c:2167:9: sparse:    void
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dispatch.c:2209:9: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dispatch.c:2209:9: sparse:    int
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dispatch.c:2209:9: sparse:    void
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dispatch.c:2224:9: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dispatch.c:2224:9: sparse:    int
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dispatch.c:2224:9: sparse:    void
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dispatch.c:2224:9: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dispatch.c:2224:9: sparse:    int
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dispatch.c:2224:9: sparse:    void
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dispatch.c:2278:9: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dispatch.c:2278:9: sparse:    int
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dispatch.c:2278:9: sparse:    void
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dispatch.c:2278:9: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dispatch.c:2278:9: sparse:    int
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dispatch.c:2278:9: sparse:    void
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dispatch.c:2309:9: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dispatch.c:2309:9: sparse:    int
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dispatch.c:2309:9: sparse:    void
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dispatch.c:2318:9: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dispatch.c:2318:9: sparse:    int
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dispatch.c:2318:9: sparse:    void
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dispatch.c:2329:9: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dispatch.c:2329:9: sparse:    int
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dispatch.c:2329:9: sparse:    void
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dispatch.c:2362:9: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dispatch.c:2362:9: sparse:    int
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dispatch.c:2362:9: sparse:    void

vim +/nbl_chan_clean_queue_subtask +941 drivers/net/ethernet/nebula-matrix/nbl/nbl_channel/nbl_channel.c

bad535d287c9c1 Bennie Yan 2024-09-24  940  
bad535d287c9c1 Bennie Yan 2024-09-24 @941  void nbl_chan_clean_queue_subtask(void *priv, u8 chan_type)
bad535d287c9c1 Bennie Yan 2024-09-24  942  {
bad535d287c9c1 Bennie Yan 2024-09-24  943  	struct nbl_channel_mgt *chan_mgt = (struct nbl_channel_mgt *)priv;
bad535d287c9c1 Bennie Yan 2024-09-24  944  	struct nbl_chan_info *chan_info = NBL_CHAN_MGT_TO_CHAN_INFO(chan_mgt, chan_type);
bad535d287c9c1 Bennie Yan 2024-09-24  945  
bad535d287c9c1 Bennie Yan 2024-09-24  946  	if (!test_bit(NBL_CHAN_INTERRUPT_READY, chan_info->state) ||
bad535d287c9c1 Bennie Yan 2024-09-24  947  	    test_bit(NBL_CHAN_RESETTING, chan_info->state))
bad535d287c9c1 Bennie Yan 2024-09-24  948  		return;
bad535d287c9c1 Bennie Yan 2024-09-24  949  
bad535d287c9c1 Bennie Yan 2024-09-24  950  	nbl_chan_clean_queue(chan_mgt, chan_info);
bad535d287c9c1 Bennie Yan 2024-09-24  951  }
bad535d287c9c1 Bennie Yan 2024-09-24  952  

:::::: The code at line 941 was first introduced by commit
:::::: bad535d287c9c1056d99de3666be7da84de4a8fc Net:nbl_core: Add nbl_core-driver for nebula-matrix S1055AS series smart NIC.

:::::: TO: Bennie Yan <bennie.yan@nebula-matrix.com>
:::::: CC: Bennie Yan <bennie.yan@nebula-matrix.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
