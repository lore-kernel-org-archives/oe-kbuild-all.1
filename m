Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88F754409
	for <oe-kbuild-all@lists.linux.dev>; Mon,  1 Sep 2025 20:05:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756757137; cv=none; b=MDcZwxvaj0GHNQ+hADPLqjl55hTmpHX8QlRqffoos9fiGee9R42RUwctX1qiomhzhqoYJyvZfKdge+gQagGedkVXMyBbJoIsWRM6tmIjhOvXhJZKCisELM5qbQKATayL0N/sexvk81iHYixXAmcTRUQwkyXj8AFqiKXJ2HlwX+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756757137; c=relaxed/simple;
	bh=ugBG5cQoXmcogFZt3+ALzGNU0lt+VlYMnPl02lCO0h4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OfLRWYJi+0hao3uedarhFYcfwE4LDeKUwxOfX3wmEihC4yWZ8atPaDfzKUkWQ0TiNh4ufZOJLod1vqFVjIYf9aM/o68hASlRDnfr10SUrCXOKSk5HZ547L4SlotKQ6ZD71KojoRxJFUounG40Sd4FXJpNe/2Ix+1iTVUUkoUVqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KW0LA9uf; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KW0LA9uf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756757135; x=1788293135;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ugBG5cQoXmcogFZt3+ALzGNU0lt+VlYMnPl02lCO0h4=;
  b=KW0LA9ufX0D+yFIWbyDWCGpaK7KqICmbmJ2gTI/tuf6m770bCYKvnCOs
   +dwKQSbQ+KhV7tPyZWpE3+1WW0fdIDhDXqdv133xuI2B6UyEEZPlxWGfn
   lazz3ie1w3IVzZOAPABoUwXRG0JsPQHgRUB80u3MTMBX7Dr0OW63f8yFT
   jLzupveDmk+xxRZifcfEs19vA7ZQiki/PKHxia4Gj0AvT3dxx3ysDqnW9
   +d7pI66XBQCsOOEKUCMxpylnW1NYqv0KNj8gdi8+fNlQNwsFAfaopAtcU
   LV8bQ0K/Rtck9jhR2Z8LRAm/rdrj1X28o5j+FASsty6hAf7ePNqZubmm6
   Q==;
X-CSE-ConnectionGUID: ZIPhZeG8Rum+veTsVRHGEA==
X-CSE-MsgGUID: QOQY/lYrTbCWFFx+HcIuZg==
X-IronPort-AV: E=McAfee;i="6800,10657,11540"; a="59088694"
X-IronPort-AV: E=Sophos;i="6.18,230,1751266800"; 
   d="scan'208";a="59088694"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2025 13:05:35 -0700
X-CSE-ConnectionGUID: tq9ELqSxSWu0nYeZczjaNA==
X-CSE-MsgGUID: POr1p5caSuSdEMmQRrKwvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,230,1751266800"; 
   d="scan'208";a="170653860"
Received: from lkp-server02.sh.intel.com (HELO 06ba48ef64e9) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 01 Sep 2025 13:05:34 -0700
Received: from kbuild by 06ba48ef64e9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1utAmA-00010F-1B;
	Mon, 01 Sep 2025 20:05:19 +0000
Date: Tue, 2 Sep 2025 04:05:06 +0800
From: kernel test robot <lkp@intel.com>
To: Leon Romanovsky <leonro@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev, Jason Gunthorpe <jgg@nvidia.com>
Subject: [leon-rdma:dmabuf-vfio 3/27] kernel/dma/debug.c:1232:24: warning:
 unused variable 'offset'
