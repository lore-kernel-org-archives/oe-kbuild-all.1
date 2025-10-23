Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 663791DC988
	for <oe-kbuild-all@lists.linux.dev>; Thu, 23 Oct 2025 04:26:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761193579; cv=none; b=fTs97R8a/B9Le4PuD/8naqjsaoDOKeGhB/xEPfyMPRL47phnISTSpY7PEixyqjUcKAOP14S4J6OjLyDWsKNSAfL0VJ6hngPIdZYzSkyVLqVlki80esb3S3yTngR+L6TqnWAYaHB/wH7nsUI8X+5k66CY3Het+VI3ppqFdTRHUfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761193579; c=relaxed/simple;
	bh=OpztUxouTKLfc9JW+dvOXGNxeIiv/TeGWHmwlfmPbAk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ddnQp19QP5yl2vkhvbDLsn+YXW1grZg0fwvz1Z0QuqLxiPZmg9g3bqGLPZkcineA67iHIDdmKzDt2cjiNSZoFuijBonSkgRvj9jeE9080IkFVWMxmQ4FLN0dHMpw+JqSeY6az1puWo/9B2fowkDPzxRpUNoATajS/jOPre5aJ8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dHrhedbp; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dHrhedbp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761193576; x=1792729576;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OpztUxouTKLfc9JW+dvOXGNxeIiv/TeGWHmwlfmPbAk=;
  b=dHrhedbpADgx2MG3aaAOghAftaf8UJXjaaZFyKK9+glW7iQ1yqu3UwlF
   cpOB3tAlIDvsfIIswACythGMDjwgEb+5wUu/traQJqIbB9BhkoyoJgxwk
   XyLMho77YdXKX0bTXrEqJZ4t/LnOxC1KMpoX+TT2RN7gdz2K9P0gdPRB3
   sf7iB7xqVdgEO3ajOffyHYrVOceGmspdl3zxtjJKPgB1l+cbyq7BcaUBy
   3ZTN5ZJJxfZMTp48182Le78H4zhkr+Atb3s962m0ulHpzEiek09lCD39b
   9llez+9mxWosVTmw9jUC020eUTO/JziPHghlnuMdIQ4d5pFgQj9arWotJ
   g==;
X-CSE-ConnectionGUID: cM+bIa9GSGaEc1lGpi/tyA==
X-CSE-MsgGUID: 6HL8GBWNRkWsLTrJhdkHzA==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="74791538"
X-IronPort-AV: E=Sophos;i="6.19,248,1754982000"; 
   d="scan'208";a="74791538"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2025 21:26:15 -0700
X-CSE-ConnectionGUID: nh1GAIFpR2aRDw8odQjgNg==
X-CSE-MsgGUID: 3n4xkTtnRZSZDxHHgY1o+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,248,1754982000"; 
   d="scan'208";a="184112093"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 22 Oct 2025 21:26:15 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vBmtw-000D1S-1H;
	Thu, 23 Oct 2025 04:26:12 +0000
Date: Thu, 23 Oct 2025 12:24:11 +0800
From: kernel test robot <lkp@intel.com>
To: Jiri Olsa <jolsa@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jolsa-perf:bpf/single_direct_ops 4/9] (.text+0x30): multiple
 definition of `modify_ftrace_direct_hash'; init/main.o:(.text+0x10): first
 defined here
Message-ID: <202510231225.Zg2DSNBY-lkp@intel.com>
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
commit: a3cc03d6ec234edb387d2c5cba979ee39630a03c [4/9] ftrace: Add update_ftrace_direct_mod function
config: microblaze-allnoconfig (https://download.01.org/0day-ci/archive/20251023/202510231225.Zg2DSNBY-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251023/202510231225.Zg2DSNBY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510231225.Zg2DSNBY-lkp@intel.com/

All errors (new ones prefixed by >>):

   microblaze-linux-ld: init/do_mounts.o: in function `update_ftrace_direct_add':
   (.text+0x20): multiple definition of `update_ftrace_direct_add'; init/main.o:(.text+0x0): first defined here
   microblaze-linux-ld: init/do_mounts.o: in function `update_ftrace_direct_del':
   (.text+0x28): multiple definition of `update_ftrace_direct_del'; init/main.o:(.text+0x8): first defined here
   microblaze-linux-ld: init/do_mounts.o: in function `modify_ftrace_direct_hash':
