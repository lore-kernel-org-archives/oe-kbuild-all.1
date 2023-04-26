Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 876A32CA9
	for <oe-kbuild-all@lists.linux.dev>; Wed, 26 Apr 2023 23:13:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682550789; x=1714086789;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tj4/4SJR3A80EubpHbG/8WwVkng3RDkku/BlhRGNzsY=;
  b=Xnawdwaq/1UVx4gGullCE8vl4ygvZzc/FRRUdAox+ZIxL36VDlZjuOi5
   OaGHXJhM6VjKxN5P23ZyB1e1x1FDDMDp/pQ6ez2dNyBL1SR+RTrv+wyzU
   /tC8MJ73E1OQkgG1GlhRXAHjdxUUkgOLri/PwWssHGctWMb9wROY+YfSx
   VttSngTB0gu4Ahmml31hXOU19AWoX+QxffyUhZGjTio8rVmACEO4YlSRQ
   AEJlR9/cBgjo0h4bbMb8DZBKR6AEF90muyQFg4OdRuXxL3PtSr/6JhDI9
   J5kZ6AUHgfKAJIB+Hhgfcm9fiJWuTOA+P8ItTsoD30Al3D+feVeqfE3oq
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10692"; a="346025137"
X-IronPort-AV: E=Sophos;i="5.99,229,1677571200"; 
   d="scan'208";a="346025137"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2023 16:12:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10692"; a="671528260"
X-IronPort-AV: E=Sophos;i="5.99,229,1677571200"; 
   d="scan'208";a="671528260"
Received: from lkp-server01.sh.intel.com (HELO 041f065c1b1b) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 26 Apr 2023 16:12:55 -0700
Received: from kbuild by 041f065c1b1b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1proJj-0000Zo-0a;
	Wed, 26 Apr 2023 23:12:55 +0000
Date: Thu, 27 Apr 2023 07:12:19 +0800
From: kernel test robot <lkp@intel.com>
To: Guenter Roeck <groeck@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jsarha:topic/cros-sof-v4.19 716/6555] kernel/sys.c:195:5: warning:
 no previous prototype for 'ksys_setpriority'
