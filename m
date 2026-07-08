Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24FA72F690F
	for <oe-kbuild-all@lists.linux.dev>; Wed,  8 Jul 2026 23:01:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783551719; cv=none; b=iz9hZqXYCUzpJt1te+ht+XbIY6aVTcZNYpawBwTeJnXHdLBFc3kzyhQlKZB+zSCBUrqr0sgdO+x/7T5akhfLWpIjnNE9VDSQ1Vw8hl/ib+ivqe6QWLvSeQismzXqu4vJOQ/7h7g414Z1nXh/2D9waMUWwYxjyFXTEH7ba6GwRYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783551719; c=relaxed/simple;
	bh=qAyE7pIH6hmW+qdFVCcGGpzH0GBKds/tWUcPNNvI4ZQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=L/BVEQzcRnM5kJjNGJUBkeXhMaDubG3J8iPeqk+Kx4WOFH2LXVS/XtvbZXrVaSwowVK+kEN+x/dtiADGixmFm1yzUAQ2xqDDFk29i7nA3Rt1wauE/OXP910Xb1QViO3G/8/IbXvi+c+DCUm/67QqogQIN9HHnNloLhJmtfQ6+Gw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OBzk53zO; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OBzk53zO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783551719; x=1815087719;
  h=date:from:to:cc:subject:message-id;
  bh=qAyE7pIH6hmW+qdFVCcGGpzH0GBKds/tWUcPNNvI4ZQ=;
  b=OBzk53zOpJGv4lo/56PlzCIvaBDR4UYUEJLUYNPT6SGAn0h9WlXnaIfb
   QqOxOCrrQKIrWFtrknlnhjhrPjBsUlaVMlCtDJTzDekbBmxK/Dln7NeTx
   ec3iOLW79TC3ojBvACEIpYpeRM1t/5T/MSpYjV4EmcTjkAtrHddYt9UwM
   6M6ucspqUVfPpWbqGHaMEzR16gDsF6mS7SVO2R8jp2AG4UKZY7MWoZsMC
   jXnDW492zdjnvACagbtEONrdq/78grXxBRFsvGiHqIDHZQEX1yUm5YkV9
   G4qC+/Pw2BVFRLh1p2uzn5xVoHdW3zKf/s6ifZQGWM9QEjdB4elbausKL
   A==;
X-CSE-ConnectionGUID: 2eruRJawRrihUo1XWMeogw==
X-CSE-MsgGUID: xdCgi8nxQsCNxRL8IBhGFg==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="84420594"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="84420594"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2026 16:01:58 -0700
X-CSE-ConnectionGUID: QSIMD/45TgqDQlrkET62hQ==
X-CSE-MsgGUID: GGYrffsORtCMfI8gIP01uQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="284516531"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 08 Jul 2026 16:01:56 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1whbH7-00000000GxX-1XOr;
	Wed, 08 Jul 2026 23:01:53 +0000
Date: Thu, 09 Jul 2026 07:00:59 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-kiwi-6.1 166/166]
 include/trace/stages/init.h:2:23: warning: 'str__dmabuf__trace_system_name'
 defined but not used
Message-ID: <202607090640.rO6p3lax-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Chris,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android14-kiwi-6.1
head:   7b80053b707666e258e504127dd1bf5ac555f5e1
commit: 9972a4f7df2f40cb752cd3b366d506ba0e515cf9 [166/166] ANDROID: dma-buf: Add vendorhook to allow mmaping more memory than a DMA-BUF holds
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20260709/202607090640.rO6p3lax-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260709/202607090640.rO6p3lax-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607090640.rO6p3lax-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/trace/trace_events.h:27,
                    from include/trace/define_trace.h:102,
                    from include/trace/hooks/dmabuf.h:21,
                    from drivers/android/vendor_hooks.c:45:
>> include/trace/stages/init.h:2:23: warning: 'str__dmabuf__trace_system_name' defined but not used [-Wunused-const-variable=]
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
                    from include/trace/hooks/fips140.h:50,
                    from drivers/android/vendor_hooks.c:44:
   include/trace/stages/init.h:2:23: warning: 'str__fips140__trace_system_name' defined but not used [-Wunused-const-variable=]
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
                    from include/trace/hooks/futex.h:26,
                    from drivers/android/vendor_hooks.c:43:
   include/trace/stages/init.h:2:23: warning: 'str__futex__trace_system_name' defined but not used [-Wunused-const-variable=]
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
                    from include/trace/hooks/rwsem.h:30,
                    from drivers/android/vendor_hooks.c:42:
   include/trace/stages/init.h:2:23: warning: 'str__rwsem__trace_system_name' defined but not used [-Wunused-const-variable=]
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
                    from include/trace/hooks/remoteproc.h:26,
                    from drivers/android/vendor_hooks.c:41:
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
                    from drivers/android/vendor_hooks.c:40:
   include/trace/stages/init.h:2:23: warning: 'str__syscall_check__trace_system_name' defined but not used [-Wunused-const-variable=]
       2 | #define __app__(x, y) str__##x##y
         |                       ^~~~~
   include/trace/stages/init.h:3:21: note: in expansion of macro '__app__'
       3 | #define __app(x, y) __app__(x, y)
         |                     ^~~~~~~


vim +/str__dmabuf__trace_system_name +2 include/trace/stages/init.h

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
