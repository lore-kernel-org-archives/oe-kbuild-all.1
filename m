Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E5B21850A6
	for <oe-kbuild-all@lists.linux.dev>; Fri, 31 May 2024 19:48:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717184883; cv=none; b=tmDT5C0ookgXcmVoa2WmN9tLsEjibcvFaLbvRJLKXbDDi/28vJWGqHToa5oWnOEKXQVkBFSIuQCKBo2yLYpIlXgV3T853+4R8TMmc9CTuCptaaNR7JtsLh6/PNLUj9ZbXddNPKs/J/FDGq5cEkKSdwfj4ALl5xMywONPDB+ejBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717184883; c=relaxed/simple;
	bh=BLYU4wi/ascojl9ZQFuPlYgnukjBXtxr6IVy6n+wPOw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KhkpAYbqBF5TjftLFgSCaaeZqJV/z0WXPL9h9swxoT+W4L5j8JH+wcAXTQFp13Xk5DfoJ9zAxLFiWyQSspMD9iCVjpe22Rg+MNfwfrymS/XeNsOH1RgfdBtkCF6nHyKo7r30QIzqTR0OW3NV5dY4GmbW5Tvp09cWp/4f21lCOpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Vhv5EcFK; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Vhv5EcFK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717184880; x=1748720880;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BLYU4wi/ascojl9ZQFuPlYgnukjBXtxr6IVy6n+wPOw=;
  b=Vhv5EcFKAYWNouqgwSAeBdb5CWFjoWviQtxnILxuBzWEPhwDy2TYAJam
   +UqH3vvzbT0MS7rfig8J4EPRizd+Q3PG0dOKfOtbS4w5HHpPOsPaicx7h
   NEEHg7iYpJbcIdns8+BeOy7ISAFgdlNHUapxvCf2wHwisIHQak56isCSB
   7LNPtWfHU5YPjpo8ZHTbDhT9CJoRWtB0g90LnUWVdB7xLjxjbjHSia4Hn
   gyVzWxd+R7QHFyY9yjZJbuSYztKLPbu167VPIpDTm0ozwrJ9pEgxmA9OZ
   stlttWfhOE58FcOM7kI/us0ptZsFHxlF7f0DO4TVVylidUV3K7mNs73XW
   w==;
X-CSE-ConnectionGUID: cAujQIyAR7uHe/ti1wdL4Q==
X-CSE-MsgGUID: vhedN3JVS8GrFm3HPP5/RQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11089"; a="36274857"
X-IronPort-AV: E=Sophos;i="6.08,205,1712646000"; 
   d="scan'208";a="36274857"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2024 12:48:00 -0700
X-CSE-ConnectionGUID: 8wONrJqhQk2yztHHAhbDmw==
X-CSE-MsgGUID: ASk+LeWOQ2Kl3UlcZg8jcQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,205,1712646000"; 
   d="scan'208";a="36180962"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 31 May 2024 12:47:58 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sD8EF-000HkH-3C;
	Fri, 31 May 2024 19:47:55 +0000
Date: Sat, 1 Jun 2024 03:47:35 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Steven Song <steven.song@3snic.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 21121/22626]
 drivers/net/ethernet/3snic/sssnic/hw/sss_hwif_ctrlq.c:320:9: sparse: sparse:
 incorrect type in argument 2 (different address spaces)
