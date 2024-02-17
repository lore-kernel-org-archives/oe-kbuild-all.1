Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE1531C2BC
	for <oe-kbuild-all@lists.linux.dev>; Sat, 17 Feb 2024 06:49:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708152581; cv=none; b=hPiojjZB4apvB+rnjZSQMeiGq9IELpoyGZcCfy+eQ3RCmNpXfRklImo6+3PYk7Njw5G/dGA/5N+6boY4490kGGA/jr+3fMShJpFYx9ItHgkHvu/FpwJ+8LyFUWThUA7/WnEOw3o0mjFSXDkXcK3ugKzgCgEmGgPw0rKM5SDqgbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708152581; c=relaxed/simple;
	bh=vVznEHPRVh6PswjKHeLDGu8YVr+6LGlnXum6k0vWVao=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IU/z7kvYP+H6MopRLoOwKQXJ17RUM3DIjPOTgw0APxj5a0zHE8SJfeLxodlq6JJCL6XFSEAjGhDwhBAI0K3ibRmHf/yj4cIR6mHqljUyRCSftB8SZB3vwNxjWx84G79mdpbXRwBlL4cv05mpu79K5/hi29ZGYNzo/cWsxy/ri18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=j2Yd9tCZ; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="j2Yd9tCZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708152579; x=1739688579;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vVznEHPRVh6PswjKHeLDGu8YVr+6LGlnXum6k0vWVao=;
  b=j2Yd9tCZ+qJzo9p60jSGk+J7pp7TYcXskgYt64+QIL4gsQ8MVuoTG8Sm
   qCtWnDSt/xFINOIlbQx5pEDf5OcLaCdxz/+R8oXB5nAHgCoNGn0CX9x0n
   MHDytegZDKILjVV47Uha5XRPqNOWouFhnND2vKY9cOyrpD9D5+zd85JCj
   +TIqQELE3z59p60jEUy9EBph4rZ0SDWDJK5LAmt+Q2h+c6rhWyHF0hE66
   kQ9aqcYfQFLYyR4tiY9yEdhhCNBBsCDuAYqJ7Fs7wMs9EmXascD1EF19o
   z4knFhSrgyHFrPaWsN8FdMmxrIr6CL0DFQD91brM73rMSEO6sYY38KQoL
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10986"; a="24757034"
X-IronPort-AV: E=Sophos;i="6.06,165,1705392000"; 
   d="scan'208";a="24757034"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2024 22:49:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,165,1705392000"; 
   d="scan'208";a="8635387"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 16 Feb 2024 22:49:35 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rbEVx-0001uC-2T;
	Sat, 17 Feb 2024 06:49:33 +0000
Date: Sat, 17 Feb 2024 14:48:55 +0800
From: kernel test robot <lkp@intel.com>
To: Baoquan He <bhe@redhat.com>
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [akpm-mm:mm-unstable 82/320] kismet: WARNING: unmet direct
 dependencies detected for CRASH_DUMP when selected by FA_DUMP
