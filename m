Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B819B1865E5
	for <oe-kbuild-all@lists.linux.dev>; Wed, 20 Nov 2024 07:47:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732088837; cv=none; b=oZ+KRJhnxVdw7GF1KRdphiXNDR/DguQK7j9Jd33Ui1T7NOIaBQ3bOZBm9q31peVQmoZeHwfE0MQPrfiSIGg9E6ISM04VVc+6H+oUZvRWwviF5JQy7ryE/WQN9C9NiE6Nf2rJ75trBChcwb93uPEZbIXa7rGUXdEYjMWU4vZcb0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732088837; c=relaxed/simple;
	bh=DEtLaHJCYohnOjajqYrJ8dHJQ9GvK5E5IwCsb0u1kbY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hgmkkxQLqARJo7BiJQMAqsEEEtElPPh4qmG+8gmH1rk0d552pa5jhneeWGAklmyhG4WocZec8HH9p4xhWBL/FvXkglCZggdrZwNmO/xPhsiLFWBfgi+iT/jzF5IioFb17dhnnagRV57ADGZG1RaruoqpRskg1bm69+vcVN1eEf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cJSeQOgr; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cJSeQOgr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732088835; x=1763624835;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DEtLaHJCYohnOjajqYrJ8dHJQ9GvK5E5IwCsb0u1kbY=;
  b=cJSeQOgrgiHiY78xCZk+QaMfhCbF8/pauvylLVxtV4dTW9a6O0bmEVRP
   pAxIOBxByDpzh+zTapiZ1Ik2NAZi/oDTn/LqrgOWw7DN/hM/k/7QogzC5
   fVfNySA67Qa9VJAx72MJzcuTrztxgL+7lk7TnYE86VGDoZp/xjJk1hjcf
   jNFOOORGI/jAPm8DM/+PnAWWrfAOL9AaR0bkGRxnJHUi/s48nTxJrmhGE
   qda+3aKY3RNl+oQSNaC7fI+AeEo6iBNFcb9HaUqrHrnODiBLo0p3WRXAl
   4FZzSGsrLRfYP2QyU3Hd7s4fFMR7szPp6fT8znN9JmCKh9Uz1371SpxOZ
   g==;
X-CSE-ConnectionGUID: cPFzzhLRT5uPrQl0nlD3yw==
X-CSE-MsgGUID: WE6gOvMpSwiuF/Vs1GehSQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11261"; a="32064043"
X-IronPort-AV: E=Sophos;i="6.12,169,1728975600"; 
   d="scan'208";a="32064043"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2024 23:47:14 -0800
X-CSE-ConnectionGUID: dZKPVXzATzCCe1aLOj1KUA==
X-CSE-MsgGUID: MSL4rCwYT8O6YptxQZOFWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,169,1728975600"; 
   d="scan'208";a="90644547"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 19 Nov 2024 23:47:12 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tDfQc-0000eX-0h;
	Wed, 20 Nov 2024 07:47:10 +0000
Date: Wed, 20 Nov 2024 15:46:39 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Bennie Yan <bennie.yan@nebula-matrix.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 1474/1474]
 drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_queue.c:39:9: sparse:
 sparse: incompatible types in conditional expression (different base types):
Message-ID: <202411201504.PHzBNdRf-lkp@intel.com>
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
head:   cce003012298a00277187319a2527882a18278c1
commit: 69181c3c9413ccaa4dab458057d13efda520cb60 [1474/1474] Net: nebula_matrix: fix ci build warning
config: x86_64-randconfig-121-20241118 (https://download.01.org/0day-ci/archive/20241120/202411201504.PHzBNdRf-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241120/202411201504.PHzBNdRf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411201504.PHzBNdRf-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_queue.c:39:9: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_queue.c:39:9: sparse:    int
   drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_queue.c:39:9: sparse:    void
--
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
>> drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_ethtool.c:308:6: sparse: sparse: symbol 'nbl_serv_adjust_interrpt_param' was not declared. Should it be static?
>> drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_ethtool.c:510:5: sparse: sparse: symbol 'nbl_get_eeprom_length' was not declared. Should it be static?
>> drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_ethtool.c:515:5: sparse: sparse: symbol 'nbl_get_eeprom' was not declared. Should it be static?
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

vim +39 drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_queue.c

bad535d287c9c1 Bennie Yan 2024-09-24  24  
bad535d287c9c1 Bennie Yan 2024-09-24  25  int nbl_queue_mgt_start(struct nbl_resource_mgt *res_mgt)
bad535d287c9c1 Bennie Yan 2024-09-24  26  {
bad535d287c9c1 Bennie Yan 2024-09-24  27  	struct device *dev;
bad535d287c9c1 Bennie Yan 2024-09-24  28  	struct nbl_queue_mgt **queue_mgt;
bad535d287c9c1 Bennie Yan 2024-09-24  29  	struct nbl_res_product_ops *product_ops = NBL_RES_MGT_TO_PROD_OPS(res_mgt);
bad535d287c9c1 Bennie Yan 2024-09-24  30  	int ret = 0;
bad535d287c9c1 Bennie Yan 2024-09-24  31  
bad535d287c9c1 Bennie Yan 2024-09-24  32  	dev = NBL_RES_MGT_TO_DEV(res_mgt);
bad535d287c9c1 Bennie Yan 2024-09-24  33  	queue_mgt = &NBL_RES_MGT_TO_QUEUE_MGT(res_mgt);
bad535d287c9c1 Bennie Yan 2024-09-24  34  
bad535d287c9c1 Bennie Yan 2024-09-24  35  	ret = nbl_queue_setup_mgt(dev, queue_mgt);
bad535d287c9c1 Bennie Yan 2024-09-24  36  	if (ret)
bad535d287c9c1 Bennie Yan 2024-09-24  37  		return ret;
bad535d287c9c1 Bennie Yan 2024-09-24  38  
bad535d287c9c1 Bennie Yan 2024-09-24 @39  	NBL_OPS_CALL(product_ops->queue_mgt_init, (*queue_mgt));
bad535d287c9c1 Bennie Yan 2024-09-24  40  
bad535d287c9c1 Bennie Yan 2024-09-24  41  	return 0;
bad535d287c9c1 Bennie Yan 2024-09-24  42  }
bad535d287c9c1 Bennie Yan 2024-09-24  43  

:::::: The code at line 39 was first introduced by commit
:::::: bad535d287c9c1056d99de3666be7da84de4a8fc Net:nbl_core: Add nbl_core-driver for nebula-matrix S1055AS series smart NIC.

:::::: TO: Bennie Yan <bennie.yan@nebula-matrix.com>
:::::: CC: Bennie Yan <bennie.yan@nebula-matrix.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
