Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8774664CA
	for <oe-kbuild-all@lists.linux.dev>; Fri,  9 Feb 2024 09:24:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707470664; cv=none; b=oVa+51ym4YWvZZc6OKeseWnrcbNuaOuW5hmd0LhEK+2sBDtHDc8trku/iQ+YxZ39w9xhEAVEGaEqdGp9gz0fQwVWBgyTetc2lgtVKdxp+8mmBrYwrY1lHBoZX44NGBgx/2+3oO1IXm6472hxNLTyxswa25kUq6QHv8CrdHvagq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707470664; c=relaxed/simple;
	bh=KDxYBhFeBmDX20Bd3U/QPCNyl7BwBigC5yLiz0b8N3E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ermXt8Fyb2jqnwCVHHSb1u7i/BufMDA2EvetxWUDZNz8HuFotW3lLR3ffhjReebwiOjsvZlPdsWwo3imeMMoOh5IqiTX0802QNMikkPXC3dPdK1z9BKiRqnfFeUh9e8rk5alSBzJxSiTp2rwua2PWLjUlquNs0C83MGHgEfXru0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dm4PUPVb; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dm4PUPVb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707470662; x=1739006662;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KDxYBhFeBmDX20Bd3U/QPCNyl7BwBigC5yLiz0b8N3E=;
  b=dm4PUPVbCDem0uuXeox8IEZuV5qqqD4bVecQTDpK8ilqiycEi5CBs/yV
   0aFqJeSwWvUJkOymQ5s/oDU1EBItbLuPoOVd2m/zT3ERP8AEERWXCe85V
   959fpjXCCS6y9/7QafPaZ6dzMuVhHW83oUKujV0WDZsNKxZemMdGoGTCe
   yld80zzyHV6hgx0NOQ26py9L9s/FVUARDNIbS6w9Q3dOnmQiHZFKC20uJ
   +WPrNuxD0p1hxZ7ASHcJDkil8KsaJAGznNiKtG5rQZrRYHAsKFB7FHCe/
   gkqELnNnH4R/i2hYvOZO1C9OUilzygPEm+KZNx+eQj/dThYctbgICPxog
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10978"; a="1550724"
X-IronPort-AV: E=Sophos;i="6.05,256,1701158400"; 
   d="scan'208";a="1550724"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2024 01:24:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,256,1701158400"; 
   d="scan'208";a="1873738"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 09 Feb 2024 01:24:19 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rYN7I-0004Z4-2f;
	Fri, 09 Feb 2024 09:24:16 +0000
Date: Fri, 9 Feb 2024 17:23:51 +0800
From: kernel test robot <lkp@intel.com>
To: Duje =?utf-8?Q?Mihanovi=C4=87?= <duje.mihanovic@skole.hr>
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Lee Jones <lee@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Daniel Thompson <daniel.thompson@linaro.org>
Subject: [linux-next:master 3007/5901] kismet: WARNING: unmet direct
 dependencies detected for LEDS_EXPRESSWIRE when selected by
 BACKLIGHT_KTD2801
