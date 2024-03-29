Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B1D1125B2
	for <oe-kbuild-all@lists.linux.dev>; Fri, 29 Mar 2024 01:17:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711675053; cv=none; b=u32xCE2gXH8TdFi+/0dwD4cvcbuF98nHM31AbYyU/Q3yq4Ri1C7s00UfntncRHJ0DDaape/cYWWouX5NZW/prdHKjB0CgV++mjdD2G4PApBZ8tdnoCv51tPJ2PI4tNErBBm8Z7YVYEsIP1uQZZ20BZoolkiTaSrsr6LgwfUwf+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711675053; c=relaxed/simple;
	bh=8DTpER1vPLY9lDbYeP02S+vrhEPwS1NAWnhxmSebWO0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=J4eKGROmglpi75Pb71MwdrhQifxl8Pa0a4nMSoRFFIfY0WP8zlfNXzTS59N/gUs1k+ukBTGv/JPqxgNz3RGnncf543wsdEIvkeNz1Ffgkr+R7CccyIBTjJS7u2tOgG1qgWsB+ePmy4229mbZ5fHLgIuRJ1nZgtbpz9flQ4xe2qg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MUJI0dfW; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MUJI0dfW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711675051; x=1743211051;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8DTpER1vPLY9lDbYeP02S+vrhEPwS1NAWnhxmSebWO0=;
  b=MUJI0dfWoavPhGwhagV81CY3aY7nlLRZYc+zU5iuAeHTGKrF+/PTzooU
   KKsgUPM8d0eWUlejw9hrLixOgVfQ6riAqb6oSHX7FxYKx3Mbmh0vePzQJ
   5wrPw22dfhJZJlr3c8RAYEnmlS1sc8B5xbL5htf8NMZ/MtDNd7tgfbyC2
   mGzhHtiUT88EmnzgpqD4GAMnqNAgoaVdAX2FwBlC1O47R1Q2YSS7estll
   Ey56yXMN0sJkI5PAHg0OIDkTUUvCFalC+UpgmpZC46GySCvHVL504sGi5
   qvfzVHpxFGfEf0PoQMyjupy0kYsfFTIzYFmUH+dXW2LHjXTQdzPrLsGue
   Q==;
X-CSE-ConnectionGUID: pUfM4OP5SwOC3BAgbFLQyw==
X-CSE-MsgGUID: w9km7bsLQq+0S3rUs2630Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11027"; a="7078871"
X-IronPort-AV: E=Sophos;i="6.07,162,1708416000"; 
   d="scan'208";a="7078871"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2024 18:17:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,162,1708416000"; 
   d="scan'208";a="16707680"
Received: from lkp-server01.sh.intel.com (HELO be39aa325d23) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 28 Mar 2024 18:17:28 -0700
Received: from kbuild by be39aa325d23 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rq0s2-0002hA-2X;
	Fri, 29 Mar 2024 01:17:26 +0000
Date: Fri, 29 Mar 2024 09:16:28 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zhou Shuai <zhoushuai28@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 4065/7000]
 drivers/net/ethernet/huawei/hinic3/hw/hinic3_mgmt.c:995: warning: This
 comment starts with '/**', but isn't a kernel-doc comment. Refer
 Documentation/doc-guide/kernel-doc.rst
Message-ID: <202403290935.d2CD8fUI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   704605877ce9913071214d2515a4c2b9077f5078
commit: dcb286ce50a35a77e51b61db72c7cc001647b598 [4065/7000] net/hinic3: add huawei/hinic3 driver
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20240329/202403290935.d2CD8fUI-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 23de3862dce582ce91c1aa914467d982cb1a73b4)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240329/202403290935.d2CD8fUI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403290935.d2CD8fUI-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/net/ethernet/huawei/hinic3/hw/hinic3_devlink.c:6:
   In file included from include/linux/netlink.h:7:
   In file included from include/linux/skbuff.h:17:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:8:
   In file included from include/linux/cacheflush.h:5:
   In file included from arch/arm64/include/asm/cacheflush.h:11:
   In file included from include/linux/kgdb.h:19:
   In file included from include/linux/kprobes.h:28:
   In file included from include/linux/ftrace.h:13:
   In file included from include/linux/kallsyms.h:13:
   In file included from include/linux/mm.h:2193:
   include/linux/vmstat.h:508:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     508 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     509 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:515:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     515 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     516 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:527:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     527 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     528 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:536:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     536 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     537 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/huawei/hinic3/hw/hinic3_devlink.c:350:18: warning: variable 'pdev' set but not used [-Wunused-but-set-variable]
     350 |         struct pci_dev *pdev = NULL;
         |                         ^
   6 warnings generated.