Message-ID: <202406010313.eTrfPuma-lkp@intel.com>
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
commit: a6a7981cbf66d4951425d33cdce6ef39206eba83 [21121/22626] Net: ethernet: Support 3snic 3s9xx network card
config: arm64-randconfig-r122-20240531 (https://download.01.org/0day-ci/archive/20240601/202406010313.eTrfPuma-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20240601/202406010313.eTrfPuma-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406010313.eTrfPuma-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/net/ethernet/3snic/sssnic/nic/sss_nic_main.c:65:5: sparse: sparse: symbol 'rx_buff_size' was not declared. Should it be static?
   drivers/net/ethernet/3snic/sssnic/nic/sss_nic_main.c:165:28: sparse: sparse: undefined identifier 'vlan_dev_priv'
   drivers/net/ethernet/3snic/sssnic/nic/sss_nic_main.c:878:6: sparse: sparse: symbol 'sss_nic_port_module_cable_plug' was not declared. Should it be static?
   drivers/net/ethernet/3snic/sssnic/nic/sss_nic_main.c:884:6: sparse: sparse: symbol 'sss_nic_port_module_cable_unplug' was not declared. Should it be static?
   drivers/net/ethernet/3snic/sssnic/nic/sss_nic_main.c:890:6: sparse: sparse: symbol 'sss_nic_port_module_link_err' was not declared. Should it be static?
   drivers/net/ethernet/3snic/sssnic/nic/sss_nic_main.c:1020:21: sparse: sparse: symbol 'g_nic_uld_info' was not declared. Should it be static?
   drivers/net/ethernet/3snic/sssnic/nic/sss_nic_main.c:1029:21: sparse: sparse: symbol 'get_nic_uld_info' was not declared. Should it be static?
   drivers/net/ethernet/3snic/sssnic/nic/sss_nic_main.c: In function 'sss_nic_get_vlan_depth':
>> drivers/net/ethernet/3snic/sssnic/nic/sss_nic_main.c:165:28: error: implicit declaration of function 'vlan_dev_priv'; did you mean 'netdev_priv'? [-Werror=implicit-function-declaration]
     165 |                 vlan_dev = vlan_dev_priv(vlan_dev)->real_dev;
         |                            ^~~~~~~~~~~~~
         |                            netdev_priv
>> drivers/net/ethernet/3snic/sssnic/nic/sss_nic_main.c:165:51: error: invalid type argument of '->' (have 'int')
     165 |                 vlan_dev = vlan_dev_priv(vlan_dev)->real_dev;
         |                                                   ^~
   drivers/net/ethernet/3snic/sssnic/nic/sss_nic_main.c: At top level:
   drivers/net/ethernet/3snic/sssnic/nic/sss_nic_main.c:878:6: warning: no previous prototype for 'sss_nic_port_module_cable_plug' [-Wmissing-prototypes]
     878 | void sss_nic_port_module_cable_plug(struct sss_nic_dev *nic_dev, void *event_data)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/3snic/sssnic/nic/sss_nic_main.c:884:6: warning: no previous prototype for 'sss_nic_port_module_cable_unplug' [-Wmissing-prototypes]
     884 | void sss_nic_port_module_cable_unplug(struct sss_nic_dev *nic_dev, void *event_data)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/3snic/sssnic/nic/sss_nic_main.c:890:6: warning: no previous prototype for 'sss_nic_port_module_link_err' [-Wmissing-prototypes]
     890 | void sss_nic_port_module_link_err(struct sss_nic_dev *nic_dev, void *event_data)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/3snic/sssnic/nic/sss_nic_main.c:1029:22: warning: no previous prototype for 'get_nic_uld_info' [-Wmissing-prototypes]
    1029 | struct sss_uld_info *get_nic_uld_info(void)
         |                      ^~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors

sparse warnings: (new ones prefixed by >>)
   drivers/net/ethernet/3snic/sssnic/hw/sss_hwif_ctrlq.c:311:54: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected unsigned char [usertype] *db_base @@     got unsigned char [noderef] [usertype] <asn:2> *db_base @@
   drivers/net/ethernet/3snic/sssnic/hw/sss_hwif_ctrlq.c:311:54: sparse:     expected unsigned char [usertype] *db_base
   drivers/net/ethernet/3snic/sssnic/hw/sss_hwif_ctrlq.c:311:54: sparse:     got unsigned char [noderef] [usertype] <asn:2> *db_base
>> drivers/net/ethernet/3snic/sssnic/hw/sss_hwif_ctrlq.c:320:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] <asn:2> *addr @@     got unsigned char [usertype] * @@
   drivers/net/ethernet/3snic/sssnic/hw/sss_hwif_ctrlq.c:320:9: sparse:     expected void volatile [noderef] <asn:2> *addr
   drivers/net/ethernet/3snic/sssnic/hw/sss_hwif_ctrlq.c:320:9: sparse:     got unsigned char [usertype] *
   drivers/net/ethernet/3snic/sssnic/hw/sss_hwif_ctrlq.c:533:12: sparse: sparse: context imbalance in 'sss_ctrlq_msg_lock' - different lock contexts for basic block
   drivers/net/ethernet/3snic/sssnic/hw/sss_hwif_ctrlq.c:547:13: sparse: sparse: context imbalance in 'sss_ctrlq_msg_unlock' - unexpected unlock
--
>> drivers/net/ethernet/3snic/sssnic/hw/sss_hwif_ctrlq_init.c:327:41: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void [noderef] <asn:2> **db_base @@     got void [noderef] <asn:2> * @@
   drivers/net/ethernet/3snic/sssnic/hw/sss_hwif_ctrlq_init.c:327:41: sparse:     expected void [noderef] <asn:2> **db_base
   drivers/net/ethernet/3snic/sssnic/hw/sss_hwif_ctrlq_init.c:327:41: sparse:     got void [noderef] <asn:2> *
   drivers/net/ethernet/3snic/sssnic/hw/sss_hwif_ctrlq_init.c:277:5: warning: no previous prototype for 'sss_reinit_ctrlq_ctx' [-Wmissing-prototypes]
     277 | int sss_reinit_ctrlq_ctx(struct sss_hwdev *hwdev)
         |     ^~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/3snic/sssnic/hw/sss_hwif_ctrlq_init.c:367:6: warning: no previous prototype for 'sss_deinit_ctrlq' [-Wmissing-prototypes]
     367 | void sss_deinit_ctrlq(struct sss_hwdev *hwdev)
         |      ^~~~~~~~~~~~~~~~
   drivers/net/ethernet/3snic/sssnic/hw/sss_hwif_ctrlq_init.c:501:5: warning: no previous prototype for 'sss_init_ctrlq_channel' [-Wmissing-prototypes]
     501 | int sss_init_ctrlq_channel(struct sss_hwdev *hwdev)
         |     ^~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/3snic/sssnic/hw/sss_hwif_ctrlq_init.c:538:6: warning: no previous prototype for 'sss_deinit_ctrlq_channel' [-Wmissing-prototypes]
     538 | void sss_deinit_ctrlq_channel(struct sss_hwdev *hwdev)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/3snic/sssnic/hw/sss_hwif_ctrlq_init.c:547:6: warning: no previous prototype for 'sss_ctrlq_flush_sync_cmd' [-Wmissing-prototypes]
     547 | void sss_ctrlq_flush_sync_cmd(struct sss_hwdev *hwdev)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/3snic/sssnic/hw/sss_hwif_ctrlq_init.c:573:5: warning: no previous prototype for 'sss_wait_ctrlq_stop' [-Wmissing-prototypes]
     573 | int sss_wait_ctrlq_stop(struct sss_hwdev *hwdev)
         |     ^~~~~~~~~~~~~~~~~~~
