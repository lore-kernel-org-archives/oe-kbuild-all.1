Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3652914A9D
	for <oe-kbuild-all@lists.linux.dev>; Thu, 17 Aug 2023 14:09:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692281383; x=1723817383;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GoYoKTB1TccF6Tj9kTrUciaaH62dB5FNKc/6ToAJ7K8=;
  b=C+gU9mK3BZkj2sFlIdhk6hXza76983gug5/gA+Si73D7QHWI6ccuXet6
   J2CIN5psPab6xQp3YeueDAhuaVNvjyr5iPi0q1p3/NIqS4Ech2TGxAYBw
   tV00kDr05AxAJ+s7DeHVehqGe8EQm5gtXF5oUd/lvch1B0GvEgikpwhj6
   8nx6tmChme1aSEh8+S2AIqJRBh48+FuricqaTvDsUeaeD1VF0vVm4qH3v
   MF2AoSmvySj7AHCboHIOXioC1M1whyGFGljMPq0ms3VbAbn8OZ50dqztF
   jVcRT/Bkl05GYI4KuP9rU/lOxf/7Ke/4rByukdPnGjoErhRxsDqC/Yl45
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10805"; a="372812864"
X-IronPort-AV: E=Sophos;i="6.01,180,1684825200"; 
   d="scan'208";a="372812864"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2023 07:09:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10805"; a="800053343"
X-IronPort-AV: E=Sophos;i="6.01,180,1684825200"; 
   d="scan'208";a="800053343"
Received: from lkp-server02.sh.intel.com (HELO a9caf1a0cf30) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 17 Aug 2023 07:09:17 -0700
Received: from kbuild by a9caf1a0cf30 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qWdeU-0001CN-0p;
	Thu, 17 Aug 2023 14:07:22 +0000
Date: Thu, 17 Aug 2023 22:00:41 +0800
From: kernel test robot <lkp@intel.com>
To: Gregory Greenman <gregory.greenman@intel.com>,
	Golan Ben Ami <golan.ben.ami@intel.com>,
	Michael Golant <michael.golant@intel.com>,
	Johannes Berg <johannes.berg@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: kernel/events/core.c:11620: warning: Function parameter or member
 'flags' not described in 'ksys_perf_event_open'
