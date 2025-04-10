Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E42B203711
	for <oe-kbuild-all@lists.linux.dev>; Thu, 10 Apr 2025 19:02:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744311732; cv=none; b=jil/G1OqmSMogIesDuJELriw31Pa+/m/Fh1jwb73TShge5I8Ckm8ehJMZXxngkqaTHZPlOjdG1837+AI/Game6OwZL9ctQYwWcJuuwlMyIcOpxuxUImEQ3Z9OlyZ3yopWS8lBl2oHHZMRx3y5s71D+SVrB/aETNh/C5uSJwXRjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744311732; c=relaxed/simple;
	bh=g8WIGmwoyeNr48iWhFe4ZqZrK6MCR+OezCj1ZdNLtsI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=A+gsWn6qZ857txlwH1vPQA2JS6EOhVgZYHwrJqsIOwLVZ5P5CROkakzeBS0NExL4WmbcxXOe+wqvUB5Ol/IdNBp14gELTdVZQxmNegFPaNcdDxrUIfYUFbq0znzZVsJjPRMMGBCJlSi2P1HGEvrRkd2AxWGk4knr0Wmkg0bPbQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ivwRUqFY; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ivwRUqFY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744311730; x=1775847730;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=g8WIGmwoyeNr48iWhFe4ZqZrK6MCR+OezCj1ZdNLtsI=;
  b=ivwRUqFY5r8JgvNfsvEz8ur+djIlWu08umSfQxT6dkYckbRHu7ckyW8m
   Sr84LBu73EmJpkYVgYzG5dgUYD0/nOrClKCmI2y5l/U07k43UfZtZV1Pb
   MTuVDFPj7aOZXXwTe5rhEMIH/cXAA1OnRRmDS9LL/8WNfH4wRS3mY4TiE
   KJe/rCCPuJnf6bq+gIXV4iEoczRX837b4kn+LashH++luN5LhtXxr7Ii6
   Rj8Ht/ZlEv6pxDtTA7/tu+ZBFwuowEp8S2LXNYmReIdIgM/VFqXfp7zV6
   fxzFJZOM6glXlL5rFoDaBPBMp84G7wvO/PrWfuNVLCBruq3isdzR1PVO/
   A==;
X-CSE-ConnectionGUID: HIQnYXWRSfG37OUMzWGyfA==
X-CSE-MsgGUID: 9BAPrlzKS/6znwH+GnBMWg==
X-IronPort-AV: E=McAfee;i="6700,10204,11400"; a="56495514"
X-IronPort-AV: E=Sophos;i="6.15,203,1739865600"; 
   d="scan'208";a="56495514"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2025 12:02:09 -0700
X-CSE-ConnectionGUID: cs7KdabFQgqO2L03bkgfhQ==
X-CSE-MsgGUID: OzH7YdysRfWDptKGXhdigQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,203,1739865600"; 
   d="scan'208";a="129953934"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 10 Apr 2025 12:02:08 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u2xA5-000ARn-2m;
	Thu, 10 Apr 2025 19:02:05 +0000
Date: Fri, 11 Apr 2025 03:01:28 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2117/2117]
 drivers/iommu/loongarch_iommu.c:1292:22: sparse: sparse: incorrect type in
 argument 1 (different address spaces)
