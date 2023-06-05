Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21302BE59
	for <oe-kbuild-all@lists.linux.dev>; Mon,  5 Jun 2023 20:42:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685997745; x=1717533745;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=suxc8o0FtsrgZW4vyIxOLtPKh4M31wECpST8YlROV1M=;
  b=RnKxAcsabZwJ2FziPfVws+l2z9vjs66DfctETJZcJpnK0FuXRNvAMA5I
   s8mB3KMwc23b2JKkHuTEiUEvob3CEz3SKqnADxOGKCHB3Bhpah9UnMrOx
   HBQl2M9V0/rcIxbsiReSaY7dljGCTiQrfgmEu7fX9fxjLkmSB2awskkwq
   AYAfHn5cybZWBJQxph0yaMHua+H5UsCcO8FpgS6U2l90qfo9GBTEnEtTw
   qpOFicx9pMFRq5gSVXDaudpojn0YzDWkuvOcSHpUi+s8MGoFqbtxgeRVD
   NG20lS/1nZhYiwlUfDz5IDcbfLIlWZ5J1PLuXXIInNMuhikyyACkoStGw
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10732"; a="359793560"
X-IronPort-AV: E=Sophos;i="6.00,218,1681196400"; 
   d="scan'208";a="359793560"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2023 13:42:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10732"; a="955460889"
X-IronPort-AV: E=Sophos;i="6.00,218,1681196400"; 
   d="scan'208";a="955460889"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 05 Jun 2023 13:42:23 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q6H1y-0004Qh-1y;
	Mon, 05 Jun 2023 20:42:22 +0000
Date: Tue, 6 Jun 2023 04:42:08 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com,
	Guenter Roeck <groeck@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.1 33/35]
 drivers/gpu/drm/i915/gem/i915_gem_shmem.c:242:6: warning: format specifies
 type 'unsigned long' but the argument has type 'size_t' (aka 'unsigned int')
Message-ID: <202306060422.6sYVPBwx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.1
head:   4f78946f12d0f8736e45d4d060d080279147df92
commit: 4d24181b3ab5a628b4082be6351feb2e6cf5dbfb [33/35] UPSTREAM: drm/i915: Check for integer truncation on scatterlist creation
config: i386-randconfig-i056-20230605 (https://download.01.org/0day-ci/archive/20230606/202306060422.6sYVPBwx-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add chrome-os https://chromium.googlesource.com/chromiumos/third_party/kernel
        git fetch --no-tags chrome-os chromeos-6.1
        git checkout 4d24181b3ab5a628b4082be6351feb2e6cf5dbfb
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=i386 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/gpu/drm/i915/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306060422.6sYVPBwx-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/i915/gem/i915_gem_shmem.c:242:6: warning: format specifies type 'unsigned long' but the argument has type 'size_t' (aka 'unsigned int') [-Wformat]
                                    obj->base.size >> PAGE_SHIFT);
                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:146:70: note: expanded from macro 'dev_warn'
           dev_printk_index_wrap(_dev_warn, KERN_WARNING, dev, dev_fmt(fmt), ##__VA_ARGS__)
                                                                       ~~~     ^~~~~~~~~~~
   include/linux/dev_printk.h:110:23: note: expanded from macro 'dev_printk_index_wrap'
                   _p_func(dev, fmt, ##__VA_ARGS__);                       \
                                ~~~    ^~~~~~~~~~~
   1 warning generated.


vim +242 drivers/gpu/drm/i915/gem/i915_gem_shmem.c

   194	
   195	static int shmem_get_pages(struct drm_i915_gem_object *obj)
   196	{
   197		struct drm_i915_private *i915 = to_i915(obj->base.dev);
   198		struct intel_memory_region *mem = obj->mm.region;
   199		struct address_space *mapping = obj->base.filp->f_mapping;
   200		unsigned int max_segment = i915_sg_segment_size(i915->drm.dev);
   201		struct sg_table *st;
   202		struct sgt_iter sgt_iter;
   203		struct page *page;
   204		int ret;
   205	
   206		/*
   207		 * Assert that the object is not currently in any GPU domain. As it
   208		 * wasn't in the GTT, there shouldn't be any way it could have been in
   209		 * a GPU cache
   210		 */
   211		GEM_BUG_ON(obj->read_domains & I915_GEM_GPU_DOMAINS);
   212		GEM_BUG_ON(obj->write_domain & I915_GEM_GPU_DOMAINS);
   213	
   214	rebuild_st:
   215		st = kmalloc(sizeof(*st), GFP_KERNEL | __GFP_NOWARN);
   216		if (!st)
   217			return -ENOMEM;
   218	
   219		ret = shmem_sg_alloc_table(i915, st, obj->base.size, mem, mapping,
   220					   max_segment);
   221		if (ret)
   222			goto err_st;
   223	
   224		ret = i915_gem_gtt_prepare_pages(obj, st);
   225		if (ret) {
   226			/*
   227			 * DMA remapping failed? One possible cause is that
   228			 * it could not reserve enough large entries, asking
   229			 * for PAGE_SIZE chunks instead may be helpful.
   230			 */
   231			if (max_segment > PAGE_SIZE) {
   232				for_each_sgt_page(page, sgt_iter, st)
   233					put_page(page);
   234				sg_free_table(st);
   235				kfree(st);
   236	
   237				max_segment = PAGE_SIZE;
   238				goto rebuild_st;
   239			} else {
   240				dev_warn(i915->drm.dev,
   241					 "Failed to DMA remap %lu pages\n",
 > 242					 obj->base.size >> PAGE_SHIFT);
   243				goto err_pages;
   244			}
   245		}
   246	
   247		if (i915_gem_object_needs_bit17_swizzle(obj))
   248			i915_gem_object_do_bit_17_swizzle(obj, st);
   249	
   250		if (i915_gem_object_can_bypass_llc(obj))
   251			obj->cache_dirty = true;
   252	
   253		__i915_gem_object_set_pages(obj, st);
   254	
   255		return 0;
   256	
   257	err_pages:
   258		shmem_sg_free_table(st, mapping, false, false);
   259		/*
   260		 * shmemfs first checks if there is enough memory to allocate the page
   261		 * and reports ENOSPC should there be insufficient, along with the usual
   262		 * ENOMEM for a genuine allocation failure.
   263		 *
   264		 * We use ENOSPC in our driver to mean that we have run out of aperture
   265		 * space and so want to translate the error from shmemfs back to our
   266		 * usual understanding of ENOMEM.
   267		 */
   268	err_st:
   269		if (ret == -ENOSPC)
   270			ret = -ENOMEM;
   271	
   272		kfree(st);
   273	
   274		return ret;
   275	}
   276	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
