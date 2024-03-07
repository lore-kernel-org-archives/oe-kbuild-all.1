Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3CC91BF54
	for <oe-kbuild-all@lists.linux.dev>; Thu,  7 Mar 2024 22:31:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709850687; cv=none; b=cIGFmdzx8cs4fTIrCfDiMBGpnk/IcreHys5qgCcw+io6EdVohrYy5Be8a6n0kiBivlsSwOyZyHIv9Qe2UxM9dJHH2Y2BEVWutl8F17JRiIRCi3MonnJrJnqiUgZQ7LpsM0LyZfGFIdV7XrddCqJeoqf+H5C14C3TwgTVmu3eeJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709850687; c=relaxed/simple;
	bh=+2H4LSgPG5AAvq77QlDGUCQaLVGZVcqatNr5pyZTj5c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=n266LJD2/cqYcClKfz7m96+LgV44uhIvJwwfR1sCGE+kxlB86HDR4MrZmOuUitpfxajQABCeptbEroFDGVRuogCwp4WsiDav+DuQhyq2Dh+6Dx7rMYRgncVxCEIk0Xqo92HL69gnfWzoThbB89u1E9XVrbHTvlgPGx1UjMzkAEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZXSXCO0F; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZXSXCO0F"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709850686; x=1741386686;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+2H4LSgPG5AAvq77QlDGUCQaLVGZVcqatNr5pyZTj5c=;
  b=ZXSXCO0FvjBsUlNmdeXZmWgQaUhvB/Mzjl/gusBUKbjLkDuva4OcnBc5
   TcvoWVOq65AiA1Mb2UPK5BVWOV5Z3lNmCnRXsJzXpUop1ANxZT4mlzBG9
   IjfeQomyY4pyu5yFyFCPsGMbGTC+FKUdBlaMm0iCZoBGETY0qcbEev31U
   ss4DbNq4xzSkuS9i3im+tRLnIxea2pvaFp0h+zD68UqIgGjQbg8rV/xsX
   Dvuw64jus43kep08jVXvazXpKohAfe4paTkzMCazY5WYx+T8gGkvV/39e
   XiJBR+JHLJrL8GqVLL8wMnT47hpVot4IX84x2O1iP4H225OtOJCqlIBVx
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11006"; a="8371714"
X-IronPort-AV: E=Sophos;i="6.07,107,1708416000"; 
   d="scan'208";a="8371714"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2024 14:31:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,107,1708416000"; 
   d="scan'208";a="10320297"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 07 Mar 2024 14:31:23 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1riMGm-0005lN-31;
	Thu, 07 Mar 2024 22:31:20 +0000
Date: Fri, 8 Mar 2024 06:31:08 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Aubrey Li <aubrey.li@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 28904/30000] arch/x86/kernel/cpu/common.c:92:16:
 sparse: sparse: incorrect type in initializer (different address spaces)
Message-ID: <202403080622.uNLahRYD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   70c98c7d4aac402e0ad746c4312d808d7495c50b
commit: f4128ae8e6ff03b4c805707fe75d0345797f7f53 [28904/30000] sched: Add cluster scheduler level for x86
config: x86_64-randconfig-121-20240307 (https://download.01.org/0day-ci/archive/20240308/202403080622.uNLahRYD-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240308/202403080622.uNLahRYD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403080622.uNLahRYD-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> arch/x86/kernel/cpu/common.c:92:16: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got unsigned short * @@
   arch/x86/kernel/cpu/common.c:92:16: sparse:     expected void const [noderef] __percpu *__vpp_verify
   arch/x86/kernel/cpu/common.c:92:16: sparse:     got unsigned short *
   arch/x86/kernel/cpu/common.c:1901:1: sparse: sparse: symbol 'fixed_percpu_data' redeclared with different type (different address spaces):
   arch/x86/kernel/cpu/common.c:1901:1: sparse:    struct fixed_percpu_data [addressable] [noderef] [toplevel] __percpu fixed_percpu_data
   arch/x86/kernel/cpu/common.c: note: in included file (through arch/x86/include/asm/cpufeature.h, arch/x86/include/asm/thread_info.h, include/linux/thread_bits.h, ...):
   arch/x86/include/asm/processor.h:470:1: sparse: note: previously declared as:
   arch/x86/include/asm/processor.h:470:1: sparse:    struct fixed_percpu_data extern [addressable] [toplevel] fixed_percpu_data
   arch/x86/kernel/cpu/common.c:144:43: sparse: sparse: cast truncates bits from constant value (fffff becomes ffff)
   arch/x86/kernel/cpu/common.c:145:43: sparse: sparse: cast truncates bits from constant value (fffff becomes ffff)
   arch/x86/kernel/cpu/common.c:146:43: sparse: sparse: cast truncates bits from constant value (fffff becomes ffff)
   arch/x86/kernel/cpu/common.c:147:43: sparse: sparse: cast truncates bits from constant value (fffff becomes ffff)
   arch/x86/kernel/cpu/common.c:148:43: sparse: sparse: cast truncates bits from constant value (fffff becomes ffff)
   arch/x86/kernel/cpu/common.c:149:43: sparse: sparse: cast truncates bits from constant value (fffff becomes ffff)
   arch/x86/include/asm/processor.h:474:31: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got char ( * )[40] @@
   arch/x86/include/asm/processor.h:474:31: sparse:     expected void const [noderef] __percpu *__vpp_verify
   arch/x86/include/asm/processor.h:474:31: sparse:     got char ( * )[40]

vim +92 arch/x86/kernel/cpu/common.c

f8b64d08dde271 Borislav Petkov 2018-04-27  89  
6f01df96c462b7 Kim Phillips    2021-08-17  90  u16 get_llc_id(unsigned int cpu)
6f01df96c462b7 Kim Phillips    2021-08-17  91  {
6f01df96c462b7 Kim Phillips    2021-08-17 @92  	return per_cpu(cpu_llc_id, cpu);
6f01df96c462b7 Kim Phillips    2021-08-17  93  }
6f01df96c462b7 Kim Phillips    2021-08-17  94  EXPORT_SYMBOL_GPL(get_llc_id);
6f01df96c462b7 Kim Phillips    2021-08-17  95  

:::::: The code at line 92 was first introduced by commit
:::::: 6f01df96c462b77915b27d404152c47e75e879cf x86/cpu: Add get_llc_id() helper function

:::::: TO: Kim Phillips <kim.phillips@amd.com>
:::::: CC: Xie Haocheng <haocheng.xie@amd.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
