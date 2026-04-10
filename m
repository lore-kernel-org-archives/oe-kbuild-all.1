Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4727A3921DC
	for <oe-kbuild-all@lists.linux.dev>; Fri, 10 Apr 2026 23:58:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775865508; cv=none; b=GrQ+irJUTAZhLTbRMDMW0/QA4hQrbB5ZfePbKbPJZ6CWh3DZ662hotu4zUZ41D6yq+zDy5iBNm/8ku5STxB0HjeH/uSZxiUfw5RVcYGbbvPiDJHLEtaF3ifMnlrJeJZWeIzsmmQu0oNULUMO3b6MgAeai8kGCDviC9r5l1VDNJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775865508; c=relaxed/simple;
	bh=ZO+ZPdPINiXrJfJSBT2HJd2q+QaVy0XRmS+LTpI1EGo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ihbi6aoOmfGafnIJSZwpA6AaN5aS/Pq2k8B9LtFN1rpUufs/4Ku7MlLqB2+GGkQOiHhpIzkhZ0r9s2oHPXgTX6nJRiTKX3/jt11BQr33/6MS2Ei+SlYVZKX/nHRVGb7P1yRdnuuPI9Dj/4TOsjUyujWMt7gwa1D7uM5JJOX4qW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KD2cb9F4; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KD2cb9F4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775865507; x=1807401507;
  h=date:from:to:cc:subject:message-id;
  bh=ZO+ZPdPINiXrJfJSBT2HJd2q+QaVy0XRmS+LTpI1EGo=;
  b=KD2cb9F4rSlw+rlhvZNRifjeYExB2UGJ68pEZVrxK1RcfScYPltG0LCf
   Wg0vkVO01Q5OoPJ5bd5q7Q4c+XKmb1ffvLDZaaV207mG4MDttuquxiYFz
   US0CdrSp9gu6llxNHSsmzWarM0x1O0fhOBDaIIqjuTd+zuOoJ8o9VPSdv
   BhOFrgXYiZ4aT/uIYlyQdMyrbNhL7KcSLLHWUktg2Uh+iTn1NBom5hsRo
   eshGeMrtVU1mK/D4d5uFYGW47tII6ivfRClyQtk6L8lnS3TRPcv2FQp2F
   9vPHTZazDlQY5DDtCAPgCCzOTmdHiJ2FyDBmA+idYySWIFWF+wYGqBeNc
   Q==;
X-CSE-ConnectionGUID: bdOpPDLoTjOJclEQcfGHGg==
X-CSE-MsgGUID: M8nyomzYQHWNbZG9p5fsHg==
X-IronPort-AV: E=McAfee;i="6800,10657,11755"; a="88334397"
X-IronPort-AV: E=Sophos;i="6.23,172,1770624000"; 
   d="scan'208";a="88334397"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2026 16:58:27 -0700
X-CSE-ConnectionGUID: 3iQrJ8M/QVK+d+3ltaq5MQ==
X-CSE-MsgGUID: LDYPlRUVQeeIDJo4Qy7OLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,172,1770624000"; 
   d="scan'208";a="252616184"
Received: from lkp-server01.sh.intel.com (HELO 3eaaf1a74b89) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 10 Apr 2026 16:58:25 -0700
Received: from kbuild by 3eaaf1a74b89 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wBLjz-000000000Px-1OOM;
	Fri, 10 Apr 2026 23:58:23 +0000
Date: Sat, 11 Apr 2026 07:57:56 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 2/2]
 include/trace/stages/init.h:2:23: warning: 'str__xhci__trace_system_name'
 defined but not used
Message-ID: <202604110710.RmMXwZcq-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi HyungJae,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   769fa413e80cca30ff767f6f3e18f920d0353f67
commit: 1586d3cdc925ae9352529763ac1eabc69c09a15d [2/2] ANDROID: USB: add vendor hook functions for USB
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20260411/202604110710.RmMXwZcq-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260411/202604110710.RmMXwZcq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604110710.RmMXwZcq-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/trace/trace_events.h:27,
                    from include/trace/define_trace.h:102,
                    from include/trace/hooks/xhci.h:25,
                    from drivers/android/vendor_hooks.c:83:
>> include/trace/stages/init.h:2:23: warning: 'str__xhci__trace_system_name' defined but not used [-Wunused-const-variable=]
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
                    from include/trace/hooks/dmabuf.h:30,
                    from drivers/android/vendor_hooks.c:82:
   include/trace/stages/init.h:2:23: warning: 'str__dmabuf__trace_system_name' defined but not used [-Wunused-const-variable=]
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
                    from include/trace/hooks/perf.h:24,
                    from drivers/android/vendor_hooks.c:81:
   include/trace/stages/init.h:2:23: warning: 'str__perf__trace_system_name' defined but not used [-Wunused-const-variable=]
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
                    from include/trace/hooks/fsnotify.h:22,
                    from drivers/android/vendor_hooks.c:80:
   include/trace/stages/init.h:2:23: warning: 'str__fsnotify__trace_system_name' defined but not used [-Wunused-const-variable=]
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
                    from include/trace/hooks/suspend.h:23,
                    from drivers/android/vendor_hooks.c:79:
   include/trace/stages/init.h:2:23: warning: 'str__suspend__trace_system_name' defined but not used [-Wunused-const-variable=]
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
                    from include/trace/hooks/blk.h:50,
                    from drivers/android/vendor_hooks.c:78:
   include/trace/stages/init.h:2:23: warning: 'str__blk__trace_system_name' defined but not used [-Wunused-const-variable=]
       2 | #define __app__(x, y) str__##x##y
         |                       ^~~~~
   include/trace/stages/init.h:3:21: note: in expansion of macro '__app__'
       3 | #define __app(x, y) __app__(x, y)
         |                     ^~~~~~~


vim +/str__xhci__trace_system_name +2 include/trace/stages/init.h

af6b9668e85ffd Steven Rostedt (Google  2022-03-03 @2) #define __app__(x, y) str__##x##y
af6b9668e85ffd Steven Rostedt (Google  2022-03-03  3) #define __app(x, y) __app__(x, y)
af6b9668e85ffd Steven Rostedt (Google  2022-03-03  4) 

:::::: The code at line 2 was first introduced by commit
:::::: af6b9668e85ffd1502aada8036ccbf4dbd481708 tracing: Move the defines to create TRACE_EVENTS into their own files

:::::: TO: Steven Rostedt (Google) <rostedt@goodmis.org>
:::::: CC: Steven Rostedt (Google) <rostedt@goodmis.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
