Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE7F847CC75
	for <oe-kbuild-all@lists.linux.dev>; Tue, 18 Aug 2026 16:59:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787072363; cv=none; b=H1koxaw99GegocEf77ZyefaN717K06AZVG0M6ZUygn//NeP2oEYIyMUtfMRCJOB59wphcLv6bDODJi2xGS6NHPHkQgdF2zCcg5fJvc6S4w+t6XhfupaQIE/Cc8gAYQxoNDUW3NcGzMtb42VW03XLr26uSCTJKQJcoRXA/7m0giI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787072363; c=relaxed/simple;
	bh=wWHh8aAOHgISDMScMgkvtjKRQFS3y8OvRreL48UJkSA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=VLSCwU9njRLSrDxdULkFKSWhAgAjPcKnhwvp8jr2A/GEB6oKTmyRTedRj+S15y/uHQhDacUoNpmymp4hqDSF4SjJhE0uyZ4f0kLLeulVFBO2sh/WbT0I9BE541eOkoOT+QjwJ3myawOqKz0jQ9e7zjoLxcNz7RK0fnWKIpRj5Ws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Kn4DlQRi; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Kn4DlQRi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787072361; x=1818608361;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wWHh8aAOHgISDMScMgkvtjKRQFS3y8OvRreL48UJkSA=;
  b=Kn4DlQRi0w8xnwHFvr37WnJVZ/h3g6QPcCLrNaKFdvweXoOK/IYPNWw8
   SfFOJFJTRU6UsJnEdbpZmxUvdouNpRqcI+Dy/q/Ok+HE9os7Yf6WQSSXf
   WRp3ZPdPJE8YpNqSSdFpVPN9RPt3g1iwmEvcrht+56iw2rX05s6xJqAb8
   IFvxbHHigg0PLYCiKOzj1mI/jQ4Dtsq1KvIzOcVT5FlA7Puhv4aSunuvI
   bwSjL2hq7UUmlHDwqK+YQ8khFEaElgHdWutWBTfgxooC5LxXUdkZwtuWo
   IUXUPJKn331jF8IiA9yD9zlbtUtpMqJT/0d/wgrGGOFJTWHvqSxF6qfpX
   g==;
X-CSE-ConnectionGUID: PSkr7j96SIanNJkjQqHgZA==
X-CSE-MsgGUID: tMhBplcuSJ+5mB3wKClgGw==
X-IronPort-AV: E=McAfee;i="6800,10657,11879"; a="90086870"
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; 
   d="scan'208";a="90086870"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2026 09:59:14 -0700
X-CSE-ConnectionGUID: amohJplWT6Sl3hilZOvKIQ==
X-CSE-MsgGUID: a/65RPFkTSSbfqDcr0eEUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; 
   d="scan'208";a="259092162"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 18 Aug 2026 09:59:13 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wwN9a-00000000eSE-1yOX;
	Tue, 18 Aug 2026 16:59:10 +0000
Date: Wed, 19 Aug 2026 00:58:20 +0800
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>,
 =?utf-8?Q?"=C5=81ukasz?= Bartosik" <ukaszb@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:folio-pool-v2-lockdep 7/21]
 drivers/gpu/drm/drm_gpuvm.c:1113:8: error: use of undeclared identifier
 'gpuvm_scratchpad_key'
Message-ID: <202608190026.CjmHKbyK-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://github.com/jimc/linux.git folio-pool-v2-lockdep
head:   e77ee8289ea0755b0ee299348504d4568f942d71
commit: 67cc13f51c541db3cb7b164a0213776c3ea871db [7/21] drm/gpuvm: Route gpuva_op allocations to folio_scratchpad
config: i386-randconfig-004-20260818 (https://download.01.org/0day-ci/archive/20260819/202608190026.CjmHKbyK-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260819/202608190026.CjmHKbyK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608190026.CjmHKbyK-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/drm_gpuvm.c:1113:8: error: use of undeclared identifier 'gpuvm_scratchpad_key'
    1113 |                                   &gpuvm_scratchpad_key);
         |                                    ^~~~~~~~~~~~~~~~~~~~
   1 error generated.


