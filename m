Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F0A0346A10
	for <oe-kbuild-all@lists.linux.dev>; Wed,  1 Apr 2026 07:01:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775026903; cv=none; b=T5OTlTzaOIcaPt5vsdCfAmGPaY8nJm4P1ncRMRzfq11CwuwOLmMO/l4gvGZ00H8LDAX0VnksncVsl6g7TdYsDxWol/xjY4a1ctNao4ce5QvJODFjDYCNniay05fpZrhw4aSXZ7GBoMD6Ehc+xSufKe/5MZ8ZJYQj3WVIRE/Tjgc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775026903; c=relaxed/simple;
	bh=EOkKPeglEqByXrwiUGI6NrVXq68kWB6jVmxiMhC7kq8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=up7qNi8wK9lCCY5eqDaAu+CZ/3plg+jryESVlr/6fyABDRNWOwIl9TIArTtrAPS2Hyf+gYyekN8XPo584bWWez0oJ5WUiuWWaQ/TrgckKrm5xpBAXyfgfp01IDSuww49cNIg2s3Ue6ohyBR4WhJ7hIec5+htOdunZMg5qAds0tw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HyIMgvk8; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HyIMgvk8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775026902; x=1806562902;
  h=date:from:to:cc:subject:message-id;
  bh=EOkKPeglEqByXrwiUGI6NrVXq68kWB6jVmxiMhC7kq8=;
  b=HyIMgvk8Fl4Ji4pu54RqIqJSjnduhg0IoCN2PZmexbDUehuwq5RTqRSb
   au4h4KAQ8aUP1lfJNPeSRuR4Lx7/rmKSDpfVWbAgIG+RiLL5DagubS0k8
   HfzjZ4M852Sj8u2x/Ln1s9x3rq0wUe+fzkpRytPpIgQpGR8gi0udburgA
   E7rIv5Og0z5crkk1jBLvbPSrYRfjoPjFIwQcwhn1lZ/o2pNIxilkHQRAA
   vPmEnDzZE9N5oZNfgPn4BoYMIcCVtUGnAQQSj0tI3aIOQx3A/FXE/wmUC
   WopEnbiC9g6mcTBsQcpyBwFEvcYurws+wiQGOXWzlEwrLuMekzAUTm8cT
   g==;
X-CSE-ConnectionGUID: K7aLuToFS5mHZyz0cY0jag==
X-CSE-MsgGUID: W2e0CQ4OSgST6BN+SfuSIQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11745"; a="101508371"
X-IronPort-AV: E=Sophos;i="6.23,153,1770624000"; 
   d="scan'208";a="101508371"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2026 00:01:42 -0700
X-CSE-ConnectionGUID: mBkMhNDSSRqZg3zrOEqTGA==
X-CSE-MsgGUID: O8knQ0jyRIqsx4lByPcSrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,153,1770624000"; 
   d="scan'208";a="221737959"
Received: from lkp-server01.sh.intel.com (HELO 699e4e600a11) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 01 Apr 2026 00:01:41 -0700
Received: from kbuild by 699e4e600a11 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w7pa6-0000000005p-1B1S;
	Wed, 01 Apr 2026 07:01:38 +0000
Date: Wed, 01 Apr 2026 15:00:37 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-6.6 190/190]
 kernel/sched/sched.h:1842:54: warning: 'struct cgroup_taskset' declared
 inside parameter list will not be visible outside of this definition or
 declaration
Message-ID: <202604011448.SWGjg6BH-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-6.6
head:   666b43ed3d6a1bcc6c4d71681beb459cd846cad6
commit: 54118d6b739756063c9deb7c27113cf731cf6c2e [190/190] anolis: sched: introduce SMT expeller and SMT expellee
config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/20260401/202604011448.SWGjg6BH-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260401/202604011448.SWGjg6BH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604011448.SWGjg6BH-lkp@intel.com/

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
