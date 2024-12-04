Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9647A18A6C4
	for <oe-kbuild-all@lists.linux.dev>; Wed,  4 Dec 2024 09:56:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733306173; cv=none; b=il/wBbu04UodYgSoK00vWoA/wxtU29WkRwUivLym6OYtDXRfG6iXQJ7Q3UINEHzhC1Fhg9NEVM35BeofWa0YjpFM7QVD25/gkTCIaOYHfOg7SxA9MvSKNGArOzWj7z9tPqQoeMnPIgPHw0mXn/s6W9AgHtUDJXDI+c502bUxpxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733306173; c=relaxed/simple;
	bh=558nlV72SMDrpnv9u5l0WTr4CWoEBbuPNUD668fPGRI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ObKwDiK8OAc++ofh9O9+Cagxp4xR6JZWhtHAGi/E8Z/Mv4mFK+3JIWW8j6R3VAcFEq55EbxNym4t37pYhf/Tn162uAid+v+DyV6q9Prpy/9oRwZFgSWzr5qXfc/I+g0a+yRfquYCxrDDNg6FeTn4/K9etH8rmy85J2DZIERgZUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OPKqKy1D; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OPKqKy1D"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733306171; x=1764842171;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=558nlV72SMDrpnv9u5l0WTr4CWoEBbuPNUD668fPGRI=;
  b=OPKqKy1D/m1VZAokkW6S8/yANI7zvtogdW6l1DqZg6rrvV6ZYgJZE01F
   pPX0qWO29DzAVCpWCaIhno+ULetq8fTPPYYGXH2NRZaDELDUYcmTsv/M+
   GAl+F6z1yqHQ/RscnaCYSn8+KB/eD/Bw0zU8fT6SAXuNjcOOxOZLLpco4
   YuS6538PVhyS/Ee3nHp57ONlGR7xe86jBs36nqWkp7rULG9+tjo8V2NDG
   k3QbrWjK2wHkzR9tJNadej7U6x8FRVYR5iz6jZ46fOCAgLonXyM+IkKtJ
   Vu8j23i6Istc1v1CXPh5z75D4MU2XaaZ4yAOO7EyjhhngtlKgF+GPNOx6
   w==;
X-CSE-ConnectionGUID: u2Ob8PGFTnqdtb4rasZe1A==
X-CSE-MsgGUID: 1VbX8HoUTWewNCjbI5kcsg==
X-IronPort-AV: E=McAfee;i="6700,10204,11275"; a="32923199"
X-IronPort-AV: E=Sophos;i="6.12,207,1728975600"; 
   d="scan'208";a="32923199"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2024 01:56:10 -0800
X-CSE-ConnectionGUID: SaxHeL5UQLm9rUer1zJypg==
X-CSE-MsgGUID: 9S2Hoy1WTEqwHkZq3eByuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,207,1728975600"; 
   d="scan'208";a="93608466"
Received: from lkp-server02.sh.intel.com (HELO 1f5a171d57e2) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 04 Dec 2024 01:56:09 -0800
Received: from kbuild by 1f5a171d57e2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tIm6w-0002qv-1J;
	Wed, 04 Dec 2024 09:56:00 +0000
Date: Wed, 4 Dec 2024 17:55:49 +0800
From: kernel test robot <lkp@intel.com>
To: Matthew Wilcox <willy@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [willy-pagecache:shrunk-page 57/83] mm/zsmalloc.c:449:20: warning:
 function 'is_first_zpdesc' is not needed and will not be emitted
Message-ID: <202412041726.PxBkFbuL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.infradead.org/users/willy/pagecache shrunk-page
head:   9f845f82473f9b65c326afa7f81c70b7e27f02a9
commit: b19fdb3a0ac16a88851e63449dfeedb21aee7c19 [57/83] mm/zsmalloc: use zpdesc in trylock_zspage()/lock_zspage()
config: x86_64-randconfig-r061-20241204 (https://download.01.org/0day-ci/archive/20241204/202412041726.PxBkFbuL-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241204/202412041726.PxBkFbuL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412041726.PxBkFbuL-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from mm/zsmalloc.c:49:
   In file included from include/linux/highmem.h:8:
   In file included from include/linux/cacheflush.h:5:
   In file included from arch/x86/include/asm/cacheflush.h:5:
   In file included from include/linux/mm.h:2223:
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> mm/zsmalloc.c:449:20: warning: function 'is_first_zpdesc' is not needed and will not be emitted [-Wunneeded-internal-declaration]
     449 | static inline bool is_first_zpdesc(struct zpdesc *zpdesc)
         |                    ^~~~~~~~~~~~~~~
   2 warnings generated.


vim +/is_first_zpdesc +449 mm/zsmalloc.c

   448	
 > 449	static inline bool is_first_zpdesc(struct zpdesc *zpdesc)
   450	{
   451		return PagePrivate(zpdesc_page(zpdesc));
   452	}
   453	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
