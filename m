Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA77636606E
	for <oe-kbuild-all@lists.linux.dev>; Tue, 17 Mar 2026 17:24:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773768256; cv=none; b=hsFP2PwIw0w478vX6Beb+UM/od2ROGCiTQGp8p5vpfpUEriPYph94DaHygPh/Eqz3IBXloSaoMH9uH1inboyk/VZWFW00R1tUGezoBTCZO06W/LIDsnqTZEE8JFNVyJ3vVPlPB+FqiJ1nVAKGN5FcHGFc/RRsjErpQ0O155up/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773768256; c=relaxed/simple;
	bh=Pn8bLHRiZr8XCIWphTbNUK9lz8T0sq1xn+a+5ocWJ0g=;
	h=Date:From:To:Cc:Subject:Message-ID; b=qqCZxEaJE28M6ezWrDbECLPs0IH2DzAdSE2M88DBkfHkVAHpjDczg9IAB+jxHE2znsAuPIO1ESwZ8mgMKD/ENPH2/Fw1UFuJ3I7ZM5r4Mmn7A5f4lAzMEyrlQj2A0JOOgSpapCE6FRN8+bDj3Zf0eYhnHHR/bkioZlkVqXxMuS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=N6yf2aeV; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="N6yf2aeV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773768250; x=1805304250;
  h=date:from:to:cc:subject:message-id;
  bh=Pn8bLHRiZr8XCIWphTbNUK9lz8T0sq1xn+a+5ocWJ0g=;
  b=N6yf2aeVak9UGTt0tp7qbxGCQYeTlMCRuqsHUbFpsj12gGLMvI77OtDd
   rq5Wo3v8K7Mh00PEDIkQp/O+C97qplXgtZU/KtYq4zgStcTPEC7OlQaGX
   lOMxaeZRZ+cjdeNfXtfAy6byi4wzUUyyFqHDs2xuwE//3dOMCq7O6fUZp
   EV2Rx9iRRR0iF82ZVrn4PIb+ybgGqnnq+aa4eeDIGso8W9h3r7Jxbofrn
   lvY3JX+G4bf3psnziWf1gOF5Sz0mh448I3yrdLhNmGBRWNFV8MFPjY9Qx
   8PWtd08eMecOT2wSq3jQkyQhXOgBDiAubDueS5a3PjzMoHk6GeMOJ9KKX
   A==;
X-CSE-ConnectionGUID: Yd4KIetxR5Wzg2aLKYMdsw==
X-CSE-MsgGUID: 8T8kSpYLTK2P8J5PYD03ng==
X-IronPort-AV: E=McAfee;i="6800,10657,11732"; a="100265745"
X-IronPort-AV: E=Sophos;i="6.23,126,1770624000"; 
   d="scan'208";a="100265745"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2026 10:24:09 -0700
X-CSE-ConnectionGUID: ZGMjWqB/TmmSdtmIPGaV3w==
X-CSE-MsgGUID: QBXX9erwSuuFG9QYC0An6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,126,1770624000"; 
   d="scan'208";a="226478375"
Received: from lkp-server01.sh.intel.com (HELO 63737dd503cb) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 17 Mar 2026 10:24:07 -0700
Received: from kbuild by 63737dd503cb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w2Y9E-000000001RQ-2KDO;
	Tue, 17 Mar 2026 17:24:04 +0000
Date: Wed, 18 Mar 2026 01:23:24 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-kiwi-6.1 132/132]
 include/trace/stages/init.h:2:23: warning: 'str__module__trace_system_name'
 defined but not used
