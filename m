Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACBE38F6B
	for <oe-kbuild-all@lists.linux.dev>; Fri, 28 Feb 2025 13:50:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740750641; cv=none; b=CEFNGJVCwLMEfnfHasuRDw/XxfY8hAXzreMFtR9LN1vemUGMJisN+SQAp5/EFP09EwMmGXfmDehZSh0Lz4sUB7bJzvkYWYsUMFjom9SlzyX2YrQgjd+BzQgSpczvRzBPpA3XUm2f0pk57tEt1YLhcGIOm1/FsoT8kNau7hrsLUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740750641; c=relaxed/simple;
	bh=i9wkVE3cfXgqlLW7mUL6B4YkZ/i/2NxdPHaSoVOKn7U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rPwPv8gwFR0gzAmxFFQeLpfxw5TDBLR/XczmmyKuALUn9nYfKLmAtiTPxGzboJZ7tceDf1MVMimvfKKg8jTh/AIIJpjCuhnaCboUCxtW6YjJLakwJ/AtN/17fikaCI8dNmh7KE1Xz/BxgLJ/NmjVxDIRXZXaSmt+G8YfR9oLurc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Kofxq5Q+; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Kofxq5Q+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740750639; x=1772286639;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=i9wkVE3cfXgqlLW7mUL6B4YkZ/i/2NxdPHaSoVOKn7U=;
  b=Kofxq5Q+zIvCr0+rz/4v+cxZZ6CEHa2MutVhHR1KR26OwHdlux4dfrLb
   SBvMB+glhXPR/1SBMG+Sfw5fXsQMR2TCnRSnGBE/reYMHSSzijOT4LsGw
   /X9TTSSIidX8AmOcd9F6MSuhjcXqAMthFSIYT8Q+PfZdpwTvZm06Ks/lA
   QG0uT6ywSgUe9bUPHvqqaKmYXGaawFDDTDYB3xCnHaHVhIuESj3NayhTA
   zPNSZMJ1I5SJ7GhN5pfz+ZHKlDcGXzWXK341NOnWgg9QEFlSnBlmXVveR
   rZ4Rg/pf/g76dJMw3Mg6KqYpVmedAi8WVDMheT7h9bzjdDKZ5HOoJDnuQ
   g==;
X-CSE-ConnectionGUID: 0GUMkxGzQTqVNpn0jKlfRg==
X-CSE-MsgGUID: RW9d3GKkRGWtVBNZli3KpA==
X-IronPort-AV: E=McAfee;i="6700,10204,11359"; a="67055994"
X-IronPort-AV: E=Sophos;i="6.13,322,1732608000"; 
   d="scan'208";a="67055994"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Feb 2025 05:50:39 -0800
X-CSE-ConnectionGUID: RtQSjvZ6Qq+7EhIM1DNkbw==
X-CSE-MsgGUID: UOyXUq1gSzi2GtivYZkjcg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,322,1732608000"; 
   d="scan'208";a="117524626"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 28 Feb 2025 05:50:38 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1to0lA-000Exy-0Y;
	Fri, 28 Feb 2025 13:50:36 +0000
Date: Fri, 28 Feb 2025 21:49:44 +0800
From: kernel test robot <lkp@intel.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jpoimboe:asm-call-constraint-fix 1/5]
 arch/x86/kvm/vmx/vmx_ops.h:147:22: error: undefined named operand 'field'
Message-ID: <202502282152.wH6F1HfX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Josh,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git asm-call-constraint-fix
head:   a882d0410fb655d41b5c5158dcd1a720275cf505
commit: 24c34dab5ea410773423ea23f86eeb054e4d37a9 [1/5] KVM: VMX: Use named operands in inline asm
config: i386-buildonly-randconfig-003-20250228 (https://download.01.org/0day-ci/archive/20250228/202502282152.wH6F1HfX-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250228/202502282152.wH6F1HfX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502282152.wH6F1HfX-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/x86/kvm/vmx/vmx.h:15,
                    from arch/x86/kvm/kvm-asm-offsets.c:10:
   arch/x86/kvm/vmx/vmx_ops.h: In function '__vmcs_readl':
>> arch/x86/kvm/vmx/vmx_ops.h:147:22: error: undefined named operand 'field'
     147 |                      : ASM_CALL_CONSTRAINT, "=&r"(value) : "r"(field) : "cc");
         |                      ^
>> arch/x86/kvm/vmx/vmx_ops.h:147:22: error: undefined named operand 'output'
>> arch/x86/kvm/vmx/vmx_ops.h:147:22: error: undefined named operand 'output'
>> arch/x86/kvm/vmx/vmx_ops.h:147:22: error: undefined named operand 'output'
>> arch/x86/kvm/vmx/vmx_ops.h:147:22: error: undefined named operand 'output'
>> arch/x86/kvm/vmx/vmx_ops.h:147:22: error: undefined named operand 'field'
>> arch/x86/kvm/vmx/vmx_ops.h:147:22: error: undefined named operand 'field'
>> arch/x86/kvm/vmx/vmx_ops.h:147:22: error: undefined named operand 'output'
>> arch/x86/kvm/vmx/vmx_ops.h:147:22: error: undefined named operand 'output'


