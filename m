Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29EE2342158
	for <oe-kbuild-all@lists.linux.dev>; Sun, 22 Feb 2026 13:31:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771767104; cv=none; b=gS97C2Kv4xaWn89OhgQ0zjs7bBESwJ5kei1bQrvz5VzcTtlHowgz9Dg8DcI9FtCb2Ld4VdvBGTaUsMUeBJkW5qJqylHKVTddcCWNAorUso5Q4JQiBf65If1ylRuQL7K/MQCw/obpx7msEaPEcBfT5D+tNIlOnsoCUXEcwwuRuWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771767104; c=relaxed/simple;
	bh=629/o7ddBd2J42z0KmkW5PfHBVD3TA6YK2abw8JAqLo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=TMykMXRkHHiKGdq+Y2iZObY4A1PdvkMI45TlWMi8nSgksKZBDFc9e4Ykw36TVSalmcQ6J8IZ1qj7OOIwuw0viQFGXM6328PqQwQwdXLrU/iUL1pBN+8Tgla6LRs1dRvevN8qr+amh9vYJ4/IyJ7FK9HS6uUY9vsWGt5+Ehcr9Yc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kDagbvKm; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kDagbvKm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771767103; x=1803303103;
  h=date:from:to:cc:subject:message-id;
  bh=629/o7ddBd2J42z0KmkW5PfHBVD3TA6YK2abw8JAqLo=;
  b=kDagbvKm5bD4jFrB6MFgvh7piusxzkG+9udGZPnG6lzioBB6oSyJddeS
   /iXnr5tM1nC7tqKsTxdk5zeFBJCaD0SxgEim5TyoH3RQxQQiLrTjXkwn0
   vnDV+z6/WFr5/ccT7CHTpCOcC/LX7oRviFW77O89hphaQGagBcswLxXIS
   4nugXEtVi4+WgOLNbe7YcWW0xJpHOnljsY7qXDTTvRGS95Jr49GQoYBBM
   /+0TjmhAMwTYDgt09aYqvO+1dRH77wVysJJ8CS1+uBz64ScHjzT3ZpOrM
   /gkacIuuM3PP5CRUOgJguMrWY+jyaLyEiXououYzBk6UDAqLIZIYgiZSD
   w==;
X-CSE-ConnectionGUID: fAXodQauS8KZnJWS3eTL2Q==
X-CSE-MsgGUID: U9hCB/X+Q9SMgg03+JVpGw==
X-IronPort-AV: E=McAfee;i="6800,10657,11709"; a="83499882"
X-IronPort-AV: E=Sophos;i="6.21,304,1763452800"; 
   d="scan'208";a="83499882"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Feb 2026 05:31:42 -0800
X-CSE-ConnectionGUID: rWiUnwF3QSiKRjo7K633/w==
X-CSE-MsgGUID: 8IbQEALtQ+SgVhya58N6uw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,304,1763452800"; 
   d="scan'208";a="215442105"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 22 Feb 2026 05:31:41 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vu9Yg-000000015U0-1mhH;
	Sun, 22 Feb 2026 13:31:38 +0000
Date: Sun, 22 Feb 2026 21:31:08 +0800
From: kernel test robot <lkp@intel.com>
To: Gregory Price <gourry@gourry.net>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [gourryinverse:private_compression 50/60]
 mm/oom_kill.c:105:30: error: no member named 'mems_allowed' in 'struct
 task_struct'
