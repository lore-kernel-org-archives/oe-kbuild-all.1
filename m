Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFB65250BE8
	for <oe-kbuild-all@lists.linux.dev>; Tue, 11 Feb 2025 14:33:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739284404; cv=none; b=Jut98dv13vp6VOmAHnlYwtRj8VfFfZbA3keIsXTOJM2BJm2Q8630P0UGODaFpvpGTRrPH84TqsywDVY2i+bXJlJK/83Kqt+7M+pPyGY3QaYq9PwuM0ZAx058IaEt0I5ugOS+kS/c1lDAA9W5lLsDXmOIswgbjRPnMxBj5kJ3YjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739284404; c=relaxed/simple;
	bh=2pRcYvubpjN1NiJd+cOJoYPoSC3zNtEjbFzwvc40SgI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SNmLcKtE9G3sXxXr+PagZ9kTx3SYXiV4qkjgP4Ly8s3JiI9d5Y3XWy+P4+DrPM67xyAv4RElHt773cC3MzsQhjc7SjABgLDTkZ47HRPfPdANn1nSuTnTdBY6zOpI/WJurqiJUOQbxGEFRZt7mp72qgMUVQYg16LjBC+xafPWB70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dUTce5T6; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dUTce5T6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739284402; x=1770820402;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2pRcYvubpjN1NiJd+cOJoYPoSC3zNtEjbFzwvc40SgI=;
  b=dUTce5T6WrgwMVog6lRDAeekMVDttA0QDpYIcObILbsaxL72Pfx8d0tL
   N34LS0DFFVaNxFW4VpSsyt7eN55IaJCxxzO/7tELARI4Xe7c3Bb4Qyxi8
   kS9pKC/HZ/gVv6VxrpsNW5sKN7QImdQh3S56GjWMgYu8muVMeUxA7NJGk
   uUwoWyp5DcH+GohbY3Z0VmVrINLMelnHCBb6RmKIhKTeiL6M4EV8yYVA0
   Fkx7zgTKSR0GwWuj+kU72yVbah1KIjwVhHjkXqX0h+YEz9lm3kLW7CLRB
   ZuIpvhCV8qiw96/SQLE818S7zvl9LwoDwmAL04PxkZ9cFQYv/Y58R/oS/
   g==;
X-CSE-ConnectionGUID: 5wogB6/RTQ6gt+DAASP7rg==
X-CSE-MsgGUID: YA8ULmqMRsSenP36RwPtzQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11342"; a="50536855"
X-IronPort-AV: E=Sophos;i="6.13,277,1732608000"; 
   d="scan'208";a="50536855"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2025 06:33:21 -0800
X-CSE-ConnectionGUID: 8CeLyojNQ7y4xHf30Wf53g==
X-CSE-MsgGUID: ixUx6WNjS9uuo7tal92zjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,277,1732608000"; 
   d="scan'208";a="113170240"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 11 Feb 2025 06:33:20 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1thrK9-0014IR-34;
	Tue, 11 Feb 2025 14:33:17 +0000
Date: Tue, 11 Feb 2025 22:33:14 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Cheng Yu <serein.chengyu@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2735/2735] kernel/sched/fair.c:4483:31: error:
 implicit declaration of function 'is_tg_steal'
