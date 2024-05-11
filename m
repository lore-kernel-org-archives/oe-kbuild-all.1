Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B5714E1CB
	for <oe-kbuild-all@lists.linux.dev>; Sat, 11 May 2024 05:30:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715405456; cv=none; b=NAgvakbGDr7bMaWIGv7KGoDaWOL8boAI6CrTdKI2OWeN2HCyuYyXbDdBy4o2xFd1reNE2nvuUz/3L5gm1NX4/fydI3y+4BKYsY9eIjYKZYpca3V7hVvX0zKi138PEWlxYjHPuUlDIpGjRj7tjUmVnTPCunDRHCXZwx3M9ANcINA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715405456; c=relaxed/simple;
	bh=aVTegNBZGaPui6n2vYEVbQIlKFLd1L4KktWcgbuTfcI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=firxPscAERTcjQHyL0NfUYePxjRGezRYOqh2sos7YagiXSs35Z5Q022l41BqWv4qHhkVXQKXiEEAIPzgKgOm1Xs0PZcHETWAOgbvfh53n5i8Vho+aybaTnAn0odOov+i7jpSTuC96zigleM0SqxWBVGrbe2RaPj9TbQ59ikwuHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TmoohX+5; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TmoohX+5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715405455; x=1746941455;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=aVTegNBZGaPui6n2vYEVbQIlKFLd1L4KktWcgbuTfcI=;
  b=TmoohX+5eeULjZRonvUoiYjnBfdn6mAEk7gisZ0vjaqWxqV/dSt1F/vL
   Eyrf53VgTj8/JNjrkzbZnSQqJgW27z4VWgO7hEnilhzNLjXt7RZRX/5Wu
   M4HJEJo4zsq8PVBVGZorTKM76teDnhNzqROyDHTaJ53u167WS5B+90YtG
   +SF7gWKWDPaDVbuAPXP+V5Br5tyz+gzw1NTmZJfqxkKLmOipiZYYJePbJ
   OyzU/fk9ypAXe4CjFBSZeXUapg6tAzJ+NuRW7/2HEy2t1zWFz0VfuVxx6
   v7KxTTTL3Uk7ip9a1+GMe/JWb2ytPBbFoCP6mNpg3R/Mk3xehfiALUmGe
   Q==;
X-CSE-ConnectionGUID: s9Rrs3ctT6y5DCCIXutVCg==
X-CSE-MsgGUID: Tun7cyw+SSyRwVUnNwIceQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11069"; a="11627150"
X-IronPort-AV: E=Sophos;i="6.08,153,1712646000"; 
   d="scan'208";a="11627150"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2024 22:30:54 -0700
X-CSE-ConnectionGUID: tVETFOLpQxuQthrtSsacmw==
X-CSE-MsgGUID: AuYp6v0gQ4K4qn4M8e24OQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,153,1712646000"; 
   d="scan'208";a="34347205"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 10 May 2024 22:30:48 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s5fJl-0006yf-2D;
	Sat, 11 May 2024 05:30:45 +0000
Date: Sat, 11 May 2024 13:30:01 +0800
From: kernel test robot <lkp@intel.com>
To: Maxwell Bland <mbland@motorola.com>, linux-mm@kvack.org
Cc: oe-kbuild-all@lists.linux.dev,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	John Fastabend <john.fastabend@gmail.com>,
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@google.com>,
	Hao Luo <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>,
	Zi Shen Lim <zlim.lnx@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>,
	Uladzislau Rezki <urezki@gmail.com>,
	Christoph Hellwig <hch@infradead.org>,
	Lorenzo Stoakes <lstoakes@gmail.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Maxwell Bland <mbland@motorola.com>,
	Russell King <linux@armlinux.org.uk>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Shaoqin Huang <shahuang@redhat.com>,
	Ryo Takakura <takakura@valinux.co.jp>,
	James Morse <james.morse@arm.com>,
	Ryan Roberts <ryan.roberts@arm.com>
