Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BEB34CB58
	for <oe-kbuild-all@lists.linux.dev>; Fri,  9 Feb 2024 13:59:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707487171; cv=none; b=XmDtxjICK2wcesCPnhGteKPHeQ1u+jB4ADX5foIHcPKW5M2JIUVaaGb5E/zZ8e53oSLBos+ePKzcqcvwP4OT/HiGg/FNSCga3ptUF6Eth221vnP2GkQZqw5wjvgKlOFRTW/6kjY9IR05p/jvJwbx9HcqeY/yNAyaZEuIK+RTN+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707487171; c=relaxed/simple;
	bh=04/MG8d+MwI5YUHiihGDDp4VIK1PZI5OEPMnNw7TWpY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Vg2ishX7PqtVHtIfjfwsk9+/uqyGfnMjMPiX0M7WKzT86lqeQmEoDc+UA6mpJ0JThRuc8n5V3yg2/JK2NE9OEtmonEUCcSeviHkiD2XCt7gAyEyRfHJgX/8Xv8BeWJ7Q4WSozt0ttovPGU53Wkb1zlukonAVJvog9u8V3YZkvPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=I3oUVf0x; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I3oUVf0x"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707487169; x=1739023169;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=04/MG8d+MwI5YUHiihGDDp4VIK1PZI5OEPMnNw7TWpY=;
  b=I3oUVf0x9LLP+aEaJ1Kahjf5XN8ayxh4jfe8fMZYLAXB6fiVQgnhhfUh
   zFKEN8nvo5hvlvST1Tu+rSuW5oxBdOb0Lfoive1aVSDoOpnX2l1iak/c1
   QJ5sAYeJGqzo7Iwq/h5mqaeMoFTLslAtZJH/j7Gimuu6gdZcgfKWsX3Ix
   Z7sxKQGKjdf4kUd6L9oAlwgJ9ALQrpDEd1EVye4/r1VXQysV4IQ83sxlE
   Thu/tEd65F/s55ORPn4FcYxslSXVVrauWvhLeDDFlkXLexHvm7MeDEbG5
   3CoM6DaFBhivDi27YJcSsM0sBQbKOZniDSJAmDYAouMzI99dS1d1jQFm2
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10978"; a="1322464"
X-IronPort-AV: E=Sophos;i="6.05,257,1701158400"; 
   d="scan'208";a="1322464"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2024 05:59:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,257,1701158400"; 
   d="scan'208";a="1929504"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 09 Feb 2024 05:59:26 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rYRPY-0004lK-0y;
	Fri, 09 Feb 2024 13:59:24 +0000
Date: Fri, 9 Feb 2024 21:59:01 +0800
From: kernel test robot <lkp@intel.com>
To: Duje =?utf-8?Q?Mihanovi=C4=87?= <duje.mihanovic@skole.hr>
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Lee Jones <lee@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Daniel Thompson <daniel.thompson@linaro.org>
Subject: [linux-next:master 3005/5901] kismet: WARNING: unmet direct
 dependencies detected for LEDS_EXPRESSWIRE when selected by LEDS_KTD2692
