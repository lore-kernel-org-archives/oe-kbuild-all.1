Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11A9316CD12
	for <oe-kbuild-all@lists.linux.dev>; Wed, 24 Jul 2024 20:26:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721852799; cv=none; b=e5eV2br3muDbIVtD7YcV+G2gd8cBx4CeG+Z47pXg6gRdpQFXQozkgceysrzfunqH/rhZc77hMLzuKWVO6TVILcQh8JTurwsNNnX9NNDqOPzT/n0JM6mCC1QEBVVo1YEMtyWyJhXxCIc8zufN998cGKqjOXRtvukfA/DalSmq7Xw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721852799; c=relaxed/simple;
	bh=FHnNh7CTalWvRmtTMTlb1zw8wnDSB36ArnoDjO0qJVw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Wy1Jt/lSOnhLuIs0DEQECvmGUFsbyUqIq4eJNKfZgcz2Zh2Nig/DiH6k3hbuJ29e1ZpQeoRVGWOT1ejU5pTGpZgKKiN9uVe8nGilWfIR1gu3bl5wRm/ptegB4iOR2mB/GOth1OC21fjVPSCN7ZZ7ndM4DTqfj3AN5LddsGLfhgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VauL62la; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VauL62la"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721852798; x=1753388798;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FHnNh7CTalWvRmtTMTlb1zw8wnDSB36ArnoDjO0qJVw=;
  b=VauL62laELxMxht2usN+s6sNR8q3zmQmO26s8s1HlwC7R5vyC37HxRU5
   jLb05HqEh83jAKERWwNDomMRBmL1DCYqnopXS/L0pbun51Tw9w7uuq1EM
   QQOIoe/MGMOl8XSCE5TolhO77Az88iVUHTfM9f1kpHrjeNN9fgE3IpuOz
   DKqzVeDNRrHf5Yfb3UeqK6s6A4lDPp4Uve1bK1gSo23lrcm78hM6N3zif
   K4W1LqpETVOQzVIXQL+noMnqKNkUMla5L6bvjPJ2NbG5COGcmOoWgY2va
   /Aj/5AaUwYcbAJHDM4M7nSpbXmORmA1nGXx4OdZJRqXs7ScILoROmUGtJ
   Q==;
X-CSE-ConnectionGUID: 3+HUthIrRdmPu22E/mfctw==
X-CSE-MsgGUID: oUezUWGKQQafLwJckW9SuQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11143"; a="30949840"
X-IronPort-AV: E=Sophos;i="6.09,233,1716274800"; 
   d="scan'208";a="30949840"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jul 2024 13:26:38 -0700
X-CSE-ConnectionGUID: 830faRnISxWBWKLIJ06Dtg==
X-CSE-MsgGUID: tnjdWEAiTm+FR00G+v1stA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,233,1716274800"; 
   d="scan'208";a="52620131"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 24 Jul 2024 13:26:36 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sWiZG-000nP7-0i;
	Wed, 24 Jul 2024 20:26:34 +0000
Date: Thu, 25 Jul 2024 04:25:52 +0800
From: kernel test robot <lkp@intel.com>
To: Elena Reshetova <elena.reshetova@intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
Subject: [intel-tdx:guest-filter 29/36] arch/parisc/include/asm/io.h:143:22:
 error: passing argument 1 of 'ioremap_prot' makes integer from pointer
 without a cast
Message-ID: <202407250401.sRwIW6r1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/tdx.git guest-filter
head:   2f2a140aaf04ba58f289ad0d6484ca1df92fbf04
commit: 7052019eb3591061228a2ca4d91f197ebdfa69b0 [29/36] asm/io.h: Add ioremap_cache_shared
config: parisc-allnoconfig (https://download.01.org/0day-ci/archive/20240725/202407250401.sRwIW6r1-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240725/202407250401.sRwIW6r1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407250401.sRwIW6r1-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/io.h:13,
                    from include/linux/irq.h:20,
                    from arch/parisc/include/asm/hardirq.h:13,
                    from include/linux/hardirq.h:11,
                    from include/linux/interrupt.h:11,
                    from include/linux/pci.h:38,
                    from lib/devres.c:3:
   lib/devres.c: In function '__devm_ioremap':
>> arch/parisc/include/asm/io.h:143:22: error: passing argument 1 of 'ioremap_prot' makes integer from pointer without a cast [-Wint-conversion]
     143 |         ioremap_prot((addr), (size), _PAGE_IOREMAP)
         |                      ^~~~~~
         |                      |
         |                      void *
   lib/devres.c:42:24: note: in expansion of macro 'ioremap_uc'
      42 |                 addr = ioremap_uc(offset, size);
         |                        ^~~~~~~~~~
   In file included from arch/parisc/include/asm/io.h:279:
   include/asm-generic/io.h:1053:40: note: expected 'phys_addr_t' {aka 'unsigned int'} but argument is of type 'void *'
    1053 | void __iomem *ioremap_prot(phys_addr_t phys_addr, size_t size,
         |                            ~~~~~~~~~~~~^~~~~~~~~
   arch/parisc/include/asm/io.h:128:22: error: called object is not a function or function pointer
     128 | #define ioremap_prot ioremap_prot
         |                      ^~~~~~~~~~~~
   arch/parisc/include/asm/io.h:143:9: note: in expansion of macro 'ioremap_prot'
     143 |         ioremap_prot((addr), (size), _PAGE_IOREMAP)
         |         ^~~~~~~~~~~~
   lib/devres.c:42:24: note: in expansion of macro 'ioremap_uc'
      42 |                 addr = ioremap_uc(offset, size);
         |                        ^~~~~~~~~~


vim +/ioremap_prot +143 arch/parisc/include/asm/io.h

   129	
   130	#define _PAGE_IOREMAP (_PAGE_PRESENT | _PAGE_RW | _PAGE_DIRTY | \
   131			       _PAGE_ACCESSED | _PAGE_NO_CACHE)
   132	
   133	#define ioremap_wc(addr, size)  \
   134		ioremap_prot((addr), (size), _PAGE_IOREMAP)
   135	
   136	/* Share memory with host in confidential guest platforms */
   137	#define ioremap_driver_hardened \
   138		ioremap_prot((addr), (size), _PAGE_IOREMAP)
   139	/* Share memory with host in confidential guest platforms (WB version) */
   140	#define ioremap_cache_shared \
   141		ioremap_prot((addr), (size), _PAGE_IOREMAP)
   142	#define ioremap_uc \
 > 143		ioremap_prot((addr), (size), _PAGE_IOREMAP)
   144	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
