Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBC07101E2
	for <oe-kbuild-all@lists.linux.dev>; Thu, 25 Jan 2024 03:10:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706152239; cv=none; b=FY5ohdzJ6J5sCjhWom2IOEnKXd27ZNJBa0uU602knrFCU72oMPJHSnj0VNB44w8yl2mG2BRWHDPbcDnUWHiRu431DdRh2T3/l7H0BKmBfRCItd0o8tuGKIvKkf9ygxlcEe+TnQ5/A5v2brmjH14RqDmpUS1a4EzmjdBZcWlwFQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706152239; c=relaxed/simple;
	bh=7ol19966DijfXtQb44eHpKE7mGLfYf1DY0JGBV0Nz5A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BoDoU/KnwH/JnUj+KGaonl6OhTjLcEjT6ai8zi4nbfZFbyVrn7PTlxYxfTBciMUEp2DZPW7TrerIEtro8SyfMGcz7n7c5lWBXyifFOdl0OiABtVBKYBv7UiwSIWswbihV2fb7FxNCQhLuSCO4Hqmp78WLSJ9CufdT2I1CF58ovY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ywoo2sMS; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ywoo2sMS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706152228; x=1737688228;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=7ol19966DijfXtQb44eHpKE7mGLfYf1DY0JGBV0Nz5A=;
  b=Ywoo2sMSPv8hZP+C22GA6qi5DIy//hNRGugs0WFZBb4Tr65yGeofo0K+
   NrJ+nQ6U4TeFpy3KHkHwbXNm0P0h8kK0S4SSJ8WW0FLOGR9sbh4qENAUr
   9kXPFmJNbYASQZgMV6j/5q+3kYUjx0hc8oUKyW/Qdx6RzLFa/WZDE+tdA
   4z2wosqk8dmudr0Yj/UOCuDYR0bYoJ48dWMKPiWgIgm2emBA1DOz9UsQQ
   YQf7GfyC7QWk3ydhZjzIjkMZkoVN4mZdK/IJPpSOQqDPkky7EqY/DFMQO
   WKEMYfZhu+zE5YSrvuG7XrukE2usbBc7PjiaRNLejpZNrqc0xQdHY9uL3
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="15393481"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="15393481"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2024 19:10:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="786617529"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="786617529"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 24 Jan 2024 19:10:21 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rSq8B-0008c2-1W;
	Thu, 25 Jan 2024 03:10:19 +0000
Date: Thu, 25 Jan 2024 11:09:54 +0800
From: kernel test robot <lkp@intel.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ardb:for-kernelci 4/4]
 drivers/gpu/drm/i915/intel_memory_region.c:263:61: warning: '%u' directive
 output may be truncated writing between 1 and 5 bytes into a region of size
 between 3 and 11
