Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21DB38C1F
	for <oe-kbuild-all@lists.linux.dev>; Thu, 23 Oct 2025 01:18:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761182298; cv=none; b=Gi0fulloXrANxfNNhmNPlylJ/NRpt0tujLNK4paLH9PvCVEX1gNb/sQgVVKiG+oeNnrN4IIPLN0I3xRhevXfo4SLQc5KgHjPM9euLaNQ3tKlDPo51n7KQhZWLNaEkYkNeyRCB17udZO1syN+y7po0UZHrUKTiy/CcvHgm+X0HCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761182298; c=relaxed/simple;
	bh=cE67swjPZb3m7dV8YMWA2Z96dpRZM0RBsKs5bweljo0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JhA6WMmzSSOhxBpa2A2jyLtYQXSs0Y8rp3xVyETGgYUgEsqlirxa6pmca60Bg0GAA/njnRw0iEUx68n9kqUVblPImVbpcQQWDLGCJRIj64DPTfw5N/dDnXMyoU6UNgQ+XrXdGJbg9L5TPPjurc3WP8AakJ82lVp0FNfB/RYd6Xc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hxARFQOh; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hxARFQOh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761182296; x=1792718296;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cE67swjPZb3m7dV8YMWA2Z96dpRZM0RBsKs5bweljo0=;
  b=hxARFQOhq/1ZJYQhexSxKnBzTJwXU8awpqulNAwEkjzBFq42K5L0bmD5
   ldJ6XxQ5AoNaAXfkW4YqeGc9WeNTDIy/VuK4TnqbDvqLkufuPLVAaRLZo
   OKfFwrwWuQc3RMx6pU1GQXUfu4i5WIlRCXFI6I+rRCrpM8xYmWfVXQzM4
   RIGBoKflcU3s57mlabgEeKGv3qFvs1W6CCDccT8RuBq3bIgCmclW5R6lR
   k1A2wEYdRp5k7xhhKlm3ILQOJc0vsVtXgmfC2dixlU25E1Wfu44MSD+kz
   s2Unb7v4/Hzao6YoXkusB5OGorPjpwVIevL76mNVrrSpceqShYIUqT0+K
   g==;
X-CSE-ConnectionGUID: SlrEjy50Qqae3yW56naSjQ==
X-CSE-MsgGUID: nDDOvQ4sTP+0pNpOflx6eg==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="74012556"
X-IronPort-AV: E=Sophos;i="6.19,248,1754982000"; 
   d="scan'208";a="74012556"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2025 18:18:15 -0700
X-CSE-ConnectionGUID: 5omz9a04Swmv/3oIZlOpeQ==
X-CSE-MsgGUID: Hnjp/m0ITqODl4TUoOBVvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,248,1754982000"; 
   d="scan'208";a="184794404"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 22 Oct 2025 18:18:14 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vBjxw-000Csj-0H;
	Thu, 23 Oct 2025 01:18:09 +0000
Date: Thu, 23 Oct 2025 09:17:59 +0800
From: kernel test robot <lkp@intel.com>
To: Jiri Olsa <jolsa@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jolsa-perf:bpf/single_direct_ops 2/9] (.text+0x20): multiple
 definition of `update_ftrace_direct_add'; init/main.o:(.text+0x0): first
 defined here
Message-ID: <202510230902.SdxAhJul-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git bpf/single_direct_ops
head:   3d31a310468694e4395d61e15c65edaa618fbb5c
commit: c40f09f4f868f69ec494cbe90165980d549c4a6e [2/9] ftrace: Add update_ftrace_direct_add function
config: microblaze-allnoconfig (https://download.01.org/0day-ci/archive/20251023/202510230902.SdxAhJul-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251023/202510230902.SdxAhJul-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510230902.SdxAhJul-lkp@intel.com/

All errors (new ones prefixed by >>):

   microblaze-linux-ld: init/do_mounts.o: in function `update_ftrace_direct_add':
