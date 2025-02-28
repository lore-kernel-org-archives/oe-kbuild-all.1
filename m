Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C692C261579
	for <oe-kbuild-all@lists.linux.dev>; Fri, 28 Feb 2025 13:07:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740748052; cv=none; b=AWBAkg0ydxdm+PORqng2ictjNyafYl0Y72piTlH2oN1xT6puYtM3fPw+th2+HFKb5HMzBDSL1XWekmeh/kTrSgIara8LSzhR5WBKIv7qRHXJLkovYRLSFSkCDvhwjExOj2sBYrVygyIGcU57JeKpd20xZyKEhadTzmt1vNN0cOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740748052; c=relaxed/simple;
	bh=/qHOFsfL8bGD50MixBbjBUhwh2Gj0T79/jGiwg8sxOY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UhtIqPSJz5m8l/PmepZ/lhCmVD29rH3a4Rq5ApFnFXfy34br1NXCNtqAPgMmxASZ/W4Y+AtRC6QBvmUeigv4rbbVkg/Y2NJtyiRkJmHxPOtF533cO+T5GapOt4TcvtZdK99xlWmfKdibEBCOnhkn2tuzwy7te9rQVMJYHzvdz8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=idedWYjy; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="idedWYjy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740748051; x=1772284051;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/qHOFsfL8bGD50MixBbjBUhwh2Gj0T79/jGiwg8sxOY=;
  b=idedWYjydvZhgw3jpiQYNaX1QdXx5psZT4A2H/L2dvtuq+CYPVQSx5eG
   oSOJeqzDUrOVAKA4stcDcLSaAQlxesJG4UmwZ4FRyorU1UjuhjW3esWfl
   u+KAaqd7Mm44W5JI4qUT7F4enT3dp96HbGczh4DBvtvOztvc4ofm71ggc
   a4DDa5R0BVDM2lJztGGQUoIAUht2MVsWqGGMd3Tqh7tuCIcIEVTIBDW3Z
   /GUEzDk2LrnXbYBGsDksPgGSk2Spn/aNsnr0qjidC4nXYvP2AGIEBEDH5
   boXUY4ocY0eLDv8tPwSHX/j9YbEJdVDCqM1QnhkLeZPh9sLyE6udjNVeP
   A==;
X-CSE-ConnectionGUID: WhTU8ki3Q8OSpP13uMb94Q==
X-CSE-MsgGUID: ChdlhQF+Sli3ES5QKIGAMw==
X-IronPort-AV: E=McAfee;i="6700,10204,11359"; a="41802692"
X-IronPort-AV: E=Sophos;i="6.13,322,1732608000"; 
   d="scan'208";a="41802692"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Feb 2025 05:07:31 -0800
X-CSE-ConnectionGUID: njYjeutpT2WzoLJ7wtA/Sg==
X-CSE-MsgGUID: K0mODDnpQ4qD25IQR1Q+IA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="122563210"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 28 Feb 2025 05:07:29 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1to05O-000EvC-2i;
	Fri, 28 Feb 2025 13:07:26 +0000
Date: Fri, 28 Feb 2025 21:07:13 +0800
From: kernel test robot <lkp@intel.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jpoimboe:asm-call-constraint-fix 4/5]
 arch/x86/include/asm/mshyperv.h:145:57: error: expected ':' or ')' before
 string constant
Message-ID: <202502282113.TMGQZuLi-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git asm-call-constraint-fix
head:   a882d0410fb655d41b5c5158dcd1a720275cf505
commit: 8f0a744bb81e98286456e1f433565240cd66e440 [4/5] x86: Convert ASM_CALL_CONSTRAINT to input constraint
config: x86_64-buildonly-randconfig-003-20250228 (https://download.01.org/0day-ci/archive/20250228/202502282113.TMGQZuLi-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250228/202502282113.TMGQZuLi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502282113.TMGQZuLi-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/x86/hyperv/hv_apic.c:29:
   arch/x86/include/asm/mshyperv.h: In function '_hv_do_fast_hypercall8':
>> arch/x86/include/asm/mshyperv.h:145:57: error: expected ':' or ')' before string constant
     145 |                                      : "=a" (hv_status) "+c" (control),
         |                                                         ^~~~


vim +145 arch/x86/include/asm/mshyperv.h

   126	
   127	/* Fast hypercall with 8 bytes of input and no output */
   128	static inline u64 _hv_do_fast_hypercall8(u64 control, u64 input1)
   129	{
   130		u64 hv_status;
   131	
   132	#ifdef CONFIG_X86_64
   133		if (hv_isolation_type_tdx() && !hyperv_paravisor_present)
   134			return hv_tdx_hypercall(control, input1, 0);
   135	
   136		if (hv_isolation_type_snp() && !hyperv_paravisor_present) {
   137			__asm__ __volatile__(
   138					"vmmcall"
   139					: "=a" (hv_status), "+c" (control),
   140					  "+d" (input1)
   141					: ASM_CALL_CONSTRAINT
   142					: "cc", "r8", "r9", "r10", "r11");
   143		} else {
   144			__asm__ __volatile__(CALL_NOSPEC
 > 145					     : "=a" (hv_status) "+c" (control),
   146					       "+d" (input1)
   147					     : THUNK_TARGET(hv_hypercall_pg)
   148					       COMMA(ASM_CALL_CONSTRAINT)
   149					     : "cc", "r8", "r9", "r10", "r11");
   150		}
   151	#else
   152		{
   153			u32 input1_hi = upper_32_bits(input1);
   154			u32 input1_lo = lower_32_bits(input1);
   155	
   156			__asm__ __volatile__ (CALL_NOSPEC
   157					      : "=A"(hv_status), "+c"(input1_lo)
   158					      :	"A" (control), "b" (input1_hi),
   159						THUNK_TARGET(hv_hypercall_pg)
   160						COMMA(ASM_CALL_CONSTRAINT)
   161					      : "cc", "edi", "esi");
   162		}
   163	#endif
   164			return hv_status;
   165	}
   166	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
