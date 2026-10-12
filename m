Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C49543B0AD4
	for <oe-kbuild-all@lists.linux.dev>; Mon, 12 Oct 2026 19:34:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791833644; cv=none; b=idDAOthf4nekAcoyHx1/V1CV6PiDjdBuCBgyw2ZH4bUud/4MPJ1JuHU/xmVTfbN1x9xR6q4jHJu6PhNkpM1vtE0DCKltEnWk8dxbf4ASWVDMmdz2mGZGaJYoipiHv9a60ee7wJs0PYFra9hjV/5LphTfotgzEmfxjChb7XQ/DxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791833644; c=relaxed/simple;
	bh=2pcmgyYAw7W1ATjzTCKJ5QPzZYo30l9CCYD+2ZA80rE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=dvKX0cLGuhQOo6/E67aEyLxHfTHmitgzKgKYl8QcLmjNuiqLAtq6OT8wYx2SlchAJr/ebTwA1DSlxn22PF+D98bk8dQ8k7ZNZzOU9u6gBGIdEsw/Nc5WlphUAgWGUPWy6T3jzqS+w007yu3HTmfSHW8o2T67hWQ4IdIGp4fFZSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RjF4jiQu; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RjF4jiQu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791833643; x=1823369643;
  h=date:from:to:cc:subject:message-id;
  bh=2pcmgyYAw7W1ATjzTCKJ5QPzZYo30l9CCYD+2ZA80rE=;
  b=RjF4jiQuZygDTYuWMfhI+cwznGGqPJP5hMlrcc/WKA9GffY05yWvdVOT
   zWH8txAmDnPE9b1Ef7ZZDHtq/DOJII/Yq81VKjPKqxCFw6BJrtSbX6fpu
   yVvnaGXfT7Gm3Vm/11zk95+RfKPOCdx1xOrV+6cJxxyML1F3F/ioK2AIx
   iMLHUzuZH99u0PlZn2Y57AFzEHtMxXoD8Rtk0lRTbL1mT2XF9pyb7lO/A
   pUDOKAzkTCx8HMZ6f6XQldIla1TBQJAdIzy7+/LYIF8WMiL64DQy7RBH9
   t/Kj3JOuzlKgLtElPvrtvhlpRw32WUAS3Qn8OhFFevdxNV+R9vH98hWdA
   A==;
X-CSE-ConnectionGUID: IWBw9rMiQa2gBr5gO8BeXg==
X-CSE-MsgGUID: KRT+5BeJTq6co7gg34rQ5w==
X-IronPort-AV: E=McAfee;i="6800,10657,11933"; a="658359"
X-IronPort-AV: E=Sophos;i="6.27,154,1787036400"; 
   d="scan'208";a="658359"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2026 12:34:02 -0700
X-CSE-ConnectionGUID: HadNFuo6QQyogY3Dp+ha6A==
X-CSE-MsgGUID: b/t3Wq1bR4Ou46JW+zjqtg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,154,1787036400"; 
   d="scan'208";a="892470"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 12 Oct 2026 12:34:01 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xGLmY-00000000C2m-2TdB;
	Mon, 12 Oct 2026 19:33:58 +0000
Date: Tue, 13 Oct 2026 03:33:50 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-kiwi-6.1 294/294]
 kernel/sched/fair.c:4492:6: warning: no previous prototype for
 'set_next_entity'
Message-ID: <202610130336.aopv9kvh-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android14-kiwi-6.1
head:   3c746ad5d5d2bb8acea14252e89e1395c7da86f7
commit: f94f1b91143ed44a6c64a6d201cd3b41e3c90863 [294/294] ANDROID: sched: Export set_next_entity
config: i386-randconfig-1012-20261012 (https://download.01.org/0day-ci/archive/20261013/202610130336.aopv9kvh-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261013/202610130336.aopv9kvh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610130336.aopv9kvh-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/gfp.h:6,
                    from include/linux/percpu_counter.h:16,
                    from include/linux/sched/user.h:7,
                    from include/linux/cred.h:17,
                    from include/linux/sched/signal.h:10,
                    from include/linux/sched/cputime.h:5,
                    from kernel/sched/sched.h:11,
                    from kernel/sched/fair.c:23:
   include/linux/mmzone.h: In function '__nr_to_section':
   include/linux/mmzone.h:1347:13: warning: the comparison will always evaluate as 'true' for the address of 'mem_section' will never be NULL [-Waddress]
    1347 |         if (!mem_section[SECTION_NR_TO_ROOT(nr)])
         |             ^
   include/linux/mmzone.h:1333:27: note: 'mem_section' declared here
    1333 | extern struct mem_section mem_section[NR_SECTION_ROOTS][SECTIONS_PER_ROOT];
         |                           ^~~~~~~~~~~
   kernel/sched/fair.c: At top level:
   kernel/sched/fair.c:627:5: warning: no previous prototype for 'sched_update_scaling' [-Wmissing-prototypes]
     627 | int sched_update_scaling(void)
         |     ^~~~~~~~~~~~~~~~~~~~
>> kernel/sched/fair.c:4492:6: warning: no previous prototype for 'set_next_entity' [-Wmissing-prototypes]
    4492 | void set_next_entity(struct cfs_rq *cfs_rq, struct sched_entity *se)
         |      ^~~~~~~~~~~~~~~


vim +/set_next_entity +4492 kernel/sched/fair.c

  4491	
> 4492	void set_next_entity(struct cfs_rq *cfs_rq, struct sched_entity *se)
  4493	{
  4494		clear_buddies(cfs_rq, se);
  4495	
  4496		/* 'current' is not kept within the tree. */
  4497		if (se->on_rq) {
  4498			/*
  4499			 * Any task has to be enqueued before it get to execute on
  4500			 * a CPU. So account for the time it spent waiting on the
  4501			 * runqueue.
  4502			 */
  4503			update_stats_wait_end(cfs_rq, se);
  4504			__dequeue_entity(cfs_rq, se);
  4505			update_load_avg(cfs_rq, se, UPDATE_TG);
  4506		}
  4507	
  4508		update_stats_curr_start(cfs_rq, se);
  4509		cfs_rq->curr = se;
  4510	
  4511		/*
  4512		 * Track our maximum slice length, if the CPU's load is at
  4513		 * least twice that of our own weight (i.e. dont track it
  4514		 * when there are only lesser-weight tasks around):
  4515		 */
  4516		if (schedstat_enabled() &&
  4517		    rq_of(cfs_rq)->cfs.load.weight >= 2*se->load.weight) {
  4518			schedstat_set(se->statistics.slice_max,
  4519				max((u64)schedstat_val(se->statistics.slice_max),
  4520				    se->sum_exec_runtime - se->prev_sum_exec_runtime));
  4521		}
  4522	
  4523		se->prev_sum_exec_runtime = se->sum_exec_runtime;
  4524	}
  4525	EXPORT_SYMBOL_GPL(set_next_entity);
  4526	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