Message-ID: <202401251112.YeyXF8PI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git for-kernelci
head:   1e140a96e8ce220d86926c91c3985f13ac88d816
commit: 1e140a96e8ce220d86926c91c3985f13ac88d816 [4/4] x86: Build the core kernel with position independent codegen
config: x86_64-defconfig (https://download.01.org/0day-ci/archive/20240125/202401251112.YeyXF8PI-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240125/202401251112.YeyXF8PI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401251112.YeyXF8PI-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/i915/intel_memory_region.c: In function 'intel_memory_region_create':
>> drivers/gpu/drm/i915/intel_memory_region.c:263:61: warning: '%u' directive output may be truncated writing between 1 and 5 bytes into a region of size between 3 and 11 [-Wformat-truncation=]
     263 |         snprintf(mem->uabi_name, sizeof(mem->uabi_name), "%s%u",
         |                                                             ^~
   drivers/gpu/drm/i915/intel_memory_region.c:263:58: note: directive argument in the range [0, 65535]
     263 |         snprintf(mem->uabi_name, sizeof(mem->uabi_name), "%s%u",
         |                                                          ^~~~~~
   drivers/gpu/drm/i915/intel_memory_region.c:263:9: note: 'snprintf' output between 7 and 19 bytes into a destination of size 16
     263 |         snprintf(mem->uabi_name, sizeof(mem->uabi_name), "%s%u",
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     264 |                  region_type_str(type), instance);
         |                  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +263 drivers/gpu/drm/i915/intel_memory_region.c

3b38d35157530c Tvrtko Ursulin     2023-11-07  234  
232a6ebae41919 Matthew Auld       2019-10-08  235  struct intel_memory_region *
232a6ebae41919 Matthew Auld       2019-10-08  236  intel_memory_region_create(struct drm_i915_private *i915,
232a6ebae41919 Matthew Auld       2019-10-08  237  			   resource_size_t start,
232a6ebae41919 Matthew Auld       2019-10-08  238  			   resource_size_t size,
232a6ebae41919 Matthew Auld       2019-10-08  239  			   resource_size_t min_page_size,
232a6ebae41919 Matthew Auld       2019-10-08  240  			   resource_size_t io_start,
235582ca96214b Matthew Auld       2022-02-25  241  			   resource_size_t io_size,
d148738923fdb5 Thomas Hellström   2021-06-02  242  			   u16 type,
d148738923fdb5 Thomas Hellström   2021-06-02  243  			   u16 instance,
232a6ebae41919 Matthew Auld       2019-10-08  244  			   const struct intel_memory_region_ops *ops)
232a6ebae41919 Matthew Auld       2019-10-08  245  {
232a6ebae41919 Matthew Auld       2019-10-08  246  	struct intel_memory_region *mem;
232a6ebae41919 Matthew Auld       2019-10-08  247  	int err;
232a6ebae41919 Matthew Auld       2019-10-08  248  
232a6ebae41919 Matthew Auld       2019-10-08  249  	mem = kzalloc(sizeof(*mem), GFP_KERNEL);
232a6ebae41919 Matthew Auld       2019-10-08  250  	if (!mem)
232a6ebae41919 Matthew Auld       2019-10-08  251  		return ERR_PTR(-ENOMEM);
232a6ebae41919 Matthew Auld       2019-10-08  252  
232a6ebae41919 Matthew Auld       2019-10-08  253  	mem->i915 = i915;
e54051782e5d78 Jani Nikula        2023-01-16  254  	mem->region = DEFINE_RES_MEM(start, size);
232a6ebae41919 Matthew Auld       2019-10-08  255  	mem->io_start = io_start;
235582ca96214b Matthew Auld       2022-02-25  256  	mem->io_size = io_size;
232a6ebae41919 Matthew Auld       2019-10-08  257  	mem->min_page_size = min_page_size;
232a6ebae41919 Matthew Auld       2019-10-08  258  	mem->ops = ops;
38f1cb68582cee Lukasz Fiedorowicz 2019-12-27  259  	mem->total = size;
d148738923fdb5 Thomas Hellström   2021-06-02  260  	mem->type = type;
d148738923fdb5 Thomas Hellström   2021-06-02  261  	mem->instance = instance;
232a6ebae41919 Matthew Auld       2019-10-08  262  
3b38d35157530c Tvrtko Ursulin     2023-11-07 @263  	snprintf(mem->uabi_name, sizeof(mem->uabi_name), "%s%u",
3b38d35157530c Tvrtko Ursulin     2023-11-07  264  		 region_type_str(type), instance);
3b38d35157530c Tvrtko Ursulin     2023-11-07  265  
7c98501acb9431 Matthew Auld       2019-10-08  266  	mutex_init(&mem->objects.lock);
7c98501acb9431 Matthew Auld       2019-10-08  267  	INIT_LIST_HEAD(&mem->objects.list);
232a6ebae41919 Matthew Auld       2019-10-08  268  
232a6ebae41919 Matthew Auld       2019-10-08  269  	if (ops->init) {
232a6ebae41919 Matthew Auld       2019-10-08  270  		err = ops->init(mem);
232a6ebae41919 Matthew Auld       2019-10-08  271  		if (err)
232a6ebae41919 Matthew Auld       2019-10-08  272  			goto err_free;
232a6ebae41919 Matthew Auld       2019-10-08  273  	}
232a6ebae41919 Matthew Auld       2019-10-08  274  
2e21de9028270a Chris Wilson       2021-12-09  275  	err = intel_memory_region_memtest(mem, (void *)_RET_IP_);
2e21de9028270a Chris Wilson       2021-12-09  276  	if (err)
2e21de9028270a Chris Wilson       2021-12-09  277  		goto err_release;
2e21de9028270a Chris Wilson       2021-12-09  278  
232a6ebae41919 Matthew Auld       2019-10-08  279  	return mem;
232a6ebae41919 Matthew Auld       2019-10-08  280  
2e21de9028270a Chris Wilson       2021-12-09  281  err_release:
2e21de9028270a Chris Wilson       2021-12-09  282  	if (mem->ops->release)
2e21de9028270a Chris Wilson       2021-12-09  283  		mem->ops->release(mem);
232a6ebae41919 Matthew Auld       2019-10-08  284  err_free:
232a6ebae41919 Matthew Auld       2019-10-08  285  	kfree(mem);
232a6ebae41919 Matthew Auld       2019-10-08  286  	return ERR_PTR(err);
232a6ebae41919 Matthew Auld       2019-10-08  287  }
232a6ebae41919 Matthew Auld       2019-10-08  288  

:::::: The code at line 263 was first introduced by commit
:::::: 3b38d35157530c12c84fc02cccd469b9a0a00ae7 drm/i915: Add stable memory region names

:::::: TO: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
:::::: CC: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
