Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 456D334D3B3
	for <oe-kbuild-all@lists.linux.dev>; Mon, 10 Nov 2025 13:15:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762780548; cv=none; b=MoTXAMAt8oWPf7EGSYfj90q2s4e3UnxhGyWnYwKbcwHJYXai/HXxY5ilv8BGUird6+arlevp5KwbOIAfbAFJld068aSPCuIqgIPGqyhywyvNUJAW8KwmRsRAEm8aX7B3Y5KSZK3NpFYzbh38fyIqJ5oafA+EUVx3r3sH9f2i5D0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762780548; c=relaxed/simple;
	bh=i+iFASREPuvpjfhU0NioRGa1KpuZi0ZnkGCupJic9XM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=K61YZjC7OIs4KyXiMvQQROHJlx2uuQTk7uO8/UiSI9mg+uAxmyxRQLsrQMU/tU2HvTK+FsJaM64LmSYbVz2fqTXXHw9LVcP/zCS8Ka1k4Q3c94GdBOm6G1DpeFAnGJs9EeT5XaWqKovkw/1uSjaQJ9EogPWiIswsMDL19WMeENU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JVcDhoxl; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JVcDhoxl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762780547; x=1794316547;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=i+iFASREPuvpjfhU0NioRGa1KpuZi0ZnkGCupJic9XM=;
  b=JVcDhoxljIlki3TT70jZxCV8RmNCz7EtMFqKLpD20VZG52AmiDpunv31
   nwt0H0u5iXs/RoOqfo79kiPd+vbzsBh+KFDGNTzH8Pr/JYha2JlOVSE1U
   9E2c4sltWJ3uhgaP3JpaiG26cES3cuEGNBffA4cbvj+rn/jTMUZegtCnX
   P6PWE/U0HsJddOMIFvF3P+cyy45tPidY+LNBhypEFf8gSjj93DPeck64x
   saZFxBl9Iu/JiQ2iM+eyrrZFWe5PQttqrtW+UDreFznN6QN79sVW/lgHb
   YgZ/uEwcusvBkSpUHredF4+frjxH8dvASa/auvrqcZTquKIRnyBra/ir0
   Q==;
X-CSE-ConnectionGUID: t8hFH7XDQ8OrwivxttieIg==
X-CSE-MsgGUID: UpfdQxfBT6+QxuvQKgnuvA==
X-IronPort-AV: E=McAfee;i="6800,10657,11609"; a="68687628"
X-IronPort-AV: E=Sophos;i="6.19,293,1754982000"; 
   d="scan'208";a="68687628"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2025 05:15:46 -0800
X-CSE-ConnectionGUID: DHCfrSClSJG1ybYTrrfiQA==
X-CSE-MsgGUID: EVG9qk31RyWD55xwCe/1mw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,293,1754982000"; 
   d="scan'208";a="188626653"
Received: from lkp-server01.sh.intel.com (HELO 7b01c990427b) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 10 Nov 2025 05:15:46 -0800
Received: from kbuild by 7b01c990427b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vIRkF-0000S7-26;
	Mon, 10 Nov 2025 13:15:43 +0000
Date: Mon, 10 Nov 2025 21:15:34 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [peterz-queue:x86/bugs 6/12] include/asm-generic/bug.h:120:9:
 warning: 'WARN_ON' redefined
