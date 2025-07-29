Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4221027E04C
	for <oe-kbuild-all@lists.linux.dev>; Tue, 29 Jul 2025 08:25:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753777559; cv=none; b=uxSb0TCjEqg0JuA2jFc0tfPTnf9m2QWOyxbApK3xvlQBCEy5d0sBmpvcOxiV0DYLplT22H+ik6JVfjoK4vpzwA/0It+cdGRp6ttPI2tnFiPxLdIKPF9g4uFWDU94slYXoVViNqqrbH0kNdD4OuOzr/IyEfYOOWXUigTYus78XXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753777559; c=relaxed/simple;
	bh=WYPLpCi1hyEe2erVViSvhuVvDBaRKqNNge8qc8k8Dl8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZaOElmZkuayRKSrBtm8BcbSY3jDE6SXltonz9mkRNeB9o8HfbvNPfLV4noGombk3oyuMST85v9bZAVUm+T/jxjoWFbPr+9Cvt4LXw/sUSgSvvsqXAXU4f9wwNcavCLZzBIkvveU8XUu0nVrexhk2ZBNVYfqjvYdIR7HyOJhVNHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FOBxfBuS; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FOBxfBuS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753777556; x=1785313556;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WYPLpCi1hyEe2erVViSvhuVvDBaRKqNNge8qc8k8Dl8=;
  b=FOBxfBuSnP8qrkaGqBy/lLP1xvj02uYm3s0O3uuO7hzl+fFHGMdRRHpU
   bh2bKszEtbYDMPhXV76pYpn3+XGhlq237+AAf1l3vGi6X8TNdBAAFyWZ0
   9qeyRz+o1zKkF8TQZrMMVbXAcBqtClFoW7xX136r/s8CbJ11c8YEHyVSs
   PlwOHwdd1NIeua2gl26U+WaKXzRcSfbhalCMWt4EUbl7dlffZ9+2HUxbt
   rVyNIbHsUXXAdGGyVCbw3IO+XO06IOwI+WBX68MIyYZBEo6T9NUTLxqH1
   HP2vZ5WKUT3NejU7r7MP2Rs0SdKPhX0XyMq/Z/x7XY/4r9Rm1wcmhaCUT
   w==;
X-CSE-ConnectionGUID: D5Af4SbEQfqDa0uxIokJtw==
X-CSE-MsgGUID: ACMmbqmQQgafif84wBz3qw==
X-IronPort-AV: E=McAfee;i="6800,10657,11505"; a="55738910"
X-IronPort-AV: E=Sophos;i="6.16,348,1744095600"; 
   d="scan'208";a="55738910"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2025 01:25:56 -0700
X-CSE-ConnectionGUID: tPIfSBp/RKCoIC1rN6UiLg==
X-CSE-MsgGUID: VX8umHP6TiKJvu5woAYwYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,348,1744095600"; 
   d="scan'208";a="162212251"
Received: from lkp-server01.sh.intel.com (HELO 160750d4a34c) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 29 Jul 2025 01:25:55 -0700
Received: from kbuild by 160750d4a34c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ugfei-00017l-1w;
	Tue, 29 Jul 2025 08:25:52 +0000
Date: Tue, 29 Jul 2025 16:25:16 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-2025-07 2/2]
 drivers/virt/gunyah/gunyah_irqfd.c:126:15: error: implicit declaration of
 function 'eventfd_ctx_fileget'; did you mean 'eventfd_ctx_fdget'?
