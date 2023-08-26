Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFB1537D
	for <oe-kbuild-all@lists.linux.dev>; Sat, 26 Aug 2023 04:53:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693025619; x=1724561619;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1bluSPtt2v9fYmBdkSrPjsgCpngenZdy9BTnk2+v67s=;
  b=lfDbNSYtZNRgnyGBuATV07/VWMgTTVoc4bHB9+j1a6LzIN52bsEW5Uoq
   tfQbW5/amx1I9cMOpTVCHbJHGu4nocN9liFzpvvp14GCVlOTNY0PWpBTw
   D0t9x72Zpv7gw8SsFpH282xnL2OOGOAvh1JQI+3DOhAMrz5B1u9VGEW5q
   m0a9wVPcPmWiPpHsbGWXDARI1gnrswVwMWAsgtfs8+Mw+GvJKx28G4VOj
   1qGoKlg/ld8OAh0pBG4vuTV1SyFsABvU1O6atOLNUgoH8eiUDrwTm0u5V
   XVVQwQhcclfg8YbAoxqFtET3wsQfe6fflw7ChIu5WhMfT/lGDf2xlyL+L
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10813"; a="373721647"
X-IronPort-AV: E=Sophos;i="6.02,202,1688454000"; 
   d="scan'208";a="373721647"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2023 21:53:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10813"; a="731258569"
X-IronPort-AV: E=Sophos;i="6.02,202,1688454000"; 
   d="scan'208";a="731258569"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 25 Aug 2023 21:53:34 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qZlIj-0004MX-1Y;
	Sat, 26 Aug 2023 04:53:33 +0000
Date: Sat, 26 Aug 2023 12:53:04 +0800
From: kernel test robot <lkp@intel.com>
To: Qais Yousef <qyousef@layalina.io>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [qais-yousef:sched-setscheduler-hide 9/9] kernel/kthread.c:1538:5:
 error: conflicting types for 'param_set_sched_policy'; have 'int(const char
 *, const struct kernel_param *)'
