Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FBA530101F
	for <oe-kbuild-all@lists.linux.dev>; Wed, 18 Feb 2026 20:46:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771447578; cv=none; b=QpAwijCFeSqLElOm3Fo8SzjqbPsSaHBj5xMfFVpNUT9sNAlRUrCTv13M5xRh22zNYXsa0UhQ2AfTlbWxY7B2QAPONo/5b4dIMjgSZBO3QrX3/0qnvi9+h1nJrOhpu2mjDxKB++wJoALA9FIM4zPtNbRXr3Brfbfhh0kJQTcvRZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771447578; c=relaxed/simple;
	bh=GoT4gLQB+7mn1APcLSuR8UaE+eXU0tajzsJYzp+lSJ0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=LImneF5r3vna/IXZX7WFvRJyv6d8HOw0pAz/SiLYWLgbeJla/FwzOj8pqrMb/9T2HtB0pQKJrY2PlWS2rssUpILZZKbiw8hII8Mug3N2GT524PPwAjyPBcH+Kf1xEWamLfyD8ZZx2ntGT0KOpAUjTP7yZp7mSsP/kehH2czoZmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VNjjf+Pp; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VNjjf+Pp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771447577; x=1802983577;
  h=date:from:to:cc:subject:message-id;
  bh=GoT4gLQB+7mn1APcLSuR8UaE+eXU0tajzsJYzp+lSJ0=;
  b=VNjjf+Pp/uPpS5RPb4Ady2UBhue4z11BjVcQDuyLKBkwKaivulGNYU8+
   o+xyzaKrhWjXJBodr/bbqXZtDkmPtlICGLqYnEhbFCg0yHvDll7MvGXtT
   yv+bZmUrhi8IMnxhI2lrVmiCY5a2jCZdM1X2OwICh2VCFnlacxBhjj6Wz
   UDjvveJH4dbLkNIRcOWF/+sMRPLz6cBjrBKCFIxSeFNPneSmy1KeRdAZg
   +byxpcMbx00kgmKhV0QXIWw5qPd407Z2mcwSei2MhP9eCQV4/qXAE653p
   vleEtTlhPol6nGgmKAiW4QM1PtUW/+cX6AC3C5a5zBekBxqluHwBXZqey
   w==;
X-CSE-ConnectionGUID: DbZwOsu3QYGqHNnGGCo8JQ==
X-CSE-MsgGUID: i3U0CC3rT+GkMq3kEiTnBQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11705"; a="60110060"
X-IronPort-AV: E=Sophos;i="6.21,298,1763452800"; 
   d="scan'208";a="60110060"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Feb 2026 12:46:17 -0800
X-CSE-ConnectionGUID: Y/6dKEP9TDaeyEZU6qg/8Q==
X-CSE-MsgGUID: hkZ2grFMS76UI6h6KK8v/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,299,1763452800"; 
   d="scan'208";a="212620227"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 18 Feb 2026 12:46:09 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vsoQw-000000012jA-3oNT;
	Wed, 18 Feb 2026 20:46:06 +0000
Date: Thu, 19 Feb 2026 04:45:40 +0800
From: kernel test robot <lkp@intel.com>
To: Kiryl Shutsemau <kas@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [kas:pte_size 26/27] arch/x86/mm/init_32.c:735:60: error:
 'HPTE_SIZE' undeclared; did you mean 'PTE_SIZE'?
Message-ID: <202602190402.6EOXxgrH-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kas/linux.git pte_size
head:   1903e57e83c0c0526b0ee193ce32e6aac90863af
commit: 7b50e42cc205cb7ea83bd812494786d350612fe7 [26/27] tmp
config: i386-allnoconfig (https://download.01.org/0day-ci/archive/20260219/202602190402.6EOXxgrH-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260219/202602190402.6EOXxgrH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602190402.6EOXxgrH-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/x86/mm/init_32.c: In function 'mark_nxdata_nx':
>> arch/x86/mm/init_32.c:735:60: error: 'HPTE_SIZE' undeclared (first use in this function); did you mean 'PTE_SIZE'?
     735 |         unsigned long size = (((unsigned long)__init_end + HPTE_SIZE) & HPAGE_MASK) - start;
         |                                                            ^~~~~~~~~
         |                                                            PTE_SIZE
   arch/x86/mm/init_32.c:735:60: note: each undeclared identifier is reported only once for each function it appears in


vim +735 arch/x86/mm/init_32.c

   724	
   725	static void mark_nxdata_nx(void)
   726	{
   727		/*
   728		 * When this called, init has already been executed and released,
   729		 * so everything past _etext should be NX.
   730		 */
   731		unsigned long start = PFN_ALIGN(_etext);
   732		/*
   733		 * This comes from is_x86_32_kernel_text upper limit. Also HPAGE where used:
   734		 */
 > 735		unsigned long size = (((unsigned long)__init_end + HPTE_SIZE) & HPAGE_MASK) - start;
   736	
   737		if (__supported_pte_mask & _PAGE_NX) {
   738			printk(KERN_INFO "NX-protecting the kernel data: %luk\n", size >> 10);
   739			set_memory_nx(start, size >> PTE_SHIFT);
   740		}
   741	}
   742	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
