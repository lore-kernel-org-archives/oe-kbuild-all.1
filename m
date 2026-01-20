Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6086340F8C4
	for <oe-kbuild-all@lists.linux.dev>; Tue, 20 Jan 2026 23:18:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768951085; cv=none; b=j8E0iDcTWP0Q/6zUQewS8tdZJaH5Kq/S6NKdasKPztBxZ/Q9Jtm3pkajfebEcLobrBPRiKuGAjZr2w9IjkILrakHKehPqqBNB3My6nvgDBwup6vFeC/ufAeWzLRQihhN6Zhbe6agwiij6RX1yRerlzeaCtEXA6Yhz/Ls/Sjv/yc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768951085; c=relaxed/simple;
	bh=81YbhzIeMfLRuMSS91Ustdm4h8YukQmcQKcij0JNcDc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=tCe4J0Cqaxp/Pjt6vtOX24NQX3erK6sa0gtQ7UAlmY3440k3drWfR1OOQAEkkmMRvqFqWVRppGhEbZ5DmN+hHQwe9FIhnFuYl4TtpmiLEahcdvkz9WieSDXSpgAPuczQh+YS9C/EYYiCln+uwDxpulZYxlPKBG2mVJ6/YA2fxZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cmdyeYac; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cmdyeYac"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768951083; x=1800487083;
  h=date:from:to:cc:subject:message-id;
  bh=81YbhzIeMfLRuMSS91Ustdm4h8YukQmcQKcij0JNcDc=;
  b=cmdyeYacbOZl5NkqRYl+0lAAKXe7vI1vL7Uay0ZKDOX6b8Tk94RugH+S
   pWeMBtVxYuWTU/aGS7BAY6CaMUgczhMtjq9/tAJXm5i5QUoRg4Q11inca
   UvIn+TmbD2LqiNmOR3JGg2xYU/9WHrxbzW8Kx102ZWzuqjqJPejeQfd1Q
   D0NGnO4fTZDDoevn4LYVfm3UkIatB3lwn4RzyNa3xQl5FlRYfZQz1R9mU
   8IzxIHo/3zgbCkxkkkigWNC+3oPPH61EaAX2XXprE3VM+Do+PgLJ0jIQf
   f6oLJBVNa2cL8e98jG+T/27C2BpcE+jr3W/8sJJl2pynzH+R7NIs1xIW2
   A==;
X-CSE-ConnectionGUID: x8CLFukCQNqm7IpQ6wJ0OA==
X-CSE-MsgGUID: Fjk6NSFvTQOix/Tg01ahtA==
X-IronPort-AV: E=McAfee;i="6800,10657,11677"; a="74040252"
X-IronPort-AV: E=Sophos;i="6.21,241,1763452800"; 
   d="scan'208";a="74040252"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2026 15:18:03 -0800
X-CSE-ConnectionGUID: gt1sd+ACR6yiRRWx15sCzg==
X-CSE-MsgGUID: Q9YtfutxSRK/jOJ0Zy+ULg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,241,1763452800"; 
   d="scan'208";a="206600451"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 20 Jan 2026 15:18:01 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1viKz1-00000000PfL-1Tqv;
	Tue, 20 Jan 2026 23:17:59 +0000
Date: Wed, 21 Jan 2026 07:17:01 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.15 1/1]
 include/trace/trace_events.h:27:23: warning: 'str__fpsimd__trace_system_name'
 defined but not used
Message-ID: <202601210735.hz03IkDJ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Wooyeon,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android13-5.15
head:   f0e92c6014f8f5f7fc79545d921238f060737e5c
commit: 74555f39924dc4c173b4bec9bd015acfeb895e68 [1/1] ANDROID: vendor_hooks: FPSIMD save/restore by using vendor_hooks
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20260121/202601210735.hz03IkDJ-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260121/202601210735.hz03IkDJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601210735.hz03IkDJ-lkp@intel.com/

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
