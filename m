Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86EF9EDC
	for <oe-kbuild-all@lists.linux.dev>; Sat, 26 Aug 2023 07:42:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693035720; x=1724571720;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jP5KcMVcmuHCd0t4ODPpWgAAcSUXHPh89vlXQlHxrRQ=;
  b=CIr4Yes6UEJGDMxfW2xSfNE2b+ZobKOOKNnNPv++oJw0pQHfcajY9eSi
   8cgRCQ/sG8C9FGaJ7bcPmdk4/7KeTLggYu3DEPvC1uIvg7ruchTWBAawp
   e4ekzPQt5d73C7E0HFAwmJAUjo6Nxm7u/A+ZUeYJGRUiX+jERnBiAAxVi
   YG3ZXgb2rY3AptOW8hnPAfxDjpwt+50qJqRLjdOrYWLtVjjZzWkfB8yuE
   z4x1vA/IEC+fkbNisq6BPbDcj/uIYK1ONB0j1AGTWB1GwVoG2FRE/H+5w
   L5HSVTw0ZsFw9KM7QjzCdMq1qit8xn3TFEv9V5Nc4YmpDudlRXvtBTjqJ
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10813"; a="373730849"
X-IronPort-AV: E=Sophos;i="6.02,203,1688454000"; 
   d="scan'208";a="373730849"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2023 00:41:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; 
   d="scan'208";a="881396449"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 26 Aug 2023 00:42:03 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qZnv6-0004Sh-1R;
	Sat, 26 Aug 2023 07:41:30 +0000
Date: Sat, 26 Aug 2023 15:40:34 +0800
From: kernel test robot <lkp@intel.com>
To: Qais Yousef <qyousef@layalina.io>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [qais-yousef:sched-setscheduler-hide 9/9]
 include/linux/kthread.h:28:65: warning: 'struct kernel_param' declared
 inside parameter list will not be visible outside of this definition or
 declaration
Message-ID: <202308261506.HViL7oWg-lkp@intel.com>
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
config: arm-randconfig-r024-20230826 (https://download.01.org/0day-ci/archive/20230826/202308261506.HViL7oWg-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230826/202308261506.HViL7oWg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308261506.HViL7oWg-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from kernel/locking/test-ww_mutex.c:10:
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


vim +28 include/linux/kthread.h

     7	
     8	#define ___kthread_param(name, type, attr, perm) do {	\
     9		static type attr;				\
    10		__module_param_call("kthread." name ".", attr , &param_ops_##attr, &attr, perm, -1, 0); \
    11		} while(0)
    12	
    13	#define __kthread_param(name, type, attr)		\
    14		___kthread_param(name, type, attr, 0644)	\
    15	
    16	#define kthread_param(name) do {					\
    17		__kthread_param(name, unsigned long, sched_policy);		\
    18		__kthread_param(name, long, sched_nice);			\
    19		__kthread_param(name, unsigned long, sched_priority);		\
    20		__kthread_param(name, unsigned long long, sched_runtime);	\
    21		__kthread_param(name, unsigned long long, sched_deadline);	\
    22		__kthread_param(name, unsigned long long, sched_period);	\
    23		__kthread_param(name, unsigned long, sched_util_min);		\
    24		__kthread_param(name, unsigned long, sched_util_max);		\
    25		} while (0)
    26	
    27	extern const struct kernel_param_ops param_ops_sched_policy;
  > 28	extern int param_set_sched_policy(const char *val, const struct kernel_param *kp);
    29	extern int param_get_sched_policy(char *buffer, const struct kernel_param *kp);
    30	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
