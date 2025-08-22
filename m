Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61877221F09
	for <oe-kbuild-all@lists.linux.dev>; Fri, 22 Aug 2025 18:53:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755888817; cv=none; b=RIA4tqpEUHSzH5AgxA6g7dr8knvPjfpytLaPCsZAmqikXIZpFNlZHGaC0auSWxW+3vzdvQdXeVrfGAfB/A5RCHeIFEakNy3S9jZuAsIJsydwDtqSJpzJMEfqRXbW8hIvVDv9v13+FGzFl/GDyB42vCm/7UUrjDO9NCCYZkNrilk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755888817; c=relaxed/simple;
	bh=d+OkcOI2tW/m9hP0ZtQBTiyPzWA5P8uDLfm78zPcHIc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZNVFZe19EsTFe0DXoTtuJ+FIpvqQKqQ3Bk8IFensP+ICl6IGBeXM/HmZ6zhsCi40ade02I+AATJmrnTAqPVUA7KYbfE0n2xyBosWlHv8jbgpYhkHPEEaliVy8XxKby9RfBkdiw6BmfvjE32MoUrirfvpQ+L1DNK440uX/n51OyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=O52VPfBk; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O52VPfBk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755888815; x=1787424815;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=d+OkcOI2tW/m9hP0ZtQBTiyPzWA5P8uDLfm78zPcHIc=;
  b=O52VPfBkoxMJSuapfVmh1yQN6BYhXh2OYNZGjOVqP5r26kEQQi5UDFRP
   e2iOrRp6iX+4lUkhArC9iGycf/ixVC3Y/Le0dL1m3gjLv3ss/RV43N1Z+
   eHbOaF6osoq64mhV4yB6bdFwTmhaZ5iz2KNnZCalAe3+w3j4Y/OgLj8rs
   I6NdPGz3byv0MDPAm50/G42UCJx85QjbOLZKtW4QedXXwbK2VOEIlnQkm
   wP4VPEfflOHIUgLY0XuePzoGAsEy4RnDiteYDHDyaTa5rTWoS8XHvPCnD
   ESaVlslg7AfZ1eqUEL9GyECRbJ7qgXDbNxqENiu8dOmkRKvP4QUh0YqfC
   A==;
X-CSE-ConnectionGUID: n8lyVuamRpy7kUcYJXlLfQ==
X-CSE-MsgGUID: Ftw6ANQ7R0WI83pLWReAZw==
X-IronPort-AV: E=McAfee;i="6800,10657,11529"; a="58268098"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="58268098"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2025 11:53:34 -0700
X-CSE-ConnectionGUID: JYciO/EkTVq2hPzKb3oxbQ==
X-CSE-MsgGUID: +dR907pjQXGLZFtytskx5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="168281774"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 22 Aug 2025 11:53:33 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1upWtH-000Lel-18;
	Fri, 22 Aug 2025 18:53:31 +0000
Date: Sat, 23 Aug 2025 02:52:31 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 3/3] include/trace/stages/init.h:2:23:
 warning: 'str__sd__trace_system_name' defined but not used
Message-ID: <202508230252.FehOozLb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Wei,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   ef2e2217b16213c2cc252f790eea2a57a3d2e7fb
commit: a1149b5511f3af6d42d2da9ea2c92615f1e38d33 [3/3] ANDROID: sd: Add vendor hooks
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20250823/202508230252.FehOozLb-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250823/202508230252.FehOozLb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508230252.FehOozLb-lkp@intel.com/

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
   include/trace/stages/init.h:8:27: note: in expansion of macro 'TRACE_SYSTEM_STRING'
       8 |         static const char TRACE_SYSTEM_STRING[] =       \
         |                           ^~~~~~~~~~~~~~~~~~~
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
   include/trace/stages/init.h:8:27: note: in expansion of macro 'TRACE_SYSTEM_STRING'
       8 |         static const char TRACE_SYSTEM_STRING[] =       \
         |                           ^~~~~~~~~~~~~~~~~~~
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
   include/trace/stages/init.h:8:27: note: in expansion of macro 'TRACE_SYSTEM_STRING'
       8 |         static const char TRACE_SYSTEM_STRING[] =       \
         |                           ^~~~~~~~~~~~~~~~~~~
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
   include/trace/stages/init.h:8:27: note: in expansion of macro 'TRACE_SYSTEM_STRING'
       8 |         static const char TRACE_SYSTEM_STRING[] =       \
         |                           ^~~~~~~~~~~~~~~~~~~
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
   include/trace/stages/init.h:8:27: note: in expansion of macro 'TRACE_SYSTEM_STRING'
       8 |         static const char TRACE_SYSTEM_STRING[] =       \
         |                           ^~~~~~~~~~~~~~~~~~~
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
