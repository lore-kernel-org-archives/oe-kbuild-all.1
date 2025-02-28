Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE25227CCD4
	for <oe-kbuild-all@lists.linux.dev>; Fri, 28 Feb 2025 18:41:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740768087; cv=none; b=Qz1xwTJ8rViT28k6cB7JInW89BBO3lz5cxtXQbJ/9GBO2E0mSzrcQ5Q6BroDDv40WN9gfkrUZ60DITKKxygEjb3fK6L0U1/XH92RwFOjas1QQ4PBqIhT0KxLGkwy5C1VvnbkWofr2UPCHI9EPEWaq9A52GTsI0mcvIh1jnScvzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740768087; c=relaxed/simple;
	bh=HyYq5+WPQHIAqD/uRShn+IZJOeDm70UzO90j8DDy47k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jl2ZnliQvp/2sgJBj8gpIM+AzetT/jraseXkLRb7N6r36xV/OPUq51/8tSM0bF6MdR5RzCiKKMLX6B2nPYbYDE45u6JCFaE60fuXCNNMbeIkBovkjfPaK6YhGrsshTMHb8tE+bssyhNKpP/xDkM3f/rDpGKjHCx/xAYn+vt0R/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WbhjapWX; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WbhjapWX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740768086; x=1772304086;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HyYq5+WPQHIAqD/uRShn+IZJOeDm70UzO90j8DDy47k=;
  b=WbhjapWXFVJy3cF1gu8K4VZCWn+NSpSZNDGCHC+Ax3A/evBrafMcsKXQ
   dmBftz+UUyLgoEP0ZHGgS3kGuDgdG+/W5UeUnxqOTXQAHegQoVizPz+Nj
   KL1sKcshC4C8vpnggXrCUJTFV/4yD5svmACDRoX2a0FL0a/0Vlco1j2aV
   YT+9w+vrkwjfAxJPkru9bFVuJNCPzsRU1+bQ7IrHsUci4p8go0J+1Tprk
   HNp9cwNch/2cMK96nd4TmMoYOrBuYTQvEUtdYQSGGB66Jv7uvZ99J1M6C
   bWa4fJ62IatXAB92tBbdt8f2B1bfyH+LRsY9rNMSd9nlPk+7fSnAhOIUQ
   g==;
X-CSE-ConnectionGUID: a2yBCJVOSlCAkeHUqRmuOQ==
X-CSE-MsgGUID: EphDLb6QR1iKIf/NmZWIKA==
X-IronPort-AV: E=McAfee;i="6700,10204,11359"; a="41410280"
X-IronPort-AV: E=Sophos;i="6.13,323,1732608000"; 
   d="scan'208";a="41410280"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Feb 2025 10:41:25 -0800
X-CSE-ConnectionGUID: ZVtmxtDXSsKgK+t95w6CGw==
X-CSE-MsgGUID: ATBey/VWSy++ZN1egZBgrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="122646152"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 28 Feb 2025 10:41:22 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1to5Hr-000FMM-0H;
	Fri, 28 Feb 2025 18:40:56 +0000
Date: Sat, 1 Mar 2025 02:38:29 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Jiang <dave.jiang@intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Li Ming <ming.li@zohomail.com>,
	Alison Schofield <alison.schofield@intel.com>
Subject: [linux-next:master 6260/7423] drivers/cxl/core/region.c:3263:26:
 warning: format '%lld' expects argument of type 'long long int', but
 argument 3 has type 'resource_size_t' {aka 'unsigned int'}
