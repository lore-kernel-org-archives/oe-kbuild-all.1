Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7209949E134
	for <oe-kbuild-all@lists.linux.dev>; Thu, 10 Sep 2026 22:25:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789079145; cv=none; b=HZBOsX51ZqG0T7EuA7Gjc8SbDQHO2DiW5ZgtErGl2TsUEZSENnOTqUyFYmbydI/khb7OgBSZQCWQsI33qlQdF6pSxFK6VpYRWY503ryfZrTzaBvyX22VDBHpROrbAw6qEP6/yly/KDZS73i98xVn5vIFojxK/+wJgUfons2dJzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789079145; c=relaxed/simple;
	bh=MQSo2tDLlSYajraI8O8sLMy67vJE/0rYZe08wJG+NWo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=d3Veqnw6npvVZRZurWzYKQ7hBN1llNTTbRvsdNjff6tA7lZRcTKGvKL7coPp/EXoFB0MHh0Z5Db00BtVj+m03VdxzF7JuGBPWZt4cA3T6tp374bjTU8ICD8+ENXJlC0Drdu4jFpftaXxBMyhsMVfmu6JvTcnirOrVmubCdQtoE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ddcdlSXz; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ddcdlSXz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789079144; x=1820615144;
  h=date:from:to:cc:subject:message-id;
  bh=MQSo2tDLlSYajraI8O8sLMy67vJE/0rYZe08wJG+NWo=;
  b=ddcdlSXzTPDfVVqe0Cq5qwl6q8bO4LJf2bCj+GAU2gq7ZX3qMh1CYlvx
   1++bp+PMIpYJBXaf75LzGdcqmyJAsZdhe633zRjq/md1eA6L9s8hen2rG
   y3jDBPkv/91XC2lPbKZYnm+zARmWHMvxM03zb0hSGK9beylTKlaiHlpOO
   wSInsHQjgwYzTBZQIYYFW1cQucrAVS4lLVXkJOc8UtstX73Gq0J14H2xq
   quraxi6fYD48UmCnYpbXASickgkY2DCQDrSKZaw7KzWuBy1VevjJmw9a2
   zhbsD2tpbtdj7NduzDMuuqc1AqGlp0ZSBziBMmI3uWFXHYpsT/npeu6yz
   w==;
X-CSE-ConnectionGUID: lzs9I+5JS86HuX2W76fTPg==
X-CSE-MsgGUID: hXLFgyZxS6K7EANyYGNaGA==
X-IronPort-AV: E=McAfee;i="6800,10657,11901"; a="88686506"
X-IronPort-AV: E=Sophos;i="6.27,96,1787036400"; 
   d="scan'208";a="88686506"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2026 15:25:43 -0700
X-CSE-ConnectionGUID: 8uMV/PZlS6e6MhwjDh8EEQ==
X-CSE-MsgGUID: wvq6QJN0Qe6EfBFABZOdmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,96,1787036400"; 
   d="scan'208";a="82438"
Received: from lkp-server02.sh.intel.com (HELO 0a3643a6ed9d) ([10.239.97.151])
  by fmviesa012.fm.intel.com with ESMTP; 10 Sep 2026 15:25:41 -0700
Received: from kbuild by 0a3643a6ed9d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x4nCl-000000000bP-2hFW;
	Thu, 10 Sep 2026 22:25:25 +0000
Date: Fri, 11 Sep 2026 06:24:41 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-lts 1/1]
 drivers/virt/gunyah/gunyah_irqfd.c:126:15: error: call to undeclared function
 'eventfd_ctx_fileget'; ISO C99 and later do not support implicit function
 declarations
Message-ID: <202609110642.KN8b9Sc3-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android16-6.12-lts
head:   7542d32487b53ed1a59d02f013a6e6b66804c874
commit: bacbc7169217c9646143fd13eaf3c9c494deae30 [1/1] FROMLIST: virt: gunyah: Add irqfd interface
config: arm64-randconfig-001-20260911 (https://download.01.org/0day-ci/archive/20260911/202609110642.KN8b9Sc3-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 96295a1412f9afbee9d4a3c2701e83f5a529a9cc)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260911/202609110642.KN8b9Sc3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609110642.KN8b9Sc3-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <built-in>:3:
   In file included from include/linux/compiler_types.h:171:
   include/linux/compiler-clang.h:28:9: warning: '__SANITIZE_ADDRESS__' macro redefined [-Wmacro-redefined]
      28 | #define __SANITIZE_ADDRESS__
         |         ^
   <built-in>:372:9: note: previous definition is here
     372 | #define __SANITIZE_ADDRESS__ 1
         |         ^
>> drivers/virt/gunyah/gunyah_irqfd.c:126:15: error: call to undeclared function 'eventfd_ctx_fileget'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     126 |         irqfd->ctx = eventfd_ctx_fileget(fd_file(fd));
         |                      ^
   drivers/virt/gunyah/gunyah_irqfd.c:126:15: note: did you mean 'eventfd_ctx_fdget'?
   include/linux/eventfd.h:55:35: note: 'eventfd_ctx_fdget' declared here
      55 | static inline struct eventfd_ctx *eventfd_ctx_fdget(int fd)
         |                                   ^
>> drivers/virt/gunyah/gunyah_irqfd.c:126:13: error: incompatible integer to pointer conversion assigning to 'struct eventfd_ctx *' from 'int' [-Wint-conversion]
     126 |         irqfd->ctx = eventfd_ctx_fileget(fd_file(fd));
         |                    ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 warning and 2 errors generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for USB_PHY
   Depends on [n]: USB_SUPPORT [=n]
   Selected by [y]:
   - GKI_HIDDEN_USB_CONFIGS [=y] && 64BIT [=y]
   WARNING: unmet direct dependencies detected for BALLOON_COMPACTION
   Depends on [n]: COMPACTION [=n] && MEMORY_BALLOON [=y]
   Selected by [y]:
   - GKI_HIDDEN_MM_CONFIGS [=y] && 64BIT [=y]
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
   WARNING: unmet direct dependencies detected for WEXT_SPY
   Depends on [n]: NET [=y] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y] && 64BIT [=y]
   WARNING: unmet direct dependencies detected for WEXT_PROC
   Depends on [n]: NET [=y] && WIRELESS [=n] && PROC_FS [=n] && WEXT_CORE [=y]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y] && 64BIT [=y]
   WARNING: unmet direct dependencies detected for WEXT_PRIV
   Depends on [n]: NET [=y] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y] && 64BIT [=y]


vim +/eventfd_ctx_fileget +126 drivers/virt/gunyah/gunyah_irqfd.c

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
