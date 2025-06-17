Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCF3B2F532C
	for <oe-kbuild-all@lists.linux.dev>; Tue, 17 Jun 2025 23:07:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750201652; cv=none; b=Cke+KvvUGngUTYOggSCVyFNoe7Pm2QCItqpEG5EFPIQWECK4Js5aZsPFtYGLxUADLzXrZnmvvUiCl2Y/EN8IxCbqzeUMP/w+JJRNm3A6/7Rj/S1hEoUnRzkbLbpq9o1fODj/Ca2RMNZOitse9pNLDr4jpuO3MtlK59b1bpu5jjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750201652; c=relaxed/simple;
	bh=R55hPXEgCzAYmnjRnfA3eQw568xIhzzjhq7iPLbxx/Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=aaEP1jmmeKsBaMK7p377i2bTXPG51hks0mDWz7VEn4MAnXqZtjUrRz0DFyq2rr+HqVCJF4LJPUEZVrj7DRSUtLagq+GNTtmPcJbuuhJrsR80VYII0Rf+9aQxgPZg6z1xbgjAl1krTJwTOD5mKYhcE8GiA79kHBLfqCk7t2sgoAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NU4c8f+R; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NU4c8f+R"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750201650; x=1781737650;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=R55hPXEgCzAYmnjRnfA3eQw568xIhzzjhq7iPLbxx/Y=;
  b=NU4c8f+R97jlppVzprM2VDVlczOq4YFTqhXetkDcnCbI83Gxc96YmAe8
   dmbezQIruu7UhLl3uL/P98t8feA/x5dAo/pmE8247kiJmDtlhLSP+jrla
   FObORhdaRlPKDuWBLlnkSucm1Kz10N3qOgyEw2eb8ilGtjFxG1j7GrHFl
   WuC0AWV44yNtPdKfmrM6KLRq1/EG/Viam5KiZzvUvBKNnWg6+P9A8xd/U
   kFZ1+MhqKs6UY2tws5jJY675LxTGuz1uVSY2gboUNBv4HOxcHtKSS7B0l
   GxtE1Yanloy5qzQMtnpKITH+1EsoIsBDCFG65ct5v/XqPNd5yTyrPomKF
   g==;
X-CSE-ConnectionGUID: haxvbXAeR7uhy16xhbpXeQ==
X-CSE-MsgGUID: Hdu7IoyCTqq0nDA+7L/ccQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11467"; a="69851684"
X-IronPort-AV: E=Sophos;i="6.16,244,1744095600"; 
   d="scan'208";a="69851684"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2025 16:07:29 -0700
X-CSE-ConnectionGUID: v0CkDStXTmSO+mHHVxC2yw==
X-CSE-MsgGUID: uG0YLWJTRAe75ezg5tv9+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,244,1744095600"; 
   d="scan'208";a="186295119"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 17 Jun 2025 16:07:28 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uRfOo-000JCk-0T;
	Tue, 17 Jun 2025 23:07:26 +0000
Date: Wed, 18 Jun 2025 07:07:05 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-5.10-2025-06 1/1]
 include/trace/trace_events.h:27:23: warning:
 'str__binder__trace_system_name' defined but not used
Message-ID: <202506180616.3cPBI74y-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi JianMin,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android12-5.10-2025-06
head:   484c3d56a37435198fa13276c8c97acda5ac28f4
commit: 3fc5e942554eb435a2afd5113778eefd2a97f19b [1/1] ANDROID: binder: Add vendor hook to the binder
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20250618/202506180616.3cPBI74y-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250618/202506180616.3cPBI74y-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506180616.3cPBI74y-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/trace/define_trace.h:102,
                    from include/trace/hooks/binder.h:33,
                    from drivers/android/vendor_hooks.c:13:
