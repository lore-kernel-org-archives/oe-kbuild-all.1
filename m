Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FF6038F97
	for <oe-kbuild-all@lists.linux.dev>; Fri,  2 Feb 2024 13:01:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706878866; cv=none; b=c7K/pszy8VXGFsyHyKG/SaRmr81oYMzLHhQS4wOjd/ammLre+hFRmhsAxPUFv5iOkLgNy/IB0jUEwFFgOTeULsjboNEhGjfPSkwdan+ETADsiYlPb06W6FwIZbkYhyJNUTK19eyhnIFfZFKzAAU20A2iOr+hoJyHZ/s/3nYQaw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706878866; c=relaxed/simple;
	bh=LhnEhIG/Vs40iwCzDbmnyOsFhRqP2/+mVm19E37H8Sc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZwRTBQqIbekVOyv2BjdJTFEj0oGX7CiYqeifmvVbrabAiwAxD6Of3GmhuhItsDI7HASZ3pPCcZ2h9x562lSUTFPJv/bOOB1mCW+qbhl2r646P4axglTgHuV2nCcQY3g0IXC9f3fFi5Scz3ztLV2x0K2Tiy1l3wSu0va0k4ClsGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OyX9QgTf; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OyX9QgTf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706878862; x=1738414862;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LhnEhIG/Vs40iwCzDbmnyOsFhRqP2/+mVm19E37H8Sc=;
  b=OyX9QgTfKHq4vOo8QwE5KnMmlaIEr8/rVU9XNZZAC56GofZ2aIoSUCjV
   5FYC1/Ul4YPcYlvbSG58gTnICUqyoHE0oUYixdqI1jrtXNsFkkVgeAM85
   /ycNQDMWqBv5Xsmt6kQno0ozWUHeoQUGoQg3Cy4rZ2aLJfYYs4r+u7M7h
   60WcbszLUFPKwUQ07/+9tWGAcYDthn5LTPN7hppCnerLjWm8KntfDf43i
   zR2uEjZ0KXEmSM40L34reaJ/gcPQ6knv7YhnDBSos32k4JulbDXKj53aR
   X4P4aa7LFMpO8LgwM3rv9MvVxkf5KBaOrHvi2N+mMM6wFduGwPMcDx3ME
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10971"; a="71407"
X-IronPort-AV: E=Sophos;i="6.05,238,1701158400"; 
   d="scan'208";a="71407"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Feb 2024 05:01:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,238,1701158400"; 
   d="scan'208";a="400791"
Received: from lkp-server02.sh.intel.com (HELO 59f4f4cd5935) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 02 Feb 2024 05:01:02 -0800
Received: from kbuild by 59f4f4cd5935 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rVtAB-0003r8-12;
	Fri, 02 Feb 2024 13:00:59 +0000
Date: Fri, 2 Feb 2024 21:00:47 +0800
From: kernel test robot <lkp@intel.com>
To: Max Filippov <jcmvbkbc@gmail.com>
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev
Subject: [jcmvbkbc-xtensa:xtensa-6.8-rc2-esp32 21/44] kismet: WARNING: unmet
 direct dependencies detected for ESP32_IPC when selected by MTD_ESP32
