Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.7
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792472937;
	b=CdJPE/yohiveG2vJKWXS6/vwExUm0/20jm5Fv72215hDLdTp9Jh/U0xRvIvCa40ZZGpp
	 SNwiFdi+HcZjI1EcU4Tuwz4D4ejJfUC/48+LQeoBhcSm26EAc+qMTqgOZzx5b40oY7wU1
	 4nctpp73f37BKRPTKoHuBNYizngcgmeVY1KgM3mEHvwzjjKKYMnfDSV5pMSASlJqyP1Hs
	 ruzo4w+I3sx1a7Vk3k+9stx8y91uyzW8dynrcT3fRpVvXXHBd0hTXRJ5D+2eOCs72qMlu
	 GzMKJz9ZVg7vp6TOUWZ/I/eRw4IlrJSSilQDFsjGb3xRcKbIDhosJPq3pSW57RLbBsQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792472937;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=93eSVUxdJLyZaBNuRWeeIqarmak0JnXcsgWuhU1L9JM=;
	b=pgdYl894b3PADWKvi5g/PrfqSTuQD52+gAGpB8kLHqMZ91Ja4pw4HfiI/IBR02L0vN64
	 UG0UkMvEMy4txch9vamMcCpKaSbe+dnxogi4QOJtNJbRdkrxRiLv/Q7eZzkjbTFVFVgep
	 KIF8QDEFScgkSf1/jCy7NHrmhpQ96gz7f+zgQSfsiKgzJIh4uXPAlQFDOUl4yvvkDhw8y
	 tLjzWSzQEDBM2aOzlJ6Unx7f+Y482HhG6mDrk6t0ExebfEfIYrGz7uxDwy/DYqh/hgdTa
	 XCtzfzmCq9HCV5jTF+3yl+A5tbZYcGEPdmuWdP30hJ+UQsSsaDD+xVfR96WzwmYDSyg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Bza9iREb;
	arc=none smtp.remote-ip=192.198.163.7
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ACC3606A31A
	for <oe-kbuild-all@lists.linux.dev>; Tue, 20 Oct 2026 05:08:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8ACC3606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Bza9iREb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792472936; x=1824008936;
  h=date:from:to:cc:subject:message-id;
  bh=cM89vhT7r84yTUi5xelGAQV2eWOTAPePOHfTX+7/MrQ=;
  b=Bza9iREb1J3VJu/hxIZZB8HKFzk7X1PH4CbldRGYvU6hobTiAGyBWEkh
   uHyyaxeNgJ7Zz1fB/mGnJpBceQKoZY+JHC9dp1VgVsOzyYUvqiioChflf
   UaeN6XSOvgeyRuJL2H0LywGpDaguZJSNi9OkDC0B/mYSG+hXbB5QJHMcl
   loaH0PfD+DBAPrrsvuVD7YpnXvcgFd3k4I0ZA57GlQHek6UHyKDFlZ9qN
   iuNk/+HhbdoAO9pha05AOydV+pDpYMvUYflPQPKMWU2Pc0el1Q70MZb76
   95zKGaZJLDT4PFFyisNRJWECLFVIK4H3gAM0ojYkOjXm6HqeDPs5T/ruL
   A==;
X-CSE-ConnectionGUID: qvxB5PdCRbyGw3lv8yipYg==
X-CSE-MsgGUID: CFpLLNTHTzO1zbEuoRHSGw==
X-IronPort-AV: E=McAfee;i="6800,10657,11940"; a="1070049"
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="1070049"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2026 22:08:55 -0700
X-CSE-ConnectionGUID: shDk9rvQR+mPbAQuXHPkzA==
X-CSE-MsgGUID: QPixODvVTiqEg+nBdpgYuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="3131747"
Received: from igk-lkp-server01.igk.intel.com (HELO 3c253b998be3) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 19 Oct 2026 22:08:53 -0700
Received: from kbuild by 3c253b998be3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xJ25i-0000000066B-3PcW;
	Tue, 20 Oct 2026 05:08:50 +0000
Date: Tue, 20 Oct 2026 07:08:44 +0200
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6-2026-07 2/2]
 drivers/virt/gunyah/gunyah_irqfd.c:126:13: warning: assignment makes pointer
 from integer without a cast
