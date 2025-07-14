Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66CBD23D280
	for <oe-kbuild-all@lists.linux.dev>; Mon, 14 Jul 2025 16:15:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752509737; cv=none; b=EgEfmpAzGUNHFfo25LDmn13zeomYvibzwOfgdpxqWBIcrQS6k+KvlNejg+fU1W8vqGCMln2NpHPb7MHWdq7PDdlHDwgn43YOIJ/PDHQr0p3miUpwPrJ4qxEPPM5U/ao2IXk5jrCI8LyQanu2Xvw7QBf+3SfyINkMIfcLyjxnnuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752509737; c=relaxed/simple;
	bh=mYlS3yad2lnGU3Gc5U+g+NzTgRuBDL7jSQEs6R1dU6k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TS6bzCNks+tQULAbge+jo57w/UJEG7y8Yi7GKrCJVHCPM/3tSF9w0AVm+n3LFFMiV7YDQ3qxKkZezeLWdViXYP9hiPSg2Pl6OH8eAuXjBA9BvApNJSUAbgZcXnUEmXqMhHCUishMHOdE7SXC7lvf+3LhnKYtnaep9nCOEJAvtfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JM8d08VG; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JM8d08VG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752509735; x=1784045735;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mYlS3yad2lnGU3Gc5U+g+NzTgRuBDL7jSQEs6R1dU6k=;
  b=JM8d08VGyENCQDZPJUyaOd2JPRlyJJUSpezAu2MPIJAhU716gWTdvSxU
   uqO98xUQH0gseawrO7F4t77DOK4+5R9yvHXARjrClg4lWrlm1YEL8lviO
   gyIjMFTwerwjPyt9HnrxJWl7jQ/eKWA1gJK6sAKM17bEIbmnU97lIV0U2
   1n6Hs9uysQpfQxn2bPyKwdDa5+Y6D7k1jMEC+lAvsaBVLGFnx5UBNmoFh
   ITPntt6K8XDnw6ifTBdeOs1lBeOeifoF3Ocyy+HzrUYfYFhB0QSx7B2uT
   MS7BsbSAp2Xk4Bwq0uKE4GlJyf1EefhnMo8uGx03T2BrE19Sqv/eM3VNY
   w==;
X-CSE-ConnectionGUID: D0zqitkvRNmyRyy3BWSyAw==
X-CSE-MsgGUID: QLb0V+ajQa6+WJFLMhiheg==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="54563041"
X-IronPort-AV: E=Sophos;i="6.16,311,1744095600"; 
   d="scan'208";a="54563041"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jul 2025 09:15:31 -0700
X-CSE-ConnectionGUID: HucfCtedQRml2fux3Gz9TQ==
X-CSE-MsgGUID: ClsbmBF6TRGn4tRn7Siefg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,311,1744095600"; 
   d="scan'208";a="160988685"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 14 Jul 2025 09:15:30 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ubLpw-000968-02;
	Mon, 14 Jul 2025 16:15:28 +0000
Date: Tue, 15 Jul 2025 00:14:39 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1730/1730]
 drivers/net/ethernet/3snic/sssnic/hw/sss_pci_probe.c:548:5: error: no
 previous prototype for 'sss_pci_probe'
