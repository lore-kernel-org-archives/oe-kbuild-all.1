Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1B0D134A1
	for <oe-kbuild-all@lists.linux.dev>; Thu,  2 Nov 2023 10:13:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bpJof+hQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698920027; x=1730456027;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=x5cn2Y24zAHBsyq2rg8rwbDn65TSojQnZdyBbnlFqn0=;
  b=bpJof+hQQylsj62cNhRMUwpc8UIT8P667h1SSsen+X/rEvTFds7JsMu1
   SguurzraFYkDoNeP0x/11ZySlTCs8J01dvCtwAvWGFTYh73Ey2FyPGtWy
   DlPLn1SRlfyHPEjGbmLpgyzdZi9DThxLzUwh/KQGEgVzngBK6YGwhbJwt
   NXeVqGhONlY1JIjLFDr87s3GebGrirHN11gW/Loyxbey/sPHL4Q2hpzsO
   BkpZaD26JSldqvPSaJhxQGFmReZoiExYygPqolBhyLW/TQ47f5LDySQJF
   i7gwZnUVtxpGjl7OahaTKyJ0z1+nNg/q7qld9cFVGtji8mChTYDs388El
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10881"; a="1550593"
X-IronPort-AV: E=Sophos;i="6.03,271,1694761200"; 
   d="scan'208";a="1550593"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2023 03:13:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10881"; a="796191502"
X-IronPort-AV: E=Sophos;i="6.03,271,1694761200"; 
   d="scan'208";a="796191502"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 02 Nov 2023 03:13:42 -0700
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qyUhn-0001Nr-2i;
	Thu, 02 Nov 2023 10:13:39 +0000
Date: Thu, 2 Nov 2023 18:13:13 +0800
From: kernel test robot <lkp@intel.com>
To: Yosry Ahmed <yosryahmed@google.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Alexei Starovoitov <ast@kernel.org>, Hao Luo <haoluo@google.com>
Subject: kernel/cgroup/rstat.c:166:22: warning: no previous declaration for
 'bpf_rstat_flush'
Message-ID: <202311021859.z3HikNTw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Yosry,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   21e80f3841c01aeaf32d7aee7bbc87b3db1aa0c6
commit: a319185be9f5ad13c2a296d448ac52ffe45d194c cgroup: bpf: enable bpf programs to integrate with rstat
date:   1 year, 2 months ago
config: um-i386_defconfig (https://download.01.org/0day-ci/archive/20231102/202311021859.z3HikNTw-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231102/202311021859.z3HikNTw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311021859.z3HikNTw-lkp@intel.com/

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
