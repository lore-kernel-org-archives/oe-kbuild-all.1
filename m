Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE4E93D8122
	for <oe-kbuild-all@lists.linux.dev>; Mon, 12 Oct 2026 23:22:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791847332; cv=none; b=Snrn3mp23LVLf0/UZXixJxayoTPT4Z4E6wn/XoJD4NX+eVXUqYnCNzyOLkkn0yrWUfB2IFttEp6//FO8E8UAvffSGdPO/w3BZVgo6qPAWeZYJgBgM4xYXVSPBjv/MOAh0+apgSdbgYiIA1nxwJWx7fjjf4sY9ZnN5K7PD53wMeg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791847332; c=relaxed/simple;
	bh=koHexJz1jZESj28T7jpvDmTyw63qqC9Nx51yGE+Era8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=AJ5QyQj+1pYgcIWNXVhboBPDPevl7xfNYB9ET9gevxuhWXUjmZlFW4yJwpm8PLXkJHSF4bnLC9IyL/1CIRwyqUx/+5DWLXhdFnCPGvO3A8bjzvP+bXklbcQYfUWMHYg9Jcucb8/ZJLeN540ZDA4Zzax/l8RIo8U49XvWAcsF9c0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WpSJfBsN; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WpSJfBsN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791847330; x=1823383330;
  h=date:from:to:cc:subject:message-id;
  bh=koHexJz1jZESj28T7jpvDmTyw63qqC9Nx51yGE+Era8=;
  b=WpSJfBsNHmvERCs1p3a6/IM0NY12XG61goS8mBWd11Ax2bMzA1NwMsot
   P16BK/QQQsxFIbpC5auVRgd5mjkLKcy2YKzODT7nFkjJzonthWnQaFztt
   whsqcp/SVPzGqLffy2R04iwezAW+k4DtyTa794hnJRIPfzlZveVuP4TWq
   eN1kqYTIYu4jLWX/Zpamm/RC4zCcdHFa4+8Fe7iHT67yZZORPaghenpgd
   /zkdtFX/pj/QyeT13japn64OVuA34oWgotLtro0dZo9/4mhseFZ5R6VTq
   5izo2wNxvjpLfFvuPD/ftbzT5iiifniS5hZj3ClO9WDPfm2QIoON+bO9y
   w==;
X-CSE-ConnectionGUID: vGlZkSzrSnKKb5vzwburQA==
X-CSE-MsgGUID: 4CVLNiFUQ4uAk/wnp8m3gw==
X-IronPort-AV: E=McAfee;i="6800,10657,11933"; a="595637"
X-IronPort-AV: E=Sophos;i="6.27,154,1787036400"; 
   d="scan'208";a="595637"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2026 16:22:10 -0700
X-CSE-ConnectionGUID: QvNNtybISYmVlxBUJ2TGiA==
X-CSE-MsgGUID: rugQAyc7Q3+V6MsluEO52w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,154,1787036400"; 
   d="scan'208";a="981213"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by orviesa002.jf.intel.com with ESMTP; 12 Oct 2026 16:22:09 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xGPLJ-00000000AHP-3tQi;
	Mon, 12 Oct 2026 23:22:05 +0000
Date: Tue, 13 Oct 2026 01:21:18 +0200
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 1/1]
 include/trace/stages/init.h:2:23: warning: 'str__gzvm__trace_system_name'
 defined but not used
Message-ID: <202610130149.9pSGauF6-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Yi-De,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   5597a6bf0b11918da3f4fc2e4354f904acd26cc7
commit: 2fccd6896ec8c25f94228ed44bedf7c4dc8642c1 [1/1] ANDROID: vendor_hooks: Add vendor hook for GenieZone para-virtualization
config: arm-randconfig-r2102-20261012 (https://download.01.org/0day-ci/archive/20261013/202610130149.9pSGauF6-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261013/202610130149.9pSGauF6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610130149.9pSGauF6-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/trace/trace_events.h:27,
                    from include/trace/define_trace.h:102,
                    from include/trace/hooks/gzvm.h:16,
                    from drivers/android/vendor_hooks.c:57:
>> include/trace/stages/init.h:2:23: warning: 'str__gzvm__trace_system_name' defined but not used [-Wunused-const-variable=]
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
                    from include/trace/hooks/power.h:21,
                    from drivers/android/vendor_hooks.c:56:
   include/trace/stages/init.h:2:23: warning: 'str__power__trace_system_name' defined but not used [-Wunused-const-variable=]
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
                    from include/trace/hooks/softlockup.h:17,
                    from drivers/android/vendor_hooks.c:55:
   include/trace/stages/init.h:2:23: warning: 'str__softlockup__trace_system_name' defined but not used [-Wunused-const-variable=]
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
                    from include/trace/hooks/bug.h:16,
                    from drivers/android/vendor_hooks.c:54:
   include/trace/stages/init.h:2:23: warning: 'str__bug__trace_system_name' defined but not used [-Wunused-const-variable=]
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
                    from include/trace/hooks/thermal.h:19,
                    from drivers/android/vendor_hooks.c:53:
   include/trace/stages/init.h:2:23: warning: 'str__thermal__trace_system_name' defined but not used [-Wunused-const-variable=]
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
                    from include/trace/hooks/topology.h:29,
                    from drivers/android/vendor_hooks.c:52:
   include/trace/stages/init.h:2:23: warning: 'str__topology__trace_system_name' defined but not used [-Wunused-const-variable=]
       2 | #define __app__(x, y) str__##x##y
         |                       ^~~~~
   include/trace/stages/init.h:2:23: note: in definition of macro '__app__'
       2 | #define __app__(x, y) str__##x##y
         |                       ^~~~~


vim +/str__gzvm__trace_system_name +2 include/trace/stages/init.h

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
