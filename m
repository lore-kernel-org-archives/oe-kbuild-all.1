Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A9771DA21
	for <oe-kbuild-all@lists.linux.dev>; Wed,  7 May 2025 14:57:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746629822; cv=none; b=PKYP6vBGD96XTTwOsAkC//ghNWn/3dRIrgfs8LMuO/UhQLRdo62xTh+cxVIHpKHez0q1u1JOHooPEIKubghS3NyLP6BB9+NVOO/otX7HMkxzbTiPsaEVtUwNdYInaJSuYwY3KplhRa85Z6zatpPFONiKwmV0zvtMnF1w8QJplbg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746629822; c=relaxed/simple;
	bh=62uTobWU9aeIgDgAhafZEQWqhpXIgLQzZrHHSTK7FLk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cJTUvZBaayMgYguQmmjygp7JraZW/qZ6tYqquriy/QICQHOcwuYoo1dAtOwTONVjR7R3gManPvgowM4uyGhxvO/KQrt4gvgrjWL4539le+PHYf6bQ4F2W4wJ8nIgWcPWeTt18m4Jtk9LZqyaVvx03Q3zVum3qfl9eG/GLppSY7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EegIbQtL; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EegIbQtL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746629820; x=1778165820;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=62uTobWU9aeIgDgAhafZEQWqhpXIgLQzZrHHSTK7FLk=;
  b=EegIbQtLgKFGjTpqSySsH1ZOzs36Ag67ATjXcYqqVcvV73hqqDgMeUA4
   LaZU1gDd8issn6p5U/e567Cb7UpwK7LDBa8IkczzCPsUgteNP29ylnlOI
   i93SC2hVRwsW0zlh1NKtrX0BhpsU541+8AZL0t+/IP+e/I1RSABNOjK8F
   v57qOhgYmPmpIFTWYE69Kkl1ZeOfL5D7vuwhGR5Tw6s7CfDnk5W1E4MPh
   +e/b+1vaRotOP3bm6tyhg7WAhcJErYJMDd24pqV4CI9X57Tv39/A/a2pr
   P4f5J8uuKzY92kuC0S999OLqjHws+FksSCJHO3I+4oy/BMpz04YKEjpAq
   A==;
X-CSE-ConnectionGUID: gWcFfp2HRy6Hfp/TDcaB8Q==
X-CSE-MsgGUID: 2xoOu3weTcWaeHCKnLGO9w==
X-IronPort-AV: E=McAfee;i="6700,10204,11426"; a="59024512"
X-IronPort-AV: E=Sophos;i="6.15,269,1739865600"; 
   d="scan'208";a="59024512"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2025 07:56:56 -0700
X-CSE-ConnectionGUID: Sc0hX9V0Qv2fYvD7sQK7rQ==
X-CSE-MsgGUID: ss9ARrrIQ+O/2vnlC8b0Kg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,269,1739865600"; 
   d="scan'208";a="136499428"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 07 May 2025 07:56:55 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uCgCa-00081m-1w;
	Wed, 07 May 2025 14:56:52 +0000
Date: Wed, 7 May 2025 22:56:38 +0800
From: kernel test robot <lkp@intel.com>
To: Tejun Heo <tj@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [tj-sched-ext:scx_sched-v2 32/34] kernel/sched/ext.c:5197:25:
 sparse: sparse: incorrect type in argument 1 (different address spaces)
