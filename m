Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0753532C309
	for <oe-kbuild-all@lists.linux.dev>; Tue, 10 Feb 2026 06:28:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770704909; cv=none; b=LgUWlBskvo+2b2S7PIPaIlqpM3YeQCt1XI9SoqwDm5Nb/91IqzzDouUftm0R0OMSg6yTeuLNEpbmbgwEs6BQnxGKRaV1/lj77MF19wPDhCV7ZDFCAvUU3UTI8MCuNuQ4I0gkYSHh3BslDpeX4xI28a7jzMT3unvRm1T0BXPFk10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770704909; c=relaxed/simple;
	bh=/VeOuaGD72D2qI7dHYxNFGbGwXLz2BsCFL0qbtNBG6U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MGV3ubPjx8axga2x25Ltj3ToFYK/PTlSDMFk5d1Uj1VP27sUqD+4iJDlcNwyDjbA6nYM9Hr3rmJZc3Rl7kOVLGz7Xdn7x27KyZFD4i6KzFKhr+4eLyUy3cBbK7UFrnry6IGx/m/K2PWInCwlAiM4h3NmRTQyewTQszX86EBB1wc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SC2x/KDb; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SC2x/KDb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770704908; x=1802240908;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=/VeOuaGD72D2qI7dHYxNFGbGwXLz2BsCFL0qbtNBG6U=;
  b=SC2x/KDbcYoAtX5DYhDWHLa58jSegLB3XutEJIYUCN0tpy4c+XGU5QAS
   mxLlxUl3XnagNnjaMtGOSF3yLGlNN1OxC0hS0bAgKIf2jx/dBvUHsIy0v
   dvN+gZr7bb4RbMu8rqwTNNuHzfh8xDWlzbx3eKADe10AqXRyq8FTgVa91
   t7sjoNPSmZ8MkWN+jaiM+AKTpY7cqJaCYk2+otu2oZwCSr5JHb9JzvJgJ
   y/afbknZaNilPuUSQCtCTkd4GEGy3qng9jau/cI61Ey5OMjR4/j4mryKZ
   IZVtxXx1sbHYBz0PVWlvN9TQfcQVLbpsL2Bo0W3T8dB2M8S9YyFvFi0BN
   A==;
X-CSE-ConnectionGUID: CX7r7YZjQeyCY+kVJZN6vg==
X-CSE-MsgGUID: kF8Nq0PrSy+QfNAlunz5Iw==
X-IronPort-AV: E=McAfee;i="6800,10657,11696"; a="71867603"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="71867603"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2026 22:28:27 -0800
X-CSE-ConnectionGUID: kYnO5PM8SLS/fe5bzGR3qg==
X-CSE-MsgGUID: xLVdmYLjTnCbL0jPT2Mnxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="216344929"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 09 Feb 2026 22:28:25 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vphEV-00000000oiq-26rd;
	Tue, 10 Feb 2026 06:28:23 +0000
Date: Tue, 10 Feb 2026 14:28:00 +0800
From: kernel test robot <lkp@intel.com>
To: Liviu Dudau <liviu.dudau@arm.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH] iommu/io-pgtable: Add support for Arm Mali v10+ GPUs
 page table format
Message-ID: <202602101447.y5x0XBO5-lkp@intel.com>
References: <20260209112542.194140-1-liviu.dudau@arm.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260209112542.194140-1-liviu.dudau@arm.com>

