Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4155320F
	for <oe-kbuild-all@lists.linux.dev>; Sun, 22 Jan 2023 23:54:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674431687; x=1705967687;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5HPKJcw+YR9nsSyxnhBw29uLRZ6WzQA1u/WUYCbNySE=;
  b=foP0uY0DOgGPVzbUvZPHcZhQMjrXy2TtoSoaJFe0hihz6edhoSav+S3y
   /Ardd+jzoSiVqFU8hn6hLWq9jiC7tVjqFrFhvOnl70FRnMRmZvN1pHvL0
   hCZGwrP1FPMYkpO1FXglqRGjj1BIjvW5mlofwp9UJbiEvsnWpQVt8bi57
   6piJgNiCl3gOCj/MeuuGOhVwmFpcqBV8dn8+spSCczYMMm+tNXAWE/aUD
   thcze0Bkbb35KHj6eAWng+EKxe1TGj9AaOJQfttGlTSP4MTBjQFEylQrw
   DyjI/UxBlEosqLL0wTwUoKahLrWvC0VQtrS/t/OvmliEZfmBuJcj4U3tt
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10598"; a="309527525"
X-IronPort-AV: E=Sophos;i="5.97,238,1669104000"; 
   d="scan'208";a="309527525"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2023 15:54:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10598"; a="691952305"
X-IronPort-AV: E=Sophos;i="5.97,238,1669104000"; 
   d="scan'208";a="691952305"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 22 Jan 2023 15:54:45 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pJkAf-0005Ia-0T;
	Sun, 22 Jan 2023 23:54:45 +0000
Date: Mon, 23 Jan 2023 07:54:01 +0800
From: kernel test robot <lkp@intel.com>
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [pinchartl:drm/compile-test 5/9]
 drivers/gpu/drm/omapdrm/omap_gem.c:1034:41: warning: passing argument 2 of
 'sg_set_page' makes pointer from integer without a cast