--
>> drivers/net/ethernet/3snic/sssnic/hw/sss_hwif_mbx.c:294:30: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __be32 [usertype] @@
   drivers/net/ethernet/3snic/sssnic/hw/sss_hwif_mbx.c:294:30: sparse:     expected unsigned int [usertype] val
   drivers/net/ethernet/3snic/sssnic/hw/sss_hwif_mbx.c:294:30: sparse:     got restricted __be32 [usertype]
>> drivers/net/ethernet/3snic/sssnic/hw/sss_hwif_mbx.c:294:73: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] <asn:2> *addr @@     got unsigned char [usertype] * @@
   drivers/net/ethernet/3snic/sssnic/hw/sss_hwif_mbx.c:294:73: sparse:     expected void volatile [noderef] <asn:2> *addr
   drivers/net/ethernet/3snic/sssnic/hw/sss_hwif_mbx.c:294:73: sparse:     got unsigned char [usertype] *
   drivers/net/ethernet/3snic/sssnic/hw/sss_hwif_mbx.c:312:30: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __be32 [usertype] @@
   drivers/net/ethernet/3snic/sssnic/hw/sss_hwif_mbx.c:312:30: sparse:     expected unsigned int [usertype] val
   drivers/net/ethernet/3snic/sssnic/hw/sss_hwif_mbx.c:312:30: sparse:     got restricted __be32 [usertype]
   drivers/net/ethernet/3snic/sssnic/hw/sss_hwif_mbx.c:313:67: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] <asn:2> *addr @@     got unsigned char [usertype] * @@
   drivers/net/ethernet/3snic/sssnic/hw/sss_hwif_mbx.c:313:67: sparse:     expected void volatile [noderef] <asn:2> *addr
   drivers/net/ethernet/3snic/sssnic/hw/sss_hwif_mbx.c:313:67: sparse:     got unsigned char [usertype] *
   drivers/net/ethernet/3snic/sssnic/hw/sss_hwif_mbx.c:364:19: sparse: sparse: cast to restricted __be64
--
>> drivers/net/ethernet/3snic/sssnic/hw/sss_hwif_mbx_init.c:346:24: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected unsigned char [usertype] *data @@     got unsigned char [noderef] [usertype] <asn:2> * @@
   drivers/net/ethernet/3snic/sssnic/hw/sss_hwif_mbx_init.c:346:24: sparse:     expected unsigned char [usertype] *data
   drivers/net/ethernet/3snic/sssnic/hw/sss_hwif_mbx_init.c:346:24: sparse:     got unsigned char [noderef] [usertype] <asn:2> *
   drivers/net/ethernet/3snic/sssnic/hw/sss_hwif_mbx_init.c:252:5: warning: no previous prototype for 'sss_init_func_mbx_msg' [-Wmissing-prototypes]
     252 | int sss_init_func_mbx_msg(void *hwdev, u16 func_num)
         |     ^~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/3snic/sssnic/hw/sss_hwif_mbx_init.c:401:5: warning: no previous prototype for 'sss_hwif_init_mbx' [-Wmissing-prototypes]
     401 | int sss_hwif_init_mbx(struct sss_hwdev *hwdev)
         |     ^~~~~~~~~~~~~~~~~
   drivers/net/ethernet/3snic/sssnic/hw/sss_hwif_mbx_init.c:449:6: warning: no previous prototype for 'sss_hwif_deinit_mbx' [-Wmissing-prototypes]
     449 | void sss_hwif_deinit_mbx(struct sss_hwdev *hwdev)
         |      ^~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/3snic/sssnic/hw/sss_hwif_mbx_init.c:872:6: warning: no previous prototype for 'sss_recv_mbx_aeq_handler' [-Wmissing-prototypes]
     872 | void sss_recv_mbx_aeq_handler(void *handle, u8 *header, u8 size)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~
--
>> drivers/net/ethernet/3snic/sssnic/hw/sss_hwif_init.c:311:32: sparse: sparse: cast removes address space '<asn:2>' of expression
   drivers/net/ethernet/3snic/sssnic/hw/sss_hwif_init.c:309:54: sparse: sparse: incompatible types in conditional expression (different address spaces):
   drivers/net/ethernet/3snic/sssnic/hw/sss_hwif_init.c:309:54: sparse:    void [noderef] <asn:2> *
   drivers/net/ethernet/3snic/sssnic/hw/sss_hwif_init.c:309:54: sparse:    unsigned char [usertype] *
