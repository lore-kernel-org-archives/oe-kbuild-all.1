Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4E6F23958D
	for <oe-kbuild-all@lists.linux.dev>; Sun,  7 Dec 2025 06:59:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765090769; cv=none; b=d6uEKJwxau28kHh5b9uA21q8NrAnOCTMSj/yLuevyDBnfy60f08IuZkRWn5cwoVGrWIMZHnv+SpbbKy0nuIl6W/xBA4uQa6PYJroVgR8XUQ4bKqz6z0lcKspAb+M+YoYLWUrlIWzGYmnileuwnEZwxf9oEm4celJwYsoUDhkuVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765090769; c=relaxed/simple;
	bh=dMCC9Xt12FwFKSdXGoUC/P089agZOvWmGUPWHKwi+H0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=J+gs4vRGXEt80t7mllk7s+s/qVV7+ee81m2gXsfD201PSFpatlzlmPpYHvTQ7AyC3Y8W/8g1JlGQgSKMEXD9CMHsNr2tsfmTLZhysskzLHXlFXPGiQ5nVPk24ZsrShCTUyYz5/36mCjEnXXPMhLEHm5iqgvJfS9N7tb9blIXDWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Tg9xJ/JY; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Tg9xJ/JY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765090768; x=1796626768;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dMCC9Xt12FwFKSdXGoUC/P089agZOvWmGUPWHKwi+H0=;
  b=Tg9xJ/JYZjmrtOQjF7HoCw+iPfHRISNOgcbZGKNpVEdw7epp6Ry191eE
   RbbVBVDyCP44fXRkYWAPpXQXno/seUD+g5z7Qjs3XArgvfwQCd3DiSgKS
   +s8IHBaKlmVRBWx4wZVX1+josJTEUaozLgJHKDDa9LiiVi3paY78CQSD3
   qtAOUlVjcI6aX8aTeGgh+fgtmdjl/n5qngGMpt+QAuXUIjdKsUIWQYbRp
   bhUj0xgTZX6CyDgqkSiV+hAuy2OWK6J9MkqHZpizrWBKsJQNPpfYkYbvz
   6Rx+VDj9D4Y9BoJ5L+PTBHc8MNwbQGEQX4/JGJLBxOskLT3dZPPo0o1bK
   Q==;
X-CSE-ConnectionGUID: WEL+yzeHQW2t77BCgBMiRg==
X-CSE-MsgGUID: hSUHlX2qTAOIbmZmXFVrJQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11634"; a="67030664"
X-IronPort-AV: E=Sophos;i="6.20,256,1758610800"; 
   d="scan'208";a="67030664"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Dec 2025 22:59:27 -0800
X-CSE-ConnectionGUID: 1Lc8L5D7T7u/noWLDhidcQ==
X-CSE-MsgGUID: Y27MiHCnTBqsgGWr3vtgCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,256,1758610800"; 
   d="scan'208";a="195723980"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 06 Dec 2025 22:59:26 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vS8jr-00000000J3l-2BJ2;
	Sun, 07 Dec 2025 06:59:23 +0000
Date: Sun, 7 Dec 2025 14:59:16 +0800
From: kernel test robot <lkp@intel.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jpoimboe:alternative-macro 8/8] arch/x86/include/asm/mshyperv.h:89:
 Error: expecting mnemonic; got nothing
Message-ID: <202512071443.S37AoDdW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git alternative-macro
head:   051df5c21cbf6d9ac396c22b3ab3c51d73c0def7
commit: 051df5c21cbf6d9ac396c22b3ab3c51d73c0def7 [8/8] x86/alternative: Convert alternatives to assembler macros
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20251207/202512071443.S37AoDdW-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251207/202512071443.S37AoDdW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512071443.S37AoDdW-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   arch/x86/include/asm/mshyperv.h: Assembler messages:
>> arch/x86/include/asm/mshyperv.h:87: Warning: missing closing `"'
>> arch/x86/include/asm/mshyperv.h:89: Error: expecting mnemonic; got nothing
>> arch/x86/include/asm/mshyperv.h:91: Error: invalid character ' ' before operand 1
   arch/x86/include/asm/mshyperv.h:94: Error: invalid character ' ' before operand 1
   arch/x86/include/asm/mshyperv.h:96: Error: invalid character ' ' before operand 1
   arch/x86/include/asm/mshyperv.h:100: Error: invalid character ' ' before operand 1
   arch/x86/include/asm/mshyperv.h:101: Error: expecting mnemonic; got nothing
   arch/x86/include/asm/mshyperv.h:104: Warning: missing closing `"'
   arch/x86/include/asm/mshyperv.h:104: Error: expecting mnemonic; got nothing
--
   arch/x86/include/asm/mshyperv.h: Assembler messages:
