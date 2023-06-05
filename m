Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE3C2DDC0
	for <oe-kbuild-all@lists.linux.dev>; Mon,  5 Jun 2023 19:08:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685992102; x=1717528102;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=he9vJl6LgZzy7C57CAzJ5wH5kkYGEHuzzPS10Wa9KZ4=;
  b=CeNDQTupSCkIDyP7g85g7iApjM6UIEJyDZlXGQZHODKnf5nxrXuBs9iJ
   Tcyj0QwNtkyfRwG5TLLJmbL2v93JC+RGRDQlflSW6XMVyuAWsulLSLhJk
   HvsqDbvuFcUh84UeAmtJbPzkX2OVix+VYBvGYsBUReU620hwQpYckmNys
   k+g8HJeTuzWt62p+AdN2N9jNtKHdf4jEY9Q9n0/QEVyDa/AXQaPDbk7n9
   Lp8h5oh0AHSgwA9EcwhtieSKRn4O+RQyCzTDwlEwqeeGdpJkGsKbzJ/+F
   jbiP1jNcA0vY+Tb00tSjJTt0QWAmpmzmahuQkTYdKLOwPZHbA+GA0e7kV
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10732"; a="422282294"
X-IronPort-AV: E=Sophos;i="6.00,218,1681196400"; 
   d="scan'208";a="422282294"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2023 12:08:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10732"; a="711918385"
X-IronPort-AV: E=Sophos;i="6.00,218,1681196400"; 
   d="scan'208";a="711918385"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 05 Jun 2023 12:08:20 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q6FYx-0004N9-2y;
	Mon, 05 Jun 2023 19:08:19 +0000
Date: Tue, 6 Jun 2023 03:07:36 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com,
	Guenter Roeck <groeck@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.1 33/35]
 drivers/gpu/drm/i915/gem/i915_gem_shmem.c:241:34: error: format '%lu'
 expects argument of type 'long unsigned int', but argument 3 has type
 'size_t' {aka 'unsigned int'}