Message-ID: <202603180136.6Rs7vZvX-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Kuan-Ying,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android14-kiwi-6.1
head:   73a9b50e23202b4fe10f285b4cfe0efaa5dbb0ca
commit: 60e6687899e0f2244a9854444f4fdb940dba350d [132/132] ANDROID: module: Add vendor hooks
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20260318/202603180136.6Rs7vZvX-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260318/202603180136.6Rs7vZvX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603180136.6Rs7vZvX-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/trace/trace_events.h:27,
                    from include/trace/define_trace.h:102,
                    from include/trace/hooks/remoteproc.h:26,
                    from drivers/android/vendor_hooks.c:38:
   include/trace/stages/init.h:2:23: warning: 'str__remoteproc__trace_system_name' defined but not used [-Wunused-const-variable=]
       2 | #define __app__(x, y) str__##x##y
         |                       ^~~~~
   include/trace/stages/init.h:3:21: note: in expansion of macro '__app__'
       3 | #define __app(x, y) __app__(x, y)
         |                     ^~~~~~~
   include/trace/stages/init.h:5:29: note: in expansion of macro '__app'
       5 | #define TRACE_SYSTEM_STRING __app(TRACE_SYSTEM_VAR,__trace_system_name)
         |                             ^~~~~
   include/trace/stages/init.h:8:27: note: in expansion of macro 'TRACE_SYSTEM_STRING'
       8 |         static const char TRACE_SYSTEM_STRING[] =       \
         |                           ^~~~~~~~~~~~~~~~~~~
   include/trace/stages/init.h:11:1: note: in expansion of macro 'TRACE_MAKE_SYSTEM_STR'
      11 | TRACE_MAKE_SYSTEM_STR();
         | ^~~~~~~~~~~~~~~~~~~~~
   In file included from include/trace/trace_events.h:27,
                    from include/trace/define_trace.h:102,
                    from include/trace/hooks/syscall_check.h:30,
                    from drivers/android/vendor_hooks.c:37:
   include/trace/stages/init.h:2:23: warning: 'str__syscall_check__trace_system_name' defined but not used [-Wunused-const-variable=]
       2 | #define __app__(x, y) str__##x##y
         |                       ^~~~~
   include/trace/stages/init.h:3:21: note: in expansion of macro '__app__'
       3 | #define __app(x, y) __app__(x, y)
         |                     ^~~~~~~
   include/trace/stages/init.h:5:29: note: in expansion of macro '__app'
       5 | #define TRACE_SYSTEM_STRING __app(TRACE_SYSTEM_VAR,__trace_system_name)
         |                             ^~~~~
   include/trace/stages/init.h:8:27: note: in expansion of macro 'TRACE_SYSTEM_STRING'
       8 |         static const char TRACE_SYSTEM_STRING[] =       \
         |                           ^~~~~~~~~~~~~~~~~~~
   include/trace/stages/init.h:11:1: note: in expansion of macro 'TRACE_MAKE_SYSTEM_STR'
      11 | TRACE_MAKE_SYSTEM_STR();
         | ^~~~~~~~~~~~~~~~~~~~~
   In file included from include/trace/trace_events.h:27,
                    from include/trace/define_trace.h:102,
                    from include/trace/hooks/selinux.h:20,
                    from drivers/android/vendor_hooks.c:36:
   include/trace/stages/init.h:2:23: warning: 'str__selinux__trace_system_name' defined but not used [-Wunused-const-variable=]
       2 | #define __app__(x, y) str__##x##y
         |                       ^~~~~
   include/trace/stages/init.h:3:21: note: in expansion of macro '__app__'
       3 | #define __app(x, y) __app__(x, y)
         |                     ^~~~~~~
   include/trace/stages/init.h:5:29: note: in expansion of macro '__app'
       5 | #define TRACE_SYSTEM_STRING __app(TRACE_SYSTEM_VAR,__trace_system_name)
         |                             ^~~~~
   include/trace/stages/init.h:8:27: note: in expansion of macro 'TRACE_SYSTEM_STRING'
       8 |         static const char TRACE_SYSTEM_STRING[] =       \
         |                           ^~~~~~~~~~~~~~~~~~~
   include/trace/stages/init.h:11:1: note: in expansion of macro 'TRACE_MAKE_SYSTEM_STR'
      11 | TRACE_MAKE_SYSTEM_STR();
         | ^~~~~~~~~~~~~~~~~~~~~
   In file included from include/trace/trace_events.h:27,
                    from include/trace/define_trace.h:102,
                    from include/trace/hooks/module.h:32,
                    from drivers/android/vendor_hooks.c:35:
