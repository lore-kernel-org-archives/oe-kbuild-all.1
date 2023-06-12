Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0BCF8833
	for <oe-kbuild-all@lists.linux.dev>; Mon, 12 Jun 2023 20:26:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686601568; x=1718137568;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=AaONUrEt5cSliQARHT4icQJSoQ0HwdBus5ZFyV0+k+M=;
  b=I0ptnS9Hav+NzKVvpzNGQfITsYUVAgoOaS94tf1NRaXXhdfm8MmqtbMq
   wH/q5RCBE1bB1Nh4gcljy3mPdH5HBT6tavj+HvAgoYykoglfKstMSS8s4
   cye5K4W+Bx2ySub6e77JWQjnt47BIvVVQfkc2HWkLmDSDA7ysb+LjalHV
   yZznlWtZ/uqkpRhGWGzQxOsu6ZH6uh7aGSB45lRpaWStFAemlhZXRkElP
   yq3JifHD0MG7QXvxmrKkYpL+ksY3TEUM/e1/LXozmHSt2jQmUD2RxZdlM
   7qSbI8WBan5IKgF8W3Ut7yR3wvLieq4U0JUXxldrVfo8s/6mFX05UV8/u
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10739"; a="357040679"
X-IronPort-AV: E=Sophos;i="6.00,236,1681196400"; 
   d="scan'208";a="357040679"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2023 13:26:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10739"; a="835621642"
X-IronPort-AV: E=Sophos;i="6.00,236,1681196400"; 
   d="scan'208";a="835621642"
Received: from lkp-server01.sh.intel.com (HELO 211f47bdb1cb) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 12 Jun 2023 13:26:06 -0700
Received: from kbuild by 211f47bdb1cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q8o73-0000g4-1o;
	Mon, 12 Jun 2023 20:26:05 +0000
Date: Tue, 13 Jun 2023 04:25:31 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com,
	Guenter Roeck <groeck@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-5.10 12/43]
 drivers/gpu/drm/evdi/evdi_gem.c:276:25: error: implicit declaration of
 function 'vmap'; did you mean 'kmap'?
Message-ID: <202306130408.fw9yKy41-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Hi Łukasz,

