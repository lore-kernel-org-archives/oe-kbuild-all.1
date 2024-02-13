Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F274F10A2D
	for <oe-kbuild-all@lists.linux.dev>; Tue, 13 Feb 2024 19:13:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707851601; cv=none; b=ZU1tnu/3t5v6GOL25w6WLdzrpns34b0R6d03FCzXgbUy50F9pXqJcwDaKvQxcLLhC25ejOWfAIFk2BU7u2wv5Ji7HYUGIPO/VlVFTjOTM7E2FKK/c6hkCH8VBuFTNKGqlltqZuvjLl0DJ2xgA4zXCn7q+x6gZUcuIbtKptTxI3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707851601; c=relaxed/simple;
	bh=GPh/7muKZ3a9YYEKYFbjMs5Vh9STTNGsT/GNcj43nD8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h6YMIp4I+cZFqN3pteXMLUGkRamqTE3xkrpanK4/kqxE0WOy6ssGgi0Au0nwmcOR8r/hqWFhavw7hYQNRpcTMXk+d1wXUkKsKllC3XgD5MInDFn3YnlzgDMHOYubT5zgLY3IYk4qswDiKBQ6KrDQnBdTxPupR11xCHp/m/WN8Fs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KUZYB180; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KUZYB180"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707851600; x=1739387600;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=GPh/7muKZ3a9YYEKYFbjMs5Vh9STTNGsT/GNcj43nD8=;
  b=KUZYB180r7y5q0NERpg00dcfr1FwB/PISPaagVDJuC013e4GEtp+4fvD
   zRBk4BY32AEwttPMhyGw7J7wXaiwtThq2l56memFehIVC66oCVxsk5BEJ
   KPHpK4669bSNB4hkqurkkrrd5gfZ1YGUPckPuSAhE7qW9627SU+uDS6YP
   SeeE4kRH3gfc/MxRYAEt8TdCnmIZ/qWZD+QqqJrYhE5LVmDKPBQw1waWK
   69NA3igLcMsUsYxskLMdCQ3ubIy3s7aiQKxJADA/BkkuLXmAmTSF24Hy/
   0L5uRJ6vK1PBMKFV4WE8fpug8wp5+L/lVoC+vPWaCajUakVl/g7Dh64AS
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10982"; a="1757120"
X-IronPort-AV: E=Sophos;i="6.06,158,1705392000"; 
   d="scan'208";a="1757120"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2024 11:13:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,158,1705392000"; 
   d="scan'208";a="7617931"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 13 Feb 2024 11:13:11 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rZyDN-00080f-0i;
	Tue, 13 Feb 2024 19:13:09 +0000
Date: Wed, 14 Feb 2024 03:12:28 +0800
From: kernel test robot <lkp@intel.com>
To: Suren Baghdasaryan <surenb@google.com>, akpm@linux-foundation.org
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev, kent.overstreet@linux.dev,
	mhocko@suse.com, vbabka@suse.cz, hannes@cmpxchg.org,
	roman.gushchin@linux.dev, mgorman@suse.de, dave@stgolabs.net,
	willy@infradead.org, liam.howlett@oracle.com, corbet@lwn.net,
	void@manifault.com, peterz@infradead.org, juri.lelli@redhat.com,
	catalin.marinas@arm.com, will@kernel.org, arnd@arndb.de,
	tglx@linutronix.de, mingo@redhat.com, dave.hansen@linux.intel.com,
	x86@kernel.org, peterx@redhat.com, david@redhat.com,
	axboe@kernel.dk, mcgrof@kernel.org, masahiroy@kernel.org,
	nathan@kernel.org, dennis@kernel.org, tj@kernel.org,
	muchun.song@linux.dev
Subject: Re: [PATCH v3 20/35] lib: add codetag reference into slabobj_ext
Message-ID: <202402140213.79KkzBxB-lkp@intel.com>
References: <20240212213922.783301-21-surenb@google.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240212213922.783301-21-surenb@google.com>

Hi Suren,

kernel test robot noticed the following build warnings:

