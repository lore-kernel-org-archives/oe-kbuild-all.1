Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9970E148848
	for <oe-kbuild-all@lists.linux.dev>; Fri, 13 Sep 2024 23:06:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726268796; cv=none; b=uy6B1GoEP43iRoDugsw2etuV26wwUHcILMC9NTVYz7IsrshFIslu/QoFziCyixgu+RhH3/l0EaDJRHVTm8zOi5ghIqvca6uepAP4VRgUzF0Xsb8xKAbxE33vWM2OhPMvHsSLetIf4cuL0qyEHbXbTnHcNV79SO4F2l9eX4tkhuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726268796; c=relaxed/simple;
	bh=1GPrf+aOP1Wb6hv1CV4Q9bpX6pTqgU0R8e3l68zJf20=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=illVGCChcSfnmx89rWpA+VMuM+EWHN6D90dSGF7hPtFwVe6f15hz0yxcNQwFpE3a/uGojwA1A3Stu+j8y1eGRYq/QYjntEFL/ZlPtaj0Y4RL58RRJTNAAqrBZ+3I1P2wZnZSsEb3tkhaosSaxEsttt/EXDyLO7e2WrzhbOwSHWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JLpqC+Hs; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JLpqC+Hs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726268795; x=1757804795;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=1GPrf+aOP1Wb6hv1CV4Q9bpX6pTqgU0R8e3l68zJf20=;
  b=JLpqC+HsGqov6dvWPbZBx8g6ZmDvk2pIZEXYHu6lwZctTQnOaTNhuPQb
   qQ0aJT7OH5xqma8BreNBY19HPBN0QeiHiUIZlfIgoZQutnFhC0OYGlsX1
   RAjWU+EsY1Jsm3LJRmRn6/XaULjL1yIIO1Zmu0LLzQPE3CGAz1mWQVSrv
   GhaUmTPvpoecayvl6eiCDkK1YdTIOBS7hjZcT57hEoaFxdNrzfoefvZgC
   96l/lbukw6mf6DQHf4dWhM5WDuNFdlmjPWEvsSXdGY0eZ1LFHsLQz8PWt
   CcArlq8F7v1dA2trNqwx+GNnvGr3kco8ea4eFNHugYpOiG1NRgHCQeHx5
   w==;
X-CSE-ConnectionGUID: Vny4PvtASr2ZBkZjyGMR5g==
X-CSE-MsgGUID: rmaGKKfrQh66CBMG2cJ77Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11194"; a="36533414"
X-IronPort-AV: E=Sophos;i="6.10,227,1719903600"; 
   d="scan'208";a="36533414"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2024 16:06:34 -0700
X-CSE-ConnectionGUID: UR+FZ7rpQqOBkpAlsNLeaQ==
X-CSE-MsgGUID: a7hG6zERQWaJzL+RlP4RLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,227,1719903600"; 
   d="scan'208";a="68733765"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 13 Sep 2024 16:06:31 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1spFMy-00077e-2R;
	Fri, 13 Sep 2024 23:06:28 +0000
Date: Sat, 14 Sep 2024 07:06:21 +0800
From: kernel test robot <lkp@intel.com>
To: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
	dri-devel@lists.freedesktop.org, christian.koenig@amd.com,
	tursulin@igalia.com, simona.vetter@ffwll.ch, robdclark@gmail.com
Cc: oe-kbuild-all@lists.linux.dev,
	Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
Subject: Re: [PATCH 1/3] drm: add DRM_SET_NAME ioctl
Message-ID: <202409140642.ZDKf0cja-lkp@intel.com>
References: <20240911145836.734080-1-pierre-eric.pelloux-prayer@amd.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240911145836.734080-1-pierre-eric.pelloux-prayer@amd.com>

Hi Pierre-Eric,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-exynos/exynos-drm-next]
[also build test WARNING on drm-intel/for-linux-next drm-intel/for-linux-next-fixes drm-misc/drm-misc-next drm-tip/drm-tip linus/master v6.11-rc7 next-20240913]
[cannot apply to drm/drm-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Pierre-Eric-Pelloux-Prayer/drm-use-drm_file-name-in-fdinfo/20240911-230058
base:   https://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos.git exynos-drm-next
patch link:    https://lore.kernel.org/r/20240911145836.734080-1-pierre-eric.pelloux-prayer%40amd.com
patch subject: [PATCH 1/3] drm: add DRM_SET_NAME ioctl
config: x86_64-randconfig-121-20240913 (https://download.01.org/0day-ci/archive/20240914/202409140642.ZDKf0cja-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240914/202409140642.ZDKf0cja-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409140642.ZDKf0cja-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/drm_ioctl.c:553:18: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void *user_ptr @@     got void [noderef] __user * @@
   drivers/gpu/drm/drm_ioctl.c:553:18: sparse:     expected void *user_ptr
   drivers/gpu/drm/drm_ioctl.c:553:18: sparse:     got void [noderef] __user *
>> drivers/gpu/drm/drm_ioctl.c:555:36: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const [noderef] __user * @@     got void *user_ptr @@
   drivers/gpu/drm/drm_ioctl.c:555:36: sparse:     expected void const [noderef] __user *
   drivers/gpu/drm/drm_ioctl.c:555:36: sparse:     got void *user_ptr

vim +553 drivers/gpu/drm/drm_ioctl.c

   542	
   543	static int drm_set_name(struct drm_device *dev, void *data,
   544				struct drm_file *file_priv)
   545	{
   546		struct drm_set_name *name = data;
   547		void *user_ptr;
   548		char *new_name;
   549	
   550		if (name->name_len >= NAME_MAX)
   551			return -EINVAL;
   552	
 > 553		user_ptr = u64_to_user_ptr(name->name);
   554	
 > 555		new_name = memdup_user_nul(user_ptr, name->name_len);
   556	
   557		if (IS_ERR(new_name))
   558			return PTR_ERR(new_name);
   559	
   560		mutex_lock(&file_priv->name_lock);
   561		if (file_priv->name)
   562			kvfree(file_priv->name);
   563		file_priv->name = new_name;
   564		mutex_unlock(&file_priv->name_lock);
   565	
   566		return 0;
   567	}
   568	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