Message-ID: <202504110226.FM6zQ8DE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   62b846e657553d00552c1c71b6ecc26017eb1a9a
commit: 72fe4978ee346c10869113410da1b61710dd8d8f [2117/2117] LoongArch: add iommu support
config: loongarch-randconfig-r132-20250411 (https://download.01.org/0day-ci/archive/20250411/202504110226.FM6zQ8DE-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.2.0
reproduce: (https://download.01.org/0day-ci/archive/20250411/202504110226.FM6zQ8DE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504110226.FM6zQ8DE-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/iommu/loongarch_iommu.c:108:9: sparse: sparse: symbol 'la_iommu_last_bdf' was not declared. Should it be static?
   drivers/iommu/loongarch_iommu.c:112:5: sparse: sparse: symbol 'loongarch_iommu_disable' was not declared. Should it be static?
   drivers/iommu/loongarch_iommu.c:130:15: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/iommu/loongarch_iommu.c:130:15: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/iommu/loongarch_iommu.c:130:15: sparse:     got void *
   drivers/iommu/loongarch_iommu.c:132:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/iommu/loongarch_iommu.c:132:9: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/iommu/loongarch_iommu.c:132:9: sparse:     got void *
   drivers/iommu/loongarch_iommu.c:135:15: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/iommu/loongarch_iommu.c:135:15: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/iommu/loongarch_iommu.c:135:15: sparse:     got void *
   drivers/iommu/loongarch_iommu.c:137:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/iommu/loongarch_iommu.c:137:9: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/iommu/loongarch_iommu.c:137:9: sparse:     got void *
   drivers/iommu/loongarch_iommu.c:150:15: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/iommu/loongarch_iommu.c:150:15: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/iommu/loongarch_iommu.c:150:15: sparse:     got void *
   drivers/iommu/loongarch_iommu.c:152:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/iommu/loongarch_iommu.c:152:9: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/iommu/loongarch_iommu.c:152:9: sparse:     got void *
   drivers/iommu/loongarch_iommu.c:155:15: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/iommu/loongarch_iommu.c:155:15: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/iommu/loongarch_iommu.c:155:15: sparse:     got void *
   drivers/iommu/loongarch_iommu.c:157:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/iommu/loongarch_iommu.c:157:9: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/iommu/loongarch_iommu.c:157:9: sparse:     got void *
   drivers/iommu/loongarch_iommu.c:160:15: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/iommu/loongarch_iommu.c:160:15: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/iommu/loongarch_iommu.c:160:15: sparse:     got void *
   drivers/iommu/loongarch_iommu.c:162:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/iommu/loongarch_iommu.c:162:9: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/iommu/loongarch_iommu.c:162:9: sparse:     got void *
   drivers/iommu/loongarch_iommu.c:190:15: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/iommu/loongarch_iommu.c:190:15: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/iommu/loongarch_iommu.c:190:15: sparse:     got void *
   drivers/iommu/loongarch_iommu.c:193:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/iommu/loongarch_iommu.c:193:9: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/iommu/loongarch_iommu.c:193:9: sparse:     got void *
   drivers/iommu/loongarch_iommu.c:196:15: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/iommu/loongarch_iommu.c:196:15: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/iommu/loongarch_iommu.c:196:15: sparse:     got void *
   drivers/iommu/loongarch_iommu.c:199:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/iommu/loongarch_iommu.c:199:9: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/iommu/loongarch_iommu.c:199:9: sparse:     got void *
   drivers/iommu/loongarch_iommu.c:206:15: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/iommu/loongarch_iommu.c:206:15: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/iommu/loongarch_iommu.c:206:15: sparse:     got void *
   drivers/iommu/loongarch_iommu.c:306:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/iommu/loongarch_iommu.c:306:17: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/iommu/loongarch_iommu.c:306:17: sparse:     got void *
   drivers/iommu/loongarch_iommu.c:310:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/iommu/loongarch_iommu.c:310:17: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/iommu/loongarch_iommu.c:310:17: sparse:     got void *
   drivers/iommu/loongarch_iommu.c:312:23: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/iommu/loongarch_iommu.c:312:23: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/iommu/loongarch_iommu.c:312:23: sparse:     got void *
   drivers/iommu/loongarch_iommu.c:314:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/iommu/loongarch_iommu.c:314:17: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/iommu/loongarch_iommu.c:314:17: sparse:     got void *
   drivers/iommu/loongarch_iommu.c:322:23: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/iommu/loongarch_iommu.c:322:23: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/iommu/loongarch_iommu.c:322:23: sparse:     got void *
   drivers/iommu/loongarch_iommu.c:325:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/iommu/loongarch_iommu.c:325:17: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/iommu/loongarch_iommu.c:325:17: sparse:     got void *
   drivers/iommu/loongarch_iommu.c:327:23: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/iommu/loongarch_iommu.c:327:23: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/iommu/loongarch_iommu.c:327:23: sparse:     got void *
   drivers/iommu/loongarch_iommu.c:329:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/iommu/loongarch_iommu.c:329:17: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/iommu/loongarch_iommu.c:329:17: sparse:     got void *
   drivers/iommu/loongarch_iommu.c:349:15: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/iommu/loongarch_iommu.c:349:15: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/iommu/loongarch_iommu.c:349:15: sparse:     got void *
   drivers/iommu/loongarch_iommu.c:352:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/iommu/loongarch_iommu.c:352:9: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/iommu/loongarch_iommu.c:352:9: sparse:     got void *
   drivers/iommu/loongarch_iommu.c:610:6: sparse: sparse: symbol 'domain_deattach_iommu' was not declared. Should it be static?
   drivers/iommu/loongarch_iommu.c:651:28: sparse: sparse: symbol 'lookup_rlooptable' was not declared. Should it be static?
   drivers/iommu/loongarch_iommu.c:662:24: sparse: sparse: symbol 'find_iommu_by_dev' was not declared. Should it be static?
   drivers/iommu/loongarch_iommu.c:721:21: sparse: sparse: symbol 'la_iommu_probe_device' was not declared. Should it be static?
   drivers/iommu/loongarch_iommu.c:752:19: sparse: sparse: symbol 'get_iommu_info_from_dom' was not declared. Should it be static?
   drivers/iommu/loongarch_iommu.c:794:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/iommu/loongarch_iommu.c:794:9: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/iommu/loongarch_iommu.c:794:9: sparse:     got void *
   drivers/iommu/loongarch_iommu.c:795:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/iommu/loongarch_iommu.c:795:9: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/iommu/loongarch_iommu.c:795:9: sparse:     got void *
   drivers/iommu/loongarch_iommu.c:796:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/iommu/loongarch_iommu.c:796:9: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/iommu/loongarch_iommu.c:796:9: sparse:     got void *
   drivers/iommu/loongarch_iommu.c:1178:24: sparse: sparse: symbol 'la_iommu_ops' was not declared. Should it be static?
   drivers/iommu/loongarch_iommu.c:1197:24: sparse: sparse: symbol 'loongarch_get_iommu_by_devid' was not declared. Should it be static?
   drivers/iommu/loongarch_iommu.c:1215:6: sparse: sparse: symbol 'check_device_compat' was not declared. Should it be static?
   drivers/iommu/loongarch_iommu.c:1259:25: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void *confbase @@     got void [noderef] __iomem * @@
   drivers/iommu/loongarch_iommu.c:1259:25: sparse:     expected void *confbase
   drivers/iommu/loongarch_iommu.c:1259:25: sparse:     got void [noderef] __iomem *
>> drivers/iommu/loongarch_iommu.c:1292:22: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void *confbase @@
   drivers/iommu/loongarch_iommu.c:1292:22: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/iommu/loongarch_iommu.c:1292:22: sparse:     got void *confbase
   drivers/iommu/loongarch_iommu.c:1319:30: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void *confbase @@
   drivers/iommu/loongarch_iommu.c:1319:30: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/iommu/loongarch_iommu.c:1319:30: sparse:     got void *confbase
   drivers/iommu/loongarch_iommu.c:1344:28: sparse: sparse: symbol 'create_rlookup_entry' was not declared. Should it be static?

vim +1292 drivers/iommu/loongarch_iommu.c

  1223	
  1224	static int loongarch_iommu_probe(struct pci_dev *pdev,
  1225					const struct pci_device_id *ent)
  1226	{
  1227		int ret = 1;
  1228		int bitmap_sz = 0;
  1229		int tmp;
  1230		bool compat = false;
  1231		struct loongarch_iommu *iommu = NULL;
  1232		resource_size_t base, size;
  1233	
  1234		iommu = loongarch_get_iommu_by_devid(pdev);
  1235		if (iommu == NULL) {
  1236			pci_info(pdev, "%s can't find iommu\n", __func__);
  1237			return -ENODEV;
  1238		}
  1239	
  1240		compat = check_device_compat(pdev);
  1241		if (!compat) {
  1242			pci_info(pdev,
  1243			"%s The iommu driver is not compatible with this device\n",
  1244			__func__);
  1245			return -ENODEV;
  1246		}
  1247	
  1248		iommu->pdev = pdev;
  1249		base = pci_resource_start(pdev, 0);
  1250		size = pci_resource_len(pdev, 0);
  1251		if (!request_mem_region(base, size, "loongarch_iommu")) {
  1252			pci_err(pdev,
  1253			"%d can't reserve mmio registers base %llx size %llx\n",
  1254			__LINE__, base, size);
  1255			return -ENOMEM;
  1256		}
  1257		iommu->confbase_phy = base;
  1258		iommu->conf_size = size;
  1259		iommu->confbase = ioremap(base, size);
  1260		if (iommu->confbase == NULL) {
  1261			pci_info(pdev, "%s iommu pci dev bar0 is NULL\n", __func__);
  1262			return ret;
  1263		}
  1264	
  1265		pr_info("iommu confbase %llx pgtsize %llx\n",
  1266				(u64)iommu->confbase, size);
  1267		tmp = MAX_DOMAIN_ID / 8;
  1268		bitmap_sz = (MAX_DOMAIN_ID % 8) ? (tmp + 1) : tmp;
  1269		iommu->domain_bitmap = bitmap_zalloc(bitmap_sz, GFP_KERNEL);
  1270		if (iommu->domain_bitmap == NULL) {
  1271			pr_err("LA-IOMMU: domain bitmap alloc err bitmap_sz:%d\n",
  1272									bitmap_sz);
  1273			goto out_err;
  1274		}
  1275	
  1276		tmp = MAX_ATTACHED_DEV_ID / 8;
  1277		bitmap_sz = (MAX_ATTACHED_DEV_ID % 8) ? (tmp + 1) : tmp;
  1278		iommu->devtable_bitmap = bitmap_zalloc(bitmap_sz, GFP_KERNEL);
  1279		if (iommu->devtable_bitmap == NULL) {
  1280			pr_err("LA-IOMMU: devtable bitmap alloc err bitmap_sz:%d\n",
  1281									bitmap_sz);
  1282			goto out_err_1;
  1283		}
  1284	
  1285		ret = iommu_device_sysfs_add(&iommu->iommu_dev, &pdev->dev,
  1286			       NULL, "ivhd-%#x", iommu->devid);
  1287		iommu_device_register(&iommu->iommu_dev, &la_iommu_ops, NULL);
  1288		return 0;
  1289	
  1290	out_err_1:
  1291		iommu->pdev = NULL;
> 1292		iounmap(iommu->confbase);
  1293		iommu->confbase = NULL;
  1294		release_mem_region(iommu->confbase_phy, iommu->conf_size);
  1295		iommu->confbase_phy = 0;
  1296		iommu->conf_size = 0;
  1297		kfree(iommu->domain_bitmap);
  1298		iommu->domain_bitmap = NULL;
  1299	out_err:
  1300		return ret;
  1301	}
  1302	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
