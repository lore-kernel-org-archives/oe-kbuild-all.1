Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03D8A3346BC
	for <oe-kbuild-all@lists.linux.dev>; Thu, 16 Oct 2025 20:43:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760647408; cv=none; b=quiicyAeXtgyCWBHFmba3sugq8EHF5GiuyXUQrUw4/OrM37ZV/zN9gmB+bU5AWhGNxtaKnI2gHp3bZEkshNyYBeTqEA3345JsbtXzsFh8cBwqMIcnufKvSnQ1f9lSD2GKn58Duh+lxgHwKx/tBh1N82IDvgmQRwdgwbUh6JTgg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760647408; c=relaxed/simple;
	bh=7OEXAbPPofo5QMgO6hx1rTSGSBtttUj/iC/zqgzHq0A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IaJIY2Ba5yfWqG6i+NF4T+x11YRxFCnOMDCpOA3NZa0UtnMA8j+8kKIIoHuSX/JmavRyi8piEEiH2JtqBvLpMHc/EGYl3Vr6T90NYOYoPiN5YdyVISCG45AWlYb4X0pw/fZfx2b5eRpLqDO71zo6o/9LS1cyoSuYiO77ExI51q4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LSeRzroK; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LSeRzroK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760647406; x=1792183406;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7OEXAbPPofo5QMgO6hx1rTSGSBtttUj/iC/zqgzHq0A=;
  b=LSeRzroKS+BF30vCX8udRjZAMWgyfDxxx7lIq7053FRJYODjq7t7TU55
   n4CXT9W9elsdPjGgE+7psKPqm/j3qsUoy0yZqPEqTc26r8sHFwdJZ5KJU
   FGsWiDGgMowunz8QNtHK98pWy9/p9TeZ3Re+KuMQpACp98momjkqQngr9
   vqwwvRrBsZrvBYwJe1+aLsefbco4Y4brHxOU1giG/ywx2xei//ugztRCr
   5FrfD4l6U2DA/HD4KesLPYO1bSBQFl+EAxXccZlmXPyTM0PxmiE8Q+wry
   0v+apJ1XTrj7RzKG4A58Xtm6ZNwuphp63wQfh6me5ALznPfObRBNo/Ycw
   g==;
X-CSE-ConnectionGUID: btFjfbt5QcOH4WKJKuUHVQ==
X-CSE-MsgGUID: SnYK05t2QVmA9HGGG/gDJA==
X-IronPort-AV: E=McAfee;i="6800,10657,11584"; a="62902173"
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; 
   d="scan'208";a="62902173"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2025 13:43:26 -0700
X-CSE-ConnectionGUID: ANkePw1wRV2Lds0m6+zjFw==
X-CSE-MsgGUID: pp7JqTfORPakSeyQjiYq0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; 
   d="scan'208";a="219711673"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 16 Oct 2025 13:43:24 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v9Uok-0005EJ-10;
	Thu, 16 Oct 2025 20:43:22 +0000
Date: Fri, 17 Oct 2025 04:42:08 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:intel-5.10-CWF-EDAC-ANBZ25520 15/15]
 drivers/net/ethernet/3snic/sssnic/hw/sss_pci_probe.c:534:5: error: no
 previous prototype for 'sss_pci_probe'
Message-ID: <202510170408.d3FKWhBZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Steven,

FYI, the error/warning still remains.