[auto build test WARNING on akpm-mm/mm-nonmm-unstable]
[also build test WARNING on linus/master v6.8-rc4]
[cannot apply to akpm-mm/mm-everything vbabka-slab/for-next next-20240213]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Suren-Baghdasaryan/lib-string_helpers-Add-flags-param-to-string_get_size/20240213-054335
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-nonmm-unstable
patch link:    https://lore.kernel.org/r/20240212213922.783301-21-surenb%40google.com
patch subject: [PATCH v3 20/35] lib: add codetag reference into slabobj_ext
config: alpha-kismet-CONFIG_SLAB_OBJ_EXT-CONFIG_MEM_ALLOC_PROFILING-0-0 (https://download.01.org/0day-ci/archive/20240214/202402140213.79KkzBxB-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20240214/202402140213.79KkzBxB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402140213.79KkzBxB-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for SLAB_OBJ_EXT when selected by MEM_ALLOC_PROFILING
   .config:5:warning: symbol value 'n' invalid for PANEL_LCD_PIN_E
   .config:352:warning: symbol value 'n' invalid for PSTORE_BLK_MAX_REASON
   .config:402:warning: symbol value 'n' invalid for AIC79XX_DEBUG_MASK
   .config:439:warning: symbol value 'n' invalid for KFENCE_SAMPLE_INTERVAL
   .config:629:warning: symbol value 'n' invalid for DRM_XE_JOB_TIMEOUT_MIN
   .config:653:warning: symbol value 'n' invalid for CRYPTO_DEV_QCE_SW_MAX_LEN
   .config:764:warning: symbol value 'n' invalid for PANEL_LCD_CHARSET
   .config:809:warning: symbol value 'n' invalid for SND_AC97_POWER_SAVE_DEFAULT
   .config:836:warning: symbol value 'n' invalid for AIC79XX_CMDS_PER_DEVICE
   .config:860:warning: symbol value 'n' invalid for MAGIC_SYSRQ_DEFAULT_ENABLE
   .config:875:warning: symbol value 'n' invalid for DRM_I915_MAX_REQUEST_BUSYWAIT
   .config:905:warning: symbol value 'n' invalid for PANEL_LCD_PIN_SDA
   .config:914:warning: symbol value 'n' invalid for SND_AT73C213_TARGET_BITRATE
   .config:918:warning: symbol value 'n' invalid for DRM_XE_PREEMPT_TIMEOUT_MIN
   .config:932:warning: symbol value 'n' invalid for VMCP_CMA_SIZE
   .config:1037:warning: symbol value 'n' invalid for AIC79XX_RESET_DELAY_MS
   .config:1195:warning: symbol value 'n' invalid for MTDRAM_ERASE_SIZE
   .config:1307:warning: symbol value 'n' invalid for SERIAL_UARTLITE_NR_UARTS
   .config:1486:warning: symbol value 'n' invalid for LEGACY_PTY_COUNT
   .config:1628:warning: symbol value 'n' invalid for MTD_REDBOOT_DIRECTORY_BLOCK
   .config:1634:warning: symbol value 'n' invalid for AIC7XXX_RESET_DELAY_MS
   .config:1638:warning: symbol value 'n' invalid for WATCHDOG_OPEN_TIMEOUT
   .config:1790:warning: symbol value 'n' invalid for IBM_EMAC_POLL_WEIGHT
   .config:1932:warning: symbol value 'n' invalid for DRM_I915_STOP_TIMEOUT
   .config:2209:warning: symbol value 'n' invalid for SERIAL_AR933X_NR_UARTS
   .config:2357:warning: symbol value 'n' invalid for KCOV_IRQ_AREA_SIZE
   .config:2369:warning: symbol value 'n' invalid for PANEL_LCD_BWIDTH
   .config:2382:warning: symbol value 'n' invalid for DRM_XE_TIMESLICE_MAX
   .config:2696:warning: symbol value 'n' invalid for NOUVEAU_DEBUG_DEFAULT
   .config:2888:warning: symbol value 'n' invalid for KCSAN_REPORT_ONCE_IN_MS
   .config:2890:warning: symbol value 'n' invalid for FTRACE_RECORD_RECURSION_SIZE
   .config:2960:warning: symbol value 'n' invalid for SND_SOC_SOF_DEBUG_IPC_FLOOD_TEST_NUM
   .config:2987:warning: symbol value 'n' invalid for KCSAN_UDELAY_INTERRUPT
   .config:3012:warning: symbol value 'n' invalid for PANEL_LCD_PIN_BL
   .config:3031:warning: symbol value 'n' invalid for DEBUG_OBJECTS_ENABLE_DEFAULT
   .config:3038:warning: symbol value 'n' invalid for INITRAMFS_ROOT_GID
   .config:3144:warning: symbol value 'n' invalid for ATM_FORE200E_TX_RETRY
   .config:3186:warning: symbol value 'n' invalid for FB_OMAP2_DSS_MIN_FCK_PER_PCK
   .config:3327:warning: symbol value 'n' invalid for PSTORE_BLK_CONSOLE_SIZE
   .config:3441:warning: symbol value 'n' invalid for BOOKE_WDT_DEFAULT_TIMEOUT
   .config:3501:warning: symbol value 'n' invalid for KCSAN_UDELAY_TASK
   .config:3530:warning: symbol value 'n' invalid for MMC_BLOCK_MINORS
   .config:3576:warning: symbol value 'n' invalid for SCSI_NCR53C8XX_SYNC
   .config:3647:warning: symbol value 'n' invalid for IP_VS_MH_TAB_INDEX
   .config:3699:warning: symbol value 'n' invalid for UCLAMP_BUCKETS_COUNT
   .config:3849:warning: symbol value 'n' invalid for SERIAL_MCF_BAUDRATE
   .config:3912:warning: symbol value 'n' invalid for DE2104X_DSL
   .config:3928:warning: symbol value 'n' invalid for BLK_DEV_RAM_COUNT
   .config:4043:warning: symbol value 'n' invalid for STACK_MAX_DEFAULT_SIZE_MB
   .config:4155:warning: symbol value 'n' invalid for PANEL_LCD_PIN_RW
   .config:4188:warning: symbol value 'n' invalid for IP_VS_SH_TAB_BITS
   .config:4242:warning: symbol value 'n' invalid for CMA_AREAS
   .config:4299:warning: symbol value 'n' invalid for INPUT_MOUSEDEV_SCREEN_X
   .config:4361:warning: symbol value 'n' invalid for USBIP_VHCI_HC_PORTS
   .config:4419:warning: symbol value 'n' invalid for RIONET_RX_SIZE
   .config:4686:warning: symbol value 'n' invalid for RADIO_TYPHOON_PORT
   .config:4733:warning: symbol value 'n' invalid for IBM_EMAC_TXB
   .config:4816:warning: symbol value 'n' invalid for SERIAL_TXX9_NR_UARTS
   .config:5003:warning: symbol value 'n' invalid for RCU_BOOST_DELAY
   .config:5126:warning: symbol value 'n' invalid for ARCH_MMAP_RND_BITS
   .config:5208:warning: symbol value 'n' invalid for DRM_I915_FENCE_TIMEOUT
   .config:5229:warning: symbol value 'n' invalid for TTY_PRINTK_LEVEL
   .config:5247:warning: symbol value 'n' invalid for XEN_MEMORY_HOTPLUG_LIMIT
   .config:5393:warning: symbol value 'n' invalid for MIPS_EJTAG_FDC_KGDB_CHAN
   .config:5489:warning: symbol value 'n' invalid for KDB_DEFAULT_ENABLE
   .config:5508:warning: symbol value 'n' invalid for SERIAL_ALTERA_UART_MAXPORTS
   .config:5548:warning: symbol value 'n' invalid for DRM_XE_PREEMPT_TIMEOUT_MAX
   .config:5702:warning: symbol value 'n' invalid for PPC_EARLY_DEBUG_EHV_BC_HANDLE
   .config:5772:warning: symbol value 'n' invalid for PANEL_LCD_HWIDTH
   .config:5806:warning: symbol value 'n' invalid for LOCKDEP_CHAINS_BITS
   .config:5901:warning: symbol value 'n' invalid for DRM_I915_HEARTBEAT_INTERVAL
   .config:5907:warning: symbol value 'n' invalid for KCSAN_SKIP_WATCH
   .config:5930:warning: symbol value 'n' invalid for PSTORE_BLK_KMSG_SIZE
   .config:6105:warning: symbol value 'n' invalid for VIDEO_VIVID_MAX_DEVS
   .config:6151:warning: symbol value 'n' invalid for SCSI_SYM53C8XX_MAX_TAGS
   .config:6166:warning: symbol value 'n' invalid for CRYPTO_DEV_FSL_CAAM_INTC_TIME_THLD
   .config:6232:warning: symbol value 'n' invalid for ARCH_MMAP_RND_COMPAT_BITS
   .config:6268:warning: symbol value 'n' invalid for MTD_UBI_WL_THRESHOLD
   .config:6301:warning: symbol value 'n' invalid for RIONET_TX_SIZE
   .config:6402:warning: symbol value 'n' invalid for RADIO_TRUST_PORT
   .config:6419:warning: symbol value 'n' invalid for SCSI_MESH_RESET_DELAY_MS
   .config:6548:warning: symbol value 'n' invalid for SERIAL_SH_SCI_NR_UARTS
   .config:6667:warning: symbol value 'n' invalid for OMAP2_DSS_MIN_FCK_PER_PCK
   .config:6779:warning: symbol value 'n' invalid for CMA_SIZE_PERCENTAGE
   .config:6924:warning: symbol value 'n' invalid for DRM_XE_TIMESLICE_MIN
   .config:7101:warning: symbol value 'n' invalid for SCSI_NCR53C8XX_MAX_TAGS
   .config:7104:warning: symbol value 'n' invalid for DVB_MAX_ADAPTERS
   .config:7118:warning: symbol value 'n' invalid for SCSI_SYM53C8XX_DMA_ADDRESSING_MODE
   .config:7302:warning: symbol value 'n' invalid for KDB_CONTINUE_CATASTROPHIC
   .config:7405:warning: symbol value 'n' invalid for SERIAL_ARC_NR_PORTS
   .config:7500:warning: symbol value 'n' invalid for IBM_EMAC_RXB
   .config:7579:warning: symbol value 'n' invalid for SCSI_MPT3SAS_MAX_SGE
   .config:7663:warning: symbol value 'n' invalid for ZSMALLOC_CHAIN_SIZE
   .config:7711:warning: symbol value 'n' invalid for PSTORE_DEFAULT_KMSG_BYTES
   .config:7716:warning: symbol value 'n' invalid for IIO_CONSUMERS_PER_TRIGGER
   .config:7903:warning: symbol value 'n' invalid for PANEL_LCD
   .config:7981:warning: symbol value 'n' invalid for LOCKDEP_BITS
   .config:8107:warning: symbol value 'n' invalid for CRYPTO_DEV_FSL_CAAM_RINGSIZE
   .config:8197:warning: symbol value 'n' invalid for MTDRAM_TOTAL_SIZE
   .config:8499:warning: symbol value 'n' invalid for LSM_MMAP_MIN_ADDR

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
