Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16CDF81741
	for <oe-kbuild-all@lists.linux.dev>; Thu,  7 Aug 2025 02:07:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754532454; cv=none; b=EhJw/fO091YiPmwflDDjnPLsa5iMQbYCPpIn+BzXGQo/IjF8WcchapK3RZCQshFeZ0sT4SAkmdv/Gb/RI6YR+nqF6gEVd26rDFpRYAci37fz8iHlW2pq2sYR6/R5pOAePMfTjIYnf4P4wwO0/p8Ua42cZ0b89wW83IEv8vvdHTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754532454; c=relaxed/simple;
	bh=nuYxT72E4oiwxGnnBnkHMuB4HJRX8EjqxM34x9aCDEU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lLTuWrntN7c7/HfGgVDhzMDRQDtBNTgNEtCbn5kQiB9YVdfvaJLT+nJfo+N7N7bC5g2pKA+YdynDyTNPIjt2OzMVlqHvWuPUiHCaB6r1WUTaUnTgvthrPcr2Uo7TAtxyrcGzyvcV0OPhJEYSbiBQImuaVzb38XzwA/T1TzBMQLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KmrGMDBs; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KmrGMDBs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754532452; x=1786068452;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nuYxT72E4oiwxGnnBnkHMuB4HJRX8EjqxM34x9aCDEU=;
  b=KmrGMDBsZeW7ygd2keclRBnrvZRF+mpX7jUkd+qswK66LUeg7BATb9uU
   RyCnf/LzrJ1p0IJ6jERKNSIyQu/1TAl1KUSBvONrc99+zeE+y+jzusg5C
   gsOy2GHbMMmI+CdqJD1Xmpu0Xo6is7wzR79MxZle+OHt9/hfUw2gK8Ds3
   am6vuyO1WhrmxPEaTw+7RNG4q8TtZx4mdcjt7w/9inn7WxDgCszrqOxdc
   iXjBQybdefN7Z+uskaG24oQxmHST3Ch0I1kYKLOfTfUy5J8PlrV9zNR2R
   IJ+SC0ET4E82/uvqbAOOwQA/6Jf4Je+eRpIknyy5bZLPJbV8WvDAIe47N
   A==;
X-CSE-ConnectionGUID: zEcJoTUnRpW5aVlbuyio6A==
X-CSE-MsgGUID: 7Ze8dRlxS1K/SAq/W6RpyQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11514"; a="55895590"
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; 
   d="scan'208";a="55895590"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2025 19:07:31 -0700
X-CSE-ConnectionGUID: q3jutCG2RniE/VQqY1dnTQ==
X-CSE-MsgGUID: BwSU5EBWQFOn3L/7Oka+Gg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; 
   d="scan'208";a="195763399"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 06 Aug 2025 19:07:30 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ujq2S-0002HA-1q;
	Thu, 07 Aug 2025 02:07:28 +0000
Date: Thu, 7 Aug 2025 10:06:45 +0800
From: kernel test robot <lkp@intel.com>
To: Roman Gushchin <roman.gushchin@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [rgushchin:bpfoom.1.5 2/17] mm/bpf_oom.c:31:6: warning: variable
 'ret' is used uninitialized whenever 'if' condition is false
Message-ID: <202508070909.iXmJwVmx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/rgushchin/linux.git bpfoom.1.5
head:   56067bc9ae98ae8d75fbb2506874ef96ee0396e5
commit: 4f870b9abac74bede0e873ae2b29091aab7bc533 [2/17] mm: introduce a bpf hook for OOM handling
config: arm-randconfig-001-20250807 (https://download.01.org/0day-ci/archive/20250807/202508070909.iXmJwVmx-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 7b8dea265e72c3037b6b1e54d5ab51b7e14f328b)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250807/202508070909.iXmJwVmx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508070909.iXmJwVmx-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/bpf_oom.c:31:6: warning: variable 'ret' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
      31 |         if (ops && ops->handle_out_of_memory)
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/bpf_oom.c:35:11: note: uninitialized use occurs here
      35 |         return !!ret && oc->bpf_memory_freed;
         |                  ^~~
   mm/bpf_oom.c:31:2: note: remove the 'if' if its condition is always true
      31 |         if (ops && ops->handle_out_of_memory)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      32 |                 ret = ops->handle_out_of_memory(oc);
>> mm/bpf_oom.c:31:6: warning: variable 'ret' is used uninitialized whenever '&&' condition is false [-Wsometimes-uninitialized]
      31 |         if (ops && ops->handle_out_of_memory)
         |             ^~~
   mm/bpf_oom.c:35:11: note: uninitialized use occurs here
      35 |         return !!ret && oc->bpf_memory_freed;
         |                  ^~~
   mm/bpf_oom.c:31:6: note: remove the '&&' if its condition is always true
      31 |         if (ops && ops->handle_out_of_memory)
         |             ^~~~~~
   mm/bpf_oom.c:25:9: note: initialize the variable 'ret' to silence this warning
      25 |         int ret, idx;
         |                ^
         |                 = 0
   2 warnings generated.


vim +31 mm/bpf_oom.c

    20	
    21	bool bpf_handle_oom(struct oom_control *oc)
    22	{
    23		struct bpf_oom *b = &system_bpf_oom;
    24		struct bpf_oom_ops *ops;
    25		int ret, idx;
    26	
    27		oc->bpf_memory_freed = false;
    28	
    29		idx = srcu_read_lock(&b->srcu);
    30		ops = READ_ONCE(b->ops);
  > 31		if (ops && ops->handle_out_of_memory)
    32			ret = ops->handle_out_of_memory(oc);
    33		srcu_read_unlock(&b->srcu, idx);
    34	
    35		return !!ret && oc->bpf_memory_freed;
    36	}
    37	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
