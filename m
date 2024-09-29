Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2438C374C4
	for <oe-kbuild-all@lists.linux.dev>; Sun, 29 Sep 2024 17:46:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727632005; cv=none; b=hWFZWi+aOEJzNmNVdOZPNsfVow7rVY1B/TiTK57j43+rkEe6+SIDkOjhUOdz9HNXRsLVBm3shsVLG6SuT4oCoNzVLqflU/Lc4aayvq+BbJctH+w0ftX5lP4W0eao++XJXdBJEAw2QDOQWXycIf1i2YLK7PCpoP2M3P+H9hMHCo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727632005; c=relaxed/simple;
	bh=HKbt+A8YupBPNGxrL5T8bNtvWHJ8hzEDjK0HlbSFG1c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Us9SO4smveySnI8OkxGWVi9LnP8ChLa2ptt1BqJY46fTpadOIbZWwYP7uI2Z+AYfm1MwafAnb8aZKWs59LSVeMH319LgYczSYQKp/1/jlMXrdU4quyvE8OD6OpEZ5SkwLpKHJY/OYdX81u6iYKzPloSSSRrCrDX09iKaRGVotjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mwAFcYv7; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mwAFcYv7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727632004; x=1759168004;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=HKbt+A8YupBPNGxrL5T8bNtvWHJ8hzEDjK0HlbSFG1c=;
  b=mwAFcYv75MK0Mulbkx6CD5Akb5kNDcY/PjoRnezWQ4Hnfeam8WlufDEO
   q8jYgf+4O7NXDyTXZAxKHXP/eIn89tH8AiqrpsltgSU08vpR61rRHZv1/
   rgS0KejSxVHhBqg7s71UZz+PTPkJ9x7OEMrsrBbzYAL+2NNR6U6+dns7T
   UWLI4CauY2fC+8bOTOUAZYYGdibToMH0m1sOiqjvYnHsJuDqsT+DrZmPK
   XCZQXzpvxM3TEejcYFuqZwYgqfxP0Ke7Ony3AOSup8sdyqVSb7wuE7df8
   8wnmvtBCb2R3jDNfQlEJOcWUcpt26Mx+ddMG12+UR2HvfhFU7ddlNpbxY
   g==;
X-CSE-ConnectionGUID: SfSz+4dFT767P3BXZOWhxA==
X-CSE-MsgGUID: griScaJ+TjOKPK3N7/+XEw==
X-IronPort-AV: E=McAfee;i="6700,10204,11210"; a="38105520"
X-IronPort-AV: E=Sophos;i="6.11,163,1725346800"; 
   d="scan'208";a="38105520"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2024 10:46:43 -0700
X-CSE-ConnectionGUID: ZjiFCQN6QWS4knZarLE+/g==
X-CSE-MsgGUID: loki8tLSRfOe7OKO4ie6HQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,163,1725346800"; 
   d="scan'208";a="73042477"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 29 Sep 2024 10:46:41 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1suy0F-000OWq-18;
	Sun, 29 Sep 2024 17:46:39 +0000
Date: Mon, 30 Sep 2024 01:46:19 +0800
From: kernel test robot <lkp@intel.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ardb:x86-pie-v2 23/26]
 drivers/gpu/drm/i915/intel_memory_region.c:262:61: warning: '%u' directive
 output may be truncated writing between 1 and 5 bytes into a region of size
 between 3 and 11
