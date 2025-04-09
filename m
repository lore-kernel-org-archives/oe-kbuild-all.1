Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5B7CB67E
	for <oe-kbuild-all@lists.linux.dev>; Wed,  9 Apr 2025 00:39:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744159166; cv=none; b=fWy1wlehUTlXwaFfuP3627WAJM0O4+enoSQyRYz1q86ZvCSdONlz64+KgJLNeFWpMEW7LzV+lWlbEcqj0QzvaBRNSLFLrB6CBwzFe3xIP1G3ceIkHW1fN42l/JJ8plSTiLLLe2tn2uLuf5EK0rPxPu3yog5sd1ZUyXDkil9WZoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744159166; c=relaxed/simple;
	bh=x5JRWmXlN6Ck9boVR9HOmeNypCiGti0VgqEMvmHs+K8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pQSPwK9ksQMPqGWWlsnE6a+vXVpTg51a54phMQ8bclgxZN8QrV0q22sAJd30O1xoRC6PPzcTdTKsj9Zd/2prb3HAPQMQZYqzkFu+IG9ZIXpQX1I4UFWhA+Oe+jske/dditwYTv9SWEd7cFyrQCAlsq3nC0l0b5ULPDMPoxZB22E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ABM/ccV9; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ABM/ccV9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744159164; x=1775695164;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=x5JRWmXlN6Ck9boVR9HOmeNypCiGti0VgqEMvmHs+K8=;
  b=ABM/ccV9Myidst1exFD2yRFhXHKP9pHn1yABjtxENXoYdnLNLWTQGang
   /WA966ZKLLSeZCoi6DxSSekQf4q+t+c9D9arnRzBeBdsRGV6F43NNNPhY
   Qs6KGmOqBvH8+jQ3fXiLb5sVPYsUo8B4ycPdTySIUiD/bju8wgFchcpjM
   yvCccw3onzYJHkFoZIPpcP0WWkKdw8E735d8Tsub2Eg/3Ch/B7i41OCbm
   fCboDkEtgiTxkapjSxZ3WT8L06bFlT5KB8VselBK6IiQj29znyRr2IGn3
   36+8mvF9+N7hQpJbJRMsAGieGHSYAwqZ7ejrgz8A9/KQluWlSiQ9RFJ8F
   g==;
X-CSE-ConnectionGUID: UneqlhxHRr21tlw/+zRRiQ==
X-CSE-MsgGUID: ZQ216AYmRlecSfNPYWZO3A==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="44758243"
X-IronPort-AV: E=Sophos;i="6.15,199,1739865600"; 
   d="scan'208";a="44758243"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2025 17:39:23 -0700
X-CSE-ConnectionGUID: h+Zsyl/TRYKii7mgz/Kq9Q==
X-CSE-MsgGUID: QdvRR4hySNOJC3fOMn6pyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,199,1739865600"; 
   d="scan'208";a="133407277"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 08 Apr 2025 17:39:22 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u2JTL-000883-1e;
	Wed, 09 Apr 2025 00:39:19 +0000
Date: Wed, 9 Apr 2025 08:38:52 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6-2025-04 1/1]
 arch/arm/mm/ioremap.c:135:2: warning: 'memcpy': specified size between
 4294967272 and 4294967295 exceeds maximum object size 2147483647
Message-ID: <202504090851.pYtFM32S-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6-2025-04
head:   c22e4d8c41dad7ec526fba8bc1d09f6c5f0e7770
commit: 1359fd9eae29490c542e17c107cb41cfb8463138 [1/1] ARM: 9429/1: ioremap: Sync PGDs for VMALLOC shadow
config: arm-randconfig-003-20250409 (https://download.01.org/0day-ci/archive/20250409/202504090851.pYtFM32S-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250409/202504090851.pYtFM32S-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504090851.pYtFM32S-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In function 'memcpy_pgd.constprop',
       inlined from '__check_vmalloc_seq' at arch/arm/mm/ioremap.c:145:3:
>> arch/arm/mm/ioremap.c:135:2: warning: 'memcpy': specified size between 4294967272 and 4294967295 exceeds maximum object size 2147483647 [-Wstringop-overflow=]
     memcpy(pgd_offset(mm, start), pgd_offset_k(start),
     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
            sizeof(pgd_t) * (pgd_index(end) - pgd_index(start)));
            ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/memcpy +135 arch/arm/mm/ioremap.c

   130	
   131	static void memcpy_pgd(struct mm_struct *mm, unsigned long start,
   132			       unsigned long end)
   133	{
   134		end = ALIGN(end, PGDIR_SIZE);
 > 135		memcpy(pgd_offset(mm, start), pgd_offset_k(start),
   136		       sizeof(pgd_t) * (pgd_index(end) - pgd_index(start)));
   137	}
   138	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
