Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E5E02E3362
	for <oe-kbuild-all@lists.linux.dev>; Sun, 16 Mar 2025 03:04:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742094271; cv=none; b=GRC+VcjZHDCAVa3gePf9wk8l0n0Db34xn8xFd0LTYnnpjsDe98qSpg6N0yel95L1M+64rTrJvO3zqmHr8a6mBrTwOVbsdlA6Rx7ZCvOOkAVN/Ja0QcCs4lKwYwb5tLlwrjy2s8JIoKXU5yETxT3Qe4PPfdWf643v00eGVWnp8WQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742094271; c=relaxed/simple;
	bh=9pILu5NsZj5/FqPaxFkkk+YqWkOo2jm1IAmua/AMVA0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oi/+/0TnfAY40BXR8sIR63XTwsXVKpwB/9JjodRjL8Lu91fEsbqzQaoC4Eb3hGHER68IaUBFLEopAzVuqqj954GW+Ib023UiDyb7AI0OrCbpFjGpc9AUivmZEOLXU+4aWPEnHY7uhlzGMwRy3YMz7kO49ST0ADvqaMoeoPgXddw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FgPpFANd; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FgPpFANd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742094269; x=1773630269;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9pILu5NsZj5/FqPaxFkkk+YqWkOo2jm1IAmua/AMVA0=;
  b=FgPpFANddh9gcb108/45oP83w7EHcv4FtwsPfm2+QJWUIyXVv4310nkc
   Yt6mVSujgVLq4+fIumyIE4iEfH3dlUnKrSJaLgdumc3lUxbTHKcVBv+Lb
   qVdpPjuMdhnowbS4mmgmt6MosSTz0BhUVEXPoj1TlZoP+c5FRLdl/QaCM
   rH+VRioO0z2IT6vNLQ5LtOtQbo686hP4+JUyErlN6CO2NxHf3mkcGlRTm
   Kc2r9pDQCfEAlhLCRwxJcVh/K2khv9glE13vKfvuYJsvagYaU6aQkEMQ6
   2U2Go1TmXpVqvvTe/XI/jaTbKn8vqKad6jTlBZgI5/++I28L6CbI+Va/r
   Q==;
X-CSE-ConnectionGUID: c4/1wwJJQV6ONRSSXKSkEA==
X-CSE-MsgGUID: 8T01JJjjQP6PD5CQY1V9XA==
X-IronPort-AV: E=McAfee;i="6700,10204,11374"; a="65676850"
X-IronPort-AV: E=Sophos;i="6.14,251,1736841600"; 
   d="scan'208";a="65676850"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Mar 2025 20:04:28 -0700
X-CSE-ConnectionGUID: WIqXgw3VStiJuQtxvMrnMw==
X-CSE-MsgGUID: exywqb2mQ2yhJukiHLEV+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,251,1736841600"; 
   d="scan'208";a="152507365"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 15 Mar 2025 20:04:26 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tteIW-000BoF-0Y;
	Sun, 16 Mar 2025 03:04:21 +0000
Date: Sun, 16 Mar 2025 11:03:39 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Xie XiuQi <xiexiuqi@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1473/1473]
 drivers/net/ethernet/huawei/hinic/hinic_lld.c:142:1: sparse: sparse: symbol
 'g_hinic_chip_list' was not declared. Should it be static?
Message-ID: <202503161041.eseBkXZW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   d734d6bbda17b68dd3979a9f707564a18cf04761
commit: 6cb2e756917d122560e0c52f350682760d004eec [1473/1473] net: hinic: Add NIC Layer
config: arm64-randconfig-r132-20250309 (https://download.01.org/0day-ci/archive/20250316/202503161041.eseBkXZW-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce: (https://download.01.org/0day-ci/archive/20250316/202503161041.eseBkXZW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503161041.eseBkXZW-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/net/ethernet/huawei/hinic/hinic_lld.c:142:1: sparse: sparse: symbol 'g_hinic_chip_list' was not declared. Should it be static?
   drivers/net/ethernet/huawei/hinic/hinic_lld.c:158:23: sparse: sparse: symbol 'g_lld_lock' was not declared. Should it be static?
>> drivers/net/ethernet/huawei/hinic/hinic_lld.c:484:31: sparse: sparse: symbol 'ver_incompat_table' was not declared. Should it be static?
>> drivers/net/ethernet/huawei/hinic/hinic_lld.c:529:5: sparse: sparse: symbol 'hinic_version_cmp' was not declared. Should it be static?
>> drivers/net/ethernet/huawei/hinic/hinic_lld.c:754:29: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] manufacture_id @@     got restricted __be32 [usertype] @@
   drivers/net/ethernet/huawei/hinic/hinic_lld.c:754:29: sparse:     expected unsigned int [usertype] manufacture_id
   drivers/net/ethernet/huawei/hinic/hinic_lld.c:754:29: sparse:     got restricted __be32 [usertype]
>> drivers/net/ethernet/huawei/hinic/hinic_lld.c:755:24: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short [usertype] resp_code @@     got restricted __be16 [usertype] @@
   drivers/net/ethernet/huawei/hinic/hinic_lld.c:755:24: sparse:     expected unsigned short [usertype] resp_code
   drivers/net/ethernet/huawei/hinic/hinic_lld.c:755:24: sparse:     got restricted __be16 [usertype]
