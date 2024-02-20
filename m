Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C7645A7A8
	for <oe-kbuild-all@lists.linux.dev>; Tue, 20 Feb 2024 13:06:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708434373; cv=none; b=pA8YsXIOVTnSw0I1LaaRdnUaaCTDAuyvkU3dXk5hYoGUB0/CuU/jx3B8S6/76tZbbqnH2YaT9+nZTkX1rZSPNIGAWL1IElLNcWGHPCijhxR+/W2UtHtg9cEWGAx3h1XN5xWq8Ltzisb2HhTr7wBovd/3rJ0of4pz7SMX3JvOGrs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708434373; c=relaxed/simple;
	bh=PJ6dw2mGs2QnrkxXm6JbyFHcdk7oEXpbKlQ6CrIIZzM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=pa/qEAdpeHpZW4hCeyF1uLA6/zMyt9/jry/1SjMIuUG6gwhYp9zG/794OSV4NQvMyr7iLNMQgZU4iEVEimBs7s9W/Yri3+qQ6m7OBwlrDXtB/jMzMV46QKfT2Tyz8aQxt+qfOGk6cZuTJRs0ykzKXrBsvIq7rOeSQubHvoR060M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Za6EOs46; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Za6EOs46"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1708434369;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=mCsVFgmAcLx9z3N18l6m5+Z7tDjqMs/7pywWLigscPo=;
	b=Za6EOs46MnLQuBAlUF0gJvDMIMGcg1sD1Fk8tewGwt3xmXZtRS+Xgbo+RJJuiJf3z84WBW
	CbZP905r8GkQePsUwDgj7tiFpWJTyHrbzPQFu/1rMg6Hyezxr27qj+do97czZcFKYKolpw
	6Qvow1X2Jk8+nPsjDT5smYg0d0KXVTw=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-395-7Gx8SmjtNqmDy63-i2Aokg-1; Tue,
 20 Feb 2024 08:06:05 -0500
X-MC-Unique: 7Gx8SmjtNqmDy63-i2Aokg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4A5AC29AB3FB;
	Tue, 20 Feb 2024 13:06:05 +0000 (UTC)
Received: from localhost (unknown [10.72.116.2])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5D35E200B436;
	Tue, 20 Feb 2024 13:06:01 +0000 (UTC)
Date: Tue, 20 Feb 2024 21:05:59 +0800
From: Baoquan He <bhe@redhat.com>
To: kernel test robot <lkp@intel.com>, hbathini@linux.ibm.com,
	yujie.liu@intel.com
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: Re: [akpm-mm:mm-unstable 82/320] kismet: WARNING: unmet direct
 dependencies detected for CRASH_DUMP when selected by FA_DUMP
Message-ID: <ZdSjtyBxXFcPw7Yh@MiWiFi-R3L-srv>
References: <202402171431.MzqHz3g2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <202402171431.MzqHz3g2-lkp@intel.com>
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.4
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 02/17/24 at 02:48pm, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-unstable
> head:   9951769060d8f5eb001acaca67c1439d2cfe1c6b
> commit: a5af0b602e5ecb379fd2470669654a6abe7e97a2 [82/320] crash: clean up kdump related config items
> config: powerpc-kismet-CONFIG_CRASH_DUMP-CONFIG_FA_DUMP-0-0 (https://download.01.org/0day-ci/archive/20240217/202402171431.MzqHz3g2-lkp@intel.com/config)
> reproduce: (https://download.01.org/0day-ci/archive/20240217/202402171431.MzqHz3g2-lkp@intel.com/reproduce)

I reproduced this issue, and found this has been fixed by Hari's
patchset. 

[PATCH linux-next 0/3] powerpc/kexec: split CONFIG_CRASH_DUMP out from CONFIG_KEXEC_CORE
https://lore.kernel.org/all/20240213113150.1148276-1-hbathini@linux.ibm.com/T/#u

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