Message-ID: <202402022032.iXp8O6LL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jcmvbkbc/linux-xtensa xtensa-6.8-rc2-esp32
head:   b25ff15921c2ce0b8abd0f2797f4942a28866d9e
commit: 1d4c0e9d617182a90eb506db56bff1b70f01c2ed [21/44] drivers/mtd: add esp32 MTD support
config: alpha-kismet-CONFIG_ESP32_IPC-CONFIG_MTD_ESP32-0-0 (https://download.01.org/0day-ci/archive/20240202/202402022032.iXp8O6LL-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20240202/202402022032.iXp8O6LL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402022032.iXp8O6LL-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for ESP32_IPC when selected by MTD_ESP32
   .config:239:warning: symbol value 'n' invalid for SATA_MOBILE_LPM_POLICY
   .config:333:warning: symbol value 'n' invalid for PSTORE_BLK_MAX_REASON
   .config:360:warning: symbol value 'n' invalid for SQUASHFS_FRAGMENT_CACHE_SIZE
   .config:426:warning: symbol value 'n' invalid for KFENCE_SAMPLE_INTERVAL
   .config:450:warning: symbol value 'n' invalid for AIC79XX_DEBUG_MASK
   .config:499:warning: symbol value 'n' invalid for FB_OMAP2_NUM_FBS
   .config:603:warning: symbol value 'n' invalid for DRM_XE_JOB_TIMEOUT_MIN
   .config:610:warning: symbol value 'n' invalid for CRYPTO_DEV_QCE_SW_MAX_LEN
   .config:646:warning: symbol value 'n' invalid for CFAG12864B_RATE
   .config:712:warning: symbol value 'n' invalid for PANEL_LCD_CHARSET
   .config:775:warning: symbol value 'n' invalid for SND_AC97_POWER_SAVE_DEFAULT
   .config:801:warning: symbol value 'n' invalid for MAGIC_SYSRQ_DEFAULT_ENABLE
   .config:819:warning: symbol value 'n' invalid for DRM_I915_MAX_REQUEST_BUSYWAIT
   .config:861:warning: symbol value 'n' invalid for SND_AT73C213_TARGET_BITRATE
   .config:869:warning: symbol value 'n' invalid for AIC79XX_CMDS_PER_DEVICE
   .config:879:warning: symbol value 'n' invalid for DRM_XE_PREEMPT_TIMEOUT_MIN
   .config:891:warning: symbol value 'n' invalid for VMCP_CMA_SIZE
   .config:950:warning: symbol value 'n' invalid for PANEL_LCD_PIN_SDA
   .config:954:warning: symbol value 'n' invalid for FAT_DEFAULT_CODEPAGE
   .config:1112:warning: symbol value 'n' invalid for RCU_CPU_STALL_TIMEOUT
   .config:1141:warning: symbol value 'n' invalid for MTDRAM_ERASE_SIZE
   .config:1214:warning: symbol value 'n' invalid for SERIAL_UARTLITE_NR_UARTS
   .config:1363:warning: symbol value 'n' invalid for LEGACY_PTY_COUNT
   .config:1511:warning: symbol value 'n' invalid for AIC7XXX_RESET_DELAY_MS
   .config:1645:warning: symbol value 'n' invalid for INPUT_MOUSEDEV_SCREEN_Y
   .config:1652:warning: symbol value 'n' invalid for BLK_DEV_LOOP_MIN_COUNT
   .config:1701:warning: symbol value 'n' invalid for IBM_EMAC_POLL_WEIGHT
   .config:1768:warning: symbol value 'n' invalid for DRM_I915_STOP_TIMEOUT
   .config:1941:warning: symbol value 'n' invalid for CMA_SIZE_MBYTES
   .config:2011:warning: symbol value 'n' invalid for USB_GADGET_STORAGE_NUM_BUFFERS
   .config:2059:warning: symbol value 'n' invalid for SND_HDA_PREALLOC_SIZE
   .config:2076:warning: symbol value 'n' invalid for KCOV_IRQ_AREA_SIZE
   .config:2107:warning: symbol value 'n' invalid for RCU_FANOUT_LEAF
   .config:2174:warning: symbol value 'n' invalid for DRM_XE_TIMESLICE_MAX
   .config:2249:warning: symbol value 'n' invalid for PANEL_LCD_BWIDTH
   .config:2301:warning: symbol value 'n' invalid for AIC7XXX_DEBUG_MASK
   .config:2478:warning: symbol value 'n' invalid for PANEL_PARPORT
   .config:2479:warning: symbol value 'n' invalid for PANEL_LCD_PIN_E
   .config:2563:warning: symbol value 'n' invalid for NOUVEAU_DEBUG_DEFAULT
   .config:2635:warning: symbol value 'n' invalid for SND_SOC_SOF_DEBUG_IPC_FLOOD_TEST_NUM
   .config:2745:warning: symbol value 'n' invalid for KCSAN_REPORT_ONCE_IN_MS
   .config:2840:warning: symbol value 'n' invalid for KCSAN_UDELAY_INTERRUPT
   .config:2864:warning: symbol value 'n' invalid for PANEL_LCD_PIN_BL
   .config:2887:warning: symbol value 'n' invalid for INITRAMFS_ROOT_GID
   .config:2949:warning: symbol value 'n' invalid for PSTORE_BLK_CONSOLE_SIZE
   .config:2989:warning: symbol value 'n' invalid for ATM_FORE200E_TX_RETRY
   .config:3029:warning: symbol value 'n' invalid for FB_OMAP2_DSS_MIN_FCK_PER_PCK
   .config:3065:warning: symbol value 'n' invalid for BOOKE_WDT_DEFAULT_TIMEOUT
   .config:3235:warning: symbol value 'n' invalid for KCSAN_UDELAY_TASK
   .config:3358:warning: symbol value 'n' invalid for MMC_BLOCK_MINORS
   .config:3361:warning: symbol value 'n' invalid for INET_TABLE_PERTURB_ORDER
   .config:3402:warning: symbol value 'n' invalid for SCSI_NCR53C8XX_SYNC
   .config:3476:warning: symbol value 'n' invalid for AIC79XX_RESET_DELAY_MS
   .config:3522:warning: symbol value 'n' invalid for UCLAMP_BUCKETS_COUNT
   .config:3565:warning: symbol value 'n' invalid for SERIAL_MCF_BAUDRATE
   .config:3609:warning: symbol value 'n' invalid for STACK_MAX_DEFAULT_SIZE_MB
   .config:3635:warning: symbol value 'n' invalid for DE2104X_DSL
   .config:3645:warning: symbol value 'n' invalid for BLK_DEV_RAM_COUNT
   .config:3879:warning: symbol value 'n' invalid for IP_VS_SH_TAB_BITS
   .config:4012:warning: symbol value 'n' invalid for USBIP_VHCI_HC_PORTS
   .config:4033:warning: symbol value 'n' invalid for CMA_AREAS
   .config:4088:warning: symbol value 'n' invalid for INPUT_MOUSEDEV_SCREEN_X
   .config:4198:warning: symbol value 'n' invalid for RIONET_RX_SIZE
   .config:4313:warning: symbol value 'n' invalid for RADIO_TYPHOON_PORT
   .config:4429:warning: symbol value 'n' invalid for SERIAL_TXX9_NR_UARTS
   .config:4443:warning: symbol value 'n' invalid for VGA_ARB_MAX_GPUS
   .config:4498:warning: symbol value 'n' invalid for IBM_EMAC_TXB
   .config:4878:warning: symbol value 'n' invalid for ARCH_MMAP_RND_BITS
   .config:4958:warning: symbol value 'n' invalid for DRM_I915_FENCE_TIMEOUT
   .config:4979:warning: symbol value 'n' invalid for TTY_PRINTK_LEVEL
   .config:4986:warning: symbol value 'n' invalid for FTRACE_RECORD_RECURSION_SIZE
   .config:5129:warning: symbol value 'n' invalid for MIPS_EJTAG_FDC_KGDB_CHAN
   .config:5220:warning: symbol value 'n' invalid for KDB_DEFAULT_ENABLE
   .config:5237:warning: symbol value 'n' invalid for SERIAL_ALTERA_UART_MAXPORTS
   .config:5259:warning: symbol value 'n' invalid for PPC_EARLY_DEBUG_EHV_BC_HANDLE
   .config:5351:warning: symbol value 'n' invalid for SERIAL_ALTERA_UART_BAUDRATE
   .config:5408:warning: symbol value 'n' invalid for CRYPTO_DEV_FSL_CAAM_INTC_TIME_THLD
   .config:5493:warning: symbol value 'n' invalid for PANEL_LCD_HWIDTH
   .config:5523:warning: symbol value 'n' invalid for LOCKDEP_CHAINS_BITS
   .config:5604:warning: symbol value 'n' invalid for IP_VS_MH_TAB_INDEX
   .config:5612:warning: symbol value 'n' invalid for DRM_I915_HEARTBEAT_INTERVAL
   .config:5620:warning: symbol value 'n' invalid for KCSAN_SKIP_WATCH
   .config:5643:warning: symbol value 'n' invalid for PSTORE_BLK_KMSG_SIZE
   .config:5835:warning: symbol value 'n' invalid for SERIAL_8250_RUNTIME_UARTS
   .config:5930:warning: symbol value 'n' invalid for ARCH_MMAP_RND_COMPAT_BITS
   .config:5993:warning: symbol value 'n' invalid for PANEL_LCD_PIN_RW
   .config:6031:warning: symbol value 'n' invalid for SERIAL_SH_SCI_NR_UARTS
   .config:6093:warning: symbol value 'n' invalid for RADIO_TRUST_PORT
   .config:6458:warning: symbol value 'n' invalid for CMA_SIZE_PERCENTAGE
   .config:6489:warning: symbol value 'n' invalid for SND_MAX_CARDS
   .config:6574:warning: symbol value 'n' invalid for SCSI_NCR53C8XX_MAX_TAGS
   .config:6576:warning: symbol value 'n' invalid for DVB_MAX_ADAPTERS
   .config:6598:warning: symbol value 'n' invalid for SCSI_SYM53C8XX_DMA_ADDRESSING_MODE
   .config:6599:warning: symbol value 'n' invalid for DRM_XE_TIMESLICE_MIN
   .config:6651:warning: symbol value 'n' invalid for RCU_BOOST_DELAY
   .config:6756:warning: symbol value 'n' invalid for ZSMALLOC_CHAIN_SIZE
   .config:6909:warning: symbol value 'n' invalid for LOCKDEP_BITS
   .config:6938:warning: symbol value 'n' invalid for IBM_EMAC_RXB
   .config:6962:warning: symbol value 'n' invalid for DRM_XE_PREEMPT_TIMEOUT_MAX
   .config:7053:warning: symbol value 'n' invalid for SERIAL_ARC_NR_PORTS

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
