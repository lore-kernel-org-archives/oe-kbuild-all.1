Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E35BD156F7
	for <oe-kbuild-all@lists.linux.dev>; Tue, 15 Aug 2023 19:03:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692126223; x=1723662223;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mob6uV0NmwWtVx7SB1rV9SUiWIZR3c5CMcOV97Ubq/0=;
  b=b64TQFGVd7f67nHgEy5nJ5xMGanrGt6b50uCOv1ssN6oWH+QfzRsse8F
   +U1tg5A5OhqvW9nWfYlbFAE6QcCt9SoOKlxsXmCHclDWGvI9/YVzqEfFY
   +xRxaaXBLHwgbkPepEXnPWZyJMDsGS1axoPvSU1fkhhtP8fvnFyaVbPnl
   L+dujogTzAFhIWMhuXrGVPsUmIS9GfcGaYzXHC8YZKA71wOM/rJQYYCFB
   9llAzyANwxFk5KJQUeaYVfTDGPgumHa6j+QJ5XuHDp2c6+jETvKFeyiA5
   yfr6iGd1SXjKL9BR2VemgqSGEycM9cnqtN28fXQAGLpN0f+96n3JfX2q1
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="369829508"
X-IronPort-AV: E=Sophos;i="6.01,175,1684825200"; 
   d="scan'208";a="369829508"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Aug 2023 12:03:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="799288114"
X-IronPort-AV: E=Sophos;i="6.01,175,1684825200"; 
   d="scan'208";a="799288114"
Received: from lkp-server02.sh.intel.com (HELO b5fb8d9e1ffc) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 15 Aug 2023 12:03:40 -0700
Received: from kbuild by b5fb8d9e1ffc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qVzK0-0001Ad-2v;
	Tue, 15 Aug 2023 19:03:21 +0000
Date: Wed, 16 Aug 2023 03:03:00 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android11-5.4 5610/27202]
 kernel/power/wakeup_reason.c:199:6: warning: no previous prototype for
 '__log_abort_or_abnormal_wake'
Message-ID: <202308160340.gPc2YbED-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Kelly,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android11-5.4
head:   f38754f7336474b5be6745c90563e6c32b921793
commit: 189ced91cd7b0e440b0be876406fd36313a11c3f [5610/27202] ANDROID: power: wakeup_reason: wake reason enhancements
config: x86_64-buildonly-randconfig-r002-20230816 (https://download.01.org/0day-ci/archive/20230816/202308160340.gPc2YbED-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230816/202308160340.gPc2YbED-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308160340.gPc2YbED-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/power/wakeup_reason.c:199:6: warning: no previous prototype for '__log_abort_or_abnormal_wake' [-Wmissing-prototypes]
     199 | void __log_abort_or_abnormal_wake(bool abort, const char *fmt, va_list args)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/power/wakeup_reason.c: In function '__log_abort_or_abnormal_wake':
   kernel/power/wakeup_reason.c:213:9: warning: function '__log_abort_or_abnormal_wake' might be a candidate for 'gnu_printf' format attribute [-Wsuggest-attribute=format]
     213 |         vsnprintf(non_irq_wake_reason, MAX_SUSPEND_ABORT_LEN, fmt, args);
         |         ^~~~~~~~~
   kernel/power/wakeup_reason.c: At top level:
   kernel/power/wakeup_reason.c:378:12: warning: no previous prototype for 'wakeup_reason_init' [-Wmissing-prototypes]
     378 | int __init wakeup_reason_init(void)
         |            ^~~~~~~~~~~~~~~~~~


vim +/__log_abort_or_abnormal_wake +199 kernel/power/wakeup_reason.c

   198	
 > 199	void __log_abort_or_abnormal_wake(bool abort, const char *fmt, va_list args)
   200	{
   201		unsigned long flags;
   202	
   203		spin_lock_irqsave(&wakeup_reason_lock, flags);
   204	
   205		/* Suspend abort or abnormal wake reason has already been logged. */
   206		if (suspend_abort || abnormal_wake) {
   207			spin_unlock_irqrestore(&wakeup_reason_lock, flags);
   208			return;
   209		}
   210	
   211		suspend_abort = abort;
   212		abnormal_wake = !abort;
   213		vsnprintf(non_irq_wake_reason, MAX_SUSPEND_ABORT_LEN, fmt, args);
   214	
   215		spin_unlock_irqrestore(&wakeup_reason_lock, flags);
   216	}
   217	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
