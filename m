Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6867728C869
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Jun 2026 21:12:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781212368; cv=none; b=OO4uNJf0kyQTaLvNC/yzmzmdtKGEO6kbEwLxFXgR1djKjuyPv6ZjGX//0RZYHuGYILwNIbvLA1n4hiYYd8ixaJMS5Bf1UezIOft0+Hto8xZFNG5LxaWAtd/2gII2bSb/tD28fJjhCosBJLXcUI2VakOANLKoCy1aKgYTR7OkZB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781212368; c=relaxed/simple;
	bh=uXxDLDkqX8xrN+waJDdznvOwGqpKFCApuWcpT9pwnao=;
	h=Date:From:To:Cc:Subject:Message-ID; b=mgncGUtoFk05MxFm8ZWruOQYUg0tCMm9L3+sq2S6E/NJibeAgNmYroElXrGXwR9GVTpdTfwjAuvbpbsHJAhiKpFylZIja5Aa8+J/EK0eBEc7LyLbO5wcw6HktD2UK82KKoiys7zldapyh5ZKmztj+Ykf4OiyEr+PM+jnDmWTDLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BE4wKLlS; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BE4wKLlS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781212367; x=1812748367;
  h=date:from:to:cc:subject:message-id;
  bh=uXxDLDkqX8xrN+waJDdznvOwGqpKFCApuWcpT9pwnao=;
  b=BE4wKLlSLu70JbWa1mj+QYAEOQ54uwEWlPvDuAAvU1ZGekRa2jBVyr9u
   dAIhG2zovQNv0AH4Dby4O8IM+JMudmpCWoO0Jj5krTxYEVVBJJyYQ7gRl
   yVXbkHx/OSVGPQC8VZScjFYYaDprLxtc5aMxHZtFK+8e6I8SpTcnkHqvM
   l0nY/T+jyo8KtM+7JJc+C6Se3r3m8axQw3jIjgyyn9t0KS5HmNmIjCwLT
   m7H8uEY73F/O6+CrSHaJ/ejUonLmLNoMksZ1iw/1k83RChSD1mNSrEr4w
   cXPRxIGOEtsrduE+bpjcOQpJyc4Zef/SxOGSm41yH6bc4LDCepzF/cNo7
   g==;
X-CSE-ConnectionGUID: 1uCoSYroQLSnyVL6wcSg3A==
X-CSE-MsgGUID: 6mVdjHn7RrGrVVT0sqrd3A==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="93528141"
X-IronPort-AV: E=Sophos;i="6.24,199,1774335600"; 
   d="scan'208";a="93528141"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2026 14:12:46 -0700
X-CSE-ConnectionGUID: B4yIgp9ZQxqCvyKZ1C5HKw==
X-CSE-MsgGUID: VUwxyYyeSRy+HmpsIuIg6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,199,1774335600"; 
   d="scan'208";a="251556974"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 11 Jun 2026 14:12:45 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wXmhf-00000000Nrz-11su;
	Thu, 11 Jun 2026 21:12:43 +0000
Date: Fri, 12 Jun 2026 05:12:05 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-6.6 105/105]
 kernel/sched/sched.h:1842:54: warning: 'struct cgroup_taskset' declared
 inside parameter list will not be visible outside of this definition or
 declaration
Message-ID: <202606120524.PAjN6iCA-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-6.6
head:   17033c891775049d8437bf5fb55f35081b40440c
commit: 852d4045a43d966b0af120d54cd7df22a2738951 [105/105] anolis: sched: introduce SMT expeller and SMT expellee
config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/20260612/202606120524.PAjN6iCA-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260612/202606120524.PAjN6iCA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606120524.PAjN6iCA-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from kernel/sched/core.c:87:
>> kernel/sched/sched.h:1842:54: warning: 'struct cgroup_taskset' declared inside parameter list will not be visible outside of this definition or declaration
    1842 | static inline void sched_core_identity_attach(struct cgroup_taskset *tset) { }
         |                                                      ^~~~~~~~~~~~~~


vim +1842 kernel/sched/sched.h

  1835	
  1836	static inline bool sched_group_cookie_match(struct rq *rq,
  1837						    struct task_struct *p,
  1838						    struct sched_group *group)
  1839	{
  1840		return true;
  1841	}
> 1842	static inline void sched_core_identity_attach(struct cgroup_taskset *tset) { }
  1843	#endif /* CONFIG_SCHED_CORE */
  1844	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
