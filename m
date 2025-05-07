Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA47C1F875C
	for <oe-kbuild-all@lists.linux.dev>; Wed,  7 May 2025 12:44:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746621851; cv=none; b=AK3jp2KVPlVdpWWty6GeDypIxe3fKU6wx0oJ+zL4y9ZgqTv644zKNGq7stuZZIe+czuAeERQNQAwd54MYvHIenMvS3DTLMsPm/Y4w5gvy/bvstC25pTP4tgROT6jzWKNnKgKwLB6THuXHjTP4eYGz3sLeemrjiaNDvx0hHZFiJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746621851; c=relaxed/simple;
	bh=s5OmKzSZ5fbc/ozGKqYtb6lLbtyalA51iN5bJU2OKDE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XS6t3md9r9MeYKuWQ2tqrgHxe2lSeaK8PltIIAY6ZEh0cBrUUrJvUB/0pEqBSGKZm+ydEKpcqd/yr7DOc2DCESz/R5NwfsL6mBB7rk/Znc39HS0tuWxV7qOJgH4vQmidHwTgifJtwgycEWH/OhRT9xSWPBjoIQ7J1pQADpDU2Io=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GJf9CG+m; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GJf9CG+m"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746621849; x=1778157849;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=s5OmKzSZ5fbc/ozGKqYtb6lLbtyalA51iN5bJU2OKDE=;
  b=GJf9CG+mUr1YYFRcGwOu71mkKRZEIYNkO6t+x9jsnu2rEvwRm0HFSfW+
   Mo4O6e2BVbjSU7sPfYc3biSDHOCGRjoX1RbKu4CdKMRQxUIyf25ae5YQI
   F+rr4lL3wo1Bn3KkJH7S/8PCYowmP84moD0bGf1w0jOlvRMneid/I5sCH
   AjG8OXXYYA8wJDVGhrHAaUhZJYZYB+6NMZRGGqwTiOFxAdeXT8gTUXb3O
   cMDeD/IWr50Ckl6Tw2xAuOjHnaq9ZRXR9I2wbNUd/6f+gbGBRw0p3WidL
   FFH80HQIRvttPdA4Ujnl+8rxhZIwmlDOMCyvhWYGAIjIsj/5qHlPYsq96
   w==;
X-CSE-ConnectionGUID: 1ERoYd7eQhSviKrx0QfFYQ==
X-CSE-MsgGUID: OAV+glRaSiah9KFzW9Xu+w==
X-IronPort-AV: E=McAfee;i="6700,10204,11426"; a="65878994"
X-IronPort-AV: E=Sophos;i="6.15,269,1739865600"; 
   d="scan'208";a="65878994"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2025 05:44:00 -0700
X-CSE-ConnectionGUID: JpNUwXm6QcuKuJTgUTjU8Q==
X-CSE-MsgGUID: nPgvzlevSema/hCgbpDbAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,269,1739865600"; 
   d="scan'208";a="135915301"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 07 May 2025 05:43:59 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uCe7w-0007nX-2Y;
	Wed, 07 May 2025 12:43:56 +0000
Date: Wed, 7 May 2025 20:43:33 +0800
From: kernel test robot <lkp@intel.com>
To: Tejun Heo <tj@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [tj-sched-ext:scx_sched-v2 28/34] kernel/sched/ext.c:6319:33:
 sparse: sparse: incorrect type in initializer (different address spaces)
