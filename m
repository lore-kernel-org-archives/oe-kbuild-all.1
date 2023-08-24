Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3384185E
	for <oe-kbuild-all@lists.linux.dev>; Thu, 24 Aug 2023 07:33:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692862419; x=1724398419;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JS8MQhe+LMr6QO98dAq7PSE5qP1i41s3ABpSiUF5b8M=;
  b=VB/yi5A4h+02dvNCHSZFFgV23LliB6oddgua7prpaTmDP4FWOFE49ae7
   TSRingOkHshVpASrjSWr1Ptq+qKBkjQw2SjzUtZYlMLOR+0HYup8IM4I3
   rYHNYhbHd8yV2zK+u8b9rYxVNJ7FG+s1znb5cVCWHxmNv0CmRz9T4JjCW
   1LagdaG24+N1oQNdFK5fPYMEl2cjcKd53DJXqpidsPaUGwnxzZzr81I4N
   2YWaWAFJVGzWXJLU9yC7TxQtna/Mjv9GzWwMHoLJkN3OXDgx//xMbgpZ4
   KPMiS6b2GB1b3VH5AndGSbZH5Qqai9BI5ch3XmFf4PxRleIC5fwzxDdqs
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10811"; a="405368127"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; 
   d="scan'208";a="405368127"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2023 00:33:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10811"; a="851382386"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; 
   d="scan'208";a="851382386"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 24 Aug 2023 00:33:37 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qZ4qW-0001q0-1T;
	Thu, 24 Aug 2023 07:33:36 +0000
Date: Thu, 24 Aug 2023 15:33:08 +0800
From: kernel test robot <lkp@intel.com>
To: Andrew Davis <afd@ti.com>
Cc: oe-kbuild-all@lists.linux.dev, vigneshr@ti.com, nm@ti.com
Subject: [ti:ti-rt-linux-6.1.y-cicd 256/382] microblaze-linux-ld:
 drivers/misc/dma-buf-phys.c:59:undefined reference to `dma_buf_put'
Message-ID: <202308241509.qEX4uyQj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git ti-rt-linux-6.1.y-cicd
head:   dd944f14304d2ce6d26c9cdc3d2d2d6d373a322c
commit: a6d074da1a95aa77f6d6315d7c454623ff578a7e [256/382] HACK: misc: Add dma-buf to physical address exporter
config: microblaze-defconfig (https://download.01.org/0day-ci/archive/20230824/202308241509.qEX4uyQj-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230824/202308241509.qEX4uyQj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308241509.qEX4uyQj-lkp@intel.com/

All errors (new ones prefixed by >>):

   microblaze-linux-ld: drivers/misc/dma-buf-phys.o: in function `dma_buf_phys_release':
   drivers/misc/dma-buf-phys.c:55:(.text+0x48): undefined reference to `dma_buf_unmap_attachment'
>> microblaze-linux-ld: drivers/misc/dma-buf-phys.c:59:(.text+0x64): undefined reference to `dma_buf_put'
>> microblaze-linux-ld: drivers/misc/dma-buf-phys.c:57:(.text+0x98): undefined reference to `dma_buf_detach'
   microblaze-linux-ld: drivers/misc/dma-buf-phys.o: in function `dma_buf_phys_convert':
   drivers/misc/dma-buf-phys.c:75:(.text+0x1e0): undefined reference to `dma_buf_get'
>> microblaze-linux-ld: drivers/misc/dma-buf-phys.c:80:(.text+0x1fc): undefined reference to `dma_buf_attach'
>> microblaze-linux-ld: drivers/misc/dma-buf-phys.c:86:(.text+0x218): undefined reference to `dma_buf_map_attachment'
>> microblaze-linux-ld: drivers/misc/dma-buf-phys.c:110:(.text+0x298): undefined reference to `dma_buf_unmap_attachment'
   microblaze-linux-ld: drivers/misc/dma-buf-phys.c:112:(.text+0x2b0): undefined reference to `dma_buf_detach'
   microblaze-linux-ld: drivers/misc/dma-buf-phys.c:114:(.text+0x2c4): undefined reference to `dma_buf_put'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
