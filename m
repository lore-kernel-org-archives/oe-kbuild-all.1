Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E96501A2391
	for <oe-kbuild-all@lists.linux.dev>; Thu, 15 May 2025 02:27:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747276065; cv=none; b=b0v88ok2TmTWlv/HxGIN6saZ6r/6z7J6XBP92K40jjCiIC6QCnG46tSVWgEwXTFZTmIr/6QlVM1JIjRGv4eWovuQsQbkTUN23gzaFLqj7Im0nxA5W4loFysuJSEZhHgUplNoMidSUQDCac0Aum0lU2PXWjK5KKJmsPHgGkkhZ9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747276065; c=relaxed/simple;
	bh=CHS3cPt0LpD0rGHU6R2VrVyZZY+yEG3/CLL6dgNCG3M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=V2lYxDx0Ks2r84IxMqWKRUS0q/7qyx6Wx/9DLnPYi31b/uqF90RYVdEBs045UTLda78iiO7aqJ6qSyqFgw+J7E93hxbEiG97jSF1nrIDhfNxk9Pi/DovLpeTBDfVv/RNG0yR+8k2s6MLC6BT9eTCuu91kaotMo1Aso5rJ61WEHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Vgf9bJAW; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Vgf9bJAW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747276064; x=1778812064;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CHS3cPt0LpD0rGHU6R2VrVyZZY+yEG3/CLL6dgNCG3M=;
  b=Vgf9bJAWb/GDwG5eQw3Cnw0RKUW42FDpmHo834JTakDOwAwFLBvRIzEw
   7mIbhfebyCa/IKpNrbp7NtVWUx4FYRcRqdKpjRRKik7RrUIpbamPUT3Ht
   yJgoJna2303zfVMeRDysxHQBg0PwR2+hGeAlau/PAvwy72wQobli4IQPY
   fNYLHbhIcvUCXjBIc2OHRStDAN7sSG+nz0FnhxX4iSsnyo7EwSiYnLxqp
   UEVHzVEZbYF/kWqcQjNVUGjYcvfGkS+xrPB/2ikCWRis9wKVi9WMaedd6
   lMrFsTRSHPyaG6jEysbJuVbI2NtxflofWNJzLCbn47l8BaDnbfgKHTcSh
   Q==;
X-CSE-ConnectionGUID: gV9lNAG+SAmjwNFr1Djj3A==
X-CSE-MsgGUID: AAb4boEbR/yTl1DGFMS02Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11433"; a="48310800"
X-IronPort-AV: E=Sophos;i="6.15,289,1739865600"; 
   d="scan'208";a="48310800"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2025 19:27:43 -0700
X-CSE-ConnectionGUID: jNjrBzhVRgCC8/jCc4xQGg==
X-CSE-MsgGUID: 7rpUNaZKRv+8fCkCzX63fA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,289,1739865600"; 
   d="scan'208";a="169157162"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 14 May 2025 19:27:43 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uFOJw-000HnL-0E;
	Thu, 15 May 2025 02:27:40 +0000
Date: Thu, 15 May 2025 10:27:04 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.10 1/1]
 include/trace/trace_events.h:27:23: warning:
 'str__v4l2mc__trace_system_name' defined but not used
Message-ID: <202505151019.rZuW8Yj4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Louis,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android13-5.10
head:   9610ed5f00dc3dc63655a10cbabf7c6429c2886e
commit: f1a161b019f9891125ca50aeff217e25f74086a4 [1/1] ANDROID: media: v4l2-core: extend the v4l2 format to support request
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20250515/202505151019.rZuW8Yj4-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250515/202505151019.rZuW8Yj4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505151019.rZuW8Yj4-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/trace/define_trace.h:102,
                    from include/trace/hooks/v4l2mc.h:21,
                    from drivers/android/vendor_hooks.c:61:
>> include/trace/trace_events.h:27:23: warning: 'str__v4l2mc__trace_system_name' defined but not used [-Wunused-const-variable=]
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
                    from include/trace/hooks/v4l2core.h:29,
                    from drivers/android/vendor_hooks.c:60:
>> include/trace/trace_events.h:27:23: warning: 'str__v4l2core__trace_system_name' defined but not used [-Wunused-const-variable=]
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
                    from include/trace/hooks/mmc_core.h:40,
                    from drivers/android/vendor_hooks.c:59:
   include/trace/trace_events.h:27:23: warning: 'str__mmc_core__trace_system_name' defined but not used [-Wunused-const-variable=]
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
                    from include/trace/hooks/hung_task.h:24,
                    from drivers/android/vendor_hooks.c:58:
   include/trace/trace_events.h:27:23: warning: 'str__hung_task__trace_system_name' defined but not used [-Wunused-const-variable=]
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
                    from include/trace/hooks/selinux.h:21,
                    from drivers/android/vendor_hooks.c:57:
   include/trace/trace_events.h:27:23: warning: 'str__selinux__trace_system_name' defined but not used [-Wunused-const-variable=]
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
                    from include/trace/hooks/psi.h:33,
                    from drivers/android/vendor_hooks.c:56:
   include/trace/trace_events.h:27:23: warning: 'str__psi__trace_system_name' defined but not used [-Wunused-const-variable=]
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
                    from include/trace/hooks/vmscan.h:30,
                    from drivers/android/vendor_hooks.c:55:
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


vim +/str__v4l2mc__trace_system_name +27 include/trace/trace_events.h

acd388fd3af350a include/trace/ftrace.h Steven Rostedt (Red Hat  2015-03-31  26) 
acd388fd3af350a include/trace/ftrace.h Steven Rostedt (Red Hat  2015-03-31 @27) #define __app__(x, y) str__##x##y
acd388fd3af350a include/trace/ftrace.h Steven Rostedt (Red Hat  2015-03-31  28) #define __app(x, y) __app__(x, y)
acd388fd3af350a include/trace/ftrace.h Steven Rostedt (Red Hat  2015-03-31  29) 

:::::: The code at line 27 was first introduced by commit
:::::: acd388fd3af350ab24c6ab6f19b83fc4a4f3aa60 tracing: Give system name a pointer

:::::: TO: Steven Rostedt (Red Hat) <rostedt@goodmis.org>
:::::: CC: Steven Rostedt <rostedt@goodmis.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
