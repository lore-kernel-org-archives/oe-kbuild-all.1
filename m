Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6E631BDED
	for <oe-kbuild-all@lists.linux.dev>; Fri, 13 Oct 2023 20:02:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Hc6iJlpt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697227354; x=1728763354;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=d0erwQ3LZtW8iULCEXqVeiPDYrq8Kjupb5Mu4iYDuSI=;
  b=Hc6iJlptaJXC3GHr5YY0TWh27gugWK5O1hql9vWBCuJPMMWDy0Bv/YrR
   4Uj0yFlw6mj49Nc6NJj8NfH9H4qzAj0/yvr6Ou6fitgnq8Dph6bA5MjYR
   x731gqqxfjbiNviv19X6ppJAAg2099hB7EZG2FVyU713nbHW69UNa7OI0
   4BF/Nk0HyZ2O8rGFUOlgEsxAer26ewwSiEAIYt03TaFDfinV+1bkWawlk
   thGOYQMzbWvVm5RgeCupEaMSSZ75a3zkqRt6DtHDPoObiqTSY8t+HTINm
   0mBU4PHNIbA92TbKj2wX+jeAOLwxhnD8ETp18pfmm/I9iy8EZQ9Mhz/m0
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="364615859"
X-IronPort-AV: E=Sophos;i="6.03,223,1694761200"; 
   d="scan'208";a="364615859"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2023 13:02:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="758599305"
X-IronPort-AV: E=Sophos;i="6.03,223,1694761200"; 
   d="scan'208";a="758599305"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 13 Oct 2023 13:02:32 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qrOMg-0005Kt-20;
	Fri, 13 Oct 2023 20:02:30 +0000
Date: Sat, 14 Oct 2023 04:02:01 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.1-2.1.x-imx 4455/15768] /tmp/ccX7vNAb.s:103:
 Error: bad instruction `dc cvac,fp'
Message-ID: <202310140455.7OJXHj2m-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc 6.1-2.1.x-imx
head:   3f41fbe42851375d3d5996e4bf9e9809e6c79517
commit: 13479aa9b9b117aae69383686d3a501b178dd9c4 [4455/15768] soc: fsl: dpio: enable qbman CENA portal memory access
config: arm-randconfig-001-20231013 (https://download.01.org/0day-ci/archive/20231014/202310140455.7OJXHj2m-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231014/202310140455.7OJXHj2m-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310140455.7OJXHj2m-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/soc/fsl/dpio/qbman-portal.c: In function 'qbman_swp_enqueue_multiple_desc_direct':
   drivers/soc/fsl/dpio/qbman-portal.c:874:21: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
     874 |         addr_cena = (uint64_t)s->addr_cena;
         |                     ^
   drivers/soc/fsl/dpio/qbman-portal.c:876:24: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
     876 |                 dccvac((uint64_t *)(addr_cena +
         |                        ^
   drivers/soc/fsl/dpio/qbman-portal.c:174:58: note: in definition of macro 'dccvac'
     174 | #define dccvac(p) { asm volatile("dc cvac, %0;" : : "r" (p) : "memory"); }
         |                                                          ^
   /tmp/ccX7vNAb.s: Assembler messages:
>> /tmp/ccX7vNAb.s:103: Error: bad instruction `dc cvac,fp'
>> /tmp/ccX7vNAb.s:471: Error: bad instruction `dc cvac,r10'
   /tmp/ccX7vNAb.s:756: Error: bad instruction `dc cvac,r3'
   /tmp/ccX7vNAb.s:1553: Error: bad instruction `dc ivac,r3'
   /tmp/ccX7vNAb.s:1584: Error: bad instruction `dc ivac,r7'
   /tmp/ccX7vNAb.s:1667: Error: bad instruction `dc ivac,r6'
   /tmp/ccX7vNAb.s:1784: Error: bad instruction `dc ivac,r3'
   /tmp/ccX7vNAb.s:1817: Error: bad instruction `dc ivac,r6'
   /tmp/ccX7vNAb.s:1900: Error: bad instruction `dc ivac,r6'
   /tmp/ccX7vNAb.s:2077: Error: bad instruction `dc cvac,r4'
   /tmp/ccX7vNAb.s:2366: Error: bad instruction `dc cvac,r6'
   /tmp/ccX7vNAb.s:2440: Error: bad instruction `dc ivac,r5'
   /tmp/ccX7vNAb.s:3192: Error: bad instruction `dc cvac,r5'
   /tmp/ccX7vNAb.s:3254: Error: bad instruction `dc ivac,r5'
   /tmp/ccX7vNAb.s:3498: Error: bad instruction `dc cvac,r5'
   /tmp/ccX7vNAb.s:3560: Error: bad instruction `dc ivac,r5'
   /tmp/ccX7vNAb.s:3774: Error: bad instruction `dc cvac,r5'
   /tmp/ccX7vNAb.s:3835: Error: bad instruction `dc ivac,r5'
   /tmp/ccX7vNAb.s:4035: Error: bad instruction `dc cvac,r5'
   /tmp/ccX7vNAb.s:4098: Error: bad instruction `dc ivac,r5'
   /tmp/ccX7vNAb.s:4360: Error: bad instruction `dc cvac,r5'
   /tmp/ccX7vNAb.s:4422: Error: bad instruction `dc ivac,r5'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
