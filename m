Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89DE38F77
	for <oe-kbuild-all@lists.linux.dev>; Thu,  8 Jun 2023 09:01:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686214876; x=1717750876;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HIQ8jTHA/owK5Ham2DadQzn/l0NWjX6c1yObW36TrSk=;
  b=ESsHXZzAY4k5UqgJs+dHrthffxdpg8l9Fr04ufpSDF+LziD7/DZkZkx9
   vS6ZRDGgkds9YWOueve0tSYRq7i23L4BlrB95g+AIc3bHggcFeEi+jQQx
   EIoJ7Ma/lCo3W1I+CTbfxjph1pjOE4ouwtIij/mBnsXYNxLfzxLQgA/NH
   nMvohFcRhdXY0YYtPjCO0p0NGbWPbfJnTdaFp27Scw/ck8c+G2LiZKsDK
   oyK/gu6EtFyGP0/tsbBPg+VYPruJ61zZNm9hxUO09JayVvqn/wMf9Swob
   UOuNhWTj8AzfEOqpa81NCpydtQ8/YZnxf8O4chvrJtfpcgTcje+g2ZGDy
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10734"; a="385596693"
X-IronPort-AV: E=Sophos;i="6.00,226,1681196400"; 
   d="scan'208";a="385596693"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jun 2023 02:00:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10734"; a="1040044802"
X-IronPort-AV: E=Sophos;i="6.00,226,1681196400"; 
   d="scan'208";a="1040044802"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 08 Jun 2023 02:00:51 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q7BVi-0007cJ-0f;
	Thu, 08 Jun 2023 09:00:50 +0000
Date: Thu, 8 Jun 2023 17:00:07 +0800
From: kernel test robot <lkp@intel.com>
To: Will Deacon <will@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [arm-perf:kvm/bpf 4/5] kernel/trace/trace_selftest.c:1160:32:
 warning: passing argument 2 of 'sched_setattr' discards 'const' qualifier
 from pointer target type
Message-ID: <202306081625.m78S8h1q-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Will,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/will/linux.git kvm/bpf
head:   9386dea7e9d6e37c2c08b088f3195770ae2f3feb
commit: a0cef1063f808d7ac0679631e8744684ff390dd7 [4/5] sched/core: Move initialisation of sched 'params' into sched_setattr()
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20230608/202306081625.m78S8h1q-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 12.3.0
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/will/linux.git/commit/?id=a0cef1063f808d7ac0679631e8744684ff390dd7
        git remote add arm-perf https://git.kernel.org/pub/scm/linux/kernel/git/will/linux.git
        git fetch --no-tags arm-perf kvm/bpf
        git checkout a0cef1063f808d7ac0679631e8744684ff390dd7
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=s390 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=s390 SHELL=/bin/bash

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306081625.m78S8h1q-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from kernel/trace/trace.c:8817:
   kernel/trace/trace_selftest.c: In function 'trace_wakeup_test_thread':
>> kernel/trace/trace_selftest.c:1160:32: warning: passing argument 2 of 'sched_setattr' discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
    1160 |         sched_setattr(current, &attr);
         |                                ^~~~~
   In file included from include/linux/mm.h:28,
                    from include/linux/ring_buffer.h:5,
                    from kernel/trace/trace.c:15:
   include/linux/sched.h:1909:48: note: expected 'struct sched_attr *' but argument is of type 'const struct sched_attr *'
    1909 | extern int sched_setattr(struct task_struct *, struct sched_attr *);
         |                                                ^~~~~~~~~~~~~~~~~~~


vim +1160 kernel/trace/trace_selftest.c

