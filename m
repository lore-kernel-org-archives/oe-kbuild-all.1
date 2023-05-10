Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53CB063C
	for <oe-kbuild-all@lists.linux.dev>; Wed, 10 May 2023 03:53:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683690791; x=1715226791;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tBsdrpMIfcF68ZloabINW8Usf5MBR8ISkJOxihK1+Nc=;
  b=H5XhgFeUheTCen40wbabKGP1IWf4pdDy7TbgTHI2ceT/CVrkZCm5A/aG
   AhrIY1whjfTLUDZCuQrAcPS2IkLjZdfpT839BTCyaU5WTsiFbMlAJhyk5
   uDk6Rfglw7rCEAqgQGkyiZFQPjO/V67rkey8CoyT9UbHB6aMQfQqUMR1b
   Q00Ap1I/rPRhvBhF6evSVOy1SNyKUhwPnp/KaWoRH3txScFrI86yYt/RO
   CpKJwEmpMy4MREaAmFuKXfd0x221qEQxdmmDTDmSxeFBFTkn8xkrd2iQJ
   ly+fJ81wACR8bPpghQ1HygWM8/f+BE2XzadXTf7znAEGw+PD9LlMlNSGA
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10705"; a="436443901"
X-IronPort-AV: E=Sophos;i="5.99,263,1677571200"; 
   d="scan'208";a="436443901"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2023 20:53:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10705"; a="788783869"
X-IronPort-AV: E=Sophos;i="5.99,263,1677571200"; 
   d="scan'208";a="788783869"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 09 May 2023 20:53:09 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pwat2-0002qq-1z;
	Wed, 10 May 2023 03:53:08 +0000
Date: Wed, 10 May 2023 11:52:28 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com,
	Guenter Roeck <groeck@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.1 143/178]
 drivers/gpu/drm/evdi/evdi_gem.c:278:25: error: implicit declaration of
 function 'vmap'; did you mean 'kmap'?
Message-ID: <202305101128.jlzqi7I9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.1
head:   37520013015c5abd86224a7a19588e6cbea39072
commit: 4c84ca78d36c41b436f7586426a05ae274ad7e53 [143/178] CHROMIUM: drm/evdi: Port evdi from github.com/DisplayLink/evdi.git
config: mips-allyesconfig (https://download.01.org/0day-ci/archive/20230510/202305101128.jlzqi7I9-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add chrome-os https://chromium.googlesource.com/chromiumos/third_party/kernel
        git fetch --no-tags chrome-os chromeos-6.1
        git checkout 4c84ca78d36c41b436f7586426a05ae274ad7e53
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=mips olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=mips SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305101128.jlzqi7I9-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/gpu/drm/evdi/evdi_gem.c: In function 'evdi_gem_vmap':
>> drivers/gpu/drm/evdi/evdi_gem.c:278:25: error: implicit declaration of function 'vmap'; did you mean 'kmap'? [-Werror=implicit-function-declaration]
     278 |         obj->vmapping = vmap(obj->pages, page_count, 0, PAGE_KERNEL);
         |                         ^~~~
         |                         kmap
   drivers/gpu/drm/evdi/evdi_gem.c:278:23: warning: assignment to 'void *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     278 |         obj->vmapping = vmap(obj->pages, page_count, 0, PAGE_KERNEL);
         |                       ^
   drivers/gpu/drm/evdi/evdi_gem.c: In function 'evdi_gem_vunmap':
>> drivers/gpu/drm/evdi/evdi_gem.c:301:17: error: implicit declaration of function 'vunmap'; did you mean 'kunmap'? [-Werror=implicit-function-declaration]
     301 |                 vunmap(obj->vmapping);
         |                 ^~~~~~
         |                 kunmap
   cc1: some warnings being treated as errors


vim +278 drivers/gpu/drm/evdi/evdi_gem.c

   257	
   258	int evdi_gem_vmap(struct evdi_gem_object *obj)
   259	{
   260		int page_count = DIV_ROUND_UP(obj->base.size, PAGE_SIZE);
   261		int ret;
   262	
   263		if (evdi_drm_gem_object_use_import_attach(&obj->base)) {
   264			struct iosys_map map = IOSYS_MAP_INIT_VADDR(NULL);
   265	
   266			ret = dma_buf_vmap(obj->base.import_attach->dmabuf, &map);
   267			if (ret)
   268				return -ENOMEM;
   269			obj->vmapping = map.vaddr;
   270			obj->vmap_is_iomem = map.is_iomem;
   271			return 0;
   272		}
   273	
   274		ret = evdi_pin_pages(obj);
   275		if (ret)
   276			return ret;
   277	
 > 278		obj->vmapping = vmap(obj->pages, page_count, 0, PAGE_KERNEL);
   279		if (!obj->vmapping)
   280			return -ENOMEM;
   281		return 0;
   282	}
   283	
   284	void evdi_gem_vunmap(struct evdi_gem_object *obj)
   285	{
   286		if (evdi_drm_gem_object_use_import_attach(&obj->base)) {
   287			struct iosys_map map = IOSYS_MAP_INIT_VADDR(NULL);
   288	
   289			if (obj->vmap_is_iomem)
   290				iosys_map_set_vaddr_iomem(&map, obj->vmapping);
   291			else
   292				iosys_map_set_vaddr(&map, obj->vmapping);
   293	
   294			dma_buf_vunmap(obj->base.import_attach->dmabuf, &map);
   295	
   296			obj->vmapping = NULL;
   297			return;
   298		}
   299	
   300		if (obj->vmapping) {
 > 301			vunmap(obj->vmapping);
   302			obj->vmapping = NULL;
   303		}
   304	
   305		evdi_unpin_pages(obj);
   306	}
   307	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
