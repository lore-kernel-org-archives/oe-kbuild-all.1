Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D03D36FBE
	for <oe-kbuild-all@lists.linux.dev>; Mon, 11 Mar 2024 04:33:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710131600; cv=none; b=Ozf9UjCO5AP5h4N5fnqG5rPV83+wGhFcqMdvEZYx1LIVccKEYHhzy3E3rZwybl22uB0YBfnox3CfyYRtpZTdfD4njL7qVUTGbQN+KuiJGcGc6ehj1dRql/gmkH2AF2Q2ZXJM5uF9NxRsVEy1iUlv1nRQMNPTqArRcb9y6g9VGeQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710131600; c=relaxed/simple;
	bh=neApyqdnN+PZShtp7XP92yf7jNtS4uRg62LreI8OSeI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LVeP83tfMnUNdDV645KeaTBU5Om/D9OiGvN8ILGtOK+2A2XUQbgkXvd1evKHWW0dGQOqnXXj4CjJZxDSMW90bp73aPmkgQlvv8eK2GWwlqaMCXrYGUeH42sNKXBRLJ3CNmFi1yq+KdzGEJeH9oYNZcj3RwEkD0xZ7CVASfea3bo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RhMh26pQ; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RhMh26pQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710131598; x=1741667598;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=neApyqdnN+PZShtp7XP92yf7jNtS4uRg62LreI8OSeI=;
  b=RhMh26pQer+MnKL30VfNWJwIkx1Ii4u6odjh0CzMAn9fAAATBTi2vrQD
   w+1pYZMqkI5hulo76o/jzvTELi9Cn9NQG9VBpi2SHUxDCQfAL8C5M9QDl
   PM/6wrH5GQnj3GJoCBgDFkQXkmA+Bp1iCUwS6DzaWAurmLIp7tAOb7pW1
   s5NyrjoG4JNhn6DmCYZs5BHM44Cen506nC3zY15dGo7+WXSKdc67sKvLk
   4fWyE1wTdvBaVK76RcYngIsulZDjaQIQXANA1sRhOSs8u0nrIiVl3bwSb
   Ljy1zqT/fF8QxJ3L6MaGeGQrhHwvSCOf3kKQ3fcsDcZDfXgjr5Umdnpo1
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11009"; a="4944375"
X-IronPort-AV: E=Sophos;i="6.07,115,1708416000"; 
   d="scan'208";a="4944375"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2024 21:33:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,115,1708416000"; 
   d="scan'208";a="15605040"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 10 Mar 2024 21:33:15 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rjXLd-0008tG-01;
	Mon, 11 Mar 2024 04:33:13 +0000
Date: Mon, 11 Mar 2024 12:33:03 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [axboe-block:iowait.2 4/4] kernel/sched/core.c:9046:67: warning:
 left shift count >= width of type
Message-ID: <202403111229.m8OcSoN7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git iowait.2
head:   9e65871d5161d7b24778fd9b232edb2d076cd26b
commit: 9e65871d5161d7b24778fd9b232edb2d076cd26b [4/4] sched/core: split iowait state into two states
config: openrisc-allyesconfig (https://download.01.org/0day-ci/archive/20240311/202403111229.m8OcSoN7-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240311/202403111229.m8OcSoN7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403111229.m8OcSoN7-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   kernel/sched/core.c: In function 'io_schedule_prepare':
>> kernel/sched/core.c:9046:67: warning: left shift count >= width of type [-Wshift-count-overflow]
    9046 |         int token = current->in_iowait + (current->in_iowait_acct << 32);
         |                                                                   ^~
--
   arch/openrisc/kernel/head.o: in function `_dispatch_do_ipage_fault':
>> (.text+0x900): relocation truncated to fit: R_OR1K_INSN_REL_26 against `no symbol'
   (.text+0xa00): relocation truncated to fit: R_OR1K_INSN_REL_26 against `no symbol'
   arch/openrisc/kernel/head.o: in function `exit_with_no_dtranslation':
>> (.head.text+0x21bc): relocation truncated to fit: R_OR1K_INSN_REL_26 against `no symbol'
   arch/openrisc/kernel/head.o: in function `exit_with_no_itranslation':
   (.head.text+0x2264): relocation truncated to fit: R_OR1K_INSN_REL_26 against `no symbol'
   init/main.o: in function `rcu_read_unlock':
   main.c:(.text+0x2a0): relocation truncated to fit: R_OR1K_INSN_REL_26 against symbol `debug_lockdep_rcu_enabled' defined in .noinstr.text section in kernel/rcu/update.o
   main.c:(.text+0x2cc): relocation truncated to fit: R_OR1K_INSN_REL_26 against symbol `debug_lockdep_rcu_enabled' defined in .noinstr.text section in kernel/rcu/update.o
   init/main.o: in function `init_setup':
   main.c:(.init.text+0xf4): relocation truncated to fit: R_OR1K_INSN_REL_26 against symbol `memset' defined in .text section in arch/openrisc/lib/memset.o
   init/main.o: in function `rdinit_setup':
   main.c:(.init.text+0x14c): relocation truncated to fit: R_OR1K_INSN_REL_26 against symbol `memset' defined in .text section in arch/openrisc/lib/memset.o
   init/main.o: in function `do_early_param':
   main.c:(.init.text+0x27c): relocation truncated to fit: R_OR1K_INSN_REL_26 against symbol `parameq' defined in .text section in kernel/params.o
   init/main.o: in function `unknown_bootoption':
   main.c:(.init.text+0x524): relocation truncated to fit: R_OR1K_INSN_REL_26 against symbol `sysctl_is_alias' defined in .text section in fs/proc/proc_sysctl.o
   main.c:(.init.text+0x578): additional relocation overflows omitted from the output


vim +9046 kernel/sched/core.c

  9035	
  9036	/*
  9037	 * Returns a token which is comprised of the two bits of iowait wait state -
  9038	 * one is whether we're making ourselves as in iowait for cpufreq reasons,
  9039	 * and the other is if the task should be accounted as such.
  9040	 */
  9041	long io_schedule_prepare(void)
  9042	{
  9043	#ifdef CONFIG_64BIT
  9044		long token = current->in_iowait + ((long) current->in_iowait_acct << 32);
  9045	#else
> 9046		int token = current->in_iowait + (current->in_iowait_acct << 32);
  9047	#endif
  9048		current->in_iowait = 1;
  9049		current->in_iowait_acct = 1;
  9050		blk_flush_plug(current->plug, true);
  9051		return token;
  9052	}
  9053	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