addff1feb02b03 Steven Rostedt           2014-10-08  1148  
60a11774b38fef Steven Rostedt           2008-05-12  1149  static int trace_wakeup_test_thread(void *data)
60a11774b38fef Steven Rostedt           2008-05-12  1150  {
af6ace764d0390 Dario Faggioli           2013-11-07  1151  	/* Make this a -deadline thread */
af6ace764d0390 Dario Faggioli           2013-11-07  1152  	static const struct sched_attr attr = {
af6ace764d0390 Dario Faggioli           2013-11-07  1153  		.sched_policy = SCHED_DEADLINE,
af6ace764d0390 Dario Faggioli           2013-11-07  1154  		.sched_runtime = 100000ULL,
af6ace764d0390 Dario Faggioli           2013-11-07  1155  		.sched_deadline = 10000000ULL,
af6ace764d0390 Dario Faggioli           2013-11-07  1156  		.sched_period = 10000000ULL
af6ace764d0390 Dario Faggioli           2013-11-07  1157  	};
addff1feb02b03 Steven Rostedt           2014-10-08  1158  	struct wakeup_test_data *x = data;
60a11774b38fef Steven Rostedt           2008-05-12  1159  
af6ace764d0390 Dario Faggioli           2013-11-07 @1160  	sched_setattr(current, &attr);
60a11774b38fef Steven Rostedt           2008-05-12  1161  
60a11774b38fef Steven Rostedt           2008-05-12  1162  	/* Make it know we have a new prio */
addff1feb02b03 Steven Rostedt           2014-10-08  1163  	complete(&x->is_ready);
60a11774b38fef Steven Rostedt           2008-05-12  1164  
60a11774b38fef Steven Rostedt           2008-05-12  1165  	/* now go to sleep and let the test wake us up */
60a11774b38fef Steven Rostedt           2008-05-12  1166  	set_current_state(TASK_INTERRUPTIBLE);
addff1feb02b03 Steven Rostedt           2014-10-08  1167  	while (!x->go) {
60a11774b38fef Steven Rostedt           2008-05-12  1168  		schedule();
addff1feb02b03 Steven Rostedt           2014-10-08  1169  		set_current_state(TASK_INTERRUPTIBLE);
addff1feb02b03 Steven Rostedt           2014-10-08  1170  	}
addff1feb02b03 Steven Rostedt           2014-10-08  1171  
addff1feb02b03 Steven Rostedt           2014-10-08  1172  	complete(&x->is_ready);
60a11774b38fef Steven Rostedt           2008-05-12  1173  
addff1feb02b03 Steven Rostedt           2014-10-08  1174  	set_current_state(TASK_INTERRUPTIBLE);
3c18c10bde65b6 Steven Rostedt           2012-07-31  1175  
60a11774b38fef Steven Rostedt           2008-05-12  1176  	/* we are awake, now wait to disappear */
60a11774b38fef Steven Rostedt           2008-05-12  1177  	while (!kthread_should_stop()) {
addff1feb02b03 Steven Rostedt           2014-10-08  1178  		schedule();
addff1feb02b03 Steven Rostedt           2014-10-08  1179  		set_current_state(TASK_INTERRUPTIBLE);
60a11774b38fef Steven Rostedt           2008-05-12  1180  	}
60a11774b38fef Steven Rostedt           2008-05-12  1181  
addff1feb02b03 Steven Rostedt           2014-10-08  1182  	__set_current_state(TASK_RUNNING);
addff1feb02b03 Steven Rostedt           2014-10-08  1183  
60a11774b38fef Steven Rostedt           2008-05-12  1184  	return 0;
60a11774b38fef Steven Rostedt           2008-05-12  1185  }
60a11774b38fef Steven Rostedt           2008-05-12  1186  int
60a11774b38fef Steven Rostedt           2008-05-12  1187  trace_selftest_startup_wakeup(struct tracer *trace, struct trace_array *tr)
60a11774b38fef Steven Rostedt           2008-05-12  1188  {
6d9b3fa5e7f663 Steven Rostedt (Red Hat  2014-01-14  1189) 	unsigned long save_max = tr->max_latency;
60a11774b38fef Steven Rostedt           2008-05-12  1190  	struct task_struct *p;
addff1feb02b03 Steven Rostedt           2014-10-08  1191  	struct wakeup_test_data data;
60a11774b38fef Steven Rostedt           2008-05-12  1192  	unsigned long count;
60a11774b38fef Steven Rostedt           2008-05-12  1193  	int ret;
60a11774b38fef Steven Rostedt           2008-05-12  1194  
addff1feb02b03 Steven Rostedt           2014-10-08  1195  	memset(&data, 0, sizeof(data));
addff1feb02b03 Steven Rostedt           2014-10-08  1196  
addff1feb02b03 Steven Rostedt           2014-10-08  1197  	init_completion(&data.is_ready);
60a11774b38fef Steven Rostedt           2008-05-12  1198  
af6ace764d0390 Dario Faggioli           2013-11-07  1199  	/* create a -deadline thread */
addff1feb02b03 Steven Rostedt           2014-10-08  1200  	p = kthread_run(trace_wakeup_test_thread, &data, "ftrace-test");
c7aafc549766b8 Ingo Molnar              2008-05-12  1201  	if (IS_ERR(p)) {
60a11774b38fef Steven Rostedt           2008-05-12  1202  		printk(KERN_CONT "Failed to create ftrace wakeup test thread ");
60a11774b38fef Steven Rostedt           2008-05-12  1203  		return -1;
60a11774b38fef Steven Rostedt           2008-05-12  1204  	}
60a11774b38fef Steven Rostedt           2008-05-12  1205  
af6ace764d0390 Dario Faggioli           2013-11-07  1206  	/* make sure the thread is running at -deadline policy */
addff1feb02b03 Steven Rostedt           2014-10-08  1207  	wait_for_completion(&data.is_ready);
60a11774b38fef Steven Rostedt           2008-05-12  1208  
60a11774b38fef Steven Rostedt           2008-05-12  1209  	/* start the tracing */
b6f11df26fdc28 Arnaldo Carvalho de Melo 2009-02-05  1210  	ret = tracer_init(trace, tr);
1c80025a49855b Frederic Weisbecker      2008-11-16  1211  	if (ret) {
1c80025a49855b Frederic Weisbecker      2008-11-16  1212  		warn_failed_init_tracer(trace, ret);
1c80025a49855b Frederic Weisbecker      2008-11-16  1213  		return ret;
1c80025a49855b Frederic Weisbecker      2008-11-16  1214  	}
1c80025a49855b Frederic Weisbecker      2008-11-16  1215  
60a11774b38fef Steven Rostedt           2008-05-12  1216  	/* reset the max latency */
6d9b3fa5e7f663 Steven Rostedt (Red Hat  2014-01-14  1217) 	tr->max_latency = 0;
60a11774b38fef Steven Rostedt           2008-05-12  1218  
3c18c10bde65b6 Steven Rostedt           2012-07-31  1219  	while (p->on_rq) {
60a11774b38fef Steven Rostedt           2008-05-12  1220  		/*
af6ace764d0390 Dario Faggioli           2013-11-07  1221  		 * Sleep to make sure the -deadline thread is asleep too.
3c18c10bde65b6 Steven Rostedt           2012-07-31  1222  		 * On virtual machines we can't rely on timings,
3c18c10bde65b6 Steven Rostedt           2012-07-31  1223  		 * but we want to make sure this test still works.
60a11774b38fef Steven Rostedt           2008-05-12  1224  		 */
3c18c10bde65b6 Steven Rostedt           2012-07-31  1225  		msleep(100);
3c18c10bde65b6 Steven Rostedt           2012-07-31  1226  	}
3c18c10bde65b6 Steven Rostedt           2012-07-31  1227  
addff1feb02b03 Steven Rostedt           2014-10-08  1228  	init_completion(&data.is_ready);
addff1feb02b03 Steven Rostedt           2014-10-08  1229  
addff1feb02b03 Steven Rostedt           2014-10-08  1230  	data.go = 1;
addff1feb02b03 Steven Rostedt           2014-10-08  1231  	/* memory barrier is in the wake_up_process() */
60a11774b38fef Steven Rostedt           2008-05-12  1232  
60a11774b38fef Steven Rostedt           2008-05-12  1233  	wake_up_process(p);
60a11774b38fef Steven Rostedt           2008-05-12  1234  
3c18c10bde65b6 Steven Rostedt           2012-07-31  1235  	/* Wait for the task to wake up */
addff1feb02b03 Steven Rostedt           2014-10-08  1236  	wait_for_completion(&data.is_ready);
5aa60c60734568 Steven Rostedt           2008-09-29  1237  
60a11774b38fef Steven Rostedt           2008-05-12  1238  	/* stop the tracing. */
bbf5b1a0cecb56 Steven Rostedt           2008-11-07  1239  	tracing_stop();
60a11774b38fef Steven Rostedt           2008-05-12  1240  	/* check both trace buffers */
1c5eb4481e0151 Steven Rostedt (VMware   2020-01-09  1241) 	ret = trace_test_buffer(&tr->array_buffer, NULL);
60a11774b38fef Steven Rostedt           2008-05-12  1242  	if (!ret)
12883efb670c28 Steven Rostedt (Red Hat  2013-03-05  1243) 		ret = trace_test_buffer(&tr->max_buffer, &count);
60a11774b38fef Steven Rostedt           2008-05-12  1244  
60a11774b38fef Steven Rostedt           2008-05-12  1245  
60a11774b38fef Steven Rostedt           2008-05-12  1246  	trace->reset(tr);
bbf5b1a0cecb56 Steven Rostedt           2008-11-07  1247  	tracing_start();
60a11774b38fef Steven Rostedt           2008-05-12  1248  
6d9b3fa5e7f663 Steven Rostedt (Red Hat  2014-01-14  1249) 	tr->max_latency = save_max;
60a11774b38fef Steven Rostedt           2008-05-12  1250  
60a11774b38fef Steven Rostedt           2008-05-12  1251  	/* kill the thread */
60a11774b38fef Steven Rostedt           2008-05-12  1252  	kthread_stop(p);
60a11774b38fef Steven Rostedt           2008-05-12  1253  
60a11774b38fef Steven Rostedt           2008-05-12  1254  	if (!ret && !count) {
60a11774b38fef Steven Rostedt           2008-05-12  1255  		printk(KERN_CONT ".. no entries found ..");
60a11774b38fef Steven Rostedt           2008-05-12  1256  		ret = -1;
60a11774b38fef Steven Rostedt           2008-05-12  1257  	}
60a11774b38fef Steven Rostedt           2008-05-12  1258  
60a11774b38fef Steven Rostedt           2008-05-12  1259  	return ret;
60a11774b38fef Steven Rostedt           2008-05-12  1260  }
60a11774b38fef Steven Rostedt           2008-05-12  1261  #endif /* CONFIG_SCHED_TRACER */
60a11774b38fef Steven Rostedt           2008-05-12  1262  

:::::: The code at line 1160 was first introduced by commit
:::::: af6ace764d03900524e9b1ac621a1c520ee49fc6 sched/deadline: Add latency tracing for SCHED_DEADLINE tasks

:::::: TO: Dario Faggioli <raistlin@linux.it>
:::::: CC: Ingo Molnar <mingo@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