Message-ID: <202503010252.mIDhZ5kY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   c0eb65494e59d9834af7cbad983629e9017b25a1
commit: 0ec9849b63338da7883440ed3f52757cd8c847b1 [6260/7423] acpi/hmat / cxl: Add extended linear cache support for CXL
config: arm-randconfig-001-20250301 (https://download.01.org/0day-ci/archive/20250301/202503010252.mIDhZ5kY-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250301/202503010252.mIDhZ5kY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503010252.mIDhZ5kY-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/device.h:15,
                    from drivers/cxl/core/region.c:5:
   drivers/cxl/core/region.c: In function 'cxl_extended_linear_cache_resize':
   drivers/cxl/core/region.c:3263:26: warning: '#' flag used with '%d' gnu_printf format [-Wformat=]
    3263 |                          "Extended Linear Cache size %#lld != CXL size %#lld. No Support!",
         |                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:110:30: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ^~~
   include/linux/dev_printk.h:156:61: note: in expansion of macro 'dev_fmt'
     156 |         dev_printk_index_wrap(_dev_warn, KERN_WARNING, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                             ^~~~~~~
   drivers/cxl/core/region.c:3262:17: note: in expansion of macro 'dev_warn'
    3262 |                 dev_warn(&cxlr->dev,
         |                 ^~~~~~~~
   drivers/cxl/core/region.c:3263:58: note: format string is defined here
    3263 |                          "Extended Linear Cache size %#lld != CXL size %#lld. No Support!",
         |                                                          ^
>> drivers/cxl/core/region.c:3263:26: warning: format '%lld' expects argument of type 'long long int', but argument 3 has type 'resource_size_t' {aka 'unsigned int'} [-Wformat=]
    3263 |                          "Extended Linear Cache size %#lld != CXL size %#lld. No Support!",
         |                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:110:30: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ^~~
   include/linux/dev_printk.h:156:61: note: in expansion of macro 'dev_fmt'
     156 |         dev_printk_index_wrap(_dev_warn, KERN_WARNING, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                             ^~~~~~~
   drivers/cxl/core/region.c:3262:17: note: in expansion of macro 'dev_warn'
    3262 |                 dev_warn(&cxlr->dev,
         |                 ^~~~~~~~
   drivers/cxl/core/region.c:3263:58: note: format string is defined here
    3263 |                          "Extended Linear Cache size %#lld != CXL size %#lld. No Support!",
         |                                                      ~~~~^
         |                                                          |
         |                                                          long long int
         |                                                      %#d
   drivers/cxl/core/region.c:3263:26: warning: '#' flag used with '%d' gnu_printf format [-Wformat=]
    3263 |                          "Extended Linear Cache size %#lld != CXL size %#lld. No Support!",
         |                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:110:30: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ^~~
   include/linux/dev_printk.h:156:61: note: in expansion of macro 'dev_fmt'
     156 |         dev_printk_index_wrap(_dev_warn, KERN_WARNING, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                             ^~~~~~~
   drivers/cxl/core/region.c:3262:17: note: in expansion of macro 'dev_warn'
    3262 |                 dev_warn(&cxlr->dev,
         |                 ^~~~~~~~
   drivers/cxl/core/region.c:3263:76: note: format string is defined here
    3263 |                          "Extended Linear Cache size %#lld != CXL size %#lld. No Support!",
         |                                                                            ^
   drivers/cxl/core/region.c:3263:26: warning: format '%lld' expects argument of type 'long long int', but argument 4 has type 'resource_size_t' {aka 'unsigned int'} [-Wformat=]
    3263 |                          "Extended Linear Cache size %#lld != CXL size %#lld. No Support!",
         |                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:110:30: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ^~~
   include/linux/dev_printk.h:156:61: note: in expansion of macro 'dev_fmt'
     156 |         dev_printk_index_wrap(_dev_warn, KERN_WARNING, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                             ^~~~~~~
   drivers/cxl/core/region.c:3262:17: note: in expansion of macro 'dev_warn'
    3262 |                 dev_warn(&cxlr->dev,
         |                 ^~~~~~~~
   drivers/cxl/core/region.c:3263:76: note: format string is defined here
    3263 |                          "Extended Linear Cache size %#lld != CXL size %#lld. No Support!",
         |                                                                        ~~~~^
         |                                                                            |
         |                                                                            long long int
         |                                                                        %#d


vim +3263 drivers/cxl/core/region.c

  3240	
  3241	static int cxl_extended_linear_cache_resize(struct cxl_region *cxlr,
  3242						    struct resource *res)
  3243	{
  3244		struct cxl_root_decoder *cxlrd = to_cxl_root_decoder(cxlr->dev.parent);
  3245		struct cxl_region_params *p = &cxlr->params;
  3246		int nid = phys_to_target_node(res->start);
  3247		resource_size_t size, cache_size, start;
  3248		int rc;
  3249	
  3250		size = resource_size(res);
  3251		if (!size)
  3252			return -EINVAL;
  3253	
  3254		rc = cxl_acpi_get_extended_linear_cache_size(res, nid, &cache_size);
  3255		if (rc)
  3256			return rc;
  3257	
  3258		if (!cache_size)
  3259			return 0;
  3260	
  3261		if (size != cache_size) {
> 3262			dev_warn(&cxlr->dev,
> 3263				 "Extended Linear Cache size %#lld != CXL size %#lld. No Support!",
  3264				 cache_size, size);
  3265			return -EOPNOTSUPP;
  3266		}
  3267	
  3268		/*
  3269		 * Move the start of the range to where the cache range starts. The
  3270		 * implementation assumes that the cache range is in front of the
  3271		 * CXL range. This is not dictated by the HMAT spec but is how the
  3272		 * current known implementation is configured.
  3273		 *
  3274		 * The cache range is expected to be within the CFMWS. The adjusted
  3275		 * res->start should not be less than cxlrd->res->start.
  3276		 */
  3277		start = res->start - cache_size;
  3278		if (start < cxlrd->res->start)
  3279			return -ENXIO;
  3280	
  3281		res->start = start;
  3282		p->cache_size = cache_size;
  3283	
  3284		return 0;
  3285	}
  3286	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