>> drivers/net/ethernet/huawei/hinic/hinic_lld.c:756:26: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short [usertype] reason_code @@     got restricted __be16 [usertype] @@
   drivers/net/ethernet/huawei/hinic/hinic_lld.c:756:26: sparse:     expected unsigned short [usertype] reason_code
   drivers/net/ethernet/huawei/hinic/hinic_lld.c:756:26: sparse:     got restricted __be16 [usertype]
   drivers/net/ethernet/huawei/hinic/hinic_lld.c:801:16: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] @@     got restricted __be32 [usertype] @@
   drivers/net/ethernet/huawei/hinic/hinic_lld.c:801:16: sparse:     expected unsigned int [usertype]
   drivers/net/ethernet/huawei/hinic/hinic_lld.c:801:16: sparse:     got restricted __be32 [usertype]
   drivers/net/ethernet/huawei/hinic/hinic_lld.c:802:16: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] @@     got restricted __be32 [usertype] @@
   drivers/net/ethernet/huawei/hinic/hinic_lld.c:802:16: sparse:     expected unsigned int [usertype]
   drivers/net/ethernet/huawei/hinic/hinic_lld.c:802:16: sparse:     got restricted __be32 [usertype]
   drivers/net/ethernet/huawei/hinic/hinic_lld.c:803:16: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] @@     got restricted __be32 [usertype] @@
   drivers/net/ethernet/huawei/hinic/hinic_lld.c:803:16: sparse:     expected unsigned int [usertype]
   drivers/net/ethernet/huawei/hinic/hinic_lld.c:803:16: sparse:     got restricted __be32 [usertype]
   drivers/net/ethernet/huawei/hinic/hinic_lld.c:804:14: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] @@     got restricted __be32 [usertype] @@
   drivers/net/ethernet/huawei/hinic/hinic_lld.c:804:14: sparse:     expected unsigned int [usertype]
   drivers/net/ethernet/huawei/hinic/hinic_lld.c:804:14: sparse:     got restricted __be32 [usertype]
   drivers/net/ethernet/huawei/hinic/hinic_lld.c:842:52: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] @@     got restricted __be32 [usertype] ifa_address @@
   drivers/net/ethernet/huawei/hinic/hinic_lld.c:842:52: sparse:     expected unsigned int [usertype]
   drivers/net/ethernet/huawei/hinic/hinic_lld.c:842:52: sparse:     got restricted __be32 [usertype] ifa_address
   drivers/net/ethernet/huawei/hinic/hinic_lld.c:881:25: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short [usertype] ip_cnt @@     got restricted __be16 [usertype] @@
   drivers/net/ethernet/huawei/hinic/hinic_lld.c:881:25: sparse:     expected unsigned short [usertype] ip_cnt
   drivers/net/ethernet/huawei/hinic/hinic_lld.c:881:25: sparse:     got restricted __be16 [usertype]
>> drivers/net/ethernet/huawei/hinic/hinic_lld.c:1268:6: sparse: sparse: symbol 'hinic_get_ppf_hwdev_by_pdev' was not declared. Should it be static?
>> drivers/net/ethernet/huawei/hinic/hinic_lld.c:1539:19: sparse: sparse: cast to restricted __be32
>> drivers/net/ethernet/huawei/hinic/hinic_lld.c:1781:57: sparse: sparse: Using plain integer as NULL pointer
>> drivers/net/ethernet/huawei/hinic/hinic_lld.c:1824:6: sparse: sparse: symbol 'hinic_event_process' was not declared. Should it be static?
   drivers/net/ethernet/huawei/hinic/hinic_lld.c:2203:32: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void *[assigned] cfg_reg_base @@     got void [noderef] __iomem *cfg_reg_base @@
   drivers/net/ethernet/huawei/hinic/hinic_lld.c:2203:32: sparse:     expected void *[assigned] cfg_reg_base
   drivers/net/ethernet/huawei/hinic/hinic_lld.c:2203:32: sparse:     got void [noderef] __iomem *cfg_reg_base
   drivers/net/ethernet/huawei/hinic/hinic_lld.c:2204:33: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void *[assigned] intr_reg_base @@     got void [noderef] __iomem *intr_reg_base @@
   drivers/net/ethernet/huawei/hinic/hinic_lld.c:2204:33: sparse:     expected void *[assigned] intr_reg_base
   drivers/net/ethernet/huawei/hinic/hinic_lld.c:2204:33: sparse:     got void [noderef] __iomem *intr_reg_base
   drivers/net/ethernet/huawei/hinic/hinic_lld.c:2205:27: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void *[assigned] db_base @@     got void [noderef] __iomem *db_base @@
   drivers/net/ethernet/huawei/hinic/hinic_lld.c:2205:27: sparse:     expected void *[assigned] db_base
   drivers/net/ethernet/huawei/hinic/hinic_lld.c:2205:27: sparse:     got void [noderef] __iomem *db_base
