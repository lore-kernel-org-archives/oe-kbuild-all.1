Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADAE83B42E6
	for <oe-kbuild-all@lists.linux.dev>; Sun, 11 Oct 2026 13:22:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791724976; cv=none; b=UtLvEiSV3OHMmdF0OJyx2SnPLDl9JrL+GDO4fjAS1t31dJ68cUGRUU6uJ39a/uOlHgD+YZsb6T+Tn7kztgorCHsn5x/XfEiIPqctmRgpb8LihkA7Y6GZwo/cts8puWZSaF83VYtXi9deF0KbjEFq3he1dWtHoBFZ/jlnpaZlc8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791724976; c=relaxed/simple;
	bh=kZ6txBcLg1mwH6ej7ss69HG8ldT93WE1AMtiult2RuM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=bAH9eLxi7CZNM7goNZBaHfcOs4uDt/2RFjneH8PgyY/j5QzEhr39BI/h1oly7EyocLvMkfGajIVlQbpieR7+MvJDUFG5l7f6UV8TzuBvjJUm8filngs6ixehm/jjC+yNfWpOp/i0fV2k+LX+YyP02YU5EgPT1CPBGrqckSSxXgo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=G4mlg9Vo; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="G4mlg9Vo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791724973; x=1823260973;
  h=date:from:to:cc:subject:message-id;
  bh=kZ6txBcLg1mwH6ej7ss69HG8ldT93WE1AMtiult2RuM=;
  b=G4mlg9VouxCyfkqFiOJ58dtzWx4kr+Bo4IJZuMu7J8X3Lqv1pU3/qXM2
   /sQ81cERM0nFuD1MYWaIdcy+6N0fzCz3ux+tOl5NHC1uvlXYu6Rbywyl/
   U/yL4NxttHyZnRMb/X/GbT5e0xkQ6hzzdO8FyRq+HUh4mHWk8stN5pnxw
   8oZfN3SY+jvlkeuFpOeEX4D0RVMprR4mytUnU3rLAzfoIe9ynMrZKUVuH
   qy+0W5D2C1x3jtcId/kyA+jRwBC1/CFpnQ9BQr5aV9thN7EcTwaF/kJ8R
   6hUXJldMm7gOuZZBgeXql9MRwRhiRKdxmdznFpsgqOu7Y+7Vfl9e88MM2
   w==;
X-CSE-ConnectionGUID: DHQk95TESHeROgtDgZKo4A==
X-CSE-MsgGUID: wNpPD52eSQiCFSo7mFTOgg==
X-IronPort-AV: E=McAfee;i="6800,10657,11931"; a="458180"
X-IronPort-AV: E=Sophos;i="6.27,151,1787036400"; 
   d="scan'208";a="458180"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Oct 2026 06:22:52 -0700
X-CSE-ConnectionGUID: Vh0mVkx5ShCq4VkopfnEDA==
X-CSE-MsgGUID: Lp3UOfx8TFqpXF+7nt3+bQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,151,1787036400"; 
   d="scan'208";a="790357"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 11 Oct 2026 06:22:51 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xFtVp-00000000AWq-0PLy;
	Sun, 11 Oct 2026 13:22:49 +0000
Date: Sun, 11 Oct 2026 21:21:58 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:intel-6.6-add-OMR-event-ANBZ51468 12/12]
 drivers/bluetooth/btmtk.h:223:12: warning: 'btmtk_register_coredump' defined
 but not used
