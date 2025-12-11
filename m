Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8673B25FA0E
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Dec 2025 12:17:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765455423; cv=none; b=pIBBcVmzmamcuW4kEIGES4Qc2q6u9T+DFFvdchhdEzyZpfD2/CpD55nZwQoYAajnfLSCzm/EBAKpji2K17gHUaKscBPrN8UbvB3r3Xhpb77v+cNcKHZeNLAM/ss3xEs0okF+WuB+kDAHRQLy7govDU5IyX1ztt48LMn/chmeHfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765455423; c=relaxed/simple;
	bh=FjlBRBwq+T7gweOlKmbjmhad5qpIjKJzafRqCfoNWI8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UEXmT5Vp4ODbZtrwLHT+PuKYChM2BtkVfAYKScFYMLFS/mAdyHHa9zBeVumPOns6f7AaJfJnHrqMOVHa5ACr1wcN/BvA0Nvp5JgFilDJUeIlrBToQxxGedQ996lxzajc/dJ3mp0GVRXCKItPXqQb8zBIJhDMnBPpwwMIQkHXBxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lYsRdlr6; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lYsRdlr6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765455421; x=1796991421;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FjlBRBwq+T7gweOlKmbjmhad5qpIjKJzafRqCfoNWI8=;
  b=lYsRdlr6XyICVUPGQjn/zH8Ob8vfOTFrnojnpJI8ROnxPx+Q9LhU8RE3
   UoVaA46/W0HqJEcOFHdKj+V1mwWTDVFwQiK2VwQViCquz+1WgKNCYmb32
   jEgqYJz7MEGr0o8gl1ryMo8R0dwd+fSChs3DXJQJgCcKD3HqkUZSdDNjP
   yIBL/6Vh23tfO/N33y7cnYM75+aGLZUHSBCGI0kqUdMh0CM53Cn/3O3AK
   pAehXBbYlCK+NjALkA/N+VBmX50ySsxisFllH8554UVex3h1c6RP6z0uQ
   dg+6PqPzbmys7KkxpCmCAxA7zWskl7tJUjipSul7odH+qXcyJWb7wloa3
   A==;
X-CSE-ConnectionGUID: x9hcXi5JQ0ixVTBmlIX2hQ==
X-CSE-MsgGUID: 20DhITcVSj2QI3R4eWrcPg==
X-IronPort-AV: E=McAfee;i="6800,10657,11638"; a="67321287"
X-IronPort-AV: E=Sophos;i="6.21,265,1763452800"; 
   d="scan'208";a="67321287"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2025 04:17:00 -0800
X-CSE-ConnectionGUID: jJGrCac5S9+/SfvzNIrIhw==
X-CSE-MsgGUID: 56HKYXEvTK2y6b7/G/MxNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,265,1763452800"; 
   d="scan'208";a="197061783"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 11 Dec 2025 04:16:59 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vTfbN-000000004cz-0cx6;
	Thu, 11 Dec 2025 12:16:57 +0000
Date: Thu, 11 Dec 2025 20:16:51 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3534/3534] kernel/cpu.c:2684: warning: This
 comment starts with '/**', but isn't a kernel-doc comment. Refer
 Documentation/doc-guide/kernel-doc.rst
Message-ID: <202512112035.fGJa8Hzw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   5930fa3740c518a9f6ba688fd0c1873d6f3adbce
commit: b36171d783908f2ef26ccfcd757d4954a69955ab [3534/3534] cpu/SMT: Enable SMT only if a core is online
config: x86_64-randconfig-011-20251211 (https://download.01.org/0day-ci/archive/20251211/202512112035.fGJa8Hzw-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251211/202512112035.fGJa8Hzw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512112035.fGJa8Hzw-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/cpu.c:2684: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Check if the core a CPU belongs to is online


vim +2684 kernel/cpu.c

  2682	
  2683	/**
> 2684	 * Check if the core a CPU belongs to is online
  2685	 */
  2686	#if !defined(topology_is_core_online)
  2687	static inline bool topology_is_core_online(unsigned int cpu)
  2688	{
  2689		return true;
  2690	}
  2691	#endif
  2692	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