tree:   https://gitee.com/anolis/intel-cloud-kernel.git intel-5.10-CWF-EDAC-ANBZ25520
head:   31f4ee37032251af8f106ffe418b8235f5e08468
commit: 3f63e55de387ff1ef9405747ecd67ea49dd18ed9 [15/15] Net: ethernet: Support 3snic 3s9xx network card
config: x86_64-anolis-intel-cloud-devel-5.10 (https://download.01.org/0day-ci/archive/20251017/202510170408.d3FKWhBZ-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251017/202510170408.d3FKWhBZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510170408.d3FKWhBZ-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/net/ethernet/3snic/sssnic/hw/sss_pci_probe.c:275:5: error: no previous prototype for 'sss_attach_uld_driver' [-Werror=missing-prototypes]
     275 | int sss_attach_uld_driver(struct sss_pci_adapter *adapter,
         |     ^~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/3snic/sssnic/hw/sss_pci_probe.c:534:5: error: no previous prototype for 'sss_pci_probe' [-Werror=missing-prototypes]
     534 | int sss_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
         |     ^~~~~~~~~~~~~
   cc1: all warnings being treated as errors
--
>> drivers/net/ethernet/3snic/sssnic/hw/sss_pci_remove.c:89:6: error: no previous prototype for 'sss_detach_uld_driver' [-Werror=missing-prototypes]
      89 | void sss_detach_uld_driver(struct sss_pci_adapter *adapter,
         |      ^~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/3snic/sssnic/hw/sss_pci_remove.c:119:6: error: no previous prototype for 'sss_detach_all_uld_driver' [-Werror=missing-prototypes]
     119 | void sss_detach_all_uld_driver(struct sss_pci_adapter *adapter)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/3snic/sssnic/hw/sss_pci_remove.c:137:6: error: no previous prototype for 'sss_dettach_uld_dev' [-Werror=missing-prototypes]
     137 | void sss_dettach_uld_dev(struct sss_pci_adapter *adapter)
         |      ^~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/3snic/sssnic/hw/sss_pci_remove.c:178:6: error: no previous prototype for 'sss_deinit_function' [-Werror=missing-prototypes]
     178 | void sss_deinit_function(struct pci_dev *pdev)
         |      ^~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/3snic/sssnic/hw/sss_pci_remove.c:195:6: error: no previous prototype for 'sss_unmap_pci_bar' [-Werror=missing-prototypes]
     195 | void sss_unmap_pci_bar(struct sss_pci_adapter *adapter)
         |      ^~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/3snic/sssnic/hw/sss_pci_remove.c:206:5: error: no previous prototype for 'sss_deinit_adapter' [-Werror=missing-prototypes]
     206 | int sss_deinit_adapter(struct sss_pci_adapter *adapter)
         |     ^~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/3snic/sssnic/hw/sss_pci_remove.c:232:6: error: no previous prototype for 'sss_deinit_pci_dev' [-Werror=missing-prototypes]
     232 | void sss_deinit_pci_dev(struct pci_dev *pdev)
         |      ^~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/3snic/sssnic/hw/sss_pci_remove.c:244:6: error: no previous prototype for 'sss_pci_remove' [-Werror=missing-prototypes]
     244 | void sss_pci_remove(struct pci_dev *pdev)
         |      ^~~~~~~~~~~~~~
   cc1: all warnings being treated as errors
--
>> drivers/net/ethernet/3snic/sssnic/hw/sss_pci_shutdown.c:28:6: error: no previous prototype for 'sss_pci_shutdown' [-Werror=missing-prototypes]
      28 | void sss_pci_shutdown(struct pci_dev *pdev)
         |      ^~~~~~~~~~~~~~~~
   cc1: all warnings being treated as errors
--
>> drivers/net/ethernet/3snic/sssnic/hw/sss_pci_error.c:34:18: error: no previous prototype for 'sss_detect_pci_error' [-Werror=missing-prototypes]
      34 | pci_ers_result_t sss_detect_pci_error(struct pci_dev *pdev,
         |                  ^~~~~~~~~~~~~~~~~~~~
   cc1: all warnings being treated as errors
--
>> drivers/net/ethernet/3snic/sssnic/hw/sss_pci_global.c:37:6: error: no previous prototype for 'sss_init_uld_lock' [-Werror=missing-prototypes]
      37 | void sss_init_uld_lock(void)
         |      ^~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/3snic/sssnic/hw/sss_pci_global.c:42:6: error: no previous prototype for 'sss_lock_uld' [-Werror=missing-prototypes]
      42 | void sss_lock_uld(void)
         |      ^~~~~~~~~~~~
>> drivers/net/ethernet/3snic/sssnic/hw/sss_pci_global.c:47:6: error: no previous prototype for 'sss_unlock_uld' [-Werror=missing-prototypes]
      47 | void sss_unlock_uld(void)
         |      ^~~~~~~~~~~~~~
>> drivers/net/ethernet/3snic/sssnic/hw/sss_pci_global.c:52:14: error: no previous prototype for 'sss_get_uld_names' [-Werror=missing-prototypes]
      52 | const char **sss_get_uld_names(void)
         |              ^~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/3snic/sssnic/hw/sss_pci_global.c:57:22: error: no previous prototype for 'sss_get_uld_info' [-Werror=missing-prototypes]
      57 | struct sss_uld_info *sss_get_uld_info(void)
         |                      ^~~~~~~~~~~~~~~~
>> drivers/net/ethernet/3snic/sssnic/hw/sss_pci_global.c:62:6: error: no previous prototype for 'sss_attach_is_enable' [-Werror=missing-prototypes]
      62 | bool sss_attach_is_enable(void)
         |      ^~~~~~~~~~~~~~~~~~~~
   cc1: all warnings being treated as errors
--
   drivers/net/ethernet/3snic/sssnic/hw/sss_hwdev_init.c: In function 'sss_heartbeat_lost_handler':
>> drivers/net/ethernet/3snic/sssnic/hw/sss_hwdev_init.c:185:13: error: variable 'pcie_src' set but not used [-Werror=unused-but-set-variable]
     185 |         u16 pcie_src;
         |             ^~~~~~~~
>> drivers/net/ethernet/3snic/sssnic/hw/sss_hwdev_init.c:184:13: error: variable 'fault_level' set but not used [-Werror=unused-but-set-variable]
     184 |         u16 fault_level;
         |             ^~~~~~~~~~~
   drivers/net/ethernet/3snic/sssnic/hw/sss_hwdev_init.c: At top level:
>> drivers/net/ethernet/3snic/sssnic/hw/sss_hwdev_init.c:384:5: error: no previous prototype for 'sss_init_hwdev' [-Werror=missing-prototypes]
     384 | int sss_init_hwdev(struct sss_pci_adapter *adapter)
         |     ^~~~~~~~~~~~~~
>> drivers/net/ethernet/3snic/sssnic/hw/sss_hwdev_init.c:487:6: error: no previous prototype for 'sss_deinit_hwdev' [-Werror=missing-prototypes]
     487 | void sss_deinit_hwdev(void *hwdev)
         |      ^~~~~~~~~~~~~~~~
>> drivers/net/ethernet/3snic/sssnic/hw/sss_hwdev_init.c:518:6: error: no previous prototype for 'sss_hwdev_stop' [-Werror=missing-prototypes]
     518 | void sss_hwdev_stop(void *hwdev)
         |      ^~~~~~~~~~~~~~
>> drivers/net/ethernet/3snic/sssnic/hw/sss_hwdev_init.c:531:6: error: no previous prototype for 'sss_hwdev_detach' [-Werror=missing-prototypes]
     531 | void sss_hwdev_detach(void *hwdev)
         |      ^~~~~~~~~~~~~~~~
>> drivers/net/ethernet/3snic/sssnic/hw/sss_hwdev_init.c:539:6: error: no previous prototype for 'sss_hwdev_shutdown' [-Werror=missing-prototypes]
     539 | void sss_hwdev_shutdown(void *hwdev)
         |      ^~~~~~~~~~~~~~~~~~
   cc1: all warnings being treated as errors
--
>> drivers/net/ethernet/3snic/sssnic/hw/sss_hwdev_mgmt_info.c:54:5: error: no previous prototype for 'sss_init_mgmt_info' [-Werror=missing-prototypes]
      54 | int sss_init_mgmt_info(struct sss_hwdev *hwdev)
         |     ^~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/3snic/sssnic/hw/sss_hwdev_mgmt_info.c:90:6: error: no previous prototype for 'sss_deinit_mgmt_info' [-Werror=missing-prototypes]
      90 | void sss_deinit_mgmt_info(struct sss_hwdev *hwdev)
         |      ^~~~~~~~~~~~~~~~~~~~
   cc1: all warnings being treated as errors
--
>> drivers/net/ethernet/3snic/sssnic/hw/sss_hwdev_io_flush.c:91:5: error: no previous prototype for 'sss_hwdev_flush_io' [-Werror=missing-prototypes]
      91 | int sss_hwdev_flush_io(struct sss_hwdev *hwdev, u16 channel)
         |     ^~~~~~~~~~~~~~~~~~
   cc1: all warnings being treated as errors
--
>> drivers/net/ethernet/3snic/sssnic/hw/sss_hwif_ctrlq_init.c:277:5: error: no previous prototype for 'sss_reinit_ctrlq_ctx' [-Werror=missing-prototypes]
     277 | int sss_reinit_ctrlq_ctx(struct sss_hwdev *hwdev)
         |     ^~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/3snic/sssnic/hw/sss_hwif_ctrlq_init.c:367:6: error: no previous prototype for 'sss_deinit_ctrlq' [-Werror=missing-prototypes]
     367 | void sss_deinit_ctrlq(struct sss_hwdev *hwdev)
         |      ^~~~~~~~~~~~~~~~
>> drivers/net/ethernet/3snic/sssnic/hw/sss_hwif_ctrlq_init.c:501:5: error: no previous prototype for 'sss_init_ctrlq_channel' [-Werror=missing-prototypes]
     501 | int sss_init_ctrlq_channel(struct sss_hwdev *hwdev)
         |     ^~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/3snic/sssnic/hw/sss_hwif_ctrlq_init.c:538:6: error: no previous prototype for 'sss_deinit_ctrlq_channel' [-Werror=missing-prototypes]
     538 | void sss_deinit_ctrlq_channel(struct sss_hwdev *hwdev)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/3snic/sssnic/hw/sss_hwif_ctrlq_init.c:547:6: error: no previous prototype for 'sss_ctrlq_flush_sync_cmd' [-Werror=missing-prototypes]
     547 | void sss_ctrlq_flush_sync_cmd(struct sss_hwdev *hwdev)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/3snic/sssnic/hw/sss_hwif_ctrlq_init.c:573:5: error: no previous prototype for 'sss_wait_ctrlq_stop' [-Werror=missing-prototypes]
     573 | int sss_wait_ctrlq_stop(struct sss_hwdev *hwdev)
         |     ^~~~~~~~~~~~~~~~~~~
   cc1: all warnings being treated as errors
--
>> drivers/net/ethernet/3snic/sssnic/hw/sss_hwif_mbx_init.c:253:5: error: no previous prototype for 'sss_init_func_mbx_msg' [-Werror=missing-prototypes]
     253 | int sss_init_func_mbx_msg(void *hwdev, u16 func_num)
         |     ^~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/3snic/sssnic/hw/sss_hwif_mbx_init.c:402:5: error: no previous prototype for 'sss_hwif_init_mbx' [-Werror=missing-prototypes]
     402 | int sss_hwif_init_mbx(struct sss_hwdev *hwdev)
         |     ^~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/3snic/sssnic/hw/sss_hwif_mbx_init.c:450:6: error: no previous prototype for 'sss_hwif_deinit_mbx' [-Werror=missing-prototypes]
     450 | void sss_hwif_deinit_mbx(struct sss_hwdev *hwdev)
         |      ^~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/3snic/sssnic/hw/sss_hwif_mbx_init.c:871:6: error: no previous prototype for 'sss_recv_mbx_aeq_handler' [-Werror=missing-prototypes]
     871 | void sss_recv_mbx_aeq_handler(void *handle, u8 *header, u8 size)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~
   cc1: all warnings being treated as errors
--
>> drivers/net/ethernet/3snic/sssnic/hw/sss_hwif_adm.c:506:5: error: no previous prototype for 'sss_sync_send_adm_msg' [-Werror=missing-prototypes]
     506 | int sss_sync_send_adm_msg(void *hwdev, u8 mod, u16 cmd, void *buf_in,
         |     ^~~~~~~~~~~~~~~~~~~~~
   cc1: all warnings being treated as errors
..


vim +/sss_pci_probe +534 drivers/net/ethernet/3snic/sssnic/hw/sss_pci_probe.c

   533	
 > 534	int sss_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
