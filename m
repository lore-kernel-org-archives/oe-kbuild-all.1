Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6573747DF98
	for <oe-kbuild-all@lists.linux.dev>; Tue,  4 Aug 2026 16:51:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785862298; cv=none; b=g81c1RljIjjOH6K5vMPZ8qqI00uH73KeR/93gFZDcipUr3Ck4tw1VUanfOmeja5Vwx+uwPdz9KYOiuqZk1m6pv7oTMARdpmkUPXy/MYtWbn7+uloVlMAqE9sYe6C0F9AxFAOBTL5w9MZynzoBG8sCVPt8njvhZSyI6ud2cyhHj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785862298; c=relaxed/simple;
	bh=XldUukV5Xf02glUsEGDj9yZ41y9ocpI76SsrQx+ryII=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=bwYGDyhJQ3ny6Xwy0WSx6MTd0Ih0jLeL7wMKQ+v18iNHgHh0H3RXZnvYju1iEbY0tBsR+slC4POhJh/QjMaFtklkDaUcLNojJjwnPsG+0HgOe9N8wjeLWrdxYj42WBX36QxC7OOBJ8TVki/np24pjDNNJqqCX4ob7MtpD5mZ1N4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Fx1yAw1e; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Fx1yAw1e"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785862284; x=1817398284;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XldUukV5Xf02glUsEGDj9yZ41y9ocpI76SsrQx+ryII=;
  b=Fx1yAw1eABGFz6+rGoi5oVtbn0toim/BDNNJFPYis05wYkDqSvEHOZiv
   hFIaWIZZcxX8upRrquVopndlkYLdjgqFLG2GMOrn/wFzKnEB4il5leAAS
   AmpcFmeFoRXrkhdrE0YKR7C3hL1TuAsW4o3b+IfLp2edq7Nr7kwl4vxN7
   MOuy5MmJHaYDAcAAZi+9c6iyGD7wZPmVq3QKiM7SuLStLexKrB9J7hPO4
   odf8eqIOKdmtGIaeq1u+HjIbL1lnrOsWJK6mLCE6x3VxzL7ImzeYV1y4m
   S419rdp7+J6u0diAaviDLzHtaKBIYGEsKbd7aKBMoBsYp7OxA8V+rVXeu
   A==;
X-CSE-ConnectionGUID: R7yodgjIREKqla1cF9fWJQ==
X-CSE-MsgGUID: gNNlrLO0ROiLDo09Q2+H7A==
X-IronPort-AV: E=McAfee;i="6800,10657,11865"; a="97925446"
X-IronPort-AV: E=Sophos;i="6.25,204,1779174000"; 
   d="scan'208";a="97925446"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2026 09:51:19 -0700
X-CSE-ConnectionGUID: cncgd/mTSoqdfbQzv/Le1w==
X-CSE-MsgGUID: CoWwd4ikT1C1Bg4xAvqK9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,204,1779174000"; 
   d="scan'208";a="265385147"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 04 Aug 2026 09:51:17 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wrIMF-00000000AF5-3MHr;
	Tue, 04 Aug 2026 16:51:15 +0000
Date: Wed, 05 Aug 2026 00:50:03 +0800
From: kernel test robot <lkp@intel.com>
To: "Thomas =?utf-8?Q?Wei=C3=9Fschuh?= (Schneider Electric)" <thomas.weissschuh@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [thomas-weissschuh:b4/auxclock-nanosleep 16/39]
 kernel/time/timekeeping.h:44:72: error: 'symbol' undeclared here (not in a
 function)
Message-ID: <202608050006.2IaipANw-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/linux.git b4/auxclock-nanosleep
head:   67005bd34e048d0f0fb4f5762d159093fac52cb7
commit: dcfa56542ac7fa99290449e0a2409b2d9e875e1c [16/39] timekeeping: time_test: Add a test for auxiliary to monotonic clock conversions
config: powerpc-allmodconfig (https://download.01.org/0day-ci/archive/20260805/202608050006.2IaipANw-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260805/202608050006.2IaipANw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608050006.2IaipANw-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/linkage.h:7,
                    from include/linux/printk.h:8,
                    from include/asm-generic/bug.h:31,
                    from arch/powerpc/include/asm/bug.h:116,
                    from include/linux/bug.h:5,
                    from include/linux/fortify-string.h:5,
                    from include/linux/string.h:383,
                    from arch/powerpc/include/asm/paca.h:16,
                    from arch/powerpc/include/asm/current.h:13,
                    from include/linux/sched.h:12,
                    from include/linux/audit.h:12,
                    from kernel/time/timekeeping.c:6:
>> kernel/time/timekeeping.h:44:72: error: 'symbol' undeclared here (not in a function)
      44 | #define EXPORT_SYMBOL_FOR_TIME_TEST(_symbol) EXPORT_SYMBOL_FOR_MODULES(symbol, "time_test");
         |                                                                        ^~~~~~
   include/linux/export.h:76:23: note: in definition of macro '__EXPORT_SYMBOL'
      76 |         extern typeof(sym) sym;                                 \
         |                       ^~~
   kernel/time/timekeeping.h:44:46: note: in expansion of macro 'EXPORT_SYMBOL_FOR_MODULES'
      44 | #define EXPORT_SYMBOL_FOR_TIME_TEST(_symbol) EXPORT_SYMBOL_FOR_MODULES(symbol, "time_test");
         |                                              ^~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/time/timekeeping.c:156:1: note: in expansion of macro 'EXPORT_SYMBOL_FOR_TIME_TEST'
     156 | EXPORT_SYMBOL_FOR_TIME_TEST(tk_aux_capture_mono_conv);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/symbol +44 kernel/time/timekeeping.h

    42	
    43	#if IS_MODULE(CONFIG_TIME_KUNIT_TEST)
  > 44	#define EXPORT_SYMBOL_FOR_TIME_TEST(_symbol) EXPORT_SYMBOL_FOR_MODULES(symbol, "time_test");
    45	#else
    46	#define EXPORT_SYMBOL_FOR_TIME_TEST(_symbol)
    47	#endif
    48	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
