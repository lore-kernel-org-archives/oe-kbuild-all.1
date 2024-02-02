Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7013182B5
	for <oe-kbuild-all@lists.linux.dev>; Fri,  2 Feb 2024 08:35:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706862923; cv=none; b=QpW4uY0Vj/cqsvlpeptvEqZOPjWumWRIKKZMhKsIjb2beuaKsFeqT1ihyTKAnMzBe4tZEqw5+vPJhv/w5EVg00qm1Ue46i7EJvWuwSqzOdh4BfE3PIY5exR8LDgAb1QKfzu28WwfNz1BA9vQJ3F9qzBewLI9OuADgql9GG+Cta0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706862923; c=relaxed/simple;
	bh=dPugiWgAAEhpiYBQBMTNcFTYgGC1MV8jWXgzbUd9gwo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JIlUr3yBSO5Ii4jO8LJmY95z08uTpWbBQ8p/1crBe/CcAGf6x2Vf1Grv9GLpXuEeHJNdOVmLRFVsiDVTszL/3YLPYwypNxo3gOP/ANE5o/4UBwS9y/1YvGvDG8eDGKvRC88678Xbn72ROAzZgNXIQXeFbAybPdMWhuAQzDVetO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RYr9KBmY; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RYr9KBmY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706862922; x=1738398922;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dPugiWgAAEhpiYBQBMTNcFTYgGC1MV8jWXgzbUd9gwo=;
  b=RYr9KBmYbsDae1RA7yHkbt6GU+5S4xGBbWQPbPY7rfGa78TNF9YXut4X
   xSyLTw9RMqkqbzNrILD+fhAe8S8ZC8piwvdyfuKF4T09K2gk+uR+VHmKg
   fJbOlvgVPicjHlBQotLdEBEUatzfEAuG7GgI0ay0yEzskvsNbUqzBjtOs
   goKuhDEHABekkPjKI4cW2JuqE33c1rCwqtMCOes4YZzUYUHbZXujyLi1z
   S3g+E/cYiDcJbzZ9ZIYm7usAlQ6DeX5DKofjh8pscPbUb1D6L6ZrCrcsB
   JnTyOoRk3VTAmz/EL5Kc0Yv0Col77gT+W4fnEI7ypQS9A3w4QqtgVXp5P
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10971"; a="11478578"
X-IronPort-AV: E=Sophos;i="6.05,237,1701158400"; 
   d="scan'208";a="11478578"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Feb 2024 00:35:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10971"; a="962153251"
X-IronPort-AV: E=Sophos;i="6.05,237,1701158400"; 
   d="scan'208";a="962153251"
Received: from lkp-server02.sh.intel.com (HELO 59f4f4cd5935) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 02 Feb 2024 00:35:17 -0800
Received: from kbuild by 59f4f4cd5935 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rVp11-0003iI-1N;
	Fri, 02 Feb 2024 08:35:15 +0000
Date: Fri, 2 Feb 2024 16:35:04 +0800
From: kernel test robot <lkp@intel.com>
To: Max Filippov <jcmvbkbc@gmail.com>
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev
Subject: [jcmvbkbc-xtensa:xtensa-6.8-rc2-esp32 35/44] kismet: WARNING: unmet
 direct dependencies detected for ESP32_IPC when selected by ESP32_WIFI_SHMEM
