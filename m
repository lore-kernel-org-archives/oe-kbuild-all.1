Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E14938D
	for <oe-kbuild-all@lists.linux.dev>; Fri, 18 Sep 2026 00:24:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789691062; cv=none; b=sT9jokrSnts5Z1AZyChVDXzLerxjsyq2Xb6e0hLqFUx2GqKWSgla2tmDPrMhlfsS6nT26fWmhvHj5g0i1YHsmteX771t/pL4wOSD+YjeHYtDHmtTUR4NLnyhGLaQTo5UE+JtrYk+euguxd0rLDOHWr4DwnUNuY8OA02Vk54vYvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789691062; c=relaxed/simple;
	bh=C5wE0AYHLJc1MX4yhzU1i/Nl4/Vkx2qaJzCZjcCVawo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ZZmBEcopJqkcJBxpHwJMG0i23mSB6xKWX5ueHm8QiqgVdoAJvz2PmBHlVdgWYNxWQbXiAysVPJmbQ1ZXrjL9YzIOgJG/8UIn3uLhV2pgW1IWSRgsgtY+iQ8TtuN4wZXzyIF4v7onun46E4pZGjxdkVjz0YrJ9k8ZAQl76pYUlCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eTM7IUoA; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eTM7IUoA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789691057; x=1821227057;
  h=date:from:to:cc:subject:message-id;
  bh=C5wE0AYHLJc1MX4yhzU1i/Nl4/Vkx2qaJzCZjcCVawo=;
  b=eTM7IUoAdxJAXm9aqa2rtSY76J7E2sVt+uiQTdKaq240ZpVWz/84Q9LX
   5qTJgYqQ9lMz113H+Pkl63Oc9dZqridDB9XeicZBW2NBNwcUU/OmMxcr/
   uxBVRPFj8yFtZjLhZVXM4E606B58dunS/K+9dXgsV2bSTr9I1w98QbB8a
   HkW309xzBrrjBPHDTI7q8xGPDfqobzDLgvrFXsT8RFG3+YOAAwabndycl
   tJBLn5Otd3RcJJdNXlBtJLnUjAPbGSfBM10CpRc+ilwcC1UvbrBj2DqRF
   VB3BNyDzrtVyAXALovQzAbKy0QsdN162f0h7/fPVIv6FEz8OeVNmEAsCg
   Q==;
X-CSE-ConnectionGUID: 6pLGunK7Q0C5Vx7d9Hn8bg==
X-CSE-MsgGUID: 83C32EoZQha+ft0vpyDY0A==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="77730232"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="77730232"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2026 17:24:13 -0700
X-CSE-ConnectionGUID: ZwkYu+NdTr+r5ocRQxaARg==
X-CSE-MsgGUID: cG4uXya5SaCZkVw1qY1V8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="2325835"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa011.fm.intel.com with ESMTP; 17 Sep 2026 17:24:11 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x7MOf-000000008rX-13kK;
	Fri, 18 Sep 2026 00:24:09 +0000
Date: Fri, 18 Sep 2026 08:23:46 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.10 1/1]
 include/trace/trace_events.h:27:23: warning: 'str__binder__trace_system_name'
 defined but not used
Message-ID: <202609180832.ipmCmerN-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi JianMin,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android13-5.10
head:   f107467f23d029ae469a0e8acada4336424274ca
commit: 3fc5e942554eb435a2afd5113778eefd2a97f19b [1/1] ANDROID: binder: Add vendor hook to the binder
config: arm64-randconfig-1001-20260918 (https://download.01.org/0day-ci/archive/20260918/202609180832.ipmCmerN-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260918/202609180832.ipmCmerN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609180832.ipmCmerN-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/trace/define_trace.h:102,
                    from include/trace/hooks/binder.h:33,
                    from drivers/android/vendor_hooks.c:13:
>> include/trace/trace_events.h:27:23: warning: 'str__binder__trace_system_name' defined but not used [-Wunused-const-variable=]
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
                    from include/trace/hooks/fpsimd.h:26,
                    from drivers/android/vendor_hooks.c:12:
   include/trace/trace_events.h:27:23: warning: 'str__fpsimd__trace_system_name' defined but not used [-Wunused-const-variable=]
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
                    from include/trace/hooks/sched.h:60,
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

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for USB_PHY
   Depends on [n]: USB_SUPPORT [=n]
   Selected by [y]:
   - GKI_HIDDEN_USB_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for WEXT_PROC
   Depends on [n]: NET [=y] && WIRELESS [=y] && PROC_FS [=n] && WEXT_CORE [=y]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]


vim +/str__binder__trace_system_name +27 include/trace/trace_events.h

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