Message-ID: <202602222138.jTu5h3Wi-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/gourryinverse/linux private_compression
head:   9fa5ffee4fd4726e31f05deebb938cccfa0b460f
commit: 7b2c19807170d073133786c42666d796c42f7d70 [50/60] mm/oom: NP_OPS_OOM_ELIGIBLE - private node OOM participation
config: x86_64-randconfig-161-20260222 (https://download.01.org/0day-ci/archive/20260222/202602222138.jTu5h3Wi-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
smatch version: v0.5.0-8994-gd50c5a4c
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260222/202602222138.jTu5h3Wi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602222138.jTu5h3Wi-lkp@intel.com/

All errors (new ones prefixed by >>):

>> mm/oom_kill.c:105:30: error: no member named 'mems_allowed' in 'struct task_struct'
     105 |                 if (!node_isset(nid, tsk1->mems_allowed))
         |                                      ~~~~  ^
   include/linux/nodemask.h:149:54: note: expanded from macro 'node_isset'
     149 | #define node_isset(node, nodemask) test_bit((node), (nodemask).bits)
         |                                                      ^~~~~~~~
   include/linux/bitops.h:60:50: note: expanded from macro 'test_bit'
      60 | #define test_bit(nr, addr)              bitop(_test_bit, nr, addr)
         |                                                              ^~~~
   include/linux/bitops.h:44:37: note: expanded from macro 'bitop'
      44 |           __builtin_constant_p((uintptr_t)(addr) != (uintptr_t)NULL) && \
         |                                            ^~~~
>> mm/oom_kill.c:105:30: error: no member named 'mems_allowed' in 'struct task_struct'
     105 |                 if (!node_isset(nid, tsk1->mems_allowed))
         |                                      ~~~~  ^
   include/linux/nodemask.h:149:54: note: expanded from macro 'node_isset'
     149 | #define node_isset(node, nodemask) test_bit((node), (nodemask).bits)
         |                                                      ^~~~~~~~
   include/linux/bitops.h:60:50: note: expanded from macro 'test_bit'
      60 | #define test_bit(nr, addr)              bitop(_test_bit, nr, addr)
         |                                                              ^~~~
   include/linux/bitops.h:45:16: note: expanded from macro 'bitop'
      45 |           (uintptr_t)(addr) != (uintptr_t)NULL &&                       \
         |                       ^~~~
>> mm/oom_kill.c:105:30: error: no member named 'mems_allowed' in 'struct task_struct'
     105 |                 if (!node_isset(nid, tsk1->mems_allowed))
         |                                      ~~~~  ^
   include/linux/nodemask.h:149:54: note: expanded from macro 'node_isset'
     149 | #define node_isset(node, nodemask) test_bit((node), (nodemask).bits)
         |                                                      ^~~~~~~~
   include/linux/bitops.h:60:50: note: expanded from macro 'test_bit'
      60 | #define test_bit(nr, addr)              bitop(_test_bit, nr, addr)
         |                                                              ^~~~
   include/linux/bitops.h:46:50: note: expanded from macro 'bitop'
      46 |           __builtin_constant_p(*(const unsigned long *)(addr))) ?       \
         |                                                         ^~~~
>> mm/oom_kill.c:105:30: error: no member named 'mems_allowed' in 'struct task_struct'
     105 |                 if (!node_isset(nid, tsk1->mems_allowed))
         |                                      ~~~~  ^
   include/linux/nodemask.h:149:54: note: expanded from macro 'node_isset'
     149 | #define node_isset(node, nodemask) test_bit((node), (nodemask).bits)
         |                                                      ^~~~~~~~
   include/linux/bitops.h:60:50: note: expanded from macro 'test_bit'
      60 | #define test_bit(nr, addr)              bitop(_test_bit, nr, addr)
         |                                                              ^~~~
   include/linux/bitops.h:47:17: note: expanded from macro 'bitop'
      47 |          const##op(nr, addr) : op(nr, addr))
         |                        ^~~~