Message-ID: <202505072226.uZxDYKoa-lkp@intel.com>
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
commit: 7898b6f0722952f0800975ff76aa715cf9862957 [32/34] sched_ext: Move event_stats_cpu into scx_sched
config: mips-randconfig-r111-20250501 (https://download.01.org/0day-ci/archive/20250507/202505072226.uZxDYKoa-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
reproduce: (https://download.01.org/0day-ci/archive/20250507/202505072226.uZxDYKoa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505072226.uZxDYKoa-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/sched/ext.c:3809:13: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected unsigned long const volatile *addr @@     got unsigned long [noderef] __rcu * @@
   kernel/sched/ext.c:3809:13: sparse:     expected unsigned long const volatile *addr
   kernel/sched/ext.c:3809:13: sparse:     got unsigned long [noderef] __rcu *
   kernel/sched/ext.c:3918:13: sparse: sparse: cast removes address space '__rcu' of expression
   kernel/sched/ext.c:3918:13: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected unsigned long const volatile *addr @@     got unsigned long [noderef] __rcu * @@
   kernel/sched/ext.c:3918:13: sparse:     expected unsigned long const volatile *addr
   kernel/sched/ext.c:3918:13: sparse:     got unsigned long [noderef] __rcu *
   kernel/sched/ext.c:3918:13: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected unsigned long const volatile *addr @@     got unsigned long [noderef] __rcu * @@
   kernel/sched/ext.c:3918:13: sparse:     expected unsigned long const volatile *addr
   kernel/sched/ext.c:3918:13: sparse:     got unsigned long [noderef] __rcu *
   kernel/sched/ext.c:3934:13: sparse: sparse: cast removes address space '__rcu' of expression
   kernel/sched/ext.c:3934:13: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected unsigned long const volatile *addr @@     got unsigned long [noderef] __rcu * @@
   kernel/sched/ext.c:3934:13: sparse:     expected unsigned long const volatile *addr
   kernel/sched/ext.c:3934:13: sparse:     got unsigned long [noderef] __rcu *
   kernel/sched/ext.c:3934:13: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected unsigned long const volatile *addr @@     got unsigned long [noderef] __rcu * @@
   kernel/sched/ext.c:3934:13: sparse:     expected unsigned long const volatile *addr
   kernel/sched/ext.c:3934:13: sparse:     got unsigned long [noderef] __rcu *
   kernel/sched/ext.c:3993:21: sparse: sparse: cast removes address space '__rcu' of expression
   kernel/sched/ext.c:3993:21: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected unsigned long const volatile *addr @@     got unsigned long [noderef] __rcu * @@
   kernel/sched/ext.c:3993:21: sparse:     expected unsigned long const volatile *addr
   kernel/sched/ext.c:3993:21: sparse:     got unsigned long [noderef] __rcu *
   kernel/sched/ext.c:3993:21: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected unsigned long const volatile *addr @@     got unsigned long [noderef] __rcu * @@
   kernel/sched/ext.c:3993:21: sparse:     expected unsigned long const volatile *addr
   kernel/sched/ext.c:3993:21: sparse:     got unsigned long [noderef] __rcu *
   kernel/sched/ext.c:4018:35: sparse: sparse: cast removes address space '__rcu' of expression
   kernel/sched/ext.c:4018:35: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected unsigned long const volatile *addr @@     got unsigned long [noderef] __rcu * @@
   kernel/sched/ext.c:4018:35: sparse:     expected unsigned long const volatile *addr
   kernel/sched/ext.c:4018:35: sparse:     got unsigned long [noderef] __rcu *
   kernel/sched/ext.c:4018:35: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected unsigned long const volatile *addr @@     got unsigned long [noderef] __rcu * @@
   kernel/sched/ext.c:4018:35: sparse:     expected unsigned long const volatile *addr
   kernel/sched/ext.c:4018:35: sparse:     got unsigned long [noderef] __rcu *
   kernel/sched/ext.c:4052:21: sparse: sparse: cast removes address space '__rcu' of expression
   kernel/sched/ext.c:4052:21: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected unsigned long const volatile *addr @@     got unsigned long [noderef] __rcu * @@
   kernel/sched/ext.c:4052:21: sparse:     expected unsigned long const volatile *addr
   kernel/sched/ext.c:4052:21: sparse:     got unsigned long [noderef] __rcu *
   kernel/sched/ext.c:4052:21: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected unsigned long const volatile *addr @@     got unsigned long [noderef] __rcu * @@
   kernel/sched/ext.c:4052:21: sparse:     expected unsigned long const volatile *addr
   kernel/sched/ext.c:4052:21: sparse:     got unsigned long [noderef] __rcu *
   kernel/sched/ext.c:4066:21: sparse: sparse: cast removes address space '__rcu' of expression
   kernel/sched/ext.c:4066:21: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected unsigned long const volatile *addr @@     got unsigned long [noderef] __rcu * @@
   kernel/sched/ext.c:4066:21: sparse:     expected unsigned long const volatile *addr
   kernel/sched/ext.c:4066:21: sparse:     got unsigned long [noderef] __rcu *
   kernel/sched/ext.c:4066:21: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected unsigned long const volatile *addr @@     got unsigned long [noderef] __rcu * @@
   kernel/sched/ext.c:4066:21: sparse:     expected unsigned long const volatile *addr
   kernel/sched/ext.c:4066:21: sparse:     got unsigned long [noderef] __rcu *
   kernel/sched/ext.c:4086:13: sparse: sparse: cast removes address space '__rcu' of expression
   kernel/sched/ext.c:4086:13: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected unsigned long const volatile *addr @@     got unsigned long [noderef] __rcu * @@
   kernel/sched/ext.c:4086:13: sparse:     expected unsigned long const volatile *addr
   kernel/sched/ext.c:4086:13: sparse:     got unsigned long [noderef] __rcu *
   kernel/sched/ext.c:4086:13: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected unsigned long const volatile *addr @@     got unsigned long [noderef] __rcu * @@
   kernel/sched/ext.c:4086:13: sparse:     expected unsigned long const volatile *addr
   kernel/sched/ext.c:4086:13: sparse:     got unsigned long [noderef] __rcu *
   kernel/sched/ext.c:4107:21: sparse: sparse: cast removes address space '__rcu' of expression
   kernel/sched/ext.c:4107:21: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected unsigned long const volatile *addr @@     got unsigned long [noderef] __rcu * @@
   kernel/sched/ext.c:4107:21: sparse:     expected unsigned long const volatile *addr
   kernel/sched/ext.c:4107:21: sparse:     got unsigned long [noderef] __rcu *
   kernel/sched/ext.c:4107:21: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected unsigned long const volatile *addr @@     got unsigned long [noderef] __rcu * @@
   kernel/sched/ext.c:4107:21: sparse:     expected unsigned long const volatile *addr
   kernel/sched/ext.c:4107:21: sparse:     got unsigned long [noderef] __rcu *
   kernel/sched/ext.c:4122:21: sparse: sparse: cast removes address space '__rcu' of expression
   kernel/sched/ext.c:4122:21: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected unsigned long const volatile *addr @@     got unsigned long [noderef] __rcu * @@
   kernel/sched/ext.c:4122:21: sparse:     expected unsigned long const volatile *addr
   kernel/sched/ext.c:4122:21: sparse:     got unsigned long [noderef] __rcu *
   kernel/sched/ext.c:4122:21: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected unsigned long const volatile *addr @@     got unsigned long [noderef] __rcu * @@
   kernel/sched/ext.c:4122:21: sparse:     expected unsigned long const volatile *addr
   kernel/sched/ext.c:4122:21: sparse:     got unsigned long [noderef] __rcu *
   kernel/sched/ext.c:4743:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root @@
   kernel/sched/ext.c:4743:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:4743:33: sparse:     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root
   kernel/sched/ext.c:5057:13: sparse: sparse: cast removes address space '__rcu' of expression
   kernel/sched/ext.c:5057:13: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected unsigned long const volatile *addr @@     got unsigned long [noderef] __rcu * @@
   kernel/sched/ext.c:5057:13: sparse:     expected unsigned long const volatile *addr
   kernel/sched/ext.c:5057:13: sparse:     got unsigned long [noderef] __rcu *
   kernel/sched/ext.c:5057:13: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected unsigned long const volatile *addr @@     got unsigned long [noderef] __rcu * @@
   kernel/sched/ext.c:5057:13: sparse:     expected unsigned long const volatile *addr
   kernel/sched/ext.c:5057:13: sparse:     got unsigned long [noderef] __rcu *
   kernel/sched/ext.c:5104:13: sparse: sparse: cast removes address space '__rcu' of expression
   kernel/sched/ext.c:5104:13: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected unsigned long const volatile *addr @@     got unsigned long [noderef] __rcu * @@
   kernel/sched/ext.c:5104:13: sparse:     expected unsigned long const volatile *addr
   kernel/sched/ext.c:5104:13: sparse:     got unsigned long [noderef] __rcu *
   kernel/sched/ext.c:5104:13: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected unsigned long const volatile *addr @@     got unsigned long [noderef] __rcu * @@
   kernel/sched/ext.c:5104:13: sparse:     expected unsigned long const volatile *addr
   kernel/sched/ext.c:5104:13: sparse:     got unsigned long [noderef] __rcu *
   kernel/sched/ext.c:5127:30: sparse: sparse: cast removes address space '__rcu' of expression
   kernel/sched/ext.c:5127:30: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected unsigned long const volatile *addr @@     got unsigned long [noderef] __rcu * @@
   kernel/sched/ext.c:5127:30: sparse:     expected unsigned long const volatile *addr
   kernel/sched/ext.c:5127:30: sparse:     got unsigned long [noderef] __rcu *
   kernel/sched/ext.c:5127:30: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected unsigned long const volatile *addr @@     got unsigned long [noderef] __rcu * @@
   kernel/sched/ext.c:5127:30: sparse:     expected unsigned long const volatile *addr
   kernel/sched/ext.c:5127:30: sparse:     got unsigned long [noderef] __rcu *
   kernel/sched/ext.c:5161:21: sparse: sparse: cast removes address space '__rcu' of expression
   kernel/sched/ext.c:5161:21: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected unsigned long const volatile *addr @@     got unsigned long [noderef] __rcu * @@
   kernel/sched/ext.c:5161:21: sparse:     expected unsigned long const volatile *addr
   kernel/sched/ext.c:5161:21: sparse:     got unsigned long [noderef] __rcu *
   kernel/sched/ext.c:5161:21: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected unsigned long const volatile *addr @@     got unsigned long [noderef] __rcu * @@
   kernel/sched/ext.c:5161:21: sparse:     expected unsigned long const volatile *addr
   kernel/sched/ext.c:5161:21: sparse:     got unsigned long [noderef] __rcu *
   kernel/sched/ext.c:5185:52: sparse: sparse: incorrect type in argument 3 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/ext.c:5185:52: sparse:     expected struct task_struct *p
   kernel/sched/ext.c:5185:52: sparse:     got struct task_struct [noderef] __rcu *curr
>> kernel/sched/ext.c:5197:25: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *static [addressable] [assigned] [toplevel] scx_root @@
   kernel/sched/ext.c:5197:25: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:5197:25: sparse:     got struct scx_sched [noderef] __rcu *static [addressable] [assigned] [toplevel] scx_root
   kernel/sched/ext.c:5951:32: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct const *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/ext.c:5951:32: sparse:     expected struct task_struct const *p
   kernel/sched/ext.c:5951:32: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/ext.c:6331:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *static [addressable] [assigned] [toplevel] scx_root @@
   kernel/sched/ext.c:6331:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:6331:33: sparse:     got struct scx_sched [noderef] __rcu *static [addressable] [assigned] [toplevel] scx_root
   kernel/sched/ext.c:6464:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *static [addressable] [assigned] [toplevel] scx_root @@
   kernel/sched/ext.c:6464:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:6464:33: sparse:     got struct scx_sched [noderef] __rcu *static [addressable] [assigned] [toplevel] scx_root
   kernel/sched/ext.c:7303:33: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/ext.c:7303:33: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/ext.c:7303:33: sparse:    struct task_struct const *
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

vim +5197 kernel/sched/ext.c

  5071	
  5072	static void scx_dump_state(struct scx_exit_info *ei, size_t dump_len)
  5073	{
  5074		static DEFINE_SPINLOCK(dump_lock);
  5075		static const char trunc_marker[] = "\n\n~~~~ TRUNCATED ~~~~\n";
  5076		struct scx_dump_ctx dctx = {
  5077			.kind = ei->kind,
  5078			.exit_code = ei->exit_code,
  5079			.reason = ei->reason,
  5080			.at_ns = ktime_get_ns(),
  5081			.at_jiffies = jiffies,
  5082		};
  5083		struct seq_buf s;
  5084		struct scx_event_stats events;
  5085		unsigned long flags;
  5086		char *buf;
  5087		int cpu;
  5088	
  5089		spin_lock_irqsave(&dump_lock, flags);
  5090	
  5091		seq_buf_init(&s, ei->dump, dump_len);
  5092	
  5093		if (ei->kind == SCX_EXIT_NONE) {
  5094			dump_line(&s, "Debug dump triggered by %s", ei->reason);
  5095		} else {
  5096			dump_line(&s, "%s[%d] triggered exit kind %d:",
  5097				  current->comm, current->pid, ei->kind);
  5098			dump_line(&s, "  %s (%s)", ei->reason, ei->msg);
  5099			dump_newline(&s);
  5100			dump_line(&s, "Backtrace:");
  5101			dump_stack_trace(&s, "  ", ei->bt, ei->bt_len);
  5102		}
  5103	
  5104		if (SCX_HAS_OP(scx_root, dump)) {
  5105			ops_dump_init(&s, "");
  5106			SCX_CALL_OP(SCX_KF_UNLOCKED, dump, NULL, &dctx);
  5107			ops_dump_exit();
  5108		}
  5109	
  5110		dump_newline(&s);
  5111		dump_line(&s, "CPU states");
  5112		dump_line(&s, "----------");
  5113	
  5114		for_each_possible_cpu(cpu) {
  5115			struct rq *rq = cpu_rq(cpu);
  5116			struct rq_flags rf;
  5117			struct task_struct *p;
  5118			struct seq_buf ns;
  5119			size_t avail, used;
  5120			bool idle;
  5121	
  5122			rq_lock(rq, &rf);
  5123	
  5124			idle = list_empty(&rq->scx.runnable_list) &&
  5125				rq->curr->sched_class == &idle_sched_class;
  5126	
  5127			if (idle && !SCX_HAS_OP(scx_root, dump_cpu))
  5128				goto next;
  5129	
  5130			/*
  5131			 * We don't yet know whether ops.dump_cpu() will produce output
  5132			 * and we may want to skip the default CPU dump if it doesn't.
  5133			 * Use a nested seq_buf to generate the standard dump so that we
  5134			 * can decide whether to commit later.
  5135			 */
  5136			avail = seq_buf_get_buf(&s, &buf);
  5137			seq_buf_init(&ns, buf, avail);
  5138	
  5139			dump_newline(&ns);
  5140			dump_line(&ns, "CPU %-4d: nr_run=%u flags=0x%x cpu_rel=%d ops_qseq=%lu pnt_seq=%lu",
  5141				  cpu, rq->scx.nr_running, rq->scx.flags,
  5142				  rq->scx.cpu_released, rq->scx.ops_qseq,
  5143				  rq->scx.pnt_seq);
  5144			dump_line(&ns, "          curr=%s[%d] class=%ps",
  5145				  rq->curr->comm, rq->curr->pid,
  5146				  rq->curr->sched_class);
  5147			if (!cpumask_empty(rq->scx.cpus_to_kick))
  5148				dump_line(&ns, "  cpus_to_kick   : %*pb",
  5149					  cpumask_pr_args(rq->scx.cpus_to_kick));
  5150			if (!cpumask_empty(rq->scx.cpus_to_kick_if_idle))
  5151				dump_line(&ns, "  idle_to_kick   : %*pb",
  5152					  cpumask_pr_args(rq->scx.cpus_to_kick_if_idle));
  5153			if (!cpumask_empty(rq->scx.cpus_to_preempt))
  5154				dump_line(&ns, "  cpus_to_preempt: %*pb",
  5155					  cpumask_pr_args(rq->scx.cpus_to_preempt));
  5156			if (!cpumask_empty(rq->scx.cpus_to_wait))
  5157				dump_line(&ns, "  cpus_to_wait   : %*pb",
  5158					  cpumask_pr_args(rq->scx.cpus_to_wait));
  5159	
  5160			used = seq_buf_used(&ns);
  5161			if (SCX_HAS_OP(scx_root, dump_cpu)) {
  5162				ops_dump_init(&ns, "  ");
  5163				SCX_CALL_OP(SCX_KF_REST, dump_cpu, NULL, &dctx, cpu, idle);
  5164				ops_dump_exit();
  5165			}
  5166	
  5167			/*
  5168			 * If idle && nothing generated by ops.dump_cpu(), there's
  5169			 * nothing interesting. Skip.
  5170			 */
  5171			if (idle && used == seq_buf_used(&ns))
  5172				goto next;
  5173	
  5174			/*
  5175			 * $s may already have overflowed when $ns was created. If so,
  5176			 * calling commit on it will trigger BUG.
  5177			 */
  5178			if (avail) {
  5179				seq_buf_commit(&s, seq_buf_used(&ns));
  5180				if (seq_buf_has_overflowed(&ns))
  5181					seq_buf_set_overflow(&s);
  5182			}
  5183	
  5184			if (rq->curr->sched_class == &ext_sched_class)
  5185				scx_dump_task(&s, &dctx, rq->curr, '*');
  5186	
  5187			list_for_each_entry(p, &rq->scx.runnable_list, scx.runnable_node)
  5188				scx_dump_task(&s, &dctx, p, ' ');
  5189		next:
  5190			rq_unlock(rq, &rf);
  5191		}
  5192	
  5193		dump_newline(&s);
  5194		dump_line(&s, "Event counters");
  5195		dump_line(&s, "--------------");
  5196	
> 5197		scx_read_events(scx_root, &events);
  5198		scx_dump_event(s, &events, SCX_EV_SELECT_CPU_FALLBACK);
  5199		scx_dump_event(s, &events, SCX_EV_DISPATCH_LOCAL_DSQ_OFFLINE);
  5200		scx_dump_event(s, &events, SCX_EV_DISPATCH_KEEP_LAST);
  5201		scx_dump_event(s, &events, SCX_EV_ENQ_SKIP_EXITING);
  5202		scx_dump_event(s, &events, SCX_EV_ENQ_SKIP_MIGRATION_DISABLED);
  5203		scx_dump_event(s, &events, SCX_EV_REFILL_SLICE_DFL);
  5204		scx_dump_event(s, &events, SCX_EV_BYPASS_DURATION);
  5205		scx_dump_event(s, &events, SCX_EV_BYPASS_DISPATCH);
  5206		scx_dump_event(s, &events, SCX_EV_BYPASS_ACTIVATE);
  5207	
  5208		if (seq_buf_has_overflowed(&s) && dump_len >= sizeof(trunc_marker))
  5209			memcpy(ei->dump + dump_len - sizeof(trunc_marker),
  5210			       trunc_marker, sizeof(trunc_marker));
  5211	
  5212		spin_unlock_irqrestore(&dump_lock, flags);
  5213	}
  5214	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