--
   drivers/net/ethernet/3snic/sssnic/hw/sss_hwif_api.c:31:24: sparse: sparse: cast to restricted __be32
   drivers/net/ethernet/3snic/sssnic/hw/sss_hwif_api.c:34:24: sparse: sparse: cast to restricted __be32
>> drivers/net/ethernet/3snic/sssnic/hw/sss_hwif_api.c:41:17: sparse: sparse: cast from restricted __be32
>> drivers/net/ethernet/3snic/sssnic/hw/sss_hwif_api.c:41:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __be32 [usertype] @@
   drivers/net/ethernet/3snic/sssnic/hw/sss_hwif_api.c:41:17: sparse:     expected unsigned int [usertype] val
   drivers/net/ethernet/3snic/sssnic/hw/sss_hwif_api.c:41:17: sparse:     got restricted __be32 [usertype]
>> drivers/net/ethernet/3snic/sssnic/hw/sss_hwif_api.c:41:17: sparse: sparse: cast from restricted __be32
>> drivers/net/ethernet/3snic/sssnic/hw/sss_hwif_api.c:41:17: sparse: sparse: cast from restricted __be32
>> drivers/net/ethernet/3snic/sssnic/hw/sss_hwif_api.c:41:17: sparse: sparse: cast from restricted __be32
>> drivers/net/ethernet/3snic/sssnic/hw/sss_hwif_api.c:41:17: sparse: sparse: cast from restricted __be32
   drivers/net/ethernet/3snic/sssnic/hw/sss_hwif_api.c:44:17: sparse: sparse: cast from restricted __be32
   drivers/net/ethernet/3snic/sssnic/hw/sss_hwif_api.c:44:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __be32 [usertype] @@
   drivers/net/ethernet/3snic/sssnic/hw/sss_hwif_api.c:44:17: sparse:     expected unsigned int [usertype] val
   drivers/net/ethernet/3snic/sssnic/hw/sss_hwif_api.c:44:17: sparse:     got restricted __be32 [usertype]
   drivers/net/ethernet/3snic/sssnic/hw/sss_hwif_api.c:44:17: sparse: sparse: cast from restricted __be32
   drivers/net/ethernet/3snic/sssnic/hw/sss_hwif_api.c:44:17: sparse: sparse: cast from restricted __be32
   drivers/net/ethernet/3snic/sssnic/hw/sss_hwif_api.c:44:17: sparse: sparse: cast from restricted __be32
   drivers/net/ethernet/3snic/sssnic/hw/sss_hwif_api.c:44:17: sparse: sparse: cast from restricted __be32
--
   drivers/net/ethernet/3snic/sssnic/hw/./tool/sss_tool_main.c:80:6: sparse: sparse: symbol 'sss_tool_free_in_buf' was not declared. Should it be static?
   drivers/net/ethernet/3snic/sssnic/hw/./tool/sss_tool_main.c:91:6: sparse: sparse: symbol 'sss_tool_free_out_buf' was not declared. Should it be static?
   drivers/net/ethernet/3snic/sssnic/hw/./tool/sss_tool_main.c:104:5: sparse: sparse: symbol 'sss_tool_alloc_in_buf' was not declared. Should it be static?
   drivers/net/ethernet/3snic/sssnic/hw/./tool/sss_tool_main.c:146:5: sparse: sparse: symbol 'sss_tool_alloc_out_buf' was not declared. Should it be static?
>> drivers/net/ethernet/3snic/sssnic/hw/./tool/sss_tool_main.c:189:42: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void [noderef] <asn:1> *to @@     got void *out_buf @@
   drivers/net/ethernet/3snic/sssnic/hw/./tool/sss_tool_main.c:189:42: sparse:     expected void [noderef] <asn:1> *to
   drivers/net/ethernet/3snic/sssnic/hw/./tool/sss_tool_main.c:189:42: sparse:     got void *out_buf
   drivers/net/ethernet/3snic/sssnic/hw/./tool/sss_tool_main.c:194:34: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void [noderef] <asn:1> *to @@     got void *out_buf @@
   drivers/net/ethernet/3snic/sssnic/hw/./tool/sss_tool_main.c:194:34: sparse:     expected void [noderef] <asn:1> *to
   drivers/net/ethernet/3snic/sssnic/hw/./tool/sss_tool_main.c:194:34: sparse:     got void *out_buf
   drivers/net/ethernet/3snic/sssnic/hw/./tool/sss_tool_main.c:182:5: sparse: sparse: symbol 'sss_tool_copy_to_user' was not declared. Should it be static?
