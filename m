Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2669D366066
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Jun 2026 21:23:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781213029; cv=none; b=cbOKCenfGfV9ekfqPZSx7PvfS42RtbUHFE8ORW6l2I6zFRGzCPROBiz0xlTVniD6MhyjmY7wvUGAx6xShzbwddB6bAfAxRFEgqu2n2piJJC3Zj2TQZvuM3r+ZKS3tF6i0bjWsn+xDAEcO2iOjkDGnu00pTDC4w4mm07TMtlSAE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781213029; c=relaxed/simple;
	bh=BiAkxxbj1bDIyzJyFlqwVwVBpV/i32muhIyN4DvUrEI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=FVjS2mfF+T8+8mn4yjIrcPoZR4YVxIq/NkQ/clE+4ADlgs5bX1hqcYtnbHT6Bpq+d826Ep2pNJuFXD+pPySREskv1mKzPUmDqQ+khiKlOm06igLJewZlZ1Pr7e3Rp6vkHga9aIAQ3VZW0XrDFxOGYhqAvUdrCPWxVUrx1vlwPlo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UCEJtVl3; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UCEJtVl3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781213028; x=1812749028;
  h=date:from:to:cc:subject:message-id;
  bh=BiAkxxbj1bDIyzJyFlqwVwVBpV/i32muhIyN4DvUrEI=;
  b=UCEJtVl305qdCYvGK0LRl3lmHWVRghz9ZdQnCOaU0QXsN1HB5mEdD27V
   x8Ct5KgSwj46ki29NdW+TaOns5Z/ceLkqEkuQZy4+ZiP3xyGymVynah8e
   4FNHaZDD4cnhN650rbkIH2hUKbCa23PFRqLUVQSzcvvEcFERvz/O1o2op
   u11hvV6xumMpbcwCFQoX2cuUe60edOHOlvSHE5KTS6J23V9BYEZT6KL4S
   i0MMyEdBMgqpAX3GtfoSU0c0uuoFmvAlX1BLmEGg6WANKPVtRXIKCW66i
   PzzFp/LhZjHQzdxGIVEbx5xXO1QjyrdxjHTUXDH8HRsCIrLSxplOAvvf1
   g==;
X-CSE-ConnectionGUID: 7OUlS2y8RV2GJWHtiA95mw==
X-CSE-MsgGUID: xAP9vp5NQe2n+w6a7BQObA==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="81175328"
X-IronPort-AV: E=Sophos;i="6.24,199,1774335600"; 
   d="scan'208";a="81175328"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2026 14:23:47 -0700
X-CSE-ConnectionGUID: 8iSpL4eETPim+qtQnpi2eA==
X-CSE-MsgGUID: HAsfaQcwR6uGWtx6i3QHpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,199,1774335600"; 
   d="scan'208";a="245523374"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 11 Jun 2026 14:23:46 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wXmsJ-00000000NsT-2guU;
	Thu, 11 Jun 2026 21:23:43 +0000
Date: Fri, 12 Jun 2026 05:23:30 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-2026-03 2/2]
 include/trace/stages/init.h:2:23: warning: 'str__dwc3__trace_system_name'
 defined but not used
Message-ID: <202606120512.2ltMyT95-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Badhri,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android16-6.12-2026-03
head:   6ceec6da58bd9aec25b9369c21c182ccd71ec0f1
commit: 4d3d66c7aa4bf893ed8ac98f20480c53acfe99b6 [2/2] ANDROID: vendor_hooks: dwc3: Work around for STAR-6887553
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20260612/202606120512.2ltMyT95-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260612/202606120512.2ltMyT95-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606120512.2ltMyT95-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/trace/trace_events.h:27,
                    from include/trace/define_trace.h:109,
                    from include/trace/hooks/dwc3.h:40,
                    from drivers/android/vendor_hooks.c:85:
>> include/trace/stages/init.h:2:23: warning: 'str__dwc3__trace_system_name' defined but not used [-Wunused-const-variable=]
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
                    from include/trace/define_trace.h:109,
                    from include/trace/hooks/rcu.h:32,
                    from drivers/android/vendor_hooks.c:84:
   include/trace/stages/init.h:2:23: warning: 'str__rcu__trace_system_name' defined but not used [-Wunused-const-variable=]
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
                    from include/trace/define_trace.h:109,
                    from include/trace/hooks/vb2.h:24,
                    from drivers/android/vendor_hooks.c:83:
   include/trace/stages/init.h:2:23: warning: 'str__vb2__trace_system_name' defined but not used [-Wunused-const-variable=]
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
                    from include/trace/define_trace.h:109,
                    from include/trace/hooks/dmv_debug.h:45,
                    from drivers/android/vendor_hooks.c:82:
   include/trace/stages/init.h:2:23: warning: 'str__dmv_debug__trace_system_name' defined but not used [-Wunused-const-variable=]
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
                    from include/trace/define_trace.h:109,
                    from include/trace/hooks/kasan.h:18,
                    from drivers/android/vendor_hooks.c:81:
   include/trace/stages/init.h:2:23: warning: 'str__kasan__trace_system_name' defined but not used [-Wunused-const-variable=]
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
                    from include/trace/define_trace.h:109,
                    from include/trace/hooks/usb.h:29,
                    from drivers/android/vendor_hooks.c:80:
   include/trace/stages/init.h:2:23: warning: 'str__usb__trace_system_name' defined but not used [-Wunused-const-variable=]
       2 | #define __app__(x, y) str__##x##y
         |                       ^~~~~
   include/trace/stages/init.h:3:21: note: in expansion of macro '__app__'
       3 | #define __app(x, y) __app__(x, y)
         |                     ^~~~~~~


vim +/str__dwc3__trace_system_name +2 include/trace/stages/init.h

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
