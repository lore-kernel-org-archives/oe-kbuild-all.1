Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 611D0383BD
	for <oe-kbuild-all@lists.linux.dev>; Sun, 21 Apr 2024 21:16:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713734195; cv=none; b=gYrjYU+k04vKGF3uvT2Aoa0Ts2evztksv+bAPELfy06Ae50el1jxXnSmsn3oOVG0jPtrj/8UFtno/R/7OZeraCiWP4gBkjhSEign55SvqpAeOkqRu2A+rD3eUZa6YJGLtukn/DatpiL3XfD74t+O4PECS9g7bSdD19cDneoODTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713734195; c=relaxed/simple;
	bh=nxjM/oiEaIxcqmsaxcVjY9POOkV4F1Ac0IHBOMNeCLM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YrxOkmCplOljBKWZd85TgMQ5fm9GLvVGJxwGUkdukIoutiW1RQmmP5hBDpXGXZdkSHObeCBqcWHWvybw8bBW0ftUYXS9hiOgAmtPIe2FXV7fAi09EKiJVOQI49NeJfzWd1El3Iv3nok0gGzYUk8doN+X1iRv3Um54hLr5r/NEQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aYJpTZc6; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aYJpTZc6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713734193; x=1745270193;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nxjM/oiEaIxcqmsaxcVjY9POOkV4F1Ac0IHBOMNeCLM=;
  b=aYJpTZc6blq/ut2MIhgszKBsvJp9cfrcuDL4JcxTJHER4kc3qTqDyZSB
   aIaLdBJMWs+Zoh3FeE0VZz5MnGf/H4oxQRCLhB4dFtvc6P3qOSy2ZVvnN
   a8KW0cbKVPw+qlaKipkimP+d4PDbw1LmWjVech4gmdkTWUxSvnAZdts8H
   Gbo9BzXFTxUjGrYRNQp2Vyr/LKo4Wth3grHwoVe5d9woteHwLwvl2gGfZ
   vyY0mz1Gcfx0Z/z3wIoT5J7X7S3Je8KShv363kbpEpQzeZqsagU4itWco
   OBv7DlmZwyZQ+4COrjuXWnhB0SkVrCjV5glFk+IV9pLRBtjRSy4UUbL3B
   g==;
X-CSE-ConnectionGUID: AdtzzWsFT8qargvn9m2cUw==
X-CSE-MsgGUID: erUvmPyYT7C3GJYJQySgAQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11051"; a="9095265"
X-IronPort-AV: E=Sophos;i="6.07,219,1708416000"; 
   d="scan'208";a="9095265"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2024 14:16:33 -0700
X-CSE-ConnectionGUID: 7YvVrmpnR2CRD6IIMLIIeQ==
X-CSE-MsgGUID: 9v94z+FtSHGhEMznSt1UnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,219,1708416000"; 
   d="scan'208";a="24277040"
Received: from unknown (HELO 23c141fc0fd8) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 21 Apr 2024 14:16:29 -0700
Received: from kbuild by 23c141fc0fd8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ryeXy-000CAc-0m;
	Sun, 21 Apr 2024 21:16:26 +0000
Date: Mon, 22 Apr 2024 05:15:59 +0800
From: kernel test robot <lkp@intel.com>
To: jasperwang@tencent.com, kaixuxia@tencent.com, frankjpliu@tencent.com,
	kasong@tencent.com, sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:next 6470/6471]
 drivers/net/ethernet/3snic/sssnic/nic/../hw/sss_pci_probe.c:549:5: warning:
 no previous prototype for 'sss_pci_probe'
