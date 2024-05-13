Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9829F1487F1
	for <oe-kbuild-all@lists.linux.dev>; Mon, 13 May 2024 09:24:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715592273; cv=none; b=QfciiggdtyG5FX9RKS9TxZua9WYIOl/A8jf86vO4zoq43Zjnhr8Vduo2WdWL4iZXSfcDRN3Ma7M3Rjnyb77YBH5aQcaWnNI3M1WNumwJFqcbz/YR2DRyiD/KE+DdfHcjGMCvlcTWUv7bw8Yrp/LNvJia/v3qAEt6/t9oJ+4rHtk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715592273; c=relaxed/simple;
	bh=J5cAD1c2dKYqVqNzS7rC6uInUn5qXdgtIdX9/3QDl08=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W2SDAUm/zE95/55MKy9DdpGkFrmIHy3KUNSB9+W/5VeiAWZKEG1WSzJhs67x728ul0W6pqX1cCUnUivifLF7WjPOqYV/Q07zi0+u6F8RdY8Qor+FO365PZnRPnO+5jWA3ds+KJ94uW4U790VVMs9K+dvwig8cqA9r2p/SXYqqQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=c0TsL4fj; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="c0TsL4fj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715592271; x=1747128271;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=J5cAD1c2dKYqVqNzS7rC6uInUn5qXdgtIdX9/3QDl08=;
  b=c0TsL4fjSig7XSh5NhjVZJXkgUKNRVTRM3u5LQc3FQtauKuwIbc6AxVn
   oFcrRzk1yS0kuAe4bJPciBjqAFdcGj6gZbEg4cMVobrjxKz+sxywVKZKs
   cBXQYQumRdTOiiZZV4mvUR8nN9CQZKulT781GkbgQELRZqK8A4NrnTPLT
   IABDojf8rz3eGcqGyPa0Yjk9dlu3AsuEU6+5VcxJZ7zDzcfgsOXp3G4ya
   10grwPJCYuNpukYQuN+aIO+4P0fUqkKNk/IXt2F34eu513pce0996VI/I
   5qq/YIfr+ZnEHCrSAe5CPMqvBtv4PdcnkeS5y53P6Nzas+F3PW8ma01SP
   w==;
X-CSE-ConnectionGUID: hytf8TUIR86MJuDGMklOpg==
X-CSE-MsgGUID: AsscaBtlTHSuT+AqkP6lDA==
X-IronPort-AV: E=McAfee;i="6600,9927,11071"; a="11339124"
X-IronPort-AV: E=Sophos;i="6.08,158,1712646000"; 
   d="scan'208";a="11339124"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2024 02:24:29 -0700
X-CSE-ConnectionGUID: joNydMbdRNu7zZAnZp8+8A==
X-CSE-MsgGUID: jw73td0CQkKXUpdFJwDqWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,158,1712646000"; 
   d="scan'208";a="34789983"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 13 May 2024 02:24:15 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s6Rum-0009p5-2A;
	Mon, 13 May 2024 09:24:12 +0000
Date: Mon, 13 May 2024 17:23:20 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org
Cc: oe-kbuild-all@lists.linux.dev, nouveau@lists.freedesktop.org,
	dakr@redhat.com
Subject: Re: [PATCH] nouveau/firmware: using dma non-coherent interfaces for
 fw loading.
Message-ID: <202405131724.YtoCSRmy-lkp@intel.com>
References: <20240513064350.1050994-1-airlied@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240513064350.1050994-1-airlied@gmail.com>

Hi Dave,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm-misc/drm-misc-next]
[also build test ERROR on linus/master v6.9 next-20240513]
[cannot apply to drm-tip/drm-tip]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Dave-Airlie/nouveau-firmware-using-dma-non-coherent-interfaces-for-fw-loading/20240513-144435
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20240513064350.1050994-1-airlied%40gmail.com
patch subject: [PATCH] nouveau/firmware: using dma non-coherent interfaces for fw loading.
config: parisc-defconfig (https://download.01.org/0day-ci/archive/20240513/202405131724.YtoCSRmy-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240513/202405131724.YtoCSRmy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405131724.YtoCSRmy-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/gpu/drm/nouveau/nvkm/core/firmware.c: In function 'nvkm_firmware_ctor':
>> drivers/gpu/drm/nouveau/nvkm/core/firmware.c:242:54: error: passing argument 3 of 'dma_alloc_noncoherent' from incompatible pointer type [-Werror=incompatible-pointer-types]
     242 |                                                 len, &fw->phys,
         |                                                      ^~~~~~~~~
         |                                                      |
         |                                                      u64 * {aka long long unsigned int *}
   In file included from include/linux/pci.h:2693,
                    from drivers/gpu/drm/nouveau/include/nvif/os.h:8,
                    from drivers/gpu/drm/nouveau/include/nvkm/core/os.h:4,
                    from drivers/gpu/drm/nouveau/include/nvkm/core/oclass.h:3,
                    from drivers/gpu/drm/nouveau/include/nvkm/core/device.h:4,
                    from drivers/gpu/drm/nouveau/nvkm/core/firmware.c:22:
   include/linux/dma-mapping.h:321:29: note: expected 'dma_addr_t *' {aka 'unsigned int *'} but argument is of type 'u64 *' {aka 'long long unsigned int *'}
     321 |                 dma_addr_t *dma_handle, enum dma_data_direction dir, gfp_t gfp)
         |                 ~~~~~~~~~~~~^~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/dma_alloc_noncoherent +242 drivers/gpu/drm/nouveau/nvkm/core/firmware.c

   224	
   225	int
   226	nvkm_firmware_ctor(const struct nvkm_firmware_func *func, const char *name,
   227			   struct nvkm_device *device, const void *src, int len, struct nvkm_firmware *fw)
   228	{
   229		fw->func = func;
   230		fw->name = name;
   231		fw->device = device;
   232		fw->len = len;
   233	
   234		switch (fw->func->type) {
   235		case NVKM_FIRMWARE_IMG_RAM:
   236			fw->img = kmemdup(src, fw->len, GFP_KERNEL);
   237			break;
   238		case NVKM_FIRMWARE_IMG_DMA: {
   239			len = ALIGN(fw->len, PAGE_SIZE);
   240	
   241			fw->img = dma_alloc_noncoherent(fw->device->dev,
 > 242							len, &fw->phys,

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