>> drivers/net/ethernet/huawei/hinic/hinic_lld.c:2207:32: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void *[assigned] dwqe_mapping @@     got void [noderef] __iomem *dwqe_mapping @@
   drivers/net/ethernet/huawei/hinic/hinic_lld.c:2207:32: sparse:     expected void *[assigned] dwqe_mapping
   drivers/net/ethernet/huawei/hinic/hinic_lld.c:2207:32: sparse:     got void [noderef] __iomem *dwqe_mapping
   drivers/net/ethernet/huawei/hinic/hinic_lld.c:529:5: warning: no previous prototype for 'hinic_version_cmp' [-Wmissing-prototypes]
     529 | int hinic_version_cmp(char *ver1, char *ver2)
         |     ^~~~~~~~~~~~~~~~~
   drivers/net/ethernet/huawei/hinic/hinic_lld.c:1268:7: warning: no previous prototype for 'hinic_get_ppf_hwdev_by_pdev' [-Wmissing-prototypes]
    1268 | void *hinic_get_ppf_hwdev_by_pdev(struct pci_dev *pdev)
         |       ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/huawei/hinic/hinic_lld.c:1390:5: warning: no previous prototype for 'hinic_get_card_func_info_by_card_name' [-Wmissing-prototypes]
    1390 | int hinic_get_card_func_info_by_card_name(char *chip_name,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/huawei/hinic/hinic_lld.c:1824:6: warning: no previous prototype for 'hinic_event_process' [-Wmissing-prototypes]
    1824 | void hinic_event_process(void *adapter, struct hinic_event_info *event)
         |      ^~~~~~~~~~~~~~~~~~~
--
>> drivers/net/ethernet/huawei/hinic/hinic_qp.c:49:26: sparse: sparse: cast to restricted __be32
   drivers/net/ethernet/huawei/hinic/hinic_qp.c:62:28: sparse: sparse: cast to restricted __be32
   drivers/net/ethernet/huawei/hinic/hinic_qp.c:70:18: sparse: sparse: cast to restricted __be32
>> drivers/net/ethernet/huawei/hinic/hinic_qp.c:85:21: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] status @@     got restricted __be32 [usertype] @@
   drivers/net/ethernet/huawei/hinic/hinic_qp.c:85:21: sparse:     expected unsigned int [usertype] status
   drivers/net/ethernet/huawei/hinic/hinic_qp.c:85:21: sparse:     got restricted __be32 [usertype]
   drivers/net/ethernet/huawei/hinic/hinic_qp.c:96:20: sparse: sparse: cast to restricted __be32
   drivers/net/ethernet/huawei/hinic/hinic_qp.c:107:24: sparse: sparse: cast to restricted __be32
   drivers/net/ethernet/huawei/hinic/hinic_qp.c:114:23: sparse: sparse: cast to restricted __be32
   drivers/net/ethernet/huawei/hinic/hinic_qp.c:122:23: sparse: sparse: cast to restricted __be32
   drivers/net/ethernet/huawei/hinic/hinic_qp.c:191:33: sparse: sparse: cast to restricted __be32
--
>> drivers/net/ethernet/huawei/hinic/hinic_rx.c:152:44: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] addr_high @@     got restricted __be32 [usertype] @@
   drivers/net/ethernet/huawei/hinic/hinic_rx.c:152:44: sparse:     expected unsigned int [usertype] addr_high
   drivers/net/ethernet/huawei/hinic/hinic_rx.c:152:44: sparse:     got restricted __be32 [usertype]
>> drivers/net/ethernet/huawei/hinic/hinic_rx.c:154:43: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] addr_low @@     got restricted __be32 [usertype] @@
   drivers/net/ethernet/huawei/hinic/hinic_rx.c:154:43: sparse:     expected unsigned int [usertype] addr_low
   drivers/net/ethernet/huawei/hinic/hinic_rx.c:154:43: sparse:     got restricted __be32 [usertype]
>> drivers/net/ethernet/huawei/hinic/hinic_rx.c:174:6: sparse: sparse: symbol 'hinic_rx_free_buffers' was not declared. Should it be static?
   drivers/net/ethernet/huawei/hinic/hinic_rx.c:568:24: sparse: sparse: cast to restricted __be32