>> (.text+0x30): multiple definition of `modify_ftrace_direct_hash'; init/main.o:(.text+0x10): first defined here
   microblaze-linux-ld: init/noinitramfs.o: in function `update_ftrace_direct_add':
   (.text+0x0): multiple definition of `update_ftrace_direct_add'; init/main.o:(.text+0x0): first defined here
   microblaze-linux-ld: init/noinitramfs.o: in function `update_ftrace_direct_del':
   (.text+0x8): multiple definition of `update_ftrace_direct_del'; init/main.o:(.text+0x8): first defined here
   microblaze-linux-ld: init/noinitramfs.o: in function `modify_ftrace_direct_hash':
   (.text+0x10): multiple definition of `modify_ftrace_direct_hash'; init/main.o:(.text+0x10): first defined here
   microblaze-linux-ld: init/init_task.o: in function `update_ftrace_direct_add':
   (.text+0x0): multiple definition of `update_ftrace_direct_add'; init/main.o:(.text+0x0): first defined here
   microblaze-linux-ld: init/init_task.o: in function `update_ftrace_direct_del':
   (.text+0x8): multiple definition of `update_ftrace_direct_del'; init/main.o:(.text+0x8): first defined here
   microblaze-linux-ld: init/init_task.o: in function `modify_ftrace_direct_hash':
   (.text+0x10): multiple definition of `modify_ftrace_direct_hash'; init/main.o:(.text+0x10): first defined here
   microblaze-linux-ld: arch/microblaze/kernel/irq.o: in function `update_ftrace_direct_add':
   (.text+0x0): multiple definition of `update_ftrace_direct_add'; init/main.o:(.text+0x0): first defined here
   microblaze-linux-ld: arch/microblaze/kernel/irq.o: in function `update_ftrace_direct_del':
   (.text+0x8): multiple definition of `update_ftrace_direct_del'; init/main.o:(.text+0x8): first defined here
   microblaze-linux-ld: arch/microblaze/kernel/irq.o: in function `modify_ftrace_direct_hash':
   (.text+0x10): multiple definition of `modify_ftrace_direct_hash'; init/main.o:(.text+0x10): first defined here
   microblaze-linux-ld: arch/microblaze/kernel/signal.o: in function `update_ftrace_direct_add':
   (.text+0xcf4): multiple definition of `update_ftrace_direct_add'; init/main.o:(.text+0x0): first defined here
   microblaze-linux-ld: arch/microblaze/kernel/signal.o: in function `update_ftrace_direct_del':
   (.text+0xcfc): multiple definition of `update_ftrace_direct_del'; init/main.o:(.text+0x8): first defined here
   microblaze-linux-ld: arch/microblaze/kernel/signal.o: in function `modify_ftrace_direct_hash':
   (.text+0xd04): multiple definition of `modify_ftrace_direct_hash'; init/main.o:(.text+0x10): first defined here
   microblaze-linux-ld: arch/microblaze/kernel/sys_microblaze.o: in function `update_ftrace_direct_add':
   (.text+0x0): multiple definition of `update_ftrace_direct_add'; init/main.o:(.text+0x0): first defined here
   microblaze-linux-ld: arch/microblaze/kernel/sys_microblaze.o: in function `update_ftrace_direct_del':
   (.text+0x8): multiple definition of `update_ftrace_direct_del'; init/main.o:(.text+0x8): first defined here
   microblaze-linux-ld: arch/microblaze/kernel/sys_microblaze.o: in function `modify_ftrace_direct_hash':
   (.text+0x10): multiple definition of `modify_ftrace_direct_hash'; init/main.o:(.text+0x10): first defined here
   microblaze-linux-ld: arch/microblaze/mm/fault.o: in function `update_ftrace_direct_add':
   (.text+0x0): multiple definition of `update_ftrace_direct_add'; init/main.o:(.text+0x0): first defined here
   microblaze-linux-ld: arch/microblaze/mm/fault.o: in function `update_ftrace_direct_del':
   (.text+0x8): multiple definition of `update_ftrace_direct_del'; init/main.o:(.text+0x8): first defined here
   microblaze-linux-ld: arch/microblaze/mm/fault.o: in function `modify_ftrace_direct_hash':
   (.text+0x10): multiple definition of `modify_ftrace_direct_hash'; init/main.o:(.text+0x10): first defined here
   microblaze-linux-ld: kernel/fork.o: in function `update_ftrace_direct_add':
   (.text+0x12dc): multiple definition of `update_ftrace_direct_add'; init/main.o:(.text+0x0): first defined here
   microblaze-linux-ld: kernel/fork.o: in function `update_ftrace_direct_del':
   (.text+0x12e4): multiple definition of `update_ftrace_direct_del'; init/main.o:(.text+0x8): first defined here
   microblaze-linux-ld: kernel/fork.o: in function `modify_ftrace_direct_hash':
   (.text+0x12ec): multiple definition of `modify_ftrace_direct_hash'; init/main.o:(.text+0x10): first defined here
   microblaze-linux-ld: kernel/exec_domain.o: in function `update_ftrace_direct_add':
   (.text+0x2c): multiple definition of `update_ftrace_direct_add'; init/main.o:(.text+0x0): first defined here
   microblaze-linux-ld: kernel/exec_domain.o: in function `update_ftrace_direct_del':
   (.text+0x34): multiple definition of `update_ftrace_direct_del'; init/main.o:(.text+0x8): first defined here
   microblaze-linux-ld: kernel/exec_domain.o: in function `modify_ftrace_direct_hash':
   (.text+0x3c): multiple definition of `modify_ftrace_direct_hash'; init/main.o:(.text+0x10): first defined here
   microblaze-linux-ld: kernel/panic.o: in function `update_ftrace_direct_add':
   (.text+0x71c): multiple definition of `update_ftrace_direct_add'; init/main.o:(.text+0x0): first defined here
   microblaze-linux-ld: kernel/panic.o: in function `update_ftrace_direct_del':
   (.text+0x724): multiple definition of `update_ftrace_direct_del'; init/main.o:(.text+0x8): first defined here
   microblaze-linux-ld: kernel/panic.o: in function `modify_ftrace_direct_hash':
   (.text+0x72c): multiple definition of `modify_ftrace_direct_hash'; init/main.o:(.text+0x10): first defined here
   microblaze-linux-ld: kernel/cpu.o: in function `update_ftrace_direct_add':
   (.text+0x9f4): multiple definition of `update_ftrace_direct_add'; init/main.o:(.text+0x0): first defined here
   microblaze-linux-ld: kernel/cpu.o: in function `update_ftrace_direct_del':
   (.text+0x9fc): multiple definition of `update_ftrace_direct_del'; init/main.o:(.text+0x8): first defined here
   microblaze-linux-ld: kernel/cpu.o: in function `modify_ftrace_direct_hash':
   (.text+0xa04): multiple definition of `modify_ftrace_direct_hash'; init/main.o:(.text+0x10): first defined here
   microblaze-linux-ld: kernel/exit.o: in function `update_ftrace_direct_add':
   (.text+0xa30): multiple definition of `update_ftrace_direct_add'; init/main.o:(.text+0x0): first defined here
   microblaze-linux-ld: kernel/exit.o: in function `update_ftrace_direct_del':
   (.text+0xa38): multiple definition of `update_ftrace_direct_del'; init/main.o:(.text+0x8): first defined here
   microblaze-linux-ld: kernel/exit.o: in function `modify_ftrace_direct_hash':
   (.text+0xa40): multiple definition of `modify_ftrace_direct_hash'; init/main.o:(.text+0x10): first defined here
   microblaze-linux-ld: kernel/softirq.o: in function `update_ftrace_direct_add':
   (.text+0x920): multiple definition of `update_ftrace_direct_add'; init/main.o:(.text+0x0): first defined here
   microblaze-linux-ld: kernel/softirq.o: in function `update_ftrace_direct_del':
   (.text+0x928): multiple definition of `update_ftrace_direct_del'; init/main.o:(.text+0x8): first defined here
   microblaze-linux-ld: kernel/softirq.o: in function `modify_ftrace_direct_hash':
   (.text+0x930): multiple definition of `modify_ftrace_direct_hash'; init/main.o:(.text+0x10): first defined here
   microblaze-linux-ld: kernel/sysctl.o: in function `update_ftrace_direct_add':
   (.text+0x231c): multiple definition of `update_ftrace_direct_add'; init/main.o:(.text+0x0): first defined here
   microblaze-linux-ld: kernel/sysctl.o: in function `update_ftrace_direct_del':
   (.text+0x2324): multiple definition of `update_ftrace_direct_del'; init/main.o:(.text+0x8): first defined here
   microblaze-linux-ld: kernel/sysctl.o: in function `modify_ftrace_direct_hash':
   (.text+0x232c): multiple definition of `modify_ftrace_direct_hash'; init/main.o:(.text+0x10): first defined here
   microblaze-linux-ld: kernel/capability.o: in function `update_ftrace_direct_add':
   (.text+0xbec): multiple definition of `update_ftrace_direct_add'; init/main.o:(.text+0x0): first defined here
   microblaze-linux-ld: kernel/capability.o: in function `update_ftrace_direct_del':
   (.text+0xbf4): multiple definition of `update_ftrace_direct_del'; init/main.o:(.text+0x8): first defined here
   microblaze-linux-ld: kernel/capability.o: in function `modify_ftrace_direct_hash':
   (.text+0xbfc): multiple definition of `modify_ftrace_direct_hash'; init/main.o:(.text+0x10): first defined here
   microblaze-linux-ld: kernel/ptrace.o: in function `update_ftrace_direct_add':
   (.text+0x4a0): multiple definition of `update_ftrace_direct_add'; init/main.o:(.text+0x0): first defined here
   microblaze-linux-ld: kernel/ptrace.o: in function `update_ftrace_direct_del':
   (.text+0x4a8): multiple definition of `update_ftrace_direct_del'; init/main.o:(.text+0x8): first defined here
   microblaze-linux-ld: kernel/ptrace.o: in function `modify_ftrace_direct_hash':
   (.text+0x4b0): multiple definition of `modify_ftrace_direct_hash'; init/main.o:(.text+0x10): first defined here
   microblaze-linux-ld: kernel/signal.o: in function `update_ftrace_direct_add':
   (.text+0x1008): multiple definition of `update_ftrace_direct_add'; init/main.o:(.text+0x0): first defined here
   microblaze-linux-ld: kernel/signal.o: in function `update_ftrace_direct_del':
   (.text+0x1010): multiple definition of `update_ftrace_direct_del'; init/main.o:(.text+0x8): first defined here
   microblaze-linux-ld: kernel/signal.o: in function `modify_ftrace_direct_hash':
   (.text+0x1018): multiple definition of `modify_ftrace_direct_hash'; init/main.o:(.text+0x10): first defined here
   microblaze-linux-ld: kernel/sys.o: in function `update_ftrace_direct_add':
   (.text+0x1864): multiple definition of `update_ftrace_direct_add'; init/main.o:(.text+0x0): first defined here
   microblaze-linux-ld: kernel/sys.o: in function `update_ftrace_direct_del':
   (.text+0x186c): multiple definition of `update_ftrace_direct_del'; init/main.o:(.text+0x8): first defined here
   microblaze-linux-ld: kernel/sys.o: in function `modify_ftrace_direct_hash':
   (.text+0x1874): multiple definition of `modify_ftrace_direct_hash'; init/main.o:(.text+0x10): first defined here
   microblaze-linux-ld: kernel/umh.o: in function `update_ftrace_direct_add':
   (.text+0x9c8): multiple definition of `update_ftrace_direct_add'; init/main.o:(.text+0x0): first defined here
   microblaze-linux-ld: kernel/umh.o: in function `update_ftrace_direct_del':
   (.text+0x9d0): multiple definition of `update_ftrace_direct_del'; init/main.o:(.text+0x8): first defined here
   microblaze-linux-ld: kernel/umh.o: in function `modify_ftrace_direct_hash':
   (.text+0x9d8): multiple definition of `modify_ftrace_direct_hash'; init/main.o:(.text+0x10): first defined here
   microblaze-linux-ld: kernel/pid.o: in function `update_ftrace_direct_add':
   (.text+0xa0c): multiple definition of `update_ftrace_direct_add'; init/main.o:(.text+0x0): first defined here
   microblaze-linux-ld: kernel/pid.o: in function `update_ftrace_direct_del':
   (.text+0xa14): multiple definition of `update_ftrace_direct_del'; init/main.o:(.text+0x8): first defined here
   microblaze-linux-ld: kernel/pid.o: in function `modify_ftrace_direct_hash':
   (.text+0xa1c): multiple definition of `modify_ftrace_direct_hash'; init/main.o:(.text+0x10): first defined here
   microblaze-linux-ld: kernel/extable.o: in function `update_ftrace_direct_add':
   (.text+0x0): multiple definition of `update_ftrace_direct_add'; init/main.o:(.text+0x0): first defined here
   microblaze-linux-ld: kernel/extable.o: in function `update_ftrace_direct_del':
   (.text+0x8): multiple definition of `update_ftrace_direct_del'; init/main.o:(.text+0x8): first defined here
   microblaze-linux-ld: kernel/extable.o: in function `modify_ftrace_direct_hash':
   (.text+0x10): multiple definition of `modify_ftrace_direct_hash'; init/main.o:(.text+0x10): first defined here
   microblaze-linux-ld: kernel/nsproxy.o: in function `update_ftrace_direct_add':
   (.text+0x49c): multiple definition of `update_ftrace_direct_add'; init/main.o:(.text+0x0): first defined here
   microblaze-linux-ld: kernel/nsproxy.o: in function `update_ftrace_direct_del':
   (.text+0x4a4): multiple definition of `update_ftrace_direct_del'; init/main.o:(.text+0x8): first defined here
   microblaze-linux-ld: kernel/nsproxy.o: in function `modify_ftrace_direct_hash':
   (.text+0x4ac): multiple definition of `modify_ftrace_direct_hash'; init/main.o:(.text+0x10): first defined here
   microblaze-linux-ld: kernel/notifier.o: in function `update_ftrace_direct_add':
   (.text+0xf88): multiple definition of `update_ftrace_direct_add'; init/main.o:(.text+0x0): first defined here
   microblaze-linux-ld: kernel/notifier.o: in function `update_ftrace_direct_del':
   (.text+0xf90): multiple definition of `update_ftrace_direct_del'; init/main.o:(.text+0x8): first defined here
   microblaze-linux-ld: kernel/notifier.o: in function `modify_ftrace_direct_hash':
   (.text+0xf98): multiple definition of `modify_ftrace_direct_hash'; init/main.o:(.text+0x10): first defined here
   microblaze-linux-ld: kernel/cred.o: in function `update_ftrace_direct_add':
   (.text+0xb6c): multiple definition of `update_ftrace_direct_add'; init/main.o:(.text+0x0): first defined here
   microblaze-linux-ld: kernel/cred.o: in function `update_ftrace_direct_del':
   (.text+0xb74): multiple definition of `update_ftrace_direct_del'; init/main.o:(.text+0x8): first defined here
   microblaze-linux-ld: kernel/cred.o: in function `modify_ftrace_direct_hash':
   (.text+0xb7c): multiple definition of `modify_ftrace_direct_hash'; init/main.o:(.text+0x10): first defined here
   microblaze-linux-ld: kernel/reboot.o: in function `update_ftrace_direct_add':
   (.text+0xdf4): multiple definition of `update_ftrace_direct_add'; init/main.o:(.text+0x0): first defined here
   microblaze-linux-ld: kernel/reboot.o: in function `update_ftrace_direct_del':
   (.text+0xdfc): multiple definition of `update_ftrace_direct_del'; init/main.o:(.text+0x8): first defined here
   microblaze-linux-ld: kernel/reboot.o: in function `modify_ftrace_direct_hash':
   (.text+0xe04): multiple definition of `modify_ftrace_direct_hash'; init/main.o:(.text+0x10): first defined here
   microblaze-linux-ld: kernel/groups.o: in function `update_ftrace_direct_add':
   (.text+0x3e8): multiple definition of `update_ftrace_direct_add'; init/main.o:(.text+0x0): first defined here
   microblaze-linux-ld: kernel/groups.o: in function `update_ftrace_direct_del':
   (.text+0x3f0): multiple definition of `update_ftrace_direct_del'; init/main.o:(.text+0x8): first defined here
   microblaze-linux-ld: kernel/groups.o: in function `modify_ftrace_direct_hash':
   (.text+0x3f8): multiple definition of `modify_ftrace_direct_hash'; init/main.o:(.text+0x10): first defined here
   microblaze-linux-ld: kernel/sched/core.o: in function `update_ftrace_direct_add':
   (.text+0xddc): multiple definition of `update_ftrace_direct_add'; init/main.o:(.text+0x0): first defined here
   microblaze-linux-ld: kernel/sched/core.o: in function `update_ftrace_direct_del':
   (.text+0xdfc): multiple definition of `update_ftrace_direct_del'; init/main.o:(.text+0x8): first defined here
   microblaze-linux-ld: kernel/sched/core.o: in function `modify_ftrace_direct_hash':
   (.text+0xe1c): multiple definition of `modify_ftrace_direct_hash'; init/main.o:(.text+0x10): first defined here
   microblaze-linux-ld: kernel/sched/fair.o: in function `update_ftrace_direct_add':
   (.text+0x6910): multiple definition of `update_ftrace_direct_add'; init/main.o:(.text+0x0): first defined here
   microblaze-linux-ld: kernel/sched/fair.o: in function `update_ftrace_direct_del':
   (.text+0x6918): multiple definition of `update_ftrace_direct_del'; init/main.o:(.text+0x8): first defined here
   microblaze-linux-ld: kernel/sched/fair.o: in function `modify_ftrace_direct_hash':
   (.text+0x6920): multiple definition of `modify_ftrace_direct_hash'; init/main.o:(.text+0x10): first defined here
   microblaze-linux-ld: kernel/sched/build_policy.o: in function `update_ftrace_direct_add':
   (.text+0x71ac): multiple definition of `update_ftrace_direct_add'; init/main.o:(.text+0x0): first defined here
   microblaze-linux-ld: kernel/sched/build_policy.o: in function `update_ftrace_direct_del':
   (.text+0x71b4): multiple definition of `update_ftrace_direct_del'; init/main.o:(.text+0x8): first defined here
   microblaze-linux-ld: kernel/sched/build_policy.o: in function `modify_ftrace_direct_hash':
   (.text+0x71bc): multiple definition of `modify_ftrace_direct_hash'; init/main.o:(.text+0x10): first defined here
   microblaze-linux-ld: kernel/sched/build_utility.o: in function `update_ftrace_direct_add':
   (.text+0x2f50): multiple definition of `update_ftrace_direct_add'; init/main.o:(.text+0x0): first defined here
   microblaze-linux-ld: kernel/sched/build_utility.o: in function `update_ftrace_direct_del':
   (.text+0x2f58): multiple definition of `update_ftrace_direct_del'; init/main.o:(.text+0x8): first defined here
   microblaze-linux-ld: kernel/sched/build_utility.o: in function `modify_ftrace_direct_hash':
   (.text+0x2f60): multiple definition of `modify_ftrace_direct_hash'; init/main.o:(.text+0x10): first defined here
   microblaze-linux-ld: kernel/locking/semaphore.o: in function `update_ftrace_direct_add':
   (.text+0x0): multiple definition of `update_ftrace_direct_add'; init/main.o:(.text+0x0): first defined here
   microblaze-linux-ld: kernel/locking/semaphore.o: in function `update_ftrace_direct_del':
   (.text+0x8): multiple definition of `update_ftrace_direct_del'; init/main.o:(.text+0x8): first defined here
   microblaze-linux-ld: kernel/locking/semaphore.o: in function `modify_ftrace_direct_hash':
   (.text+0x10): multiple definition of `modify_ftrace_direct_hash'; init/main.o:(.text+0x10): first defined here
   microblaze-linux-ld: kernel/power/qos.o: in function `update_ftrace_direct_add':
   (.text+0x2d0): multiple definition of `update_ftrace_direct_add'; init/main.o:(.text+0x0): first defined here
   microblaze-linux-ld: kernel/power/qos.o: in function `update_ftrace_direct_del':
   (.text+0x2d8): multiple definition of `update_ftrace_direct_del'; init/main.o:(.text+0x8): first defined here
   microblaze-linux-ld: kernel/power/qos.o: in function `modify_ftrace_direct_hash':
   (.text+0x2e0): multiple definition of `modify_ftrace_direct_hash'; init/main.o:(.text+0x10): first defined here
   microblaze-linux-ld: kernel/printk/printk.o: in function `update_ftrace_direct_add':
   (.text+0x2964): multiple definition of `update_ftrace_direct_add'; init/main.o:(.text+0x0): first defined here
   microblaze-linux-ld: kernel/printk/printk.o: in function `update_ftrace_direct_del':
   (.text+0x296c): multiple definition of `update_ftrace_direct_del'; init/main.o:(.text+0x8): first defined here
   microblaze-linux-ld: kernel/printk/printk.o: in function `modify_ftrace_direct_hash':
   (.text+0x2974): multiple definition of `modify_ftrace_direct_hash'; init/main.o:(.text+0x10): first defined here
   microblaze-linux-ld: kernel/printk/printk_safe.o: in function `update_ftrace_direct_add':
   (.text+0x20): multiple definition of `update_ftrace_direct_add'; init/main.o:(.text+0x0): first defined here
   microblaze-linux-ld: kernel/printk/printk_safe.o: in function `update_ftrace_direct_del':
   (.text+0x28): multiple definition of `update_ftrace_direct_del'; init/main.o:(.text+0x8): first defined here
   microblaze-linux-ld: kernel/printk/printk_safe.o: in function `modify_ftrace_direct_hash':