Message-ID: <202402171431.MzqHz3g2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-unstable
head:   9951769060d8f5eb001acaca67c1439d2cfe1c6b
commit: a5af0b602e5ecb379fd2470669654a6abe7e97a2 [82/320] crash: clean up kdump related config items
config: powerpc-kismet-CONFIG_CRASH_DUMP-CONFIG_FA_DUMP-0-0 (https://download.01.org/0day-ci/archive/20240217/202402171431.MzqHz3g2-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20240217/202402171431.MzqHz3g2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402171431.MzqHz3g2-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for CRASH_DUMP when selected by FA_DUMP
   .config:33:warning: symbol value 'n' invalid for AIC79XX_DEBUG_MASK
   .config:80:warning: symbol value 'n' invalid for PHYSICAL_START
   .config:254:warning: symbol value 'n' invalid for SATA_MOBILE_LPM_POLICY
   .config:400:warning: symbol value 'n' invalid for AIC79XX_CMDS_PER_DEVICE
   .config:407:warning: symbol value 'n' invalid for PPC_EARLY_DEBUG_16550_PHYSADDR
   .config:443:warning: symbol value 'n' invalid for PANEL_LCD_PIN_SDA
   .config:458:warning: symbol value 'n' invalid for KFENCE_SAMPLE_INTERVAL
   .config:550:warning: symbol value 'n' invalid for PPC_EARLY_DEBUG_HVSI_VTERMNO
   .config:577:warning: symbol value 'n' invalid for PAGE_OFFSET
   .config:631:warning: symbol value 'n' invalid for INPUT_MOUSEDEV_SCREEN_Y
   .config:652:warning: symbol value 'n' invalid for DRM_XE_JOB_TIMEOUT_MIN
   .config:665:warning: symbol value 'n' invalid for CRYPTO_DEV_QCE_SW_MAX_LEN
   .config:709:warning: symbol value 'n' invalid for DATA_SHIFT
   .config:777:warning: symbol value 'n' invalid for PANEL_LCD_CHARSET
   .config:839:warning: symbol value 'n' invalid for SND_AC97_POWER_SAVE_DEFAULT
   .config:887:warning: symbol value 'n' invalid for MAGIC_SYSRQ_DEFAULT_ENABLE
   .config:901:warning: symbol value 'n' invalid for DRM_I915_MAX_REQUEST_BUSYWAIT
   .config:938:warning: symbol value 'n' invalid for SND_AT73C213_TARGET_BITRATE
   .config:956:warning: symbol value 'n' invalid for DRM_XE_PREEMPT_TIMEOUT_MIN
   .config:964:warning: symbol value 'n' invalid for NET_EMATCH_STACK
   .config:966:warning: symbol value 'n' invalid for VMCP_CMA_SIZE
   .config:980:warning: symbol value 'n' invalid for USB_GADGET_STORAGE_NUM_BUFFERS
   .config:1141:warning: symbol value 'n' invalid for X86_AMD_PSTATE_DEFAULT_MODE
   .config:1242:warning: symbol value 'n' invalid for MTDRAM_ERASE_SIZE
   .config:1322:warning: symbol value 'n' invalid for SERIAL_UARTLITE_NR_UARTS
   .config:1440:warning: symbol value 'n' invalid for PANEL_LCD_PIN_E
   .config:1504:warning: symbol value 'n' invalid for LEGACY_PTY_COUNT
   .config:1590:warning: symbol value 'n' invalid for SERIAL_ALTERA_UART_BAUDRATE
   .config:1641:warning: symbol value 'n' invalid for LOWMEM_CAM_NUM
   .config:1679:warning: symbol value 'n' invalid for AIC7XXX_RESET_DELAY_MS
   .config:1755:warning: symbol value 'n' invalid for PPC_MEMCONS_OUTPUT_SIZE
   .config:1841:warning: symbol value 'n' invalid for LOWMEM_SIZE
   .config:1848:warning: symbol value 'n' invalid for KCOV_IRQ_AREA_SIZE
   .config:1864:warning: symbol value 'n' invalid for IBM_EMAC_POLL_WEIGHT
   .config:1972:warning: symbol value 'n' invalid for DRM_I915_STOP_TIMEOUT
   .config:2260:warning: symbol value 'n' invalid for SND_HDA_PREALLOC_SIZE
   .config:2331:warning: symbol value 'n' invalid for SND_SOC_SOF_DEBUG_IPC_FLOOD_TEST_NUM
   .config:2376:warning: symbol value 'n' invalid for XEN_MEMORY_HOTPLUG_LIMIT
   .config:2426:warning: symbol value 'n' invalid for DRM_XE_TIMESLICE_MAX
   .config:2461:warning: symbol value 'n' invalid for PANEL_LCD_BWIDTH
   .config:2592:warning: symbol value 'n' invalid for AIC79XX_RESET_DELAY_MS
   .config:2712:warning: symbol value 'n' invalid for PANEL_PARPORT
   .config:2756:warning: symbol value 'n' invalid for PSTORE_BLK_CONSOLE_SIZE
   .config:2810:warning: symbol value 'n' invalid for NOUVEAU_DEBUG_DEFAULT
   .config:2993:warning: symbol value 'n' invalid for BOOKE_WDT_DEFAULT_TIMEOUT
   .config:3021:warning: symbol value 'n' invalid for KCSAN_REPORT_ONCE_IN_MS
   .config:3128:warning: symbol value 'n' invalid for KCSAN_UDELAY_INTERRUPT
   .config:3150:warning: symbol value 'n' invalid for PANEL_LCD_PIN_BL
   .config:3171:warning: symbol value 'n' invalid for DEBUG_OBJECTS_ENABLE_DEFAULT
   .config:3178:warning: symbol value 'n' invalid for INITRAMFS_ROOT_GID
   .config:3276:warning: symbol value 'n' invalid for MTD_REDBOOT_DIRECTORY_BLOCK
   .config:3293:warning: symbol value 'n' invalid for ATM_FORE200E_TX_RETRY
   .config:3332:warning: symbol value 'n' invalid for FB_OMAP2_DSS_MIN_FCK_PER_PCK
   .config:3564:warning: symbol value 'n' invalid for KCSAN_UDELAY_TASK
   .config:3680:warning: symbol value 'n' invalid for STACK_MAX_DEFAULT_SIZE_MB
   .config:3699:warning: symbol value 'n' invalid for MMC_BLOCK_MINORS
   .config:3703:warning: symbol value 'n' invalid for INET_TABLE_PERTURB_ORDER
   .config:3747:warning: symbol value 'n' invalid for SCSI_NCR53C8XX_SYNC
   .config:3875:warning: symbol value 'n' invalid for UCLAMP_BUCKETS_COUNT
   .config:3883:warning: symbol value 'n' invalid for THREAD_SHIFT
   .config:3931:warning: symbol value 'n' invalid for SERIAL_MCF_BAUDRATE
   .config:3985:warning: symbol value 'n' invalid for PPC_MEMCONS_INPUT_SIZE
   .config:4007:warning: symbol value 'n' invalid for DE2104X_DSL
   .config:4020:warning: symbol value 'n' invalid for BLK_DEV_RAM_COUNT
   .config:4332:warning: symbol value 'n' invalid for FTRACE_RECORD_RECURSION_SIZE
   .config:4406:warning: symbol value 'n' invalid for USBIP_VHCI_HC_PORTS
   .config:4483:warning: symbol value 'n' invalid for INPUT_MOUSEDEV_SCREEN_X
   .config:4603:warning: symbol value 'n' invalid for RIONET_RX_SIZE
   .config:4764:warning: symbol value 'n' invalid for RADIO_TYPHOON_PORT
   .config:4880:warning: symbol value 'n' invalid for SERIAL_TXX9_NR_UARTS
   .config:4930:warning: symbol value 'n' invalid for IBM_EMAC_TXB
   .config:5329:warning: symbol value 'n' invalid for PPC_EARLY_DEBUG_CPM_ADDR
   .config:5334:warning: symbol value 'n' invalid for ARCH_MMAP_RND_BITS
   .config:5419:warning: symbol value 'n' invalid for DRM_I915_FENCE_TIMEOUT
   .config:5443:warning: symbol value 'n' invalid for TTY_PRINTK_LEVEL
   .config:5605:warning: symbol value 'n' invalid for MIPS_EJTAG_FDC_KGDB_CHAN
   .config:5620:warning: symbol value 'n' invalid for CRYPTO_DEV_FSL_CAAM_INTC_TIME_THLD
   .config:5639:warning: symbol value 'n' invalid for PANEL_LCD_PIN_RW
   .config:5704:warning: symbol value 'n' invalid for KDB_DEFAULT_ENABLE
   .config:5722:warning: symbol value 'n' invalid for SERIAL_ALTERA_UART_MAXPORTS
   .config:5809:warning: symbol value 'n' invalid for PPC_EARLY_DEBUG_EHV_BC_HANDLE
   .config:5999:warning: symbol value 'n' invalid for PANEL_LCD_HWIDTH
   .config:6030:warning: symbol value 'n' invalid for LOCKDEP_CHAINS_BITS
   .config:6127:warning: symbol value 'n' invalid for DRM_I915_HEARTBEAT_INTERVAL
   .config:6134:warning: symbol value 'n' invalid for KCSAN_SKIP_WATCH
   .config:6241:warning: symbol value 'n' invalid for SND_MAX_CARDS
   .config:6397:warning: symbol value 'n' invalid for RCU_BOOST_DELAY
   .config:6477:warning: symbol value 'n' invalid for ARCH_MMAP_RND_COMPAT_BITS
   .config:6630:warning: symbol value 'n' invalid for SERIAL_SH_SCI_NR_UARTS
   .config:6651:warning: symbol value 'n' invalid for RADIO_TRUST_PORT
   .config:6797:warning: symbol value 'n' invalid for DRM_XE_PREEMPT_TIMEOUT_MAX
   .config:7057:warning: symbol value 'n' invalid for CMA_SIZE_PERCENTAGE
   .config:7181:warning: symbol value 'n' invalid for DVB_MAX_ADAPTERS
   .config:7189:warning: symbol value 'n' invalid for SCSI_NCR53C8XX_MAX_TAGS
   .config:7200:warning: symbol value 'n' invalid for SCSI_SYM53C8XX_DMA_ADDRESSING_MODE
   .config:7219:warning: symbol value 'n' invalid for DRM_XE_TIMESLICE_MIN
   .config:7359:warning: symbol value 'n' invalid for SCSI_SYM53C8XX_MAX_TAGS
   .config:7465:warning: symbol value 'n' invalid for RIONET_TX_SIZE
   .config:7545:warning: symbol value 'n' invalid for LOCKDEP_BITS
   .config:7577:warning: symbol value 'n' invalid for IBM_EMAC_RXB

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
