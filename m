Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E134C376E2
	for <oe-kbuild-all@lists.linux.dev>; Thu,  4 Apr 2024 12:25:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712233553; cv=none; b=svU9P+IBjupwGrDdXJ/zevjk2E222bjXu+zlxdK/rJPQaM0ZWschcITs9/mQ5Khw8lBeztWgnr1ESIw42lLegvA5cExQG9xgsf38C2z/As2YwX1chdjK0FuK6OHpCIf8czwJScqkKnhAGv5+H8TO9rl6KzwJPJb7JXynHUQ7AO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712233553; c=relaxed/simple;
	bh=/WVcP0CsIWWAqf/flM/fFZIoOpYrLXX4uT+UVNpfbjc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nORqbNWnQb/sJ1ppMxsVnOIPlu9ZqBUB+hJYnw0HmZQDDQpCo1FoH3RWxYlg+G5xn+L2iwSRC8JGfPpNgt+yQaRfj4myn8OX1IZQLCYrfjmzx5gHYxtPOLGzaFDw+65zFUUMdsQm62ypwtoa1B57997K95jk0AYrum5lltirEbU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DuoHw9sk; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DuoHw9sk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712233550; x=1743769550;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/WVcP0CsIWWAqf/flM/fFZIoOpYrLXX4uT+UVNpfbjc=;
  b=DuoHw9skhZfqpijfRbTntaoFtGM/yD3ez+NfG50Gt2d13jjsXGo7bbuF
   WpsGEr+OEC/zgCwSvsv84a2ym0HA8NlpSenv2tW7KPc7wJZx9VXAmcbkN
   tcn3h3EDbDpDtCjLr8ssWH9b4n5idckhn1o02LvqobcVJIZPbz3J6c7Hn
   I9KjYx/bsO8IKtDzkZGOktE7+OZ11BsAYSAUUh2QiLQiMrChiI5ZIh49i
   wC74KPqPM6H8R2mn0TP2zcozaFp+qyNnujtGsmDwrdSiBlfJvpXAd8JmR
   03ZUbeLM26XLl0ZQ5Ib4V+2Wvi9Nyv4FGR+5JSzFxq4beyu5nxLJviw0p
   g==;
X-CSE-ConnectionGUID: 0DhUELEuScKKsMPX3F36Vw==
X-CSE-MsgGUID: Yxb7pgnISqeyZ5x1qth1Ow==
X-IronPort-AV: E=McAfee;i="6600,9927,11033"; a="18664146"
X-IronPort-AV: E=Sophos;i="6.07,179,1708416000"; 
   d="scan'208";a="18664146"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2024 05:25:49 -0700
X-CSE-ConnectionGUID: /VMptCYjQSew6ZdeMJ1Lgw==
X-CSE-MsgGUID: ZkT8YX7lSeuGYcCSyOrjQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,179,1708416000"; 
   d="scan'208";a="41928523"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 04 Apr 2024 05:25:48 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rsMA5-00012E-2a;
	Thu, 04 Apr 2024 12:25:45 +0000
Date: Thu, 4 Apr 2024 20:25:03 +0800
From: kernel test robot <lkp@intel.com>
To: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [intel-tdx:guest-hardening-rebased 36/36]
 arch/x86/include/asm/paravirt.h:119:20: warning: conflicting types for
 'wrmsrl'; have 'void(unsigned int,  u64)' {aka 'void(unsigned int,  long
 long unsigned int)'}
