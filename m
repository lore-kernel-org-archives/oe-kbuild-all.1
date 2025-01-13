Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DB22EED8
	for <oe-kbuild-all@lists.linux.dev>; Mon, 13 Jan 2025 01:23:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736731391; cv=none; b=szSdDVNzpSfeoPDLZxdodJWrzrz478tX2+Knsyd175XkOAAa440wudg4BsN0p4gQ72KV7zaUpMs3p6EvwJOENIU7y56iEHVg2H2fS4uEyQPqcYEb7n0SOzgpVAqvplLr1YwDCfY+lIVW8oZB9UdjdFcFg0H4KVthv/acm0EfCXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736731391; c=relaxed/simple;
	bh=BVO/fZ2Yhu3QFbmZBCziSfAerOvw7xcrhjdqoKLej1c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ldG7ObnsCymaZRAwalL66rHs1BkOzoMDcbs2PyrkoqDliFd3AfVLPxKVf1JKWjIPyeAOLB7acXh3tKkoxPwQswSLHlnBPZv/CxKoLcsfqit7nQNKuCa1uMAYF+cst4SywqQhaRLF/A8mBeLQjs5TY1DMooEpGpEDW5Eq/5zEvTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mDP2VLyT; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mDP2VLyT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736731389; x=1768267389;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BVO/fZ2Yhu3QFbmZBCziSfAerOvw7xcrhjdqoKLej1c=;
  b=mDP2VLyTPaxjg4UiuD2HiEA+dV0MWoLLvPk5UQ+ju3UmuQb0rHEDkL75
   oDTSwjJ/9JR1hIgS7XS90QaZIu/bxt3fHcnT8P/aPZKpsMQ20NhLgc5ld
   /Tew9D1ehbTglod2edQL2hSeliDUqGlIOkEJvN4bXNICZfue6stiKtm6s
   /LlMdTk8RyUYHl5b1OuGPCJFtgN4sMAviNrcSaHYAB6fCZn4QDsK4T9Pz
   3w4WwvSZZ0J+y6wRhBevKOJs/BUmQXRrGJnYAgT/c1tczCYx9c1r8wYjP
   8Jmjl7uUFVAT4qa4pM6AHawkCg/kZABiJg7uxIttydjX24sHpHB/nQkg6
   Q==;
X-CSE-ConnectionGUID: WDSmygewSKOl4EeSmCaQiA==
X-CSE-MsgGUID: GT+8MMeFQyOVpmWyTMYm3g==
X-IronPort-AV: E=McAfee;i="6700,10204,11313"; a="40652414"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="40652414"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2025 17:23:09 -0800
X-CSE-ConnectionGUID: rYtsSJy+RYy/y5TqYTfO+A==
X-CSE-MsgGUID: ON5l/0XaT+qeq2WrJ3t/YQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="104885612"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 12 Jan 2025 17:23:05 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tX9AV-000Mb5-0n;
	Mon, 13 Jan 2025 01:23:03 +0000