Message-ID: <202308261220.WjlgrCOu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/qais-yousef/linux sched-setscheduler-hide
head:   e586c67baa1c537a793f135e324cc56df2b6585b
commit: e586c67baa1c537a793f135e324cc56df2b6585b [9/9] kthread: Provide a mechanism to control kthread sched_attr
config: mips-allnoconfig (https://download.01.org/0day-ci/archive/20230826/202308261220.WjlgrCOu-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230826/202308261220.WjlgrCOu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308261220.WjlgrCOu-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from include/linux/psi_types.h:5,
                    from include/linux/cgroup-defs.h:23,
                    from include/linux/cgroup.h:28,
                    from include/linux/memcontrol.h:13,
                    from include/linux/swap.h:9,
                    from include/linux/suspend.h:5,
                    from arch/mips/kernel/asm-offsets.c:17:
>> include/linux/kthread.h:28:65: warning: 'struct kernel_param' declared inside parameter list will not be visible outside of this definition or declaration
      28 | extern int param_set_sched_policy(const char *val, const struct kernel_param *kp);
         |                                                                 ^~~~~~~~~~~~
   include/linux/kthread.h:29:62: warning: 'struct kernel_param' declared inside parameter list will not be visible outside of this definition or declaration
      29 | extern int param_get_sched_policy(char *buffer, const struct kernel_param *kp);
         |                                                              ^~~~~~~~~~~~
   include/linux/kthread.h:32:63: warning: 'struct kernel_param' declared inside parameter list will not be visible outside of this definition or declaration
      32 | extern int param_set_sched_nice(const char *val, const struct kernel_param *kp);
         |                                                               ^~~~~~~~~~~~
   include/linux/kthread.h:33:60: warning: 'struct kernel_param' declared inside parameter list will not be visible outside of this definition or declaration
      33 | extern int param_get_sched_nice(char *buffer, const struct kernel_param *kp);
         |                                                            ^~~~~~~~~~~~
   include/linux/kthread.h:36:67: warning: 'struct kernel_param' declared inside parameter list will not be visible outside of this definition or declaration
      36 | extern int param_set_sched_priority(const char *val, const struct kernel_param *kp);
         |                                                                   ^~~~~~~~~~~~
   include/linux/kthread.h:37:64: warning: 'struct kernel_param' declared inside parameter list will not be visible outside of this definition or declaration
      37 | extern int param_get_sched_priority(char *buffer, const struct kernel_param *kp);
         |                                                                ^~~~~~~~~~~~
   include/linux/kthread.h:40:66: warning: 'struct kernel_param' declared inside parameter list will not be visible outside of this definition or declaration
      40 | extern int param_set_sched_runtime(const char *val, const struct kernel_param *kp);
         |                                                                  ^~~~~~~~~~~~
   include/linux/kthread.h:41:63: warning: 'struct kernel_param' declared inside parameter list will not be visible outside of this definition or declaration
      41 | extern int param_get_sched_runtime(char *buffer, const struct kernel_param *kp);
         |                                                               ^~~~~~~~~~~~
   include/linux/kthread.h:44:67: warning: 'struct kernel_param' declared inside parameter list will not be visible outside of this definition or declaration
      44 | extern int param_set_sched_deadline(const char *val, const struct kernel_param *kp);
         |                                                                   ^~~~~~~~~~~~
   include/linux/kthread.h:45:64: warning: 'struct kernel_param' declared inside parameter list will not be visible outside of this definition or declaration
      45 | extern int param_get_sched_deadline(char *buffer, const struct kernel_param *kp);
         |                                                                ^~~~~~~~~~~~
   include/linux/kthread.h:48:65: warning: 'struct kernel_param' declared inside parameter list will not be visible outside of this definition or declaration
      48 | extern int param_set_sched_period(const char *val, const struct kernel_param *kp);
         |                                                                 ^~~~~~~~~~~~
   include/linux/kthread.h:49:62: warning: 'struct kernel_param' declared inside parameter list will not be visible outside of this definition or declaration
      49 | extern int param_get_sched_period(char *buffer, const struct kernel_param *kp);
         |                                                              ^~~~~~~~~~~~
   include/linux/kthread.h:52:67: warning: 'struct kernel_param' declared inside parameter list will not be visible outside of this definition or declaration
      52 | extern int param_set_sched_util_min(const char *val, const struct kernel_param *kp);
         |                                                                   ^~~~~~~~~~~~
   include/linux/kthread.h:53:64: warning: 'struct kernel_param' declared inside parameter list will not be visible outside of this definition or declaration
      53 | extern int param_get_sched_util_min(char *buffer, const struct kernel_param *kp);
         |                                                                ^~~~~~~~~~~~
   include/linux/kthread.h:56:67: warning: 'struct kernel_param' declared inside parameter list will not be visible outside of this definition or declaration
      56 | extern int param_set_sched_util_max(const char *val, const struct kernel_param *kp);
         |                                                                   ^~~~~~~~~~~~
   include/linux/kthread.h:57:64: warning: 'struct kernel_param' declared inside parameter list will not be visible outside of this definition or declaration
      57 | extern int param_get_sched_util_max(char *buffer, const struct kernel_param *kp);
         |                                                                ^~~~~~~~~~~~
--
   In file included from kernel/kthread.c:16:
>> include/linux/kthread.h:28:65: warning: 'struct kernel_param' declared inside parameter list will not be visible outside of this definition or declaration
      28 | extern int param_set_sched_policy(const char *val, const struct kernel_param *kp);
         |                                                                 ^~~~~~~~~~~~
   include/linux/kthread.h:29:62: warning: 'struct kernel_param' declared inside parameter list will not be visible outside of this definition or declaration
      29 | extern int param_get_sched_policy(char *buffer, const struct kernel_param *kp);
         |                                                              ^~~~~~~~~~~~
   include/linux/kthread.h:32:63: warning: 'struct kernel_param' declared inside parameter list will not be visible outside of this definition or declaration
      32 | extern int param_set_sched_nice(const char *val, const struct kernel_param *kp);
         |                                                               ^~~~~~~~~~~~
   include/linux/kthread.h:33:60: warning: 'struct kernel_param' declared inside parameter list will not be visible outside of this definition or declaration
      33 | extern int param_get_sched_nice(char *buffer, const struct kernel_param *kp);
         |                                                            ^~~~~~~~~~~~
   include/linux/kthread.h:36:67: warning: 'struct kernel_param' declared inside parameter list will not be visible outside of this definition or declaration
      36 | extern int param_set_sched_priority(const char *val, const struct kernel_param *kp);
         |                                                                   ^~~~~~~~~~~~
   include/linux/kthread.h:37:64: warning: 'struct kernel_param' declared inside parameter list will not be visible outside of this definition or declaration
      37 | extern int param_get_sched_priority(char *buffer, const struct kernel_param *kp);
         |                                                                ^~~~~~~~~~~~
   include/linux/kthread.h:40:66: warning: 'struct kernel_param' declared inside parameter list will not be visible outside of this definition or declaration
      40 | extern int param_set_sched_runtime(const char *val, const struct kernel_param *kp);
         |                                                                  ^~~~~~~~~~~~
   include/linux/kthread.h:41:63: warning: 'struct kernel_param' declared inside parameter list will not be visible outside of this definition or declaration
      41 | extern int param_get_sched_runtime(char *buffer, const struct kernel_param *kp);
         |                                                               ^~~~~~~~~~~~
   include/linux/kthread.h:44:67: warning: 'struct kernel_param' declared inside parameter list will not be visible outside of this definition or declaration
      44 | extern int param_set_sched_deadline(const char *val, const struct kernel_param *kp);
         |                                                                   ^~~~~~~~~~~~
   include/linux/kthread.h:45:64: warning: 'struct kernel_param' declared inside parameter list will not be visible outside of this definition or declaration
      45 | extern int param_get_sched_deadline(char *buffer, const struct kernel_param *kp);
         |                                                                ^~~~~~~~~~~~
   include/linux/kthread.h:48:65: warning: 'struct kernel_param' declared inside parameter list will not be visible outside of this definition or declaration
      48 | extern int param_set_sched_period(const char *val, const struct kernel_param *kp);
         |                                                                 ^~~~~~~~~~~~
   include/linux/kthread.h:49:62: warning: 'struct kernel_param' declared inside parameter list will not be visible outside of this definition or declaration
      49 | extern int param_get_sched_period(char *buffer, const struct kernel_param *kp);
         |                                                              ^~~~~~~~~~~~
   include/linux/kthread.h:52:67: warning: 'struct kernel_param' declared inside parameter list will not be visible outside of this definition or declaration
      52 | extern int param_set_sched_util_min(const char *val, const struct kernel_param *kp);
         |                                                                   ^~~~~~~~~~~~
   include/linux/kthread.h:53:64: warning: 'struct kernel_param' declared inside parameter list will not be visible outside of this definition or declaration
      53 | extern int param_get_sched_util_min(char *buffer, const struct kernel_param *kp);
         |                                                                ^~~~~~~~~~~~
   include/linux/kthread.h:56:67: warning: 'struct kernel_param' declared inside parameter list will not be visible outside of this definition or declaration
      56 | extern int param_set_sched_util_max(const char *val, const struct kernel_param *kp);
         |                                                                   ^~~~~~~~~~~~
   include/linux/kthread.h:57:64: warning: 'struct kernel_param' declared inside parameter list will not be visible outside of this definition or declaration
      57 | extern int param_get_sched_util_max(char *buffer, const struct kernel_param *kp);
         |                                                                ^~~~~~~~~~~~
>> kernel/kthread.c:1538:5: error: conflicting types for 'param_set_sched_policy'; have 'int(const char *, const struct kernel_param *)'
    1538 | int param_set_sched_policy(const char *val, const struct kernel_param *kp)
         |     ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/kthread.h:28:12: note: previous declaration of 'param_set_sched_policy' with type 'int(const char *, const struct kernel_param *)'
      28 | extern int param_set_sched_policy(const char *val, const struct kernel_param *kp);
         |            ^~~~~~~~~~~~~~~~~~~~~~
>> kernel/kthread.c:1542:5: error: conflicting types for 'param_get_sched_policy'; have 'int(char *, const struct kernel_param *)'
    1542 | int param_get_sched_policy(char *buffer, const struct kernel_param *kp)
         |     ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/kthread.h:29:12: note: previous declaration of 'param_get_sched_policy' with type 'int(char *, const struct kernel_param *)'
      29 | extern int param_get_sched_policy(char *buffer, const struct kernel_param *kp);
         |            ^~~~~~~~~~~~~~~~~~~~~~
>> kernel/kthread.c:1552:5: error: conflicting types for 'param_set_sched_nice'; have 'int(const char *, const struct kernel_param *)'
    1552 | int param_set_sched_nice(const char *val, const struct kernel_param *kp)
         |     ^~~~~~~~~~~~~~~~~~~~
   include/linux/kthread.h:32:12: note: previous declaration of 'param_set_sched_nice' with type 'int(const char *, const struct kernel_param *)'
      32 | extern int param_set_sched_nice(const char *val, const struct kernel_param *kp);
         |            ^~~~~~~~~~~~~~~~~~~~
>> kernel/kthread.c:1556:5: error: conflicting types for 'param_get_sched_nice'; have 'int(char *, const struct kernel_param *)'
    1556 | int param_get_sched_nice(char *buffer, const struct kernel_param *kp)
         |     ^~~~~~~~~~~~~~~~~~~~
   include/linux/kthread.h:33:12: note: previous declaration of 'param_get_sched_nice' with type 'int(char *, const struct kernel_param *)'
      33 | extern int param_get_sched_nice(char *buffer, const struct kernel_param *kp);
         |            ^~~~~~~~~~~~~~~~~~~~
>> kernel/kthread.c:1566:5: error: conflicting types for 'param_set_sched_priority'; have 'int(const char *, const struct kernel_param *)'
    1566 | int param_set_sched_priority(const char *val, const struct kernel_param *kp)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/kthread.h:36:12: note: previous declaration of 'param_set_sched_priority' with type 'int(const char *, const struct kernel_param *)'
      36 | extern int param_set_sched_priority(const char *val, const struct kernel_param *kp);
         |            ^~~~~~~~~~~~~~~~~~~~~~~~
>> kernel/kthread.c:1570:5: error: conflicting types for 'param_get_sched_priority'; have 'int(char *, const struct kernel_param *)'
    1570 | int param_get_sched_priority(char *buffer, const struct kernel_param *kp)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/kthread.h:37:12: note: previous declaration of 'param_get_sched_priority' with type 'int(char *, const struct kernel_param *)'
      37 | extern int param_get_sched_priority(char *buffer, const struct kernel_param *kp);
         |            ^~~~~~~~~~~~~~~~~~~~~~~~
>> kernel/kthread.c:1580:5: error: conflicting types for 'param_set_sched_runtime'; have 'int(const char *, const struct kernel_param *)'
    1580 | int param_set_sched_runtime(const char *val, const struct kernel_param *kp)
         |     ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/kthread.h:40:12: note: previous declaration of 'param_set_sched_runtime' with type 'int(const char *, const struct kernel_param *)'
      40 | extern int param_set_sched_runtime(const char *val, const struct kernel_param *kp);
         |            ^~~~~~~~~~~~~~~~~~~~~~~
>> kernel/kthread.c:1584:5: error: conflicting types for 'param_get_sched_runtime'; have 'int(char *, const struct kernel_param *)'
    1584 | int param_get_sched_runtime(char *buffer, const struct kernel_param *kp)
         |     ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/kthread.h:41:12: note: previous declaration of 'param_get_sched_runtime' with type 'int(char *, const struct kernel_param *)'
      41 | extern int param_get_sched_runtime(char *buffer, const struct kernel_param *kp);
         |            ^~~~~~~~~~~~~~~~~~~~~~~
>> kernel/kthread.c:1594:5: error: conflicting types for 'param_set_sched_deadline'; have 'int(const char *, const struct kernel_param *)'
    1594 | int param_set_sched_deadline(const char *val, const struct kernel_param *kp)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/kthread.h:44:12: note: previous declaration of 'param_set_sched_deadline' with type 'int(const char *, const struct kernel_param *)'
      44 | extern int param_set_sched_deadline(const char *val, const struct kernel_param *kp);
         |            ^~~~~~~~~~~~~~~~~~~~~~~~
>> kernel/kthread.c:1598:5: error: conflicting types for 'param_get_sched_deadline'; have 'int(char *, const struct kernel_param *)'
    1598 | int param_get_sched_deadline(char *buffer, const struct kernel_param *kp)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/kthread.h:45:12: note: previous declaration of 'param_get_sched_deadline' with type 'int(char *, const struct kernel_param *)'
      45 | extern int param_get_sched_deadline(char *buffer, const struct kernel_param *kp);
         |            ^~~~~~~~~~~~~~~~~~~~~~~~
>> kernel/kthread.c:1608:5: error: conflicting types for 'param_set_sched_period'; have 'int(const char *, const struct kernel_param *)'
    1608 | int param_set_sched_period(const char *val, const struct kernel_param *kp)
         |     ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/kthread.h:48:12: note: previous declaration of 'param_set_sched_period' with type 'int(const char *, const struct kernel_param *)'
      48 | extern int param_set_sched_period(const char *val, const struct kernel_param *kp);
         |            ^~~~~~~~~~~~~~~~~~~~~~
>> kernel/kthread.c:1612:5: error: conflicting types for 'param_get_sched_period'; have 'int(char *, const struct kernel_param *)'
    1612 | int param_get_sched_period(char *buffer, const struct kernel_param *kp)
         |     ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/kthread.h:49:12: note: previous declaration of 'param_get_sched_period' with type 'int(char *, const struct kernel_param *)'
      49 | extern int param_get_sched_period(char *buffer, const struct kernel_param *kp);
         |            ^~~~~~~~~~~~~~~~~~~~~~
>> kernel/kthread.c:1622:5: error: conflicting types for 'param_set_sched_util_min'; have 'int(const char *, const struct kernel_param *)'
    1622 | int param_set_sched_util_min(const char *val, const struct kernel_param *kp)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/kthread.h:52:12: note: previous declaration of 'param_set_sched_util_min' with type 'int(const char *, const struct kernel_param *)'
      52 | extern int param_set_sched_util_min(const char *val, const struct kernel_param *kp);
         |            ^~~~~~~~~~~~~~~~~~~~~~~~
>> kernel/kthread.c:1626:5: error: conflicting types for 'param_get_sched_util_min'; have 'int(char *, const struct kernel_param *)'
    1626 | int param_get_sched_util_min(char *buffer, const struct kernel_param *kp)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/kthread.h:53:12: note: previous declaration of 'param_get_sched_util_min' with type 'int(char *, const struct kernel_param *)'
      53 | extern int param_get_sched_util_min(char *buffer, const struct kernel_param *kp);
         |            ^~~~~~~~~~~~~~~~~~~~~~~~
>> kernel/kthread.c:1636:5: error: conflicting types for 'param_set_sched_util_max'; have 'int(const char *, const struct kernel_param *)'
    1636 | int param_set_sched_util_max(const char *val, const struct kernel_param *kp)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/kthread.h:56:12: note: previous declaration of 'param_set_sched_util_max' with type 'int(const char *, const struct kernel_param *)'
      56 | extern int param_set_sched_util_max(const char *val, const struct kernel_param *kp);
         |            ^~~~~~~~~~~~~~~~~~~~~~~~
>> kernel/kthread.c:1640:5: error: conflicting types for 'param_get_sched_util_max'; have 'int(char *, const struct kernel_param *)'
    1640 | int param_get_sched_util_max(char *buffer, const struct kernel_param *kp)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/kthread.h:57:12: note: previous declaration of 'param_get_sched_util_max' with type 'int(char *, const struct kernel_param *)'
      57 | extern int param_get_sched_util_max(char *buffer, const struct kernel_param *kp);
         |            ^~~~~~~~~~~~~~~~~~~~~~~~
--
   In file included from include/linux/psi_types.h:5,
                    from include/linux/cgroup-defs.h:23,
                    from include/linux/cgroup.h:28,
                    from include/linux/memcontrol.h:13,
                    from include/linux/swap.h:9,
                    from arch/mips/mm/init.c:27:
>> include/linux/kthread.h:28:65: warning: 'struct kernel_param' declared inside parameter list will not be visible outside of this definition or declaration
      28 | extern int param_set_sched_policy(const char *val, const struct kernel_param *kp);
         |                                                                 ^~~~~~~~~~~~
   include/linux/kthread.h:29:62: warning: 'struct kernel_param' declared inside parameter list will not be visible outside of this definition or declaration
      29 | extern int param_get_sched_policy(char *buffer, const struct kernel_param *kp);
         |                                                              ^~~~~~~~~~~~
   include/linux/kthread.h:32:63: warning: 'struct kernel_param' declared inside parameter list will not be visible outside of this definition or declaration
      32 | extern int param_set_sched_nice(const char *val, const struct kernel_param *kp);
         |                                                               ^~~~~~~~~~~~
   include/linux/kthread.h:33:60: warning: 'struct kernel_param' declared inside parameter list will not be visible outside of this definition or declaration
      33 | extern int param_get_sched_nice(char *buffer, const struct kernel_param *kp);
         |                                                            ^~~~~~~~~~~~
   include/linux/kthread.h:36:67: warning: 'struct kernel_param' declared inside parameter list will not be visible outside of this definition or declaration
      36 | extern int param_set_sched_priority(const char *val, const struct kernel_param *kp);
         |                                                                   ^~~~~~~~~~~~
   include/linux/kthread.h:37:64: warning: 'struct kernel_param' declared inside parameter list will not be visible outside of this definition or declaration
      37 | extern int param_get_sched_priority(char *buffer, const struct kernel_param *kp);
         |                                                                ^~~~~~~~~~~~
   include/linux/kthread.h:40:66: warning: 'struct kernel_param' declared inside parameter list will not be visible outside of this definition or declaration
      40 | extern int param_set_sched_runtime(const char *val, const struct kernel_param *kp);
         |                                                                  ^~~~~~~~~~~~
   include/linux/kthread.h:41:63: warning: 'struct kernel_param' declared inside parameter list will not be visible outside of this definition or declaration
      41 | extern int param_get_sched_runtime(char *buffer, const struct kernel_param *kp);
         |                                                               ^~~~~~~~~~~~
   include/linux/kthread.h:44:67: warning: 'struct kernel_param' declared inside parameter list will not be visible outside of this definition or declaration
      44 | extern int param_set_sched_deadline(const char *val, const struct kernel_param *kp);
         |                                                                   ^~~~~~~~~~~~
   include/linux/kthread.h:45:64: warning: 'struct kernel_param' declared inside parameter list will not be visible outside of this definition or declaration
      45 | extern int param_get_sched_deadline(char *buffer, const struct kernel_param *kp);
         |                                                                ^~~~~~~~~~~~
   include/linux/kthread.h:48:65: warning: 'struct kernel_param' declared inside parameter list will not be visible outside of this definition or declaration
      48 | extern int param_set_sched_period(const char *val, const struct kernel_param *kp);
         |                                                                 ^~~~~~~~~~~~
   include/linux/kthread.h:49:62: warning: 'struct kernel_param' declared inside parameter list will not be visible outside of this definition or declaration
      49 | extern int param_get_sched_period(char *buffer, const struct kernel_param *kp);
         |                                                              ^~~~~~~~~~~~
   include/linux/kthread.h:52:67: warning: 'struct kernel_param' declared inside parameter list will not be visible outside of this definition or declaration
      52 | extern int param_set_sched_util_min(const char *val, const struct kernel_param *kp);
         |                                                                   ^~~~~~~~~~~~
   include/linux/kthread.h:53:64: warning: 'struct kernel_param' declared inside parameter list will not be visible outside of this definition or declaration
      53 | extern int param_get_sched_util_min(char *buffer, const struct kernel_param *kp);
         |                                                                ^~~~~~~~~~~~
   include/linux/kthread.h:56:67: warning: 'struct kernel_param' declared inside parameter list will not be visible outside of this definition or declaration
      56 | extern int param_set_sched_util_max(const char *val, const struct kernel_param *kp);
         |                                                                   ^~~~~~~~~~~~
   include/linux/kthread.h:57:64: warning: 'struct kernel_param' declared inside parameter list will not be visible outside of this definition or declaration
      57 | extern int param_get_sched_util_max(char *buffer, const struct kernel_param *kp);
         |                                                                ^~~~~~~~~~~~
   arch/mips/mm/init.c:60:6: warning: no previous prototype for 'setup_zero_pages' [-Wmissing-prototypes]
      60 | void setup_zero_pages(void)
         |      ^~~~~~~~~~~~~~~~
--
   In file included from include/linux/psi_types.h:5,
                    from include/linux/cgroup-defs.h:23,
                    from include/linux/cgroup.h:28,
                    from include/linux/hugetlb.h:10,
                    from arch/mips/mm/tlb-r4k.c:16:
>> include/linux/kthread.h:28:65: warning: 'struct kernel_param' declared inside parameter list will not be visible outside of this definition or declaration
      28 | extern int param_set_sched_policy(const char *val, const struct kernel_param *kp);
         |                                                                 ^~~~~~~~~~~~
   include/linux/kthread.h:29:62: warning: 'struct kernel_param' declared inside parameter list will not be visible outside of this definition or declaration
      29 | extern int param_get_sched_policy(char *buffer, const struct kernel_param *kp);
         |                                                              ^~~~~~~~~~~~
   include/linux/kthread.h:32:63: warning: 'struct kernel_param' declared inside parameter list will not be visible outside of this definition or declaration
      32 | extern int param_set_sched_nice(const char *val, const struct kernel_param *kp);
         |                                                               ^~~~~~~~~~~~
   include/linux/kthread.h:33:60: warning: 'struct kernel_param' declared inside parameter list will not be visible outside of this definition or declaration
      33 | extern int param_get_sched_nice(char *buffer, const struct kernel_param *kp);
         |                                                            ^~~~~~~~~~~~
   include/linux/kthread.h:36:67: warning: 'struct kernel_param' declared inside parameter list will not be visible outside of this definition or declaration
      36 | extern int param_set_sched_priority(const char *val, const struct kernel_param *kp);
         |                                                                   ^~~~~~~~~~~~
   include/linux/kthread.h:37:64: warning: 'struct kernel_param' declared inside parameter list will not be visible outside of this definition or declaration
      37 | extern int param_get_sched_priority(char *buffer, const struct kernel_param *kp);
         |                                                                ^~~~~~~~~~~~
   include/linux/kthread.h:40:66: warning: 'struct kernel_param' declared inside parameter list will not be visible outside of this definition or declaration
      40 | extern int param_set_sched_runtime(const char *val, const struct kernel_param *kp);
         |                                                                  ^~~~~~~~~~~~
   include/linux/kthread.h:41:63: warning: 'struct kernel_param' declared inside parameter list will not be visible outside of this definition or declaration
      41 | extern int param_get_sched_runtime(char *buffer, const struct kernel_param *kp);
         |                                                               ^~~~~~~~~~~~
   include/linux/kthread.h:44:67: warning: 'struct kernel_param' declared inside parameter list will not be visible outside of this definition or declaration
      44 | extern int param_set_sched_deadline(const char *val, const struct kernel_param *kp);
         |                                                                   ^~~~~~~~~~~~
   include/linux/kthread.h:45:64: warning: 'struct kernel_param' declared inside parameter list will not be visible outside of this definition or declaration
      45 | extern int param_get_sched_deadline(char *buffer, const struct kernel_param *kp);
         |                                                                ^~~~~~~~~~~~
   include/linux/kthread.h:48:65: warning: 'struct kernel_param' declared inside parameter list will not be visible outside of this definition or declaration
      48 | extern int param_set_sched_period(const char *val, const struct kernel_param *kp);
         |                                                                 ^~~~~~~~~~~~
   include/linux/kthread.h:49:62: warning: 'struct kernel_param' declared inside parameter list will not be visible outside of this definition or declaration
      49 | extern int param_get_sched_period(char *buffer, const struct kernel_param *kp);
         |                                                              ^~~~~~~~~~~~
   include/linux/kthread.h:52:67: warning: 'struct kernel_param' declared inside parameter list will not be visible outside of this definition or declaration
      52 | extern int param_set_sched_util_min(const char *val, const struct kernel_param *kp);
         |                                                                   ^~~~~~~~~~~~
   include/linux/kthread.h:53:64: warning: 'struct kernel_param' declared inside parameter list will not be visible outside of this definition or declaration
      53 | extern int param_get_sched_util_min(char *buffer, const struct kernel_param *kp);
         |                                                                ^~~~~~~~~~~~
   include/linux/kthread.h:56:67: warning: 'struct kernel_param' declared inside parameter list will not be visible outside of this definition or declaration
      56 | extern int param_set_sched_util_max(const char *val, const struct kernel_param *kp);
         |                                                                   ^~~~~~~~~~~~
   include/linux/kthread.h:57:64: warning: 'struct kernel_param' declared inside parameter list will not be visible outside of this definition or declaration
      57 | extern int param_get_sched_util_max(char *buffer, const struct kernel_param *kp);
         |                                                                ^~~~~~~~~~~~
   arch/mips/mm/tlb-r4k.c:553:6: warning: no previous prototype for 'tlb_init' [-Wmissing-prototypes]
     553 | void tlb_init(void)
         |      ^~~~~~~~
..


vim +1538 kernel/kthread.c

  1536	
  1537	
> 1538	int param_set_sched_policy(const char *val, const struct kernel_param *kp)
  1539	{
  1540		return 0;
  1541	}
> 1542	int param_get_sched_policy(char *buffer, const struct kernel_param *kp)
  1543	{
  1544		return 0;
  1545	}
  1546	const struct kernel_param_ops param_ops_sched_policy = {
  1547		.set = param_set_sched_policy,
  1548		.get = param_get_sched_policy
  1549	};
  1550	EXPORT_SYMBOL_GPL(param_ops_sched_policy);
  1551	
> 1552	int param_set_sched_nice(const char *val, const struct kernel_param *kp)
  1553	{
  1554		return 0;
  1555	}
> 1556	int param_get_sched_nice(char *buffer, const struct kernel_param *kp)
  1557	{
  1558		return 0;
  1559	}
  1560	const struct kernel_param_ops param_ops_sched_nice = {
  1561		.set = param_set_sched_nice,
  1562		.get = param_get_sched_nice
  1563	};
  1564	EXPORT_SYMBOL_GPL(param_ops_sched_nice);
  1565	
> 1566	int param_set_sched_priority(const char *val, const struct kernel_param *kp)
  1567	{
  1568		return 0;
  1569	}
> 1570	int param_get_sched_priority(char *buffer, const struct kernel_param *kp)
  1571	{
  1572		return 0;
  1573	}
  1574	const struct kernel_param_ops param_ops_sched_priority = {
  1575		.set = param_set_sched_priority,
  1576		.get = param_get_sched_priority
  1577	};
  1578	EXPORT_SYMBOL_GPL(param_ops_sched_priority);
  1579	
> 1580	int param_set_sched_runtime(const char *val, const struct kernel_param *kp)
  1581	{
  1582		return 0;
  1583	}
> 1584	int param_get_sched_runtime(char *buffer, const struct kernel_param *kp)
  1585	{
  1586		return 0;
  1587	}
  1588	const struct kernel_param_ops param_ops_sched_runtime = {
  1589		.set = param_set_sched_runtime,
  1590		.get = param_get_sched_runtime
  1591	};
  1592	EXPORT_SYMBOL_GPL(param_ops_sched_runtime);
  1593	
> 1594	int param_set_sched_deadline(const char *val, const struct kernel_param *kp)
  1595	{
  1596		return 0;
  1597	}
> 1598	int param_get_sched_deadline(char *buffer, const struct kernel_param *kp)
  1599	{
  1600		return 0;
  1601	}
  1602	const struct kernel_param_ops param_ops_sched_deadline = {
  1603		.set = param_set_sched_deadline,
  1604		.get = param_get_sched_deadline
  1605	};
  1606	EXPORT_SYMBOL_GPL(param_ops_sched_deadline);
  1607	
> 1608	int param_set_sched_period(const char *val, const struct kernel_param *kp)
  1609	{
  1610		return 0;
  1611	}
> 1612	int param_get_sched_period(char *buffer, const struct kernel_param *kp)
  1613	{
  1614		return 0;
  1615	}
  1616	const struct kernel_param_ops param_ops_sched_period = {
  1617		.set = param_set_sched_period,
  1618		.get = param_get_sched_period
  1619	};
  1620	EXPORT_SYMBOL_GPL(param_ops_sched_period);
  1621	
> 1622	int param_set_sched_util_min(const char *val, const struct kernel_param *kp)
  1623	{
  1624		return 0;
  1625	}
> 1626	int param_get_sched_util_min(char *buffer, const struct kernel_param *kp)
  1627	{
  1628		return 0;
  1629	}
  1630	const struct kernel_param_ops param_ops_sched_util_min = {
  1631		.set = param_set_sched_util_min,
  1632		.get = param_get_sched_util_min
  1633	};
  1634	EXPORT_SYMBOL_GPL(param_ops_sched_util_min);
  1635	
> 1636	int param_set_sched_util_max(const char *val, const struct kernel_param *kp)
  1637	{
  1638		return 0;
  1639	}
> 1640	int param_get_sched_util_max(char *buffer, const struct kernel_param *kp)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