Message-ID: <202402092153.bTekesmI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   445a555e0623387fa9b94e68e61681717e70200a
commit: e59a15af7aa690fa0997758df23069a9f0756c49 [3005/5901] leds: ktd2692: Convert to use ExpressWire library
config: alpha-kismet-CONFIG_LEDS_EXPRESSWIRE-CONFIG_LEDS_KTD2692-0-0 (https://download.01.org/0day-ci/archive/20240209/202402092153.bTekesmI-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20240209/202402092153.bTekesmI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402092153.bTekesmI-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for LEDS_EXPRESSWIRE when selected by LEDS_KTD2692
   .config:108:warning: symbol value 'n' invalid for USB_GADGET_STORAGE_NUM_BUFFERS
   .config:248:warning: symbol value 'n' invalid for SATA_MOBILE_LPM_POLICY
   .config:350:warning: symbol value 'n' invalid for PSTORE_BLK_MAX_REASON
   .config:434:warning: symbol value 'n' invalid for KFENCE_SAMPLE_INTERVAL
   .config:506:warning: symbol value 'n' invalid for PANEL_LCD_PIN_E
   .config:547:warning: symbol value 'n' invalid for AIC79XX_DEBUG_MASK
   .config:619:warning: symbol value 'n' invalid for DRM_XE_JOB_TIMEOUT_MIN
   .config:637:warning: symbol value 'n' invalid for CRYPTO_DEV_QCE_SW_MAX_LEN
   .config:746:warning: symbol value 'n' invalid for PANEL_LCD_CHARSET
   .config:789:warning: symbol value 'n' invalid for SERIAL_AR933X_NR_UARTS
   .config:799:warning: symbol value 'n' invalid for SND_AC97_POWER_SAVE_DEFAULT
   .config:843:warning: symbol value 'n' invalid for MAGIC_SYSRQ_DEFAULT_ENABLE
   .config:857:warning: symbol value 'n' invalid for DRM_I915_MAX_REQUEST_BUSYWAIT
   .config:894:warning: symbol value 'n' invalid for SND_AT73C213_TARGET_BITRATE
   .config:908:warning: symbol value 'n' invalid for DRM_XE_PREEMPT_TIMEOUT_MIN
   .config:918:warning: symbol value 'n' invalid for NET_EMATCH_STACK
   .config:920:warning: symbol value 'n' invalid for VMCP_CMA_SIZE
   .config:991:warning: symbol value 'n' invalid for AIC79XX_CMDS_PER_DEVICE
   .config:1036:warning: symbol value 'n' invalid for PANEL_LCD_PIN_SDA
   .config:1151:warning: symbol value 'n' invalid for RCU_CPU_STALL_TIMEOUT
   .config:1180:warning: symbol value 'n' invalid for MTDRAM_ERASE_SIZE
   .config:1282:warning: symbol value 'n' invalid for SERIAL_UARTLITE_NR_UARTS
   .config:1447:warning: symbol value 'n' invalid for LEGACY_PTY_COUNT
   .config:1564:warning: symbol value 'n' invalid for AIC79XX_RESET_DELAY_MS
   .config:1592:warning: symbol value 'n' invalid for AIC7XXX_RESET_DELAY_MS
   .config:1763:warning: symbol value 'n' invalid for IBM_EMAC_POLL_WEIGHT
   .config:1887:warning: symbol value 'n' invalid for DRM_I915_STOP_TIMEOUT
   .config:2189:warning: symbol value 'n' invalid for RCU_FANOUT_LEAF
   .config:2197:warning: symbol value 'n' invalid for MTD_REDBOOT_DIRECTORY_BLOCK
   .config:2332:warning: symbol value 'n' invalid for PANEL_LCD_BWIDTH
   .config:2334:warning: symbol value 'n' invalid for DRM_XE_TIMESLICE_MAX
   .config:2372:warning: symbol value 'n' invalid for KCOV_IRQ_AREA_SIZE
   .config:2570:warning: symbol value 'n' invalid for PANEL_PARPORT
   .config:2658:warning: symbol value 'n' invalid for NOUVEAU_DEBUG_DEFAULT
   .config:2846:warning: symbol value 'n' invalid for KCSAN_REPORT_ONCE_IN_MS
   .config:2943:warning: symbol value 'n' invalid for KCSAN_UDELAY_INTERRUPT
   .config:2966:warning: symbol value 'n' invalid for PANEL_LCD_PIN_BL
   .config:2983:warning: symbol value 'n' invalid for DEBUG_OBJECTS_ENABLE_DEFAULT
   .config:2991:warning: symbol value 'n' invalid for INITRAMFS_ROOT_GID
   .config:3010:warning: symbol value 'n' invalid for SND_SOC_SOF_DEBUG_IPC_FLOOD_TEST_NUM
   .config:3095:warning: symbol value 'n' invalid for ATM_FORE200E_TX_RETRY
   .config:3132:warning: symbol value 'n' invalid for FB_OMAP2_DSS_MIN_FCK_PER_PCK
   .config:3327:warning: symbol value 'n' invalid for PSTORE_BLK_CONSOLE_SIZE
   .config:3366:warning: symbol value 'n' invalid for FTRACE_RECORD_RECURSION_SIZE
   .config:3416:warning: symbol value 'n' invalid for KCSAN_UDELAY_TASK
   .config:3474:warning: symbol value 'n' invalid for MMC_BLOCK_MINORS
   .config:3520:warning: symbol value 'n' invalid for SCSI_NCR53C8XX_SYNC
   .config:3521:warning: symbol value 'n' invalid for BOOKE_WDT_DEFAULT_TIMEOUT
   .config:3538:warning: symbol value 'n' invalid for XEN_MEMORY_HOTPLUG_LIMIT
   .config:3638:warning: symbol value 'n' invalid for UCLAMP_BUCKETS_COUNT
   .config:3761:warning: symbol value 'n' invalid for SERIAL_MCF_BAUDRATE
   .config:3829:warning: symbol value 'n' invalid for DE2104X_DSL
   .config:3844:warning: symbol value 'n' invalid for BLK_DEV_RAM_COUNT
   .config:4057:warning: symbol value 'n' invalid for STACK_MAX_DEFAULT_SIZE_MB
   .config:4097:warning: symbol value 'n' invalid for IP_VS_MH_TAB_INDEX
   .config:4103:warning: symbol value 'n' invalid for IP_VS_SH_TAB_BITS
   .config:4107:warning: symbol value 'n' invalid for VGA_ARB_MAX_GPUS
   .config:4173:warning: symbol value 'n' invalid for CMA_AREAS
   .config:4229:warning: symbol value 'n' invalid for INPUT_MOUSEDEV_SCREEN_X
   .config:4260:warning: symbol value 'n' invalid for USBIP_VHCI_HC_PORTS
   .config:4341:warning: symbol value 'n' invalid for RIONET_RX_SIZE
   .config:4580:warning: symbol value 'n' invalid for PANEL_LCD_PIN_RW
   .config:4585:warning: symbol value 'n' invalid for RADIO_TYPHOON_PORT
   .config:4655:warning: symbol value 'n' invalid for IBM_EMAC_TXB
   .config:4710:warning: symbol value 'n' invalid for SERIAL_TXX9_NR_UARTS
   .config:5043:warning: symbol value 'n' invalid for ARCH_MMAP_RND_BITS
   .config:5124:warning: symbol value 'n' invalid for DRM_I915_FENCE_TIMEOUT
   .config:5145:warning: symbol value 'n' invalid for TTY_PRINTK_LEVEL
   .config:5259:warning: symbol value 'n' invalid for SND_MAX_CARDS
   .config:5303:warning: symbol value 'n' invalid for MIPS_EJTAG_FDC_KGDB_CHAN
   .config:5396:warning: symbol value 'n' invalid for KDB_DEFAULT_ENABLE
   .config:5413:warning: symbol value 'n' invalid for SERIAL_ALTERA_UART_MAXPORTS
   .config:5431:warning: symbol value 'n' invalid for RCU_BOOST_DELAY
   .config:5583:warning: symbol value 'n' invalid for PPC_EARLY_DEBUG_EHV_BC_HANDLE
   .config:5684:warning: symbol value 'n' invalid for PANEL_LCD_HWIDTH
   .config:5714:warning: symbol value 'n' invalid for LOCKDEP_CHAINS_BITS
   .config:5802:warning: symbol value 'n' invalid for DRM_I915_HEARTBEAT_INTERVAL
   .config:5811:warning: symbol value 'n' invalid for KCSAN_SKIP_WATCH
   .config:5834:warning: symbol value 'n' invalid for PSTORE_BLK_KMSG_SIZE
   .config:5930:warning: symbol value 'n' invalid for DRM_XE_PREEMPT_TIMEOUT_MAX
   .config:6038:warning: symbol value 'n' invalid for SERIAL_8250_RUNTIME_UARTS
   .config:6077:warning: symbol value 'n' invalid for CRYPTO_DEV_FSL_CAAM_INTC_TIME_THLD
   .config:6135:warning: symbol value 'n' invalid for ARCH_MMAP_RND_COMPAT_BITS
   .config:6304:warning: symbol value 'n' invalid for RADIO_TRUST_PORT
   .config:6426:warning: symbol value 'n' invalid for SERIAL_SH_SCI_NR_UARTS
   .config:6455:warning: symbol value 'n' invalid for SCSI_SYM53C8XX_MAX_TAGS
   .config:6572:warning: symbol value 'n' invalid for RIONET_TX_SIZE
   .config:6685:warning: symbol value 'n' invalid for CMA_SIZE_PERCENTAGE
   .config:6827:warning: symbol value 'n' invalid for DRM_XE_TIMESLICE_MIN
   .config:6979:warning: symbol value 'n' invalid for SCSI_NCR53C8XX_MAX_TAGS
   .config:6984:warning: symbol value 'n' invalid for DVB_MAX_ADAPTERS
   .config:6989:warning: symbol value 'n' invalid for OMAP2_DSS_MIN_FCK_PER_PCK
   .config:7000:warning: symbol value 'n' invalid for SCSI_SYM53C8XX_DMA_ADDRESSING_MODE
   .config:7300:warning: symbol value 'n' invalid for SERIAL_ARC_NR_PORTS
   .config:7381:warning: symbol value 'n' invalid for IBM_EMAC_RXB
   .config:7475:warning: symbol value 'n' invalid for SCSI_MPT3SAS_MAX_SGE
   .config:7502:warning: symbol value 'n' invalid for ZSMALLOC_CHAIN_SIZE
   .config:7551:warning: symbol value 'n' invalid for KDB_CONTINUE_CATASTROPHIC
   .config:7583:warning: symbol value 'n' invalid for VIDEO_VIVID_MAX_DEVS
   .config:7607:warning: symbol value 'n' invalid for PSTORE_DEFAULT_KMSG_BYTES

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
