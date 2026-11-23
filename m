Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.17
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795461722;
	b=FDpFAgsWNrrniXSyf1EXCQMIsSCWIl882lqkVqWwIR1eUIZBMUpOvpD3xN8yNVGXBCHr
	 oHntHAgJ6FeLGC5qcf1CR4A1Pf3EbI3cwFGD8Z2I//ikZbsGz7NIsqfrbctg8mNaPLpIx
	 oXZPv1y2ScFDqc4is4EEGpDa9NMx605HT4WZHHJ6pRWkWu6OdDt1bi5GZbBDH6oS8vNFu
	 eMiXYoDE42xuK2u3k5VfLQcixZLzeZt4QyA4cd7iGAqkOj9SMyaTzpUQD78CsExLeTK+E
	 wn6Gg6ltu3h1v4PzfmBAeIuS1IyxQhkAWrHQdnJ6RcNesYCLGaug+kw2xJ6QsNUU95g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795461722;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=kUiMVzpf7csPD2J4hpTnHdPGrpktVOdCED94Ui72+ls=;
	b=mQmUl3Ve3cZZr9yYE5HYValrs9n1JbN4y4k9GnybOAT2gIHxOKZIFpzFmupiEHfhw49B
	 iZzIIinxcUa4jxtAGU9+l724cxUKsLvdBy0N81s07WgALb9cpnKR0qSYRRiLR+eJVbGU1
	 Q4aP9dW4V6unRsWz9keGOG8Zzaf9VXH4fN6KfQl0Fs4zd2vRqZySUj+RHp+J4C98ENHI+
	 smPteH68u/vH+jqWkjAiuGrACB+VrkB3BVQBXX8zfPxez/2U5Ppgba4J7kP43XteGdEdK
	 mua6zowOT2wDXUwd69PqbTNhmldRUXi74JG6P1z7SHj7QpOpqNcjwyAkgR0ecT26/4w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=N4QbF8JX;
	arc=none smtp.remote-ip=198.175.65.17
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07CC8606A31F
	for <oe-kbuild-all@lists.linux.dev>; Mon, 23 Nov 2026 19:22:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 07CC8606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=N4QbF8JX
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795461722; x=1826997722;
  h=date:from:to:cc:subject:message-id;
  bh=9XwxxJWThdyxjsrC0XxW2DhmjkWmEXiaXvXo7EaCumQ=;
  b=N4QbF8JXqQu/4FJ6dpdjZo1BhcYiZiGdIMs6KyBGV9AWIibnI3d/4ZfS
   1M5x4nzYIjJOJ7UiFobD8rtGDZgzYuFYM2zlQiRnIyJqWML9g2BE6/JFC
   y1ItMLisWgkoMQfXXHkRcq9Qp7bqv8B3HVkRBmk2UAfMxUpmYzoD1ewWd
   xijABWn/0gtaBNyZ/By6OI5cQdo/MshzKa21ZWgj5Dq/T/TRgEAOFnW8E
   nGQuvP9ad7PKCsIw/xE3SMwQCZsk+oLNfGuqRvjylKcO42Zfnx1pzRrH8
   qQtenwXZ2/p+Nboc7qTcG/yQsC83g2Il/PFQZdfFzwcjWMVRFAdCcG4f1
   g==;
X-CSE-ConnectionGUID: gfXUdexmQc2NBZPvpyxqgA==
X-CSE-MsgGUID: JrO7smFcT/q5mToMXAznEw==
X-IronPort-AV: E=McAfee;i="6800,10657,11975"; a="4296493"
X-IronPort-AV: E=Sophos;i="6.27,229,1787036400"; 
   d="scan'208";a="4296493"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2026 11:22:01 -0800
X-CSE-ConnectionGUID: fDnFXB0ySaCsbAol1y8xBQ==
X-CSE-MsgGUID: pB9pZ926SDW7Agsz2+AVvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,229,1787036400"; 
   d="scan'208";a="13364660"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa013.fm.intel.com with ESMTP; 23 Nov 2026 11:21:59 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xVZbw-000000004u9-0fjr;
	Mon, 23 Nov 2026 19:21:56 +0000
