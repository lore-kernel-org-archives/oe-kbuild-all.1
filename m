Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1177A30DECC
	for <oe-kbuild-all@lists.linux.dev>; Sun, 30 Aug 2026 22:49:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788130191; cv=none; b=OKOQsyhgLMe8CD7icfqZWkOckSrbgrCs2+e1GsN9CSyUFs4frzzOQo1EMPCq9/Lfn/pWfwVMSPMOoFsNl3hIq1+VMRC8T5z6PJ5SvEOYdZw9F1C1I2Odbt9RevZs0kz0dR2xawdWq09tgD5tVL7oBeL3y/ldxjaZ+AReVrxYFuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788130191; c=relaxed/simple;
	bh=2Td0vZLkFvxsUvZuoncdZkmKA1CuP87fs3RZsCCjN2A=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Fc8wa14vI6/zjgRURtZcYsPNifE9L21CI5b9o3MQ8KgHuWO+xd9UQfoAjg+wUl0ChPkhM5CeezKFQsE/X5WFFQRpJ8nvRQP9HVr6OgOTCa2yVuZp+TUe3FElDXWlB7qiCH6YzCgFlHKhcpuEaxfnjCGn+xw8V51HmwKBYaeLkrw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ejw3C3Vk; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ejw3C3Vk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788130188; x=1819666188;
  h=date:from:to:cc:subject:message-id;
  bh=2Td0vZLkFvxsUvZuoncdZkmKA1CuP87fs3RZsCCjN2A=;
  b=ejw3C3Vk3V3nUz6tNaMy1cunGoufo25Zml+EnM9mT7TpAeNwC3mKAtCG
   oz9c/QRC6ylVLxb0pA9WxI2ys9Qf0dRjBSsJh0jHEiQ0QmfiT4DWrHg5l
   VAVqBMGChHCXlp6v2KTYQhsutt+pwdNoRNyGVhdKuP1A0nDzFja88lnNH
   y4wujLF409tTiYZsAHz3OOoC57KfLQLDtLtm0u2XI01CTZyTiHOnC7rk3
   DbtxTbv2rhZ8JYZth3ySydp5A4GQtI0LE5Vfn5iKqznexjsMFUFlGdCP+
   b+ocs1tc2T+ANTW3mLF70QvmIsddPl4IccoRUnhSpYEBtruxJOIVyKNeK
   Q==;
X-CSE-ConnectionGUID: TSxjjInPQWyluGbXfLgqug==
X-CSE-MsgGUID: zi+SKYZmRpyNW21aV4JLEw==
X-IronPort-AV: E=McAfee;i="6800,10657,11891"; a="100048718"
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; 
   d="scan'208";a="100048718"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2026 15:49:48 -0700
X-CSE-ConnectionGUID: pGCdFtbjQcu0agyWTJ9pwA==
X-CSE-MsgGUID: MiGmiFL1RACeldnEf4gUQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; 
   d="scan'208";a="272152335"
Received: from lkp-server01.sh.intel.com (HELO 12c799cf0c09) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 30 Aug 2026 15:49:47 -0700
Received: from kbuild by 12c799cf0c09 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x0oLH-00000000077-10zd;
	Sun, 30 Aug 2026 22:49:40 +0000
Date: Mon, 31 Aug 2026 06:48:52 +0800
From: kernel test robot <lkp@intel.com>
To: steven@liquorix.net
Cc: oe-kbuild-all@lists.linux.dev
Subject: [zen:7.2/vramstuff 7/29] Warning:
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:229 function parameter 'vm_bo' not
 described in 'amdgpu_vm_bo_needs_eviction'
Message-ID: <202608310602.aDXqjqYm-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/zen-kernel/zen-kernel 7.2/vramstuff
head:   13a8e2000329a36f994acf2fd31d307d27fa9189
commit: 2388ecc6c08a3f8bc3509809b955571433de2561 [7/29] drm/amdgpu: Track suboptimal always-valid BOs in soft-evicted state
config: x86_64-rhel-9.4-ltp (https://download.01.org/0day-ci/archive/20260831/202608310602.aDXqjqYm-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260831/202608310602.aDXqjqYm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608310602.aDXqjqYm-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:229 function parameter 'vm_bo' not described in 'amdgpu_vm_bo_needs_eviction'
>> Warning: drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:229 Excess function parameter 'base' description in 'amdgpu_vm_bo_needs_eviction'
>> Warning: drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:229 function parameter 'vm_bo' not described in 'amdgpu_vm_bo_needs_eviction'
>> Warning: drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:229 Excess function parameter 'base' description in 'amdgpu_vm_bo_needs_eviction'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
