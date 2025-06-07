Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1536C204C1A
	for <oe-kbuild-all@lists.linux.dev>; Sat,  7 Jun 2025 22:09:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749334186; cv=none; b=ffZVtwmiieJBWNUCkPRRToZuJMOqQ4desG0sGxQgY6gr9dO2dNLQphTsw6jqode4C/aY6IA668Man6zIome9VMpmjQuObmEmGiURZ4zJDPkOmMsUStELjn1Jh1L3UOZFo44nffOwb+ijaH+yFyJ+f+VuSCIf4qFz3aKFI72w2H0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749334186; c=relaxed/simple;
	bh=0Gd2iuGjKxl1OKO7ctg7PkhIsDSqIxLfKNdKCfRilN8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=u8GOLMmAFfot0f93G0Y8gntj3ZvL4F4SNmq2w6MspSlh8cr5O2yUU7ci81I0casqk9RTtA9ZkX0izvnEPNjbVIBrmIHK9t3KSMh/94pXhu1qk3QwzdTUTHaopZ44RIOoNYCavFR3USFPV3gpJJrroezwD9WCspzruoXSMr26hEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TEdrChdj; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TEdrChdj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749334185; x=1780870185;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0Gd2iuGjKxl1OKO7ctg7PkhIsDSqIxLfKNdKCfRilN8=;
  b=TEdrChdjKHW61Y1f7R78urfzFS9dv/EBI0hiV7d4psNxwoyMSGpGV2lZ
   /x7iNIO/p0VtcwaIz+DKUFNXDCukU4tlkG0nUfDibGn0JVQpd6slYQ2NF
   Ztd8/ZpNT86SkLNl1CCdupDqwRhpwKST3egtsh5eT+QEQji7vczsMCMTs
   KI3Fs1BHNfSaAT6dpPcUjK4Ma4eiEXzmtDFXTBMBArqBHmSl7bTwHQtoQ
   5kPlfnA0x3dSCKSjk2+QuemCVYo8uGWZM5MjnywbtJ6ryYLJwR4wCW2av
   GyJtSlWAuRomzm4BJ1vWXYUxQzyIWbgebCVj/rj84YtK8ucKykw+Dxe72
   g==;
X-CSE-ConnectionGUID: Z+Py5ix9SfOT2HKVJgp9PA==
X-CSE-MsgGUID: H6/LFFG7SdaKJOAHUazhYQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11457"; a="51334154"
X-IronPort-AV: E=Sophos;i="6.16,219,1744095600"; 
   d="scan'208";a="51334154"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jun 2025 15:09:42 -0700
X-CSE-ConnectionGUID: rf79voQCS+6cwiEgyu7dkQ==
X-CSE-MsgGUID: wQs0fWxiRBettlrkdtPubQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,219,1744095600"; 
   d="scan'208";a="177087161"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 07 Jun 2025 15:09:42 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uO1jO-00063B-3A;
	Sat, 07 Jun 2025 22:09:38 +0000
Date: Sun, 8 Jun 2025 06:08:51 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-5.15 3/3]
 include/trace/trace_events.h:27:23: warning:
 'str__cdc_ether__trace_system_name' defined but not used
Message-ID: <202506080643.MHH8BGGn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi yenchia.chen,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android14-5.15
head:   313bc484fdba838fe2087b1bc1cf1f57e9a3eee9
commit: bd4dfcd275f371e3d65b7896148151aed16a6c80 [3/3] ANDROID: vendor_hooks: Add hooks to support rndis_host
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20250608/202506080643.MHH8BGGn-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250608/202506080643.MHH8BGGn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506080643.MHH8BGGn-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/trace/define_trace.h:102,
                    from include/trace/hooks/cdc_ether.h:17,
                    from drivers/android/vendor_hooks.c:81:
>> include/trace/trace_events.h:27:23: warning: 'str__cdc_ether__trace_system_name' defined but not used [-Wunused-const-variable=]
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
                    from include/trace/hooks/bl_hib.h:44,
                    from drivers/android/vendor_hooks.c:80:
   include/trace/trace_events.h:27:23: warning: 'str__bl_hib__trace_system_name' defined but not used [-Wunused-const-variable=]
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
                    from include/trace/hooks/delayacct.h:65,
                    from drivers/android/vendor_hooks.c:79:
   include/trace/trace_events.h:27:23: warning: 'str__delayacct__trace_system_name' defined but not used [-Wunused-const-variable=]
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
                    from include/trace/hooks/user.h:21,
                    from drivers/android/vendor_hooks.c:78:
   include/trace/trace_events.h:27:23: warning: 'str__user__trace_system_name' defined but not used [-Wunused-const-variable=]
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
                    from include/trace/hooks/sound.h:18,
                    from drivers/android/vendor_hooks.c:77:
   include/trace/trace_events.h:27:23: warning: 'str__sound__trace_system_name' defined but not used [-Wunused-const-variable=]
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
                    from include/trace/hooks/typec.h:59,
                    from drivers/android/vendor_hooks.c:76:
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


vim +/str__cdc_ether__trace_system_name +27 include/trace/trace_events.h

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