Message-ID: <202306060235.WVu4U0Bx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.1
head:   f4bb02c2f52c15a5573562e4a44bb1b304fe1bcc
commit: 4d24181b3ab5a628b4082be6351feb2e6cf5dbfb [33/35] UPSTREAM: drm/i915: Check for integer truncation on scatterlist creation
config: i386-defconfig (https://download.01.org/0day-ci/archive/20230606/202306060235.WVu4U0Bx-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build):
        git remote add chrome-os https://chromium.googlesource.com/chromiumos/third_party/kernel
        git fetch --no-tags chrome-os chromeos-6.1
        git checkout 4d24181b3ab5a628b4082be6351feb2e6cf5dbfb
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=i386 olddefconfig
        make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306060235.WVu4U0Bx-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/device.h:15,
                    from include/linux/blk_types.h:11,
                    from include/linux/writeback.h:13,
                    from include/linux/memcontrol.h:22,
                    from include/linux/swap.h:9,
                    from include/linux/shmem_fs.h:6,
                    from drivers/gpu/drm/i915/gem/i915_gem_shmem.c:8:
   drivers/gpu/drm/i915/gem/i915_gem_shmem.c: In function 'shmem_get_pages':
>> drivers/gpu/drm/i915/gem/i915_gem_shmem.c:241:34: error: format '%lu' expects argument of type 'long unsigned int', but argument 3 has type 'size_t' {aka 'unsigned int'} [-Werror=format=]
     241 |                                  "Failed to DMA remap %lu pages\n",
         |                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:110:30: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ^~~
   include/linux/dev_printk.h:146:61: note: in expansion of macro 'dev_fmt'
     146 |         dev_printk_index_wrap(_dev_warn, KERN_WARNING, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                             ^~~~~~~
   drivers/gpu/drm/i915/gem/i915_gem_shmem.c:240:25: note: in expansion of macro 'dev_warn'
     240 |                         dev_warn(i915->drm.dev,
         |                         ^~~~~~~~
   drivers/gpu/drm/i915/gem/i915_gem_shmem.c:241:57: note: format string is defined here
     241 |                                  "Failed to DMA remap %lu pages\n",
         |                                                       ~~^
         |                                                         |
         |                                                         long unsigned int
         |                                                       %u
   cc1: all warnings being treated as errors


vim +241 drivers/gpu/drm/i915/gem/i915_gem_shmem.c

f05b985e6f76eb Thomas Hellström  2021-10-18  194  
f05b985e6f76eb Thomas Hellström  2021-10-18  195  static int shmem_get_pages(struct drm_i915_gem_object *obj)
f05b985e6f76eb Thomas Hellström  2021-10-18  196  {
f05b985e6f76eb Thomas Hellström  2021-10-18  197  	struct drm_i915_private *i915 = to_i915(obj->base.dev);
f05b985e6f76eb Thomas Hellström  2021-10-18  198  	struct intel_memory_region *mem = obj->mm.region;
f05b985e6f76eb Thomas Hellström  2021-10-18  199  	struct address_space *mapping = obj->base.filp->f_mapping;
d3f6bacfca86f6 Robert Beckett    2022-10-20  200  	unsigned int max_segment = i915_sg_segment_size(i915->drm.dev);
f05b985e6f76eb Thomas Hellström  2021-10-18  201  	struct sg_table *st;
f05b985e6f76eb Thomas Hellström  2021-10-18  202  	struct sgt_iter sgt_iter;
f05b985e6f76eb Thomas Hellström  2021-10-18  203  	struct page *page;
f05b985e6f76eb Thomas Hellström  2021-10-18  204  	int ret;
f05b985e6f76eb Thomas Hellström  2021-10-18  205  
f05b985e6f76eb Thomas Hellström  2021-10-18  206  	/*
f05b985e6f76eb Thomas Hellström  2021-10-18  207  	 * Assert that the object is not currently in any GPU domain. As it
f05b985e6f76eb Thomas Hellström  2021-10-18  208  	 * wasn't in the GTT, there shouldn't be any way it could have been in
f05b985e6f76eb Thomas Hellström  2021-10-18  209  	 * a GPU cache
f05b985e6f76eb Thomas Hellström  2021-10-18  210  	 */
f05b985e6f76eb Thomas Hellström  2021-10-18  211  	GEM_BUG_ON(obj->read_domains & I915_GEM_GPU_DOMAINS);
f05b985e6f76eb Thomas Hellström  2021-10-18  212  	GEM_BUG_ON(obj->write_domain & I915_GEM_GPU_DOMAINS);
f05b985e6f76eb Thomas Hellström  2021-10-18  213  
f05b985e6f76eb Thomas Hellström  2021-10-18  214  rebuild_st:
a8c18bec83a82a Chris Wilson      2022-07-27  215  	st = kmalloc(sizeof(*st), GFP_KERNEL | __GFP_NOWARN);
cad7109a2b5e7d Thomas Hellström  2021-11-01  216  	if (!st)
cad7109a2b5e7d Thomas Hellström  2021-11-01  217  		return -ENOMEM;
cad7109a2b5e7d Thomas Hellström  2021-11-01  218  
cad7109a2b5e7d Thomas Hellström  2021-11-01  219  	ret = shmem_sg_alloc_table(i915, st, obj->base.size, mem, mapping,
cad7109a2b5e7d Thomas Hellström  2021-11-01  220  				   max_segment);
cad7109a2b5e7d Thomas Hellström  2021-11-01  221  	if (ret)
f05b985e6f76eb Thomas Hellström  2021-10-18  222  		goto err_st;
f05b985e6f76eb Thomas Hellström  2021-10-18  223  
8475355f7a2645 Chris Wilson      2019-05-28  224  	ret = i915_gem_gtt_prepare_pages(obj, st);
8475355f7a2645 Chris Wilson      2019-05-28  225  	if (ret) {
8475355f7a2645 Chris Wilson      2019-05-28  226  		/*
8475355f7a2645 Chris Wilson      2019-05-28  227  		 * DMA remapping failed? One possible cause is that
8475355f7a2645 Chris Wilson      2019-05-28  228  		 * it could not reserve enough large entries, asking
8475355f7a2645 Chris Wilson      2019-05-28  229  		 * for PAGE_SIZE chunks instead may be helpful.
8475355f7a2645 Chris Wilson      2019-05-28  230  		 */
8475355f7a2645 Chris Wilson      2019-05-28  231  		if (max_segment > PAGE_SIZE) {
8475355f7a2645 Chris Wilson      2019-05-28  232  			for_each_sgt_page(page, sgt_iter, st)
8475355f7a2645 Chris Wilson      2019-05-28  233  				put_page(page);
8475355f7a2645 Chris Wilson      2019-05-28  234  			sg_free_table(st);
f05b985e6f76eb Thomas Hellström  2021-10-18  235  			kfree(st);
8475355f7a2645 Chris Wilson      2019-05-28  236  
8475355f7a2645 Chris Wilson      2019-05-28  237  			max_segment = PAGE_SIZE;
8475355f7a2645 Chris Wilson      2019-05-28  238  			goto rebuild_st;
8475355f7a2645 Chris Wilson      2019-05-28  239  		} else {
8ff5446a7ca47c Thomas Zimmermann 2021-01-28  240  			dev_warn(i915->drm.dev,
8475355f7a2645 Chris Wilson      2019-05-28 @241  				 "Failed to DMA remap %lu pages\n",
4d24181b3ab5a6 Chris Wilson      2022-12-28  242  				 obj->base.size >> PAGE_SHIFT);
8475355f7a2645 Chris Wilson      2019-05-28  243  			goto err_pages;
8475355f7a2645 Chris Wilson      2019-05-28  244  		}
8475355f7a2645 Chris Wilson      2019-05-28  245  	}
8475355f7a2645 Chris Wilson      2019-05-28  246  
8475355f7a2645 Chris Wilson      2019-05-28  247  	if (i915_gem_object_needs_bit17_swizzle(obj))
8475355f7a2645 Chris Wilson      2019-05-28  248  		i915_gem_object_do_bit_17_swizzle(obj, st);
8475355f7a2645 Chris Wilson      2019-05-28  249  
30f1dccd295b68 Matthew Auld      2021-10-18  250  	if (i915_gem_object_can_bypass_llc(obj))
13d29c823738c0 Matthew Auld      2021-07-23  251  		obj->cache_dirty = true;
13d29c823738c0 Matthew Auld      2021-07-23  252  
fa00223f2b0b56 Matthew Auld      2022-11-08  253  	__i915_gem_object_set_pages(obj, st);
8475355f7a2645 Chris Wilson      2019-05-28  254  
8475355f7a2645 Chris Wilson      2019-05-28  255  	return 0;
8475355f7a2645 Chris Wilson      2019-05-28  256  
8475355f7a2645 Chris Wilson      2019-05-28  257  err_pages:
cad7109a2b5e7d Thomas Hellström  2021-11-01  258  	shmem_sg_free_table(st, mapping, false, false);
8475355f7a2645 Chris Wilson      2019-05-28  259  	/*
8475355f7a2645 Chris Wilson      2019-05-28  260  	 * shmemfs first checks if there is enough memory to allocate the page
8475355f7a2645 Chris Wilson      2019-05-28  261  	 * and reports ENOSPC should there be insufficient, along with the usual
8475355f7a2645 Chris Wilson      2019-05-28  262  	 * ENOMEM for a genuine allocation failure.
8475355f7a2645 Chris Wilson      2019-05-28  263  	 *
8475355f7a2645 Chris Wilson      2019-05-28  264  	 * We use ENOSPC in our driver to mean that we have run out of aperture
8475355f7a2645 Chris Wilson      2019-05-28  265  	 * space and so want to translate the error from shmemfs back to our
8475355f7a2645 Chris Wilson      2019-05-28  266  	 * usual understanding of ENOMEM.
8475355f7a2645 Chris Wilson      2019-05-28  267  	 */
f05b985e6f76eb Thomas Hellström  2021-10-18  268  err_st:
8475355f7a2645 Chris Wilson      2019-05-28  269  	if (ret == -ENOSPC)
8475355f7a2645 Chris Wilson      2019-05-28  270  		ret = -ENOMEM;
8475355f7a2645 Chris Wilson      2019-05-28  271  
cad7109a2b5e7d Thomas Hellström  2021-11-01  272  	kfree(st);
cad7109a2b5e7d Thomas Hellström  2021-11-01  273  
8475355f7a2645 Chris Wilson      2019-05-28  274  	return ret;
8475355f7a2645 Chris Wilson      2019-05-28  275  }
8475355f7a2645 Chris Wilson      2019-05-28  276  

:::::: The code at line 241 was first introduced by commit
:::::: 8475355f7a2645a022288301c03555c31fb4de17 drm/i915: Move shmem object setup to its own file

:::::: TO: Chris Wilson <chris@chris-wilson.co.uk>
:::::: CC: Chris Wilson <chris@chris-wilson.co.uk>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
