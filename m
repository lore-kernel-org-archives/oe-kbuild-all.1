Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D1E7101EA
	for <oe-kbuild-all@lists.linux.dev>; Thu, 17 Aug 2023 23:40:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692315643; x=1723851643;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=99rPeQ5/adE6x4lyPiyDxGG+LbtIfy+slgjM8qiM+yE=;
  b=FeHDOy2vnjS7+sFc0SJdfR5GxTWTpOWYv4Plneek+Mcum2O7tqdxgCS4
   9Ae98WBwKq6iFVj7cRUnCAebiNpYg8gnmxuJkmdOnrx/amBPS+ke+7rL1
   VnyriXetIQ5sz0klXjlORvDu94PCH73Gzpuph2Q/FlKBqKBKsJSc+nNL7
   JDofFpARosAe/W4+ZN+BVsMvea6pWo0xZiLzdQfleG0jfYkgG1cVEdquH
   l2UOdO3m8x6jGfkKnudR3lWh/HwxsqJUq/NRlKu5/fJpDCAbt+LgWV5NA
   RQyMN1VnNOWJhH9OyE1I/+K+kihOYrlMGXEoIn66f8ptXRlCPhX1o0rio
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10805"; a="357928155"
X-IronPort-AV: E=Sophos;i="6.01,181,1684825200"; 
   d="scan'208";a="357928155"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2023 16:40:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10805"; a="824872784"
X-IronPort-AV: E=Sophos;i="6.01,181,1684825200"; 
   d="scan'208";a="824872784"
Received: from lkp-server02.sh.intel.com (HELO a9caf1a0cf30) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 17 Aug 2023 16:40:40 -0700
Received: from kbuild by a9caf1a0cf30 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qWmbX-0001YB-3B;
	Thu, 17 Aug 2023 23:40:39 +0000
Date: Fri, 18 Aug 2023 07:40:07 +0800
From: kernel test robot <lkp@intel.com>
To: Yosry Ahmed <yosryahmed@google.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Alexei Starovoitov <ast@kernel.org>, Hao Luo <haoluo@google.com>
Subject: kernel/cgroup/rstat.c:166:22: error: no previous declaration for
 'bpf_rstat_flush'
Message-ID: <202308180759.iTOZ010U-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   16931859a6500d360b90aeacab3b505a3560a3ed
commit: a319185be9f5ad13c2a296d448ac52ffe45d194c cgroup: bpf: enable bpf programs to integrate with rstat
date:   12 months ago
config: x86_64-sof-customedconfig-avs-defconfig (https://download.01.org/0day-ci/archive/20230818/202308180759.iTOZ010U-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce: (https://download.01.org/0day-ci/archive/20230818/202308180759.iTOZ010U-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308180759.iTOZ010U-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/cgroup/rstat.c:166:22: error: no previous declaration for 'bpf_rstat_flush' [-Werror=missing-declarations]
    __weak noinline void bpf_rstat_flush(struct cgroup *cgrp,
                         ^~~~~~~~~~~~~~~
   cc1: all warnings being treated as errors


vim +/bpf_rstat_flush +166 kernel/cgroup/rstat.c

   147	
   148	/*
   149	 * A hook for bpf stat collectors to attach to and flush their stats.
   150	 * Together with providing bpf kfuncs for cgroup_rstat_updated() and
   151	 * cgroup_rstat_flush(), this enables a complete workflow where bpf progs that
   152	 * collect cgroup stats can integrate with rstat for efficient flushing.
   153	 *
   154	 * A static noinline declaration here could cause the compiler to optimize away
   155	 * the function. A global noinline declaration will keep the definition, but may
   156	 * optimize away the callsite. Therefore, __weak is needed to ensure that the
   157	 * call is still emitted, by telling the compiler that we don't know what the
   158	 * function might eventually be.
   159	 *
   160	 * __diag_* below are needed to dismiss the missing prototype warning.
   161	 */
   162	__diag_push();
   163	__diag_ignore_all("-Wmissing-prototypes",
   164			  "kfuncs which will be used in BPF programs");
   165	
 > 166	__weak noinline void bpf_rstat_flush(struct cgroup *cgrp,
   167					     struct cgroup *parent, int cpu)
   168	{
   169	}
   170	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
