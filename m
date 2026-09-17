Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BB5C4DDB2C
	for <oe-kbuild-all@lists.linux.dev>; Thu, 17 Sep 2026 20:32:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789677136; cv=none; b=EnSIZ/pDqkjfsW9B6OiNd1JFxrAY1SD74nTEI/446WtLXXi25xDPRNSV/SfNcIHot1I1vzG4kgOoWcDvQbrdhozY+v2kmvPGRN5HN7F8T7LeiTta3yjOA9V42EYR/crPMuXazUqEAUqR4xUwdtrrU255nySaldSUtY2Vt8dgRxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789677136; c=relaxed/simple;
	bh=YN0wa8W/sVDooZX+o87f9BNNceqiWJAIOm+1W7gJjkE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=AljUOT8xtkz88M8o7VfCOHb7CGCl6+r22ehsWZifkfotJeDDvd8EshYcb1VGaQrQO146cAR+GQAPvcoe1RivN3jIgt0owfGkymzZyDauEEoYDnAvx1F1fzRp8oYvAu19SyY34kk2a9ydgDf8US7hx83WZG/9u/32dsPxZy2CY14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WeANYDlT; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WeANYDlT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789677134; x=1821213134;
  h=date:from:to:cc:subject:message-id;
  bh=YN0wa8W/sVDooZX+o87f9BNNceqiWJAIOm+1W7gJjkE=;
  b=WeANYDlT3WF75hH9uRGFCL23g8FBy37zFnNWsw9ayheHaxLZ+3SJkpSy
   2j/h7I0iu/fM7QkHMZ123YCfiV1aSXhEVZ+ZOmh3AxoaXj9TasyNTIMKc
   vPHcK0qEJcW+VQyh0Rsj5GjMVYlksVkvHHOybo3ce868pAIrCnldj2suB
   RqJ0drm0bHobUV36gR1QpE23Mzpe+UsfYLNfnP5WFXSRPC80Qc49qH0Pd
   QQTh8hJslDoYtZUHKvhWOEvTqMLGTilWhbBe0oZYFAxzdIcguCRLh0Hj5
   0q9ie7Wa4f4v1UDhLo613RBLllkH3/b2ikdSNtU07W2vVAmaGc4OmcH0J
   w==;
X-CSE-ConnectionGUID: kN0oBxKZSHuAATbu7FYc4Q==
X-CSE-MsgGUID: iYXrIEeDSz6fSls/VGtC8A==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="93975700"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="93975700"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2026 13:32:09 -0700
X-CSE-ConnectionGUID: HrKd6zDMRcGS0TcipWimVw==
X-CSE-MsgGUID: nHTEYiBBRrKvZd3uvbt/fA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="270306207"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 17 Sep 2026 13:32:08 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x7Im6-000000008TR-0HYu;
	Thu, 17 Sep 2026 20:32:06 +0000
Date: Fri, 18 Sep 2026 04:31:53 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.10 1/1]
 include/trace/trace_events.h:27:23: warning: 'str__sched__trace_system_name'
 defined but not used
Message-ID: <202609180457.ehKG9bxO-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Yun,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android13-5.10
head:   f107467f23d029ae469a0e8acada4336424274ca
commit: a1fc1fba460be48dff2484b438888ede557930d4 [1/1] ANDROID: sched: add restrict vendor hook to modify task placement policy in EAS
config: arm64-randconfig-1001-20260918 (https://download.01.org/0day-ci/archive/20260918/202609180457.ehKG9bxO-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260918/202609180457.ehKG9bxO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609180457.ehKG9bxO-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/trace/define_trace.h:102,
                    from include/trace/hooks/sched.h:23,
                    from drivers/android/vendor_hooks.c:11:
>> include/trace/trace_events.h:27:23: warning: 'str__sched__trace_system_name' defined but not used [-Wunused-const-variable=]
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


vim +/str__sched__trace_system_name +27 include/trace/trace_events.h

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
