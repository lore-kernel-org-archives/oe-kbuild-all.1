Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F5282868A6
	for <oe-kbuild-all@lists.linux.dev>; Thu,  9 Oct 2025 22:29:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760048943; cv=none; b=CbIkD30tOWKrdI5Ii8Hht1sBuNZiZIAjcormhw3e522OueFlEeZ2JbuYiF8YhITuQsAKNa7va77A+RzRuQ1U5JwELKmVuAsgjRZctNKoYwMtiEd4wJIu8uXZFZVcOqycCUwhhWjcp4nBF2uWhZo4BVo39pEfCn3KtUsCANqbRTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760048943; c=relaxed/simple;
	bh=6PazcWV7DHEt1Rje//DrOXbEcE8gpSlT7u7gYREbaC4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=p16SavyUu3a3yH6cLrS/eJmbz5bztUqfm+WPD/EHauiL3QV07shd855G+NRrw9z/RL6HVF7csCjG4Uv59gzoGaaFxNyhCTvpEKxxZ0q3XY+IErSRnOMjtOhL5ZpjgqA2Cs8lzahZIrGEctFTH4bU4gs5ts4JuY3pp8j6Gb8xEqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BhHclRNO; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BhHclRNO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760048942; x=1791584942;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6PazcWV7DHEt1Rje//DrOXbEcE8gpSlT7u7gYREbaC4=;
  b=BhHclRNOplEzeCO4wDiZ6h/elkC1iirHcuY7uWs9aCGHvbLmiR3nGAYF
   10J3TYCjvfQ1lS1stW30k64AHWiKrjXy6DJvU9+2dSUDXbGw1UxkNjLSJ
   8DJuVGuZBW3NYWXfosQgggjyssVARvLPw6wkKm6JuVYKzYo7gHEC/u8NH
   sxGbNXJO1IyQY3NlqdpmRFD/NgcbcZG4VXxfZECkZ+aSlIhMVbZ/TgRua
   TUv0abIkGNOXfYrJHFyAyB5sBETqfZTegopZ2kFDjQ0k6G9F1fdM3XlG6
   K3ndXq2pYYN0YTcBaZhmaB0OUxy9kRmFIyigLH2bJaiXjIV2retIhDGcC
   g==;
X-CSE-ConnectionGUID: 49RyDVswRTyuXfEQOCiPRQ==
X-CSE-MsgGUID: 3JzcHbDPTYmJmtndfp1lrg==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="62189911"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="62189911"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2025 15:29:01 -0700
X-CSE-ConnectionGUID: 9PM1Q1IgTba+wS/X4QMYaw==
X-CSE-MsgGUID: JAwwas7vQceGzl1kIfBEyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,217,1754982000"; 
   d="scan'208";a="211471838"
Received: from lkp-server01.sh.intel.com (HELO 6a630e8620ab) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 09 Oct 2025 15:29:01 -0700
Received: from kbuild by 6a630e8620ab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v6z85-0001Z1-29;
	Thu, 09 Oct 2025 22:28:57 +0000
Date: Fri, 10 Oct 2025 06:28:31 +0800
From: kernel test robot <lkp@intel.com>
To: Leon Romanovsky <leonro@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev, Jason Gunthorpe <jgg@nvidia.com>
Subject: [leon-rdma:dmabuf-vfio 22/27] drivers/parisc/sba_iommu.c:1001:57:
 error: passing argument 5 of 'iommu_fill_pdir' from incompatible pointer
 type
