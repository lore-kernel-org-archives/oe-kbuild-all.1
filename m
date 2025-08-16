Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AFED634
	for <oe-kbuild-all@lists.linux.dev>; Sat, 16 Aug 2025 15:38:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755358705; cv=none; b=aIbeuBQo3nJyQLCy+FzzOHuPifyc9pv5IB7H6r5PatoWmAQdsP2Ji7QljCHFj42rYPWEX5Ls8BMe09IKdc5cGI45hm91Os1Eb0F230ZvliakUJFPl9wpn/9gwRkJwwy2d0TKLZIoRMz+nIu+r3DGNUYXe55b20+4dB6fbkd1N1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755358705; c=relaxed/simple;
	bh=F5toXI1VO3GEzl1uxjf0VuSz9SuudRE68r8taQqIM8c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MP6Q5PrnuGTZNeNuFPEvQrAWlSLIkPqF1vzpUXtvWodlNiqVuCAX3akrqt7cmMWbQNaEJPvmYlFAYKtqEbj1aHy2palt+xS8UxhSc7psY9B6la+iGHOc6ujOLeMklt9BYu92ZB5pR8TI439TNcjXDYJG4veJch9oPRuxFvFYCqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UiRjR9Iv; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UiRjR9Iv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755358703; x=1786894703;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=F5toXI1VO3GEzl1uxjf0VuSz9SuudRE68r8taQqIM8c=;
  b=UiRjR9IvnjlSbZFI9uluq4ytFF4s/xs4qFRkkc8/4yEslBz8w26WNcHu
   5YnIW20vwqy1FSXV2VLL6XXS50BXowzSLjYrWtRmgWNEgvt/hGCfUKC/R
   NnOm9ybJKhKrvaYPJBNoI+weVt9arJdXVlq4kE0Gw9M4s7ULcxYymDU//
   OETeQuF+Qu6wrAr+5oP3isZWA49Q+LvZn+Mnh6MVqdN7QKv703eHQ0k1f
   axrRZ9vNAAF8N4osfUsePc0eymSw+xfk7GmkCQerc3zYZkjUrkdxHo9Ai
   U0JSjpvtaJfZHzrwRMzpf7wEParxcebhY0eIEBiYWpRBNS/I53Sla/eZ6
   g==;
X-CSE-ConnectionGUID: 4nglRHPCS6qlobt2TLsnCA==
X-CSE-MsgGUID: d8TF1Xp9RCa64aWJLFfAVQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11524"; a="57721287"
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; 
   d="scan'208";a="57721287"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Aug 2025 08:38:22 -0700
X-CSE-ConnectionGUID: i0AvjxMMSDSMoXYnrH0XdA==
X-CSE-MsgGUID: oX7sJsBQQZC+mRiVezLd3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; 
   d="scan'208";a="167608420"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 16 Aug 2025 08:38:21 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1unIyd-000Cy0-0Y;
	Sat, 16 Aug 2025 15:38:07 +0000
Date: Sat, 16 Aug 2025 23:37:31 +0800
From: kernel test robot <lkp@intel.com>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [paulmckrcu:dev 11/11] kernel/rcu/rcu.h:679:20: error: static
 declaration of 'show_rcu_tasks_trace_gp_kthread' follows non-static
 declaration