Message-ID: <202404220538.6oUoi7i3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git next
head:   14a98183c9e243396a2acd72fcd56ad4230f24ee
commit: af04f5fda50a643c0dc483584bc5be97f2117d36 [6470/6471] add 3snic 3s9xx driver
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20240422/202404220538.6oUoi7i3-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240422/202404220538.6oUoi7i3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404220538.6oUoi7i3-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/ethernet/3snic/sssnic/nic/../hw/sss_pci_probe.c:277:5: warning: no previous prototype for 'sss_attach_uld_driver' [-Wmissing-prototypes]
     277 | int sss_attach_uld_driver(struct sss_pci_adapter *adapter,
         |     ^~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/3snic/sssnic/nic/../hw/sss_pci_probe.c:549:5: warning: no previous prototype for 'sss_pci_probe' [-Wmissing-prototypes]
     549 | int sss_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
         |     ^~~~~~~~~~~~~
--
>> drivers/net/ethernet/3snic/sssnic/nic/../hw/sss_pci_remove.c:91:6: warning: no previous prototype for 'sss_detach_uld_driver' [-Wmissing-prototypes]
      91 | void sss_detach_uld_driver(struct sss_pci_adapter *adapter,
         |      ^~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/3snic/sssnic/nic/../hw/sss_pci_remove.c:121:6: warning: no previous prototype for 'sss_detach_all_uld_driver' [-Wmissing-prototypes]
     121 | void sss_detach_all_uld_driver(struct sss_pci_adapter *adapter)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/3snic/sssnic/nic/../hw/sss_pci_remove.c:139:6: warning: no previous prototype for 'sss_dettach_uld_dev' [-Wmissing-prototypes]
     139 | void sss_dettach_uld_dev(struct sss_pci_adapter *adapter)
         |      ^~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/3snic/sssnic/nic/../hw/sss_pci_remove.c:180:6: warning: no previous prototype for 'sss_deinit_function' [-Wmissing-prototypes]
     180 | void sss_deinit_function(struct pci_dev *pdev)
         |      ^~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/3snic/sssnic/nic/../hw/sss_pci_remove.c:201:6: warning: no previous prototype for 'sss_unmap_pci_bar' [-Wmissing-prototypes]
     201 | void sss_unmap_pci_bar(struct sss_pci_adapter *adapter)
         |      ^~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/3snic/sssnic/nic/../hw/sss_pci_remove.c:212:5: warning: no previous prototype for 'sss_deinit_adapter' [-Wmissing-prototypes]
     212 | int sss_deinit_adapter(struct sss_pci_adapter *adapter)
         |     ^~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/3snic/sssnic/nic/../hw/sss_pci_remove.c:238:6: warning: no previous prototype for 'sss_deinit_pci_dev' [-Wmissing-prototypes]
     238 | void sss_deinit_pci_dev(struct pci_dev *pdev)
         |      ^~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/3snic/sssnic/nic/../hw/sss_pci_remove.c:250:6: warning: no previous prototype for 'sss_pci_remove' [-Wmissing-prototypes]
     250 | void sss_pci_remove(struct pci_dev *pdev)
         |      ^~~~~~~~~~~~~~
--
>> drivers/net/ethernet/3snic/sssnic/nic/../hw/sss_pci_shutdown.c:28:6: warning: no previous prototype for 'sss_pci_shutdown' [-Wmissing-prototypes]
      28 | void sss_pci_shutdown(struct pci_dev *pdev)
         |      ^~~~~~~~~~~~~~~~
--
>> drivers/net/ethernet/3snic/sssnic/nic/../hw/sss_pci_error.c:34:18: warning: no previous prototype for 'sss_detect_pci_error' [-Wmissing-prototypes]
      34 | pci_ers_result_t sss_detect_pci_error(struct pci_dev *pdev,
         |                  ^~~~~~~~~~~~~~~~~~~~
--
>> drivers/net/ethernet/3snic/sssnic/nic/../hw/sss_pci_global.c:37:6: warning: no previous prototype for 'sss_init_uld_lock' [-Wmissing-prototypes]
      37 | void sss_init_uld_lock(void)
         |      ^~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/3snic/sssnic/nic/../hw/sss_pci_global.c:42:6: warning: no previous prototype for 'sss_lock_uld' [-Wmissing-prototypes]
      42 | void sss_lock_uld(void)
         |      ^~~~~~~~~~~~
>> drivers/net/ethernet/3snic/sssnic/nic/../hw/sss_pci_global.c:47:6: warning: no previous prototype for 'sss_unlock_uld' [-Wmissing-prototypes]
      47 | void sss_unlock_uld(void)
         |      ^~~~~~~~~~~~~~
>> drivers/net/ethernet/3snic/sssnic/nic/../hw/sss_pci_global.c:52:14: warning: no previous prototype for 'sss_get_uld_names' [-Wmissing-prototypes]
      52 | const char **sss_get_uld_names(void)
         |              ^~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/3snic/sssnic/nic/../hw/sss_pci_global.c:57:22: warning: no previous prototype for 'sss_get_uld_info' [-Wmissing-prototypes]
      57 | struct sss_uld_info *sss_get_uld_info(void)
         |                      ^~~~~~~~~~~~~~~~
>> drivers/net/ethernet/3snic/sssnic/nic/../hw/sss_pci_global.c:62:6: warning: no previous prototype for 'sss_attach_is_enable' [-Wmissing-prototypes]
      62 | bool sss_attach_is_enable(void)
         |      ^~~~~~~~~~~~~~~~~~~~
--
   drivers/net/ethernet/3snic/sssnic/nic/../hw/sss_hwdev_init.c: In function 'sss_heartbeat_lost_handler':
   drivers/net/ethernet/3snic/sssnic/nic/../hw/sss_hwdev_init.c:185:13: warning: variable 'pcie_src' set but not used [-Wunused-but-set-variable]
     185 |         u16 pcie_src;
         |             ^~~~~~~~
   drivers/net/ethernet/3snic/sssnic/nic/../hw/sss_hwdev_init.c:184:13: warning: variable 'fault_level' set but not used [-Wunused-but-set-variable]
     184 |         u16 fault_level;
         |             ^~~~~~~~~~~
   drivers/net/ethernet/3snic/sssnic/nic/../hw/sss_hwdev_init.c: At top level:
>> drivers/net/ethernet/3snic/sssnic/nic/../hw/sss_hwdev_init.c:384:5: warning: no previous prototype for 'sss_init_hwdev' [-Wmissing-prototypes]
     384 | int sss_init_hwdev(struct sss_pci_adapter *adapter)
         |     ^~~~~~~~~~~~~~
>> drivers/net/ethernet/3snic/sssnic/nic/../hw/sss_hwdev_init.c:487:6: warning: no previous prototype for 'sss_deinit_hwdev' [-Wmissing-prototypes]
     487 | void sss_deinit_hwdev(void *hwdev)
         |      ^~~~~~~~~~~~~~~~
>> drivers/net/ethernet/3snic/sssnic/nic/../hw/sss_hwdev_init.c:518:6: warning: no previous prototype for 'sss_hwdev_stop' [-Wmissing-prototypes]
     518 | void sss_hwdev_stop(void *hwdev)
         |      ^~~~~~~~~~~~~~
>> drivers/net/ethernet/3snic/sssnic/nic/../hw/sss_hwdev_init.c:531:6: warning: no previous prototype for 'sss_hwdev_detach' [-Wmissing-prototypes]
     531 | void sss_hwdev_detach(void *hwdev)
         |      ^~~~~~~~~~~~~~~~
>> drivers/net/ethernet/3snic/sssnic/nic/../hw/sss_hwdev_init.c:539:6: warning: no previous prototype for 'sss_hwdev_shutdown' [-Wmissing-prototypes]
     539 | void sss_hwdev_shutdown(void *hwdev)
         |      ^~~~~~~~~~~~~~~~~~
--
>> drivers/net/ethernet/3snic/sssnic/nic/../hw/sss_hwdev_mgmt_info.c:54:5: warning: no previous prototype for 'sss_init_mgmt_info' [-Wmissing-prototypes]
      54 | int sss_init_mgmt_info(struct sss_hwdev *hwdev)
         |     ^~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/3snic/sssnic/nic/../hw/sss_hwdev_mgmt_info.c:90:6: warning: no previous prototype for 'sss_deinit_mgmt_info' [-Wmissing-prototypes]
      90 | void sss_deinit_mgmt_info(struct sss_hwdev *hwdev)
         |      ^~~~~~~~~~~~~~~~~~~~
--
>> drivers/net/ethernet/3snic/sssnic/nic/../hw/sss_hwdev_io_flush.c:91:5: warning: no previous prototype for 'sss_hwdev_flush_io' [-Wmissing-prototypes]
      91 | int sss_hwdev_flush_io(struct sss_hwdev *hwdev, u16 channel)
         |     ^~~~~~~~~~~~~~~~~~
--
>> drivers/net/ethernet/3snic/sssnic/nic/../hw/sss_hwif_ctrlq_init.c:278:5: warning: no previous prototype for 'sss_reinit_ctrlq_ctx' [-Wmissing-prototypes]
     278 | int sss_reinit_ctrlq_ctx(struct sss_hwdev *hwdev)
         |     ^~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/3snic/sssnic/nic/../hw/sss_hwif_ctrlq_init.c:368:6: warning: no previous prototype for 'sss_deinit_ctrlq' [-Wmissing-prototypes]
     368 | void sss_deinit_ctrlq(struct sss_hwdev *hwdev)
         |      ^~~~~~~~~~~~~~~~
>> drivers/net/ethernet/3snic/sssnic/nic/../hw/sss_hwif_ctrlq_init.c:502:5: warning: no previous prototype for 'sss_init_ctrlq_channel' [-Wmissing-prototypes]
     502 | int sss_init_ctrlq_channel(struct sss_hwdev *hwdev)
         |     ^~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/3snic/sssnic/nic/../hw/sss_hwif_ctrlq_init.c:539:6: warning: no previous prototype for 'sss_deinit_ctrlq_channel' [-Wmissing-prototypes]
     539 | void sss_deinit_ctrlq_channel(struct sss_hwdev *hwdev)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/3snic/sssnic/nic/../hw/sss_hwif_ctrlq_init.c:548:6: warning: no previous prototype for 'sss_ctrlq_flush_sync_cmd' [-Wmissing-prototypes]
     548 | void sss_ctrlq_flush_sync_cmd(struct sss_hwdev *hwdev)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/3snic/sssnic/nic/../hw/sss_hwif_ctrlq_init.c:574:5: warning: no previous prototype for 'sss_wait_ctrlq_stop' [-Wmissing-prototypes]
     574 | int sss_wait_ctrlq_stop(struct sss_hwdev *hwdev)
         |     ^~~~~~~~~~~~~~~~~~~
--
>> drivers/net/ethernet/3snic/sssnic/nic/../hw/sss_hwif_mbx_init.c:252:5: warning: no previous prototype for 'sss_init_func_mbx_msg' [-Wmissing-prototypes]
     252 | int sss_init_func_mbx_msg(void *hwdev, u16 func_num)
         |     ^~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/3snic/sssnic/nic/../hw/sss_hwif_mbx_init.c:401:5: warning: no previous prototype for 'sss_hwif_init_mbx' [-Wmissing-prototypes]
     401 | int sss_hwif_init_mbx(struct sss_hwdev *hwdev)
         |     ^~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/3snic/sssnic/nic/../hw/sss_hwif_mbx_init.c:449:6: warning: no previous prototype for 'sss_hwif_deinit_mbx' [-Wmissing-prototypes]
     449 | void sss_hwif_deinit_mbx(struct sss_hwdev *hwdev)
         |      ^~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/3snic/sssnic/nic/../hw/sss_hwif_mbx_init.c:872:6: warning: no previous prototype for 'sss_recv_mbx_aeq_handler' [-Wmissing-prototypes]
     872 | void sss_recv_mbx_aeq_handler(void *handle, u8 *header, u8 size)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~
--
>> drivers/net/ethernet/3snic/sssnic/nic/../hw/sss_hwif_adm.c:544:5: warning: no previous prototype for 'sss_adm_msg_write' [-Wmissing-prototypes]
     544 | int sss_adm_msg_write(struct sss_adm_msg *adm_msg, u8 node_id,
         |     ^~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/3snic/sssnic/nic/../hw/sss_hwif_adm.c:550:5: warning: no previous prototype for 'sss_adm_msg_read' [-Wmissing-prototypes]
     550 | int sss_adm_msg_read(struct sss_adm_msg *adm_msg, u8 node_id,
         |     ^~~~~~~~~~~~~~~~
>> drivers/net/ethernet/3snic/sssnic/nic/../hw/sss_hwif_adm.c:596:5: warning: no previous prototype for 'sss_adm_msg_read_ack' [-Wmissing-prototypes]
     596 | int sss_adm_msg_read_ack(void *hwdev, u8 dest, const void *cmd,
         |     ^~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/3snic/sssnic/nic/../hw/sss_hwif_adm.c:617:5: warning: no previous prototype for 'sss_adm_msg_write_nack' [-Wmissing-prototypes]
     617 | int sss_adm_msg_write_nack(void *hwdev, u8 dest, const void *cmd, u16 size)
         |     ^~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/3snic/sssnic/nic/../hw/sss_hwif_adm.c:681:5: warning: no previous prototype for 'sss_sync_send_adm_msg' [-Wmissing-prototypes]
     681 | int sss_sync_send_adm_msg(void *hwdev, u8 mod, u16 cmd, void *buf_in,
         |     ^~~~~~~~~~~~~~~~~~~~~
..


vim +/sss_pci_probe +549 drivers/net/ethernet/3snic/sssnic/nic/../hw/sss_pci_probe.c

   548	
 > 549	int sss_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
