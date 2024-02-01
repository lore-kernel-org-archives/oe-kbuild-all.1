Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCFEE20DEB
	for <oe-kbuild-all@lists.linux.dev>; Thu,  1 Feb 2024 20:33:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706819603; cv=none; b=SpVAaMExdFDJrGyRJAgbDpWuyOHYZFK/fupcgQhLmGkf4//hY5F1y66oqGjLbiaxGTPBW9nenn5PxKTWQojf59bMd1fYEO4a01t7UiHWG+0AL0pdc+gQp+xCabD7WgVcJBnguckdQu5nnMB96oQ9cgZusY25I3oSNGYVHgKu9o0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706819603; c=relaxed/simple;
	bh=xKuWYVbNLQNZB+Q53lH+7hSOc59AFWJKRqx5qGZiGtU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ip5K8M9kXeZA7sYo8UxoBB0TbZPTIXfXCJxhlWXgrtj3ioW0mkgNLNxt4NZduYsy3bGzNm3cBgUq6YwZw71/5h5DETtHKR1UmgbOaUsL8NQfQfCuEBIS4FxfoFqmhHwMWySWHU8dyjNFeu1pjsfvpv7DiQATqWERuGYtjLbugyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nYME/qPT; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nYME/qPT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706819601; x=1738355601;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xKuWYVbNLQNZB+Q53lH+7hSOc59AFWJKRqx5qGZiGtU=;
  b=nYME/qPTN1bdpDAcIUs2NdhhMN1mh0PwBtJGx48rLv+Wr5F2H20Ov6im
   7ZdPYvQ2svyk2+Z223rc3nOrxf9StFjYJLolREDCgKG12qfku5jH4iHPb
   AZ4ET2uEIq0I/mtm9MXa6gqxVcepcBAC5EnCoJuKmE7tIibBRWtkVH2X2
   SwPutn1MsUaxXcVazoaX3Saa2cFW6l9B6CMBlQM/CBqh0Irun6MN0omSZ
   Y9xpQpISJcTi9X6PXPYPT4E4pqU9TmY/G31ik3darnC+4CbMeRExk8QQO
   hZnNLH41QvOZtKAL9m8zpKXZYgxo3sTT8kKBQEetSBtNxvu4pajMiFtGa
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10971"; a="25459566"
X-IronPort-AV: E=Sophos;i="6.05,236,1701158400"; 
   d="scan'208";a="25459566"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2024 12:33:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,236,1701158400"; 
   d="scan'208";a="37311594"
Received: from lkp-server02.sh.intel.com (HELO 59f4f4cd5935) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 01 Feb 2024 12:33:15 -0800
Received: from kbuild by 59f4f4cd5935 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rVdkG-0003Ak-2Y;
	Thu, 01 Feb 2024 20:33:12 +0000
Date: Fri, 2 Feb 2024 04:33:03 +0800
From: kernel test robot <lkp@intel.com>
To: Gang Li <gang.li@linux.dev>
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Muchun Song <muchun.song@linux.dev>
Subject: [linux-next:master 2351/3001] kismet: WARNING: unmet direct
 dependencies detected for PADATA when selected by HUGETLBFS
