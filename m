Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDAF115BE
	for <oe-kbuild-all@lists.linux.dev>; Fri,  2 Jun 2023 04:04:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685678647; x=1717214647;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=B5xAP1hcXUTKDozep7kYJUWoBYiQdr0eJDoFotHos9M=;
  b=DQN0QeJUjWdFI1H9Q+YjNOL/fB7hASlFeqr/KmhIHhVC15f+gkDeLxqU
   AH9yNfiS5o+212bqwX4Hy+WH8i570IjTaGy1QS+2ixa8m2av1eW7FhM8b
   hrC5b9Hzzc/YJQs9j4ThQsnN0uhdrGfYLTZlN9w7fKQeXedZXSZNrcstp
   UghKhT8I4mVAJLH+ixxXGc0fNerr+OcfOSogjplVjyODNlnnp0QRbo3sJ
   dkICJQUXVrveayC+a/wrDuNbIqntXnvpPVmhaq2j5GFXQfc5WyB/SbqSj
   xLgtknrKxU1dJ8S9bUSFUFs5roFlBmWdmzbIg/uv4tImc88mq+TFfsEAZ
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10728"; a="335378034"
X-IronPort-AV: E=Sophos;i="6.00,211,1681196400"; 
   d="scan'208";a="335378034"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2023 21:04:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10728"; a="710761800"
X-IronPort-AV: E=Sophos;i="6.00,211,1681196400"; 
   d="scan'208";a="710761800"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 01 Jun 2023 21:04:06 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q4w1F-00002z-1F;
	Fri, 02 Jun 2023 04:04:05 +0000
Date: Fri, 2 Jun 2023 12:04:03 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com,
	Guenter Roeck <groeck@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-5.10 12/12]
 drivers/gpu/drm/evdi/evdi_gem.c:276:25: error: implicit declaration of
 function 'vmap'; did you mean 'kmap'?
Message-ID: <202306021156.rsZ0Gkx9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-5.10
head:   f67d263e68b42c6ed85c11c3b2ebe4f149a34a5a
commit: f67d263e68b42c6ed85c11c3b2ebe4f149a34a5a [12/12] CHROMIUM: drm/evdi: Port evdi from github.com/DisplayLink/evdi.git
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20230602/202306021156.rsZ0Gkx9-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 12.3.0
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add chrome-os https://chromium.googlesource.com/chromiumos/third_party/kernel
        git fetch --no-tags chrome-os chromeos-5.10
        git checkout f67d263e68b42c6ed85c11c3b2ebe4f149a34a5a
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=alpha olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=alpha SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306021156.rsZ0Gkx9-lkp@intel.com/

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