--
   drivers/net/ethernet/huawei/hinic3/hw/hinic3_api_cmd.c:445: warning: Function parameter or member 'ctxt' not described in 'wait_for_resp_polling'
>> drivers/net/ethernet/huawei/hinic3/hw/hinic3_api_cmd.c:445: warning: expecting prototype for prepare_cell(). Prototype was for wait_for_resp_polling() instead
   drivers/net/ethernet/huawei/hinic3/hw/hinic3_api_cmd.c:459: warning: Function parameter or member 'ctxt' not described in 'wait_for_api_cmd_completion'
   drivers/net/ethernet/huawei/hinic3/hw/hinic3_api_cmd.c:459: warning: Function parameter or member 'ack' not described in 'wait_for_api_cmd_completion'
   drivers/net/ethernet/huawei/hinic3/hw/hinic3_api_cmd.c:459: warning: Function parameter or member 'ack_size' not described in 'wait_for_api_cmd_completion'
   drivers/net/ethernet/huawei/hinic3/hw/hinic3_api_cmd.c:519: warning: Function parameter or member 'cmd_size' not described in 'api_cmd'
   drivers/net/ethernet/huawei/hinic3/hw/hinic3_api_cmd.c:519: warning: Function parameter or member 'ack' not described in 'api_cmd'
   drivers/net/ethernet/huawei/hinic3/hw/hinic3_api_cmd.c:519: warning: Function parameter or member 'ack_size' not described in 'api_cmd'
   drivers/net/ethernet/huawei/hinic3/hw/hinic3_api_cmd.c:519: warning: Excess function parameter 'size' description in 'api_cmd'
   drivers/net/ethernet/huawei/hinic3/hw/hinic3_api_cmd.c:580: warning: Function parameter or member 'ack' not described in 'hinic3_api_cmd_read'
   drivers/net/ethernet/huawei/hinic3/hw/hinic3_api_cmd.c:580: warning: Function parameter or member 'ack_size' not described in 'hinic3_api_cmd_read'
   drivers/net/ethernet/huawei/hinic3/hw/hinic3_api_cmd.c:605: warning: Function parameter or member 'cmd_chain' not described in 'api_cmd_hw_restart'
   drivers/net/ethernet/huawei/hinic3/hw/hinic3_api_cmd.c:605: warning: Excess function parameter 'chain' description in 'api_cmd_hw_restart'
>> drivers/net/ethernet/huawei/hinic3/hw/hinic3_api_cmd.c:825: warning: expecting prototype for alloc_cmd_buf(). Prototype was for alloc_resp_buf() instead
   drivers/net/ethernet/huawei/hinic3/hw/hinic3_api_cmd.c:1095: warning: Function parameter or member 'cmd_chain' not described in 'api_cmd_create_chain'
   drivers/net/ethernet/huawei/hinic3/hw/hinic3_api_cmd.c:1095: warning: Excess function parameter 'chain' description in 'api_cmd_create_chain'
   drivers/net/ethernet/huawei/hinic3/hw/hinic3_api_cmd.c:1159: warning: Function parameter or member 'hwdev' not described in 'hinic3_api_cmd_init'
   drivers/net/ethernet/huawei/hinic3/hw/hinic3_api_cmd.c:1159: warning: Excess function parameter 'hwif' description in 'hinic3_api_cmd_init'
   drivers/net/ethernet/huawei/hinic3/hw/hinic3_api_cmd.c:1199: warning: Function parameter or member 'hwdev' not described in 'hinic3_api_cmd_free'
--
   drivers/net/ethernet/huawei/hinic3/hw/hinic3_mgmt.c:167: warning: Function parameter or member 'ack_type' not described in 'prepare_header'
   drivers/net/ethernet/huawei/hinic3/hw/hinic3_mgmt.c:167: warning: Function parameter or member 'cmd' not described in 'prepare_header'
   drivers/net/ethernet/huawei/hinic3/hw/hinic3_mgmt.c:246: warning: Function parameter or member 'ack_type' not described in 'send_msg_to_mgmt_sync'
   drivers/net/ethernet/huawei/hinic3/hw/hinic3_mgmt.c:765: warning: Function parameter or member 'hwdev' not described in 'hinic3_mgmt_msg_aeqe_handler'
   drivers/net/ethernet/huawei/hinic3/hw/hinic3_mgmt.c:765: warning: Excess function parameter 'handle' description in 'hinic3_mgmt_msg_aeqe_handler'