Message-ID: <202510100651.MpYVH2RW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/leon/linux-rdma.git dmabuf-vfio
head:   f7fc6a9789d546e210a6a6098617785b1c5994a6
commit: 4cb9d7f23e55e193e9f355c82df1aa2b5320a781 [22/27] parisc: Convert DMA map_page to map_phys interface
config: parisc-defconfig (https://download.01.org/0day-ci/archive/20251010/202510100651.MpYVH2RW-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251010/202510100651.MpYVH2RW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510100651.MpYVH2RW-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/parisc/sba_iommu.c: In function 'sba_map_sg':
>> drivers/parisc/sba_iommu.c:1001:57: error: passing argument 5 of 'iommu_fill_pdir' from incompatible pointer type [-Wincompatible-pointer-types]
    1001 |         filled = iommu_fill_pdir(ioc, sglist, nents, 0, sba_io_pdir_entry);
         |                                                         ^~~~~~~~~~~~~~~~~
         |                                                         |
         |                                                         void (*)(__le64 *, space_t,  phys_addr_t,  long unsigned int) {aka void (*)(long long unsigned int *, long unsigned int,  unsigned int,  long unsigned int)}
   In file included from drivers/parisc/sba_iommu.c:930:
   drivers/parisc/iommu-helpers.h:17:24: note: expected 'void (*)(__le64 *, space_t,  long unsigned int,  long unsigned int)' {aka 'void (*)(long long unsigned int *, long unsigned int,  long unsigned int,  long unsigned int)'} but argument is of type 'void (*)(__le64 *, space_t,  phys_addr_t,  long unsigned int)' {aka 'void (*)(long long unsigned int *, long unsigned int,  unsigned int,  long unsigned int)'}
      17 |                 void (*iommu_io_pdir_entry)(__le64 *, space_t, unsigned long,
         |                 ~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      18 |                                             unsigned long))
         |                                             ~~~~~~~~~~~~~~
   drivers/parisc/sba_iommu.c:572:1: note: 'sba_io_pdir_entry' declared here
     572 | sba_io_pdir_entry(__le64 *pdir_ptr, space_t sid, phys_addr_t pba,
         | ^~~~~~~~~~~~~~~~~
--
   drivers/parisc/ccio-dma.c: In function 'ccio_map_sg':
>> drivers/parisc/ccio-dma.c:958:60: error: passing argument 5 of 'iommu_fill_pdir' from incompatible pointer type [-Wincompatible-pointer-types]
     958 |         filled = iommu_fill_pdir(ioc, sglist, nents, hint, ccio_io_pdir_entry);
         |                                                            ^~~~~~~~~~~~~~~~~~
         |                                                            |
         |                                                            void (*)(__le64 *, space_t,  phys_addr_t,  long unsigned int) {aka void (*)(long long unsigned int *, long unsigned int,  unsigned int,  long unsigned int)}
   In file included from drivers/parisc/ccio-dma.c:892:
   drivers/parisc/iommu-helpers.h:17:24: note: expected 'void (*)(__le64 *, space_t,  long unsigned int,  long unsigned int)' {aka 'void (*)(long long unsigned int *, long unsigned int,  long unsigned int,  long unsigned int)'} but argument is of type 'void (*)(__le64 *, space_t,  phys_addr_t,  long unsigned int)' {aka 'void (*)(long long unsigned int *, long unsigned int,  unsigned int,  long unsigned int)'}
      17 |                 void (*iommu_io_pdir_entry)(__le64 *, space_t, unsigned long,
         |                 ~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      18 |                                             unsigned long))
         |                                             ~~~~~~~~~~~~~~
   drivers/parisc/ccio-dma.c:546:1: note: 'ccio_io_pdir_entry' declared here
     546 | ccio_io_pdir_entry(__le64 *pdir_ptr, space_t sid, phys_addr_t pba,
         | ^~~~~~~~~~~~~~~~~~


vim +/iommu_fill_pdir +1001 drivers/parisc/sba_iommu.c

^1da177e4c3f41 Linus Torvalds 2005-04-16   982  
^1da177e4c3f41 Linus Torvalds 2005-04-16   983  	/*
^1da177e4c3f41 Linus Torvalds 2005-04-16   984  	** First coalesce the chunks and allocate I/O pdir space
^1da177e4c3f41 Linus Torvalds 2005-04-16   985  	**
^1da177e4c3f41 Linus Torvalds 2005-04-16   986  	** If this is one DMA stream, we can properly map using the
^1da177e4c3f41 Linus Torvalds 2005-04-16   987  	** correct virtual address associated with each DMA page.
^1da177e4c3f41 Linus Torvalds 2005-04-16   988  	** w/o this association, we wouldn't have coherent DMA!
^1da177e4c3f41 Linus Torvalds 2005-04-16   989  	** Access to the virtual address is what forces a two pass algorithm.
^1da177e4c3f41 Linus Torvalds 2005-04-16   990  	*/
226b8ab875e183 Helge Deller   2023-06-30   991  	iommu_coalesce_chunks(ioc, dev, sglist, nents, sba_alloc_range);
^1da177e4c3f41 Linus Torvalds 2005-04-16   992  
^1da177e4c3f41 Linus Torvalds 2005-04-16   993  	/*
^1da177e4c3f41 Linus Torvalds 2005-04-16   994  	** Program the I/O Pdir
^1da177e4c3f41 Linus Torvalds 2005-04-16   995  	**
^1da177e4c3f41 Linus Torvalds 2005-04-16   996  	** map the virtual addresses to the I/O Pdir
^1da177e4c3f41 Linus Torvalds 2005-04-16   997  	** o dma_address will contain the pdir index
^1da177e4c3f41 Linus Torvalds 2005-04-16   998  	** o dma_len will contain the number of bytes to map 
^1da177e4c3f41 Linus Torvalds 2005-04-16   999  	** o address contains the virtual address.
^1da177e4c3f41 Linus Torvalds 2005-04-16  1000  	*/
^1da177e4c3f41 Linus Torvalds 2005-04-16 @1001  	filled = iommu_fill_pdir(ioc, sglist, nents, 0, sba_io_pdir_entry);
^1da177e4c3f41 Linus Torvalds 2005-04-16  1002  
64908ad95c34f2 Grant Grundler 2005-10-21  1003  	/* force FDC ops in io_pdir_entry() to be visible to IOMMU */
3847dab7742186 Helge Deller   2018-10-16  1004  	asm_io_sync();
64908ad95c34f2 Grant Grundler 2005-10-21  1005  

:::::: The code at line 1001 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
