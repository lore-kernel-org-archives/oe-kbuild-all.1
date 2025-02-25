Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EB1638DD1
	for <oe-kbuild-all@lists.linux.dev>; Tue, 25 Feb 2025 02:25:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740450337; cv=none; b=LPG9+gDCTqKyQNBsG2ulqbwwnf8kYAyLND+yEA1mww1sg2WlnY4LVXurUsJ17Feva+Jk13NLLzOc4aRPsq03jdtOttVjeNTT32kBWnrPJcwWZtSJJA1B17PcStM7/X7m9GzPsqhbYHEV5Z6tCzsIcSmiJ+hHs2gY54ryjHVeVm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740450337; c=relaxed/simple;
	bh=0cxGcGNvnNmM8rL2rfDtjpELf3szw/cqipdv+bdarrE=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=j/kwLUBMMKkYoVzUMBnQ1yadT1rYW34brLG9hLiXP9xahgmdKyv4LWJytxlJHeT+MyUcpHgt3x8tG0Ha2lhrQm3zCchvBAcekSGaPnmeDCs6eg2IBdiziHXIIDlQIgE2YjcBRTo4F0DCPGbMFIx/XBogl3dR+8a/m+niQwBMrs8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jmu4wqYf; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jmu4wqYf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740450335; x=1771986335;
  h=date:from:cc:subject:message-id:mime-version;
  bh=0cxGcGNvnNmM8rL2rfDtjpELf3szw/cqipdv+bdarrE=;
  b=jmu4wqYfO6++OJNByYCsuBjieV9CAPPjnJso8I8S6SYJRfgky0mC6Lxp
   kEDDQ8G2nwtKvLQmlUEdoykaNZX6cmSbkxbJlOy/WfkeEUiowPp0lFC1y
   EPz765fOYNtbawA44Qu/US4ldWoj8XAoxB3DrmqnPf0+2QqVPmjEHimzw
   0WPdcp/iXY7VV3U1crQWsVMXkeEhBDlya5rfc7wBcZfH340+NruUc1uGI
   4kEXfwfBAEWvmmufloAuZBWL/0jOeNNh8n6eLSoZoQIAfJzv34XPmO8Hv
   Vnk+/KJpXD6tMhUwHc9qhEZS8qSRjkMUpnEWwO7YJQfeOvp8rN7UJMKDq
   A==;
X-CSE-ConnectionGUID: gyl/VwvZQmuPGnWYhuyN1Q==
X-CSE-MsgGUID: 746Q5N23SFGCgnkv2atl1A==
X-IronPort-AV: E=McAfee;i="6700,10204,11355"; a="28829735"
X-IronPort-AV: E=Sophos;i="6.13,312,1732608000"; 
   d="scan'208";a="28829735"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2025 18:25:35 -0800
X-CSE-ConnectionGUID: M4Xk25dGTvqMb2xU1/NuCw==
X-CSE-MsgGUID: 3EDZWLhdQgS/rJM4jemURA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,312,1732608000"; 
   d="scan'208";a="116009747"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 24 Feb 2025 18:25:33 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tmkcf-0009e7-0l
	for oe-kbuild-all@lists.linux.dev;
	Tue, 25 Feb 2025 02:24:57 +0000
Date: Tue, 25 Feb 2025 10:24:10 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [intel-lts:pr/68 1/1] include/asm-generic/percpu.h:34:38: error:
 implicit declaration of function 'smp_processor_id'; did you mean
 'raw_smp_processor_id'?
