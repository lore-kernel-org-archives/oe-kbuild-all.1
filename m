Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36E3A13AA51
	for <oe-kbuild-all@lists.linux.dev>; Mon, 27 May 2024 10:12:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716804739; cv=none; b=jge7RmpWnq6M6oo1CrxEPmZjzryUkAZnLIrySflxZDsZirSAOHQgcEdGNPx/MEKx1liGJdQuUsCzxKTXh46M2YEmcPFTI2q1n0KiHIIzF4pFnan5mU1bC3IZ2eRndCySRvrYxIDEj15X9XhJYE0admg8w8vcE+I8ieIpiSJsQlo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716804739; c=relaxed/simple;
	bh=ESXyQD7xWAogbTols5QXE5mdT0I9i/JrfC4YnSmFF90=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dm/1J7ARi7wayG5Z2Huz+EShX53VztwdwBP2NtrCotH7VQx6Xtx6Y2oIt/u9CtLrEeL6ZzHMnSYiTWPRgn48FOh8FVaMQw4lSzPx+KXJJL0yfo8Qqp3N7q6OgCg8GuKh0L4IDjvIDlUr0DsGdCRo8E3aEA/ync7wLQs54+izt94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aRx5OSEO; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aRx5OSEO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716804738; x=1748340738;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ESXyQD7xWAogbTols5QXE5mdT0I9i/JrfC4YnSmFF90=;
  b=aRx5OSEOm4Siu/u6T3+G+IZS1pCAyUY+m4m2DyU51GX4pnLQrv7/xCc3
   lB0kkxPt9NmOmsUnZd6v2wXovx8tNjwUhsAD4O0RFMm47VZkS+Pw4aC0k
   +Qaskl6s4lp2vNjjsxBkGimmEt0RvVQsTuqct5EEbvOA6tJPMpWdCX+2o
   2JSQzn5AjgI/MjaQl2+FmFNpUGb7bh1OP7jmO5MPBdvzWtShu2LzAUbBN
   d+4hxjWrB5y0gInahsuEYHqMsU43URReF71xQa2uKZ5Tyu9vzRyMK3aJC
   9EHI7HPD3Ds3psvOv7bXLQIPb3JBdbrktpt5Y0yBXCESbH4NYu07G96yb
   A==;
X-CSE-ConnectionGUID: t0pyX6XjRYKkrbQ0wfqTlA==
X-CSE-MsgGUID: sZH/wPdcRaKjb1+SV3mGzQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11084"; a="16903840"
X-IronPort-AV: E=Sophos;i="6.08,192,1712646000"; 
   d="scan'208";a="16903840"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2024 03:12:12 -0700
X-CSE-ConnectionGUID: VeXCrpUsSg+VJjpMvbw4YA==
X-CSE-MsgGUID: qcE7+vloQ3Wc5ZJ9RJ7IUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,192,1712646000"; 
   d="scan'208";a="34786573"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 27 May 2024 03:12:11 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sBXKq-0009yj-2c;
	Mon, 27 May 2024 10:12:08 +0000
Date: Mon, 27 May 2024 18:11:08 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hch-block:block-limits-fixes 5/5] dm-table.c:undefined reference to
 `dm_set_zones_restrictions'
Message-ID: <202405271825.l3phZite-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.infradead.org/users/hch/block.git block-limits-fixes
head:   c16b1a997dfdd3152c214ca533e9795bcf607439
commit: c16b1a997dfdd3152c214ca533e9795bcf607439 [5/5] dm: make dm_set_zones_restrictions work on the queue limits
config: powerpc-powernv_defconfig (https://download.01.org/0day-ci/archive/20240527/202405271825.l3phZite-lkp@intel.com/config)
compiler: powerpc64le-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240527/202405271825.l3phZite-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405271825.l3phZite-lkp@intel.com/

All errors (new ones prefixed by >>):

   powerpc64le-linux-ld: warning: discarding dynamic section .glink
   powerpc64le-linux-ld: warning: discarding dynamic section .plt
   powerpc64le-linux-ld: linkage table error against `dm_set_zones_restrictions'
   powerpc64le-linux-ld: stubs don't match calculated size
   powerpc64le-linux-ld: can not build stubs: bad value
   powerpc64le-linux-ld: drivers/md/dm-table.o: in function `dm_table_set_restrictions':
>> dm-table.c:(.text+0x2f78): undefined reference to `dm_set_zones_restrictions'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
