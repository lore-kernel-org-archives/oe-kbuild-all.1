Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D826F13D63B
	for <oe-kbuild-all@lists.linux.dev>; Fri, 19 Jul 2024 14:59:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721401165; cv=none; b=Rv++ljJ3ofm0N1CLnMH1EUNENSgKzPDAcF41KWp9ft1MhXGV4nZrCTj9yc3ChyxkwRtBukMsMzzr9gJOFjDq/KzZNSRqsCaxBqnhCG5wTZE7nUzW98cBrv3oGhCjrREfvbaaf8KzBsDyCxlYzQaZevKkZgcip/JrRwEqpQAgfDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721401165; c=relaxed/simple;
	bh=PJchw5zNXUOKm1zOMWPX6IT/wQAKUozK5NEu04q93PQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=E94Og52lWSfv000kVvLhSZaCpJjevWTRoZPs4SZ0g5UKXN50VsvwJrgKu0fsF0Be7DCTMYa0cjLIc1+A8iQON90Ax4rvvI98tBIPHwWJ+lkmP+ixZF1IFKGM1baKkJQCIvoKdQHn3iCjAZtiIu1PtOoM5sX1sXAEG5WC+FRjKUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nNyyX0PJ; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nNyyX0PJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721401164; x=1752937164;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PJchw5zNXUOKm1zOMWPX6IT/wQAKUozK5NEu04q93PQ=;
  b=nNyyX0PJ8vvimQoe0zqKWV9f3zRFJ8F1Utr4R7p1M1JgGtVFldoBmAt5
   2JgiV8iW3X0nDtOsHv5p9dGAEr4HjMSndNqrzvPFJycWw1B3Fcki28zdj
   s/UAFYhkSorUNFalGEZZyEiF7M2E/p4+PMj1ue0pNz11ahT1AT8EhW7J5
   z6snGKMqOwgCaIsyNfoVBeTAWpYEbBLCQC/2kuJ/3TW2ATSnY382JI5nZ
   Nle85hM9ctK1Lyu5Nk42Ra0aho5KKph2ooo0asga/HJaGhI7TBjbZtqMA
   dihPUTLClBEU3937p3SwejS/9lp1Ea2R5xcOLe30Xj/AmXp5hwEWSvDm/
   g==;
X-CSE-ConnectionGUID: dclGn3YBS7mBofHjJ6Su1Q==
X-CSE-MsgGUID: /57bUO43ROOnavg2rzd9MA==
X-IronPort-AV: E=McAfee;i="6700,10204,11138"; a="18720749"
X-IronPort-AV: E=Sophos;i="6.09,220,1716274800"; 
   d="scan'208";a="18720749"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jul 2024 07:59:23 -0700
X-CSE-ConnectionGUID: Z+srdpL6TJWXa9DSUVENig==
X-CSE-MsgGUID: 97+63ZKaQU+hzRS8Vptghg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,220,1716274800"; 
   d="scan'208";a="82185571"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 19 Jul 2024 07:59:22 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sUp4q-000iGE-1M;
	Fri, 19 Jul 2024 14:59:20 +0000
Date: Fri, 19 Jul 2024 22:58:48 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hch-misc:dma_set_errors 3/3]
 drivers/net/ethernet/microsoft/mana/gdma_main.c:1498:6: error: assigning to
 'int' from incompatible type 'void'
Message-ID: <202407192211.D8KzOkp3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.infradead.org/users/hch/misc.git dma_set_errors
head:   01d3041f46af9cd503cc2ec924ef6f116179cd62
commit: 01d3041f46af9cd503cc2ec924ef6f116179cd62 [3/3] dma-mapping: don't return errors from dma_set_max_seg_size
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20240719/202407192211.D8KzOkp3-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240719/202407192211.D8KzOkp3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407192211.D8KzOkp3-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/net/ethernet/microsoft/mana/gdma_main.c:1498:6: error: assigning to 'int' from incompatible type 'void'
    1498 |         err = dma_set_max_seg_size(&pdev->dev, UINT_MAX);
         |             ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/microsoft/mana/gdma_main.c:1494:46: warning: shift count >= width of type [-Wshift-count-overflow]
    1494 |         err = dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(64));
         |                                                     ^~~~~~~~~~~~~~~~
   include/linux/dma-mapping.h:77:54: note: expanded from macro 'DMA_BIT_MASK'
      77 | #define DMA_BIT_MASK(n) (((n) == 64) ? ~0ULL : ((1ULL<<(n))-1))
         |                                                      ^ ~~~
   1 warning and 1 error generated.