>> drivers/net/ethernet/huawei/hinic3/hw/hinic3_mgmt.c:892: warning: expecting prototype for hinic_pf_to_mgmt_init(). Prototype was for hinic3_pf_to_mgmt_init() instead
>> drivers/net/ethernet/huawei/hinic3/hw/hinic3_mgmt.c:947: warning: expecting prototype for hinic_pf_to_mgmt_free(). Prototype was for hinic3_pf_to_mgmt_free() instead
>> drivers/net/ethernet/huawei/hinic3/hw/hinic3_mgmt.c:995: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * api cmd write or read bypass default use poll, if want to use aeq interrupt,
--
   drivers/net/ethernet/huawei/hinic3/hw/hinic3_mbox.c:176: warning: Function parameter or member 'pri_handle' not described in 'hinic3_register_ppf_mbox_cb'
   drivers/net/ethernet/huawei/hinic3/hw/hinic3_mbox.c:203: warning: Function parameter or member 'pri_handle' not described in 'hinic3_register_pf_mbox_cb'
   drivers/net/ethernet/huawei/hinic3/hw/hinic3_mbox.c:230: warning: Function parameter or member 'pri_handle' not described in 'hinic3_register_vf_mbox_cb'
>> drivers/net/ethernet/huawei/hinic3/hw/hinic3_mbox.c:279: warning: expecting prototype for hinic3_unregister_ppf_mbox_cb(). Prototype was for hinic3_unregister_pf_mbox_cb() instead
>> drivers/net/ethernet/huawei/hinic3/hw/hinic3_mbox.c:327: warning: expecting prototype for hinic3_unregister_ppf_mbox_cb(). Prototype was for hinic3_unregister_ppf_to_pf_mbox_cb() instead


