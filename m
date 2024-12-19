Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A8E117799F
	for <oe-kbuild-all@lists.linux.dev>; Thu, 19 Dec 2024 21:43:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734644641; cv=none; b=VYOzCWoXhrGLx9GYh8JqC3CuqgWaTxwS0GP3LlnBaPbeWbfGf+H9WJGrh9RJjeFSpceM4g7//PwXqOrkJH8B807sIAo0T0LIyp4I2J5sc+9rlkKzzsS6xo7iLI4zHSMfKMKgbBO5fMxqI3QaU5IGrflW+TX82RNJ5sEZD7i/m2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734644641; c=relaxed/simple;
	bh=OLCPSIGIHVP2unQC1IYiOljeKcWianP3YXAnFSCOrbs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AYFjfmjSDYhHv+ywl64XnhjAaY2r2Atb0fUW0O0o6ar2hychit7iNzynpidVIhj4asjJ4P9eCEsRRE8U2B0bk46Uy/2jI2/+T5GDfzYSDBBS2ckepKkT96A/8vAoWcSaTlazJHcH7YyDap11AqT6ckQYfdt/TL2OL+8RGZVoi/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Xqpg54Y1; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Xqpg54Y1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734644639; x=1766180639;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OLCPSIGIHVP2unQC1IYiOljeKcWianP3YXAnFSCOrbs=;
  b=Xqpg54Y1FHkehSmL7bjpMQ93wg151K+yZPGl9SQ5INcTJNWjj5xyUil1
   QV8yArZOG3yQgCbivgole6NRVm6lQUJwHWaMTL0zp7vC3mIt1mBXliqGM
   dvh4g/PjkydypCS2IgknXjoLnIks5vDFuhTwvgS381CyZjDYnXU1nmnbV
   lpRBOfYC84iNq7BKI+MIQqWfKHH7wsQ479I46n1liPAKgLcEFTjGfNbZT
   WrnMR2GMaIzLPexrBTTWzQDax3K/HsTOZhzpUulw9ZlNQJwlTONjcB/jt
   1/P6CsG01HdsT9rKpdaH0jczSD/HhRNfOopv+VmyntFWmNA+o+wCpY85V
   g==;
X-CSE-ConnectionGUID: 1/TPPOLgRBGg5/Byli1tBQ==
X-CSE-MsgGUID: vq6UzkhPRI+n2Ew0ow2TUQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11291"; a="38025568"
X-IronPort-AV: E=Sophos;i="6.12,248,1728975600"; 
   d="scan'208";a="38025568"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2024 13:43:57 -0800
X-CSE-ConnectionGUID: 2QfpJXdrS/aBUsRdPhptGw==
X-CSE-MsgGUID: 6gGcViokSSyEoO0p/Z5tQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,248,1728975600"; 
   d="scan'208";a="98221647"
Received: from lkp-server01.sh.intel.com (HELO a46f226878e0) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 19 Dec 2024 13:43:57 -0800
Received: from kbuild by a46f226878e0 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tOOJG-0000Yd-1N;
	Thu, 19 Dec 2024 21:43:54 +0000
Date: Fri, 20 Dec 2024 05:43:22 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-6.1 24/32]
 drivers/virt/gunyah/gunyah_irqfd.c:117:15: error: call to undeclared
 function 'eventfd_ctx_fileget'; ISO C99 and later do not support implicit
 function declarations
