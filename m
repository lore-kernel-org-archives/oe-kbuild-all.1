Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CAE6352030
	for <oe-kbuild-all@lists.linux.dev>; Sun,  4 Oct 2026 06:47:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791096461; cv=none; b=tjKrZohoFMi0EMDsMG1QdZ+BsiUZDlzlLQh8cmRMRspraXbytRH9pOfCLLpsiHXsPcsHHkPEvbs5pW05McACSW9Z4QfWYH+xDUVwDvLAxtS2OqhXbgo6VpKjBQ0SmgEy99PPF8jCnOTNAitmX6cyfO7eoKdn/SgsQlddb6et93I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791096461; c=relaxed/simple;
	bh=dvg8Im9dTGpINX+SDsCDRtEQ247NEdgcwsoC4LtJOxw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=uvw+Mr0d0MI80yDLxwQ7YKPqRBQVtOJJcMwilePV3lOGUiiIj+nJoI13Cpyis0Q2+fpMtHhhxcTV6+Rc9sweLoU99zNxXXt+Np95X7isbaedqnFxYThO1ArbCHTsN/A798jBWZ8EdsdGL83bWAKs0tmKzJMjVNpoIRJAVFrEkVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RgOwQekt; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RgOwQekt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791096459; x=1822632459;
  h=date:from:to:cc:subject:message-id;
  bh=dvg8Im9dTGpINX+SDsCDRtEQ247NEdgcwsoC4LtJOxw=;
  b=RgOwQektcFIp8k03q0LnIGAcji9BCCa6W83aEowNq95cIFaCsxHChj7Z
   RNykQ/HMjrrQrWm0nZFH8cL1vO/QdAbgy3F16gn5+g6SlZpJ0vrDThsXS
   z8ChD0mKe9lDB7dm1nN8dmGzQUGHNVTW2oP04EYeziFiS6nI8dBYWpl9K
   rVzxsQoWYd3kHWpVrnywkxSD+Xsv5bS7Y9QMmprLWSftCHi8+Tzw12kL8
   +GzFGnMNJiiFIE/2+bmYk5jWBc4+SNOJHzEk5cDKApyKTHLao32Ygu9fP
   c8B3+l9JYCuD+pREABxFhI3U5mAFcOa7lcXYRG6zwfQlBxX13bvRyi5vh
   Q==;
X-CSE-ConnectionGUID: rfpKO8aoRLeTK00QFQgYFA==
X-CSE-MsgGUID: o0IhHk8jQcODUu435aWRxQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11924"; a="91662474"
X-IronPort-AV: E=Sophos;i="6.27,139,1787036400"; 
   d="scan'208";a="91662474"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2026 23:47:37 -0700
X-CSE-ConnectionGUID: Jm7bU3rRRiy3/yp+4Zzobg==
X-CSE-MsgGUID: 8E0SIKW4Sambt/x/f1iE7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,139,1787036400"; 
   d="scan'208";a="275203132"
Received: from igk-lkp-server01.igk.intel.com (HELO 3a02ec7efc9f) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 03 Oct 2026 23:47:35 -0700
Received: from kbuild by 3a02ec7efc9f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xDG0S-000000000Dz-35Lh;
	Sun, 04 Oct 2026 06:47:32 +0000
Date: Sun, 04 Oct 2026 08:47:14 +0200
From: kernel test robot <lkp@intel.com>
To: Michael Walle <mwalle@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
 Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [linux-next:master 2553/14185] Warning:
 drivers/mtd/spi-nor/sfdp.c:417 function parameter 'bfpt' not described in
 'spi_nor_post_bfpt_fixups'
Message-ID: <202610040802.yD5XKM5i-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   f0406245cb9855e6318335a8a223551354291a46
commit: 69d9d7dabbebd91cd8aba4e23caabe9b34d2722c [2553/14185] mtd: spi-nor: move spi_nor_post_bfpt_fixups() into sfdp
config: x86_64-randconfig-r2101-20261004 (https://download.01.org/0day-ci/archive/20261004/202610040802.yD5XKM5i-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261004/202610040802.yD5XKM5i-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610040802.yD5XKM5i-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/mtd/spi-nor/sfdp.c:417 function parameter 'bfpt' not described in 'spi_nor_post_bfpt_fixups'
>> Warning: drivers/mtd/spi-nor/sfdp.c:417 function parameter 'bfpt' not described in 'spi_nor_post_bfpt_fixups'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
