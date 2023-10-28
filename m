Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47E40644
	for <oe-kbuild-all@lists.linux.dev>; Sat, 28 Oct 2023 02:20:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OodQJVPg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698459609; x=1729995609;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dItB2SYLzhKj+1YWYBWXFsJSombVvDVG7SjZOctIX88=;
  b=OodQJVPgfgMhtlI/GpogsJRICKo/KbEQkmf6NUt5QNc1JqZcgJhwmEy9
   ZUTMqZT8JewtvPzWSShPSLsKJffkA+2gTSPw+JjBkRq58mI4DfcCnywsz
   WdhKkO+VuvnuJmBELAlYllSfvPHm1Z0bxe3RyW0ziQuy8ARtobSqDq5wR
   ITec5KahDJkiB1aiEcfUiM+1pq8fcTO7pgBUd6nXTwk+YED7es3JPIPf6
   zVOTI2Q0ckCoJriu0yj9fZ+Jf5+rtZqLK1m8GtPPboXacQMNZR180jQzC
   K/l/i+dZ+34NHzZ6cbYMaoXVaWD2xeOF74dsfaN1dbnYCDOOj6h6j6os3
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10876"; a="386762965"
X-IronPort-AV: E=Sophos;i="6.03,257,1694761200"; 
   d="scan'208";a="386762965"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2023 19:20:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10876"; a="788973578"
X-IronPort-AV: E=Sophos;i="6.03,257,1694761200"; 
   d="scan'208";a="788973578"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 27 Oct 2023 19:20:06 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qwYvk-000BOt-1s;
	Sat, 28 Oct 2023 02:20:04 +0000
Date: Sat, 28 Oct 2023 10:19:42 +0800
From: kernel test robot <lkp@intel.com>
To: SeongJae Park <sj@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sj:damon/next 27/29] mm/damon/core.c:1100:15: warning: no previous
 prototype for 'damon_feed_loop_next_input'
Message-ID: <202310281015.MAPM6qTx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sj/linux.git damon/next
head:   582f3391d5cdaa0307dfc2e1fa5566c9dd7ae489
commit: 62ea5e20e348efec15b0abbc00eac0fa53b0a98f [27/29] mm/damon/core: Implement a simple feedback loop function
config: i386-buildonly-randconfig-002-20231028 (https://download.01.org/0day-ci/archive/20231028/202310281015.MAPM6qTx-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231028/202310281015.MAPM6qTx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310281015.MAPM6qTx-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/damon/core.c:1100:15: warning: no previous prototype for 'damon_feed_loop_next_input' [-Wmissing-prototypes]
    1100 | unsigned long damon_feed_loop_next_input(unsigned long last_input,
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/kernel.h:27,
                    from arch/x86/include/asm/percpu.h:27,
                    from arch/x86/include/asm/current.h:10,
                    from include/linux/sched.h:12,
                    from include/linux/cgroup.h:12,
                    from include/linux/memcontrol.h:13,
                    from include/linux/damon.h:11,
                    from mm/damon/core.c:10:
   mm/damon/core.c: In function 'damon_feed_loop_next_input':
   include/linux/minmax.h:21:35: warning: comparison of distinct pointer types lacks a cast
      21 |         (!!(sizeof((typeof(x) *)1 == (typeof(y) *)1)))
         |                                   ^~
   include/linux/minmax.h:27:18: note: in expansion of macro '__typecheck'
      27 |                 (__typecheck(x, y) && __no_side_effects(x, y))
         |                  ^~~~~~~~~~~
   include/linux/minmax.h:37:31: note: in expansion of macro '__safe_cmp'
      37 |         __builtin_choose_expr(__safe_cmp(x, y), \
         |                               ^~~~~~~~~~
   include/linux/minmax.h:75:25: note: in expansion of macro '__careful_cmp'
      75 | #define max(x, y)       __careful_cmp(x, y, >)
         |                         ^~~~~~~~~~~~~
   mm/damon/core.c:1104:41: note: in expansion of macro 'max'
    1104 |         unsigned long score_goal_diff = max(goal, score) - min(goal, score);
         |                                         ^~~
   include/linux/minmax.h:21:35: warning: comparison of distinct pointer types lacks a cast
      21 |         (!!(sizeof((typeof(x) *)1 == (typeof(y) *)1)))
         |                                   ^~
   include/linux/minmax.h:27:18: note: in expansion of macro '__typecheck'
      27 |                 (__typecheck(x, y) && __no_side_effects(x, y))
         |                  ^~~~~~~~~~~
   include/linux/minmax.h:37:31: note: in expansion of macro '__safe_cmp'
      37 |         __builtin_choose_expr(__safe_cmp(x, y), \
         |                               ^~~~~~~~~~
   include/linux/minmax.h:68:25: note: in expansion of macro '__careful_cmp'
      68 | #define min(x, y)       __careful_cmp(x, y, <)
         |                         ^~~~~~~~~~~~~
   mm/damon/core.c:1104:60: note: in expansion of macro 'min'
    1104 |         unsigned long score_goal_diff = max(goal, score) - min(goal, score);
         |                                                            ^~~
   mm/damon/core.c:1107:23: warning: unused variable 'next_input' [-Wunused-variable]
    1107 |         unsigned long next_input = last_input;
         |                       ^~~~~~~~~~
   In file included from mm/damon/core.c:1785:
   mm/damon/core-test.h: In function 'damon_test_nr_accesses_to_accesses_bp':
   mm/damon/core-test.h:301:57: warning: unsigned conversion from 'long long int' to 'long unsigned int' changes value from '42949672960' to '0' [-Woverflow]
     301 |                 .sample_interval = 10, .aggr_interval = 42949672960,};
         |                                                         ^~~~~~~~~~~


vim +/damon_feed_loop_next_input +1100 mm/damon/core.c

  1079	
  1080	/*
  1081	 * damon_feed_loop_next_input() - get next input to achieve a target score.
  1082	 * @last_input	The last input.
  1083	 * @score	Current score that made with @last_input.
  1084	 *
  1085	 * Calculate next input to achieve the target score, based on the last input
  1086	 * and current score.  Assuming the input and the score are positively
  1087	 * proportional, calculate how much compensation should be added to or
  1088	 * subtracted from the last input as a proportion of the last input.  Avoid
  1089	 * next input always being zero by setting it at least 1.  In short form
  1090	 * (assuming support of float and signed calculations), the algorithm is as
  1091	 * below.
  1092	 *
  1093	 * next_input = max(last_input * ((goal - current) / goal + 1), 1)
  1094	 *
  1095	 * For simple implementation, we assume the target score is always 10,000.  The
  1096	 * caller should adjust @score for this.
  1097	 *
  1098	 * Returns next input that assumed to achieve the target score.
  1099	 */
> 1100	unsigned long damon_feed_loop_next_input(unsigned long last_input,
  1101			unsigned long score)
  1102	{
  1103		const unsigned int goal = 10000;
  1104		unsigned long score_goal_diff = max(goal, score) - min(goal, score);
  1105		unsigned long score_goal_diff_bp = score_goal_diff * 10000 / goal;
  1106		unsigned long compensation = last_input * score_goal_diff_bp / 10000;
  1107		unsigned long next_input = last_input;
  1108	
  1109		if (goal > score)
  1110			return last_input + compensation;
  1111		if (last_input > compensation)
  1112			return last_input - compensation;
  1113		return 1;
  1114	}
  1115	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
