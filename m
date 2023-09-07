Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CEE3EA6
	for <oe-kbuild-all@lists.linux.dev>; Thu,  7 Sep 2023 04:30:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694061046; x=1725597046;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IhdZDVelb2SRvHh1ye8Ux/q8QfgoNi62xkzGDYgICuc=;
  b=kf+CAuVcS8C33joZeqGBhpu3YZGPSg3nhdSHkBOtzBYNMtKrbqt4cRoJ
   hjRcbrpxinYo6GGZmwKbmyYCHXmLkuatJw3vguPT7rD3g0SAOMYs/qtvs
   4E8NFd/t7TXB/7ws+/labTQdOkXlrbtMk1Alrqk7RJcm0aLdURXaCjkiz
   xUhhZ5W3ClHJYwT6s3JxNLtKIBXqI7OAamq0HDU4iCeOduAIV1yxhvNde
   AOzUJLlDVFWUWftYB3E3Ckk4//NQv9t63jxLPPfOXhBFcJqRhs6sGFaaU
   3ceeXEuTsra/rQlNpXhouwztMA0RRogFBHncEqcYGY5TjMHTuuZfBy7SZ
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10825"; a="381042295"
X-IronPort-AV: E=Sophos;i="6.02,234,1688454000"; 
   d="scan'208";a="381042295"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2023 21:30:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10825"; a="741852563"
X-IronPort-AV: E=Sophos;i="6.02,234,1688454000"; 
   d="scan'208";a="741852563"
Received: from lkp-server01.sh.intel.com (HELO 59b3c6e06877) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 06 Sep 2023 21:30:43 -0700
Received: from kbuild by 59b3c6e06877 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qe6fB-0000s7-2D;
	Thu, 07 Sep 2023 04:30:41 +0000
Date: Thu, 7 Sep 2023 12:30:01 +0800
From: kernel test robot <lkp@intel.com>
To: Yosry Ahmed <yosryahmed@google.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Alexei Starovoitov <ast@kernel.org>, Hao Luo <haoluo@google.com>
Subject: kernel/cgroup/rstat.c:166:22: error: no previous declaration for
 'bpf_rstat_flush'
Message-ID: <202309071214.ACNNqbiA-lkp@intel.com>
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
head:   7ba2090ca64ea1aa435744884124387db1fac70f
commit: a319185be9f5ad13c2a296d448ac52ffe45d194c cgroup: bpf: enable bpf programs to integrate with rstat
date:   1 year ago
config: x86_64-sof-customedconfig-avs-defconfig (https://download.01.org/0day-ci/archive/20230907/202309071214.ACNNqbiA-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230907/202309071214.ACNNqbiA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309071214.ACNNqbiA-lkp@intel.com/

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
