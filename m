Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38BC42F7AD4
	for <oe-kbuild-all@lists.linux.dev>; Fri, 14 Nov 2025 09:16:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763111778; cv=none; b=f0otp+ixUZiSrKQFs2/V9NTzw9Rr2gPs8AwK2PqB4ClbUAWzaJBOXTMk38L+YKn7PfzPPztriUoOCtFXAKHWhUoaIhdf7f8GxHB8/Z2kEj1lICTbq6KGGL5UPOBk5GlP1dwnP5zUjz2NUMWdYHmOr6ij4AcsoY3GL2tYJz9FJro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763111778; c=relaxed/simple;
	bh=V3m4AMVxwY2z+pPuTNyI3f24w8Oo6mLOBslhpqxO0T8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lhyXiKJegSzWX78/v0N+upWugbXvQ/3sayUHpEwMspOKuCM2q//WQAPZCsf0qD4PCeT6oGBVTgXKZUeGRezvaIKdUG8LxOymyAdS+xX5itBh81wEsv+qk4kyhEsS3cpWzeaSlziR+rdC59pa/NcuGD2jk2gFH31eZ/njLOY3IPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XbvTCRpx; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XbvTCRpx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763111777; x=1794647777;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=V3m4AMVxwY2z+pPuTNyI3f24w8Oo6mLOBslhpqxO0T8=;
  b=XbvTCRpx9S4La/b+S+K0xcSOePwKHOZPA/z0nFyuWWsEGFLxM2xnctwn
   lRCwHaEWcYlirvgC5KtpnUuaeRMbqMKN17SMJ99InXyWXiK6HzYYHaNbx
   fXpCNcQyu8qkGDR6rHIHF/qeOTsLwj5/9OdpukF0EY00ivPhC6GtlkQ67
   yRFIZM+u7sRaeD1POL+Kj+2yr9T8aGhuB4hEQKutTkpabXozZd3dkGCV4
   +O6l8/WGPX+I6+3tZxsIu74F3det5kc9wd7qT1MURV26bEU+qwFHaL8jD
   fFPEP7Q8T+/MwmhHjEKLqhzW68UfWoJcrTIhTv4xmx5TYkcBpxN5/GUss
   Q==;
X-CSE-ConnectionGUID: URtp0yuBTNSURtLweBspTQ==
X-CSE-MsgGUID: UupLFQf1SMK0rgZtQUYBBA==
X-IronPort-AV: E=McAfee;i="6800,10657,11612"; a="75522968"
X-IronPort-AV: E=Sophos;i="6.19,304,1754982000"; 
   d="scan'208";a="75522968"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2025 01:16:16 -0800
X-CSE-ConnectionGUID: ilgkVuqzQCiS6bE/sfwaZw==
X-CSE-MsgGUID: jLPoafdtSMOm76Ye7yAEhA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,304,1754982000"; 
   d="scan'208";a="190517474"
Received: from lkp-server01.sh.intel.com (HELO 7b01c990427b) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 14 Nov 2025 01:16:14 -0800
Received: from kbuild by 7b01c990427b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vJpue-0006On-1a;
	Fri, 14 Nov 2025 09:16:12 +0000
Date: Fri, 14 Nov 2025 17:15:48 +0800
From: kernel test robot <lkp@intel.com>
To: Sean Christopherson <seanjc@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sean-jc:svm/exit_code_snafus 15/17]
 arch/x86/include/uapi/asm/svm.h:137:32: warning: conversion from 'long long
 unsigned int' to 'long unsigned int' changes value from
 '18446744073709551615' to '4294967295'
