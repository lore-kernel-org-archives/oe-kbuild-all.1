Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D0FE3DB33C
	for <oe-kbuild-all@lists.linux.dev>; Mon, 31 Aug 2026 08:26:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788164783; cv=none; b=S2nDg8+0WihXMyzkojhenaOiPTVV+6gK01oiPX/0KICnsLxLKvXFS23fGcXd5TToTPLGTiVMB7ukOHT1rWaXLvnhUfa/eseNk2rXbb6c1EYJoTL2OGFuFMe+wcElLCiz1O7g8B7WLNqKP+MJN2PePdK8/3zbKG0AKV+hJWSkn08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788164783; c=relaxed/simple;
	bh=vvD34xuk1ydjWdhGiTRXNiadm/IzpdIryK8ffRjawUw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=FYCznRxY5USsMwgESS2wcqKvcrse1Sbf+hdvaNfpKaP4WoN3ZR5EetBFqLgSRvveryF1WhF2mPUgoGidctSV0FiHibDLF4IrLTqm2QW+NzlVILW8Z4APCvOungszqThFXhp4QWyvO8R2sf5UTi7S3Oke5Fzl6LAW/XBBjijuMfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kcl9bp+V; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kcl9bp+V"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788164782; x=1819700782;
  h=date:from:to:cc:subject:message-id;
  bh=vvD34xuk1ydjWdhGiTRXNiadm/IzpdIryK8ffRjawUw=;
  b=kcl9bp+VkI5NnvxS2AILepoOabgvzWd0Trd9cqWxzaXbFl9OfTvUrQsj
   zSfbiO9vCgi8+F74kpAAM5vlJr6bzpuBgnZ++tIlf1XQIV/NBjmEM/Pm2
   cjhLrT9xoQJKgGvnXCd45d17goSkPHeheKf1200OY3Un5ViyazzxtQGBy
   ohY1hLV9yM+a35km/7pnx0yTxCXMQHK7pOUprlqBkqmYUuE0mCxRdkNy9
   SQZKoWOevns9ozb75jSK1ZV9NgDYS0XTppI8J31van/hI8BW2l6wlk3x0
   ih7JJBfa5p2xjyQ83lGsu3kOnX+o2bGhBAXRcOo8KricYba46luPLPxiE
   A==;
X-CSE-ConnectionGUID: /mnbNebNRD+haqApLbetOQ==
X-CSE-MsgGUID: n0LUaWkXR5ab3MlLIojHVA==
X-IronPort-AV: E=McAfee;i="6800,10657,11891"; a="99916922"
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; 
   d="scan'208";a="99916922"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2026 01:26:21 -0700
X-CSE-ConnectionGUID: n3lndIB3TXC711ZIXyue7Q==
X-CSE-MsgGUID: aU9LnGaSQwGpV4cgyy000g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; 
   d="scan'208";a="262606066"
Received: from lkp-server01.sh.intel.com (HELO 78edef60ff5d) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 31 Aug 2026 01:26:19 -0700
Received: from kbuild by 78edef60ff5d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x0xLN-000000000AF-0o16;
	Mon, 31 Aug 2026 08:26:17 +0000
Date: Mon, 31 Aug 2026 16:25:25 +0800
From: kernel test robot <lkp@intel.com>
To: steven@liquorix.net
Cc: oe-kbuild-all@lists.linux.dev
Subject: [zen:7.2/prjc 636/754]
 kernel/trace/rv/monitors/deadline/deadline.h:67:6: error: call to undeclared
 function 'dl_server'; ISO C99 and later do not support implicit function
 declarations
