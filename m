Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5E787468
	for <oe-kbuild-all@lists.linux.dev>; Mon, 27 Mar 2023 18:43:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679942604; x=1711478604;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=FaY6H/wAK3p877/RSmKTR3DYKMpRFNrR248k2ZHUwhM=;
  b=gEiBL5QyO+JSzeXryoONLAZBE1RUbiFky7F2oqQYG4EGwlcuY4ow+6zY
   3PGHhuQWwImRJ0+HOuAuXpMI2ss2HKINKC1UgEMIr0mh0dsfk/daMBQzt
   4UVk3eL3bUFCHN3u9R+R+NKmRUMOl8f3rVgmiSUHFmxiIUiCj4OQ6K/75
   NTKCfgfxtr/6GOuKzdtXRokvQzsntMEpqm1/0qxYAECR/gh2ykNJpNGzz
   Aa98CBBatqKlnHAACSdW4NNR4MQYo22BdnPFQMhXzqb2BaMMGDmXvLqg6
   TPfM3TpCIMmrOocBj/IlErb0PvEyqFy7o2LyoFj19VE9y8bls0RmSJrpG
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10662"; a="426620319"
X-IronPort-AV: E=Sophos;i="5.98,295,1673942400"; 
   d="scan'208";a="426620319"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2023 11:43:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10662"; a="794464009"
X-IronPort-AV: E=Sophos;i="5.98,295,1673942400"; 
   d="scan'208";a="794464009"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 27 Mar 2023 11:43:23 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pgroQ-000Hvi-2Q;
	Mon, 27 Mar 2023 18:43:22 +0000
Date: Tue, 28 Mar 2023 02:42:37 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 20/21] ARM: dma-mapping: split out arch_dma_mark_clean()
 helper
Message-ID: <202303280208.wYfwjY3I-lkp@intel.com>
References: <20230327121317.4081816-21-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230327121317.4081816-21-arnd@kernel.org>

Hi Arnd,

I love your patch! Yet something to improve:

[auto build test ERROR on soc/for-next]
[also build test ERROR on jcmvbkbc-xtensa/xtensa-for-next powerpc/next powerpc/fixes linus/master v6.3-rc4 next-20230323]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Arnd-Bergmann/openrisc-dma-mapping-flush-bidirectional-mappings/20230327-202133
base:   https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git for-next
patch link:    https://lore.kernel.org/r/20230327121317.4081816-21-arnd%40kernel.org
patch subject: [PATCH 20/21] ARM: dma-mapping: split out arch_dma_mark_clean() helper
config: arm-randconfig-r046-20230327 (https://download.01.org/0day-ci/archive/20230328/202303280208.wYfwjY3I-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/6455ebecc75d3dcbfcaf31db6e97534d0c564ca3
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Arnd-Bergmann/openrisc-dma-mapping-flush-bidirectional-mappings/20230327-202133
        git checkout 6455ebecc75d3dcbfcaf31db6e97534d0c564ca3
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash arch/arm/mm/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303280208.wYfwjY3I-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   arch/arm/mm/dma-mapping.c: In function 'arm_iommu_sync_dma_for_cpu':
>> arch/arm/mm/dma-mapping.c:1306:45: error: 's' undeclared (first use in this function); did you mean 's8'?
    1306 |                 arch_sync_dma_for_cpu(phys, s->length, dir);
         |                                             ^
         |                                             s8
   arch/arm/mm/dma-mapping.c:1306:45: note: each undeclared identifier is reported only once for each function it appears in
   arch/arm/mm/dma-mapping.c: In function 'arm_iommu_unmap_page':
>> arch/arm/mm/dma-mapping.c:1441:9: warning: this 'if' clause does not guard... [-Wmisleading-indentation]
    1441 |         if (!(attrs & DMA_ATTR_SKIP_CPU_SYNC))
         |         ^~
   arch/arm/mm/dma-mapping.c:1443:17: note: ...this statement, but the latter is misleadingly indented as if it were guarded by the 'if'
    1443 |                 arm_iommu_sync_dma_for_cpu(phys, size, dir, dev->dma_coherent);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm/mm/dma-mapping.c:1436:13: warning: unused variable 'len' [-Wunused-variable]
    1436 |         int len = PAGE_ALIGN(size + offset);
         |             ^~~
   arch/arm/mm/dma-mapping.c: At top level:
>> arch/arm/mm/dma-mapping.c:1446:28: error: expected ')' before '->' token
    1446 |         iommu_unmap(mapping->domain, iova, len);
         |                            ^~
         |                            )
