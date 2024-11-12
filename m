Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D65C206040
	for <oe-kbuild-all@lists.linux.dev>; Tue, 12 Nov 2024 16:27:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731428859; cv=none; b=LePcua9i8lsM90QqIpQltc5dp3hZQHEED+/KxCknP2MT1DX5Dc5V05Z3/j5IUFlzX9VtzWDl9mv8G+y/5Wk+0363E8lIrLhQljSialCo6OvTrbULiQQMjLZuqyeaPy5BgP6boC+p+MhYY/RSrMrX9d8NoKwkRgD5qPSrPbwNhPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731428859; c=relaxed/simple;
	bh=tSbUlIwTV/WBPA1wcgLJtFdbY+gS1bpkw1DEDG4/hQs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EE6BvvaX5myFZVSlWHzd4JPIJ2nepDZvVh+3t++hRtXUijf4IViZmnk+UhVRSXn7TVAuxuH1ZcCPNwuIKj00utea7UW9+/jpY18lNxo2VTr+CKUB9cSQoS+HLXt0Sq5fGTkU506Hhkj7RDX8KH7vwj4xlyJ6zvcM2uRkrxN5McM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=h7XU5U7E; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="h7XU5U7E"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731428859; x=1762964859;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tSbUlIwTV/WBPA1wcgLJtFdbY+gS1bpkw1DEDG4/hQs=;
  b=h7XU5U7EaoXj5samF/6YxqK5vzIvGsrP8Ya+zup+1UZqYHVNjMBLpK2/
   NPUeGEz9CuPgYgnhXK+NHAnPx5Ght4M0dxTnZ17hU5ShjD2QqsU5k5eNe
   Uj/zzG/dsfu5l54K9FWJX8j7jBKpw/cJSCehxO5XChP569bf0xiHB10By
   iXjVPq+5944ii9h1o+79ksRLRhY+NmZiZwQMxcgFSQniZUHOHKkyUsyUp
   Ek+oBQYWdyhYGQFWtY4/qStWgplbBalvylIIJFfzDzXWYIFbPRcjjaEPi
   Abh8GBGt7AhIDSU/nd7arwTF0wg5bWNkiQMlohf9AXRfuCzTigX5LyBAZ
   g==;
X-CSE-ConnectionGUID: rWz8FhS0QcOE8Xaiz/lrYQ==
X-CSE-MsgGUID: QRxjBhLbRMaQkL8aEbGhXw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="41836535"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="41836535"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2024 08:27:34 -0800
X-CSE-ConnectionGUID: msqf7KCqRYmyNqfYFJV39w==
X-CSE-MsgGUID: iqVZoXALQEawmUW366E8JA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,148,1728975600"; 
   d="scan'208";a="88372368"
Received: from lkp-server01.sh.intel.com (HELO bcfed0da017c) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 12 Nov 2024 08:27:33 -0800
Received: from kbuild by bcfed0da017c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tAtjm-0001WD-11;
	Tue, 12 Nov 2024 16:27:30 +0000
Date: Wed, 13 Nov 2024 00:27:03 +0800
From: kernel test robot <lkp@intel.com>
To: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Infrastructure <z1.linuxinfra@amd.com>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Subject: [agd5f:amd-staging-drm-next 1286/1302]
 drivers/gpu/drm/amd/amdgpu/amdgpu_seq64.c:168: warning: Function parameter
 or struct member 'gpu_addr' not described in 'amdgpu_seq64_alloc'