>> mm/oom_kill.c:105:30: error: no member named 'mems_allowed' in 'struct task_struct'
     105 |                 if (!node_isset(nid, tsk1->mems_allowed))
         |                                      ~~~~  ^
   include/linux/nodemask.h:149:54: note: expanded from macro 'node_isset'
     149 | #define node_isset(node, nodemask) test_bit((node), (nodemask).bits)
         |                                                      ^~~~~~~~
   include/linux/bitops.h:60:50: note: expanded from macro 'test_bit'
      60 | #define test_bit(nr, addr)              bitop(_test_bit, nr, addr)
         |                                                              ^~~~
   include/linux/bitops.h:47:32: note: expanded from macro 'bitop'
      47 |          const##op(nr, addr) : op(nr, addr))
         |                                       ^~~~
   mm/oom_kill.c:107:30: error: no member named 'mems_allowed' in 'struct task_struct'
     107 |                 if (!node_isset(nid, tsk2->mems_allowed))
         |                                      ~~~~  ^
   include/linux/nodemask.h:149:54: note: expanded from macro 'node_isset'
     149 | #define node_isset(node, nodemask) test_bit((node), (nodemask).bits)
         |                                                      ^~~~~~~~
   include/linux/bitops.h:60:50: note: expanded from macro 'test_bit'
      60 | #define test_bit(nr, addr)              bitop(_test_bit, nr, addr)
         |                                                              ^~~~
   include/linux/bitops.h:44:37: note: expanded from macro 'bitop'
      44 |           __builtin_constant_p((uintptr_t)(addr) != (uintptr_t)NULL) && \
         |                                            ^~~~
   mm/oom_kill.c:107:30: error: no member named 'mems_allowed' in 'struct task_struct'
     107 |                 if (!node_isset(nid, tsk2->mems_allowed))
         |                                      ~~~~  ^
   include/linux/nodemask.h:149:54: note: expanded from macro 'node_isset'
     149 | #define node_isset(node, nodemask) test_bit((node), (nodemask).bits)
         |                                                      ^~~~~~~~
   include/linux/bitops.h:60:50: note: expanded from macro 'test_bit'
      60 | #define test_bit(nr, addr)              bitop(_test_bit, nr, addr)
         |                                                              ^~~~
   include/linux/bitops.h:45:16: note: expanded from macro 'bitop'
      45 |           (uintptr_t)(addr) != (uintptr_t)NULL &&                       \
         |                       ^~~~
   mm/oom_kill.c:107:30: error: no member named 'mems_allowed' in 'struct task_struct'
     107 |                 if (!node_isset(nid, tsk2->mems_allowed))
         |                                      ~~~~  ^
   include/linux/nodemask.h:149:54: note: expanded from macro 'node_isset'
     149 | #define node_isset(node, nodemask) test_bit((node), (nodemask).bits)
         |                                                      ^~~~~~~~
   include/linux/bitops.h:60:50: note: expanded from macro 'test_bit'
      60 | #define test_bit(nr, addr)              bitop(_test_bit, nr, addr)
         |                                                              ^~~~
   include/linux/bitops.h:46:50: note: expanded from macro 'bitop'
      46 |           __builtin_constant_p(*(const unsigned long *)(addr))) ?       \
         |                                                         ^~~~
   mm/oom_kill.c:107:30: error: no member named 'mems_allowed' in 'struct task_struct'
     107 |                 if (!node_isset(nid, tsk2->mems_allowed))
         |                                      ~~~~  ^
   include/linux/nodemask.h:149:54: note: expanded from macro 'node_isset'
     149 | #define node_isset(node, nodemask) test_bit((node), (nodemask).bits)
         |                                                      ^~~~~~~~
   include/linux/bitops.h:60:50: note: expanded from macro 'test_bit'
      60 | #define test_bit(nr, addr)              bitop(_test_bit, nr, addr)
         |                                                              ^~~~
   include/linux/bitops.h:47:17: note: expanded from macro 'bitop'
      47 |          const##op(nr, addr) : op(nr, addr))
         |                        ^~~~
   mm/oom_kill.c:107:30: error: no member named 'mems_allowed' in 'struct task_struct'
     107 |                 if (!node_isset(nid, tsk2->mems_allowed))
         |                                      ~~~~  ^
   include/linux/nodemask.h:149:54: note: expanded from macro 'node_isset'
     149 | #define node_isset(node, nodemask) test_bit((node), (nodemask).bits)
         |                                                      ^~~~~~~~
   include/linux/bitops.h:60:50: note: expanded from macro 'test_bit'
      60 | #define test_bit(nr, addr)              bitop(_test_bit, nr, addr)
         |                                                              ^~~~
   include/linux/bitops.h:47:32: note: expanded from macro 'bitop'
      47 |          const##op(nr, addr) : op(nr, addr))
         |                                       ^~~~
   10 errors generated.


vim +105 mm/oom_kill.c

    92	
    93	#ifdef CONFIG_NUMA
    94	/*
    95	 * Killing a task can only relieve system pressure if freed memory can be
    96	 * demoted there and reclaim can operate on the node's pages, so we
    97	 * omit private nodes that aren't eligible.
    98	 */
    99	static bool oom_mems_intersect(const struct task_struct *tsk1,
   100				       const struct task_struct *tsk2)
   101	{
   102		int nid;
   103	
   104		for_each_node_state(nid, N_MEMORY) {
 > 105			if (!node_isset(nid, tsk1->mems_allowed))
   106				continue;
   107			if (!node_isset(nid, tsk2->mems_allowed))
   108				continue;
   109			if (!node_oom_eligible(nid))
   110				continue;
   111			return true;
   112		}
   113		return false;
   114	}
   115	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
