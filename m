Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 364BC43785D
	for <oe-kbuild-all@lists.linux.dev>; Fri, 11 Sep 2026 10:35:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789122949; cv=none; b=OghPdadTZT9xVtqNQrh12CzCtBAewjsLtvYFMvQuZ2FHU024yBG+LPLl3VKqfpbfdZ9vki868Fbtj7a7LRPHWgm1v3JhMYlr9FZF/Z1NmkIZ16+W3iM+YeR+vAbccWGlQaVM7r+yx15Nwgi2fCzoMiJOHrmJIoq5395NIhruZsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789122949; c=relaxed/simple;
	bh=lrnazVp/SD3/20Y59jXuW4zDTFuCRsbXod7wBp65hjg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Wnjbt6FoWVcD1i5XBzHkM6oo61t4tZYqEby1/YuZ+mnBZJDv+W/LUvOn10pZp0hxgztdylroDSl1m9ttoH3z7MSDSmWHZVOm3xDymcCKibf3/WutdHi4sBv/svjhkEMlVAzGFWgVTXmkbQp8nGnItu6SQzgNBJh59GYHLwY6e1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SL9ovgYZ; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SL9ovgYZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789122944; x=1820658944;
  h=date:from:to:cc:subject:message-id;
  bh=lrnazVp/SD3/20Y59jXuW4zDTFuCRsbXod7wBp65hjg=;
  b=SL9ovgYZjGe1f3m9lLgUtwkBrhB9G3RhuKk9i7ZF3FTpvwmT9aPsFau1
   dmP6c5RXfQwyLNDC4q1xS4CA8KliVlWN9texG6e7xRoCpEe7CEAsx4MjO
   5M5A1hO3m90BWUzgsOHmWaNhmLedxSeg/5Jyr9uEAv+pPTbllGcR4zlB3
   pkPfjWYZu7w9Uo+uEQCmAsbeGdIZ9hRYbnfLdqGMbbO4WXUexhM54hiKh
   yUuxBMjXG1sv1gb7kHfhr5bx35FzmZegF9KCtJZUHSsAdoQLcTsekKWYf
   1/J77L8UB4tkM1zV0b42w3ndpwT+Rm/VVju0syOQH5GlZNGo+4Oyv5jzT
   Q==;
X-CSE-ConnectionGUID: AnHUTRB9QoCUcI+QybDyNA==
X-CSE-MsgGUID: Bx1c3vrzRvCC2USzN3YidQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11901"; a="89349758"
X-IronPort-AV: E=Sophos;i="6.27,97,1787036400"; 
   d="scan'208";a="89349758"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2026 03:35:42 -0700
X-CSE-ConnectionGUID: WH5c/w5NR2OGvu+Dwv+G6A==
X-CSE-MsgGUID: ApX0g8zhQmm2uBspUA3G/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,97,1787036400"; 
   d="scan'208";a="273820274"
Received: from lkp-server02.sh.intel.com (HELO 0a3643a6ed9d) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 11 Sep 2026 03:35:41 -0700
Received: from kbuild by 0a3643a6ed9d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x4ybS-000000001Qs-3JV8;
	Fri, 11 Sep 2026 10:35:34 +0000
Date: Fri, 11 Sep 2026 18:33:54 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hch-xfs:xfs-crc 41/51] ld.lld: error: undefined symbol:
 crc64_nvme
Message-ID: <202609111815.bENd8pzM-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   git://git.infradead.org/users/hch/xfs xfs-crc
head:   c139b7471104b8928a7f979d91155590ba5e0c2f
commit: a3541e107e1a5696771cc913bdefd2c3721bff4e [41/51] xfs: core RT data checksum support
config: i386-buildonly-randconfig-004-20260911 (https://download.01.org/0day-ci/archive/20260911/202609111815.bENd8pzM-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260911/202609111815.bENd8pzM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609111815.bENd8pzM-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: crc64_nvme
   >>> referenced by usercopy_32.c
   >>>               vmlinux.o:(xfs_csum_verify)
   >>> referenced by usercopy_32.c
   >>>               vmlinux.o:(xfs_csum_generate)

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
