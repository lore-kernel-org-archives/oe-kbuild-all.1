Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 574241799F
	for <oe-kbuild-all@lists.linux.dev>; Thu,  2 Jan 2025 07:37:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735803427; cv=none; b=e/T0abGKzKl5L8c8+YXOFOhlsO/tN04nXVCPQBxv1ujQXiG020A5pobv6WNnrdtIiDAgjAZWbduHIX75rvw7IZsY/25Vn9RH1/4SdLeb7If7eeQ1tMWcq/tDQ5rJCdElLqkyFcR7M2ieMrsDBukaltIF/FFY/JUkvuYY0l4nAmU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735803427; c=relaxed/simple;
	bh=QUO8awXTxlSIPwS2rOQilHzC66fY+xvelKA6oXbq4iY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jFNpyNXtfJou7mT74/b5mIcIQE/fiE22doIQObCgnBlmUqbQHNJe/9B7K1ib3YilLCB2X2PGMuj7sP56i84KD6wQA3zjSpvNpzBpb91ce3miqavupQQ48+CNeLdoh9L9jzcYdM8eZU1LczozdaJ9mR+S3wt5QFEu4kYcpEpPobU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jzYiJXyN; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jzYiJXyN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735803425; x=1767339425;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QUO8awXTxlSIPwS2rOQilHzC66fY+xvelKA6oXbq4iY=;
  b=jzYiJXyNuxkuq987VgPORSn1y90dlOZXOzPCGCc56JVSFiwStsuJO24f
   Lz4sGbvQKwygpBXhRtVYiJ9JnYczphDdSaqzZi0JZCFntQnZqi89MGWgq
   V91dbhr98Xew81QbmjxcInlTbWegFphl9lA9eNRO60oRDXWFcYdWNPkXX
   UOTF4MwZoAeH0mOnym+b4DyDSmQflDc7rmrBg+Ju5OkOZ2pyDmCx5C8BQ
   DARjpoOV92RtkioeC3MvCvcCohsWDpRtFocY1Ic4xxSl5MLF1evNwQkr1
   gsMvdhVJt5LZUnsXrzOQ6BqsK/fB2LQ5hXKFMAeGFtgorLhmC0GfA5CBX
   w==;
X-CSE-ConnectionGUID: 6zRjTmgwRvGeEIHveTXBfA==
X-CSE-MsgGUID: qFerYHmqSCGE5jpiWqEVog==
X-IronPort-AV: E=McAfee;i="6700,10204,11302"; a="46708568"
X-IronPort-AV: E=Sophos;i="6.12,284,1728975600"; 
   d="scan'208";a="46708568"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jan 2025 23:37:05 -0800
X-CSE-ConnectionGUID: B0B+y2MFS8SoDUE/0fL84w==
X-CSE-MsgGUID: u7Hd5tTYTUSpppwWgfmMGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="132375482"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 01 Jan 2025 23:37:04 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tTFlN-0008JN-2F;
	Thu, 02 Jan 2025 07:37:01 +0000
Date: Thu, 2 Jan 2025 15:36:00 +0800
From: kernel test robot <lkp@intel.com>
To: steven@liquorix.net
Cc: oe-kbuild-all@lists.linux.dev
Subject: [zen:6.12/prjc-revert-active-balance 9/12]
 kernel/sched/alt_core.h:137:57: error: implicit declaration of function
 'sched_rq_prio_idx'
Message-ID: <202501021553.zgs9s8qf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/zen-kernel/zen-kernel 6.12/prjc-revert-active-balance
head:   4a42958cae493501eea276a2926f0d3727193c66
commit: 82b2d2f22a043f81bad8f1738e4ff8b20bdedb0e [9/12] Revert "sched/alt: Introduce alt_topology.c/.h files"
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20250102/202501021553.zgs9s8qf-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250102/202501021553.zgs9s8qf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501021553.zgs9s8qf-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/sched/syscalls.c:20,
                    from kernel/sched/build_policy.c:72:
   kernel/sched/alt_core.h: In function 'sched_rq_first_task':
>> kernel/sched/alt_core.h:137:57: error: implicit declaration of function 'sched_rq_prio_idx' [-Wimplicit-function-declaration]
     137 |         const struct list_head *head = &rq->queue.heads[sched_rq_prio_idx(rq)];
         |                                                         ^~~~~~~~~~~~~~~~~
   kernel/sched/alt_core.h: In function 'sched_rq_next_task':
>> kernel/sched/alt_core.h:151:37: error: implicit declaration of function 'sched_idx2prio' [-Wimplicit-function-declaration]
     151 |                                     sched_idx2prio(idx, rq) + 1);
         |                                     ^~~~~~~~~~~~~~
