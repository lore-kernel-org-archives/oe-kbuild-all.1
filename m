Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71D6A2E717D
	for <oe-kbuild-all@lists.linux.dev>; Wed,  9 Jul 2025 15:44:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752075893; cv=none; b=tLy/vOQJysbAaRQlTRDUEiBtg6MCMThbcAtHLFjO7eT5xZ3LlPujmL76KoI/BySXQ3A3+mUwnRUQ4KWwM6stqZFLPKGoMlia9SCGsWgxrBfzfw+v9S5bEABPeHY31FvCkist3O84H9286owyJXWT0I/ngpg43SJaWRrMeUOX6sc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752075893; c=relaxed/simple;
	bh=axwzOR1RfjPm5x+v2i+MxzFjeEFZNFuL5KK3M9tj8u8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=e3TDhMzs3+1kIs3cmdPM3KERphfLZaH4jRz9BL1A+g+MwIHyGUEAnIgLCp2hAW9oIthR1ZD24syl4+dEEOzvRHMsr9Aed14q7Fv4rrbsbLkuhRfuvYcOYh0bnk7iDe4tkZcZJdpZotNVovo+nNC37A0OV15xd+vnn3LoUJJjOCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mOlvJcnQ; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mOlvJcnQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752075892; x=1783611892;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=axwzOR1RfjPm5x+v2i+MxzFjeEFZNFuL5KK3M9tj8u8=;
  b=mOlvJcnQbQ+YQwfsaMCKpbGQ1XalfnffJ/bgrsRtH82NLS80A0JMBopl
   BuSxNTQwnjFmqN2kh/iLRkhalhneK1CVR4zFB6zCvjjWZyHiIfnNW0+dF
   uJheAuqqIa0xc83r6TJQMADnisX9MAdxSzOl7ruaTHuwBgzmtsI1yijE8
   qSHnDU005QtK2QcG4TRw/dBP7Bp4kjoI2PLoSRxXTyEI+EhJEC/qEobsL
   CZhJURbBMEE4zVXyvzFDOuLICDieLSZLir0JE4uAeN8n9+9v8VAPrGScX
   NHEj1tmImDwaVMouZR0t3buZEKKSEudsGBAhcFNV5LlNdvKi5xbCBWQ/V
   w==;
X-CSE-ConnectionGUID: Cws7JtA7RBe1D0cplROzBg==
X-CSE-MsgGUID: v+d//52nRcC2EyqVZ8f3EA==
X-IronPort-AV: E=McAfee;i="6800,10657,11489"; a="54197258"
X-IronPort-AV: E=Sophos;i="6.16,298,1744095600"; 
   d="scan'208";a="54197258"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2025 08:44:49 -0700
X-CSE-ConnectionGUID: 2RtinYY6SRu8w4ixEhWi5Q==
X-CSE-MsgGUID: oTed8KFgQ3CShUXhiTVvsw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,298,1744095600"; 
   d="scan'208";a="179495670"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 09 Jul 2025 08:44:44 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uZWyQ-0003gl-1P;
	Wed, 09 Jul 2025 15:44:42 +0000