>> drivers/net/ethernet/3snic/sssnic/hw/./tool/sss_tool_main.c:211:45: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const [noderef] <asn:1> *from @@     got void *in_buf @@
   drivers/net/ethernet/3snic/sssnic/hw/./tool/sss_tool_main.c:211:45: sparse:     expected void const [noderef] <asn:1> *from
   drivers/net/ethernet/3snic/sssnic/hw/./tool/sss_tool_main.c:211:45: sparse:     got void *in_buf
   drivers/net/ethernet/3snic/sssnic/hw/./tool/sss_tool_main.c:238:36: sparse: sparse: symbol 'g_deal_msg_handle' was not declared. Should it be static?
>> drivers/net/ethernet/3snic/sssnic/hw/./tool/sss_tool_main.c:318:40: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const [noderef] <asn:1> *from @@     got void * @@
   drivers/net/ethernet/3snic/sssnic/hw/./tool/sss_tool_main.c:318:40: sparse:     expected void const [noderef] <asn:1> *from
   drivers/net/ethernet/3snic/sssnic/hw/./tool/sss_tool_main.c:318:40: sparse:     got void *
>> drivers/net/ethernet/3snic/sssnic/hw/./tool/sss_tool_main.c:380:42: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void [noderef] <asn:1> *to @@     got struct sss_tool_ffm_record_info *ffm_rd @@
   drivers/net/ethernet/3snic/sssnic/hw/./tool/sss_tool_main.c:380:42: sparse:     expected void [noderef] <asn:1> *to
   drivers/net/ethernet/3snic/sssnic/hw/./tool/sss_tool_main.c:380:42: sparse:     got struct sss_tool_ffm_record_info *ffm_rd
   drivers/net/ethernet/3snic/sssnic/hw/./tool/sss_tool_main.c:416:37: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const [noderef] <asn:1> *from @@     got void * @@
   drivers/net/ethernet/3snic/sssnic/hw/./tool/sss_tool_main.c:416:37: sparse:     expected void const [noderef] <asn:1> *from
   drivers/net/ethernet/3snic/sssnic/hw/./tool/sss_tool_main.c:416:37: sparse:     got void *
   drivers/net/ethernet/3snic/sssnic/hw/./tool/sss_tool_main.c:80:6: warning: no previous prototype for 'sss_tool_free_in_buf' [-Wmissing-prototypes]
      80 | void sss_tool_free_in_buf(void *hwdev, const struct sss_tool_msg *tool_msg, void *in_buf)
         |      ^~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/3snic/sssnic/hw/./tool/sss_tool_main.c:91:6: warning: no previous prototype for 'sss_tool_free_out_buf' [-Wmissing-prototypes]
      91 | void sss_tool_free_out_buf(void *hwdev, struct sss_tool_msg *tool_msg,
         |      ^~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/3snic/sssnic/hw/./tool/sss_tool_main.c:104:5: warning: no previous prototype for 'sss_tool_alloc_in_buf' [-Wmissing-prototypes]
     104 | int sss_tool_alloc_in_buf(void *hwdev, struct sss_tool_msg *tool_msg,
         |     ^~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/3snic/sssnic/hw/./tool/sss_tool_main.c:146:5: warning: no previous prototype for 'sss_tool_alloc_out_buf' [-Wmissing-prototypes]
     146 | int sss_tool_alloc_out_buf(void *hwdev, struct sss_tool_msg *tool_msg,
         |     ^~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/3snic/sssnic/hw/./tool/sss_tool_main.c:182:5: warning: no previous prototype for 'sss_tool_copy_to_user' [-Wmissing-prototypes]
     182 | int sss_tool_copy_to_user(struct sss_tool_msg *tool_msg,
         |     ^~~~~~~~~~~~~~~~~~~~~
--
   drivers/net/ethernet/3snic/sssnic/hw/./tool/sss_tool_chip.c:498:5: sparse: sparse: symbol 'sss_tool_send_clp_msg' was not declared. Should it be static?
   drivers/net/ethernet/3snic/sssnic/hw/./tool/sss_tool_chip.c:604:28: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [assigned] [usertype] val32 @@     got restricted __be32 [usertype] @@
   drivers/net/ethernet/3snic/sssnic/hw/./tool/sss_tool_chip.c:604:28: sparse:     expected unsigned int [assigned] [usertype] val32
   drivers/net/ethernet/3snic/sssnic/hw/./tool/sss_tool_chip.c:604:28: sparse:     got restricted __be32 [usertype]
   drivers/net/ethernet/3snic/sssnic/hw/./tool/sss_tool_chip.c:606:28: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [assigned] [usertype] val32 @@     got restricted __be32 [usertype] @@
   drivers/net/ethernet/3snic/sssnic/hw/./tool/sss_tool_chip.c:606:28: sparse:     expected unsigned int [assigned] [usertype] val32
   drivers/net/ethernet/3snic/sssnic/hw/./tool/sss_tool_chip.c:606:28: sparse:     got restricted __be32 [usertype]
   drivers/net/ethernet/3snic/sssnic/hw/./tool/sss_tool_chip.c:588:5: sparse: sparse: symbol 'sss_tool_adm_csr_rd32' was not declared. Should it be static?
   drivers/net/ethernet/3snic/sssnic/hw/./tool/sss_tool_chip.c:635:28: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [assigned] [usertype] val32 @@     got restricted __be32 [usertype] @@
   drivers/net/ethernet/3snic/sssnic/hw/./tool/sss_tool_chip.c:635:28: sparse:     expected unsigned int [assigned] [usertype] val32
   drivers/net/ethernet/3snic/sssnic/hw/./tool/sss_tool_chip.c:635:28: sparse:     got restricted __be32 [usertype]
   drivers/net/ethernet/3snic/sssnic/hw/./tool/sss_tool_chip.c:637:28: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [assigned] [usertype] val32 @@     got restricted __be32 [usertype] @@
   drivers/net/ethernet/3snic/sssnic/hw/./tool/sss_tool_chip.c:637:28: sparse:     expected unsigned int [assigned] [usertype] val32
   drivers/net/ethernet/3snic/sssnic/hw/./tool/sss_tool_chip.c:637:28: sparse:     got restricted __be32 [usertype]
   drivers/net/ethernet/3snic/sssnic/hw/./tool/sss_tool_chip.c:621:5: sparse: sparse: symbol 'sss_tool_adm_csr_wr32' was not declared. Should it be static?
>> drivers/net/ethernet/3snic/sssnic/hw/./tool/sss_tool_chip.c:704:35: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const [noderef] <asn:1> *from @@     got void * @@
   drivers/net/ethernet/3snic/sssnic/hw/./tool/sss_tool_chip.c:704:35: sparse:     expected void const [noderef] <asn:1> *from
   drivers/net/ethernet/3snic/sssnic/hw/./tool/sss_tool_chip.c:704:35: sparse:     got void *
   drivers/net/ethernet/3snic/sssnic/hw/./tool/sss_tool_chip.c:498:5: warning: no previous prototype for 'sss_tool_send_clp_msg' [-Wmissing-prototypes]
     498 | int sss_tool_send_clp_msg(struct sss_hwdev *hwdev, u8 mod, u16 cmd, const void *buf_in,
         |     ^~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/3snic/sssnic/hw/./tool/sss_tool_chip.c:588:5: warning: no previous prototype for 'sss_tool_adm_csr_rd32' [-Wmissing-prototypes]
     588 | int sss_tool_adm_csr_rd32(struct sss_hwdev *hwdev, u8 dest, u32 addr, u32 *val)
         |     ^~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/3snic/sssnic/hw/./tool/sss_tool_chip.c:621:5: warning: no previous prototype for 'sss_tool_adm_csr_wr32' [-Wmissing-prototypes]
     621 | int sss_tool_adm_csr_wr32(struct sss_hwdev *hwdev, u8 dest, u32 addr, u32 val)
         |     ^~~~~~~~~~~~~~~~~~~~~
--
   drivers/net/ethernet/3snic/sssnic/nic/sss_nic_tx.c:710:9: sparse: sparse: restricted __be16 degrades to integer
   drivers/net/ethernet/3snic/sssnic/nic/sss_nic_tx.c: note: in included file:
>> drivers/net/ethernet/3snic/sssnic/nic/sss_nic_io.h:103:9: sparse: sparse: cast removes address space '<asn:2>' of expression
>> drivers/net/ethernet/3snic/sssnic/nic/sss_nic_io.h:103:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] <asn:2> *addr @@     got unsigned long long [usertype] * @@
   drivers/net/ethernet/3snic/sssnic/nic/sss_nic_io.h:103:9: sparse:     expected void volatile [noderef] <asn:2> *addr
   drivers/net/ethernet/3snic/sssnic/nic/sss_nic_io.h:103:9: sparse:     got unsigned long long [usertype] *
   In file included from include/linux/sctp.h:57,
                    from drivers/net/ethernet/3snic/sssnic/nic/sss_nic_tx.c:14:
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
--
   drivers/net/ethernet/3snic/sssnic/nic/sss_nic_rx.c: note: in included file:
>> drivers/net/ethernet/3snic/sssnic/nic/sss_nic_io.h:103:9: sparse: sparse: cast removes address space '<asn:2>' of expression
>> drivers/net/ethernet/3snic/sssnic/nic/sss_nic_io.h:103:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] <asn:2> *addr @@     got unsigned long long [usertype] * @@
   drivers/net/ethernet/3snic/sssnic/nic/sss_nic_io.h:103:9: sparse:     expected void volatile [noderef] <asn:2> *addr
   drivers/net/ethernet/3snic/sssnic/nic/sss_nic_io.h:103:9: sparse:     got unsigned long long [usertype] *
>> drivers/net/ethernet/3snic/sssnic/nic/sss_nic_io.h:103:9: sparse: sparse: cast removes address space '<asn:2>' of expression
>> drivers/net/ethernet/3snic/sssnic/nic/sss_nic_io.h:103:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] <asn:2> *addr @@     got unsigned long long [usertype] * @@
   drivers/net/ethernet/3snic/sssnic/nic/sss_nic_io.h:103:9: sparse:     expected void volatile [noderef] <asn:2> *addr
   drivers/net/ethernet/3snic/sssnic/nic/sss_nic_io.h:103:9: sparse:     got unsigned long long [usertype] *
   In file included from include/linux/sctp.h:57,
                    from drivers/net/ethernet/3snic/sssnic/nic/sss_nic_rx.c:18:
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
--
   drivers/net/ethernet/3snic/sssnic/nic/sss_nic_rx_reset.c: note: in included file:
>> drivers/net/ethernet/3snic/sssnic/nic/sss_nic_io.h:103:9: sparse: sparse: cast removes address space '<asn:2>' of expression
>> drivers/net/ethernet/3snic/sssnic/nic/sss_nic_io.h:103:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] <asn:2> *addr @@     got unsigned long long [usertype] * @@
   drivers/net/ethernet/3snic/sssnic/nic/sss_nic_io.h:103:9: sparse:     expected void volatile [noderef] <asn:2> *addr
   drivers/net/ethernet/3snic/sssnic/nic/sss_nic_io.h:103:9: sparse:     got unsigned long long [usertype] *
   In file included from include/linux/sctp.h:57,
                    from drivers/net/ethernet/3snic/sssnic/nic/sss_nic_rx_reset.c:18:
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
   drivers/net/ethernet/3snic/sssnic/nic/sss_nic_rx_reset.c:179:6: warning: no previous prototype for 'sss_nic_rq_watchdog_handler' [-Wmissing-prototypes]
     179 | void sss_nic_rq_watchdog_handler(struct work_struct *work)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~
--
>> drivers/net/ethernet/3snic/sssnic/nic/sss_nic_io.c:400:31: sparse: sparse: cast removes address space '<asn:2>' of expression
>> drivers/net/ethernet/3snic/sssnic/nic/sss_nic_io.c:400:28: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected unsigned char [noderef] [usertype] <asn:2> *sq_db_addr @@     got unsigned char [usertype] * @@
   drivers/net/ethernet/3snic/sssnic/nic/sss_nic_io.c:400:28: sparse:     expected unsigned char [noderef] [usertype] <asn:2> *sq_db_addr
   drivers/net/ethernet/3snic/sssnic/nic/sss_nic_io.c:400:28: sparse:     got unsigned char [usertype] *
   drivers/net/ethernet/3snic/sssnic/nic/sss_nic_io.c:408:31: sparse: sparse: cast removes address space '<asn:2>' of expression
>> drivers/net/ethernet/3snic/sssnic/nic/sss_nic_io.c:408:28: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected unsigned char [noderef] [usertype] <asn:2> *rq_db_addr @@     got unsigned char [usertype] * @@
   drivers/net/ethernet/3snic/sssnic/nic/sss_nic_io.c:408:28: sparse:     expected unsigned char [noderef] [usertype] <asn:2> *rq_db_addr
   drivers/net/ethernet/3snic/sssnic/nic/sss_nic_io.c:408:28: sparse:     got unsigned char [usertype] *
   drivers/net/ethernet/3snic/sssnic/nic/sss_nic_io.c: note: in included file (through drivers/net/ethernet/3snic/sssnic/include/sss_hw.h):
   drivers/net/ethernet/3snic/sssnic/include/hw/sss_hw_common.h:77:22: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] @@     got restricted __be32 [usertype] @@
   drivers/net/ethernet/3snic/sssnic/include/hw/sss_hw_common.h:77:22: sparse:     expected unsigned int [usertype]
   drivers/net/ethernet/3snic/sssnic/include/hw/sss_hw_common.h:77:22: sparse:     got restricted __be32 [usertype]
   drivers/net/ethernet/3snic/sssnic/include/hw/sss_hw_common.h:77:22: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] @@     got restricted __be32 [usertype] @@
   drivers/net/ethernet/3snic/sssnic/include/hw/sss_hw_common.h:77:22: sparse:     expected unsigned int [usertype]
   drivers/net/ethernet/3snic/sssnic/include/hw/sss_hw_common.h:77:22: sparse:     got restricted __be32 [usertype]
   drivers/net/ethernet/3snic/sssnic/include/hw/sss_hw_common.h:77:22: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] @@     got restricted __be32 [usertype] @@
   drivers/net/ethernet/3snic/sssnic/include/hw/sss_hw_common.h:77:22: sparse:     expected unsigned int [usertype]
   drivers/net/ethernet/3snic/sssnic/include/hw/sss_hw_common.h:77:22: sparse:     got restricted __be32 [usertype]
   drivers/net/ethernet/3snic/sssnic/include/hw/sss_hw_common.h:77:22: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] @@     got restricted __be32 [usertype] @@
   drivers/net/ethernet/3snic/sssnic/include/hw/sss_hw_common.h:77:22: sparse:     expected unsigned int [usertype]
   drivers/net/ethernet/3snic/sssnic/include/hw/sss_hw_common.h:77:22: sparse:     got restricted __be32 [usertype]
