Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B179179A5
	for <oe-kbuild-all@lists.linux.dev>; Fri,  2 Feb 2024 15:53:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706889226; cv=none; b=OnC0kwmAnz4i65jvxFGpb/Qw35d8qrlR9VcNR0nfIchvA6+5c0PQMLDFm8KRqaNbTmwpuALFvhonKMRGzcufSYV05GnWUE6Rb1nTOIw0io0/bvx0L+jtUay1hDEqdMgC7X1z/yyKkXau/jilqpRsIDUesdgJLHPjvc/e2iIsiRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706889226; c=relaxed/simple;
	bh=qlS0k4F4pG6oEncHuDoQuRyHYvN6ZAQDHaVc77gVLf8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CjGZ/lZUGkQ5LrnWJfUDHXUlEoZ1zEKd3BFixH0a8nXWKUU4HPVgcxVDiNNxqdO44skFe2v81f9JFU8mipsGsHgAxxmKHHIWJ+0tQSk514xrraeUHWcxMUfJA8Hnkk/AlRfX4eS3QLyhS1DNKFV0FzJqWkNUuGhamuMDa506H84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=c+XnG344; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="c+XnG344"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706889224; x=1738425224;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qlS0k4F4pG6oEncHuDoQuRyHYvN6ZAQDHaVc77gVLf8=;
  b=c+XnG344oq4hxLPnxJuRYPQKcY0CGs5jVjHvfXrwpuZP1ztszbvs/dd1
   nEat0VIMiQF1ov1RjbYlYef/VCx5b9ld5XhFVeExCsRQUTHkxzj1ykyr5
   egenVe9a1KuJNPbegGOQLwxZ3tlln4d55wQtx2leoJrmXyPgTgY4AReRm
   2omp6Pnz6us20VqXy4e5AylCDU+zvaWsvG/VnMaptJUaZV48Z0inuGy5v
   KYcwgEiMDOzibf8Wn2RNnbWODvHIR+ctPAJoS4SHZSyFg4E8T0nJZPU6p
   1R7vddoae54QF4DWuiGsRA7sa0qokJAcpp7OWTKQ6gATEZBbgkAChpoym
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10971"; a="4079077"
X-IronPort-AV: E=Sophos;i="6.05,238,1701158400"; 
   d="scan'208";a="4079077"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Feb 2024 07:53:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,238,1701158400"; 
   d="scan'208";a="30916232"
Received: from lkp-server02.sh.intel.com (HELO 59f4f4cd5935) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 02 Feb 2024 07:53:42 -0800
Received: from kbuild by 59f4f4cd5935 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rVvrH-00040A-1q;
	Fri, 02 Feb 2024 15:53:39 +0000
Date: Fri, 2 Feb 2024 23:52:58 +0800
From: kernel test robot <lkp@intel.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev
Subject: [lunn:v6.8-rc1-net-next-mv88e6xxx-leds-v4 6/8] kismet: WARNING:
 unmet direct dependencies detected for NETDEV_LEDS when selected by
 NET_DSA_MV88E6XXX
