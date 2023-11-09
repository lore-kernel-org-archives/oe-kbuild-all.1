Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D1F51B268
	for <oe-kbuild-all@lists.linux.dev>; Thu,  9 Nov 2023 11:40:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZE5KEYOQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699530047; x=1731066047;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=9qF3dF38kDBixR4mQt95+Xaa3n3wtg8txP5TbbVFxUg=;
  b=ZE5KEYOQ7eQ0JKbdwJ3qQUmhm+RLqGP1BXgEgrYjh37TMsDn377oHxLt
   FTbwgoEAYbUQpUBnbrXvQYzRFgGEVO9JtFtoROWRZffwjADT+IJek/jUt
   JEJctYIhjUoNx/cptPfnEAUylvrbaQnwLzy0n9OaQICHmirxPKtV8BUZw
   ufXyt4w40aJ0lDAMD9iM2amzW/YbzfmMBCOTG0gjJj7dpk2t/8T0X888d
   Eay38TpyVppbE8NjZ/h8phuo1yHNENU4RGVBHW7nVTwIEYd7YFlphPodN
   sz1Wq994Te8ycVryG5f2WCR+NomslEnsi0ragHFUcK4ZAahRw9Kk88fJT
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10888"; a="8618151"
X-IronPort-AV: E=Sophos;i="6.03,289,1694761200"; 
   d="scan'208";a="8618151"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2023 03:40:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10888"; a="886968693"
X-IronPort-AV: E=Sophos;i="6.03,289,1694761200"; 
   d="scan'208";a="886968693"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 09 Nov 2023 03:40:45 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r13Ot-0008gx-1E;
	Thu, 09 Nov 2023 11:40:43 +0000
Date: Thu, 9 Nov 2023 19:40:06 +0800
From: kernel test robot <lkp@intel.com>
To: Harry Wentland <harry.wentland@amd.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH v3 08/23] drm/colorop: Add TYPE property
Message-ID: <202311091918.6grWxuzJ-lkp@intel.com>
References: <20231108163647.106853-9-harry.wentland@amd.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231108163647.106853-9-harry.wentland@amd.com>

Hi Harry,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-misc/drm-misc-next]
[also build test WARNING on drm-tip/drm-tip]
[cannot apply to drm/drm-next drm-exynos/exynos-drm-next drm-intel/for-linux-next drm-intel/for-linux-next-fixes linus/master v6.6 next-20231109]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Harry-Wentland/drm-Don-t-treat-0-as-1-in-drm_fixp2int_ceil/20231109-024233
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20231108163647.106853-9-harry.wentland%40amd.com
patch subject: [RFC PATCH v3 08/23] drm/colorop: Add TYPE property
config: loongarch-randconfig-001-20231109 (https://download.01.org/0day-ci/archive/20231109/202311091918.6grWxuzJ-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231109/202311091918.6grWxuzJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311091918.6grWxuzJ-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/drm_colorop.c:116:6: warning: no previous prototype for 'drm_colorop_destroy_state' [-Wmissing-prototypes]
     116 | void drm_colorop_destroy_state(struct drm_colorop *colorop,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/drm_colorop.c:187:13: warning: no previous prototype for 'drm_get_colorop_type_name' [-Wmissing-prototypes]
     187 | const char *drm_get_colorop_type_name(enum drm_colorop_type type)
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/drm_colorop.c:35:40: warning: 'drm_colorop_type_enum_list' defined but not used [-Wunused-const-variable=]
      35 | static const struct drm_prop_enum_list drm_colorop_type_enum_list[] = {
         |                                        ^~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/drm_colorop_type_enum_list +35 drivers/gpu/drm/drm_colorop.c

    34	
  > 35	static const struct drm_prop_enum_list drm_colorop_type_enum_list[] = {
    36		{ DRM_COLOROP_1D_CURVE, "1D Curve" },
    37	};
    38	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
