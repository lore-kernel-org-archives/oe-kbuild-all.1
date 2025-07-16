Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B10627511F
	for <oe-kbuild-all@lists.linux.dev>; Wed, 16 Jul 2025 04:20:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752639621; cv=none; b=HKHlCQruMa4WLv5gGiNonPYJ3303HvdzRwU4Rj1fopDxcwCMqj2rI+5KuLPVZ902U/imG9MdtxnFfbD+guTXfCcoCDjxqXwp1mCxc9tXPsd4i4AwIUWXBbt0MvElJh1tvlLgOb0JgMdaGN33vyv9lF3kbhgoLDHLl4r1gUdEopI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752639621; c=relaxed/simple;
	bh=G6MjZ7/1dtS02YE0fZbKKhayV/HWO7MKzyUgQGxRcy0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=T/g2b+DRu8PHg4c2LDWMZJbnpHv6DMjGyzhHkPF04vKH/g+v3AKG4EgAuxavLhcAgOxLPWZcS0+cUEvi8PC/SB99m415dIDffPvHGDUJqhA+HqyZh05fKgQdh/z1VlXGvbkIYCdc+w4HX+IlSx2QL5JY9jXC+2Yk6uE7AGOlHfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KkA8adwo; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KkA8adwo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752639619; x=1784175619;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=G6MjZ7/1dtS02YE0fZbKKhayV/HWO7MKzyUgQGxRcy0=;
  b=KkA8adwoQJYOqjWk3iW/X2bLLIOxz/tABiQdrttbcRhxDVv2G8iQ2uLL
   ZSUx+jAOfLgfSOQCBzmnTlKew1xJ9KNIjZUAbqXdsDMmCT6qXp4AMJ3ov
   xoRfRpIaXvaGS2XuZ45g+Hcelu/ksV2KDTaM6f2YEl40/8d9y5TOOCvsL
   AdOKNwyEnn+u2nz6/lIrI5SsVz/me+5fcZzci8LRNOVr/Djes6BnmBomW
   BpXg98ZD6nw+V0FEHR9IMBdiQn9MxNqdefb2EvbAXbd7ntU6jW82t59o1
   Ute2qPdYUgE2yEvu1UP+CZ0mQdKCWAmSXzwZcDjI+o6tXGFBlmLulHfZX
   Q==;
X-CSE-ConnectionGUID: fVsXdBTSR/+4RUTfLhvu5g==
X-CSE-MsgGUID: 7Lq8jYjBTEK/PscEcywg6g==
X-IronPort-AV: E=McAfee;i="6800,10657,11493"; a="65134806"
X-IronPort-AV: E=Sophos;i="6.16,315,1744095600"; 
   d="scan'208";a="65134806"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2025 21:20:18 -0700
X-CSE-ConnectionGUID: CzsFMahpSdGSfWa1uPw2wg==
X-CSE-MsgGUID: 2I5+h/iERomdvo++QA0G4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,315,1744095600"; 
   d="scan'208";a="188370511"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 15 Jul 2025 21:20:18 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ubtct-000BsH-0d;
	Wed, 16 Jul 2025 04:20:15 +0000
Date: Wed, 16 Jul 2025 12:20:15 +0800
From: kernel test robot <lkp@intel.com>
To: jason.zeng@intel.com, lin.x.wang@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [bytedance:5.15-velinux 0/92] include/linux/dma-buf.h:667:13:
 warning: 'is_dma_buf_page' defined but not used
Message-ID: <202507161258.7R2MnUR4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/bytedance/kernel.git 5.15-velinux
head:   c71e88ad12bfbc44f855b681ef923e1acc2e984a
commit: 515f6947829b1645b8bb22dae8555631f0c708e1 [0/92] dma-buf: create struct pages backing a dma-buf
config: x86_64-randconfig-102-20250716 (https://download.01.org/0day-ci/archive/20250716/202507161258.7R2MnUR4-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250716/202507161258.7R2MnUR4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507161258.7R2MnUR4-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/media/videobuf2-core.h:18,
                    from include/media/dvb_vb2.h:21,
                    from include/media/dmxdev.h:38,
                    from drivers/media/dvb-core/dmxdev.c:30:
   include/linux/dma-buf.h:672:13: warning: 'is_dma_buf_pages_file' defined but not used [-Wunused-function]
     672 | static bool is_dma_buf_pages_file(struct file *file)
         |             ^~~~~~~~~~~~~~~~~~~~~
>> include/linux/dma-buf.h:667:13: warning: 'is_dma_buf_page' defined but not used [-Wunused-function]
     667 | static bool is_dma_buf_page(struct page *page)
         |             ^~~~~~~~~~~~~~~


vim +/is_dma_buf_page +667 include/linux/dma-buf.h

   660	
   661	static inline bool is_dma_buf_page(struct page *page)
   662	{
   663		return (is_zone_device_page(page) && page->pgmap &&
   664			page->pgmap->ops == &dma_buf_pgmap_ops);
   665	}
   666	#else
 > 667	static bool is_dma_buf_page(struct page *page)
   668	{
   669		return false;
   670	}
   671	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