>> kernel/sched/alt_core.h:152:41: error: implicit declaration of function 'sched_prio2idx' [-Wimplicit-function-declaration]
     152 |                 head = &rq->queue.heads[sched_prio2idx(idx, rq)];
         |                                         ^~~~~~~~~~~~~~
   kernel/sched/syscalls.c: In function 'task_prio':
>> kernel/sched/syscalls.c:247:17: error: implicit declaration of function 'task_sched_prio_normal'; did you mean 'task_sched_runtime'? [-Wimplicit-function-declaration]
     247 |                 task_sched_prio_normal(p, task_rq(p));
         |                 ^~~~~~~~~~~~~~~~~~~~~~
         |                 task_sched_runtime
   kernel/sched/syscalls.c: In function 'do_sched_yield':
>> kernel/sched/syscalls.c:1647:17: error: implicit declaration of function 'do_sched_yield_type_1'; did you mean 'do_sched_yield'? [-Wimplicit-function-declaration]
    1647 |                 do_sched_yield_type_1(p, rq);
         |                 ^~~~~~~~~~~~~~~~~~~~~
         |                 do_sched_yield


vim +/sched_rq_prio_idx +137 kernel/sched/alt_core.h

fa7474292ee36c Alfred Chen 2024-09-13  127  
4b5cc914b403d4 Alfred Chen 2024-04-25  128  /*
4b5cc914b403d4 Alfred Chen 2024-04-25  129   * RQ related inlined functions
4b5cc914b403d4 Alfred Chen 2024-04-25  130   */
4b5cc914b403d4 Alfred Chen 2024-04-25  131  
4b5cc914b403d4 Alfred Chen 2024-04-25  132  /*
4b5cc914b403d4 Alfred Chen 2024-04-25  133   * This routine assume that the idle task always in queue
4b5cc914b403d4 Alfred Chen 2024-04-25  134   */
4b5cc914b403d4 Alfred Chen 2024-04-25  135  static inline struct task_struct *sched_rq_first_task(struct rq *rq)
4b5cc914b403d4 Alfred Chen 2024-04-25  136  {
4b5cc914b403d4 Alfred Chen 2024-04-25 @137  	const struct list_head *head = &rq->queue.heads[sched_rq_prio_idx(rq)];
4b5cc914b403d4 Alfred Chen 2024-04-25  138  
4b5cc914b403d4 Alfred Chen 2024-04-25  139  	return list_first_entry(head, struct task_struct, sq_node);
4b5cc914b403d4 Alfred Chen 2024-04-25  140  }
4b5cc914b403d4 Alfred Chen 2024-04-25  141  
4b5cc914b403d4 Alfred Chen 2024-04-25  142  static inline struct task_struct * sched_rq_next_task(struct task_struct *p, struct rq *rq)
4b5cc914b403d4 Alfred Chen 2024-04-25  143  {
4b5cc914b403d4 Alfred Chen 2024-04-25  144  	struct list_head *next = p->sq_node.next;
4b5cc914b403d4 Alfred Chen 2024-04-25  145  
4b5cc914b403d4 Alfred Chen 2024-04-25  146  	if (&rq->queue.heads[0] <= next && next < &rq->queue.heads[SCHED_LEVELS]) {
4b5cc914b403d4 Alfred Chen 2024-04-25  147  		struct list_head *head;
4b5cc914b403d4 Alfred Chen 2024-04-25  148  		unsigned long idx = next - &rq->queue.heads[0];
4b5cc914b403d4 Alfred Chen 2024-04-25  149  
4b5cc914b403d4 Alfred Chen 2024-04-25  150  		idx = find_next_bit(rq->queue.bitmap, SCHED_QUEUE_BITS,
4b5cc914b403d4 Alfred Chen 2024-04-25 @151  				    sched_idx2prio(idx, rq) + 1);
4b5cc914b403d4 Alfred Chen 2024-04-25 @152  		head = &rq->queue.heads[sched_prio2idx(idx, rq)];
4b5cc914b403d4 Alfred Chen 2024-04-25  153  
4b5cc914b403d4 Alfred Chen 2024-04-25  154  		return list_first_entry(head, struct task_struct, sq_node);
4b5cc914b403d4 Alfred Chen 2024-04-25  155  	}
4b5cc914b403d4 Alfred Chen 2024-04-25  156  
4b5cc914b403d4 Alfred Chen 2024-04-25  157  	return list_next_entry(p, sq_node);
4b5cc914b403d4 Alfred Chen 2024-04-25  158  }
4b5cc914b403d4 Alfred Chen 2024-04-25  159  

:::::: The code at line 137 was first introduced by commit
:::::: 4b5cc914b403d4c2b5d7a5c842f9239ea2ad02c3 sched/alt: Introduce alt_topology.c/.h files

:::::: TO: Alfred Chen <cchalpha@gmail.com>
:::::: CC: Alfred Chen <cchalpha@gmail.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