Message-ID: <202411130016.UBjT0j4D-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitlab.freedesktop.org/agd5f/linux.git amd-staging-drm-next
head:   0bd74ab31ce2ca6e35c9f7f7c9b72bd9c78619ed
commit: 712361d6786e9601fe78fa9a50145e6bc6ab8f11 [1286/1302] drm/amdgpu: Add gpu_addr support to seq64 allocation
config: sparc-allmodconfig (https://download.01.org/0day-ci/archive/20241113/202411130016.UBjT0j4D-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241113/202411130016.UBjT0j4D-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411130016.UBjT0j4D-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/amd/amdgpu/amdgpu_seq64.c:168: warning: Function parameter or struct member 'gpu_addr' not described in 'amdgpu_seq64_alloc'


vim +168 drivers/gpu/drm/amd/amdgpu/amdgpu_seq64.c

c8031019dc95e3a Arunpravin Paneer Selvam 2023-10-10  153  
c8031019dc95e3a Arunpravin Paneer Selvam 2023-10-10  154  /**
c8031019dc95e3a Arunpravin Paneer Selvam 2023-10-10  155   * amdgpu_seq64_alloc - Allocate a 64 bit memory
c8031019dc95e3a Arunpravin Paneer Selvam 2023-10-10  156   *
c8031019dc95e3a Arunpravin Paneer Selvam 2023-10-10  157   * @adev: amdgpu_device pointer
00a11f977beb752 Arunpravin Paneer Selvam 2024-01-11  158   * @va: VA to access the seq in process address space
00a11f977beb752 Arunpravin Paneer Selvam 2024-01-11  159   * @cpu_addr: CPU address to access the seq
c8031019dc95e3a Arunpravin Paneer Selvam 2023-10-10  160   *
c8031019dc95e3a Arunpravin Paneer Selvam 2023-10-10  161   * Alloc a 64 bit memory from seq64 pool.
c8031019dc95e3a Arunpravin Paneer Selvam 2023-10-10  162   *
c8031019dc95e3a Arunpravin Paneer Selvam 2023-10-10  163   * Returns:
c8031019dc95e3a Arunpravin Paneer Selvam 2023-10-10  164   * 0 on success or a negative error code on failure
c8031019dc95e3a Arunpravin Paneer Selvam 2023-10-10  165   */
712361d6786e960 Arunpravin Paneer Selvam 2024-10-30  166  int amdgpu_seq64_alloc(struct amdgpu_device *adev, u64 *va,
712361d6786e960 Arunpravin Paneer Selvam 2024-10-30  167  		       u64 *gpu_addr, u64 **cpu_addr)
c8031019dc95e3a Arunpravin Paneer Selvam 2023-10-10 @168  {
c8031019dc95e3a Arunpravin Paneer Selvam 2023-10-10  169  	unsigned long bit_pos;
c8031019dc95e3a Arunpravin Paneer Selvam 2023-10-10  170  
c8031019dc95e3a Arunpravin Paneer Selvam 2023-10-10  171  	bit_pos = find_first_zero_bit(adev->seq64.used, adev->seq64.num_sem);
00a11f977beb752 Arunpravin Paneer Selvam 2024-01-11  172  	if (bit_pos >= adev->seq64.num_sem)
00a11f977beb752 Arunpravin Paneer Selvam 2024-01-11  173  		return -ENOSPC;
c8031019dc95e3a Arunpravin Paneer Selvam 2023-10-10  174  
c8031019dc95e3a Arunpravin Paneer Selvam 2023-10-10  175  	__set_bit(bit_pos, adev->seq64.used);
712361d6786e960 Arunpravin Paneer Selvam 2024-10-30  176  
00a11f977beb752 Arunpravin Paneer Selvam 2024-01-11  177  	*va = bit_pos * sizeof(u64) + amdgpu_seq64_get_va_base(adev);
712361d6786e960 Arunpravin Paneer Selvam 2024-10-30  178  
712361d6786e960 Arunpravin Paneer Selvam 2024-10-30  179  	if (gpu_addr)
712361d6786e960 Arunpravin Paneer Selvam 2024-10-30  180  		*gpu_addr = bit_pos * sizeof(u64) + adev->seq64.gpu_addr;
712361d6786e960 Arunpravin Paneer Selvam 2024-10-30  181  
00a11f977beb752 Arunpravin Paneer Selvam 2024-01-11  182  	*cpu_addr = bit_pos + adev->seq64.cpu_base_addr;
c8031019dc95e3a Arunpravin Paneer Selvam 2023-10-10  183  
c8031019dc95e3a Arunpravin Paneer Selvam 2023-10-10  184  	return 0;
c8031019dc95e3a Arunpravin Paneer Selvam 2023-10-10  185  }
c8031019dc95e3a Arunpravin Paneer Selvam 2023-10-10  186  

:::::: The code at line 168 was first introduced by commit
:::::: c8031019dc95e3ab7cc0b09f1894c5f52dc0c187 drm/amdgpu: Implement a new 64bit sequence memory driver

:::::: TO: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
:::::: CC: Alex Deucher <alexander.deucher@amd.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
