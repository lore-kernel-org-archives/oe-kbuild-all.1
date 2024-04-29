Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2FF0883D
	for <oe-kbuild-all@lists.linux.dev>; Mon, 29 Apr 2024 07:50:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714377035; cv=none; b=POsK1F/NJG7nlbhnzZjKQ+2TlkmRhr/pNNNvwUtuTWPtAXWjcgHJsyNN5YH/knAt7lIImhOyq/lNupVRqDPGjfyhARAGdSQI01qOgwaJ0Sr6KMLPfoGDtWAkL7X9qjxQn2jTNdsh1E40aP+bhQURGwonNb5nnDlX36JHrkEBml0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714377035; c=relaxed/simple;
	bh=L8icgFaIBP+IH7ZB8ttlWXekdJRDsUlSi56fuk+xkTg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hoHb+2dE1wd4DM/Zs1d3IshEYtlLQgOrBvYyBD942APQXV9mCZz1nVKozJLgd5cbKc3rSu3stX/tMoqCL7T00mQKqdxP+S//FSQ6BtdNAaUACTmJfEQ9v8ZtrJ2YvZIkNRPRPAtg4800HB0CHkU8jOkAXQpKSduAJ4hnDgq9Vdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VAA0qjUg; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VAA0qjUg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714377033; x=1745913033;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=L8icgFaIBP+IH7ZB8ttlWXekdJRDsUlSi56fuk+xkTg=;
  b=VAA0qjUgWE1kKmAPNSjKh4TEYrpSOd561KvSi8QEOY4WW5P2WqPEy5r0
   dvUuVzu97nwUJk+N78oz2Pkh6c+zd/U8/W3oyr4ljR8emSrqlNN+4PxEV
   T9pG/62SGjy+u963h9MwN6gcOIOoTYVNKKTG3dNHsO75s5kqDdSdmpIyG
   N5rKEI8COq8GE2xJc7M/jzV2QiWPj7Cvp3Fge+v0FLWh/TsESJeJoJaps
   KE94cE/JFOUhFioZofTK64Dlv24F/5OHr9gRapkYwDp6zA0OE1R2ghgol
   K71q8lVor4kSnXODnZwdGDp2ql3+4vP9ljenQZWiHv4WXoa8FoXWi+6Uc
   g==;
X-CSE-ConnectionGUID: dmr4zvlASW6esI0GH2j4Qg==
X-CSE-MsgGUID: 2ioVNQOCQU2jCLIoXy099w==
X-IronPort-AV: E=McAfee;i="6600,9927,11057"; a="27478695"
X-IronPort-AV: E=Sophos;i="6.07,239,1708416000"; 
   d="scan'208";a="27478695"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2024 00:50:33 -0700
X-CSE-ConnectionGUID: ZexIOq5AQz6QxtsQ1jukMA==
X-CSE-MsgGUID: nd0VBiuSRSuqNcNd5t9RHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,239,1708416000"; 
   d="scan'208";a="30504630"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 29 Apr 2024 00:50:32 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s1LmP-00072M-2x;
	Mon, 29 Apr 2024 07:50:29 +0000
Date: Mon, 29 Apr 2024 15:50:27 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:5.15-2.2.x-imx 3830/29983] /tmp/ccQwdHx1.s:3737:
 Error: bad instruction `dc ivac,r8'
Message-ID: <202404291519.MKKfLeGQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc 5.15-2.2.x-imx
head:   5134e031114e613cb04858e248af5e65fe1e112f
commit: a60cf5cbad0f9b4a94b0f7b9d5af8f258593b610 [3830/29983] soc: fsl: dpio: enable qbman CENA portal memory access
config: arm-randconfig-004-20240429 (https://download.01.org/0day-ci/archive/20240429/202404291519.MKKfLeGQ-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240429/202404291519.MKKfLeGQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404291519.MKKfLeGQ-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/soc/fsl/dpio/qbman-portal.c: In function 'qbman_swp_enqueue_multiple_desc_direct':
   drivers/soc/fsl/dpio/qbman-portal.c:872:21: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
     872 |         addr_cena = (uint64_t)s->addr_cena;
         |                     ^
   drivers/soc/fsl/dpio/qbman-portal.c:874:24: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
     874 |                 dccvac((uint64_t *)(addr_cena +
         |                        ^
   drivers/soc/fsl/dpio/qbman-portal.c:172:58: note: in definition of macro 'dccvac'
     172 | #define dccvac(p) { asm volatile("dc cvac, %0;" : : "r" (p) : "memory"); }
         |                                                          ^
   /tmp/ccQwdHx1.s: Assembler messages:
   /tmp/ccQwdHx1.s:189: Error: bad instruction `dc cvac,r9'
   /tmp/ccQwdHx1.s:904: Error: bad instruction `dc cvac,r8'
   /tmp/ccQwdHx1.s:1446: Error: bad instruction `dc cvac,r2'
   /tmp/ccQwdHx1.s:2396: Error: bad instruction `dc cvac,r4'
>> /tmp/ccQwdHx1.s:3737: Error: bad instruction `dc ivac,r8'
   /tmp/ccQwdHx1.s:3855: Error: bad instruction `dc ivac,r5'
   /tmp/ccQwdHx1.s:3951: Error: bad instruction `dc ivac,r1'
   /tmp/ccQwdHx1.s:4241: Error: bad instruction `dc ivac,r6'
   /tmp/ccQwdHx1.s:4360: Error: bad instruction `dc ivac,r6'
   /tmp/ccQwdHx1.s:4456: Error: bad instruction `dc ivac,r2'
   /tmp/ccQwdHx1.s:5831: Error: bad instruction `dc cvac,r1'
   /tmp/ccQwdHx1.s:6029: Error: bad instruction `dc ivac,r5'
   /tmp/ccQwdHx1.s:7466: Error: bad instruction `dc ivac,r8'
   /tmp/ccQwdHx1.s:7761: Error: bad instruction `dc cvac,r5'
   /tmp/ccQwdHx1.s:8162: Error: bad instruction `dc ivac,r8'
   /tmp/ccQwdHx1.s:8374: Error: bad instruction `dc cvac,r5'
   /tmp/ccQwdHx1.s:8794: Error: bad instruction `dc ivac,r8'
   /tmp/ccQwdHx1.s:9005: Error: bad instruction `dc cvac,r5'
   /tmp/ccQwdHx1.s:9359: Error: bad instruction `dc ivac,r8'
   /tmp/ccQwdHx1.s:9623: Error: bad instruction `dc cvac,r8'
   /tmp/ccQwdHx1.s:10085: Error: bad instruction `dc ivac,r8'
   /tmp/ccQwdHx1.s:10348: Error: bad instruction `dc cvac,r5'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