Message-ID: <202511102135.9RrF09X4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git x86/bugs
head:   73b86a81cd36da4764a01bf51b2a40bb166baaa4
commit: 4f3173ebe736215966db77c3734855b5c0698dd7 [6/12] bug: Implement WARN_ON() using __WARN_FLAGS()
config: sh-allnoconfig (https://download.01.org/0day-ci/archive/20251110/202511102135.9RrF09X4-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251110/202511102135.9RrF09X4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511102135.9RrF09X4-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/sh/include/asm/bug.h:112,
                    from include/linux/bug.h:5,
                    from include/linux/page-flags.h:10,
                    from kernel/bounds.c:10:
>> include/asm-generic/bug.h:120:9: warning: 'WARN_ON' redefined
     120 | #define WARN_ON(condition) ({                                           \
         |         ^~~~~~~
   arch/sh/include/asm/bug.h:68:9: note: this is the location of the previous definition
      68 | #define WARN_ON(x) ({                                           \
         |         ^~~~~~~
--
   In file included from arch/sh/include/asm/bug.h:112,
                    from include/linux/bug.h:5,
                    from include/linux/thread_info.h:13,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/sh/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:79,
                    from include/linux/spinlock.h:56,
                    from include/linux/mmzone.h:8,
                    from include/linux/gfp.h:7,
                    from include/linux/slab.h:16,
                    from kernel/fork.c:16:
>> include/asm-generic/bug.h:120:9: warning: 'WARN_ON' redefined
     120 | #define WARN_ON(condition) ({                                           \
         |         ^~~~~~~
   arch/sh/include/asm/bug.h:68:9: note: this is the location of the previous definition
      68 | #define WARN_ON(x) ({                                           \
         |         ^~~~~~~
   kernel/fork.c: In function '__do_sys_clone3':
   kernel/fork.c:2898:2: warning: #warning clone3() entry point is missing, please fix [-Wcpp]
    2898 | #warning clone3() entry point is missing, please fix
         |  ^~~~~~~
--
   In file included from arch/sh/include/asm/bug.h:112,
                    from include/linux/bug.h:5,
                    from include/linux/page-flags.h:10,
                    from kernel/bounds.c:10:
>> include/asm-generic/bug.h:120:9: warning: 'WARN_ON' redefined
     120 | #define WARN_ON(condition) ({                                           \
         |         ^~~~~~~
   arch/sh/include/asm/bug.h:68:9: note: this is the location of the previous definition
      68 | #define WARN_ON(x) ({                                           \
         |         ^~~~~~~
   In file included from arch/sh/include/asm/bug.h:112,
                    from include/linux/bug.h:5,
                    from include/linux/mmdebug.h:5,
                    from include/linux/mm.h:6,
                    from arch/sh/kernel/asm-offsets.c:15:
>> include/asm-generic/bug.h:120:9: warning: 'WARN_ON' redefined
     120 | #define WARN_ON(condition) ({                                           \
         |         ^~~~~~~
   arch/sh/include/asm/bug.h:68:9: note: this is the location of the previous definition
      68 | #define WARN_ON(x) ({                                           \
         |         ^~~~~~~
   In file included from arch/sh/include/asm/bug.h:112,
                    from include/linux/bug.h:5,
                    from include/linux/thread_info.h:13,
                    from include/asm-generic/current.h:6,
                    from ./arch/sh/include/generated/asm/current.h:1,
                    from include/linux/sched.h:12,
                    from include/linux/sched/affinity.h:1,
                    from kernel/sched/sched.h:8,
                    from kernel/sched/rq-offsets.c:5:
>> include/asm-generic/bug.h:120:9: warning: 'WARN_ON' redefined
     120 | #define WARN_ON(condition) ({                                           \
         |         ^~~~~~~
   arch/sh/include/asm/bug.h:68:9: note: this is the location of the previous definition
      68 | #define WARN_ON(x) ({                                           \
         |         ^~~~~~~
   <stdin>:1519:2: warning: #warning syscall clone3 not implemented [-Wcpp]


vim +/WARN_ON +120 include/asm-generic/bug.h

   112	
   113	#define __WARN_printf(taint, arg...) do {				\
   114			instrumentation_begin();				\
   115			__warn_printk(arg);					\
   116			__WARN_FLAGS("", BUGFLAG_NO_CUT_HERE | BUGFLAG_TAINT(taint));\
   117			instrumentation_end();					\
   118		} while (0)
   119	
 > 120	#define WARN_ON(condition) ({						\
   121		int __ret_warn_on = !!(condition);				\
   122		if (unlikely(__ret_warn_on))					\
   123			__WARN_FLAGS("["#condition"] ",				\
   124				     BUGFLAG_TAINT(TAINT_WARN));		\
   125		unlikely(__ret_warn_on);					\
   126	})
   127	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