Date: Mon, 23 Nov 2026 20:21:27 +0100
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: oe-kbuild-all@lists.linux.dev, Mark Brown <broonie@kernel.org>
Subject: [mda-next:usb-j722s-fix 68/222] do_mounts.c:undefined
 reference to `__st_r13_to_r19'
Message-ID: <20261123201524.iJHCcGa0-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mda/linux-next.git usb-j722s-fix
head:   adcad7f4e6332cff3d6d7165f41584899f598534
commit: 274f32b374f68e4e1cbd9085e656467b9b29ea74 [68/222] Merge branch 'master' of https://git.kernel.org/pub/scm/linux/kernel/git/arnd/asm-generic
config: arc-randconfig-r2106-20261122 (https://download.01.org/0day-ci/archive/20261123/20261123201524.iJHCcGa0-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 12.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261123/20261123201524.iJHCcGa0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/20261123201524.iJHCcGa0-lkp@intel.com/

All errors (new ones prefixed by >>):

   arc-linux-ld: init/main.o: in function `do_early_param':
   main.c:(.init.text+0x8c): undefined reference to `__st_r13_to_r15'
   arc-linux-ld: main.c:(.init.text+0x8c): undefined reference to `__st_r13_to_r15'
   arc-linux-ld: main.c:(.init.text+0xd4): undefined reference to `__ld_r13_to_r15_ret'
   arc-linux-ld: main.c:(.init.text+0xd4): undefined reference to `__ld_r13_to_r15_ret'
   arc-linux-ld: init/main.o: in function `unknown_bootoption':
   main.c:(.init.text+0x1f4): undefined reference to `__st_r13_to_r20'
   arc-linux-ld: main.c:(.init.text+0x1f4): undefined reference to `__st_r13_to_r20'
   arc-linux-ld: main.c:(.init.text+0x328): undefined reference to `__ld_r13_to_r20_ret'
   arc-linux-ld: main.c:(.init.text+0x328): undefined reference to `__ld_r13_to_r20_ret'
   arc-linux-ld: init/main.o: in function `setup_command_line':
   main.c:(.init.text+0x344): undefined reference to `__st_r13_to_r16'
   arc-linux-ld: main.c:(.init.text+0x344): undefined reference to `__st_r13_to_r16'
   arc-linux-ld: main.c:(.init.text+0x3f8): undefined reference to `__ld_r13_to_r16_ret'
   arc-linux-ld: main.c:(.init.text+0x3f8): undefined reference to `__ld_r13_to_r16_ret'
   arc-linux-ld: init/main.o: in function `initcall_blacklist':
   main.c:(.init.text+0x438): undefined reference to `__st_r13_to_r15'
   arc-linux-ld: main.c:(.init.text+0x438): undefined reference to `__st_r13_to_r15'
   arc-linux-ld: main.c:(.init.text+0x45e): undefined reference to `__ld_r13_to_r15_ret'
   arc-linux-ld: main.c:(.init.text+0x45e): undefined reference to `__ld_r13_to_r15_ret'
   arc-linux-ld: init/main.o: in function `initcall_blacklisted':
   main.c:(.init.text+0x4e8): undefined reference to `__st_r13_to_r15'
   arc-linux-ld: main.c:(.init.text+0x4e8): undefined reference to `__st_r13_to_r15'
   arc-linux-ld: main.c:(.init.text+0x522): undefined reference to `__ld_r13_to_r15_ret'
   arc-linux-ld: main.c:(.init.text+0x522): undefined reference to `__ld_r13_to_r15_ret'
   arc-linux-ld: init/main.o: in function `trace_initcall_finish_cb.constprop.0':
   main.c:(.init.text+0x568): undefined reference to `__st_r13_to_r16'
   arc-linux-ld: main.c:(.init.text+0x568): undefined reference to `__st_r13_to_r16'
   arc-linux-ld: main.c:(.init.text+0x632): undefined reference to `__ld_r13_to_r16'
   arc-linux-ld: main.c:(.init.text+0x632): undefined reference to `__ld_r13_to_r16'
   arc-linux-ld: init/main.o: in function `start_kernel':
   main.c:(.init.text+0x6e4): undefined reference to `__st_r13_to_r18'
   arc-linux-ld: main.c:(.init.text+0x6e4): undefined reference to `__st_r13_to_r18'
   arc-linux-ld: init/main.o: in function `do_one_initcall':
   main.c:(.init.text+0xa4c): undefined reference to `__st_r13_to_r17'
   arc-linux-ld: main.c:(.init.text+0xa4c): undefined reference to `__st_r13_to_r17'
   arc-linux-ld: main.c:(.init.text+0xb30): undefined reference to `__ld_r13_to_r17_ret'
   arc-linux-ld: main.c:(.init.text+0xb30): undefined reference to `__ld_r13_to_r17_ret'
   arc-linux-ld: init/main.o: in function `do_initcalls':
   main.c:(.init.text+0xb68): undefined reference to `__st_r13_to_r20'
   arc-linux-ld: main.c:(.init.text+0xb68): undefined reference to `__st_r13_to_r20'
   arc-linux-ld: main.c:(.init.text+0xc88): undefined reference to `__ld_r13_to_r20'
   arc-linux-ld: main.c:(.init.text+0xc88): undefined reference to `__ld_r13_to_r20'
   arc-linux-ld: init/do_mounts.o: in function `do_mount_root':
>> do_mounts.c:(.init.text+0x12c): undefined reference to `__st_r13_to_r19'
>> arc-linux-ld: do_mounts.c:(.init.text+0x12c): undefined reference to `__st_r13_to_r19'
>> arc-linux-ld: do_mounts.c:(.init.text+0x252): undefined reference to `__ld_r13_to_r19_ret'
>> arc-linux-ld: do_mounts.c:(.init.text+0x252): undefined reference to `__ld_r13_to_r19_ret'
   arc-linux-ld: init/do_mounts.o: in function `mount_root_generic':
   do_mounts.c:(.init.text+0x310): undefined reference to `__st_r13_to_r20'
   arc-linux-ld: do_mounts.c:(.init.text+0x310): undefined reference to `__st_r13_to_r20'
   arc-linux-ld: do_mounts.c:(.init.text+0x46c): undefined reference to `__ld_r13_to_r20_ret'
   arc-linux-ld: do_mounts.c:(.init.text+0x46c): undefined reference to `__ld_r13_to_r20_ret'
   arc-linux-ld: init/do_mounts.o: in function `mount_root':
   do_mounts.c:(.init.text+0x558): undefined reference to `__st_r13_to_r21'
   arc-linux-ld: do_mounts.c:(.init.text+0x558): undefined reference to `__st_r13_to_r21'
   arc-linux-ld: do_mounts.c:(.init.text+0x590): undefined reference to `__ld_r13_to_r21'
   arc-linux-ld: do_mounts.c:(.init.text+0x590): undefined reference to `__ld_r13_to_r21'
   arc-linux-ld: do_mounts.c:(.init.text+0x718): undefined reference to `__ld_r13_to_r21_ret'
   arc-linux-ld: do_mounts.c:(.init.text+0x718): undefined reference to `__ld_r13_to_r21_ret'
   arc-linux-ld: init/do_mounts.o: in function `prepare_namespace':
   do_mounts.c:(.init.text+0x720): undefined reference to `__st_r13_to_r15'
   arc-linux-ld: do_mounts.c:(.init.text+0x720): undefined reference to `__st_r13_to_r15'
   arc-linux-ld: do_mounts.c:(.init.text+0x822): undefined reference to `__ld_r13_to_r15'
   arc-linux-ld: do_mounts.c:(.init.text+0x822): undefined reference to `__ld_r13_to_r15'
   arc-linux-ld: init/calibrate.o: in function `calibrate_delay':
   calibrate.c:(.text+0xc): undefined reference to `__st_r13_to_r15'
   arc-linux-ld: calibrate.c:(.text+0xc): undefined reference to `__st_r13_to_r15'
   arc-linux-ld: calibrate.c:(.text+0x78): undefined reference to `__ld_r13_to_r15'
   arc-linux-ld: calibrate.c:(.text+0x78): undefined reference to `__ld_r13_to_r15'
   arc-linux-ld: arch/arc/kernel/setup.o: in function `arcompact_mumbojumbo.constprop.0':
   setup.c:(.text+0x90): undefined reference to `__st_r13_to_r17'
   arc-linux-ld: setup.c:(.text+0x90): undefined reference to `__st_r13_to_r17'
   arc-linux-ld: setup.c:(.text+0x238): undefined reference to `__ld_r13_to_r17_ret'
   arc-linux-ld: setup.c:(.text+0x238): undefined reference to `__ld_r13_to_r17_ret'
   arc-linux-ld: arch/arc/kernel/setup.o: in function `arc_cpu_mumbojumbo.constprop.0':
   setup.c:(.text+0x24c): undefined reference to `__st_r13_to_r20'
   arc-linux-ld: setup.c:(.text+0x24c): undefined reference to `__st_r13_to_r20'
   arc-linux-ld: setup.c:(.text+0x466): undefined reference to `__ld_r13_to_r20_ret'
   arc-linux-ld: setup.c:(.text+0x466): undefined reference to `__ld_r13_to_r20_ret'
   arc-linux-ld: arch/arc/kernel/setup.o: in function `show_cpuinfo':
   setup.c:(.text+0x494): undefined reference to `__st_r13_to_r16'
   arc-linux-ld: setup.c:(.text+0x494): undefined reference to `__st_r13_to_r16'
   arc-linux-ld: setup.c:(.text+0x506): undefined reference to `__ld_r13_to_r16_ret'
   arc-linux-ld: setup.c:(.text+0x506): undefined reference to `__ld_r13_to_r16_ret'
   arc-linux-ld: arch/arc/kernel/irq.o: in function `arch_do_IRQ':
   irq.c:(.text+0x4): undefined reference to `__st_r13_to_r15'
   arc-linux-ld: irq.c:(.text+0x4): undefined reference to `__st_r13_to_r15'
   arc-linux-ld: irq.c:(.text+0x30): undefined reference to `__ld_r13_to_r15'
   arc-linux-ld: irq.c:(.text+0x30): undefined reference to `__ld_r13_to_r15'
   arc-linux-ld: arch/arc/kernel/kprobes.o: in function `setup_singlestep':
   kprobes.c:(.kprobes.text+0x4): undefined reference to `__st_r13_to_r15'
   arc-linux-ld: kprobes.c:(.kprobes.text+0x4): undefined reference to `__st_r13_to_r15'
   arc-linux-ld: kprobes.c:(.kprobes.text+0x92): undefined reference to `__ld_r13_to_r15_ret'
   arc-linux-ld: kprobes.c:(.kprobes.text+0x92): undefined reference to `__ld_r13_to_r15_ret'
   arc-linux-ld: arch/arc/kernel/kprobes.o: in function `kprobe_exceptions_notify':
   kprobes.c:(.kprobes.text+0x264): undefined reference to `__st_r13_to_r17'
   arc-linux-ld: kprobes.c:(.kprobes.text+0x264): undefined reference to `__st_r13_to_r17'
   arc-linux-ld: kprobes.c:(.kprobes.text+0x310): undefined reference to `__ld_r13_to_r17_ret'
   arc-linux-ld: kprobes.c:(.kprobes.text+0x310): undefined reference to `__ld_r13_to_r17_ret'
   arc-linux-ld: arch/arc/mm/init.o: in function `early_init_dt_add_memory_arch':
   init.c:(.init.text+0xc0): undefined reference to `__st_r13_to_r17'
   arc-linux-ld: init.c:(.init.text+0xc0): undefined reference to `__st_r13_to_r17'
   arc-linux-ld: init.c:(.init.text+0x120): undefined reference to `__ld_r13_to_r17'
   arc-linux-ld: init.c:(.init.text+0x120): undefined reference to `__ld_r13_to_r17'
   arc-linux-ld: arch/arc/mm/cache.o: in function `arc_cache_mumbojumbo':
   cache.c:(.text+0x108): undefined reference to `__st_r13_to_r15'
   arc-linux-ld: cache.c:(.text+0x108): undefined reference to `__st_r13_to_r15'
   arc-linux-ld: cache.c:(.text+0x232): undefined reference to `__ld_r13_to_r15_ret'
   arc-linux-ld: cache.c:(.text+0x232): undefined reference to `__ld_r13_to_r15_ret'
   arc-linux-ld: arch/arc/mm/cache.o: in function `flush_icache_range':
   cache.c:(.text+0x268): undefined reference to `__st_r13_to_r15'
   arc-linux-ld: cache.c:(.text+0x268): undefined reference to `__st_r13_to_r15'
   arc-linux-ld: cache.c:(.text+0x2aa): undefined reference to `__ld_r13_to_r15'
   arc-linux-ld: cache.c:(.text+0x2aa): undefined reference to `__ld_r13_to_r15'
   arc-linux-ld: cache.c:(.text+0x2d4): undefined reference to `__ld_r13_to_r15_ret'
   arc-linux-ld: cache.c:(.text+0x2d4): undefined reference to `__ld_r13_to_r15_ret'
   arc-linux-ld: arch/arc/mm/cache.o: in function `copy_user_highpage':
   cache.c:(.text+0x2fc): undefined reference to `__st_r13_to_r16'
   arc-linux-ld: cache.c:(.text+0x2fc): undefined reference to `__st_r13_to_r16'
   arc-linux-ld: cache.c:(.text+0x344): undefined reference to `__ld_r13_to_r16'
   arc-linux-ld: cache.c:(.text+0x344): undefined reference to `__ld_r13_to_r16'
   arc-linux-ld: arch/arc/plat-axs10x/axs10x.o: in function `axs101_set_memmap':
   axs10x.c:(.init.text+0x4): undefined reference to `__st_r13_to_r15'
   arc-linux-ld: axs10x.c:(.init.text+0x4): undefined reference to `__st_r13_to_r15'
   arc-linux-ld: axs10x.c:(.init.text+0x6e): undefined reference to `__ld_r13_to_r15'
   arc-linux-ld: axs10x.c:(.init.text+0x6e): undefined reference to `__ld_r13_to_r15'
   arc-linux-ld: kernel/fork.o: in function `raw_copy_from_user':
   fork.c:(.text+0xe8): undefined reference to `__st_r13_to_r15'
   arc-linux-ld: fork.c:(.text+0xe8): undefined reference to `__st_r13_to_r15'
   arc-linux-ld: fork.c:(.text+0x122): undefined reference to `__ld_r13_to_r15_ret'
   arc-linux-ld: fork.c:(.text+0x122): undefined reference to `__ld_r13_to_r15_ret'
   arc-linux-ld: kernel/fork.o: in function `sysctl_max_threads':
   fork.c:(.text+0x234): undefined reference to `__st_r13_to_r17'
   arc-linux-ld: fork.c:(.text+0x234): undefined reference to `__st_r13_to_r17'
   arc-linux-ld: fork.c:(.text+0x29e): undefined reference to `__ld_r13_to_r17_ret'
   arc-linux-ld: fork.c:(.text+0x29e): undefined reference to `__ld_r13_to_r17_ret'
   arc-linux-ld: kernel/fork.o: in function `copy_signal':
   fork.c:(.text+0x494): undefined reference to `__st_r13_to_r16'
   arc-linux-ld: fork.c:(.text+0x494): undefined reference to `__st_r13_to_r16'
   arc-linux-ld: fork.c:(.text+0x658): undefined reference to `__ld_r13_to_r16_ret'
   arc-linux-ld: fork.c:(.text+0x658): undefined reference to `__ld_r13_to_r16_ret'
   arc-linux-ld: kernel/fork.o: in function `copy_sighand':
   fork.c:(.text+0x740): undefined reference to `__st_r13_to_r17'
   arc-linux-ld: fork.c:(.text+0x740): undefined reference to `__st_r13_to_r17'
   arc-linux-ld: fork.c:(.text+0x782): undefined reference to `__ld_r13_to_r17_ret'
   arc-linux-ld: fork.c:(.text+0x782): undefined reference to `__ld_r13_to_r17_ret'
   arc-linux-ld: kernel/fork.o: in function `__pgd_alloc_noprof.constprop.0':
--
   arc-linux-ld: kernel/fork.o: in function `copy_clone_args_from_user':
   fork.c:(.text+0xc90): undefined reference to `__st_r13_to_r24'
   arc-linux-ld: fork.c:(.text+0xc90): undefined reference to `__st_r13_to_r24'
   arc-linux-ld: fork.c:(.text+0xcd0): undefined reference to `__ld_r13_to_r24_ret'
   arc-linux-ld: fork.c:(.text+0xcd0): undefined reference to `__ld_r13_to_r24_ret'
   arc-linux-ld: kernel/fork.o: in function `dup_task_struct':
   fork.c:(.text+0x1088): undefined reference to `__st_r13_to_r18'
   arc-linux-ld: fork.c:(.text+0x1088): undefined reference to `__st_r13_to_r18'
   arc-linux-ld: fork.c:(.text+0x1238): undefined reference to `__ld_r13_to_r18_ret'
   arc-linux-ld: fork.c:(.text+0x1238): undefined reference to `__ld_r13_to_r18_ret'
   arc-linux-ld: kernel/fork.o: in function `mm_alloc':
   fork.c:(.text+0x1280): undefined reference to `__st_r13_to_r15'
   arc-linux-ld: fork.c:(.text+0x1280): undefined reference to `__st_r13_to_r15'
   arc-linux-ld: fork.c:(.text+0x12ec): undefined reference to `__ld_r13_to_r15'
   arc-linux-ld: fork.c:(.text+0x12ec): undefined reference to `__ld_r13_to_r15'
   arc-linux-ld: fork.c:(.text+0x1332): undefined reference to `__ld_r13_to_r15_ret'
   arc-linux-ld: fork.c:(.text+0x1332): undefined reference to `__ld_r13_to_r15_ret'
   arc-linux-ld: kernel/fork.o: in function `set_mm_exe_file':
   fork.c:(.text+0x133c): undefined reference to `__st_r13_to_r15'
   arc-linux-ld: fork.c:(.text+0x133c): undefined reference to `__st_r13_to_r15'
   arc-linux-ld: fork.c:(.text+0x1378): undefined reference to `__ld_r13_to_r15_ret'
   arc-linux-ld: fork.c:(.text+0x1378): undefined reference to `__ld_r13_to_r15_ret'
   arc-linux-ld: kernel/fork.o: in function `dup_mm.constprop.0':
   fork.c:(.text+0x1488): undefined reference to `__st_r13_to_r17'
   arc-linux-ld: fork.c:(.text+0x1488): undefined reference to `__st_r13_to_r17'
   arc-linux-ld: fork.c:(.text+0x1530): undefined reference to `__ld_r13_to_r17_ret'
   arc-linux-ld: fork.c:(.text+0x1530): undefined reference to `__ld_r13_to_r17_ret'
   arc-linux-ld: kernel/fork.o: in function `replace_mm_exe_file':
   fork.c:(.text+0x1620): undefined reference to `__st_r13_to_r17'
   arc-linux-ld: fork.c:(.text+0x1620): undefined reference to `__st_r13_to_r17'
   arc-linux-ld: fork.c:(.text+0x16d0): undefined reference to `__ld_r13_to_r17_ret'
   arc-linux-ld: fork.c:(.text+0x16d0): undefined reference to `__ld_r13_to_r17_ret'
   arc-linux-ld: kernel/fork.o: in function `mm_access':
   fork.c:(.text+0x1750): undefined reference to `__st_r13_to_r17'
   arc-linux-ld: fork.c:(.text+0x1750): undefined reference to `__st_r13_to_r17'
   arc-linux-ld: fork.c:(.text+0x17b4): undefined reference to `__ld_r13_to_r17_ret'
   arc-linux-ld: fork.c:(.text+0x17b4): undefined reference to `__ld_r13_to_r17_ret'
   arc-linux-ld: kernel/fork.o: in function `pidfd_prepare':
   fork.c:(.text+0x18bc): undefined reference to `__st_r13_to_r17'
   arc-linux-ld: fork.c:(.text+0x18bc): undefined reference to `__st_r13_to_r17'
   arc-linux-ld: fork.c:(.text+0x195c): undefined reference to `__ld_r13_to_r17_ret'
   arc-linux-ld: fork.c:(.text+0x195c): undefined reference to `__ld_r13_to_r17_ret'
   arc-linux-ld: kernel/fork.o: in function `copy_process':
   fork.c:(.text+0x1974): undefined reference to `__st_r13_to_r24'
   arc-linux-ld: fork.c:(.text+0x1974): undefined reference to `__st_r13_to_r24'
   arc-linux-ld: fork.c:(.text+0x19ec): undefined reference to `__ld_r13_to_r24_ret'
   arc-linux-ld: fork.c:(.text+0x19ec): undefined reference to `__ld_r13_to_r24_ret'
   arc-linux-ld: kernel/fork.o: in function `create_io_thread':
   fork.c:(.text+0x2880): undefined reference to `__st_r13_to_r15'
   arc-linux-ld: fork.c:(.text+0x2880): undefined reference to `__st_r13_to_r15'
   arc-linux-ld: fork.c:(.text+0x28d8): undefined reference to `__ld_r13_to_r15_ret'
   arc-linux-ld: fork.c:(.text+0x28d8): undefined reference to `__ld_r13_to_r15_ret'
   arc-linux-ld: kernel/fork.o: in function `kernel_clone':
   fork.c:(.text+0x28e0): undefined reference to `__st_r13_to_r19'
   arc-linux-ld: fork.c:(.text+0x28e0): undefined reference to `__st_r13_to_r19'
   arc-linux-ld: fork.c:(.text+0x29e2): undefined reference to `__ld_r13_to_r19_ret'
   arc-linux-ld: fork.c:(.text+0x29e2): undefined reference to `__ld_r13_to_r19_ret'
   arc-linux-ld: kernel/fork.o: in function `kernel_thread':
   fork.c:(.text+0x2b50): undefined reference to `__st_r13_to_r16'
   arc-linux-ld: fork.c:(.text+0x2b50): undefined reference to `__st_r13_to_r16'
   arc-linux-ld: fork.c:(.text+0x2b9c): undefined reference to `__ld_r13_to_r16_ret'
   arc-linux-ld: fork.c:(.text+0x2b9c): undefined reference to `__ld_r13_to_r16_ret'
   arc-linux-ld: kernel/fork.o: in function `user_mode_thread':
   fork.c:(.text+0x2ba4): undefined reference to `__st_r13_to_r15'
   arc-linux-ld: fork.c:(.text+0x2ba4): undefined reference to `__st_r13_to_r15'
   arc-linux-ld: fork.c:(.text+0x2be6): undefined reference to `__ld_r13_to_r15_ret'
   arc-linux-ld: fork.c:(.text+0x2be6): undefined reference to `__ld_r13_to_r15_ret'
   arc-linux-ld: kernel/fork.o: in function `__se_sys_clone':
   fork.c:(.text+0x2c44): undefined reference to `__st_r13_to_r17'
   arc-linux-ld: fork.c:(.text+0x2c44): undefined reference to `__st_r13_to_r17'
   arc-linux-ld: fork.c:(.text+0x2c94): undefined reference to `__ld_r13_to_r17_ret'
   arc-linux-ld: fork.c:(.text+0x2c94): undefined reference to `__ld_r13_to_r17_ret'
   arc-linux-ld: kernel/fork.o: in function `walk_process_tree':
   fork.c:(.text+0x2ca0): undefined reference to `__st_r13_to_r19'
   arc-linux-ld: fork.c:(.text+0x2ca0): undefined reference to `__st_r13_to_r19'
   arc-linux-ld: fork.c:(.text+0x2d64): undefined reference to `__ld_r13_to_r19'
   arc-linux-ld: fork.c:(.text+0x2d64): undefined reference to `__ld_r13_to_r19'
   arc-linux-ld: fork.c:(.text+0x2d7a): undefined reference to `__ld_r13_to_r19_ret'
   arc-linux-ld: fork.c:(.text+0x2d7a): undefined reference to `__ld_r13_to_r19_ret'
   arc-linux-ld: kernel/fork.o: in function `ksys_unshare':
   fork.c:(.text+0x2d84): undefined reference to `__st_r13_to_r15'
   arc-linux-ld: fork.c:(.text+0x2d84): undefined reference to `__st_r13_to_r15'
   arc-linux-ld: fork.c:(.text+0x2df6): undefined reference to `__ld_r13_to_r15_ret'
   arc-linux-ld: fork.c:(.text+0x2df6): undefined reference to `__ld_r13_to_r15_ret'
   arc-linux-ld: kernel/fork.o: in function `kmem_cache_create_usercopy.constprop.0':
   fork.c:(.text.unlikely+0x58): undefined reference to `__st_r13_to_r18'
   arc-linux-ld: fork.c:(.text.unlikely+0x58): undefined reference to `__st_r13_to_r18'
   arc-linux-ld: fork.c:(.text.unlikely+0xa2): undefined reference to `__ld_r13_to_r18_ret'
   arc-linux-ld: fork.c:(.text.unlikely+0xa2): undefined reference to `__ld_r13_to_r18_ret'
   arc-linux-ld: kernel/fork.o: in function `__kmem_cache_create.constprop.0':
   fork.c:(.text.unlikely+0xac): undefined reference to `__st_r13_to_r16'
   arc-linux-ld: fork.c:(.text.unlikely+0xac): undefined reference to `__st_r13_to_r16'
   arc-linux-ld: fork.c:(.text.unlikely+0xe2): undefined reference to `__ld_r13_to_r16_ret'
   arc-linux-ld: fork.c:(.text.unlikely+0xe2): undefined reference to `__ld_r13_to_r16_ret'
   arc-linux-ld: kernel/fork.o: in function `fork_init':
   fork.c:(.init.text+0x68): undefined reference to `__st_r13_to_r15'
   arc-linux-ld: fork.c:(.init.text+0x68): undefined reference to `__st_r13_to_r15'
   arc-linux-ld: fork.c:(.init.text+0x15e): undefined reference to `__ld_r13_to_r15_ret'
   arc-linux-ld: fork.c:(.init.text+0x15e): undefined reference to `__ld_r13_to_r15_ret'
   arc-linux-ld: kernel/exec_state.o: in function `alloc_task_exec_state':
>> exec_state.c:(.text+0xcc): undefined reference to `__st_r13_to_r16'
>> arc-linux-ld: exec_state.c:(.text+0xcc): undefined reference to `__st_r13_to_r16'
>> arc-linux-ld: exec_state.c:(.text+0x1a2): undefined reference to `__ld_r13_to_r16_ret'
>> arc-linux-ld: exec_state.c:(.text+0x1a2): undefined reference to `__ld_r13_to_r16_ret'
   arc-linux-ld: kernel/panic.o: in function `sysctl_panic_print_handler':
   panic.c:(.text+0x158): undefined reference to `__st_r13_to_r17'
   arc-linux-ld: panic.c:(.text+0x158): undefined reference to `__st_r13_to_r17'
   arc-linux-ld: panic.c:(.text+0x184): undefined reference to `__ld_r13_to_r17'
   arc-linux-ld: panic.c:(.text+0x184): undefined reference to `__ld_r13_to_r17'
   arc-linux-ld: kernel/panic.o: in function `_print_tainted':
   panic.c:(.text+0x1f8): undefined reference to `__st_r13_to_r16'
   arc-linux-ld: panic.c:(.text+0x1f8): undefined reference to `__st_r13_to_r16'
   arc-linux-ld: panic.c:(.text+0x268): undefined reference to `__ld_r13_to_r16_ret'
   arc-linux-ld: panic.c:(.text+0x268): undefined reference to `__ld_r13_to_r16_ret'
   arc-linux-ld: kernel/panic.o: in function `do_oops_enter_exit.part.0':
   panic.c:(.text+0x2f0): undefined reference to `__st_r13_to_r16'
   arc-linux-ld: panic.c:(.text+0x2f0): undefined reference to `__st_r13_to_r16'
   arc-linux-ld: panic.c:(.text+0x334): undefined reference to `__ld_r13_to_r16'
   arc-linux-ld: panic.c:(.text+0x334): undefined reference to `__ld_r13_to_r16'
   arc-linux-ld: panic.c:(.text+0x3ea): undefined reference to `__ld_r13_to_r16_ret'
   arc-linux-ld: panic.c:(.text+0x3ea): undefined reference to `__ld_r13_to_r16_ret'
   arc-linux-ld: kernel/panic.o: in function `add_taint':
   panic.c:(.text+0x514): undefined reference to `__st_r13_to_r15'
   arc-linux-ld: panic.c:(.text+0x514): undefined reference to `__st_r13_to_r15'
   arc-linux-ld: panic.c:(.text+0x5b0): undefined reference to `__ld_r13_to_r15_ret'
   arc-linux-ld: panic.c:(.text+0x5b0): undefined reference to `__ld_r13_to_r15_ret'
   arc-linux-ld: kernel/panic.o: in function `proc_taint':
   panic.c:(.text+0x5b8): undefined reference to `__st_r13_to_r18'
   arc-linux-ld: panic.c:(.text+0x5b8): undefined reference to `__st_r13_to_r18'
   arc-linux-ld: panic.c:(.text+0x622): undefined reference to `__ld_r13_to_r18_ret'
   arc-linux-ld: panic.c:(.text+0x622): undefined reference to `__ld_r13_to_r18_ret'
   arc-linux-ld: kernel/panic.o: in function `__warn':
   panic.c:(.text+0x6f8): undefined reference to `__st_r13_to_r18'
   arc-linux-ld: panic.c:(.text+0x6f8): undefined reference to `__st_r13_to_r18'
   arc-linux-ld: panic.c:(.text+0x76e): undefined reference to `__ld_r13_to_r18'
   arc-linux-ld: panic.c:(.text+0x76e): undefined reference to `__ld_r13_to_r18'
   arc-linux-ld: kernel/panic.o: in function `warn_slowpath_fmt':
   panic.c:(.text+0x7ba): undefined reference to `__st_r13_to_r19'
   arc-linux-ld: panic.c:(.text+0x7ba): undefined reference to `__st_r13_to_r19'
   arc-linux-ld: panic.c:(.text+0x86e): undefined reference to `__ld_r13_to_r19'
   arc-linux-ld: panic.c:(.text+0x86e): undefined reference to `__ld_r13_to_r19'
   arc-linux-ld: kernel/panic.o: in function `alloc_taint_buf':
   panic.c:(.init.text+0x15c): undefined reference to `__st_r13_to_r15'
   arc-linux-ld: panic.c:(.init.text+0x15c): undefined reference to `__st_r13_to_r15'
   arc-linux-ld: panic.c:(.init.text+0x218): undefined reference to `__ld_r13_to_r15_ret'
   arc-linux-ld: panic.c:(.init.text+0x218): undefined reference to `__ld_r13_to_r15_ret'
   arc-linux-ld: kernel/panic.o: in function `vpanic':
   panic.c:(.text.unlikely+0xc): undefined reference to `__st_r13_to_r17'
   arc-linux-ld: panic.c:(.text.unlikely+0xc): undefined reference to `__st_r13_to_r17'
   arc-linux-ld: kernel/cpu.o: in function `cpuhp_invoke_callback.constprop.0':
   cpu.c:(.text+0x10c): undefined reference to `__st_r13_to_r19'
   arc-linux-ld: cpu.c:(.text+0x10c): undefined reference to `__st_r13_to_r19'
   arc-linux-ld: cpu.c:(.text+0x140): undefined reference to `__ld_r13_to_r19_ret'
   arc-linux-ld: cpu.c:(.text+0x140): undefined reference to `__ld_r13_to_r19_ret'
   arc-linux-ld: cpu.c:(.text+0x162): undefined reference to `__ld_r13_to_r19'
   arc-linux-ld: cpu.c:(.text+0x162): undefined reference to `__ld_r13_to_r19'
   arc-linux-ld: cpu.c:(.text+0x1a4): undefined reference to `__ld_r13_to_r19'
   arc-linux-ld: cpu.c:(.text+0x1a4): undefined reference to `__ld_r13_to_r19'
   arc-linux-ld: kernel/cpu.o: in function `cpuhp_issue_call.constprop.0':
   cpu.c:(.text+0x230): undefined reference to `__st_r13_to_r16'
   arc-linux-ld: cpu.c:(.text+0x230): undefined reference to `__st_r13_to_r16'
   arc-linux-ld: cpu.c:(.text+0x2de): undefined reference to `__ld_r13_to_r16_ret'
   arc-linux-ld: cpu.c:(.text+0x2de): undefined reference to `__ld_r13_to_r16_ret'
   arc-linux-ld: kernel/cpu.o: in function `__cpuhp_remove_state_cpuslocked':
   cpu.c:(.text+0x2fc): undefined reference to `__st_r13_to_r15'
   arc-linux-ld: cpu.c:(.text+0x2fc): undefined reference to `__st_r13_to_r15'
   arc-linux-ld: cpu.c:(.text+0x366): undefined reference to `__ld_r13_to_r15'
   arc-linux-ld: cpu.c:(.text+0x366): undefined reference to `__ld_r13_to_r15'
   arc-linux-ld: kernel/cpu.o: in function `__cpuhp_state_remove_instance':
   cpu.c:(.text+0x3cc): undefined reference to `__st_r13_to_r16'
   arc-linux-ld: cpu.c:(.text+0x3cc): undefined reference to `__st_r13_to_r16'
   arc-linux-ld: cpu.c:(.text+0x43a): undefined reference to `__ld_r13_to_r16_ret'
   arc-linux-ld: cpu.c:(.text+0x43a): undefined reference to `__ld_r13_to_r16_ret'
   arc-linux-ld: kernel/cpu.o: in function `__cpuhp_setup_state_cpuslocked':
   cpu.c:(.text+0x490): undefined reference to `__st_r13_to_r18'
   arc-linux-ld: cpu.c:(.text+0x490): undefined reference to `__st_r13_to_r18'
   arc-linux-ld: cpu.c:(.text+0x596): undefined reference to `__ld_r13_to_r18_ret'
   arc-linux-ld: cpu.c:(.text+0x596): undefined reference to `__ld_r13_to_r18_ret'
   arc-linux-ld: kernel/cpu.o: in function `__cpuhp_state_add_instance_cpuslocked':
   cpu.c:(.text+0x5b0): undefined reference to `__st_r13_to_r17'
   arc-linux-ld: cpu.c:(.text+0x5b0): undefined reference to `__st_r13_to_r17'
   arc-linux-ld: cpu.c:(.text+0x63c): undefined reference to `__ld_r13_to_r17_ret'
   arc-linux-ld: cpu.c:(.text+0x63c): undefined reference to `__ld_r13_to_r17_ret'
   arc-linux-ld: kernel/cpu.o: in function `set_cpu_online':
   cpu.c:(.text+0x68c): undefined reference to `__st_r13_to_r15'
   arc-linux-ld: cpu.c:(.text+0x68c): undefined reference to `__st_r13_to_r15'
   arc-linux-ld: cpu.c:(.text+0x6d4): undefined reference to `__ld_r13_to_r15_ret'
   arc-linux-ld: cpu.c:(.text+0x6d4): undefined reference to `__ld_r13_to_r15_ret'
   arc-linux-ld: kernel/cpu.o: in function `set_cpu_possible':
   cpu.c:(.text+0x6fc): undefined reference to `__st_r13_to_r15'
   arc-linux-ld: cpu.c:(.text+0x6fc): undefined reference to `__st_r13_to_r15'
   arc-linux-ld: cpu.c:(.text+0x73c): undefined reference to `__ld_r13_to_r15_ret'
   arc-linux-ld: cpu.c:(.text+0x73c): undefined reference to `__ld_r13_to_r15_ret'
   arc-linux-ld: kernel/cpu.o: in function `mitigations_parse_cmdline':
   cpu.c:(.init.text+0x4): undefined reference to `__st_r13_to_r16'
   arc-linux-ld: cpu.c:(.init.text+0x4): undefined reference to `__st_r13_to_r16'
   arc-linux-ld: cpu.c:(.init.text+0xae): undefined reference to `__ld_r13_to_r16_ret'
   arc-linux-ld: cpu.c:(.init.text+0xae): undefined reference to `__ld_r13_to_r16_ret'
   arc-linux-ld: kernel/exit.o: in function `will_become_orphaned_pgrp':
   exit.c:(.text+0x80): undefined reference to `__st_r13_to_r15'
   arc-linux-ld: exit.c:(.text+0x80): undefined reference to `__st_r13_to_r15'
   arc-linux-ld: exit.c:(.text+0xa0): undefined reference to `__ld_r13_to_r15_ret'
   arc-linux-ld: exit.c:(.text+0xa0): undefined reference to `__ld_r13_to_r15_ret'
   arc-linux-ld: kernel/exit.o: in function `try_to_set_owner':
..

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