FYI, the error/warning still remains.

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-5.10
head:   608b15eca1157e43692b278e77320c6b39217920
commit: f67d263e68b42c6ed85c11c3b2ebe4f149a34a5a [12/43] CHROMIUM: drm/evdi: Port evdi from github.com/DisplayLink/evdi.git
config: powerpc-allmodconfig (https://download.01.org/0day-ci/archive/20230613/202306130408.fw9yKy41-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 12.3.0
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add chrome-os https://chromium.googlesource.com/chromiumos/third_party/kernel
        git fetch --no-tags chrome-os chromeos-5.10
        git checkout f67d263e68b42c6ed85c11c3b2ebe4f149a34a5a
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=powerpc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=powerpc SHELL=/bin/bash M=drivers/gpu/drm/evdi

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306130408.fw9yKy41-lkp@intel.com/

All errors (new ones prefixed by >>):

   cc1: warning: include/uapi/drm: No such file or directory [-Wmissing-include-dirs]
   drivers/gpu/drm/evdi/evdi_gem.c: In function 'evdi_gem_vmap':
>> drivers/gpu/drm/evdi/evdi_gem.c:276:25: error: implicit declaration of function 'vmap'; did you mean 'kmap'? [-Werror=implicit-function-declaration]
     276 |         obj->vmapping = vmap(obj->pages, page_count, 0, PAGE_KERNEL);
         |                         ^~~~
         |                         kmap
   drivers/gpu/drm/evdi/evdi_gem.c:276:23: warning: assignment to 'void *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     276 |         obj->vmapping = vmap(obj->pages, page_count, 0, PAGE_KERNEL);
         |                       ^
   drivers/gpu/drm/evdi/evdi_gem.c: In function 'evdi_gem_vunmap':
>> drivers/gpu/drm/evdi/evdi_gem.c:298:17: error: implicit declaration of function 'vunmap'; did you mean 'kunmap'? [-Werror=implicit-function-declaration]
     298 |                 vunmap(obj->vmapping);
         |                 ^~~~~~
         |                 kunmap
   cc1: some warnings being treated as errors


vim +276 drivers/gpu/drm/evdi/evdi_gem.c

abe08f482733f4 Anand K Mistry   2021-11-05  255  
3e21cedd503fab Aleksander Miera 2018-03-15  256  int evdi_gem_vmap(struct evdi_gem_object *obj)
3e21cedd503fab Aleksander Miera 2018-03-15  257  {
f67d263e68b42c Łukasz Spintzyk  2023-04-14  258  	int page_count = DIV_ROUND_UP(obj->base.size, PAGE_SIZE);
3e21cedd503fab Aleksander Miera 2018-03-15  259  	int ret;
3e21cedd503fab Aleksander Miera 2018-03-15  260  
f67d263e68b42c Łukasz Spintzyk  2023-04-14  261  	if (evdi_drm_gem_object_use_import_attach(&obj->base)) {
f67d263e68b42c Łukasz Spintzyk  2023-04-14  262  		struct dma_buf_map map = DMA_BUF_MAP_INIT_VADDR(NULL);
5d42c7b3d93d6c Sean Paul        2021-04-09  263  
5d42c7b3d93d6c Sean Paul        2021-04-09  264  		ret = dma_buf_vmap(obj->base.import_attach->dmabuf, &map);
5d42c7b3d93d6c Sean Paul        2021-04-09  265  		if (ret)
5d42c7b3d93d6c Sean Paul        2021-04-09  266  			return -ENOMEM;
5d42c7b3d93d6c Sean Paul        2021-04-09  267  		obj->vmapping = map.vaddr;
f67d263e68b42c Łukasz Spintzyk  2023-04-14  268  		obj->vmap_is_iomem = map.is_iomem;
3e21cedd503fab Aleksander Miera 2018-03-15  269  		return 0;
3e21cedd503fab Aleksander Miera 2018-03-15  270  	}
3e21cedd503fab Aleksander Miera 2018-03-15  271  
abe08f482733f4 Anand K Mistry   2021-11-05  272  	ret = evdi_pin_pages(obj);
3e21cedd503fab Aleksander Miera 2018-03-15  273  	if (ret)
3e21cedd503fab Aleksander Miera 2018-03-15  274  		return ret;
3e21cedd503fab Aleksander Miera 2018-03-15  275  
3e21cedd503fab Aleksander Miera 2018-03-15 @276  	obj->vmapping = vmap(obj->pages, page_count, 0, PAGE_KERNEL);
3e21cedd503fab Aleksander Miera 2018-03-15  277  	if (!obj->vmapping)
3e21cedd503fab Aleksander Miera 2018-03-15  278  		return -ENOMEM;
3e21cedd503fab Aleksander Miera 2018-03-15  279  	return 0;
3e21cedd503fab Aleksander Miera 2018-03-15  280  }
3e21cedd503fab Aleksander Miera 2018-03-15  281  
3e21cedd503fab Aleksander Miera 2018-03-15  282  void evdi_gem_vunmap(struct evdi_gem_object *obj)
3e21cedd503fab Aleksander Miera 2018-03-15  283  {
f67d263e68b42c Łukasz Spintzyk  2023-04-14  284  	if (evdi_drm_gem_object_use_import_attach(&obj->base)) {
f67d263e68b42c Łukasz Spintzyk  2023-04-14  285  		struct dma_buf_map map;
f67d263e68b42c Łukasz Spintzyk  2023-04-14  286  
f67d263e68b42c Łukasz Spintzyk  2023-04-14  287  		if (obj->vmap_is_iomem)
f67d263e68b42c Łukasz Spintzyk  2023-04-14  288  			dma_buf_map_set_vaddr_iomem(&map, obj->vmapping);
f67d263e68b42c Łukasz Spintzyk  2023-04-14  289  		else
f67d263e68b42c Łukasz Spintzyk  2023-04-14  290  			dma_buf_map_set_vaddr(&map, obj->vmapping);
5d42c7b3d93d6c Sean Paul        2021-04-09  291  
5d42c7b3d93d6c Sean Paul        2021-04-09  292  		dma_buf_vunmap(obj->base.import_attach->dmabuf, &map);
3e21cedd503fab Aleksander Miera 2018-03-15  293  		obj->vmapping = NULL;
3e21cedd503fab Aleksander Miera 2018-03-15  294  		return;
3e21cedd503fab Aleksander Miera 2018-03-15  295  	}
3e21cedd503fab Aleksander Miera 2018-03-15  296  
3e21cedd503fab Aleksander Miera 2018-03-15  297  	if (obj->vmapping) {
3e21cedd503fab Aleksander Miera 2018-03-15 @298  		vunmap(obj->vmapping);
3e21cedd503fab Aleksander Miera 2018-03-15  299  		obj->vmapping = NULL;
3e21cedd503fab Aleksander Miera 2018-03-15  300  	}
3e21cedd503fab Aleksander Miera 2018-03-15  301  
abe08f482733f4 Anand K Mistry   2021-11-05  302  	evdi_unpin_pages(obj);
3e21cedd503fab Aleksander Miera 2018-03-15  303  }
3e21cedd503fab Aleksander Miera 2018-03-15  304  

:::::: The code at line 276 was first introduced by commit
:::::: 3e21cedd503fabd195cf407652bf87fd83e202ac drm/evdi: Add atomic evdi drm module

:::::: TO: Aleksander Miera <aleksander.miera@displaylink.com>
:::::: CC: Guenter Roeck <groeck@chromium.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