Message-ID: <202502251008.FASE8heB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/linux-intel-lts.git pr/68
head:   1512b732e7eb769e47792aa376270df979374d81
commit: b012980d1c6e27f5c4adf0c19defca8658956820 [1/1] riscv/mmiowb: Hook up mmwiob() implementation to asm-generic code
config: riscv-randconfig-002-20250224 (https://download.01.org/0day-ci/archive/20250225/202502251008.FASE8heB-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250225/202502251008.FASE8heB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502251008.FASE8heB-lkp@intel.com/

All errors (new ones prefixed by >>):

   scripts/extract-cert.c: In function 'display_openssl_errors':
   scripts/extract-cert.c:46:9: warning: 'ERR_get_error_line' is deprecated: Since OpenSSL 3.0 [-Wdeprecated-declarations]
      46 |         while ((e = ERR_get_error_line(&file, &line))) {
         |         ^~~~~
   In file included from scripts/extract-cert.c:23:
   /usr/include/openssl/err.h:423:15: note: declared here
     423 | unsigned long ERR_get_error_line(const char **file, int *line);
         |               ^~~~~~~~~~~~~~~~~~
   scripts/extract-cert.c: In function 'drain_openssl_errors':
   scripts/extract-cert.c:59:9: warning: 'ERR_get_error_line' is deprecated: Since OpenSSL 3.0 [-Wdeprecated-declarations]
      59 |         while (ERR_get_error_line(&file, &line)) {}
         |         ^~~~~
   /usr/include/openssl/err.h:423:15: note: declared here
     423 | unsigned long ERR_get_error_line(const char **file, int *line);
         |               ^~~~~~~~~~~~~~~~~~
   scripts/extract-cert.c: In function 'main':
   scripts/extract-cert.c:124:17: warning: 'ENGINE_load_builtin_engines' is deprecated: Since OpenSSL 3.0 [-Wdeprecated-declarations]
     124 |                 ENGINE_load_builtin_engines();
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from scripts/extract-cert.c:24:
   /usr/include/openssl/engine.h:358:28: note: declared here
     358 | OSSL_DEPRECATEDIN_3_0 void ENGINE_load_builtin_engines(void);
         |                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   scripts/extract-cert.c:126:17: warning: 'ENGINE_by_id' is deprecated: Since OpenSSL 3.0 [-Wdeprecated-declarations]
     126 |                 e = ENGINE_by_id("pkcs11");
         |                 ^
   /usr/include/openssl/engine.h:336:31: note: declared here
     336 | OSSL_DEPRECATEDIN_3_0 ENGINE *ENGINE_by_id(const char *id);
         |                               ^~~~~~~~~~~~
   scripts/extract-cert.c:128:17: warning: 'ENGINE_init' is deprecated: Since OpenSSL 3.0 [-Wdeprecated-declarations]
     128 |                 if (ENGINE_init(e))
         |                 ^~
   /usr/include/openssl/engine.h:620:27: note: declared here
     620 | OSSL_DEPRECATEDIN_3_0 int ENGINE_init(ENGINE *e);
         |                           ^~~~~~~~~~~
   scripts/extract-cert.c:133:25: warning: 'ENGINE_ctrl_cmd_string' is deprecated: Since OpenSSL 3.0 [-Wdeprecated-declarations]
     133 |                         ERR(!ENGINE_ctrl_cmd_string(e, "PIN", key_pass, 0), "Set PKCS#11 PIN");
         |                         ^~~
   /usr/include/openssl/engine.h:479:5: note: declared here
     479 | int ENGINE_ctrl_cmd_string(ENGINE *e, const char *cmd_name, const char *arg,
         |     ^~~~~~~~~~~~~~~~~~~~~~
   scripts/extract-cert.c:134:17: warning: 'ENGINE_ctrl_cmd' is deprecated: Since OpenSSL 3.0 [-Wdeprecated-declarations]
     134 |                 ENGINE_ctrl_cmd(e, "LOAD_CERT_CTRL", 0, &parms, NULL, 1);
         |                 ^~~~~~~~~~~~~~~
   /usr/include/openssl/engine.h:450:27: note: declared here
     450 | OSSL_DEPRECATEDIN_3_0 int ENGINE_ctrl_cmd(ENGINE *e, const char *cmd_name,
         |                           ^~~~~~~~~~~~~~~
   In file included from include/linux/compiler_types.h:68,
                    from <command-line>:
   include/asm-generic/mmiowb.h: In function 'mmiowb_set_pending':
>> include/asm-generic/percpu.h:34:38: error: implicit declaration of function 'smp_processor_id'; did you mean 'raw_smp_processor_id'? [-Werror=implicit-function-declaration]
      34 | #define my_cpu_offset per_cpu_offset(smp_processor_id())
         |                                      ^~~~~~~~~~~~~~~~
   include/linux/compiler-gcc.h:58:33: note: in definition of macro 'RELOC_HIDE'
      58 |         (typeof(ptr)) (__ptr + (off));                                  \
         |                                 ^~~
   include/linux/percpu-defs.h:249:9: note: in expansion of macro 'SHIFT_PERCPU_PTR'
     249 |         SHIFT_PERCPU_PTR(ptr, my_cpu_offset);                           \
         |         ^~~~~~~~~~~~~~~~
   include/asm-generic/percpu.h:34:23: note: in expansion of macro 'per_cpu_offset'
      34 | #define my_cpu_offset per_cpu_offset(smp_processor_id())
         |                       ^~~~~~~~~~~~~~
   include/linux/percpu-defs.h:249:31: note: in expansion of macro 'my_cpu_offset'
     249 |         SHIFT_PERCPU_PTR(ptr, my_cpu_offset);                           \
         |                               ^~~~~~~~~~~~~
   include/asm-generic/mmiowb.h:30:33: note: in expansion of macro 'this_cpu_ptr'
      30 | #define __mmiowb_state()        this_cpu_ptr(&__mmiowb_state)
         |                                 ^~~~~~~~~~~~
   include/asm-generic/mmiowb.h:37:35: note: in expansion of macro '__mmiowb_state'
      37 |         struct mmiowb_state *ms = __mmiowb_state();
         |                                   ^~~~~~~~~~~~~~
   arch/riscv/kernel/asm-offsets.c: At top level:
   arch/riscv/kernel/asm-offsets.c:22:6: warning: no previous prototype for 'asm_offsets' [-Wmissing-prototypes]
      22 | void asm_offsets(void)
         |      ^~~~~~~~~~~
   cc1: some warnings being treated as errors
   make[2]: *** [scripts/Makefile.build:112: arch/riscv/kernel/asm-offsets.s] Error 1 shuffle=471186758
   make[2]: Target '__build' not remade because of errors.
   make[1]: *** [Makefile:1096: prepare0] Error 2 shuffle=471186758
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:169: sub-make] Error 2 shuffle=471186758
   make: Target 'prepare' not remade because of errors.


vim +34 include/asm-generic/percpu.h

acdac87202a408 travis@sgi.com 2008-01-30  23  
acdac87202a408 travis@sgi.com 2008-01-30  24  /*
acdac87202a408 travis@sgi.com 2008-01-30  25   * Determine the offset for the currently active processor.
acdac87202a408 travis@sgi.com 2008-01-30  26   * An arch may define __my_cpu_offset to provide a more effective
acdac87202a408 travis@sgi.com 2008-01-30  27   * means of obtaining the offset to the per cpu variables of the
acdac87202a408 travis@sgi.com 2008-01-30  28   * current processor.
acdac87202a408 travis@sgi.com 2008-01-30  29   */
acdac87202a408 travis@sgi.com 2008-01-30  30  #ifndef __my_cpu_offset
acdac87202a408 travis@sgi.com 2008-01-30  31  #define __my_cpu_offset per_cpu_offset(raw_smp_processor_id())
1e8352784abaed Hugh Dickins   2008-02-23  32  #endif
1e8352784abaed Hugh Dickins   2008-02-23  33  #ifdef CONFIG_DEBUG_PREEMPT
acdac87202a408 travis@sgi.com 2008-01-30 @34  #define my_cpu_offset per_cpu_offset(smp_processor_id())
acdac87202a408 travis@sgi.com 2008-01-30  35  #else
acdac87202a408 travis@sgi.com 2008-01-30  36  #define my_cpu_offset __my_cpu_offset
acdac87202a408 travis@sgi.com 2008-01-30  37  #endif
acdac87202a408 travis@sgi.com 2008-01-30  38  

:::::: The code at line 34 was first introduced by commit
:::::: acdac87202a408133ee8f7985076de9d2e0dc5ab percpu: make the asm-generic/percpu.h more "generic"

:::::: TO: travis@sgi.com <travis@sgi.com>
:::::: CC: Ingo Molnar <mingo@elte.hu>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
