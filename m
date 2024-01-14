Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 812C92100
	for <oe-kbuild-all@lists.linux.dev>; Sun, 14 Jan 2024 13:41:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SFZtOuvp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705239696; x=1736775696;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=O/8lSiMZey0ehfW7QlZp56Sn362q9RpCuNYQufXxbCQ=;
  b=SFZtOuvpBg0Es9nl+iehz2nIyLxuH1GIWHVNNeHUErKpcJg2GH70ybXj
   VJNzFBoflfos3Jci1o/Biz3AnMLcOjIBXYEcSX+jsRAoJBJkLJuq+KAxq
   Q1A2NeyUurq0/D0SGfT2cEkzRP2BrT508xzvTIqpkqr26Z8eFk2KehMZs
   GY84KyW/so17KAP68agRZ1sNMWn6puzeuT7a0grdMEF5j+nPYX9ipduRd
   Nr20PFzlPj1AiZPeGUCn89ARfzp8C8nWwvEJQWA7jVBfL8MS8a2AnSNSW
   AkMBobce10O6UW1efhO0mreisWgOZ/TlyS5mmhxPmcG8TuRAxCrNhb2Ns
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10952"; a="463745242"
X-IronPort-AV: E=Sophos;i="6.04,194,1695711600"; 
   d="scan'208";a="463745242"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2024 05:41:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10952"; a="733060172"
X-IronPort-AV: E=Sophos;i="6.04,194,1695711600"; 
   d="scan'208";a="733060172"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 14 Jan 2024 05:41:34 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rP0k0-000BXk-0s;
	Sun, 14 Jan 2024 13:41:32 +0000
Date: Sun, 14 Jan 2024 21:41:03 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 21121/21544]
 drivers/net/ethernet/3snic/sssnic/hw/sss_pci_probe.c:548:5: error: no
 previous prototype for function 'sss_pci_probe'