vim +995 drivers/net/ethernet/huawei/hinic3/hw/hinic3_mgmt.c

   885	
   886	/**
   887	 * hinic_pf_to_mgmt_init - initialize PF to MGMT channel
   888	 * @hwdev: the pointer to hw device
   889	 * Return: 0 - success, negative - failure
   890	 **/
   891	int hinic3_pf_to_mgmt_init(struct hinic3_hwdev *hwdev)
 > 892	{
   893		struct hinic3_msg_pf_to_mgmt *pf_to_mgmt;
   894		void *dev = hwdev->dev_hdl;
   895		int err;
   896	
   897		pf_to_mgmt = kzalloc(sizeof(*pf_to_mgmt), GFP_KERNEL);
   898		if (!pf_to_mgmt)
   899			return -ENOMEM;
   900	
   901		hwdev->pf_to_mgmt = pf_to_mgmt;
   902		pf_to_mgmt->hwdev = hwdev;
   903		spin_lock_init(&pf_to_mgmt->async_msg_lock);
   904		spin_lock_init(&pf_to_mgmt->sync_event_lock);
   905		sema_init(&pf_to_mgmt->sync_msg_lock, 1);
   906		pf_to_mgmt->workq = create_singlethread_workqueue(HINIC3_MGMT_WQ_NAME);
   907		if (!pf_to_mgmt->workq) {
   908			sdk_err(dev, "Failed to initialize MGMT workqueue\n");
   909			err = -ENOMEM;
   910			goto create_mgmt_workq_err;
   911		}
   912	
   913		err = alloc_msg_buf(pf_to_mgmt);
   914		if (err) {
   915			sdk_err(dev, "Failed to allocate msg buffers\n");
   916			goto alloc_msg_buf_err;
   917		}
   918	
   919		err = hinic3_api_cmd_init(hwdev, pf_to_mgmt->cmd_chain);
   920		if (err) {
   921			sdk_err(dev, "Failed to init the api cmd chains\n");
   922			goto api_cmd_init_err;
   923		}
   924	
   925		return 0;
   926	
   927	api_cmd_init_err:
   928		free_msg_buf(pf_to_mgmt);
   929	
   930	alloc_msg_buf_err:
   931		destroy_workqueue(pf_to_mgmt->workq);
   932	
   933	create_mgmt_workq_err:
   934		spin_lock_deinit(&pf_to_mgmt->sync_event_lock);
   935		spin_lock_deinit(&pf_to_mgmt->async_msg_lock);
   936		sema_deinit(&pf_to_mgmt->sync_msg_lock);
   937		kfree(pf_to_mgmt);
   938	
   939		return err;
   940	}
   941	
   942	/**
   943	 * hinic_pf_to_mgmt_free - free PF to MGMT channel
   944	 * @hwdev: the pointer to hw device
   945	 **/
   946	void hinic3_pf_to_mgmt_free(struct hinic3_hwdev *hwdev)
 > 947	{
   948		struct hinic3_msg_pf_to_mgmt *pf_to_mgmt = hwdev->pf_to_mgmt;
   949	
   950		/* destroy workqueue before free related pf_to_mgmt resources in case of
   951		 * illegal resource access
   952		 */
   953		destroy_workqueue(pf_to_mgmt->workq);
   954		hinic3_api_cmd_free(hwdev, pf_to_mgmt->cmd_chain);
   955	
   956		free_msg_buf(pf_to_mgmt);
   957		spin_lock_deinit(&pf_to_mgmt->sync_event_lock);
   958		spin_lock_deinit(&pf_to_mgmt->async_msg_lock);
   959		sema_deinit(&pf_to_mgmt->sync_msg_lock);
   960		kfree(pf_to_mgmt);
   961	}
   962	
   963	void hinic3_flush_mgmt_workq(void *hwdev)
   964	{
   965		struct hinic3_hwdev *dev = (struct hinic3_hwdev *)hwdev;
   966	
   967		flush_workqueue(dev->aeqs->workq);
   968	
   969		if (hinic3_func_type(dev) != TYPE_VF)
   970			flush_workqueue(dev->pf_to_mgmt->workq);
   971	}
   972	
   973	int hinic3_api_cmd_read_ack(void *hwdev, u8 dest, const void *cmd,
   974				    u16 size, void *ack, u16 ack_size)
   975	{
   976		struct hinic3_msg_pf_to_mgmt *pf_to_mgmt = NULL;
   977		struct hinic3_api_cmd_chain *chain = NULL;
   978	
   979		if (!hwdev || !cmd || (ack_size && !ack) || size > MAX_PF_MGMT_BUF_SIZE)
   980			return -EINVAL;
   981	
   982		if (!COMM_SUPPORT_API_CHAIN((struct hinic3_hwdev *)hwdev))
   983			return -EPERM;
   984	
   985		pf_to_mgmt = ((struct hinic3_hwdev *)hwdev)->pf_to_mgmt;
   986		chain = pf_to_mgmt->cmd_chain[HINIC3_API_CMD_POLL_READ];
   987	
   988		if (!(((struct hinic3_hwdev *)hwdev)->chip_present_flag))
   989			return -EPERM;
   990	
   991		return hinic3_api_cmd_read(chain, dest, cmd, size, ack, ack_size);
   992	}
   993	
   994	/**
 > 995	 * api cmd write or read bypass default use poll, if want to use aeq interrupt,
   996	 * please set wb_trigger_aeqe to 1
   997	 **/
   998	int hinic3_api_cmd_write_nack(void *hwdev, u8 dest, const void *cmd, u16 size)
   999	{
  1000		struct hinic3_msg_pf_to_mgmt *pf_to_mgmt = NULL;
  1001		struct hinic3_api_cmd_chain *chain = NULL;
  1002	
  1003		if (!hwdev || !size || !cmd || size > MAX_PF_MGMT_BUF_SIZE)
  1004			return -EINVAL;
  1005	
  1006		if (!COMM_SUPPORT_API_CHAIN((struct hinic3_hwdev *)hwdev))
  1007			return -EPERM;
  1008	
  1009		pf_to_mgmt = ((struct hinic3_hwdev *)hwdev)->pf_to_mgmt;
  1010		chain = pf_to_mgmt->cmd_chain[HINIC3_API_CMD_POLL_WRITE];
  1011	
  1012		if (!(((struct hinic3_hwdev *)hwdev)->chip_present_flag))
  1013			return -EPERM;
  1014	
  1015		return hinic3_api_cmd_write(chain, dest, cmd, size);
  1016	}
  1017	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