Message-ID: <202507150036.2TFl4VP9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   50cedfb94c0444cc8920295500f5fa74701dc736
commit: a6a7981cbf66d4951425d33cdce6ef39206eba83 [1730/1730] Net: ethernet: Support 3snic 3s9xx network card
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20250715/202507150036.2TFl4VP9-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250715/202507150036.2TFl4VP9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507150036.2TFl4VP9-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/net/ethernet/3snic/sssnic/hw/sss_pci_probe.c:276:5: error: no previous prototype for 'sss_attach_uld_driver' [-Werror=missing-prototypes]
     276 | int sss_attach_uld_driver(struct sss_pci_adapter *adapter,
         |     ^~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/3snic/sssnic/hw/sss_pci_probe.c:548:5: error: no previous prototype for 'sss_pci_probe' [-Werror=missing-prototypes]
     548 | int sss_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
         |     ^~~~~~~~~~~~~
   cc1: all warnings being treated as errors
--
>> drivers/net/ethernet/3snic/sssnic/hw/sss_pci_remove.c:90:6: error: no previous prototype for 'sss_detach_uld_driver' [-Werror=missing-prototypes]
      90 | void sss_detach_uld_driver(struct sss_pci_adapter *adapter,
         |      ^~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/3snic/sssnic/hw/sss_pci_remove.c:120:6: error: no previous prototype for 'sss_detach_all_uld_driver' [-Werror=missing-prototypes]
     120 | void sss_detach_all_uld_driver(struct sss_pci_adapter *adapter)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/3snic/sssnic/hw/sss_pci_remove.c:138:6: error: no previous prototype for 'sss_dettach_uld_dev' [-Werror=missing-prototypes]
     138 | void sss_dettach_uld_dev(struct sss_pci_adapter *adapter)
         |      ^~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/3snic/sssnic/hw/sss_pci_remove.c:179:6: error: no previous prototype for 'sss_deinit_function' [-Werror=missing-prototypes]
     179 | void sss_deinit_function(struct pci_dev *pdev)
         |      ^~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/3snic/sssnic/hw/sss_pci_remove.c:200:6: error: no previous prototype for 'sss_unmap_pci_bar' [-Werror=missing-prototypes]
     200 | void sss_unmap_pci_bar(struct sss_pci_adapter *adapter)
         |      ^~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/3snic/sssnic/hw/sss_pci_remove.c:211:5: error: no previous prototype for 'sss_deinit_adapter' [-Werror=missing-prototypes]
     211 | int sss_deinit_adapter(struct sss_pci_adapter *adapter)
         |     ^~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/3snic/sssnic/hw/sss_pci_remove.c:237:6: error: no previous prototype for 'sss_deinit_pci_dev' [-Werror=missing-prototypes]
     237 | void sss_deinit_pci_dev(struct pci_dev *pdev)
         |      ^~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/3snic/sssnic/hw/sss_pci_remove.c:249:6: error: no previous prototype for 'sss_pci_remove' [-Werror=missing-prototypes]
     249 | void sss_pci_remove(struct pci_dev *pdev)
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
>> drivers/net/ethernet/3snic/sssnic/hw/sss_hwif_mbx_init.c:252:5: error: no previous prototype for 'sss_init_func_mbx_msg' [-Werror=missing-prototypes]
     252 | int sss_init_func_mbx_msg(void *hwdev, u16 func_num)
         |     ^~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/3snic/sssnic/hw/sss_hwif_mbx_init.c:401:5: error: no previous prototype for 'sss_hwif_init_mbx' [-Werror=missing-prototypes]
     401 | int sss_hwif_init_mbx(struct sss_hwdev *hwdev)
         |     ^~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/3snic/sssnic/hw/sss_hwif_mbx_init.c:449:6: error: no previous prototype for 'sss_hwif_deinit_mbx' [-Werror=missing-prototypes]
     449 | void sss_hwif_deinit_mbx(struct sss_hwdev *hwdev)
         |      ^~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/3snic/sssnic/hw/sss_hwif_mbx_init.c:872:6: error: no previous prototype for 'sss_recv_mbx_aeq_handler' [-Werror=missing-prototypes]
     872 | void sss_recv_mbx_aeq_handler(void *handle, u8 *header, u8 size)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~
   cc1: all warnings being treated as errors
--
   drivers/net/ethernet/3snic/sssnic/hw/sss_hwif_adm.c:545:5: error: no previous prototype for 'sss_adm_msg_write' [-Werror=missing-prototypes]
     545 | int sss_adm_msg_write(struct sss_adm_msg *adm_msg, u8 node_id,
         |     ^~~~~~~~~~~~~~~~~
   drivers/net/ethernet/3snic/sssnic/hw/sss_hwif_adm.c:551:5: error: no previous prototype for 'sss_adm_msg_read' [-Werror=missing-prototypes]
     551 | int sss_adm_msg_read(struct sss_adm_msg *adm_msg, u8 node_id,
         |     ^~~~~~~~~~~~~~~~
   drivers/net/ethernet/3snic/sssnic/hw/sss_hwif_adm.c:597:5: error: no previous prototype for 'sss_adm_msg_read_ack' [-Werror=missing-prototypes]
     597 | int sss_adm_msg_read_ack(void *hwdev, u8 dest, const void *cmd,
         |     ^~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/3snic/sssnic/hw/sss_hwif_adm.c:618:5: error: no previous prototype for 'sss_adm_msg_write_nack' [-Werror=missing-prototypes]
     618 | int sss_adm_msg_write_nack(void *hwdev, u8 dest, const void *cmd, u16 size)
         |     ^~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/3snic/sssnic/hw/sss_hwif_adm.c:682:5: error: no previous prototype for 'sss_sync_send_adm_msg' [-Werror=missing-prototypes]
     682 | int sss_sync_send_adm_msg(void *hwdev, u8 mod, u16 cmd, void *buf_in,
         |     ^~~~~~~~~~~~~~~~~~~~~
   cc1: all warnings being treated as errors
..


vim +/sss_pci_probe +548 drivers/net/ethernet/3snic/sssnic/hw/sss_pci_probe.c

   547	
 > 548	int sss_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