>> drivers/net/ethernet/huawei/hinic/hinic_rx.c:606:6: sparse: sparse: symbol 'rx_pass_super_cqe' was not declared. Should it be static?
   drivers/net/ethernet/huawei/hinic/hinic_rx.c:680:26: sparse: sparse: cast to restricted __be32
   drivers/net/ethernet/huawei/hinic/hinic_rx.c:688:28: sparse: sparse: cast to restricted __be32
   drivers/net/ethernet/huawei/hinic/hinic_rx.c:689:28: sparse: sparse: cast to restricted __be32
   drivers/net/ethernet/huawei/hinic/hinic_rx.c:709:45: sparse: sparse: cast to restricted __be32
   In file included from include/linux/sctp.h:57,
                    from drivers/net/ethernet/huawei/hinic/hinic_rx.c:30:
   include/uapi/linux/sctp.h:390:1: warning: alignment 4 of 'struct sctp_paddr_change' is less than 8 [-Wpacked-not-aligned]
     390 | } __attribute__((packed, aligned(4)));
         | ^
   include/uapi/linux/sctp.h:719:1: warning: alignment 4 of 'struct sctp_setpeerprim' is less than 8 [-Wpacked-not-aligned]
     719 | } __attribute__((packed, aligned(4)));
         | ^
   include/uapi/linux/sctp.h:718:33: warning: 'sspp_addr' offset 4 in 'struct sctp_setpeerprim' isn't aligned to 8 [-Wpacked-not-aligned]
     718 |         struct sockaddr_storage sspp_addr;
         |                                 ^~~~~~~~~
   include/uapi/linux/sctp.h:732:1: warning: alignment 4 of 'struct sctp_prim' is less than 8 [-Wpacked-not-aligned]
     732 | } __attribute__((packed, aligned(4)));
         | ^
   include/uapi/linux/sctp.h:731:33: warning: 'ssp_addr' offset 4 in 'struct sctp_prim' isn't aligned to 8 [-Wpacked-not-aligned]
     731 |         struct sockaddr_storage ssp_addr;
         |                                 ^~~~~~~~
   include/uapi/linux/sctp.h:783:1: warning: alignment 4 of 'struct sctp_paddrparams' is less than 8 [-Wpacked-not-aligned]
     783 | } __attribute__((packed, aligned(4)));
         | ^
   include/uapi/linux/sctp.h:775:33: warning: 'spp_address' offset 4 in 'struct sctp_paddrparams' isn't aligned to 8 [-Wpacked-not-aligned]
     775 |         struct sockaddr_storage spp_address;
         |                                 ^~~~~~~~~~~
   include/uapi/linux/sctp.h:896:1: warning: alignment 4 of 'struct sctp_paddrinfo' is less than 8 [-Wpacked-not-aligned]
     896 | } __attribute__((packed, aligned(4)));
         | ^
   include/uapi/linux/sctp.h:890:33: warning: 'spinfo_address' offset 4 in 'struct sctp_paddrinfo' isn't aligned to 8 [-Wpacked-not-aligned]
     890 |         struct sockaddr_storage spinfo_address;
         |                                 ^~~~~~~~~~~~~~
   drivers/net/ethernet/huawei/hinic/hinic_rx.c:174:6: warning: no previous prototype for 'hinic_rx_free_buffers' [-Wmissing-prototypes]
     174 | void hinic_rx_free_buffers(struct hinic_rxq *rxq)
         |      ^~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/huawei/hinic/hinic_rx.c:548:5: warning: no previous prototype for 'recv_one_pkt' [-Wmissing-prototypes]
     548 | int recv_one_pkt(struct hinic_rxq *rxq, struct hinic_rq_cqe *rx_cqe,
         |     ^~~~~~~~~~~~
   drivers/net/ethernet/huawei/hinic/hinic_rx.c:606:6: warning: no previous prototype for 'rx_pass_super_cqe' [-Wmissing-prototypes]
     606 | void rx_pass_super_cqe(struct hinic_rxq *rxq, u32 index, u32 pkt_num,
         |      ^~~~~~~~~~~~~~~~~
--
>> drivers/net/ethernet/huawei/hinic/hinic_tx.c:593:35: sparse: sparse: cast to restricted __be32
   drivers/net/ethernet/huawei/hinic/hinic_tx.c:594:35: sparse: sparse: cast to restricted __be32
   drivers/net/ethernet/huawei/hinic/hinic_tx.c:595:35: sparse: sparse: cast to restricted __be32
>> drivers/net/ethernet/huawei/hinic/hinic_tx.c:1051:5: sparse: sparse: symbol 'hinic_setup_tx_wqe' was not declared. Should it be static?
>> drivers/net/ethernet/huawei/hinic/hinic_tx.c:1230:5: sparse: sparse: symbol 'hinic_stop_sq' was not declared. Should it be static?
>> drivers/net/ethernet/huawei/hinic/hinic_tx.c:109:28: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] hi_addr @@     got restricted __be32 [usertype] @@
   drivers/net/ethernet/huawei/hinic/hinic_tx.c:109:28: sparse:     expected unsigned int [usertype] hi_addr
   drivers/net/ethernet/huawei/hinic/hinic_tx.c:109:28: sparse:     got restricted __be32 [usertype]
>> drivers/net/ethernet/huawei/hinic/hinic_tx.c:110:28: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] lo_addr @@     got restricted __be32 [usertype] @@
   drivers/net/ethernet/huawei/hinic/hinic_tx.c:110:28: sparse:     expected unsigned int [usertype] lo_addr
   drivers/net/ethernet/huawei/hinic/hinic_tx.c:110:28: sparse:     got restricted __be32 [usertype]
>> drivers/net/ethernet/huawei/hinic/hinic_tx.c:111:25: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] len @@     got restricted __be32 [usertype] @@
   drivers/net/ethernet/huawei/hinic/hinic_tx.c:111:25: sparse:     expected unsigned int [usertype] len
   drivers/net/ethernet/huawei/hinic/hinic_tx.c:111:25: sparse:     got restricted __be32 [usertype]
>> drivers/net/ethernet/huawei/hinic/hinic_tx.c:109:28: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] hi_addr @@     got restricted __be32 [usertype] @@
   drivers/net/ethernet/huawei/hinic/hinic_tx.c:109:28: sparse:     expected unsigned int [usertype] hi_addr
   drivers/net/ethernet/huawei/hinic/hinic_tx.c:109:28: sparse:     got restricted __be32 [usertype]
>> drivers/net/ethernet/huawei/hinic/hinic_tx.c:110:28: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] lo_addr @@     got restricted __be32 [usertype] @@
   drivers/net/ethernet/huawei/hinic/hinic_tx.c:110:28: sparse:     expected unsigned int [usertype] lo_addr
   drivers/net/ethernet/huawei/hinic/hinic_tx.c:110:28: sparse:     got restricted __be32 [usertype]
>> drivers/net/ethernet/huawei/hinic/hinic_tx.c:111:25: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] len @@     got restricted __be32 [usertype] @@
   drivers/net/ethernet/huawei/hinic/hinic_tx.c:111:25: sparse:     expected unsigned int [usertype] len
   drivers/net/ethernet/huawei/hinic/hinic_tx.c:111:25: sparse:     got restricted __be32 [usertype]