Message-ID: <202505072001.YqyANNTw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tj/sched_ext.git scx_sched-v2
head:   b40e5ff46a0202549236b537090b0532f1a2903a
commit: 3b73b6d4f06e630c7c329ffd957ef00a20400da5 [28/34] sched_ext: Move dsq_hash into scx_sched
config: mips-randconfig-r111-20250501 (https://download.01.org/0day-ci/archive/20250507/202505072001.YqyANNTw-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
reproduce: (https://download.01.org/0day-ci/archive/20250507/202505072001.YqyANNTw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505072001.YqyANNTw-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/sched/ext.c:3911:13: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected unsigned long const volatile *addr @@     got unsigned long [noderef] __rcu * @@
   kernel/sched/ext.c:3911:13: sparse:     expected unsigned long const volatile *addr
   kernel/sched/ext.c:3911:13: sparse:     got unsigned long [noderef] __rcu *
   kernel/sched/ext.c:3927:13: sparse: sparse: cast removes address space '__rcu' of expression
   kernel/sched/ext.c:3927:13: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected unsigned long const volatile *addr @@     got unsigned long [noderef] __rcu * @@
   kernel/sched/ext.c:3927:13: sparse:     expected unsigned long const volatile *addr
   kernel/sched/ext.c:3927:13: sparse:     got unsigned long [noderef] __rcu *
   kernel/sched/ext.c:3927:13: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected unsigned long const volatile *addr @@     got unsigned long [noderef] __rcu * @@
   kernel/sched/ext.c:3927:13: sparse:     expected unsigned long const volatile *addr
   kernel/sched/ext.c:3927:13: sparse:     got unsigned long [noderef] __rcu *
   kernel/sched/ext.c:3986:21: sparse: sparse: cast removes address space '__rcu' of expression
   kernel/sched/ext.c:3986:21: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected unsigned long const volatile *addr @@     got unsigned long [noderef] __rcu * @@
   kernel/sched/ext.c:3986:21: sparse:     expected unsigned long const volatile *addr
   kernel/sched/ext.c:3986:21: sparse:     got unsigned long [noderef] __rcu *
   kernel/sched/ext.c:3986:21: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected unsigned long const volatile *addr @@     got unsigned long [noderef] __rcu * @@
   kernel/sched/ext.c:3986:21: sparse:     expected unsigned long const volatile *addr
   kernel/sched/ext.c:3986:21: sparse:     got unsigned long [noderef] __rcu *
   kernel/sched/ext.c:4011:35: sparse: sparse: cast removes address space '__rcu' of expression
   kernel/sched/ext.c:4011:35: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected unsigned long const volatile *addr @@     got unsigned long [noderef] __rcu * @@
   kernel/sched/ext.c:4011:35: sparse:     expected unsigned long const volatile *addr
   kernel/sched/ext.c:4011:35: sparse:     got unsigned long [noderef] __rcu *
   kernel/sched/ext.c:4011:35: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected unsigned long const volatile *addr @@     got unsigned long [noderef] __rcu * @@
   kernel/sched/ext.c:4011:35: sparse:     expected unsigned long const volatile *addr
   kernel/sched/ext.c:4011:35: sparse:     got unsigned long [noderef] __rcu *
   kernel/sched/ext.c:4045:21: sparse: sparse: cast removes address space '__rcu' of expression
   kernel/sched/ext.c:4045:21: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected unsigned long const volatile *addr @@     got unsigned long [noderef] __rcu * @@
   kernel/sched/ext.c:4045:21: sparse:     expected unsigned long const volatile *addr
   kernel/sched/ext.c:4045:21: sparse:     got unsigned long [noderef] __rcu *
   kernel/sched/ext.c:4045:21: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected unsigned long const volatile *addr @@     got unsigned long [noderef] __rcu * @@
   kernel/sched/ext.c:4045:21: sparse:     expected unsigned long const volatile *addr
   kernel/sched/ext.c:4045:21: sparse:     got unsigned long [noderef] __rcu *
   kernel/sched/ext.c:4059:21: sparse: sparse: cast removes address space '__rcu' of expression
   kernel/sched/ext.c:4059:21: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected unsigned long const volatile *addr @@     got unsigned long [noderef] __rcu * @@
   kernel/sched/ext.c:4059:21: sparse:     expected unsigned long const volatile *addr
   kernel/sched/ext.c:4059:21: sparse:     got unsigned long [noderef] __rcu *
   kernel/sched/ext.c:4059:21: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected unsigned long const volatile *addr @@     got unsigned long [noderef] __rcu * @@
   kernel/sched/ext.c:4059:21: sparse:     expected unsigned long const volatile *addr
   kernel/sched/ext.c:4059:21: sparse:     got unsigned long [noderef] __rcu *
   kernel/sched/ext.c:4079:13: sparse: sparse: cast removes address space '__rcu' of expression
   kernel/sched/ext.c:4079:13: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected unsigned long const volatile *addr @@     got unsigned long [noderef] __rcu * @@
   kernel/sched/ext.c:4079:13: sparse:     expected unsigned long const volatile *addr
   kernel/sched/ext.c:4079:13: sparse:     got unsigned long [noderef] __rcu *
   kernel/sched/ext.c:4079:13: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected unsigned long const volatile *addr @@     got unsigned long [noderef] __rcu * @@
   kernel/sched/ext.c:4079:13: sparse:     expected unsigned long const volatile *addr
   kernel/sched/ext.c:4079:13: sparse:     got unsigned long [noderef] __rcu *
   kernel/sched/ext.c:4100:21: sparse: sparse: cast removes address space '__rcu' of expression
   kernel/sched/ext.c:4100:21: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected unsigned long const volatile *addr @@     got unsigned long [noderef] __rcu * @@
   kernel/sched/ext.c:4100:21: sparse:     expected unsigned long const volatile *addr
   kernel/sched/ext.c:4100:21: sparse:     got unsigned long [noderef] __rcu *
   kernel/sched/ext.c:4100:21: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected unsigned long const volatile *addr @@     got unsigned long [noderef] __rcu * @@
   kernel/sched/ext.c:4100:21: sparse:     expected unsigned long const volatile *addr
   kernel/sched/ext.c:4100:21: sparse:     got unsigned long [noderef] __rcu *
   kernel/sched/ext.c:4115:21: sparse: sparse: cast removes address space '__rcu' of expression
   kernel/sched/ext.c:4115:21: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected unsigned long const volatile *addr @@     got unsigned long [noderef] __rcu * @@
   kernel/sched/ext.c:4115:21: sparse:     expected unsigned long const volatile *addr
   kernel/sched/ext.c:4115:21: sparse:     got unsigned long [noderef] __rcu *
   kernel/sched/ext.c:4115:21: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected unsigned long const volatile *addr @@     got unsigned long [noderef] __rcu * @@
   kernel/sched/ext.c:4115:21: sparse:     expected unsigned long const volatile *addr
   kernel/sched/ext.c:4115:21: sparse:     got unsigned long [noderef] __rcu *
   kernel/sched/ext.c:4724:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *static [toplevel] scx_root @@
   kernel/sched/ext.c:4724:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:4724:33: sparse:     got struct scx_sched [noderef] __rcu *static [toplevel] scx_root
   kernel/sched/ext.c:5038:13: sparse: sparse: cast removes address space '__rcu' of expression
   kernel/sched/ext.c:5038:13: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected unsigned long const volatile *addr @@     got unsigned long [noderef] __rcu * @@
   kernel/sched/ext.c:5038:13: sparse:     expected unsigned long const volatile *addr
   kernel/sched/ext.c:5038:13: sparse:     got unsigned long [noderef] __rcu *
   kernel/sched/ext.c:5038:13: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected unsigned long const volatile *addr @@     got unsigned long [noderef] __rcu * @@
   kernel/sched/ext.c:5038:13: sparse:     expected unsigned long const volatile *addr
   kernel/sched/ext.c:5038:13: sparse:     got unsigned long [noderef] __rcu *
   kernel/sched/ext.c:5085:13: sparse: sparse: cast removes address space '__rcu' of expression
   kernel/sched/ext.c:5085:13: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected unsigned long const volatile *addr @@     got unsigned long [noderef] __rcu * @@
   kernel/sched/ext.c:5085:13: sparse:     expected unsigned long const volatile *addr
   kernel/sched/ext.c:5085:13: sparse:     got unsigned long [noderef] __rcu *
   kernel/sched/ext.c:5085:13: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected unsigned long const volatile *addr @@     got unsigned long [noderef] __rcu * @@
   kernel/sched/ext.c:5085:13: sparse:     expected unsigned long const volatile *addr
   kernel/sched/ext.c:5085:13: sparse:     got unsigned long [noderef] __rcu *
   kernel/sched/ext.c:5108:30: sparse: sparse: cast removes address space '__rcu' of expression
   kernel/sched/ext.c:5108:30: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected unsigned long const volatile *addr @@     got unsigned long [noderef] __rcu * @@
   kernel/sched/ext.c:5108:30: sparse:     expected unsigned long const volatile *addr
   kernel/sched/ext.c:5108:30: sparse:     got unsigned long [noderef] __rcu *
   kernel/sched/ext.c:5108:30: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected unsigned long const volatile *addr @@     got unsigned long [noderef] __rcu * @@
   kernel/sched/ext.c:5108:30: sparse:     expected unsigned long const volatile *addr
   kernel/sched/ext.c:5108:30: sparse:     got unsigned long [noderef] __rcu *
   kernel/sched/ext.c:5142:21: sparse: sparse: cast removes address space '__rcu' of expression
   kernel/sched/ext.c:5142:21: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected unsigned long const volatile *addr @@     got unsigned long [noderef] __rcu * @@
   kernel/sched/ext.c:5142:21: sparse:     expected unsigned long const volatile *addr
   kernel/sched/ext.c:5142:21: sparse:     got unsigned long [noderef] __rcu *
   kernel/sched/ext.c:5142:21: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected unsigned long const volatile *addr @@     got unsigned long [noderef] __rcu * @@
   kernel/sched/ext.c:5142:21: sparse:     expected unsigned long const volatile *addr
   kernel/sched/ext.c:5142:21: sparse:     got unsigned long [noderef] __rcu *
   kernel/sched/ext.c:5166:52: sparse: sparse: incorrect type in argument 3 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/ext.c:5166:52: sparse:     expected struct task_struct *p
   kernel/sched/ext.c:5166:52: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/ext.c:5939:32: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct const *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/ext.c:5939:32: sparse:     expected struct task_struct const *p
   kernel/sched/ext.c:5939:32: sparse:     got struct task_struct [noderef] __rcu *curr
>> kernel/sched/ext.c:6319:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *static [addressable] [assigned] [toplevel] scx_root @@
   kernel/sched/ext.c:6319:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:6319:33: sparse:     got struct scx_sched [noderef] __rcu *static [addressable] [assigned] [toplevel] scx_root
   kernel/sched/ext.c:6452:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *static [addressable] [assigned] [toplevel] scx_root @@
   kernel/sched/ext.c:6452:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:6452:33: sparse:     got struct scx_sched [noderef] __rcu *static [addressable] [assigned] [toplevel] scx_root
   kernel/sched/ext.c:7291:33: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/ext.c:7291:33: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/ext.c:7291:33: sparse:    struct task_struct const *
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/ext_idle.c:245:24: sparse: sparse: Using plain integer as NULL pointer
   kernel/sched/ext_idle.c:747:13: sparse: sparse: cast removes address space '__rcu' of expression
   kernel/sched/ext_idle.c:747:13: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected unsigned long const volatile *addr @@     got unsigned long [noderef] __rcu * @@
   kernel/sched/ext_idle.c:747:13: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected unsigned long const volatile *addr @@     got unsigned long [noderef] __rcu * @@
   kernel/sched/ext_idle.c:766:49: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct const *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/syscalls.c:206:22: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/syscalls.c:206:22: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/syscalls.c:206:22: sparse:    struct task_struct *
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/sched.h:2241:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2241:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2241:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2241:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2241:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2241:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2252:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2252:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2252:26: sparse:    struct task_struct *
   kernel/sched/sched.h:2241:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2241:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2241:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2252:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2252:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2252:26: sparse:    struct task_struct *
   kernel/sched/sched.h:2241:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2241:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2241:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2241:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2241:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2241:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2252:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2252:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2252:26: sparse:    struct task_struct *
   kernel/sched/sched.h:2241:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2241:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2241:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2241:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2241:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2241:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2252:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2252:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2252:26: sparse:    struct task_struct *
   kernel/sched/sched.h:2441:9: sparse: sparse: incompatible types in comparison expression (different address spaces):

vim +6319 kernel/sched/ext.c

  6315	
  6316	static bool scx_dsq_move(struct bpf_iter_scx_dsq_kern *kit,
  6317				 struct task_struct *p, u64 dsq_id, u64 enq_flags)
  6318	{
> 6319		struct scx_sched *sch = scx_root;
  6320		struct scx_dispatch_q *src_dsq = kit->dsq, *dst_dsq;
  6321		struct rq *this_rq, *src_rq, *locked_rq;
  6322		bool dispatched = false;
  6323		bool in_balance;
  6324		unsigned long flags;
  6325	
  6326		if (!scx_kf_allowed_if_unlocked() && !scx_kf_allowed(SCX_KF_DISPATCH))
  6327			return false;
  6328	
  6329		/*
  6330		 * Can be called from either ops.dispatch() locking this_rq() or any
  6331		 * context where no rq lock is held. If latter, lock @p's task_rq which
  6332		 * we'll likely need anyway.
  6333		 */
  6334		src_rq = task_rq(p);
  6335	
  6336		local_irq_save(flags);
  6337		this_rq = this_rq();
  6338		in_balance = this_rq->scx.flags & SCX_RQ_IN_BALANCE;
  6339	
  6340		if (in_balance) {
  6341			if (this_rq != src_rq) {
  6342				raw_spin_rq_unlock(this_rq);
  6343				raw_spin_rq_lock(src_rq);
  6344			}
  6345		} else {
  6346			raw_spin_rq_lock(src_rq);
  6347		}
  6348	
  6349		/*
  6350		 * If the BPF scheduler keeps calling this function repeatedly, it can
  6351		 * cause similar live-lock conditions as consume_dispatch_q(). Insert a
  6352		 * breather if necessary.
  6353		 */
  6354		scx_breather(src_rq);
  6355	
  6356		locked_rq = src_rq;
  6357		raw_spin_lock(&src_dsq->lock);
  6358	
  6359		/*
  6360		 * Did someone else get to it? @p could have already left $src_dsq, got
  6361		 * re-enqueud, or be in the process of being consumed by someone else.
  6362		 */
  6363		if (unlikely(p->scx.dsq != src_dsq ||
  6364			     u32_before(kit->cursor.priv, p->scx.dsq_seq) ||
  6365			     p->scx.holding_cpu >= 0) ||
  6366		    WARN_ON_ONCE(src_rq != task_rq(p))) {
  6367			raw_spin_unlock(&src_dsq->lock);
  6368			goto out;
  6369		}
  6370	
  6371		/* @p is still on $src_dsq and stable, determine the destination */
  6372		dst_dsq = find_dsq_for_dispatch(sch, this_rq, dsq_id, p);
  6373	
  6374		/*
  6375		 * Apply vtime and slice updates before moving so that the new time is
  6376		 * visible before inserting into $dst_dsq. @p is still on $src_dsq but
  6377		 * this is safe as we're locking it.
  6378		 */
  6379		if (kit->cursor.flags & __SCX_DSQ_ITER_HAS_VTIME)
  6380			p->scx.dsq_vtime = kit->vtime;
  6381		if (kit->cursor.flags & __SCX_DSQ_ITER_HAS_SLICE)
  6382			p->scx.slice = kit->slice;
  6383	
  6384		/* execute move */
  6385		locked_rq = move_task_between_dsqs(p, enq_flags, src_dsq, dst_dsq);
  6386		dispatched = true;
  6387	out:
  6388		if (in_balance) {
  6389			if (this_rq != locked_rq) {
  6390				raw_spin_rq_unlock(locked_rq);
  6391				raw_spin_rq_lock(this_rq);
  6392			}
  6393		} else {
  6394			raw_spin_rq_unlock_irqrestore(locked_rq, flags);
  6395		}
  6396	
  6397		kit->cursor.flags &= ~(__SCX_DSQ_ITER_HAS_SLICE |
  6398				       __SCX_DSQ_ITER_HAS_VTIME);
  6399		return dispatched;
  6400	}
  6401	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
