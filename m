Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCDB26FBB
	for <oe-kbuild-all@lists.linux.dev>; Sat, 28 Jan 2023 18:05:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674929148; x=1706465148;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=aWElL4mTcw6PG+RptVIr/LLhqiAvFdEzqRjqfko6t4k=;
  b=dNcH+bUDUAoninlsNzhNxsl6U9u1BEMxE3jmyFb2v+eJqwEyFj8Y+zf4
   +KKksS850lGPGOrjx26CQVvDRGIYX5quVmMZqlmyDUP05vuZpGtnNWyml
   +PUxIIMbCmhswoGB/IfiXWV70E9R8Nnw7vTZP+5G5uwb0vMjm1EzA0gxF
   eJWFBhktVOiovSAGC5EtcUQH0iuHDlJs1gmHe9vp+HdvFE8qGShlEqT1s
   kmqBywhd98ScorwclagqEMq8OONKUiT6kDqEAyd64tj+TXFnhbZ9+PhUY
   uz/YmwLURiF0SqZqVqGNZp5cXZTK6dtk+c4ejWSrCcHvAjD0UMmmCV6Vn
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10604"; a="315271205"
X-IronPort-AV: E=Sophos;i="5.97,254,1669104000"; 
   d="scan'208";a="315271205"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2023 10:05:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10604"; a="665605687"
X-IronPort-AV: E=Sophos;i="5.97,254,1669104000"; 
   d="scan'208";a="665605687"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 28 Jan 2023 10:05:46 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pLpaD-0000yG-0T;
	Sat, 28 Jan 2023 18:05:45 +0000
Date: Sun, 29 Jan 2023 02:05:31 +0800
From: kernel test robot <lkp@intel.com>
To: Song Liu <song@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>
Subject: cookie.c:(.text+0x564): multiple definition of
 `register_text_tail_vm'; fs/fscache/cache.o:cache.c:(.text+0x1b0): first
 defined here
Message-ID: <202301290259.ug4IOoGC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel-lab-lkp/linux/commits/Song-Liu/module-replace-module_layout-with-module_memory/20230128-155809
head:   3d043be5ab6ba8f9103bf6e4fe555f9d094e5b2c
commit: 9588973ddc5527f751cae5e1a3e895538d935b4b vmalloc: introduce register_text_tail_vm()
date:   10 hours ago
config: arm-randconfig-r023-20230123 (https://download.01.org/0day-ci/archive/20230129/202301290259.ug4IOoGC-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/9588973ddc5527f751cae5e1a3e895538d935b4b
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Song-Liu/module-replace-module_layout-with-module_memory/20230128-155809
        git checkout 9588973ddc5527f751cae5e1a3e895538d935b4b
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All error/warnings (new ones prefixed by >>):

   In file included from include/asm-generic/io.h:994,
                    from arch/arm/include/asm/io.h:416,
                    from include/linux/io.h:13,
                    from arch/arm/include/asm/cachetype.h:85,
                    from arch/arm/include/asm/cacheflush.h:14,
                    from include/linux/cacheflush.h:5,
                    from include/linux/highmem.h:8,
                    from include/linux/pagemap.h:11,
                    from include/linux/netfs.h:19,
                    from include/linux/fscache.h:18,
                    from include/linux/fscache-cache.h:17,
                    from fs/fscache/internal.h:15,
                    from fs/fscache/cache.c:11:
>> include/linux/vmalloc.h:141:6: warning: no previous prototype for 'register_text_tail_vm' [-Wmissing-prototypes]
     141 | void register_text_tail_vm(unsigned long start, unsigned long end)
         |      ^~~~~~~~~~~~~~~~~~~~~
--
   arm-linux-gnueabi-ld: fs/fscache/cookie.o: in function `register_text_tail_vm':
