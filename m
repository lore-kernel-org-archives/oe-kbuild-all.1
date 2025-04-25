Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 882E1A29
	for <oe-kbuild-all@lists.linux.dev>; Fri, 25 Apr 2025 07:40:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745566849; cv=none; b=C/VWt6gOa9rQYxx2+9/nbxeKDAxo8LBEayN7wor0DysRBhuLyeaOaw2jsrk0T5tMBiFUMFqwnIsoiayPOTKbq+cj1iQ3UiJt6/2VpAReXfD1j604YZQRS6OCc6x5e5px7TiAmoorwip912ES9F/71gExrmODyl0pVgyNaZmTWV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745566849; c=relaxed/simple;
	bh=OgYqjQFAYFe+MG7/mmhLkgl5z+ZYaPMprDRKzFwyElQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=K9opqRXhQAjWuplqXBeCCgh0SjuJ2LgW0jEH5eWBV05/o3ZFQlQF1ETPOJqsGbdL7Z+jxmeQAvL7mS5lCWosvYlMY5h65GGQR2Xw+qSGDCdgY7tY2e7iA9LfUzbdtUgb6XKdSM0ceJ6IdXaKHxezDbyAuMHOyJSphIFLdmqzfqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mSFBX2TW; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mSFBX2TW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745566848; x=1777102848;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OgYqjQFAYFe+MG7/mmhLkgl5z+ZYaPMprDRKzFwyElQ=;
  b=mSFBX2TW7JNQJOUtwgNgoRsXxSbBoOg6SwvPVEPXiEJ11YX6CiN0ecIW
   iIpOdifJz6mOlfrlwwGtpBZ1i+7Lh6Xjf8GJ8cGpHyT/UwPunNzkUgKQJ
   yeCC9DS3+yJeyPiSyG2oR7ASB8dLvO7PlSYkb/LljieYcYerzMBO58YcY
   sV0135qh7At6sXXvFBKVhoGPZGpvQqWSljVABzZpV/zKKaAj2NyfPke9Q
   hmtPW254gVXD0pMOYu70EW/Gp44COf2f5HQmf4PkPukd4YR9YPYRzxnd8
   d9EkY97pJDdT0/Po3nr+iGIh1Di+LClyr538bPCZoZNYndnGNMHf0h8Hm
   Q==;
X-CSE-ConnectionGUID: 5wgNr71MTiGAHTiyAlRn3g==
X-CSE-MsgGUID: tgp04NE/RseYN+bCjGnedA==
X-IronPort-AV: E=McAfee;i="6700,10204,11413"; a="69715172"
X-IronPort-AV: E=Sophos;i="6.15,238,1739865600"; 
   d="scan'208";a="69715172"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2025 00:40:47 -0700
X-CSE-ConnectionGUID: jWJLua1VTF6iMnJPaqtJEw==
X-CSE-MsgGUID: bPNyqX3oQgexia/cowkkhg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,238,1739865600"; 
   d="scan'208";a="137641878"
Received: from lkp-server01.sh.intel.com (HELO 050dd05385d1) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 25 Apr 2025 00:40:46 -0700
Received: from kbuild by 050dd05385d1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u8Dfv-0004vF-1w;
	Fri, 25 Apr 2025 07:40:43 +0000
Date: Fri, 25 Apr 2025 15:39:51 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 12/12] mm/page_alloc.c:326:15: sparse:
 sparse: symbol 'free_highatomics' was not declared. Should it be static?
Message-ID: <202504251509.aomzX42J-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   9743210ec01376066493e38c624a7ad34c8dcd65
commit: 9743210ec01376066493e38c624a7ad34c8dcd65 [12/12] BACKPORT: mm/page_alloc: keep track of free highatomic
config: i386-randconfig-r123-20250425 (https://download.01.org/0day-ci/archive/20250425/202504251509.aomzX42J-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250425/202504251509.aomzX42J-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504251509.aomzX42J-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   mm/page_alloc.c:194:1: sparse: sparse: symbol 'restrict_cma_redirect' was not declared. Should it be static?
   mm/page_alloc.c:1382:25: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected restricted int flags @@     got restricted fpi_t [usertype] fpi_flags @@
   mm/page_alloc.c:1382:25: sparse:     expected restricted int flags
   mm/page_alloc.c:1382:25: sparse:     got restricted fpi_t [usertype] fpi_flags
   mm/page_alloc.c:1390:25: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected restricted int flags @@     got restricted fpi_t [usertype] fpi_flags @@
   mm/page_alloc.c:1390:25: sparse:     expected restricted int flags
   mm/page_alloc.c:1390:25: sparse:     got restricted fpi_t [usertype] fpi_flags
>> mm/page_alloc.c:326:15: sparse: sparse: symbol 'free_highatomics' was not declared. Should it be static?
   mm/page_alloc.c:913:31: sparse: sparse: cast from restricted fpi_t
   mm/page_alloc.c:913:31: sparse: sparse: cast from restricted fpi_t
   mm/page_alloc.c:913:31: sparse: sparse: cast from restricted fpi_t
   mm/page_alloc.c:913:31: sparse: sparse: cast from restricted fpi_t
   mm/page_alloc.c:2740:6: sparse: sparse: context imbalance in 'free_unref_page' - different lock contexts for basic block
   mm/page_alloc.c:2887:17: sparse: sparse: context imbalance in 'free_unref_page_list' - unexpected unlock
   mm/page_alloc.c:913:31: sparse: sparse: cast from restricted fpi_t
   mm/page_alloc.c:3117:20: sparse: sparse: context imbalance in 'rmqueue_pcplist' - different lock contexts for basic block
   mm/page_alloc.c:4869:9: sparse: sparse: context imbalance in '__alloc_pages_bulk' - different lock contexts for basic block

vim +/free_highatomics +326 mm/page_alloc.c

   325	
 > 326	unsigned long free_highatomics[MAX_NR_ZONES] = {0};
   327	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
