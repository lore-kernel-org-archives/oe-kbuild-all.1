Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1454037F8C6
	for <oe-kbuild-all@lists.linux.dev>; Thu, 30 Apr 2026 23:29:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777591770; cv=none; b=G9UtSFExo+d5RZJvqMGyutiQkZ1BiNS84nXZYcfAG2G548JP37KOqpALorbs80Fy/CXAwTBduesE31xEZqHfU12vkD+tqq8GIBguDVcizSyC8QzdfKD8+BwA+tdz2r0BYNZxdOGZdceWxZgOFRHT0bVBePtPRH29riuFOD+OI4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777591770; c=relaxed/simple;
	bh=qhkcgeMgrR1v9X7xr/bmd2xaexzFDtATw8Pci4HhO7I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=j9BksE9jlPL26rMisxPApYL2mu+IaiD9iYganuSrRcr9gfqcrresfMk1mY9k4LkdsceLPNUj3GcGCbmKSbQAdfCaaV92X/Ehb6KMiAz56gDM0s7tMkEx7fNhh+S4biXcSAMuwMvbGuPBYg6EIDutrvhftZhEdhG4o9YAatDWJbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aOfok+sV; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aOfok+sV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777591769; x=1809127769;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qhkcgeMgrR1v9X7xr/bmd2xaexzFDtATw8Pci4HhO7I=;
  b=aOfok+sVJOuQ/Z/kr7AelKqWPxv0YkMD7/SpOQhkWygFDxWL/QPiAMiN
   O1QJiKgrfDg7N2Sst7iezoEbe1qDMqjZAUhIEVlyduvQYWf9hDRuxF4UR
   X1lQSMrxAaQrReOBb2as7cyhx2F3rNy5iswdl1fFviZNEYa5ecUf9Jdgy
   kOHtISjL1LoJBPnhfrLhX5KioXE2tB4mkWtHlaaHagmXXOd6KruMTmB7C
   wlTBP6xrv9G4XXD1f0nIyOHjklUCrzKsiHQ73flatc2h268obnziM8Yyq
   solHafyB4wvRywivfNwew7AeAdE+0QTcb398D6wigP19bqFm6caRYqnpJ
   A==;
X-CSE-ConnectionGUID: N/cPRgC5QHmH/cCZs9nkjA==
X-CSE-MsgGUID: W/DYNwqvReSrAzGL4Qbxvw==
X-IronPort-AV: E=McAfee;i="6800,10657,11772"; a="78426681"
X-IronPort-AV: E=Sophos;i="6.23,209,1770624000"; 
   d="scan'208";a="78426681"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2026 16:29:28 -0700
X-CSE-ConnectionGUID: ExbgmbjrSGqX2ZFLxVlypA==
X-CSE-MsgGUID: iCF+xM8hRcaUSvMELVSizg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,209,1770624000"; 
   d="scan'208";a="239046780"
Received: from lkp-server01.sh.intel.com (HELO aa799cca880d) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 30 Apr 2026 16:29:27 -0700
Received: from kbuild by aa799cca880d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wIaot-00000000D4u-3CeA;
	Thu, 30 Apr 2026 23:29:23 +0000
Date: Fri, 01 May 2026 07:28:27 +0800
From: kernel test robot <lkp@intel.com>
To: "Christian =?utf-8?Q?K=C3=B6nig"?= <christian.koenig@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Boris Brezillon <bbrezillon@kernel.org>
Subject: drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_fence.c:95:20:
 sparse: sparse: incompatible types in comparison expression (different
 address spaces):
Message-ID: <202605010713.u3viFnvV-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   08d0d3466664000ba0670e0ef0d447f23459e0d4
commit: f4cc3ab824d6772a48ca9d9c74ac623b3309985d dma-buf: protected fence ops by RCU v8
date:   9 weeks ago
config: x86_64-randconfig-122-20260430 (https://download.01.org/0day-ci/archive/20260501/202605010713.u3viFnvV-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260501/202605010713.u3viFnvV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: f4cc3ab824d6 ("dma-buf: protected fence ops by RCU v8")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605010713.u3viFnvV-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_fence.c: note: in included file (through include/linux/i2c.h, drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgpu_ras_eeprom.h, drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgpu_ras.h, ...):
   include/linux/acpi.h:69:18: sparse: sparse: Expected ) in function call
   include/linux/acpi.h:69:18: sparse: sparse: got ,
   include/linux/acpi.h:69:18: sparse: sparse: Expected ) in function call
   include/linux/acpi.h:69:18: sparse: sparse: got ,
   include/linux/acpi.h:69:18: sparse: sparse: Expected ) in function call
   include/linux/acpi.h:69:18: sparse: sparse: got ,
   drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_fence.c:70:17: sparse: sparse: Expected ) in function call
   drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_fence.c:70:17: sparse: sparse: got ,
   drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_fence.c:70:17: sparse: sparse: Expected ) in function call
   drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_fence.c:70:17: sparse: sparse: got ,
   drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_fence.c:70:17: sparse: sparse: Expected ) in function call
   drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_fence.c:70:17: sparse: sparse: got ,
   drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_fence.c:70:17: sparse: sparse: undefined identifier '_res'
   drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_fence.c:70:17: sparse: sparse: undefined identifier '__VA_OPT__'
   drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_fence.c:70:17: sparse: sparse: undefined identifier '_res'
   drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_fence.c:70:17: sparse: sparse: undefined identifier '__VA_OPT__'
   drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_fence.c:70:17: sparse: sparse: undefined identifier '_res'
>> drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_fence.c:95:20: sparse: sparse: incompatible types in comparison expression (different address spaces):
   drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_fence.c:95:20: sparse:    struct dma_fence_ops const [noderef] __rcu *
   drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_fence.c:95:20: sparse:    struct dma_fence_ops const *

vim +95 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_fence.c

d8d019ccffb838 Felix Kuehling       2018-02-06   86  
d8d019ccffb838 Felix Kuehling       2018-02-06   87  struct amdgpu_amdkfd_fence *to_amdgpu_amdkfd_fence(struct dma_fence *f)
d8d019ccffb838 Felix Kuehling       2018-02-06   88  {
d8d019ccffb838 Felix Kuehling       2018-02-06   89  	struct amdgpu_amdkfd_fence *fence;
d8d019ccffb838 Felix Kuehling       2018-02-06   90  
d8d019ccffb838 Felix Kuehling       2018-02-06   91  	if (!f)
d8d019ccffb838 Felix Kuehling       2018-02-06   92  		return NULL;
d8d019ccffb838 Felix Kuehling       2018-02-06   93  
d8d019ccffb838 Felix Kuehling       2018-02-06   94  	fence = container_of(f, struct amdgpu_amdkfd_fence, base);
bf2ad4fb8adca8 Srinivasan Shanmugam 2023-12-27  @95  	if (f->ops == &amdkfd_fence_ops)
d8d019ccffb838 Felix Kuehling       2018-02-06   96  		return fence;
d8d019ccffb838 Felix Kuehling       2018-02-06   97  
d8d019ccffb838 Felix Kuehling       2018-02-06   98  	return NULL;
d8d019ccffb838 Felix Kuehling       2018-02-06   99  }
d8d019ccffb838 Felix Kuehling       2018-02-06  100  

:::::: The code at line 95 was first introduced by commit
:::::: bf2ad4fb8adca89374b54b225d494e0b1956dbea drm/amdgpu: Drop 'fence' check in 'to_amdgpu_amdkfd_fence()'

:::::: TO: Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>
:::::: CC: Alex Deucher <alexander.deucher@amd.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
