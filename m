Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27D2E25178C
	for <oe-kbuild-all@lists.linux.dev>; Tue, 17 Jun 2025 19:40:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750189224; cv=none; b=PPZCB5+4UqaMnFRz4JW1ffLUtMOmNK2vdy0lqB8kwG3StT0CDlRzI8cWEfXt1ca4JrvJsLPIEHdYJskAAS4R77rNw/AAbPsuAjdHaXXxD4eL00wtJr7x5DdkXsFSmbIqtCUec/HcNwXN051Kql2GB7XA/Q2Ttf5D/1z9kBFhlBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750189224; c=relaxed/simple;
	bh=garWadXQGNzXogZ8JH0geZWqMso0Aj5jMcsa/kV/C64=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qaWfXrHJpJ3PAlpIHopO0CZNzatiL4er5hYfh6xUObU2oVJXiIDmOcsWA+cewDQNcHkLjyQbpN1r55rRrVVUpmdJ0j1JjTfP4H7HJ9UShv08oLi3bzbWkruTd3+bYvXXs3cJLD0cffNsp0ypG95HQkbkLcWsQFuMOqKAciBNv/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZuARKkoh; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZuARKkoh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750189223; x=1781725223;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=garWadXQGNzXogZ8JH0geZWqMso0Aj5jMcsa/kV/C64=;
  b=ZuARKkohhTuYnJqIbH/9AahVAfX0tMkOOCi4HdtO6f/eXJeAOTriiJti
   mWnRVweMo9znH3p87+tzC9AsQPhLjMemVayHSEm9ypH5vglpsf4Bc+WhQ
   ZwwYbzMJ7pQOWyv/f/lMZIm2gmkqZDlYQsf/eXFEu+wpLfXG9YZwNdEP3
   oC7kQEHm/f3h+w5e8CvupXoehjJ/x16679AaUR4W14Ly6/6TD+edwhwWj
   1NzexxtFiY7iznDRwGpHnsuZ3NwERGBf+vobbzjZ04GPDaCjMus/ML+sk
   fL/HjlAsulSkPsC204LSLTfDMunevrktTNyEWjLCa5Nl+Cud+ODYN/UNu
   Q==;
X-CSE-ConnectionGUID: zWG3wWbkR62waokIIbUNYQ==
X-CSE-MsgGUID: iGkEEOrNT4WpWZENE2rEIg==
X-IronPort-AV: E=McAfee;i="6800,10657,11467"; a="52524924"
X-IronPort-AV: E=Sophos;i="6.16,244,1744095600"; 
   d="scan'208";a="52524924"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2025 12:40:22 -0700
X-CSE-ConnectionGUID: UeKCX4gaSsKOblUnf7+J1g==
X-CSE-MsgGUID: WzdDVWABTvuG1817ikZIiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,244,1744095600"; 
   d="scan'208";a="179798326"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 17 Jun 2025 12:40:20 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uRcAM-000I1m-0y;
	Tue, 17 Jun 2025 19:40:18 +0000
Date: Wed, 18 Jun 2025 03:39:32 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-5.10-2025-06 1/1]
 include/trace/trace_events.h:27:23: warning: 'str__sched__trace_system_name'
 defined but not used
Message-ID: <202506180307.eS7hjYqf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Yun,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android12-5.10-2025-06
head:   484c3d56a37435198fa13276c8c97acda5ac28f4
commit: a1fc1fba460be48dff2484b438888ede557930d4 [1/1] ANDROID: sched: add restrict vendor hook to modify task placement policy in EAS
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20250618/202506180307.eS7hjYqf-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250618/202506180307.eS7hjYqf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506180307.eS7hjYqf-lkp@intel.com/

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