>> drivers/net/ethernet/huawei/hinic/hinic_tx.c:109:28: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] hi_addr @@     got restricted __be32 [usertype] @@
   drivers/net/ethernet/huawei/hinic/hinic_tx.c:109:28: sparse:     expected unsigned int [usertype] hi_addr
   drivers/net/ethernet/huawei/hinic/hinic_tx.c:109:28: sparse:     got restricted __be32 [usertype]
>> drivers/net/ethernet/huawei/hinic/hinic_tx.c:110:28: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] lo_addr @@     got restricted __be32 [usertype] @@
   drivers/net/ethernet/huawei/hinic/hinic_tx.c:110:28: sparse:     expected unsigned int [usertype] lo_addr
   drivers/net/ethernet/huawei/hinic/hinic_tx.c:110:28: sparse:     got restricted __be32 [usertype]
>> drivers/net/ethernet/huawei/hinic/hinic_tx.c:111:25: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] len @@     got restricted __be32 [usertype] @@
   drivers/net/ethernet/huawei/hinic/hinic_tx.c:111:25: sparse:     expected unsigned int [usertype] len
   drivers/net/ethernet/huawei/hinic/hinic_tx.c:111:25: sparse:     got restricted __be32 [usertype]
   In file included from include/linux/sctp.h:57,
                    from drivers/net/ethernet/huawei/hinic/hinic_tx.c:26:
   include/uapi/linux/sctp.h:390:1: warning: alignment 4 of 'struct sctp_paddr_change' is less than 8 [-Wpacked-not-aligned]
     390 | } __attribute__((packed, aligned(4)));
         | ^
   include/uapi/linux/sctp.h:719:1: warning: alignment 4 of 'struct sctp_setpeerprim' is less than 8 [-Wpacked-not-aligned]
     719 | } __attribute__((packed, aligned(4)));
         | ^
   include/uapi/linux/sctp.h:718:33: warning: 'sspp_addr' offset 4 in 'struct sctp_setpeerprim' isn't aligned to 8 [-Wpacked-not-aligned]
     718 |         struct sockaddr_storage sspp_addr;
         |                                 ^~~~~~~~~
   include/uapi/linux/sctp.h:732:1: warning: alignment 4 of 'struct sctp_prim' is less than 8 [-Wpacked-not-aligned]
     732 | } __attribute__((packed, aligned(4)));
         | ^
   include/uapi/linux/sctp.h:731:33: warning: 'ssp_addr' offset 4 in 'struct sctp_prim' isn't aligned to 8 [-Wpacked-not-aligned]
     731 |         struct sockaddr_storage ssp_addr;
         |                                 ^~~~~~~~
   include/uapi/linux/sctp.h:783:1: warning: alignment 4 of 'struct sctp_paddrparams' is less than 8 [-Wpacked-not-aligned]
     783 | } __attribute__((packed, aligned(4)));
         | ^
   include/uapi/linux/sctp.h:775:33: warning: 'spp_address' offset 4 in 'struct sctp_paddrparams' isn't aligned to 8 [-Wpacked-not-aligned]
     775 |         struct sockaddr_storage spp_address;
         |                                 ^~~~~~~~~~~
   include/uapi/linux/sctp.h:896:1: warning: alignment 4 of 'struct sctp_paddrinfo' is less than 8 [-Wpacked-not-aligned]
     896 | } __attribute__((packed, aligned(4)));
         | ^
   include/uapi/linux/sctp.h:890:33: warning: 'spinfo_address' offset 4 in 'struct sctp_paddrinfo' isn't aligned to 8 [-Wpacked-not-aligned]
     890 |         struct sockaddr_storage spinfo_address;
         |                                 ^~~~~~~~~~~~~~
   drivers/net/ethernet/huawei/hinic/hinic_tx.c:1051:5: warning: no previous prototype for 'hinic_setup_tx_wqe' [-Wmissing-prototypes]
    1051 | int hinic_setup_tx_wqe(struct hinic_txq *txq)
         |     ^~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/huawei/hinic/hinic_tx.c:1230:5: warning: no previous prototype for 'hinic_stop_sq' [-Wmissing-prototypes]
    1230 | int hinic_stop_sq(struct hinic_txq *txq)
         |     ^~~~~~~~~~~~~
