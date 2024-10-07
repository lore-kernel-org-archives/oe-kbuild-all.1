Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F27764A08
	for <oe-kbuild-all@lists.linux.dev>; Mon,  7 Oct 2024 00:19:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728260364; cv=none; b=ZU9zUbniev0AtQIsTANy5vlzVn1BCDkw8JdR1fLl7vm+GAunKRwhQwRJ4Y71N838MD139rKKsohDiWw0Gd9ZDv1ECb/fWrKjTPpRLyPeb5pJrj0N9v39sduxBTz2+38McuDQhcJa4feq5XLF2d5bhcy7nVVoj7/XeEzxjHHNRAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728260364; c=relaxed/simple;
	bh=yZOFus3QgzfCLDaNDox5LbUTHFJSNKpV2o9NW1pu0Rg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QidTsy+d+aJliVHDbsgFmGko9tIs0o3kRrbWwGr6K11Nx33aDtWrMNhYQvEc9cGCM7DAydNBOd1oBxMwvOhhJJIwRky9Y5t0994KD82Mw2vQh0SFnhLV/vib6Y9dhSSztKPsS9plG72xFOfBHhJm0gC0u3Ff8Erg39JB8/y3s7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NhUGh/k1; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NhUGh/k1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728260363; x=1759796363;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=yZOFus3QgzfCLDaNDox5LbUTHFJSNKpV2o9NW1pu0Rg=;
  b=NhUGh/k1A7FGA101G8UAhyby0Uwuf7bANK3HI2zYFOm+O8wq4gyoOhSb
   BafranyCJxvJg8d3QMAkjrz4DzOhhWt2kZhnzbGzKhHFzxyO1olm+8ilR
   Jl5CGXlOLidzIdQT6fm7rKpdyZlSNMGooOxy4j+N+R6YGfT2g8aOasaYw
   0abJ/gZBXKz1QLwUUCQgofoh0XdcM+z1vTRh9cBs8m/cuHG668RwF7bNo
   wSoqs/JNAS8PPIc0c8CvnVFiqLYh4bM74dhbIC4WXB09B03m8+pHDetdN
   aU65aRVN9YeaRJj1UCDubR2NEh+8HZJW0ap98nsLlXTHrVBuTg/S0MT6F
   Q==;
X-CSE-ConnectionGUID: YviWWrpyTiC1i+cdQD7vNg==
X-CSE-MsgGUID: NGCfW3VMQO2lQaXsfuLDrQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11217"; a="30282404"
X-IronPort-AV: E=Sophos;i="6.11,183,1725346800"; 
   d="scan'208";a="30282404"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Oct 2024 17:19:22 -0700
X-CSE-ConnectionGUID: u4Q4/UduSpK2xzAbia36NQ==
X-CSE-MsgGUID: XO48gbKSSCm4FzCWFRGA8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,183,1725346800"; 
   d="scan'208";a="75743289"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 06 Oct 2024 17:19:21 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sxbT4-0004SW-21;
	Mon, 07 Oct 2024 00:19:18 +0000
Date: Mon, 7 Oct 2024 08:19:17 +0800
From: kernel test robot <lkp@intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
	dri-devel@lists.freedesktop.org
Cc: oe-kbuild-all@lists.linux.dev, Russell King <linux@armlinux.org.uk>
Subject: Re: [PATCH v2 05/10] drm/armada: Allow build with COMPILE_TEST=y
Message-ID: <202410070736.GTeKJE6r-lkp@intel.com>
References: <20241003111851.10453-6-ville.syrjala@linux.intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241003111851.10453-6-ville.syrjala@linux.intel.com>

Hi Ville,

kernel test robot noticed the following build warnings:

