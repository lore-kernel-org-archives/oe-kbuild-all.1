Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D55312185A5
	for <oe-kbuild-all@lists.linux.dev>; Fri, 11 Oct 2024 12:16:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728648977; cv=none; b=WnlkM7VhYaMhDUQ2RXnI6QsGay5JgGBc5kJMpcbi4/euJgqQYBmbdPonLbCSy8JPx7+NI6WEjEjrJ+e+NrcVUozjTgSEFpduIkltxMa5iYg7SjTgT6982sLhQ8enYYzgy6y3hwQxrIBbMSiAbVB4Gn1ZpBVT46UdOUQHf6A60Mg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728648977; c=relaxed/simple;
	bh=XhUDt+qH4bAW38F40442/W7r39n8q4Ma/YRXTA1jJUo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=f278ycbSsYXFJdyXJ9y6vhcLtlBKR/K7IjwI1WnFvrXo5zckAq6WEDHBqO/dmZ6xgaCquDDTqymjxb4+lDudfn21qVmkR6FIQ2nvPrEzGfb+zNbQqO9qyTp9/iPRkWVP14VYyRomQgJb0cXcDJdPeooWyq6S4xlMezgmPOMCGnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LmtilyAS; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LmtilyAS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728648976; x=1760184976;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XhUDt+qH4bAW38F40442/W7r39n8q4Ma/YRXTA1jJUo=;
  b=LmtilyASO/mbpHpb4c9iiaRr+l+iQ1x50l2KiH2RYk4quTjkm9Y7lEuj
   q0NxWXZQN17JSXJhhNaXiL4E69D082sA3dz5UWCeakGorUquDraNF6rq7
   0JpB6ZEboQNc/bzv7lCXgkSUuRUmUPE5s9zU46hn7/ouDre4x7CEZVimZ
   C4bK84oghBlEe+XM5WhFTaZA6vOenPw7KossFtTRSpElPZXQyMerHtvpz
   8yduMdGYfjMOO9ubW3K8Rvy9RbqBWNBwPgF3tn9TrgsTOf1Ajgj34hKOJ
   1pIohlg7QPt/t17PanVSf32sGE/P2HZ2l9qxIHOZn3cD2H+frT9d1p/nX
   A==;
X-CSE-ConnectionGUID: i92xQEPWQhqILcqlK4Vy/w==
X-CSE-MsgGUID: oAv1AR2XT8yDN7dtuEiu1Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11221"; a="15669442"
X-IronPort-AV: E=Sophos;i="6.11,195,1725346800"; 
   d="scan'208";a="15669442"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Oct 2024 05:16:15 -0700
X-CSE-ConnectionGUID: SX41DuaqQmKCdSKLwRNhCw==
X-CSE-MsgGUID: QlzD3nj8RuistreJQWsmUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,195,1725346800"; 
   d="scan'208";a="77710517"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 11 Oct 2024 05:16:15 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1szEZ2-000CH7-0r;
	Fri, 11 Oct 2024 12:16:12 +0000
Date: Fri, 11 Oct 2024 20:16:08 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hch-misc:block-dma 1/9] mapping.c:(.text+0xb6c): relocation
 truncated to fit: R_NIOS2_CALL26 against `iommu_dma_link_range'
Message-ID: <202410112049.TVaGK9wE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.infradead.org/users/hch/misc.git block-dma
head:   d76f41fc7d0f68b85c90d0beb90a09f54b6aa219
commit: 4828642547fd5245380cc2c2a894043148f25dc2 [1/9] FOLD: simplify dma_can_use_iova
config: nios2-allnoconfig (https://download.01.org/0day-ci/archive/20241011/202410112049.TVaGK9wE-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241011/202410112049.TVaGK9wE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410112049.TVaGK9wE-lkp@intel.com/

All errors (new ones prefixed by >>):

   nios2-linux-ld: kernel/dma/mapping.o: in function `dma_link_range_attrs':
   mapping.c:(.text+0xb6c): undefined reference to `iommu_dma_link_range'
>> mapping.c:(.text+0xb6c): relocation truncated to fit: R_NIOS2_CALL26 against `iommu_dma_link_range'
   nios2-linux-ld: kernel/dma/mapping.o: in function `dma_end_range':
   mapping.c:(.text+0xdc8): undefined reference to `iommu_dma_end_range'
>> mapping.c:(.text+0xdc8): relocation truncated to fit: R_NIOS2_CALL26 against `iommu_dma_end_range'
   nios2-linux-ld: kernel/dma/mapping.o: in function `dma_start_range':
   mapping.c:(.text+0xdf8): undefined reference to `iommu_dma_start_range'
   mapping.c:(.text+0xdf8): relocation truncated to fit: R_NIOS2_CALL26 against `iommu_dma_start_range'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
