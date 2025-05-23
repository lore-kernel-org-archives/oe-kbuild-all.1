Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 531FF1C32
	for <oe-kbuild-all@lists.linux.dev>; Fri, 23 May 2025 00:32:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747960368; cv=none; b=BDeVuG4XhT48HLPAXqBOJzxi/OUllCU3/ZOxUDzNlt+AsBaZjmtjMvJuWqDFczNOn3VPwolqZhbBeSCujZ6u6X/Ozt8SJBId4PAaMmFLpPOtz7YvhMJvb11StENYP+bsXhwOjyG85LS7Qlwp+uSiNws8APFwcJUet4ZV8h7wSNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747960368; c=relaxed/simple;
	bh=jQbcYJ+zMiPNOIPY/YlYbM8f7IYHvmfy/OgcAcFmKa8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fzD1Dkg4hkRP9aMDsTXxT4iX1/7ULfkCYPQDbQGRRGtAccemjCZzYkTkCRvuBstPsXrb8M4+ZuSIfK72o/c3vpkD8V2bw0W4+fJIBVb50raROzR/fbpbblBwdud79wiFb/l4GUQhLuI/ukewwU267C1x08/dSZvzNA68QCQoUI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kaSnDrd3; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kaSnDrd3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747960366; x=1779496366;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=jQbcYJ+zMiPNOIPY/YlYbM8f7IYHvmfy/OgcAcFmKa8=;
  b=kaSnDrd36ijJ9PBSEdfIYYwaxa12dIFtlVdjDk9wCIQaJPZEuDvBfpVm
   P91G/gWXyy9dK0wEC3MfAejKJ/8qbOJLB0IMxg1pT3mc2uNyKG/xO8egf
   jwSaTnkjadl3xwKCPfMTXhbDX0cWs46lbvygahv8m6orUKch/W6Zev620
   dVkPB7J1Rhip97AnhK1iuHfFJITjy1wsmjsEdvfve1eqP2EySK/IcrdHo
   uD4oYKrWRq9ETUfgT4X/1JvGErdAkERrDE57Il/azz6onA/rxmhwuU59k
   XqGTvyaOryx7ao7WAbC3F5cwIv0pX+TZbYeVC+AKu3ty4VkVGf2KnijrK
   w==;
X-CSE-ConnectionGUID: Whcmf1kXRtqfC5FjhL1mvA==
X-CSE-MsgGUID: 1MLOOymmRniRKdA/Pvv6tQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11441"; a="60260463"
X-IronPort-AV: E=Sophos;i="6.15,307,1739865600"; 
   d="scan'208";a="60260463"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2025 17:32:45 -0700
X-CSE-ConnectionGUID: /3cTJGd6Q3SxShjmneC+uA==
X-CSE-MsgGUID: MeVmatLYRgmZEZoM4tQOIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,307,1739865600"; 
   d="scan'208";a="177977783"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 22 May 2025 17:32:44 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uIGL3-000Poe-2Y;
	Fri, 23 May 2025 00:32:41 +0000
Date: Fri, 23 May 2025 08:32:11 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org,
	tzimmermann@suse.de
Cc: oe-kbuild-all@lists.linux.dev, intel-xe@lists.freedesktop.org
Subject: Re: [PATCH 3/9] firmware/tegra: avoid accessing iosys_map internals.
Message-ID: <202505230806.C7HIxQ4g-lkp@intel.com>
References: <20250522065519.318013-4-airlied@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250522065519.318013-4-airlied@gmail.com>

Hi Dave,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm/drm-next]
[also build test ERROR on drm-intel/for-linux-next drm-intel/for-linux-next-fixes drm-tip/drm-tip v6.15-rc7 next-20250522]
[cannot apply to drm-xe/drm-xe-next drm-exynos/exynos-drm-next linus/master]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Dave-Airlie/udmabuf-use-new-iosys_map-accessors/20250522-155237
base:   git://anongit.freedesktop.org/drm/drm drm-next
patch link:    https://lore.kernel.org/r/20250522065519.318013-4-airlied%40gmail.com
patch subject: [PATCH 3/9] firmware/tegra: avoid accessing iosys_map internals.
config: arm-randconfig-002-20250523 (https://download.01.org/0day-ci/archive/20250523/202505230806.C7HIxQ4g-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250523/202505230806.C7HIxQ4g-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505230806.C7HIxQ4g-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   drivers/firmware/tegra/ivc.c: In function 'iosys_map_get_address':
>> drivers/firmware/tegra/ivc.c:632:29: error: expected ')' before 'return'
     if (iosys_map_is_iomem(map)
        ~                       ^
                                )
      return (unsigned long)iosys_map_ioptr(map);
      ~~~~~~                     
>> drivers/firmware/tegra/ivc.c:636:1: error: expected expression before '}' token
    }
    ^
>> drivers/firmware/tegra/ivc.c:636:1: warning: no return statement in function returning non-void [-Wreturn-type]


vim +632 drivers/firmware/tegra/ivc.c

   629	
   630	static inline unsigned long iosys_map_get_address(const struct iosys_map *map)
   631	{
 > 632		if (iosys_map_is_iomem(map)
   633			return (unsigned long)iosys_map_ioptr(map);
   634	
   635		return (unsigned long)iosys_map_ptr(map);
 > 636	}
   637	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
