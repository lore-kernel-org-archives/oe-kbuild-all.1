Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5F6C2576
	for <oe-kbuild-all@lists.linux.dev>; Tue, 22 Jul 2025 16:53:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753203197; cv=none; b=hWFFohEEOeHI0rehZzpBbdwVFs+p72uohJRi+EcqqQ1Gb/a+6f2dUfnfD27Xbspk5OZHtbUAOuvkKbopzQMeuQtfKM4ImTu33enjQo0otlWEIwxUMpc8Z1OkGuA8rZHtsVOzXSsQiXw8tsyYLYtbMMETuNttLzbTclw6ysm+4qk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753203197; c=relaxed/simple;
	bh=CkaSBlwzzYaGcAnLPWY/P+SSy1fbLBWJPLy6c9IYQlI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PpBn2GCnKEfG+23cYs/MQRi5aE7nr1fnYcfEJ4g/pLIhkGALbr6WceQmz5lPf6urV2g+TA5bIpRL2tttqreIlZGgmOuzVoE64K79JaxryYb0tZcNGGPqbPEio2Uljg/Z3sbxScGng4vcfCmvUue4PJTXxBtLTyV1bf864noE/l0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bvXXYSIp; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bvXXYSIp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753203195; x=1784739195;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=CkaSBlwzzYaGcAnLPWY/P+SSy1fbLBWJPLy6c9IYQlI=;
  b=bvXXYSIpiPwOgEP6/GvctIMANulcvHkF725K28dYyAxeR3bx30oP90zR
   rHOVuQVlt9A4VZ7CRxNfRe/9XSTkTMwA0MfpEh5kK2kUfHxZgohOh/4Js
   RzqTwOr7lQEoDnlD2eaWjH7N0DHWUbkm51hxU9oyDUxYTuRWeV14eBgR+
   xmPH43NKWHPzskeNfI4Ob36ybkicykUNjw2oYsXvgaYUhojoQDlVY1Uo/
   fX8f1MAgXAmpH+eKy7lePHt7fbnQfAvUOJI/zieQifUuqQ6nap/qjI7SY
   SiktKOV0oaH5d0KBunQB+7H5rGY6W41y2Pj+SX6lVNNjiqFZHtJKNqYuG
   A==;
X-CSE-ConnectionGUID: P3zyCkzgTDiB7FZB7AeHNw==
X-CSE-MsgGUID: gtujBgvZTLGUxsWM9MZMRw==
X-IronPort-AV: E=McAfee;i="6800,10657,11500"; a="55316298"
X-IronPort-AV: E=Sophos;i="6.16,331,1744095600"; 
   d="scan'208";a="55316298"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jul 2025 09:53:15 -0700
X-CSE-ConnectionGUID: HEoKRkggRsaAZDKRCtkP8w==
X-CSE-MsgGUID: sm7HFahMQHucoTbGEEvprw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,331,1744095600"; 
   d="scan'208";a="158495843"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 22 Jul 2025 09:53:12 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ueGEo-000IYZ-14;
	Tue, 22 Jul 2025 16:53:10 +0000
Date: Wed, 23 Jul 2025 00:52:21 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org,
	linux-mm@kvack.org, Johannes Weiner <hannes@cmpxchg.org>,
	Christian Koenig <christian.koenig@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, Dave Chinner <david@fromorbit.com>,
	Kairui Song <kasong@tencent.com>, Dave Airlie <airlied@redhat.com>
Subject: Re: [PATCH 15/15] ttm: add support for a module option to disable
 memcg integration
Message-ID: <202507230039.EESybnUE-lkp@intel.com>
References: <20250722014942.1878844-16-airlied@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250722014942.1878844-16-airlied@gmail.com>

Hi Dave,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm/drm-next]
[cannot apply to akpm-mm/mm-everything linus/master v6.16-rc7 next-20250722]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Dave-Airlie/drm-ttm-use-gpu-mm-stats-to-track-gpu-memory-allocations-v4/20250722-104402
base:   git://anongit.freedesktop.org/drm/drm drm-next
patch link:    https://lore.kernel.org/r/20250722014942.1878844-16-airlied%40gmail.com
patch subject: [PATCH 15/15] ttm: add support for a module option to disable memcg integration
config: x86_64-buildonly-randconfig-001-20250722 (https://download.01.org/0day-ci/archive/20250723/202507230039.EESybnUE-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250723/202507230039.EESybnUE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507230039.EESybnUE-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/ttm/ttm_pool.c:132:27: error: 'CONFIG_DRM_TTM_MEMCG' undeclared here (not in a function); did you mean 'CONFIG_DRM_TTM_HELPER'?
     132 | #define DEFAULT_TTM_MEMCG CONFIG_DRM_TTM_MEMCG
         |                           ^~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/ttm/ttm_pool.c:133:25: note: in expansion of macro 'DEFAULT_TTM_MEMCG'
     133 | static bool ttm_memcg = DEFAULT_TTM_MEMCG;
         |                         ^~~~~~~~~~~~~~~~~


vim +132 drivers/gpu/drm/ttm/ttm_pool.c

   120	
   121	/*
   122	 * Don't use the memcg aware lru for pooled pages.
   123	 *
   124	 * There are use-cases where for example one application in a cgroup will preallocate 1GB
   125	 * of uncached pages, and immediately release them into the pool, for other consumers
   126	 * to use. This use-case could be handled with a proper cgroup hierarchy, but to allow
   127	 * that use case to continue to operate as-is, add a module option.
   128	 *
   129	 * This still stores the pages in the list_lru, it just doesn't use the memcg when
   130	 * adding/removing them.
   131	 */
 > 132	#define DEFAULT_TTM_MEMCG CONFIG_DRM_TTM_MEMCG
   133	static bool ttm_memcg = DEFAULT_TTM_MEMCG;
   134	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