Hi Liviu,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on arm-perf/for-next/perf]
[also build test WARNING on linus/master v6.19 next-20260209]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Liviu-Dudau/iommu-io-pgtable-Add-support-for-Arm-Mali-v10-GPUs-page-table-format/20260209-193039
base:   https://git.kernel.org/pub/scm/linux/kernel/git/will/linux.git for-next/perf
patch link:    https://lore.kernel.org/r/20260209112542.194140-1-liviu.dudau%40arm.com
patch subject: [RFC PATCH] iommu/io-pgtable: Add support for Arm Mali v10+ GPUs page table format
config: arc-allmodconfig (https://download.01.org/0day-ci/archive/20260210/202602101447.y5x0XBO5-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260210/202602101447.y5x0XBO5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602101447.y5x0XBO5-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/iommu/io-pgtable-arm.c: In function 'arm_mali_csf_alloc_pgtable':
>> drivers/iommu/io-pgtable-arm.c:1274:30: warning: conversion from 'long long unsigned int' to 'long unsigned int' changes value from '68753047552' to '33570816' [-Woverflow]
    1274 |                 page_sizes = (SZ_16K | SZ_32M | SZ_64G);
         |                              ^


vim +1274 drivers/iommu/io-pgtable-arm.c

  1242	
  1243	static struct io_pgtable *
  1244	arm_mali_csf_alloc_pgtable(struct io_pgtable_cfg *cfg, void *cookie)
  1245	{
  1246		unsigned int max_addr_bits = 48;
  1247		unsigned long granule, page_sizes;
  1248		struct arm_lpae_io_pgtable *data;
  1249		typeof(&cfg->arm_lpae_s1_cfg.tcr) tcr = &cfg->arm_lpae_s1_cfg.tcr;
  1250		int levels, va_bits, pg_shift;
  1251		u64 reg;
  1252	
  1253		if (cfg->quirks & ~(IO_PGTABLE_QUIRK_ARM_TTBR1 |
  1254				    IO_PGTABLE_QUIRK_NO_WARN))
  1255			return NULL;
  1256	
  1257		if (!(cfg->pgsize_bitmap & (SZ_4K | SZ_16K)))
  1258			return NULL;
  1259	
  1260		if (cfg->pgsize_bitmap & PAGE_SIZE)
  1261			granule = PAGE_SIZE;
  1262		else if (cfg->pgsize_bitmap & ~PAGE_MASK)
  1263			granule = 1UL << __fls(cfg->pgsize_bitmap & ~PAGE_MASK);
  1264		else if (cfg->pgsize_bitmap & PAGE_MASK)
  1265			granule = 1UL << __ffs(cfg->pgsize_bitmap & PAGE_MASK);
  1266		else
  1267			granule = 0;
  1268	
  1269		switch (granule) {
  1270		case SZ_4K:
  1271			page_sizes = (SZ_4K | SZ_2M | SZ_1G);
  1272			break;
  1273		case SZ_16K:
> 1274			page_sizes = (SZ_16K | SZ_32M | SZ_64G);
  1275			break;
  1276		default:
  1277			page_sizes = 0;
  1278		}
  1279	
  1280		cfg->pgsize_bitmap &= page_sizes;
  1281		cfg->ias = min(cfg->ias, max_addr_bits);
  1282		cfg->oas = min(cfg->oas, max_addr_bits);
  1283	
  1284		data = kmalloc(sizeof(*data), GFP_KERNEL);
  1285		if (!data)
  1286			return NULL;
  1287	
  1288		pg_shift = __ffs(cfg->pgsize_bitmap);
  1289		data->bits_per_level = pg_shift - ilog2(sizeof(arm_lpae_iopte));
  1290	
  1291		va_bits = cfg->ias - pg_shift;
  1292		levels = DIV_ROUND_UP(va_bits, data->bits_per_level);
  1293		data->start_level = ARM_LPAE_MAX_LEVELS - levels;
  1294	
  1295		/* Calculate the actual size of our pgd (without concatenation) */
  1296		data->pgd_bits = va_bits - (data->bits_per_level * (levels - 1));
  1297	
  1298		data->iop.ops = (struct io_pgtable_ops) {
  1299			.map_pages	= arm_lpae_map_pages,
  1300			.unmap_pages	= arm_lpae_unmap_pages,
  1301			.iova_to_phys	= arm_lpae_iova_to_phys,
  1302			.read_and_clear_dirty = arm_lpae_read_and_clear_dirty,
  1303			.pgtable_walk	= arm_lpae_pgtable_walk,
  1304		};
  1305	
  1306		/* TCR */
  1307		if (cfg->coherent_walk) {
  1308			tcr->sh = ARM_LPAE_TCR_SH_IS;
  1309			tcr->irgn = ARM_LPAE_TCR_RGN_WBWA;
  1310			tcr->orgn = ARM_LPAE_TCR_RGN_WBWA;
  1311			if (cfg->quirks & IO_PGTABLE_QUIRK_ARM_OUTER_WBWA)
  1312				goto out_free_data;
  1313		} else {
  1314			tcr->sh = ARM_LPAE_TCR_SH_OS;
  1315			tcr->irgn = ARM_LPAE_TCR_RGN_NC;
  1316			if (!(cfg->quirks & IO_PGTABLE_QUIRK_ARM_OUTER_WBWA))
  1317				tcr->orgn = ARM_LPAE_TCR_RGN_NC;
  1318			else
  1319				tcr->orgn = ARM_LPAE_TCR_RGN_WBWA;
  1320		}
  1321	
  1322		switch (ARM_LPAE_GRANULE(data)) {
  1323		case SZ_4K:
  1324			tcr->tg = ARM_LPAE_TCR_TG0_4K;
  1325			break;
  1326		case SZ_16K:
  1327			tcr->tg = ARM_LPAE_TCR_TG0_16K;
  1328			break;
  1329		case SZ_64K:
  1330			tcr->tg = ARM_LPAE_TCR_TG0_64K;
  1331			break;
  1332		}
  1333	
  1334		switch (cfg->oas) {
  1335		case 32:
  1336			tcr->ips = ARM_LPAE_TCR_PS_32_BIT;
  1337			break;
  1338		case 36:
  1339			tcr->ips = ARM_LPAE_TCR_PS_36_BIT;
  1340			break;
  1341		case 40:
  1342			tcr->ips = ARM_LPAE_TCR_PS_40_BIT;
  1343			break;
  1344		case 42:
  1345			tcr->ips = ARM_LPAE_TCR_PS_42_BIT;
  1346			break;
  1347		case 44:
  1348			tcr->ips = ARM_LPAE_TCR_PS_44_BIT;
  1349			break;
  1350		case 48:
  1351			tcr->ips = ARM_LPAE_TCR_PS_48_BIT;
  1352			break;
  1353		case 52:
  1354			tcr->ips = ARM_LPAE_TCR_PS_52_BIT;
  1355			break;
  1356		default:
  1357			goto out_free_data;
  1358		}
  1359	
  1360		tcr->tsz = 64ULL - cfg->ias;
  1361	
  1362		/* MAIRs */
  1363		reg = (ARM_LPAE_MAIR_ATTR_NC
  1364		       << ARM_LPAE_MAIR_ATTR_SHIFT(ARM_LPAE_MAIR_ATTR_IDX_NC)) |
  1365		      (ARM_LPAE_MAIR_ATTR_WBRWA
  1366		       << ARM_LPAE_MAIR_ATTR_SHIFT(ARM_LPAE_MAIR_ATTR_IDX_CACHE)) |
  1367		      (ARM_LPAE_MAIR_ATTR_DEVICE
  1368		       << ARM_LPAE_MAIR_ATTR_SHIFT(ARM_LPAE_MAIR_ATTR_IDX_DEV)) |
  1369		      (ARM_LPAE_MAIR_ATTR_INC_OWBRWA
  1370		       << ARM_LPAE_MAIR_ATTR_SHIFT(ARM_LPAE_MAIR_ATTR_IDX_INC_OCACHE));
  1371	
  1372		cfg->arm_lpae_s1_cfg.mair = reg;
  1373	
  1374		/* Looking good; allocate a pgd */
  1375		data->pgd = __arm_lpae_alloc_pages(ARM_LPAE_PGD_SIZE(data),
  1376						   GFP_KERNEL, cfg, cookie);
  1377		if (!data->pgd)
  1378			goto out_free_data;
  1379	
  1380		/* Ensure the empty pgd is visible before any actual TTBR write */
  1381		wmb();
  1382	
  1383		/* TTBR */
  1384		cfg->arm_lpae_s1_cfg.ttbr = virt_to_phys(data->pgd);
  1385		return &data->iop;
  1386	
  1387	out_free_data:
  1388		kfree(data);
  1389		return NULL;
  1390	}
  1391	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
