Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1072D27F16
	for <oe-kbuild-all@lists.linux.dev>; Fri, 21 Jul 2023 20:32:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689971543; x=1721507543;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HYpW5NtRXzfCFMtJ4iOj2q64L8Mo9yxJNmNW0KGkET8=;
  b=mjPzBQqQkVjEev7j5fdQwrwjuW5nZeDBwklYkmgVH2r76Tqm007OYQfY
   EG4JDH7Lx5AMY6p/DBw355wueA6QXTe2K4wikKSoTWveDTODJvEO8OZlH
   Q5XPIyk7eu7o27NOp6BxXD6q5L26gmrgvND6QLbi+bP6srrLklRaxifJz
   de+vm7UjfqBErvFvg0pJvZlDrC6dt6XkwFSU2phJRDefwyBTTe7KtnA58
   8pKaBZdViUWoN+9oVVWJ/U7kct1OIHLOiPIr8r/F0Onbqc4ozWQMyOV8L
   j7hloya3M5nUeNM7iuSVPPtkFvJdDzjTZxpTQtpj/WmYnbOXgEISB/gDB
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10778"; a="364573879"
X-IronPort-AV: E=Sophos;i="6.01,222,1684825200"; 
   d="scan'208";a="364573879"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jul 2023 13:32:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10778"; a="718966806"
X-IronPort-AV: E=Sophos;i="6.01,222,1684825200"; 
   d="scan'208";a="718966806"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 21 Jul 2023 13:32:21 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qMwnU-0007eB-1C;
	Fri, 21 Jul 2023 20:32:20 +0000
Date: Sat, 22 Jul 2023 04:31:19 +0800
From: kernel test robot <lkp@intel.com>
To: Jiri Olsa <jolsa@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jolsa-perf:bpf/missed_stats_3 1/7] include/linux/bpf.h:2650:13:
 error: 'bpf_prog_update_prog_stats' defined but not used
Message-ID: <202307220405.fwfaioXw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git bpf/missed_stats_3
head:   903afc5b7a9fa7c9bff7f7dc86d955b637fb1fd9
commit: 04fef13e9772949ac2d598ed21fd26c6e43746ac [1/7] bpf: Move update_prog_stats to syscall object
config: sparc64-randconfig-r036-20230720 (https://download.01.org/0day-ci/archive/20230722/202307220405.fwfaioXw-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230722/202307220405.fwfaioXw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307220405.fwfaioXw-lkp@intel.com/

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
