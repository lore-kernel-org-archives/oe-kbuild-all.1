Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D37E03271F2
	for <oe-kbuild-all@lists.linux.dev>; Fri, 28 Nov 2025 12:02:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764331336; cv=none; b=YFIni+pGObWA2k6Cqa299bvOmapDju04BYQj1TEY6+1iAGd5oy9nHzu3eGQiHCrRtxoQ57b1w5rGH85NmiPafzzG/Aw2xHAU8hLik5CRGRghntNpQAWel3xJZUZ3q+QA/FTbNH1lLAG52I+LYZ4zbU0gh6al270Rwj1ICqlAe1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764331336; c=relaxed/simple;
	bh=Rg0w37bBiHBjw0LB+xgUckl6ZJGEwdDhAIWu1Qjw9lE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hNSzYLlHGZrmZM2Hzi+1kMJ3+nvgpDY+mRBMC9mSSa7zc+qJwWJqB8L9BpQbrTZe1PCIgsOUqgjF9LRCKxVXFQzhwxNpU6gNRAmKNSUYdAhEIELpvwuimnrTAmSHdtdslrZVDCPTeGPJcrNpHN6Q5iRwnzitf2hZ5XvDAOrI0tM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NlT6GLcX; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NlT6GLcX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764331335; x=1795867335;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Rg0w37bBiHBjw0LB+xgUckl6ZJGEwdDhAIWu1Qjw9lE=;
  b=NlT6GLcXZIeT1Sphz1FocyZIJGf/XaRrbA6Kgn6IDuCvXR5zs6Q+2sST
   vQ/26G1DoWPIngTk5UCXxjHjZZasTzOkMbGjqUBthazBTnxQuVRKX2XWe
   4G7mJ4f5b6ZVg4e+n7CAAegoUUcpm0izJTGRwasbI+PXj0H8nUqxzatuQ
   fngRItWEVDzBB5aqcEDIF6sQNbFTOcBD2qkVoCkxWb/YHeh20ehUB1nvs
   zu0br0Za+JLHZFhedRqjwuYo8SAzEpPSQMkALMyOAu0p+YAk2KIho1HPj
   fOz2YQEA48JpwlMU0F+nOehLlnREl0I66ozt3/65ZM4IeZkTdf1f58nXV
   A==;
X-CSE-ConnectionGUID: DhovbIcgQ4SlQp4J6SU4YA==
X-CSE-MsgGUID: LTDooPQ0SvK6Of+PCYDFcw==
X-IronPort-AV: E=McAfee;i="6800,10657,11626"; a="68956384"
X-IronPort-AV: E=Sophos;i="6.20,232,1758610800"; 
   d="scan'208";a="68956384"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2025 04:02:14 -0800
X-CSE-ConnectionGUID: RSi7gsL1Su25SyFJ+YYCjg==
X-CSE-MsgGUID: H16TZsp4QLCPAGXVqoIHCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,232,1758610800"; 
   d="scan'208";a="193237999"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 28 Nov 2025 04:02:13 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vOxAw-000000006ME-0hs4;
	Fri, 28 Nov 2025 12:02:10 +0000
Date: Fri, 28 Nov 2025 20:01:56 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zicheng Qu <quzicheng@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3355/3355] kernel/xsched/core.c:189:5: warning:
 no previous prototype for function 'xsched_xse_set_class'
Message-ID: <202511282009.VCbXC9Zw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   ae3faae9efa6dabe1e7613b5e5d3758ffaefb86a
commit: 76c15076abcb100f7c1204bd1ef0ec55128d6546 [3355/3355] xsched: Add basic scheduler core support
config: loongarch-allyesconfig (https://download.01.org/0day-ci/archive/20251128/202511282009.VCbXC9Zw-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9e9fe08b16ea2c4d9867fb4974edf2a3776d6ece)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251128/202511282009.VCbXC9Zw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511282009.VCbXC9Zw-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/xsched/core.c:189:5: warning: no previous prototype for function 'xsched_xse_set_class' [-Wmissing-prototypes]
     189 | int xsched_xse_set_class(struct xsched_entity *xse)
         |     ^
   kernel/xsched/core.c:189:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     189 | int xsched_xse_set_class(struct xsched_entity *xse)
         | ^
         | static 
   kernel/xsched/core.c:289:20: warning: unused function 'should_preempt' [-Wunused-function]
     289 | static inline bool should_preempt(struct xsched_entity *xse)
         |                    ^~~~~~~~~~~~~~
   2 warnings generated.


vim +/xsched_xse_set_class +189 kernel/xsched/core.c

   188	
 > 189	int xsched_xse_set_class(struct xsched_entity *xse)
   190	{
   191		struct xsched_class *sched = xsched_first_class;
   192	
   193		xse->class = sched;
   194		return 0;
   195	}
   196	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