[auto build test WARNING on next-20241003]
[cannot apply to shawnguo/for-next linus/master rmk-arm/drm-armada-devel rmk-arm/drm-armada-fixes v6.12-rc1 v6.11 v6.11-rc7 v6.12-rc2]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ville-Syrjala/drm-tilcdc-Allow-build-without-__iowmb/20241003-192043
base:   next-20241003
patch link:    https://lore.kernel.org/r/20241003111851.10453-6-ville.syrjala%40linux.intel.com
patch subject: [PATCH v2 05/10] drm/armada: Allow build with COMPILE_TEST=y
config: csky-randconfig-r121-20241006 (https://download.01.org/0day-ci/archive/20241007/202410070736.GTeKJE6r-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 14.1.0
reproduce: (https://download.01.org/0day-ci/archive/20241007/202410070736.GTeKJE6r-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410070736.GTeKJE6r-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/armada/armada_gem.c:63:37: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void *addr @@
   drivers/gpu/drm/armada/armada_gem.c:63:37: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/gpu/drm/armada/armada_gem.c:63:37: sparse:     got void *addr
   drivers/gpu/drm/armada/armada_gem.c:185:28: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void *addr @@     got void [noderef] __iomem * @@
   drivers/gpu/drm/armada/armada_gem.c:185:28: sparse:     expected void *addr
   drivers/gpu/drm/armada/armada_gem.c:185:28: sparse:     got void [noderef] __iomem *

vim +63 drivers/gpu/drm/armada/armada_gem.c

96f60e37dc6609 Russell King    2012-08-15  40  
96f60e37dc6609 Russell King    2012-08-15  41  void armada_gem_free_object(struct drm_gem_object *obj)
96f60e37dc6609 Russell King    2012-08-15  42  {
96f60e37dc6609 Russell King    2012-08-15  43  	struct armada_gem_object *dobj = drm_to_armada_gem(obj);
dad75a5208ec88 Simona Vetter   2020-09-04  44  	struct armada_private *priv = drm_to_armada_dev(obj->dev);
96f60e37dc6609 Russell King    2012-08-15  45  
96f60e37dc6609 Russell King    2012-08-15  46  	DRM_DEBUG_DRIVER("release obj %p\n", dobj);
96f60e37dc6609 Russell King    2012-08-15  47  
96f60e37dc6609 Russell King    2012-08-15  48  	drm_gem_free_mmap_offset(&dobj->obj);
96f60e37dc6609 Russell King    2012-08-15  49  
0b8ebeacf5ef43 Simona Vetter   2015-11-24  50  	might_lock(&priv->linear_lock);
0b8ebeacf5ef43 Simona Vetter   2015-11-24  51  
96f60e37dc6609 Russell King    2012-08-15  52  	if (dobj->page) {
96f60e37dc6609 Russell King    2012-08-15  53  		/* page backed memory */
96f60e37dc6609 Russell King    2012-08-15  54  		unsigned int order = get_order(dobj->obj.size);
96f60e37dc6609 Russell King    2012-08-15  55  		__free_pages(dobj->page, order);
96f60e37dc6609 Russell King    2012-08-15  56  	} else if (dobj->linear) {
96f60e37dc6609 Russell King    2012-08-15  57  		/* linear backed memory */
0b8ebeacf5ef43 Simona Vetter   2015-11-24  58  		mutex_lock(&priv->linear_lock);
96f60e37dc6609 Russell King    2012-08-15  59  		drm_mm_remove_node(dobj->linear);
0b8ebeacf5ef43 Simona Vetter   2015-11-24  60  		mutex_unlock(&priv->linear_lock);
96f60e37dc6609 Russell King    2012-08-15  61  		kfree(dobj->linear);
96f60e37dc6609 Russell King    2012-08-15  62  		if (dobj->addr)
96f60e37dc6609 Russell King    2012-08-15 @63  			iounmap(dobj->addr);
96f60e37dc6609 Russell King    2012-08-15  64  	}
96f60e37dc6609 Russell King    2012-08-15  65  
96f60e37dc6609 Russell King    2012-08-15  66  	if (dobj->obj.import_attach) {
96f60e37dc6609 Russell King    2012-08-15  67  		/* We only ever display imported data */
0481c8c47f5e85 Russell King    2015-06-15  68  		if (dobj->sgt)
e4ea542846d0ef Dmitry Osipenko 2022-10-17  69  			dma_buf_unmap_attachment_unlocked(dobj->obj.import_attach,
0481c8c47f5e85 Russell King    2015-06-15  70  							  dobj->sgt, DMA_TO_DEVICE);
96f60e37dc6609 Russell King    2012-08-15  71  		drm_prime_gem_destroy(&dobj->obj, NULL);
96f60e37dc6609 Russell King    2012-08-15  72  	}
96f60e37dc6609 Russell King    2012-08-15  73  
96f60e37dc6609 Russell King    2012-08-15  74  	drm_gem_object_release(&dobj->obj);
96f60e37dc6609 Russell King    2012-08-15  75  
96f60e37dc6609 Russell King    2012-08-15  76  	kfree(dobj);
96f60e37dc6609 Russell King    2012-08-15  77  }
96f60e37dc6609 Russell King    2012-08-15  78  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