Message-ID: <202412200559.5dfiMy29-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android14-6.1
head:   e50cf165f4e75f0d7b175299cdbb8d519d57e2cd
commit: 45831b2fd5c23e957a8e3530a5fab0d83169c640 [24/32] FROMLIST: virt: gunyah: Add irqfd interface
config: arm64-randconfig-001-20241220 (https://download.01.org/0day-ci/archive/20241220/202412200559.5dfiMy29-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241220/202412200559.5dfiMy29-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412200559.5dfiMy29-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/virt/gunyah/gunyah_irqfd.c:117:15: error: call to undeclared function 'eventfd_ctx_fileget'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     117 |         irqfd->ctx = eventfd_ctx_fileget(fd.file);
         |                      ^
   drivers/virt/gunyah/gunyah_irqfd.c:117:15: note: did you mean 'eventfd_ctx_fdget'?
   include/linux/eventfd.h:60:35: note: 'eventfd_ctx_fdget' declared here
      60 | static inline struct eventfd_ctx *eventfd_ctx_fdget(int fd)
         |                                   ^
>> drivers/virt/gunyah/gunyah_irqfd.c:117:13: error: incompatible integer to pointer conversion assigning to 'struct eventfd_ctx *' from 'int' [-Wint-conversion]
     117 |         irqfd->ctx = eventfd_ctx_fileget(fd.file);
         |                    ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   2 errors generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for WIRELESS_EXT
   Depends on [n]: NET [=n] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for WEXT_PROC
   Depends on [n]: NET [=n] && WIRELESS [=n] && PROC_FS [=n] && WEXT_CORE [=y]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for PAGE_POOL
   Depends on [n]: NET [=n]
   Selected by [y]:
   - GKI_HIDDEN_NET_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for WEXT_PRIV
   Depends on [n]: NET [=n] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for WEXT_SPY
   Depends on [n]: NET [=n] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for WEXT_CORE
   Depends on [n]: NET [=n] && WIRELESS [=n] && (CFG80211_WEXT [=n] || WIRELESS_EXT [=y])
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for NET_PTP_CLASSIFY
   Depends on [n]: NET [=n]
   Selected by [y]:
   - GKI_HIDDEN_NET_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_JACK
   Depends on [n]: SOUND [=y] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_VMASTER
   Depends on [n]: SOUND [=y] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for CAN_RX_OFFLOAD
   Depends on [n]: NETDEVICES [=n] && CAN_DEV [=n] && CAN_NETLINK [=n]
   Selected by [y]:
   - GKI_HIDDEN_MCP251XFD_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_IEC958
   Depends on [n]: SOUND [=y] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_SOC_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_JACK_INPUT_DEV
   Depends on [n]: SOUND [=y] && !UML && SND [=n] && SND_JACK [=y]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_ELD
   Depends on [n]: SOUND [=y] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]


vim +/eventfd_ctx_fileget +117 drivers/virt/gunyah/gunyah_irqfd.c

    88	
    89	static long gh_irqfd_bind(struct gh_vm_function_instance *f)
    90	{
    91		struct gh_fn_irqfd_arg *args = f->argp;
    92		struct gh_irqfd *irqfd;
    93		__poll_t events;
    94		struct fd fd;
    95		long r;
    96	
    97		if (f->arg_size != sizeof(*args))
    98			return -EINVAL;
    99	
   100		/* All other flag bits are reserved for future use */
   101		if (args->flags & ~GH_IRQFD_LEVEL)
   102			return -EINVAL;
   103	
   104		irqfd = kzalloc(sizeof(*irqfd), GFP_KERNEL);
   105		if (!irqfd)
   106			return -ENOMEM;
   107	
   108		irqfd->f = f;
   109		f->data = irqfd;
   110	
   111		fd = fdget(args->fd);
   112		if (!fd.file) {
   113			kfree(irqfd);
   114			return -EBADF;
   115		}
   116	
 > 117		irqfd->ctx = eventfd_ctx_fileget(fd.file);
   118		if (IS_ERR(irqfd->ctx)) {
   119			r = PTR_ERR(irqfd->ctx);
   120			goto err_fdput;
   121		}
   122	
   123		if (args->flags & GH_IRQFD_LEVEL)
   124			irqfd->level = true;
   125	
   126		init_waitqueue_func_entry(&irqfd->wait, irqfd_wakeup);
   127		init_poll_funcptr(&irqfd->pt, irqfd_ptable_queue_proc);
   128	
   129		irqfd->ticket.resource_type = GH_RESOURCE_TYPE_BELL_TX;
   130		irqfd->ticket.label = args->label;
   131		irqfd->ticket.owner = THIS_MODULE;
   132		irqfd->ticket.populate = gh_irqfd_populate;
   133		irqfd->ticket.unpopulate = gh_irqfd_unpopulate;
   134	
   135		r = gh_vm_add_resource_ticket(f->ghvm, &irqfd->ticket);
   136		if (r)
   137			goto err_ctx;
   138	
   139		events = vfs_poll(fd.file, &irqfd->pt);
   140		if (events & EPOLLIN)
   141			pr_warn("Premature injection of interrupt\n");
   142		fdput(fd);
   143	
   144		return 0;
   145	err_ctx:
   146		eventfd_ctx_put(irqfd->ctx);
   147	err_fdput:
   148		fdput(fd);
   149		kfree(irqfd);
   150		return r;
   151	}
   152	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
