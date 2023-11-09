Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 207AE10782
	for <oe-kbuild-all@lists.linux.dev>; Thu,  9 Nov 2023 08:39:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OBSynnh3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699519181; x=1731055181;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=x4tBl4Y/TeZ5LnoSmYE2gsb4O7knLAO9RpSfbq+pB5k=;
  b=OBSynnh3t+579pi7q46uBGD1jAgkdlQPZQSf5NdtAvZYiLT6DI1ASub/
   U267S6460ED3uIhUovWGXfbX3K9cEldWPr4rz0tZnikVfQ/7f+Wpnygwn
   R4wv7hLVm1y/7aqKOkmkaTWeODweT2aRBc4OH3m2P0v9gF/lGw59ZI/ho
   LowvIqo56NZn3nBMLwUaC6QUa+ViROqt5yXyenEBUjLQpS8V/xtnFZtJn
   HkJVMwAS0y3SP/t4TMrDFZUlBSlzOht3fcus8kqVvKa6qYsuTD2ije53m
   if9fSS50F4lp1kNJ9Kq1iiFj2PJTA1wIBc2+sV7x2GygLc4U1IudrjknG
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10888"; a="2974344"
X-IronPort-AV: E=Sophos;i="6.03,289,1694761200"; 
   d="scan'208";a="2974344"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2023 00:39:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,289,1694761200"; 
   d="scan'208";a="4670834"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 09 Nov 2023 00:39:39 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r10Zd-0008ae-0H;
	Thu, 09 Nov 2023 08:39:37 +0000
Date: Thu, 9 Nov 2023 16:38:45 +0800
From: kernel test robot <lkp@intel.com>
To: Harry Wentland <harry.wentland@amd.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH v3 04/23] drm/vkms: Add kunit tests for VKMS LUT
 handling
Message-ID: <202311091611.VVosXT9n-lkp@intel.com>
References: <20231108163647.106853-5-harry.wentland@amd.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231108163647.106853-5-harry.wentland@amd.com>

Hi Harry,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-misc/drm-misc-next]
[also build test WARNING on drm/drm-next drm-exynos/exynos-drm-next drm-intel/for-linux-next drm-intel/for-linux-next-fixes drm-tip/drm-tip linus/master v6.6 next-20231109]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Harry-Wentland/drm-Don-t-treat-0-as-1-in-drm_fixp2int_ceil/20231109-024233
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20231108163647.106853-5-harry.wentland%40amd.com
patch subject: [RFC PATCH v3 04/23] drm/vkms: Add kunit tests for VKMS LUT handling
config: loongarch-randconfig-001-20231109 (https://download.01.org/0day-ci/archive/20231109/202311091611.VVosXT9n-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231109/202311091611.VVosXT9n-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311091611.VVosXT9n-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/vkms/vkms_composer.c:94:5: warning: no previous prototype for 'lerp_u16' [-Wmissing-prototypes]
      94 | u16 lerp_u16(u16 a, u16 b, s64 t)
         |     ^~~~~~~~
>> drivers/gpu/drm/vkms/vkms_composer.c:104:5: warning: no previous prototype for 'get_lut_index' [-Wmissing-prototypes]
     104 | s64 get_lut_index(const struct vkms_color_lut *lut, u16 channel_value)
         |     ^~~~~~~~~~~~~


vim +/lerp_u16 +94 drivers/gpu/drm/vkms/vkms_composer.c

    92	
    93	// lerp(a, b, t) = a + (b - a) * t
  > 94	u16 lerp_u16(u16 a, u16 b, s64 t)
    95	{
    96		s64 a_fp = drm_int2fixp(a);
    97		s64 b_fp = drm_int2fixp(b);
    98	
    99		s64 delta = drm_fixp_mul(b_fp - a_fp,  t);
   100	
   101		return drm_fixp2int(a_fp + delta);
   102	}
   103	
 > 104	s64 get_lut_index(const struct vkms_color_lut *lut, u16 channel_value)
   105	{
   106		s64 color_channel_fp = drm_int2fixp(channel_value);
   107	
   108		return drm_fixp_mul(color_channel_fp, lut->channel_value2index_ratio);
   109	}
   110	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
