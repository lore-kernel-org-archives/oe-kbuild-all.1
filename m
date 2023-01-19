Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 186CF3D6E
	for <oe-kbuild-all@lists.linux.dev>; Thu, 19 Jan 2023 21:50:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674165033; x=1705701033;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=HNIirhcJm/i2U/wvNniwD1sNwMfcd5wBrLe+4N5kx5E=;
  b=XWaqN1CgFM6GhgTgXcFpVtPEkk0e08kTm3ZCxHh7Y+x4+vxIebhKup55
   xizRFZfWMo3iadJ0GzutKMX3EJhc0zJfYiI6ZRtwA5BJYt1jF24RyDrsS
   wXDyrDCjWTlmr2K6BqKpqg99rWSzqIlb6YW5oihpxCVZQyydCqTJVf1ZR
   1mEtSznme8SRNOm1PZcSrmIFs37r2tzGtXgjTWNH/cP+sS3WQaV696/jQ
   /4ZmAvxHXf+S+M3W/NVfLgLl/HP8CQnwXWvSmhlnM+8TtzxwSS6QQ+bhA
   iwKI0jpID94AVsYDLpuvf1fh59Zx/1rGA1n/dvQIVZ8C+lSHmHx6dTWtq
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10595"; a="325474676"
X-IronPort-AV: E=Sophos;i="5.97,230,1669104000"; 
   d="scan'208";a="325474676"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2023 13:50:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10595"; a="690792705"
X-IronPort-AV: E=Sophos;i="5.97,230,1669104000"; 
   d="scan'208";a="690792705"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 19 Jan 2023 13:50:25 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pIcng-0001tY-1u;
	Thu, 19 Jan 2023 21:50:24 +0000
Date: Fri, 20 Jan 2023 05:49:52 +0800
From: kernel test robot <lkp@intel.com>
To: Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
Cc: oe-kbuild-all@lists.linux.dev, Rob Clark <robdclark@chromium.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] drm/shmem: Cleanup drm_gem_shmem_create_with_handle()
Message-ID: <202301200511.h6Af907u-lkp@intel.com>
References: <20230119181325.2834875-1-robdclark@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230119181325.2834875-1-robdclark@gmail.com>

Hi Rob,

I love your patch! Perhaps something to improve:

[auto build test WARNING on drm-misc/drm-misc-next]
[also build test WARNING on drm/drm-next drm-exynos/exynos-drm-next drm-intel/for-linux-next drm-intel/for-linux-next-fixes drm-tip/drm-tip linus/master v6.2-rc4 next-20230119]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Rob-Clark/drm-shmem-Cleanup-drm_gem_shmem_create_with_handle/20230120-021440
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20230119181325.2834875-1-robdclark%40gmail.com
patch subject: [PATCH] drm/shmem: Cleanup drm_gem_shmem_create_with_handle()
config: ia64-allyesconfig (https://download.01.org/0day-ci/archive/20230120/202301200511.h6Af907u-lkp@intel.com/config)
compiler: ia64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/0de4f64a7edc0dcbf8ac711d79e203698fcd95a7
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Rob-Clark/drm-shmem-Cleanup-drm_gem_shmem_create_with_handle/20230120-021440
        git checkout 0de4f64a7edc0dcbf8ac711d79e203698fcd95a7
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=ia64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=ia64 SHELL=/bin/bash drivers/gpu/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/drm_gem_shmem_helper.c: In function 'drm_gem_shmem_create_with_handle':
>> drivers/gpu/drm/drm_gem_shmem_helper.c:428:24: warning: returning 'struct drm_gem_shmem_object *' from a function with return type 'int' makes integer from pointer without a cast [-Wint-conversion]
     428 |                 return shmem;
         |                        ^~~~~
   drivers/gpu/drm/drm_gem_shmem_helper.c: In function 'drm_gem_shmem_dumb_create':
   drivers/gpu/drm/drm_gem_shmem_helper.c:521:38: warning: unused variable 'shmem' [-Wunused-variable]
     521 |         struct drm_gem_shmem_object *shmem;
         |                                      ^~~~~


vim +428 drivers/gpu/drm/drm_gem_shmem_helper.c

2194a63a818db7 Noralf Trønnes 2019-03-12  417  
0de4f64a7edc0d Rob Clark      2023-01-19  418  static int
2194a63a818db7 Noralf Trønnes 2019-03-12  419  drm_gem_shmem_create_with_handle(struct drm_file *file_priv,
2194a63a818db7 Noralf Trønnes 2019-03-12  420  				 struct drm_device *dev, size_t size,
2194a63a818db7 Noralf Trønnes 2019-03-12  421  				 uint32_t *handle)
2194a63a818db7 Noralf Trønnes 2019-03-12  422  {
2194a63a818db7 Noralf Trønnes 2019-03-12  423  	struct drm_gem_shmem_object *shmem;
2194a63a818db7 Noralf Trønnes 2019-03-12  424  	int ret;
2194a63a818db7 Noralf Trønnes 2019-03-12  425  
cfe28f909ddd6c Daniel Vetter  2020-06-16  426  	shmem = drm_gem_shmem_create(dev, size);
2194a63a818db7 Noralf Trønnes 2019-03-12  427  	if (IS_ERR(shmem))
2194a63a818db7 Noralf Trønnes 2019-03-12 @428  		return shmem;
2194a63a818db7 Noralf Trønnes 2019-03-12  429  
2194a63a818db7 Noralf Trønnes 2019-03-12  430  	/*
2194a63a818db7 Noralf Trønnes 2019-03-12  431  	 * Allocate an id of idr table where the obj is registered
2194a63a818db7 Noralf Trønnes 2019-03-12  432  	 * and handle has the id what user can see.
2194a63a818db7 Noralf Trønnes 2019-03-12  433  	 */
2194a63a818db7 Noralf Trønnes 2019-03-12  434  	ret = drm_gem_handle_create(file_priv, &shmem->base, handle);
2194a63a818db7 Noralf Trønnes 2019-03-12  435  	/* drop reference from allocate - handle holds it now. */
be6ee102341bc4 Emil Velikov   2020-05-15  436  	drm_gem_object_put(&shmem->base);
2194a63a818db7 Noralf Trønnes 2019-03-12  437  
0de4f64a7edc0d Rob Clark      2023-01-19  438  	return ret;
2194a63a818db7 Noralf Trønnes 2019-03-12  439  }
2194a63a818db7 Noralf Trønnes 2019-03-12  440  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
