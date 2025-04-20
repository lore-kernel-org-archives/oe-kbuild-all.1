Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3425EFC1D
	for <oe-kbuild-all@lists.linux.dev>; Sun, 20 Apr 2025 16:28:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745166501; cv=none; b=JJ+enNXBqtEaAzuOehaNzuD0t9POcY6tJaF5UKSxSnXjkwLo7xkuNMmy3JdKzcOhMeFedmFmWobYTzMR9H1GExXvquh8hujXU3MxuwOoDiD2Pk4S4VkaUjcW/S+y6K4iRtSKmYM2oGF9FmJ934F9BGo3d59/NokaGFylkAWxf0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745166501; c=relaxed/simple;
	bh=7NdfwfLaySDokIlBpSJIO6VuAVOAfExeultdgyCo1EU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QMg9n6WdWGlt+XQXP0gtRpi5bQjUSbekSmxxwxRbBPldncJSrPefOZ0FIx5nv2wXnKitplQI2o6y2dkAiT/ZHHnTzlvJW7dvmDJYqUWB8SMdaPVEeDvNR0MQ0AyZb4Q+6pzpJfQ5zuXtZJgDS+FmrQfOFAhZbun2jAa0lv4esio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iJBJiyGP; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iJBJiyGP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745166499; x=1776702499;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7NdfwfLaySDokIlBpSJIO6VuAVOAfExeultdgyCo1EU=;
  b=iJBJiyGPaQhKBfX4KtQ/cMGIoJFx8UWbty94JHX/p0TAYpzqEbzuJI0t
   Hb3zHHr49kv/b1NowqIUvRoKRbNGPpoBpTEAVrvHrWy6RAkBU5cf+ytVb
   sPJyciKWGqbGeaAoUKIFplMrcloXKDZHZ7H/j9BTi7+MUoz9pikkXyTuy
   BxVuIhmGRgDEPtohsKkl1t/JafT066uescEy+ijCBIlF6Z3HgtX9F0WZ5
   hcgpUpn1rcK1HjVRPiEmhRdF2CjNv2U4OhBlS4/uVMvDmPpvhspQEEUgQ
   Hspg5/txNg/+LzPFPruh7LT2EIcbVjOlHY1ivQ7NvcaNf22kDbaKhpIuB
   A==;
X-CSE-ConnectionGUID: jmMedGLxRWewKugaAMjx/Q==
X-CSE-MsgGUID: ZktSViMMRDyFqy0CIWaiTQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11409"; a="50545412"
X-IronPort-AV: E=Sophos;i="6.15,225,1739865600"; 
   d="scan'208";a="50545412"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Apr 2025 09:28:17 -0700
X-CSE-ConnectionGUID: itCVpjoKSNKIs2x0Hzd8IQ==
X-CSE-MsgGUID: 8CD0/9/PQU+eL+ONnrBgbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,225,1739865600"; 
   d="scan'208";a="162572360"
Received: from lkp-server01.sh.intel.com (HELO 61e10e65ea0f) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 20 Apr 2025 09:28:16 -0700
Received: from kbuild by 61e10e65ea0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u6XWg-0004ll-1i;
	Sun, 20 Apr 2025 16:28:14 +0000
Date: Mon, 21 Apr 2025 00:27:32 +0800
From: kernel test robot <lkp@intel.com>
To: Xin3 Li <xin3.li@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [xinli-intel-fred-public:intel-lkp 28/33]
 arch/x86/boot/startup/sme.c:526:21: error: call to undeclared function
 'native_rdmsrq_no_trace'; ISO C99 and later do not support implicit function
 declarations
Message-ID: <202504210033.fR64QUHJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Xin,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://github.com/xinli-intel/linux-fred-public.git intel-lkp
head:   f604e42e902e74ab0c1001bff2f8a54a741dc2d6
commit: cf36206c4419d9ea9855c3095b0d45b71e7db7e3 [28/33] x86/msr: Rename native_rdmsrq() to native_rdmsrq_no_trace()
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20250421/202504210033.fR64QUHJ-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250421/202504210033.fR64QUHJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504210033.fR64QUHJ-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/x86/boot/startup/sme.c:526:21: error: call to undeclared function 'native_rdmsrq_no_trace'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     526 |         sev_status = msr = native_rdmsrq_no_trace(MSR_AMD64_SEV);
         |                            ^
   1 error generated.


vim +/native_rdmsrq_no_trace +526 arch/x86/boot/startup/sme.c

   507	
   508		/*
   509		 * Check for the SME/SEV feature:
   510		 *   CPUID Fn8000_001F[EAX]
   511		 *   - Bit 0 - Secure Memory Encryption support
   512		 *   - Bit 1 - Secure Encrypted Virtualization support
   513		 *   CPUID Fn8000_001F[EBX]
   514		 *   - Bits 5:0 - Pagetable bit position used to indicate encryption
   515		 */
   516		eax = 0x8000001f;
   517		ecx = 0;
   518		native_cpuid(&eax, &ebx, &ecx, &edx);
   519		/* Check whether SEV or SME is supported */
   520		if (!(eax & (AMD_SEV_BIT | AMD_SME_BIT)))
   521			return;
   522	
   523		me_mask = 1UL << (ebx & 0x3f);
   524	
   525		/* Check the SEV MSR whether SEV or SME is enabled */
 > 526		sev_status = msr = native_rdmsrq_no_trace(MSR_AMD64_SEV);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
