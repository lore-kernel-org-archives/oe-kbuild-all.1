Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17D77219ED
	for <oe-kbuild-all@lists.linux.dev>; Sun, 29 Dec 2024 07:37:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735457831; cv=none; b=S6VeUyTk+QwuQzIUZtJX9MM4JOargSO1r8f8jtt2UtgI4eCv5kWuAyzjTrsIKz4v5t3oa/or5P9JWXJoPQSqWM4V9kf0F7cH9ej7QJWwZ96Mr8Mdkg835xlLR+empqhFM4X5LzXjV/VLM/5x+3iujDqvQHzIj9wMl/f12qWR8iM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735457831; c=relaxed/simple;
	bh=qmLYBHx2Iwgij/ea8jeHdaL/3msg2QNPLLBV8adrG6s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=k/M7kvY7FCPHa1i6N5epZSyaYmYZ8PJG8MVxLSBZtWSsJBpEgckHvPIOeiMCwRzmdz2v4Fqqs1W5FIGICbm0og4r92UkZc5Iz5lmshH1bHnsl0JMvB+bm2eY8r/KcgLhh8uePGM4APPa9rOjUH/pvaZ0Yv8XuVKE+g/ZVERh3Gg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=coAOkkWa; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="coAOkkWa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735457830; x=1766993830;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qmLYBHx2Iwgij/ea8jeHdaL/3msg2QNPLLBV8adrG6s=;
  b=coAOkkWaWQaeeVdFlS8XU5Dmep+JGLu1f4ectD7JVSlzl39OgVICo93M
   8tfQNuJJto0HrhrY/TMCQYG2wo1KXOhP90gMs6/8IgBq1ua+wjJQD2CcC
   nwzuDt1HykOwrh+bcQ2KS92dzr/pgSpQb2rw4IugTjDFTvv755ObUulEC
   4kJELzzg360V84vEcLS5tFWN2H29foqf42P3D4TnW05PwQvmjsLcnrItN
   ZxHBNSzlkp9mW19MqTLZTFh8hLfi7xDD/eRjs2tVowwDvox17KEadFZJK
   HY4IdSr8NtnfA3ZiafuroIKft8Ulk2FNF024PFLuzIuOk95DS+nGd7LqS
   g==;
X-CSE-ConnectionGUID: qu51eoVRS4+Z2gEo5Tajsg==
X-CSE-MsgGUID: XqR5EROgSxi776Lk5bHZRw==
X-IronPort-AV: E=McAfee;i="6700,10204,11299"; a="61155344"
X-IronPort-AV: E=Sophos;i="6.12,273,1728975600"; 
   d="scan'208";a="61155344"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Dec 2024 23:37:08 -0800
X-CSE-ConnectionGUID: tmiiU57RST6am0/5dXAnPg==
X-CSE-MsgGUID: Kt2IMAxQQveWi3jhhoA6Nw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="131459984"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 28 Dec 2024 23:37:07 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tRnrF-0004YW-1f;
	Sun, 29 Dec 2024 07:37:05 +0000
Date: Sun, 29 Dec 2024 15:36:38 +0800
From: kernel test robot <lkp@intel.com>
To: Xin3 Li <xin3.li@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [xinli-intel-fred-public:fix_sp_calculation 6/14]
 arch/x86/include/asm/msr.h:149:9: sparse: sparse: cast truncates bits from
 constant value (8000000000000000 becomes 0)
Message-ID: <202412291516.mwUYq2I4-lkp@intel.com>
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

tree:   https://github.com/xinli-intel/linux-fred-public.git fix_sp_calculation
head:   a0cabfa58f8dd9676bcc378ca8d5a77ea2eb751c
commit: 6ebb91ca8c107df651ecd668673761c860351f42 [6/14] x86/msr: Replace __wrmsr() with native_wrmsrl()
config: i386-randconfig-062-20241229 (https://download.01.org/0day-ci/archive/20241229/202412291516.mwUYq2I4-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241229/202412291516.mwUYq2I4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412291516.mwUYq2I4-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   arch/x86/hyperv/hv_init.c:73:20: sparse: sparse: cast removes address space '__iomem' of expression
   arch/x86/hyperv/hv_init.c:241:33: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   arch/x86/hyperv/hv_init.c:241:33: sparse:     expected void volatile [noderef] __iomem *addr
   arch/x86/hyperv/hv_init.c:241:33: sparse:     got void *
   arch/x86/hyperv/hv_init.c: note: in included file (through arch/x86/include/asm/tsc.h, arch/x86/include/asm/timex.h, include/linux/timex.h, ...):
>> arch/x86/include/asm/msr.h:149:9: sparse: sparse: cast truncates bits from constant value (8000000000000000 becomes 0)
--
   arch/x86/events/intel/uncore_snb.c: note: in included file (through arch/x86/include/asm/tsc.h, arch/x86/include/asm/timex.h, include/linux/timex.h, ...):
>> arch/x86/include/asm/msr.h:149:9: sparse: sparse: cast truncates bits from constant value (1000000ff becomes ff)
--
   arch/x86/events/intel/uncore_nhmex.c: note: in included file (through arch/x86/include/asm/tsc.h, arch/x86/include/asm/timex.h, include/linux/timex.h, ...):
>> arch/x86/include/asm/msr.h:149:9: sparse: sparse: cast truncates bits from constant value (8000000000000000 becomes 0)
>> arch/x86/include/asm/msr.h:149:9: sparse: sparse: cast truncates bits from constant value (8000000000000000 becomes 0)

vim +149 arch/x86/include/asm/msr.h

   142	
   143	/* Can be uninlined because referenced by paravirt */
   144	static inline void notrace
   145	native_write_msr(unsigned int msr, u32 low, u32 high)
   146	{
   147		u64 val = (u64)high << 32 | low;
   148	
 > 149		native_wrmsrl(msr, val);
   150	
   151		if (tracepoint_enabled(write_msr))
   152			do_trace_write_msr(msr, val, 0);
   153	}
   154	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
