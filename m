Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C6021C861A
	for <oe-kbuild-all@lists.linux.dev>; Tue,  8 Jul 2025 01:24:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751937898; cv=none; b=RHTxuaeBY1YwxezYxWs3IGxlJOv54xi19Ie8B+V0pDuytesj39wNoy6r8MZESSJLehtUCXlDW5608qwTKWxYTH4vTvzty6TBXVkFcS9qcNtE6mmW0Ombv/G6J6RssHW0PVUfMsJKFbDrdAwdyaKQwHfj1QYivFOB4ro62QpLGy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751937898; c=relaxed/simple;
	bh=MIDVhEgAB169QqTlSVsFtDhTinag8m90y/fMUqxOgPo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uzd7xSm5n1RQwRjXFECmqKy4hWQeFm0tXOwaDsNpk03LGmfHCZJLMHY4yCz/kZoOqDSTHHWDul5C66BgPQF47Z6htuYOZcyghf6Pfd8KN6McfsUPkdsS/4FlZ9SNLM+IntupXrpRzPtPlkbXIdFlTqmbMF4sf5ZPmHUHwMqKLJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=k2Xl1lu7; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="k2Xl1lu7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751937895; x=1783473895;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MIDVhEgAB169QqTlSVsFtDhTinag8m90y/fMUqxOgPo=;
  b=k2Xl1lu7vLHAs6212MjbbWnCeyhg+KocB82QximXtpDQC/Ob27t++boe
   oovio5w/hBsjpbCA+w7xpeVLyMn18sAXU1cdWNn9LRIHOxQq719H/AH5I
   v7V5PPCpqmu7P5gcIJTbRM1jiH7ztnYlUxt2pUMI0S7XfhigAexNLcpgw
   +GcqiE143xSMPQ70SWsgHkRWGfEEH59r3jaH9xzGsRtuUNxYAhAyij5tc
   thSS7+mLK4RG7qWy/GAYmuh60OvfiR5CxnRnRdfi5r/HkZTzzNW4ZjVIi
   9r2G8ZH8jEFx8yzb9hIXS/GdUniTBfLsshvDBDpmA53EYSQeDG1TZhRFp
   A==;
X-CSE-ConnectionGUID: 31ytTrhIQTWJKpBpWMoENQ==
X-CSE-MsgGUID: 6+f1L/FFSiu8438FbYGxfw==
X-IronPort-AV: E=McAfee;i="6800,10657,11487"; a="53884008"
X-IronPort-AV: E=Sophos;i="6.16,295,1744095600"; 
   d="scan'208";a="53884008"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2025 18:24:54 -0700
X-CSE-ConnectionGUID: oN4UjozlRv+lsfmDQ4/GCA==
X-CSE-MsgGUID: y6W1Lg93RuuZTOwEXXXkeA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,295,1744095600"; 
   d="scan'208";a="186318590"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 07 Jul 2025 18:24:53 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uYx4k-0000tT-38;
	Tue, 08 Jul 2025 01:24:50 +0000
Date: Tue, 8 Jul 2025 09:24:48 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2467/2467]
 drivers/net/ethernet/3snic/sssnic/nic/../hw/sss_pci_probe.c:549:5: error: no
 previous prototype for 'sss_pci_probe'
