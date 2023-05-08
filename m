Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A30917F3
	for <oe-kbuild-all@lists.linux.dev>; Mon,  8 May 2023 16:11:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683562317; x=1715098317;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fCkQwbG4yVSGqyBCzCAhJKFOsZtChKfRa5jIKIpurmQ=;
  b=XzWIWjLzofM5NnpGJ7ygL/ATd2UGJ/OYzIFEFdcVrFQMANwwBCbF32P/
   rtdp/I0RgKe6HDV5cQBOVm92hONcG19luuyxB99ppHirhM1WMwOvWYz8u
   poxAiQQ+h6YbQKrt6Ba7+oWCK+BmDD3D3uvXTf58qFj3wDP+zEfXqKbBR
   8Z2DU9s65rJ4mansFOCu84++o3LsH2KOoUWPyslQxXPVgBE3HoVP4lWea
   XI1tFRw9EpyNSHJb69IPykk4sC0ODQ2jlMSL6zvlV805Wx1lK5pprxyC6
   gBccTR5qeoMCzXwJAYeyO625GavN372V0rA6V2uLoog1uwz13IMW/9QWK
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10704"; a="377785159"
X-IronPort-AV: E=Sophos;i="5.99,259,1677571200"; 
   d="scan'208";a="377785159"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2023 09:11:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10704"; a="648941169"
X-IronPort-AV: E=Sophos;i="5.99,259,1677571200"; 
   d="scan'208";a="648941169"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 08 May 2023 09:11:36 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pw3SZ-0001Iz-1R;
	Mon, 08 May 2023 16:11:35 +0000
Date: Tue, 9 May 2023 00:10:56 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com,
	Guenter Roeck <groeck@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.1 143/143]
 drivers/gpu/drm/evdi/evdi_gem.c:278:23: warning: assignment to 'void *' from
 'int' makes pointer from integer without a cast
Message-ID: <202305090048.S99VMp3k-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.1
head:   4c84ca78d36c41b436f7586426a05ae274ad7e53
commit: 4c84ca78d36c41b436f7586426a05ae274ad7e53 [143/143] CHROMIUM: drm/evdi: Port evdi from github.com/DisplayLink/evdi.git
config: mips-allyesconfig (https://download.01.org/0day-ci/archive/20230509/202305090048.S99VMp3k-lkp@intel.com/config)
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
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=mips SHELL=/bin/bash drivers/gpu/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305090048.S99VMp3k-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/evdi/evdi_gem.c: In function 'evdi_gem_vmap':
   drivers/gpu/drm/evdi/evdi_gem.c:278:25: error: implicit declaration of function 'vmap'; did you mean 'kmap'? [-Werror=implicit-function-declaration]
     278 |         obj->vmapping = vmap(obj->pages, page_count, 0, PAGE_KERNEL);
         |                         ^~~~
         |                         kmap
>> drivers/gpu/drm/evdi/evdi_gem.c:278:23: warning: assignment to 'void *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     278 |         obj->vmapping = vmap(obj->pages, page_count, 0, PAGE_KERNEL);
         |                       ^
   drivers/gpu/drm/evdi/evdi_gem.c: In function 'evdi_gem_vunmap':
   drivers/gpu/drm/evdi/evdi_gem.c:301:17: error: implicit declaration of function 'vunmap'; did you mean 'kunmap'? [-Werror=implicit-function-declaration]
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

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
