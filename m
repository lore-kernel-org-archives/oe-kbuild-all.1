Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794558120;
	b=ADsId1MMhf3o1blPFK8lQPFllmcAbEC66OyYdIdaCspJeCOZ7BZvicRhi8ON+JIOYoH+
	 M4JzyBCw4xxMC5Bej6eJo4D5gFtIRRK26FF8vqV25u+CpAtfHULw7k9CspgVaNj8ZoJ1c
	 VKzbNE0Y1kwp6KIgC3YIK22z+otPS6WQevnAfEG4sriFNMwqMGjnIBZXTKqwdxZEr7lE/
	 zKa4Rc05EwWO1NfeaeoXw9wu9znRmnjLXGi94C/wo6mkI7BVXJkve7P/cpA3YXltD+S8x
	 OuHKUzTXRSBvCmC1QT8DdEi7bXrx2PCC7ioieWA+0icR6GMi9OUVAgw+l3tNWZiLNrA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794558120;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=pj7UjxTmlMLl2w/be5C4kLzsVsHQqR2l9fpIZgquPUY=;
	b=iE/YoaeXAY6mIpZVfRtSm9F6lEi6N+zbxUXw6vU1hopPImG/I43wLYk3LJgfNyihpCqW
	 xOpBvD/CTrUBDFNIDsvwqhNkQRo8ACMq+i/Xe33PADvXEHSnD645nyywfMmAvszyi4p3E
	 Ls/tfc/B7JkJsFNYvMYJOzj+6w17Tq9Fev8CgrJxIRrO6OvqWYJNYzMDpc8TG8rSnajok
	 0/ogr3w9S4Qd/Q7HZx615QzgEhDLn8bSJv8ydUtt7KQExFOdxGQNdSG5VZB/HFJeuP8OZ
	 NSW9Iu/vzz19pJgR2k8ajfpHx7lSnHffwgjR+6famRKaZfETER0OiUdkK1syePD7Hxg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=NXdr2wAq;
	arc=none smtp.remote-ip=192.198.163.9
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BF2E606A331
	for <oe-kbuild-all@lists.linux.dev>; Fri, 13 Nov 2026 08:21:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8BF2E606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=NXdr2wAq
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794558119; x=1826094119;
  h=date:from:to:cc:subject:message-id;
  bh=sYnZ9Ycft6z129UwSQWb8xeBnFf1CQXGDmoEujIpA90=;
  b=NXdr2wAq5BqUm8s0joaU5aZhJpCI2Fomwy8MGI+ojfmQeJHXOzXM9bHL
   bcUpNjj6RsXgYXWOP7sLVy9v/IWeWa4ZVUTvWDofjjzFTe5nMVmVH9ArB
   h/NWiPIsi1KsoQv28LWYpv82U6eTX/haEKObNk4HacHrd2chZs3WIW3P8
   vwpKXX0qM0w7dzUi2nZJJKBGW9K26PYialMt5MRipeiVC4enLrns4Oe/y
   Ceqx9Z02uKKP1o42mRo7casVbGLNgrZjo/3hgtw3QvipEKOdn5PXdsjIx
   ey3F+WPWJwujqeS2iuXnxUgbA6fWqTpg4y4HCIBbtNrejrOQjMjTOA9ca
   Q==;
X-CSE-ConnectionGUID: BGTNEqx/TW631DUoIfLYbg==
X-CSE-MsgGUID: jCDme027TVGF7c823TRe9Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11964"; a="3230759"
X-IronPort-AV: E=Sophos;i="6.27,211,1787036400"; 
   d="scan'208";a="3230759"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2026 00:21:59 -0800
X-CSE-ConnectionGUID: fI0lJzuLQU2ALLeW+8bz/w==
X-CSE-MsgGUID: FMKat494Qmmrv++RC3P0Zg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,211,1787036400"; 
   d="scan'208";a="8867571"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 13 Nov 2026 00:21:58 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xRmXj-000000012Zb-2okZ;
	Fri, 13 Nov 2026 08:21:55 +0000
Date: Fri, 13 Nov 2026 16:21:13 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-5.15 1/1]
 include/trace/trace_events.h:27:23: warning:
 'str__cdc_ether__trace_system_name' defined but not used
Message-ID: <202611131652.U8v2CNdb-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

Hi yenchia.chen,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android14-5.15
head:   f93af2711dc1f87340c2c1e9b7708ea2b1978a58
commit: bd4dfcd275f371e3d65b7896148151aed16a6c80 [1/1] ANDROID: vendor_hooks: Add hooks to support rndis_host
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20261113/202611131652.U8v2CNdb-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 16.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261113/202611131652.U8v2CNdb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611131652.U8v2CNdb-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/trace/define_trace.h:102,
                    from include/trace/hooks/cdc_ether.h:17,
                    from drivers/android/vendor_hooks.c:81:
>> include/trace/trace_events.h:27:23: warning: 'str__cdc_ether__trace_system_name' defined but not used [-Wunused-const-variable=]
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
                    from include/trace/hooks/bl_hib.h:44,
                    from drivers/android/vendor_hooks.c:80:
   include/trace/trace_events.h:27:23: warning: 'str__bl_hib__trace_system_name' defined but not used [-Wunused-const-variable=]
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
                    from include/trace/hooks/delayacct.h:65,
                    from drivers/android/vendor_hooks.c:79:
   include/trace/trace_events.h:27:23: warning: 'str__delayacct__trace_system_name' defined but not used [-Wunused-const-variable=]
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
                    from include/trace/hooks/user.h:21,
                    from drivers/android/vendor_hooks.c:78:
   include/trace/trace_events.h:27:23: warning: 'str__user__trace_system_name' defined but not used [-Wunused-const-variable=]
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
                    from include/trace/hooks/sound.h:18,
                    from drivers/android/vendor_hooks.c:77:
   include/trace/trace_events.h:27:23: warning: 'str__sound__trace_system_name' defined but not used [-Wunused-const-variable=]
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
                    from include/trace/hooks/typec.h:59,
                    from drivers/android/vendor_hooks.c:76:
   include/trace/trace_events.h:27:23: warning: 'str__typec__trace_system_name' defined but not used [-Wunused-const-variable=]
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


vim +/str__cdc_ether__trace_system_name +27 include/trace/trace_events.h

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
