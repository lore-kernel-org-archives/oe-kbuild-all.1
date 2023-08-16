Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBA6415AE1
	for <oe-kbuild-all@lists.linux.dev>; Wed, 16 Aug 2023 22:28:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692224897; x=1723760897;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kyFu1gHVA0K1mMAFKa5XAi319UUEFBC3qTEukoxXqO4=;
  b=ePzaMkT/zISyXu3rdq0BXepicIvb9szddL1rvJsYI5Qdg2txPB564BZX
   FokB/b7gWajrgtaCLIg4RSPG6GRDdGUh4uNa5NJZER5+OlUg1eUA+05sb
   cOGJV2BsUHv9rbJHgdxeWn4nVx8CCoNM/dxDn9AW1K+T0H/7/aON0vJrR
   gX77Ji+XP7SBWno4E2TNYZSC3G+lxTAB5H9ScgXJTriuEh81pr5NeqxdJ
   wFow8fct4LXVqSUGiz6RWgnIaYlXGc3Crn5zIxaxoX2AmnFPew3tv4X2o
   aMJAT4kDbbI5hf1M8hATIBNSCu8+yTsIgXdV52A7mZqhQib2TXviaB86d
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="372652531"
X-IronPort-AV: E=Sophos;i="6.01,178,1684825200"; 
   d="scan'208";a="372652531"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Aug 2023 15:28:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="727901751"
X-IronPort-AV: E=Sophos;i="6.01,178,1684825200"; 
   d="scan'208";a="727901751"
Received: from lkp-server02.sh.intel.com (HELO a9caf1a0cf30) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 16 Aug 2023 15:28:13 -0700
Received: from kbuild by a9caf1a0cf30 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qWOzt-0000cP-01;
	Wed, 16 Aug 2023 22:28:13 +0000
Date: Thu, 17 Aug 2023 06:27:36 +0800
From: kernel test robot <lkp@intel.com>
To: Yosry Ahmed <yosryahmed@google.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Alexei Starovoitov <ast@kernel.org>, Hao Luo <haoluo@google.com>
Subject: kernel/cgroup/rstat.c:166:22: warning: no previous declaration for
 'bpf_rstat_flush'
Message-ID: <202308170617.MHUk8MPr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   4853c74bd7ab7fdb83f319bd9ace8a08c031e9b6
commit: a319185be9f5ad13c2a296d448ac52ffe45d194c cgroup: bpf: enable bpf programs to integrate with rstat
date:   12 months ago
config: i386-randconfig-r025-20230817 (https://download.01.org/0day-ci/archive/20230817/202308170617.MHUk8MPr-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce: (https://download.01.org/0day-ci/archive/20230817/202308170617.MHUk8MPr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308170617.MHUk8MPr-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/cgroup/rstat.c:166:22: warning: no previous declaration for 'bpf_rstat_flush' [-Wmissing-declarations]
    __weak noinline void bpf_rstat_flush(struct cgroup *cgrp,
                         ^~~~~~~~~~~~~~~


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