>> cookie.c:(.text+0x564): multiple definition of `register_text_tail_vm'; fs/fscache/cache.o:cache.c:(.text+0x1b0): first defined here
   arm-linux-gnueabi-ld: fs/fscache/io.o: in function `register_text_tail_vm':
   io.c:(.text+0x4f4): multiple definition of `register_text_tail_vm'; fs/fscache/cache.o:cache.c:(.text+0x1b0): first defined here
   arm-linux-gnueabi-ld: fs/fscache/main.o: in function `register_text_tail_vm':
   main.c:(.text+0x0): multiple definition of `register_text_tail_vm'; fs/fscache/cache.o:cache.c:(.text+0x1b0): first defined here
   arm-linux-gnueabi-ld: fs/fscache/volume.o: in function `register_text_tail_vm':
   volume.c:(.text+0x550): multiple definition of `register_text_tail_vm'; fs/fscache/cache.o:cache.c:(.text+0x1b0): first defined here
   arm-linux-gnueabi-ld: fs/fscache/proc.o: in function `register_text_tail_vm':
   proc.c:(.text+0x0): multiple definition of `register_text_tail_vm'; fs/fscache/cache.o:cache.c:(.text+0x1b0): first defined here
--
   In file included from include/asm-generic/io.h:994,
                    from arch/arm/include/asm/io.h:416,
                    from include/linux/io.h:13,
                    from include/linux/irq.h:20,
                    from include/asm-generic/hardirq.h:17,
                    from arch/arm/include/asm/hardirq.h:10,
                    from include/linux/hardirq.h:11,
                    from include/linux/interrupt.h:11,
                    from include/drm/drm_util.h:35,
                    from include/drm/drm_connector.h:32,
                    from include/drm/drm_modes.h:33,
                    from include/drm/drm_crtc.h:32,
                    from include/drm/drm_atomic.h:31,
                    from drivers/gpu/drm/tilcdc/tilcdc_plane.c:7:
>> include/linux/vmalloc.h:141:6: error: no previous prototype for 'register_text_tail_vm' [-Werror=missing-prototypes]
     141 | void register_text_tail_vm(unsigned long start, unsigned long end)
         |      ^~~~~~~~~~~~~~~~~~~~~
   cc1: all warnings being treated as errors
--
   In file included from include/asm-generic/io.h:994,
                    from arch/arm/include/asm/io.h:416,
                    from include/linux/io.h:13,
                    from arch/arm/include/asm/cachetype.h:85,
                    from arch/arm/include/asm/cacheflush.h:14,
                    from include/linux/cacheflush.h:5,
                    from include/linux/highmem.h:8,
                    from include/linux/bvec.h:10,
                    from include/linux/blk_types.h:10,
                    from include/linux/blkdev.h:9,
                    from drivers/usb/gadget/function/f_mass_storage.c:171:
>> include/linux/vmalloc.h:141:6: warning: no previous prototype for 'register_text_tail_vm' [-Wmissing-prototypes]
     141 | void register_text_tail_vm(unsigned long start, unsigned long end)
         |      ^~~~~~~~~~~~~~~~~~~~~
   drivers/usb/gadget/function/f_mass_storage.c: In function 'invalidate_sub':
   drivers/usb/gadget/function/f_mass_storage.c:929:25: warning: variable 'rc' set but not used [-Wunused-but-set-variable]
     929 |         unsigned long   rc;
         |                         ^~
--
   In file included from include/asm-generic/io.h:994,
                    from arch/arm/include/asm/io.h:416,
                    from include/linux/io.h:13,
                    from arch/arm/include/asm/cachetype.h:85,
                    from arch/arm/include/asm/cacheflush.h:14,
                    from include/linux/cacheflush.h:5,
                    from include/linux/highmem.h:8,
                    from include/linux/bvec.h:10,
                    from include/linux/blk_types.h:10,
                    from include/linux/blkdev.h:9,
                    from drivers/usb/gadget/function/f_fs.c:17:
>> include/linux/vmalloc.h:141:6: warning: no previous prototype for 'register_text_tail_vm' [-Wmissing-prototypes]
     141 | void register_text_tail_vm(unsigned long start, unsigned long end)
         |      ^~~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/string.h:253,
                    from include/linux/bitmap.h:11,
                    from include/linux/cpumask.h:12,
                    from include/linux/smp.h:13,
                    from include/linux/lockdep.h:14,
                    from include/linux/spinlock.h:63,
                    from include/linux/wait.h:9,
                    from include/linux/wait_bit.h:8,
                    from include/linux/fs.h:6,
                    from include/linux/highmem.h:5:
   In function 'fortify_memcpy_chk',
       inlined from '__ffs_func_bind_do_os_desc' at drivers/usb/gadget/function/f_fs.c:3002:3:
   include/linux/fortify-string.h:413:25: warning: call to '__read_overflow2_field' declared with attribute warning: detected read beyond size of field (2nd parameter); maybe use struct_group()? [-Wattribute-warning]
     413 |                         __read_overflow2_field(q_size_field, size);
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--
   arm-linux-gnueabi-ld: drivers/usb/gadget/function/storage_common.o: in function `register_text_tail_vm':
