Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81D6C2EC0A2
	for <oe-kbuild-all@lists.linux.dev>; Sat, 26 Sep 2026 02:24:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790389466; cv=none; b=M1IuJamqYPJlrneLN2CPL7vt3U9wHhv4qYjEVBe3FCqM1oHIEhrOtck5UynY0Bx+SOj4lNCRzgBxHe5nBAYuOG17a9hRQeBGb8tZ+6ybEkg1Os882fLua+vgVduQYEuIX0n7+OB5iT2lAHm6LAp87abbWfK77FyKjBusV8eGcyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790389466; c=relaxed/simple;
	bh=OZfaWwPwkKttFeBw69MnDR14o8Yr/GUlSJeAiXT4JG0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=OlB5BW4n3Uil7bgeENG5dwczab45jepDGzEzSKVsMeULBDsaEZRPKzf6QnhhwivfiQetC/vbB8DAjDY5LmCka45YIhoO0j/40c7Wa/rpFEutJ4U0EXx6CiTB6lFLyawVdOHiJrVFc9zkM2SrogpTcRl0KZLgHxPetuCdfG5UXTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Q/Gt6ZKn; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Q/Gt6ZKn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790389466; x=1821925466;
  h=date:from:to:cc:subject:message-id;
  bh=OZfaWwPwkKttFeBw69MnDR14o8Yr/GUlSJeAiXT4JG0=;
  b=Q/Gt6ZKnnUPPNWF45Tb8GNNNtqSd4NyzXYn/ljkPbGGrQ3wNSTw0p1qA
   eZm4Nxh/NoD1xbEQFq8C4/WFIzfHdn0pE9Ut6Yx1nVzQmTOWhDo9mCX0y
   QmtAVvRblYDn8z9Ktt9Gv3Y+V4z0RRjKKRfepG74+BI9MOC/N1y1nhg4P
   yS0pkq0pxVe7B/1FRZBXV+bMXUEIUrOmf0VGTtWs/1lE8UTd3llfthnY3
   XHEUKQswprWml8ryXSDbMMMqxz6jAV5X8pAk4aeQXxeBfHK6PAW9JYTRo
   r8r7fv9mJsaWIKdxfARfsVdm8U5HEqaRcyf02dSeLMie62N55pWAluTt6
   w==;
X-CSE-ConnectionGUID: vfl4w+BaRriCj24NM7ciUQ==
X-CSE-MsgGUID: SbHFJPHIS7mHz+Qxi6PfnA==
X-IronPort-AV: E=McAfee;i="6800,10657,11916"; a="90396074"
X-IronPort-AV: E=Sophos;i="6.27,123,1787036400"; 
   d="scan'208";a="90396074"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2026 19:24:26 -0700
X-CSE-ConnectionGUID: dTnF+K5AQmS8Q25xL6XkhQ==
X-CSE-MsgGUID: FneHLJuyRnS1SVk+s4o/ew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,123,1787036400"; 
   d="scan'208";a="282555616"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 25 Sep 2026 19:24:23 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xAI5N-00000000LRt-0qHV;
	Sat, 26 Sep 2026 02:24:21 +0000
Date: Sat, 26 Sep 2026 10:24:13 +0800
From: kernel test robot <lkp@intel.com>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [linux-next:master 6888/9480]
 kernel/rcu/../locking/rtmutex_common.h:231:35: error: static declaration of
 'rt_mutex_owner' follows non-static declaration
Message-ID: <202609261005.GrnaXBXT-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   3d7783543c2646af69ad65825e810060494bea21
commit: 1eccf02fb8d5359c4143cb50e6f52313b65fe7cd [6888/9480] rcu: Add running and boosted indications to RCU task stall dump
config: arm-randconfig-r1303-20260926 (https://download.01.org/0day-ci/archive/20260926/202609261005.GrnaXBXT-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 78ff5215e53a117851dc6e81e793a106f1a79df8)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260926/202609261005.GrnaXBXT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609261005.GrnaXBXT-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/rcu/tree.c:5001:
   kernel/rcu/tree_stall.h:333:8: error: call to undeclared function 'rt_mutex_owner'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     333 |                         if (rt_mutex_owner(&rnp->boost_mtx.rtmutex) == t)
         |                             ^
   kernel/rcu/tree_stall.h:333:48: warning: comparison between pointer and integer ('int' and 'struct task_struct *') [-Wpointer-integer-compare]
     333 |                         if (rt_mutex_owner(&rnp->boost_mtx.rtmutex) == t)
         |                             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ ^  ~
   In file included from kernel/rcu/tree.c:5004:
   In file included from kernel/rcu/tree_plugin.h:14:
>> kernel/rcu/../locking/rtmutex_common.h:231:35: error: static declaration of 'rt_mutex_owner' follows non-static declaration
     231 | static inline struct task_struct *rt_mutex_owner(struct rt_mutex_base *lock)
         |                                   ^
   kernel/rcu/tree_stall.h:333:8: note: previous implicit declaration is here
     333 |                         if (rt_mutex_owner(&rnp->boost_mtx.rtmutex) == t)
         |                             ^
   1 warning and 2 errors generated.


vim +/rt_mutex_owner +231 kernel/rcu/../locking/rtmutex_common.h

c014ef69b3acdb Thomas Gleixner 2021-08-15  228  
531ae4b06a737e Thomas Gleixner 2021-08-15  229  #else /* CONFIG_RT_MUTEXES */
531ae4b06a737e Thomas Gleixner 2021-08-15  230  /* Used in rcu/tree_plugin.h */
830e6acc8a1caf Peter Zijlstra  2021-08-15 @231  static inline struct task_struct *rt_mutex_owner(struct rt_mutex_base *lock)
531ae4b06a737e Thomas Gleixner 2021-08-15  232  {
531ae4b06a737e Thomas Gleixner 2021-08-15  233  	return NULL;
531ae4b06a737e Thomas Gleixner 2021-08-15  234  }
531ae4b06a737e Thomas Gleixner 2021-08-15  235  #endif  /* !CONFIG_RT_MUTEXES */
531ae4b06a737e Thomas Gleixner 2021-08-15  236  

:::::: The code at line 231 was first introduced by commit
:::::: 830e6acc8a1cafe153a0d88f9b2455965b396131 locking/rtmutex: Split out the inner parts of 'struct rtmutex'

:::::: TO: Peter Zijlstra <peterz@infradead.org>
:::::: CC: Ingo Molnar <mingo@kernel.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