--
   drivers/net/ethernet/huawei/hinic/hinic_dbgtool_knl.c:65:7: sparse: sparse: symbol 'dbgtool_dev_id' was not declared. Should it be static?
   drivers/net/ethernet/huawei/hinic/hinic_dbgtool_knl.c:66:13: sparse: sparse: symbol 'dbgtool_chr_dev' was not declared. Should it be static?
   drivers/net/ethernet/huawei/hinic/hinic_dbgtool_knl.c:69:14: sparse: sparse: symbol 'dbgtool_d_class' was not declared. Should it be static?
   drivers/net/ethernet/huawei/hinic/hinic_dbgtool_knl.c:72:5: sparse: sparse: symbol 'g_dbgtool_init_flag' was not declared. Should it be static?
   drivers/net/ethernet/huawei/hinic/hinic_dbgtool_knl.c:73:5: sparse: sparse: symbol 'g_dbgtool_ref_cnt' was not declared. Should it be static?
   drivers/net/ethernet/huawei/hinic/hinic_dbgtool_knl.c:176:51: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const [noderef] __user *from @@     got unsigned char [usertype] *cmd @@
   drivers/net/ethernet/huawei/hinic/hinic_dbgtool_knl.c:176:51: sparse:     expected void const [noderef] __user *from
   drivers/net/ethernet/huawei/hinic/hinic_dbgtool_knl.c:176:51: sparse:     got unsigned char [usertype] *cmd
   drivers/net/ethernet/huawei/hinic/hinic_dbgtool_knl.c:190:44: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void [noderef] __user *to @@     got void *ack @@
   drivers/net/ethernet/huawei/hinic/hinic_dbgtool_knl.c:190:44: sparse:     expected void [noderef] __user *to
   drivers/net/ethernet/huawei/hinic/hinic_dbgtool_knl.c:190:44: sparse:     got void *ack
   drivers/net/ethernet/huawei/hinic/hinic_dbgtool_knl.c:135:6: sparse: sparse: symbol 'dbgtool_knl_api_cmd_read' was not declared. Should it be static?
   drivers/net/ethernet/huawei/hinic/hinic_dbgtool_knl.c:238:51: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const [noderef] __user *from @@     got unsigned char [usertype] *cmd @@
   drivers/net/ethernet/huawei/hinic/hinic_dbgtool_knl.c:238:51: sparse:     expected void const [noderef] __user *from
   drivers/net/ethernet/huawei/hinic/hinic_dbgtool_knl.c:238:51: sparse:     got unsigned char [usertype] *cmd
   drivers/net/ethernet/huawei/hinic/hinic_dbgtool_knl.c:207:6: sparse: sparse: symbol 'dbgtool_knl_api_cmd_write' was not declared. Should it be static?
   drivers/net/ethernet/huawei/hinic/hinic_dbgtool_knl.c:339:37: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void [noderef] __user *to @@     got struct pf_dev_info *dev_info @@
   drivers/net/ethernet/huawei/hinic/hinic_dbgtool_knl.c:339:37: sparse:     expected void [noderef] __user *to
   drivers/net/ethernet/huawei/hinic/hinic_dbgtool_knl.c:339:37: sparse:     got struct pf_dev_info *dev_info
   drivers/net/ethernet/huawei/hinic/hinic_dbgtool_knl.c:299:6: sparse: sparse: symbol 'dbgtool_knl_pf_dev_info_get' was not declared. Should it be static?
   drivers/net/ethernet/huawei/hinic/hinic_dbgtool_knl.c:357:37: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void [noderef] __user *to @@     got struct ffm_record_info *ffm_rd @@
   drivers/net/ethernet/huawei/hinic/hinic_dbgtool_knl.c:357:37: sparse:     expected void [noderef] __user *to
   drivers/net/ethernet/huawei/hinic/hinic_dbgtool_knl.c:357:37: sparse:     got struct ffm_record_info *ffm_rd
   drivers/net/ethernet/huawei/hinic/hinic_dbgtool_knl.c:353:6: sparse: sparse: symbol 'dbgtool_knl_ffm_info_rd' was not declared. Should it be static?
   drivers/net/ethernet/huawei/hinic/hinic_dbgtool_knl.c:371:6: sparse: sparse: symbol 'dbgtool_knl_ffm_info_clr' was not declared. Should it be static?
   drivers/net/ethernet/huawei/hinic/hinic_dbgtool_knl.c:423:54: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const [noderef] __user *from @@     got void *buf_in @@
   drivers/net/ethernet/huawei/hinic/hinic_dbgtool_knl.c:423:54: sparse:     expected void const [noderef] __user *from
   drivers/net/ethernet/huawei/hinic/hinic_dbgtool_knl.c:423:54: sparse:     got void *buf_in
