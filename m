Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21885422525
	for <oe-kbuild-all@lists.linux.dev>; Thu,  9 Jul 2026 12:40:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783600813; cv=none; b=GX5lZrA6OVocnrrmwsMzWe1g7cksxV0q08d2sUe+yc2VqqHLvMArBc6CN53z9E9k+XwWcEBfGMlKnjKEEz38cKuGo52tina7yN41AcgupfEcST2UKBLq+JYqspdUKztFCfyHKIcvQphM0nTOJa5NqLhfURbtp0fYBNsteOlcEE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783600813; c=relaxed/simple;
	bh=FvXIm4023WssNWL6kI6WaUcXLIUS9ss6Iqwt80QBk1w=;
	h=Date:From:To:Cc:Subject:Message-ID; b=PE56uQMPgLnzs52WFRjbPo0wA7ZnR0hM1mzmtj4m3A4L+Xx2Na+pXosyiB0AktbcU8GGtXRETLzAckBAFTjj6ZjhiYCnlMsBz5SI2WwvbFNwY1voWKvkk3cwf9ulWQVPStMoP1HKcN+uFccZQi9l6M8jBmNKwAQALjoLXv6n3v4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=h1XgDkib; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="h1XgDkib"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783600812; x=1815136812;
  h=date:from:to:cc:subject:message-id;
  bh=FvXIm4023WssNWL6kI6WaUcXLIUS9ss6Iqwt80QBk1w=;
  b=h1XgDkibX0CR7Pjhpks6untQVntXsPku22f80F30s2+4Nnu3rX9zE/Tq
   eXAZO7MQHXjy6zIYBNhBtOSy9ZkTZ/uWF9ROEKR+uUHs57JZS/t6u21Di
   paTtBsYFxQqUwemJMdP0pWNtIMokKrGEOjggspeAcxUueuJLb2K6304pP
   Po5lTIJl1hlGuDfVNMaTKEJfbN978KsL7xrGyokrTWo2e9hew8JAHXtGK
   IwWRsQ/l6QV76u9bAqWjRLzP+kh/y/EJu7bbyB5gbX1a6xagjfVMqkPgr
   Omgp8Q4jd8b2tZ/kLdvb1vHEftoRYjHh9sCSgjWemCxs4DoACYHbCx4Ec
   g==;
X-CSE-ConnectionGUID: EE6iL+M4SKKq+CakMtL5gA==
X-CSE-MsgGUID: N/QbRmxlTrmLY1vWFut3Nw==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="87964305"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="87964305"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2026 05:40:12 -0700
X-CSE-ConnectionGUID: jwpOQ+Q1TO6YVtzGzIMkEw==
X-CSE-MsgGUID: yQ6Gg4dUSSy3rSw4bEEaLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="252830881"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 09 Jul 2026 05:40:11 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1who2x-00000000Hgl-3JEM;
	Thu, 09 Jul 2026 12:40:07 +0000
Date: Thu, 09 Jul 2026 20:39:08 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.10 0/1]
 kernel/sched/psi.c:150:1: sparse: sparse: symbol 'psi_cgroups_enabled' was
 not declared. Should it be static?
Message-ID: <202607092002.bVCdHadA-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android13-5.10
head:   7f11e2633e9568344eec5a044636bf3e8a356393
commit: c7186c2c46d869c1a4c55bd0a1f83373b8a1b93a [0/1] FROMGIT: cgroup: make per-cgroup pressure stall tracking configurable
config: i386-randconfig-061 (https://download.01.org/0day-ci/archive/20260709/202607092002.bVCdHadA-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260709/202607092002.bVCdHadA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607092002.bVCdHadA-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> kernel/sched/psi.c:150:1: sparse: sparse: symbol 'psi_cgroups_enabled' was not declared. Should it be static?
   kernel/sched/psi.c:1228:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/psi.c:1228:9: sparse:    void [noderef] __rcu *
   kernel/sched/psi.c:1228:9: sparse:    void *
   kernel/sched/psi.c:765:38: sparse: sparse: dereference of noderef expression
   kernel/sched/psi.c: note: in included file:
   kernel/sched/sched.h:1730:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:1730:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:1730:25: sparse:    struct task_struct *

vim +/psi_cgroups_enabled +150 kernel/sched/psi.c

   148	
   149	DEFINE_STATIC_KEY_FALSE(psi_disabled);
 > 150	DEFINE_STATIC_KEY_TRUE(psi_cgroups_enabled);
   151	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
