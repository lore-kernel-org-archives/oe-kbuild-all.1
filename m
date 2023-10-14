Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA754168BA
	for <oe-kbuild-all@lists.linux.dev>; Sat, 14 Oct 2023 19:56:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nOKqNaEI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697313397; x=1728849397;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+RRErHnTCw3QREa/4gmfHm6/NSZhPMuR+7B5XqeEik8=;
  b=nOKqNaEIqNyW6huI6Ogo5VeFMx1dmpe6sqHueEZScWQi2BFfJYMO4EDo
   sDpwrtKyHXGWqeGbRENyv61d7n4bJNs27G0g8uRqraNZxJ4n8Y6MbrRm5
   POdbcc0n7T8B6HAp5UOFCgQOh7c3PzvTi6A0P1YAWmG2NUCraMkFmrtHe
   omH1M+/ZhEE2HHMziGZulwQtyPZTKKiAwDPZ1+umnKUm3JrJLhnLFSakE
   Bc4fx7bYBoBEc94np1gxd5tbNYdqewqvkQavovcQ79LoqPNjYekqGo1ak
   zabE8A/rE353k1dZM+6itARowpHPBOfhEx9rxziZdHy2/Wrpj+RXxs+mX
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="365609426"
X-IronPort-AV: E=Sophos;i="6.03,224,1694761200"; 
   d="scan'208";a="365609426"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2023 12:56:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="1002376003"
X-IronPort-AV: E=Sophos;i="6.03,224,1694761200"; 
   d="scan'208";a="1002376003"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 14 Oct 2023 12:56:35 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qrkkT-0006au-24;
	Sat, 14 Oct 2023 19:56:33 +0000
Date: Sun, 15 Oct 2023 03:56:25 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:pr/643 4455/15767] /tmp/ccyiVa8A.s:70: Error: bad
 instruction `dc cvac,r8'
Message-ID: <202310150330.GDdOgIFa-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc pr/643
head:   1fef7a26b48f767bcda4f5147cea10e83903ecf6
commit: 13479aa9b9b117aae69383686d3a501b178dd9c4 [4455/15767] soc: fsl: dpio: enable qbman CENA portal memory access
config: arm-randconfig-002-20231014 (https://download.01.org/0day-ci/archive/20231015/202310150330.GDdOgIFa-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231015/202310150330.GDdOgIFa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310150330.GDdOgIFa-lkp@intel.com/

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
   /tmp/ccyiVa8A.s: Assembler messages:
>> /tmp/ccyiVa8A.s:70: Error: bad instruction `dc cvac,r8'
   /tmp/ccyiVa8A.s:309: Error: bad instruction `dc cvac,r10'
   /tmp/ccyiVa8A.s:473: Error: bad instruction `dc cvac,r3'
>> /tmp/ccyiVa8A.s:967: Error: bad instruction `dc ivac,r2'
>> /tmp/ccyiVa8A.s:990: Error: bad instruction `dc ivac,r0'
>> /tmp/ccyiVa8A.s:1042: Error: bad instruction `dc ivac,r1'
   /tmp/ccyiVa8A.s:1098: Error: bad instruction `dc ivac,r1'
   /tmp/ccyiVa8A.s:1125: Error: bad instruction `dc ivac,r1'
   /tmp/ccyiVa8A.s:1176: Error: bad instruction `dc ivac,r1'
>> /tmp/ccyiVa8A.s:1273: Error: bad instruction `dc cvac,r2'
>> /tmp/ccyiVa8A.s:1684: Error: bad instruction `dc cvac,r1'
   /tmp/ccyiVa8A.s:1737: Error: bad instruction `dc ivac,r0'
   /tmp/ccyiVa8A.s:2270: Error: bad instruction `dc cvac,r3'
   /tmp/ccyiVa8A.s:2310: Error: bad instruction `dc ivac,r1'
   /tmp/ccyiVa8A.s:2457: Error: bad instruction `dc cvac,r3'
   /tmp/ccyiVa8A.s:2497: Error: bad instruction `dc ivac,r1'
   /tmp/ccyiVa8A.s:2627: Error: bad instruction `dc cvac,r4'
   /tmp/ccyiVa8A.s:2667: Error: bad instruction `dc ivac,r2'
   /tmp/ccyiVa8A.s:2791: Error: bad instruction `dc cvac,r3'
   /tmp/ccyiVa8A.s:2831: Error: bad instruction `dc ivac,r2'
   /tmp/ccyiVa8A.s:2996: Error: bad instruction `dc cvac,r3'
   /tmp/ccyiVa8A.s:3036: Error: bad instruction `dc ivac,r2'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
