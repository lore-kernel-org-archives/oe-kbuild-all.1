Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 869751E1A3D
	for <oe-kbuild-all@lists.linux.dev>; Sat, 29 Aug 2026 22:33:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788042825; cv=none; b=fPs09hSTTqj+wwyk3JxmuJUeKODKGUubesVIzU34ULYg003QDtKOIPV3sRA0ZGqECcydp+bXCmsZ7RAMJgknOqcNz0f8QJZ8sKblU8iTDRUwugX0lgqjKXcBkxgpLqW6VD7/SkMqNgGLdejtNVYdJyHqc0kqCjulx0WZHjcOGpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788042825; c=relaxed/simple;
	bh=LlkDIy3cO86RRosuWKKM3DCTnVfwCQ6/PwDZQivwWLM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=LTyy9hjkkIxpFGUccMeoeXmA7D3grZDVMnnr/9oFmmug8hjsMSxkWngWTp2o5S2h8sxFIjs4jby8tAPjko3NrPNkorFbrrI278sCH+qaAJuDVh7NclTqIjk5vMpbS1WSy7njdKWAhaAAKUZ6LvcPOZLrqTKdcUoM4AxKwY/E7Pc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IHdsJmbV; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IHdsJmbV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788042822; x=1819578822;
  h=date:from:to:cc:subject:message-id;
  bh=LlkDIy3cO86RRosuWKKM3DCTnVfwCQ6/PwDZQivwWLM=;
  b=IHdsJmbVQs9Jpr28rq3nTuXqdFyuwko9RRPNXk0LQaqitqng/PRoQK7O
   38hSEkJZBHfiws402uZf6T+bSwaSfFdbsmzrsbEGHINp1i3W8aD27IHwG
   U38sOZi7h9qBna38RmG797OsBncBkqXGIxQtD9UqaXbmiWfLi50z8554p
   EHJgVhHtDTkF46pRgSapfGwxS3BCBHaeVdi/t7+lxIEavXDna9zTlL4+1
   xyzo75/GCZD5feeTTzmRc5Xf11Sh1tRWGtpCPg/JpiDDQ7OqgxYxd9AmS
   zNRnFtSSJikl3w8+YbB8ThW+kf0jks7eCKt2pRfD1NO//10I9KxXfdufZ
   Q==;
X-CSE-ConnectionGUID: DR999OXnT2Slw31hq5HZBw==
X-CSE-MsgGUID: UTJJoQ4oQdueVC1aKifVOg==
X-IronPort-AV: E=McAfee;i="6800,10657,11890"; a="88521111"
X-IronPort-AV: E=Sophos;i="6.25,251,1779174000"; 
   d="scan'208";a="88521111"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Aug 2026 15:33:41 -0700
X-CSE-ConnectionGUID: N/noZlc+TFuLZHz8AA9bBA==
X-CSE-MsgGUID: ZenjtqEARo+odwwZB2o7cg==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 3532383e6126) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 29 Aug 2026 15:33:40 -0700
Received: from kbuild by 3532383e6126 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x0RcH-00000000DMe-39lc;
	Sat, 29 Aug 2026 22:33:37 +0000
Date: Sun, 30 Aug 2026 06:33:32 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-6.6 272/272]
 kernel/sched/sched.h:1842:54: warning: 'struct cgroup_taskset' declared
 inside parameter list will not be visible outside of this definition or
 declaration
Message-ID: <202608300656.OjQNoCI2-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Cruz,

FYI, the error/warning still remains.

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-6.6
head:   41cf029dd674935312f07b9ff27127f205008195
commit: 852d4045a43d966b0af120d54cd7df22a2738951 [272/272] anolis: sched: introduce SMT expeller and SMT expellee
config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/20260830/202608300656.OjQNoCI2-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260830/202608300656.OjQNoCI2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608300656.OjQNoCI2-lkp@intel.com/

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
