Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA42413E02A
	for <oe-kbuild-all@lists.linux.dev>; Sun,  3 May 2026 23:07:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777849628; cv=none; b=rrtQ7gvClZRD4Mr/HSTbM2M9bqENBvNo+quGJuCCuQFmJ1NVQ74w1SNc/LQRmrpVjq+x1P9uyBY/KAFMaThjf5mEDYC3qpW/YTbJDXHJpU41oSGsKOOhm6T9OqdksL3ru7sTEJvpJFcu/FhPNaST9yFlOMCuizH142fYsXF1mQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777849628; c=relaxed/simple;
	bh=N1lqrrE7qm6xtkVPw6n49+cLz9RnnAwSGuVR1l1Vvoc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Gg20NdzDK53yHEnM8vSDEftN7+2SPyByYnvLKJiZxIq9lFqUmVVfSbv6imYfFyVx5cdoGq3ipK7qkNIVutgPJJSUw5ZB5WaTTIAZVqYB2NMshWk5Gb8DkW8U3xN9UEVCK7rhGnmCCJoFX5NpQjMsv/bLin8VAn9JXbizsOuW6HI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=j8lOFjET; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="j8lOFjET"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777849627; x=1809385627;
  h=date:from:to:cc:subject:message-id;
  bh=N1lqrrE7qm6xtkVPw6n49+cLz9RnnAwSGuVR1l1Vvoc=;
  b=j8lOFjETzlJ5knL1TjaFA/glc084XNl9g1eK22xrystEDdDjx20Hhe0u
   PnF+GlUIOUR/CZGalA6GCer2IDu+8s9FaCasttQw3GE9by5Jn+kixTvEG
   3SkUO1R/OKx/BakkBClHFaYlDTqN+aU8lSOonSrhtWPP6k/yyOsuoD8+g
   7JBM56YEu35pcHWnuBkYewpRXaUc6lGTDI/iZK+nTrwvNZpAa1jYJ5SUd
   Y78YoBKWh1DWay2cMTGk1lkE+GS90OM9mnGOeFriVKi9QlBuGIcEu5HUR
   2x9ae/Gm8MpOCeJxmrKfMnIwbj0LwvWNcmrCOywnlLUZCpc2t9vV89vxu
   Q==;
X-CSE-ConnectionGUID: RUOKOy4NRqKs/mNc32uYhw==
X-CSE-MsgGUID: NyQGAYteRj2s365xz6pamQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11775"; a="78420581"
X-IronPort-AV: E=Sophos;i="6.23,214,1770624000"; 
   d="scan'208";a="78420581"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 May 2026 16:07:06 -0700
X-CSE-ConnectionGUID: jVxtWu/AQ0K8rGBOmTdUTg==
X-CSE-MsgGUID: bG/reKwkSIKEOtaRTR9dOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,214,1770624000"; 
   d="scan'208";a="232721862"
Received: from lkp-server01.sh.intel.com (HELO 781826d00641) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 03 May 2026 16:07:04 -0700
Received: from kbuild by 781826d00641 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wJftn-0000000039F-3yDb;
	Sun, 03 May 2026 23:06:57 +0000
Date: Mon, 04 May 2026 07:06:01 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-5.10-2025-09 1/1]
 include/trace/trace_events.h:27:23: warning: 'str__fpsimd__trace_system_name'
 defined but not used
Message-ID: <202605040644.90MSN8ZG-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Wooyeon,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android12-5.10-2025-09
head:   5e84e8bf71e0dd3b46e366059011a059492f1da5
commit: 74555f39924dc4c173b4bec9bd015acfeb895e68 [1/1] ANDROID: vendor_hooks: FPSIMD save/restore by using vendor_hooks
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20260504/202605040644.90MSN8ZG-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260504/202605040644.90MSN8ZG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605040644.90MSN8ZG-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/trace/define_trace.h:102,
                    from include/trace/hooks/fpsimd.h:26,
                    from drivers/android/vendor_hooks.c:12:
>> include/trace/trace_events.h:27:23: warning: 'str__fpsimd__trace_system_name' defined but not used [-Wunused-const-variable=]
      27 | #define __app__(x, y) str__##x##y
         |                       ^~~~~
   include/trace/trace_events.h:28:21: note: in expansion of macro '__app__'
      28 | #define __app(x, y) __app__(x, y)
         |                     ^~~~~~~
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
                    from include/trace/hooks/sched.h:23,
                    from drivers/android/vendor_hooks.c:11:
   include/trace/trace_events.h:27:23: warning: 'str__sched__trace_system_name' defined but not used [-Wunused-const-variable=]
      27 | #define __app__(x, y) str__##x##y
         |                       ^~~~~
   include/trace/trace_events.h:28:21: note: in expansion of macro '__app__'
      28 | #define __app(x, y) __app__(x, y)
         |                     ^~~~~~~
   include/trace/trace_events.h:30:29: note: in expansion of macro '__app'
      30 | #define TRACE_SYSTEM_STRING __app(TRACE_SYSTEM_VAR,__trace_system_name)
         |                             ^~~~~
   include/trace/trace_events.h:33:27: note: in expansion of macro 'TRACE_SYSTEM_STRING'
      33 |         static const char TRACE_SYSTEM_STRING[] =       \
         |                           ^~~~~~~~~~~~~~~~~~~
   include/trace/trace_events.h:36:1: note: in expansion of macro 'TRACE_MAKE_SYSTEM_STR'
      36 | TRACE_MAKE_SYSTEM_STR();
         | ^~~~~~~~~~~~~~~~~~~~~


vim +/str__fpsimd__trace_system_name +27 include/trace/trace_events.h

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
