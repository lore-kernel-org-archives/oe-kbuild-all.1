Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D60C2DB7B7
	for <oe-kbuild-all@lists.linux.dev>; Tue, 30 Jun 2026 21:13:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782853982; cv=none; b=tXZoVx6ZmTZD1IFZyO2jDtB6y3MMh0Hl3azcyvkGQYurpnQ9JtrKwcjysvsHTap42DsENYHNQWj4gQiqcuDtTnGUlp2wxpBVZnjbDKVHWQZzPQ15goV1+L/DZb48h+lI3kee9sMSWWGlL8EXtfZs/ce3Rs7hj8niuNwbtPfoHlU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782853982; c=relaxed/simple;
	bh=ey8atHvbEiuPqz+G0TLFM+Oe0qJVits7UVpTP446u1A=;
	h=Date:From:To:Cc:Subject:Message-ID; b=jTnGiPX/BcqQT1eNFzdnkTORx2q5MwRlSDMlwwi1ASvGN0RMG0oBk2WgXKF9+vyvNEOELXf+5BVy4Fjd8J/i7Bqy6DIjJ55WzD1h5N2u09IDy3nU68V4N7zNsgk4Q5xcD8Cy9HGSJRmGtT8k2TlwoYSP4wspredMYW4zdIvYaKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cb91BUwI; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cb91BUwI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782853981; x=1814389981;
  h=date:from:to:cc:subject:message-id;
  bh=ey8atHvbEiuPqz+G0TLFM+Oe0qJVits7UVpTP446u1A=;
  b=cb91BUwIWInnAfWc5xXCx/or7o18nkz8TRVH7Sm4aHeLnHBYPl6WO2zn
   843+lEEi74FEFN7u3Md9DFNAMLBvnS7nusugU8pEAKIbafcxa1vcuAwTX
   pPMgJI+ndmir5h4xRM0Lvimc+CrCvnMtxmOJzso/ZLwUGIWAlBatIWfpU
   EjcgnRk9X/ymUqIuUadZ1S8TCgu9r0xCvzEsVO1QPoAuguFWuosC5WKO+
   ok0GY7Vk91vYnAV0IRa35JV9UO05GChn/gF4/+iFJhEgyQ53XAenczrqz
   bfx34afG1SeF1sldz0gtWz9MimtnlfqxuJfgu+lUILz4seC/E+8MeEPh1
   A==;
X-CSE-ConnectionGUID: 7cqNcEhTTDysJUP32WtDjQ==
X-CSE-MsgGUID: KKoveZmcQ1eK4f4bHGrGDg==
X-IronPort-AV: E=McAfee;i="6800,10657,11833"; a="101005341"
X-IronPort-AV: E=Sophos;i="6.24,234,1774335600"; 
   d="scan'208";a="101005341"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2026 14:13:01 -0700
X-CSE-ConnectionGUID: 1y4eO/RqTliMZOeBoT6OMQ==
X-CSE-MsgGUID: /1O+UJJWRUiQlAnlDp2dyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,234,1774335600"; 
   d="scan'208";a="290493036"
Received: from igk-lkp-server01.igk.intel.com (HELO e5a8ed462067) ([10.211.93.152])
  by orviesa001.jf.intel.com with ESMTP; 30 Jun 2026 14:13:00 -0700
Received: from kbuild by e5a8ed462067 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1weflJ-000000000Yv-3u1Z;
	Tue, 30 Jun 2026 21:12:57 +0000
Date: Tue, 30 Jun 2026 23:12:28 +0200
From: kernel test robot <lkp@intel.com>
To: Wolfram Sang <wsa-dev@sang-engineering.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [wsa:coccinelle/include_directly 9/9]
 include/linux/find.h:3:2: error: #error "only <linux/bitmap.h> can be
 included directly"
Message-ID: <202606302358.WuIWhPur-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git coccinelle/include_directly
head:   fafe7d3de15901736ce85fc06eb0b9b6d3f447cb
commit: fafe7d3de15901736ce85fc06eb0b9b6d3f447cb [9/9] bitmap: improve header protection
config: x86_64-rhel-9.4-bpf (https://download.01.org/0day-ci/archive/20260630/202606302358.WuIWhPur-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260630/202606302358.WuIWhPur-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606302358.WuIWhPur-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/sched/build_policy.c:62:
>> include/linux/find.h:3:2: error: #error "only <linux/bitmap.h> can be included directly"
       3 | #error "only <linux/bitmap.h> can be included directly"
         |  ^~~~~


vim +3 include/linux/find.h

   > 3	#error "only <linux/bitmap.h> can be included directly"
     4	#endif
     5	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
