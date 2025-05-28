Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3664321D594
	for <oe-kbuild-all@lists.linux.dev>; Wed, 28 May 2025 20:00:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748462449; cv=none; b=J/qzRkBG3M3DiN7O2MeOxac/e8wDWMm5VwttPod1wbjTbzmmVwDQmEjNYHAKjTKNE4JG+zf5FY3uESyXFkz3YIHUwkRFnxtucEceyFurk7fmWjeYSTNjgG6M4PNHVaLwvz+w72ZT8dqoIlv5FF0AmEYNltb6EWiHs+eUdU9llQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748462449; c=relaxed/simple;
	bh=WQA2rri+rYPFAdc8qrKwH0tP7+ENpxsLdNEQ/3CKHPI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gFYf4WghXFLdC2BlXbqHXGONy4tRjV6zkqn92Nw+M7w6nE0nNSRLuAZ4jlwJ6/3SxDYJfmucwW6r4ojUCynXRuQ77QXTNPZcwAbR/l75rI8xvDP2XAT0XCRHIhq9UZ4E4R9txhk7am7Xq4HxMfwfeJOZ1oBiVVl+iml9V3a1ifc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lj9M4gCn; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lj9M4gCn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748462447; x=1779998447;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WQA2rri+rYPFAdc8qrKwH0tP7+ENpxsLdNEQ/3CKHPI=;
  b=lj9M4gCnouxSUa0/OxJQdhXS5rbqpSmYoczOWmCJ3MRO3a0HDIHY4UEh
   S7+k4wXrRSc82KqaX6MGGgVm9B8IaZ9uYSt5OQzUY6brFDa82jru3fnEl
   XXLMpaDym3xp6X0qCNGM5Lfft2d6a9K9gogck486Ogyj2yblNFBImmN+C
   gZHZDEkGY22qt7KbJxZPdTzVtmww80dmF/hPl/KzgHKAuS8JwDgUvj0T2
   jVE6rstYj3Cr2IeUCOcXXbJeGmbdHhPcvl+e7figJwVO0Wtadevt6mDTy
   gN2udcS8rzUZZbKxiWQZLYYy6Dt932oEsjrfk7KOIJXwK7i1t+Bfpa7j1
   g==;
X-CSE-ConnectionGUID: rnIOtlFQSey5cZY9xVPfPQ==
X-CSE-MsgGUID: FEmAmkOUTJq4AvcmJYpLBw==
X-IronPort-AV: E=McAfee;i="6700,10204,11447"; a="68055920"
X-IronPort-AV: E=Sophos;i="6.15,322,1739865600"; 
   d="scan'208";a="68055920"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2025 13:00:46 -0700
X-CSE-ConnectionGUID: 3fOYPIYSTNWjp0KC7VZkJA==
X-CSE-MsgGUID: poWqHeKDQY+raA2gtOZKeQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,322,1739865600"; 
   d="scan'208";a="144313775"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 28 May 2025 13:00:46 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uKMx9-000W24-1z;
	Wed, 28 May 2025 20:00:43 +0000
Date: Thu, 29 May 2025 04:00:13 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, GONG Ruiqi <gongruiqi1@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2331/2331] arch/x86/kernel/cpu/bpf-rvi.c:129:25:
 warning: no previous prototype for function 'bpf_arch_flags'
Message-ID: <202505290337.UpMv109S-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   66b0cef2a959be1562a528e3d8cc260dc3803e61
commit: c7103b690d364f20ccabd4acc558fa4a4b293364 [2331/2331] bpf: Add bpf_arch_flags kunc for x86
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20250529/202505290337.UpMv109S-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250529/202505290337.UpMv109S-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505290337.UpMv109S-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/x86/kernel/cpu/bpf-rvi.c:129:25: warning: no previous prototype for function 'bpf_arch_flags' [-Wmissing-prototypes]
     129 | __bpf_kfunc const char *bpf_arch_flags(enum arch_flags_type t, int i)
         |                         ^
   arch/x86/kernel/cpu/bpf-rvi.c:129:19: note: declare 'static' if the function is not intended to be used outside of this translation unit
     129 | __bpf_kfunc const char *bpf_arch_flags(enum arch_flags_type t, int i)
         |                   ^
         |                   static 
   1 warning generated.


vim +/bpf_arch_flags +129 arch/x86/kernel/cpu/bpf-rvi.c

   128	
 > 129	__bpf_kfunc const char *bpf_arch_flags(enum arch_flags_type t, int i)
   130	{
   131		switch (t) {
   132		case X86_CAP:
   133			return x86_cap_flags[i];
   134		case X86_BUG:
   135			return x86_bug_flags[i];
   136		case X86_POWER:
   137			return x86_power_flags[i];
   138		case X86_POWER_SIZE:
   139			return (void *)ARRAY_SIZE(x86_power_flags);
   140		default:
   141			return NULL;
   142		}
   143	}
   144	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
