Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61F9D3FEC
	for <oe-kbuild-all@lists.linux.dev>; Wed, 28 Aug 2024 04:01:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724817698; cv=none; b=q6wkJ0rtIPpH025eZgZgEEoqFIFRIRoTx48LlGg4DUHBUhbslGtSukj0Yz4v96EVx+YccCMMPo03wa+6onEasEk6I5vhd1tbK+gcfFvv3A2nsZ6S1iVPZkOvaoeaW8xxP1a/n0zHwBDByl1lXcSlfgaWIMsoCHGkIZzpOjf8Yc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724817698; c=relaxed/simple;
	bh=HHeCf1x2WFIv2dv4QiHGlqMQBP9XP6ma+BW8iT5oPkM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hXLyQMbb46sPb4OaAsKiO4jU+DtOlEwV8WL+P3ODtBaeEzqrOUgGsfHTIWsefuCnPalk+sylzQCOoy+sAeKJAfdsCrXxV474jMccIfAy4Qd1JODNMA9TmWwpipAbp9bz4mKz9cC06vK6vj8bu2p8yGw6JBfO304jyZ7hXS5jtS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VgnL5+m+; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VgnL5+m+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724817696; x=1756353696;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HHeCf1x2WFIv2dv4QiHGlqMQBP9XP6ma+BW8iT5oPkM=;
  b=VgnL5+m+McjMgQfXZ9XF7/HKPzsW/mQ4FLu0E3P70ZUx8tggWcM+XLfG
   HwCs8YVYyMAEzLkoWMj3nuwoG5Fr0CV/xl1fs/C5z1AdNGWT6zblMWk50
   a9ZweQbF2djWcX4BvT50b6iUfn9lXN1Q3+QXwKO2f4Qf5j0xFmb0Ev7I9
   j7LweoL74pMo63TFxoDPacq6vDGM3E23QpaCOfjZpOL9XgR4flBdgf5OZ
   1RHdk6HvPUVrSryEWDA3/Kwa7BmQ53GNlezt9K91Z8WWRSuVKWPHEw3GJ
   9YbkKSo2I7I7/VZtItj1U6QuuLDGYWYMU+StSEmGcQ/hf28kpHbnmgGqw
   w==;
X-CSE-ConnectionGUID: 4dN14sC9SJSN+AuG9nsLhQ==
X-CSE-MsgGUID: nM8f6p8aS6awUc3EXOlX+g==
X-IronPort-AV: E=McAfee;i="6700,10204,11177"; a="40799236"
X-IronPort-AV: E=Sophos;i="6.10,181,1719903600"; 
   d="scan'208";a="40799236"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2024 21:01:36 -0700
X-CSE-ConnectionGUID: D7yXGg4sRZ6RIKjyUuFXeQ==
X-CSE-MsgGUID: ZmOYuK2GQ2meu8wqc+3Tcg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,181,1719903600"; 
   d="scan'208";a="67452594"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 27 Aug 2024 21:01:35 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sj9sC-000KSM-2L;
	Wed, 28 Aug 2024 04:01:32 +0000
Date: Wed, 28 Aug 2024 12:01:23 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Liu Shixin <liushixin2@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 7193/13757] mm/page_alloc.c:4110:9: error: call
 to undeclared function 'dynamic_pool_should_alloc'; ISO C99 and later do not
 support implicit function declarations
Message-ID: <202408281109.dl4CIWeu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   e59105d1ac962dacde2b6480857e834f97ca108e
commit: fd855715f24e3eeadaa56de5fde21c55a14aeea0 [7193/13757] mm/mem_reliable: Fallback to dpool if reliable memory is not enough
config: arm64-randconfig-r064-20240828 (https://download.01.org/0day-ci/archive/20240828/202408281109.dl4CIWeu-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240828/202408281109.dl4CIWeu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408281109.dl4CIWeu-lkp@intel.com/

All errors (new ones prefixed by >>):

>> mm/page_alloc.c:4110:9: error: call to undeclared function 'dynamic_pool_should_alloc'; ISO C99 and later do not support implicit function declarations [-Werror,-Wimplicit-function-declaration]
           return dynamic_pool_should_alloc(gfp_mask & ~GFP_RELIABLE, order);
                  ^
   1 error generated.


vim +/dynamic_pool_should_alloc +4110 mm/page_alloc.c

  4101	
  4102	static inline bool mem_reliable_fallback_dpool(gfp_t gfp_mask, unsigned int order)
  4103	{
  4104		if (!reliable_allow_fb_enabled())
  4105			return false;
  4106	
  4107		if (!(gfp_mask & GFP_RELIABLE))
  4108			return false;
  4109	
> 4110		return dynamic_pool_should_alloc(gfp_mask & ~GFP_RELIABLE, order);
  4111	}
  4112	#else
  4113	static inline struct zone *mem_reliable_fallback_zone(gfp_t gfp_mask,
  4114							      struct alloc_context *ac)
  4115	{
  4116		return NULL;
  4117	}
  4118	static inline void mem_reliable_fallback_slowpath(gfp_t gfp_mask,
  4119							  struct alloc_context *ac) {}
  4120	static inline bool mem_reliable_fallback_dpool(gfp_t gfp_mask, unsigned int order)
  4121	{
  4122		return false;
  4123	}
  4124	#endif
  4125	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
