Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 013DA17C79
	for <oe-kbuild-all@lists.linux.dev>; Mon, 29 Apr 2024 08:37:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714379856; cv=none; b=FwC2775c4LA5LY3gXr43f4YnVbePYZ36JBRJyzbgCgXGjXSCCUJTP2VZCe1EgM/9CEai6Wf01QYrvJcKg8XrwMfW9qA0DrtRP5/C3erTUoPSrtGAr3XVP9p6lFyVX/8w0mo7ft46P2Xq3uKU4FCW+Wp/AqFQUZtA4EtEa69pPVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714379856; c=relaxed/simple;
	bh=HNdxP6TMOW0AuRHxdCchTSxf1xU3E8y1rG+SCZhmufI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tRSe5P085OAIk6zEVo1b6uASQX8nucvgDbsEdqUeZBU/PJGRtE4GI3mRf9dUgkLLFJmfVlMkL1HRMOBfj0J2t8MvzqqkkyDVaOxUgo8qxaj+iaLPHu+zQFn8e+aGf+9d9JJ2EMhTPrnv7lLwY/R+AsyiY3MvIYZ8G/u7+koNf/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RRsyeesI; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RRsyeesI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714379855; x=1745915855;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HNdxP6TMOW0AuRHxdCchTSxf1xU3E8y1rG+SCZhmufI=;
  b=RRsyeesIHYvkddDQgtMqfy3X7T6lZc6XJyNpz5ldlSXByjXpB2tc/sIm
   YdXu/tUKzUM+IIKpnIgf4SouellvnKzPeSUbYBM/8N6R2h5w8kdjF73YD
   604U6A6W4SXW03CWvQhOX2OebmtbkepdgAtBPMZ/jddMf1h59NXta1r5L
   gT1fyEUUixVEmOLSlL0t//Hit0xJmMpgEIf5xM0l/uV1lYbND+CSAMccN
   fCh44/EtgDwgb9oSwtAEfVcPmPSbyy2VeyolLetn8Mue11zvyS818pLQ3
   WXxD+Dse45zvsWP/5NGRDh1NvISedxHuIwcG36u1FIS/TAFhQvFb+aUxx
   Q==;
X-CSE-ConnectionGUID: Zw/DbWpXShCDqgL8PD5KKg==
X-CSE-MsgGUID: 0WeVJZi2RMifT3kA6E9wOA==
X-IronPort-AV: E=McAfee;i="6600,9927,11057"; a="21182415"
X-IronPort-AV: E=Sophos;i="6.07,239,1708416000"; 
   d="scan'208";a="21182415"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2024 01:37:35 -0700
X-CSE-ConnectionGUID: FOTtmfetTkGbp9IF0raiwQ==
X-CSE-MsgGUID: +87JV+UqS8yoJt2P3d7UWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,239,1708416000"; 
   d="scan'208";a="25919242"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 29 Apr 2024 01:37:34 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s1MVv-00073u-0y;
	Mon, 29 Apr 2024 08:37:31 +0000
Date: Mon, 29 Apr 2024 16:37:16 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.6-1.0.x-imx 4741/11728] /tmp/cc0RDe6t.s:101:
 Error: bad instruction `dc cvac,r9'
Message-ID: <202404291658.dhBHONaP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc 6.6-1.0.x-imx
head:   37770f55ac9c4f6cd958eb5544939207eed8478f
commit: ecf345f453d79979725e6a41fd7f8283835d1fdf [4741/11728] soc: fsl: dpio: enable qbman CENA portal memory access
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20240429/202404291658.dhBHONaP-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240429/202404291658.dhBHONaP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404291658.dhBHONaP-lkp@intel.com/

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
   /tmp/cc0RDe6t.s: Assembler messages:
>> /tmp/cc0RDe6t.s:101: Error: bad instruction `dc cvac,r9'
   /tmp/cc0RDe6t.s:332: Error: bad instruction `dc ivac,r2'
   /tmp/cc0RDe6t.s:360: Error: bad instruction `dc ivac,r7'
   /tmp/cc0RDe6t.s:428: Error: bad instruction `dc ivac,r6'
   /tmp/cc0RDe6t.s:536: Error: bad instruction `dc ivac,r2'
   /tmp/cc0RDe6t.s:566: Error: bad instruction `dc ivac,r6'
   /tmp/cc0RDe6t.s:634: Error: bad instruction `dc ivac,r6'
>> /tmp/cc0RDe6t.s:898: Error: bad instruction `dc cvac,r6'
   /tmp/cc0RDe6t.s:1180: Error: bad instruction `dc cvac,r3'
   /tmp/cc0RDe6t.s:1920: Error: bad instruction `dc cvac,r5'
>> /tmp/cc0RDe6t.s:2217: Error: bad instruction `dc cvac,r7'
   /tmp/cc0RDe6t.s:2278: Error: bad instruction `dc ivac,r6'
>> /tmp/cc0RDe6t.s:3100: Error: bad instruction `dc cvac,r4'
   /tmp/cc0RDe6t.s:3145: Error: bad instruction `dc ivac,r4'
   /tmp/cc0RDe6t.s:3415: Error: bad instruction `dc cvac,r6'
   /tmp/cc0RDe6t.s:3460: Error: bad instruction `dc ivac,r6'
   /tmp/cc0RDe6t.s:3687: Error: bad instruction `dc cvac,r5'
   /tmp/cc0RDe6t.s:3732: Error: bad instruction `dc ivac,r6'
   /tmp/cc0RDe6t.s:3950: Error: bad instruction `dc cvac,r10'
   /tmp/cc0RDe6t.s:3995: Error: bad instruction `dc ivac,r4'
   /tmp/cc0RDe6t.s:4270: Error: bad instruction `dc cvac,r6'
   /tmp/cc0RDe6t.s:4315: Error: bad instruction `dc ivac,r4'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
