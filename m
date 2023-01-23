Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECBD3A4F
	for <oe-kbuild-all@lists.linux.dev>; Mon, 23 Jan 2023 09:48:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674467285; x=1706003285;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=w+FOZkUhqs5u2A4cz9Rvpbk9pu7+9Waj8BesXpWJWHI=;
  b=aEat+J8mtrXv9GAP2sVvfFLYQxEbaOPwLlNnXx+H1Hyt3yhcMVP+xqmq
   QFDt16m0WThBPRDVEjSLsAXi1l7A4Mc6ICTO4sSOW0Y9Ts5dtbD9Eme6V
   dSt4Hgz7hBdKtvg2O0/HMXD6GGzHxOdsBVba+W3AylxHYd6RcV5rMvsoT
   euC8NIlZeQ5RnVJkNhhYFegi47UbC6JOkqDik4t1KL2zju3r+y9UsIwpw
   dl4o5iyIdhBCgFLtDp1vx68GTFLFHmX7IO0zGv0/eTVcCdzJBkbwrKNKn
   3BAZSXAmTcRW3dx8G+bLGgOms2r+D9ovURUq+/w9pxukreJlVXUaQIW/w
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10598"; a="323697130"
X-IronPort-AV: E=Sophos;i="5.97,239,1669104000"; 
   d="scan'208";a="323697130"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2023 01:48:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10598"; a="785533043"
X-IronPort-AV: E=Sophos;i="5.97,239,1669104000"; 
   d="scan'208";a="785533043"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 23 Jan 2023 01:48:03 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pJtQo-0005Yu-39;
	Mon, 23 Jan 2023 09:48:02 +0000
Date: Mon, 23 Jan 2023 17:47:06 +0800
From: kernel test robot <lkp@intel.com>
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [pinchartl:drm/compile-test 8/9] drivers/gpu/drm/tegra/gem.c:188:24:
 error: implicit declaration of function 'vmap'; did you mean 'kmap'?
