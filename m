Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DCD830101B
	for <oe-kbuild-all@lists.linux.dev>; Mon,  3 Nov 2025 11:05:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762167954; cv=none; b=LGEQ4Z8x4O3s9c2G/RAHFFJBbV7HLvJwVGfibt12JxDkcMPCrF8nUbwrbjIZ9rF1WYie5Ul93vDCbS1QLqlBe13LE1e+r4RG0DsNyBFXxr0bpVhIEQPDzDfk/ngirwp2s2DlPfqI9zMF1FkxihzqbAsQi6NYLnlqH9x8j6aciX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762167954; c=relaxed/simple;
	bh=UHFBnzlEjjNMBLpw9qmKoh8HhcG7M/4ZqqTIDyCrzsk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Xgd+JdFOWLnJs0vTAoNcV6Xf5Tfz9uqECOGKxYYSBG959O4qaV9JSiPp9WPwbL92cBPZFSGP8P++a7aYds4OpQVUhFpGr0OWuKfUokASsxaWmXq8mp+02IIDJ9UENLw8cv09y/L+dcpvfyI8eRvdStasRb8nZxrvBiscsCPCSLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=L6YfRQEA; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="L6YfRQEA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762167951; x=1793703951;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UHFBnzlEjjNMBLpw9qmKoh8HhcG7M/4ZqqTIDyCrzsk=;
  b=L6YfRQEAeI4cy9u+dfsPn+6t4E+aTQLub8i5iBILOuSO2z2zheYbWfI2
   PcNCEEYKzraOkexxhkx0QFAlR/KLv8cp4Wt4gFG5CnjBtYKAJVjDH2NeX
   8pDeaHvFZ+X3gt5yFYxoLBbL41rllR2fbGPG0SGsYYtAhOxXFAzL9FZPc
   LL417Ny8HjIt3w5L0+sL6MaIPzlkrphmPsNEyiEwgBijTkq8JBkLVZzaY
   qn6EpFjNeC2+VHxA8uA7l3F6eZNYpFJUZeC1Iw8DiwIFBZzLBcZEREZke
   3ctNrxO2Kk/r48Hye9CrI3T2hCSgcC9vkEDtcX4u2WwgwPF5aHsHZUsEZ
   g==;
X-CSE-ConnectionGUID: MeWZtVyPTMevAqJBIdriBg==
X-CSE-MsgGUID: PGj6WybpR9GhaOM2zHbWAA==
X-IronPort-AV: E=McAfee;i="6800,10657,11601"; a="89702322"
X-IronPort-AV: E=Sophos;i="6.19,276,1754982000"; 
   d="scan'208";a="89702322"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2025 03:05:37 -0800
X-CSE-ConnectionGUID: /ZnDaKW+Sc+W4J005gzefg==
X-CSE-MsgGUID: sgK2ko2NTb6rIY8trqv3dA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,276,1754982000"; 
   d="scan'208";a="192000295"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 03 Nov 2025 03:05:38 -0800
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vFsNS-000Q3a-32;
	Mon, 03 Nov 2025 11:05:34 +0000
Date: Mon, 3 Nov 2025 19:05:23 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Jianquan Lin <linjianquan2@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3075/3075] drivers/ub/ubus/resource.c:98:5:
 warning: no previous prototype for function 'ub_assign_resource'
Message-ID: <202511031846.WZN8QTuN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   a29fc03bd0ddaf7388cf31604ef5bd9807585109
commit: f94773e30426af02371bc80aa047d1144f7b4291 [3075/3075] ub:ubus: Add UBUS resource space basic functions
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20251103/202511031846.WZN8QTuN-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251103/202511031846.WZN8QTuN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511031846.WZN8QTuN-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/ub/ubus/resource.c:98:5: warning: no previous prototype for function 'ub_assign_resource' [-Wmissing-prototypes]
      98 | int ub_assign_resource(struct ub_entity *uent, int idx)
         |     ^
   drivers/ub/ubus/resource.c:98:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      98 | int ub_assign_resource(struct ub_entity *uent, int idx)
         | ^
         | static 
>> drivers/ub/ubus/resource.c:124:6: warning: no previous prototype for function 'ub_release_resource' [-Wmissing-prototypes]
     124 | void ub_release_resource(struct ub_entity *uent, int idx)
         |      ^
   drivers/ub/ubus/resource.c:124:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     124 | void ub_release_resource(struct ub_entity *uent, int idx)
         | ^
         | static 
