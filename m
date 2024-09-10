Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3208618EFF6
	for <oe-kbuild-all@lists.linux.dev>; Tue, 10 Sep 2024 08:09:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725955743; cv=none; b=PZcwUlQUgasyCuxqxmHyEkBhaTTpwIJF8/hDNP53HGY1SXKAst13mw0OGKA+W77ypyRJYJSP6199Tr/zwuh1cc5tJpnzmdKAUAgZGXtbYWiE3d6eAo/L5uMLrWoryNJEt1C7FwHPRnnLoizD0J3k9MwCK3dVpPaZZw++6QmccYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725955743; c=relaxed/simple;
	bh=0MaA7Q75o2lY7rfg10Z6ZXLlzlGrPmDxnFUEAm8INV0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=f5QhSghtp4D2fSi4Qutmg+lVpc8ZrrMNqk4gl9O4STN1zevu0BKfcU++7v1kDIQJHv5FypylSBLad38KOpcrDKBNKxYQl6v8DDzwovErFQhQXyYdlKcWLpx+tJBJOGOoTj8B9jexGJd4RdaB4b7GyyjvwN65NysTJx2JQ8MwOBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AyloHng4; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AyloHng4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725955741; x=1757491741;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0MaA7Q75o2lY7rfg10Z6ZXLlzlGrPmDxnFUEAm8INV0=;
  b=AyloHng4SXX0HevNN78DyuGdZiiOVxgFfvkUYHRDrUasx5FRYNVdPdbo
   iou3tpGXgHiSR4z9UNRNETDXqCH3/+S0giiGKPDpZXKifF5eGYyVhCvQW
   KieFQW9jGsOGKZyCF0/kGpDjcGbzMsRcyp2FaGiPvpqvg/w7raLhfP/uV
   YAzivWHDfJX7Qs6EcecjeMuQXZH0xKJXVFQTrC8I7dzck5WQHGBavf2DR
   XIS3zLQvmeMB462UYQt8zrcsmrHPvqJ6Q1K3UZHimU/3d+XMWMln49kzs
   07OPOe+ALwQUjlCQ7HVSHCHVsIHX6rhN8PnXII8XCKCL0MWw+Dk15+0l4
   Q==;
X-CSE-ConnectionGUID: VfSNKBgyRhy7xwTEfqij+w==
X-CSE-MsgGUID: A3ap0JtiR+qmorDMtz46HA==
X-IronPort-AV: E=McAfee;i="6700,10204,11190"; a="35353388"
X-IronPort-AV: E=Sophos;i="6.10,216,1719903600"; 
   d="scan'208";a="35353388"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2024 01:09:00 -0700
X-CSE-ConnectionGUID: HUi8qmy3Qci9aPpWo57TSg==
X-CSE-MsgGUID: 8GQsBiXVQe6eqjYLJ6s8Dw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,216,1719903600"; 
   d="scan'208";a="66573863"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 10 Sep 2024 01:08:59 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1snvvk-0000GO-2l;
	Tue, 10 Sep 2024 08:08:56 +0000
Date: Tue, 10 Sep 2024 16:08:15 +0800
From: kernel test robot <lkp@intel.com>
To: Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
	Pavel Machek <pavel@denx.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [cip:linux-6.1.y-cip-rebase 190/438]
 drivers/iommu/io-pgtable-arm.c:1185:undefined reference to
 `alloc_io_pgtable_ops'
Message-ID: <202409101626.sNel54m0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cip/linux-cip.git linux-6.1.y-cip-rebase
head:   fb1857d56e47961f0e5a291c3385b88f610320e3
commit: 16cf7a685142727e637f16ed7d9de15b7a32a753 [190/438] riscv: Kconfig.socs: Add ARCH_RENESAS kconfig option
config: riscv-randconfig-001-20240910 (https://download.01.org/0day-ci/archive/20240910/202409101626.sNel54m0-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240910/202409101626.sNel54m0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409101626.sNel54m0-lkp@intel.com/

All errors (new ones prefixed by >>):

   riscv64-linux-ld: drivers/iommu/io-pgtable-arm.o: in function `arm_lpae_run_tests':
