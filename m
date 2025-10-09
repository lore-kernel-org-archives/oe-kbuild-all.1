Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08C0212CDA5
	for <oe-kbuild-all@lists.linux.dev>; Thu,  9 Oct 2025 16:15:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760026558; cv=none; b=fzByKphRG0/K4zd6UXrJ/gqUm0B+JpEE1axqhoeAzyjRlmfPQ0DV+Z/CJSVvG9M1CvnFeJvRVNWXRtc4r29IhY6PU2GnwrNkcaiSNiK/Xufq3ritnt+kn9zEbq4boSNUxLD0KP653XdjHNy36fE9IuBpf8Jl4eG1TriLnQ1daIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760026558; c=relaxed/simple;
	bh=jYrwXwViOD7aFzPDAfqBnCDS/1CZ+LeLKA6s0O6Mmo0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AOW/QO2ee+Sq0RLHph8gNjrjOrng1IrewR9PBfXH/h+Gnzey9+UTlhEMPQsp9e62+vULlV8df5Pz/KAnrb53APb1+477v0wrRYe3hDQnqs1CLMV0iB+Kx0cYXpUJCOR2vC2QDJrggI/rMSu0Df6Hfzo232g0pFFjtNkQmzGUBKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LfPeVZGc; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LfPeVZGc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760026557; x=1791562557;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jYrwXwViOD7aFzPDAfqBnCDS/1CZ+LeLKA6s0O6Mmo0=;
  b=LfPeVZGcgGRj/MZroMhHCIIRtJcPhAdu/XelP9oqNh4ovEsNCydqCv7X
   blvV8MVCEiuRZ1KKz1h4m3fCVQpzlcY2bHnP+DerVXr2n3Hen9QsbhI64
   Gga2QduejNiIfi+A2TQXnHj3zG9yeH8vu7/DKb7Ey+G1GU3Eym5KVxXfp
   t0+Q3xs6DQGVMldWjovX/nopTVg2nQ9Nga/2o/tt7n1Xyy39LeMIHw+W/
   vhiBECxPLAMGDxAbCgxmYgvGVVvilSlSl5LJNS3S9B2Wn0himrsz7CmCF
   1+IATDZ6tOyIysSZBOdybecJ5CbI9SpvEkQk6Q2rBZAGzsWEb+sDxuyKu
   w==;
X-CSE-ConnectionGUID: WDzmg7/9S/+/Ty76xss8KA==
X-CSE-MsgGUID: d0usdwl+QuGP5UeZ30L6Tg==
X-IronPort-AV: E=McAfee;i="6800,10657,11577"; a="72852871"
X-IronPort-AV: E=Sophos;i="6.19,216,1754982000"; 
   d="scan'208";a="72852871"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2025 09:15:56 -0700
X-CSE-ConnectionGUID: xLQCIUAkSRObxBgx2DTnew==
X-CSE-MsgGUID: oApYgAH0QKuxpOxxnihTlQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,216,1754982000"; 
   d="scan'208";a="179990057"
Received: from lkp-server01.sh.intel.com (HELO 6a630e8620ab) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 09 Oct 2025 09:15:55 -0700
Received: from kbuild by 6a630e8620ab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v6tJ2-0000z5-1X;
	Thu, 09 Oct 2025 16:15:52 +0000
Date: Fri, 10 Oct 2025 00:15:14 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-5.10-2025-06 1/1]
 include/trace/trace_events.h:27:23: warning: 'str__sched__trace_system_name'
 defined but not used
Message-ID: <202510100040.PciTnXuD-lkp@intel.com>
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
head:   0da2761b0d573a9074ab1a5d3063c46a7a743861
commit: a1fc1fba460be48dff2484b438888ede557930d4 [1/1] ANDROID: sched: add restrict vendor hook to modify task placement policy in EAS
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20251010/202510100040.PciTnXuD-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251010/202510100040.PciTnXuD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510100040.PciTnXuD-lkp@intel.com/

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
