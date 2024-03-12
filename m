Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F21115BF
	for <oe-kbuild-all@lists.linux.dev>; Tue, 12 Mar 2024 16:42:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710261771; cv=none; b=OW+9FBGZZsiPk52VydAkYHps0DarfgUmyebZv5s+lH//CbCSXSY6fLbtwPcUX1K4FFI5ATxKG1CmIWDjCNmGiZfJpJ+t8/LGKFJt5rXJFXcnQmXonUEjRYZf03LgebWng6ypxcWll0+I5+N656nobos82pCm/2hidxv5lb4B/lk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710261771; c=relaxed/simple;
	bh=Tnin2gRiUouXW9ulBT59v7OYDhgHcmzcKP0HLOew37A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mPcVAO/vSDXtJCQ/W+H9SOJvRt/1TiqXlkt2bWW8EpWSSPnDnJ2XOjlBz4UC3kbAKJR1WPtOFp0l5Ep7rwjtgp1cBk2A0Vw1UVBuCPhEAz6nBUrnQVPMqarv4vGzRgbfBGlez60YCV93GbRdeXEWEYB9hbnyceyKcnCnYEwzBkU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Cq46Vnob; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Cq46Vnob"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710261769; x=1741797769;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Tnin2gRiUouXW9ulBT59v7OYDhgHcmzcKP0HLOew37A=;
  b=Cq46VnobfybJKNEa/GIjBGAQUXJrw/UbIfVm8jgqjfYr8RdOx4K84bEc
   FE1EAPsz8WF4i/vngBmsbwjURd8pekQHpd1iRH0n/ERcCeknT1wM+SDAq
   bZ6Ke/Po9PjmaoYqlOIYD5YeUAM+3urNCPYZYclbk0wmKFyzEMMx+hxsH
   EwJ/NopzzDZ+LnAIXo5jHqXN+uch8B3rdEa9yQHgUfMklYdkeDtQzq+rA
   XrE+ai0LL3kqV/mEq+AL6FhcrORsptwdXPxV0fAH2QzjxQbU4/zC+9mSt
   FrPQQ2TPSC0tgoSFjBqlaqANuTHPk05O8kIlhtU0ZsS61I7DKSJSJXmCK
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11011"; a="27458672"
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; 
   d="scan'208";a="27458672"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2024 09:42:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; 
   d="scan'208";a="16307645"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 12 Mar 2024 09:42:48 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rk5DB-000Acv-1J;
	Tue, 12 Mar 2024 16:42:45 +0000
Date: Wed, 13 Mar 2024 00:42:25 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yongqiang Liu <duanzi@zju.edu.cn>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 21846/21850]
 drivers/dma/pl330.c:2598:22: warning: 'dst' may be used uninitialized
Message-ID: <202403130014.Z6L6BJzl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   c38cc0a3be12e5c70b9a2a015cbee44014a52518
commit: 0299853c014aa0eecf7fb85ac2f1ebd0a9a6ba73 [21846/21850] dmaengine: fix is_slave_direction() return false when DMA_DEV_TO_DEV
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20240313/202403130014.Z6L6BJzl-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240313/202403130014.Z6L6BJzl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403130014.Z6L6BJzl-lkp@intel.com/

Note: it may well be a FALSE warning. FWIW you are at least aware of it now.
http://gcc.gnu.org/wiki/Better_Uninitialized_Warnings

All warnings (new ones prefixed by >>):

   In function 'fill_px',
       inlined from 'pl330_prep_dma_cyclic' at drivers/dma/pl330.c:2716:3:
>> drivers/dma/pl330.c:2598:22: warning: 'dst' may be used uninitialized [-Wmaybe-uninitialized]
    2598 |         px->dst_addr = dst;
         |         ~~~~~~~~~~~~~^~~~~
   drivers/dma/pl330.c: In function 'pl330_prep_dma_cyclic':
   drivers/dma/pl330.c:2656:20: note: 'dst' was declared here
    2656 |         dma_addr_t dst;
         |                    ^~~
   In function 'fill_px',
       inlined from 'pl330_prep_dma_cyclic' at drivers/dma/pl330.c:2716:3:
>> drivers/dma/pl330.c:2599:22: warning: 'src' may be used uninitialized [-Wmaybe-uninitialized]
    2599 |         px->src_addr = src;
         |         ~~~~~~~~~~~~~^~~~~
   drivers/dma/pl330.c: In function 'pl330_prep_dma_cyclic':
   drivers/dma/pl330.c:2657:20: note: 'src' was declared here
    2657 |         dma_addr_t src;
         |                    ^~~
   drivers/dma/pl330.c:297: warning: cannot understand function prototype: 'struct pl330_reqcfg '


vim +/dst +2598 drivers/dma/pl330.c

b3040e40675ec2 Jassi Brar 2010-05-23  2593  
b3040e40675ec2 Jassi Brar 2010-05-23  2594  static inline void fill_px(struct pl330_xfer *px,
b3040e40675ec2 Jassi Brar 2010-05-23  2595  		dma_addr_t dst, dma_addr_t src, size_t len)
b3040e40675ec2 Jassi Brar 2010-05-23  2596  {
b3040e40675ec2 Jassi Brar 2010-05-23  2597  	px->bytes = len;
b3040e40675ec2 Jassi Brar 2010-05-23 @2598  	px->dst_addr = dst;
b3040e40675ec2 Jassi Brar 2010-05-23 @2599  	px->src_addr = src;
b3040e40675ec2 Jassi Brar 2010-05-23  2600  }
b3040e40675ec2 Jassi Brar 2010-05-23  2601  

:::::: The code at line 2598 was first introduced by commit
:::::: b3040e40675ec2c43542331cd30d4ee3dae797e8 DMA: PL330: Add dma api driver

:::::: TO: Jassi Brar <jassi.brar@samsung.com>
:::::: CC: Dan Williams <dan.j.williams@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
