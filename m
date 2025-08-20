Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E38326E6F3
	for <oe-kbuild-all@lists.linux.dev>; Wed, 20 Aug 2025 08:05:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755677135; cv=none; b=CIcTUaFgW85hOu8Zj2fh3RSmvWcEIXIkwPLCVHAr0BxngDcttF7lj5Sjz1EsKI58sELuzY5k7PCtiD1bHqcmoYXMlaeFbjRAaGZkYD1d3dErDe181FxQ8yh9hToL29ysRXpNrYwQO+bbvZkWbRdCqBBi9ZTwNtoxgnxXwtE8hqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755677135; c=relaxed/simple;
	bh=BICRglT++hCh0aKe6U0QsSdi5nFhnUqOXOSa86D2Vnc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IEu71Jm7PbPaidNrvLFq58ErnT7lOQ1Z43iH735E66fri9/uO5YFObkoBxJns70Sa8OjXnC8EIYF2N22vVkUAZz5XwKlt8qBPI/2tF/FZubAVSKG12XjD0AIfQvrrinxljWURanhTl3yeLelpCRJVTGFhaGuByBaFYMXuE9YMps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LwqhCBoG; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LwqhCBoG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755677133; x=1787213133;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BICRglT++hCh0aKe6U0QsSdi5nFhnUqOXOSa86D2Vnc=;
  b=LwqhCBoGoh9tC/rn0PJEcSYhMAd2qEz2nCeRX0QxPorhshsTOioedzpV
   q9tyjdjYLjlAVBi9kW/ecjMTaIiPqcnHr4HSO0ucD0cJOIsM6SOnEGmmv
   D45aZNbFNlkyjPugMP4h4ehJr79ZASJTO+YUVmYKMGHHz8fAaEpYgkvug
   0FgKyUDNeuG0AzfA788J9LlfeWAEegbSWTRHSQNMqs6ivhAjHqqmHZhVF
   rXJI3DtUgnMQ6oacc5JlPP1QxODr9+wHL/T1SUSvnlBwiwuRKIror1ttx
   cbOeBLrDbrOZBsofhWOUwCMRKjM3RViFAwwOzWBgpH1/ZvBfOLki+vl5x
   g==;
X-CSE-ConnectionGUID: BUlhtYFPRvCjG621UZy6JQ==
X-CSE-MsgGUID: 8I90i06WRMa7ddkKGxeNEA==
X-IronPort-AV: E=McAfee;i="6800,10657,11527"; a="57849720"
X-IronPort-AV: E=Sophos;i="6.17,302,1747724400"; 
   d="scan'208";a="57849720"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2025 01:05:32 -0700
X-CSE-ConnectionGUID: 218vOkkMT2+Ez0imAiTdYA==
X-CSE-MsgGUID: dR2a+UqBTputlvW2sdo9sQ==
X-ExtLoop1: 1
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 20 Aug 2025 01:05:31 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uodp1-000IUT-1F;
	Wed, 20 Aug 2025 08:05:27 +0000
Date: Wed, 20 Aug 2025 16:04:09 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-5.10-2025-06 1/1]
 include/trace/trace_events.h:27:23: warning: 'str__psi__trace_system_name'
 defined but not used
Message-ID: <202508201628.2Idu396S-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Georgi,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android12-5.10-2025-06
head:   656077247f488517bd6c6a71ecfdfba766bd29c4
commit: b79d1815c400c3929bb78a209b6e51a38d6ffcb2 [1/1] ANDROID: psi: Add vendor hooks for PSI tracing
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20250820/202508201628.2Idu396S-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250820/202508201628.2Idu396S-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508201628.2Idu396S-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/trace/define_trace.h:102,
                    from include/trace/hooks/psi.h:29,
                    from drivers/android/vendor_hooks.c:55:
>> include/trace/trace_events.h:27:23: warning: 'str__psi__trace_system_name' defined but not used [-Wunused-const-variable=]
      27 | #define __app__(x, y) str__##x##y
         |                       ^~~~~
   include/trace/trace_events.h:27:23: note: in definition of macro '__app__'
      27 | #define __app__(x, y) str__##x##y
         |                       ^~~~~
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
                    from include/trace/hooks/vmscan.h:21,
                    from drivers/android/vendor_hooks.c:54:
   include/trace/trace_events.h:27:23: warning: 'str__vmscan__trace_system_name' defined but not used [-Wunused-const-variable=]
      27 | #define __app__(x, y) str__##x##y
         |                       ^~~~~
   include/trace/trace_events.h:27:23: note: in definition of macro '__app__'
      27 | #define __app__(x, y) str__##x##y
         |                       ^~~~~
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
                    from include/trace/hooks/logbuf.h:26,
                    from drivers/android/vendor_hooks.c:53:
   include/trace/trace_events.h:27:23: warning: 'str__logbuf__trace_system_name' defined but not used [-Wunused-const-variable=]
      27 | #define __app__(x, y) str__##x##y
         |                       ^~~~~
   include/trace/trace_events.h:27:23: note: in definition of macro '__app__'
      27 | #define __app__(x, y) str__##x##y
         |                       ^~~~~
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
                    from include/trace/hooks/signal.h:17,
                    from drivers/android/vendor_hooks.c:52:
   include/trace/trace_events.h:27:23: warning: 'str__signal__trace_system_name' defined but not used [-Wunused-const-variable=]
      27 | #define __app__(x, y) str__##x##y
         |                       ^~~~~
   include/trace/trace_events.h:27:23: note: in definition of macro '__app__'
      27 | #define __app__(x, y) str__##x##y
         |                       ^~~~~
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
                    from include/trace/hooks/gpiolib.h:24,
                    from drivers/android/vendor_hooks.c:51:
   include/trace/trace_events.h:27:23: warning: 'str__gpiolib__trace_system_name' defined but not used [-Wunused-const-variable=]
      27 | #define __app__(x, y) str__##x##y
         |                       ^~~~~
   include/trace/trace_events.h:27:23: note: in definition of macro '__app__'
      27 | #define __app__(x, y) str__##x##y
         |                       ^~~~~
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
                    from include/trace/hooks/typec.h:63,
                    from drivers/android/vendor_hooks.c:50:
   include/trace/trace_events.h:27:23: warning: 'str__typec__trace_system_name' defined but not used [-Wunused-const-variable=]
      27 | #define __app__(x, y) str__##x##y
         |                       ^~~~~
   include/trace/trace_events.h:27:23: note: in definition of macro '__app__'
      27 | #define __app__(x, y) str__##x##y
         |                       ^~~~~
   include/trace/trace_events.h:30:29: note: in expansion of macro '__app'
      30 | #define TRACE_SYSTEM_STRING __app(TRACE_SYSTEM_VAR,__trace_system_name)
         |                             ^~~~~
   include/trace/trace_events.h:33:27: note: in expansion of macro 'TRACE_SYSTEM_STRING'
      33 |         static const char TRACE_SYSTEM_STRING[] =       \


vim +/str__psi__trace_system_name +27 include/trace/trace_events.h

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
