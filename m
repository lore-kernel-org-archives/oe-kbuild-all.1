Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAD3CBE65
	for <oe-kbuild-all@lists.linux.dev>; Sat,  7 Jun 2025 22:09:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749334184; cv=none; b=IFrJuGnvhb6EDmo70JZuw2eUNNU1pcMwA/8442+nXA68/7sHjpuJ4gpbZVYE9cTWMGwLbs5o2P+CXlfSLkWeycifQ2Rt/zjRGX+iL9OQ6xJ+G/o6jHN251wH8qqhX4YnLBpWj4Q/PPc283e0yDMm48Ajyjv7uomEUPecbSlu/AI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749334184; c=relaxed/simple;
	bh=bqjw4S3qbK5OXLjEQ4GwnR7GCnlb8mwXnBC0yK0RARk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EYzityNklxn/8Vkel9KPWOwkTT7AZqGSurOD1AH5xUjOf4KoOD8fa0gtj1Rvn6u9hkRezVRlPxJSxMJfOo5mWB/N4Hfc7t8R44GRC315t1+s6zHGi1LmCQQylnYdQcRxHIDO1HHt/QBCvbgXXVoqdQeNZD0TEfYlijlVUmFk7F0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KXyKniwd; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KXyKniwd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749334183; x=1780870183;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bqjw4S3qbK5OXLjEQ4GwnR7GCnlb8mwXnBC0yK0RARk=;
  b=KXyKniwdmyQEVznR0HrHv2EvL3uUR9PIbELD1KiNbdyxrpqQEcu3q4vp
   +jln5pHC/AkQdUqQmSqEf753PWU5ktMdu2awmQ3kAHeUCJXpLvEQ06CV+
   fzfAv4IXnmNlCf8/MwKUfzo3lromeCNbMcdAA+eVviw2PqLX70iIr4foS
   XJ/hyMaNIRKPOwqxJltORF4QyXBsMXtaZrZR5kBRLJBTcfunKCTANF7Ni
   UX7nOpNhuSI1k5XWEidrCZ98k51j38XYMhifWFQbT/iCeuSAdb8sKVgV0
   Xwo4sgURxQ3JENllSWVD4DsCJK0Ifla5WNwSPo2DC49b7Ape83842VdhD
   Q==;
X-CSE-ConnectionGUID: ziqyMFYLQC+WLmLFdocYZQ==
X-CSE-MsgGUID: QvzHGaVDT9edKPQ8BYResQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11457"; a="51334153"
X-IronPort-AV: E=Sophos;i="6.16,219,1744095600"; 
   d="scan'208";a="51334153"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jun 2025 15:09:42 -0700
X-CSE-ConnectionGUID: 8aU6l0hwQuaJSoYcf0JuTQ==
X-CSE-MsgGUID: uPwshCgBSvCAzIc/VxODag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,219,1744095600"; 
   d="scan'208";a="177087164"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 07 Jun 2025 15:09:42 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uO1jP-00063D-00;
	Sat, 07 Jun 2025 22:09:39 +0000
Date: Sun, 8 Jun 2025 06:08:52 +0800
From: kernel test robot <lkp@intel.com>
To: Xin3 Li <xin3.li@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [xinli-intel-fred-public:intel-lkp 8/21]
 arch/x86/include/asm/msr-xen.h:26:17: error: invalid output size for
 constraint '=a'
Message-ID: <202506080651.tccBVnlE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/xinli-intel/linux-fred-public.git intel-lkp
head:   c51b6cfbe618f75b4ccf351866386968eefcf9dc
commit: efba94a084eadc719b80ced7ebb61d97fcf3e00b [8/21] x86/msr: Utilize the alternatives mechanism to read MSR
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20250608/202506080651.tccBVnlE-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250608/202506080651.tccBVnlE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506080651.tccBVnlE-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/x86/entry/vdso/vdso32/vclock_gettime.c:4:
   In file included from arch/x86/entry/vdso/vdso32/../vclock_gettime.c:11:
   In file included from include/linux/time.h:60:
   In file included from include/linux/time32.h:13:
   In file included from include/linux/timex.h:67:
   In file included from arch/x86/include/asm/timex.h:6:
   In file included from arch/x86/include/asm/tsc.h:11:
   In file included from arch/x86/include/asm/msr.h:13:
>> arch/x86/include/asm/msr-xen.h:26:17: error: invalid output size for constraint '=a'
      26 |                 : [val] "=a" (*val), ASM_CALL_CONSTRAINT
         |                               ^
   arch/x86/include/asm/msr-xen.h:53:10: error: invalid input size for constraint 'a'
      53 |                 : "a" (val), "c" (msr), [type] "i" (type)
         |                        ^
   2 errors generated.


vim +26 arch/x86/include/asm/msr-xen.h

    16	
    17	/* No plan to support immediate form MSR instructions in Xen */
    18	static __always_inline bool __xenpv_rdmsrq(u32 msr, u64 *val, int type)
    19	{
    20		BUG_ON(!cpu_feature_enabled(X86_FEATURE_XENPV));
    21	
    22		asm_inline volatile goto(
    23			"1: call asm_xen_read_msr\n\t"
    24			_ASM_EXTABLE_TYPE(1b, %l[badmsr], %c[type])	/* For CALL */
    25	
  > 26			: [val] "=a" (*val), ASM_CALL_CONSTRAINT
    27			: "c" (msr), [type] "i" (type)
    28			: "rdx"
    29			: badmsr);
    30	
    31		return false;
    32	
    33	badmsr:
    34		*val = 0;
    35	
    36		return true;
    37	}
    38	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