Message-ID: <202402021658.1GDCtFN4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jcmvbkbc/linux-xtensa xtensa-6.8-rc2-esp32
head:   62ce2e36e80490aa6c2fbc6b28f166201107f25a
commit: 8ab3ed66b691770a8ae3c88ece2b28eed78aca7f [35/44] esp_wifi: add IPC transport
config: alpha-kismet-CONFIG_ESP32_IPC-CONFIG_ESP32_WIFI_SHMEM-0-0 (https://download.01.org/0day-ci/archive/20240202/202402021658.1GDCtFN4-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20240202/202402021658.1GDCtFN4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402021658.1GDCtFN4-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for ESP32_IPC when selected by ESP32_WIFI_SHMEM
   .config:10:warning: symbol value 'n' invalid for BLK_DEV_LOOP_MIN_COUNT
   .config:34:warning: symbol value 'n' invalid for FB_OMAP2_NUM_FBS
   .config:136:warning: symbol value 'n' invalid for CFAG12864B_RATE
   .config:197:warning: symbol value 'n' invalid for CMA_SIZE_MBYTES
   .config:239:warning: symbol value 'n' invalid for SATA_MOBILE_LPM_POLICY
   .config:338:warning: symbol value 'n' invalid for PSTORE_BLK_MAX_REASON
   .config:388:warning: symbol value 'n' invalid for RAPIDIO_DISC_TIMEOUT
   .config:414:warning: symbol value 'n' invalid for AIC79XX_DEBUG_MASK
   .config:434:warning: symbol value 'n' invalid for KFENCE_SAMPLE_INTERVAL
   .config:493:warning: symbol value 'n' invalid for AIC7XXX_DEBUG_MASK
   .config:616:warning: symbol value 'n' invalid for DRM_XE_JOB_TIMEOUT_MIN
   .config:622:warning: symbol value 'n' invalid for CRYPTO_DEV_QCE_SW_MAX_LEN
   .config:723:warning: symbol value 'n' invalid for PANEL_LCD_CHARSET
   .config:778:warning: symbol value 'n' invalid for AIC79XX_CMDS_PER_DEVICE
   .config:790:warning: symbol value 'n' invalid for SND_AC97_POWER_SAVE_DEFAULT
   .config:812:warning: symbol value 'n' invalid for MAGIC_SYSRQ_DEFAULT_ENABLE
   .config:831:warning: symbol value 'n' invalid for DRM_I915_MAX_REQUEST_BUSYWAIT
   .config:834:warning: symbol value 'n' invalid for PANEL_LCD_PIN_SDA
   .config:856:warning: symbol value 'n' invalid for SND_AT73C213_TARGET_BITRATE
   .config:892:warning: symbol value 'n' invalid for DRM_XE_PREEMPT_TIMEOUT_MIN
   .config:900:warning: symbol value 'n' invalid for NET_EMATCH_STACK
   .config:902:warning: symbol value 'n' invalid for VMCP_CMA_SIZE
   .config:1129:warning: symbol value 'n' invalid for RCU_CPU_STALL_TIMEOUT
   .config:1156:warning: symbol value 'n' invalid for MTDRAM_ERASE_SIZE
   .config:1176:warning: symbol value 'n' invalid for INPUT_MOUSEDEV_SCREEN_Y
   .config:1384:warning: symbol value 'n' invalid for LEGACY_PTY_COUNT
   .config:1495:warning: symbol value 'n' invalid for USB_GADGET_STORAGE_NUM_BUFFERS
   .config:1535:warning: symbol value 'n' invalid for AIC7XXX_RESET_DELAY_MS
   .config:1735:warning: symbol value 'n' invalid for IBM_EMAC_POLL_WEIGHT
   .config:1805:warning: symbol value 'n' invalid for DRM_I915_STOP_TIMEOUT
   .config:1958:warning: symbol value 'n' invalid for PANEL_LCD_PIN_E
   .config:2008:warning: symbol value 'n' invalid for KCOV_IRQ_AREA_SIZE
   .config:2139:warning: symbol value 'n' invalid for RCU_FANOUT_LEAF
   .config:2224:warning: symbol value 'n' invalid for DRM_XE_TIMESLICE_MAX
   .config:2287:warning: symbol value 'n' invalid for PANEL_LCD_BWIDTH
   .config:2500:warning: symbol value 'n' invalid for SND_SOC_SOF_DEBUG_IPC_FLOOD_TEST_NUM
   .config:2521:warning: symbol value 'n' invalid for PANEL_PARPORT
   .config:2605:warning: symbol value 'n' invalid for NOUVEAU_DEBUG_DEFAULT
   .config:2793:warning: symbol value 'n' invalid for KCSAN_REPORT_ONCE_IN_MS
   .config:2843:warning: symbol value 'n' invalid for PSTORE_BLK_CONSOLE_SIZE
   .config:2890:warning: symbol value 'n' invalid for KCSAN_UDELAY_INTERRUPT
   .config:2914:warning: symbol value 'n' invalid for PANEL_LCD_PIN_BL
   .config:2932:warning: symbol value 'n' invalid for DEBUG_OBJECTS_ENABLE_DEFAULT
   .config:2938:warning: symbol value 'n' invalid for INITRAMFS_ROOT_GID
   .config:2977:warning: symbol value 'n' invalid for BOOKE_WDT_DEFAULT_TIMEOUT
   .config:3041:warning: symbol value 'n' invalid for ATM_FORE200E_TX_RETRY
   .config:3076:warning: symbol value 'n' invalid for AIC79XX_RESET_DELAY_MS
   .config:3081:warning: symbol value 'n' invalid for FB_OMAP2_DSS_MIN_FCK_PER_PCK
   .config:3288:warning: symbol value 'n' invalid for KCSAN_UDELAY_TASK
   .config:3414:warning: symbol value 'n' invalid for MMC_BLOCK_MINORS
   .config:3417:warning: symbol value 'n' invalid for INET_TABLE_PERTURB_ORDER
   .config:3458:warning: symbol value 'n' invalid for SCSI_NCR53C8XX_SYNC
   .config:3575:warning: symbol value 'n' invalid for UCLAMP_BUCKETS_COUNT
   .config:3622:warning: symbol value 'n' invalid for SERIAL_MCF_BAUDRATE
   .config:3624:warning: symbol value 'n' invalid for STACK_MAX_DEFAULT_SIZE_MB
   .config:3635:warning: symbol value 'n' invalid for MTD_REDBOOT_DIRECTORY_BLOCK
   .config:3691:warning: symbol value 'n' invalid for DE2104X_DSL
   .config:3700:warning: symbol value 'n' invalid for BLK_DEV_RAM_COUNT
   .config:3938:warning: symbol value 'n' invalid for IP_VS_SH_TAB_BITS
   .config:4076:warning: symbol value 'n' invalid for USBIP_VHCI_HC_PORTS
   .config:4149:warning: symbol value 'n' invalid for INPUT_MOUSEDEV_SCREEN_X
   .config:4260:warning: symbol value 'n' invalid for RIONET_RX_SIZE
   .config:4393:warning: symbol value 'n' invalid for RADIO_TYPHOON_PORT
   .config:4507:warning: symbol value 'n' invalid for SERIAL_TXX9_NR_UARTS
   .config:4563:warning: symbol value 'n' invalid for IBM_EMAC_TXB
   .config:4595:warning: symbol value 'n' invalid for FTRACE_RECORD_RECURSION_SIZE
   .config:4944:warning: symbol value 'n' invalid for ARCH_MMAP_RND_BITS
   .config:5023:warning: symbol value 'n' invalid for DRM_I915_FENCE_TIMEOUT
   .config:5045:warning: symbol value 'n' invalid for TTY_PRINTK_LEVEL
   .config:5199:warning: symbol value 'n' invalid for MIPS_EJTAG_FDC_KGDB_CHAN
   .config:5290:warning: symbol value 'n' invalid for KDB_DEFAULT_ENABLE
   .config:5329:warning: symbol value 'n' invalid for IP_VS_MH_TAB_INDEX
   .config:5361:warning: symbol value 'n' invalid for CRYPTO_DEV_FSL_CAAM_INTC_TIME_THLD
   .config:5368:warning: symbol value 'n' invalid for PPC_EARLY_DEBUG_EHV_BC_HANDLE
   .config:5564:warning: symbol value 'n' invalid for PANEL_LCD_HWIDTH
   .config:5595:warning: symbol value 'n' invalid for LOCKDEP_CHAINS_BITS
   .config:5685:warning: symbol value 'n' invalid for DRM_I915_HEARTBEAT_INTERVAL
   .config:5693:warning: symbol value 'n' invalid for KCSAN_SKIP_WATCH
   .config:5715:warning: symbol value 'n' invalid for PSTORE_BLK_KMSG_SIZE
   .config:5761:warning: symbol value 'n' invalid for PANEL_LCD_PIN_RW
   .config:5915:warning: symbol value 'n' invalid for SERIAL_8250_RUNTIME_UARTS
   .config:6008:warning: symbol value 'n' invalid for ARCH_MMAP_RND_COMPAT_BITS
   .config:6154:warning: symbol value 'n' invalid for SERIAL_SH_SCI_NR_UARTS
   .config:6173:warning: symbol value 'n' invalid for RADIO_TRUST_PORT
   .config:6249:warning: symbol value 'n' invalid for SND_MAX_CARDS
   .config:6358:warning: symbol value 'n' invalid for RCU_BOOST_DELAY
   .config:6538:warning: symbol value 'n' invalid for CMA_SIZE_PERCENTAGE
   .config:6683:warning: symbol value 'n' invalid for DRM_XE_TIMESLICE_MIN
   .config:6693:warning: symbol value 'n' invalid for SCSI_NCR53C8XX_MAX_TAGS
   .config:6701:warning: symbol value 'n' invalid for DVB_MAX_ADAPTERS
   .config:6717:warning: symbol value 'n' invalid for SCSI_SYM53C8XX_DMA_ADDRESSING_MODE
   .config:6808:warning: symbol value 'n' invalid for DRM_XE_PREEMPT_TIMEOUT_MAX
   .config:7049:warning: symbol value 'n' invalid for LOCKDEP_BITS
   .config:7075:warning: symbol value 'n' invalid for IBM_EMAC_RXB
   .config:7140:warning: symbol value 'n' invalid for SERIAL_ARC_NR_PORTS
   .config:7222:warning: symbol value 'n' invalid for SCSI_SYM53C8XX_MAX_TAGS
   .config:7310:warning: symbol value 'n' invalid for SCSI_MPT3SAS_MAX_SGE
   .config:7322:warning: symbol value 'n' invalid for MTD_UBI_WL_THRESHOLD
   .config:7342:warning: symbol value 'n' invalid for RIONET_TX_SIZE
   .config:7433:warning: symbol value 'n' invalid for PANEL_LCD

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
