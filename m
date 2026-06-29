Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC8B933689E
	for <oe-kbuild-all@lists.linux.dev>; Mon, 29 Jun 2026 04:39:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782707965; cv=none; b=HlOk37cJ1enuk+CXYwYLbNW1pEVkAh+ZF5HNpKDq/jINtSc48VdmizxQm1Ae1dubEhsSbxVZ/5lbScwIWFMpLwKnjpHJD8zgvqWPwVB/4JE5r3V991P7ptaPCTGXpTHKaVNx9ay5ElV0TShy38Zl/3ijyDGIpWf1qsx1EMSuXu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782707965; c=relaxed/simple;
	bh=OnvMnUubZGPl5THYboeDrm+rlbm466tuN6rglkHAKaQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ViUWj+jO123evV2RnSsMarPyyVhR2iW1wBOcdJ7aQQTp337q/UWOYB/cp9q845b0IW5/snCbkoXFKDnyid2CascPlXg7+JbfUW5zZ9zESGNgq6CziD22YZHst4XQmpb3eMPgLB8Q6scZ8/e59ia9ap5t5u91TqM32S3xnBUEs/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Iawl3Qt4; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Iawl3Qt4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782707963; x=1814243963;
  h=date:from:to:cc:subject:message-id;
  bh=OnvMnUubZGPl5THYboeDrm+rlbm466tuN6rglkHAKaQ=;
  b=Iawl3Qt4Rf3PfZ+OGEgi6Lzxdva0VesOapptKITifMoOP/ko2H8mn5Hp
   4T+5gH2abUOyhXLES0UoZqJzCRGJIt/0X4rqqOFONYpj8eQCA0MxlGpJ7
   nDXLbX4c2Avrqd0sxKlptDQDfBWqOCQwyFAccKBgTorc55MMcZxq+rGIP
   H2vlIrOzn82ZtRCTjM2Vq7RhM/BllKS+87S8j0IyFKQvwmaddQuomXiWA
   MAfIGWiRskXIhQCROcJx4OBStHd2apGgz7VChFVh0P23Ekq1bGqCrb1fe
   QclfywRgMcQlT4d2IZxfwJLPZqn+tGeYfa6GSkAvXtK4ra5qg1sXqc72I
   g==;
X-CSE-ConnectionGUID: I8h8G+XZQdWlSHHsx+GDZQ==
X-CSE-MsgGUID: Gm9il9o8SiS3ot8nzsqLvg==
X-IronPort-AV: E=McAfee;i="6800,10657,11831"; a="93971501"
X-IronPort-AV: E=Sophos;i="6.24,231,1774335600"; 
   d="scan'208";a="93971501"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jun 2026 21:39:22 -0700
X-CSE-ConnectionGUID: zQH2xewoQSyErD4KpUQcNA==
X-CSE-MsgGUID: rQ3hvG3MQj6aIMPeeKs5pg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,231,1774335600"; 
   d="scan'208";a="276116269"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 28 Jun 2026 21:39:20 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1we3m9-000000006vR-2KiS;
	Mon, 29 Jun 2026 04:39:17 +0000
Date: Mon, 29 Jun 2026 12:38:29 +0800
From: kernel test robot <lkp@intel.com>
To: Eileen Yoon <eyn@gmx.com>
Cc: oe-kbuild-all@lists.linux.dev, Janne Grunau <j@jannau.net>
Subject: [asahilinux:bits/240-isp 1/53]
 drivers/media/platform/apple/isp/isp-drv.h:253:29: warning: format '%llx'
 expects argument of type 'long long unsigned int', but argument 4 has type
 'dma_addr_t' {aka 'unsigned int'}
Message-ID: <202606291228.yYceMVDS-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/AsahiLinux/linux bits/240-isp
head:   df907add385f43a49d493c59afd3762ae1598548
commit: 329bf83de183f0558c2e5bb6ba55da3f06a2c980 [1/53] media: apple: Add Apple ISP driver
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20260629/202606291228.yYceMVDS-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260629/202606291228.yYceMVDS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606291228.yYceMVDS-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/bvec.h:10,
                    from include/linux/blk_types.h:10,
                    from include/linux/writeback.h:13,
                    from include/linux/memcontrol.h:23,
                    from include/linux/swap.h:9,
                    from include/linux/suspend.h:5,
                    from include/linux/regulator/consumer.h:35,
                    from include/linux/i2c.h:19,
                    from include/media/v4l2-common.h:106,
                    from include/media/v4l2-subdev.h:15,
                    from include/media/v4l2-device.h:13,
                    from drivers/media/platform/apple/isp/isp-drv.h:13,
                    from drivers/media/platform/apple/isp/isp-iommu.h:7,
                    from drivers/media/platform/apple/isp/isp-ipc.c:4:
   include/linux/highmem.h: In function 'clear_user_pages':
   include/linux/highmem.h:234:63: warning: parameter 'vaddr' set but not used [-Wunused-but-set-parameter=]
     234 | static inline void clear_user_pages(void *addr, unsigned long vaddr,
         |                                                 ~~~~~~~~~~~~~~^~~~~
   In file included from include/linux/device.h:15,
                    from include/linux/pci.h:37,
                    from include/media/media-device.h:17,
                    from include/media/v4l2-device.h:12:
   drivers/media/platform/apple/isp/isp-ipc.c: In function 'sm_malloc_deferred_worker':
>> drivers/media/platform/apple/isp/isp-drv.h:253:29: warning: format '%llx' expects argument of type 'long long unsigned int', but argument 4 has type 'dma_addr_t' {aka 'unsigned int'} [-Wformat=]
     253 |         dev_err((isp)->dev, "[%s] " fmt, __func__, ##__VA_ARGS__)
         |                             ^~~~~~~
   include/linux/dev_printk.h:110:30: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ^~~
   include/linux/dev_printk.h:154:56: note: in expansion of macro 'dev_fmt'
     154 |         dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                        ^~~~~~~
   drivers/media/platform/apple/isp/isp-drv.h:253:9: note: in expansion of macro 'dev_err'
     253 |         dev_err((isp)->dev, "[%s] " fmt, __func__, ##__VA_ARGS__)
         |         ^~~~~~~
   drivers/media/platform/apple/isp/isp-ipc.c:227:17: note: in expansion of macro 'isp_err'
     227 |                 isp_err(isp, "failed to vmap iova=0x%llx size=0x%llx\n",
         |                 ^~~~~~~


vim +253 drivers/media/platform/apple/isp/isp-drv.h

   251	
   252	#define isp_err(isp, fmt, ...) \
 > 253		dev_err((isp)->dev, "[%s] " fmt, __func__, ##__VA_ARGS__)
   254	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
