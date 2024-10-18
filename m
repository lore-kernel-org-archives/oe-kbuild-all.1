Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 612A05B05E
	for <oe-kbuild-all@lists.linux.dev>; Fri, 18 Oct 2024 03:44:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729223048; cv=none; b=nzx6TC8i5Km9BciWoWR4Yvsx5FTTX95wRylhfRbI71M7PM0DkHly2+90QRKkIvgPvd/EMg4ftZRDyAjTOnI2A4Mvi5xI1BkrZXgyUCi34vvOTXGaUEmeIztV1U6VD8lgaBrjSquWMC8s4gKLDxK+N6v61mSDun1X00g5Dc+P2zo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729223048; c=relaxed/simple;
	bh=aFLWWgvLAGj64/r1NsVppQHu36QUDhl7LtjobyNvmRg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pej1V0+jSgQB06zWKSiy/B6QaVVmzhvoJb6ly8mqxPwkAWq7tafUZR2Fw+TfsHZvU1fY/08H/BYligoZ2M1v2/qKKMhsqeSNcwq2/apyfecPKPK8aKGPguDeFHqDT7ELxERqo3gE7uWRDJey2tr3TOMl6xUyArjZFyL8de6u+8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Y6p+Lg6x; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Y6p+Lg6x"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729223045; x=1760759045;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=aFLWWgvLAGj64/r1NsVppQHu36QUDhl7LtjobyNvmRg=;
  b=Y6p+Lg6xRIROXEyasxVhuOt4yB/N0FujGj+cZDAWqNS+beO2DzyND5fP
   x5j353vOAqQ8Qgy4eeqqvXzAZDbuNoq8JPZMXN4a/UA0O7wOOkPgxBPly
   yrOlCxkG+WGQXQ3j3tqJ/b3GZG+0jog+jJMFW9ZJTIb0DA0C+TEcn640T
   iOwVpd/FdrFUh4YMTN0MOIJ05VoyVkXC21CnlnlI3TJeXgpmiN8mpyG+n
   xwhHPeiSr/LAvi1CWgTsbVD6GUHUPG6LWruBMfJkJjzUyt8F7fpS6ETKk
   wXorBXTvpKd3DJNPRM5A8LEQcTguH8AQZeuQQYGHQJzNy52avBriCyluR
   Q==;
X-CSE-ConnectionGUID: 04pVVCORQ2SkuE3lPMg1gA==
X-CSE-MsgGUID: 8GLsZ7QoSjyc3jkIDpMWFQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11228"; a="32539986"
X-IronPort-AV: E=Sophos;i="6.11,212,1725346800"; 
   d="scan'208";a="32539986"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Oct 2024 20:44:04 -0700
X-CSE-ConnectionGUID: Bs+SV5msRfGP0mARAypqaQ==
X-CSE-MsgGUID: QSqR46lgS3WqSaJ5gc//Wg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="83574641"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 17 Oct 2024 20:44:03 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t1duC-000NEP-2g;
	Fri, 18 Oct 2024 03:44:00 +0000
Date: Fri, 18 Oct 2024 11:44:00 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hch-misc:nvme-dma 5/10] include/linux/dma-mapping.h:76:41: warning:
 overflow in conversion from 'long long unsigned int' to 'int' changes value
 from '18446744073709551615' to '-1'
Message-ID: <202410181132.IENPAKJK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.infradead.org/users/hch/misc.git nvme-dma
head:   080c3a9ad1b0163ed2b4f9f9fba9a9fd8fe8919f
commit: 4efd58fca48c18675130589882ca529988ede443 [5/10] dma-mapping: change the dma_alloc_iova / dma_link_range API
config: um-randconfig-001-20241018 (https://download.01.org/0day-ci/archive/20241018/202410181132.IENPAKJK-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241018/202410181132.IENPAKJK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410181132.IENPAKJK-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/skbuff.h:28,
                    from include/linux/netlink.h:7,
                    from include/net/netlink.h:6,
                    from crypto/sig.c:16:
   include/linux/dma-mapping.h: In function 'dma_link_range_attrs':
>> include/linux/dma-mapping.h:76:41: warning: overflow in conversion from 'long long unsigned int' to 'int' changes value from '18446744073709551615' to '-1' [-Woverflow]
      76 | #define DMA_MAPPING_ERROR               (~(dma_addr_t)0)
         |                                         ^
   include/linux/dma-mapping.h:359:16: note: in expansion of macro 'DMA_MAPPING_ERROR'
     359 |         return DMA_MAPPING_ERROR;
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
