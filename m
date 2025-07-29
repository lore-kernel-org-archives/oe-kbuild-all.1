Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CBAE6BFCE
	for <oe-kbuild-all@lists.linux.dev>; Tue, 29 Jul 2025 12:57:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753793848; cv=none; b=V1dKWBDubJhMCDmF46L6GbFOe5h/0kIjsiivkvK7jdeocjfzBK+CQa5TIG0wsDuXwNoVd15bIOWUKtkowTOuBWm+jRk9P+dyAeqJ8zgKNp8oAsmmqKmAZ2sZJZQgeTWJH1geS5DIOwdurnwfvHcGBXDXfxz35GR14nWyp0EROOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753793848; c=relaxed/simple;
	bh=ohN0W8Fe87WvkynxV+KG8ekNAPhzOZeqmyIekQR76xI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=W2aOsUONfYft/Ux0MQ+EeuB7JFo1kzRow+VT/e82EZblBiCPzwHQfrIGnb+F+1RlKpu/io+rJ1lyFMdT3CIldnFgalE+vQGRvn1u4+zG3ZDOvreElvHnYstT9PH19kvwEAClAXyOka6yW0Cz9EC7+RGk3hROAt+aP4fAXL1ysxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Wud6wlr4; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Wud6wlr4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753793843; x=1785329843;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ohN0W8Fe87WvkynxV+KG8ekNAPhzOZeqmyIekQR76xI=;
  b=Wud6wlr4cKFO9ZIi5e1EscvSbiFdE8PmG2iwdWaXBzH69BSSw4sR13q7
   oDO/65/uTnHvtS4G9aBeURJC6rJ4xuFdF59P0QdxZsCBhBv8ZOql9uz0J
   FrqRPgZazbLAObbbfMdbdmRCF8nhwVa+pEnWDHkELN8LLUCobIw165JM6
   STLcqfImvENdbeo8v/d811I6sbinDq9RP4mW3xhmF4MSh63Z1Kb8iK8HT
   rm2DzMQKLpp/j1rqc3+jBisFh7etfdQAOhgnxf8MCZIaajYowDrY5g6iE
   7byyAsRbosf4iaRsbJYQ6Kjj9eOJxJVos2A64czOmb3G5E/cZrg6atDBp
   g==;
X-CSE-ConnectionGUID: QtFIUP2xQm6TPlB8DzEuVg==
X-CSE-MsgGUID: bN9abc5NQTCIsZr0xVjWHQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11506"; a="55268254"
X-IronPort-AV: E=Sophos;i="6.16,349,1744095600"; 
   d="scan'208";a="55268254"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2025 05:57:20 -0700
X-CSE-ConnectionGUID: R55dEkPnR+SVCBZ12SPzvg==
X-CSE-MsgGUID: ZX42BcROQJOWeBvqjo5nJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,349,1744095600"; 
   d="scan'208";a="163034316"
Received: from lkp-server01.sh.intel.com (HELO 160750d4a34c) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 29 Jul 2025 05:57:19 -0700
Received: from kbuild by 160750d4a34c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ugjtM-0001IH-2c;
	Tue, 29 Jul 2025 12:57:16 +0000
Date: Tue, 29 Jul 2025 20:57:04 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-5.10 2/2]
 drivers/net/ethernet/3snic/sssnic/hw/sss_pci_probe.c:534:5: error: no
 previous prototype for 'sss_pci_probe'
Message-ID: <202507292027.tLc2zjaQ-lkp@intel.com>
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

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-5.10
head:   8b2d4607375adcbd520a2b7c4aaf0030228ff409
commit: 3f63e55de387ff1ef9405747ecd67ea49dd18ed9 [2/2] Net: ethernet: Support 3snic 3s9xx network card
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20250729/202507292027.tLc2zjaQ-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250729/202507292027.tLc2zjaQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507292027.tLc2zjaQ-lkp@intel.com/

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
