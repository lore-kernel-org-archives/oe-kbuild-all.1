Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 530F67E
	for <oe-kbuild-all@lists.linux.dev>; Wed,  3 May 2023 02:13:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683079992; x=1714615992;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ybQin6nLya82IHFbtByd2WPt+cykpKfcD1YvRkLYNVQ=;
  b=AHmOYwTXDugO0wGfICmgvnCYJkMyZSM3heKgJUxYOgRFazpKUP/wBAt8
   qmY7s85I6x29hb79eNSyVMTVAUDqyt3EyPbhMyDWlbeJU5gpvXtPXLYmQ
   2i6BB1YwpRJ/tQY1yeJmmtIoI/GTpiBE59lrV5GRXxCG8iU8bvsJNc/DJ
   p5e2UFSni234aSc/uhD7dBtQolL00viFEKDh2IiLmJ0bzMhWGTh38UGnC
   nski34oaDpk7BdGidfM18Ols7Q+P20SnriFZX0WF01A8rzZ8cJ5e2O0sR
   6Bt0uLdNK2IcW77Xfa2US9oaZedY2LygfqUZ6/JvUM2pFb4vOWSwK/GTA
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10698"; a="328913444"
X-IronPort-AV: E=Sophos;i="5.99,245,1677571200"; 
   d="scan'208";a="328913444"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 May 2023 19:12:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10698"; a="785892131"
X-IronPort-AV: E=Sophos;i="5.99,245,1677571200"; 
   d="scan'208";a="785892131"
Received: from lkp-server01.sh.intel.com (HELO e3434d64424d) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 02 May 2023 19:11:46 -0700
Received: from kbuild by e3434d64424d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pu1y5-0001Q0-2y;
	Wed, 03 May 2023 02:11:45 +0000
Date: Wed, 3 May 2023 10:11:24 +0800
From: kernel test robot <lkp@intel.com>
To: Jordan Justen <jordan.l.justen@intel.com>,
	intel-gfx@lists.freedesktop.org
Cc: oe-kbuild-all@lists.linux.dev, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [Intel-gfx] [PATCH] drm/i915/uapi: Add
 DRM_I915_QUERY_GEM_CREATE_EXTENSIONS query item
Message-ID: <202305030956.nFO16YoS-lkp@intel.com>
References: <20230502205744.1067094-1-jordan.l.justen@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230502205744.1067094-1-jordan.l.justen@intel.com>

Hi Jordan,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm-tip/drm-tip]

url:    https://github.com/intel-lab-lkp/linux/commits/Jordan-Justen/drm-i915-uapi-Add-DRM_I915_QUERY_GEM_CREATE_EXTENSIONS-query-item/20230503-050014
base:   git://anongit.freedesktop.org/drm/drm-tip drm-tip
patch link:    https://lore.kernel.org/r/20230502205744.1067094-1-jordan.l.justen%40intel.com
patch subject: [Intel-gfx] [PATCH] drm/i915/uapi: Add DRM_I915_QUERY_GEM_CREATE_EXTENSIONS query item
config: i386-allyesconfig (https://download.01.org/0day-ci/archive/20230503/202305030956.nFO16YoS-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/intel-lab-lkp/linux/commit/1154a573531c350e27ca98fd4b4e8da7352f849e
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Jordan-Justen/drm-i915-uapi-Add-DRM_I915_QUERY_GEM_CREATE_EXTENSIONS-query-item/20230503-050014
        git checkout 1154a573531c350e27ca98fd4b4e8da7352f849e
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=i386 olddefconfig
        make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305030956.nFO16YoS-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <command-line>:
>> drivers/gpu/drm/i915/gem/i915_gem_create.h:17:54: error: unknown type name 'size_t'
      17 | int i915_gem_create_ext_get_extensions(void *buffer, size_t buffer_size);
         |                                                      ^~~~~~
   drivers/gpu/drm/i915/gem/i915_gem_create.h:1:1: note: 'size_t' is defined in header '<stddef.h>'; did you forget to '#include <stddef.h>'?
     +++ |+#include <stddef.h>
       1 | /* SPDX-License-Identifier: MIT */


vim +/size_t +17 drivers/gpu/drm/i915/gem/i915_gem_create.h

    12	
    13	int i915_gem_dumb_create(struct drm_file *file_priv,
    14				 struct drm_device *dev,
    15				 struct drm_mode_create_dumb *args);
    16	
  > 17	int i915_gem_create_ext_get_extensions(void *buffer, size_t buffer_size);
    18	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
