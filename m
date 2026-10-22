Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792648212;
	b=Ein3WlJ4QFSV3r7Qjejwl9up3O9uPwWr1rx8f2GfOIAq/ABiuZoMc1oii3wTQdPmW4JZ
	 Kc/wVCMyGV/a0V+o94RWdv8WMGj6zBACLy1kHZXbUD6nQwh9ke+RBocOV+qWsDtv2Z12X
	 pJn71KWu2UhyElLk/YfF8XWPbWuG7aGuOjBdidWZgsXylHmKKm8Qod+hT6ewiFymFsTx/
	 U7cgUI3VJYWIUOwvVXr7Mq/89CFigYv+bFi7QUx0CVVppZDGWq66UjSoy6OPBXoow+kO8
	 gzuT9EtHRb2kGIpiezfCAvxkU1RyDfRpnDma1ED+sS6IccqSPy1CQBPTwrUEPik98bQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792648212;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=DcroBHo4oZTJ6HbVQoyVYWoa7O+2PyJHtQOoOE6EQWs=;
	b=x/ZRitPbVU2fULaHZCdq4L0qs1nzsL4hiWpCWVrRs5Ws2jAKNp8NNgQddjzrsSEA404j
	 zjVowhpixAGZtZbmtWGVzYib3uxt50XByykwPFtvquM5A2H47B/2Jri1fVhJllvm+3ioJ
	 wXnDQCnc64ONnMz7C0vdbeBk6s40jXd0hYxup25zFVFEe2/VE7NN5VYejfezCSE1YJH5n
	 dpBN6EJpn/G+7TShaszsaidJL0meBz0Sg2X1Z2Kthe/x58wKeZ5VwxOhDR3OWepVXH35t
	 O5fIAwtv9BJuMNQMZGsn2/mml33wknrNAANprBLvD9TSd5CyOB090OS01PW3wmMLWnQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=KgQyPzx8;
	arc=none smtp.remote-ip=192.198.163.18
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3C1D606A319
	for <oe-kbuild-all@lists.linux.dev>; Thu, 22 Oct 2026 05:50:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C3C1D606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=KgQyPzx8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792648211; x=1824184211;
  h=date:from:to:cc:subject:message-id;
  bh=dg/rnQRDMC9ydhUiji4+Mm2L+KfieIDY4MvbH7nY5P8=;
  b=KgQyPzx8lNNN/hrM1Igo3fVVqYYOB5VO4zAAKxSXfAOpXacoQFXr117M
   ESeXiBLTd39qe2g/lM6JAkW0Q1KcFXYHbcQAu9YZg+z/iD4a4E1peMCeA
   +BWz7LkCtViF4Yu2WL3l+q0BMK4XNnI8ktFVSNyG46s8bFjrh4lKwbH2C
   am2yiSPZwtXNPm1g86lRxh7fhL/JiVuB9puF3ZMYvXuDgjE0CalTrJSAX
   kbdQOVQRNAzN+N9rEq3jn/biN13uqMg4xi+Xd2y5tTHHlQmKwCHWSktHE
   SESHINoCzqN2nj4HTmPiyA2yIjJXHk29+CcxZeNgQ0TExA0i+Y9FHyB9n
   w==;
X-CSE-ConnectionGUID: /rS6cnluTeurs+bgwJi2SQ==
X-CSE-MsgGUID: HYQiNdTTSC6QN5moMcKMIQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11942"; a="1423016"
X-IronPort-AV: E=Sophos;i="6.27,171,1787036400"; 
   d="scan'208";a="1423016"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2026 22:50:10 -0700
X-CSE-ConnectionGUID: 15aKq2RPTxKzTqB1Xlf/2Q==
X-CSE-MsgGUID: pKQjS1dYTmq19hRJ+QKCOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,171,1787036400"; 
   d="scan'208";a="3405206"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 21 Oct 2026 22:50:08 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xJlgk-00000000Qby-0T8Y;
	Thu, 22 Oct 2026 05:50:06 +0000
Date: Thu, 22 Oct 2026 13:49:44 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-lts 1/1]
 include/trace/stages/init.h:2:23: warning:
 'str__cdc_ether__trace_system_name' defined but not used
Message-ID: <202610221356.Hd7yHixz-lkp@intel.com>
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

tree:   https://android.googlesource.com/kernel/common android16-6.12-lts
head:   571d9c1bbba0039f8fa842785e434862ba744377
commit: 6656c5c0734220111bac3790e57b0941565aff90 [1/1] ANDROID: vendor_hooks: Add hooks to support rndis_host
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20261022/202610221356.Hd7yHixz-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 16.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261022/202610221356.Hd7yHixz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610221356.Hd7yHixz-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/trace/trace_events.h:27,
                    from include/trace/define_trace.h:109,
                    from include/trace/hooks/cdc_ether.h:17,
                    from drivers/android/vendor_hooks.c:87:
>> include/trace/stages/init.h:2:23: warning: 'str__cdc_ether__trace_system_name' defined but not used [-Wunused-const-variable=]
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
                    from include/trace/hooks/typec.h:15,
                    from drivers/android/vendor_hooks.c:86:
   include/trace/stages/init.h:2:23: warning: 'str__typec__trace_system_name' defined but not used [-Wunused-const-variable=]
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
                    from include/trace/hooks/dwc3.h:43,
                    from drivers/android/vendor_hooks.c:85:
   include/trace/stages/init.h:2:23: warning: 'str__dwc3__trace_system_name' defined but not used [-Wunused-const-variable=]
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

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for INTEL_MEI_ME
   Depends on [n]: X86 && PCI [=y]
   Selected by [y]:
   - INTEL_MEI_HDCP [=y] && (DRM_I915 [=n] || DRM_XE [=y])
   - INTEL_MEI_PXP [=y] && (DRM_I915 [=n] || DRM_XE [=y])


vim +/str__cdc_ether__trace_system_name +2 include/trace/stages/init.h

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
