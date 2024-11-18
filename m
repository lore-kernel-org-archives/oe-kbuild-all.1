Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CB1E282E1
	for <oe-kbuild-all@lists.linux.dev>; Mon, 18 Nov 2024 02:58:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731898734; cv=none; b=WzPwNFtnau9JOhvjDLn7X12TMZKShv4buh9IJ9m7gq5EYuuzGiF7FRwfI+bDUFCckrz7uR4uxwhTKTLVSl1zBT3tuFKWHxzmWdO9vDo+J7SShGnB3nq0cgzYt69g8gfX4J87Cu63Pz1PceTJ/D/rDR8A2ues86SdnT8Dx53wYrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731898734; c=relaxed/simple;
	bh=iBS5dCScobDDo4N+ihUwFtE171ydDmDHVyuZ+0p/iyo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hUpdlBYN3DHtu1w2phV8yfqplNP7MeRNInvIzNRXS3cAmKfXxCFMb9dYGbPb2pUz5giCisI9xqyQvXDpH6Z1kcAOugdq1b1Xw8SvXC0ZWuCDqdKVLQTDsxZXQa2CglEv5Ab2Tckr7jQ2VgQWWXbtgZht6JjoC+E+qAVc0zbJwFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iUUfqn2v; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iUUfqn2v"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731898732; x=1763434732;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=iBS5dCScobDDo4N+ihUwFtE171ydDmDHVyuZ+0p/iyo=;
  b=iUUfqn2vQyJR8X4uRYnK2zozgchfL2VMAJDiBcRlLBjgIQXWvM5aVIVx
   DaJT2FWPG9RGYALaS/XWr3Q3b7VFcVCypDTVXFAXxHPRTQsah5Le1QmXw
   aK2SU7IA8KJbDObXVfyJi1p/78mA0/Q1H3VxVVVz2EGN5C4sKYlvBpTLS
   mOTPETCqitXsUHPeMhVfkIWlDl2KztBqSbKMTcNh6SUimod2yxb3sTCif
   +HqQ4RXQaAsRQZH4I6gHtyBmprfIgqyR6gBTTkq+q3CRQyF6GURtf5piL
   TgVvxKCxehwkic/xXmkU21NSrOIKK/WkaE+zf+kPI9/s6YiGVMFVO76xn
   g==;
X-CSE-ConnectionGUID: JfmlLuFkR2u9hzaXgb7ahg==
X-CSE-MsgGUID: YvXrtnA+QhyEKycvVuU6ZA==
X-IronPort-AV: E=McAfee;i="6700,10204,11259"; a="43223810"
X-IronPort-AV: E=Sophos;i="6.12,163,1728975600"; 
   d="scan'208";a="43223810"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2024 18:58:52 -0800
X-CSE-ConnectionGUID: gDMbRGdHRY2iM0iMa42llQ==
X-CSE-MsgGUID: oXk0HNygR9mOlt0DbAv4XA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,163,1728975600"; 
   d="scan'208";a="89253658"
Received: from lkp-server01.sh.intel.com (HELO 1e3cc1889ffb) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 17 Nov 2024 18:58:51 -0800
Received: from kbuild by 1e3cc1889ffb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tCryR-0002EL-2r;
	Mon, 18 Nov 2024 02:58:47 +0000
Date: Mon, 18 Nov 2024 10:57:47 +0800
From: kernel test robot <lkp@intel.com>
To: Eileen Yoon <eyn@gmx.com>
Cc: oe-kbuild-all@lists.linux.dev, Janne Grunau <j@jannau.net>
Subject: [asahilinux:bits/240-isp 1/54]
 drivers/media/platform/apple/isp/isp-cam.c:378:35: warning: format '%lx'
 expects argument of type 'long unsigned int', but argument 3 has type
 'size_t' {aka 'unsigned int'}