vim +/gpuvm_scratchpad_key +1113 drivers/gpu/drm/drm_gpuvm.c

  1074	
  1075	/**
  1076	 * drm_gpuvm_init() - initialize a &drm_gpuvm
  1077	 * @gpuvm: pointer to the &drm_gpuvm to initialize
  1078	 * @name: the name of the GPU VA space
  1079	 * @flags: the &drm_gpuvm_flags for this GPUVM
  1080	 * @drm: the &drm_device this VM resides in
  1081	 * @r_obj: the resv &drm_gem_object providing the GPUVM's common &dma_resv
  1082	 * @start_offset: the start offset of the GPU VA space
  1083	 * @range: the size of the GPU VA space
  1084	 * @reserve_offset: the start of the kernel reserved GPU VA area
  1085	 * @reserve_range: the size of the kernel reserved GPU VA area
  1086	 * @ops: &drm_gpuvm_ops called on &drm_gpuvm_sm_map / &drm_gpuvm_sm_unmap
  1087	 *
  1088	 * The &drm_gpuvm must be initialized with this function before use.
  1089	 *
  1090	 * Note that @gpuvm must be cleared to 0 before calling this function. The given
  1091	 * &name is expected to be managed by the surrounding driver structures.
  1092	 */
  1093	void
  1094	drm_gpuvm_init(struct drm_gpuvm *gpuvm, const char *name,
  1095		       enum drm_gpuvm_flags flags,
  1096		       struct drm_device *drm,
  1097		       struct drm_gem_object *r_obj,
  1098		       u64 start_offset, u64 range,
  1099		       u64 reserve_offset, u64 reserve_range,
  1100		       const struct drm_gpuvm_ops *ops)
  1101	{
  1102		gpuvm->rb.tree = RB_ROOT_CACHED;
  1103		INIT_LIST_HEAD(&gpuvm->rb.list);
  1104	
  1105		INIT_LIST_HEAD(&gpuvm->extobj.list);
  1106		spin_lock_init(&gpuvm->extobj.lock);
  1107	
  1108		INIT_LIST_HEAD(&gpuvm->evict.list);
  1109		spin_lock_init(&gpuvm->evict.lock);
  1110	
  1111		init_llist_head(&gpuvm->bo_defer);
  1112		folio_scratchpad_init_key(&gpuvm->va_scratchpad, get_order(SZ_64K),
> 1113					  &gpuvm_scratchpad_key);
  1114	
  1115		kref_init(&gpuvm->kref);
  1116	
  1117		gpuvm->name = name ? name : "unknown";
  1118		gpuvm->flags = flags;
  1119		gpuvm->ops = ops;
  1120		gpuvm->drm = drm;
  1121		gpuvm->r_obj = r_obj;
  1122	
  1123		drm_dev_get(drm);
  1124		drm_gem_object_get(r_obj);
  1125	
  1126		drm_gpuvm_warn_check_overflow(gpuvm, start_offset, range);
  1127		gpuvm->mm_start = start_offset;
  1128		gpuvm->mm_range = range;
  1129	
  1130		memset(&gpuvm->kernel_alloc_node, 0, sizeof(struct drm_gpuva));
  1131		if (reserve_range) {
  1132			gpuvm->kernel_alloc_node.va.addr = reserve_offset;
  1133			gpuvm->kernel_alloc_node.va.range = reserve_range;
  1134	
  1135			if (likely(!drm_gpuvm_warn_check_overflow(gpuvm, reserve_offset,
  1136								  reserve_range)))
  1137				__drm_gpuva_insert(gpuvm, &gpuvm->kernel_alloc_node);
  1138		}
  1139	}
  1140	EXPORT_SYMBOL_GPL(drm_gpuvm_init);
  1141	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