Message-ID: <202509020359.c8THVyka-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/leon/linux-rdma.git dmabuf-vfio
head:   4318dbe63bda33b36f0359de75ad0a30bb01138b
commit: 426e2878d936d4f23b1e7132beca699528ea99a5 [3/27] dma-debug: refactor to use physical addresses for page mapping
config: riscv-randconfig-001-20250902 (https://download.01.org/0day-ci/archive/20250902/202509020359.c8THVyka-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 13.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250902/202509020359.c8THVyka-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509020359.c8THVyka-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/dma/debug.c: In function 'check_for_stack':
   kernel/dma/debug.c:1063:21: error: implicit declaration of function 'PhysHighMem'; did you mean 'PageHighMem'? [-Werror=implicit-function-declaration]
    1063 |                 if (PhysHighMem(phys))
         |                     ^~~~~~~~~~~
         |                     PageHighMem
   kernel/dma/debug.c: In function 'debug_dma_map_phys':
>> kernel/dma/debug.c:1232:24: warning: unused variable 'offset' [-Wunused-variable]
    1232 |                 size_t offset = offset_in_page(page);
         |                        ^~~~~~
   kernel/dma/debug.c: In function 'debug_dma_map_sg':
>> kernel/dma/debug.c:1309:38: warning: passing argument 2 of 'check_for_stack' makes integer from pointer without a cast [-Wint-conversion]
    1309 |                 check_for_stack(dev, sg_page(s), s->offset);
         |                                      ^~~~~~~~~~
         |                                      |
         |                                      struct page *
   kernel/dma/debug.c:1056:61: note: expected 'phys_addr_t' {aka 'unsigned int'} but argument is of type 'struct page *'
    1056 | static void check_for_stack(struct device *dev, phys_addr_t phys)
         |                                                 ~~~~~~~~~~~~^~~~
   kernel/dma/debug.c:1309:17: error: too many arguments to function 'check_for_stack'
    1309 |                 check_for_stack(dev, sg_page(s), s->offset);
         |                 ^~~~~~~~~~~~~~~
   kernel/dma/debug.c:1056:13: note: declared here
    1056 | static void check_for_stack(struct device *dev, phys_addr_t phys)
         |             ^~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/offset +1232 kernel/dma/debug.c

  1206	
  1207	void debug_dma_map_phys(struct device *dev, phys_addr_t phys, size_t size,
  1208			int direction, dma_addr_t dma_addr, unsigned long attrs)
  1209	{
  1210		struct dma_debug_entry *entry;
  1211	
  1212		if (unlikely(dma_debug_disabled()))
  1213			return;
  1214	
  1215		if (dma_mapping_error(dev, dma_addr))
  1216			return;
  1217	
  1218		entry = dma_entry_alloc();
  1219		if (!entry)
  1220			return;
  1221	
  1222		entry->dev       = dev;
  1223		entry->type      = dma_debug_phy;
  1224		entry->paddr	 = phys;
  1225		entry->dev_addr  = dma_addr;
  1226		entry->size      = size;
  1227		entry->direction = direction;
  1228		entry->map_err_type = MAP_ERR_NOT_CHECKED;
  1229	
  1230		if (!(attrs & DMA_ATTR_MMIO)) {
  1231			struct page *page = phys_to_page(phys);
> 1232			size_t offset = offset_in_page(page);
  1233	
  1234			check_for_stack(dev, phys);
  1235	
  1236			if (!PhysHighMem(phys))
  1237				check_for_illegal_area(dev, phys_to_virt(phys), size);
  1238		}
  1239	
  1240		add_dma_entry(entry, attrs);
  1241	}
  1242	
  1243	void debug_dma_mapping_error(struct device *dev, dma_addr_t dma_addr)
  1244	{
  1245		struct dma_debug_entry ref;
  1246		struct dma_debug_entry *entry;
  1247		struct hash_bucket *bucket;
  1248		unsigned long flags;
  1249	
  1250		if (unlikely(dma_debug_disabled()))
  1251			return;
  1252	
  1253		ref.dev = dev;
  1254		ref.dev_addr = dma_addr;
  1255		bucket = get_hash_bucket(&ref, &flags);
  1256	
  1257		list_for_each_entry(entry, &bucket->list, list) {
  1258			if (!exact_match(&ref, entry))
  1259				continue;
  1260	
  1261			/*
  1262			 * The same physical address can be mapped multiple
  1263			 * times. Without a hardware IOMMU this results in the
  1264			 * same device addresses being put into the dma-debug
  1265			 * hash multiple times too. This can result in false
  1266			 * positives being reported. Therefore we implement a
  1267			 * best-fit algorithm here which updates the first entry
  1268			 * from the hash which fits the reference value and is
  1269			 * not currently listed as being checked.
  1270			 */
  1271			if (entry->map_err_type == MAP_ERR_NOT_CHECKED) {
  1272				entry->map_err_type = MAP_ERR_CHECKED;
  1273				break;
  1274			}
  1275		}
  1276	
  1277		put_hash_bucket(bucket, flags);
  1278	}
  1279	EXPORT_SYMBOL(debug_dma_mapping_error);
  1280	
  1281	void debug_dma_unmap_phys(struct device *dev, dma_addr_t dma_addr,
  1282				  size_t size, int direction)
  1283	{
  1284		struct dma_debug_entry ref = {
  1285			.type           = dma_debug_phy,
  1286			.dev            = dev,
  1287			.dev_addr       = dma_addr,
  1288			.size           = size,
  1289			.direction      = direction,
  1290		};
  1291	
  1292		if (unlikely(dma_debug_disabled()))
  1293			return;
  1294		check_unmap(&ref);
  1295	}
  1296	
  1297	void debug_dma_map_sg(struct device *dev, struct scatterlist *sg,
  1298			      int nents, int mapped_ents, int direction,
  1299			      unsigned long attrs)
  1300	{
  1301		struct dma_debug_entry *entry;
  1302		struct scatterlist *s;
  1303		int i;
  1304	
  1305		if (unlikely(dma_debug_disabled()))
  1306			return;
  1307	
  1308		for_each_sg(sg, s, nents, i) {
> 1309			check_for_stack(dev, sg_page(s), s->offset);
  1310			if (!PageHighMem(sg_page(s)))
  1311				check_for_illegal_area(dev, sg_virt(s), s->length);
  1312		}
  1313	
  1314		for_each_sg(sg, s, mapped_ents, i) {
  1315			entry = dma_entry_alloc();
  1316			if (!entry)
  1317				return;
  1318	
  1319			entry->type           = dma_debug_sg;
  1320			entry->dev            = dev;
  1321			entry->paddr	      = sg_phys(s);
  1322			entry->size           = sg_dma_len(s);
  1323			entry->dev_addr       = sg_dma_address(s);
  1324			entry->direction      = direction;
  1325			entry->sg_call_ents   = nents;
  1326			entry->sg_mapped_ents = mapped_ents;
  1327	
  1328			check_sg_segment(dev, s);
  1329	
  1330			add_dma_entry(entry, attrs);
  1331		}
  1332	}
  1333	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