Message-ID: <202411181054.h7GpQZSB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux bits/240-isp
head:   168f992948f0f021255ff3cfb365098fd122a225
commit: 652d011416575dd073896a446abd6c14bb3534c6 [1/54] media: apple: Add Apple ISP driver
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20241118/202411181054.h7GpQZSB-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241118/202411181054.h7GpQZSB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411181054.h7GpQZSB-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/device.h:15,
                    from include/drm/drm_print.h:31,
                    from include/drm/drm_mm.h:51,
                    from drivers/media/platform/apple/isp/isp-drv.h:12,
                    from drivers/media/platform/apple/isp/isp-cam.h:7,
                    from drivers/media/platform/apple/isp/isp-cam.c:6:
   drivers/media/platform/apple/isp/isp-cam.c: In function 'isp_ch_load_setfile':
>> drivers/media/platform/apple/isp/isp-cam.c:378:35: warning: format '%lx' expects argument of type 'long unsigned int', but argument 3 has type 'size_t' {aka 'unsigned int'} [-Wformat=]
     378 |                 dev_err(isp->dev, "setfile too small (0x%lx/0x%zx)\n", fw->size,
         |                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:110:30: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ^~~
   include/linux/dev_printk.h:154:56: note: in expansion of macro 'dev_fmt'
     154 |         dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                        ^~~~~~~
   drivers/media/platform/apple/isp/isp-cam.c:378:17: note: in expansion of macro 'dev_err'
     378 |                 dev_err(isp->dev, "setfile too small (0x%lx/0x%zx)\n", fw->size,
         |                 ^~~~~~~
   drivers/media/platform/apple/isp/isp-cam.c:378:59: note: format string is defined here
     378 |                 dev_err(isp->dev, "setfile too small (0x%lx/0x%zx)\n", fw->size,
         |                                                         ~~^
         |                                                           |
         |                                                           long unsigned int
         |                                                         %x
--
   In file included from include/linux/printk.h:599,
                    from include/asm-generic/bug.h:22,
                    from arch/m68k/include/asm/bug.h:32,
                    from include/linux/bug.h:5,
                    from include/linux/thread_info.h:13,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/m68k/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:79,
                    from arch/m68k/include/asm/processor.h:11,
                    from include/linux/sched.h:13,
                    from include/linux/delay.h:23,
                    from drivers/media/platform/apple/isp/isp-fw.c:4:
   drivers/media/platform/apple/isp/isp-fw.c: In function 'isp_fill_channel_info':
>> drivers/media/platform/apple/isp/isp-drv.h:249:29: warning: format '%llx' expects argument of type 'long long unsigned int', but argument 9 has type 'dma_addr_t' {aka 'unsigned int'} [-Wformat=]
     249 |         dev_dbg((isp)->dev, "[%s] " fmt, __func__, ##__VA_ARGS__)
         |                             ^~~~~~~
   include/linux/dynamic_debug.h:224:29: note: in definition of macro '__dynamic_func_call_cls'
     224 |                 func(&id, ##__VA_ARGS__);                       \
         |                             ^~~~~~~~~~~
   include/linux/dynamic_debug.h:250:9: note: in expansion of macro '_dynamic_func_call_cls'
     250 |         _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:273:9: note: in expansion of macro '_dynamic_func_call'
     273 |         _dynamic_func_call(fmt, __dynamic_dev_dbg,              \
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:165:9: note: in expansion of macro 'dynamic_dev_dbg'
     165 |         dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~
   include/linux/dev_printk.h:165:30: note: in expansion of macro 'dev_fmt'
     165 |         dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                              ^~~~~~~
   drivers/media/platform/apple/isp/isp-drv.h:249:9: note: in expansion of macro 'dev_dbg'
     249 |         dev_dbg((isp)->dev, "[%s] " fmt, __func__, ##__VA_ARGS__)
         |         ^~~~~~~
   drivers/media/platform/apple/isp/isp-fw.c:363:17: note: in expansion of macro 'isp_dbg'
     363 |                 isp_dbg(isp, "chan: %s type: %d src: %d num: %d iova: 0x%llx\n",
         |                 ^~~~~~~
   drivers/media/platform/apple/isp/isp-fw.c: In function 'isp_collect_gc_surface':
   drivers/media/platform/apple/isp/isp-drv.h:249:29: warning: format '%llx' expects argument of type 'long long unsigned int', but argument 5 has type 'dma_addr_t' {aka 'unsigned int'} [-Wformat=]
     249 |         dev_dbg((isp)->dev, "[%s] " fmt, __func__, ##__VA_ARGS__)
         |                             ^~~~~~~
   include/linux/dynamic_debug.h:224:29: note: in definition of macro '__dynamic_func_call_cls'
     224 |                 func(&id, ##__VA_ARGS__);                       \
         |                             ^~~~~~~~~~~
   include/linux/dynamic_debug.h:250:9: note: in expansion of macro '_dynamic_func_call_cls'
     250 |         _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:273:9: note: in expansion of macro '_dynamic_func_call'
     273 |         _dynamic_func_call(fmt, __dynamic_dev_dbg,              \
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:165:9: note: in expansion of macro 'dynamic_dev_dbg'
     165 |         dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~
   include/linux/dev_printk.h:165:30: note: in expansion of macro 'dev_fmt'
     165 |         dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                              ^~~~~~~
   drivers/media/platform/apple/isp/isp-drv.h:249:9: note: in expansion of macro 'dev_dbg'
     249 |         dev_dbg((isp)->dev, "[%s] " fmt, __func__, ##__VA_ARGS__)
         |         ^~~~~~~
   drivers/media/platform/apple/isp/isp-fw.c:513:17: note: in expansion of macro 'isp_dbg'
     513 |                 isp_dbg(isp, "freeing iova: 0x%llx size: 0x%llx virt: %pS\n",
         |                 ^~~~~~~
   drivers/media/platform/apple/isp/isp-fw.c: At top level:
   drivers/media/platform/apple/isp/isp-fw.c:581:5: warning: no previous prototype for 'apple_isp_firmware_boot' [-Wmissing-prototypes]
     581 | int apple_isp_firmware_boot(struct apple_isp *isp)
         |     ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/apple/isp/isp-fw.c:602:6: warning: no previous prototype for 'apple_isp_firmware_shutdown' [-Wmissing-prototypes]
     602 | void apple_isp_firmware_shutdown(struct apple_isp *isp)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~
--
   In file included from include/linux/device.h:15,
                    from include/linux/iommu.h:11,
                    from drivers/media/platform/apple/isp/isp-iommu.c:4:
   drivers/media/platform/apple/isp/isp-iommu.c: In function 'isp_surf_iommu_map':
>> drivers/media/platform/apple/isp/isp-iommu.c:136:35: warning: format '%llx' expects argument of type 'long long unsigned int', but argument 3 has type 'dma_addr_t' {aka 'unsigned int'} [-Wformat=]
     136 |                 dev_err(isp->dev, "failed to iommu_map sgt to iova 0x%llx\n",
         |                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:110:30: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ^~~
   include/linux/dev_printk.h:154:56: note: in expansion of macro 'dev_fmt'
     154 |         dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                        ^~~~~~~
   drivers/media/platform/apple/isp/isp-iommu.c:136:17: note: in expansion of macro 'dev_err'
     136 |                 dev_err(isp->dev, "failed to iommu_map sgt to iova 0x%llx\n",
         |                 ^~~~~~~
   drivers/media/platform/apple/isp/isp-iommu.c:136:73: note: format string is defined here
     136 |                 dev_err(isp->dev, "failed to iommu_map sgt to iova 0x%llx\n",
         |                                                                      ~~~^
         |                                                                         |
         |                                                                         long long unsigned int
         |                                                                      %x
   drivers/media/platform/apple/isp/isp-iommu.c: In function '__isp_alloc_surface':
   drivers/media/platform/apple/isp/isp-iommu.c:182:25: warning: format '%llx' expects argument of type 'long long unsigned int', but argument 4 has type 'dma_addr_t' {aka 'unsigned int'} [-Wformat=]
     182 |                         "failed to iommu_map size 0x%llx to iova 0x%llx\n",
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:110:30: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ^~~
   include/linux/dev_printk.h:154:56: note: in expansion of macro 'dev_fmt'
     154 |         dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                        ^~~~~~~
   drivers/media/platform/apple/isp/isp-iommu.c:181:17: note: in expansion of macro 'dev_err'
     181 |                 dev_err(isp->dev,
         |                 ^~~~~~~
   drivers/media/platform/apple/isp/isp-iommu.c:182:71: note: format string is defined here
     182 |                         "failed to iommu_map size 0x%llx to iova 0x%llx\n",
         |                                                                    ~~~^
         |                                                                       |
         |                                                                       long long unsigned int
         |                                                                    %x
   drivers/media/platform/apple/isp/isp-iommu.c: In function 'isp_alloc_surface_vmap':
   drivers/media/platform/apple/isp/isp-iommu.c:212:35: warning: format '%llx' expects argument of type 'long long unsigned int', but argument 3 has type 'dma_addr_t' {aka 'unsigned int'} [-Wformat=]
     212 |                 dev_err(isp->dev, "failed to vmap iova 0x%llx - 0x%llx\n",
         |                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:110:30: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ^~~
   include/linux/dev_printk.h:154:56: note: in expansion of macro 'dev_fmt'
     154 |         dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                        ^~~~~~~
   drivers/media/platform/apple/isp/isp-iommu.c:212:17: note: in expansion of macro 'dev_err'
     212 |                 dev_err(isp->dev, "failed to vmap iova 0x%llx - 0x%llx\n",
         |                 ^~~~~~~
   drivers/media/platform/apple/isp/isp-iommu.c:212:61: note: format string is defined here
     212 |                 dev_err(isp->dev, "failed to vmap iova 0x%llx - 0x%llx\n",
         |                                                          ~~~^
         |                                                             |
         |                                                             long long unsigned int
         |                                                          %x
   drivers/media/platform/apple/isp/isp-iommu.c: In function 'apple_isp_iommu_map_sgt':
   drivers/media/platform/apple/isp/isp-iommu.c:260:35: warning: format '%llx' expects argument of type 'long long unsigned int', but argument 3 has type 'dma_addr_t' {aka 'unsigned int'} [-Wformat=]
     260 |                 dev_err(isp->dev, "failed to iommu_map sgt to iova 0x%llx\n",
         |                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:110:30: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ^~~
   include/linux/dev_printk.h:154:56: note: in expansion of macro 'dev_fmt'
     154 |         dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                        ^~~~~~~
   drivers/media/platform/apple/isp/isp-iommu.c:260:17: note: in expansion of macro 'dev_err'
     260 |                 dev_err(isp->dev, "failed to iommu_map sgt to iova 0x%llx\n",
         |                 ^~~~~~~
   drivers/media/platform/apple/isp/isp-iommu.c:260:73: note: format string is defined here
     260 |                 dev_err(isp->dev, "failed to iommu_map sgt to iova 0x%llx\n",
         |                                                                      ~~~^
         |                                                                         |
         |                                                                         long long unsigned int
         |                                                                      %x


vim +378 drivers/media/platform/apple/isp/isp-cam.c

   361	
   362	static int isp_ch_load_setfile(struct apple_isp *isp, u32 ch)
   363	{
   364		struct isp_format *fmt = isp_get_format(isp, ch);
   365		const struct isp_setfile *setfile = &isp_setfiles[fmt->id];
   366		const struct firmware *fw;
   367		u32 magic;
   368		int err;
   369	
   370		err = request_firmware(&fw, setfile->path, isp->dev);
   371		if (err) {
   372			dev_err(isp->dev, "failed to request setfile '%s': %d\n",
   373				setfile->path, err);
   374			return err;
   375		}
   376	
   377		if (fw->size < setfile->size) {
 > 378			dev_err(isp->dev, "setfile too small (0x%lx/0x%zx)\n", fw->size,
   379				setfile->size);
   380			release_firmware(fw);
   381			return -EINVAL;
   382		}
   383	
   384		magic = be32_to_cpup((__be32 *)fw->data);
   385		if (magic != setfile->magic) {
   386			dev_err(isp->dev, "setfile '%s' corrupted?\n", setfile->path);
   387			release_firmware(fw);
   388			return -EINVAL;
   389		}
   390	
   391		isp_iowrite(isp, isp->data_surf->iova, (void *)fw->data, setfile->size);
   392		release_firmware(fw);
   393	
   394		return isp_cmd_ch_set_file_load(isp, ch, isp->data_surf->iova,
   395						setfile->size);
   396	}
   397	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