Message-ID: <202404042026.V10rMA4F-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/tdx.git guest-hardening-rebased
head:   4d356858e22b5daf59ef3f38b776ed0f63ca70e0
commit: 4d356858e22b5daf59ef3f38b776ed0f63ca70e0 [36/36] x86/paravirt: Explicitly include msr.h
config: x86_64-randconfig-101-20240404 (https://download.01.org/0day-ci/archive/20240404/202404042026.V10rMA4F-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240404/202404042026.V10rMA4F-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404042026.V10rMA4F-lkp@intel.com/

All warnings (new ones prefixed by >>):

   make[6]: *** No rule to make target 'tools/include/linux/panic.h', needed by 'tools/objtool/libsubcmd/parse-options.o'.  Stop.
   make[5]: *** [Makefile:80: tools/objtool/libsubcmd/libsubcmd-in.o] Error 2
   make[4]: *** [Makefile:82: tools/objtool/libsubcmd/libsubcmd.a] Error 2
   make[3]: *** [Makefile:73: objtool] Error 2
   make[2]: *** [Makefile:1358: tools/objtool] Error 2
   In file included from include/linux/mem_encrypt.h:17,
                    from arch/x86/include/asm/processor-flags.h:6,
                    from arch/x86/include/asm/irqflags.h:5,
                    from include/linux/irqflags.h:18,
                    from include/linux/spinlock.h:59,
                    from include/linux/swait.h:7,
                    from include/linux/completion.h:12,
                    from include/linux/crypto.h:15,
                    from arch/x86/kernel/asm-offsets.c:9:
   arch/x86/include/asm/mem_encrypt.h:112:27: error: redefinition of 'mem_encrypt_setup_arch'
     112 | static inline void __init mem_encrypt_setup_arch(void) { }
         |                           ^~~~~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/mem_encrypt.h:26:27: note: previous definition of 'mem_encrypt_setup_arch' with type 'void(void)'
      26 | static inline void __init mem_encrypt_setup_arch(void) { }
         |                           ^~~~~~~~~~~~~~~~~~~~~~
   In file included from arch/x86/include/asm/paravirt.h:8,
                    from arch/x86/include/asm/irqflags.h:60:
   arch/x86/include/asm/msr.h: In function 'wrmsrl_safe':
   arch/x86/include/asm/msr.h:320:16: error: implicit declaration of function 'wrmsr_safe'; did you mean 'wrmsrl_safe'? [-Werror=implicit-function-declaration]
     320 |         return wrmsr_safe(msr, (u32)val,  (u32)(val >> 32));
         |                ^~~~~~~~~~
         |                wrmsrl_safe
   arch/x86/include/asm/msr.h: In function 'rdmsr_on_cpu':
   arch/x86/include/asm/msr.h:344:9: error: implicit declaration of function 'rdmsr' [-Werror=implicit-function-declaration]
     344 |         rdmsr(msr_no, *l, *h);
         |         ^~~~~
   arch/x86/include/asm/msr.h: In function 'wrmsr_on_cpu':
   arch/x86/include/asm/msr.h:349:9: error: implicit declaration of function 'wrmsr'; did you mean 'wrmsrns'? [-Werror=implicit-function-declaration]
     349 |         wrmsr(msr_no, l, h);
         |         ^~~~~
         |         wrmsrns
   arch/x86/include/asm/msr.h: In function 'rdmsrl_on_cpu':
   arch/x86/include/asm/msr.h:354:9: error: implicit declaration of function 'rdmsrl' [-Werror=implicit-function-declaration]
     354 |         rdmsrl(msr_no, *q);
         |         ^~~~~~
   arch/x86/include/asm/msr.h: In function 'wrmsrl_on_cpu':
   arch/x86/include/asm/msr.h:359:9: error: implicit declaration of function 'wrmsrl'; did you mean 'wrmsrns'? [-Werror=implicit-function-declaration]
     359 |         wrmsrl(msr_no, q);
         |         ^~~~~~
         |         wrmsrns
   arch/x86/include/asm/msr.h: In function 'rdmsr_safe_on_cpu':
   arch/x86/include/asm/msr.h:375:16: error: implicit declaration of function 'rdmsr_safe'; did you mean 'wrmsrl_safe'? [-Werror=implicit-function-declaration]
     375 |         return rdmsr_safe(msr_no, l, h);
         |                ^~~~~~~~~~
         |                wrmsrl_safe
   arch/x86/include/asm/msr.h: In function 'rdmsrl_safe_on_cpu':
   arch/x86/include/asm/msr.h:383:16: error: implicit declaration of function 'rdmsrl_safe'; did you mean 'wrmsrl_safe'? [-Werror=implicit-function-declaration]
     383 |         return rdmsrl_safe(msr_no, q);
         |                ^~~~~~~~~~~
         |                wrmsrl_safe
   arch/x86/include/asm/paravirt.h: At top level:
>> arch/x86/include/asm/paravirt.h:119:20: warning: conflicting types for 'wrmsrl'; have 'void(unsigned int,  u64)' {aka 'void(unsigned int,  long long unsigned int)'}
     119 | static inline void wrmsrl(unsigned msr, u64 val)
         |                    ^~~~~~
   arch/x86/include/asm/paravirt.h:119:20: error: static declaration of 'wrmsrl' follows non-static declaration
   arch/x86/include/asm/msr.h:359:9: note: previous implicit declaration of 'wrmsrl' with type 'void(unsigned int,  u64)' {aka 'void(unsigned int,  long long unsigned int)'}
     359 |         wrmsrl(msr_no, q);
         |         ^~~~~~
   arch/x86/include/asm/paravirt.h:249:19: error: static declaration of 'rdmsrl_safe' follows non-static declaration
     249 | static inline int rdmsrl_safe(unsigned msr, unsigned long long *p)
         |                   ^~~~~~~~~~~
   arch/x86/include/asm/msr.h:383:16: note: previous implicit declaration of 'rdmsrl_safe' with type 'int()'
     383 |         return rdmsrl_safe(msr_no, q);
         |                ^~~~~~~~~~~
   cc1: some warnings being treated as errors
   make[3]: *** [scripts/Makefile.build:117: arch/x86/kernel/asm-offsets.s] Error 1
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1197: prepare0] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:240: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:240: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +119 arch/x86/include/asm/paravirt.h

5288dfd167c4a7 Andi Kleen 2021-07-30  118  
5288dfd167c4a7 Andi Kleen 2021-07-30 @119  static inline void wrmsrl(unsigned msr, u64 val)
5288dfd167c4a7 Andi Kleen 2021-07-30  120  {
5288dfd167c4a7 Andi Kleen 2021-07-30  121  	paravirt_write_msr(msr, (u32)val, (u32)(val>>32));
5288dfd167c4a7 Andi Kleen 2021-07-30  122  }
5288dfd167c4a7 Andi Kleen 2021-07-30  123  

:::::: The code at line 119 was first introduced by commit
:::::: 5288dfd167c4a73344f9d7b617b4902284667818 x86/tdx/paravirt: Move wrmsrl outside PARAVIRT_XXL

:::::: TO: Andi Kleen <ak@linux.intel.com>
:::::: CC: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
