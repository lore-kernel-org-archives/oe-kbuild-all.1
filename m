Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 328C621ABDC
	for <oe-kbuild-all@lists.linux.dev>; Sun, 16 Nov 2025 04:21:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763266871; cv=none; b=HAtgS6z4xpWgjvnHgRyvxLvV3Yi2G+qzMsZOqnjpE+zfXotAP56PiRwa/Tq5DgBWujS9zrvg8sQ9ER5s+maCjAlCj4pML8UYoXbc2xfs+O/feshLfETvaKcFGOzvCtBZWqQZmxSqx5Unps1JpFnxo2ToTiBuR0x4Fq1GUDNwa1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763266871; c=relaxed/simple;
	bh=TnANSApNfiRuzxl5SSErnCUG6/kAMhCPOvrkIbicijI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RsTCsaqaZt7qIvjJEAjqAoJaHVmAv9nHNDCx7s+VqgF6mdZq1F4YGPoQp4G5QALJZamTpS9r1eoZuziPgGWdMQ0tixIbWYoqCdJH6kESKpZklzXwOvqd9qCMP2Qe47YahaK+TfKxVTix0gY23VwQoXP+Jq1TLBsW9y+IUXEZGkM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mrr5iJNJ; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mrr5iJNJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763266868; x=1794802868;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=TnANSApNfiRuzxl5SSErnCUG6/kAMhCPOvrkIbicijI=;
  b=mrr5iJNJK5SxiHXHvI1q+FT26fzMYPumzSFcz2DYP0ThkWgHf6t4cQg/
   V9UpKuATXD5yRzIzef4Me0dzhv88iydpF7GyL2WZ7Ermn75ywmuyD9ixt
   rkcuHEvGZ3eHqmFyrrZhwQzMh5Vw1JgiOWFm3jiWhJQVhC3nFvKKBVgNM
   +4SkzKkdkrqH/dFW0Og6ioeJAXg4TUjyeIK5gTSfSO8WVz+LwbEgAy3Gk
   GolS5CgDNQ3o9zR1IdeY3fSoPeMS3d88qfZj2Uj0t30VMtrHvyzybrVGU
   xlnLG4It8hfny0xVqKut2DhY1Un+LKkIEE6RBQDo6r1Hv0HVVcCz+gWQy
   w==;
X-CSE-ConnectionGUID: LsckuBEwRbG+c71Pid+2og==
X-CSE-MsgGUID: kWOIhgu1TNujvgPvvgV2AA==
X-IronPort-AV: E=McAfee;i="6800,10657,11614"; a="68928582"
X-IronPort-AV: E=Sophos;i="6.19,308,1754982000"; 
   d="scan'208";a="68928582"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2025 20:21:05 -0800
X-CSE-ConnectionGUID: /DFpGrdiT8a0l8C42Vpq9Q==
X-CSE-MsgGUID: CiwWrOfASTCLE8t925dahA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,308,1754982000"; 
   d="scan'208";a="195281271"
Received: from lkp-server01.sh.intel.com (HELO 7b01c990427b) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 15 Nov 2025 20:21:03 -0800
Received: from kbuild by 7b01c990427b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vKUG5-0008V1-1S;
	Sun, 16 Nov 2025 04:21:01 +0000
Date: Sun, 16 Nov 2025 12:20:22 +0800
From: kernel test robot <lkp@intel.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ardb:x86-pie-v3 11/14]
 drivers/gpu/drm/i915/intel_memory_region.c:273:61: warning: '%u' directive
 output may be truncated writing between 1 and 5 bytes into a region of size
 between 3 and 11
