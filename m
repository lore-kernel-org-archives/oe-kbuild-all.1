Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E19B3FE5
	for <oe-kbuild-all@lists.linux.dev>; Fri,  8 Aug 2025 03:02:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754622154; cv=none; b=j3INRtAFSbPENWgs9KOJSdnM6EPbjttQIZ17/G753EAdDIh+EYlQ4TfCLAPuqOC0JkRYBRbP+HdLtXjuZUytafJ46W7sR/yzoUi8wDMPSuxW9cDRl1YOQRHtI4B+kZR6MlzE0hmf4qS6Khm1PEyIRDTnmeIfYbkyuTfCXFvFp4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754622154; c=relaxed/simple;
	bh=bARSD4fLJvXeXVEOXLh/5vplIPvWnWVXSGP/F7xereA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AAAAYbNi9vtY1U5zYeTjLZGsETbROuswuldoO0hhTbFroEL7pPIgEQtriIGNKM+jXarBNyEgvx0116/qMvsfv7k7z36GZ9bylVD5eUv4Q9Wj3rQHM/WLO98KN9mOtFm1nAEW4xbNvDjunhz/kdwcIjrDX4496myGSkqmyGpQYco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BpPV+AyN; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BpPV+AyN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754622153; x=1786158153;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bARSD4fLJvXeXVEOXLh/5vplIPvWnWVXSGP/F7xereA=;
  b=BpPV+AyNivqUt98b1FubcB7aRw6+ZRxosGH4kAT/fGK0WW2CRgAsVnZn
   bbDV65ss62/Ci610qLmyF0zTSViHcM/YGB3KFy5XnmuauK21dG1lHNVKe
   GaeIg/3tOdhzPLVWGaFTRUS3xIOL9IcInuaC0zy/lqUDk+5lQyYmiBve3
   /aWuHqDyE6HrriFQT1GRTk6oy6clcZXH0/Os5VWy80mOaO5C9yKm+4bfN
   VEhdG0GixndKflAA8EQwoD8WMz6hzpG8B3Hcc3W8idXIpHpclZ/HNiM3y
   XNItAM1qapsUdW0+G970CL545kcWtZThyYXsiP+CHYlZCtobljIpl2LxB
   A==;
X-CSE-ConnectionGUID: xjB8qTyDTKKV6jilbvGs6Q==
X-CSE-MsgGUID: EjNmP9+sTJCyZO18sO8MLA==
X-IronPort-AV: E=McAfee;i="6800,10657,11514"; a="56844782"
X-IronPort-AV: E=Sophos;i="6.17,274,1747724400"; 
   d="scan'208";a="56844782"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2025 20:02:33 -0700
X-CSE-ConnectionGUID: 4XT3mjLWTx2JLT7MQCTpSQ==
X-CSE-MsgGUID: odHBN1w+TG2ImeSpHSofaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,274,1747724400"; 
   d="scan'208";a="169678707"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 07 Aug 2025 20:02:32 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ukDNB-0003UQ-3A;
	Fri, 08 Aug 2025 03:02:27 +0000
Date: Fri, 8 Aug 2025 11:01:36 +0800
From: kernel test robot <lkp@intel.com>
To: Roman Gushchin <roman.gushchin@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [rgushchin:bpfoom.1.5 9/15] mm/oom_kill.c:1322:3: warning: ignoring
 return value of 'mutex_lock_killable' declared with attribute
 'warn_unused_result'
Message-ID: <202508081005.HrsXuffx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/rgushchin/linux.git bpfoom.1.5
head:   73a652feddb7a276263957c6da871db88aac944a
commit: 7aa3eecc03bb0d299d692379514156fcac7e4709 [9/15] mm: introduce bpf_out_of_memory() bpf kfunc
config: arm-randconfig-002-20250808 (https://download.01.org/0day-ci/archive/20250808/202508081005.HrsXuffx-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250808/202508081005.HrsXuffx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508081005.HrsXuffx-lkp@intel.com/

All warnings (new ones prefixed by >>):

   mm/oom_kill.c: In function 'bpf_out_of_memory':
>> mm/oom_kill.c:1322:3: warning: ignoring return value of 'mutex_lock_killable' declared with attribute 'warn_unused_result' [-Wunused-result]
    1322 |   mutex_lock_killable(&oom_lock);
         |   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +1322 mm/oom_kill.c

  1307	
  1308	__bpf_kfunc int bpf_out_of_memory(struct mem_cgroup *memcg__nullable,
  1309					  int order, bool wait_on_oom_lock)
  1310	{
  1311		struct oom_control oc = {
  1312			.type = OOM_TYPE_BPF,
  1313			.memcg = memcg__nullable,
  1314			.order = order,
  1315		};
  1316		int ret;
  1317	
  1318		if (oc.order < 0 || oc.order > MAX_PAGE_ORDER)
  1319			return -EINVAL;
  1320	
  1321		if (wait_on_oom_lock)
> 1322			mutex_lock_killable(&oom_lock);
  1323		else if (!mutex_trylock(&oom_lock))
  1324			return -EBUSY;
  1325	
  1326		ret = out_of_memory(&oc);
  1327	
  1328		mutex_unlock(&oom_lock);
  1329		return ret;
  1330	}
  1331	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