Message-ID: <202402091752.dGmPjA49-lkp@intel.com>
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
commit: 66c76c1cd984c14660453dfa2118014817924375 [3007/5901] backlight: Add Kinetic KTD2801 backlight support
config: alpha-kismet-CONFIG_LEDS_EXPRESSWIRE-CONFIG_BACKLIGHT_KTD2801-0-0 (https://download.01.org/0day-ci/archive/20240209/202402091752.dGmPjA49-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20240209/202402091752.dGmPjA49-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402091752.dGmPjA49-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for LEDS_EXPRESSWIRE when selected by BACKLIGHT_KTD2801
   .config:258:warning: symbol value 'n' invalid for SATA_MOBILE_LPM_POLICY
   .config:360:warning: symbol value 'n' invalid for PSTORE_BLK_MAX_REASON
   .config:447:warning: symbol value 'n' invalid for KFENCE_SAMPLE_INTERVAL
   .config:472:warning: symbol value 'n' invalid for AIC79XX_DEBUG_MASK
   .config:635:warning: symbol value 'n' invalid for DRM_XE_JOB_TIMEOUT_MIN
   .config:667:warning: symbol value 'n' invalid for CRYPTO_DEV_QCE_SW_MAX_LEN
   .config:778:warning: symbol value 'n' invalid for PANEL_LCD_CHARSET
   .config:818:warning: symbol value 'n' invalid for SND_AC97_POWER_SAVE_DEFAULT
   .config:849:warning: symbol value 'n' invalid for AIC79XX_RESET_DELAY_MS
   .config:876:warning: symbol value 'n' invalid for MAGIC_SYSRQ_DEFAULT_ENABLE
   .config:891:warning: symbol value 'n' invalid for DRM_I915_MAX_REQUEST_BUSYWAIT
   .config:912:warning: symbol value 'n' invalid for SND_AT73C213_TARGET_BITRATE
   .config:930:warning: symbol value 'n' invalid for DRM_XE_PREEMPT_TIMEOUT_MIN
   .config:940:warning: symbol value 'n' invalid for NET_EMATCH_STACK
   .config:942:warning: symbol value 'n' invalid for VMCP_CMA_SIZE
   .config:947:warning: symbol value 'n' invalid for AIC79XX_CMDS_PER_DEVICE
   .config:1033:warning: symbol value 'n' invalid for PANEL_LCD_PIN_SDA
   .config:1177:warning: symbol value 'n' invalid for RCU_CPU_STALL_TIMEOUT
   .config:1206:warning: symbol value 'n' invalid for MTDRAM_ERASE_SIZE
   .config:1325:warning: symbol value 'n' invalid for SERIAL_UARTLITE_NR_UARTS
   .config:1417:warning: symbol value 'n' invalid for MTD_REDBOOT_DIRECTORY_BLOCK
   .config:1499:warning: symbol value 'n' invalid for LEGACY_PTY_COUNT
   .config:1645:warning: symbol value 'n' invalid for AIC7XXX_RESET_DELAY_MS
   .config:1654:warning: symbol value 'n' invalid for WATCHDOG_OPEN_TIMEOUT
   .config:1797:warning: symbol value 'n' invalid for IBM_EMAC_POLL_WEIGHT
   .config:1953:warning: symbol value 'n' invalid for DRM_I915_STOP_TIMEOUT
   .config:2176:warning: symbol value 'n' invalid for SND_HDA_PREALLOC_SIZE
   .config:2225:warning: symbol value 'n' invalid for RCU_FANOUT_LEAF
   .config:2358:warning: symbol value 'n' invalid for KCOV_IRQ_AREA_SIZE
   .config:2375:warning: symbol value 'n' invalid for PANEL_LCD_BWIDTH
   .config:2406:warning: symbol value 'n' invalid for DRM_XE_TIMESLICE_MAX
   .config:2618:warning: symbol value 'n' invalid for PANEL_PARPORT
   .config:2653:warning: symbol value 'n' invalid for FTRACE_RECORD_RECURSION_SIZE
   .config:2705:warning: symbol value 'n' invalid for NOUVEAU_DEBUG_DEFAULT
   .config:2900:warning: symbol value 'n' invalid for KCSAN_REPORT_ONCE_IN_MS
   .config:2984:warning: symbol value 'n' invalid for SND_SOC_SOF_DEBUG_IPC_FLOOD_TEST_NUM
   .config:3001:warning: symbol value 'n' invalid for KCSAN_UDELAY_INTERRUPT
   .config:3017:warning: symbol value 'n' invalid for SERIAL_AR933X_NR_UARTS
   .config:3026:warning: symbol value 'n' invalid for PANEL_LCD_PIN_BL
   .config:3052:warning: symbol value 'n' invalid for INITRAMFS_ROOT_GID
   .config:3160:warning: symbol value 'n' invalid for ATM_FORE200E_TX_RETRY
   .config:3199:warning: symbol value 'n' invalid for FB_OMAP2_DSS_MIN_FCK_PER_PCK
   .config:3346:warning: symbol value 'n' invalid for PSTORE_BLK_CONSOLE_SIZE
   .config:3475:warning: symbol value 'n' invalid for IP_VS_MH_TAB_INDEX
   .config:3479:warning: symbol value 'n' invalid for BOOKE_WDT_DEFAULT_TIMEOUT
   .config:3530:warning: symbol value 'n' invalid for KCSAN_UDELAY_TASK
   .config:3550:warning: symbol value 'n' invalid for MMC_BLOCK_MINORS
   .config:3597:warning: symbol value 'n' invalid for SCSI_NCR53C8XX_SYNC
   .config:3718:warning: symbol value 'n' invalid for UCLAMP_BUCKETS_COUNT
   .config:3880:warning: symbol value 'n' invalid for SERIAL_MCF_BAUDRATE
   .config:3953:warning: symbol value 'n' invalid for DE2104X_DSL
   .config:3971:warning: symbol value 'n' invalid for BLK_DEV_RAM_COUNT
   .config:3999:warning: symbol value 'n' invalid for PANEL_LCD_PIN_RW
   .config:4151:warning: symbol value 'n' invalid for STACK_MAX_DEFAULT_SIZE_MB
   .config:4230:warning: symbol value 'n' invalid for IP_VS_SH_TAB_BITS
   .config:4263:warning: symbol value 'n' invalid for CMA_AREAS
   .config:4318:warning: symbol value 'n' invalid for INPUT_MOUSEDEV_SCREEN_X
   .config:4392:warning: symbol value 'n' invalid for USBIP_VHCI_HC_PORTS
   .config:4436:warning: symbol value 'n' invalid for RIONET_RX_SIZE
   .config:4637:warning: symbol value 'n' invalid for SND_MAX_CARDS
   .config:4714:warning: symbol value 'n' invalid for RADIO_TYPHOON_PORT
   .config:4746:warning: symbol value 'n' invalid for IBM_EMAC_TXB
   .config:4820:warning: symbol value 'n' invalid for RCU_BOOST_DELAY
   .config:4844:warning: symbol value 'n' invalid for SERIAL_TXX9_NR_UARTS
   .config:5139:warning: symbol value 'n' invalid for ARCH_MMAP_RND_BITS
   .config:5223:warning: symbol value 'n' invalid for DRM_I915_FENCE_TIMEOUT
   .config:5246:warning: symbol value 'n' invalid for TTY_PRINTK_LEVEL
   .config:5404:warning: symbol value 'n' invalid for MIPS_EJTAG_FDC_KGDB_CHAN
   .config:5428:warning: symbol value 'n' invalid for DRM_XE_PREEMPT_TIMEOUT_MAX
   .config:5504:warning: symbol value 'n' invalid for KDB_DEFAULT_ENABLE
   .config:5522:warning: symbol value 'n' invalid for SERIAL_ALTERA_UART_MAXPORTS
   .config:5588:warning: symbol value 'n' invalid for XEN_MEMORY_HOTPLUG_LIMIT
   .config:5638:warning: symbol value 'n' invalid for SCSI_MESH_RESET_DELAY_MS
   .config:5743:warning: symbol value 'n' invalid for PPC_EARLY_DEBUG_EHV_BC_HANDLE
   .config:5749:warning: symbol value 'n' invalid for PANEL_PROFILE
   .config:5788:warning: symbol value 'n' invalid for PANEL_LCD_HWIDTH
   .config:5823:warning: symbol value 'n' invalid for LOCKDEP_CHAINS_BITS
   .config:5824:warning: symbol value 'n' invalid for VIDEO_VIVID_MAX_DEVS
   .config:5916:warning: symbol value 'n' invalid for DRM_I915_HEARTBEAT_INTERVAL
   .config:5924:warning: symbol value 'n' invalid for KCSAN_SKIP_WATCH
   .config:5947:warning: symbol value 'n' invalid for PSTORE_BLK_KMSG_SIZE
   .config:6021:warning: symbol value 'n' invalid for SCSI_SYM53C8XX_MAX_TAGS
   .config:6154:warning: symbol value 'n' invalid for SERIAL_8250_RUNTIME_UARTS
   .config:6160:warning: symbol value 'n' invalid for MTD_UBI_WL_THRESHOLD
   .config:6184:warning: symbol value 'n' invalid for RIONET_TX_SIZE
   .config:6252:warning: symbol value 'n' invalid for ARCH_MMAP_RND_COMPAT_BITS
   .config:6256:warning: symbol value 'n' invalid for CRYPTO_DEV_FSL_CAAM_INTC_TIME_THLD
   .config:6420:warning: symbol value 'n' invalid for RADIO_TRUST_PORT
   .config:6599:warning: symbol value 'n' invalid for OMAP2_DSS_MIN_FCK_PER_PCK
   .config:6614:warning: symbol value 'n' invalid for SERIAL_SH_SCI_NR_UARTS
   .config:6802:warning: symbol value 'n' invalid for CMA_SIZE_PERCENTAGE
   .config:6953:warning: symbol value 'n' invalid for DRM_XE_TIMESLICE_MIN
   .config:7185:warning: symbol value 'n' invalid for SCSI_NCR53C8XX_MAX_TAGS
   .config:7189:warning: symbol value 'n' invalid for DVB_MAX_ADAPTERS
   .config:7194:warning: symbol value 'n' invalid for SCSI_SYM53C8XX_DMA_ADDRESSING_MODE
   .config:7249:warning: symbol value 'n' invalid for KDB_CONTINUE_CATASTROPHIC
   .config:7433:warning: symbol value 'n' invalid for SERIAL_ARC_NR_PORTS
   .config:7572:warning: symbol value 'n' invalid for IBM_EMAC_RXB
   .config:7609:warning: symbol value 'n' invalid for SCSI_MPT3SAS_MAX_SGE
   .config:7742:warning: symbol value 'n' invalid for PSTORE_DEFAULT_KMSG_BYTES

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