Message-ID: <202308172107.L893kjMS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/chromeos.git chromeos-5.10__release/core59-42
head:   e3fe4ac2447d89b8dca61663851e12d2f1247b56
commit: 973ecfea91914178c11cfb757e1bc29869a95f7f CHROMIUM: alt-syscall: Make required syscalls available for use
date:   2 years, 8 months ago
config: i386-randconfig-r015-20230817 (https://download.01.org/0day-ci/archive/20230817/202308172107.L893kjMS-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230817/202308172107.L893kjMS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308172107.L893kjMS-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/events/core.c:140: warning: Function parameter or member 'cpu' not described in 'cpu_function_call'
>> kernel/events/core.c:11620: warning: Function parameter or member 'flags' not described in 'ksys_perf_event_open'
   kernel/events/core.c:12085: warning: Function parameter or member 'overflow_handler' not described in 'perf_event_create_kernel_counter'
   kernel/events/core.c:12085: warning: Function parameter or member 'context' not described in 'perf_event_create_kernel_counter'


vim +11620 kernel/events/core.c

321027c1fe77f8 kernel/events/core.c  Peter Zijlstra          2017-01-11  11609  
0793a61d4df8da kernel/perf_counter.c Thomas Gleixner         2008-12-04  11610  /**
cdd6c482c9ff9c kernel/perf_event.c   Ingo Molnar             2009-09-21  11611   * sys_perf_event_open - open a performance event, associate it to a task/cpu
9f66a3810fe0d4 kernel/perf_counter.c Ingo Molnar             2008-12-10  11612   *
cdd6c482c9ff9c kernel/perf_event.c   Ingo Molnar             2009-09-21  11613   * @attr_uptr:	event_id type attributes for monitoring/sampling
0793a61d4df8da kernel/perf_counter.c Thomas Gleixner         2008-12-04  11614   * @pid:		target pid
9f66a3810fe0d4 kernel/perf_counter.c Ingo Molnar             2008-12-10  11615   * @cpu:		target cpu
cdd6c482c9ff9c kernel/perf_event.c   Ingo Molnar             2009-09-21  11616   * @group_fd:		group leader event fd
0793a61d4df8da kernel/perf_counter.c Thomas Gleixner         2008-12-04  11617   */
973ecfea919141 kernel/events/core.c  Guenter Roeck           2018-09-21  11618  int ksys_perf_event_open(struct perf_event_attr __user * attr_uptr, pid_t pid,
973ecfea919141 kernel/events/core.c  Guenter Roeck           2018-09-21  11619  			 int cpu, int group_fd, unsigned long flags)
0793a61d4df8da kernel/perf_counter.c Thomas Gleixner         2008-12-04 @11620  {
b04243ef7006cd kernel/perf_event.c   Peter Zijlstra          2010-09-17  11621  	struct perf_event *group_leader = NULL, *output_event = NULL;
b04243ef7006cd kernel/perf_event.c   Peter Zijlstra          2010-09-17  11622  	struct perf_event *event, *sibling;
cdd6c482c9ff9c kernel/perf_event.c   Ingo Molnar             2009-09-21  11623  	struct perf_event_attr attr;
3f649ab728cda8 kernel/events/core.c  Kees Cook               2020-06-03  11624  	struct perf_event_context *ctx, *gctx;
cdd6c482c9ff9c kernel/perf_event.c   Ingo Molnar             2009-09-21  11625  	struct file *event_file = NULL;
2903ff019b346a kernel/events/core.c  Al Viro                 2012-08-28  11626  	struct fd group = {NULL, 0};
38a81da2205f94 kernel/perf_event.c   Matt Helsley            2010-09-13  11627  	struct task_struct *task = NULL;
89a1e18731959e kernel/perf_event.c   Peter Zijlstra          2010-09-07  11628  	struct pmu *pmu;
ea635c64e00706 kernel/perf_event.c   Al Viro                 2010-05-26  11629  	int event_fd;
b04243ef7006cd kernel/perf_event.c   Peter Zijlstra          2010-09-17  11630  	int move_group = 0;
dc86cabe4b2424 kernel/perf_counter.c Ingo Molnar             2009-09-03  11631  	int err;
a21b0b354d4ac3 kernel/events/core.c  Yann Droneaud           2014-01-05  11632  	int f_flags = O_RDWR;
79dff51e900fd2 kernel/events/core.c  Matt Fleming            2015-01-23  11633  	int cgroup_fd = -1;
0793a61d4df8da kernel/perf_counter.c Thomas Gleixner         2008-12-04  11634  
2743a5b0fa6f30 kernel/perf_counter.c Paul Mackerras          2009-03-04  11635  	/* for future expandability... */
e5d1367f17ba6a kernel/perf_event.c   Stephane Eranian        2011-02-14  11636  	if (flags & ~PERF_FLAG_ALL)
2743a5b0fa6f30 kernel/perf_counter.c Paul Mackerras          2009-03-04  11637  		return -EINVAL;
2743a5b0fa6f30 kernel/perf_counter.c Paul Mackerras          2009-03-04  11638  
da97e18458fb42 kernel/events/core.c  Joel Fernandes (Google  2019-10-14  11639) 	/* Do we allow access to perf_event_open(2) ? */
da97e18458fb42 kernel/events/core.c  Joel Fernandes (Google  2019-10-14  11640) 	err = security_perf_event_open(&attr, PERF_SECURITY_OPEN);
da97e18458fb42 kernel/events/core.c  Joel Fernandes (Google  2019-10-14  11641) 	if (err)
da97e18458fb42 kernel/events/core.c  Joel Fernandes (Google  2019-10-14  11642) 		return err;
da97e18458fb42 kernel/events/core.c  Joel Fernandes (Google  2019-10-14  11643) 
dc86cabe4b2424 kernel/perf_counter.c Ingo Molnar             2009-09-03  11644  	err = perf_copy_attr(attr_uptr, &attr);
dc86cabe4b2424 kernel/perf_counter.c Ingo Molnar             2009-09-03  11645  	if (err)
dc86cabe4b2424 kernel/perf_counter.c Ingo Molnar             2009-09-03  11646  		return err;
eab656ae04b9d3 kernel/perf_counter.c Thomas Gleixner         2008-12-08  11647  
0764771dab80d7 kernel/perf_counter.c Peter Zijlstra          2009-06-11  11648  	if (!attr.exclude_kernel) {
da97e18458fb42 kernel/events/core.c  Joel Fernandes (Google  2019-10-14  11649) 		err = perf_allow_kernel(&attr);
da97e18458fb42 kernel/events/core.c  Joel Fernandes (Google  2019-10-14  11650) 		if (err)
da97e18458fb42 kernel/events/core.c  Joel Fernandes (Google  2019-10-14  11651) 			return err;
0764771dab80d7 kernel/perf_counter.c Peter Zijlstra          2009-06-11  11652  	}
0764771dab80d7 kernel/perf_counter.c Peter Zijlstra          2009-06-11  11653  
e422267322cd31 kernel/events/core.c  Hari Bathini            2017-03-08  11654  	if (attr.namespaces) {
18aa18566218d4 kernel/events/core.c  Alexey Budankov         2020-04-02  11655  		if (!perfmon_capable())
e422267322cd31 kernel/events/core.c  Hari Bathini            2017-03-08  11656  			return -EACCES;
e422267322cd31 kernel/events/core.c  Hari Bathini            2017-03-08  11657  	}
e422267322cd31 kernel/events/core.c  Hari Bathini            2017-03-08  11658  
df58ab24bf26b1 kernel/perf_counter.c Peter Zijlstra          2009-06-11  11659  	if (attr.freq) {
cdd6c482c9ff9c kernel/perf_event.c   Ingo Molnar             2009-09-21  11660  		if (attr.sample_freq > sysctl_perf_event_sample_rate)
df58ab24bf26b1 kernel/perf_counter.c Peter Zijlstra          2009-06-11  11661  			return -EINVAL;
0819b2e30ccb93 kernel/events/core.c  Peter Zijlstra          2014-05-15  11662  	} else {
0819b2e30ccb93 kernel/events/core.c  Peter Zijlstra          2014-05-15  11663  		if (attr.sample_period & (1ULL << 63))
0819b2e30ccb93 kernel/events/core.c  Peter Zijlstra          2014-05-15  11664  			return -EINVAL;
df58ab24bf26b1 kernel/perf_counter.c Peter Zijlstra          2009-06-11  11665  	}
df58ab24bf26b1 kernel/perf_counter.c Peter Zijlstra          2009-06-11  11666  
fc7ce9c74c3ad2 kernel/events/core.c  Kan Liang               2017-08-28  11667  	/* Only privileged users can get physical addresses */
da97e18458fb42 kernel/events/core.c  Joel Fernandes (Google  2019-10-14  11668) 	if ((attr.sample_type & PERF_SAMPLE_PHYS_ADDR)) {
da97e18458fb42 kernel/events/core.c  Joel Fernandes (Google  2019-10-14  11669) 		err = perf_allow_kernel(&attr);
da97e18458fb42 kernel/events/core.c  Joel Fernandes (Google  2019-10-14  11670) 		if (err)
da97e18458fb42 kernel/events/core.c  Joel Fernandes (Google  2019-10-14  11671) 			return err;
da97e18458fb42 kernel/events/core.c  Joel Fernandes (Google  2019-10-14  11672) 	}
fc7ce9c74c3ad2 kernel/events/core.c  Kan Liang               2017-08-28  11673  
b0c8fdc7fdb775 kernel/events/core.c  David Howells           2019-08-19  11674  	err = security_locked_down(LOCKDOWN_PERF);
b0c8fdc7fdb775 kernel/events/core.c  David Howells           2019-08-19  11675  	if (err && (attr.sample_type & PERF_SAMPLE_REGS_INTR))
b0c8fdc7fdb775 kernel/events/core.c  David Howells           2019-08-19  11676  		/* REGS_INTR can leak data, lockdown must prevent this */
b0c8fdc7fdb775 kernel/events/core.c  David Howells           2019-08-19  11677  		return err;
b0c8fdc7fdb775 kernel/events/core.c  David Howells           2019-08-19  11678  
b0c8fdc7fdb775 kernel/events/core.c  David Howells           2019-08-19  11679  	err = 0;
b0c8fdc7fdb775 kernel/events/core.c  David Howells           2019-08-19  11680  
e5d1367f17ba6a kernel/perf_event.c   Stephane Eranian        2011-02-14  11681  	/*
e5d1367f17ba6a kernel/perf_event.c   Stephane Eranian        2011-02-14  11682  	 * In cgroup mode, the pid argument is used to pass the fd
e5d1367f17ba6a kernel/perf_event.c   Stephane Eranian        2011-02-14  11683  	 * opened to the cgroup directory in cgroupfs. The cpu argument
e5d1367f17ba6a kernel/perf_event.c   Stephane Eranian        2011-02-14  11684  	 * designates the cpu on which to monitor threads from that
e5d1367f17ba6a kernel/perf_event.c   Stephane Eranian        2011-02-14  11685  	 * cgroup.
e5d1367f17ba6a kernel/perf_event.c   Stephane Eranian        2011-02-14  11686  	 */
e5d1367f17ba6a kernel/perf_event.c   Stephane Eranian        2011-02-14  11687  	if ((flags & PERF_FLAG_PID_CGROUP) && (pid == -1 || cpu == -1))
e5d1367f17ba6a kernel/perf_event.c   Stephane Eranian        2011-02-14  11688  		return -EINVAL;
e5d1367f17ba6a kernel/perf_event.c   Stephane Eranian        2011-02-14  11689  
a21b0b354d4ac3 kernel/events/core.c  Yann Droneaud           2014-01-05  11690  	if (flags & PERF_FLAG_FD_CLOEXEC)
a21b0b354d4ac3 kernel/events/core.c  Yann Droneaud           2014-01-05  11691  		f_flags |= O_CLOEXEC;
a21b0b354d4ac3 kernel/events/core.c  Yann Droneaud           2014-01-05  11692  
a21b0b354d4ac3 kernel/events/core.c  Yann Droneaud           2014-01-05  11693  	event_fd = get_unused_fd_flags(f_flags);
ea635c64e00706 kernel/perf_event.c   Al Viro                 2010-05-26  11694  	if (event_fd < 0)
ea635c64e00706 kernel/perf_event.c   Al Viro                 2010-05-26  11695  		return event_fd;
ea635c64e00706 kernel/perf_event.c   Al Viro                 2010-05-26  11696  
ac9721f3f54b27 kernel/perf_event.c   Peter Zijlstra          2010-05-27  11697  	if (group_fd != -1) {
2903ff019b346a kernel/events/core.c  Al Viro                 2012-08-28  11698  		err = perf_fget_light(group_fd, &group);
2903ff019b346a kernel/events/core.c  Al Viro                 2012-08-28  11699  		if (err)
d14b12d7adbf21 kernel/perf_event.c   Stephane Eranian        2010-09-17  11700  			goto err_fd;
2903ff019b346a kernel/events/core.c  Al Viro                 2012-08-28  11701  		group_leader = group.file->private_data;
ac9721f3f54b27 kernel/perf_event.c   Peter Zijlstra          2010-05-27  11702  		if (flags & PERF_FLAG_FD_OUTPUT)
ac9721f3f54b27 kernel/perf_event.c   Peter Zijlstra          2010-05-27  11703  			output_event = group_leader;
ac9721f3f54b27 kernel/perf_event.c   Peter Zijlstra          2010-05-27  11704  		if (flags & PERF_FLAG_FD_NO_GROUP)
ac9721f3f54b27 kernel/perf_event.c   Peter Zijlstra          2010-05-27  11705  			group_leader = NULL;
ac9721f3f54b27 kernel/perf_event.c   Peter Zijlstra          2010-05-27  11706  	}
ac9721f3f54b27 kernel/perf_event.c   Peter Zijlstra          2010-05-27  11707  
e5d1367f17ba6a kernel/perf_event.c   Stephane Eranian        2011-02-14  11708  	if (pid != -1 && !(flags & PERF_FLAG_PID_CGROUP)) {
c6be5a5cb62592 kernel/perf_event.c   Peter Zijlstra          2010-10-14  11709  		task = find_lively_task_by_vpid(pid);
c6be5a5cb62592 kernel/perf_event.c   Peter Zijlstra          2010-10-14  11710  		if (IS_ERR(task)) {
c6be5a5cb62592 kernel/perf_event.c   Peter Zijlstra          2010-10-14  11711  			err = PTR_ERR(task);
c6be5a5cb62592 kernel/perf_event.c   Peter Zijlstra          2010-10-14  11712  			goto err_group_fd;
c6be5a5cb62592 kernel/perf_event.c   Peter Zijlstra          2010-10-14  11713  		}
c6be5a5cb62592 kernel/perf_event.c   Peter Zijlstra          2010-10-14  11714  	}
c6be5a5cb62592 kernel/perf_event.c   Peter Zijlstra          2010-10-14  11715  
1f4ee5038f0c1e kernel/events/core.c  Peter Zijlstra          2014-05-06  11716  	if (task && group_leader &&
1f4ee5038f0c1e kernel/events/core.c  Peter Zijlstra          2014-05-06  11717  	    group_leader->attr.inherit != attr.inherit) {
1f4ee5038f0c1e kernel/events/core.c  Peter Zijlstra          2014-05-06  11718  		err = -EINVAL;
1f4ee5038f0c1e kernel/events/core.c  Peter Zijlstra          2014-05-06  11719  		goto err_task;
1f4ee5038f0c1e kernel/events/core.c  Peter Zijlstra          2014-05-06  11720  	}
1f4ee5038f0c1e kernel/events/core.c  Peter Zijlstra          2014-05-06  11721  
79c9ce57eb2d5f kernel/events/core.c  Peter Zijlstra          2016-04-26  11722  	if (task) {
6914303824bb57 kernel/events/core.c  Bernd Edlinger          2020-03-20  11723  		err = mutex_lock_interruptible(&task->signal->exec_update_mutex);
79c9ce57eb2d5f kernel/events/core.c  Peter Zijlstra          2016-04-26  11724  		if (err)
e5aeee51f6b4fb kernel/events/core.c  Alexander Levin         2017-06-03  11725  			goto err_task;
79c9ce57eb2d5f kernel/events/core.c  Peter Zijlstra          2016-04-26  11726  
79c9ce57eb2d5f kernel/events/core.c  Peter Zijlstra          2016-04-26  11727  		/*
45fd22da97c612 kernel/events/core.c  Alexey Budankov         2020-08-05  11728  		 * Preserve ptrace permission check for backwards compatibility.
79c9ce57eb2d5f kernel/events/core.c  Peter Zijlstra          2016-04-26  11729  		 *
6914303824bb57 kernel/events/core.c  Bernd Edlinger          2020-03-20  11730  		 * We must hold exec_update_mutex across this and any potential
79c9ce57eb2d5f kernel/events/core.c  Peter Zijlstra          2016-04-26  11731  		 * perf_install_in_context() call for this new event to
79c9ce57eb2d5f kernel/events/core.c  Peter Zijlstra          2016-04-26  11732  		 * serialize against exec() altering our credentials (and the
79c9ce57eb2d5f kernel/events/core.c  Peter Zijlstra          2016-04-26  11733  		 * perf_event_exit_task() that could imply).
79c9ce57eb2d5f kernel/events/core.c  Peter Zijlstra          2016-04-26  11734  		 */
79c9ce57eb2d5f kernel/events/core.c  Peter Zijlstra          2016-04-26  11735  		err = -EACCES;
45fd22da97c612 kernel/events/core.c  Alexey Budankov         2020-08-05  11736  		if (!perfmon_capable() && !ptrace_may_access(task, PTRACE_MODE_READ_REALCREDS))
79c9ce57eb2d5f kernel/events/core.c  Peter Zijlstra          2016-04-26  11737  			goto err_cred;
79c9ce57eb2d5f kernel/events/core.c  Peter Zijlstra          2016-04-26  11738  	}
79c9ce57eb2d5f kernel/events/core.c  Peter Zijlstra          2016-04-26  11739  
79dff51e900fd2 kernel/events/core.c  Matt Fleming            2015-01-23  11740  	if (flags & PERF_FLAG_PID_CGROUP)
79dff51e900fd2 kernel/events/core.c  Matt Fleming            2015-01-23  11741  		cgroup_fd = pid;
79dff51e900fd2 kernel/events/core.c  Matt Fleming            2015-01-23  11742  
4dc0da86967d54 kernel/events/core.c  Avi Kivity              2011-06-29  11743  	event = perf_event_alloc(&attr, cpu, task, group_leader, NULL,
79dff51e900fd2 kernel/events/core.c  Matt Fleming            2015-01-23  11744  				 NULL, NULL, cgroup_fd);
d14b12d7adbf21 kernel/perf_event.c   Stephane Eranian        2010-09-17  11745  	if (IS_ERR(event)) {
d14b12d7adbf21 kernel/perf_event.c   Stephane Eranian        2010-09-17  11746  		err = PTR_ERR(event);
79c9ce57eb2d5f kernel/events/core.c  Peter Zijlstra          2016-04-26  11747  		goto err_cred;
d14b12d7adbf21 kernel/perf_event.c   Stephane Eranian        2010-09-17  11748  	}
d14b12d7adbf21 kernel/perf_event.c   Stephane Eranian        2010-09-17  11749  
53b25335dd6098 kernel/events/core.c  Vince Weaver            2014-05-16  11750  	if (is_sampling_event(event)) {
53b25335dd6098 kernel/events/core.c  Vince Weaver            2014-05-16  11751  		if (event->pmu->capabilities & PERF_PMU_CAP_NO_INTERRUPT) {
a1396555abff9f kernel/events/core.c  Vineet Gupta            2016-05-09  11752  			err = -EOPNOTSUPP;
53b25335dd6098 kernel/events/core.c  Vince Weaver            2014-05-16  11753  			goto err_alloc;
53b25335dd6098 kernel/events/core.c  Vince Weaver            2014-05-16  11754  		}
53b25335dd6098 kernel/events/core.c  Vince Weaver            2014-05-16  11755  	}
53b25335dd6098 kernel/events/core.c  Vince Weaver            2014-05-16  11756  
89a1e18731959e kernel/perf_event.c   Peter Zijlstra          2010-09-07  11757  	/*
89a1e18731959e kernel/perf_event.c   Peter Zijlstra          2010-09-07  11758  	 * Special case software events and allow them to be part of
89a1e18731959e kernel/perf_event.c   Peter Zijlstra          2010-09-07  11759  	 * any hardware group.
89a1e18731959e kernel/perf_event.c   Peter Zijlstra          2010-09-07  11760  	 */
89a1e18731959e kernel/perf_event.c   Peter Zijlstra          2010-09-07  11761  	pmu = event->pmu;
b04243ef7006cd kernel/perf_event.c   Peter Zijlstra          2010-09-17  11762  
34f439278cef7b kernel/events/core.c  Peter Zijlstra          2015-02-20  11763  	if (attr.use_clockid) {
34f439278cef7b kernel/events/core.c  Peter Zijlstra          2015-02-20  11764  		err = perf_event_set_clock(event, attr.clockid);
34f439278cef7b kernel/events/core.c  Peter Zijlstra          2015-02-20  11765  		if (err)
34f439278cef7b kernel/events/core.c  Peter Zijlstra          2015-02-20  11766  			goto err_alloc;
34f439278cef7b kernel/events/core.c  Peter Zijlstra          2015-02-20  11767  	}
34f439278cef7b kernel/events/core.c  Peter Zijlstra          2015-02-20  11768  
4ff6a8debf48a7 kernel/events/core.c  David Carrillo-Cisneros 2016-08-17  11769  	if (pmu->task_ctx_nr == perf_sw_context)
4ff6a8debf48a7 kernel/events/core.c  David Carrillo-Cisneros 2016-08-17  11770  		event->event_caps |= PERF_EV_CAP_SOFTWARE;
4ff6a8debf48a7 kernel/events/core.c  David Carrillo-Cisneros 2016-08-17  11771  
a1150c202207cc kernel/events/core.c  Song Liu                2018-05-03  11772  	if (group_leader) {
a1150c202207cc kernel/events/core.c  Song Liu                2018-05-03  11773  		if (is_software_event(event) &&
a1150c202207cc kernel/events/core.c  Song Liu                2018-05-03  11774  		    !in_software_context(group_leader)) {
b04243ef7006cd kernel/perf_event.c   Peter Zijlstra          2010-09-17  11775  			/*
a1150c202207cc kernel/events/core.c  Song Liu                2018-05-03  11776  			 * If the event is a sw event, but the group_leader
a1150c202207cc kernel/events/core.c  Song Liu                2018-05-03  11777  			 * is on hw context.
b04243ef7006cd kernel/perf_event.c   Peter Zijlstra          2010-09-17  11778  			 *
a1150c202207cc kernel/events/core.c  Song Liu                2018-05-03  11779  			 * Allow the addition of software events to hw
a1150c202207cc kernel/events/core.c  Song Liu                2018-05-03  11780  			 * groups, this is safe because software events
a1150c202207cc kernel/events/core.c  Song Liu                2018-05-03  11781  			 * never fail to schedule.
b04243ef7006cd kernel/perf_event.c   Peter Zijlstra          2010-09-17  11782  			 */
a1150c202207cc kernel/events/core.c  Song Liu                2018-05-03  11783  			pmu = group_leader->ctx->pmu;
a1150c202207cc kernel/events/core.c  Song Liu                2018-05-03  11784  		} else if (!is_software_event(event) &&
a1150c202207cc kernel/events/core.c  Song Liu                2018-05-03  11785  			   is_software_event(group_leader) &&
4ff6a8debf48a7 kernel/events/core.c  David Carrillo-Cisneros 2016-08-17  11786  			   (group_leader->group_caps & PERF_EV_CAP_SOFTWARE)) {
b04243ef7006cd kernel/perf_event.c   Peter Zijlstra          2010-09-17  11787  			/*
b04243ef7006cd kernel/perf_event.c   Peter Zijlstra          2010-09-17  11788  			 * In case the group is a pure software group, and we
b04243ef7006cd kernel/perf_event.c   Peter Zijlstra          2010-09-17  11789  			 * try to add a hardware event, move the whole group to
b04243ef7006cd kernel/perf_event.c   Peter Zijlstra          2010-09-17  11790  			 * the hardware context.
b04243ef7006cd kernel/perf_event.c   Peter Zijlstra          2010-09-17  11791  			 */
b04243ef7006cd kernel/perf_event.c   Peter Zijlstra          2010-09-17  11792  			move_group = 1;
b04243ef7006cd kernel/perf_event.c   Peter Zijlstra          2010-09-17  11793  		}
b04243ef7006cd kernel/perf_event.c   Peter Zijlstra          2010-09-17  11794  	}
89a1e18731959e kernel/perf_event.c   Peter Zijlstra          2010-09-07  11795  
89a1e18731959e kernel/perf_event.c   Peter Zijlstra          2010-09-07  11796  	/*
89a1e18731959e kernel/perf_event.c   Peter Zijlstra          2010-09-07  11797  	 * Get the target context (task or percpu):
89a1e18731959e kernel/perf_event.c   Peter Zijlstra          2010-09-07  11798  	 */
4af57ef28c2c10 kernel/events/core.c  Yan, Zheng              2014-11-04  11799  	ctx = find_get_context(pmu, task, event);
89a1e18731959e kernel/perf_event.c   Peter Zijlstra          2010-09-07  11800  	if (IS_ERR(ctx)) {
89a1e18731959e kernel/perf_event.c   Peter Zijlstra          2010-09-07  11801  		err = PTR_ERR(ctx);
c6be5a5cb62592 kernel/perf_event.c   Peter Zijlstra          2010-10-14  11802  		goto err_alloc;
89a1e18731959e kernel/perf_event.c   Peter Zijlstra          2010-09-07  11803  	}
89a1e18731959e kernel/perf_event.c   Peter Zijlstra          2010-09-07  11804  
ccff286d85098b kernel/perf_counter.c Ingo Molnar             2008-12-11  11805  	/*
cdd6c482c9ff9c kernel/perf_event.c   Ingo Molnar             2009-09-21  11806  	 * Look up the group leader (we will attach this event to it):
04289bb9891882 kernel/perf_counter.c Ingo Molnar             2008-12-11  11807  	 */
ac9721f3f54b27 kernel/perf_event.c   Peter Zijlstra          2010-05-27  11808  	if (group_leader) {
dc86cabe4b2424 kernel/perf_counter.c Ingo Molnar             2009-09-03  11809  		err = -EINVAL;
04289bb9891882 kernel/perf_counter.c Ingo Molnar             2008-12-11  11810  
04289bb9891882 kernel/perf_counter.c Ingo Molnar             2008-12-11  11811  		/*
ccff286d85098b kernel/perf_counter.c Ingo Molnar             2008-12-11  11812  		 * Do not allow a recursive hierarchy (this new sibling
ccff286d85098b kernel/perf_counter.c Ingo Molnar             2008-12-11  11813  		 * becoming part of another group-sibling):
04289bb9891882 kernel/perf_counter.c Ingo Molnar             2008-12-11  11814  		 */
ccff286d85098b kernel/perf_counter.c Ingo Molnar             2008-12-11  11815  		if (group_leader->group_leader != group_leader)
c3f00c70276d8a kernel/perf_event.c   Peter Zijlstra          2010-08-18  11816  			goto err_context;
34f439278cef7b kernel/events/core.c  Peter Zijlstra          2015-02-20  11817  
34f439278cef7b kernel/events/core.c  Peter Zijlstra          2015-02-20  11818  		/* All events in a group should have the same clock */
34f439278cef7b kernel/events/core.c  Peter Zijlstra          2015-02-20  11819  		if (group_leader->clock != event->clock)
34f439278cef7b kernel/events/core.c  Peter Zijlstra          2015-02-20  11820  			goto err_context;
34f439278cef7b kernel/events/core.c  Peter Zijlstra          2015-02-20  11821  
04289bb9891882 kernel/perf_counter.c Ingo Molnar             2008-12-11  11822  		/*
64aee2a965cf29 kernel/events/core.c  Mark Rutland            2017-06-22  11823  		 * Make sure we're both events for the same CPU;
64aee2a965cf29 kernel/events/core.c  Mark Rutland            2017-06-22  11824  		 * grouping events for different CPUs is broken; since
64aee2a965cf29 kernel/events/core.c  Mark Rutland            2017-06-22  11825  		 * you can never concurrently schedule them anyhow.
04289bb9891882 kernel/perf_counter.c Ingo Molnar             2008-12-11  11826  		 */
64aee2a965cf29 kernel/events/core.c  Mark Rutland            2017-06-22  11827  		if (group_leader->cpu != event->cpu)
64aee2a965cf29 kernel/events/core.c  Mark Rutland            2017-06-22  11828  			goto err_context;
64aee2a965cf29 kernel/events/core.c  Mark Rutland            2017-06-22  11829  
c3c87e770458aa kernel/events/core.c  Peter Zijlstra          2015-01-23  11830  		/*
c3c87e770458aa kernel/events/core.c  Peter Zijlstra          2015-01-23  11831  		 * Make sure we're both on the same task, or both
64aee2a965cf29 kernel/events/core.c  Mark Rutland            2017-06-22  11832  		 * per-CPU events.
c3c87e770458aa kernel/events/core.c  Peter Zijlstra          2015-01-23  11833  		 */
c3c87e770458aa kernel/events/core.c  Peter Zijlstra          2015-01-23  11834  		if (group_leader->ctx->task != ctx->task)
c3c87e770458aa kernel/events/core.c  Peter Zijlstra          2015-01-23  11835  			goto err_context;
c3c87e770458aa kernel/events/core.c  Peter Zijlstra          2015-01-23  11836  
c3c87e770458aa kernel/events/core.c  Peter Zijlstra          2015-01-23  11837  		/*
64aee2a965cf29 kernel/events/core.c  Mark Rutland            2017-06-22  11838  		 * Do not allow to attach to a group in a different task
64aee2a965cf29 kernel/events/core.c  Mark Rutland            2017-06-22  11839  		 * or CPU context. If we're moving SW events, we'll fix
64aee2a965cf29 kernel/events/core.c  Mark Rutland            2017-06-22  11840  		 * this up later, so allow that.
c3c87e770458aa kernel/events/core.c  Peter Zijlstra          2015-01-23  11841  		 */
64aee2a965cf29 kernel/events/core.c  Mark Rutland            2017-06-22  11842  		if (!move_group && group_leader->ctx != ctx)
b04243ef7006cd kernel/perf_event.c   Peter Zijlstra          2010-09-17  11843  			goto err_context;
b04243ef7006cd kernel/perf_event.c   Peter Zijlstra          2010-09-17  11844  
3b6f9e5cb21964 kernel/perf_counter.c Paul Mackerras          2009-01-14  11845  		/*
3b6f9e5cb21964 kernel/perf_counter.c Paul Mackerras          2009-01-14  11846  		 * Only a group leader can be exclusive or pinned
3b6f9e5cb21964 kernel/perf_counter.c Paul Mackerras          2009-01-14  11847  		 */
0d48696f87e361 kernel/perf_counter.c Peter Zijlstra          2009-06-02  11848  		if (attr.exclusive || attr.pinned)
c3f00c70276d8a kernel/perf_event.c   Peter Zijlstra          2010-08-18  11849  			goto err_context;
ac9721f3f54b27 kernel/perf_event.c   Peter Zijlstra          2010-05-27  11850  	}
ac9721f3f54b27 kernel/perf_event.c   Peter Zijlstra          2010-05-27  11851  
ac9721f3f54b27 kernel/perf_event.c   Peter Zijlstra          2010-05-27  11852  	if (output_event) {
ac9721f3f54b27 kernel/perf_event.c   Peter Zijlstra          2010-05-27  11853  		err = perf_event_set_output(event, output_event);
ac9721f3f54b27 kernel/perf_event.c   Peter Zijlstra          2010-05-27  11854  		if (err)
c3f00c70276d8a kernel/perf_event.c   Peter Zijlstra          2010-08-18  11855  			goto err_context;
ac9721f3f54b27 kernel/perf_event.c   Peter Zijlstra          2010-05-27  11856  	}
0793a61d4df8da kernel/perf_counter.c Thomas Gleixner         2008-12-04  11857  
a21b0b354d4ac3 kernel/events/core.c  Yann Droneaud           2014-01-05  11858  	event_file = anon_inode_getfile("[perf_event]", &perf_fops, event,
a21b0b354d4ac3 kernel/events/core.c  Yann Droneaud           2014-01-05  11859  					f_flags);
ea635c64e00706 kernel/perf_event.c   Al Viro                 2010-05-26  11860  	if (IS_ERR(event_file)) {
ea635c64e00706 kernel/perf_event.c   Al Viro                 2010-05-26  11861  		err = PTR_ERR(event_file);
201c2f85bd0bc1 kernel/events/core.c  Alexander Shishkin      2016-03-21  11862  		event_file = NULL;
c3f00c70276d8a kernel/perf_event.c   Peter Zijlstra          2010-08-18  11863  		goto err_context;
ea635c64e00706 kernel/perf_event.c   Al Viro                 2010-05-26  11864  	}
9b51f66dcb09ac kernel/perf_counter.c Ingo Molnar             2008-12-12  11865  
b04243ef7006cd kernel/perf_event.c   Peter Zijlstra          2010-09-17  11866  	if (move_group) {
321027c1fe77f8 kernel/events/core.c  Peter Zijlstra          2017-01-11  11867  		gctx = __perf_event_ctx_lock_double(group_leader, ctx);
321027c1fe77f8 kernel/events/core.c  Peter Zijlstra          2017-01-11  11868  
84c4e620d35f49 kernel/events/core.c  Peter Zijlstra          2016-02-24  11869  		if (gctx->task == TASK_TOMBSTONE) {
84c4e620d35f49 kernel/events/core.c  Peter Zijlstra          2016-02-24  11870  			err = -ESRCH;
84c4e620d35f49 kernel/events/core.c  Peter Zijlstra          2016-02-24  11871  			goto err_locked;
84c4e620d35f49 kernel/events/core.c  Peter Zijlstra          2016-02-24  11872  		}
321027c1fe77f8 kernel/events/core.c  Peter Zijlstra          2017-01-11  11873  
321027c1fe77f8 kernel/events/core.c  Peter Zijlstra          2017-01-11  11874  		/*
321027c1fe77f8 kernel/events/core.c  Peter Zijlstra          2017-01-11  11875  		 * Check if we raced against another sys_perf_event_open() call
321027c1fe77f8 kernel/events/core.c  Peter Zijlstra          2017-01-11  11876  		 * moving the software group underneath us.
321027c1fe77f8 kernel/events/core.c  Peter Zijlstra          2017-01-11  11877  		 */
321027c1fe77f8 kernel/events/core.c  Peter Zijlstra          2017-01-11  11878  		if (!(group_leader->group_caps & PERF_EV_CAP_SOFTWARE)) {
321027c1fe77f8 kernel/events/core.c  Peter Zijlstra          2017-01-11  11879  			/*
321027c1fe77f8 kernel/events/core.c  Peter Zijlstra          2017-01-11  11880  			 * If someone moved the group out from under us, check
321027c1fe77f8 kernel/events/core.c  Peter Zijlstra          2017-01-11  11881  			 * if this new event wound up on the same ctx, if so
321027c1fe77f8 kernel/events/core.c  Peter Zijlstra          2017-01-11  11882  			 * its the regular !move_group case, otherwise fail.
321027c1fe77f8 kernel/events/core.c  Peter Zijlstra          2017-01-11  11883  			 */
321027c1fe77f8 kernel/events/core.c  Peter Zijlstra          2017-01-11  11884  			if (gctx != ctx) {
321027c1fe77f8 kernel/events/core.c  Peter Zijlstra          2017-01-11  11885  				err = -EINVAL;
321027c1fe77f8 kernel/events/core.c  Peter Zijlstra          2017-01-11  11886  				goto err_locked;
321027c1fe77f8 kernel/events/core.c  Peter Zijlstra          2017-01-11  11887  			} else {
321027c1fe77f8 kernel/events/core.c  Peter Zijlstra          2017-01-11  11888  				perf_event_ctx_unlock(group_leader, gctx);
321027c1fe77f8 kernel/events/core.c  Peter Zijlstra          2017-01-11  11889  				move_group = 0;
321027c1fe77f8 kernel/events/core.c  Peter Zijlstra          2017-01-11  11890  			}
321027c1fe77f8 kernel/events/core.c  Peter Zijlstra          2017-01-11  11891  		}
8a58ddae23796c kernel/events/core.c  Alexander Shishkin      2019-07-01  11892  
8a58ddae23796c kernel/events/core.c  Alexander Shishkin      2019-07-01  11893  		/*
8a58ddae23796c kernel/events/core.c  Alexander Shishkin      2019-07-01  11894  		 * Failure to create exclusive events returns -EBUSY.
8a58ddae23796c kernel/events/core.c  Alexander Shishkin      2019-07-01  11895  		 */
8a58ddae23796c kernel/events/core.c  Alexander Shishkin      2019-07-01  11896  		err = -EBUSY;
8a58ddae23796c kernel/events/core.c  Alexander Shishkin      2019-07-01  11897  		if (!exclusive_event_installable(group_leader, ctx))
8a58ddae23796c kernel/events/core.c  Alexander Shishkin      2019-07-01  11898  			goto err_locked;
8a58ddae23796c kernel/events/core.c  Alexander Shishkin      2019-07-01  11899  
8a58ddae23796c kernel/events/core.c  Alexander Shishkin      2019-07-01  11900  		for_each_sibling_event(sibling, group_leader) {
8a58ddae23796c kernel/events/core.c  Alexander Shishkin      2019-07-01  11901  			if (!exclusive_event_installable(sibling, ctx))
8a58ddae23796c kernel/events/core.c  Alexander Shishkin      2019-07-01  11902  				goto err_locked;
8a58ddae23796c kernel/events/core.c  Alexander Shishkin      2019-07-01  11903  		}
f55fc2a57cc9ca kernel/events/core.c  Peter Zijlstra          2015-09-09  11904  	} else {
f55fc2a57cc9ca kernel/events/core.c  Peter Zijlstra          2015-09-09  11905  		mutex_lock(&ctx->mutex);
f55fc2a57cc9ca kernel/events/core.c  Peter Zijlstra          2015-09-09  11906  	}
f63a8daa5812af kernel/events/core.c  Peter Zijlstra          2015-01-23  11907  
84c4e620d35f49 kernel/events/core.c  Peter Zijlstra          2016-02-24  11908  	if (ctx->task == TASK_TOMBSTONE) {
84c4e620d35f49 kernel/events/core.c  Peter Zijlstra          2016-02-24  11909  		err = -ESRCH;
84c4e620d35f49 kernel/events/core.c  Peter Zijlstra          2016-02-24  11910  		goto err_locked;
84c4e620d35f49 kernel/events/core.c  Peter Zijlstra          2016-02-24  11911  	}
84c4e620d35f49 kernel/events/core.c  Peter Zijlstra          2016-02-24  11912  
a723968c0ed36d kernel/events/core.c  Peter Zijlstra          2015-09-09  11913  	if (!perf_event_validate_size(event)) {
a723968c0ed36d kernel/events/core.c  Peter Zijlstra          2015-09-09  11914  		err = -E2BIG;
a723968c0ed36d kernel/events/core.c  Peter Zijlstra          2015-09-09  11915  		goto err_locked;
a723968c0ed36d kernel/events/core.c  Peter Zijlstra          2015-09-09  11916  	}
a723968c0ed36d kernel/events/core.c  Peter Zijlstra          2015-09-09  11917  
a63fbed776c712 kernel/events/core.c  Thomas Gleixner         2017-05-24  11918  	if (!task) {
a63fbed776c712 kernel/events/core.c  Thomas Gleixner         2017-05-24  11919  		/*
a63fbed776c712 kernel/events/core.c  Thomas Gleixner         2017-05-24  11920  		 * Check if the @cpu we're creating an event for is online.
a63fbed776c712 kernel/events/core.c  Thomas Gleixner         2017-05-24  11921  		 *
a63fbed776c712 kernel/events/core.c  Thomas Gleixner         2017-05-24  11922  		 * We use the perf_cpu_context::ctx::mutex to serialize against
a63fbed776c712 kernel/events/core.c  Thomas Gleixner         2017-05-24  11923  		 * the hotplug notifiers. See perf_event_{init,exit}_cpu().
a63fbed776c712 kernel/events/core.c  Thomas Gleixner         2017-05-24  11924  		 */
a63fbed776c712 kernel/events/core.c  Thomas Gleixner         2017-05-24  11925  		struct perf_cpu_context *cpuctx =
a63fbed776c712 kernel/events/core.c  Thomas Gleixner         2017-05-24  11926  			container_of(ctx, struct perf_cpu_context, ctx);
a63fbed776c712 kernel/events/core.c  Thomas Gleixner         2017-05-24  11927  
a63fbed776c712 kernel/events/core.c  Thomas Gleixner         2017-05-24  11928  		if (!cpuctx->online) {
a63fbed776c712 kernel/events/core.c  Thomas Gleixner         2017-05-24  11929  			err = -ENODEV;
a63fbed776c712 kernel/events/core.c  Thomas Gleixner         2017-05-24  11930  			goto err_locked;
a63fbed776c712 kernel/events/core.c  Thomas Gleixner         2017-05-24  11931  		}
a63fbed776c712 kernel/events/core.c  Thomas Gleixner         2017-05-24  11932  	}
a63fbed776c712 kernel/events/core.c  Thomas Gleixner         2017-05-24  11933  
da9ec3d3dd0f12 kernel/events/core.c  Mark Rutland            2020-01-06  11934  	if (perf_need_aux_event(event) && !perf_get_aux_event(event, group_leader)) {
da9ec3d3dd0f12 kernel/events/core.c  Mark Rutland            2020-01-06  11935  		err = -EINVAL;
ab43762ef01096 kernel/events/core.c  Alexander Shishkin      2019-08-06  11936  		goto err_locked;
da9ec3d3dd0f12 kernel/events/core.c  Mark Rutland            2020-01-06  11937  	}
a63fbed776c712 kernel/events/core.c  Thomas Gleixner         2017-05-24  11938  
f55fc2a57cc9ca kernel/events/core.c  Peter Zijlstra          2015-09-09  11939  	/*
f55fc2a57cc9ca kernel/events/core.c  Peter Zijlstra          2015-09-09  11940  	 * Must be under the same ctx::mutex as perf_install_in_context(),
f55fc2a57cc9ca kernel/events/core.c  Peter Zijlstra          2015-09-09  11941  	 * because we need to serialize with concurrent event creation.
f55fc2a57cc9ca kernel/events/core.c  Peter Zijlstra          2015-09-09  11942  	 */
f55fc2a57cc9ca kernel/events/core.c  Peter Zijlstra          2015-09-09  11943  	if (!exclusive_event_installable(event, ctx)) {
f55fc2a57cc9ca kernel/events/core.c  Peter Zijlstra          2015-09-09  11944  		err = -EBUSY;
f55fc2a57cc9ca kernel/events/core.c  Peter Zijlstra          2015-09-09  11945  		goto err_locked;
f55fc2a57cc9ca kernel/events/core.c  Peter Zijlstra          2015-09-09  11946  	}
f63a8daa5812af kernel/events/core.c  Peter Zijlstra          2015-01-23  11947  
f55fc2a57cc9ca kernel/events/core.c  Peter Zijlstra          2015-09-09  11948  	WARN_ON_ONCE(ctx->parent_ctx);
f55fc2a57cc9ca kernel/events/core.c  Peter Zijlstra          2015-09-09  11949  
79c9ce57eb2d5f kernel/events/core.c  Peter Zijlstra          2016-04-26  11950  	/*
79c9ce57eb2d5f kernel/events/core.c  Peter Zijlstra          2016-04-26  11951  	 * This is the point on no return; we cannot fail hereafter. This is
79c9ce57eb2d5f kernel/events/core.c  Peter Zijlstra          2016-04-26  11952  	 * where we start modifying current state.
79c9ce57eb2d5f kernel/events/core.c  Peter Zijlstra          2016-04-26  11953  	 */
79c9ce57eb2d5f kernel/events/core.c  Peter Zijlstra          2016-04-26  11954  
f55fc2a57cc9ca kernel/events/core.c  Peter Zijlstra          2015-09-09  11955  	if (move_group) {
f63a8daa5812af kernel/events/core.c  Peter Zijlstra          2015-01-23  11956  		/*
f63a8daa5812af kernel/events/core.c  Peter Zijlstra          2015-01-23  11957  		 * See perf_event_ctx_lock() for comments on the details
f63a8daa5812af kernel/events/core.c  Peter Zijlstra          2015-01-23  11958  		 * of swizzling perf_event::ctx.
f63a8daa5812af kernel/events/core.c  Peter Zijlstra          2015-01-23  11959  		 */
45a0e07abf4933 kernel/events/core.c  Peter Zijlstra          2016-01-26  11960  		perf_remove_from_context(group_leader, 0);
279b5165ffadf5 kernel/events/core.c  Peter Zijlstra          2017-02-16  11961  		put_ctx(gctx);
0231bb53367584 kernel/events/core.c  Jiri Olsa               2013-02-01  11962  
edb39592a5877b kernel/events/core.c  Peter Zijlstra          2018-03-15  11963  		for_each_sibling_event(sibling, group_leader) {
45a0e07abf4933 kernel/events/core.c  Peter Zijlstra          2016-01-26  11964  			perf_remove_from_context(sibling, 0);
b04243ef7006cd kernel/perf_event.c   Peter Zijlstra          2010-09-17  11965  			put_ctx(gctx);
b04243ef7006cd kernel/perf_event.c   Peter Zijlstra          2010-09-17  11966  		}
9b51f66dcb09ac kernel/perf_counter.c Ingo Molnar             2008-12-12  11967  
f63a8daa5812af kernel/events/core.c  Peter Zijlstra          2015-01-23  11968  		/*
f63a8daa5812af kernel/events/core.c  Peter Zijlstra          2015-01-23  11969  		 * Wait for everybody to stop referencing the events through
f63a8daa5812af kernel/events/core.c  Peter Zijlstra          2015-01-23  11970  		 * the old lists, before installing it on new lists.
f63a8daa5812af kernel/events/core.c  Peter Zijlstra          2015-01-23  11971  		 */
0cda4c023132aa kernel/events/core.c  Yan, Zheng              2012-06-15  11972  		synchronize_rcu();
f63a8daa5812af kernel/events/core.c  Peter Zijlstra          2015-01-23  11973  
8f95b435b62522 kernel/events/core.c  Peter Zijlstra (Intel   2015-01-27  11974) 		/*
8f95b435b62522 kernel/events/core.c  Peter Zijlstra (Intel   2015-01-27  11975) 		 * Install the group siblings before the group leader.
8f95b435b62522 kernel/events/core.c  Peter Zijlstra (Intel   2015-01-27  11976) 		 *
8f95b435b62522 kernel/events/core.c  Peter Zijlstra (Intel   2015-01-27  11977) 		 * Because a group leader will try and install the entire group
8f95b435b62522 kernel/events/core.c  Peter Zijlstra (Intel   2015-01-27  11978) 		 * (through the sibling list, which is still in-tact), we can
8f95b435b62522 kernel/events/core.c  Peter Zijlstra (Intel   2015-01-27  11979) 		 * end up with siblings installed in the wrong context.
8f95b435b62522 kernel/events/core.c  Peter Zijlstra (Intel   2015-01-27  11980) 		 *
8f95b435b62522 kernel/events/core.c  Peter Zijlstra (Intel   2015-01-27  11981) 		 * By installing siblings first we NO-OP because they're not
8f95b435b62522 kernel/events/core.c  Peter Zijlstra (Intel   2015-01-27  11982) 		 * reachable through the group lists.
8f95b435b62522 kernel/events/core.c  Peter Zijlstra (Intel   2015-01-27  11983) 		 */
edb39592a5877b kernel/events/core.c  Peter Zijlstra          2018-03-15  11984  		for_each_sibling_event(sibling, group_leader) {
8f95b435b62522 kernel/events/core.c  Peter Zijlstra (Intel   2015-01-27  11985) 			perf_event__state_init(sibling);
9fc81d87420d0d kernel/events/core.c  Jiri Olsa               2014-12-10  11986  			perf_install_in_context(ctx, sibling, sibling->cpu);
b04243ef7006cd kernel/perf_event.c   Peter Zijlstra          2010-09-17  11987  			get_ctx(ctx);
b04243ef7006cd kernel/perf_event.c   Peter Zijlstra          2010-09-17  11988  		}
8f95b435b62522 kernel/events/core.c  Peter Zijlstra (Intel   2015-01-27  11989) 
8f95b435b62522 kernel/events/core.c  Peter Zijlstra (Intel   2015-01-27  11990) 		/*
8f95b435b62522 kernel/events/core.c  Peter Zijlstra (Intel   2015-01-27  11991) 		 * Removing from the context ends up with disabled
8f95b435b62522 kernel/events/core.c  Peter Zijlstra (Intel   2015-01-27  11992) 		 * event. What we want here is event in the initial
8f95b435b62522 kernel/events/core.c  Peter Zijlstra (Intel   2015-01-27  11993) 		 * startup state, ready to be add into new context.
8f95b435b62522 kernel/events/core.c  Peter Zijlstra (Intel   2015-01-27  11994) 		 */
8f95b435b62522 kernel/events/core.c  Peter Zijlstra (Intel   2015-01-27  11995) 		perf_event__state_init(group_leader);
8f95b435b62522 kernel/events/core.c  Peter Zijlstra (Intel   2015-01-27  11996) 		perf_install_in_context(ctx, group_leader, group_leader->cpu);
8f95b435b62522 kernel/events/core.c  Peter Zijlstra (Intel   2015-01-27  11997) 		get_ctx(ctx);
bed5b25ad9c8a2 kernel/events/core.c  Alexander Shishkin      2015-01-30  11998  	}
bed5b25ad9c8a2 kernel/events/core.c  Alexander Shishkin      2015-01-30  11999  
f73e22ab450140 kernel/events/core.c  Peter Zijlstra          2015-09-09  12000  	/*
f73e22ab450140 kernel/events/core.c  Peter Zijlstra          2015-09-09  12001  	 * Precalculate sample_data sizes; do while holding ctx::mutex such
f73e22ab450140 kernel/events/core.c  Peter Zijlstra          2015-09-09  12002  	 * that we're serialized against further additions and before
f73e22ab450140 kernel/events/core.c  Peter Zijlstra          2015-09-09  12003  	 * perf_install_in_context() which is the point the event is active and
f73e22ab450140 kernel/events/core.c  Peter Zijlstra          2015-09-09  12004  	 * can use these values.
f73e22ab450140 kernel/events/core.c  Peter Zijlstra          2015-09-09  12005  	 */
f73e22ab450140 kernel/events/core.c  Peter Zijlstra          2015-09-09  12006  	perf_event__header_size(event);
f73e22ab450140 kernel/events/core.c  Peter Zijlstra          2015-09-09  12007  	perf_event__id_header_size(event);
f73e22ab450140 kernel/events/core.c  Peter Zijlstra          2015-09-09  12008  
78cd2c748f4597 kernel/events/core.c  Peter Zijlstra          2016-01-25  12009  	event->owner = current;
78cd2c748f4597 kernel/events/core.c  Peter Zijlstra          2016-01-25  12010  
e2d37cd213dcc0 kernel/events/core.c  Yan, Zheng              2012-06-15  12011  	perf_install_in_context(ctx, event, event->cpu);
fe4b04fa31a6dc kernel/perf_event.c   Peter Zijlstra          2011-02-02  12012  	perf_unpin_context(ctx);
f63a8daa5812af kernel/events/core.c  Peter Zijlstra          2015-01-23  12013  
f55fc2a57cc9ca kernel/events/core.c  Peter Zijlstra          2015-09-09  12014  	if (move_group)
321027c1fe77f8 kernel/events/core.c  Peter Zijlstra          2017-01-11  12015  		perf_event_ctx_unlock(group_leader, gctx);
d859e29fe34cb8 kernel/perf_counter.c Paul Mackerras          2009-01-17  12016  	mutex_unlock(&ctx->mutex);
9b51f66dcb09ac kernel/perf_counter.c Ingo Molnar             2008-12-12  12017  
79c9ce57eb2d5f kernel/events/core.c  Peter Zijlstra          2016-04-26  12018  	if (task) {
6914303824bb57 kernel/events/core.c  Bernd Edlinger          2020-03-20  12019  		mutex_unlock(&task->signal->exec_update_mutex);
79c9ce57eb2d5f kernel/events/core.c  Peter Zijlstra          2016-04-26  12020  		put_task_struct(task);
79c9ce57eb2d5f kernel/events/core.c  Peter Zijlstra          2016-04-26  12021  	}
79c9ce57eb2d5f kernel/events/core.c  Peter Zijlstra          2016-04-26  12022  
cdd6c482c9ff9c kernel/perf_event.c   Ingo Molnar             2009-09-21  12023  	mutex_lock(&current->perf_event_mutex);
cdd6c482c9ff9c kernel/perf_event.c   Ingo Molnar             2009-09-21  12024  	list_add_tail(&event->owner_entry, &current->perf_event_list);
cdd6c482c9ff9c kernel/perf_event.c   Ingo Molnar             2009-09-21  12025  	mutex_unlock(&current->perf_event_mutex);
082ff5a2767a06 kernel/perf_counter.c Peter Zijlstra          2009-05-23  12026  
8a49542c0554af kernel/perf_event.c   Peter Zijlstra          2010-05-27  12027  	/*
8a49542c0554af kernel/perf_event.c   Peter Zijlstra          2010-05-27  12028  	 * Drop the reference on the group_event after placing the
8a49542c0554af kernel/perf_event.c   Peter Zijlstra          2010-05-27  12029  	 * new event on the sibling_list. This ensures destruction
8a49542c0554af kernel/perf_event.c   Peter Zijlstra          2010-05-27  12030  	 * of the group leader will find the pointer to itself in
8a49542c0554af kernel/perf_event.c   Peter Zijlstra          2010-05-27  12031  	 * perf_group_detach().
8a49542c0554af kernel/perf_event.c   Peter Zijlstra          2010-05-27  12032  	 */
2903ff019b346a kernel/events/core.c  Al Viro                 2012-08-28  12033  	fdput(group);
ea635c64e00706 kernel/perf_event.c   Al Viro                 2010-05-26  12034  	fd_install(event_fd, event_file);
ea635c64e00706 kernel/perf_event.c   Al Viro                 2010-05-26  12035  	return event_fd;
0793a61d4df8da kernel/perf_counter.c Thomas Gleixner         2008-12-04  12036  
f55fc2a57cc9ca kernel/events/core.c  Peter Zijlstra          2015-09-09  12037  err_locked:
f55fc2a57cc9ca kernel/events/core.c  Peter Zijlstra          2015-09-09  12038  	if (move_group)
321027c1fe77f8 kernel/events/core.c  Peter Zijlstra          2017-01-11  12039  		perf_event_ctx_unlock(group_leader, gctx);
f55fc2a57cc9ca kernel/events/core.c  Peter Zijlstra          2015-09-09  12040  	mutex_unlock(&ctx->mutex);
f55fc2a57cc9ca kernel/events/core.c  Peter Zijlstra          2015-09-09  12041  /* err_file: */
f55fc2a57cc9ca kernel/events/core.c  Peter Zijlstra          2015-09-09  12042  	fput(event_file);
c3f00c70276d8a kernel/perf_event.c   Peter Zijlstra          2010-08-18  12043  err_context:
fe4b04fa31a6dc kernel/perf_event.c   Peter Zijlstra          2011-02-02  12044  	perf_unpin_context(ctx);
ea635c64e00706 kernel/perf_event.c   Al Viro                 2010-05-26  12045  	put_ctx(ctx);
c6be5a5cb62592 kernel/perf_event.c   Peter Zijlstra          2010-10-14  12046  err_alloc:
130056275ade73 kernel/events/core.c  Peter Zijlstra          2016-02-24  12047  	/*
130056275ade73 kernel/events/core.c  Peter Zijlstra          2016-02-24  12048  	 * If event_file is set, the fput() above will have called ->release()
130056275ade73 kernel/events/core.c  Peter Zijlstra          2016-02-24  12049  	 * and that will take care of freeing the event.
130056275ade73 kernel/events/core.c  Peter Zijlstra          2016-02-24  12050  	 */
130056275ade73 kernel/events/core.c  Peter Zijlstra          2016-02-24  12051  	if (!event_file)
048c852051d2bd kernel/perf_event.c   Tejun Heo               2010-05-01  12052  		free_event(event);
79c9ce57eb2d5f kernel/events/core.c  Peter Zijlstra          2016-04-26  12053  err_cred:
79c9ce57eb2d5f kernel/events/core.c  Peter Zijlstra          2016-04-26  12054  	if (task)
6914303824bb57 kernel/events/core.c  Bernd Edlinger          2020-03-20  12055  		mutex_unlock(&task->signal->exec_update_mutex);
1f4ee5038f0c1e kernel/events/core.c  Peter Zijlstra          2014-05-06  12056  err_task:
e7d0bc047548d7 kernel/perf_event.c   Peter Zijlstra          2010-10-14  12057  	if (task)
e7d0bc047548d7 kernel/perf_event.c   Peter Zijlstra          2010-10-14  12058  		put_task_struct(task);
89a1e18731959e kernel/perf_event.c   Peter Zijlstra          2010-09-07  12059  err_group_fd:
2903ff019b346a kernel/events/core.c  Al Viro                 2012-08-28  12060  	fdput(group);
ea635c64e00706 kernel/perf_event.c   Al Viro                 2010-05-26  12061  err_fd:
ea635c64e00706 kernel/perf_event.c   Al Viro                 2010-05-26  12062  	put_unused_fd(event_fd);
dc86cabe4b2424 kernel/perf_counter.c Ingo Molnar             2009-09-03  12063  	return err;
0793a61d4df8da kernel/perf_counter.c Thomas Gleixner         2008-12-04  12064  }
0793a61d4df8da kernel/perf_counter.c Thomas Gleixner         2008-12-04  12065  

:::::: The code at line 11620 was first introduced by commit
:::::: 0793a61d4df8daeac6492dbf8d2f3e5713caae5e performance counters: core code

:::::: TO: Thomas Gleixner <tglx@linutronix.de>
:::::: CC: Ingo Molnar <mingo@elte.hu>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