Message-ID: <202511161244.qmSoMIkT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git x86-pie-v3
head:   df5520ea7e635c1cf8dd6620c2ece567ada21c26
commit: 7a98647d5f5badfa99588a7f64cd39be668fc283 [11/14] x86: Use PIE codegen for the core kernel
config: x86_64-defconfig (https://download.01.org/0day-ci/archive/20251116/202511161244.qmSoMIkT-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251116/202511161244.qmSoMIkT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511161244.qmSoMIkT-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/i915/intel_memory_region.c: In function 'intel_memory_region_create':
>> drivers/gpu/drm/i915/intel_memory_region.c:273:61: warning: '%u' directive output may be truncated writing between 1 and 5 bytes into a region of size between 3 and 11 [-Wformat-truncation=]
     273 |         snprintf(mem->uabi_name, sizeof(mem->uabi_name), "%s%u",
         |                                                             ^~
   drivers/gpu/drm/i915/intel_memory_region.c:273:58: note: directive argument in the range [0, 65535]
     273 |         snprintf(mem->uabi_name, sizeof(mem->uabi_name), "%s%u",
         |                                                          ^~~~~~
   drivers/gpu/drm/i915/intel_memory_region.c:273:9: note: 'snprintf' output between 7 and 19 bytes into a destination of size 16
     273 |         snprintf(mem->uabi_name, sizeof(mem->uabi_name), "%s%u",
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     274 |                  intel_memory_type_str(type), instance);
         |                  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +273 drivers/gpu/drm/i915/intel_memory_region.c

3b38d35157530c Tvrtko Ursulin     2023-11-07  245  
232a6ebae41919 Matthew Auld       2019-10-08  246  struct intel_memory_region *
232a6ebae41919 Matthew Auld       2019-10-08  247  intel_memory_region_create(struct drm_i915_private *i915,
232a6ebae41919 Matthew Auld       2019-10-08  248  			   resource_size_t start,
232a6ebae41919 Matthew Auld       2019-10-08  249  			   resource_size_t size,
232a6ebae41919 Matthew Auld       2019-10-08  250  			   resource_size_t min_page_size,
232a6ebae41919 Matthew Auld       2019-10-08  251  			   resource_size_t io_start,
235582ca96214b Matthew Auld       2022-02-25  252  			   resource_size_t io_size,
d148738923fdb5 Thomas Hellström   2021-06-02  253  			   u16 type,
d148738923fdb5 Thomas Hellström   2021-06-02  254  			   u16 instance,
232a6ebae41919 Matthew Auld       2019-10-08  255  			   const struct intel_memory_region_ops *ops)
232a6ebae41919 Matthew Auld       2019-10-08  256  {
232a6ebae41919 Matthew Auld       2019-10-08  257  	struct intel_memory_region *mem;
232a6ebae41919 Matthew Auld       2019-10-08  258  	int err;
232a6ebae41919 Matthew Auld       2019-10-08  259  
232a6ebae41919 Matthew Auld       2019-10-08  260  	mem = kzalloc(sizeof(*mem), GFP_KERNEL);
232a6ebae41919 Matthew Auld       2019-10-08  261  	if (!mem)
232a6ebae41919 Matthew Auld       2019-10-08  262  		return ERR_PTR(-ENOMEM);
232a6ebae41919 Matthew Auld       2019-10-08  263  
232a6ebae41919 Matthew Auld       2019-10-08  264  	mem->i915 = i915;
e54051782e5d78 Jani Nikula        2023-01-16  265  	mem->region = DEFINE_RES_MEM(start, size);
3c0fa9f4ec220d Ville Syrjälä      2024-02-03  266  	mem->io = DEFINE_RES_MEM(io_start, io_size);
232a6ebae41919 Matthew Auld       2019-10-08  267  	mem->min_page_size = min_page_size;
232a6ebae41919 Matthew Auld       2019-10-08  268  	mem->ops = ops;
38f1cb68582cee Lukasz Fiedorowicz 2019-12-27  269  	mem->total = size;
d148738923fdb5 Thomas Hellström   2021-06-02  270  	mem->type = type;
d148738923fdb5 Thomas Hellström   2021-06-02  271  	mem->instance = instance;
232a6ebae41919 Matthew Auld       2019-10-08  272  
3b38d35157530c Tvrtko Ursulin     2023-11-07 @273  	snprintf(mem->uabi_name, sizeof(mem->uabi_name), "%s%u",
9e2434f32d2894 Ville Syrjälä      2025-03-13  274  		 intel_memory_type_str(type), instance);
3b38d35157530c Tvrtko Ursulin     2023-11-07  275  
7c98501acb9431 Matthew Auld       2019-10-08  276  	mutex_init(&mem->objects.lock);
7c98501acb9431 Matthew Auld       2019-10-08  277  	INIT_LIST_HEAD(&mem->objects.list);
232a6ebae41919 Matthew Auld       2019-10-08  278  
232a6ebae41919 Matthew Auld       2019-10-08  279  	if (ops->init) {
232a6ebae41919 Matthew Auld       2019-10-08  280  		err = ops->init(mem);
232a6ebae41919 Matthew Auld       2019-10-08  281  		if (err)
232a6ebae41919 Matthew Auld       2019-10-08  282  			goto err_free;
232a6ebae41919 Matthew Auld       2019-10-08  283  	}
232a6ebae41919 Matthew Auld       2019-10-08  284  
2e21de9028270a Chris Wilson       2021-12-09  285  	err = intel_memory_region_memtest(mem, (void *)_RET_IP_);
2e21de9028270a Chris Wilson       2021-12-09  286  	if (err)
2e21de9028270a Chris Wilson       2021-12-09  287  		goto err_release;
2e21de9028270a Chris Wilson       2021-12-09  288  
232a6ebae41919 Matthew Auld       2019-10-08  289  	return mem;
232a6ebae41919 Matthew Auld       2019-10-08  290  
2e21de9028270a Chris Wilson       2021-12-09  291  err_release:
2e21de9028270a Chris Wilson       2021-12-09  292  	if (mem->ops->release)
2e21de9028270a Chris Wilson       2021-12-09  293  		mem->ops->release(mem);
232a6ebae41919 Matthew Auld       2019-10-08  294  err_free:
232a6ebae41919 Matthew Auld       2019-10-08  295  	kfree(mem);
232a6ebae41919 Matthew Auld       2019-10-08  296  	return ERR_PTR(err);
232a6ebae41919 Matthew Auld       2019-10-08  297  }
232a6ebae41919 Matthew Auld       2019-10-08  298  

:::::: The code at line 273 was first introduced by commit
:::::: 3b38d35157530c12c84fc02cccd469b9a0a00ae7 drm/i915: Add stable memory region names

:::::: TO: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
:::::: CC: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
