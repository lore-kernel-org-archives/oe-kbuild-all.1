Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 556B0223DE7
	for <oe-kbuild-all@lists.linux.dev>; Sat, 13 Jun 2026 04:34:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781325259; cv=none; b=ifK1ONW+yxIucSoq17AMs+SD49VOf5nsJL3Vao+ixugiEeYbHKi8865daBLwgnCb0hZO5Nb/xK2rtkS0aicWtHwAp1HEIG7qioFrDRb8IwxLIFgItKI0aWDIh3XWWWVRBxvZxq6XK/U39LNkwLurrmmeiZJqfLqTw20tFszdHgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781325259; c=relaxed/simple;
	bh=iAR9DwHwjEqtJHiNbedbjc8V97NFHUAm50Ekn/+ECcY=;
	h=Date:From:Cc:Subject:Message-ID; b=IoAVmJItgbfGGatX2sjPYXHWJsCOFU7lerypC+gkdx5RmeUFw59GQ5ldNBBIhOM8yARES97JwGm9EBX4dPsta+99ZhWrkbZaMMV1Xi6C19He02V8eFtQF0KRWq3CU/UgbjGcf0JT5tKOWo3mPSh2izXL4P2Iyg57yhcOdCONpqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FCTpymJv; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FCTpymJv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781325258; x=1812861258;
  h=date:from:cc:subject:message-id;
  bh=iAR9DwHwjEqtJHiNbedbjc8V97NFHUAm50Ekn/+ECcY=;
  b=FCTpymJvBdqU5MLMIPYQXJKvGZSu6A2qgNMyID5RWkOm42qhdnOqWP9L
   d1ORx5vR8ha9Y6PMtNFdqAR4ZtOwdf+rTM431fh4ZaPQB5aBF3iXivrp5
   voybVRX7825YPx/tO0+27fuI+V7RSVasPinHUlZNoQ53DeMc0TO3aAuec
   lLNe+QB5Copnifoxto9xRYff/ETghuGuKqaZQw1DvU7c+n0WoapONjLUD
   WKC7+CJn/yXusCEYNdZ5H/R9SyI76tFC3iXl2PvEQiWvMdr4lPpmG9bpP
   2xtr0j8GmTID4lGdSbh3KNN8QnVe8tdS8xLRckQFEilZQRDaHZx/VgIgQ
   w==;
X-CSE-ConnectionGUID: tB210fTWTp+LH3TrF09jLA==
X-CSE-MsgGUID: QPuy/+/JRDKCPPhL5nv12w==
X-IronPort-AV: E=McAfee;i="6800,10657,11815"; a="69700101"
X-IronPort-AV: E=Sophos;i="6.24,201,1774335600"; 
   d="scan'208";a="69700101"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2026 21:34:18 -0700
X-CSE-ConnectionGUID: +Gi++3LoSRiZ+lprpC7wGQ==
X-CSE-MsgGUID: 9WXzcw7VS0ON60sxXc6kDw==
X-ExtLoop1: 1
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by fmviesa003.fm.intel.com with ESMTP; 12 Jun 2026 21:34:17 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wYG4U-000000004Qr-3Ef3;
	Sat, 13 Jun 2026 04:34:14 +0000
Date: Sat, 13 Jun 2026 06:33:19 +0200
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [intel-lts:6.12/android_v 1/1]
 ./include/linux/huge_mm.h:109:25: error: initializer element is not constant
Message-ID: <202606130609.QFELRqUv-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel/linux-intel-lts.git 6.12/android_v
head:   68a638ff668a1d42dda25aab102975b86d6fc10b
commit: e3489f30ee7b813b09cc8c960f17a0ce0371ade9 [1/1] ANDROID: mm: Added early_param pcp_thp_order
config: powerpc64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260613/202606130609.QFELRqUv-lkp@intel.com/config)
compiler: powerpc64-linux-gnu-gcc (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260613/202606130609.QFELRqUv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606130609.QFELRqUv-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from ./include/linux/mm.h:1226,
                    from mm/page_alloc.c:19:
>> ./include/linux/huge_mm.h:109:25: error: initializer element is not constant
     109 | #define HPAGE_PMD_ORDER (HPAGE_PMD_SHIFT-PAGE_SHIFT)
         |                         ^
   mm/page_alloc.c:603:51: note: in expansion of macro 'HPAGE_PMD_ORDER'
     603 | static unsigned int pcp_thp_order __read_mostly = HPAGE_PMD_ORDER;
         |                                                   ^~~~~~~~~~~~~~~


vim +109 ./include/linux/huge_mm.h

b979db1611a63b2 Peter Xu         2024-03-27  108  
b979db1611a63b2 Peter Xu         2024-03-27 @109  #define HPAGE_PMD_ORDER (HPAGE_PMD_SHIFT-PAGE_SHIFT)
b979db1611a63b2 Peter Xu         2024-03-27  110  #define HPAGE_PMD_NR (1<<HPAGE_PMD_ORDER)
fde52796d487b67 Aneesh Kumar K.V 2013-06-05  111  #define HPAGE_PMD_MASK	(~(HPAGE_PMD_SIZE - 1))
b979db1611a63b2 Peter Xu         2024-03-27  112  #define HPAGE_PMD_SIZE	((1UL) << HPAGE_PMD_SHIFT)
71e3aac0724ffe8 Andrea Arcangeli 2011-01-13  113  

:::::: The code at line 109 was first introduced by commit
:::::: b979db1611a63b207dbc47706de989ac113ea898 mm: make HPAGE_PXD_* macros even if !THP

:::::: TO: Peter Xu <peterx@redhat.com>
:::::: CC: Andrew Morton <akpm@linux-foundation.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