Message-ID: <202402020454.6EPkP1hi-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   51b70ff55ed88edd19b080a524063446bcc34b62
commit: 143bcb010819491835de7532c79f9aea94bba3f5 [2351/3001] hugetlb: have CONFIG_HUGETLBFS select CONFIG_PADATA
config: x86_64-kismet-CONFIG_PADATA-CONFIG_HUGETLBFS-0-0 (https://download.01.org/0day-ci/archive/20240202/202402020454.6EPkP1hi-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20240202/202402020454.6EPkP1hi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402020454.6EPkP1hi-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for PADATA when selected by HUGETLBFS
   .config:252:warning: symbol value 'n' invalid for SATA_MOBILE_LPM_POLICY
   .config:320:warning: symbol value 'n' invalid for AIC79XX_CMDS_PER_DEVICE
   .config:359:warning: symbol value 'n' invalid for PSTORE_BLK_MAX_REASON
   .config:368:warning: symbol value 'n' invalid for SQUASHFS_FRAGMENT_CACHE_SIZE
   .config:379:warning: symbol value 'n' invalid for PANEL_LCD_PIN_SDA
   .config:416:warning: symbol value 'n' invalid for COMEDI_DEFAULT_BUF_MAXSIZE_KB
   .config:424:warning: symbol value 'n' invalid for PANEL_PROFILE
   .config:458:warning: symbol value 'n' invalid for KFENCE_SAMPLE_INTERVAL
   .config:490:warning: symbol value 'n' invalid for FB_OMAP2_NUM_FBS
   .config:619:warning: symbol value 'n' invalid for CFAG12864B_RATE
   .config:654:warning: symbol value 'n' invalid for DRM_XE_JOB_TIMEOUT_MIN
   .config:657:warning: symbol value 'n' invalid for CRYPTO_DEV_QCE_SW_MAX_LEN
   .config:717:warning: symbol value 'n' invalid for BLK_DEV_LOOP_MIN_COUNT
   .config:753:warning: symbol value 'n' invalid for PANEL_LCD_CHARSET
   .config:839:warning: symbol value 'n' invalid for SND_AC97_POWER_SAVE_DEFAULT
   .config:892:warning: symbol value 'n' invalid for DRM_I915_MAX_REQUEST_BUSYWAIT
   .config:920:warning: symbol value 'n' invalid for SND_AT73C213_TARGET_BITRATE
   .config:955:warning: symbol value 'n' invalid for FAT_DEFAULT_CODEPAGE
   .config:957:warning: symbol value 'n' invalid for DRM_XE_PREEMPT_TIMEOUT_MIN
   .config:964:warning: symbol value 'n' invalid for NET_EMATCH_STACK
   .config:966:warning: symbol value 'n' invalid for VMCP_CMA_SIZE
   .config:982:warning: symbol value 'n' invalid for CMA_SIZE_MBYTES
   .config:1148:warning: symbol value 'n' invalid for NODES_SHIFT
   .config:1218:warning: symbol value 'n' invalid for RCU_CPU_STALL_TIMEOUT
   .config:1248:warning: symbol value 'n' invalid for MTDRAM_ERASE_SIZE
   .config:1316:warning: symbol value 'n' invalid for SERIAL_UARTLITE_NR_UARTS
   .config:1327:warning: symbol value 'n' invalid for AIC7XXX_DEBUG_MASK
   .config:1486:warning: symbol value 'n' invalid for LEGACY_PTY_COUNT
   .config:1637:warning: symbol value 'n' invalid for KCOV_IRQ_AREA_SIZE
   .config:1649:warning: symbol value 'n' invalid for AIC7XXX_RESET_DELAY_MS
   .config:1725:warning: symbol value 'n' invalid for INPUT_MOUSEDEV_SCREEN_Y
   .config:1868:warning: symbol value 'n' invalid for IBM_EMAC_POLL_WEIGHT
   .config:1952:warning: symbol value 'n' invalid for DRM_I915_STOP_TIMEOUT
   .config:2098:warning: symbol value 'n' invalid for USB_GADGET_STORAGE_NUM_BUFFERS
   .config:2183:warning: symbol value 'n' invalid for SND_SOC_SOF_DEBUG_IPC_FLOOD_TEST_NUM
   .config:2275:warning: symbol value 'n' invalid for SND_HDA_PREALLOC_SIZE
   .config:2325:warning: symbol value 'n' invalid for RCU_FANOUT_LEAF
   .config:2417:warning: symbol value 'n' invalid for DRM_XE_TIMESLICE_MAX
   .config:2484:warning: symbol value 'n' invalid for PANEL_LCD_BWIDTH
   .config:2613:warning: symbol value 'n' invalid for PANEL_LCD_PIN_E
   .config:2621:warning: symbol value 'n' invalid for PSTORE_BLK_CONSOLE_SIZE
   .config:2743:warning: symbol value 'n' invalid for PANEL_PARPORT
   .config:2818:warning: symbol value 'n' invalid for BOOKE_WDT_DEFAULT_TIMEOUT
   .config:2838:warning: symbol value 'n' invalid for NOUVEAU_DEBUG_DEFAULT
   .config:3176:warning: symbol value 'n' invalid for PANEL_LCD_PIN_BL
   .config:3204:warning: symbol value 'n' invalid for INITRAMFS_ROOT_GID
   .config:3324:warning: symbol value 'n' invalid for ATM_FORE200E_TX_RETRY
   .config:3366:warning: symbol value 'n' invalid for FB_OMAP2_DSS_MIN_FCK_PER_PCK
   .config:3443:warning: symbol value 'n' invalid for STACK_MAX_DEFAULT_SIZE_MB
   .config:3713:warning: symbol value 'n' invalid for AIC79XX_RESET_DELAY_MS
   .config:3734:warning: symbol value 'n' invalid for MMC_BLOCK_MINORS
   .config:3782:warning: symbol value 'n' invalid for SCSI_NCR53C8XX_SYNC
   .config:3860:warning: symbol value 'n' invalid for SERIAL_MCF_BAUDRATE
   .config:3912:warning: symbol value 'n' invalid for UCLAMP_BUCKETS_COUNT
   .config:3944:warning: symbol value 'n' invalid for DE2104X_DSL
   .config:3959:warning: symbol value 'n' invalid for BLK_DEV_RAM_COUNT
   .config:4173:warning: symbol value 'n' invalid for IP_VS_SH_TAB_BITS
   .config:4272:warning: symbol value 'n' invalid for MTD_REDBOOT_DIRECTORY_BLOCK
   .config:4331:warning: symbol value 'n' invalid for USBIP_VHCI_HC_PORTS
   .config:4458:warning: symbol value 'n' invalid for CMA_AREAS
   .config:4518:warning: symbol value 'n' invalid for INPUT_MOUSEDEV_SCREEN_X
   .config:4575:warning: symbol value 'n' invalid for X86_AMD_PSTATE_DEFAULT_MODE
   .config:4642:warning: symbol value 'n' invalid for RIONET_RX_SIZE
   .config:4691:warning: symbol value 'n' invalid for RADIO_TYPHOON_PORT
   .config:4811:warning: symbol value 'n' invalid for SERIAL_TXX9_NR_UARTS
   .config:4872:warning: symbol value 'n' invalid for MTRR_SANITIZER_SPARE_REG_NR_DEFAULT
   .config:4972:warning: symbol value 'n' invalid for IBM_EMAC_TXB
   .config:5389:warning: symbol value 'n' invalid for FTRACE_RECORD_RECURSION_SIZE
   .config:5477:warning: symbol value 'n' invalid for DRM_I915_FENCE_TIMEOUT
   .config:5500:warning: symbol value 'n' invalid for TTY_PRINTK_LEVEL
   .config:5513:warning: symbol value 'n' invalid for CRYPTO_DEV_FSL_CAAM_INTC_TIME_THLD
   .config:5667:warning: symbol value 'n' invalid for MIPS_EJTAG_FDC_KGDB_CHAN
   .config:5728:warning: symbol value 'n' invalid for PPC_EARLY_DEBUG_EHV_BC_HANDLE
   .config:5765:warning: symbol value 'n' invalid for KDB_DEFAULT_ENABLE
   .config:6060:warning: symbol value 'n' invalid for PANEL_LCD_HWIDTH
   .config:6096:warning: symbol value 'n' invalid for IP_VS_MH_TAB_INDEX
   .config:6098:warning: symbol value 'n' invalid for LOCKDEP_CHAINS_BITS
   .config:6195:warning: symbol value 'n' invalid for DRM_I915_HEARTBEAT_INTERVAL
   .config:6212:warning: symbol value 'n' invalid for EFI_MAX_FAKE_MEM
   .config:6227:warning: symbol value 'n' invalid for PSTORE_BLK_KMSG_SIZE
   .config:6466:warning: symbol value 'n' invalid for KVM_MAX_NR_VCPUS
   .config:6505:warning: symbol value 'n' invalid for PANEL_LCD_PIN_RW
   .config:6552:warning: symbol value 'n' invalid for ARCH_MMAP_RND_COMPAT_BITS
   .config:6567:warning: symbol value 'n' invalid for SERIAL_SH_SCI_NR_UARTS
   .config:6732:warning: symbol value 'n' invalid for RADIO_TRUST_PORT
   .config:6998:warning: symbol value 'n' invalid for SND_MAX_CARDS
   .config:7107:warning: symbol value 'n' invalid for DVB_MAX_ADAPTERS
   .config:7118:warning: symbol value 'n' invalid for SCSI_NCR53C8XX_MAX_TAGS
   .config:7135:warning: symbol value 'n' invalid for SCSI_SYM53C8XX_DMA_ADDRESSING_MODE
   .config:7148:warning: symbol value 'n' invalid for CMA_SIZE_PERCENTAGE
   .config:7190:warning: symbol value 'n' invalid for RCU_BOOST_DELAY
   .config:7314:warning: symbol value 'n' invalid for DRM_XE_TIMESLICE_MIN
   .config:7439:warning: symbol value 'n' invalid for LOCKDEP_BITS
   .config:7539:warning: symbol value 'n' invalid for IBM_EMAC_RXB
   .config:7590:warning: symbol value 'n' invalid for DRM_XE_PREEMPT_TIMEOUT_MAX
   .config:7962:warning: symbol value 'n' invalid for PANEL_LCD
   .config:8009:warning: symbol value 'n' invalid for SCSI_MPT3SAS_MAX_SGE
   .config:8070:warning: symbol value 'n' invalid for SCSI_SYM53C8XX_MAX_TAGS
   .config:8185:warning: symbol value 'n' invalid for RIONET_TX_SIZE
   .config:8198:warning: symbol value 'n' invalid for RCU_FANOUT

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
