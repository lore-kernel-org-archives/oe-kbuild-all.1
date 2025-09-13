Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 974652C0F7A
	for <oe-kbuild-all@lists.linux.dev>; Sat, 13 Sep 2025 12:13:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757765609; cv=none; b=IkNXHUVPrq3XRfbanteJZkSGmmcV4tq4Y1LLdtqb0K5n6mPPH5fLp5gyTl/CPGTFiDTS53IJ48VffS93eguaHoTlP2HToo5bBSID3vvKeAIGuHpCF2Bxggb0Zx1LkBnN7xhauT5zEXK8krhTDv4J9+MO+2F9hJ5lHDb5RtCa0cg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757765609; c=relaxed/simple;
	bh=MSNnGYaxtjXC0VB4B7kuqg705LWcZ53lS1ccz+TrpQo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uNdQ1FKLMDIBWqEsPpjCw6yETjVLn5WJjxt8LMg1U9hGKM/wqvF8nJ7FM4iSeb9eJGsuufhF9nENr2Ozp0MwGsNIu4UNA7/mSW8WvQivWGlYjpxdNvP8QAGEE4583YxuXNdh075MzaZpItsu6FTXy2e0s7Sf6cka0Ygt0ORz29Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AwsCgYJ8; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AwsCgYJ8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757765607; x=1789301607;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MSNnGYaxtjXC0VB4B7kuqg705LWcZ53lS1ccz+TrpQo=;
  b=AwsCgYJ8yZXB7q0buuDEvJArHKNDUrqoL1WeJm7/77KWsD6q00W4MwOa
   nqgH+F6dK4S3Pc5t+LcjIK+6VqAcfV93Z0rcj+ijGoax+Ht9mvXf72XhT
   Q1X5AYAfdIIcasR9bg5JYxB1vHECGFTeSxHdFuLOzNTdOXKOOvsl1w1AZ
   GbqWc6wNf9igZ7xQ6esrEuJgJQJTvkSqYtfFHhLT3fNo48idNLTbGhjeM
   UWsJIgXIHjMKhb2XbgsWLp4K8tMLx5W2iKJW6ILLYXMwkDVwuCtuok3b9
   rqoSyFLviMnCls95xuen8vZ9+tC1sdTuI3onTcEQLSb7/Tbr0LnfzHzJ9
   g==;
X-CSE-ConnectionGUID: Y16ZMtsBSzCLcNW/L9hgww==
X-CSE-MsgGUID: 7tyHdih/Sv2pRDLeFhcFxQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="60012716"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="60012716"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2025 05:13:27 -0700
X-CSE-ConnectionGUID: kVa8p5kYQxqG2hb4Spsicg==
X-CSE-MsgGUID: 5FCPxQ7PReigkoTKGTgPmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,261,1751266800"; 
   d="scan'208";a="174035789"
Received: from lkp-server02.sh.intel.com (HELO eb5fdfb2a9b7) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 13 Sep 2025 05:13:26 -0700
Received: from kbuild by eb5fdfb2a9b7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uxP87-0001Uu-1r;
	Sat, 13 Sep 2025 12:13:23 +0000
Date: Sat, 13 Sep 2025 20:12:29 +0800
From: kernel test robot <lkp@intel.com>
To: Gabriele Monaco <gmonaco@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [glemco:staging_rv_hybrid_automata 20/20]
 kernel/trace/rv/monitors/deadline/deadline.h:161:4: error: cannot jump from
 this goto statement to its label
Message-ID: <202509132031.3tZEWFdC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitlab.com/glemco/linux staging_rv_hybrid_automata
head:   333160bc6d35a1b1ded9185fdb1a30dd2eb5e130
commit: 333160bc6d35a1b1ded9185fdb1a30dd2eb5e130 [20/20] rv: Add deadline monitors
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20250913/202509132031.3tZEWFdC-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250913/202509132031.3tZEWFdC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509132031.3tZEWFdC-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/trace/rv/monitors/nomiss/nomiss.c:25:
>> kernel/trace/rv/monitors/deadline/deadline.h:161:4: error: cannot jump from this goto statement to its label
     161 |                         goto fail;
         |                         ^
   kernel/trace/rv/monitors/deadline/deadline.h:164:2: note: jump bypasses initialization of variable with __attribute__((cleanup))
     164 |         guard(read_lock)(&tasklist_lock);
         |         ^
   include/linux/cleanup.h:401:15: note: expanded from macro 'guard'
     401 |         CLASS(_name, __UNIQUE_ID(guard))
         |                      ^
   include/linux/compiler.h:166:29: note: expanded from macro '__UNIQUE_ID'
     166 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
         |                             ^
   include/linux/compiler_types.h:84:22: note: expanded from macro '__PASTE'
      84 | #define __PASTE(a,b) ___PASTE(a,b)
         |                      ^
   include/linux/compiler_types.h:83:23: note: expanded from macro '___PASTE'
      83 | #define ___PASTE(a,b) a##b
         |                       ^
   <scratch space>:178:1: note: expanded from here
     178 | __UNIQUE_ID_guard685
         | ^
   1 error generated.
--
   In file included from kernel/trace/rv/monitors/throttle/throttle.c:25:
>> kernel/trace/rv/monitors/deadline/deadline.h:161:4: error: cannot jump from this goto statement to its label
     161 |                         goto fail;
         |                         ^
   kernel/trace/rv/monitors/deadline/deadline.h:164:2: note: jump bypasses initialization of variable with __attribute__((cleanup))
     164 |         guard(read_lock)(&tasklist_lock);
         |         ^
   include/linux/cleanup.h:401:15: note: expanded from macro 'guard'
     401 |         CLASS(_name, __UNIQUE_ID(guard))
         |                      ^
   include/linux/compiler.h:166:29: note: expanded from macro '__UNIQUE_ID'
     166 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
         |                             ^
   include/linux/compiler_types.h:84:22: note: expanded from macro '__PASTE'
      84 | #define __PASTE(a,b) ___PASTE(a,b)
         |                      ^
   include/linux/compiler_types.h:83:23: note: expanded from macro '___PASTE'
      83 | #define ___PASTE(a,b) a##b
         |                       ^
   <scratch space>:182:1: note: expanded from here
     182 | __UNIQUE_ID_guard685
         | ^
   1 error generated.


vim +161 kernel/trace/rv/monitors/deadline/deadline.h

   147	
   148	/*
   149	 * Initialise monitors for all tasks and pre-allocate the storage for servers.
   150	 * This is necessary since we don't have access to the servers here and
   151	 * allocation can cause deadlocks from their tracepoints. We can only fill
   152	 * pre-initialised storage from there.
   153	 */
   154	static inline int init_storage(void)
   155	{
   156		struct task_struct *g, *p;
   157		int cpu;
   158	
   159		for_each_possible_cpu(cpu) {
   160			if (!da_create_empty_storage(fair_server_id(cpu)))
 > 161				goto fail;
   162		}
   163	
   164		guard(read_lock)(&tasklist_lock);
   165		for_each_process_thread(g, p) {
   166			if (p->policy == SCHED_DEADLINE) {
   167				if (!da_create_storage(EXPAND_ID(&p->dl, DL_TASK), NULL))
   168					goto fail;
   169			}
   170		}
   171		return 0;
   172	
   173	fail:
   174		da_monitor_destroy();
   175		return -ENOMEM;
   176	}
   177	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