Message-ID: <202507080923.Gxei1X4A-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   6b0fae63a73913be2bf981e780e69590ccb489ed
commit: 1ff5e78839ab1038757ebfd00f0a26ae53e64bda [2467/2467] improve 3SNIC 910/920/930 NIC driver
config: x86_64-randconfig-102-20250706 (https://download.01.org/0day-ci/archive/20250708/202507080923.Gxei1X4A-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250708/202507080923.Gxei1X4A-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507080923.Gxei1X4A-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/net/ethernet/3snic/sssnic/nic/../hw/sss_pci_probe.c:277:5: error: no previous prototype for 'sss_attach_uld_driver' [-Werror=missing-prototypes]
     277 | int sss_attach_uld_driver(struct sss_pci_adapter *adapter,
         |     ^~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/3snic/sssnic/nic/../hw/sss_pci_probe.c:549:5: error: no previous prototype for 'sss_pci_probe' [-Werror=missing-prototypes]
     549 | int sss_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
         |     ^~~~~~~~~~~~~
   cc1: all warnings being treated as errors
--
>> drivers/net/ethernet/3snic/sssnic/nic/../hw/sss_pci_remove.c:91:6: error: no previous prototype for 'sss_detach_uld_driver' [-Werror=missing-prototypes]
      91 | void sss_detach_uld_driver(struct sss_pci_adapter *adapter,
         |      ^~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/3snic/sssnic/nic/../hw/sss_pci_remove.c:121:6: error: no previous prototype for 'sss_detach_all_uld_driver' [-Werror=missing-prototypes]
     121 | void sss_detach_all_uld_driver(struct sss_pci_adapter *adapter)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/3snic/sssnic/nic/../hw/sss_pci_remove.c:139:6: error: no previous prototype for 'sss_dettach_uld_dev' [-Werror=missing-prototypes]
     139 | void sss_dettach_uld_dev(struct sss_pci_adapter *adapter)
         |      ^~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/3snic/sssnic/nic/../hw/sss_pci_remove.c:180:6: error: no previous prototype for 'sss_deinit_function' [-Werror=missing-prototypes]
     180 | void sss_deinit_function(struct pci_dev *pdev)
         |      ^~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/3snic/sssnic/nic/../hw/sss_pci_remove.c:201:6: error: no previous prototype for 'sss_unmap_pci_bar' [-Werror=missing-prototypes]
     201 | void sss_unmap_pci_bar(struct sss_pci_adapter *adapter)
         |      ^~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/3snic/sssnic/nic/../hw/sss_pci_remove.c:212:5: error: no previous prototype for 'sss_deinit_adapter' [-Werror=missing-prototypes]
     212 | int sss_deinit_adapter(struct sss_pci_adapter *adapter)
         |     ^~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/3snic/sssnic/nic/../hw/sss_pci_remove.c:238:6: error: no previous prototype for 'sss_deinit_pci_dev' [-Werror=missing-prototypes]
     238 | void sss_deinit_pci_dev(struct pci_dev *pdev)
         |      ^~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/3snic/sssnic/nic/../hw/sss_pci_remove.c:250:6: error: no previous prototype for 'sss_pci_remove' [-Werror=missing-prototypes]
     250 | void sss_pci_remove(struct pci_dev *pdev)
         |      ^~~~~~~~~~~~~~
   cc1: all warnings being treated as errors
--
>> drivers/net/ethernet/3snic/sssnic/nic/../hw/sss_pci_shutdown.c:28:6: error: no previous prototype for 'sss_pci_shutdown' [-Werror=missing-prototypes]
      28 | void sss_pci_shutdown(struct pci_dev *pdev)
         |      ^~~~~~~~~~~~~~~~
   cc1: all warnings being treated as errors
--
>> drivers/net/ethernet/3snic/sssnic/nic/../hw/sss_pci_error.c:34:18: error: no previous prototype for 'sss_detect_pci_error' [-Werror=missing-prototypes]
      34 | pci_ers_result_t sss_detect_pci_error(struct pci_dev *pdev,
         |                  ^~~~~~~~~~~~~~~~~~~~
   cc1: all warnings being treated as errors
--
>> drivers/net/ethernet/3snic/sssnic/nic/../hw/sss_pci_global.c:37:6: error: no previous prototype for 'sss_init_uld_lock' [-Werror=missing-prototypes]
      37 | void sss_init_uld_lock(void)
         |      ^~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/3snic/sssnic/nic/../hw/sss_pci_global.c:42:6: error: no previous prototype for 'sss_lock_uld' [-Werror=missing-prototypes]
      42 | void sss_lock_uld(void)
         |      ^~~~~~~~~~~~
>> drivers/net/ethernet/3snic/sssnic/nic/../hw/sss_pci_global.c:47:6: error: no previous prototype for 'sss_unlock_uld' [-Werror=missing-prototypes]
      47 | void sss_unlock_uld(void)
         |      ^~~~~~~~~~~~~~
>> drivers/net/ethernet/3snic/sssnic/nic/../hw/sss_pci_global.c:52:14: error: no previous prototype for 'sss_get_uld_names' [-Werror=missing-prototypes]
      52 | const char **sss_get_uld_names(void)
         |              ^~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/3snic/sssnic/nic/../hw/sss_pci_global.c:57:22: error: no previous prototype for 'sss_get_uld_info' [-Werror=missing-prototypes]
      57 | struct sss_uld_info *sss_get_uld_info(void)
         |                      ^~~~~~~~~~~~~~~~
>> drivers/net/ethernet/3snic/sssnic/nic/../hw/sss_pci_global.c:62:6: error: no previous prototype for 'sss_attach_is_enable' [-Werror=missing-prototypes]
      62 | bool sss_attach_is_enable(void)
         |      ^~~~~~~~~~~~~~~~~~~~
   cc1: all warnings being treated as errors
--
   drivers/net/ethernet/3snic/sssnic/nic/../hw/sss_hwdev_init.c: In function 'sss_heartbeat_lost_handler':
>> drivers/net/ethernet/3snic/sssnic/nic/../hw/sss_hwdev_init.c:185:13: error: variable 'pcie_src' set but not used [-Werror=unused-but-set-variable]
     185 |         u16 pcie_src;
         |             ^~~~~~~~
>> drivers/net/ethernet/3snic/sssnic/nic/../hw/sss_hwdev_init.c:184:13: error: variable 'fault_level' set but not used [-Werror=unused-but-set-variable]
     184 |         u16 fault_level;
         |             ^~~~~~~~~~~
   drivers/net/ethernet/3snic/sssnic/nic/../hw/sss_hwdev_init.c: At top level:
>> drivers/net/ethernet/3snic/sssnic/nic/../hw/sss_hwdev_init.c:384:5: error: no previous prototype for 'sss_init_hwdev' [-Werror=missing-prototypes]
     384 | int sss_init_hwdev(struct sss_pci_adapter *adapter)
         |     ^~~~~~~~~~~~~~
>> drivers/net/ethernet/3snic/sssnic/nic/../hw/sss_hwdev_init.c:487:6: error: no previous prototype for 'sss_deinit_hwdev' [-Werror=missing-prototypes]
     487 | void sss_deinit_hwdev(void *hwdev)
         |      ^~~~~~~~~~~~~~~~
>> drivers/net/ethernet/3snic/sssnic/nic/../hw/sss_hwdev_init.c:518:6: error: no previous prototype for 'sss_hwdev_stop' [-Werror=missing-prototypes]
     518 | void sss_hwdev_stop(void *hwdev)
         |      ^~~~~~~~~~~~~~
>> drivers/net/ethernet/3snic/sssnic/nic/../hw/sss_hwdev_init.c:531:6: error: no previous prototype for 'sss_hwdev_detach' [-Werror=missing-prototypes]
     531 | void sss_hwdev_detach(void *hwdev)
         |      ^~~~~~~~~~~~~~~~
>> drivers/net/ethernet/3snic/sssnic/nic/../hw/sss_hwdev_init.c:539:6: error: no previous prototype for 'sss_hwdev_shutdown' [-Werror=missing-prototypes]
     539 | void sss_hwdev_shutdown(void *hwdev)
         |      ^~~~~~~~~~~~~~~~~~
   cc1: all warnings being treated as errors
--
>> drivers/net/ethernet/3snic/sssnic/nic/../hw/sss_hwdev_mgmt_info.c:54:5: error: no previous prototype for 'sss_init_mgmt_info' [-Werror=missing-prototypes]
      54 | int sss_init_mgmt_info(struct sss_hwdev *hwdev)
         |     ^~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/3snic/sssnic/nic/../hw/sss_hwdev_mgmt_info.c:90:6: error: no previous prototype for 'sss_deinit_mgmt_info' [-Werror=missing-prototypes]
      90 | void sss_deinit_mgmt_info(struct sss_hwdev *hwdev)
         |      ^~~~~~~~~~~~~~~~~~~~
   cc1: all warnings being treated as errors
--
>> drivers/net/ethernet/3snic/sssnic/nic/../hw/sss_hwdev_io_flush.c:91:5: error: no previous prototype for 'sss_hwdev_flush_io' [-Werror=missing-prototypes]
      91 | int sss_hwdev_flush_io(struct sss_hwdev *hwdev, u16 channel)
         |     ^~~~~~~~~~~~~~~~~~
   cc1: all warnings being treated as errors
--
>> drivers/net/ethernet/3snic/sssnic/nic/../hw/sss_hwif_ctrlq_init.c:278:5: error: no previous prototype for 'sss_reinit_ctrlq_ctx' [-Werror=missing-prototypes]
     278 | int sss_reinit_ctrlq_ctx(struct sss_hwdev *hwdev)
         |     ^~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/3snic/sssnic/nic/../hw/sss_hwif_ctrlq_init.c:368:6: error: no previous prototype for 'sss_deinit_ctrlq' [-Werror=missing-prototypes]
     368 | void sss_deinit_ctrlq(struct sss_hwdev *hwdev)
         |      ^~~~~~~~~~~~~~~~
>> drivers/net/ethernet/3snic/sssnic/nic/../hw/sss_hwif_ctrlq_init.c:502:5: error: no previous prototype for 'sss_init_ctrlq_channel' [-Werror=missing-prototypes]
     502 | int sss_init_ctrlq_channel(struct sss_hwdev *hwdev)
         |     ^~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/3snic/sssnic/nic/../hw/sss_hwif_ctrlq_init.c:539:6: error: no previous prototype for 'sss_deinit_ctrlq_channel' [-Werror=missing-prototypes]
     539 | void sss_deinit_ctrlq_channel(struct sss_hwdev *hwdev)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/3snic/sssnic/nic/../hw/sss_hwif_ctrlq_init.c:548:6: error: no previous prototype for 'sss_ctrlq_flush_sync_cmd' [-Werror=missing-prototypes]
     548 | void sss_ctrlq_flush_sync_cmd(struct sss_hwdev *hwdev)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/3snic/sssnic/nic/../hw/sss_hwif_ctrlq_init.c:574:5: error: no previous prototype for 'sss_wait_ctrlq_stop' [-Werror=missing-prototypes]
     574 | int sss_wait_ctrlq_stop(struct sss_hwdev *hwdev)
         |     ^~~~~~~~~~~~~~~~~~~
   cc1: all warnings being treated as errors
--
>> drivers/net/ethernet/3snic/sssnic/nic/../hw/sss_hwif_mbx_init.c:252:5: error: no previous prototype for 'sss_init_func_mbx_msg' [-Werror=missing-prototypes]
     252 | int sss_init_func_mbx_msg(void *hwdev, u16 func_num)
         |     ^~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/3snic/sssnic/nic/../hw/sss_hwif_mbx_init.c:401:5: error: no previous prototype for 'sss_hwif_init_mbx' [-Werror=missing-prototypes]
     401 | int sss_hwif_init_mbx(struct sss_hwdev *hwdev)
         |     ^~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/3snic/sssnic/nic/../hw/sss_hwif_mbx_init.c:449:6: error: no previous prototype for 'sss_hwif_deinit_mbx' [-Werror=missing-prototypes]
     449 | void sss_hwif_deinit_mbx(struct sss_hwdev *hwdev)
         |      ^~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/3snic/sssnic/nic/../hw/sss_hwif_mbx_init.c:872:6: error: no previous prototype for 'sss_recv_mbx_aeq_handler' [-Werror=missing-prototypes]
     872 | void sss_recv_mbx_aeq_handler(void *handle, u8 *header, u8 size)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~
   cc1: all warnings being treated as errors
--
>> drivers/net/ethernet/3snic/sssnic/nic/../hw/sss_hwif_adm.c:544:5: error: no previous prototype for 'sss_adm_msg_write' [-Werror=missing-prototypes]
     544 | int sss_adm_msg_write(struct sss_adm_msg *adm_msg, u8 node_id,
         |     ^~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/3snic/sssnic/nic/../hw/sss_hwif_adm.c:550:5: error: no previous prototype for 'sss_adm_msg_read' [-Werror=missing-prototypes]
     550 | int sss_adm_msg_read(struct sss_adm_msg *adm_msg, u8 node_id,
         |     ^~~~~~~~~~~~~~~~
>> drivers/net/ethernet/3snic/sssnic/nic/../hw/sss_hwif_adm.c:596:5: error: no previous prototype for 'sss_adm_msg_read_ack' [-Werror=missing-prototypes]
     596 | int sss_adm_msg_read_ack(void *hwdev, u8 dest, const void *cmd,
         |     ^~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/3snic/sssnic/nic/../hw/sss_hwif_adm.c:617:5: error: no previous prototype for 'sss_adm_msg_write_nack' [-Werror=missing-prototypes]
     617 | int sss_adm_msg_write_nack(void *hwdev, u8 dest, const void *cmd, u16 size)
         |     ^~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/3snic/sssnic/nic/../hw/sss_hwif_adm.c:681:5: error: no previous prototype for 'sss_sync_send_adm_msg' [-Werror=missing-prototypes]
     681 | int sss_sync_send_adm_msg(void *hwdev, u8 mod, u16 cmd, void *buf_in,
         |     ^~~~~~~~~~~~~~~~~~~~~
   cc1: all warnings being treated as errors
..

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for ACPI_HOTPLUG_IGNORE_OSC
   Depends on [n]: ACPI [=y] && ACPI_HOTPLUG_PRESENT_CPU [=n]
   Selected by [y]:
   - X86 [=y] && ACPI [=y] && HOTPLUG_CPU [=y]


vim +/sss_pci_probe +549 drivers/net/ethernet/3snic/sssnic/nic/../hw/sss_pci_probe.c

6864d14bb90f03a weiwei1 2024-04-09  548  
6864d14bb90f03a weiwei1 2024-04-09 @549  int sss_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)

:::::: The code at line 549 was first introduced by commit
:::::: 6864d14bb90f03a1e5b7fbcc04fc2ba4d692bd3e support 3SNIC 910/920/930 NIC

:::::: TO: weiwei1 <weiwei1@ramaxel.com>
:::::: CC: weiwei1 <weiwei1@ramaxel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