vim +/field +147 arch/x86/kvm/vmx/vmx_ops.h

907d139318b510 arch/x86/kvm/vmx/vmx_ops.h Peter Zijlstra      2021-12-13  120  
24c34dab5ea410 arch/x86/kvm/vmx/vmx_ops.h Josh Poimboeuf      2025-02-27  121  	asm volatile("1: vmread %[field], %[output]\n\t"
6e2020977e3e69 arch/x86/kvm/vmx/ops.h     Sean Christopherson 2019-07-19  122  		     ".byte 0x3e\n\t" /* branch taken hint */
6e2020977e3e69 arch/x86/kvm/vmx/ops.h     Sean Christopherson 2019-07-19  123  		     "ja 3f\n\t"
842f4be95899df arch/x86/kvm/vmx/ops.h     Sean Christopherson 2020-03-26  124  
842f4be95899df arch/x86/kvm/vmx/ops.h     Sean Christopherson 2020-03-26  125  		     /*
842f4be95899df arch/x86/kvm/vmx/ops.h     Sean Christopherson 2020-03-26  126  		      * VMREAD failed.  Push '0' for @fault, push the failing
842f4be95899df arch/x86/kvm/vmx/ops.h     Sean Christopherson 2020-03-26  127  		      * @field, and bounce through the trampoline to preserve
842f4be95899df arch/x86/kvm/vmx/ops.h     Sean Christopherson 2020-03-26  128  		      * volatile registers.
842f4be95899df arch/x86/kvm/vmx/ops.h     Sean Christopherson 2020-03-26  129  		      */
24c34dab5ea410 arch/x86/kvm/vmx/vmx_ops.h Josh Poimboeuf      2025-02-27  130  		     "xorl %k[output], %k[output]\n\t"
3e8ea7803a1ded arch/x86/kvm/vmx/vmx_ops.h Peter Zijlstra      2021-11-10  131  		     "2:\n\t"
24c34dab5ea410 arch/x86/kvm/vmx/vmx_ops.h Josh Poimboeuf      2025-02-27  132  		     "push %[output]\n\t"
24c34dab5ea410 arch/x86/kvm/vmx/vmx_ops.h Josh Poimboeuf      2025-02-27  133  		     "push %[field]\n\t"
3e8ea7803a1ded arch/x86/kvm/vmx/vmx_ops.h Peter Zijlstra      2021-11-10  134  		     "call vmread_error_trampoline\n\t"
842f4be95899df arch/x86/kvm/vmx/ops.h     Sean Christopherson 2020-03-26  135  
842f4be95899df arch/x86/kvm/vmx/ops.h     Sean Christopherson 2020-03-26  136  		     /*
842f4be95899df arch/x86/kvm/vmx/ops.h     Sean Christopherson 2020-03-26  137  		      * Unwind the stack.  Note, the trampoline zeros out the
842f4be95899df arch/x86/kvm/vmx/ops.h     Sean Christopherson 2020-03-26  138  		      * memory for @fault so that the result is '0' on error.
842f4be95899df arch/x86/kvm/vmx/ops.h     Sean Christopherson 2020-03-26  139  		      */
24c34dab5ea410 arch/x86/kvm/vmx/vmx_ops.h Josh Poimboeuf      2025-02-27  140  		     "pop %[field]\n\t"
24c34dab5ea410 arch/x86/kvm/vmx/vmx_ops.h Josh Poimboeuf      2025-02-27  141  		     "pop %[output]\n\t"
6e2020977e3e69 arch/x86/kvm/vmx/ops.h     Sean Christopherson 2019-07-19  142  		     "3:\n\t"
6e2020977e3e69 arch/x86/kvm/vmx/ops.h     Sean Christopherson 2019-07-19  143  
842f4be95899df arch/x86/kvm/vmx/ops.h     Sean Christopherson 2020-03-26  144  		     /* VMREAD faulted.  As above, except push '1' for @fault. */
24c34dab5ea410 arch/x86/kvm/vmx/vmx_ops.h Josh Poimboeuf      2025-02-27  145  		     _ASM_EXTABLE_TYPE_REG(1b, 2b, EX_TYPE_ONE_REG, %[output])
3e8ea7803a1ded arch/x86/kvm/vmx/vmx_ops.h Peter Zijlstra      2021-11-10  146  
3e8ea7803a1ded arch/x86/kvm/vmx/vmx_ops.h Peter Zijlstra      2021-11-10 @147  		     : ASM_CALL_CONSTRAINT, "=&r"(value) : "r"(field) : "cc");
89b0c9f58350f6 arch/x86/kvm/vmx/ops.h     Sean Christopherson 2018-12-03  148  	return value;
907d139318b510 arch/x86/kvm/vmx/vmx_ops.h Peter Zijlstra      2021-12-13  149  

:::::: The code at line 147 was first introduced by commit
:::::: 3e8ea7803a1dedf19120a2fef12c590e90e4b469 x86/vmx: Remove .fixup usage

:::::: TO: Peter Zijlstra <peterz@infradead.org>
:::::: CC: Peter Zijlstra <peterz@infradead.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