Message-ID: <202610200630.WNbILVf4-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://android.googlesource.com/kernel/common android15-6.6-2026-07
head:   d30ff9c22cb6fcc072d03268110b3797daba99be
commit: 22b6a37b0df03a6d7f5ac240b3ccd1f19f946a49 [2/2] FROMLIST: virt: gunyah: Add irqfd interface
config: arm64-randconfig-r2101-20261020 (https://download.01.org/0day-ci/archive/20261020/202610200630.WNbILVf4-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261020/202610200630.WNbILVf4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610200630.WNbILVf4-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/virt/gunyah/gunyah_irqfd.c: In function 'gunyah_irqfd_bind':
   drivers/virt/gunyah/gunyah_irqfd.c:126:15: error: implicit declaration of function 'eventfd_ctx_fileget'; did you mean 'eventfd_ctx_fdget'? [-Werror=implicit-function-declaration]
     irqfd->ctx = eventfd_ctx_fileget(fd.file);
                  ^~~~~~~~~~~~~~~~~~~
                  eventfd_ctx_fdget
>> drivers/virt/gunyah/gunyah_irqfd.c:126:13: warning: assignment makes pointer from integer without a cast [-Wint-conversion]
     irqfd->ctx = eventfd_ctx_fileget(fd.file);
                ^
   cc1: some warnings being treated as errors

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for WIRELESS_EXT
   Depends on [n]: NET [=y] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for WEXT_CORE
   Depends on [n]: NET [=y] && WIRELESS [=n] && (CFG80211_WEXT [=n] || WIRELESS_EXT [=y])
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for CAN_RX_OFFLOAD
   Depends on [n]: NETDEVICES [=y] && CAN_DEV [=n] && CAN_NETLINK [=n]
   Selected by [y]:
   - GKI_HIDDEN_MCP251XFD_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for WEXT_PROC
   Depends on [n]: NET [=y] && WIRELESS [=n] && PROC_FS [=n] && WEXT_CORE [=y]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for WEXT_PRIV
   Depends on [n]: NET [=y] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for WEXT_SPY
   Depends on [n]: NET [=y] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]


vim +126 drivers/virt/gunyah/gunyah_irqfd.c

    97	
    98	static long gunyah_irqfd_bind(struct gunyah_vm_function_instance *f)
    99	{
   100		struct gunyah_fn_irqfd_arg *args = f->argp;
   101		struct gunyah_irqfd *irqfd;
   102		__poll_t events;
   103		struct fd fd;
   104		long r;
   105	
   106		if (f->arg_size != sizeof(*args))
   107			return -EINVAL;
   108	
   109		/* All other flag bits are reserved for future use */
   110		if (args->flags & ~GUNYAH_IRQFD_FLAGS_LEVEL)
   111			return -EINVAL;
   112	
   113		irqfd = kzalloc(sizeof(*irqfd), GFP_KERNEL);
   114		if (!irqfd)
   115			return -ENOMEM;
   116	
   117		irqfd->f = f;
   118		f->data = irqfd;
   119	
   120		fd = fdget(args->fd);
   121		if (!fd.file) {
   122			kfree(irqfd);
   123			return -EBADF;
   124		}
   125	
 > 126		irqfd->ctx = eventfd_ctx_fileget(fd.file);
   127		if (IS_ERR(irqfd->ctx)) {
   128			r = PTR_ERR(irqfd->ctx);
   129			goto err_fdput;
   130		}
   131	
   132		if (args->flags & GUNYAH_IRQFD_FLAGS_LEVEL)
   133			irqfd->level = true;
   134	
   135		init_waitqueue_func_entry(&irqfd->wait, irqfd_wakeup);
   136		init_poll_funcptr(&irqfd->pt, irqfd_ptable_queue_proc);
   137	
   138		irqfd->ticket.resource_type = GUNYAH_RESOURCE_TYPE_BELL_TX;
   139		irqfd->ticket.label = args->label;
   140		irqfd->ticket.owner = THIS_MODULE;
   141		irqfd->ticket.populate = gunyah_irqfd_populate;
   142		irqfd->ticket.unpopulate = gunyah_irqfd_unpopulate;
   143	
   144		r = gunyah_vm_add_resource_ticket(f->ghvm, &irqfd->ticket);
   145		if (r)
   146			goto err_ctx;
   147	
   148		events = vfs_poll(fd.file, &irqfd->pt);
   149		if (events & EPOLLIN)
   150			pr_warn("Premature injection of interrupt\n");
   151		fdput(fd);
   152	
   153		return 0;
   154	err_ctx:
   155		eventfd_ctx_put(irqfd->ctx);
   156	err_fdput:
   157		fdput(fd);
   158		kfree(irqfd);
   159		return r;
   160	}
   161	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