--
>> drivers/net/ethernet/3snic/sssnic/nic/./tool/sss_tool_nic_qp_info.c:71:39: sparse: sparse: cast removes address space '<asn:2>' of expression
   drivers/net/ethernet/3snic/sssnic/nic/./tool/sss_tool_nic_qp_info.c:88:24: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short [usertype] hw_pi @@     got restricted __be16 [usertype] @@
   drivers/net/ethernet/3snic/sssnic/nic/./tool/sss_tool_nic_qp_info.c:88:24: sparse:     expected unsigned short [usertype] hw_pi
   drivers/net/ethernet/3snic/sssnic/nic/./tool/sss_tool_nic_qp_info.c:88:24: sparse:     got restricted __be16 [usertype]
   drivers/net/ethernet/3snic/sssnic/nic/./tool/sss_tool_nic_qp_info.c:137:5: sparse: sparse: symbol 'sss_tool_get_tx_info' was not declared. Should it be static?
   drivers/net/ethernet/3snic/sssnic/nic/./tool/sss_tool_nic_qp_info.c:163:5: sparse: sparse: symbol 'sss_tool_get_tx_wqe_info' was not declared. Should it be static?
   drivers/net/ethernet/3snic/sssnic/nic/./tool/sss_tool_nic_qp_info.c:182:5: sparse: sparse: symbol 'sss_tool_get_rx_info' was not declared. Should it be static?
   drivers/net/ethernet/3snic/sssnic/nic/./tool/sss_tool_nic_qp_info.c:223:5: sparse: sparse: symbol 'sss_tool_get_rx_wqe_info' was not declared. Should it be static?
   drivers/net/ethernet/3snic/sssnic/nic/./tool/sss_tool_nic_qp_info.c:242:5: sparse: sparse: symbol 'sss_tool_get_rx_cqe_info' was not declared. Should it be static?
   drivers/net/ethernet/3snic/sssnic/nic/./tool/sss_tool_nic_qp_info.c:280:5: sparse: sparse: symbol 'sss_tool_get_q_num' was not declared. Should it be static?
   drivers/net/ethernet/3snic/sssnic/nic/./tool/sss_tool_nic_qp_info.c:304:5: sparse: sparse: symbol 'sss_tool_get_inter_num' was not declared. Should it be static?
   drivers/net/ethernet/3snic/sssnic/nic/./tool/sss_tool_nic_qp_info.c:137:5: warning: no previous prototype for 'sss_tool_get_tx_info' [-Wmissing-prototypes]
     137 | int sss_tool_get_tx_info(struct sss_nic_dev *nic_dev, const void *in_buf,
         |     ^~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/3snic/sssnic/nic/./tool/sss_tool_nic_qp_info.c:163:5: warning: no previous prototype for 'sss_tool_get_tx_wqe_info' [-Wmissing-prototypes]
     163 | int sss_tool_get_tx_wqe_info(struct sss_nic_dev *nic_dev, const void *in_buf,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/3snic/sssnic/nic/./tool/sss_tool_nic_qp_info.c:182:5: warning: no previous prototype for 'sss_tool_get_rx_info' [-Wmissing-prototypes]
     182 | int sss_tool_get_rx_info(struct sss_nic_dev *nic_dev, const void *in_buf,
         |     ^~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/3snic/sssnic/nic/./tool/sss_tool_nic_qp_info.c:223:5: warning: no previous prototype for 'sss_tool_get_rx_wqe_info' [-Wmissing-prototypes]
     223 | int sss_tool_get_rx_wqe_info(struct sss_nic_dev *nic_dev, const void *in_buf,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/3snic/sssnic/nic/./tool/sss_tool_nic_qp_info.c:242:5: warning: no previous prototype for 'sss_tool_get_rx_cqe_info' [-Wmissing-prototypes]
     242 | int sss_tool_get_rx_cqe_info(struct sss_nic_dev *nic_dev, const void *in_buf,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/3snic/sssnic/nic/./tool/sss_tool_nic_qp_info.c:280:5: warning: no previous prototype for 'sss_tool_get_q_num' [-Wmissing-prototypes]
     280 | int sss_tool_get_q_num(struct sss_nic_dev *nic_dev, const void *in_buf, u32 in_len,
         |     ^~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/3snic/sssnic/nic/./tool/sss_tool_nic_qp_info.c:304:5: warning: no previous prototype for 'sss_tool_get_inter_num' [-Wmissing-prototypes]
     304 | int sss_tool_get_inter_num(struct sss_nic_dev *nic_dev, const void *in_buf,
         |     ^~~~~~~~~~~~~~~~~~~~~~

vim +320 drivers/net/ethernet/3snic/sssnic/hw/sss_hwif_ctrlq.c

   306	
   307	static void sss_ctrlq_set_db(struct sss_ctrlq *ctrlq,
   308				     enum sss_ctrlq_type ctrlq_type, u16 pi)
   309	{
   310		struct sss_ctrlq_db db = {0};
   311		u8 *db_base = SSS_TO_HWDEV(ctrlq)->ctrlq_info->db_base;
   312	
   313		sss_ctrlq_fill_db(&db, ctrlq_type, pi);
   314	
   315		/* The data that is written to HW should be in Big Endian Format */
   316		db.info = sss_hw_be32(db.info);
   317		db.head = sss_hw_be32(db.head);
   318	
   319		wmb(); /* make sure write db info to reg */
 > 320		writeq(*((u64 *)&db), SSS_CTRLQ_DB_ADDR(db_base, pi));
   321	}
   322	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
