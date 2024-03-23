Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64164DDCA
	for <oe-kbuild-all@lists.linux.dev>; Sat, 23 Mar 2024 08:04:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711181097; cv=none; b=iMXtG4ff0cFCnmkOhUV+ggXGDKujgLIvkj2UkKfkyq87rcnrwaHa0KmvPlWC6byaHhqFl2Mr9eCoR4Dht69Gf18HnD6qsN8/QFTftsLvgywvaW9qmnTnMPx5oVTlgCtLzkjQpIzdg1ywG7VFS22PMV3TxANEgxhfwUKr58MwiRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711181097; c=relaxed/simple;
	bh=bkIQho2IEst4Ki6yHXXVTUjYa4/DBfLmSqe00azIwZA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FiNXuexhEs+9uRctQ878tTRFpwTy3P05CB1z3oJgDEAuoFuoOes5iUCOp+4wMnnyr1K1J9lPMIeE5JK7vELjzKFLe7O1c6eR5L8P9+mTKD1IWMQMSLQlawjFrnbwMJMNU7aKJVRV10ND3aedgRCs/JPFguTfdZSrswiYzjXvj8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VTLJFSOE; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VTLJFSOE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711181095; x=1742717095;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bkIQho2IEst4Ki6yHXXVTUjYa4/DBfLmSqe00azIwZA=;
  b=VTLJFSOEc93VUwqsI9QN1QAxLlJQouJrRiGBZHIL0nYLuuu/dgPr1UXE
   MUx01Ras+rHoY69GfydRvFvB0Q/ruHhIBM6/XF6BlxfqP/Rmpb3wWtOCD
   1yjOqZlOE4/d8E7pie2lh3t3Fs9gJ/zyFRPx+Yn2obDwcMZXhspQ5o09+
   SBbe9iu2NgCI0yigNdScnyTSz+VfNV02U5m9ldpA4T4NMhFT7W16DWlg9
   oRLWcCfmJbMR+zybm5qQ8rUieu/0cGr7ygcrikwV2RQSvbuZOjySnmQmV
   IRLJSpI5xM7M/g38E/U9jKh3a6gUACz7SHY2wUcksdtWM77jvHpujTJJh
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11021"; a="17630229"
X-IronPort-AV: E=Sophos;i="6.07,148,1708416000"; 
   d="scan'208";a="17630229"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2024 01:04:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,148,1708416000"; 
   d="scan'208";a="46126990"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 23 Mar 2024 01:04:52 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rnwMz-000Ky3-29;
	Sat, 23 Mar 2024 08:04:49 +0000
Date: Sat, 23 Mar 2024 16:04:20 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 8/9] include/trace/stages/init.h:2:23:
 warning: 'str__logbuf__trace_system_name' defined but not used
Message-ID: <202403231652.reilDV2a-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   aa67823ffd3c448a722cd7c4a2f15990b00d8cd8
commit: e22678715e9f188f443f57496e30d3101ab0874b [8/9] ANDROID: logbuf: vendor hook for logbuf dump on oops
config: arm-allmodconfig (https://download.01.org/0day-ci/archive/20240323/202403231652.reilDV2a-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240323/202403231652.reilDV2a-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403231652.reilDV2a-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/fs.h:33,
                    from include/linux/huge_mm.h:8,
                    from include/linux/mm.h:1082,
                    from include/linux/scatterlist.h:8,
                    from include/linux/dma-mapping.h:11,
                    from include/linux/iova.h:15,
                    from drivers/android/vendor_hooks.c:9:
   include/linux/percpu-rwsem.h: In function 'percpu_down_read':
   include/linux/percpu-rwsem.h:70:55: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
      70 |         _trace_android_vh_record_pcpu_rwsem_starttime((u64)sem, jiffies);
         |                                                       ^
   include/linux/percpu-rwsem.h: In function 'percpu_down_read_trylock':
   include/linux/percpu-rwsem.h:97:63: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
      97 |                 _trace_android_vh_record_pcpu_rwsem_starttime((u64)sem, jiffies);
         |                                                               ^
   include/linux/percpu-rwsem.h: In function 'percpu_up_read':
   include/linux/percpu-rwsem.h:128:55: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
     128 |         _trace_android_vh_record_pcpu_rwsem_starttime((u64)sem, 0);
         |                                                       ^
   In file included from include/trace/trace_events.h:27,
                    from include/trace/define_trace.h:102,
                    from include/trace/hooks/logbuf.h:21,
                    from drivers/android/vendor_hooks.c:61:
   include/trace/stages/init.h: At top level:
>> include/trace/stages/init.h:2:23: warning: 'str__logbuf__trace_system_name' defined but not used [-Wunused-const-variable=]
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
                    from include/trace/define_trace.h:102,
                    from include/trace/hooks/signal.h:16,
                    from drivers/android/vendor_hooks.c:60:
   include/trace/stages/init.h:2:23: warning: 'str__signal__trace_system_name' defined but not used [-Wunused-const-variable=]
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
                    from include/trace/define_trace.h:102,
                    from include/trace/hooks/gzvm.h:16,
                    from drivers/android/vendor_hooks.c:59:
   include/trace/stages/init.h:2:23: warning: 'str__gzvm__trace_system_name' defined but not used [-Wunused-const-variable=]
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
                    from include/trace/define_trace.h:102,
                    from include/trace/hooks/power.h:21,
                    from drivers/android/vendor_hooks.c:58:
   include/trace/stages/init.h:2:23: warning: 'str__power__trace_system_name' defined but not used [-Wunused-const-variable=]
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
                    from include/trace/define_trace.h:102,
                    from include/trace/hooks/softlockup.h:17,
                    from drivers/android/vendor_hooks.c:57:
   include/trace/stages/init.h:2:23: warning: 'str__softlockup__trace_system_name' defined but not used [-Wunused-const-variable=]
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
                    from include/trace/define_trace.h:102,
                    from include/trace/hooks/bug.h:16,
                    from drivers/android/vendor_hooks.c:56:
   include/trace/stages/init.h:2:23: warning: 'str__bug__trace_system_name' defined but not used [-Wunused-const-variable=]
       2 | #define __app__(x, y) str__##x##y
         |                       ^~~~~
   include/trace/stages/init.h:3:21: note: in expansion of macro '__app__'
       3 | #define __app(x, y) __app__(x, y)
         |                     ^~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for IOMMU_IO_PGTABLE_LPAE
   Depends on [n]: IOMMU_SUPPORT [=y] && (ARM [=y] || ARM64 || COMPILE_TEST [=y]) && !GENERIC_ATOMIC64 [=y]
   Selected by [y]:
   - GKI_HIDDEN_QCOM_CONFIGS [=y] && ARCH_QCOM [=y]


vim +/str__logbuf__trace_system_name +2 include/trace/stages/init.h

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