Message-ID: <202511141707.t4ad044J-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/sean-jc/linux svm/exit_code_snafus
head:   0c475dde8b12fe2026dd50adaf6b043583769e95
commit: d35cbc6dd54a98aa3445f24c1967a8e1100b8376 [15/17] KVM: SVM: Treat exit_code as an unsigned 64-bit value through all of KVM
config: i386-randconfig-012-20251114 (https://download.01.org/0day-ci/archive/20251114/202511141707.t4ad044J-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251114/202511141707.t4ad044J-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511141707.t4ad044J-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/trace/define_trace.h:132,
                    from arch/x86/kvm/trace.h:1976,
                    from arch/x86/kvm/x86.c:89:
   include/trace/../../arch/x86/kvm/trace.h: In function 'trace_raw_output_kvm_exit':
>> arch/x86/include/uapi/asm/svm.h:137:32: warning: conversion from 'long long unsigned int' to 'long unsigned int' changes value from '18446744073709551615' to '4294967295' [-Woverflow]
     137 | #define SVM_EXIT_ERR           -1ull
         |                                ^
   include/trace/trace_events.h:219:34: note: in definition of macro 'DECLARE_EVENT_CLASS'
     219 |         trace_event_printf(iter, print);                                \
         |                                  ^~~~~
   include/trace/trace_events.h:45:30: note: in expansion of macro 'PARAMS'
      45 |                              PARAMS(print));                   \
         |                              ^~~~~~
   include/trace/../../arch/x86/kvm/trace.h:392:1: note: in expansion of macro 'TRACE_EVENT'
     392 | TRACE_EVENT(name,                                                            \
         | ^~~~~~~~~~~
   include/trace/../../arch/x86/kvm/trace.h:421:9: note: in expansion of macro 'TP_printk'
     421 |         TP_printk("vcpu %u reason %s%s%s rip 0x%lx info1 0x%016llx "         \
         |         ^~~~~~~~~
   include/trace/../../arch/x86/kvm/trace.h:386:9: note: in expansion of macro '__print_symbolic'
     386 |         __print_symbolic(exit_reason, SVM_EXIT_REASONS),                \
         |         ^~~~~~~~~~~~~~~~
   arch/x86/include/uapi/asm/svm.h:249:11: note: in expansion of macro 'SVM_EXIT_ERR'
     249 |         { SVM_EXIT_ERR,         "invalid_guest_state" }
         |           ^~~~~~~~~~~~
   include/trace/../../arch/x86/kvm/trace.h:386:39: note: in expansion of macro 'SVM_EXIT_REASONS'
     386 |         __print_symbolic(exit_reason, SVM_EXIT_REASONS),                \
         |                                       ^~~~~~~~~~~~~~~~
   include/trace/../../arch/x86/kvm/trace.h:425:19: note: in expansion of macro 'kvm_print_exit_reason'
     425 |                   kvm_print_exit_reason(__entry->exit_reason, __entry->isa), \
         |                   ^~~~~~~~~~~~~~~~~~~~~
   include/trace/../../arch/x86/kvm/trace.h:434:1: note: in expansion of macro 'TRACE_EVENT_KVM_EXIT'
     434 | TRACE_EVENT_KVM_EXIT(kvm_exit);
         | ^~~~~~~~~~~~~~~~~~~~
   include/trace/../../arch/x86/kvm/trace.h: In function 'trace_raw_output_kvm_nested_vmexit':
>> arch/x86/include/uapi/asm/svm.h:137:32: warning: conversion from 'long long unsigned int' to 'long unsigned int' changes value from '18446744073709551615' to '4294967295' [-Woverflow]
     137 | #define SVM_EXIT_ERR           -1ull
         |                                ^
   include/trace/trace_events.h:219:34: note: in definition of macro 'DECLARE_EVENT_CLASS'
     219 |         trace_event_printf(iter, print);                                \
         |                                  ^~~~~
   include/trace/trace_events.h:45:30: note: in expansion of macro 'PARAMS'
      45 |                              PARAMS(print));                   \
         |                              ^~~~~~
   include/trace/../../arch/x86/kvm/trace.h:392:1: note: in expansion of macro 'TRACE_EVENT'
     392 | TRACE_EVENT(name,                                                            \
         | ^~~~~~~~~~~
   include/trace/../../arch/x86/kvm/trace.h:421:9: note: in expansion of macro 'TP_printk'
     421 |         TP_printk("vcpu %u reason %s%s%s rip 0x%lx info1 0x%016llx "         \
         |         ^~~~~~~~~
   include/trace/../../arch/x86/kvm/trace.h:386:9: note: in expansion of macro '__print_symbolic'
     386 |         __print_symbolic(exit_reason, SVM_EXIT_REASONS),                \
         |         ^~~~~~~~~~~~~~~~
   arch/x86/include/uapi/asm/svm.h:249:11: note: in expansion of macro 'SVM_EXIT_ERR'
     249 |         { SVM_EXIT_ERR,         "invalid_guest_state" }
         |           ^~~~~~~~~~~~
   include/trace/../../arch/x86/kvm/trace.h:386:39: note: in expansion of macro 'SVM_EXIT_REASONS'
     386 |         __print_symbolic(exit_reason, SVM_EXIT_REASONS),                \
         |                                       ^~~~~~~~~~~~~~~~
   include/trace/../../arch/x86/kvm/trace.h:425:19: note: in expansion of macro 'kvm_print_exit_reason'
     425 |                   kvm_print_exit_reason(__entry->exit_reason, __entry->isa), \
         |                   ^~~~~~~~~~~~~~~~~~~~~
   include/trace/../../arch/x86/kvm/trace.h:778:1: note: in expansion of macro 'TRACE_EVENT_KVM_EXIT'
     778 | TRACE_EVENT_KVM_EXIT(kvm_nested_vmexit);
         | ^~~~~~~~~~~~~~~~~~~~
   include/trace/../../arch/x86/kvm/trace.h: In function 'trace_raw_output_kvm_nested_vmexit_inject':
>> arch/x86/include/uapi/asm/svm.h:137:32: warning: conversion from 'long long unsigned int' to 'long unsigned int' changes value from '18446744073709551615' to '4294967295' [-Woverflow]
     137 | #define SVM_EXIT_ERR           -1ull
         |                                ^
   include/trace/trace_events.h:219:34: note: in definition of macro 'DECLARE_EVENT_CLASS'
     219 |         trace_event_printf(iter, print);                                \
         |                                  ^~~~~
   include/trace/trace_events.h:45:30: note: in expansion of macro 'PARAMS'
      45 |                              PARAMS(print));                   \
         |                              ^~~~~~
   include/trace/../../arch/x86/kvm/trace.h:783:1: note: in expansion of macro 'TRACE_EVENT'
     783 | TRACE_EVENT(kvm_nested_vmexit_inject,
         | ^~~~~~~~~~~
   include/trace/../../arch/x86/kvm/trace.h:808:9: note: in expansion of macro 'TP_printk'
     808 |         TP_printk("reason: %s%s%s ext_inf1: 0x%016llx "
         |         ^~~~~~~~~
   include/trace/../../arch/x86/kvm/trace.h:386:9: note: in expansion of macro '__print_symbolic'
     386 |         __print_symbolic(exit_reason, SVM_EXIT_REASONS),                \
         |         ^~~~~~~~~~~~~~~~
   arch/x86/include/uapi/asm/svm.h:249:11: note: in expansion of macro 'SVM_EXIT_ERR'
     249 |         { SVM_EXIT_ERR,         "invalid_guest_state" }
         |           ^~~~~~~~~~~~
   include/trace/../../arch/x86/kvm/trace.h:386:39: note: in expansion of macro 'SVM_EXIT_REASONS'
     386 |         __print_symbolic(exit_reason, SVM_EXIT_REASONS),                \
         |                                       ^~~~~~~~~~~~~~~~
   include/trace/../../arch/x86/kvm/trace.h:810:19: note: in expansion of macro 'kvm_print_exit_reason'
     810 |                   kvm_print_exit_reason(__entry->exit_code, __entry->isa),
         |                   ^~~~~~~~~~~~~~~~~~~~~


vim +137 arch/x86/include/uapi/asm/svm.h

   136	
 > 137	#define SVM_EXIT_ERR           -1ull
   138	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