>> drivers/net/ethernet/huawei/hinic/hinic_dbgtool_knl.c:446:44: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void [noderef] __user *to @@     got unsigned short [usertype] *out_size @@
   drivers/net/ethernet/huawei/hinic/hinic_dbgtool_knl.c:446:44: sparse:     expected void [noderef] __user *to
   drivers/net/ethernet/huawei/hinic/hinic_dbgtool_knl.c:446:44: sparse:     got unsigned short [usertype] *out_size
   drivers/net/ethernet/huawei/hinic/hinic_dbgtool_knl.c:453:44: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void [noderef] __user *to @@     got void *buf_out @@
   drivers/net/ethernet/huawei/hinic/hinic_dbgtool_knl.c:453:44: sparse:     expected void [noderef] __user *to
   drivers/net/ethernet/huawei/hinic/hinic_dbgtool_knl.c:453:44: sparse:     got void *buf_out
   drivers/net/ethernet/huawei/hinic/hinic_dbgtool_knl.c:386:6: sparse: sparse: symbol 'dbgtool_knl_msg_to_up' was not declared. Should it be static?
   drivers/net/ethernet/huawei/hinic/hinic_dbgtool_knl.c:508:37: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const [noderef] __user *from @@     got void * @@
   drivers/net/ethernet/huawei/hinic/hinic_dbgtool_knl.c:508:37: sparse:     expected void const [noderef] __user *from
   drivers/net/ethernet/huawei/hinic/hinic_dbgtool_knl.c:508:37: sparse:     got void *
   drivers/net/ethernet/huawei/hinic/hinic_dbgtool_knl.c:495:6: sparse: sparse: symbol 'dbgtool_knl_unlocked_ioctl' was not declared. Should it be static?
   drivers/net/ethernet/huawei/hinic/hinic_dbgtool_knl.c:573:6: sparse: sparse: symbol 'ffm_intr_msg_record' was not declared. Should it be static?
   drivers/net/ethernet/huawei/hinic/hinic_dbgtool_knl.c:135:6: warning: no previous prototype for 'dbgtool_knl_api_cmd_read' [-Wmissing-prototypes]
     135 | long dbgtool_knl_api_cmd_read(struct dbgtool_param *para,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/huawei/hinic/hinic_dbgtool_knl.c:207:6: warning: no previous prototype for 'dbgtool_knl_api_cmd_write' [-Wmissing-prototypes]
     207 | long dbgtool_knl_api_cmd_write(struct dbgtool_param *para,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/huawei/hinic/hinic_dbgtool_knl.c:299:6: warning: no previous prototype for 'dbgtool_knl_pf_dev_info_get' [-Wmissing-prototypes]
     299 | long dbgtool_knl_pf_dev_info_get(struct dbgtool_param *para,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/huawei/hinic/hinic_dbgtool_knl.c:353:6: warning: no previous prototype for 'dbgtool_knl_ffm_info_rd' [-Wmissing-prototypes]
     353 | long dbgtool_knl_ffm_info_rd(struct dbgtool_param *para,
         |      ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/huawei/hinic/hinic_dbgtool_knl.c:371:6: warning: no previous prototype for 'dbgtool_knl_ffm_info_clr' [-Wmissing-prototypes]
     371 | long dbgtool_knl_ffm_info_clr(struct dbgtool_param *para,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/huawei/hinic/hinic_dbgtool_knl.c:386:6: warning: no previous prototype for 'dbgtool_knl_msg_to_up' [-Wmissing-prototypes]
     386 | long dbgtool_knl_msg_to_up(struct dbgtool_param *para,
         |      ^~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/huawei/hinic/hinic_dbgtool_knl.c:495:6: warning: no previous prototype for 'dbgtool_knl_unlocked_ioctl' [-Wmissing-prototypes]
     495 | long dbgtool_knl_unlocked_ioctl(struct file *pfile,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/huawei/hinic/hinic_dbgtool_knl.c:573:6: warning: no previous prototype for 'ffm_intr_msg_record' [-Wmissing-prototypes]
     573 | void ffm_intr_msg_record(void *handle, void *buf_in, u16 in_size,
         |      ^~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/huawei/hinic/hinic_dbgtool_knl.c:498: warning: Function parameter or member 'arg' not described in 'dbgtool_knl_unlocked_ioctl'
   drivers/net/ethernet/huawei/hinic/hinic_dbgtool_knl.c:575: warning: Function parameter or member 'in_size' not described in 'ffm_intr_msg_record'
   drivers/net/ethernet/huawei/hinic/hinic_dbgtool_knl.c:575: warning: Function parameter or member 'out_size' not described in 'ffm_intr_msg_record'
   drivers/net/ethernet/huawei/hinic/hinic_dbgtool_knl.c:664: warning: Function parameter or member 'vhwdev' not described in 'dbgtool_knl_init'
   drivers/net/ethernet/huawei/hinic/hinic_dbgtool_knl.c:664: warning: Excess function parameter 'hwdev' description in 'dbgtool_knl_init'
   drivers/net/ethernet/huawei/hinic/hinic_dbgtool_knl.c:792: warning: Function parameter or member 'vhwdev' not described in 'dbgtool_knl_deinit'
   drivers/net/ethernet/huawei/hinic/hinic_dbgtool_knl.c:792: warning: Excess function parameter 'hwdev' description in 'dbgtool_knl_deinit'
--
   drivers/net/ethernet/huawei/hinic/hinic_nictool.c:104:43: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const [noderef] __user *from @@     got void *in_buff @@
   drivers/net/ethernet/huawei/hinic/hinic_nictool.c:104:43: sparse:     expected void const [noderef] __user *from
   drivers/net/ethernet/huawei/hinic/hinic_nictool.c:104:43: sparse:     got void *in_buff
>> drivers/net/ethernet/huawei/hinic/hinic_nictool.c:162:32: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void [noderef] __user *to @@     got void *out_buf @@
   drivers/net/ethernet/huawei/hinic/hinic_nictool.c:162:32: sparse:     expected void [noderef] __user *to
   drivers/net/ethernet/huawei/hinic/hinic_nictool.c:162:32: sparse:     got void *out_buf
   drivers/net/ethernet/huawei/hinic/hinic_nictool.c:1070:32: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void [noderef] __user *to @@     got void *out_buf @@
   drivers/net/ethernet/huawei/hinic/hinic_nictool.c:1070:32: sparse:     expected void [noderef] __user *to
   drivers/net/ethernet/huawei/hinic/hinic_nictool.c:1070:32: sparse:     got void *out_buf
   drivers/net/ethernet/huawei/hinic/hinic_nictool.c:1153:32: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void [noderef] __user *to @@     got void *out_buf @@
   drivers/net/ethernet/huawei/hinic/hinic_nictool.c:1153:32: sparse:     expected void [noderef] __user *to
   drivers/net/ethernet/huawei/hinic/hinic_nictool.c:1153:32: sparse:     got void *out_buf
   drivers/net/ethernet/huawei/hinic/hinic_nictool.c:1363:35: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const [noderef] __user *from @@     got void * @@
   drivers/net/ethernet/huawei/hinic/hinic_nictool.c:1363:35: sparse:     expected void const [noderef] __user *from
   drivers/net/ethernet/huawei/hinic/hinic_nictool.c:1363:35: sparse:     got void *
   drivers/net/ethernet/huawei/hinic/hinic_nictool.c:1492:25: sparse: sparse: symbol 'sm_module_cmd_handle' was not declared. Should it be static?
   drivers/net/ethernet/huawei/hinic/hinic_nictool.c:1663:32: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void [noderef] __user *to @@     got void *out_buf @@
   drivers/net/ethernet/huawei/hinic/hinic_nictool.c:1663:32: sparse:     expected void [noderef] __user *to
   drivers/net/ethernet/huawei/hinic/hinic_nictool.c:1663:32: sparse:     got void *out_buf
   drivers/net/ethernet/huawei/hinic/hinic_nictool.c:1750:32: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void [noderef] __user *to @@     got void *out_buf @@
   drivers/net/ethernet/huawei/hinic/hinic_nictool.c:1750:32: sparse:     expected void [noderef] __user *to
   drivers/net/ethernet/huawei/hinic/hinic_nictool.c:1750:32: sparse:     got void *out_buf
   drivers/net/ethernet/huawei/hinic/hinic_nictool.c:1756:5: sparse: sparse: symbol 'send_to_service_driver' was not declared. Should it be static?
   drivers/net/ethernet/huawei/hinic/hinic_nictool.c:1871:38: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const [noderef] __user *from @@     got void * @@
   drivers/net/ethernet/huawei/hinic/hinic_nictool.c:1871:38: sparse:     expected void const [noderef] __user *from
   drivers/net/ethernet/huawei/hinic/hinic_nictool.c:1871:38: sparse:     got void *
   drivers/net/ethernet/huawei/hinic/hinic_nictool.c:1964:5: sparse: sparse: symbol 'if_nictool_exist' was not declared. Should it be static?
   drivers/net/ethernet/huawei/hinic/hinic_nictool.c:1756:5: warning: no previous prototype for 'send_to_service_driver' [-Wmissing-prototypes]
    1756 | int send_to_service_driver(struct msg_module *nt_msg, void *buf_in,
         |     ^~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/huawei/hinic/hinic_nictool.c:1964:5: warning: no previous prototype for 'if_nictool_exist' [-Wmissing-prototypes]
    1964 | int if_nictool_exist(void)
         |     ^~~~~~~~~~~~~~~~
--
>> drivers/net/ethernet/huawei/hinic/hinic_dcb.c:62:6: sparse: sparse: symbol 'hinic_dcb_config_init' was not declared. Should it be static?
>> drivers/net/ethernet/huawei/hinic/hinic_dcb.c:226:6: sparse: sparse: symbol 'hinic_set_prio_tc_map' was not declared. Should it be static?
>> drivers/net/ethernet/huawei/hinic/hinic_dcb.c:825:4: sparse: sparse: symbol 'hinic_dcbnl_set_all' was not declared. Should it be static?
>> drivers/net/ethernet/huawei/hinic/hinic_dcb.c:1059:5: sparse: sparse: symbol '__set_cos_up_map' was not declared. Should it be static?
   drivers/net/ethernet/huawei/hinic/hinic_dcb.c:62:6: warning: no previous prototype for 'hinic_dcb_config_init' [-Wmissing-prototypes]
      62 | void hinic_dcb_config_init(struct hinic_nic_dev *nic_dev,
         |      ^~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/huawei/hinic/hinic_dcb.c:226:6: warning: no previous prototype for 'hinic_set_prio_tc_map' [-Wmissing-prototypes]
     226 | void hinic_set_prio_tc_map(struct hinic_nic_dev *nic_dev)
         |      ^~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/huawei/hinic/hinic_dcb.c:825:4: warning: no previous prototype for 'hinic_dcbnl_set_all' [-Wmissing-prototypes]
     825 | u8 hinic_dcbnl_set_all(struct net_device *netdev)
         |    ^~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/huawei/hinic/hinic_dcb.c:1059:5: warning: no previous prototype for '__set_cos_up_map' [-Wmissing-prototypes]
    1059 | int __set_cos_up_map(struct hinic_nic_dev *nic_dev, u8 *cos_up)
         |     ^~~~~~~~~~~~~~~~

vim +/g_hinic_chip_list +142 drivers/net/ethernet/huawei/hinic/hinic_lld.c

746ea35981b1f77 Xue 2019-01-30  139  
746ea35981b1f77 Xue 2019-01-30  140  #define MAX_CARD_ID 64
746ea35981b1f77 Xue 2019-01-30  141  static u64 card_bit_map;
746ea35981b1f77 Xue 2019-01-30 @142  LIST_HEAD(g_hinic_chip_list);
746ea35981b1f77 Xue 2019-01-30  143  struct hinic_uld_info g_uld_info[SERVICE_T_MAX] = { {0} };
746ea35981b1f77 Xue 2019-01-30  144  static const char *s_uld_name[SERVICE_T_MAX] = {
746ea35981b1f77 Xue 2019-01-30  145  	"nic", "ovs", "roce", "toe", "iwarp", "fc", "fcoe", };
746ea35981b1f77 Xue 2019-01-30  146  

:::::: The code at line 142 was first introduced by commit
:::::: 746ea35981b1f77e988d48642409d73f0470b3eb net: hinic: Add Hardware Abstract Layer

:::::: TO: Xue <xuechaojing@huawei.com>
:::::: CC: Xie XiuQi <xiexiuqi@huawei.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