Message-ID: <202508162343.JKejG89v-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/paulmckrcu/linux dev
head:   2ad3ef4260e9bd8628025b35fa2613c7e4e7720f
commit: 2ad3ef4260e9bd8628025b35fa2613c7e4e7720f [11/11] rcu: Re-implement RCU Tasks Trace in terms of SRCU-fast
config: arc-randconfig-001-20250816 (https://download.01.org/0day-ci/archive/20250816/202508162343.JKejG89v-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250816/202508162343.JKejG89v-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508162343.JKejG89v-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/torture.c:41:
>> kernel/rcu/rcu.h:679:20: error: static declaration of 'show_rcu_tasks_trace_gp_kthread' follows non-static declaration
    static inline void show_rcu_tasks_trace_gp_kthread(void) {}
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/tracepoint.h:20,
                    from include/trace/events/rcu.h:8,
                    from kernel/rcu/rcu.h:14,
                    from kernel/torture.c:41:
   include/linux/rcupdate_trace.h:136:6: note: previous declaration of 'show_rcu_tasks_trace_gp_kthread' was here
    void show_rcu_tasks_trace_gp_kthread(void);
         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--
   In file included from kernel/rcu/update.c:50:
>> kernel/rcu/rcu.h:679:20: error: static declaration of 'show_rcu_tasks_trace_gp_kthread' follows non-static declaration
    static inline void show_rcu_tasks_trace_gp_kthread(void) {}
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from kernel/rcu/update.c:46:
   include/linux/rcupdate_trace.h:136:6: note: previous declaration of 'show_rcu_tasks_trace_gp_kthread' was here
    void show_rcu_tasks_trace_gp_kthread(void);
         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from kernel/rcu/update.c:656:
   kernel/rcu/tasks.h: In function 'rcu_tasks_trace_suppress_unused':
>> kernel/rcu/tasks.h:1465:2: error: implicit declaration of function 'show_rcu_tasks_generic_gp_kthread'; did you mean 'show_rcu_tasks_classic_gp_kthread'? [-Werror=implicit-function-declaration]
     show_rcu_tasks_generic_gp_kthread(NULL, NULL);
     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     show_rcu_tasks_classic_gp_kthread
>> kernel/rcu/tasks.h:1471:2: error: implicit declaration of function 'rcu_tasks_torture_stats_print_generic'; did you mean 'rcu_tasks_trace_torture_stats_print'? [-Werror=implicit-function-declaration]
     rcu_tasks_torture_stats_print_generic(NULL, NULL, NULL, NULL);
     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     rcu_tasks_trace_torture_stats_print
   cc1: some warnings being treated as errors


vim +/show_rcu_tasks_trace_gp_kthread +679 kernel/rcu/rcu.h

3d54f7983f3e6a Paul E. McKenney 2017-05-03  665  
27c0f1448389ba Paul E. McKenney 2020-09-15  666  #if !defined(CONFIG_TINY_RCU) && defined(CONFIG_TASKS_RCU)
27c0f1448389ba Paul E. McKenney 2020-09-15  667  void show_rcu_tasks_classic_gp_kthread(void);
27c0f1448389ba Paul E. McKenney 2020-09-15  668  #else
27c0f1448389ba Paul E. McKenney 2020-09-15  669  static inline void show_rcu_tasks_classic_gp_kthread(void) {}
27c0f1448389ba Paul E. McKenney 2020-09-15  670  #endif
27c0f1448389ba Paul E. McKenney 2020-09-15  671  #if !defined(CONFIG_TINY_RCU) && defined(CONFIG_TASKS_RUDE_RCU)
27c0f1448389ba Paul E. McKenney 2020-09-15  672  void show_rcu_tasks_rude_gp_kthread(void);
27c0f1448389ba Paul E. McKenney 2020-09-15  673  #else
27c0f1448389ba Paul E. McKenney 2020-09-15  674  static inline void show_rcu_tasks_rude_gp_kthread(void) {}
27c0f1448389ba Paul E. McKenney 2020-09-15  675  #endif
27c0f1448389ba Paul E. McKenney 2020-09-15  676  #if !defined(CONFIG_TINY_RCU) && defined(CONFIG_TASKS_TRACE_RCU)
27c0f1448389ba Paul E. McKenney 2020-09-15  677  void show_rcu_tasks_trace_gp_kthread(void);
27c0f1448389ba Paul E. McKenney 2020-09-15  678  #else
27c0f1448389ba Paul E. McKenney 2020-09-15 @679  static inline void show_rcu_tasks_trace_gp_kthread(void) {}
27c0f1448389ba Paul E. McKenney 2020-09-15  680  #endif
27c0f1448389ba Paul E. McKenney 2020-09-15  681  

:::::: The code at line 679 was first introduced by commit
:::::: 27c0f1448389baf7f309b69e62d4b531c9395e88 rcutorture: Make grace-period kthread report match RCU flavor being tested

:::::: TO: Paul E. McKenney <paulmck@kernel.org>
:::::: CC: Paul E. McKenney <paulmck@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