>> drivers/ub/ubus/resource.c:293:5: warning: no previous prototype for function 'ub_entity_alloc_mmio_idx' [-Wmissing-prototypes]
     293 | int ub_entity_alloc_mmio_idx(struct ub_entity *dev, int idx)
         |     ^
   drivers/ub/ubus/resource.c:293:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     293 | int ub_entity_alloc_mmio_idx(struct ub_entity *dev, int idx)
         | ^
         | static 
   3 warnings generated.


vim +/ub_assign_resource +98 drivers/ub/ubus/resource.c

    97	
  > 98	int ub_assign_resource(struct ub_entity *uent, int idx)
    99	{
   100		struct resource *res = &uent->zone[idx].res;
   101		resource_size_t size;
   102		resource_size_t page_size = PAGE_SIZE;
   103		/* decoder mapped address unit 1M */
   104		resource_size_t align = page_size > SZ_1M ? page_size : SZ_1M;
   105		int ret;
   106	
   107		res->name = ub_name(uent);
   108		res->flags |= IORESOURCE_UNSET | IORESOURCE_SIZEALIGN;
   109		size = uent->zone[idx].region.size;
   110		ret = _ub_assign_resource(uent, idx, size, align);
   111		if (ret < 0) {
   112			ub_err(uent, "RESOURCE %d: failed to assign, size=%#llx\n",
   113			       idx, size);
   114			return ret;
   115		}
   116	
   117		res->flags &= ~IORESOURCE_UNSET;
   118		res->flags &= ~IORESOURCE_STARTALIGN;
   119		ub_info(uent, "RESOURCE %d: assigned %pR\n", idx, res);
   120	
   121		return 0;
   122	}
   123	
 > 124	void ub_release_resource(struct ub_entity *uent, int idx)
   125	{
   126		int ret;
   127	
   128		if (uent->zone[idx].res.parent) {
   129			ret = release_resource(&uent->zone[idx].res);
   130			if (ret)
   131				ub_err(uent, "resource release failed, ret=%d.\n", ret);
   132		}
   133	}
   134	
   135	static void __iomem *ub_iomap_range(struct ub_entity *uent, int res_id,
   136					    unsigned long offset, unsigned long maxlen,
   137					    bool is_wc)
   138	{
   139		resource_size_t start = ub_resource_start(uent, res_id);
   140		resource_size_t len = ub_resource_len(uent, res_id);
   141		unsigned long flags = ub_resource_flags(uent, res_id);
   142	
   143		if (len <= offset || !start)
   144			return NULL;
   145		len -= offset;
   146		start += offset;
   147		if (maxlen && len > maxlen)
   148			len = maxlen;
   149		if (!(flags & IORESOURCE_MEM))
   150			return NULL;
   151	
   152		if (is_wc)
   153			return ioremap_wc(start, len);
   154		else
   155			return ioremap(start, len);
   156	}
   157	
   158	void __iomem *ub_iomap(struct ub_entity *uent, int res_id, unsigned long maxlen)
   159	{
   160		if (res_id >= MAX_UB_RES_NUM || !uent)
   161			return NULL;
   162	
   163		return ub_iomap_range(uent, res_id, 0, maxlen, false);
   164	}
   165	EXPORT_SYMBOL_GPL(ub_iomap);
   166	
   167	void __iomem *ub_iomap_wc(struct ub_entity *uent, int res_id, unsigned long maxlen)
   168	{
   169		if (res_id >= MAX_UB_RES_NUM || !uent)
   170			return NULL;
   171	
   172		return ub_iomap_range(uent, res_id, 0, maxlen, true);
   173	}
   174	EXPORT_SYMBOL_GPL(ub_iomap_wc);
   175	
   176	void ub_iounmap(void __iomem *addr)
   177	{
   178		iounmap(addr);
   179	}
   180	EXPORT_SYMBOL_GPL(ub_iounmap);
   181	
   182	static int ub_read_ubba_reg(struct ub_entity *uent, size_t pg_size, int idx)
   183	{
   184		u32 addr_l_reg[MAX_UB_RES_NUM] = { UB_ERS0_UBBA_L, UB_ERS1_UBBA_L,
   185						   UB_ERS2_UBBA_L };
   186		u32 addr_h_reg[MAX_UB_RES_NUM] = { UB_ERS0_UBBA_H, UB_ERS1_UBBA_H,
   187						   UB_ERS2_UBBA_H };
   188		u32 ss_reg[MAX_UB_RES_NUM] = { UB_ERS0_SS, UB_ERS1_SS, UB_ERS2_SS };
   189		u32 hpa_l = 0, hpa_h = 0, size = 0;
   190		int ret;
   191	
   192		ret = ub_cfg_read_dword(uent, addr_l_reg[idx], &hpa_l);
   193		ret |= ub_cfg_read_dword(uent, addr_h_reg[idx], &hpa_h);
   194		ret |= ub_cfg_read_dword(uent, ss_reg[idx], &size);
   195		if (ret) {
   196			ub_err(uent, "read reg failed when request HPA resource\n");
   197			return -EINVAL;
   198		} else if (size == 0) {
   199			ub_err(uent, "size is 0 when request HPA resource\n");
   200			return -EINVAL;
   201		}
   202	
   203		uent->zone[idx].res.start = ubba_gen(hpa_h, hpa_l);
   204		uent->zone[idx].res.end =
   205			uent->zone[idx].res.start + ((u64)size * pg_size - 1);
   206	
   207		uent->zone[idx].res.flags = IORESOURCE_MEM;
   208		uent->zone[idx].res.name = ub_name(uent);
   209		uent->zone[idx].ubba_used = 1;
   210	
   211		ub_info(uent, "mmio idx %d, %pR\n", idx, &uent->zone[idx].res);
   212		return 0;
   213	}
   214	
   215	static int ub_read_sa_reg(struct ub_entity *uent, size_t pg_size, int idx)
   216	{
   217		u32 sa_l_reg[MAX_UB_RES_NUM] = { UB_ERS0_SA_L, UB_ERS1_SA_L,
   218						 UB_ERS2_SA_L };
   219		u32 sa_h_reg[MAX_UB_RES_NUM] = { UB_ERS0_SA_H, UB_ERS1_SA_H,
   220						 UB_ERS2_SA_H };
   221		u32 ss_reg[MAX_UB_RES_NUM] = { UB_ERS0_SS, UB_ERS1_SS, UB_ERS2_SS };
   222		u32 sa_l = 0, sa_h = 0, size = 0;
   223		int ret;
   224	
   225		ret = ub_cfg_read_dword(uent, sa_l_reg[idx], &sa_l);
   226		ret |= ub_cfg_read_dword(uent, sa_h_reg[idx], &sa_h);
   227		ret |= ub_cfg_read_dword(uent, ss_reg[idx], &size);
   228		if (ret) {
   229			ub_err(uent, "read reg failed when request SA resource\n");
   230			return -EINVAL;
   231		} else if (size == 0) {
   232			ub_err(uent, "size is 0 when request SA resource\n");
   233			return -EINVAL;
   234		}
   235	
   236		/* Shift left 32 bits to get upper-bit address */
   237		uent->zone[idx].region.start = ((u64)sa_h << 32) | sa_l;
   238		uent->zone[idx].region.size = size * pg_size;
   239		uent->zone[idx].res.flags = IORESOURCE_MEM;
   240		uent->zone[idx].sa_used = 1;
   241	
   242		return 0;
   243	}
   244	
   245	static int ub_entity_read_mmio_idx(struct ub_entity *uent, int idx)
   246	{
   247		struct ub_entity *pue;
   248		size_t pg_size = 0;
   249	
   250		/* ue to its mue, mue to Entity0, Entity0 use itself */
   251		pue = uent->pue;
   252		if (pue->entity_idx) /* to ensure Entity0 uent */
   253			pue = pue->pue;
   254	
   255		(void)ub_cfg_read_byte(uent, UB_SYS_PGS, (u8 *)&pg_size);
   256		if ((u8)pg_size & UB_SYS_PGS_SIZE)
   257			pg_size = SZ_64K;
   258		else
   259			pg_size = SZ_4K;
   260	
   261		if (pue->zone[idx].ubba_used)
   262			return ub_read_ubba_reg(uent, pg_size, idx);
   263	
   264		if (pue->zone[idx].sa_used)
   265			return ub_read_sa_reg(uent, pg_size, idx);
   266	
   267		return -EPERM;
   268	}
   269	
   270	int ub_insert_resource(struct ub_entity *dev, int idx)
   271	{
   272		struct resource *res, *root = NULL;
   273		int ret;
   274	
   275		if (idx >= MAX_UB_RES_NUM)
   276			return -EINVAL;
   277	
   278		res = &dev->zone[idx].res;
   279		if (!(res->flags & IORESOURCE_MEM))
   280			return -EINVAL;
   281	
   282		root = &iomem_resource;
   283	
   284		ret = insert_resource(root, res);
   285		if (ret) {
   286			ub_warn(dev, "failed to claim uent resource %pR\n", res);
   287			return -ENOMEM;
   288		}
   289	
   290		return 0;
   291	}
   292	
 > 293	int ub_entity_alloc_mmio_idx(struct ub_entity *dev, int idx)
   294	{
   295		if (is_ibus_controller(dev) || is_idev(dev))
   296			return ub_insert_resource(dev, idx);
   297		return ub_assign_resource(dev, idx);
   298	}
   299	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
