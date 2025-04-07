Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F5221C84C1
	for <oe-kbuild-all@lists.linux.dev>; Mon,  7 Apr 2025 22:43:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744065840; cv=none; b=ezUI2b2TvX1F+OKfwfNGpHDhYdfl6swQQEd32G5DELZM/gA1zwavmMZnn8Md5REkCypt134OKFczaf/HloZ7clL9BT1ti96tD33eUq6j1+jUB+sUeJHsol0bHjfE/vBRXryG1Dl7itmfpG78jM+wtsfmKlo2a41lV/vEm657MKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744065840; c=relaxed/simple;
	bh=uNM2vAT4T9rRdI5ssfHwnmd9JW15gSnXf3+n+ua55bc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KcR55E/Rt0uTc8FtylwKqCVEDDhiyZywLE3ui1e9Kzm3dO/DKYY+5apdY5xG5A2iuxFUu4OWu2b3s6cwStVI6sSaF46DUKeqFs2yeZRaykQkF0h5tq2bf6q3E7awwgKKZBE/NrdtsosC4FQNmu+GULl6txlZ/MXqdE8v3+i2LQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OCXL/fHb; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OCXL/fHb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744065838; x=1775601838;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=uNM2vAT4T9rRdI5ssfHwnmd9JW15gSnXf3+n+ua55bc=;
  b=OCXL/fHbbVYtKGUMOXd8S8E81mSDA7cxYmliONLZxx3qE+sUWsmi4tgl
   vm+tZi8X86u0lTYU/2kidSsvg/80J25LUeculdbTGcFScRnIMnkXwsBr3
   l0tEsjMO2R7iEKNQqPqg688xSw06QG8jb5EFUtSeNrqkXL8fd1Hco51Ak
   EesKo3QB3LnF3NDav9KWIwctyeMwyeGfVIqTWyj0vFsA0RptTjWinamxU
   JzT5GYwwbZ2UHVKz03OnKWy0WVIx4oIQ2l7YItFqzCiVRInJYi7R8k5nz
   s/Jv42s8WoQ8nvS7bYDE3as9M44KYEfZl7T3C9U0kygdEVw1n9Gciskyh
   w==;
X-CSE-ConnectionGUID: 72gnjYPPRkeZY6Us98Kf6g==
X-CSE-MsgGUID: xPWHsBWeTv+eN+WclOt7Sg==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="49324764"
X-IronPort-AV: E=Sophos;i="6.15,196,1739865600"; 
   d="scan'208";a="49324764"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2025 15:43:55 -0700
X-CSE-ConnectionGUID: Xpm/jH9SS/aATrUuZeVSfQ==
X-CSE-MsgGUID: WtXlzF/YSqim4cpIXtU8XQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,196,1739865600"; 
   d="scan'208";a="132813110"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 07 Apr 2025 15:43:46 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u1vBv-0003sD-34;
	Mon, 07 Apr 2025 22:43:43 +0000
Date: Tue, 8 Apr 2025 06:42:50 +0800
From: kernel test robot <lkp@intel.com>
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
	intel-xe@lists.freedesktop.org
Cc: oe-kbuild-all@lists.linux.dev, matthew.brost@intel.com,
	thomas.hellstrom@linux.intel.com,
	Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
	Danilo Krummrich <dakr@redhat.com>,
	Boris Brezillon <bbrezillon@kernel.org>,
	dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2 16/32] Introduce drm_gpuvm_sm_map_ops_flags enums for
 sm_map_ops
Message-ID: <202504080624.tIlwDwWT-lkp@intel.com>
References: <20250407101719.3350996-17-himal.prasad.ghimiray@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250407101719.3350996-17-himal.prasad.ghimiray@intel.com>

Hi Himal,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-xe/drm-xe-next]
[cannot apply to linus/master v6.15-rc1 next-20250407]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Himal-Prasad-Ghimiray/drm-xe-Introduce-xe_vma_op_prefetch_range-struct-for-prefetch-of-ranges/20250407-215536
base:   https://gitlab.freedesktop.org/drm/xe/kernel.git drm-xe-next
patch link:    https://lore.kernel.org/r/20250407101719.3350996-17-himal.prasad.ghimiray%40intel.com
patch subject: [PATCH v2 16/32] Introduce drm_gpuvm_sm_map_ops_flags enums for sm_map_ops
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20250408/202504080624.tIlwDwWT-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250408/202504080624.tIlwDwWT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504080624.tIlwDwWT-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> include/drm/drm_gpuvm.h:233: warning: expecting prototype for enum drm_gpuvm_madvise_flags. Prototype was for enum drm_gpuvm_sm_map_ops_flags instead


vim +233 include/drm/drm_gpuvm.h

   213	
   214	/**
   215	 * enum drm_gpuvm_madvise_flags - flags for drm_gpuvm split/merge ops
   216	 */
   217	enum drm_gpuvm_sm_map_ops_flags {
   218		/**
   219		 * @DRM_GPUVM_SM_MAP_NOT_MADVISE: DEFAULT sm_map ops
   220		 */
   221		DRM_GPUVM_SM_MAP_NOT_MADVISE = 0,
   222	
   223		/**
   224		 * @DRM_GPUVM_SKIP_GEM_OBJ_VA_SPLIT_MADVISE: This flag is used by
   225		 * drm_gpuvm_sm_map_ops_create to iterate over GPUVMA's in the
   226		 * user-provided range and split the existing non-GEM object VMA if the
   227		 * start or end of the input range lies within it. The operations can
   228		 * create up to 2 REMAPS and 2 MAPs. Unlike drm_gpuvm_sm_map_ops_flags
   229		 * in default mode, the operation with this flag will never have UNMAPs and
   230		 * merges, and can be without any final operations.
   231		 */
   232		DRM_GPUVM_SKIP_GEM_OBJ_VA_SPLIT_MADVISE = BIT(0),
 > 233	};
   234	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