Message-ID: <202304270714.HBqV3K0l-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jsarha/linux topic/cros-sof-v4.19
head:   d7a3e91d8d16d1ef8653deec5a1fffc4de034a0c
commit: c2185294ad509ea4a6859dc0b4c5e21a9f4ee224 [716/6555] CHROMIUM: alt-syscall: Make required syscalls available for use
config: x86_64-randconfig-a013 (https://download.01.org/0day-ci/archive/20230427/202304270714.HBqV3K0l-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/jsarha/linux/commit/c2185294ad509ea4a6859dc0b4c5e21a9f4ee224
        git remote add jsarha https://github.com/jsarha/linux
        git fetch --no-tags jsarha topic/cros-sof-v4.19
        git checkout c2185294ad509ea4a6859dc0b4c5e21a9f4ee224
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/gpu/drm/ kernel/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304270714.HBqV3K0l-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/sys.c:195:5: warning: no previous prototype for 'ksys_setpriority' [-Wmissing-prototypes]
     195 | int ksys_setpriority(int which, int who, int niceval)
         |     ^~~~~~~~~~~~~~~~
>> kernel/sys.c:270:5: warning: no previous prototype for 'ksys_getpriority' [-Wmissing-prototypes]
     270 | int ksys_getpriority(int which, int who)
         |     ^~~~~~~~~~~~~~~~
   kernel/sys.c:2420:5: warning: no previous prototype for 'ksys_prctl' [-Wmissing-prototypes]
    2420 | int ksys_prctl(int option, unsigned long arg2, unsigned long arg3,
         |     ^~~~~~~~~~
>> kernel/sys.c:2654:5: warning: no previous prototype for 'ksys_getcpu' [-Wmissing-prototypes]
    2654 | int ksys_getcpu(unsigned __user *cpup, unsigned __user *nodep,
         |     ^~~~~~~~~~~
   kernel/sys.c: In function 'getrusage':
   kernel/sys.c:1756:20: warning: this statement may fall through [-Wimplicit-fallthrough=]
    1756 |                 if (who == RUSAGE_CHILDREN)
         |                    ^
   kernel/sys.c:1759:9: note: here
    1759 |         case RUSAGE_SELF:
         |         ^~~~
--
   kernel/events/core.c:5221:13: warning: no previous prototype for 'arch_perf_update_userpage' [-Wmissing-prototypes]
    5221 | void __weak arch_perf_update_userpage(
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~
>> kernel/events/core.c:10396:5: warning: no previous prototype for 'ksys_perf_event_open' [-Wmissing-prototypes]
   10396 | int ksys_perf_event_open(struct perf_event_attr __user * attr_uptr, pid_t pid,
         |     ^~~~~~~~~~~~~~~~~~~~
   kernel/events/core.c:11596:6: warning: no previous prototype for 'perf_swevent_init_cpu' [-Wmissing-prototypes]
   11596 | void perf_swevent_init_cpu(unsigned int cpu)
         |      ^~~~~~~~~~~~~~~~~~~~~
   kernel/events/core.c: In function 'perf_event_parse_addr_filter':
   kernel/events/core.c:8921:32: warning: this statement may fall through [-Wimplicit-fallthrough=]
    8921 |                         kernel = 1;
         |                         ~~~~~~~^~~
   kernel/events/core.c:8923:17: note: here
    8923 |                 case IF_SRC_FILEADDR:
         |                 ^~~~
   kernel/events/core.c:133: warning: Function parameter or member 'cpu' not described in 'cpu_function_call'
   kernel/events/core.c:10398: warning: Function parameter or member 'flags' not described in 'ksys_perf_event_open'
   kernel/events/core.c:10843: warning: Function parameter or member 'overflow_handler' not described in 'perf_event_create_kernel_counter'
   kernel/events/core.c:10843: warning: Function parameter or member 'context' not described in 'perf_event_create_kernel_counter'
--
>> kernel/time/time.c:266:5: warning: no previous prototype for 'ksys_adjtimex' [-Wmissing-prototypes]
     266 | int ksys_adjtimex(struct timex __user * txc_p)
         |     ^~~~~~~~~~~~~
>> kernel/time/time.c:288:5: warning: no previous prototype for 'compat_ksys_adjtimex' [-Wmissing-prototypes]
     288 | int compat_ksys_adjtimex(struct compat_timex __user * utp)
         |     ^~~~~~~~~~~~~~~~~~~~
   kernel/time/time.c:898:5: warning: no previous prototype for '__compat_get_timespec64' [-Wmissing-prototypes]
     898 | int __compat_get_timespec64(struct timespec64 *ts64,
         |     ^~~~~~~~~~~~~~~~~~~~~~~
   kernel/time/time.c:914:5: warning: no previous prototype for '__compat_put_timespec64' [-Wmissing-prototypes]
     914 | int __compat_put_timespec64(const struct timespec64 *ts64,
         |     ^~~~~~~~~~~~~~~~~~~~~~~


vim +/ksys_setpriority +195 kernel/sys.c

   194	
 > 195	int ksys_setpriority(int which, int who, int niceval)
   196	{
   197		struct task_struct *g, *p;
   198		struct user_struct *user;
   199		const struct cred *cred = current_cred();
   200		int error = -EINVAL;
   201		struct pid *pgrp;
   202		kuid_t uid;
   203	
   204		if (which > PRIO_USER || which < PRIO_PROCESS)
   205			goto out;
   206	
   207		/* normalize: avoid signed division (rounding problems) */
   208		error = -ESRCH;
   209		if (niceval < MIN_NICE)
   210			niceval = MIN_NICE;
   211		if (niceval > MAX_NICE)
   212			niceval = MAX_NICE;
   213	
   214		rcu_read_lock();
   215		read_lock(&tasklist_lock);
   216		switch (which) {
   217		case PRIO_PROCESS:
   218			if (who)
   219				p = find_task_by_vpid(who);
   220			else
   221				p = current;
   222			if (p)
   223				error = set_one_prio(p, niceval, error);
   224			break;
   225		case PRIO_PGRP:
   226			if (who)
   227				pgrp = find_vpid(who);
   228			else
   229				pgrp = task_pgrp(current);
   230			do_each_pid_thread(pgrp, PIDTYPE_PGID, p) {
   231				error = set_one_prio(p, niceval, error);
   232			} while_each_pid_thread(pgrp, PIDTYPE_PGID, p);
   233			break;
   234		case PRIO_USER:
   235			uid = make_kuid(cred->user_ns, who);
   236			user = cred->user;
   237			if (!who)
   238				uid = cred->uid;
   239			else if (!uid_eq(uid, cred->uid)) {
   240				user = find_user(uid);
   241				if (!user)
   242					goto out_unlock;	/* No processes for this user */
   243			}
   244			do_each_thread(g, p) {
   245				if (uid_eq(task_uid(p), uid) && task_pid_vnr(p))
   246					error = set_one_prio(p, niceval, error);
   247			} while_each_thread(g, p);
   248			if (!uid_eq(uid, cred->uid))
   249				free_uid(user);		/* For find_user() */
   250			break;
   251		}
   252	out_unlock:
   253		read_unlock(&tasklist_lock);
   254		rcu_read_unlock();
   255	out:
   256		return error;
   257	}
   258	
   259	SYSCALL_DEFINE3(setpriority, int, which, int, who, int, niceval)
   260	{
   261		return ksys_setpriority(which, who, niceval);
   262	}
   263	
   264	/*
   265	 * Ugh. To avoid negative return values, "getpriority()" will
   266	 * not return the normal nice-value, but a negated value that
   267	 * has been offset by 20 (ie it returns 40..1 instead of -20..19)
   268	 * to stay compatible.
   269	 */
 > 270	int ksys_getpriority(int which, int who)
   271	{
   272		struct task_struct *g, *p;
   273		struct user_struct *user;
   274		const struct cred *cred = current_cred();
   275		long niceval, retval = -ESRCH;
   276		struct pid *pgrp;
   277		kuid_t uid;
   278	
   279		if (which > PRIO_USER || which < PRIO_PROCESS)
   280			return -EINVAL;
   281	
   282		rcu_read_lock();
   283		read_lock(&tasklist_lock);
   284		switch (which) {
   285		case PRIO_PROCESS:
   286			if (who)
   287				p = find_task_by_vpid(who);
   288			else
   289				p = current;
   290			if (p) {
   291				niceval = nice_to_rlimit(task_nice(p));
   292				if (niceval > retval)
   293					retval = niceval;
   294			}
   295			break;
   296		case PRIO_PGRP:
   297			if (who)
   298				pgrp = find_vpid(who);
   299			else
   300				pgrp = task_pgrp(current);
   301			do_each_pid_thread(pgrp, PIDTYPE_PGID, p) {
   302				niceval = nice_to_rlimit(task_nice(p));
   303				if (niceval > retval)
   304					retval = niceval;
   305			} while_each_pid_thread(pgrp, PIDTYPE_PGID, p);
   306			break;
   307		case PRIO_USER:
   308			uid = make_kuid(cred->user_ns, who);
   309			user = cred->user;
   310			if (!who)
   311				uid = cred->uid;
   312			else if (!uid_eq(uid, cred->uid)) {
   313				user = find_user(uid);
   314				if (!user)
   315					goto out_unlock;	/* No processes for this user */
   316			}
   317			do_each_thread(g, p) {
   318				if (uid_eq(task_uid(p), uid) && task_pid_vnr(p)) {
   319					niceval = nice_to_rlimit(task_nice(p));
   320					if (niceval > retval)
   321						retval = niceval;
   322				}
   323			} while_each_thread(g, p);
   324			if (!uid_eq(uid, cred->uid))
   325				free_uid(user);		/* for find_user() */
   326			break;
   327		}
   328	out_unlock:
   329		read_unlock(&tasklist_lock);
   330		rcu_read_unlock();
   331	
   332		return retval;
   333	}
   334	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
