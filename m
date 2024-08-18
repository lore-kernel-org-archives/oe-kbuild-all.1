Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33EDA17BA9
	for <oe-kbuild-all@lists.linux.dev>; Sun, 18 Aug 2024 14:08:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723990094; cv=none; b=fv5tF0R3+d93WqJysn0BV7OF8sdz6aN4/VJy2J77+29+sTRTCnKpFoPBeiPwzSxIFdayB9UULQjs3uLZcRCSjBXi/VlP5N3p7EGhAFjTSSP2FOcGqV3y+sgB6wp5leVPPuWXumFFXxWG5YMeCMB7heWQjrVXQIQiWAQFPD2SiAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723990094; c=relaxed/simple;
	bh=XQgKvYsQDQwsQThUWqv3MmYRC08pwP07DKTfyg89Dlw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pB6ToZkLbDgB7tWMenW/I0NKbsDpFzkBZdkKFgChVFVEZMHYW8gQ6T837TB0T6Bj21MRRDXkWzquIavCmYNJuYp/lfBGPXzzh6qi8Dglr3ZjRVJW4woW9LtvKtUHvqgff89E8YumkClTbN9YF6daBVHDXonaxWd6wKK4IQx332o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FuoVRIRA; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FuoVRIRA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723990092; x=1755526092;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=XQgKvYsQDQwsQThUWqv3MmYRC08pwP07DKTfyg89Dlw=;
  b=FuoVRIRAK9DNUFm0eg3rAd0tdWUx5/4xoZdsJndGdCX/ipM7oi/UpeS3
   vujoUBEyL9Oh+b3NcVlmKcjv6swkJk4QVko1PENVdEEFzLS+1m39WqC4O
   s6u0cGE+3jeO0rMmH6ty4gK2vJa6QVR2nLj93IUIkDjY6oMuIGTm7Gx9j
   Jzj+S+qAHKhom+1qWlssYSY1CH55U3d8ji1rs90XmBc1QzJvTPpROVkU3
   jOjaiXjPzDMXjftcwmPXtlNXnW+eNpAaHvI0T4Gh8w9ByxwsoStAGe0Da
   PzrkNaZKxIOLLYM6hKoYvbwqTEkUzAIdXBqXCqOIf/4mckPy1XhMITdMR
   A==;
X-CSE-ConnectionGUID: 9+rrs9jpR4W7G+YQmTROQA==
X-CSE-MsgGUID: ROTHJSpgTiGBEtbIUjDiIw==
X-IronPort-AV: E=McAfee;i="6700,10204,11168"; a="13077667"
X-IronPort-AV: E=Sophos;i="6.10,157,1719903600"; 
   d="scan'208";a="13077667"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2024 07:08:12 -0700
X-CSE-ConnectionGUID: /y6BS3weS/aV3YHLwFiaBw==
X-CSE-MsgGUID: RFEarJ0QTPmZuaWbmg+2XQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,157,1719903600"; 
   d="scan'208";a="83345426"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 18 Aug 2024 07:08:09 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sfgZi-0008Ga-3C;
	Sun, 18 Aug 2024 14:08:06 +0000
Date: Sun, 18 Aug 2024 22:07:46 +0800
From: kernel test robot <lkp@intel.com>
To: Haren Myneni <haren@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Cc: oe-kbuild-all@lists.linux.dev, mpe@ellerman.id.au, npiggin@gmail.com,
	tyreld@linux.ibm.com, brking@linux.ibm.com, hbabu@us.ibm.com,
	haren@linux.ibm.com
Subject: Re: [PATCH v2 1/2] powerpc/pseries/dlpar: Remove device tree node
 for DLPAR IO remove
Message-ID: <202408182142.wuIKqYae-lkp@intel.com>
References: <20240817035401.125833-1-haren@linux.ibm.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240817035401.125833-1-haren@linux.ibm.com>

Hi Haren,

kernel test robot noticed the following build warnings:

[auto build test WARNING on powerpc/next]
[also build test WARNING on powerpc/fixes linus/master v6.11-rc3 next-20240816]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Haren-Myneni/powerpc-pseries-dlpar-Add-device-tree-nodes-for-DLPAR-IO-add/20240817-115833
base:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next
patch link:    https://lore.kernel.org/r/20240817035401.125833-1-haren%40linux.ibm.com
patch subject: [PATCH v2 1/2] powerpc/pseries/dlpar: Remove device tree node for DLPAR IO remove
config: powerpc64-randconfig-r121-20240818 (https://download.01.org/0day-ci/archive/20240818/202408182142.wuIKqYae-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 26670e7fa4f032a019d23d56c6a02926e854e8af)
reproduce: (https://download.01.org/0day-ci/archive/20240818/202408182142.wuIKqYae-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408182142.wuIKqYae-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> arch/powerpc/platforms/pseries/dlpar.c:398:53: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] drc_index @@     got restricted __be32 [usertype] drc_index @@
   arch/powerpc/platforms/pseries/dlpar.c:398:53: sparse:     expected unsigned int [usertype] drc_index
   arch/powerpc/platforms/pseries/dlpar.c:398:53: sparse:     got restricted __be32 [usertype] drc_index
   arch/powerpc/platforms/pseries/dlpar.c:418:43: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __be32 [usertype] drc_count @@     got unsigned int [usertype] @@
   arch/powerpc/platforms/pseries/dlpar.c:418:43: sparse:     expected restricted __be32 [usertype] drc_count
   arch/powerpc/platforms/pseries/dlpar.c:418:43: sparse:     got unsigned int [usertype]
   arch/powerpc/platforms/pseries/dlpar.c:422:43: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __be32 [usertype] drc_index @@     got unsigned int [usertype] @@
   arch/powerpc/platforms/pseries/dlpar.c:422:43: sparse:     expected restricted __be32 [usertype] drc_index
   arch/powerpc/platforms/pseries/dlpar.c:422:43: sparse:     got unsigned int [usertype]
   arch/powerpc/platforms/pseries/dlpar.c:426:42: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __be32 [usertype] count @@     got unsigned int [usertype] @@
   arch/powerpc/platforms/pseries/dlpar.c:426:42: sparse:     expected restricted __be32 [usertype] count
   arch/powerpc/platforms/pseries/dlpar.c:426:42: sparse:     got unsigned int [usertype]
   arch/powerpc/platforms/pseries/dlpar.c:428:42: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __be32 [usertype] index @@     got unsigned int [usertype] @@
   arch/powerpc/platforms/pseries/dlpar.c:428:42: sparse:     expected restricted __be32 [usertype] index
   arch/powerpc/platforms/pseries/dlpar.c:428:42: sparse:     got unsigned int [usertype]

vim +398 arch/powerpc/platforms/pseries/dlpar.c

   386	
   387	static int dlpar_hp_dt(struct pseries_hp_errorlog *phpe)
   388	{
   389		int rc;
   390	
   391		if (phpe->id_type != PSERIES_HP_ELOG_ID_DRC_INDEX)
   392			return -EINVAL;
   393	
   394		lock_device_hotplug();
   395	
   396		switch (phpe->action) {
   397		case PSERIES_HP_ELOG_ACTION_REMOVE:
 > 398			rc = dlpar_hp_dt_remove(phpe->_drc_u.drc_index);
   399			break;
   400		default:
   401			pr_err("Invalid action (%d) specified\n", phpe->action);
   402			rc = -EINVAL;
   403			break;
   404		}
   405	
   406		unlock_device_hotplug();
   407	
   408		return rc;
   409	}
   410	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
