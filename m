Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10BAB195
	for <oe-kbuild-all@lists.linux.dev>; Sun, 11 May 2025 00:05:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746921940; cv=none; b=qehPR2WKYzHeEqlW117YUEqIaKLPxQwOytgszivqWY8uUhrhX2+xLAHk1r6usluvt0PJjFQqjDtG0EwWl5h+/REcx++62qmr5AR212AHzu9Vn3t5fc7WnnyRKbcQKBwbsKmcns7DcZSAW8mMb58LgzrYQTX147tL8sU3einiUvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746921940; c=relaxed/simple;
	bh=1asJrNN/Mekp4mUwfQz6O4H2pskM62Z7NnrODJV7RWY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Oi4sDAXiaET2+BX0RaAvwQ0RsqZP8EcQZBobM1g3Rvh4qgM2oYXAM+dkklNuOYt0S5T7AmX7L48XcR9AjDp4TGfLpjaC1LlITZZZV/cu24Z1XtjqIuWFbmcdUZAHmBncEK6PWCy2lsIFISqP6+kwku+0RxbCbopBfoa9KUGLjp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Kb3OSG1B; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Kb3OSG1B"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746921938; x=1778457938;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1asJrNN/Mekp4mUwfQz6O4H2pskM62Z7NnrODJV7RWY=;
  b=Kb3OSG1BWrocUEAXaAU5dO2rQHnT24phZ9urVX3BxZlaz/NPxhZCkvD/
   zDcQIf/lGQIs4SghvqjRV2iaWyy2WBo6M4Z6LzKcpQpVhuk4Knnr2ft5X
   ygnjL9V/pp9ckr4lN9cTrOIdjd4vrmPYPrwCKIURRMgO+qfVzOBOSK6Sr
   C9liFwcn8Zhst9VguEpICsp6qElDtWgc/STT5BVDl7dEd2PPVBpKiEEbt
   DcnRcGgIwfVNQ+cCvmYFdcewphSGdEeg+8/hT8HJsZxtrETaTulVQwZlY
   nqc6+jH2Ny7WVnJSq4+SU1BsWsyClG6rGKJAacrT8zHnlddMA9yZdr6Op
   w==;
X-CSE-ConnectionGUID: XtupuNKuRZaxQ2RGsLCzwQ==
X-CSE-MsgGUID: mr4Hk9mlTVaTdIV+X3G2Rw==
X-IronPort-AV: E=McAfee;i="6700,10204,11429"; a="47847543"
X-IronPort-AV: E=Sophos;i="6.15,278,1739865600"; 
   d="scan'208";a="47847543"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2025 17:05:37 -0700
X-CSE-ConnectionGUID: HBBHQDY4Rri3tsH7vbB+SA==
X-CSE-MsgGUID: SBHaHnebTLOqAVOh8TFGXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,278,1739865600"; 
   d="scan'208";a="136698523"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 10 May 2025 17:05:36 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uDuCE-000DU7-0M;
	Sun, 11 May 2025 00:05:34 +0000
Date: Sun, 11 May 2025 08:04:55 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-5.10 11/11]
 arch/x86/kernel/ftrace.c:691:6: warning: no previous prototype for function
 'arch_foreign_patched'
Message-ID: <202505110758.H7GlDn8z-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Yihao,

FYI, the error/warning still remains.

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-5.10
head:   135e4e84e5a63d5ee88888402c3f84836ab97e95
commit: 18978e3fb6aa251cfe4851c5249c427cc11d5344 [11/11] anolis: kprobes: fix ftrace conflict check for aarch64
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20250511/202505110758.H7GlDn8z-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
rustc: rustc 1.58.0 (02072b482 2022-01-11)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250511/202505110758.H7GlDn8z-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505110758.H7GlDn8z-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/x86/kernel/ftrace.c:691:6: warning: no previous prototype for function 'arch_foreign_patched' [-Wmissing-prototypes]
     691 | bool arch_foreign_patched(unsigned long addr)
         |      ^
   arch/x86/kernel/ftrace.c:691:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     691 | bool arch_foreign_patched(unsigned long addr)
         | ^
         | static 
   1 warning generated.
--
   kernel/trace/ftrace.c:302:5: warning: no previous prototype for function '__register_ftrace_function' [-Wmissing-prototypes]
     302 | int __register_ftrace_function(struct ftrace_ops *ops)
         |     ^
   kernel/trace/ftrace.c:302:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     302 | int __register_ftrace_function(struct ftrace_ops *ops)
         | ^
         | static 
   kernel/trace/ftrace.c:345:5: warning: no previous prototype for function '__unregister_ftrace_function' [-Wmissing-prototypes]
     345 | int __unregister_ftrace_function(struct ftrace_ops *ops)
         |     ^
   kernel/trace/ftrace.c:345:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     345 | int __unregister_ftrace_function(struct ftrace_ops *ops)
         | ^
         | static 
   kernel/trace/ftrace.c:584:5: warning: no previous prototype for function 'ftrace_profile_pages_init' [-Wmissing-prototypes]
     584 | int ftrace_profile_pages_init(struct ftrace_profile_stat *stat)
         |     ^
   kernel/trace/ftrace.c:584:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     584 | int ftrace_profile_pages_init(struct ftrace_profile_stat *stat)
         | ^
         | static 
   kernel/trace/ftrace.c:3882:15: warning: no previous prototype for function 'arch_ftrace_match_adjust' [-Wmissing-prototypes]
    3882 | char * __weak arch_ftrace_match_adjust(char *str, const char *search)
         |               ^
   kernel/trace/ftrace.c:3882:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    3882 | char * __weak arch_ftrace_match_adjust(char *str, const char *search)
         | ^
         | static 
   kernel/trace/ftrace.c:4193:6: warning: variable 'ret' set but not used [-Wunused-but-set-variable]
    4193 |         int ret;
         |             ^
   kernel/trace/ftrace.c:5630:6: warning: variable 'ret' set but not used [-Wunused-but-set-variable]
    5630 |         int ret;
         |             ^
>> kernel/trace/ftrace.c:7643:13: warning: no previous prototype for function 'arch_foreign_patched' [-Wmissing-prototypes]
    7643 | bool __weak arch_foreign_patched(unsigned long addr)
         |             ^
   kernel/trace/ftrace.c:7643:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    7643 | bool __weak arch_foreign_patched(unsigned long addr)
         | ^
         | static 
   7 warnings generated.


vim +/arch_foreign_patched +691 arch/x86/kernel/ftrace.c

   690	
 > 691	bool arch_foreign_patched(unsigned long addr)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