Message-ID: <202502112236.7nfqO8jT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   83b361e2942e85c04f931c63e78bc54215a2db25
commit: 433c0b72564239cf3086f563d5ca32a10e4ffd3f [2735/2735] sched/fair: Count the number of tasks marked as steal_task on cfs_rq
config: x86_64-randconfig-103-20250211 (https://download.01.org/0day-ci/archive/20250211/202502112236.7nfqO8jT-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250211/202502112236.7nfqO8jT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502112236.7nfqO8jT-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/sched/fair.c:23:
   In file included from kernel/sched/sched.h:39:
   In file included from include/linux/blkdev.h:9:
   In file included from include/linux/genhd.h:20:
   In file included from include/linux/blk_types.h:11:
   In file included from include/linux/bvec.h:14:
   In file included from include/linux/mm.h:1587:
   include/linux/vmstat.h:417:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     417 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     418 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:424:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     424 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     425 |                            NR_VM_NUMA_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:431:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     431 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:436:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     436 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     437 |                            NR_VM_NUMA_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~
   In file included from kernel/sched/fair.c:23:
   kernel/sched/sched.h:1864:15: warning: cast from 'void (*)(struct rq *)' to 'void (*)(struct callback_head *)' converts to incompatible function type [-Wcast-function-type-strict]
    1864 |         head->func = (void (*)(struct callback_head *))func;
         |                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> kernel/sched/fair.c:4483:31: error: implicit declaration of function 'is_tg_steal' [-Werror,-Wimplicit-function-declaration]
    4483 |         return group_steal_used() && is_tg_steal(steal_task);
         |                                      ^
   kernel/sched/fair.c:4489:16: warning: variable 'time' set but not used [-Wunused-but-set-variable]
    4489 |         unsigned long time;
         |                       ^
   kernel/sched/fair.c:4517:16: warning: variable 'time' set but not used [-Wunused-but-set-variable]
    4517 |         unsigned long time;
         |                       ^
   kernel/sched/fair.c:6013:6: warning: no previous prototype for function 'init_cfs_bandwidth' [-Wmissing-prototypes]
    6013 | void init_cfs_bandwidth(struct cfs_bandwidth *cfs_b) {}
         |      ^
   kernel/sched/fair.c:6013:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    6013 | void init_cfs_bandwidth(struct cfs_bandwidth *cfs_b) {}
         | ^
         | static 
   kernel/sched/fair.c:8191:16: warning: variable 'time' set but not used [-Wunused-but-set-variable]
    8191 |         unsigned long time;
         |                       ^
   kernel/sched/fair.c:9185:16: warning: variable 'time' set but not used [-Wunused-but-set-variable]
    9185 |         unsigned long time;
         |                       ^
   kernel/sched/fair.c:9944:29: error: implicit declaration of function 'is_tg_steal' [-Werror,-Wimplicit-function-declaration]
    9944 |         if (group_steal_used() && !is_tg_steal(tg->steal_task))
         |                                    ^
>> kernel/sched/fair.c:9944:43: error: incomplete definition of type 'struct task_group'
    9944 |         if (group_steal_used() && !is_tg_steal(tg->steal_task))
         |                                                ~~^
   include/linux/sched.h:69:8: note: forward declaration of 'struct task_group'
      69 | struct task_group;
         |        ^
   kernel/sched/fair.c:13961:6: warning: no previous prototype for function 'free_fair_sched_group' [-Wmissing-prototypes]
    13961 | void free_fair_sched_group(struct task_group *tg) { }
          |      ^
   kernel/sched/fair.c:13961:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    13961 | void free_fair_sched_group(struct task_group *tg) { }
          | ^
          | static 
   kernel/sched/fair.c:13963:5: warning: no previous prototype for function 'alloc_fair_sched_group' [-Wmissing-prototypes]
    13963 | int alloc_fair_sched_group(struct task_group *tg, struct task_group *parent)
          |     ^
   kernel/sched/fair.c:13963:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    13963 | int alloc_fair_sched_group(struct task_group *tg, struct task_group *parent)
          | ^
          | static 
   kernel/sched/fair.c:13968:6: warning: no previous prototype for function 'online_fair_sched_group' [-Wmissing-prototypes]
    13968 | void online_fair_sched_group(struct task_group *tg) { }
          |      ^
   kernel/sched/fair.c:13968:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    13968 | void online_fair_sched_group(struct task_group *tg) { }
          | ^
          | static 
   kernel/sched/fair.c:13970:6: warning: no previous prototype for function 'unregister_fair_sched_group' [-Wmissing-prototypes]
    13970 | void unregister_fair_sched_group(struct task_group *tg) { }
          |      ^
   kernel/sched/fair.c:13970:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    13970 | void unregister_fair_sched_group(struct task_group *tg) { }
          | ^
          | static 
   14 warnings and 3 errors generated.


vim +/is_tg_steal +4483 kernel/sched/fair.c

  4480	
  4481	static inline bool group_steal_enabled(int steal_task)
  4482	{
> 4483		return group_steal_used() && is_tg_steal(steal_task);
  4484	}
  4485	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
