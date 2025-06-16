Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EE3118E025
	for <oe-kbuild-all@lists.linux.dev>; Mon, 16 Jun 2025 09:56:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750067805; cv=none; b=lwkx3zxOOWkvsgomEUL9OvRWrHE0QNI2gby0BClWSbfZ7HrKTmF8muEWBuJDuQsNe7a0RDJppiFraj4Gq5KQ2zfG/axSC/vBYvCBRGQV56SS4kRoCXxt5/3vTPp1fDWhgK7jGo0MEbYJvIGDrnb8spFlLEeNogKoVAYx6SOMh5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750067805; c=relaxed/simple;
	bh=U6ajjaZXON11LwzxFEUqWiyVrXdVOwB7tyl9++z3Hk8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Gqc4ngXGqakZwHQg5BiqilmvucADU5b9cx6oYbbm4PxcTPDIdyS1vLaMeUYWe1n/8faEvA372Y1QceWMrVyfn09/0dfkGV1sQsgMQxyJED4O5/PVzC/8CEVjWEqmCudrRGi54+jFqsE3nhouh4geodErqcSJPxuvUEdpqgtzs7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=f4Stkjfz; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="f4Stkjfz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750067803; x=1781603803;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=U6ajjaZXON11LwzxFEUqWiyVrXdVOwB7tyl9++z3Hk8=;
  b=f4StkjfzJo7IMa9WQKCIH1m/7eqTmhaic5vchk7GcYAj7siU6mx6G1gq
   efvpSMZxlc9ZYtLlh9MKuYTUJ99sAs9vq8cIWTpIryGJH/OjKPX3PIrTf
   aaXyYHXVV6p+AeZkCtBYpHC6ZhVa+PaTHoPNNhwtaDAr2rG2bcfCX8sen
   t9YD5NrssFWP8hsF0y1b6930McaOJuEBw97NMEbhSgKLabj0Ug64vwz/6
   hvPT3vWG1FNMOkZoZ1OyYFY564ygDZXBM2Tw0T7bcQ0Z8BQjDxsi9BFGS
   5oMmre8llYGHM4Cdh+W56HJiV9Cug9I8srB2GpCe+tv/1HlkgybE8fPiT
   Q==;
X-CSE-ConnectionGUID: uXjGzGZGR0md85Un/zWatg==
X-CSE-MsgGUID: CKiR1kzoQk29N/AaOYkW4g==
X-IronPort-AV: E=McAfee;i="6800,10657,11465"; a="63238234"
X-IronPort-AV: E=Sophos;i="6.16,240,1744095600"; 
   d="scan'208";a="63238234"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2025 02:56:41 -0700
X-CSE-ConnectionGUID: 8fw8mzlbSoOIUb5XTENGZQ==
X-CSE-MsgGUID: uisi8t7URGOu+skJhuqtGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,240,1744095600"; 
   d="scan'208";a="153720584"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 16 Jun 2025 02:56:41 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uR6Zy-000Eua-0W;
	Mon, 16 Jun 2025 09:56:38 +0000
Date: Mon, 16 Jun 2025 17:56:16 +0800
From: kernel test robot <lkp@intel.com>
To: Leon Romanovsky <leonro@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [leon-rdma:dma-direct-pfn-type 3/5] kernel/dma/debug.c:1225:31:
 error: 'dma_debug_singe' undeclared; did you mean 'dma_debug_single'?