>> include/trace/stages/init.h:2:23: warning: 'str__module__trace_system_name' defined but not used [-Wunused-const-variable=]
       2 | #define __app__(x, y) str__##x##y
         |                       ^~~~~
   include/trace/stages/init.h:3:21: note: in expansion of macro '__app__'
       3 | #define __app(x, y) __app__(x, y)
         |                     ^~~~~~~
   include/trace/stages/init.h:5:29: note: in expansion of macro '__app'
       5 | #define TRACE_SYSTEM_STRING __app(TRACE_SYSTEM_VAR,__trace_system_name)
         |                             ^~~~~
   include/trace/stages/init.h:8:27: note: in expansion of macro 'TRACE_SYSTEM_STRING'
       8 |         static const char TRACE_SYSTEM_STRING[] =       \
         |                           ^~~~~~~~~~~~~~~~~~~
   include/trace/stages/init.h:11:1: note: in expansion of macro 'TRACE_MAKE_SYSTEM_STR'
      11 | TRACE_MAKE_SYSTEM_STR();
         | ^~~~~~~~~~~~~~~~~~~~~
   In file included from include/trace/trace_events.h:27,
                    from include/trace/define_trace.h:102,
                    from include/trace/hooks/creds.h:33,
                    from drivers/android/vendor_hooks.c:34:
   include/trace/stages/init.h:2:23: warning: 'str__creds__trace_system_name' defined but not used [-Wunused-const-variable=]
       2 | #define __app__(x, y) str__##x##y
         |                       ^~~~~
   include/trace/stages/init.h:3:21: note: in expansion of macro '__app__'
       3 | #define __app(x, y) __app__(x, y)
         |                     ^~~~~~~
   include/trace/stages/init.h:5:29: note: in expansion of macro '__app'
       5 | #define TRACE_SYSTEM_STRING __app(TRACE_SYSTEM_VAR,__trace_system_name)
         |                             ^~~~~
   include/trace/stages/init.h:8:27: note: in expansion of macro 'TRACE_SYSTEM_STRING'
       8 |         static const char TRACE_SYSTEM_STRING[] =       \
         |                           ^~~~~~~~~~~~~~~~~~~
   include/trace/stages/init.h:11:1: note: in expansion of macro 'TRACE_MAKE_SYSTEM_STR'
      11 | TRACE_MAKE_SYSTEM_STR();
         | ^~~~~~~~~~~~~~~~~~~~~
   In file included from include/trace/trace_events.h:27,
                    from include/trace/define_trace.h:102,
                    from include/trace/hooks/avc.h:32,
                    from drivers/android/vendor_hooks.c:33:
   include/trace/stages/init.h:2:23: warning: 'str__avc__trace_system_name' defined but not used [-Wunused-const-variable=]
       2 | #define __app__(x, y) str__##x##y
         |                       ^~~~~
   include/trace/stages/init.h:3:21: note: in expansion of macro '__app__'
       3 | #define __app(x, y) __app__(x, y)
         |                     ^~~~~~~
   include/trace/stages/init.h:5:29: note: in expansion of macro '__app'
       5 | #define TRACE_SYSTEM_STRING __app(TRACE_SYSTEM_VAR,__trace_system_name)
         |                             ^~~~~
   include/trace/stages/init.h:8:27: note: in expansion of macro 'TRACE_SYSTEM_STRING'
       8 |         static const char TRACE_SYSTEM_STRING[] =       \
         |                           ^~~~~~~~~~~~~~~~~~~
   include/trace/stages/init.h:11:1: note: in expansion of macro 'TRACE_MAKE_SYSTEM_STR'
      11 | TRACE_MAKE_SYSTEM_STR();
         | ^~~~~~~~~~~~~~~~~~~~~
   In file included from include/trace/trace_events.h:27,
                    from include/trace/define_trace.h:102,
                    from include/trace/hooks/vmscan.h:17,
                    from drivers/android/vendor_hooks.c:32:
   include/trace/stages/init.h:2:23: warning: 'str__vmscan__trace_system_name' defined but not used [-Wunused-const-variable=]
       2 | #define __app__(x, y) str__##x##y
         |                       ^~~~~
   include/trace/stages/init.h:3:21: note: in expansion of macro '__app__'
       3 | #define __app(x, y) __app__(x, y)
         |                     ^~~~~~~
   include/trace/stages/init.h:5:29: note: in expansion of macro '__app'
       5 | #define TRACE_SYSTEM_STRING __app(TRACE_SYSTEM_VAR,__trace_system_name)
         |                             ^~~~~
   include/trace/stages/init.h:8:27: note: in expansion of macro 'TRACE_SYSTEM_STRING'
       8 |         static const char TRACE_SYSTEM_STRING[] =       \
         |                           ^~~~~~~~~~~~~~~~~~~
   include/trace/stages/init.h:11:1: note: in expansion of macro 'TRACE_MAKE_SYSTEM_STR'
      11 | TRACE_MAKE_SYSTEM_STR();
         | ^~~~~~~~~~~~~~~~~~~~~
   In file included from include/trace/trace_events.h:27,
                    from include/trace/define_trace.h:102,
                    from include/trace/hooks/cpuidle_psci.h:24,
                    from drivers/android/vendor_hooks.c:31:
   include/trace/stages/init.h:2:23: warning: 'str__cpuidle_psci__trace_system_name' defined but not used [-Wunused-const-variable=]
       2 | #define __app__(x, y) str__##x##y
         |                       ^~~~~
   include/trace/stages/init.h:3:21: note: in expansion of macro '__app__'
       3 | #define __app(x, y) __app__(x, y)
         |                     ^~~~~~~
   include/trace/stages/init.h:5:29: note: in expansion of macro '__app'
       5 | #define TRACE_SYSTEM_STRING __app(TRACE_SYSTEM_VAR,__trace_system_name)
         |                             ^~~~~
   include/trace/stages/init.h:8:27: note: in expansion of macro 'TRACE_SYSTEM_STRING'
       8 |         static const char TRACE_SYSTEM_STRING[] =       \
         |                           ^~~~~~~~~~~~~~~~~~~
   include/trace/stages/init.h:11:1: note: in expansion of macro 'TRACE_MAKE_SYSTEM_STR'
      11 | TRACE_MAKE_SYSTEM_STR();
         | ^~~~~~~~~~~~~~~~~~~~~
   In file included from include/trace/trace_events.h:27,
                    from include/trace/define_trace.h:102,
                    from include/trace/hooks/pm_domain.h:20,
                    from drivers/android/vendor_hooks.c:30:
   include/trace/stages/init.h:2:23: warning: 'str__pm_domain__trace_system_name' defined but not used [-Wunused-const-variable=]
       2 | #define __app__(x, y) str__##x##y
         |                       ^~~~~
   include/trace/stages/init.h:3:21: note: in expansion of macro '__app__'
       3 | #define __app(x, y) __app__(x, y)
         |                     ^~~~~~~


