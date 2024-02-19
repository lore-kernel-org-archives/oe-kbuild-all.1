Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B19B20B04
	for <oe-kbuild-all@lists.linux.dev>; Mon, 19 Feb 2024 07:09:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708326589; cv=none; b=UyaSdC9cJ7TXURT1Fcl5O9EPq1heRPlHiyS+A2RvzCbGBwmSLW6dj5lIuVnKf5MwZaCVDhOD+BoaOLpdHManVqPamzdWP2zNchopeyNNclB403sGQDuSR2Pf5etu10b4Lbisy0wm3AixVzfWdQWAR1oQFUal1GONv4XqndyYJsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708326589; c=relaxed/simple;
	bh=p9Xv/Rv727pqdJDPO71/ZWy2YKDvZMcUUSE73rP1/PY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=UeQsJTZRbGz2HyMC2w8LB2t14ZyRZ6s4s8ELgraR+Jwy42EFneeKWr5e9KUvmnKYtw7nZmJlq/IzKI7ge8nqMyVUyB/QTQuENEIfAoNa9mcjGEapbRAKgxdM/iqWjJwFbrT7ZxWrzinPVdU4Xot6hdinUqixQml3CKfrIHVhgQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=aTFHjqQs; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="aTFHjqQs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1708326585;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TnZc3R3EtPJw7VjpT6RcySf5PSwmJoHPgUA70A0vURw=;
	b=aTFHjqQsljEpYpYCnk6U6lmqVTlfYZHm8hySEiu2qVZPrMj4hKbbyb7rdFUhAtxCyKJ7nO
	ffXepijbdOpqox3Htgd65u8JM6kbjj0Op4ZKkjICYyP0KqRULgAeTa6X1iLfFkJGWdCEHo
	VyjupFJyZw7+9PqS8VQOxQ2MG/DcJhg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-189-LyHBsneXPviVmQTZjbuqMw-1; Mon, 19 Feb 2024 02:09:42 -0500
X-MC-Unique: LyHBsneXPviVmQTZjbuqMw-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C6BC583538C;
	Mon, 19 Feb 2024 07:09:41 +0000 (UTC)
Received: from localhost (unknown [10.72.116.2])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4B6E4492BC6;
	Mon, 19 Feb 2024 07:09:40 +0000 (UTC)
Date: Mon, 19 Feb 2024 15:09:37 +0800
From: Baoquan He <bhe@redhat.com>
To: kernel test robot <lkp@intel.com>
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: Re: [akpm-mm:mm-unstable 82/320] kismet: WARNING: unmet direct
 dependencies detected for CRASH_DUMP when selected by FA_DUMP