Date: Mon, 13 Jan 2025 09:22:13 +0800
From: kernel test robot <lkp@intel.com>
To: Nihar Chaithanya <niharchaithanya@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, devel@driverdev.osuosl.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [staging:staging-testing 13/26] riscv64-linux-ld:
 drivers/staging/gpib/fmh_gpib/fmh_gpib.c:1731:undefined reference to
 `gpib_unregister_driver'
Message-ID: <202501130949.llN3pNb1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git staging-testing
head:   76c63651bb6d5274d9e517f1367dc13defd228c8
commit: 10ca8c3b51f7ad557fdd1953eaad8b5a91774ecd [13/26] staging: gpib: fmh: Handle gpib_register_driver() errors
config: riscv-randconfig-001-20250113 (https://download.01.org/0day-ci/archive/20250113/202501130949.llN3pNb1-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250113/202501130949.llN3pNb1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501130949.llN3pNb1-lkp@intel.com/

All errors (new ones prefixed by >>):

   riscv64-linux-ld: drivers/staging/gpib/fmh_gpib/fmh_gpib.o: in function `fmh_gpib_t1_delay':
   drivers/staging/gpib/fmh_gpib/fmh_gpib.c:257:(.text+0x196): undefined reference to `nec7210_t1_delay'
   riscv64-linux-ld: drivers/staging/gpib/fmh_gpib/fmh_gpib.c:271:(.text+0x1de): undefined reference to `nec7210_serial_poll_status'
   riscv64-linux-ld: drivers/staging/gpib/fmh_gpib/fmh_gpib.o: in function `fmh_gpib_serial_poll_status':
   drivers/staging/gpib/fmh_gpib/fmh_gpib.c:212:(.text+0x1fe): undefined reference to `nec7210_secondary_address'
   riscv64-linux-ld: drivers/staging/gpib/fmh_gpib/fmh_gpib.o: in function `fmh_gpib_secondary_address':
   drivers/staging/gpib/fmh_gpib/fmh_gpib.c:133:(.text+0x21c): undefined reference to `nec7210_primary_address'
   riscv64-linux-ld: drivers/staging/gpib/fmh_gpib/fmh_gpib.o: in function `fmh_gpib_primary_address':
   drivers/staging/gpib/fmh_gpib/fmh_gpib.c:126:(.text+0x23a): undefined reference to `nec7210_update_status'
   riscv64-linux-ld: drivers/staging/gpib/fmh_gpib/fmh_gpib.o: in function `fmh_gpib_update_status':
   drivers/staging/gpib/fmh_gpib/fmh_gpib.c:119:(.text+0x258): undefined reference to `nec7210_parallel_poll_response'
   riscv64-linux-ld: drivers/staging/gpib/fmh_gpib/fmh_gpib.o: in function `fmh_gpib_parallel_poll_response':
   drivers/staging/gpib/fmh_gpib/fmh_gpib.c:154:(.text+0x276): undefined reference to `nec7210_parallel_poll'
   riscv64-linux-ld: drivers/staging/gpib/fmh_gpib/fmh_gpib.o: in function `fmh_gpib_parallel_poll':
   drivers/staging/gpib/fmh_gpib/fmh_gpib.c:140:(.text+0x294): undefined reference to `nec7210_parallel_poll_configure'
   riscv64-linux-ld: drivers/staging/gpib/fmh_gpib/fmh_gpib.o: in function `fmh_gpib_parallel_poll_configure':
   drivers/staging/gpib/fmh_gpib/fmh_gpib.c:147:(.text+0x2b0): undefined reference to `nec7210_disable_eos'
   riscv64-linux-ld: drivers/staging/gpib/fmh_gpib/fmh_gpib.o: in function `fmh_gpib_disable_eos':
   drivers/staging/gpib/fmh_gpib/fmh_gpib.c:113:(.text+0x2d0): undefined reference to `nec7210_enable_eos'
   riscv64-linux-ld: drivers/staging/gpib/fmh_gpib/fmh_gpib.o: in function `fmh_gpib_enable_eos':
   drivers/staging/gpib/fmh_gpib/fmh_gpib.c:105:(.text+0x2ee): undefined reference to `nec7210_remote_enable'
   riscv64-linux-ld: drivers/staging/gpib/fmh_gpib/fmh_gpib.o: in function `fmh_gpib_remote_enable':
   drivers/staging/gpib/fmh_gpib/fmh_gpib.c:98:(.text+0x30c): undefined reference to `nec7210_interface_clear'
   riscv64-linux-ld: drivers/staging/gpib/fmh_gpib/fmh_gpib.o: in function `fmh_gpib_interface_clear':
   drivers/staging/gpib/fmh_gpib/fmh_gpib.c:91:(.text+0x32a): undefined reference to `nec7210_request_system_control'
   riscv64-linux-ld: drivers/staging/gpib/fmh_gpib/fmh_gpib.o: in function `fmh_gpib_request_system_control':
   drivers/staging/gpib/fmh_gpib/fmh_gpib.c:84:(.text+0x346): undefined reference to `nec7210_go_to_standby'
   riscv64-linux-ld: drivers/staging/gpib/fmh_gpib/fmh_gpib.o: in function `fmh_gpib_go_to_standby':
   drivers/staging/gpib/fmh_gpib/fmh_gpib.c:76:(.text+0x364): undefined reference to `nec7210_take_control'
   riscv64-linux-ld: drivers/staging/gpib/fmh_gpib/fmh_gpib.o: in function `fmh_gpib_take_control':
   drivers/staging/gpib/fmh_gpib/fmh_gpib.c:70:(.text+0x386): undefined reference to `nec7210_command'
   riscv64-linux-ld: drivers/staging/gpib/fmh_gpib/fmh_gpib.o: in function `fmh_gpib_command':
   drivers/staging/gpib/fmh_gpib/fmh_gpib.c:63:(.text+0x3aa): undefined reference to `nec7210_write'
   riscv64-linux-ld: drivers/staging/gpib/fmh_gpib/fmh_gpib.o: in function `fmh_gpib_write':
   drivers/staging/gpib/fmh_gpib/fmh_gpib.c:55:(.text+0x3ce): undefined reference to `nec7210_read'
   riscv64-linux-ld: drivers/staging/gpib/fmh_gpib/fmh_gpib.o: in function `fmh_gpib_detach':
   drivers/staging/gpib/fmh_gpib/fmh_gpib.c:1508:(.text+0x564): undefined reference to `nec7210_board_reset'
   riscv64-linux-ld: drivers/staging/gpib/fmh_gpib/fmh_gpib.c:1526:(.text+0x5d2): undefined reference to `gpib_match_device_path'
   riscv64-linux-ld: drivers/staging/gpib/fmh_gpib/fmh_gpib.o: in function `fmh_gpib_pci_detach':
   drivers/staging/gpib/fmh_gpib/fmh_gpib.c:1631:(.text+0x65c): undefined reference to `nec7210_board_reset'
   riscv64-linux-ld: drivers/staging/gpib/fmh_gpib/fmh_gpib.o: in function `spin_unlock_irqrestore':
   include/linux/spinlock.h:406:(.text+0xe32): undefined reference to `push_gpib_event'
   riscv64-linux-ld: drivers/staging/gpib/fmh_gpib/fmh_gpib.o: in function `fmh_gpib_release_rfd_holdoff':
   drivers/staging/gpib/fmh_gpib/fmh_gpib.c:867:(.text+0xe4a): undefined reference to `nec7210_interrupt_have_status'
   riscv64-linux-ld: drivers/staging/gpib/fmh_gpib/fmh_gpib.o: in function `fmh_gpib_internal_interrupt':
   drivers/staging/gpib/fmh_gpib/fmh_gpib.c:1239:(.text+0xfd4): undefined reference to `nec7210_set_reg_bits'
   riscv64-linux-ld: drivers/staging/gpib/fmh_gpib/fmh_gpib.o: in function `wait_for_rx_fifo_half_full_or_end':
   drivers/staging/gpib/fmh_gpib/fmh_gpib.c:313:(.text+0x14c4): undefined reference to `nec7210_set_reg_bits'
   riscv64-linux-ld: drivers/staging/gpib/fmh_gpib/fmh_gpib.c:313:(.text+0x14d4): undefined reference to `nec7210_set_reg_bits'
   riscv64-linux-ld: drivers/staging/gpib/fmh_gpib/fmh_gpib.o: in function `fmh_gpib_fifo_read_countable':
   drivers/staging/gpib/fmh_gpib/fmh_gpib.c:932:(.text+0x1546): undefined reference to `nec7210_set_reg_bits'
   riscv64-linux-ld: drivers/staging/gpib/fmh_gpib/fmh_gpib.c:968:(.text+0x162a): undefined reference to `nec7210_set_reg_bits'
   riscv64-linux-ld: drivers/staging/gpib/fmh_gpib/fmh_gpib.o:drivers/staging/gpib/fmh_gpib/fmh_gpib.c:1032: more undefined references to `nec7210_set_reg_bits' follow
   riscv64-linux-ld: drivers/staging/gpib/fmh_gpib/fmh_gpib.o: in function `fmh_gpib_dma_read':
   drivers/staging/gpib/fmh_gpib/fmh_gpib.c:822:(.text+0x25a0): undefined reference to `gpib_pci_get_device'
   riscv64-linux-ld: drivers/staging/gpib/fmh_gpib/fmh_gpib.o: in function `fmh_gpib_exit_module':
   drivers/staging/gpib/fmh_gpib/fmh_gpib.c:1746:(.exit.text+0x10): undefined reference to `gpib_unregister_driver'
   riscv64-linux-ld: drivers/staging/gpib/fmh_gpib/fmh_gpib.c:1747:(.exit.text+0x20): undefined reference to `gpib_unregister_driver'
   riscv64-linux-ld: drivers/staging/gpib/fmh_gpib/fmh_gpib.c:1748:(.exit.text+0x30): undefined reference to `gpib_unregister_driver'
   riscv64-linux-ld: drivers/staging/gpib/fmh_gpib/fmh_gpib.c:1749:(.exit.text+0x40): undefined reference to `gpib_unregister_driver'
   riscv64-linux-ld: drivers/staging/gpib/fmh_gpib/fmh_gpib.o: in function `fmh_gpib_init_module':
   drivers/staging/gpib/fmh_gpib/fmh_gpib.c:1704:(.init.text+0x70): undefined reference to `gpib_register_driver'
   riscv64-linux-ld: drivers/staging/gpib/fmh_gpib/fmh_gpib.c:1710:(.init.text+0x9a): undefined reference to `gpib_register_driver'
   riscv64-linux-ld: drivers/staging/gpib/fmh_gpib/fmh_gpib.c:1716:(.init.text+0xc4): undefined reference to `gpib_register_driver'
   riscv64-linux-ld: drivers/staging/gpib/fmh_gpib/fmh_gpib.c:1722:(.init.text+0xee): undefined reference to `gpib_register_driver'
>> riscv64-linux-ld: drivers/staging/gpib/fmh_gpib/fmh_gpib.c:1731:(.init.text+0x114): undefined reference to `gpib_unregister_driver'
   riscv64-linux-ld: drivers/staging/gpib/fmh_gpib/fmh_gpib.c:1733:(.init.text+0x124): undefined reference to `gpib_unregister_driver'
   riscv64-linux-ld: drivers/staging/gpib/fmh_gpib/fmh_gpib.c:1735:(.init.text+0x134): undefined reference to `gpib_unregister_driver'
   riscv64-linux-ld: drivers/staging/gpib/fmh_gpib/fmh_gpib.o: in function `fmh_gpib_init':
   drivers/staging/gpib/fmh_gpib/fmh_gpib.c:1342:(.text.unlikely+0x26): undefined reference to `nec7210_board_reset'
   riscv64-linux-ld: drivers/staging/gpib/fmh_gpib/fmh_gpib.c:1344:(.text.unlikely+0x44): undefined reference to `nec7210_set_handshake_mode'
   riscv64-linux-ld: drivers/staging/gpib/fmh_gpib/fmh_gpib.c:1351:(.text.unlikely+0x70): undefined reference to `nec7210_board_online'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
