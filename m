Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C50FF525C
	for <oe-kbuild-all@lists.linux.dev>; Mon,  6 Mar 2023 13:21:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678108891; x=1709644891;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=TcW6G+vd9k1EGI64amiNKmA2rquXuAkv2YpDWPF3FHA=;
  b=e9MVIEHnUByrJftFQsz10BE70vViGJ6NqbOIOeeoHt7YAbB4o7Lo0Yrx
   P/pvR+5HjuNOw5KCihBdtir0+qywctAdKCnKRf1fRm+ftiPCQzs7Oib9c
   CIZYKoRwE4spP+hsR5j8bTWIWKOrfn0oswWAbmagx3PkEst0dvt4PewRl
   zltOkRMbfwPrDWuETAMo92H4M04yNdlpYr6occ+KnAtJZ8sMdNNugG9op
   j17jYhXJ2DwF66ifTrbZqfrlPJ4e7FuvYipAgVukeqAOhexgUc6giYpbT
   zMAKMnNAIMkGb9bKKksWe0V8zz0J+OmDh7BFkLsS5qInceYiTuhTs5Ekf
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="337867143"
X-IronPort-AV: E=Sophos;i="5.98,236,1673942400"; 
   d="scan'208";a="337867143"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2023 05:21:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10640"; a="708648738"
X-IronPort-AV: E=Sophos;i="5.98,236,1673942400"; 
   d="scan'208";a="708648738"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 06 Mar 2023 05:21:04 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pZAm0-0000Kt-0P;
	Mon, 06 Mar 2023 13:21:04 +0000
Date: Mon, 6 Mar 2023 21:20:22 +0800
From: kernel test robot <lkp@intel.com>
To: Nirmoy Das <nirmoy.das@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC 3/3] drm/i915/display: Implement fb_mmap callback
 function
Message-ID: <202303062115.IuxJfP8J-lkp@intel.com>
References: <20230306102850.18299-3-nirmoy.das@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230306102850.18299-3-nirmoy.das@intel.com>

Hi Nirmoy,

[FYI, it's a private test report for your RFC patch.]
[auto build test WARNING on drm-tip/drm-tip]

url:    https://github.com/intel-lab-lkp/linux/commits/Nirmoy-Das/drm-i915-Add-a-helper-func-for-gem-obj-mmap/20230306-183112
base:   git://anongit.freedesktop.org/drm/drm-tip drm-tip
patch link:    https://lore.kernel.org/r/20230306102850.18299-3-nirmoy.das%40intel.com
patch subject: [PATCH RFC 3/3] drm/i915/display: Implement fb_mmap callback function
config: x86_64-rhel-8.3 (https://download.01.org/0day-ci/archive/20230306/202303062115.IuxJfP8J-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/intel-lab-lkp/linux/commit/2c504ed19ce4930ccadb2e9060cc79056969c599
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Nirmoy-Das/drm-i915-Add-a-helper-func-for-gem-obj-mmap/20230306-183112
        git checkout 2c504ed19ce4930ccadb2e9060cc79056969c599
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303062115.IuxJfP8J-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/i915/display/intel_fbdev.c: In function 'intel_fbdev_mmap':
>> drivers/gpu/drm/i915/display/intel_fbdev.c:131:28: warning: unused variable 'dev' [-Wunused-variable]
     131 |         struct drm_device *dev = fbdev->helper.dev;
         |                            ^~~


vim +/dev +131 drivers/gpu/drm/i915/display/intel_fbdev.c

   124	
   125	#define to_intel_fbdev(x) container_of(x, struct intel_fbdev, helper)
   126	static int intel_fbdev_mmap(struct fb_info *info, struct vm_area_struct *vma)
   127	{
   128		struct intel_fbdev *fbdev = to_intel_fbdev(info->par);
   129		struct drm_gem_object *bo = drm_gem_fb_get_obj(&fbdev->fb->base, 0);
   130		struct drm_i915_gem_object *obj = to_intel_bo(bo);
 > 131		struct drm_device *dev = fbdev->helper.dev;
   132	
   133		vma->vm_page_prot =
   134				pgprot_writecombine(vm_get_page_prot(vma->vm_flags));
   135	
   136		if (obj->stolen)
   137			return vm_iomap_memory(vma, info->fix.smem_start,
   138					       info->fix.smem_len);
   139	
   140		return i915_gem_object_mmap(obj, vma);
   141	}
   142	static const struct fb_ops intelfb_ops = {
   143		.owner = THIS_MODULE,
   144		DRM_FB_HELPER_DEFAULT_OPS,
   145		.fb_set_par = intel_fbdev_set_par,
   146		.fb_read = drm_fb_helper_cfb_read,
   147		.fb_write = drm_fb_helper_cfb_write,
   148		.fb_fillrect = drm_fb_helper_cfb_fillrect,
   149		.fb_copyarea = drm_fb_helper_cfb_copyarea,
   150		.fb_imageblit = drm_fb_helper_cfb_imageblit,
   151		.fb_pan_display = intel_fbdev_pan_display,
   152		.fb_blank = intel_fbdev_blank,
   153		.fb_mmap = intel_fbdev_mmap,
   154	};
   155	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