Message-ID: <202507291644.96pHkH2R-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android16-6.12-2025-07
head:   5ab7db59a2521683e8595fca78c40621b498abdb
commit: bacbc7169217c9646143fd13eaf3c9c494deae30 [2/2] FROMLIST: virt: gunyah: Add irqfd interface
config: arm64-randconfig-r113-20250729 (https://download.01.org/0day-ci/archive/20250729/202507291644.96pHkH2R-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 10.5.0
reproduce: (https://download.01.org/0day-ci/archive/20250729/202507291644.96pHkH2R-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507291644.96pHkH2R-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   drivers/virt/gunyah/gunyah_irqfd.c: In function 'gunyah_irqfd_bind':
>> drivers/virt/gunyah/gunyah_irqfd.c:126:15: error: implicit declaration of function 'eventfd_ctx_fileget'; did you mean 'eventfd_ctx_fdget'? [-Werror=implicit-function-declaration]
     126 |  irqfd->ctx = eventfd_ctx_fileget(fd_file(fd));
         |               ^~~~~~~~~~~~~~~~~~~
         |               eventfd_ctx_fdget
>> drivers/virt/gunyah/gunyah_irqfd.c:126:13: warning: assignment to 'struct eventfd_ctx *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     126 |  irqfd->ctx = eventfd_ctx_fileget(fd_file(fd));
         |             ^
   cc1: some warnings being treated as errors

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for PHYLINK
   Depends on [n]: NETDEVICES [=n]
   Selected by [y]:
   - GKI_HIDDEN_ETHERNET_CONFIGS [=y] && 64BIT [=y]
   WARNING: unmet direct dependencies detected for SND_JACK_INPUT_DEV
   Depends on [n]: SOUND [=n] && SND [=n] && SND_JACK [=y]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y] && 64BIT [=y]
   WARNING: unmet direct dependencies detected for SND_INTEL_NHLT
   Depends on [n]: SOUND [=n] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y] && 64BIT [=y] && ACPI [=y]
   WARNING: unmet direct dependencies detected for WEXT_PROC
   Depends on [n]: NET [=y] && WIRELESS [=n] && PROC_FS [=n] && WEXT_CORE [=y]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y] && 64BIT [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_ELD
   Depends on [n]: SOUND [=n] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y] && 64BIT [=y]
   WARNING: unmet direct dependencies detected for WEXT_PRIV
   Depends on [n]: NET [=y] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y] && 64BIT [=y]
   WARNING: unmet direct dependencies detected for HVC_DRIVER
   Depends on [n]: TTY [=n]
   Selected by [y]:
   - GKI_HIDDEN_VIRTUAL_CONFIGS [=y] && 64BIT [=y]
   WARNING: unmet direct dependencies detected for VIDEO_V4L2_SUBDEV_API
   Depends on [n]: MEDIA_SUPPORT [=y] && VIDEO_DEV [=n] && MEDIA_CONTROLLER [=y]
   Selected by [y]:
   - GKI_HIDDEN_MEDIA_CONFIGS [=y] && 64BIT [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_IEC958
   Depends on [n]: SOUND [=n] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_SOC_CONFIGS [=y] && 64BIT [=y]
   WARNING: unmet direct dependencies detected for WIRELESS_EXT
   Depends on [n]: NET [=y] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y] && 64BIT [=y]
   WARNING: unmet direct dependencies detected for WEXT_CORE
   Depends on [n]: NET [=y] && WIRELESS [=n] && (CFG80211_WEXT [=n] || WIRELESS_EXT [=y])
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y] && 64BIT [=y]
   WARNING: unmet direct dependencies detected for SND_JACK
   Depends on [n]: SOUND [=n] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y] && 64BIT [=y]
   WARNING: unmet direct dependencies detected for SND_VMASTER
   Depends on [n]: SOUND [=n] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y] && 64BIT [=y]
   WARNING: unmet direct dependencies detected for CAN_RX_OFFLOAD
   Depends on [n]: NETDEVICES [=n] && CAN_DEV [=n] && CAN_NETLINK [=n]
   Selected by [y]:
   - GKI_HIDDEN_MCP251XFD_CONFIGS [=y] && 64BIT [=y]
   WARNING: unmet direct dependencies detected for WEXT_SPY
   Depends on [n]: NET [=y] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y] && 64BIT [=y]


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