>> drivers/iommu/io-pgtable-arm.c:1185:(.init.text+0x212): undefined reference to `alloc_io_pgtable_ops'
>> riscv64-linux-ld: drivers/iommu/io-pgtable-arm.c:1257:(.init.text+0x792): undefined reference to `free_io_pgtable_ops'
   riscv64-linux-ld: drivers/iommu/ipmmu-vmsa.o: in function `ipmmu_domain_free_context':
>> drivers/iommu/ipmmu-vmsa.c:361:(.text+0x7ee): undefined reference to `free_io_pgtable_ops'
   riscv64-linux-ld: drivers/iommu/ipmmu-vmsa.o: in function `ipmmu_domain_init_context':
>> drivers/iommu/ipmmu-vmsa.c:439:(.text+0xc54): undefined reference to `alloc_io_pgtable_ops'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for IOMMU_IO_PGTABLE_LPAE
   Depends on [n]: IOMMU_SUPPORT [=y] && (ARM || ARM64 || COMPILE_TEST [=n] && !GENERIC_ATOMIC64 [=n])
   Selected by [y]:
   - IPMMU_VMSA [=y] && IOMMU_SUPPORT [=y] && (ARCH_RENESAS [=y] || COMPILE_TEST [=n] && !GENERIC_ATOMIC64 [=n])


vim +1185 drivers/iommu/io-pgtable-arm.c