Subject: Re: [PATCH v5 1/2] mm: allow dynamic vmalloc range restrictions
Message-ID: <202405111325.7IRuG4ZE-lkp@intel.com>
References: <ozcyvkcdqhxhlg3sjz3s4odt7ejiwx2cctgb7sdx6jbardui37@al6uvt4yx5nt>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ozcyvkcdqhxhlg3sjz3s4odt7ejiwx2cctgb7sdx6jbardui37@al6uvt4yx5nt>

Hi Maxwell,

kernel test robot noticed the following build errors:

[auto build test ERROR on ee5b455b0adae9ecafb38b174c648c48f2a3c1a5]

url:    https://github.com/intel-lab-lkp/linux/commits/Maxwell-Bland/arm64-mm-code-and-data-allocation-partitioning/20240510-022822
base:   ee5b455b0adae9ecafb38b174c648c48f2a3c1a5
patch link:    https://lore.kernel.org/r/ozcyvkcdqhxhlg3sjz3s4odt7ejiwx2cctgb7sdx6jbardui37%40al6uvt4yx5nt
patch subject: [PATCH v5 1/2] mm: allow dynamic vmalloc range restrictions
config: openrisc-defconfig (https://download.01.org/0day-ci/archive/20240511/202405111325.7IRuG4ZE-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240511/202405111325.7IRuG4ZE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405111325.7IRuG4ZE-lkp@intel.com/

All errors (new ones prefixed by >>):

   or1k-linux-ld: init/do_mounts.o: in function `arch_init_checked_vmap_ranges':
>> do_mounts.c:(.init.text+0x53c): multiple definition of `arch_init_checked_vmap_ranges'; init/main.o:main.c:(.init.text+0xa54): first defined here
   or1k-linux-ld: init/do_mounts_initrd.o: in function `arch_init_checked_vmap_ranges':
   do_mounts_initrd.c:(.init.text+0x100): multiple definition of `arch_init_checked_vmap_ranges'; init/main.o:main.c:(.init.text+0xa54): first defined here
   or1k-linux-ld: init/initramfs.o: in function `arch_init_checked_vmap_ranges':
   initramfs.c:(.init.text+0x13b4): multiple definition of `arch_init_checked_vmap_ranges'; init/main.o:main.c:(.init.text+0xa54): first defined here
   or1k-linux-ld: init/init_task.o: in function `arch_init_checked_vmap_ranges':
   init_task.c:(.init.text+0x0): multiple definition of `arch_init_checked_vmap_ranges'; init/main.o:main.c:(.init.text+0xa54): first defined here
   or1k-linux-ld: arch/openrisc/kernel/setup.o: in function `arch_init_checked_vmap_ranges':
   setup.c:(.init.text+0x6c): multiple definition of `arch_init_checked_vmap_ranges'; init/main.o:main.c:(.init.text+0xa54): first defined here
   or1k-linux-ld: arch/openrisc/kernel/or32_ksyms.o: in function `arch_init_checked_vmap_ranges':
   or32_ksyms.c:(.init.text+0x0): multiple definition of `arch_init_checked_vmap_ranges'; init/main.o:main.c:(.init.text+0xa54): first defined here
   or1k-linux-ld: arch/openrisc/kernel/process.o: in function `arch_init_checked_vmap_ranges':
   process.c:(.init.text+0x0): multiple definition of `arch_init_checked_vmap_ranges'; init/main.o:main.c:(.init.text+0xa54): first defined here
   or1k-linux-ld: arch/openrisc/kernel/dma.o: in function `arch_init_checked_vmap_ranges':
   dma.c:(.init.text+0x0): multiple definition of `arch_init_checked_vmap_ranges'; init/main.o:main.c:(.init.text+0xa54): first defined here
   or1k-linux-ld: arch/openrisc/kernel/traps.o: in function `arch_init_checked_vmap_ranges':
   traps.c:(.init.text+0x0): multiple definition of `arch_init_checked_vmap_ranges'; init/main.o:main.c:(.init.text+0xa54): first defined here
   or1k-linux-ld: arch/openrisc/kernel/time.o: in function `arch_init_checked_vmap_ranges':
   time.c:(.init.text+0x0): multiple definition of `arch_init_checked_vmap_ranges'; init/main.o:main.c:(.init.text+0xa54): first defined here
   or1k-linux-ld: arch/openrisc/kernel/irq.o: in function `arch_init_checked_vmap_ranges':
   irq.c:(.init.text+0x0): multiple definition of `arch_init_checked_vmap_ranges'; init/main.o:main.c:(.init.text+0xa54): first defined here
   or1k-linux-ld: arch/openrisc/kernel/signal.o: in function `arch_init_checked_vmap_ranges':
   signal.c:(.init.text+0x0): multiple definition of `arch_init_checked_vmap_ranges'; init/main.o:main.c:(.init.text+0xa54): first defined here
   or1k-linux-ld: arch/openrisc/kernel/sys_call_table.o: in function `arch_init_checked_vmap_ranges':
   sys_call_table.c:(.init.text+0x0): multiple definition of `arch_init_checked_vmap_ranges'; init/main.o:main.c:(.init.text+0xa54): first defined here
   or1k-linux-ld: arch/openrisc/mm/fault.o: in function `arch_init_checked_vmap_ranges':
   fault.c:(.init.text+0x0): multiple definition of `arch_init_checked_vmap_ranges'; init/main.o:main.c:(.init.text+0xa54): first defined here
   or1k-linux-ld: arch/openrisc/mm/init.o: in function `arch_init_checked_vmap_ranges':
   init.c:(.init.text+0x21c): multiple definition of `arch_init_checked_vmap_ranges'; init/main.o:main.c:(.init.text+0xa54): first defined here
   or1k-linux-ld: arch/openrisc/mm/ioremap.o: in function `arch_init_checked_vmap_ranges':
   ioremap.c:(.init.text+0x0): multiple definition of `arch_init_checked_vmap_ranges'; init/main.o:main.c:(.init.text+0xa54): first defined here
   or1k-linux-ld: kernel/fork.o: in function `arch_init_checked_vmap_ranges':
   fork.c:(.init.text+0x40): multiple definition of `arch_init_checked_vmap_ranges'; init/main.o:main.c:(.init.text+0xa54): first defined here
   or1k-linux-ld: kernel/exec_domain.o: in function `arch_init_checked_vmap_ranges':
   exec_domain.c:(.init.text+0x44): multiple definition of `arch_init_checked_vmap_ranges'; init/main.o:main.c:(.init.text+0xa54): first defined here
   or1k-linux-ld: kernel/panic.o: in function `arch_init_checked_vmap_ranges':
   panic.c:(.init.text+0x204): multiple definition of `arch_init_checked_vmap_ranges'; init/main.o:main.c:(.init.text+0xa54): first defined here
   or1k-linux-ld: kernel/cpu.o: in function `arch_init_checked_vmap_ranges':
   cpu.c:(.init.text+0xb0): multiple definition of `arch_init_checked_vmap_ranges'; init/main.o:main.c:(.init.text+0xa54): first defined here
   or1k-linux-ld: kernel/exit.o: in function `arch_init_checked_vmap_ranges':
   exit.c:(.init.text+0x84): multiple definition of `arch_init_checked_vmap_ranges'; init/main.o:main.c:(.init.text+0xa54): first defined here
   or1k-linux-ld: kernel/softirq.o: in function `arch_init_checked_vmap_ranges':
   softirq.c:(.init.text+0x8c): multiple definition of `arch_init_checked_vmap_ranges'; init/main.o:main.c:(.init.text+0xa54): first defined here
   or1k-linux-ld: kernel/resource.o: in function `arch_init_checked_vmap_ranges':
   resource.c:(.init.text+0x2dc): multiple definition of `arch_init_checked_vmap_ranges'; init/main.o:main.c:(.init.text+0xa54): first defined here
   or1k-linux-ld: kernel/sysctl.o: in function `arch_init_checked_vmap_ranges':
   sysctl.c:(.init.text+0x0): multiple definition of `arch_init_checked_vmap_ranges'; init/main.o:main.c:(.init.text+0xa54): first defined here
   or1k-linux-ld: kernel/capability.o: in function `arch_init_checked_vmap_ranges':
   capability.c:(.init.text+0x2c): multiple definition of `arch_init_checked_vmap_ranges'; init/main.o:main.c:(.init.text+0xa54): first defined here
   or1k-linux-ld: kernel/ptrace.o: in function `arch_init_checked_vmap_ranges':
   ptrace.c:(.init.text+0x0): multiple definition of `arch_init_checked_vmap_ranges'; init/main.o:main.c:(.init.text+0xa54): first defined here
   or1k-linux-ld: kernel/user.o: in function `arch_init_checked_vmap_ranges':
   user.c:(.init.text+0xb0): multiple definition of `arch_init_checked_vmap_ranges'; init/main.o:main.c:(.init.text+0xa54): first defined here
   or1k-linux-ld: kernel/signal.o: in function `arch_init_checked_vmap_ranges':
   signal.c:(.init.text+0x84): multiple definition of `arch_init_checked_vmap_ranges'; init/main.o:main.c:(.init.text+0xa54): first defined here
   or1k-linux-ld: kernel/sys.o: in function `arch_init_checked_vmap_ranges':
   sys.c:(.init.text+0x0): multiple definition of `arch_init_checked_vmap_ranges'; init/main.o:main.c:(.init.text+0xa54): first defined here
   or1k-linux-ld: kernel/umh.o: in function `arch_init_checked_vmap_ranges':
   umh.c:(.init.text+0x48): multiple definition of `arch_init_checked_vmap_ranges'; init/main.o:main.c:(.init.text+0xa54): first defined here
   or1k-linux-ld: kernel/workqueue.o: in function `arch_init_checked_vmap_ranges':
   workqueue.c:(.init.text+0x7e8): multiple definition of `arch_init_checked_vmap_ranges'; init/main.o:main.c:(.init.text+0xa54): first defined here
   or1k-linux-ld: kernel/pid.o: in function `arch_init_checked_vmap_ranges':
   pid.c:(.init.text+0x0): multiple definition of `arch_init_checked_vmap_ranges'; init/main.o:main.c:(.init.text+0xa54): first defined here
   or1k-linux-ld: kernel/task_work.o: in function `arch_init_checked_vmap_ranges':
   task_work.c:(.init.text+0x0): multiple definition of `arch_init_checked_vmap_ranges'; init/main.o:main.c:(.init.text+0xa54): first defined here
   or1k-linux-ld: kernel/extable.o: in function `arch_init_checked_vmap_ranges':
   extable.c:(.init.text+0x0): multiple definition of `arch_init_checked_vmap_ranges'; init/main.o:main.c:(.init.text+0xa54): first defined here
   or1k-linux-ld: kernel/params.o: in function `arch_init_checked_vmap_ranges':
   params.c:(.init.text+0x444): multiple definition of `arch_init_checked_vmap_ranges'; init/main.o:main.c:(.init.text+0xa54): first defined here
   or1k-linux-ld: kernel/kthread.o: in function `arch_init_checked_vmap_ranges':
   kthread.c:(.init.text+0x0): multiple definition of `arch_init_checked_vmap_ranges'; init/main.o:main.c:(.init.text+0xa54): first defined here
   or1k-linux-ld: kernel/nsproxy.o: in function `arch_init_checked_vmap_ranges':
   nsproxy.c:(.init.text+0x48): multiple definition of `arch_init_checked_vmap_ranges'; init/main.o:main.c:(.init.text+0xa54): first defined here
   or1k-linux-ld: kernel/notifier.o: in function `arch_init_checked_vmap_ranges':
   notifier.c:(.init.text+0x0): multiple definition of `arch_init_checked_vmap_ranges'; init/main.o:main.c:(.init.text+0xa54): first defined here
   or1k-linux-ld: kernel/ksysfs.o: in function `arch_init_checked_vmap_ranges':
   ksysfs.c:(.init.text+0xe0): multiple definition of `arch_init_checked_vmap_ranges'; init/main.o:main.c:(.init.text+0xa54): first defined here
   or1k-linux-ld: kernel/cred.o: in function `arch_init_checked_vmap_ranges':
   cred.c:(.init.text+0x44): multiple definition of `arch_init_checked_vmap_ranges'; init/main.o:main.c:(.init.text+0xa54): first defined here
   or1k-linux-ld: kernel/reboot.o: in function `arch_init_checked_vmap_ranges':
   reboot.c:(.init.text+0x2c0): multiple definition of `arch_init_checked_vmap_ranges'; init/main.o:main.c:(.init.text+0xa54): first defined here
   or1k-linux-ld: kernel/ucount.o: in function `arch_init_checked_vmap_ranges':
   ucount.c:(.init.text+0x0): multiple definition of `arch_init_checked_vmap_ranges'; init/main.o:main.c:(.init.text+0xa54): first defined here
   or1k-linux-ld: kernel/ksyms_common.o: in function `arch_init_checked_vmap_ranges':
   ksyms_common.c:(.init.text+0x0): multiple definition of `arch_init_checked_vmap_ranges'; init/main.o:main.c:(.init.text+0xa54): first defined here
   or1k-linux-ld: kernel/groups.o: in function `arch_init_checked_vmap_ranges':
   groups.c:(.init.text+0x0): multiple definition of `arch_init_checked_vmap_ranges'; init/main.o:main.c:(.init.text+0xa54): first defined here
   or1k-linux-ld: kernel/sched/core.o: in function `arch_init_checked_vmap_ranges':
   core.c:(.init.text+0x44): multiple definition of `arch_init_checked_vmap_ranges'; init/main.o:main.c:(.init.text+0xa54): first defined here
   or1k-linux-ld: kernel/sched/fair.o: in function `arch_init_checked_vmap_ranges':
   fair.c:(.init.text+0xbc): multiple definition of `arch_init_checked_vmap_ranges'; init/main.o:main.c:(.init.text+0xa54): first defined here
   or1k-linux-ld: kernel/sched/build_policy.o: in function `arch_init_checked_vmap_ranges':
   build_policy.c:(.init.text+0x90): multiple definition of `arch_init_checked_vmap_ranges'; init/main.o:main.c:(.init.text+0xa54): first defined here
   or1k-linux-ld: kernel/sched/build_utility.o: in function `arch_init_checked_vmap_ranges':
   build_utility.c:(.init.text+0x44): multiple definition of `arch_init_checked_vmap_ranges'; init/main.o:main.c:(.init.text+0xa54): first defined here
   or1k-linux-ld: kernel/locking/mutex.o: in function `arch_init_checked_vmap_ranges':
   mutex.c:(.init.text+0x0): multiple definition of `arch_init_checked_vmap_ranges'; init/main.o:main.c:(.init.text+0xa54): first defined here
   or1k-linux-ld: kernel/locking/semaphore.o: in function `arch_init_checked_vmap_ranges':
   semaphore.c:(.init.text+0x0): multiple definition of `arch_init_checked_vmap_ranges'; init/main.o:main.c:(.init.text+0xa54): first defined here
   or1k-linux-ld: kernel/power/qos.o: in function `arch_init_checked_vmap_ranges':
   qos.c:(.init.text+0x0): multiple definition of `arch_init_checked_vmap_ranges'; init/main.o:main.c:(.init.text+0xa54): first defined here

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
