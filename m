Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 478C656462
	for <oe-kbuild-all@lists.linux.dev>; Tue,  5 Dec 2023 11:15:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="E9ZXd4Aa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701774930; x=1733310930;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=NtqRqAaSN8bHzbwU6WekMXe7XL+AeersMYsyODUzhOc=;
  b=E9ZXd4Aa32s+a1N0juaojkYVoyRSND3VbDILDk0DLftI5jQRzTvxbv1a
   LNesVXmN9J5xOK7Aoly4VyQIErR0DBfQJSSm1CM0RUxvEw/xvwoY120ks
   I1CYUgV6fK2OJc+m4OlLGRXcJPKtGnSyC9QJmtaNXxi9YJ3wob2Yli0DT
   FvHr1wbMriMaSIPlBC6gyQOo4rGixVDyRX6LG3E+4UwFX3bk/Ot6uwSRO
   bhA0Ok9FCDTkNEWotpPnVAfwYWt/SNtdJeOMjexFSs4Kaxvn9Xq1dBqBy
   PiOsf3xWikAiCyH7Vidj/EyBve4FmUO4sLm6XRhrRJ62MeIuEVY8ERgUw
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="7223277"
X-IronPort-AV: E=Sophos;i="6.04,252,1695711600"; 
   d="scan'208";a="7223277"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2023 03:15:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="720663324"
X-IronPort-AV: E=Sophos;i="6.04,252,1695711600"; 
   d="scan'208";a="720663324"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 05 Dec 2023 03:15:25 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rATOc-0008qM-27;
	Tue, 05 Dec 2023 11:15:22 +0000
Date: Tue, 5 Dec 2023 19:15:09 +0800
From: kernel test robot <lkp@intel.com>
To: Felix Kuehling <Felix.Kuehling@amd.com>, amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 5/6] drm/amdgpu: Auto-validate DMABuf imports in compute
 VMs
Message-ID: <202312051955.xACUCivN-lkp@intel.com>
References: <20231201233438.1709981-5-Felix.Kuehling@amd.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231201233438.1709981-5-Felix.Kuehling@amd.com>

Hi Felix,

kernel test robot noticed the following build errors:

[auto build test ERROR on next-20231201]
[cannot apply to drm-misc/drm-misc-next drm/drm-next drm-exynos/exynos-drm-next drm-intel/for-linux-next drm-intel/for-linux-next-fixes drm-tip/drm-tip linus/master v6.7-rc3 v6.7-rc2 v6.7-rc1 v6.7-rc4]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Felix-Kuehling/drm-amdkfd-Export-DMABufs-from-KFD-using-GEM-handles/20231202-073833
base:   next-20231201
patch link:    https://lore.kernel.org/r/20231201233438.1709981-5-Felix.Kuehling%40amd.com
patch subject: [PATCH 5/6] drm/amdgpu: Auto-validate DMABuf imports in compute VMs
config: powerpc-randconfig-001-20231203 (https://download.01.org/0day-ci/archive/20231205/202312051955.xACUCivN-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231205/202312051955.xACUCivN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312051955.xACUCivN-lkp@intel.com/

All errors (new ones prefixed by >>):

   powerpc-linux-ld: drivers/gpu/drm/amd/amdgpu/amdgpu_gem.o: in function `amdgpu_gem_object_open':
>> amdgpu_gem.c:(.text.amdgpu_gem_object_open+0x150): undefined reference to `amdgpu_amdkfd_bo_validate_and_fence'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