fe4b991dcd84e0 Will Deacon        2014-11-17  1169  
fe4b991dcd84e0 Will Deacon        2014-11-17  1170  static int __init arm_lpae_run_tests(struct io_pgtable_cfg *cfg)
fe4b991dcd84e0 Will Deacon        2014-11-17  1171  {
9062c1d0bedacf Christophe JAILLET 2019-09-09  1172  	static const enum io_pgtable_fmt fmts[] __initconst = {
fe4b991dcd84e0 Will Deacon        2014-11-17  1173  		ARM_64_LPAE_S1,
fe4b991dcd84e0 Will Deacon        2014-11-17  1174  		ARM_64_LPAE_S2,
fe4b991dcd84e0 Will Deacon        2014-11-17  1175  	};
fe4b991dcd84e0 Will Deacon        2014-11-17  1176  
fe4b991dcd84e0 Will Deacon        2014-11-17  1177  	int i, j;
fe4b991dcd84e0 Will Deacon        2014-11-17  1178  	unsigned long iova;
fe4b991dcd84e0 Will Deacon        2014-11-17  1179  	size_t size;
fe4b991dcd84e0 Will Deacon        2014-11-17  1180  	struct io_pgtable_ops *ops;
fe4b991dcd84e0 Will Deacon        2014-11-17  1181  
fe4b991dcd84e0 Will Deacon        2014-11-17  1182  	selftest_running = true;
fe4b991dcd84e0 Will Deacon        2014-11-17  1183  
fe4b991dcd84e0 Will Deacon        2014-11-17  1184  	for (i = 0; i < ARRAY_SIZE(fmts); ++i) {
fe4b991dcd84e0 Will Deacon        2014-11-17 @1185  		cfg_cookie = cfg;
fe4b991dcd84e0 Will Deacon        2014-11-17  1186  		ops = alloc_io_pgtable_ops(fmts[i], cfg, cfg);
fe4b991dcd84e0 Will Deacon        2014-11-17  1187  		if (!ops) {
fe4b991dcd84e0 Will Deacon        2014-11-17  1188  			pr_err("selftest: failed to allocate io pgtable ops\n");
fe4b991dcd84e0 Will Deacon        2014-11-17  1189  			return -ENOMEM;
fe4b991dcd84e0 Will Deacon        2014-11-17  1190  		}
fe4b991dcd84e0 Will Deacon        2014-11-17  1191  
fe4b991dcd84e0 Will Deacon        2014-11-17  1192  		/*
fe4b991dcd84e0 Will Deacon        2014-11-17  1193  		 * Initial sanity checks.
fe4b991dcd84e0 Will Deacon        2014-11-17  1194  		 * Empty page tables shouldn't provide any translations.
fe4b991dcd84e0 Will Deacon        2014-11-17  1195  		 */
fe4b991dcd84e0 Will Deacon        2014-11-17  1196  		if (ops->iova_to_phys(ops, 42))
fe4b991dcd84e0 Will Deacon        2014-11-17  1197  			return __FAIL(ops, i);
fe4b991dcd84e0 Will Deacon        2014-11-17  1198  
fe4b991dcd84e0 Will Deacon        2014-11-17  1199  		if (ops->iova_to_phys(ops, SZ_1G + 42))
fe4b991dcd84e0 Will Deacon        2014-11-17  1200  			return __FAIL(ops, i);
fe4b991dcd84e0 Will Deacon        2014-11-17  1201  
fe4b991dcd84e0 Will Deacon        2014-11-17  1202  		if (ops->iova_to_phys(ops, SZ_2G + 42))
fe4b991dcd84e0 Will Deacon        2014-11-17  1203  			return __FAIL(ops, i);
fe4b991dcd84e0 Will Deacon        2014-11-17  1204  
fe4b991dcd84e0 Will Deacon        2014-11-17  1205  		/*
fe4b991dcd84e0 Will Deacon        2014-11-17  1206  		 * Distinct mappings of different granule sizes.
fe4b991dcd84e0 Will Deacon        2014-11-17  1207  		 */
fe4b991dcd84e0 Will Deacon        2014-11-17  1208  		iova = 0;
4ae8a5c528c0b1 Kefeng Wang        2016-09-21  1209  		for_each_set_bit(j, &cfg->pgsize_bitmap, BITS_PER_LONG) {
fe4b991dcd84e0 Will Deacon        2014-11-17  1210  			size = 1UL << j;
fe4b991dcd84e0 Will Deacon        2014-11-17  1211  
fe4b991dcd84e0 Will Deacon        2014-11-17  1212  			if (ops->map(ops, iova, iova, size, IOMMU_READ |
fe4b991dcd84e0 Will Deacon        2014-11-17  1213  							    IOMMU_WRITE |
fe4b991dcd84e0 Will Deacon        2014-11-17  1214  							    IOMMU_NOEXEC |
f34ce7a7018c2f Baolin Wang        2020-06-12  1215  							    IOMMU_CACHE, GFP_KERNEL))
fe4b991dcd84e0 Will Deacon        2014-11-17  1216  				return __FAIL(ops, i);
fe4b991dcd84e0 Will Deacon        2014-11-17  1217  
fe4b991dcd84e0 Will Deacon        2014-11-17  1218  			/* Overlapping mappings */
fe4b991dcd84e0 Will Deacon        2014-11-17  1219  			if (!ops->map(ops, iova, iova + size, size,
f34ce7a7018c2f Baolin Wang        2020-06-12  1220  				      IOMMU_READ | IOMMU_NOEXEC, GFP_KERNEL))
fe4b991dcd84e0 Will Deacon        2014-11-17  1221  				return __FAIL(ops, i);
fe4b991dcd84e0 Will Deacon        2014-11-17  1222  
fe4b991dcd84e0 Will Deacon        2014-11-17  1223  			if (ops->iova_to_phys(ops, iova + 42) != (iova + 42))
fe4b991dcd84e0 Will Deacon        2014-11-17  1224  				return __FAIL(ops, i);
fe4b991dcd84e0 Will Deacon        2014-11-17  1225  
fe4b991dcd84e0 Will Deacon        2014-11-17  1226  			iova += SZ_1G;
fe4b991dcd84e0 Will Deacon        2014-11-17  1227  		}
fe4b991dcd84e0 Will Deacon        2014-11-17  1228  
fe4b991dcd84e0 Will Deacon        2014-11-17  1229  		/* Partial unmap */
fe4b991dcd84e0 Will Deacon        2014-11-17  1230  		size = 1UL << __ffs(cfg->pgsize_bitmap);
a2d3a382d6c682 Will Deacon        2019-07-02  1231  		if (ops->unmap(ops, SZ_1G + size, size, NULL) != size)
fe4b991dcd84e0 Will Deacon        2014-11-17  1232  			return __FAIL(ops, i);
fe4b991dcd84e0 Will Deacon        2014-11-17  1233  
fe4b991dcd84e0 Will Deacon        2014-11-17  1234  		/* Remap of partial unmap */
f34ce7a7018c2f Baolin Wang        2020-06-12  1235  		if (ops->map(ops, SZ_1G + size, size, size, IOMMU_READ, GFP_KERNEL))
fe4b991dcd84e0 Will Deacon        2014-11-17  1236  			return __FAIL(ops, i);
fe4b991dcd84e0 Will Deacon        2014-11-17  1237  
fe4b991dcd84e0 Will Deacon        2014-11-17  1238  		if (ops->iova_to_phys(ops, SZ_1G + size + 42) != (size + 42))
fe4b991dcd84e0 Will Deacon        2014-11-17  1239  			return __FAIL(ops, i);
fe4b991dcd84e0 Will Deacon        2014-11-17  1240  
fe4b991dcd84e0 Will Deacon        2014-11-17  1241  		/* Full unmap */
fe4b991dcd84e0 Will Deacon        2014-11-17  1242  		iova = 0;
f793b13ef0c9c1 YueHaibing         2018-04-26  1243  		for_each_set_bit(j, &cfg->pgsize_bitmap, BITS_PER_LONG) {
fe4b991dcd84e0 Will Deacon        2014-11-17  1244  			size = 1UL << j;
fe4b991dcd84e0 Will Deacon        2014-11-17  1245  
a2d3a382d6c682 Will Deacon        2019-07-02  1246  			if (ops->unmap(ops, iova, size, NULL) != size)
fe4b991dcd84e0 Will Deacon        2014-11-17  1247  				return __FAIL(ops, i);
fe4b991dcd84e0 Will Deacon        2014-11-17  1248  
fe4b991dcd84e0 Will Deacon        2014-11-17  1249  			if (ops->iova_to_phys(ops, iova + 42))
fe4b991dcd84e0 Will Deacon        2014-11-17  1250  				return __FAIL(ops, i);
fe4b991dcd84e0 Will Deacon        2014-11-17  1251  
fe4b991dcd84e0 Will Deacon        2014-11-17  1252  			/* Remap full block */
f34ce7a7018c2f Baolin Wang        2020-06-12  1253  			if (ops->map(ops, iova, iova, size, IOMMU_WRITE, GFP_KERNEL))
fe4b991dcd84e0 Will Deacon        2014-11-17  1254  				return __FAIL(ops, i);
fe4b991dcd84e0 Will Deacon        2014-11-17  1255  
fe4b991dcd84e0 Will Deacon        2014-11-17  1256  			if (ops->iova_to_phys(ops, iova + 42) != (iova + 42))
fe4b991dcd84e0 Will Deacon        2014-11-17 @1257  				return __FAIL(ops, i);
fe4b991dcd84e0 Will Deacon        2014-11-17  1258  
fe4b991dcd84e0 Will Deacon        2014-11-17  1259  			iova += SZ_1G;
fe4b991dcd84e0 Will Deacon        2014-11-17  1260  		}
fe4b991dcd84e0 Will Deacon        2014-11-17  1261  
fe4b991dcd84e0 Will Deacon        2014-11-17  1262  		free_io_pgtable_ops(ops);
fe4b991dcd84e0 Will Deacon        2014-11-17  1263  	}
fe4b991dcd84e0 Will Deacon        2014-11-17  1264  
fe4b991dcd84e0 Will Deacon        2014-11-17  1265  	selftest_running = false;
fe4b991dcd84e0 Will Deacon        2014-11-17  1266  	return 0;
fe4b991dcd84e0 Will Deacon        2014-11-17  1267  }
fe4b991dcd84e0 Will Deacon        2014-11-17  1268  

:::::: The code at line 1185 was first introduced by commit
:::::: fe4b991dcd84e0104cf2e29223a819335ed048a7 iommu: add self-consistency tests to ARM LPAE IO page table allocator

:::::: TO: Will Deacon <will.deacon@arm.com>
:::::: CC: Will Deacon <will.deacon@arm.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