>> arch/arm/mm/dma-mapping.c:1447:9: warning: data definition has no type or storage class
    1447 |         __free_iova(mapping, iova, len);
         |         ^~~~~~~~~~~
>> arch/arm/mm/dma-mapping.c:1447:9: error: type defaults to 'int' in declaration of '__free_iova' [-Werror=implicit-int]
>> arch/arm/mm/dma-mapping.c:1447:9: warning: parameter names (without types) in function declaration
>> arch/arm/mm/dma-mapping.c:1447:9: error: conflicting types for '__free_iova'; have 'int()'
   arch/arm/mm/dma-mapping.c:825:20: note: previous definition of '__free_iova' with type 'void(struct dma_iommu_mapping *, dma_addr_t,  size_t)' {aka 'void(struct dma_iommu_mapping *, unsigned int,  unsigned int)'}
     825 | static inline void __free_iova(struct dma_iommu_mapping *mapping,
         |                    ^~~~~~~~~~~
>> arch/arm/mm/dma-mapping.c:1448:1: error: expected identifier or '(' before '}' token
    1448 | }
         | ^
   cc1: some warnings being treated as errors


vim +1306 arch/arm/mm/dma-mapping.c

  1300	
  1301	static void arm_iommu_sync_dma_for_cpu(phys_addr_t phys, size_t len,
  1302					       enum dma_data_direction dir,
  1303					       bool dma_coherent)
  1304	{
  1305		if (!dma_coherent)
> 1306			arch_sync_dma_for_cpu(phys, s->length, dir);
  1307	
  1308		if (dir == DMA_FROM_DEVICE)
  1309			arch_dma_mark_clean(phys, s->length);
  1310	}
  1311	
  1312	/**
  1313	 * arm_iommu_unmap_sg - unmap a set of SG buffers mapped by dma_map_sg
  1314	 * @dev: valid struct device pointer
  1315	 * @sg: list of buffers
  1316	 * @nents: number of buffers to unmap (same as was passed to dma_map_sg)
  1317	 * @dir: DMA transfer direction (same as was passed to dma_map_sg)
  1318	 *
  1319	 * Unmap a set of streaming mode DMA translations.  Again, CPU access
  1320	 * rules concerning calls here are the same as for dma_unmap_single().
  1321	 */
  1322	static void arm_iommu_unmap_sg(struct device *dev,
  1323				       struct scatterlist *sg, int nents,
  1324				       enum dma_data_direction dir,
  1325				       unsigned long attrs)
  1326	{
  1327		struct scatterlist *s;
  1328		int i;
  1329	
  1330		for_each_sg(sg, s, nents, i) {
  1331			if (sg_dma_len(s))
  1332				__iommu_remove_mapping(dev, sg_dma_address(s),
  1333						       sg_dma_len(s));
  1334			if (!(attrs & DMA_ATTR_SKIP_CPU_SYNC))
  1335				arm_iommu_sync_dma_for_cpu(sg_phys(s), s->length, dir,
  1336							   dev->dma_coherent);
  1337		}
  1338	}
  1339	
  1340	/**
  1341	 * arm_iommu_sync_sg_for_cpu
  1342	 * @dev: valid struct device pointer
  1343	 * @sg: list of buffers
  1344	 * @nents: number of buffers to map (returned from dma_map_sg)
  1345	 * @dir: DMA transfer direction (same as was passed to dma_map_sg)
  1346	 */
  1347	static void arm_iommu_sync_sg_for_cpu(struct device *dev,
  1348				struct scatterlist *sg,
  1349				int nents, enum dma_data_direction dir)
  1350	{
  1351		struct scatterlist *s;
  1352		int i;
  1353	
  1354		for_each_sg(sg, s, nents, i)
  1355			arm_iommu_sync_dma_for_cpu(sg_phys(s), s->length, dir,
  1356						   dev->dma_coherent);
  1357	}
  1358	
  1359	/**
  1360	 * arm_iommu_sync_sg_for_device
  1361	 * @dev: valid struct device pointer
  1362	 * @sg: list of buffers
  1363	 * @nents: number of buffers to map (returned from dma_map_sg)
  1364	 * @dir: DMA transfer direction (same as was passed to dma_map_sg)
  1365	 */
  1366	static void arm_iommu_sync_sg_for_device(struct device *dev,
  1367				struct scatterlist *sg,
  1368				int nents, enum dma_data_direction dir)
  1369	{
  1370		struct scatterlist *s;
  1371		int i;
  1372	
  1373		if (dev->dma_coherent)
  1374			return;
  1375	
  1376		for_each_sg(sg, s, nents, i)
  1377			arch_sync_dma_for_device(page_to_phys(sg_page(s)) + s->offset,
  1378						 s->length, dir);
  1379	}
  1380	
  1381	/**
  1382	 * arm_iommu_map_page
  1383	 * @dev: valid struct device pointer
  1384	 * @page: page that buffer resides in
  1385	 * @offset: offset into page for start of buffer
  1386	 * @size: size of buffer to map
  1387	 * @dir: DMA transfer direction
  1388	 *
  1389	 * IOMMU aware version of arm_dma_map_page()
  1390	 */
  1391	static dma_addr_t arm_iommu_map_page(struct device *dev, struct page *page,
  1392		     unsigned long offset, size_t size, enum dma_data_direction dir,
  1393		     unsigned long attrs)
  1394	{
  1395		struct dma_iommu_mapping *mapping = to_dma_iommu_mapping(dev);
  1396		dma_addr_t dma_addr;
  1397		int ret, prot, len = PAGE_ALIGN(size + offset);
  1398	
  1399		if (!dev->dma_coherent && !(attrs & DMA_ATTR_SKIP_CPU_SYNC))
  1400			arch_sync_dma_for_device(page_to_phys(page) + offset,
  1401						 size, dir);
  1402	
  1403		dma_addr = __alloc_iova(mapping, len);
  1404		if (dma_addr == DMA_MAPPING_ERROR)
  1405			return dma_addr;
  1406	
  1407		prot = __dma_info_to_prot(dir, attrs);
  1408	
  1409		ret = iommu_map(mapping->domain, dma_addr, page_to_phys(page), len,
  1410				prot, GFP_KERNEL);
  1411		if (ret < 0)
  1412			goto fail;
  1413	
  1414		return dma_addr + offset;
  1415	fail:
  1416		__free_iova(mapping, dma_addr, len);
  1417		return DMA_MAPPING_ERROR;
  1418	}
  1419	
  1420	/**
  1421	 * arm_iommu_unmap_page
  1422	 * @dev: valid struct device pointer
  1423	 * @handle: DMA address of buffer
  1424	 * @size: size of buffer (same as passed to dma_map_page)
  1425	 * @dir: DMA transfer direction (same as passed to dma_map_page)
  1426	 *
  1427	 * IOMMU aware version of arm_dma_unmap_page()
  1428	 */
  1429	static void arm_iommu_unmap_page(struct device *dev, dma_addr_t handle,
  1430			size_t size, enum dma_data_direction dir, unsigned long attrs)
  1431	{
  1432		struct dma_iommu_mapping *mapping = to_dma_iommu_mapping(dev);
  1433		dma_addr_t iova = handle & PAGE_MASK;
  1434		phys_addr_t phys;
  1435		int offset = handle & ~PAGE_MASK;
  1436		int len = PAGE_ALIGN(size + offset);
  1437	
  1438		if (!iova)
  1439			return;
  1440	
> 1441		if (!(attrs & DMA_ATTR_SKIP_CPU_SYNC))
  1442			phys = iommu_iova_to_phys(mapping->domain, handle);
  1443			arm_iommu_sync_dma_for_cpu(phys, size, dir, dev->dma_coherent);
  1444		}
  1445	
> 1446		iommu_unmap(mapping->domain, iova, len);
> 1447		__free_iova(mapping, iova, len);
> 1448	}
  1449	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