>> arch/x86/include/asm/mshyperv.h:87: Warning: missing closing `"'
>> arch/x86/include/asm/mshyperv.h:89: Error: expecting mnemonic; got nothing
>> arch/x86/include/asm/mshyperv.h:91: Error: invalid character ' ' before operand 1
   arch/x86/include/asm/mshyperv.h:94: Error: invalid character ' ' before operand 1
   arch/x86/include/asm/mshyperv.h:96: Error: invalid character ' ' before operand 1
   arch/x86/include/asm/mshyperv.h:100: Error: invalid character ' ' before operand 1
   arch/x86/include/asm/mshyperv.h:101: Error: expecting mnemonic; got nothing
   arch/x86/include/asm/mshyperv.h:104: Warning: missing closing `"'
   arch/x86/include/asm/mshyperv.h:104: Error: expecting mnemonic; got nothing
>> arch/x86/include/asm/mshyperv.h:87: Warning: missing closing `"'
>> arch/x86/include/asm/mshyperv.h:89: Error: expecting mnemonic; got nothing
>> arch/x86/include/asm/mshyperv.h:91: Error: invalid character ' ' before operand 1
   arch/x86/include/asm/mshyperv.h:94: Error: invalid character ' ' before operand 1
   arch/x86/include/asm/mshyperv.h:96: Error: invalid character ' ' before operand 1
   arch/x86/include/asm/mshyperv.h:100: Error: invalid character ' ' before operand 1
   arch/x86/include/asm/mshyperv.h:101: Error: expecting mnemonic; got nothing
   arch/x86/include/asm/mshyperv.h:104: Warning: missing closing `"'
   arch/x86/include/asm/mshyperv.h:104: Error: expecting mnemonic; got nothing
>> arch/x86/include/asm/mshyperv.h:87: Warning: missing closing `"'
>> arch/x86/include/asm/mshyperv.h:89: Error: expecting mnemonic; got nothing
>> arch/x86/include/asm/mshyperv.h:91: Error: invalid character ' ' before operand 1
   arch/x86/include/asm/mshyperv.h:94: Error: invalid character ' ' before operand 1
   arch/x86/include/asm/mshyperv.h:96: Error: invalid character ' ' before operand 1
   arch/x86/include/asm/mshyperv.h:100: Error: invalid character ' ' before operand 1
   arch/x86/include/asm/mshyperv.h:101: Error: expecting mnemonic; got nothing
   arch/x86/include/asm/mshyperv.h:104: Warning: missing closing `"'
   arch/x86/include/asm/mshyperv.h:104: Error: expecting mnemonic; got nothing
>> arch/x86/include/asm/mshyperv.h:87: Warning: missing closing `"'
>> arch/x86/include/asm/mshyperv.h:89: Error: expecting mnemonic; got nothing
>> arch/x86/include/asm/mshyperv.h:91: Error: invalid character ' ' before operand 1
   arch/x86/include/asm/mshyperv.h:94: Error: invalid character ' ' before operand 1
   arch/x86/include/asm/mshyperv.h:96: Error: invalid character ' ' before operand 1
   arch/x86/include/asm/mshyperv.h:100: Error: invalid character ' ' before operand 1
   arch/x86/include/asm/mshyperv.h:101: Error: expecting mnemonic; got nothing
   arch/x86/include/asm/mshyperv.h:104: Warning: missing closing `"'
   arch/x86/include/asm/mshyperv.h:104: Error: expecting mnemonic; got nothing
>> arch/x86/include/asm/mshyperv.h:87: Warning: missing closing `"'
>> arch/x86/include/asm/mshyperv.h:89: Error: expecting mnemonic; got nothing
>> arch/x86/include/asm/mshyperv.h:91: Error: invalid character ' ' before operand 1
   arch/x86/include/asm/mshyperv.h:94: Error: invalid character ' ' before operand 1
   arch/x86/include/asm/mshyperv.h:96: Error: invalid character ' ' before operand 1
   arch/x86/include/asm/mshyperv.h:100: Error: invalid character ' ' before operand 1
   arch/x86/include/asm/mshyperv.h:101: Error: expecting mnemonic; got nothing
   arch/x86/include/asm/mshyperv.h:104: Warning: missing closing `"'
   arch/x86/include/asm/mshyperv.h:104: Error: expecting mnemonic; got nothing
--
   arch/x86/include/asm/mshyperv.h: Assembler messages:
>> arch/x86/include/asm/mshyperv.h:87: Warning: missing closing `"'
>> arch/x86/include/asm/mshyperv.h:89: Error: expecting mnemonic; got nothing
>> arch/x86/include/asm/mshyperv.h:91: Error: invalid character ' ' before operand 1
   arch/x86/include/asm/mshyperv.h:94: Error: invalid character ' ' before operand 1
   arch/x86/include/asm/mshyperv.h:96: Error: invalid character ' ' before operand 1
   arch/x86/include/asm/mshyperv.h:100: Error: invalid character ' ' before operand 1
   arch/x86/include/asm/mshyperv.h:101: Error: expecting mnemonic; got nothing
   arch/x86/include/asm/mshyperv.h:104: Warning: missing closing `"'
   arch/x86/include/asm/mshyperv.h:104: Error: expecting mnemonic; got nothing
