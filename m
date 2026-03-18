Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE1AA352FB3
	for <oe-kbuild-all@lists.linux.dev>; Wed, 18 Mar 2026 04:39:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773808770; cv=none; b=j/qKnU3FQN7dlrMlcXf8c4LDeCTyjdvf55ILg++/Jf3wjsM8NrkpuosHYbteGZmhxWFW+LLJRDbA69yxGXGSmrGpAXx4Nhj1yiHzZZUAUg35sOrMipCxRIX0O99gRghRgcSNR0+tudfhy0ZwMvEvcV0j+AIzEavl11kwn970Abk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773808770; c=relaxed/simple;
	bh=BicEvFoOhudrQWft3lluKb08s6+USVXEuyMks6TyNG8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=WmFWR++oMcaxfCVx1wBMUIZifz4B4FemkllRYScmxem3BnmtVzGbwxs4aou8+u0Fm1uV+06a9xulsz22kxdTn+Xu5YvSIwldkmm2Ml4HJEklC0eCVGj+zq9YP8KSFV8N9n1RN/0wpir38bxkqVvwM9oseGLVQTC9j+B/Ws+SmiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ViYCwLJ1; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ViYCwLJ1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773808768; x=1805344768;
  h=date:from:to:cc:subject:message-id;
  bh=BicEvFoOhudrQWft3lluKb08s6+USVXEuyMks6TyNG8=;
  b=ViYCwLJ1VclTU82Pa9ikcnL4lNOC88dvQ9ig1JOD0Pa7iXVNz7BlmZvl
   T26bKROLdOdBcnkdovdPLFfJrqEy6yzNlhxnDi3AgRR33mbNkWaDZxoW8
   S1gMvNjIe6CqQhBTBTSrkhajqHfOxE5Z5IZRrtlDLra4AcoWzDk1o3QqM
   6BPQTrV9mBnLPnB+a9UpHrzRu47zGDUC5P9mUhLYgIRQboULXYhYqFyi1
   xFKwUqTmx7XIqhbZGq9nGaMxZkYGkNsGuhFRNcs+HecZUBxNb6xCZ9Cn6
   9NH+4aHfWQx3rnjl3JfrudGksdbvYrYpPZVxj736dKYHnHUm8DqA8flFj
   g==;
X-CSE-ConnectionGUID: t8e2WiwmR/iR82P3ej6noA==
X-CSE-MsgGUID: /+Vr5nXlTfSSdIU0SYIB/g==
X-IronPort-AV: E=McAfee;i="6800,10657,11732"; a="97464591"
X-IronPort-AV: E=Sophos;i="6.23,126,1770624000"; 
   d="scan'208";a="97464591"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2026 21:39:28 -0700
X-CSE-ConnectionGUID: xsKgXmRtSO6NEpq6d89+ZQ==
X-CSE-MsgGUID: nFCDI33/Q5q2aUaINvJLQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,126,1770624000"; 
   d="scan'208";a="222461864"
Received: from lkp-server01.sh.intel.com (HELO 63737dd503cb) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 17 Mar 2026 21:39:25 -0700
Received: from kbuild by 63737dd503cb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w2igj-000000002WR-4Aht;
	Wed, 18 Mar 2026 04:39:21 +0000
Date: Wed, 18 Mar 2026 12:39:19 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 1/1]
 include/trace/stages/init.h:2:23: warning: 'str__cpuinfo__trace_system_name'
 defined but not used
Message-ID: <202603181214.aeuBuDnA-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Dezhi,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   9129a20e2343292daee253ef8f31e94b42fac726
commit: 08c63cde8c2bbdd5ab44c4f644422764f9b9ad14 [1/1] ANDROID: vendor_hooks: add hook to show more vendor cpu info.
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20260318/202603181214.aeuBuDnA-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260318/202603181214.aeuBuDnA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603181214.aeuBuDnA-lkp@intel.com/

All warnings (new ones prefixed by >>):

         | ^~~~~~~~~~~~~~~~~~~~~
   In file included from include/trace/trace_events.h:27,
                    from include/trace/define_trace.h:102,
                    from include/trace/hooks/usb.h:32,
                    from drivers/android/vendor_hooks.c:69:
   include/trace/stages/init.h:2:23: warning: 'str__usb__trace_system_name' defined but not used [-Wunused-const-variable=]
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
                    from include/trace/hooks/dmabuf.h:20,
                    from drivers/android/vendor_hooks.c:68:
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
                    from include/trace/hooks/logbuf.h:25,
                    from drivers/android/vendor_hooks.c:67:
   include/trace/stages/init.h:2:23: warning: 'str__logbuf__trace_system_name' defined but not used [-Wunused-const-variable=]
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
                    from include/trace/hooks/signal.h:19,
                    from drivers/android/vendor_hooks.c:66:
   include/trace/stages/init.h:2:23: warning: 'str__signal__trace_system_name' defined but not used [-Wunused-const-variable=]
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
                    from include/trace/hooks/gzvm.h:16,
                    from drivers/android/vendor_hooks.c:65:
   include/trace/stages/init.h:2:23: warning: 'str__gzvm__trace_system_name' defined but not used [-Wunused-const-variable=]
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
                    from include/trace/hooks/cpuinfo.h:18,
                    from drivers/android/vendor_hooks.c:64:
>> include/trace/stages/init.h:2:23: warning: 'str__cpuinfo__trace_system_name' defined but not used [-Wunused-const-variable=]
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
                    from include/trace/hooks/power.h:38,
                    from drivers/android/vendor_hooks.c:63:
   include/trace/stages/init.h:2:23: warning: 'str__power__trace_system_name' defined but not used [-Wunused-const-variable=]
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
                    from include/trace/hooks/softlockup.h:17,
                    from drivers/android/vendor_hooks.c:62:
   include/trace/stages/init.h:2:23: warning: 'str__softlockup__trace_system_name' defined but not used [-Wunused-const-variable=]
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
                    from include/trace/hooks/bug.h:16,
                    from drivers/android/vendor_hooks.c:61:
   include/trace/stages/init.h:2:23: warning: 'str__bug__trace_system_name' defined but not used [-Wunused-const-variable=]
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
                    from include/trace/hooks/thermal.h:24,
                    from drivers/android/vendor_hooks.c:60:
   include/trace/stages/init.h:2:23: warning: 'str__thermal__trace_system_name' defined but not used [-Wunused-const-variable=]
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
                    from include/trace/hooks/topology.h:37,
                    from drivers/android/vendor_hooks.c:59:
   include/trace/stages/init.h:2:23: warning: 'str__topology__trace_system_name' defined but not used [-Wunused-const-variable=]
       2 | #define __app__(x, y) str__##x##y
         |                       ^~~~~
   include/trace/stages/init.h:3:21: note: in expansion of macro '__app__'
       3 | #define __app(x, y) __app__(x, y)
         |                     ^~~~~~~


vim +/str__cpuinfo__trace_system_name +2 include/trace/stages/init.h

af6b9668e85ffd1 Steven Rostedt (Google  2022-03-03 @2) #define __app__(x, y) str__##x##y
af6b9668e85ffd1 Steven Rostedt (Google  2022-03-03  3) #define __app(x, y) __app__(x, y)
af6b9668e85ffd1 Steven Rostedt (Google  2022-03-03  4) 

:::::: The code at line 2 was first introduced by commit
:::::: af6b9668e85ffd1502aada8036ccbf4dbd481708 tracing: Move the defines to create TRACE_EVENTS into their own files

:::::: TO: Steven Rostedt (Google) <rostedt@goodmis.org>
:::::: CC: Steven Rostedt (Google) <rostedt@goodmis.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
