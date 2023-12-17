Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05EAD1E495
	for <oe-kbuild-all@lists.linux.dev>; Sun, 17 Dec 2023 19:13:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RNYtSr/T"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702840427; x=1734376427;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=2vkJ9UdkhUfc3Fyby+XZ9UErCG79JcAlyG3GkbzZWro=;
  b=RNYtSr/TqFEDxTv7o6e+5OQN0h5ffg+0AZEuAdFG5IaeLaryJe7C9BKu
   gqKAdZT67RzMn5eaFytss5I1TYtP62BHOWEQhhtvQAk37bYC1MX9sQkz7
   5JZDVznxSr03LFrOfkCuvcMRBCY4YT1iT16fSc2Hi4+jnxmprR542gx6i
   Sl6Ajk5JTtuBKm0Vd43ADuF4SrkmrlvJatTCZLA1q5JqTly3nNZ2mhdS9
   H+cQksrnNCTxzqKW7nU37TIvlNXd9SElZeEal3uiaKEKWuQAPFDitd9ZV
   vAtRvbreHZ7vYi4l/S+Wr5qcntwug7TWjHy+Fx/MITe+BVzGlYDlsTgBW
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10927"; a="16984802"
X-IronPort-AV: E=Sophos;i="6.04,284,1695711600"; 
   d="scan'208";a="16984802"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2023 11:13:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10927"; a="1106708317"
X-IronPort-AV: E=Sophos;i="6.04,284,1695711600"; 
   d="scan'208";a="1106708317"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 17 Dec 2023 11:13:44 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rEwa6-0003M2-0y;
	Sun, 17 Dec 2023 19:13:42 +0000
Date: Mon, 18 Dec 2023 03:13:06 +0800
From: kernel test robot <lkp@intel.com>
To: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>,
	dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Cc: oe-kbuild-all@lists.linux.dev, alexander.deucher@amd.com,
	felix.kuehling@amd.com,
	Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>,
	christian.koenig@amd.com, matthew.auld@intel.com
Subject: Re: [PATCH v3 1/2] drm/buddy: Implement tracking clear page feature
Message-ID: <202312180258.cty6XurG-lkp@intel.com>
References: <20231214134240.3183-1-Arunpravin.PaneerSelvam@amd.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231214134240.3183-1-Arunpravin.PaneerSelvam@amd.com>

Hi Arunpravin,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-misc/drm-misc-next]
[also build test WARNING on drm-intel/for-linux-next drm-intel/for-linux-next-fixes drm/drm-next drm-exynos/exynos-drm-next drm-tip/drm-tip linus/master v6.7-rc5 next-20231215]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Arunpravin-Paneer-Selvam/drm-amdgpu-Enable-clear-page-functionality/20231214-214811
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20231214134240.3183-1-Arunpravin.PaneerSelvam%40amd.com
patch subject: [PATCH v3 1/2] drm/buddy: Implement tracking clear page feature
config: arc-randconfig-001-20231215 (https://download.01.org/0day-ci/archive/20231218/202312180258.cty6XurG-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231218/202312180258.cty6XurG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312180258.cty6XurG-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> scripts/kernel-doc: drivers/gpu/drm/drm_buddy.c:337: warning: Function parameter or struct member 'flags' not described in 'drm_buddy_free_list'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