>> arch/x86/include/asm/mshyperv.h:87: Warning: missing closing `"'
>> arch/x86/include/asm/mshyperv.h:89: Error: expecting mnemonic; got nothing
>> arch/x86/include/asm/mshyperv.h:91: Error: invalid character ' ' before operand 1
   arch/x86/include/asm/mshyperv.h:94: Error: invalid character ' ' before operand 1
   arch/x86/include/asm/mshyperv.h:96: Error: invalid character ' ' before operand 1
   arch/x86/include/asm/mshyperv.h:100: Error: invalid character ' ' before operand 1
   arch/x86/include/asm/mshyperv.h:101: Error: expecting mnemonic; got nothing
   arch/x86/include/asm/mshyperv.h:104: Warning: missing closing `"'
   arch/x86/include/asm/mshyperv.h:104: Error: expecting mnemonic; got nothing


vim +89 arch/x86/include/asm/mshyperv.h

48b1f68372ca93 Tianyu Lan       2023-08-18  65  
d6e0228d265f29 Dexuan Cui       2023-08-24  66  /*
d6e0228d265f29 Dexuan Cui       2023-08-24  67   * If the hypercall involves no input or output parameters, the hypervisor
d6e0228d265f29 Dexuan Cui       2023-08-24  68   * ignores the corresponding GPA pointer.
d6e0228d265f29 Dexuan Cui       2023-08-24  69   */
fc53662f13b889 Vitaly Kuznetsov 2017-08-02  70  static inline u64 hv_do_hypercall(u64 control, void *input, void *output)
fc53662f13b889 Vitaly Kuznetsov 2017-08-02  71  {
fc53662f13b889 Vitaly Kuznetsov 2017-08-02  72  	u64 input_address = input ? virt_to_phys(input) : 0;
fc53662f13b889 Vitaly Kuznetsov 2017-08-02  73  	u64 output_address = output ? virt_to_phys(output) : 0;
fc53662f13b889 Vitaly Kuznetsov 2017-08-02  74  
fc53662f13b889 Vitaly Kuznetsov 2017-08-02  75  #ifdef CONFIG_X86_64
0e20f1f4c2cb77 Peter Zijlstra   2025-04-12  76  	return static_call_mod(hv_hypercall)(control, input_address, output_address);
fc53662f13b889 Vitaly Kuznetsov 2017-08-02  77  #else
fc53662f13b889 Vitaly Kuznetsov 2017-08-02  78  	u32 input_address_hi = upper_32_bits(input_address);
fc53662f13b889 Vitaly Kuznetsov 2017-08-02  79  	u32 input_address_lo = lower_32_bits(input_address);
fc53662f13b889 Vitaly Kuznetsov 2017-08-02  80  	u32 output_address_hi = upper_32_bits(output_address);
fc53662f13b889 Vitaly Kuznetsov 2017-08-02  81  	u32 output_address_lo = lower_32_bits(output_address);
0e20f1f4c2cb77 Peter Zijlstra   2025-04-12  82  	u64 hv_status;
fc53662f13b889 Vitaly Kuznetsov 2017-08-02  83  
fc53662f13b889 Vitaly Kuznetsov 2017-08-02  84  	if (!hv_hypercall_pg)
fc53662f13b889 Vitaly Kuznetsov 2017-08-02  85  		return U64_MAX;
fc53662f13b889 Vitaly Kuznetsov 2017-08-02  86  
e70e5892b28c18 David Woodhouse  2018-01-11 @87  	__asm__ __volatile__(CALL_NOSPEC
fc53662f13b889 Vitaly Kuznetsov 2017-08-02  88  			     : "=A" (hv_status),
f5caf621ee3572 Josh Poimboeuf   2017-09-20 @89  			       "+c" (input_address_lo), ASM_CALL_CONSTRAINT
fc53662f13b889 Vitaly Kuznetsov 2017-08-02  90  			     : "A" (control),
fc53662f13b889 Vitaly Kuznetsov 2017-08-02 @91  			       "b" (input_address_hi),
fc53662f13b889 Vitaly Kuznetsov 2017-08-02  92  			       "D"(output_address_hi), "S"(output_address_lo),
e70e5892b28c18 David Woodhouse  2018-01-11  93  			       THUNK_TARGET(hv_hypercall_pg)
fc53662f13b889 Vitaly Kuznetsov 2017-08-02  94  			     : "cc", "memory");
fc53662f13b889 Vitaly Kuznetsov 2017-08-02  95  	return hv_status;
0e20f1f4c2cb77 Peter Zijlstra   2025-04-12  96  #endif /* !x86_64 */
fc53662f13b889 Vitaly Kuznetsov 2017-08-02  97  }
dee863b571b0a7 Vitaly Kuznetsov 2017-02-04  98  

:::::: The code at line 89 was first introduced by commit
:::::: f5caf621ee357279e759c0911daf6d55c7d36f03 x86/asm: Fix inline asm call constraints for Clang

:::::: TO: Josh Poimboeuf <jpoimboe@redhat.com>
:::::: CC: Ingo Molnar <mingo@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
