Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 393D71EDA2C
	for <oe-kbuild-all@lists.linux.dev>; Sun,  1 Feb 2026 22:45:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769985914; cv=none; b=pN1ur75LbYpX4Wt8sq7vvno7svL0FBpyufmxNLrw2Uj5J6QxUQDVjFqnbQ99MBh15SJqsvb5cMvT3VSj9KJDlBN+/U0bZmGqvon/dV5YtpweWqbvGi7DfxaPbunVOoeBmMD/VJFjyiWiliO6OpDLN7tCH6H5NJ2rES6vQKNTdnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769985914; c=relaxed/simple;
	bh=RP6esKV/cq+YlRA2aT6T9OY/1tMVpE5FoSzrCKH0lQk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NFvI1120fuop3fEJ96vdFHyGB1kq/hoHYCrajp6V5q7wDUJWFfa0vby4d8NVIPM/3qYHDOUIHM6cQDTJoeD6EzfxtfFoqI2MQ2gQxjHujdwysV3xecTL/9MOdjFmqIpYmiudMcfS2NDSisqEUw9DIODZuFk2HuMTHO00M7ZlMrg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FwfiVweg; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FwfiVweg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769985913; x=1801521913;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=RP6esKV/cq+YlRA2aT6T9OY/1tMVpE5FoSzrCKH0lQk=;
  b=FwfiVwegEni18cDGre37upWyak8xAK7N33ZCOSHHWmaalRJADmyVRuTK
   Oah0c+2tyWEm4gk4uiEern4s5YDw+TEnhxO8TGHeBSvllbDlsgan1qm1v
   TTv3lYLE0MiaqrDjsacgFA/kbjfOsGMAmVNX08ZuFK5KQMhQJI1hfWkei
   GguctTInogAAM/O0gqJAEDuy8Tan1BPYrUrU+mw5MUGWmhdcSqDY9WZd8
   /MfzGm/Eb+nF1bFfvqu5jYryClR/NgK/xVYM4itRTNkuz4FVzM4JRYYsr
   kFrR/UkWbTziy9E1fJTmvNxar0YyeYH+oguvOgWG8EtBK2h+H4DuoEltC
   A==;
X-CSE-ConnectionGUID: D5pNVaPDRgmo7ZxK5TeA0A==
X-CSE-MsgGUID: nKe/v5ifTI6plw0pB6hYeQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11689"; a="88570294"
X-IronPort-AV: E=Sophos;i="6.21,267,1763452800"; 
   d="scan'208";a="88570294"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2026 14:45:12 -0800
X-CSE-ConnectionGUID: 0cnmZNzEQsKpQt8jqejVXw==
X-CSE-MsgGUID: RkJ4JctxRjCIZi4pH7AmIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,267,1763452800"; 
   d="scan'208";a="209667228"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 01 Feb 2026 14:45:11 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vmgBp-00000000f5E-1gZz;
	Sun, 01 Feb 2026 22:45:09 +0000
Date: Mon, 2 Feb 2026 06:44:24 +0800
From: kernel test robot <lkp@intel.com>
To: Shivaprasad G Bhat <sbhat@linux.ibm.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH] powerpc: iommu: Initial IOMMUFD support for PPC64
Message-ID: <202602020637.f1nLKGWt-lkp@intel.com>
References: <176953894915.725.1102545144304639827.stgit@linux.ibm.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <176953894915.725.1102545144304639827.stgit@linux.ibm.com>

Hi Shivaprasad,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on powerpc/next]
[also build test ERROR on powerpc/fixes awilliam-vfio/next awilliam-vfio/for-linus linus/master v6.19-rc7 next-20260130]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Shivaprasad-G-Bhat/powerpc-iommu-Initial-IOMMUFD-support-for-PPC64/20260128-023838
base:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next
patch link:    https://lore.kernel.org/r/176953894915.725.1102545144304639827.stgit%40linux.ibm.com
patch subject: [RFC PATCH] powerpc: iommu: Initial IOMMUFD support for PPC64
config: powerpc64-randconfig-001-20260202 (https://download.01.org/0day-ci/archive/20260202/202602020637.f1nLKGWt-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 12.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260202/202602020637.f1nLKGWt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602020637.f1nLKGWt-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> arch/powerpc/sysdev/dart_iommu.c:325:16: error: initialization of 'int (*)(struct iommu_table *, long int,  long int,  long unsigned int,  enum dma_data_direction,  long unsigned int,  bool)' {aka 'int (*)(struct iommu_table *, long int,  long int,  long unsigned int,  enum dma_data_direction,  long unsigned int,  _Bool)'} from incompatible pointer type 'int (*)(struct iommu_table *, long int,  long int,  long unsigned int,  enum dma_data_direction,  long unsigned int)' [-Werror=incompatible-pointer-types]
     325 |         .set = dart_build,
         |                ^~~~~~~~~~
   arch/powerpc/sysdev/dart_iommu.c:325:16: note: (near initialization for 'iommu_dart_ops.set')
   cc1: some warnings being treated as errors
--
   arch/powerpc/kernel/iommu.c: In function 'spapr_tce_domain_alloc_paging':
>> arch/powerpc/kernel/iommu.c:1298:13: warning: variable 'ret' set but not used [-Wunused-but-set-variable]
    1298 |         int ret = -1;
         |             ^~~
   arch/powerpc/kernel/iommu.c: In function 'spapr_tce_iommu_unmap_pages':
>> arch/powerpc/kernel/iommu.c:1341:14: warning: variable 'mask' set but not used [-Wunused-but-set-variable]
    1341 |         int  mask;
         |              ^~~~


vim +325 arch/powerpc/sysdev/dart_iommu.c

^1da177e4c3f41 arch/ppc64/kernel/u3_iommu.c     Linus Torvalds       2005-04-16  323  
da004c3600f52e arch/powerpc/sysdev/dart_iommu.c Alexey Kardashevskiy 2015-06-05  324  static struct iommu_table_ops iommu_dart_ops = {
da004c3600f52e arch/powerpc/sysdev/dart_iommu.c Alexey Kardashevskiy 2015-06-05 @325  	.set = dart_build,
da004c3600f52e arch/powerpc/sysdev/dart_iommu.c Alexey Kardashevskiy 2015-06-05  326  	.clear = dart_free,
da004c3600f52e arch/powerpc/sysdev/dart_iommu.c Alexey Kardashevskiy 2015-06-05  327  	.flush = dart_flush,
da004c3600f52e arch/powerpc/sysdev/dart_iommu.c Alexey Kardashevskiy 2015-06-05  328  };
da004c3600f52e arch/powerpc/sysdev/dart_iommu.c Alexey Kardashevskiy 2015-06-05  329  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
