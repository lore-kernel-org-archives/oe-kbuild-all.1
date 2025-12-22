Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C26B01D5AD4
	for <oe-kbuild-all@lists.linux.dev>; Mon, 22 Dec 2025 01:31:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766367093; cv=none; b=cASV0aEc42uMFNdYe9/9M/43su17vdQGR/YGw4qR6KgYa6v198Ubc6ep6JQqnbkn8owc7v/Fw+ezVQSmrchREnNdjgqM8ROX7rNcw3jN7944iorjFMPbKXSdJNsL4Lw0tK0dZmvgqFXtCjx6CA06cf/0rf1az3yEidZQOA3GLos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766367093; c=relaxed/simple;
	bh=v2HyGtBU1a0cu4A3bTV+b8DxdOE7A4b1WaWFoiwS0nE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HRxZrsAXhnowoo2tynfn29hoNHEztrEQrc9DYvlSDcxcFohYWPyVncPmDo7dQ6eu3k9QIvTSnJCWprF4TSN2xcNQTm32PgAX+lrrcBkbuMzp3ZAvPNrmEtCHOMOdg8/x3t7UysQrrfwyylSSHNCJV6Xfhn5bYxvN9lUxgmVKukE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LhdIYdc8; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LhdIYdc8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766367092; x=1797903092;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=v2HyGtBU1a0cu4A3bTV+b8DxdOE7A4b1WaWFoiwS0nE=;
  b=LhdIYdc86O+yTf1maXBb6zaMdZj63+PluvFh+lcTBFFwZDFfpupY8UNR
   R4Gs16i+C5UT4wm2thIAq5BaCmg+5S1YL85bfcZJWWtkdWkJ3zU55tK6M
   HOfBo0ujiHWPPYr2VEFiKE/Q4u6Kbyr8PO1vZ93LkAifx75waqPyxax8k
   56B5QJNXlcL3aA18eX0ocAwGeOtdXb4OcPDhPc5jqW3hYwp0xhpfW3HZN
   CVE1Ar4rakMhU0SoxaqOHXz0PgKU9ykYBeSXVAjnfOQPxkA8O+hjNH/Oc
   d7+VI2MIts9tyln/ndyGdoCvp8TPmjAGqZQOrbfIYIlPzV7IMYoKQzGAT
   w==;
X-CSE-ConnectionGUID: AkgOihjeSKmEDBiCmT1yiw==
X-CSE-MsgGUID: 7PmfZ+ZUTFS04lX/CMCW2g==
X-IronPort-AV: E=McAfee;i="6800,10657,11649"; a="72084833"
X-IronPort-AV: E=Sophos;i="6.21,167,1763452800"; 
   d="scan'208";a="72084833"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2025 17:31:31 -0800
X-CSE-ConnectionGUID: Wx7nUyYNSEa3Ir4muJbABg==
X-CSE-MsgGUID: GJOCvfHvSDqKVElawPkFPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,167,1763452800"; 
   d="scan'208";a="198553388"
Received: from lkp-server01.sh.intel.com (HELO 0713df988ca2) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 21 Dec 2025 17:31:29 -0800
Received: from kbuild by 0713df988ca2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXUli-000000000N1-42xK;
	Mon, 22 Dec 2025 01:31:26 +0000
Date: Mon, 22 Dec 2025 09:31:11 +0800
From: kernel test robot <lkp@intel.com>
To: Baisong Zhong <zhongbaisong@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Luis Chamberlain <mcgrof@kernel.org>
Subject: kernel/sched/rt.c:9:18: warning: 'max_rt_runtime' defined but not
 used
Message-ID: <202512220906.UfaxucQ8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Baisong,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   9094662f6707d1d4b53d18baba459604e8bb0783
commit: 28f152cd0926596e69d412467b11b6fe6fe4e864 sched/rt: fix build error when CONFIG_SYSCTL is disable
date:   3 years, 9 months ago
config: csky-randconfig-r001-20230826 (https://download.01.org/0day-ci/archive/20251222/202512220906.UfaxucQ8-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251222/202512220906.UfaxucQ8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512220906.UfaxucQ8-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from kernel/sched/build_policy.c:43:
   kernel/sched/rt.c:309:6: warning: no previous prototype for 'unregister_rt_sched_group' [-Wmissing-prototypes]
     309 | void unregister_rt_sched_group(struct task_group *tg) { }
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/rt.c:311:6: warning: no previous prototype for 'free_rt_sched_group' [-Wmissing-prototypes]
     311 | void free_rt_sched_group(struct task_group *tg) { }
         |      ^~~~~~~~~~~~~~~~~~~
   kernel/sched/rt.c:313:5: warning: no previous prototype for 'alloc_rt_sched_group' [-Wmissing-prototypes]
     313 | int alloc_rt_sched_group(struct task_group *tg, struct task_group *parent)
         |     ^~~~~~~~~~~~~~~~~~~~
   kernel/sched/rt.c:716:6: warning: no previous prototype for 'sched_rt_bandwidth_account' [-Wmissing-prototypes]
     716 | bool sched_rt_bandwidth_account(struct rt_rq *rt_rq)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~
>> kernel/sched/rt.c:9:18: warning: 'max_rt_runtime' defined but not used [-Wunused-const-variable=]
       9 | static const u64 max_rt_runtime = MAX_BW;
         |                  ^~~~~~~~~~~~~~


vim +/max_rt_runtime +9 kernel/sched/rt.c

d505b8af58912a Huaixin Chang  2020-04-25  @9  static const u64 max_rt_runtime = MAX_BW;
ce0dbbbb30aee6 Clark Williams 2013-02-07  10  

:::::: The code at line 9 was first introduced by commit
:::::: d505b8af58912ae1e1a211fabc9995b19bd40828 sched: Defend cfs and rt bandwidth quota against overflow

:::::: TO: Huaixin Chang <changhuaixin@linux.alibaba.com>
:::::: CC: Peter Zijlstra <peterz@infradead.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