Message-ID: <202409300152.75msDlHL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git x86-pie-v2
head:   2b9142b6c6241b0debfe0d21c911c3aaf0c05670
commit: 73ab629624e08a8d1fad61e724e408d71c5c107f [23/26] x86: Use PIE codegen for the core kernel
config: x86_64-defconfig (https://download.01.org/0day-ci/archive/20240930/202409300152.75msDlHL-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240930/202409300152.75msDlHL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409300152.75msDlHL-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/i915/intel_memory_region.c: In function 'intel_memory_region_create':
>> drivers/gpu/drm/i915/intel_memory_region.c:262:61: warning: '%u' directive output may be truncated writing between 1 and 5 bytes into a region of size between 3 and 11 [-Wformat-truncation=]
     262 |         snprintf(mem->uabi_name, sizeof(mem->uabi_name), "%s%u",
         |                                                             ^~
   drivers/gpu/drm/i915/intel_memory_region.c:262:58: note: directive argument in the range [0, 65535]
     262 |         snprintf(mem->uabi_name, sizeof(mem->uabi_name), "%s%u",
         |                                                          ^~~~~~
   drivers/gpu/drm/i915/intel_memory_region.c:262:9: note: 'snprintf' output between 7 and 19 bytes into a destination of size 16
     262 |         snprintf(mem->uabi_name, sizeof(mem->uabi_name), "%s%u",
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     263 |                  region_type_str(type), instance);
         |                  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +262 drivers/gpu/drm/i915/intel_memory_region.c

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
3c0fa9f4ec220d Ville Syrjälä      2024-02-03  255  	mem->io = DEFINE_RES_MEM(io_start, io_size);
232a6ebae41919 Matthew Auld       2019-10-08  256  	mem->min_page_size = min_page_size;
232a6ebae41919 Matthew Auld       2019-10-08  257  	mem->ops = ops;
38f1cb68582cee Lukasz Fiedorowicz 2019-12-27  258  	mem->total = size;
d148738923fdb5 Thomas Hellström   2021-06-02  259  	mem->type = type;
d148738923fdb5 Thomas Hellström   2021-06-02  260  	mem->instance = instance;
232a6ebae41919 Matthew Auld       2019-10-08  261  
3b38d35157530c Tvrtko Ursulin     2023-11-07 @262  	snprintf(mem->uabi_name, sizeof(mem->uabi_name), "%s%u",
3b38d35157530c Tvrtko Ursulin     2023-11-07  263  		 region_type_str(type), instance);
3b38d35157530c Tvrtko Ursulin     2023-11-07  264  
7c98501acb9431 Matthew Auld       2019-10-08  265  	mutex_init(&mem->objects.lock);
7c98501acb9431 Matthew Auld       2019-10-08  266  	INIT_LIST_HEAD(&mem->objects.list);
232a6ebae41919 Matthew Auld       2019-10-08  267  
232a6ebae41919 Matthew Auld       2019-10-08  268  	if (ops->init) {
232a6ebae41919 Matthew Auld       2019-10-08  269  		err = ops->init(mem);
232a6ebae41919 Matthew Auld       2019-10-08  270  		if (err)
232a6ebae41919 Matthew Auld       2019-10-08  271  			goto err_free;
232a6ebae41919 Matthew Auld       2019-10-08  272  	}
232a6ebae41919 Matthew Auld       2019-10-08  273  
2e21de9028270a Chris Wilson       2021-12-09  274  	err = intel_memory_region_memtest(mem, (void *)_RET_IP_);
2e21de9028270a Chris Wilson       2021-12-09  275  	if (err)
2e21de9028270a Chris Wilson       2021-12-09  276  		goto err_release;
2e21de9028270a Chris Wilson       2021-12-09  277  
232a6ebae41919 Matthew Auld       2019-10-08  278  	return mem;
232a6ebae41919 Matthew Auld       2019-10-08  279  
2e21de9028270a Chris Wilson       2021-12-09  280  err_release:
2e21de9028270a Chris Wilson       2021-12-09  281  	if (mem->ops->release)
2e21de9028270a Chris Wilson       2021-12-09  282  		mem->ops->release(mem);
232a6ebae41919 Matthew Auld       2019-10-08  283  err_free:
232a6ebae41919 Matthew Auld       2019-10-08  284  	kfree(mem);
232a6ebae41919 Matthew Auld       2019-10-08  285  	return ERR_PTR(err);
232a6ebae41919 Matthew Auld       2019-10-08  286  }
232a6ebae41919 Matthew Auld       2019-10-08  287  

:::::: The code at line 262 was first introduced by commit
:::::: 3b38d35157530c12c84fc02cccd469b9a0a00ae7 drm/i915: Add stable memory region names

:::::: TO: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
:::::: CC: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
