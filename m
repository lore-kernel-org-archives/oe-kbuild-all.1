Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C01C52C69D
	for <oe-kbuild-all@lists.linux.dev>; Fri,  3 May 2024 20:49:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714769398; cv=none; b=Pg+mGlDQ4EAZpKz66pxeD2Dwq1qeEaSsZyE6BeXSm9r9v329rWoHs8umlM6SESBqCxk+m2N19zzYzdCZyiR7gAc/TZPvDmQbzugdGbb+T1RfHKci3kqPqMzi/hT9Sq5p5PhnZcqru3lmbFGFMVHochLGhGt2ZaKKoDwDmMqVMEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714769398; c=relaxed/simple;
	bh=1gJIGYTpaMmedJaQiwcbnTFHRSZshQI3jYTP31VD2yg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=i4mck8VFHoqTaapNF0qe2hjlNxfzDfozk2zKf2Y27eNL/jJP5IEL6fmZOBDCyG9wkkjhyt6A8K0etKllihd73ygntAQlemkq+e00E+cLyX5TWBBkvGeXvIFwh3K9sVtIjJe92pXSyLeGZE2jPd60cYo0DCyCnYG/MThISYbxatM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Wnw3DGWm; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Wnw3DGWm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714769396; x=1746305396;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1gJIGYTpaMmedJaQiwcbnTFHRSZshQI3jYTP31VD2yg=;
  b=Wnw3DGWmASuQSiZd4fLQ5HewLkxk/DQn8QTbcOvdM0Yu/oUwJV9phvOF
   ov3oJIDKPid09GDtpS6M0OFYZT3J16vW13gNRFXwXdP3akQLT4oEuqLwG
   uP7dRGEPRysQyt4RZIjDOwxX+RXVEhYjDU6VcmKYjNjS1eGYaNz26V5J/
   MPjnkTQerl238WuqNurLn4TjGzxfCg3Yq2fXADtNp5gsr2rCAOm/2PsHi
   Yfe0geUr7WirhfjNkMG0VUCC/wOQFRpzU7o3ZibJ75cPW84nYKt1dt+zV
   e1SzXngrNHIrl59NsHx5VwiSQCsJMdEwiAEpOfYSCyJL6Qc5dlfMII7lB
   A==;
X-CSE-ConnectionGUID: 7gx4E/n5SIi44FpFaDWMKg==
X-CSE-MsgGUID: 1dHN0bVIQQqPMkG7eCgRyA==
X-IronPort-AV: E=McAfee;i="6600,9927,11063"; a="14408014"
X-IronPort-AV: E=Sophos;i="6.07,251,1708416000"; 
   d="scan'208";a="14408014"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 May 2024 13:49:54 -0700
X-CSE-ConnectionGUID: h3DukbAxToWRvR5e8ak5sw==
X-CSE-MsgGUID: WHtbtj4bRpWWUJTq/G4gaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,251,1708416000"; 
   d="scan'208";a="27614459"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 03 May 2024 13:49:52 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s2zqo-000C5b-05;
	Fri, 03 May 2024 20:49:50 +0000
Date: Sat, 4 May 2024 04:49:09 +0800
From: kernel test robot <lkp@intel.com>
To: Kees Cook <keescook@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [kees:wip/v6.9-rc2/unsigned-overflow-sanitizer 30/109]
 include/linux/overflow.h:128:17: warning: right-hand operand of comma
 expression has no effect