Message-ID: <202301231730.7jc6IqjK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Laurent,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/pinchartl/linux.git drm/compile-test
head:   ac2ff1e9fb5162127c092c1f7dc86b4eb7537b09
commit: 2e124300da00d7b47d72255c9a9d8ff4a0383241 [8/9] drm/tegra: Enable COMPILE_TEST on all architectures
config: mips-allyesconfig (https://download.01.org/0day-ci/archive/20230123/202301231730.7jc6IqjK-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/pinchartl/linux.git/commit/?id=2e124300da00d7b47d72255c9a9d8ff4a0383241
        git remote add pinchartl https://git.kernel.org/pub/scm/linux/kernel/git/pinchartl/linux.git
        git fetch --no-tags pinchartl drm/compile-test
        git checkout 2e124300da00d7b47d72255c9a9d8ff4a0383241
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=mips olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=mips SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   drivers/gpu/drm/tegra/gem.c: In function 'tegra_bo_mmap':
>> drivers/gpu/drm/tegra/gem.c:188:24: error: implicit declaration of function 'vmap'; did you mean 'kmap'? [-Werror=implicit-function-declaration]
     188 |                 return vmap(obj->pages, obj->num_pages, VM_MAP,
         |                        ^~~~
         |                        kmap
>> drivers/gpu/drm/tegra/gem.c:188:57: error: 'VM_MAP' undeclared (first use in this function); did you mean 'VM_MTE'?
     188 |                 return vmap(obj->pages, obj->num_pages, VM_MAP,
         |                                                         ^~~~~~
         |                                                         VM_MTE
   drivers/gpu/drm/tegra/gem.c:188:57: note: each undeclared identifier is reported only once for each function it appears in
   drivers/gpu/drm/tegra/gem.c: In function 'tegra_bo_munmap':
>> drivers/gpu/drm/tegra/gem.c:203:17: error: implicit declaration of function 'vunmap'; did you mean 'kunmap'? [-Werror=implicit-function-declaration]
     203 |                 vunmap(addr);
         |                 ^~~~~~
         |                 kunmap
   drivers/gpu/drm/tegra/gem.c: In function 'tegra_bo_mmap':
   drivers/gpu/drm/tegra/gem.c:191:1: error: control reaches end of non-void function [-Werror=return-type]
     191 | }
         | ^
   cc1: some warnings being treated as errors
--
   drivers/gpu/drm/tegra/fb.c: In function 'tegra_fbdev_probe':
>> drivers/gpu/drm/tegra/fb.c:276:29: error: implicit declaration of function 'vmap'; did you mean 'kmap'? [-Werror=implicit-function-declaration]
     276 |                 bo->vaddr = vmap(bo->pages, bo->num_pages, VM_MAP,
         |                             ^~~~
         |                             kmap
>> drivers/gpu/drm/tegra/fb.c:276:60: error: 'VM_MAP' undeclared (first use in this function); did you mean 'VM_MTE'?
     276 |                 bo->vaddr = vmap(bo->pages, bo->num_pages, VM_MAP,
         |                                                            ^~~~~~
         |                                                            VM_MTE
   drivers/gpu/drm/tegra/fb.c:276:60: note: each undeclared identifier is reported only once for each function it appears in
   drivers/gpu/drm/tegra/fb.c: In function 'tegra_fbdev_exit':
>> drivers/gpu/drm/tegra/fb.c:359:25: error: implicit declaration of function 'vunmap'; did you mean 'kunmap'? [-Werror=implicit-function-declaration]
     359 |                         vunmap(bo->vaddr);
         |                         ^~~~~~
         |                         kunmap
   cc1: some warnings being treated as errors


vim +188 drivers/gpu/drm/tegra/gem.c

de2ba664c30fcd drivers/gpu/host1x/drm/gem.c Arto Merilainen   2013-03-22  175  
de2ba664c30fcd drivers/gpu/host1x/drm/gem.c Arto Merilainen   2013-03-22  176  static void *tegra_bo_mmap(struct host1x_bo *bo)
de2ba664c30fcd drivers/gpu/host1x/drm/gem.c Arto Merilainen   2013-03-22  177  {
3be8274341499c drivers/gpu/host1x/drm/gem.c Thierry Reding    2013-09-24  178  	struct tegra_bo *obj = host1x_to_tegra_bo(bo);
7938f4218168ae drivers/gpu/drm/tegra/gem.c  Lucas De Marchi   2022-02-04  179  	struct iosys_map map;
6619ccf1bb1d0e drivers/gpu/drm/tegra/gem.c  Thomas Zimmermann 2020-09-25  180  	int ret;
de2ba664c30fcd drivers/gpu/host1x/drm/gem.c Arto Merilainen   2013-03-22  181  
6619ccf1bb1d0e drivers/gpu/drm/tegra/gem.c  Thomas Zimmermann 2020-09-25  182  	if (obj->vaddr) {
de2ba664c30fcd drivers/gpu/host1x/drm/gem.c Arto Merilainen   2013-03-22  183  		return obj->vaddr;
6619ccf1bb1d0e drivers/gpu/drm/tegra/gem.c  Thomas Zimmermann 2020-09-25  184  	} else if (obj->gem.import_attach) {
f66d48c8cc8d99 drivers/gpu/drm/tegra/gem.c  Dmitry Osipenko   2022-10-17  185  		ret = dma_buf_vmap_unlocked(obj->gem.import_attach->dmabuf, &map);
6619ccf1bb1d0e drivers/gpu/drm/tegra/gem.c  Thomas Zimmermann 2020-09-25  186  		return ret ? NULL : map.vaddr;
6619ccf1bb1d0e drivers/gpu/drm/tegra/gem.c  Thomas Zimmermann 2020-09-25  187  	} else {
7ecada3cc44798 drivers/gpu/drm/tegra/gem.c  Arto Merilainen   2016-11-08 @188  		return vmap(obj->pages, obj->num_pages, VM_MAP,
7ecada3cc44798 drivers/gpu/drm/tegra/gem.c  Arto Merilainen   2016-11-08  189  			    pgprot_writecombine(PAGE_KERNEL));
de2ba664c30fcd drivers/gpu/host1x/drm/gem.c Arto Merilainen   2013-03-22  190  	}
6619ccf1bb1d0e drivers/gpu/drm/tegra/gem.c  Thomas Zimmermann 2020-09-25  191  }
de2ba664c30fcd drivers/gpu/host1x/drm/gem.c Arto Merilainen   2013-03-22  192  
de2ba664c30fcd drivers/gpu/host1x/drm/gem.c Arto Merilainen   2013-03-22  193  static void tegra_bo_munmap(struct host1x_bo *bo, void *addr)
de2ba664c30fcd drivers/gpu/host1x/drm/gem.c Arto Merilainen   2013-03-22  194  {
7ecada3cc44798 drivers/gpu/drm/tegra/gem.c  Arto Merilainen   2016-11-08  195  	struct tegra_bo *obj = host1x_to_tegra_bo(bo);
7938f4218168ae drivers/gpu/drm/tegra/gem.c  Lucas De Marchi   2022-02-04  196  	struct iosys_map map = IOSYS_MAP_INIT_VADDR(addr);
7ecada3cc44798 drivers/gpu/drm/tegra/gem.c  Arto Merilainen   2016-11-08  197  
7ecada3cc44798 drivers/gpu/drm/tegra/gem.c  Arto Merilainen   2016-11-08  198  	if (obj->vaddr)
7ecada3cc44798 drivers/gpu/drm/tegra/gem.c  Arto Merilainen   2016-11-08  199  		return;
7ecada3cc44798 drivers/gpu/drm/tegra/gem.c  Arto Merilainen   2016-11-08  200  	else if (obj->gem.import_attach)
f66d48c8cc8d99 drivers/gpu/drm/tegra/gem.c  Dmitry Osipenko   2022-10-17  201  		dma_buf_vunmap_unlocked(obj->gem.import_attach->dmabuf, &map);
7ecada3cc44798 drivers/gpu/drm/tegra/gem.c  Arto Merilainen   2016-11-08  202  	else
7ecada3cc44798 drivers/gpu/drm/tegra/gem.c  Arto Merilainen   2016-11-08 @203  		vunmap(addr);
de2ba664c30fcd drivers/gpu/host1x/drm/gem.c Arto Merilainen   2013-03-22  204  }
de2ba664c30fcd drivers/gpu/host1x/drm/gem.c Arto Merilainen   2013-03-22  205  

:::::: The code at line 188 was first introduced by commit
:::::: 7ecada3cc44798c88d2c3deed38746b9a7a9b746 drm/tegra: Support kernel mappings with IOMMU

:::::: TO: Arto Merilainen <amerilainen@nvidia.com>
:::::: CC: Thierry Reding <treding@nvidia.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
