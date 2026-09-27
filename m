Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA899304976
	for <oe-kbuild-all@lists.linux.dev>; Sun, 27 Sep 2026 14:38:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790519902; cv=none; b=UBrWPwOlXZBgRRTKWESPfgzC9ZkordhPBKj4zQZypi10RCetElatiNMCKOescmPiAVqjalYGoITOGlC0w4+drQZosnkQ+g6JFHgIFHdmNRxVdcwz4e0vA3g/kcFs22fJWD3gep4oBYvRtByC8vQ2LK5a5dkycgdNRq7lxo6hFpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790519902; c=relaxed/simple;
	bh=tm/kW+87Fya2QIXrlUBrEt48WqOz7b/pAre5HlLtmmQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=hkWM7Dg9ZBwBLoQdVa1CY4A6qow5rMEI9L6EOULEcgM8yRH/MpvkpQ+0e9N3ANdc2XADMlnLjxq+3zKuKZa8U1HrM823ur0+O8Max+G7yHjhhl7qel81HmNvilYI5ce/ZEdR0wGEq3L39yft91kXqQX6sGGVfQtM/F1LdhgMi5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZgQhdyoM; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZgQhdyoM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790519900; x=1822055900;
  h=date:from:to:cc:subject:message-id;
  bh=tm/kW+87Fya2QIXrlUBrEt48WqOz7b/pAre5HlLtmmQ=;
  b=ZgQhdyoMoGTZXqjSmhCY8PrEI41B3Badom/GGFNUemLMxFi4CAsPBk3E
   xpeS5wa/nRzhj77Fl6o6lxlpp3ClPG+Og6pbWAeXcd7WB9RIIQCLZbV/8
   5BZWNHr+V2lH4mFnLROe4HgsUnEtvYbHikX4cwBjfC2KkJ8W6jVVXMZ3E
   tiukZ+QKOgy67vaBy6tVLKLAsC77jyxnxKTmZX4EUiaIsLYV+ZMlI1BOL
   oE73Q3AdRZorm8fBDcnWWSHhPmxJmfMeowbqtR6KggnMpQzxJuAxkVV18
   /OgsToXvHzVK+jN7Ypd9m21tkSPA1WKPuqY+NghQHQE248/MwpAdwmnrx
   w==;
X-CSE-ConnectionGUID: gXW8YnE4Q3qUHP8OPm1taA==
X-CSE-MsgGUID: cU9szTXGQkiQGmvp2oUyGg==
X-IronPort-AV: E=McAfee;i="6800,10657,11918"; a="95050959"
X-IronPort-AV: E=Sophos;i="6.27,126,1787036400"; 
   d="scan'208";a="95050959"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2026 07:38:19 -0700
X-CSE-ConnectionGUID: edKpXBm1TXeUyktjz6lVxw==
X-CSE-MsgGUID: pgbHEw8RQJGsn76M/OLYwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,126,1787036400"; 
   d="scan'208";a="274042874"
Received: from igk-lkp-server01.igk.intel.com (HELO 04362d00df5a) ([10.211.93.152])
  by fmviesa010.fm.intel.com with ESMTP; 27 Sep 2026 07:38:18 -0700
Received: from kbuild by 04362d00df5a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xAq1A-000000000bf-0T2L;
	Sun, 27 Sep 2026 14:38:16 +0000
Date: Sun, 27 Sep 2026 16:37:29 +0200
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18-2026-04 1/1]
 drivers/virt/gunyah/gunyah_irqfd.c:126:22: error: implicit declaration of
 function 'eventfd_ctx_fileget'; did you mean 'eventfd_ctx_fdget'?
Message-ID: <202609271609.7Bchw6Md-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android17-6.18-2026-04
head:   e0e2c08bfcef8c292798b6e48bd55bbde44b3f74
commit: f171825128bac01df3b0bcbc909fa159bdd92411 [1/1] FROMLIST: virt: gunyah: Add irqfd interface
config: arm64-randconfig-r2309-20260927 (https://download.01.org/0day-ci/archive/20260927/202609271609.7Bchw6Md-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 15.2.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260927/202609271609.7Bchw6Md-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609271609.7Bchw6Md-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/virt/gunyah/gunyah_irqfd.c: In function 'gunyah_irqfd_bind':
>> drivers/virt/gunyah/gunyah_irqfd.c:126:22: error: implicit declaration of function 'eventfd_ctx_fileget'; did you mean 'eventfd_ctx_fdget'? [-Wimplicit-function-declaration]
     126 |         irqfd->ctx = eventfd_ctx_fileget(fd_file(fd));
         |                      ^~~~~~~~~~~~~~~~~~~
         |                      eventfd_ctx_fdget
>> drivers/virt/gunyah/gunyah_irqfd.c:126:20: error: assignment to 'struct eventfd_ctx *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     126 |         irqfd->ctx = eventfd_ctx_fileget(fd_file(fd));
         |                    ^

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for DRM_MIPI_DSI
   Depends on [n]: HAS_IOMEM [=y] && DRM [=n]
   Selected by [y]:
   - GKI_HIDDEN_DRM_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for ASYNC_TX_ENABLE_CHANNEL_SWITCH
   Depends on [n]: DMADEVICES [=n]
   Selected by [y]:
   - GKI_HIDDEN_DMA_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for DMA_ENGINE_RAID
   Depends on [n]: DMADEVICES [=n]
   Selected by [y]:
   - GKI_HIDDEN_DMA_CONFIGS [=y]


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
   121		if (!fd_file(fd)) {
   122			kfree(irqfd);
   123			return -EBADF;
   124		}
   125	
 > 126		irqfd->ctx = eventfd_ctx_fileget(fd_file(fd));
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
   148		events = vfs_poll(fd_file(fd), &irqfd->pt);
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