Message-ID: <202402022308.z7B9jQw1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/lunn/linux.git v6.8-rc1-net-next-mv88e6xxx-leds-v4
head:   5d9c481bbe2fc447edf620644d5476812d21a350
commit: 50afa47989f1c88bb4fd40424e3aa38bd6cd4e66 [6/8] dsa: mv88e6xxx: Create port/netdev LEDs
config: alpha-kismet-CONFIG_NETDEV_LEDS-CONFIG_NET_DSA_MV88E6XXX-0-0 (https://download.01.org/0day-ci/archive/20240202/202402022308.z7B9jQw1-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20240202/202402022308.z7B9jQw1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402022308.z7B9jQw1-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for NETDEV_LEDS when selected by NET_DSA_MV88E6XXX
   .config:55:warning: symbol value 'n' invalid for USB_GADGET_STORAGE_NUM_BUFFERS
   .config:245:warning: symbol value 'n' invalid for SATA_MOBILE_LPM_POLICY
   .config:347:warning: symbol value 'n' invalid for PSTORE_BLK_MAX_REASON
   .config:374:warning: symbol value 'n' invalid for AIC79XX_DEBUG_MASK
   .config:433:warning: symbol value 'n' invalid for KFENCE_SAMPLE_INTERVAL
   .config:451:warning: symbol value 'n' invalid for PANEL_LCD_PIN_E
   .config:617:warning: symbol value 'n' invalid for DRM_XE_JOB_TIMEOUT_MIN
   .config:643:warning: symbol value 'n' invalid for CRYPTO_DEV_QCE_SW_MAX_LEN
   .config:691:warning: symbol value 'n' invalid for SERIAL_AR933X_NR_UARTS
   .config:758:warning: symbol value 'n' invalid for PANEL_LCD_CHARSET
   .config:802:warning: symbol value 'n' invalid for SND_AC97_POWER_SAVE_DEFAULT
   .config:810:warning: symbol value 'n' invalid for AIC79XX_CMDS_PER_DEVICE
   .config:852:warning: symbol value 'n' invalid for MAGIC_SYSRQ_DEFAULT_ENABLE
   .config:867:warning: symbol value 'n' invalid for DRM_I915_MAX_REQUEST_BUSYWAIT
   .config:888:warning: symbol value 'n' invalid for PANEL_LCD_PIN_SDA
   .config:901:warning: symbol value 'n' invalid for SND_AT73C213_TARGET_BITRATE
   .config:909:warning: symbol value 'n' invalid for DRM_XE_PREEMPT_TIMEOUT_MIN
   .config:920:warning: symbol value 'n' invalid for NET_EMATCH_STACK
   .config:922:warning: symbol value 'n' invalid for VMCP_CMA_SIZE
   .config:1152:warning: symbol value 'n' invalid for RCU_CPU_STALL_TIMEOUT
   .config:1182:warning: symbol value 'n' invalid for MTDRAM_ERASE_SIZE
   .config:1285:warning: symbol value 'n' invalid for SERIAL_UARTLITE_NR_UARTS
   .config:1454:warning: symbol value 'n' invalid for LEGACY_PTY_COUNT
   .config:1510:warning: symbol value 'n' invalid for AIC79XX_RESET_DELAY_MS
   .config:1601:warning: symbol value 'n' invalid for WATCHDOG_OPEN_TIMEOUT
   .config:1604:warning: symbol value 'n' invalid for AIC7XXX_RESET_DELAY_MS
   .config:1771:warning: symbol value 'n' invalid for IBM_EMAC_POLL_WEIGHT
   .config:1893:warning: symbol value 'n' invalid for DRM_I915_STOP_TIMEOUT
   .config:2063:warning: symbol value 'n' invalid for VGA_ARB_MAX_GPUS
   .config:2146:warning: symbol value 'n' invalid for SND_HDA_PREALLOC_SIZE
   .config:2151:warning: symbol value 'n' invalid for MTD_REDBOOT_DIRECTORY_BLOCK
   .config:2177:warning: symbol value 'n' invalid for KCOV_IRQ_AREA_SIZE
   .config:2195:warning: symbol value 'n' invalid for RCU_FANOUT_LEAF
   .config:2340:warning: symbol value 'n' invalid for DRM_XE_TIMESLICE_MAX
   .config:2341:warning: symbol value 'n' invalid for PANEL_LCD_BWIDTH
   .config:2578:warning: symbol value 'n' invalid for PANEL_PARPORT
   .config:2666:warning: symbol value 'n' invalid for NOUVEAU_DEBUG_DEFAULT
   .config:2846:warning: symbol value 'n' invalid for SND_SOC_SOF_DEBUG_IPC_FLOOD_TEST_NUM
   .config:2862:warning: symbol value 'n' invalid for KCSAN_REPORT_ONCE_IN_MS
   .config:2961:warning: symbol value 'n' invalid for KCSAN_UDELAY_INTERRUPT
   .config:2984:warning: symbol value 'n' invalid for PANEL_LCD_PIN_BL
   .config:3002:warning: symbol value 'n' invalid for DEBUG_OBJECTS_ENABLE_DEFAULT
   .config:3010:warning: symbol value 'n' invalid for INITRAMFS_ROOT_GID
   .config:3118:warning: symbol value 'n' invalid for ATM_FORE200E_TX_RETRY
   .config:3155:warning: symbol value 'n' invalid for FB_OMAP2_DSS_MIN_FCK_PER_PCK
   .config:3169:warning: symbol value 'n' invalid for PSTORE_BLK_CONSOLE_SIZE
   .config:3323:warning: symbol value 'n' invalid for BOOKE_WDT_DEFAULT_TIMEOUT
   .config:3362:warning: symbol value 'n' invalid for FTRACE_RECORD_RECURSION_SIZE
   .config:3456:warning: symbol value 'n' invalid for KCSAN_UDELAY_TASK
   .config:3497:warning: symbol value 'n' invalid for MMC_BLOCK_MINORS
   .config:3543:warning: symbol value 'n' invalid for SCSI_NCR53C8XX_SYNC
   .config:3597:warning: symbol value 'n' invalid for XEN_MEMORY_HOTPLUG_LIMIT
   .config:3666:warning: symbol value 'n' invalid for UCLAMP_BUCKETS_COUNT
   .config:3805:warning: symbol value 'n' invalid for SERIAL_MCF_BAUDRATE
   .config:3869:warning: symbol value 'n' invalid for DE2104X_DSL
   .config:3882:warning: symbol value 'n' invalid for BLK_DEV_RAM_COUNT
   .config:3907:warning: symbol value 'n' invalid for STACK_MAX_DEFAULT_SIZE_MB
   .config:4206:warning: symbol value 'n' invalid for CMA_AREAS
   .config:4263:warning: symbol value 'n' invalid for INPUT_MOUSEDEV_SCREEN_X
   .config:4296:warning: symbol value 'n' invalid for USBIP_VHCI_HC_PORTS
   .config:4375:warning: symbol value 'n' invalid for RIONET_RX_SIZE
   .config:4556:warning: symbol value 'n' invalid for PANEL_LCD_PIN_RW
   .config:4614:warning: symbol value 'n' invalid for RADIO_TYPHOON_PORT
   .config:4686:warning: symbol value 'n' invalid for IBM_EMAC_TXB
   .config:4735:warning: symbol value 'n' invalid for SERIAL_TXX9_NR_UARTS
   .config:5072:warning: symbol value 'n' invalid for ARCH_MMAP_RND_BITS
   .config:5153:warning: symbol value 'n' invalid for DRM_I915_FENCE_TIMEOUT
   .config:5174:warning: symbol value 'n' invalid for TTY_PRINTK_LEVEL
   .config:5221:warning: symbol value 'n' invalid for SND_MAX_CARDS
   .config:5332:warning: symbol value 'n' invalid for MIPS_EJTAG_FDC_KGDB_CHAN
   .config:5412:warning: symbol value 'n' invalid for RCU_BOOST_DELAY
   .config:5430:warning: symbol value 'n' invalid for KDB_DEFAULT_ENABLE
   .config:5448:warning: symbol value 'n' invalid for SERIAL_ALTERA_UART_MAXPORTS
   .config:5604:warning: symbol value 'n' invalid for PPC_EARLY_DEBUG_EHV_BC_HANDLE
   .config:5711:warning: symbol value 'n' invalid for PANEL_LCD_HWIDTH
   .config:5742:warning: symbol value 'n' invalid for LOCKDEP_CHAINS_BITS
   .config:5833:warning: symbol value 'n' invalid for DRM_I915_HEARTBEAT_INTERVAL
   .config:5840:warning: symbol value 'n' invalid for KCSAN_SKIP_WATCH
   .config:5862:warning: symbol value 'n' invalid for PSTORE_BLK_KMSG_SIZE
   .config:5899:warning: symbol value 'n' invalid for DRM_XE_PREEMPT_TIMEOUT_MAX
   .config:5925:warning: symbol value 'n' invalid for CRYPTO_DEV_FSL_CAAM_INTC_TIME_THLD
   .config:6066:warning: symbol value 'n' invalid for SERIAL_8250_RUNTIME_UARTS
   .config:6164:warning: symbol value 'n' invalid for ARCH_MMAP_RND_COMPAT_BITS
   .config:6332:warning: symbol value 'n' invalid for RADIO_TRUST_PORT
   .config:6433:warning: symbol value 'n' invalid for SCSI_SYM53C8XX_MAX_TAGS
   .config:6435:warning: symbol value 'n' invalid for SERIAL_SH_SCI_NR_UARTS
   .config:6526:warning: symbol value 'n' invalid for MTD_UBI_WL_THRESHOLD
   .config:6549:warning: symbol value 'n' invalid for RIONET_TX_SIZE
   .config:6711:warning: symbol value 'n' invalid for CMA_SIZE_PERCENTAGE
   .config:6855:warning: symbol value 'n' invalid for DRM_XE_TIMESLICE_MIN
   .config:6958:warning: symbol value 'n' invalid for OMAP2_DSS_MIN_FCK_PER_PCK
   .config:6989:warning: symbol value 'n' invalid for SCSI_NCR53C8XX_MAX_TAGS
   .config:7003:warning: symbol value 'n' invalid for DVB_MAX_ADAPTERS
   .config:7008:warning: symbol value 'n' invalid for SCSI_SYM53C8XX_DMA_ADDRESSING_MODE
   .config:7323:warning: symbol value 'n' invalid for SERIAL_ARC_NR_PORTS
   .config:7362:warning: symbol value 'n' invalid for ZSMALLOC_CHAIN_SIZE
   .config:7384:warning: symbol value 'n' invalid for IBM_EMAC_RXB
   .config:7473:warning: symbol value 'n' invalid for VIDEO_VIVID_MAX_DEVS
   .config:7500:warning: symbol value 'n' invalid for SCSI_MPT3SAS_MAX_SGE
   .config:7504:warning: symbol value 'n' invalid for KDB_CONTINUE_CATASTROPHIC

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