Message-ID: <202301230738.mvObvRxm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Laurent,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/pinchartl/linux.git drm/compile-test
head:   ac2ff1e9fb5162127c092c1f7dc86b4eb7537b09
commit: 6a2f2488d8ef33515e03ce44633d56c08957b2de [5/9] drm/omap: Enable COMPILE_TEST on all architectures
config: sparc-allyesconfig (https://download.01.org/0day-ci/archive/20230123/202301230738.mvObvRxm-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/pinchartl/linux.git/commit/?id=6a2f2488d8ef33515e03ce44633d56c08957b2de
        git remote add pinchartl https://git.kernel.org/pub/scm/linux/kernel/git/pinchartl/linux.git
        git fetch --no-tags pinchartl drm/compile-test
        git checkout 6a2f2488d8ef33515e03ce44633d56c08957b2de
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sparc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sparc SHELL=/bin/bash drivers/gpu/drm/omapdrm/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/omapdrm/omap_gem.c: In function 'omap_gem_get_sg':
   drivers/gpu/drm/omapdrm/omap_gem.c:1034:41: error: implicit declaration of function 'phys_to_page'; did you mean 'pfn_to_page'? [-Werror=implicit-function-declaration]
    1034 |                         sg_set_page(sg, phys_to_page(addr), len,
         |                                         ^~~~~~~~~~~~
         |                                         pfn_to_page
>> drivers/gpu/drm/omapdrm/omap_gem.c:1034:41: warning: passing argument 2 of 'sg_set_page' makes pointer from integer without a cast [-Wint-conversion]
    1034 |                         sg_set_page(sg, phys_to_page(addr), len,
         |                                         ^~~~~~~~~~~~~~~~~~
         |                                         |
         |                                         int
   In file included from include/linux/dma-mapping.h:10,
                    from drivers/gpu/drm/omapdrm/omap_gem.c:7:
   include/linux/scatterlist.h:136:69: note: expected 'struct page *' but argument is of type 'int'
     136 | static inline void sg_set_page(struct scatterlist *sg, struct page *page,
         |                                                        ~~~~~~~~~~~~~^~~~
   cc1: some warnings being treated as errors


vim +/sg_set_page +1034 drivers/gpu/drm/omapdrm/omap_gem.c

cd5351f4d2b1b8 drivers/staging/omapdrm/omap_gem.c Rob Clark       2011-11-12   982  
1948d28db6215d drivers/gpu/drm/omapdrm/omap_gem.c Ivaylo Dimitrov 2022-01-19   983  struct sg_table *omap_gem_get_sg(struct drm_gem_object *obj,
1948d28db6215d drivers/gpu/drm/omapdrm/omap_gem.c Ivaylo Dimitrov 2022-01-19   984  		enum dma_data_direction dir)
fe4d0b6317e35a drivers/gpu/drm/omapdrm/omap_gem.c Ivaylo Dimitrov 2021-11-19   985  {
fe4d0b6317e35a drivers/gpu/drm/omapdrm/omap_gem.c Ivaylo Dimitrov 2021-11-19   986  	struct omap_gem_object *omap_obj = to_omap_bo(obj);
fe4d0b6317e35a drivers/gpu/drm/omapdrm/omap_gem.c Ivaylo Dimitrov 2021-11-19   987  	dma_addr_t addr;
fe4d0b6317e35a drivers/gpu/drm/omapdrm/omap_gem.c Ivaylo Dimitrov 2021-11-19   988  	struct sg_table *sgt;
fe4d0b6317e35a drivers/gpu/drm/omapdrm/omap_gem.c Ivaylo Dimitrov 2021-11-19   989  	struct scatterlist *sg;
fe4d0b6317e35a drivers/gpu/drm/omapdrm/omap_gem.c Ivaylo Dimitrov 2021-11-19   990  	unsigned int count, len, stride, i;
fe4d0b6317e35a drivers/gpu/drm/omapdrm/omap_gem.c Ivaylo Dimitrov 2021-11-19   991  	int ret;
fe4d0b6317e35a drivers/gpu/drm/omapdrm/omap_gem.c Ivaylo Dimitrov 2021-11-19   992  
fe4d0b6317e35a drivers/gpu/drm/omapdrm/omap_gem.c Ivaylo Dimitrov 2021-11-19   993  	ret = omap_gem_pin(obj, &addr);
fe4d0b6317e35a drivers/gpu/drm/omapdrm/omap_gem.c Ivaylo Dimitrov 2021-11-19   994  	if (ret)
fe4d0b6317e35a drivers/gpu/drm/omapdrm/omap_gem.c Ivaylo Dimitrov 2021-11-19   995  		return ERR_PTR(ret);
fe4d0b6317e35a drivers/gpu/drm/omapdrm/omap_gem.c Ivaylo Dimitrov 2021-11-19   996  
fe4d0b6317e35a drivers/gpu/drm/omapdrm/omap_gem.c Ivaylo Dimitrov 2021-11-19   997  	mutex_lock(&omap_obj->lock);
fe4d0b6317e35a drivers/gpu/drm/omapdrm/omap_gem.c Ivaylo Dimitrov 2021-11-19   998  
fe4d0b6317e35a drivers/gpu/drm/omapdrm/omap_gem.c Ivaylo Dimitrov 2021-11-19   999  	sgt = omap_obj->sgt;
fe4d0b6317e35a drivers/gpu/drm/omapdrm/omap_gem.c Ivaylo Dimitrov 2021-11-19  1000  	if (sgt)
fe4d0b6317e35a drivers/gpu/drm/omapdrm/omap_gem.c Ivaylo Dimitrov 2021-11-19  1001  		goto out;
fe4d0b6317e35a drivers/gpu/drm/omapdrm/omap_gem.c Ivaylo Dimitrov 2021-11-19  1002  
fe4d0b6317e35a drivers/gpu/drm/omapdrm/omap_gem.c Ivaylo Dimitrov 2021-11-19  1003  	sgt = kzalloc(sizeof(*sgt), GFP_KERNEL);
fe4d0b6317e35a drivers/gpu/drm/omapdrm/omap_gem.c Ivaylo Dimitrov 2021-11-19  1004  	if (!sgt) {
fe4d0b6317e35a drivers/gpu/drm/omapdrm/omap_gem.c Ivaylo Dimitrov 2021-11-19  1005  		ret = -ENOMEM;
fe4d0b6317e35a drivers/gpu/drm/omapdrm/omap_gem.c Ivaylo Dimitrov 2021-11-19  1006  		goto err_unpin;
fe4d0b6317e35a drivers/gpu/drm/omapdrm/omap_gem.c Ivaylo Dimitrov 2021-11-19  1007  	}
fe4d0b6317e35a drivers/gpu/drm/omapdrm/omap_gem.c Ivaylo Dimitrov 2021-11-19  1008  
1948d28db6215d drivers/gpu/drm/omapdrm/omap_gem.c Ivaylo Dimitrov 2022-01-19  1009  	if (addr) {
fe4d0b6317e35a drivers/gpu/drm/omapdrm/omap_gem.c Ivaylo Dimitrov 2021-11-19  1010  		if (omap_obj->flags & OMAP_BO_TILED_MASK) {
fe4d0b6317e35a drivers/gpu/drm/omapdrm/omap_gem.c Ivaylo Dimitrov 2021-11-19  1011  			enum tiler_fmt fmt = gem2fmt(omap_obj->flags);
fe4d0b6317e35a drivers/gpu/drm/omapdrm/omap_gem.c Ivaylo Dimitrov 2021-11-19  1012  
fe4d0b6317e35a drivers/gpu/drm/omapdrm/omap_gem.c Ivaylo Dimitrov 2021-11-19  1013  			len = omap_obj->width << (int)fmt;
fe4d0b6317e35a drivers/gpu/drm/omapdrm/omap_gem.c Ivaylo Dimitrov 2021-11-19  1014  			count = omap_obj->height;
fe4d0b6317e35a drivers/gpu/drm/omapdrm/omap_gem.c Ivaylo Dimitrov 2021-11-19  1015  			stride = tiler_stride(fmt, 0);
fe4d0b6317e35a drivers/gpu/drm/omapdrm/omap_gem.c Ivaylo Dimitrov 2021-11-19  1016  		} else {
fe4d0b6317e35a drivers/gpu/drm/omapdrm/omap_gem.c Ivaylo Dimitrov 2021-11-19  1017  			len = obj->size;
fe4d0b6317e35a drivers/gpu/drm/omapdrm/omap_gem.c Ivaylo Dimitrov 2021-11-19  1018  			count = 1;
fe4d0b6317e35a drivers/gpu/drm/omapdrm/omap_gem.c Ivaylo Dimitrov 2021-11-19  1019  			stride = 0;
fe4d0b6317e35a drivers/gpu/drm/omapdrm/omap_gem.c Ivaylo Dimitrov 2021-11-19  1020  		}
1948d28db6215d drivers/gpu/drm/omapdrm/omap_gem.c Ivaylo Dimitrov 2022-01-19  1021  	} else {
1948d28db6215d drivers/gpu/drm/omapdrm/omap_gem.c Ivaylo Dimitrov 2022-01-19  1022  		count = obj->size >> PAGE_SHIFT;
1948d28db6215d drivers/gpu/drm/omapdrm/omap_gem.c Ivaylo Dimitrov 2022-01-19  1023  	}
fe4d0b6317e35a drivers/gpu/drm/omapdrm/omap_gem.c Ivaylo Dimitrov 2021-11-19  1024  
fe4d0b6317e35a drivers/gpu/drm/omapdrm/omap_gem.c Ivaylo Dimitrov 2021-11-19  1025  	ret = sg_alloc_table(sgt, count, GFP_KERNEL);
fe4d0b6317e35a drivers/gpu/drm/omapdrm/omap_gem.c Ivaylo Dimitrov 2021-11-19  1026  	if (ret)
fe4d0b6317e35a drivers/gpu/drm/omapdrm/omap_gem.c Ivaylo Dimitrov 2021-11-19  1027  		goto err_free;
fe4d0b6317e35a drivers/gpu/drm/omapdrm/omap_gem.c Ivaylo Dimitrov 2021-11-19  1028  
1948d28db6215d drivers/gpu/drm/omapdrm/omap_gem.c Ivaylo Dimitrov 2022-01-19  1029  	/* this must be after omap_gem_pin() to ensure we have pages attached */
1948d28db6215d drivers/gpu/drm/omapdrm/omap_gem.c Ivaylo Dimitrov 2022-01-19  1030  	omap_gem_dma_sync_buffer(obj, dir);
1948d28db6215d drivers/gpu/drm/omapdrm/omap_gem.c Ivaylo Dimitrov 2022-01-19  1031  
1948d28db6215d drivers/gpu/drm/omapdrm/omap_gem.c Ivaylo Dimitrov 2022-01-19  1032  	if (addr) {
fe4d0b6317e35a drivers/gpu/drm/omapdrm/omap_gem.c Ivaylo Dimitrov 2021-11-19  1033  		for_each_sg(sgt->sgl, sg, count, i) {
1948d28db6215d drivers/gpu/drm/omapdrm/omap_gem.c Ivaylo Dimitrov 2022-01-19 @1034  			sg_set_page(sg, phys_to_page(addr), len,
1948d28db6215d drivers/gpu/drm/omapdrm/omap_gem.c Ivaylo Dimitrov 2022-01-19  1035  				offset_in_page(addr));
fe4d0b6317e35a drivers/gpu/drm/omapdrm/omap_gem.c Ivaylo Dimitrov 2021-11-19  1036  			sg_dma_address(sg) = addr;
fe4d0b6317e35a drivers/gpu/drm/omapdrm/omap_gem.c Ivaylo Dimitrov 2021-11-19  1037  			sg_dma_len(sg) = len;
fe4d0b6317e35a drivers/gpu/drm/omapdrm/omap_gem.c Ivaylo Dimitrov 2021-11-19  1038  
fe4d0b6317e35a drivers/gpu/drm/omapdrm/omap_gem.c Ivaylo Dimitrov 2021-11-19  1039  			addr += stride;
fe4d0b6317e35a drivers/gpu/drm/omapdrm/omap_gem.c Ivaylo Dimitrov 2021-11-19  1040  		}
1948d28db6215d drivers/gpu/drm/omapdrm/omap_gem.c Ivaylo Dimitrov 2022-01-19  1041  	} else {
1948d28db6215d drivers/gpu/drm/omapdrm/omap_gem.c Ivaylo Dimitrov 2022-01-19  1042  		for_each_sg(sgt->sgl, sg, count, i) {
1948d28db6215d drivers/gpu/drm/omapdrm/omap_gem.c Ivaylo Dimitrov 2022-01-19  1043  			sg_set_page(sg, omap_obj->pages[i], PAGE_SIZE, 0);
1948d28db6215d drivers/gpu/drm/omapdrm/omap_gem.c Ivaylo Dimitrov 2022-01-19  1044  			sg_dma_address(sg) = omap_obj->dma_addrs[i];
1948d28db6215d drivers/gpu/drm/omapdrm/omap_gem.c Ivaylo Dimitrov 2022-01-19  1045  			sg_dma_len(sg) =  PAGE_SIZE;
1948d28db6215d drivers/gpu/drm/omapdrm/omap_gem.c Ivaylo Dimitrov 2022-01-19  1046  		}
1948d28db6215d drivers/gpu/drm/omapdrm/omap_gem.c Ivaylo Dimitrov 2022-01-19  1047  	}
fe4d0b6317e35a drivers/gpu/drm/omapdrm/omap_gem.c Ivaylo Dimitrov 2021-11-19  1048  
fe4d0b6317e35a drivers/gpu/drm/omapdrm/omap_gem.c Ivaylo Dimitrov 2021-11-19  1049  	omap_obj->sgt = sgt;
fe4d0b6317e35a drivers/gpu/drm/omapdrm/omap_gem.c Ivaylo Dimitrov 2021-11-19  1050  out:
fe4d0b6317e35a drivers/gpu/drm/omapdrm/omap_gem.c Ivaylo Dimitrov 2021-11-19  1051  	mutex_unlock(&omap_obj->lock);
fe4d0b6317e35a drivers/gpu/drm/omapdrm/omap_gem.c Ivaylo Dimitrov 2021-11-19  1052  	return sgt;
fe4d0b6317e35a drivers/gpu/drm/omapdrm/omap_gem.c Ivaylo Dimitrov 2021-11-19  1053  
fe4d0b6317e35a drivers/gpu/drm/omapdrm/omap_gem.c Ivaylo Dimitrov 2021-11-19  1054  err_free:
fe4d0b6317e35a drivers/gpu/drm/omapdrm/omap_gem.c Ivaylo Dimitrov 2021-11-19  1055  	kfree(sgt);
fe4d0b6317e35a drivers/gpu/drm/omapdrm/omap_gem.c Ivaylo Dimitrov 2021-11-19  1056  err_unpin:
fe4d0b6317e35a drivers/gpu/drm/omapdrm/omap_gem.c Ivaylo Dimitrov 2021-11-19  1057  	mutex_unlock(&omap_obj->lock);
fe4d0b6317e35a drivers/gpu/drm/omapdrm/omap_gem.c Ivaylo Dimitrov 2021-11-19  1058  	omap_gem_unpin(obj);
fe4d0b6317e35a drivers/gpu/drm/omapdrm/omap_gem.c Ivaylo Dimitrov 2021-11-19  1059  	return ERR_PTR(ret);
fe4d0b6317e35a drivers/gpu/drm/omapdrm/omap_gem.c Ivaylo Dimitrov 2021-11-19  1060  }
fe4d0b6317e35a drivers/gpu/drm/omapdrm/omap_gem.c Ivaylo Dimitrov 2021-11-19  1061  

:::::: The code at line 1034 was first introduced by commit
:::::: 1948d28db6215d055930f0cbb6e300622ede5931 drm: omapdrm: Support exporting of non-contiguous GEM BOs

:::::: TO: Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
:::::: CC: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