Message-ID: <202401142144.b4BMA0S4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   1f0983450549eeea71fb9333517330947a779262
commit: a6a7981cbf66d4951425d33cdce6ef39206eba83 [21121/21544] Net: ethernet: Support 3snic 3s9xx network card
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20240114/202401142144.b4BMA0S4-lkp@intel.com/config)
compiler: ClangBuiltLinux clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240114/202401142144.b4BMA0S4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401142144.b4BMA0S4-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/net/ethernet/3snic/sssnic/hw/sss_pci_probe.c:276:5: error: no previous prototype for function 'sss_attach_uld_driver' [-Werror,-Wmissing-prototypes]
     276 | int sss_attach_uld_driver(struct sss_pci_adapter *adapter,
         |     ^
   drivers/net/ethernet/3snic/sssnic/hw/sss_pci_probe.c:276:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     276 | int sss_attach_uld_driver(struct sss_pci_adapter *adapter,
         | ^
         | static 
>> drivers/net/ethernet/3snic/sssnic/hw/sss_pci_probe.c:548:5: error: no previous prototype for function 'sss_pci_probe' [-Werror,-Wmissing-prototypes]
     548 | int sss_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
         |     ^
   drivers/net/ethernet/3snic/sssnic/hw/sss_pci_probe.c:548:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     548 | int sss_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
         | ^
         | static 
   2 errors generated.
--
>> drivers/net/ethernet/3snic/sssnic/hw/sss_pci_remove.c:90:6: error: no previous prototype for function 'sss_detach_uld_driver' [-Werror,-Wmissing-prototypes]
      90 | void sss_detach_uld_driver(struct sss_pci_adapter *adapter,
         |      ^
   drivers/net/ethernet/3snic/sssnic/hw/sss_pci_remove.c:90:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      90 | void sss_detach_uld_driver(struct sss_pci_adapter *adapter,
         | ^
         | static 
>> drivers/net/ethernet/3snic/sssnic/hw/sss_pci_remove.c:120:6: error: no previous prototype for function 'sss_detach_all_uld_driver' [-Werror,-Wmissing-prototypes]
     120 | void sss_detach_all_uld_driver(struct sss_pci_adapter *adapter)
         |      ^
   drivers/net/ethernet/3snic/sssnic/hw/sss_pci_remove.c:120:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     120 | void sss_detach_all_uld_driver(struct sss_pci_adapter *adapter)
         | ^
         | static 
>> drivers/net/ethernet/3snic/sssnic/hw/sss_pci_remove.c:138:6: error: no previous prototype for function 'sss_dettach_uld_dev' [-Werror,-Wmissing-prototypes]
     138 | void sss_dettach_uld_dev(struct sss_pci_adapter *adapter)
         |      ^
   drivers/net/ethernet/3snic/sssnic/hw/sss_pci_remove.c:138:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     138 | void sss_dettach_uld_dev(struct sss_pci_adapter *adapter)
         | ^
         | static 
>> drivers/net/ethernet/3snic/sssnic/hw/sss_pci_remove.c:179:6: error: no previous prototype for function 'sss_deinit_function' [-Werror,-Wmissing-prototypes]
     179 | void sss_deinit_function(struct pci_dev *pdev)
         |      ^
   drivers/net/ethernet/3snic/sssnic/hw/sss_pci_remove.c:179:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     179 | void sss_deinit_function(struct pci_dev *pdev)
         | ^
         | static 
>> drivers/net/ethernet/3snic/sssnic/hw/sss_pci_remove.c:200:6: error: no previous prototype for function 'sss_unmap_pci_bar' [-Werror,-Wmissing-prototypes]
     200 | void sss_unmap_pci_bar(struct sss_pci_adapter *adapter)
         |      ^
   drivers/net/ethernet/3snic/sssnic/hw/sss_pci_remove.c:200:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     200 | void sss_unmap_pci_bar(struct sss_pci_adapter *adapter)
         | ^
         | static 
>> drivers/net/ethernet/3snic/sssnic/hw/sss_pci_remove.c:211:5: error: no previous prototype for function 'sss_deinit_adapter' [-Werror,-Wmissing-prototypes]
     211 | int sss_deinit_adapter(struct sss_pci_adapter *adapter)
         |     ^
   drivers/net/ethernet/3snic/sssnic/hw/sss_pci_remove.c:211:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     211 | int sss_deinit_adapter(struct sss_pci_adapter *adapter)
         | ^
         | static 
>> drivers/net/ethernet/3snic/sssnic/hw/sss_pci_remove.c:237:6: error: no previous prototype for function 'sss_deinit_pci_dev' [-Werror,-Wmissing-prototypes]
     237 | void sss_deinit_pci_dev(struct pci_dev *pdev)
         |      ^
   drivers/net/ethernet/3snic/sssnic/hw/sss_pci_remove.c:237:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     237 | void sss_deinit_pci_dev(struct pci_dev *pdev)
         | ^
         | static 
>> drivers/net/ethernet/3snic/sssnic/hw/sss_pci_remove.c:249:6: error: no previous prototype for function 'sss_pci_remove' [-Werror,-Wmissing-prototypes]
     249 | void sss_pci_remove(struct pci_dev *pdev)
         |      ^
   drivers/net/ethernet/3snic/sssnic/hw/sss_pci_remove.c:249:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     249 | void sss_pci_remove(struct pci_dev *pdev)
         | ^
         | static 
   8 errors generated.
--
>> drivers/net/ethernet/3snic/sssnic/hw/sss_pci_shutdown.c:28:6: error: no previous prototype for function 'sss_pci_shutdown' [-Werror,-Wmissing-prototypes]
      28 | void sss_pci_shutdown(struct pci_dev *pdev)
         |      ^
   drivers/net/ethernet/3snic/sssnic/hw/sss_pci_shutdown.c:28:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      28 | void sss_pci_shutdown(struct pci_dev *pdev)
         | ^
         | static 
   1 error generated.
--
>> drivers/net/ethernet/3snic/sssnic/hw/sss_pci_error.c:34:18: error: no previous prototype for function 'sss_detect_pci_error' [-Werror,-Wmissing-prototypes]
      34 | pci_ers_result_t sss_detect_pci_error(struct pci_dev *pdev,
         |                  ^
   drivers/net/ethernet/3snic/sssnic/hw/sss_pci_error.c:34:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      34 | pci_ers_result_t sss_detect_pci_error(struct pci_dev *pdev,
         | ^
         | static 
   1 error generated.
--
>> drivers/net/ethernet/3snic/sssnic/hw/sss_pci_global.c:37:6: error: no previous prototype for function 'sss_init_uld_lock' [-Werror,-Wmissing-prototypes]
      37 | void sss_init_uld_lock(void)
         |      ^
   drivers/net/ethernet/3snic/sssnic/hw/sss_pci_global.c:37:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      37 | void sss_init_uld_lock(void)
         | ^
         | static 
>> drivers/net/ethernet/3snic/sssnic/hw/sss_pci_global.c:42:6: error: no previous prototype for function 'sss_lock_uld' [-Werror,-Wmissing-prototypes]
      42 | void sss_lock_uld(void)
         |      ^
   drivers/net/ethernet/3snic/sssnic/hw/sss_pci_global.c:42:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      42 | void sss_lock_uld(void)
         | ^
         | static 
>> drivers/net/ethernet/3snic/sssnic/hw/sss_pci_global.c:47:6: error: no previous prototype for function 'sss_unlock_uld' [-Werror,-Wmissing-prototypes]
      47 | void sss_unlock_uld(void)
         |      ^
   drivers/net/ethernet/3snic/sssnic/hw/sss_pci_global.c:47:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      47 | void sss_unlock_uld(void)
         | ^
         | static 
>> drivers/net/ethernet/3snic/sssnic/hw/sss_pci_global.c:52:14: error: no previous prototype for function 'sss_get_uld_names' [-Werror,-Wmissing-prototypes]
      52 | const char **sss_get_uld_names(void)
         |              ^
   drivers/net/ethernet/3snic/sssnic/hw/sss_pci_global.c:52:7: note: declare 'static' if the function is not intended to be used outside of this translation unit
      52 | const char **sss_get_uld_names(void)
         |       ^
         |       static 
>> drivers/net/ethernet/3snic/sssnic/hw/sss_pci_global.c:57:22: error: no previous prototype for function 'sss_get_uld_info' [-Werror,-Wmissing-prototypes]
      57 | struct sss_uld_info *sss_get_uld_info(void)
         |                      ^
   drivers/net/ethernet/3snic/sssnic/hw/sss_pci_global.c:57:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      57 | struct sss_uld_info *sss_get_uld_info(void)
         | ^
         | static 
>> drivers/net/ethernet/3snic/sssnic/hw/sss_pci_global.c:62:6: error: no previous prototype for function 'sss_attach_is_enable' [-Werror,-Wmissing-prototypes]
      62 | bool sss_attach_is_enable(void)
         |      ^
   drivers/net/ethernet/3snic/sssnic/hw/sss_pci_global.c:62:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      62 | bool sss_attach_is_enable(void)
         | ^
         | static 
   6 errors generated.
--
>> drivers/net/ethernet/3snic/sssnic/hw/sss_hwdev_init.c:184:6: error: variable 'fault_level' set but not used [-Werror,-Wunused-but-set-variable]
     184 |         u16 fault_level;
         |             ^
>> drivers/net/ethernet/3snic/sssnic/hw/sss_hwdev_init.c:185:6: error: variable 'pcie_src' set but not used [-Werror,-Wunused-but-set-variable]
     185 |         u16 pcie_src;
         |             ^
>> drivers/net/ethernet/3snic/sssnic/hw/sss_hwdev_init.c:384:5: error: no previous prototype for function 'sss_init_hwdev' [-Werror,-Wmissing-prototypes]
     384 | int sss_init_hwdev(struct sss_pci_adapter *adapter)
         |     ^
   drivers/net/ethernet/3snic/sssnic/hw/sss_hwdev_init.c:384:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     384 | int sss_init_hwdev(struct sss_pci_adapter *adapter)
         | ^
         | static 
>> drivers/net/ethernet/3snic/sssnic/hw/sss_hwdev_init.c:487:6: error: no previous prototype for function 'sss_deinit_hwdev' [-Werror,-Wmissing-prototypes]
     487 | void sss_deinit_hwdev(void *hwdev)
         |      ^
   drivers/net/ethernet/3snic/sssnic/hw/sss_hwdev_init.c:487:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     487 | void sss_deinit_hwdev(void *hwdev)
         | ^
         | static 
>> drivers/net/ethernet/3snic/sssnic/hw/sss_hwdev_init.c:518:6: error: no previous prototype for function 'sss_hwdev_stop' [-Werror,-Wmissing-prototypes]
     518 | void sss_hwdev_stop(void *hwdev)
         |      ^
   drivers/net/ethernet/3snic/sssnic/hw/sss_hwdev_init.c:518:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     518 | void sss_hwdev_stop(void *hwdev)
         | ^
         | static 
>> drivers/net/ethernet/3snic/sssnic/hw/sss_hwdev_init.c:531:6: error: no previous prototype for function 'sss_hwdev_detach' [-Werror,-Wmissing-prototypes]
     531 | void sss_hwdev_detach(void *hwdev)
         |      ^
   drivers/net/ethernet/3snic/sssnic/hw/sss_hwdev_init.c:531:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     531 | void sss_hwdev_detach(void *hwdev)
         | ^
         | static 
>> drivers/net/ethernet/3snic/sssnic/hw/sss_hwdev_init.c:539:6: error: no previous prototype for function 'sss_hwdev_shutdown' [-Werror,-Wmissing-prototypes]
     539 | void sss_hwdev_shutdown(void *hwdev)
         |      ^
   drivers/net/ethernet/3snic/sssnic/hw/sss_hwdev_init.c:539:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     539 | void sss_hwdev_shutdown(void *hwdev)
         | ^
         | static 
   7 errors generated.
--
>> drivers/net/ethernet/3snic/sssnic/hw/sss_hwdev_mgmt_info.c:54:5: error: no previous prototype for function 'sss_init_mgmt_info' [-Werror,-Wmissing-prototypes]
      54 | int sss_init_mgmt_info(struct sss_hwdev *hwdev)
         |     ^
   drivers/net/ethernet/3snic/sssnic/hw/sss_hwdev_mgmt_info.c:54:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      54 | int sss_init_mgmt_info(struct sss_hwdev *hwdev)
         | ^
         | static 
>> drivers/net/ethernet/3snic/sssnic/hw/sss_hwdev_mgmt_info.c:90:6: error: no previous prototype for function 'sss_deinit_mgmt_info' [-Werror,-Wmissing-prototypes]
      90 | void sss_deinit_mgmt_info(struct sss_hwdev *hwdev)
         |      ^
   drivers/net/ethernet/3snic/sssnic/hw/sss_hwdev_mgmt_info.c:90:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      90 | void sss_deinit_mgmt_info(struct sss_hwdev *hwdev)
         | ^
         | static 
   2 errors generated.
--
>> drivers/net/ethernet/3snic/sssnic/hw/sss_hwdev_io_flush.c:91:5: error: no previous prototype for function 'sss_hwdev_flush_io' [-Werror,-Wmissing-prototypes]
      91 | int sss_hwdev_flush_io(struct sss_hwdev *hwdev, u16 channel)
         |     ^
   drivers/net/ethernet/3snic/sssnic/hw/sss_hwdev_io_flush.c:91:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      91 | int sss_hwdev_flush_io(struct sss_hwdev *hwdev, u16 channel)
         | ^
         | static 
   1 error generated.
--
>> drivers/net/ethernet/3snic/sssnic/hw/sss_hwif_ctrlq_init.c:277:5: error: no previous prototype for function 'sss_reinit_ctrlq_ctx' [-Werror,-Wmissing-prototypes]
     277 | int sss_reinit_ctrlq_ctx(struct sss_hwdev *hwdev)
         |     ^
   drivers/net/ethernet/3snic/sssnic/hw/sss_hwif_ctrlq_init.c:277:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     277 | int sss_reinit_ctrlq_ctx(struct sss_hwdev *hwdev)
         | ^
         | static 
>> drivers/net/ethernet/3snic/sssnic/hw/sss_hwif_ctrlq_init.c:367:6: error: no previous prototype for function 'sss_deinit_ctrlq' [-Werror,-Wmissing-prototypes]
     367 | void sss_deinit_ctrlq(struct sss_hwdev *hwdev)
         |      ^
   drivers/net/ethernet/3snic/sssnic/hw/sss_hwif_ctrlq_init.c:367:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     367 | void sss_deinit_ctrlq(struct sss_hwdev *hwdev)
         | ^
         | static 
>> drivers/net/ethernet/3snic/sssnic/hw/sss_hwif_ctrlq_init.c:501:5: error: no previous prototype for function 'sss_init_ctrlq_channel' [-Werror,-Wmissing-prototypes]
     501 | int sss_init_ctrlq_channel(struct sss_hwdev *hwdev)
         |     ^
   drivers/net/ethernet/3snic/sssnic/hw/sss_hwif_ctrlq_init.c:501:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     501 | int sss_init_ctrlq_channel(struct sss_hwdev *hwdev)
         | ^
         | static 
>> drivers/net/ethernet/3snic/sssnic/hw/sss_hwif_ctrlq_init.c:538:6: error: no previous prototype for function 'sss_deinit_ctrlq_channel' [-Werror,-Wmissing-prototypes]
     538 | void sss_deinit_ctrlq_channel(struct sss_hwdev *hwdev)
         |      ^
   drivers/net/ethernet/3snic/sssnic/hw/sss_hwif_ctrlq_init.c:538:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     538 | void sss_deinit_ctrlq_channel(struct sss_hwdev *hwdev)
         | ^
         | static 
>> drivers/net/ethernet/3snic/sssnic/hw/sss_hwif_ctrlq_init.c:547:6: error: no previous prototype for function 'sss_ctrlq_flush_sync_cmd' [-Werror,-Wmissing-prototypes]
     547 | void sss_ctrlq_flush_sync_cmd(struct sss_hwdev *hwdev)
         |      ^
   drivers/net/ethernet/3snic/sssnic/hw/sss_hwif_ctrlq_init.c:547:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     547 | void sss_ctrlq_flush_sync_cmd(struct sss_hwdev *hwdev)
         | ^
         | static 
>> drivers/net/ethernet/3snic/sssnic/hw/sss_hwif_ctrlq_init.c:573:5: error: no previous prototype for function 'sss_wait_ctrlq_stop' [-Werror,-Wmissing-prototypes]
     573 | int sss_wait_ctrlq_stop(struct sss_hwdev *hwdev)
         |     ^
   drivers/net/ethernet/3snic/sssnic/hw/sss_hwif_ctrlq_init.c:573:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     573 | int sss_wait_ctrlq_stop(struct sss_hwdev *hwdev)
         | ^
         | static 
   6 errors generated.
--
>> drivers/net/ethernet/3snic/sssnic/hw/sss_hwif_mbx_init.c:252:5: error: no previous prototype for function 'sss_init_func_mbx_msg' [-Werror,-Wmissing-prototypes]
     252 | int sss_init_func_mbx_msg(void *hwdev, u16 func_num)
         |     ^
   drivers/net/ethernet/3snic/sssnic/hw/sss_hwif_mbx_init.c:252:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     252 | int sss_init_func_mbx_msg(void *hwdev, u16 func_num)
         | ^
         | static 
>> drivers/net/ethernet/3snic/sssnic/hw/sss_hwif_mbx_init.c:401:5: error: no previous prototype for function 'sss_hwif_init_mbx' [-Werror,-Wmissing-prototypes]
     401 | int sss_hwif_init_mbx(struct sss_hwdev *hwdev)
         |     ^
   drivers/net/ethernet/3snic/sssnic/hw/sss_hwif_mbx_init.c:401:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     401 | int sss_hwif_init_mbx(struct sss_hwdev *hwdev)
         | ^
         | static 
>> drivers/net/ethernet/3snic/sssnic/hw/sss_hwif_mbx_init.c:449:6: error: no previous prototype for function 'sss_hwif_deinit_mbx' [-Werror,-Wmissing-prototypes]
     449 | void sss_hwif_deinit_mbx(struct sss_hwdev *hwdev)
         |      ^
   drivers/net/ethernet/3snic/sssnic/hw/sss_hwif_mbx_init.c:449:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     449 | void sss_hwif_deinit_mbx(struct sss_hwdev *hwdev)
         | ^
         | static 
>> drivers/net/ethernet/3snic/sssnic/hw/sss_hwif_mbx_init.c:872:6: error: no previous prototype for function 'sss_recv_mbx_aeq_handler' [-Werror,-Wmissing-prototypes]
     872 | void sss_recv_mbx_aeq_handler(void *handle, u8 *header, u8 size)
         |      ^
   drivers/net/ethernet/3snic/sssnic/hw/sss_hwif_mbx_init.c:872:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     872 | void sss_recv_mbx_aeq_handler(void *handle, u8 *header, u8 size)
         | ^
         | static 
   4 errors generated.
--
>> drivers/net/ethernet/3snic/sssnic/hw/sss_hwif_adm.c:545:5: error: no previous prototype for function 'sss_adm_msg_write' [-Werror,-Wmissing-prototypes]
     545 | int sss_adm_msg_write(struct sss_adm_msg *adm_msg, u8 node_id,
         |     ^
   drivers/net/ethernet/3snic/sssnic/hw/sss_hwif_adm.c:545:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     545 | int sss_adm_msg_write(struct sss_adm_msg *adm_msg, u8 node_id,
         | ^
         | static 
>> drivers/net/ethernet/3snic/sssnic/hw/sss_hwif_adm.c:551:5: error: no previous prototype for function 'sss_adm_msg_read' [-Werror,-Wmissing-prototypes]
     551 | int sss_adm_msg_read(struct sss_adm_msg *adm_msg, u8 node_id,
         |     ^
   drivers/net/ethernet/3snic/sssnic/hw/sss_hwif_adm.c:551:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     551 | int sss_adm_msg_read(struct sss_adm_msg *adm_msg, u8 node_id,
         | ^
         | static 
>> drivers/net/ethernet/3snic/sssnic/hw/sss_hwif_adm.c:597:5: error: no previous prototype for function 'sss_adm_msg_read_ack' [-Werror,-Wmissing-prototypes]
     597 | int sss_adm_msg_read_ack(void *hwdev, u8 dest, const void *cmd,
         |     ^
   drivers/net/ethernet/3snic/sssnic/hw/sss_hwif_adm.c:597:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     597 | int sss_adm_msg_read_ack(void *hwdev, u8 dest, const void *cmd,
         | ^
         | static 
>> drivers/net/ethernet/3snic/sssnic/hw/sss_hwif_adm.c:618:5: error: no previous prototype for function 'sss_adm_msg_write_nack' [-Werror,-Wmissing-prototypes]
     618 | int sss_adm_msg_write_nack(void *hwdev, u8 dest, const void *cmd, u16 size)
         |     ^
   drivers/net/ethernet/3snic/sssnic/hw/sss_hwif_adm.c:618:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     618 | int sss_adm_msg_write_nack(void *hwdev, u8 dest, const void *cmd, u16 size)
         | ^
         | static 
>> drivers/net/ethernet/3snic/sssnic/hw/sss_hwif_adm.c:682:5: error: no previous prototype for function 'sss_sync_send_adm_msg' [-Werror,-Wmissing-prototypes]
     682 | int sss_sync_send_adm_msg(void *hwdev, u8 mod, u16 cmd, void *buf_in,
         |     ^
   drivers/net/ethernet/3snic/sssnic/hw/sss_hwif_adm.c:682:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     682 | int sss_sync_send_adm_msg(void *hwdev, u8 mod, u16 cmd, void *buf_in,
         | ^
         | static 
   5 errors generated.
..


vim +/sss_pci_probe +548 drivers/net/ethernet/3snic/sssnic/hw/sss_pci_probe.c

   547	
 > 548	int sss_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