>> storage_common.c:(.text+0x7e0): multiple definition of `register_text_tail_vm'; drivers/usb/gadget/function/f_mass_storage.o:f_mass_storage.c:(.text+0x3284): first defined here
--
   arm-linux-gnueabi-ld: drivers/gpu/drm/i2c/ch7006_mode.o: in function `register_text_tail_vm':
>> ch7006_mode.c:(.text+0xa0): multiple definition of `register_text_tail_vm'; drivers/gpu/drm/i2c/ch7006_drv.o:ch7006_drv.c:(.text+0x830): first defined here
--
   arm-linux-gnueabi-ld: fs/ext2/dir.o: in function `register_text_tail_vm':
>> dir.c:(.text+0x5ac): multiple definition of `register_text_tail_vm'; fs/ext2/balloc.o:balloc.c:(.text+0x34c): first defined here
   arm-linux-gnueabi-ld: fs/ext2/file.o: in function `register_text_tail_vm':
   file.c:(.text+0x7c): multiple definition of `register_text_tail_vm'; fs/ext2/balloc.o:balloc.c:(.text+0x34c): first defined here
   arm-linux-gnueabi-ld: fs/ext2/ialloc.o: in function `register_text_tail_vm':
   ialloc.c:(.text+0x220): multiple definition of `register_text_tail_vm'; fs/ext2/balloc.o:balloc.c:(.text+0x34c): first defined here
   arm-linux-gnueabi-ld: fs/ext2/inode.o: in function `register_text_tail_vm':
   inode.c:(.text+0x1138): multiple definition of `register_text_tail_vm'; fs/ext2/balloc.o:balloc.c:(.text+0x34c): first defined here
   arm-linux-gnueabi-ld: fs/ext2/ioctl.o: in function `register_text_tail_vm':
   ioctl.c:(.text+0x0): multiple definition of `register_text_tail_vm'; fs/ext2/balloc.o:balloc.c:(.text+0x34c): first defined here
   arm-linux-gnueabi-ld: fs/ext2/namei.o: in function `register_text_tail_vm':
   namei.c:(.text+0x5ae): multiple definition of `register_text_tail_vm'; fs/ext2/balloc.o:balloc.c:(.text+0x34c): first defined here
   arm-linux-gnueabi-ld: fs/ext2/super.o: in function `register_text_tail_vm':
   super.c:(.text+0x450): multiple definition of `register_text_tail_vm'; fs/ext2/balloc.o:balloc.c:(.text+0x34c): first defined here
   arm-linux-gnueabi-ld: fs/ext2/symlink.o: in function `register_text_tail_vm':
   symlink.c:(.text+0x0): multiple definition of `register_text_tail_vm'; fs/ext2/balloc.o:balloc.c:(.text+0x34c): first defined here
--
   arm-linux-gnueabi-ld: drivers/gpu/drm/bridge/analogix/analogix_dp_reg.o: in function `register_text_tail_vm':
>> analogix_dp_reg.c:(.text+0x50): multiple definition of `register_text_tail_vm'; drivers/gpu/drm/bridge/analogix/analogix_dp_core.o:analogix_dp_core.c:(.text+0x188c): first defined here
   arm-linux-gnueabi-ld: drivers/gpu/drm/bridge/analogix/analogix-i2c-dptx.o: in function `register_text_tail_vm':
   analogix-i2c-dptx.c:(.text+0x1c4): multiple definition of `register_text_tail_vm'; drivers/gpu/drm/bridge/analogix/analogix_dp_core.o:analogix_dp_core.c:(.text+0x188c): first defined here
--
   arm-linux-gnueabi-ld: drivers/gpu/drm/mxsfb/mxsfb_kms.o: in function `register_text_tail_vm':
>> mxsfb_kms.c:(.text+0x70c): multiple definition of `register_text_tail_vm'; drivers/gpu/drm/mxsfb/mxsfb_drv.o:mxsfb_drv.c:(.text+0xb2): first defined here
--
   arm-linux-gnueabi-ld: drivers/gpu/drm/mxsfb/lcdif_kms.o: in function `register_text_tail_vm':
>> lcdif_kms.c:(.text+0x4f6): multiple definition of `register_text_tail_vm'; drivers/gpu/drm/mxsfb/lcdif_drv.o:lcdif_drv.c:(.text+0x370): first defined here
..

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
