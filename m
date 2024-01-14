Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FF7A524B
	for <oe-kbuild-all@lists.linux.dev>; Sun, 14 Jan 2024 17:02:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QvoE8S1r"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705251769; x=1736787769;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZdpLT0MMvm1imrQK0OalRLLWdV2iNRFZN3XWnATFx+Q=;
  b=QvoE8S1rnfCKSy59L+YowZ4JWykcWqxjUaeNDuUpDRTSija/scO7m04k
   2XW5WkJBfLuI6QII2+ydk8a7uWIoFfI7zY2XwIa7JsyatLlYDojqjyIHn
   8wGWW9JLjGwRCVelWRrQUj0UDvy23Wf/mkbXalRI/ymEW9+oYTFfccMr+
   0tVH9+OhWK1LgAh7u3SeFXFmvzGlgFkeasCibx7v+XaguE6PH1/B0Ztt4
   WdTaLcM38yGAHzbKeCvyZH1zC15YQIr5MxCwWLnJ0UftBYVWAfAr/6MWv
   8mJOBIIFvy/S3mqpHMg+0+ekGYFjQxO956wAyNueNqgNDdrvNbJGVQH4o
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10953"; a="396620591"
X-IronPort-AV: E=Sophos;i="6.04,194,1695711600"; 
   d="scan'208";a="396620591"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2024 09:02:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10953"; a="817599742"
X-IronPort-AV: E=Sophos;i="6.04,194,1695711600"; 
   d="scan'208";a="817599742"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 14 Jan 2024 09:02:47 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rP3si-000BgS-37;
	Sun, 14 Jan 2024 17:02:44 +0000
Date: Mon, 15 Jan 2024 01:02:33 +0800
From: kernel test robot <lkp@intel.com>
To: Alexander Lobakin <aleksander.lobakin@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [alobakin:idpf-libie 11/51] include/linux/dma-mapping.h:401:9:
 error: implicit declaration of function 'dma_check_sync'; did you mean
 'dma_need_sync'?
Message-ID: <202401150022.29UhTCNe-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/alobakin/linux idpf-libie
head:   29cca1ea6c555a8b97694e38f18926da7969dcfe
commit: 366859db976ac1f430583a7ce8a1c4e9e63d589f [11/51] page_pool: add DMA-sync-for-CPU inline helper
config: sh-randconfig-001-20240114 (https://download.01.org/0day-ci/archive/20240115/202401150022.29UhTCNe-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240115/202401150022.29UhTCNe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401150022.29UhTCNe-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/skbuff.h:28,
                    from include/linux/if_ether.h:19,
                    from include/linux/etherdevice.h:20,
                    from net/bpf/test_run.c:10:
   include/linux/dma-mapping.h: In function '__dma_sync_single_range_for_cpu':
   include/linux/dma-mapping.h:389:9: error: implicit declaration of function '__dma_sync_single_for_cpu'; did you mean 'dma_sync_single_for_cpu'? [-Werror=implicit-function-declaration]
     389 |         __dma_sync_single_for_cpu(dev, addr + offset, size, dir);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
         |         dma_sync_single_for_cpu
   include/linux/dma-mapping.h: In function '__dma_sync_single_range_for_device':
   include/linux/dma-mapping.h:397:9: error: implicit declaration of function '__dma_sync_single_for_device'; did you mean 'dma_sync_single_for_device'? [-Werror=implicit-function-declaration]
     397 |         __dma_sync_single_for_device(dev, addr + offset, size, dir);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |         dma_sync_single_for_device
   include/net/page_pool/helpers.h: In function 'page_pool_dma_sync_for_cpu':
>> include/linux/dma-mapping.h:401:9: error: implicit declaration of function 'dma_check_sync'; did you mean 'dma_need_sync'? [-Werror=implicit-function-declaration]
     401 |         dma_check_sync(__dma_sync_single_range_for_cpu, d, a, o, s, r)
         |         ^~~~~~~~~~~~~~
   include/net/page_pool/helpers.h:416:9: note: in expansion of macro 'dma_sync_single_range_for_cpu'
     416 |         dma_sync_single_range_for_cpu(pool->p.dev,
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +401 include/linux/dma-mapping.h

ed6ccf10f24bdfc Christoph Hellwig 2018-12-26  399  
9a3aa944b330413 Alexander Lobakin 2024-01-11  400  #define dma_sync_single_range_for_cpu(d, a, o, s, r)			  \
9a3aa944b330413 Alexander Lobakin 2024-01-11 @401  	dma_check_sync(__dma_sync_single_range_for_cpu, d, a, o, s, r)
9a3aa944b330413 Alexander Lobakin 2024-01-11  402  #define dma_sync_single_range_for_device(d, a, o, s, r)			  \
9a3aa944b330413 Alexander Lobakin 2024-01-11  403  	dma_check_sync(__dma_sync_single_range_for_device, d, a, o, s, r)
9a3aa944b330413 Alexander Lobakin 2024-01-11  404  

:::::: The code at line 401 was first introduced by commit
:::::: 9a3aa944b33041331d3bf1c1ad194ecffee0cbf0 dma: compile-out DMA sync operations when not used

:::::: TO: Alexander Lobakin <aleksander.lobakin@intel.com>
:::::: CC: Alexander Lobakin <aleksander.lobakin@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