vim +1498 drivers/net/ethernet/microsoft/mana/gdma_main.c

1566e7d6206fed Dexuan Cui     2022-06-14  1473  
ca9c54d2d6a5ab Dexuan Cui     2021-04-16  1474  static int mana_gd_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
ca9c54d2d6a5ab Dexuan Cui     2021-04-16  1475  {
ca9c54d2d6a5ab Dexuan Cui     2021-04-16  1476  	struct gdma_context *gc;
ca9c54d2d6a5ab Dexuan Cui     2021-04-16  1477  	void __iomem *bar0_va;
ca9c54d2d6a5ab Dexuan Cui     2021-04-16  1478  	int bar = 0;
ca9c54d2d6a5ab Dexuan Cui     2021-04-16  1479  	int err;
ca9c54d2d6a5ab Dexuan Cui     2021-04-16  1480  
1e2d0824a9c3de Haiyang Zhang  2021-08-24  1481  	/* Each port has 2 CQs, each CQ has at most 1 EQE at a time */
1e2d0824a9c3de Haiyang Zhang  2021-08-24  1482  	BUILD_BUG_ON(2 * MAX_PORTS_IN_MANA_DEV * GDMA_EQE_SIZE > EQ_SIZE);
1e2d0824a9c3de Haiyang Zhang  2021-08-24  1483  
ca9c54d2d6a5ab Dexuan Cui     2021-04-16  1484  	err = pci_enable_device(pdev);
ca9c54d2d6a5ab Dexuan Cui     2021-04-16  1485  	if (err)
ca9c54d2d6a5ab Dexuan Cui     2021-04-16  1486  		return -ENXIO;
ca9c54d2d6a5ab Dexuan Cui     2021-04-16  1487  
ca9c54d2d6a5ab Dexuan Cui     2021-04-16  1488  	pci_set_master(pdev);
ca9c54d2d6a5ab Dexuan Cui     2021-04-16  1489  
ca9c54d2d6a5ab Dexuan Cui     2021-04-16  1490  	err = pci_request_regions(pdev, "mana");
ca9c54d2d6a5ab Dexuan Cui     2021-04-16  1491  	if (err)
ca9c54d2d6a5ab Dexuan Cui     2021-04-16  1492  		goto disable_dev;
ca9c54d2d6a5ab Dexuan Cui     2021-04-16  1493  
ca9c54d2d6a5ab Dexuan Cui     2021-04-16  1494  	err = dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(64));
ca9c54d2d6a5ab Dexuan Cui     2021-04-16  1495  	if (err)
ca9c54d2d6a5ab Dexuan Cui     2021-04-16  1496  		goto release_region;
ca9c54d2d6a5ab Dexuan Cui     2021-04-16  1497  
6fe254160bd033 Ajay Sharma    2022-11-03 @1498  	err = dma_set_max_seg_size(&pdev->dev, UINT_MAX);
6fe254160bd033 Ajay Sharma    2022-11-03  1499  	if (err) {
6fe254160bd033 Ajay Sharma    2022-11-03  1500  		dev_err(&pdev->dev, "Failed to set dma device segment size\n");
6fe254160bd033 Ajay Sharma    2022-11-03  1501  		goto release_region;
6fe254160bd033 Ajay Sharma    2022-11-03  1502  	}
6fe254160bd033 Ajay Sharma    2022-11-03  1503  
ca9c54d2d6a5ab Dexuan Cui     2021-04-16  1504  	err = -ENOMEM;
ca9c54d2d6a5ab Dexuan Cui     2021-04-16  1505  	gc = vzalloc(sizeof(*gc));
ca9c54d2d6a5ab Dexuan Cui     2021-04-16  1506  	if (!gc)
ca9c54d2d6a5ab Dexuan Cui     2021-04-16  1507  		goto release_region;
ca9c54d2d6a5ab Dexuan Cui     2021-04-16  1508  
635096a86edb06 Dexuan Cui     2021-10-29  1509  	mutex_init(&gc->eq_test_event_mutex);
635096a86edb06 Dexuan Cui     2021-10-29  1510  	pci_set_drvdata(pdev, gc);
f3dc0962460910 Long Li        2022-11-03  1511  	gc->bar0_pa = pci_resource_start(pdev, 0);
635096a86edb06 Dexuan Cui     2021-10-29  1512  
ca9c54d2d6a5ab Dexuan Cui     2021-04-16  1513  	bar0_va = pci_iomap(pdev, bar, 0);
ca9c54d2d6a5ab Dexuan Cui     2021-04-16  1514  	if (!bar0_va)
ca9c54d2d6a5ab Dexuan Cui     2021-04-16  1515  		goto free_gc;
ca9c54d2d6a5ab Dexuan Cui     2021-04-16  1516  
71fa6887eeca7b Saurabh Sengar 2022-10-31  1517  	gc->numa_node = dev_to_node(&pdev->dev);
1566e7d6206fed Dexuan Cui     2022-06-14  1518  	gc->is_pf = mana_is_pf(pdev->device);
ca9c54d2d6a5ab Dexuan Cui     2021-04-16  1519  	gc->bar0_va = bar0_va;
ca9c54d2d6a5ab Dexuan Cui     2021-04-16  1520  	gc->dev = &pdev->dev;
ca9c54d2d6a5ab Dexuan Cui     2021-04-16  1521  
635096a86edb06 Dexuan Cui     2021-10-29  1522  	err = mana_gd_setup(pdev);
ca9c54d2d6a5ab Dexuan Cui     2021-04-16  1523  	if (err)
ca9c54d2d6a5ab Dexuan Cui     2021-04-16  1524  		goto unmap_bar;
ca9c54d2d6a5ab Dexuan Cui     2021-04-16  1525  
635096a86edb06 Dexuan Cui     2021-10-29  1526  	err = mana_probe(&gc->mana, false);
ca9c54d2d6a5ab Dexuan Cui     2021-04-16  1527  	if (err)
635096a86edb06 Dexuan Cui     2021-10-29  1528  		goto cleanup_gd;
ca9c54d2d6a5ab Dexuan Cui     2021-04-16  1529  
ca9c54d2d6a5ab Dexuan Cui     2021-04-16  1530  	return 0;
ca9c54d2d6a5ab Dexuan Cui     2021-04-16  1531  
635096a86edb06 Dexuan Cui     2021-10-29  1532  cleanup_gd:
635096a86edb06 Dexuan Cui     2021-10-29  1533  	mana_gd_cleanup(pdev);
ca9c54d2d6a5ab Dexuan Cui     2021-04-16  1534  unmap_bar:
ca9c54d2d6a5ab Dexuan Cui     2021-04-16  1535  	pci_iounmap(pdev, bar0_va);
ca9c54d2d6a5ab Dexuan Cui     2021-04-16  1536  free_gc:
635096a86edb06 Dexuan Cui     2021-10-29  1537  	pci_set_drvdata(pdev, NULL);
ca9c54d2d6a5ab Dexuan Cui     2021-04-16  1538  	vfree(gc);
ca9c54d2d6a5ab Dexuan Cui     2021-04-16  1539  release_region:
ca9c54d2d6a5ab Dexuan Cui     2021-04-16  1540  	pci_release_regions(pdev);
ca9c54d2d6a5ab Dexuan Cui     2021-04-16  1541  disable_dev:
ca9c54d2d6a5ab Dexuan Cui     2021-04-16  1542  	pci_disable_device(pdev);
ca9c54d2d6a5ab Dexuan Cui     2021-04-16  1543  	dev_err(&pdev->dev, "gdma probe failed: err = %d\n", err);
ca9c54d2d6a5ab Dexuan Cui     2021-04-16  1544  	return err;
ca9c54d2d6a5ab Dexuan Cui     2021-04-16  1545  }
ca9c54d2d6a5ab Dexuan Cui     2021-04-16  1546  

:::::: The code at line 1498 was first introduced by commit
:::::: 6fe254160bd033a1e62dbad9b734183b31144678 net: mana: Set the DMA device max segment size

:::::: TO: Ajay Sharma <sharmaajay@microsoft.com>
:::::: CC: Leon Romanovsky <leonro@nvidia.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
