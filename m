Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7EEB14EC7D
	for <oe-kbuild-all@lists.linux.dev>; Fri,  7 Jun 2024 08:43:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717749816; cv=none; b=kPBCu6E0Eq8V64X+Vw3mUCkycRkk46QaBRLTorckc6m1ixd9UqqC5QawCVriAoXfcVQRGPT124l3PlZIfi7O1C+T/H30jjIQDXRm+4DBBk4Rj9vYFHgpDjoJBUb9tCqVREH9teuPXsA5Jkd5QRc+2QyNABDoiO13kIg4nRYBZeY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717749816; c=relaxed/simple;
	bh=hPqcfFgl2WknRCSZUESE2vhW7El77UTKmA7hrCCHvTM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=utBBtZEwvfmr4uwzyK6A7bnRoqHH98o2vDSxHPfTestcCUu1mGjxrym0z5Wud7x4za8GmUTbpc5nheAAP1PpcH/QzWeyIlNPU1WHHSw95BQUQttuWQag84pfhAUR06rCePvGOYYJr6cacj+iSo5Wpeca3ouCaDYz3P0kUutKr1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PIAEQuNS; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PIAEQuNS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717749814; x=1749285814;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=hPqcfFgl2WknRCSZUESE2vhW7El77UTKmA7hrCCHvTM=;
  b=PIAEQuNSR6aUZ+vfDuw+femLwENzQ2w0g2qQJxsbLPtxXRBliSv+nsHG
   7oKbW5FJyBQxLvqvRIbO5Ychu82vyFfcqLZ4yYIHfX7C2vPv1S86R+iyR
   C4zeYQmJlGHJ98Ez33AWpFn89lx4+nsX+gyEWctwOcO4D7eARW4tFG2ki
   TaMSI/mAAlKiRalstIaOPs9FCHo/ih9yNVnDDoQkr3/jcn6EQVT4RC8CU
   oQTaguAeyzT7NS39y4MMPoxTa58iDw4J89AtaQ17p+eMFiOxaUAfPZ3lk
   jFFwVm+520qa52VW8Fxj5G59oThbkyD76iYcLT8wMpiR96XiVa5fZbbxQ
   Q==;
X-CSE-ConnectionGUID: Fr/lRMdURFKlVyxnCySsFQ==
X-CSE-MsgGUID: EtzqivMCRtKLSk7wdt/yOA==
X-IronPort-AV: E=McAfee;i="6600,9927,11095"; a="39861159"
X-IronPort-AV: E=Sophos;i="6.08,220,1712646000"; 
   d="scan'208";a="39861159"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jun 2024 01:43:33 -0700
X-CSE-ConnectionGUID: pInDoQ2nT7SFmVrFQM+aQA==
X-CSE-MsgGUID: MGy7S5jURTOUAJhR0KMY+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,220,1712646000"; 
   d="scan'208";a="38927914"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 07 Jun 2024 01:43:32 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sFVC5-0004Hs-1x;
	Fri, 07 Jun 2024 08:43:29 +0000
Date: Fri, 7 Jun 2024 16:42:31 +0800
From: kernel test robot <lkp@intel.com>
To: mhkelley58@gmail.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC 1/1] swiotlb: Reduce calls to swiotlb_find_pool()
Message-ID: <202406071654.vpgXWObk-lkp@intel.com>
References: <20240607031421.182589-1-mhklinux@outlook.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240607031421.182589-1-mhklinux@outlook.com>

Hi,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on joro-iommu/next]
[also build test WARNING on linus/master v6.10-rc2 next-20240607]
[cannot apply to xen-tip/linux-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/mhkelley58-gmail-com/swiotlb-Reduce-calls-to-swiotlb_find_pool/20240607-114732
base:   https://git.kernel.org/pub/scm/linux/kernel/git/joro/iommu.git next
patch link:    https://lore.kernel.org/r/20240607031421.182589-1-mhklinux%40outlook.com
patch subject: [RFC 1/1] swiotlb: Reduce calls to swiotlb_find_pool()
config: riscv-allnoconfig (https://download.01.org/0day-ci/archive/20240607/202406071654.vpgXWObk-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240607/202406071654.vpgXWObk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406071654.vpgXWObk-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/dma/swiotlb.c:1509: warning: Function parameter or struct member 'pool' not described in 'swiotlb_del_transient'


vim +1509 kernel/dma/swiotlb.c

79636caad3618e Petr Tesarik   2023-08-01  1496  
79636caad3618e Petr Tesarik   2023-08-01  1497  /**
79636caad3618e Petr Tesarik   2023-08-01  1498   * swiotlb_del_transient() - delete a transient memory pool
79636caad3618e Petr Tesarik   2023-08-01  1499   * @dev:	Device which mapped the buffer.
79636caad3618e Petr Tesarik   2023-08-01  1500   * @tlb_addr:	Physical address within a bounce buffer.
79636caad3618e Petr Tesarik   2023-08-01  1501   *
79636caad3618e Petr Tesarik   2023-08-01  1502   * Check whether the address belongs to a transient SWIOTLB memory pool.
79636caad3618e Petr Tesarik   2023-08-01  1503   * If yes, then delete the pool.
79636caad3618e Petr Tesarik   2023-08-01  1504   *
79636caad3618e Petr Tesarik   2023-08-01  1505   * Return: %true if @tlb_addr belonged to a transient pool that was released.
79636caad3618e Petr Tesarik   2023-08-01  1506   */
e55c3fdc1c0850 Michael Kelley 2024-06-06  1507  static bool swiotlb_del_transient(struct device *dev, phys_addr_t tlb_addr,
e55c3fdc1c0850 Michael Kelley 2024-06-06  1508  				  struct io_tlb_pool *pool)
79636caad3618e Petr Tesarik   2023-08-01 @1509  {
79636caad3618e Petr Tesarik   2023-08-01  1510  	if (!pool->transient)
79636caad3618e Petr Tesarik   2023-08-01  1511  		return false;
79636caad3618e Petr Tesarik   2023-08-01  1512  
79636caad3618e Petr Tesarik   2023-08-01  1513  	dec_used(dev->dma_io_tlb_mem, pool->nslabs);
79636caad3618e Petr Tesarik   2023-08-01  1514  	swiotlb_del_pool(dev, pool);
02e765697038c5 ZhangPeng      2024-01-09  1515  	dec_transient_used(dev->dma_io_tlb_mem, pool->nslabs);
79636caad3618e Petr Tesarik   2023-08-01  1516  	return true;
79636caad3618e Petr Tesarik   2023-08-01  1517  }
79636caad3618e Petr Tesarik   2023-08-01  1518  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
