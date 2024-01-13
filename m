Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C75F20DD7
	for <oe-kbuild-all@lists.linux.dev>; Sat, 13 Jan 2024 11:10:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Xd9R5Gcn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705144247; x=1736680247;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=izCcsRq3470VXaXm/wfT3tqfWFipdo/uZCHimWeioqM=;
  b=Xd9R5GcnVcwKVSjVG+S6kg2QeGe/2IyVwJy88YGVf04lCH3kWh6v8KTH
   TNtxhGvhxaDHc/IOArttIqOw8i2StQ0rgMkNoOdDLuFzLMepEVhSDKc3P
   tLR33zLKhSTei6rKd6pEyU4W203m7OgNQvlsjEdPYWpLnQJiy/3K5se7h
   sHf3ibYYKTUCKL0IhbyJAH4rOzmj9j13+E/KX9yCa+5Bm7FKHJx58wTg0
   FzmA67jua9DiI1Takjrl23nBEKYnG7SfSzX4YszcijePP7IJ7LErFNfKk
   9xfbhMyCUshKBzkI+7kZsr+WjtSuZVKZoYXWCnx/xpb9Lr/GVSiGwbSiC
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10951"; a="6726945"
X-IronPort-AV: E=Sophos;i="6.04,192,1695711600"; 
   d="scan'208";a="6726945"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2024 03:10:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10951"; a="783307947"
X-IronPort-AV: E=Sophos;i="6.04,192,1695711600"; 
   d="scan'208";a="783307947"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 13 Jan 2024 03:10:45 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rObuV-000AOc-0V;
	Sat, 13 Jan 2024 11:10:43 +0000
Date: Sat, 13 Jan 2024 19:10:25 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.1-2.2.x-imx 4455/17888] {standard input}:66:
 Error: unrecognized opcode: `dc'
Message-ID: <202401131904.bdDd39Dw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Haiying,

FYI, the error/warning still remains.

tree:   https://github.com/Freescale/linux-fslc 6.1-2.2.x-imx
head:   32a344619c750cdcbe31bed754adc1b30d362e45
commit: 13479aa9b9b117aae69383686d3a501b178dd9c4 [4455/17888] soc: fsl: dpio: enable qbman CENA portal memory access
config: powerpc-randconfig-003-20240113 (https://download.01.org/0day-ci/archive/20240113/202401131904.bdDd39Dw-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240113/202401131904.bdDd39Dw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401131904.bdDd39Dw-lkp@intel.com/

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
   {standard input}: Assembler messages:
>> {standard input}:66: Error: unrecognized opcode: `dc'
   {standard input}:342: Error: unrecognized opcode: `dc'
   {standard input}:352: Error: unrecognized opcode: `dc'
   {standard input}:406: Error: unrecognized opcode: `dc'
   {standard input}:613: Error: unrecognized opcode: `dc'
   {standard input}:622: Error: unrecognized opcode: `dc'
   {standard input}:658: Error: unrecognized opcode: `dc'
   {standard input}:1138: Error: unrecognized opcode: `dc'
   {standard input}:1365: Error: unrecognized opcode: `dc'
   {standard input}:1409: Error: unrecognized opcode: `dc'
   {standard input}:1456: Error: unrecognized opcode: `dc'
   {standard input}:1529: Error: unrecognized opcode: `dc'
   {standard input}:1575: Error: unrecognized opcode: `dc'
   {standard input}:1622: Error: unrecognized opcode: `dc'
   {standard input}:1796: Error: unrecognized opcode: `dc'
   {standard input}:1847: Error: unrecognized opcode: `dc'
   {standard input}:2367: Error: unrecognized opcode: `dc'
   {standard input}:2611: Error: unrecognized opcode: `dc'
   {standard input}:2797: Error: unrecognized opcode: `dc'
   {standard input}:2979: Error: unrecognized opcode: `dc'
   {standard input}:3176: Error: unrecognized opcode: `dc'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