Message-ID: <202506161732.duJ1TTIX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/leon/linux-rdma.git dma-direct-pfn-type
head:   87481a3ed31857c530009e3a934f3b0a5e069f9e
commit: e025aeacbe5a78c3a7373d2448df80d78a963f94 [3/5] dma-mapping: Extend mapping physical callback for MMIO address space
config: arc-randconfig-002-20250616 (https://download.01.org/0day-ci/archive/20250616/202506161732.duJ1TTIX-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250616/202506161732.duJ1TTIX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506161732.duJ1TTIX-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/dma/debug.c: In function 'debug_dma_map_phys':
>> kernel/dma/debug.c:1225:31: error: 'dma_debug_singe' undeclared (first use in this function); did you mean 'dma_debug_single'?
    1225 |                 entry->type = dma_debug_singe;
         |                               ^~~~~~~~~~~~~~~
         |                               dma_debug_single
   kernel/dma/debug.c:1225:31: note: each undeclared identifier is reported only once for each function it appears in
   kernel/dma/debug.c: In function 'debug_dma_unmap_phys':
>> kernel/dma/debug.c:1299:20: error: invalid type argument of '->' (have 'struct dma_debug_entry')
    1299 |                 ref->type = dma_debug_resource;
         |                    ^~
   kernel/dma/debug.c:1301:20: error: invalid type argument of '->' (have 'struct dma_debug_entry')
    1301 |                 ref->type = dma_debug_single;
         |                    ^~


vim +1225 kernel/dma/debug.c

  1203	
  1204	void debug_dma_map_phys(struct device *dev, phys_addr_t phys, size_t size,
  1205				int direction, dma_addr_t dma_addr,
  1206				enum dma_mapping_type type, unsigned long attrs)
  1207	{
  1208		struct dma_debug_entry *entry;
  1209	
  1210		if (unlikely(dma_debug_disabled()))
  1211			return;
  1212	
  1213		if (dma_mapping_error(dev, dma_addr))
  1214			return;
  1215	
  1216		entry = dma_entry_alloc();
  1217		if (!entry)
  1218			return;
  1219	
  1220		entry->dev       = dev;
  1221		if (type == DMA_MAPPING_MMIO)
  1222			entry->type = dma_debug_resource;
  1223		else
  1224			/* DMA_MAPPING_CPU_HOST */
> 1225			entry->type = dma_debug_singe;
  1226		entry->paddr	 = phys;
  1227		entry->dev_addr  = dma_addr;
  1228		entry->size      = size;
  1229		entry->direction = direction;
  1230		entry->map_err_type = MAP_ERR_NOT_CHECKED;
  1231	
  1232		if (pfn_valid(PFN_DOWN(phys))) {
  1233			struct page *page = phys_to_page(phys);
  1234	
  1235			check_for_stack(dev, page, offset_in_page(phys));
  1236	
  1237			if (!PageHighMem(page)) {
  1238				void *addr = page_address(page) + offset_in_page(phys);
  1239	
  1240				check_for_illegal_area(dev, addr, size);
  1241			}
  1242		}
  1243	
  1244		add_dma_entry(entry, attrs);
  1245	}
  1246	
  1247	void debug_dma_mapping_error(struct device *dev, dma_addr_t dma_addr)
  1248	{
  1249		struct dma_debug_entry ref;
  1250		struct dma_debug_entry *entry;
  1251		struct hash_bucket *bucket;
  1252		unsigned long flags;
  1253	
  1254		if (unlikely(dma_debug_disabled()))
  1255			return;
  1256	
  1257		ref.dev = dev;
  1258		ref.dev_addr = dma_addr;
  1259		bucket = get_hash_bucket(&ref, &flags);
  1260	
  1261		list_for_each_entry(entry, &bucket->list, list) {
  1262			if (!exact_match(&ref, entry))
  1263				continue;
  1264	
  1265			/*
  1266			 * The same physical address can be mapped multiple
  1267			 * times. Without a hardware IOMMU this results in the
  1268			 * same device addresses being put into the dma-debug
  1269			 * hash multiple times too. This can result in false
  1270			 * positives being reported. Therefore we implement a
  1271			 * best-fit algorithm here which updates the first entry
  1272			 * from the hash which fits the reference value and is
  1273			 * not currently listed as being checked.
  1274			 */
  1275			if (entry->map_err_type == MAP_ERR_NOT_CHECKED) {
  1276				entry->map_err_type = MAP_ERR_CHECKED;
  1277				break;
  1278			}
  1279		}
  1280	
  1281		put_hash_bucket(bucket, flags);
  1282	}
  1283	EXPORT_SYMBOL(debug_dma_mapping_error);
  1284	
  1285	void debug_dma_unmap_phys(struct device *dev, dma_addr_t dma_addr, size_t size,
  1286				  int direction, enum dma_mapping_type type)
  1287	{
  1288		struct dma_debug_entry ref = {
  1289			.dev            = dev,
  1290			.dev_addr       = dma_addr,
  1291			.size           = size,
  1292			.direction      = direction,
  1293		};
  1294	
  1295		if (unlikely(dma_debug_disabled()))
  1296			return;
  1297	
  1298		if (type == DMA_MAPPING_MMIO)
> 1299			ref->type = dma_debug_resource;
  1300		else
  1301			ref->type = dma_debug_single;
  1302	
  1303		check_unmap(&ref);
  1304	}
  1305	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