>> (.text+0x20): multiple definition of `update_ftrace_direct_add'; init/main.o:(.text+0x0): first defined here
   microblaze-linux-ld: init/noinitramfs.o: in function `update_ftrace_direct_add':
   (.text+0x0): multiple definition of `update_ftrace_direct_add'; init/main.o:(.text+0x0): first defined here
   microblaze-linux-ld: init/init_task.o: in function `update_ftrace_direct_add':
   (.text+0x0): multiple definition of `update_ftrace_direct_add'; init/main.o:(.text+0x0): first defined here
   microblaze-linux-ld: arch/microblaze/kernel/irq.o: in function `update_ftrace_direct_add':
   (.text+0x0): multiple definition of `update_ftrace_direct_add'; init/main.o:(.text+0x0): first defined here
   microblaze-linux-ld: arch/microblaze/kernel/signal.o: in function `update_ftrace_direct_add':
   (.text+0xcf4): multiple definition of `update_ftrace_direct_add'; init/main.o:(.text+0x0): first defined here
   microblaze-linux-ld: arch/microblaze/kernel/sys_microblaze.o: in function `update_ftrace_direct_add':
   (.text+0x0): multiple definition of `update_ftrace_direct_add'; init/main.o:(.text+0x0): first defined here
   microblaze-linux-ld: arch/microblaze/mm/fault.o: in function `update_ftrace_direct_add':
   (.text+0x0): multiple definition of `update_ftrace_direct_add'; init/main.o:(.text+0x0): first defined here
   microblaze-linux-ld: kernel/fork.o: in function `update_ftrace_direct_add':
   (.text+0x12dc): multiple definition of `update_ftrace_direct_add'; init/main.o:(.text+0x0): first defined here
   microblaze-linux-ld: kernel/exec_domain.o: in function `update_ftrace_direct_add':
   (.text+0x2c): multiple definition of `update_ftrace_direct_add'; init/main.o:(.text+0x0): first defined here
   microblaze-linux-ld: kernel/panic.o: in function `update_ftrace_direct_add':
   (.text+0x71c): multiple definition of `update_ftrace_direct_add'; init/main.o:(.text+0x0): first defined here
   microblaze-linux-ld: kernel/cpu.o: in function `update_ftrace_direct_add':
   (.text+0x9f4): multiple definition of `update_ftrace_direct_add'; init/main.o:(.text+0x0): first defined here
   microblaze-linux-ld: kernel/exit.o: in function `update_ftrace_direct_add':
   (.text+0xa30): multiple definition of `update_ftrace_direct_add'; init/main.o:(.text+0x0): first defined here
   microblaze-linux-ld: kernel/softirq.o: in function `update_ftrace_direct_add':
   (.text+0x920): multiple definition of `update_ftrace_direct_add'; init/main.o:(.text+0x0): first defined here
   microblaze-linux-ld: kernel/sysctl.o: in function `update_ftrace_direct_add':
   (.text+0x231c): multiple definition of `update_ftrace_direct_add'; init/main.o:(.text+0x0): first defined here
   microblaze-linux-ld: kernel/capability.o: in function `update_ftrace_direct_add':
   (.text+0xbec): multiple definition of `update_ftrace_direct_add'; init/main.o:(.text+0x0): first defined here
   microblaze-linux-ld: kernel/ptrace.o: in function `update_ftrace_direct_add':
   (.text+0x4a0): multiple definition of `update_ftrace_direct_add'; init/main.o:(.text+0x0): first defined here
   microblaze-linux-ld: kernel/signal.o: in function `update_ftrace_direct_add':
   (.text+0x1008): multiple definition of `update_ftrace_direct_add'; init/main.o:(.text+0x0): first defined here
   microblaze-linux-ld: kernel/sys.o: in function `update_ftrace_direct_add':
   (.text+0x1864): multiple definition of `update_ftrace_direct_add'; init/main.o:(.text+0x0): first defined here
   microblaze-linux-ld: kernel/umh.o: in function `update_ftrace_direct_add':
   (.text+0x9c8): multiple definition of `update_ftrace_direct_add'; init/main.o:(.text+0x0): first defined here
   microblaze-linux-ld: kernel/pid.o: in function `update_ftrace_direct_add':
   (.text+0xa0c): multiple definition of `update_ftrace_direct_add'; init/main.o:(.text+0x0): first defined here
   microblaze-linux-ld: kernel/extable.o: in function `update_ftrace_direct_add':
   (.text+0x0): multiple definition of `update_ftrace_direct_add'; init/main.o:(.text+0x0): first defined here
   microblaze-linux-ld: kernel/nsproxy.o: in function `update_ftrace_direct_add':
   (.text+0x49c): multiple definition of `update_ftrace_direct_add'; init/main.o:(.text+0x0): first defined here
   microblaze-linux-ld: kernel/notifier.o: in function `update_ftrace_direct_add':
   (.text+0xf88): multiple definition of `update_ftrace_direct_add'; init/main.o:(.text+0x0): first defined here
   microblaze-linux-ld: kernel/cred.o: in function `update_ftrace_direct_add':
   (.text+0xb6c): multiple definition of `update_ftrace_direct_add'; init/main.o:(.text+0x0): first defined here
   microblaze-linux-ld: kernel/reboot.o: in function `update_ftrace_direct_add':
   (.text+0xdf4): multiple definition of `update_ftrace_direct_add'; init/main.o:(.text+0x0): first defined here
   microblaze-linux-ld: kernel/groups.o: in function `update_ftrace_direct_add':
   (.text+0x3e8): multiple definition of `update_ftrace_direct_add'; init/main.o:(.text+0x0): first defined here
   microblaze-linux-ld: kernel/sched/core.o: in function `update_ftrace_direct_add':
   (.text+0xddc): multiple definition of `update_ftrace_direct_add'; init/main.o:(.text+0x0): first defined here
   microblaze-linux-ld: kernel/sched/fair.o: in function `update_ftrace_direct_add':
   (.text+0x6910): multiple definition of `update_ftrace_direct_add'; init/main.o:(.text+0x0): first defined here
   microblaze-linux-ld: kernel/sched/build_policy.o: in function `update_ftrace_direct_add':
   (.text+0x71ac): multiple definition of `update_ftrace_direct_add'; init/main.o:(.text+0x0): first defined here
   microblaze-linux-ld: kernel/sched/build_utility.o: in function `update_ftrace_direct_add':
   (.text+0x2f50): multiple definition of `update_ftrace_direct_add'; init/main.o:(.text+0x0): first defined here
   microblaze-linux-ld: kernel/locking/semaphore.o: in function `update_ftrace_direct_add':
   (.text+0x0): multiple definition of `update_ftrace_direct_add'; init/main.o:(.text+0x0): first defined here
   microblaze-linux-ld: kernel/power/qos.o: in function `update_ftrace_direct_add':
   (.text+0x2d0): multiple definition of `update_ftrace_direct_add'; init/main.o:(.text+0x0): first defined here
   microblaze-linux-ld: kernel/printk/printk.o: in function `update_ftrace_direct_add':
   (.text+0x2964): multiple definition of `update_ftrace_direct_add'; init/main.o:(.text+0x0): first defined here
   microblaze-linux-ld: kernel/printk/printk_safe.o: in function `update_ftrace_direct_add':