Message-ID: <ZdL+sSSFghXttSqR@MiWiFi-R3L-srv>
References: <202402171431.MzqHz3g2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <202402171431.MzqHz3g2-lkp@intel.com>
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.9
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On 02/17/24 at 02:48pm, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-unstable
> head:   9951769060d8f5eb001acaca67c1439d2cfe1c6b
> commit: a5af0b602e5ecb379fd2470669654a6abe7e97a2 [82/320] crash: clean up kdump related config items
> config: powerpc-kismet-CONFIG_CRASH_DUMP-CONFIG_FA_DUMP-0-0 (https://download.01.org/0day-ci/archive/20240217/202402171431.MzqHz3g2-lkp@intel.com/config)
> reproduce: (https://download.01.org/0day-ci/archive/20240217/202402171431.MzqHz3g2-lkp@intel.com/reproduce)

When I tried the step 1 of reproducer, I got failure on installing the
kmax. Is there other ways I can reproduce the issue? Or have you tested
the latest linux-next/master because there's some udpate about the
config items change?

-------
 # 1. reproduce by kismet
    # install kmax per https://github.com/paulgazz/kmax/blob/master/README.md
    kismet --linux-ksrc=linux --selectees CONFIG_CRASH_DUMP --selectors CONFIG_FA_DUMP -a=powerpc
-------


======
      kextractors/kextractor-3.19/bconf.tab.c: In function ‘enter_if_branch’:
      kextractors/kextractor-3.19/bconf.tab.c:150:5: error: implicit declaration of function ‘bconferror’; did you mean ‘ferror’? [-Wimplicit-function-declaration]
        150 |     bconferror("MAX_IF_DEPTH exceeded");
            |     ^~~~~~~~~~
            |     ferror
      kextractors/kextractor-3.19/bconf.tab.c: At top level:
      kextractors/kextractor-3.19/bconf.tab.c:2064:1: error: return type defaults to ‘int’ [-Wimplicit-int]
       2064 | bconf_parse(char *file)
            | ^~~~~~~~~~~
      kextractors/kextractor-3.19/bconf.tab.c:2107:1: error: return type defaults to ‘int’ [-Wimplicit-int]
       2107 | bconf_test_lexer(char *file)
            | ^~~~~~~~~~~~~~~~
      kextractors/kextractor-3.19/bconf.tab.c:2119:1: error: return type defaults to ‘int’ [-Wimplicit-int]
       2119 | bconferror(char *msg) {
            | ^~~~~~~~~~
      error: command '/usr/lib64/ccache/gcc' failed with exit code 1
      [end of output]
  
  note: This error originates from a subprocess, and is likely not a problem with pip.
  ERROR: Failed building wheel for kmax
Failed to build kmax
ERROR: Could not build wheels for kmax, which is required to install pyproject.toml-based projects
=================


> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202402171431.MzqHz3g2-lkp@intel.com/
> 
> kismet warnings: (new ones prefixed by >>)
> >> kismet: WARNING: unmet direct dependencies detected for CRASH_DUMP when selected by FA_DUMP
>    .config:33:warning: symbol value 'n' invalid for AIC79XX_DEBUG_MASK
>    .config:80:warning: symbol value 'n' invalid for PHYSICAL_START
>    .config:254:warning: symbol value 'n' invalid for SATA_MOBILE_LPM_POLICY
>    .config:400:warning: symbol value 'n' invalid for AIC79XX_CMDS_PER_DEVICE
>    .config:407:warning: symbol value 'n' invalid for PPC_EARLY_DEBUG_16550_PHYSADDR
>    .config:443:warning: symbol value 'n' invalid for PANEL_LCD_PIN_SDA
>    .config:458:warning: symbol value 'n' invalid for KFENCE_SAMPLE_INTERVAL
>    .config:550:warning: symbol value 'n' invalid for PPC_EARLY_DEBUG_HVSI_VTERMNO
>    .config:577:warning: symbol value 'n' invalid for PAGE_OFFSET
>    .config:631:warning: symbol value 'n' invalid for INPUT_MOUSEDEV_SCREEN_Y
>    .config:652:warning: symbol value 'n' invalid for DRM_XE_JOB_TIMEOUT_MIN
>    .config:665:warning: symbol value 'n' invalid for CRYPTO_DEV_QCE_SW_MAX_LEN
>    .config:709:warning: symbol value 'n' invalid for DATA_SHIFT
>    .config:777:warning: symbol value 'n' invalid for PANEL_LCD_CHARSET
>    .config:839:warning: symbol value 'n' invalid for SND_AC97_POWER_SAVE_DEFAULT
>    .config:887:warning: symbol value 'n' invalid for MAGIC_SYSRQ_DEFAULT_ENABLE
>    .config:901:warning: symbol value 'n' invalid for DRM_I915_MAX_REQUEST_BUSYWAIT
>    .config:938:warning: symbol value 'n' invalid for SND_AT73C213_TARGET_BITRATE
>    .config:956:warning: symbol value 'n' invalid for DRM_XE_PREEMPT_TIMEOUT_MIN
>    .config:964:warning: symbol value 'n' invalid for NET_EMATCH_STACK
>    .config:966:warning: symbol value 'n' invalid for VMCP_CMA_SIZE
>    .config:980:warning: symbol value 'n' invalid for USB_GADGET_STORAGE_NUM_BUFFERS
>    .config:1141:warning: symbol value 'n' invalid for X86_AMD_PSTATE_DEFAULT_MODE
>    .config:1242:warning: symbol value 'n' invalid for MTDRAM_ERASE_SIZE
>    .config:1322:warning: symbol value 'n' invalid for SERIAL_UARTLITE_NR_UARTS
>    .config:1440:warning: symbol value 'n' invalid for PANEL_LCD_PIN_E
>    .config:1504:warning: symbol value 'n' invalid for LEGACY_PTY_COUNT
>    .config:1590:warning: symbol value 'n' invalid for SERIAL_ALTERA_UART_BAUDRATE
>    .config:1641:warning: symbol value 'n' invalid for LOWMEM_CAM_NUM
>    .config:1679:warning: symbol value 'n' invalid for AIC7XXX_RESET_DELAY_MS
>    .config:1755:warning: symbol value 'n' invalid for PPC_MEMCONS_OUTPUT_SIZE
>    .config:1841:warning: symbol value 'n' invalid for LOWMEM_SIZE
>    .config:1848:warning: symbol value 'n' invalid for KCOV_IRQ_AREA_SIZE
>    .config:1864:warning: symbol value 'n' invalid for IBM_EMAC_POLL_WEIGHT
>    .config:1972:warning: symbol value 'n' invalid for DRM_I915_STOP_TIMEOUT
>    .config:2260:warning: symbol value 'n' invalid for SND_HDA_PREALLOC_SIZE
>    .config:2331:warning: symbol value 'n' invalid for SND_SOC_SOF_DEBUG_IPC_FLOOD_TEST_NUM
>    .config:2376:warning: symbol value 'n' invalid for XEN_MEMORY_HOTPLUG_LIMIT
>    .config:2426:warning: symbol value 'n' invalid for DRM_XE_TIMESLICE_MAX
>    .config:2461:warning: symbol value 'n' invalid for PANEL_LCD_BWIDTH
>    .config:2592:warning: symbol value 'n' invalid for AIC79XX_RESET_DELAY_MS
>    .config:2712:warning: symbol value 'n' invalid for PANEL_PARPORT
>    .config:2756:warning: symbol value 'n' invalid for PSTORE_BLK_CONSOLE_SIZE
>    .config:2810:warning: symbol value 'n' invalid for NOUVEAU_DEBUG_DEFAULT
>    .config:2993:warning: symbol value 'n' invalid for BOOKE_WDT_DEFAULT_TIMEOUT
>    .config:3021:warning: symbol value 'n' invalid for KCSAN_REPORT_ONCE_IN_MS
>    .config:3128:warning: symbol value 'n' invalid for KCSAN_UDELAY_INTERRUPT
>    .config:3150:warning: symbol value 'n' invalid for PANEL_LCD_PIN_BL
>    .config:3171:warning: symbol value 'n' invalid for DEBUG_OBJECTS_ENABLE_DEFAULT
>    .config:3178:warning: symbol value 'n' invalid for INITRAMFS_ROOT_GID
>    .config:3276:warning: symbol value 'n' invalid for MTD_REDBOOT_DIRECTORY_BLOCK
>    .config:3293:warning: symbol value 'n' invalid for ATM_FORE200E_TX_RETRY
>    .config:3332:warning: symbol value 'n' invalid for FB_OMAP2_DSS_MIN_FCK_PER_PCK
>    .config:3564:warning: symbol value 'n' invalid for KCSAN_UDELAY_TASK
>    .config:3680:warning: symbol value 'n' invalid for STACK_MAX_DEFAULT_SIZE_MB
>    .config:3699:warning: symbol value 'n' invalid for MMC_BLOCK_MINORS
>    .config:3703:warning: symbol value 'n' invalid for INET_TABLE_PERTURB_ORDER
>    .config:3747:warning: symbol value 'n' invalid for SCSI_NCR53C8XX_SYNC
>    .config:3875:warning: symbol value 'n' invalid for UCLAMP_BUCKETS_COUNT
>    .config:3883:warning: symbol value 'n' invalid for THREAD_SHIFT
>    .config:3931:warning: symbol value 'n' invalid for SERIAL_MCF_BAUDRATE
>    .config:3985:warning: symbol value 'n' invalid for PPC_MEMCONS_INPUT_SIZE
>    .config:4007:warning: symbol value 'n' invalid for DE2104X_DSL
>    .config:4020:warning: symbol value 'n' invalid for BLK_DEV_RAM_COUNT
>    .config:4332:warning: symbol value 'n' invalid for FTRACE_RECORD_RECURSION_SIZE
>    .config:4406:warning: symbol value 'n' invalid for USBIP_VHCI_HC_PORTS
>    .config:4483:warning: symbol value 'n' invalid for INPUT_MOUSEDEV_SCREEN_X
>    .config:4603:warning: symbol value 'n' invalid for RIONET_RX_SIZE
>    .config:4764:warning: symbol value 'n' invalid for RADIO_TYPHOON_PORT
>    .config:4880:warning: symbol value 'n' invalid for SERIAL_TXX9_NR_UARTS
>    .config:4930:warning: symbol value 'n' invalid for IBM_EMAC_TXB
>    .config:5329:warning: symbol value 'n' invalid for PPC_EARLY_DEBUG_CPM_ADDR
>    .config:5334:warning: symbol value 'n' invalid for ARCH_MMAP_RND_BITS
>    .config:5419:warning: symbol value 'n' invalid for DRM_I915_FENCE_TIMEOUT
>    .config:5443:warning: symbol value 'n' invalid for TTY_PRINTK_LEVEL
>    .config:5605:warning: symbol value 'n' invalid for MIPS_EJTAG_FDC_KGDB_CHAN
>    .config:5620:warning: symbol value 'n' invalid for CRYPTO_DEV_FSL_CAAM_INTC_TIME_THLD
>    .config:5639:warning: symbol value 'n' invalid for PANEL_LCD_PIN_RW
>    .config:5704:warning: symbol value 'n' invalid for KDB_DEFAULT_ENABLE
>    .config:5722:warning: symbol value 'n' invalid for SERIAL_ALTERA_UART_MAXPORTS
>    .config:5809:warning: symbol value 'n' invalid for PPC_EARLY_DEBUG_EHV_BC_HANDLE
>    .config:5999:warning: symbol value 'n' invalid for PANEL_LCD_HWIDTH
>    .config:6030:warning: symbol value 'n' invalid for LOCKDEP_CHAINS_BITS
>    .config:6127:warning: symbol value 'n' invalid for DRM_I915_HEARTBEAT_INTERVAL
>    .config:6134:warning: symbol value 'n' invalid for KCSAN_SKIP_WATCH
>    .config:6241:warning: symbol value 'n' invalid for SND_MAX_CARDS
>    .config:6397:warning: symbol value 'n' invalid for RCU_BOOST_DELAY
>    .config:6477:warning: symbol value 'n' invalid for ARCH_MMAP_RND_COMPAT_BITS
>    .config:6630:warning: symbol value 'n' invalid for SERIAL_SH_SCI_NR_UARTS
>    .config:6651:warning: symbol value 'n' invalid for RADIO_TRUST_PORT
>    .config:6797:warning: symbol value 'n' invalid for DRM_XE_PREEMPT_TIMEOUT_MAX
>    .config:7057:warning: symbol value 'n' invalid for CMA_SIZE_PERCENTAGE
>    .config:7181:warning: symbol value 'n' invalid for DVB_MAX_ADAPTERS
>    .config:7189:warning: symbol value 'n' invalid for SCSI_NCR53C8XX_MAX_TAGS
>    .config:7200:warning: symbol value 'n' invalid for SCSI_SYM53C8XX_DMA_ADDRESSING_MODE
>    .config:7219:warning: symbol value 'n' invalid for DRM_XE_TIMESLICE_MIN
>    .config:7359:warning: symbol value 'n' invalid for SCSI_SYM53C8XX_MAX_TAGS
>    .config:7465:warning: symbol value 'n' invalid for RIONET_TX_SIZE
>    .config:7545:warning: symbol value 'n' invalid for LOCKDEP_BITS
>    .config:7577:warning: symbol value 'n' invalid for IBM_EMAC_RXB
> 
> -- 
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
> 

