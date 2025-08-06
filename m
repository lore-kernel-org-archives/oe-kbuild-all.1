Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 119202989BF
	for <oe-kbuild-all@lists.linux.dev>; Wed,  6 Aug 2025 17:07:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754500061; cv=none; b=NdEBsL+5A/94OqAmypYl3+1tlMZ8ktyrF0jIm6vUR3iZpuCPZ7SSdubFGSFfV/Qh9nVlYoPZpmHq7W5Ko0RGX94vs8urVi1VW186P5VFWuj+kAZUwusa5bj77C7CFzzSQPu6dzBpvpfBiM8POopqR0MwnP/ePjFIpLPP1djaXxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754500061; c=relaxed/simple;
	bh=LGOpiupJX12q0v/tIsSFbP6oRWSAvQixPvYnCjFUcI0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BslGgWxdfWq4byseUnYvVb8oU7xbDTRAPvnAZX/PPZuJAylmOYYilG1RsaWSnV9TtwRf6ijtTGrfkU3pgkEr3KwPZ8bulYy/iDTxgc8CJ5UTCmoRlSv9ZVaQ8S+W4JQBBiywAI3Jm5bb5B/Mteh5rNNr8/jwxsxpqHxxzx8OKz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TFKztGX5; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TFKztGX5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754500059; x=1786036059;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LGOpiupJX12q0v/tIsSFbP6oRWSAvQixPvYnCjFUcI0=;
  b=TFKztGX5jCv6er3em2XmJuKzGW6zcfhvh0QshcGa7UfMWFg9ZG6T49iY
   FZsoixaJ/P3oOJeab4nNPpcg7VpAWVJCIBpq89cLhIsqXrutv72I9O1o8
   Oa0kfI/PmHT6aThRgrJNzxU8z05a7kJh0FqK3PCFedeRM6D1oVXOjRKwP
   uniPHZ295AIibATJ4lxqZqUzbP7rdaUSvE3pyYly25CcV2TTUl1bfacW0
   oFD4xxwL4kNQQ525+0fVZaJg+ldYnXJ9LoKnk862gxVEDMjWCRozYlM+k
   UjGz394SHUQy0qwrjzjVH6RTBUSkrola8o+LfV+ytpV812VxpbtFBfPR7
   Q==;
X-CSE-ConnectionGUID: OjT66oO+T4u6hFlmDe6rjA==
X-CSE-MsgGUID: sKpqHCzgTLWUiBhxOHgTsA==
X-IronPort-AV: E=McAfee;i="6800,10657,11514"; a="68200860"
X-IronPort-AV: E=Sophos;i="6.17,268,1747724400"; 
   d="scan'208";a="68200860"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2025 10:07:39 -0700
X-CSE-ConnectionGUID: Bifda8zrTPq04rN/0MW8yg==
X-CSE-MsgGUID: l2pOZhY1R9GlzwgkMj4KFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,268,1747724400"; 
   d="scan'208";a="195661588"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 06 Aug 2025 10:07:37 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ujhbN-0001vF-0K;
	Wed, 06 Aug 2025 17:07:14 +0000
Date: Thu, 7 Aug 2025 01:04:45 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 1/1] include/linux/compiler.h:69:32:
 warning: 'done' is used uninitialized in this function
Message-ID: <202508070049.YH8Q0EFS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   886d2f37b79982531259490548bc83b9216ca685
commit: a475a3d8e54fc94b672f67bd25552e027370c805 [1/1] ANDROID: scmi_cpufreq: Add restricted vendor hook for scmi_limit_notify_cb
config: arm-randconfig-003-20250806 (https://download.01.org/0day-ci/archive/20250807/202508070049.YH8Q0EFS-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250807/202508070049.YH8Q0EFS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508070049.YH8Q0EFS-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/build_bug.h:5,
                    from include/linux/bits.h:22,
                    from include/linux/bitops.h:6,
                    from include/linux/of.h:15,
                    from include/linux/clk-provider.h:9,
                    from drivers/cpufreq/scmi-cpufreq.c:11:
   drivers/cpufreq/scmi-cpufreq.c: In function 'scmi_limit_notify_cb':
>> include/linux/compiler.h:69:32: warning: 'done' is used uninitialized in this function [-Wuninitialized]
      69 |   (__if_trace.miss_hit[1]++,1) :  \
         |                                ^
   drivers/cpufreq/scmi-cpufreq.c:193:7: note: 'done' was declared here
     193 |  bool done;
         |       ^~~~


vim +/done +69 include/linux/compiler.h

a15fd609ad53a6 Linus Torvalds 2019-03-20  58  
a15fd609ad53a6 Linus Torvalds 2019-03-20  59  #define __trace_if_value(cond) ({			\
2bcd521a684cc9 Steven Rostedt 2008-11-21  60  	static struct ftrace_branch_data		\
e04462fb82f8dd Miguel Ojeda   2018-09-03  61  		__aligned(4)				\
33def8498fdde1 Joe Perches    2020-10-21  62  		__section("_ftrace_branch")		\
a15fd609ad53a6 Linus Torvalds 2019-03-20  63  		__if_trace = {				\
2bcd521a684cc9 Steven Rostedt 2008-11-21  64  			.func = __func__,		\
2bcd521a684cc9 Steven Rostedt 2008-11-21  65  			.file = __FILE__,		\
2bcd521a684cc9 Steven Rostedt 2008-11-21  66  			.line = __LINE__,		\
2bcd521a684cc9 Steven Rostedt 2008-11-21  67  		};					\
a15fd609ad53a6 Linus Torvalds 2019-03-20  68  	(cond) ?					\
a15fd609ad53a6 Linus Torvalds 2019-03-20 @69  		(__if_trace.miss_hit[1]++,1) :		\
a15fd609ad53a6 Linus Torvalds 2019-03-20  70  		(__if_trace.miss_hit[0]++,0);		\
a15fd609ad53a6 Linus Torvalds 2019-03-20  71  })
a15fd609ad53a6 Linus Torvalds 2019-03-20  72  

:::::: The code at line 69 was first introduced by commit
:::::: a15fd609ad53a631a927c6680e8fb606f42a712b tracing: Simplify "if" macro code

:::::: TO: Linus Torvalds <torvalds@linux-foundation.org>
:::::: CC: Steven Rostedt (VMware) <rostedt@goodmis.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
