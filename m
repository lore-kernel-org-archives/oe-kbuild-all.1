Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BB8110E9
	for <oe-kbuild-all@lists.linux.dev>; Tue, 22 Aug 2023 01:59:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692669573; x=1724205573;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=edOagud6WkEIpS+ti27vRGzfjOHZ97EJ5Dtq+QoZujU=;
  b=QqVAkzn/wEKdaHgyUR88mZVihSmnVzRJdLLuixi7NYBBAQOtF+vrTEnl
   mdDtu1D6GzvBbdiVCqgnU89jGrEVTkajWKAMD/s/N1levUYnwC9cVGg0N
   CmgHOocx5pMh+OWB9lu0fFaE3ciywIhiLF6nILiIlp19xA8xF0FIX4hSf
   ifXoibxxHB4uNcFoyFc4TXNx2E4RhYUJOwyAuAjyU//q0A5fWL7mZKQJA
   RUjcq1X1vld6hpBED0PRenWVOQpuxXlHPCGhNpwDAreMKrxBEP21tT1QF
   yB/RZcwIRWNDK1naC1P8eSffUOWFQEdZZa3lBjik/NsMF1Qdze6mVefmm
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="377507941"
X-IronPort-AV: E=Sophos;i="6.01,191,1684825200"; 
   d="scan'208";a="377507941"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2023 18:59:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="729634540"
X-IronPort-AV: E=Sophos;i="6.01,191,1684825200"; 
   d="scan'208";a="729634540"
Received: from lkp-server02.sh.intel.com (HELO 6809aa828f2a) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 21 Aug 2023 18:59:31 -0700
Received: from kbuild by 6809aa828f2a with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qYGg6-0001CL-1A;
	Tue, 22 Aug 2023 01:59:30 +0000
Date: Tue, 22 Aug 2023 09:56:03 +0800
From: kernel test robot <lkp@intel.com>
To: Qais Yousef <qyousef@layalina.io>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [qais-yousef:remove-margins 9/9] ld:
 kernel/sched/cpufreq_schedutil.c:69: undefined reference to
 `approximate_runtime'
Message-ID: <202308220942.IxhpBudq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Qais,

First bad commit (maybe != root cause):

tree:   https://github.com/qais-yousef/linux remove-margins
head:   c33dc1443a3c5aebf846a5b6ea54b0cc8a2dc90f
commit: c33dc1443a3c5aebf846a5b6ea54b0cc8a2dc90f [9/9] sched/schedutil: Add a new tunnable to dictate response time
config: i386-buildonly-randconfig-006-20230822 (https://download.01.org/0day-ci/archive/20230822/202308220942.IxhpBudq-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230822/202308220942.IxhpBudq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308220942.IxhpBudq-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: kernel/sched/core.o: in function `apply_dvfs_headroom':
   kernel/sched/sched.h:3027: undefined reference to `approximate_util_avg'
   ld: kernel/sched/fair.o: in function `fits_capacity':
   kernel/sched/fair.c:127: undefined reference to `approximate_util_avg'
   ld: kernel/sched/fair.c:127: undefined reference to `approximate_util_avg'
   ld: kernel/sched/fair.c:127: undefined reference to `approximate_util_avg'
   ld: kernel/sched/fair.c:127: undefined reference to `approximate_util_avg'
   ld: kernel/sched/fair.o:kernel/sched/fair.c:127: more undefined references to `approximate_util_avg' follow
   ld: kernel/sched/build_utility.o: in function `sugov_calc_freq_response_us':
   kernel/sched/cpufreq_schedutil.c:69: undefined reference to `approximate_runtime'
>> ld: kernel/sched/cpufreq_schedutil.c:69: undefined reference to `approximate_runtime'
   pahole: .tmp_vmlinux.btf: Invalid argument
   .btf.vmlinux.bin.o: file not recognized: file format not recognized

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