>> (.text+0x20): multiple definition of `update_ftrace_direct_add'; init/main.o:(.text+0x0): first defined here
   microblaze-linux-ld: kernel/rcu/update.o: in function `update_ftrace_direct_add':
   (.text+0x24c): multiple definition of `update_ftrace_direct_add'; init/main.o:(.text+0x0): first defined here
   microblaze-linux-ld: kernel/time/time.o: in function `update_ftrace_direct_add':
   (.text+0x2824): multiple definition of `update_ftrace_direct_add'; init/main.o:(.text+0x0): first defined here
   microblaze-linux-ld: kernel/time/timer.o: in function `update_ftrace_direct_add':
   (.text+0x1b28): multiple definition of `update_ftrace_direct_add'; init/main.o:(.text+0x0): first defined here
   microblaze-linux-ld: kernel/time/hrtimer.o: in function `update_ftrace_direct_add':
   (.text+0x1c90): multiple definition of `update_ftrace_direct_add'; init/main.o:(.text+0x0): first defined here
   microblaze-linux-ld: kernel/time/posix-timers.o: in function `update_ftrace_direct_add':
   (.text+0x1b68): multiple definition of `update_ftrace_direct_add'; init/main.o:(.text+0x0): first defined here
   microblaze-linux-ld: kernel/time/posix-clock.o: in function `update_ftrace_direct_add':
   (.text+0x890): multiple definition of `update_ftrace_direct_add'; init/main.o:(.text+0x0): first defined here
   microblaze-linux-ld: kernel/time/itimer.o: in function `update_ftrace_direct_add':
   (.text+0x7b4): multiple definition of `update_ftrace_direct_add'; init/main.o:(.text+0x0): first defined here
   microblaze-linux-ld: kernel/time/tick-common.o: in function `update_ftrace_direct_add':
   (.text+0x214): multiple definition of `update_ftrace_direct_add'; init/main.o:(.text+0x0): first defined here
   microblaze-linux-ld: kernel/futex/syscalls.o: in function `update_ftrace_direct_add':
   (.text+0x144): multiple definition of `update_ftrace_direct_add'; init/main.o:(.text+0x0): first defined here
   microblaze-linux-ld: kernel/kallsyms.o: in function `update_ftrace_direct_add':
   (.text+0xbf4): multiple definition of `update_ftrace_direct_add'; init/main.o:(.text+0x0): first defined here
   microblaze-linux-ld: mm/filemap.o: in function `update_ftrace_direct_add':
   (.text+0x6830): multiple definition of `update_ftrace_direct_add'; init/main.o:(.text+0x0): first defined here
   microblaze-linux-ld: mm/oom_kill.o: in function `update_ftrace_direct_add':
   (.text+0xf28): multiple definition of `update_ftrace_direct_add'; init/main.o:(.text+0x0): first defined here
   microblaze-linux-ld: mm/fadvise.o: in function `update_ftrace_direct_add':
   (.text+0x4ec): multiple definition of `update_ftrace_direct_add'; init/main.o:(.text+0x0): first defined here
   microblaze-linux-ld: mm/page-writeback.o: in function `update_ftrace_direct_add':
   (.text+0x39a4): multiple definition of `update_ftrace_direct_add'; init/main.o:(.text+0x0): first defined here
   microblaze-linux-ld: mm/readahead.o: in function `update_ftrace_direct_add':
   (.text+0xef4): multiple definition of `update_ftrace_direct_add'; init/main.o:(.text+0x0): first defined here
   microblaze-linux-ld: mm/shmem.o: in function `update_ftrace_direct_add':
   (.text+0x4560): multiple definition of `update_ftrace_direct_add'; init/main.o:(.text+0x0): first defined here
   microblaze-linux-ld: mm/debug.o: in function `update_ftrace_direct_add':
   (.text+0x43c): multiple definition of `update_ftrace_direct_add'; init/main.o:(.text+0x0): first defined here
   microblaze-linux-ld: mm/mmap_lock.o: in function `update_ftrace_direct_add':
   (.text+0x0): multiple definition of `update_ftrace_direct_add'; init/main.o:(.text+0x0): first defined here
   microblaze-linux-ld: mm/vma_init.o: in function `update_ftrace_direct_add':
   (.text+0x0): multiple definition of `update_ftrace_direct_add'; init/main.o:(.text+0x0): first defined here
   microblaze-linux-ld: mm/highmem.o: in function `update_ftrace_direct_add':
   (.text+0x0): multiple definition of `update_ftrace_direct_add'; init/main.o:(.text+0x0): first defined here
   microblaze-linux-ld: mm/memory.o: in function `update_ftrace_direct_add':
   (.text+0x1b84): multiple definition of `update_ftrace_direct_add'; init/main.o:(.text+0x0): first defined here
   microblaze-linux-ld: mm/mincore.o: in function `update_ftrace_direct_add':
   (.text+0x3b4): multiple definition of `update_ftrace_direct_add'; init/main.o:(.text+0x0): first defined here
   microblaze-linux-ld: mm/mlock.o: in function `update_ftrace_direct_add':
   (.text+0x2958): multiple definition of `update_ftrace_direct_add'; init/main.o:(.text+0x0): first defined here
   microblaze-linux-ld: mm/mmap.o: in function `update_ftrace_direct_add':
   (.text+0x3d4): multiple definition of `update_ftrace_direct_add'; init/main.o:(.text+0x0): first defined here
   microblaze-linux-ld: mm/mprotect.o: in function `update_ftrace_direct_add':
   (.text+0xcec): multiple definition of `update_ftrace_direct_add'; init/main.o:(.text+0x0): first defined here
   microblaze-linux-ld: mm/mremap.o: in function `update_ftrace_direct_add':
   (.text+0x898): multiple definition of `update_ftrace_direct_add'; init/main.o:(.text+0x0): first defined here
   microblaze-linux-ld: mm/msync.o: in function `update_ftrace_direct_add':
   (.text+0x4bc): multiple definition of `update_ftrace_direct_add'; init/main.o:(.text+0x0): first defined here
   microblaze-linux-ld: mm/vma.o: in function `update_ftrace_direct_add':
   (.text+0x1e50): multiple definition of `update_ftrace_direct_add'; init/main.o:(.text+0x0): first defined here
   microblaze-linux-ld: mm/vma_exec.o: in function `update_ftrace_direct_add':
   (.text+0x0): multiple definition of `update_ftrace_direct_add'; init/main.o:(.text+0x0): first defined here
   microblaze-linux-ld: mm/page_alloc.o: in function `update_ftrace_direct_add':
   (.text+0x5728): multiple definition of `update_ftrace_direct_add'; init/main.o:(.text+0x0): first defined here
   microblaze-linux-ld: mm/slub.o: in function `update_ftrace_direct_add':
   (.text+0x3c28): multiple definition of `update_ftrace_direct_add'; init/main.o:(.text+0x0): first defined here
   microblaze-linux-ld: mm/madvise.o: in function `update_ftrace_direct_add':
   (.text+0x3560): multiple definition of `update_ftrace_direct_add'; init/main.o:(.text+0x0): first defined here
   microblaze-linux-ld: fs/open.o: in function `update_ftrace_direct_add':
   (.text+0x15ec): multiple definition of `update_ftrace_direct_add'; init/main.o:(.text+0x0): first defined here
   microblaze-linux-ld: fs/read_write.o: in function `update_ftrace_direct_add':
   (.text+0x24d4): multiple definition of `update_ftrace_direct_add'; init/main.o:(.text+0x0): first defined here
   microblaze-linux-ld: fs/stat.o: in function `update_ftrace_direct_add':
   (.text+0x1448): multiple definition of `update_ftrace_direct_add'; init/main.o:(.text+0x0): first defined here
   microblaze-linux-ld: fs/exec.o: in function `update_ftrace_direct_add':
   (.text+0x27d4): multiple definition of `update_ftrace_direct_add'; init/main.o:(.text+0x0): first defined here
   microblaze-linux-ld: fs/pipe.o: in function `update_ftrace_direct_add':
   (.text+0x1d20): multiple definition of `update_ftrace_direct_add'; init/main.o:(.text+0x0): first defined here
   microblaze-linux-ld: fs/namei.o: in function `update_ftrace_direct_add':
   (.text+0x7e7c): multiple definition of `update_ftrace_direct_add'; init/main.o:(.text+0x0): first defined here
   microblaze-linux-ld: fs/fcntl.o: in function `update_ftrace_direct_add':
   (.text+0x624): multiple definition of `update_ftrace_direct_add'; init/main.o:(.text+0x0): first defined here
   microblaze-linux-ld: fs/ioctl.o: in function `update_ftrace_direct_add':
   (.text+0x1144): multiple definition of `update_ftrace_direct_add'; init/main.o:(.text+0x0): first defined here
   microblaze-linux-ld: fs/readdir.o: in function `update_ftrace_direct_add':
   (.text+0x5d8): multiple definition of `update_ftrace_direct_add'; init/main.o:(.text+0x0): first defined here
   microblaze-linux-ld: fs/select.o: in function `update_ftrace_direct_add':
   (.text+0x660): multiple definition of `update_ftrace_direct_add'; init/main.o:(.text+0x0): first defined here
   microblaze-linux-ld: fs/file.o: in function `update_ftrace_direct_add':
   (.text+0x1dd8): multiple definition of `update_ftrace_direct_add'; init/main.o:(.text+0x0): first defined here
   microblaze-linux-ld: fs/filesystems.o: in function `update_ftrace_direct_add':
   (.text+0x350): multiple definition of `update_ftrace_direct_add'; init/main.o:(.text+0x0): first defined here
   microblaze-linux-ld: fs/namespace.o: in function `update_ftrace_direct_add':
   (.text+0x61d4): multiple definition of `update_ftrace_direct_add'; init/main.o:(.text+0x0): first defined here
   microblaze-linux-ld: fs/xattr.o: in function `update_ftrace_direct_add':
   (.text+0x9a0): multiple definition of `update_ftrace_direct_add'; init/main.o:(.text+0x0): first defined here
   microblaze-linux-ld: fs/splice.o: in function `update_ftrace_direct_add':
   (.text+0x2cf4): multiple definition of `update_ftrace_direct_add'; init/main.o:(.text+0x0): first defined here
   microblaze-linux-ld: fs/sync.o: in function `update_ftrace_direct_add':
   (.text+0x3e0): multiple definition of `update_ftrace_direct_add'; init/main.o:(.text+0x0): first defined here
   microblaze-linux-ld: fs/utimes.o: in function `update_ftrace_direct_add':
   (.text+0x0): multiple definition of `update_ftrace_direct_add'; init/main.o:(.text+0x0): first defined here
   microblaze-linux-ld: fs/d_path.o: in function `update_ftrace_direct_add':
   (.text+0x898): multiple definition of `update_ftrace_direct_add'; init/main.o:(.text+0x0): first defined here

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
