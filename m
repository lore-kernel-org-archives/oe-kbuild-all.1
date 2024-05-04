Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2122139B
	for <oe-kbuild-all@lists.linux.dev>; Sat,  4 May 2024 01:42:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714786932; cv=none; b=TbVIHJuXFbzvcgjsKUnYCcy5WpaGJwcpqi7KwLpqfagrpWVTqC1DEQ1AFJe0Q8vmf9Nk4MHYv0IR2FWQxAFfTqs7hvw/McFKmv4rIjZ/itUgVA+yMG4wZM0TUvSQXALkNEobM8C7yUMBOzDTS2sd7CxZme0oCaDoIxhbA3y8bWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714786932; c=relaxed/simple;
	bh=SW2JUZOjwpzMv7z+BBoEdu/64iMJaRIB0qpsSzuOGsg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=q8L1mD0MjkwBTd5kkarLmWa7xdsgZiOKoY+ErSm33keZebAKqZI41HceJor96oLTWWIAyLOHY4uTHuVLoqjslg+leXUMtBSJpSV0BNIKR47bQODj91qQr3VjyTsh+D6ZDk4SbKTlso1UeRoSHvGRU2iZgNNyb689S9aNQMlbgMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PrGBCjF0; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PrGBCjF0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714786931; x=1746322931;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SW2JUZOjwpzMv7z+BBoEdu/64iMJaRIB0qpsSzuOGsg=;
  b=PrGBCjF0JjXgJICEuVgsRoQVmZ8CUU3eVDNKPqwUH0pC5rih4KGdFakY
   JEBLuIFxTzgkd9QpI+C0qSoc5Z63/0Y7sdlW9HgJDyiATgC6imLUSnAFS
   2IACIuEcP9Rkzpk3La8E0dHx2Oz+Bj3KBrMTBd9NjqWWVnjBeGhVcptgI
   oSiX9I25ICgh9ZNb+cnN6h6yV8FtmhL6kpRJ100c5SgvcSpOcYNSEqYtS
   NxlVherMTMYZS51GKiVPq5k3zKyunWa0TjTPqll3h2CqiSZMjhDAV0ZOw
   8xhGkfrKoTOlZXutybqFLwnpKkkJ0ScpxiYC0GYNj/pKsV+NrTeztkn07
   g==;
X-CSE-ConnectionGUID: dCZyvsWLTFCVqUbBRu9Ukg==
X-CSE-MsgGUID: N4YSxvsKTFeuTsGnffvKLA==
X-IronPort-AV: E=McAfee;i="6600,9927,11063"; a="10488194"
X-IronPort-AV: E=Sophos;i="6.07,252,1708416000"; 
   d="scan'208";a="10488194"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 May 2024 18:42:10 -0700
X-CSE-ConnectionGUID: b8uHSjotQk+EaiEZAI12FQ==
X-CSE-MsgGUID: 7B8n34CXSlOMlQAEUjr+YA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,252,1708416000"; 
   d="scan'208";a="28019454"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 03 May 2024 18:42:09 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s34Pe-000CJ4-2A;
	Sat, 04 May 2024 01:42:06 +0000
Date: Sat, 4 May 2024 09:41:18 +0800
From: kernel test robot <lkp@intel.com>
To: Leon Romanovsky <leonro@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [leon-rdma:dma-split-v1 5/17] include/linux/dma-mapping.h:76:41:
 warning: overflow in conversion from 'long long unsigned int' to 'int'
 changes value from '18446744073709551615' to '-1'
Message-ID: <202405040936.yz70atoK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/leon/linux-rdma.git dma-split-v1
head:   9da240ed50fabf3d371ed059aff21c206982f722
commit: a086d6de4fdb629b97a02c3b03fcd64d6074e2ba [5/17] dma-mapping: implement link range API
config: um-randconfig-001-20240504 (https://download.01.org/0day-ci/archive/20240504/202405040936.yz70atoK-lkp@intel.com/config)
compiler: gcc-12 (Ubuntu 12.3.0-9ubuntu2) 12.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240504/202405040936.yz70atoK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405040936.yz70atoK-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/pci.h:2693,
                    from include/media/media-device.h:16,
                    from include/media/media-request.h:20,
                    from include/media/v4l2-ctrls.h:14,
                    from drivers/media/platform/samsung/s3c-camif/camif-core.h:21,
                    from drivers/media/platform/samsung/s3c-camif/camif-regs.h:14,
                    from drivers/media/platform/samsung/s3c-camif/camif-regs.c:11:
   include/linux/dma-mapping.h: In function 'dma_start_range':
>> include/linux/dma-mapping.h:76:41: warning: overflow in conversion from 'long long unsigned int' to 'int' changes value from '18446744073709551615' to '-1' [-Woverflow]
      76 | #define DMA_MAPPING_ERROR               (~(dma_addr_t)0)
         |                                         ^
   include/linux/dma-mapping.h:371:16: note: in expansion of macro 'DMA_MAPPING_ERROR'
     371 |         return DMA_MAPPING_ERROR;
         |                ^~~~~~~~~~~~~~~~~


vim +76 include/linux/dma-mapping.h

b2fb366425ceb8 Mitchel Humpherys 2017-01-06  65  
eba304c6861613 Christoph Hellwig 2020-09-11  66  /*
eba304c6861613 Christoph Hellwig 2020-09-11  67   * A dma_addr_t can hold any valid DMA or bus address for the platform.  It can
eba304c6861613 Christoph Hellwig 2020-09-11  68   * be given to a device to use as a DMA source or target.  It is specific to a
eba304c6861613 Christoph Hellwig 2020-09-11  69   * given device and there may be a translation between the CPU physical address
eba304c6861613 Christoph Hellwig 2020-09-11  70   * space and the bus address space.
eba304c6861613 Christoph Hellwig 2020-09-11  71   *
eba304c6861613 Christoph Hellwig 2020-09-11  72   * DMA_MAPPING_ERROR is the magic error code if a mapping failed.  It should not
eba304c6861613 Christoph Hellwig 2020-09-11  73   * be used directly in drivers, but checked for using dma_mapping_error()
eba304c6861613 Christoph Hellwig 2020-09-11  74   * instead.
eba304c6861613 Christoph Hellwig 2020-09-11  75   */
42ee3cae0ed38b Christoph Hellwig 2018-11-21 @76  #define DMA_MAPPING_ERROR		(~(dma_addr_t)0)
42ee3cae0ed38b Christoph Hellwig 2018-11-21  77  

:::::: The code at line 76 was first introduced by commit
:::::: 42ee3cae0ed38b6c04038bf851ea2496da2135bb dma-mapping: provide a generic DMA_MAPPING_ERROR

:::::: TO: Christoph Hellwig <hch@lst.de>
:::::: CC: Christoph Hellwig <hch@lst.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