Message-ID: <202608311647.WdAveycy-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/zen-kernel/zen-kernel 7.2/prjc
head:   424b4e76ee0219c5022ca153c4aaf342166aef83
commit: 2aa4e79f80724416740dea5ee6450a3d338d8ea9 [636/754] sched/alt: [Sync] deadline sync-up fix
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20260831/202608311647.WdAveycy-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 52774473867e49b5891ab9381accf4e5a3ce0024)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260831/202608311647.WdAveycy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608311647.WdAveycy-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/trace/rv/monitors/deadline/deadline.c:10:
>> kernel/trace/rv/monitors/deadline/deadline.h:67:6: error: call to undeclared function 'dl_server'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      67 |         if (dl_server(dl_se) && type != DL_TASK) {
         |             ^
>> kernel/trace/rv/monitors/deadline/deadline.h:74:9: error: call to undeclared function 'dl_task_of'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      74 |         return dl_task_of(dl_se)->pid;
         |                ^
   kernel/trace/rv/monitors/deadline/deadline.h:74:9: note: did you mean 'dl_task'?
   include/linux/sched/deadline.h:7:19: note: 'dl_task' declared here
       7 | static inline int dl_task(struct task_struct *p)
         |                   ^
   In file included from kernel/trace/rv/monitors/deadline/deadline.c:10:
>> kernel/trace/rv/monitors/deadline/deadline.h:74:28: error: member reference type 'int' is not a pointer
      74 |         return dl_task_of(dl_se)->pid;
         |                ~~~~~~~~~~~~~~~~~  ^
   kernel/trace/rv/monitors/deadline/deadline.h:80:14: error: no member named 'sched_class' in 'struct task_struct'
      80 |                tsk->sched_class == rv_ext_sched_class;
         |                ~~~  ^
   4 errors generated.


vim +/dl_server +67 kernel/trace/rv/monitors/deadline/deadline.h

b133207deb7260 Gabriele Monaco 2026-03-30  48  
b133207deb7260 Gabriele Monaco 2026-03-30  49  /*
b133207deb7260 Gabriele Monaco 2026-03-30  50   * Use negative numbers for the server.
b133207deb7260 Gabriele Monaco 2026-03-30  51   * Currently only one fair server per CPU, may change in the future.
b133207deb7260 Gabriele Monaco 2026-03-30  52   */
b133207deb7260 Gabriele Monaco 2026-03-30  53  #define fair_server_id(cpu) (-cpu)
b133207deb7260 Gabriele Monaco 2026-03-30  54  #define ext_server_id(cpu) (-cpu - num_possible_cpus())
b133207deb7260 Gabriele Monaco 2026-03-30  55  #define NO_SERVER_ID (-2 * num_possible_cpus())
b133207deb7260 Gabriele Monaco 2026-03-30  56  /*
b133207deb7260 Gabriele Monaco 2026-03-30  57   * Get a unique id used for dl entities
b133207deb7260 Gabriele Monaco 2026-03-30  58   *
b133207deb7260 Gabriele Monaco 2026-03-30  59   * The cpu is not required for tasks as the pid is used there, if this function
b133207deb7260 Gabriele Monaco 2026-03-30  60   * is called on a dl_se that for sure corresponds to a task, DL_TASK can be
b133207deb7260 Gabriele Monaco 2026-03-30  61   * used in place of cpu.
b133207deb7260 Gabriele Monaco 2026-03-30  62   * We need the cpu for servers as it is provided in the tracepoint and we
b133207deb7260 Gabriele Monaco 2026-03-30  63   * cannot easily retrieve it from the dl_se (requires the struct rq definition).
b133207deb7260 Gabriele Monaco 2026-03-30  64   */
b133207deb7260 Gabriele Monaco 2026-03-30  65  static inline int get_entity_id(struct sched_dl_entity *dl_se, int cpu, u8 type)
b133207deb7260 Gabriele Monaco 2026-03-30  66  {
b133207deb7260 Gabriele Monaco 2026-03-30 @67  	if (dl_server(dl_se) && type != DL_TASK) {
b133207deb7260 Gabriele Monaco 2026-03-30  68  		if (type == DL_SERVER_FAIR)
b133207deb7260 Gabriele Monaco 2026-03-30  69  			return fair_server_id(cpu);
b133207deb7260 Gabriele Monaco 2026-03-30  70  		if (type == DL_SERVER_EXT)
b133207deb7260 Gabriele Monaco 2026-03-30  71  			return ext_server_id(cpu);
b133207deb7260 Gabriele Monaco 2026-03-30  72  		return NO_SERVER_ID;
b133207deb7260 Gabriele Monaco 2026-03-30  73  	}
b133207deb7260 Gabriele Monaco 2026-03-30 @74  	return dl_task_of(dl_se)->pid;
b133207deb7260 Gabriele Monaco 2026-03-30  75  }
b133207deb7260 Gabriele Monaco 2026-03-30  76  

:::::: The code at line 67 was first introduced by commit
:::::: b133207deb72609ad4da40c4d50128a5e150677b rv: Add nomiss deadline monitor

:::::: TO: Gabriele Monaco <gmonaco@redhat.com>
:::::: CC: Gabriele Monaco <gmonaco@redhat.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