>> (.text+0x30): multiple definition of `modify_ftrace_direct_hash'; init/main.o:(.text+0x10): first defined here
   microblaze-linux-ld: kernel/rcu/update.o: in function `update_ftrace_direct_add':
   (.text+0x24c): multiple definition of `update_ftrace_direct_add'; init/main.o:(.text+0x0): first defined here
   microblaze-linux-ld: kernel/rcu/update.o: in function `update_ftrace_direct_del':
   (.text+0x254): multiple definition of `update_ftrace_direct_del'; init/main.o:(.text+0x8): first defined here
   microblaze-linux-ld: kernel/rcu/update.o: in function `modify_ftrace_direct_hash':
   (.text+0x25c): multiple definition of `modify_ftrace_direct_hash'; init/main.o:(.text+0x10): first defined here
   microblaze-linux-ld: kernel/time/time.o: in function `update_ftrace_direct_add':
   (.text+0x2824): multiple definition of `update_ftrace_direct_add'; init/main.o:(.text+0x0): first defined here
   microblaze-linux-ld: kernel/time/time.o: in function `update_ftrace_direct_del':
   (.text+0x282c): multiple definition of `update_ftrace_direct_del'; init/main.o:(.text+0x8): first defined here
   microblaze-linux-ld: kernel/time/time.o: in function `modify_ftrace_direct_hash':
   (.text+0x2834): multiple definition of `modify_ftrace_direct_hash'; init/main.o:(.text+0x10): first defined here
   microblaze-linux-ld: kernel/time/timer.o: in function `update_ftrace_direct_add':
   (.text+0x1b28): multiple definition of `update_ftrace_direct_add'; init/main.o:(.text+0x0): first defined here
   microblaze-linux-ld: kernel/time/timer.o: in function `update_ftrace_direct_del':
   (.text+0x1b30): multiple definition of `update_ftrace_direct_del'; init/main.o:(.text+0x8): first defined here
   microblaze-linux-ld: kernel/time/timer.o: in function `modify_ftrace_direct_hash':
   (.text+0x1b38): multiple definition of `modify_ftrace_direct_hash'; init/main.o:(.text+0x10): first defined here
   microblaze-linux-ld: kernel/time/hrtimer.o: in function `update_ftrace_direct_add':
   (.text+0x1c90): multiple definition of `update_ftrace_direct_add'; init/main.o:(.text+0x0): first defined here
   microblaze-linux-ld: kernel/time/hrtimer.o: in function `update_ftrace_direct_del':
   (.text+0x1c98): multiple definition of `update_ftrace_direct_del'; init/main.o:(.text+0x8): first defined here
   microblaze-linux-ld: kernel/time/hrtimer.o: in function `modify_ftrace_direct_hash':
   (.text+0x1ca0): multiple definition of `modify_ftrace_direct_hash'; init/main.o:(.text+0x10): first defined here
   microblaze-linux-ld: kernel/time/posix-timers.o: in function `update_ftrace_direct_add':
   (.text+0x1b68): multiple definition of `update_ftrace_direct_add'; init/main.o:(.text+0x0): first defined here
   microblaze-linux-ld: kernel/time/posix-timers.o: in function `update_ftrace_direct_del':
   (.text+0x1b70): multiple definition of `update_ftrace_direct_del'; init/main.o:(.text+0x8): first defined here
   microblaze-linux-ld: kernel/time/posix-timers.o: in function `modify_ftrace_direct_hash':
   (.text+0x1b78): multiple definition of `modify_ftrace_direct_hash'; init/main.o:(.text+0x10): first defined here
   microblaze-linux-ld: kernel/time/posix-clock.o: in function `update_ftrace_direct_add':
   (.text+0x890): multiple definition of `update_ftrace_direct_add'; init/main.o:(.text+0x0): first defined here
   microblaze-linux-ld: kernel/time/posix-clock.o: in function `update_ftrace_direct_del':
   (.text+0x898): multiple definition of `update_ftrace_direct_del'; init/main.o:(.text+0x8): first defined here
   microblaze-linux-ld: kernel/time/posix-clock.o: in function `modify_ftrace_direct_hash':
   (.text+0x8a0): multiple definition of `modify_ftrace_direct_hash'; init/main.o:(.text+0x10): first defined here
   microblaze-linux-ld: kernel/time/itimer.o: in function `update_ftrace_direct_add':
   (.text+0x7b4): multiple definition of `update_ftrace_direct_add'; init/main.o:(.text+0x0): first defined here
   microblaze-linux-ld: kernel/time/itimer.o: in function `update_ftrace_direct_del':
   (.text+0x7bc): multiple definition of `update_ftrace_direct_del'; init/main.o:(.text+0x8): first defined here
   microblaze-linux-ld: kernel/time/itimer.o: in function `modify_ftrace_direct_hash':
   (.text+0x7c4): multiple definition of `modify_ftrace_direct_hash'; init/main.o:(.text+0x10): first defined here
   microblaze-linux-ld: kernel/time/tick-common.o: in function `update_ftrace_direct_add':
   (.text+0x214): multiple definition of `update_ftrace_direct_add'; init/main.o:(.text+0x0): first defined here
   microblaze-linux-ld: kernel/time/tick-common.o: in function `update_ftrace_direct_del':
   (.text+0x21c): multiple definition of `update_ftrace_direct_del'; init/main.o:(.text+0x8): first defined here
   microblaze-linux-ld: kernel/time/tick-common.o: in function `modify_ftrace_direct_hash':
   (.text+0x224): multiple definition of `modify_ftrace_direct_hash'; init/main.o:(.text+0x10): first defined here
   microblaze-linux-ld: kernel/futex/syscalls.o: in function `update_ftrace_direct_add':
   (.text+0x144): multiple definition of `update_ftrace_direct_add'; init/main.o:(.text+0x0): first defined here
   microblaze-linux-ld: kernel/futex/syscalls.o: in function `update_ftrace_direct_del':
   (.text+0x14c): multiple definition of `update_ftrace_direct_del'; init/main.o:(.text+0x8): first defined here
   microblaze-linux-ld: kernel/futex/syscalls.o: in function `modify_ftrace_direct_hash':
   (.text+0x154): multiple definition of `modify_ftrace_direct_hash'; init/main.o:(.text+0x10): first defined here
   microblaze-linux-ld: kernel/kallsyms.o: in function `update_ftrace_direct_add':
   (.text+0xbf4): multiple definition of `update_ftrace_direct_add'; init/main.o:(.text+0x0): first defined here
   microblaze-linux-ld: kernel/kallsyms.o: in function `update_ftrace_direct_del':
   (.text+0xbfc): multiple definition of `update_ftrace_direct_del'; init/main.o:(.text+0x8): first defined here
   microblaze-linux-ld: kernel/kallsyms.o: in function `modify_ftrace_direct_hash':
   (.text+0xc04): multiple definition of `modify_ftrace_direct_hash'; init/main.o:(.text+0x10): first defined here
   microblaze-linux-ld: mm/filemap.o: in function `update_ftrace_direct_add':
   (.text+0x6830): multiple definition of `update_ftrace_direct_add'; init/main.o:(.text+0x0): first defined here
   microblaze-linux-ld: mm/filemap.o: in function `update_ftrace_direct_del':
   (.text+0x6838): multiple definition of `update_ftrace_direct_del'; init/main.o:(.text+0x8): first defined here
   microblaze-linux-ld: mm/filemap.o: in function `modify_ftrace_direct_hash':
   (.text+0x6840): multiple definition of `modify_ftrace_direct_hash'; init/main.o:(.text+0x10): first defined here
   microblaze-linux-ld: mm/oom_kill.o: in function `update_ftrace_direct_add':
   (.text+0xf28): multiple definition of `update_ftrace_direct_add'; init/main.o:(.text+0x0): first defined here
   microblaze-linux-ld: mm/oom_kill.o: in function `update_ftrace_direct_del':
   (.text+0xf30): multiple definition of `update_ftrace_direct_del'; init/main.o:(.text+0x8): first defined here
   microblaze-linux-ld: mm/oom_kill.o: in function `modify_ftrace_direct_hash':
   (.text+0xf38): multiple definition of `modify_ftrace_direct_hash'; init/main.o:(.text+0x10): first defined here
   microblaze-linux-ld: mm/fadvise.o: in function `update_ftrace_direct_add':
   (.text+0x4ec): multiple definition of `update_ftrace_direct_add'; init/main.o:(.text+0x0): first defined here
   microblaze-linux-ld: mm/fadvise.o: in function `update_ftrace_direct_del':
   (.text+0x4f4): multiple definition of `update_ftrace_direct_del'; init/main.o:(.text+0x8): first defined here
   microblaze-linux-ld: mm/fadvise.o: in function `modify_ftrace_direct_hash':
   (.text+0x4fc): multiple definition of `modify_ftrace_direct_hash'; init/main.o:(.text+0x10): first defined here
   microblaze-linux-ld: mm/page-writeback.o: in function `update_ftrace_direct_add':
   (.text+0x39a4): multiple definition of `update_ftrace_direct_add'; init/main.o:(.text+0x0): first defined here
   microblaze-linux-ld: mm/page-writeback.o: in function `update_ftrace_direct_del':
   (.text+0x39ac): multiple definition of `update_ftrace_direct_del'; init/main.o:(.text+0x8): first defined here
   microblaze-linux-ld: mm/page-writeback.o: in function `modify_ftrace_direct_hash':
   (.text+0x39b4): multiple definition of `modify_ftrace_direct_hash'; init/main.o:(.text+0x10): first defined here
   microblaze-linux-ld: mm/readahead.o: in function `update_ftrace_direct_add':
   (.text+0xef4): multiple definition of `update_ftrace_direct_add'; init/main.o:(.text+0x0): first defined here
   microblaze-linux-ld: mm/readahead.o: in function `update_ftrace_direct_del':
   (.text+0xefc): multiple definition of `update_ftrace_direct_del'; init/main.o:(.text+0x8): first defined here
   microblaze-linux-ld: mm/readahead.o: in function `modify_ftrace_direct_hash':
   (.text+0xf04): multiple definition of `modify_ftrace_direct_hash'; init/main.o:(.text+0x10): first defined here
   microblaze-linux-ld: mm/shmem.o: in function `update_ftrace_direct_add':
   (.text+0x4560): multiple definition of `update_ftrace_direct_add'; init/main.o:(.text+0x0): first defined here
   microblaze-linux-ld: mm/shmem.o: in function `update_ftrace_direct_del':
   (.text+0x4568): multiple definition of `update_ftrace_direct_del'; init/main.o:(.text+0x8): first defined here
   microblaze-linux-ld: mm/shmem.o: in function `modify_ftrace_direct_hash':
   (.text+0x4570): multiple definition of `modify_ftrace_direct_hash'; init/main.o:(.text+0x10): first defined here
   microblaze-linux-ld: mm/debug.o: in function `update_ftrace_direct_add':
   (.text+0x43c): multiple definition of `update_ftrace_direct_add'; init/main.o:(.text+0x0): first defined here
   microblaze-linux-ld: mm/debug.o: in function `update_ftrace_direct_del':
   (.text+0x444): multiple definition of `update_ftrace_direct_del'; init/main.o:(.text+0x8): first defined here

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
