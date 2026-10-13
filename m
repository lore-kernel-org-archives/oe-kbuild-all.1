Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AD91414430
	for <oe-kbuild-all@lists.linux.dev>; Tue, 13 Oct 2026 01:36:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791855391; cv=none; b=J5QXwqPALAc1mm9+nrhfyjmBpMYCN8jIZb4PhPgkVUMu8D4kD6cJahZeHOD6zSoR6dUJKVqU6Uo1JGwq9VYHAtX6bCDwf//iQCJ2/pmc/7BcX/BqnvLLjKcaqAattYKe8tcP7Ot0UGUf5+NCA9/QAs2eUWJT3CQNTRHOR8y2xIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791855391; c=relaxed/simple;
	bh=P5AHBmiAXlZYiZ8OfbmNtkbidl9FvVqAk9PdeK3IPvM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=K+YidB2hzR23FeCXzHC13SpvG2yY6GSE9pFLerp7EhUi7g557c3yryOLPcknu4xHrGseM8v/LMd7f3nTgUFkvuT7ReQOzGmoUyuwsg8IiyfS3ytbVR83358fA6DNgbEPdo2s/8dzRtwe/e4O3m2WHDBoQ0gpspw3F25DvBMlpNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZRcQua89; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZRcQua89"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791855389; x=1823391389;
  h=date:from:to:cc:subject:message-id;
  bh=P5AHBmiAXlZYiZ8OfbmNtkbidl9FvVqAk9PdeK3IPvM=;
  b=ZRcQua89VFaNNusLcYgJ/gAunCZ97JPa4uAqShWsJ/Mq9j66GPo/0fCp
   uoj9jwkg+/HKWvekZFyA+MFUUa3GCeJimtGHsXI+DcOK9Qk4NHb4c/+MM
   be/NMFSnmvuZbzAdSDOXxZznDUbZi4Wzia9ILkFeCGmtMNnU4Fk000Hhq
   Te1otbQLLzoNlhNp98Fcd3Mw/Od0sSDbobqlqpEw+JhtBBdfyhlADHJwo
   owsV7j7fZg7FcJGKkYKYV3uJvXZMAdOoR5NVlA74MLlPcFWtR2wkmMxlE
   PWx6nb+J+4ulGZQqkCZmwx/d0lA5pKANbgrQfPIHCvTYlURb5zZ20Feb5
   w==;
X-CSE-ConnectionGUID: 7KtxiJFKRxq4HoK2yC09lg==
X-CSE-MsgGUID: Tp598vdeQc67B8Bfdfy09A==
X-IronPort-AV: E=McAfee;i="6800,10657,11933"; a="578539"
X-IronPort-AV: E=Sophos;i="6.27,154,1787036400"; 
   d="scan'208";a="578539"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2026 18:36:29 -0700
X-CSE-ConnectionGUID: B/w498t3RIKhcP+mmGb7NA==
X-CSE-MsgGUID: g7EKCFvaSnWedH2XcDBi6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,154,1787036400"; 
   d="scan'208";a="994458"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by orviesa003.jf.intel.com with ESMTP; 12 Oct 2026 18:36:28 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xGRRJ-00000000AL9-0Bxw;
	Tue, 13 Oct 2026 01:36:25 +0000
Date: Tue, 13 Oct 2026 03:35:51 +0200
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 1/1]
 include/trace/stages/init.h:2:23: warning: 'str__sd__trace_system_name'
 defined but not used