Date: Wed, 9 Jul 2025 23:44:40 +0800
From: kernel test robot <lkp@intel.com>
To: Gabriele Monaco <gmonaco@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [glemco:staging_rv_need_resched 2/38] getcpu.c:(.text+0x0): multiple
 definition of `vprintk_deferred';
 arch/s390/kernel/vdso64/vdso64_generic.o:vdso64_generic.c:(.text+0x0): first
 defined here
Message-ID: <202507092300.Isx1ydMp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitlab.com/glemco/linux staging_rv_need_resched
head:   2757d6e4f86634f62d63be0cc7a16425b8df9b9a
commit: ac69e92eb266cbb468a3777ea2950980311e8151 [2/38] printk: Make vprintk_deferred() public
config: s390-randconfig-001-20250709 (https://download.01.org/0day-ci/archive/20250709/202507092300.Isx1ydMp-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250709/202507092300.Isx1ydMp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507092300.Isx1ydMp-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from scripts/mod/devicetable-offsets.c:3:
   In file included from include/linux/mod_devicetable.h:14:
   In file included from include/linux/uuid.h:11:
   In file included from include/linux/string.h:392:
   In file included from include/linux/fortify-string.h:6:
   In file included from include/linux/bug.h:5:
   In file included from arch/s390/include/asm/bug.h:69:
   In file included from include/asm-generic/bug.h:22:
>> include/linux/printk.h:218:20: warning: no previous prototype for function 'vprintk_deferred' [-Wmissing-prototypes]
     218 | __printf(1, 0) int vprintk_deferred(const char *fmt, va_list args)
         |                    ^
   include/linux/printk.h:218:16: note: declare 'static' if the function is not intended to be used outside of this translation unit
     218 | __printf(1, 0) int vprintk_deferred(const char *fmt, va_list args)
         |                ^
         |                static 
   1 warning generated.
   In file included from kernel/bounds.c:10:
   In file included from include/linux/page-flags.h:10:
   In file included from include/linux/bug.h:5:
   In file included from arch/s390/include/asm/bug.h:69:
   In file included from include/asm-generic/bug.h:22:
>> include/linux/printk.h:218:20: warning: no previous prototype for function 'vprintk_deferred' [-Wmissing-prototypes]
     218 | __printf(1, 0) int vprintk_deferred(const char *fmt, va_list args)
         |                    ^
   include/linux/printk.h:218:16: note: declare 'static' if the function is not intended to be used outside of this translation unit
     218 | __printf(1, 0) int vprintk_deferred(const char *fmt, va_list args)
         |                ^
         |                static 
   1 warning generated.
   In file included from arch/s390/kernel/asm-offsets.c:9:
   In file included from include/linux/sched.h:12:
   In file included from arch/s390/include/asm/current.h:13:
   In file included from arch/s390/include/asm/lowcore.h:13:
   In file included from arch/s390/include/asm/machine.h:25:
   In file included from include/linux/bitops.h:67:
   In file included from arch/s390/include/asm/bitops.h:75:
   In file included from include/asm-generic/bitops/atomic.h:5:
   In file included from include/linux/atomic.h:7:
   In file included from arch/s390/include/asm/atomic.h:16:
   In file included from arch/s390/include/asm/cmpxchg.h:11:
   In file included from include/linux/mmdebug.h:5:
   In file included from include/linux/bug.h:5:
   In file included from arch/s390/include/asm/bug.h:69:
   In file included from include/asm-generic/bug.h:22:
>> include/linux/printk.h:218:20: warning: no previous prototype for function 'vprintk_deferred' [-Wmissing-prototypes]
     218 | __printf(1, 0) int vprintk_deferred(const char *fmt, va_list args)
         |                    ^
   include/linux/printk.h:218:16: note: declare 'static' if the function is not intended to be used outside of this translation unit
     218 | __printf(1, 0) int vprintk_deferred(const char *fmt, va_list args)
         |                ^
         |                static 
   1 warning generated.
   In file included from arch/s390/kernel/vdso64/getcpu.c:6:
   In file included from arch/s390/include/asm/timex.h:13:
   In file included from include/linux/preempt.h:79:
   In file included from arch/s390/include/asm/preempt.h:5:
   In file included from arch/s390/include/asm/current.h:13:
   In file included from arch/s390/include/asm/lowcore.h:13:
   In file included from arch/s390/include/asm/machine.h:25:
   In file included from include/linux/bitops.h:67:
   In file included from arch/s390/include/asm/bitops.h:75:
   In file included from include/asm-generic/bitops/atomic.h:5:
   In file included from include/linux/atomic.h:7:
   In file included from arch/s390/include/asm/atomic.h:16:
   In file included from arch/s390/include/asm/cmpxchg.h:11:
   In file included from include/linux/mmdebug.h:5:
   In file included from include/linux/bug.h:5:
   In file included from arch/s390/include/asm/bug.h:69:
   In file included from include/asm-generic/bug.h:22:
>> include/linux/printk.h:218:20: warning: no previous prototype for function 'vprintk_deferred' [-Wmissing-prototypes]
     218 | __printf(1, 0) int vprintk_deferred(const char *fmt, va_list args)
         |                    ^
   include/linux/printk.h:218:16: note: declare 'static' if the function is not intended to be used outside of this translation unit
     218 | __printf(1, 0) int vprintk_deferred(const char *fmt, va_list args)
         |                ^
         |                static 
   In file included from <built-in>:4:
   In file included from lib/vdso/getrandom.c:8:
   In file included from include/vdso/datapage.h:197:
   In file included from arch/s390/include/asm/vdso/gettimeofday.h:11:
   In file included from arch/s390/include/asm/syscall.h:13:
   In file included from include/linux/sched.h:12:
   In file included from arch/s390/include/asm/current.h:13:
   In file included from arch/s390/include/asm/lowcore.h:13:
   In file included from arch/s390/include/asm/machine.h:25:
   In file included from include/linux/bitops.h:67:
   In file included from arch/s390/include/asm/bitops.h:75:
   In file included from include/asm-generic/bitops/atomic.h:5:
   In file included from include/linux/atomic.h:7:
   In file included from arch/s390/include/asm/atomic.h:16:
   In file included from arch/s390/include/asm/cmpxchg.h:11:
   In file included from include/linux/mmdebug.h:5:
   In file included from include/linux/bug.h:5:
   In file included from arch/s390/include/asm/bug.h:69:
   In file included from include/asm-generic/bug.h:22:
>> include/linux/printk.h:218:20: warning: no previous prototype for function 'vprintk_deferred' [-Wmissing-prototypes]
     218 | __printf(1, 0) int vprintk_deferred(const char *fmt, va_list args)
         |                    ^
   include/linux/printk.h:218:16: note: declare 'static' if the function is not intended to be used outside of this translation unit
     218 | __printf(1, 0) int vprintk_deferred(const char *fmt, va_list args)
         |                ^
         |                static 
   In file included from arch/s390/kernel/vdso64/vdso64_generic.c:2:
   In file included from arch/s390/kernel/vdso64/../../../../lib/vdso/gettimeofday.c:5:
   In file included from include/vdso/datapage.h:197:
   In file included from arch/s390/include/asm/vdso/gettimeofday.h:11:
   In file included from arch/s390/include/asm/syscall.h:13:
   In file included from include/linux/sched.h:12:
   In file included from arch/s390/include/asm/current.h:13:
   In file included from arch/s390/include/asm/lowcore.h:13:
   In file included from arch/s390/include/asm/machine.h:25:
   In file included from include/linux/bitops.h:67:
   In file included from arch/s390/include/asm/bitops.h:75:
   In file included from include/asm-generic/bitops/atomic.h:5:
   In file included from include/linux/atomic.h:7:
   In file included from arch/s390/include/asm/atomic.h:16:
   In file included from arch/s390/include/asm/cmpxchg.h:11:
   In file included from include/linux/mmdebug.h:5:
   In file included from include/linux/bug.h:5:
   In file included from arch/s390/include/asm/bug.h:69:
   In file included from include/asm-generic/bug.h:22:
>> include/linux/printk.h:218:20: warning: no previous prototype for function 'vprintk_deferred' [-Wmissing-prototypes]
     218 | __printf(1, 0) int vprintk_deferred(const char *fmt, va_list args)
         |                    ^
   include/linux/printk.h:218:16: note: declare 'static' if the function is not intended to be used outside of this translation unit
     218 | __printf(1, 0) int vprintk_deferred(const char *fmt, va_list args)
         |                ^
         |                static 
   1 warning generated.
   1 warning generated.
   1 warning generated.
   s390x-linux-ld: arch/s390/kernel/vdso64/getcpu.o: in function `vprintk_deferred':
>> getcpu.c:(.text+0x0): multiple definition of `vprintk_deferred'; arch/s390/kernel/vdso64/vdso64_generic.o:vdso64_generic.c:(.text+0x0): first defined here
   s390x-linux-ld: arch/s390/kernel/vdso64/vgetrandom.o: in function `vprintk_deferred':
   vgetrandom.c:(.text+0x0): multiple definition of `vprintk_deferred'; arch/s390/kernel/vdso64/vdso64_generic.o:vdso64_generic.c:(.text+0x0): first defined here
   make[3]: *** [arch/s390/kernel/vdso64/Makefile:53: arch/s390/kernel/vdso64/vdso64.so.dbg] Error 1 shuffle=1333109039
   make[3]: Target 'include/generated/vdso64-offsets.h' not remade because of errors.
   make[2]: *** [arch/s390/Makefile:150: vdso_prepare] Error 2 shuffle=1333109039
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:248: __sub-make] Error 2 shuffle=1333109039
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2 shuffle=1333109039
   make: Target 'prepare' not remade because of errors.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