Message-ID: <202405040428.lcRUPsuc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git wip/v6.9-rc2/unsigned-overflow-sanitizer
head:   4eae48ae0df1d1feb751f794fa8495093e36168d
commit: 42a77f20b876489304c8e46c2b30ccb154d876bf [30/109] include/linux/percpu-defs.h: negated variable: use wrapping_sub()
config: parisc-allnoconfig (https://download.01.org/0day-ci/archive/20240504/202405040428.lcRUPsuc-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240504/202405040428.lcRUPsuc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405040428.lcRUPsuc-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from ./arch/parisc/include/generated/asm/percpu.h:1,
                    from arch/parisc/include/asm/processor.h:22,
                    from include/linux/sched.h:13,
                    from arch/parisc/kernel/asm-offsets.c:18:
   include/linux/percpu-rwsem.h: In function 'percpu_up_read':
>> include/linux/overflow.h:128:17: warning: right-hand operand of comma expression has no effect [-Wunused-value]
     128 |                 __builtin_sub_overflow(a, b, &__val);           \
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/percpu.h:72:33: note: in definition of macro 'raw_cpu_generic_to_op'
      72 |         *raw_cpu_ptr(&(pcp)) op val;                                    \
         |                                 ^~~
   include/asm-generic/percpu.h:401:41: note: in expansion of macro 'this_cpu_generic_to_op'
     401 | #define this_cpu_add_1(pcp, val)        this_cpu_generic_to_op(pcp, val, +=)
         |                                         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:365:25: note: in expansion of macro 'this_cpu_add_1'
     365 |                 case 1: stem##1(variable, __VA_ARGS__);break;           \
         |                         ^~~~
   include/linux/percpu-defs.h:491:41: note: in expansion of macro '__pcpu_size_call'
     491 | #define this_cpu_add(pcp, val)          __pcpu_size_call(this_cpu_add_, pcp, val)
         |                                         ^~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:500:41: note: in expansion of macro 'this_cpu_add'
     500 | #define this_cpu_sub(pcp, val)          this_cpu_add(pcp, wrapping_sub(typeof(pcp), 0, (typeof(pcp))(val)))
         |                                         ^~~~~~~~~~~~
   include/linux/percpu-defs.h:500:59: note: in expansion of macro 'wrapping_sub'
     500 | #define this_cpu_sub(pcp, val)          this_cpu_add(pcp, wrapping_sub(typeof(pcp), 0, (typeof(pcp))(val)))
         |                                                           ^~~~~~~~~~~~
   include/linux/percpu-defs.h:502:41: note: in expansion of macro 'this_cpu_sub'
     502 | #define this_cpu_dec(pcp)               this_cpu_sub(pcp, 1)
         |                                         ^~~~~~~~~~~~
   include/linux/percpu-rwsem.h:106:17: note: in expansion of macro 'this_cpu_dec'
     106 |                 this_cpu_dec(*sem->read_count);
         |                 ^~~~~~~~~~~~
>> include/linux/overflow.h:128:17: warning: right-hand operand of comma expression has no effect [-Wunused-value]
     128 |                 __builtin_sub_overflow(a, b, &__val);           \
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/percpu.h:72:33: note: in definition of macro 'raw_cpu_generic_to_op'
      72 |         *raw_cpu_ptr(&(pcp)) op val;                                    \
         |                                 ^~~
   include/asm-generic/percpu.h:404:41: note: in expansion of macro 'this_cpu_generic_to_op'
     404 | #define this_cpu_add_2(pcp, val)        this_cpu_generic_to_op(pcp, val, +=)
         |                                         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:366:25: note: in expansion of macro 'this_cpu_add_2'
     366 |                 case 2: stem##2(variable, __VA_ARGS__);break;           \
         |                         ^~~~
   include/linux/percpu-defs.h:491:41: note: in expansion of macro '__pcpu_size_call'
     491 | #define this_cpu_add(pcp, val)          __pcpu_size_call(this_cpu_add_, pcp, val)
         |                                         ^~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:500:41: note: in expansion of macro 'this_cpu_add'
     500 | #define this_cpu_sub(pcp, val)          this_cpu_add(pcp, wrapping_sub(typeof(pcp), 0, (typeof(pcp))(val)))
         |                                         ^~~~~~~~~~~~
   include/linux/percpu-defs.h:500:59: note: in expansion of macro 'wrapping_sub'
     500 | #define this_cpu_sub(pcp, val)          this_cpu_add(pcp, wrapping_sub(typeof(pcp), 0, (typeof(pcp))(val)))
         |                                                           ^~~~~~~~~~~~
   include/linux/percpu-defs.h:502:41: note: in expansion of macro 'this_cpu_sub'
     502 | #define this_cpu_dec(pcp)               this_cpu_sub(pcp, 1)
         |                                         ^~~~~~~~~~~~
   include/linux/percpu-rwsem.h:106:17: note: in expansion of macro 'this_cpu_dec'
     106 |                 this_cpu_dec(*sem->read_count);
         |                 ^~~~~~~~~~~~
>> include/linux/overflow.h:128:17: warning: right-hand operand of comma expression has no effect [-Wunused-value]
     128 |                 __builtin_sub_overflow(a, b, &__val);           \
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/percpu.h:72:33: note: in definition of macro 'raw_cpu_generic_to_op'
      72 |         *raw_cpu_ptr(&(pcp)) op val;                                    \
         |                                 ^~~
   include/asm-generic/percpu.h:407:41: note: in expansion of macro 'this_cpu_generic_to_op'
     407 | #define this_cpu_add_4(pcp, val)        this_cpu_generic_to_op(pcp, val, +=)
         |                                         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:367:25: note: in expansion of macro 'this_cpu_add_4'
     367 |                 case 4: stem##4(variable, __VA_ARGS__);break;           \
         |                         ^~~~
   include/linux/percpu-defs.h:491:41: note: in expansion of macro '__pcpu_size_call'
     491 | #define this_cpu_add(pcp, val)          __pcpu_size_call(this_cpu_add_, pcp, val)
         |                                         ^~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:500:41: note: in expansion of macro 'this_cpu_add'
     500 | #define this_cpu_sub(pcp, val)          this_cpu_add(pcp, wrapping_sub(typeof(pcp), 0, (typeof(pcp))(val)))
         |                                         ^~~~~~~~~~~~
   include/linux/percpu-defs.h:500:59: note: in expansion of macro 'wrapping_sub'
     500 | #define this_cpu_sub(pcp, val)          this_cpu_add(pcp, wrapping_sub(typeof(pcp), 0, (typeof(pcp))(val)))
         |                                                           ^~~~~~~~~~~~
   include/linux/percpu-defs.h:502:41: note: in expansion of macro 'this_cpu_sub'
     502 | #define this_cpu_dec(pcp)               this_cpu_sub(pcp, 1)
         |                                         ^~~~~~~~~~~~
   include/linux/percpu-rwsem.h:106:17: note: in expansion of macro 'this_cpu_dec'
     106 |                 this_cpu_dec(*sem->read_count);
         |                 ^~~~~~~~~~~~
>> include/linux/overflow.h:128:17: warning: right-hand operand of comma expression has no effect [-Wunused-value]
     128 |                 __builtin_sub_overflow(a, b, &__val);           \
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/percpu.h:72:33: note: in definition of macro 'raw_cpu_generic_to_op'
      72 |         *raw_cpu_ptr(&(pcp)) op val;                                    \
         |                                 ^~~
   include/asm-generic/percpu.h:410:41: note: in expansion of macro 'this_cpu_generic_to_op'
     410 | #define this_cpu_add_8(pcp, val)        this_cpu_generic_to_op(pcp, val, +=)
         |                                         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:368:25: note: in expansion of macro 'this_cpu_add_8'
     368 |                 case 8: stem##8(variable, __VA_ARGS__);break;           \
         |                         ^~~~
   include/linux/percpu-defs.h:491:41: note: in expansion of macro '__pcpu_size_call'
     491 | #define this_cpu_add(pcp, val)          __pcpu_size_call(this_cpu_add_, pcp, val)
         |                                         ^~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:500:41: note: in expansion of macro 'this_cpu_add'
     500 | #define this_cpu_sub(pcp, val)          this_cpu_add(pcp, wrapping_sub(typeof(pcp), 0, (typeof(pcp))(val)))
         |                                         ^~~~~~~~~~~~
   include/linux/percpu-defs.h:500:59: note: in expansion of macro 'wrapping_sub'
     500 | #define this_cpu_sub(pcp, val)          this_cpu_add(pcp, wrapping_sub(typeof(pcp), 0, (typeof(pcp))(val)))
         |                                                           ^~~~~~~~~~~~
   include/linux/percpu-defs.h:502:41: note: in expansion of macro 'this_cpu_sub'
     502 | #define this_cpu_dec(pcp)               this_cpu_sub(pcp, 1)
         |                                         ^~~~~~~~~~~~
   include/linux/percpu-rwsem.h:106:17: note: in expansion of macro 'this_cpu_dec'
     106 |                 this_cpu_dec(*sem->read_count);
         |                 ^~~~~~~~~~~~
>> include/linux/overflow.h:128:17: warning: right-hand operand of comma expression has no effect [-Wunused-value]
     128 |                 __builtin_sub_overflow(a, b, &__val);           \
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/percpu.h:72:33: note: in definition of macro 'raw_cpu_generic_to_op'
      72 |         *raw_cpu_ptr(&(pcp)) op val;                                    \
         |                                 ^~~
   include/asm-generic/percpu.h:401:41: note: in expansion of macro 'this_cpu_generic_to_op'
     401 | #define this_cpu_add_1(pcp, val)        this_cpu_generic_to_op(pcp, val, +=)
         |                                         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:365:25: note: in expansion of macro 'this_cpu_add_1'
     365 |                 case 1: stem##1(variable, __VA_ARGS__);break;           \
         |                         ^~~~
   include/linux/percpu-defs.h:491:41: note: in expansion of macro '__pcpu_size_call'
     491 | #define this_cpu_add(pcp, val)          __pcpu_size_call(this_cpu_add_, pcp, val)
         |                                         ^~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:500:41: note: in expansion of macro 'this_cpu_add'
     500 | #define this_cpu_sub(pcp, val)          this_cpu_add(pcp, wrapping_sub(typeof(pcp), 0, (typeof(pcp))(val)))
         |                                         ^~~~~~~~~~~~
   include/linux/percpu-defs.h:500:59: note: in expansion of macro 'wrapping_sub'
     500 | #define this_cpu_sub(pcp, val)          this_cpu_add(pcp, wrapping_sub(typeof(pcp), 0, (typeof(pcp))(val)))
         |                                                           ^~~~~~~~~~~~
   include/linux/percpu-defs.h:502:41: note: in expansion of macro 'this_cpu_sub'
     502 | #define this_cpu_dec(pcp)               this_cpu_sub(pcp, 1)
         |                                         ^~~~~~~~~~~~
   include/linux/percpu-rwsem.h:118:17: note: in expansion of macro 'this_cpu_dec'
     118 |                 this_cpu_dec(*sem->read_count);
         |                 ^~~~~~~~~~~~
>> include/linux/overflow.h:128:17: warning: right-hand operand of comma expression has no effect [-Wunused-value]
     128 |                 __builtin_sub_overflow(a, b, &__val);           \
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/percpu.h:72:33: note: in definition of macro 'raw_cpu_generic_to_op'
      72 |         *raw_cpu_ptr(&(pcp)) op val;                                    \
         |                                 ^~~
   include/asm-generic/percpu.h:404:41: note: in expansion of macro 'this_cpu_generic_to_op'
     404 | #define this_cpu_add_2(pcp, val)        this_cpu_generic_to_op(pcp, val, +=)
         |                                         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:366:25: note: in expansion of macro 'this_cpu_add_2'
     366 |                 case 2: stem##2(variable, __VA_ARGS__);break;           \
         |                         ^~~~
   include/linux/percpu-defs.h:491:41: note: in expansion of macro '__pcpu_size_call'
     491 | #define this_cpu_add(pcp, val)          __pcpu_size_call(this_cpu_add_, pcp, val)
         |                                         ^~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:500:41: note: in expansion of macro 'this_cpu_add'
     500 | #define this_cpu_sub(pcp, val)          this_cpu_add(pcp, wrapping_sub(typeof(pcp), 0, (typeof(pcp))(val)))
         |                                         ^~~~~~~~~~~~
   include/linux/percpu-defs.h:500:59: note: in expansion of macro 'wrapping_sub'
     500 | #define this_cpu_sub(pcp, val)          this_cpu_add(pcp, wrapping_sub(typeof(pcp), 0, (typeof(pcp))(val)))
         |                                                           ^~~~~~~~~~~~
   include/linux/percpu-defs.h:502:41: note: in expansion of macro 'this_cpu_sub'
     502 | #define this_cpu_dec(pcp)               this_cpu_sub(pcp, 1)
         |                                         ^~~~~~~~~~~~
   include/linux/percpu-rwsem.h:118:17: note: in expansion of macro 'this_cpu_dec'
     118 |                 this_cpu_dec(*sem->read_count);
         |                 ^~~~~~~~~~~~
>> include/linux/overflow.h:128:17: warning: right-hand operand of comma expression has no effect [-Wunused-value]
     128 |                 __builtin_sub_overflow(a, b, &__val);           \
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/percpu.h:72:33: note: in definition of macro 'raw_cpu_generic_to_op'
      72 |         *raw_cpu_ptr(&(pcp)) op val;                                    \
         |                                 ^~~
   include/asm-generic/percpu.h:407:41: note: in expansion of macro 'this_cpu_generic_to_op'
     407 | #define this_cpu_add_4(pcp, val)        this_cpu_generic_to_op(pcp, val, +=)
         |                                         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:367:25: note: in expansion of macro 'this_cpu_add_4'
     367 |                 case 4: stem##4(variable, __VA_ARGS__);break;           \
         |                         ^~~~
   include/linux/percpu-defs.h:491:41: note: in expansion of macro '__pcpu_size_call'
     491 | #define this_cpu_add(pcp, val)          __pcpu_size_call(this_cpu_add_, pcp, val)
         |                                         ^~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:500:41: note: in expansion of macro 'this_cpu_add'
     500 | #define this_cpu_sub(pcp, val)          this_cpu_add(pcp, wrapping_sub(typeof(pcp), 0, (typeof(pcp))(val)))
         |                                         ^~~~~~~~~~~~
   include/linux/percpu-defs.h:500:59: note: in expansion of macro 'wrapping_sub'
     500 | #define this_cpu_sub(pcp, val)          this_cpu_add(pcp, wrapping_sub(typeof(pcp), 0, (typeof(pcp))(val)))
         |                                                           ^~~~~~~~~~~~
   include/linux/percpu-defs.h:502:41: note: in expansion of macro 'this_cpu_sub'
     502 | #define this_cpu_dec(pcp)               this_cpu_sub(pcp, 1)
         |                                         ^~~~~~~~~~~~
   include/linux/percpu-rwsem.h:118:17: note: in expansion of macro 'this_cpu_dec'
     118 |                 this_cpu_dec(*sem->read_count);
         |                 ^~~~~~~~~~~~
>> include/linux/overflow.h:128:17: warning: right-hand operand of comma expression has no effect [-Wunused-value]
     128 |                 __builtin_sub_overflow(a, b, &__val);           \
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/percpu.h:72:33: note: in definition of macro 'raw_cpu_generic_to_op'
      72 |         *raw_cpu_ptr(&(pcp)) op val;                                    \
         |                                 ^~~
   include/asm-generic/percpu.h:410:41: note: in expansion of macro 'this_cpu_generic_to_op'
     410 | #define this_cpu_add_8(pcp, val)        this_cpu_generic_to_op(pcp, val, +=)
         |                                         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:368:25: note: in expansion of macro 'this_cpu_add_8'
     368 |                 case 8: stem##8(variable, __VA_ARGS__);break;           \
         |                         ^~~~
   include/linux/percpu-defs.h:491:41: note: in expansion of macro '__pcpu_size_call'
     491 | #define this_cpu_add(pcp, val)          __pcpu_size_call(this_cpu_add_, pcp, val)
         |                                         ^~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:500:41: note: in expansion of macro 'this_cpu_add'
     500 | #define this_cpu_sub(pcp, val)          this_cpu_add(pcp, wrapping_sub(typeof(pcp), 0, (typeof(pcp))(val)))
         |                                         ^~~~~~~~~~~~
   include/linux/percpu-defs.h:500:59: note: in expansion of macro 'wrapping_sub'
     500 | #define this_cpu_sub(pcp, val)          this_cpu_add(pcp, wrapping_sub(typeof(pcp), 0, (typeof(pcp))(val)))
         |                                                           ^~~~~~~~~~~~
   include/linux/percpu-defs.h:502:41: note: in expansion of macro 'this_cpu_sub'
     502 | #define this_cpu_dec(pcp)               this_cpu_sub(pcp, 1)
         |                                         ^~~~~~~~~~~~
   include/linux/percpu-rwsem.h:118:17: note: in expansion of macro 'this_cpu_dec'
     118 |                 this_cpu_dec(*sem->read_count);
         |                 ^~~~~~~~~~~~
--
   In file included from ./arch/parisc/include/generated/asm/percpu.h:1,
                    from include/linux/irqflags.h:19,
                    from include/asm-generic/cmpxchg-local.h:6,
                    from arch/parisc/include/asm/cmpxchg.h:89,
                    from arch/parisc/include/asm/atomic.h:10,
                    from include/linux/atomic.h:7,
                    from arch/parisc/include/asm/bitops.h:13,
                    from include/linux/bitops.h:68,
                    from include/linux/kernel.h:23,
                    from arch/parisc/include/asm/bug.h:5,
                    from include/linux/bug.h:5,
                    from include/linux/thread_info.h:13,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/parisc/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:79,
                    from include/linux/spinlock.h:56,
                    from lib/kobject_uevent.c:16:
   include/linux/percpu-rwsem.h: In function 'percpu_up_read':
>> include/linux/overflow.h:128:17: warning: right-hand operand of comma expression has no effect [-Wunused-value]
     128 |                 __builtin_sub_overflow(a, b, &__val);           \
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/percpu.h:72:33: note: in definition of macro 'raw_cpu_generic_to_op'
      72 |         *raw_cpu_ptr(&(pcp)) op val;                                    \
         |                                 ^~~
   include/asm-generic/percpu.h:401:41: note: in expansion of macro 'this_cpu_generic_to_op'
     401 | #define this_cpu_add_1(pcp, val)        this_cpu_generic_to_op(pcp, val, +=)
         |                                         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:365:25: note: in expansion of macro 'this_cpu_add_1'
     365 |                 case 1: stem##1(variable, __VA_ARGS__);break;           \
         |                         ^~~~
   include/linux/percpu-defs.h:491:41: note: in expansion of macro '__pcpu_size_call'
     491 | #define this_cpu_add(pcp, val)          __pcpu_size_call(this_cpu_add_, pcp, val)
         |                                         ^~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:500:41: note: in expansion of macro 'this_cpu_add'
     500 | #define this_cpu_sub(pcp, val)          this_cpu_add(pcp, wrapping_sub(typeof(pcp), 0, (typeof(pcp))(val)))
         |                                         ^~~~~~~~~~~~
   include/linux/percpu-defs.h:500:59: note: in expansion of macro 'wrapping_sub'
     500 | #define this_cpu_sub(pcp, val)          this_cpu_add(pcp, wrapping_sub(typeof(pcp), 0, (typeof(pcp))(val)))
         |                                                           ^~~~~~~~~~~~
   include/linux/percpu-defs.h:502:41: note: in expansion of macro 'this_cpu_sub'
     502 | #define this_cpu_dec(pcp)               this_cpu_sub(pcp, 1)
         |                                         ^~~~~~~~~~~~
   include/linux/percpu-rwsem.h:106:17: note: in expansion of macro 'this_cpu_dec'
     106 |                 this_cpu_dec(*sem->read_count);
         |                 ^~~~~~~~~~~~
>> include/linux/overflow.h:128:17: warning: right-hand operand of comma expression has no effect [-Wunused-value]
     128 |                 __builtin_sub_overflow(a, b, &__val);           \
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/percpu.h:72:33: note: in definition of macro 'raw_cpu_generic_to_op'
      72 |         *raw_cpu_ptr(&(pcp)) op val;                                    \
         |                                 ^~~
   include/asm-generic/percpu.h:404:41: note: in expansion of macro 'this_cpu_generic_to_op'
     404 | #define this_cpu_add_2(pcp, val)        this_cpu_generic_to_op(pcp, val, +=)
         |                                         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:366:25: note: in expansion of macro 'this_cpu_add_2'
     366 |                 case 2: stem##2(variable, __VA_ARGS__);break;           \
         |                         ^~~~
   include/linux/percpu-defs.h:491:41: note: in expansion of macro '__pcpu_size_call'
     491 | #define this_cpu_add(pcp, val)          __pcpu_size_call(this_cpu_add_, pcp, val)
         |                                         ^~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:500:41: note: in expansion of macro 'this_cpu_add'
     500 | #define this_cpu_sub(pcp, val)          this_cpu_add(pcp, wrapping_sub(typeof(pcp), 0, (typeof(pcp))(val)))
         |                                         ^~~~~~~~~~~~
   include/linux/percpu-defs.h:500:59: note: in expansion of macro 'wrapping_sub'
     500 | #define this_cpu_sub(pcp, val)          this_cpu_add(pcp, wrapping_sub(typeof(pcp), 0, (typeof(pcp))(val)))
         |                                                           ^~~~~~~~~~~~
   include/linux/percpu-defs.h:502:41: note: in expansion of macro 'this_cpu_sub'
     502 | #define this_cpu_dec(pcp)               this_cpu_sub(pcp, 1)
         |                                         ^~~~~~~~~~~~
   include/linux/percpu-rwsem.h:106:17: note: in expansion of macro 'this_cpu_dec'
     106 |                 this_cpu_dec(*sem->read_count);
         |                 ^~~~~~~~~~~~
>> include/linux/overflow.h:128:17: warning: right-hand operand of comma expression has no effect [-Wunused-value]
     128 |                 __builtin_sub_overflow(a, b, &__val);           \
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/percpu.h:72:33: note: in definition of macro 'raw_cpu_generic_to_op'
      72 |         *raw_cpu_ptr(&(pcp)) op val;                                    \
         |                                 ^~~
   include/asm-generic/percpu.h:407:41: note: in expansion of macro 'this_cpu_generic_to_op'
     407 | #define this_cpu_add_4(pcp, val)        this_cpu_generic_to_op(pcp, val, +=)
         |                                         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:367:25: note: in expansion of macro 'this_cpu_add_4'
     367 |                 case 4: stem##4(variable, __VA_ARGS__);break;           \
         |                         ^~~~
   include/linux/percpu-defs.h:491:41: note: in expansion of macro '__pcpu_size_call'
     491 | #define this_cpu_add(pcp, val)          __pcpu_size_call(this_cpu_add_, pcp, val)
         |                                         ^~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:500:41: note: in expansion of macro 'this_cpu_add'
     500 | #define this_cpu_sub(pcp, val)          this_cpu_add(pcp, wrapping_sub(typeof(pcp), 0, (typeof(pcp))(val)))
         |                                         ^~~~~~~~~~~~
   include/linux/percpu-defs.h:500:59: note: in expansion of macro 'wrapping_sub'
     500 | #define this_cpu_sub(pcp, val)          this_cpu_add(pcp, wrapping_sub(typeof(pcp), 0, (typeof(pcp))(val)))
         |                                                           ^~~~~~~~~~~~
   include/linux/percpu-defs.h:502:41: note: in expansion of macro 'this_cpu_sub'
     502 | #define this_cpu_dec(pcp)               this_cpu_sub(pcp, 1)
         |                                         ^~~~~~~~~~~~
   include/linux/percpu-rwsem.h:106:17: note: in expansion of macro 'this_cpu_dec'
     106 |                 this_cpu_dec(*sem->read_count);
         |                 ^~~~~~~~~~~~
>> include/linux/overflow.h:128:17: warning: right-hand operand of comma expression has no effect [-Wunused-value]
     128 |                 __builtin_sub_overflow(a, b, &__val);           \
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/percpu.h:72:33: note: in definition of macro 'raw_cpu_generic_to_op'
      72 |         *raw_cpu_ptr(&(pcp)) op val;                                    \
         |                                 ^~~
   include/asm-generic/percpu.h:410:41: note: in expansion of macro 'this_cpu_generic_to_op'
     410 | #define this_cpu_add_8(pcp, val)        this_cpu_generic_to_op(pcp, val, +=)
         |                                         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:368:25: note: in expansion of macro 'this_cpu_add_8'
     368 |                 case 8: stem##8(variable, __VA_ARGS__);break;           \
         |                         ^~~~
   include/linux/percpu-defs.h:491:41: note: in expansion of macro '__pcpu_size_call'
     491 | #define this_cpu_add(pcp, val)          __pcpu_size_call(this_cpu_add_, pcp, val)
         |                                         ^~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:500:41: note: in expansion of macro 'this_cpu_add'
     500 | #define this_cpu_sub(pcp, val)          this_cpu_add(pcp, wrapping_sub(typeof(pcp), 0, (typeof(pcp))(val)))
         |                                         ^~~~~~~~~~~~
   include/linux/percpu-defs.h:500:59: note: in expansion of macro 'wrapping_sub'
     500 | #define this_cpu_sub(pcp, val)          this_cpu_add(pcp, wrapping_sub(typeof(pcp), 0, (typeof(pcp))(val)))
         |                                                           ^~~~~~~~~~~~
   include/linux/percpu-defs.h:502:41: note: in expansion of macro 'this_cpu_sub'
     502 | #define this_cpu_dec(pcp)               this_cpu_sub(pcp, 1)
         |                                         ^~~~~~~~~~~~
   include/linux/percpu-rwsem.h:106:17: note: in expansion of macro 'this_cpu_dec'
     106 |                 this_cpu_dec(*sem->read_count);
         |                 ^~~~~~~~~~~~
>> include/linux/overflow.h:128:17: warning: right-hand operand of comma expression has no effect [-Wunused-value]
     128 |                 __builtin_sub_overflow(a, b, &__val);           \
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/percpu.h:72:33: note: in definition of macro 'raw_cpu_generic_to_op'
      72 |         *raw_cpu_ptr(&(pcp)) op val;                                    \
         |                                 ^~~
   include/asm-generic/percpu.h:401:41: note: in expansion of macro 'this_cpu_generic_to_op'
     401 | #define this_cpu_add_1(pcp, val)        this_cpu_generic_to_op(pcp, val, +=)
         |                                         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:365:25: note: in expansion of macro 'this_cpu_add_1'
     365 |                 case 1: stem##1(variable, __VA_ARGS__);break;           \
         |                         ^~~~
   include/linux/percpu-defs.h:491:41: note: in expansion of macro '__pcpu_size_call'
     491 | #define this_cpu_add(pcp, val)          __pcpu_size_call(this_cpu_add_, pcp, val)
         |                                         ^~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:500:41: note: in expansion of macro 'this_cpu_add'
     500 | #define this_cpu_sub(pcp, val)          this_cpu_add(pcp, wrapping_sub(typeof(pcp), 0, (typeof(pcp))(val)))
         |                                         ^~~~~~~~~~~~
   include/linux/percpu-defs.h:500:59: note: in expansion of macro 'wrapping_sub'
     500 | #define this_cpu_sub(pcp, val)          this_cpu_add(pcp, wrapping_sub(typeof(pcp), 0, (typeof(pcp))(val)))
         |                                                           ^~~~~~~~~~~~
   include/linux/percpu-defs.h:502:41: note: in expansion of macro 'this_cpu_sub'
     502 | #define this_cpu_dec(pcp)               this_cpu_sub(pcp, 1)
         |                                         ^~~~~~~~~~~~
   include/linux/percpu-rwsem.h:118:17: note: in expansion of macro 'this_cpu_dec'
     118 |                 this_cpu_dec(*sem->read_count);
         |                 ^~~~~~~~~~~~
>> include/linux/overflow.h:128:17: warning: right-hand operand of comma expression has no effect [-Wunused-value]
     128 |                 __builtin_sub_overflow(a, b, &__val);           \
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/percpu.h:72:33: note: in definition of macro 'raw_cpu_generic_to_op'
      72 |         *raw_cpu_ptr(&(pcp)) op val;                                    \
         |                                 ^~~
   include/asm-generic/percpu.h:404:41: note: in expansion of macro 'this_cpu_generic_to_op'
     404 | #define this_cpu_add_2(pcp, val)        this_cpu_generic_to_op(pcp, val, +=)
         |                                         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:366:25: note: in expansion of macro 'this_cpu_add_2'
     366 |                 case 2: stem##2(variable, __VA_ARGS__);break;           \
         |                         ^~~~
   include/linux/percpu-defs.h:491:41: note: in expansion of macro '__pcpu_size_call'
     491 | #define this_cpu_add(pcp, val)          __pcpu_size_call(this_cpu_add_, pcp, val)
         |                                         ^~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:500:41: note: in expansion of macro 'this_cpu_add'
     500 | #define this_cpu_sub(pcp, val)          this_cpu_add(pcp, wrapping_sub(typeof(pcp), 0, (typeof(pcp))(val)))
         |                                         ^~~~~~~~~~~~
   include/linux/percpu-defs.h:500:59: note: in expansion of macro 'wrapping_sub'
     500 | #define this_cpu_sub(pcp, val)          this_cpu_add(pcp, wrapping_sub(typeof(pcp), 0, (typeof(pcp))(val)))
         |                                                           ^~~~~~~~~~~~
   include/linux/percpu-defs.h:502:41: note: in expansion of macro 'this_cpu_sub'
     502 | #define this_cpu_dec(pcp)               this_cpu_sub(pcp, 1)
         |                                         ^~~~~~~~~~~~
   include/linux/percpu-rwsem.h:118:17: note: in expansion of macro 'this_cpu_dec'
     118 |                 this_cpu_dec(*sem->read_count);
         |                 ^~~~~~~~~~~~
>> include/linux/overflow.h:128:17: warning: right-hand operand of comma expression has no effect [-Wunused-value]
     128 |                 __builtin_sub_overflow(a, b, &__val);           \
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/percpu.h:72:33: note: in definition of macro 'raw_cpu_generic_to_op'
      72 |         *raw_cpu_ptr(&(pcp)) op val;                                    \
         |                                 ^~~
   include/asm-generic/percpu.h:407:41: note: in expansion of macro 'this_cpu_generic_to_op'
     407 | #define this_cpu_add_4(pcp, val)        this_cpu_generic_to_op(pcp, val, +=)
         |                                         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:367:25: note: in expansion of macro 'this_cpu_add_4'
     367 |                 case 4: stem##4(variable, __VA_ARGS__);break;           \
         |                         ^~~~
   include/linux/percpu-defs.h:491:41: note: in expansion of macro '__pcpu_size_call'
     491 | #define this_cpu_add(pcp, val)          __pcpu_size_call(this_cpu_add_, pcp, val)
         |                                         ^~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:500:41: note: in expansion of macro 'this_cpu_add'
     500 | #define this_cpu_sub(pcp, val)          this_cpu_add(pcp, wrapping_sub(typeof(pcp), 0, (typeof(pcp))(val)))
         |                                         ^~~~~~~~~~~~
   include/linux/percpu-defs.h:500:59: note: in expansion of macro 'wrapping_sub'
     500 | #define this_cpu_sub(pcp, val)          this_cpu_add(pcp, wrapping_sub(typeof(pcp), 0, (typeof(pcp))(val)))
         |                                                           ^~~~~~~~~~~~
   include/linux/percpu-defs.h:502:41: note: in expansion of macro 'this_cpu_sub'
     502 | #define this_cpu_dec(pcp)               this_cpu_sub(pcp, 1)
         |                                         ^~~~~~~~~~~~
   include/linux/percpu-rwsem.h:118:17: note: in expansion of macro 'this_cpu_dec'
     118 |                 this_cpu_dec(*sem->read_count);
         |                 ^~~~~~~~~~~~
>> include/linux/overflow.h:128:17: warning: right-hand operand of comma expression has no effect [-Wunused-value]
     128 |                 __builtin_sub_overflow(a, b, &__val);           \
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/percpu.h:72:33: note: in definition of macro 'raw_cpu_generic_to_op'
      72 |         *raw_cpu_ptr(&(pcp)) op val;                                    \
         |                                 ^~~
   include/asm-generic/percpu.h:410:41: note: in expansion of macro 'this_cpu_generic_to_op'
     410 | #define this_cpu_add_8(pcp, val)        this_cpu_generic_to_op(pcp, val, +=)
         |                                         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:368:25: note: in expansion of macro 'this_cpu_add_8'
     368 |                 case 8: stem##8(variable, __VA_ARGS__);break;           \
         |                         ^~~~
   include/linux/percpu-defs.h:491:41: note: in expansion of macro '__pcpu_size_call'
     491 | #define this_cpu_add(pcp, val)          __pcpu_size_call(this_cpu_add_, pcp, val)
         |                                         ^~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:500:41: note: in expansion of macro 'this_cpu_add'
     500 | #define this_cpu_sub(pcp, val)          this_cpu_add(pcp, wrapping_sub(typeof(pcp), 0, (typeof(pcp))(val)))
         |                                         ^~~~~~~~~~~~
   include/linux/percpu-defs.h:500:59: note: in expansion of macro 'wrapping_sub'
     500 | #define this_cpu_sub(pcp, val)          this_cpu_add(pcp, wrapping_sub(typeof(pcp), 0, (typeof(pcp))(val)))
         |                                                           ^~~~~~~~~~~~
   include/linux/percpu-defs.h:502:41: note: in expansion of macro 'this_cpu_sub'
     502 | #define this_cpu_dec(pcp)               this_cpu_sub(pcp, 1)
         |                                         ^~~~~~~~~~~~
   include/linux/percpu-rwsem.h:118:17: note: in expansion of macro 'this_cpu_dec'
     118 |                 this_cpu_dec(*sem->read_count);
         |                 ^~~~~~~~~~~~
   include/linux/netdevice.h: In function 'dev_xmit_recursion_dec':
>> include/linux/overflow.h:128:17: warning: right-hand operand of comma expression has no effect [-Wunused-value]
     128 |                 __builtin_sub_overflow(a, b, &__val);           \
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/percpu.h:72:33: note: in definition of macro 'raw_cpu_generic_to_op'
      72 |         *raw_cpu_ptr(&(pcp)) op val;                                    \
         |                                 ^~~
   include/linux/percpu-defs.h:365:25: note: in expansion of macro 'raw_cpu_add_1'
     365 |                 case 1: stem##1(variable, __VA_ARGS__);break;           \
         |                         ^~~~
   include/linux/percpu-defs.h:410:41: note: in expansion of macro '__pcpu_size_call'
     410 | #define raw_cpu_add(pcp, val)           __pcpu_size_call(raw_cpu_add_, pcp, val)
         |                                         ^~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:445:9: note: in expansion of macro 'raw_cpu_add'
     445 |         raw_cpu_add(pcp, val);                                          \
         |         ^~~~~~~~~~~
   include/linux/percpu-defs.h:478:41: note: in expansion of macro '__this_cpu_add'
     478 | #define __this_cpu_sub(pcp, val)        __this_cpu_add(pcp, wrapping_sub(typeof(pcp), 0, (typeof(pcp))(val)))
         |                                         ^~~~~~~~~~~~~~
   include/linux/percpu-defs.h:478:61: note: in expansion of macro 'wrapping_sub'
     478 | #define __this_cpu_sub(pcp, val)        __this_cpu_add(pcp, wrapping_sub(typeof(pcp), 0, (typeof(pcp))(val)))
         |                                                             ^~~~~~~~~~~~
   include/linux/percpu-defs.h:480:41: note: in expansion of macro '__this_cpu_sub'
     480 | #define __this_cpu_dec(pcp)             __this_cpu_sub(pcp, 1)
         |                                         ^~~~~~~~~~~~~~
   include/linux/netdevice.h:3287:9: note: in expansion of macro '__this_cpu_dec'
    3287 |         __this_cpu_dec(softnet_data.xmit.recursion);
         |         ^~~~~~~~~~~~~~
>> include/linux/overflow.h:128:17: warning: right-hand operand of comma expression has no effect [-Wunused-value]
     128 |                 __builtin_sub_overflow(a, b, &__val);           \
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/percpu.h:72:33: note: in definition of macro 'raw_cpu_generic_to_op'
      72 |         *raw_cpu_ptr(&(pcp)) op val;                                    \
         |                                 ^~~
   include/linux/percpu-defs.h:366:25: note: in expansion of macro 'raw_cpu_add_2'
     366 |                 case 2: stem##2(variable, __VA_ARGS__);break;           \
         |                         ^~~~
   include/linux/percpu-defs.h:410:41: note: in expansion of macro '__pcpu_size_call'
     410 | #define raw_cpu_add(pcp, val)           __pcpu_size_call(raw_cpu_add_, pcp, val)
         |                                         ^~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:445:9: note: in expansion of macro 'raw_cpu_add'
     445 |         raw_cpu_add(pcp, val);                                          \
         |         ^~~~~~~~~~~
   include/linux/percpu-defs.h:478:41: note: in expansion of macro '__this_cpu_add'
     478 | #define __this_cpu_sub(pcp, val)        __this_cpu_add(pcp, wrapping_sub(typeof(pcp), 0, (typeof(pcp))(val)))
         |                                         ^~~~~~~~~~~~~~
   include/linux/percpu-defs.h:478:61: note: in expansion of macro 'wrapping_sub'
     478 | #define __this_cpu_sub(pcp, val)        __this_cpu_add(pcp, wrapping_sub(typeof(pcp), 0, (typeof(pcp))(val)))
         |                                                             ^~~~~~~~~~~~
   include/linux/percpu-defs.h:480:41: note: in expansion of macro '__this_cpu_sub'
     480 | #define __this_cpu_dec(pcp)             __this_cpu_sub(pcp, 1)
         |                                         ^~~~~~~~~~~~~~
   include/linux/netdevice.h:3287:9: note: in expansion of macro '__this_cpu_dec'
    3287 |         __this_cpu_dec(softnet_data.xmit.recursion);
         |         ^~~~~~~~~~~~~~
>> include/linux/overflow.h:128:17: warning: right-hand operand of comma expression has no effect [-Wunused-value]
     128 |                 __builtin_sub_overflow(a, b, &__val);           \
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/percpu.h:72:33: note: in definition of macro 'raw_cpu_generic_to_op'
      72 |         *raw_cpu_ptr(&(pcp)) op val;                                    \
         |                                 ^~~
   include/linux/percpu-defs.h:367:25: note: in expansion of macro 'raw_cpu_add_4'
     367 |                 case 4: stem##4(variable, __VA_ARGS__);break;           \
         |                         ^~~~
   include/linux/percpu-defs.h:410:41: note: in expansion of macro '__pcpu_size_call'
     410 | #define raw_cpu_add(pcp, val)           __pcpu_size_call(raw_cpu_add_, pcp, val)
         |                                         ^~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:445:9: note: in expansion of macro 'raw_cpu_add'
     445 |         raw_cpu_add(pcp, val);                                          \
         |         ^~~~~~~~~~~
   include/linux/percpu-defs.h:478:41: note: in expansion of macro '__this_cpu_add'
     478 | #define __this_cpu_sub(pcp, val)        __this_cpu_add(pcp, wrapping_sub(typeof(pcp), 0, (typeof(pcp))(val)))
         |                                         ^~~~~~~~~~~~~~
   include/linux/percpu-defs.h:478:61: note: in expansion of macro 'wrapping_sub'
     478 | #define __this_cpu_sub(pcp, val)        __this_cpu_add(pcp, wrapping_sub(typeof(pcp), 0, (typeof(pcp))(val)))
         |                                                             ^~~~~~~~~~~~
   include/linux/percpu-defs.h:480:41: note: in expansion of macro '__this_cpu_sub'
     480 | #define __this_cpu_dec(pcp)             __this_cpu_sub(pcp, 1)
         |                                         ^~~~~~~~~~~~~~
   include/linux/netdevice.h:3287:9: note: in expansion of macro '__this_cpu_dec'
    3287 |         __this_cpu_dec(softnet_data.xmit.recursion);
         |         ^~~~~~~~~~~~~~
>> include/linux/overflow.h:128:17: warning: right-hand operand of comma expression has no effect [-Wunused-value]
     128 |                 __builtin_sub_overflow(a, b, &__val);           \
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/percpu.h:72:33: note: in definition of macro 'raw_cpu_generic_to_op'
      72 |         *raw_cpu_ptr(&(pcp)) op val;                                    \
         |                                 ^~~
   include/linux/percpu-defs.h:368:25: note: in expansion of macro 'raw_cpu_add_8'
     368 |                 case 8: stem##8(variable, __VA_ARGS__);break;           \
         |                         ^~~~
   include/linux/percpu-defs.h:410:41: note: in expansion of macro '__pcpu_size_call'
     410 | #define raw_cpu_add(pcp, val)           __pcpu_size_call(raw_cpu_add_, pcp, val)
         |                                         ^~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:445:9: note: in expansion of macro 'raw_cpu_add'
     445 |         raw_cpu_add(pcp, val);                                          \
         |         ^~~~~~~~~~~
   include/linux/percpu-defs.h:478:41: note: in expansion of macro '__this_cpu_add'
     478 | #define __this_cpu_sub(pcp, val)        __this_cpu_add(pcp, wrapping_sub(typeof(pcp), 0, (typeof(pcp))(val)))
         |                                         ^~~~~~~~~~~~~~
   include/linux/percpu-defs.h:478:61: note: in expansion of macro 'wrapping_sub'
     478 | #define __this_cpu_sub(pcp, val)        __this_cpu_add(pcp, wrapping_sub(typeof(pcp), 0, (typeof(pcp))(val)))
         |                                                             ^~~~~~~~~~~~
   include/linux/percpu-defs.h:480:41: note: in expansion of macro '__this_cpu_sub'
     480 | #define __this_cpu_dec(pcp)             __this_cpu_sub(pcp, 1)
         |                                         ^~~~~~~~~~~~~~
   include/linux/netdevice.h:3287:9: note: in expansion of macro '__this_cpu_dec'
    3287 |         __this_cpu_dec(softnet_data.xmit.recursion);
         |         ^~~~~~~~~~~~~~
..


vim +128 include/linux/overflow.h

9b80e4c4ddaca35 Kees Cook        2020-08-12   55  
31970608a6d3796 Kees Cook        2022-09-26   56  /**
31970608a6d3796 Kees Cook        2022-09-26   57   * check_add_overflow() - Calculate addition with overflow checking
d219d2a9a92e39a Kees Cook        2022-08-29   58   * @a: first addend
d219d2a9a92e39a Kees Cook        2022-08-29   59   * @b: second addend
d219d2a9a92e39a Kees Cook        2022-08-29   60   * @d: pointer to store sum
d219d2a9a92e39a Kees Cook        2022-08-29   61   *
3e19086fb5a9079 Kees Cook        2024-01-29   62   * Returns true on wrap-around, false otherwise.
d219d2a9a92e39a Kees Cook        2022-08-29   63   *
3e19086fb5a9079 Kees Cook        2024-01-29   64   * *@d holds the results of the attempted addition, regardless of whether
3e19086fb5a9079 Kees Cook        2024-01-29   65   * wrap-around occurred.
f0907827a8a9152 Rasmus Villemoes 2018-05-08   66   */
d219d2a9a92e39a Kees Cook        2022-08-29   67  #define check_add_overflow(a, b, d)	\
d219d2a9a92e39a Kees Cook        2022-08-29   68  	__must_check_overflow(__builtin_add_overflow(a, b, d))
f0907827a8a9152 Rasmus Villemoes 2018-05-08   69  
d70de8054c58d7b Kees Cook        2024-01-18   70  /**
d70de8054c58d7b Kees Cook        2024-01-18   71   * wrapping_add() - Intentionally perform a wrapping addition
d70de8054c58d7b Kees Cook        2024-01-18   72   * @type: type for result of calculation
d70de8054c58d7b Kees Cook        2024-01-18   73   * @a: first addend
d70de8054c58d7b Kees Cook        2024-01-18   74   * @b: second addend
d70de8054c58d7b Kees Cook        2024-01-18   75   *
d70de8054c58d7b Kees Cook        2024-01-18   76   * Return the potentially wrapped-around addition without
d70de8054c58d7b Kees Cook        2024-01-18   77   * tripping any wrap-around sanitizers that may be enabled.
d70de8054c58d7b Kees Cook        2024-01-18   78   */
d70de8054c58d7b Kees Cook        2024-01-18   79  #define wrapping_add(type, a, b)				\
d70de8054c58d7b Kees Cook        2024-01-18   80  	({							\
d70de8054c58d7b Kees Cook        2024-01-18   81  		type __val;					\
d70de8054c58d7b Kees Cook        2024-01-18   82  		__builtin_add_overflow(a, b, &__val);		\
d70de8054c58d7b Kees Cook        2024-01-18   83  		__val;						\
d70de8054c58d7b Kees Cook        2024-01-18   84  	})
d70de8054c58d7b Kees Cook        2024-01-18   85  
08d45ee84bb2650 Kees Cook        2024-01-26   86  /**
08d45ee84bb2650 Kees Cook        2024-01-26   87   * wrapping_assign_add() - Intentionally perform a wrapping increment assignment
08d45ee84bb2650 Kees Cook        2024-01-26   88   * @var: variable to be incremented
08d45ee84bb2650 Kees Cook        2024-01-26   89   * @offset: amount to add
08d45ee84bb2650 Kees Cook        2024-01-26   90   *
08d45ee84bb2650 Kees Cook        2024-01-26   91   * Increments @var by @offset with wrap-around. Returns the resulting
08d45ee84bb2650 Kees Cook        2024-01-26   92   * value of @var. Will not trip any wrap-around sanitizers.
08d45ee84bb2650 Kees Cook        2024-01-26   93   *
08d45ee84bb2650 Kees Cook        2024-01-26   94   * Returns the new value of @var.
08d45ee84bb2650 Kees Cook        2024-01-26   95   */
08d45ee84bb2650 Kees Cook        2024-01-26   96  #define wrapping_assign_add(var, offset)				\
08d45ee84bb2650 Kees Cook        2024-01-26   97  	({								\
08d45ee84bb2650 Kees Cook        2024-01-26   98  		typeof(var) *__ptr = &(var);				\
08d45ee84bb2650 Kees Cook        2024-01-26   99  		*__ptr = wrapping_add(typeof(var), *__ptr, offset);	\
08d45ee84bb2650 Kees Cook        2024-01-26  100  	})
08d45ee84bb2650 Kees Cook        2024-01-26  101  
31970608a6d3796 Kees Cook        2022-09-26  102  /**
31970608a6d3796 Kees Cook        2022-09-26  103   * check_sub_overflow() - Calculate subtraction with overflow checking
d219d2a9a92e39a Kees Cook        2022-08-29  104   * @a: minuend; value to subtract from
d219d2a9a92e39a Kees Cook        2022-08-29  105   * @b: subtrahend; value to subtract from @a
d219d2a9a92e39a Kees Cook        2022-08-29  106   * @d: pointer to store difference
d219d2a9a92e39a Kees Cook        2022-08-29  107   *
3e19086fb5a9079 Kees Cook        2024-01-29  108   * Returns true on wrap-around, false otherwise.
d219d2a9a92e39a Kees Cook        2022-08-29  109   *
3e19086fb5a9079 Kees Cook        2024-01-29  110   * *@d holds the results of the attempted subtraction, regardless of whether
3e19086fb5a9079 Kees Cook        2024-01-29  111   * wrap-around occurred.
d219d2a9a92e39a Kees Cook        2022-08-29  112   */
d219d2a9a92e39a Kees Cook        2022-08-29  113  #define check_sub_overflow(a, b, d)	\
d219d2a9a92e39a Kees Cook        2022-08-29  114  	__must_check_overflow(__builtin_sub_overflow(a, b, d))
f0907827a8a9152 Rasmus Villemoes 2018-05-08  115  
d70de8054c58d7b Kees Cook        2024-01-18  116  /**
d70de8054c58d7b Kees Cook        2024-01-18  117   * wrapping_sub() - Intentionally perform a wrapping subtraction
d70de8054c58d7b Kees Cook        2024-01-18  118   * @type: type for result of calculation
d70de8054c58d7b Kees Cook        2024-01-18  119   * @a: minuend; value to subtract from
d70de8054c58d7b Kees Cook        2024-01-18  120   * @b: subtrahend; value to subtract from @a
d70de8054c58d7b Kees Cook        2024-01-18  121   *
d70de8054c58d7b Kees Cook        2024-01-18  122   * Return the potentially wrapped-around subtraction without
d70de8054c58d7b Kees Cook        2024-01-18  123   * tripping any wrap-around sanitizers that may be enabled.
d70de8054c58d7b Kees Cook        2024-01-18  124   */
d70de8054c58d7b Kees Cook        2024-01-18  125  #define wrapping_sub(type, a, b)				\
d70de8054c58d7b Kees Cook        2024-01-18  126  	({							\
d70de8054c58d7b Kees Cook        2024-01-18  127  		type __val;					\
d70de8054c58d7b Kees Cook        2024-01-18 @128  		__builtin_sub_overflow(a, b, &__val);		\
d70de8054c58d7b Kees Cook        2024-01-18  129  		__val;						\
d70de8054c58d7b Kees Cook        2024-01-18  130  	})
d70de8054c58d7b Kees Cook        2024-01-18  131  

:::::: The code at line 128 was first introduced by commit
:::::: d70de8054c58d7bd9a4654c9f4797d29fa46d545 overflow: Introduce wrapping_add(), wrapping_sub(), and wrapping_mul()

:::::: TO: Kees Cook <keescook@chromium.org>
:::::: CC: Kees Cook <keescook@chromium.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