Message-ID: <202610112108.EJsgPCAb-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://gitee.com/anolis/intel-cloud-kernel.git intel-6.6-add-OMR-event-ANBZ51468
head:   40555325b1fefd764aa1929b51f304033135bc97
commit: c81f963395299e5d9c7202da9e1c13aa31e82b1c [12/12] Bluetooth: btmtk: move btusb_mtk_[setup, shutdown] to btmtk.c
config: x86_64-anolis-intel-cloud-devel-6.6 (https://download.01.org/0day-ci/archive/20261011/202610112108.EJsgPCAb-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261011/202610112108.EJsgPCAb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610112108.EJsgPCAb-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/bluetooth/btusb.c:28:
   drivers/bluetooth/btmtk.h:234:13: warning: 'btmtk_fw_get_filename' defined but not used [-Wunused-function]
     234 | static void btmtk_fw_get_filename(char *buf, size_t size, u32 dev_id,
         |             ^~~~~~~~~~~~~~~~~~~~~
>> drivers/bluetooth/btmtk.h:223:12: warning: 'btmtk_register_coredump' defined but not used [-Wunused-function]
     223 | static int btmtk_register_coredump(struct hci_dev *hdev, const char *name,
         |            ^~~~~~~~~~~~~~~~~~~~~~~
>> drivers/bluetooth/btmtk.h:213:12: warning: 'btmtk_setup_firmware' defined but not used [-Wunused-function]
     213 | static int btmtk_setup_firmware(struct hci_dev *hdev, const char *fwname,
         |            ^~~~~~~~~~~~~~~~~~~~
>> drivers/bluetooth/btmtk.h:207:12: warning: 'btmtk_setup_firmware_79xx' defined but not used [-Wunused-function]
     207 | static int btmtk_setup_firmware_79xx(struct hci_dev *hdev, const char *fwname,
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~


vim +/btmtk_register_coredump +223 drivers/bluetooth/btmtk.h

8c0d17b6b06c5b Sean Wang 2021-10-19  206  
8c0d17b6b06c5b Sean Wang 2021-10-19 @207  static int btmtk_setup_firmware_79xx(struct hci_dev *hdev, const char *fwname,
8c0d17b6b06c5b Sean Wang 2021-10-19  208  				     wmt_cmd_sync_func_t wmt_cmd_sync)
8c0d17b6b06c5b Sean Wang 2021-10-19  209  {
8c0d17b6b06c5b Sean Wang 2021-10-19  210  	return -EOPNOTSUPP;
8c0d17b6b06c5b Sean Wang 2021-10-19  211  }
8c0d17b6b06c5b Sean Wang 2021-10-19  212  
8c0d17b6b06c5b Sean Wang 2021-10-19 @213  static int btmtk_setup_firmware(struct hci_dev *hdev, const char *fwname,
8c0d17b6b06c5b Sean Wang 2021-10-19  214  				wmt_cmd_sync_func_t wmt_cmd_sync)
8c0d17b6b06c5b Sean Wang 2021-10-19  215  {
8c0d17b6b06c5b Sean Wang 2021-10-19  216  	return -EOPNOTSUPP;
8c0d17b6b06c5b Sean Wang 2021-10-19  217  }
8c0d17b6b06c5b Sean Wang 2021-10-19  218  
25b6d7593a3af7 Jing Cai  2023-06-29  219  static void btmtk_reset_sync(struct hci_dev *hdev)
25b6d7593a3af7 Jing Cai  2023-06-29  220  {
25b6d7593a3af7 Jing Cai  2023-06-29  221  }
0b70151328781a Jing Cai  2023-06-29  222  
0b70151328781a Jing Cai  2023-06-29 @223  static int btmtk_register_coredump(struct hci_dev *hdev, const char *name,
0b70151328781a Jing Cai  2023-06-29  224  				   u32 fw_version)
0b70151328781a Jing Cai  2023-06-29  225  {
0b70151328781a Jing Cai  2023-06-29  226  	return -EOPNOTSUPP;
0b70151328781a Jing Cai  2023-06-29  227  }
0b70151328781a Jing Cai  2023-06-29  228  

:::::: The code at line 223 was first introduced by commit
:::::: 0b70151328781a89c89e4cf3fae21fc0e98d869e Bluetooth: btusb: mediatek: add MediaTek devcoredump support

:::::: TO: Jing Cai <jing.cai@mediatek.com>
:::::: CC: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