vim +/str__module__trace_system_name +2 include/trace/stages/init.h

af6b9668e85ffd Steven Rostedt (Google  2022-03-03  @2) #define __app__(x, y) str__##x##y
af6b9668e85ffd Steven Rostedt (Google  2022-03-03   3) #define __app(x, y) __app__(x, y)
af6b9668e85ffd Steven Rostedt (Google  2022-03-03   4) 
af6b9668e85ffd Steven Rostedt (Google  2022-03-03   5) #define TRACE_SYSTEM_STRING __app(TRACE_SYSTEM_VAR,__trace_system_name)
af6b9668e85ffd Steven Rostedt (Google  2022-03-03   6) 
af6b9668e85ffd Steven Rostedt (Google  2022-03-03   7) #define TRACE_MAKE_SYSTEM_STR()				\
af6b9668e85ffd Steven Rostedt (Google  2022-03-03   8) 	static const char TRACE_SYSTEM_STRING[] =	\
af6b9668e85ffd Steven Rostedt (Google  2022-03-03   9) 		__stringify(TRACE_SYSTEM)
af6b9668e85ffd Steven Rostedt (Google  2022-03-03  10) 
af6b9668e85ffd Steven Rostedt (Google  2022-03-03 @11) TRACE_MAKE_SYSTEM_STR();
af6b9668e85ffd Steven Rostedt (Google  2022-03-03  12) 

:::::: The code at line 2 was first introduced by commit
:::::: af6b9668e85ffd1502aada8036ccbf4dbd481708 tracing: Move the defines to create TRACE_EVENTS into their own files

:::::: TO: Steven Rostedt (Google) <rostedt@goodmis.org>
:::::: CC: Steven Rostedt (Google) <rostedt@goodmis.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