>> include/trace/trace_events.h:27:23: warning: 'str__binder__trace_system_name' defined but not used [-Wunused-const-variable=]
      27 | #define __app__(x, y) str__##x##y
         |                       ^~~~~
   include/trace/trace_events.h:28:21: note: in expansion of macro '__app__'
      28 | #define __app(x, y) __app__(x, y)
         |                     ^~~~~~~
   include/trace/trace_events.h:30:29: note: in expansion of macro '__app'
      30 | #define TRACE_SYSTEM_STRING __app(TRACE_SYSTEM_VAR,__trace_system_name)
         |                             ^~~~~
   include/trace/trace_events.h:33:27: note: in expansion of macro 'TRACE_SYSTEM_STRING'
      33 |         static const char TRACE_SYSTEM_STRING[] =       \
         |                           ^~~~~~~~~~~~~~~~~~~
   include/trace/trace_events.h:36:1: note: in expansion of macro 'TRACE_MAKE_SYSTEM_STR'
      36 | TRACE_MAKE_SYSTEM_STR();
         | ^~~~~~~~~~~~~~~~~~~~~
   In file included from include/trace/define_trace.h:102,
                    from include/trace/hooks/fpsimd.h:26,
                    from drivers/android/vendor_hooks.c:12:
   include/trace/trace_events.h:27:23: warning: 'str__fpsimd__trace_system_name' defined but not used [-Wunused-const-variable=]
      27 | #define __app__(x, y) str__##x##y
         |                       ^~~~~
   include/trace/trace_events.h:28:21: note: in expansion of macro '__app__'
      28 | #define __app(x, y) __app__(x, y)
         |                     ^~~~~~~
   include/trace/trace_events.h:30:29: note: in expansion of macro '__app'
      30 | #define TRACE_SYSTEM_STRING __app(TRACE_SYSTEM_VAR,__trace_system_name)
         |                             ^~~~~
   include/trace/trace_events.h:33:27: note: in expansion of macro 'TRACE_SYSTEM_STRING'
      33 |         static const char TRACE_SYSTEM_STRING[] =       \
         |                           ^~~~~~~~~~~~~~~~~~~
   include/trace/trace_events.h:36:1: note: in expansion of macro 'TRACE_MAKE_SYSTEM_STR'
      36 | TRACE_MAKE_SYSTEM_STR();
         | ^~~~~~~~~~~~~~~~~~~~~
   In file included from include/trace/define_trace.h:102,
                    from include/trace/hooks/sched.h:60,
                    from drivers/android/vendor_hooks.c:11:
   include/trace/trace_events.h:27:23: warning: 'str__sched__trace_system_name' defined but not used [-Wunused-const-variable=]
      27 | #define __app__(x, y) str__##x##y
         |                       ^~~~~
   include/trace/trace_events.h:28:21: note: in expansion of macro '__app__'
      28 | #define __app(x, y) __app__(x, y)
         |                     ^~~~~~~
   include/trace/trace_events.h:30:29: note: in expansion of macro '__app'
      30 | #define TRACE_SYSTEM_STRING __app(TRACE_SYSTEM_VAR,__trace_system_name)
         |                             ^~~~~
   include/trace/trace_events.h:33:27: note: in expansion of macro 'TRACE_SYSTEM_STRING'
      33 |         static const char TRACE_SYSTEM_STRING[] =       \
         |                           ^~~~~~~~~~~~~~~~~~~
   include/trace/trace_events.h:36:1: note: in expansion of macro 'TRACE_MAKE_SYSTEM_STR'
      36 | TRACE_MAKE_SYSTEM_STR();
         | ^~~~~~~~~~~~~~~~~~~~~


vim +/str__binder__trace_system_name +27 include/trace/trace_events.h

acd388fd3af350 include/trace/ftrace.h Steven Rostedt (Red Hat  2015-03-31  26) 
acd388fd3af350 include/trace/ftrace.h Steven Rostedt (Red Hat  2015-03-31 @27) #define __app__(x, y) str__##x##y
acd388fd3af350 include/trace/ftrace.h Steven Rostedt (Red Hat  2015-03-31  28) #define __app(x, y) __app__(x, y)
acd388fd3af350 include/trace/ftrace.h Steven Rostedt (Red Hat  2015-03-31  29) 

:::::: The code at line 27 was first introduced by commit
:::::: acd388fd3af350ab24c6ab6f19b83fc4a4f3aa60 tracing: Give system name a pointer

:::::: TO: Steven Rostedt (Red Hat) <rostedt@goodmis.org>
:::::: CC: Steven Rostedt <rostedt@goodmis.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