Message-ID: <202610130343.Z9fosoN0-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Wei,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   5597a6bf0b11918da3f4fc2e4354f904acd26cc7
commit: a1149b5511f3af6d42d2da9ea2c92615f1e38d33 [1/1] ANDROID: sd: Add vendor hooks
config: arm-randconfig-r2102-20261012 (https://download.01.org/0day-ci/archive/20261013/202610130343.Z9fosoN0-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261013/202610130343.Z9fosoN0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610130343.Z9fosoN0-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/trace/trace_events.h:27,
                    from include/trace/define_trace.h:102,
                    from include/trace/hooks/sd.h:32,
                    from drivers/android/vendor_hooks.c:65:
>> include/trace/stages/init.h:2:23: warning: 'str__sd__trace_system_name' defined but not used [-Wunused-const-variable=]
       2 | #define __app__(x, y) str__##x##y
         |                       ^~~~~
   include/trace/stages/init.h:2:23: note: in definition of macro '__app__'
       2 | #define __app__(x, y) str__##x##y
         |                       ^~~~~
   include/trace/stages/init.h:5:29: note: in expansion of macro '__app'
       5 | #define TRACE_SYSTEM_STRING __app(TRACE_SYSTEM_VAR,__trace_system_name)
         |                             ^~~~~
   include/trace/stages/init.h:8:20: note: in expansion of macro 'TRACE_SYSTEM_STRING'
       8 |  static const char TRACE_SYSTEM_STRING[] = \
         |                    ^~~~~~~~~~~~~~~~~~~
   include/trace/stages/init.h:11:1: note: in expansion of macro 'TRACE_MAKE_SYSTEM_STR'
      11 | TRACE_MAKE_SYSTEM_STR();
         | ^~~~~~~~~~~~~~~~~~~~~
   In file included from include/trace/trace_events.h:27,
                    from include/trace/define_trace.h:102,
                    from include/trace/hooks/compaction.h:20,
                    from drivers/android/vendor_hooks.c:64:
   include/trace/stages/init.h:2:23: warning: 'str__compaction__trace_system_name' defined but not used [-Wunused-const-variable=]
       2 | #define __app__(x, y) str__##x##y
         |                       ^~~~~
   include/trace/stages/init.h:2:23: note: in definition of macro '__app__'
       2 | #define __app__(x, y) str__##x##y
         |                       ^~~~~
   include/trace/stages/init.h:5:29: note: in expansion of macro '__app'
       5 | #define TRACE_SYSTEM_STRING __app(TRACE_SYSTEM_VAR,__trace_system_name)
         |                             ^~~~~
   include/trace/stages/init.h:8:20: note: in expansion of macro 'TRACE_SYSTEM_STRING'
       8 |  static const char TRACE_SYSTEM_STRING[] = \
         |                    ^~~~~~~~~~~~~~~~~~~
   include/trace/stages/init.h:11:1: note: in expansion of macro 'TRACE_MAKE_SYSTEM_STR'
      11 | TRACE_MAKE_SYSTEM_STR();
         | ^~~~~~~~~~~~~~~~~~~~~
   In file included from include/trace/trace_events.h:27,
                    from include/trace/define_trace.h:102,
                    from include/trace/hooks/dmabuf.h:20,
                    from drivers/android/vendor_hooks.c:63:
   include/trace/stages/init.h:2:23: warning: 'str__dmabuf__trace_system_name' defined but not used [-Wunused-const-variable=]
       2 | #define __app__(x, y) str__##x##y
         |                       ^~~~~
   include/trace/stages/init.h:2:23: note: in definition of macro '__app__'
       2 | #define __app__(x, y) str__##x##y
         |                       ^~~~~
   include/trace/stages/init.h:5:29: note: in expansion of macro '__app'
       5 | #define TRACE_SYSTEM_STRING __app(TRACE_SYSTEM_VAR,__trace_system_name)
         |                             ^~~~~
   include/trace/stages/init.h:8:20: note: in expansion of macro 'TRACE_SYSTEM_STRING'
       8 |  static const char TRACE_SYSTEM_STRING[] = \
         |                    ^~~~~~~~~~~~~~~~~~~
   include/trace/stages/init.h:11:1: note: in expansion of macro 'TRACE_MAKE_SYSTEM_STR'
      11 | TRACE_MAKE_SYSTEM_STR();
         | ^~~~~~~~~~~~~~~~~~~~~
   In file included from include/trace/trace_events.h:27,
                    from include/trace/define_trace.h:102,
                    from include/trace/hooks/logbuf.h:25,
                    from drivers/android/vendor_hooks.c:62:
   include/trace/stages/init.h:2:23: warning: 'str__logbuf__trace_system_name' defined but not used [-Wunused-const-variable=]
       2 | #define __app__(x, y) str__##x##y
         |                       ^~~~~
   include/trace/stages/init.h:2:23: note: in definition of macro '__app__'
       2 | #define __app__(x, y) str__##x##y
         |                       ^~~~~
   include/trace/stages/init.h:5:29: note: in expansion of macro '__app'
       5 | #define TRACE_SYSTEM_STRING __app(TRACE_SYSTEM_VAR,__trace_system_name)
         |                             ^~~~~
   include/trace/stages/init.h:8:20: note: in expansion of macro 'TRACE_SYSTEM_STRING'
       8 |  static const char TRACE_SYSTEM_STRING[] = \
         |                    ^~~~~~~~~~~~~~~~~~~
   include/trace/stages/init.h:11:1: note: in expansion of macro 'TRACE_MAKE_SYSTEM_STR'
      11 | TRACE_MAKE_SYSTEM_STR();
         | ^~~~~~~~~~~~~~~~~~~~~
   In file included from include/trace/trace_events.h:27,
                    from include/trace/define_trace.h:102,
                    from include/trace/hooks/signal.h:19,
                    from drivers/android/vendor_hooks.c:61:
   include/trace/stages/init.h:2:23: warning: 'str__signal__trace_system_name' defined but not used [-Wunused-const-variable=]
       2 | #define __app__(x, y) str__##x##y
         |                       ^~~~~
   include/trace/stages/init.h:2:23: note: in definition of macro '__app__'
       2 | #define __app__(x, y) str__##x##y
         |                       ^~~~~
   include/trace/stages/init.h:5:29: note: in expansion of macro '__app'
       5 | #define TRACE_SYSTEM_STRING __app(TRACE_SYSTEM_VAR,__trace_system_name)
         |                             ^~~~~
   include/trace/stages/init.h:8:20: note: in expansion of macro 'TRACE_SYSTEM_STRING'
       8 |  static const char TRACE_SYSTEM_STRING[] = \
         |                    ^~~~~~~~~~~~~~~~~~~
   include/trace/stages/init.h:11:1: note: in expansion of macro 'TRACE_MAKE_SYSTEM_STR'
      11 | TRACE_MAKE_SYSTEM_STR();
         | ^~~~~~~~~~~~~~~~~~~~~
   In file included from include/trace/trace_events.h:27,
                    from include/trace/define_trace.h:102,
                    from include/trace/hooks/gzvm.h:16,
                    from drivers/android/vendor_hooks.c:60:
   include/trace/stages/init.h:2:23: warning: 'str__gzvm__trace_system_name' defined but not used [-Wunused-const-variable=]
       2 | #define __app__(x, y) str__##x##y
         |                       ^~~~~
   include/trace/stages/init.h:2:23: note: in definition of macro '__app__'
       2 | #define __app__(x, y) str__##x##y
         |                       ^~~~~


vim +/str__sd__trace_system_name +2 include/trace/stages/init.h

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
