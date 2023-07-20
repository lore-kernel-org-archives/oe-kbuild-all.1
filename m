Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C71591BE67
	for <oe-kbuild-all@lists.linux.dev>; Thu, 20 Jul 2023 19:49:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689882590; x=1721418590;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QZ5q5kDuF6J7plDyPoGw1aNOP+ByJCQEheMlBHm3nhU=;
  b=NyN5/oo1HSsGq10E2xd2azsECJlwVdGpcLrBvwT2UCW80rOaUaW1L07S
   UbJx3lc3PQK6MacU+6VssNd03PFjcZCWZxgRoH9jcPgVCpEkjcDexAOdt
   pBu0fdr+j6HnebfkbcIvUWk6i+5JfNik+LFoSUiau8sB6bmm076a9WcGF
   ZSiaT+m1glmyzSy+o+Y1hwbioGM4DGLyxhGSv1yBs7il0ofz5v599Nq6E
   SsILe1c8UxzxcP8uiDKiEie0krf4q4YbRv8url5gkrKb9a5Ahj1aweqNV
   QzzVta6NgudmrvduZ9cn/p5bj/PhOO6LABZPalekolGJ8BjGGNulqaC1y
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10777"; a="365748569"
X-IronPort-AV: E=Sophos;i="6.01,219,1684825200"; 
   d="scan'208";a="365748569"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jul 2023 12:49:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10777"; a="789948903"
X-IronPort-AV: E=Sophos;i="6.01,219,1684825200"; 
   d="scan'208";a="789948903"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 20 Jul 2023 12:49:48 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qMZem-0006RR-0j;
	Thu, 20 Jul 2023 19:49:48 +0000
Date: Fri, 21 Jul 2023 03:49:30 +0800
From: kernel test robot <lkp@intel.com>
To: Jiri Olsa <jolsa@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jolsa-perf:bpf/missed_stats_3 1/7] include/linux/bpf.h:2650:13:
 error: 'bpf_prog_update_prog_stats' defined but not used
Message-ID: <202307210348.t79b0x4o-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git bpf/missed_stats_3
head:   d40e4165c066c7a131012bf1d87f27517c79e3f1
commit: 3d25b22ba2534fedca5325362b88adab8ac6c651 [1/7] bpf: Move update_prog_stats to syscall object
config: sparc64-randconfig-r036-20230720 (https://download.01.org/0day-ci/archive/20230721/202307210348.t79b0x4o-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230721/202307210348.t79b0x4o-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307210348.t79b0x4o-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/filter.h:9,
                    from arch/sparc/kernel/sys_sparc32.c:29:
>> include/linux/bpf.h:2650:13: error: 'bpf_prog_update_prog_stats' defined but not used [-Werror=unused-function]
    2650 | static void bpf_prog_update_prog_stats(struct bpf_prog *prog,
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: all warnings being treated as errors


vim +/bpf_prog_update_prog_stats +2650 include/linux/bpf.h

  2649	
> 2650	static void bpf_prog_update_prog_stats(struct bpf_prog *prog,
  2651					       u64 start)
  2652	{
  2653	}
  2654	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
