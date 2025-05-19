Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02D531A83F9
	for <oe-kbuild-all@lists.linux.dev>; Mon, 19 May 2025 22:47:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747694846; cv=none; b=shmzw32Rwe+m5WWy2G9HxU0Erk1LbcDm4IVdrHPqAmr5h8ThlJl4dajyT4Ic0wi8jrvb3S1byvTPS1e/PF/IDtRHS2BXhHzPzYhjlzr0DJMqv1XlrW0yG0q7uC3fg3PXVElHBCJyY0m8fr5kFcaeljIwu8U6zkcSxzeb8gI8kw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747694846; c=relaxed/simple;
	bh=bE25ZW6R+38LiKtAjLTYEWSDzeFbUDGDztlxBqqw/VY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MJrFOS6N49sYX4szM5lZvOqf1yZqC8f/khPCbWMyS6p0lz2Un+F+bjDUpyGLNChGFq+77V3wJXN78My9c5mgVInMRFnuIDnA6R0cthSi114Ke9KGocxEJ4YGzThtXN6mQcgGHbEKdLStGVS7fjMl5bZy7Yyo0VWAYaw+1qxYq3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IJbFMlOw; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IJbFMlOw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747694845; x=1779230845;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bE25ZW6R+38LiKtAjLTYEWSDzeFbUDGDztlxBqqw/VY=;
  b=IJbFMlOw/ANOZmi4SsWlFUBoeJp2sS/Z57tuMvdnaW28a1/eqRW8ltkd
   vCJ8eLI9YkjjbAbBO7qvLLzzpBJRWK6YFBp2cQ7gOlwFGkHjbtPOZOFt/
   UYpWLu+Km5SvG88mAXGagCL/U63J4jM7Q2am0nIrttZaMUVhe8Vb1kQiP
   6qGkvyDEdNBiuzhB6pQDHGIHLZW0bB53jYA2Yz6rQFslL50Vuh14Y4VZX
   o4psVCXubGqKw1hoW5a2Gz/a4jxbsCZcZ5YtJlLopLSEJBX19oV6R/wxT
   7JzD/MuMvMSv9hOOu3RQ/IzjZfFeREPQTtCdIlOr2AI5B5UkBSO8RD+X/
   Q==;
X-CSE-ConnectionGUID: 3v+Qq0qRQY257fUoetUT6A==
X-CSE-MsgGUID: dEVtHk2FQfGFlJ8dnR54Tw==
X-IronPort-AV: E=McAfee;i="6700,10204,11438"; a="49764438"
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; 
   d="scan'208";a="49764438"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2025 15:47:21 -0700
X-CSE-ConnectionGUID: pAV0NJbsQES7NBX6G693Sw==
X-CSE-MsgGUID: htEGmzKDTQS85YRkyrvNvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; 
   d="scan'208";a="176621208"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 19 May 2025 15:47:19 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uH9GP-000Lxq-18;
	Mon, 19 May 2025 22:47:17 +0000
Date: Tue, 20 May 2025 06:47:04 +0800
From: kernel test robot <lkp@intel.com>
To: Nilay Shroff <nilay@linux.ibm.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-nvme@lists.infradead.org,
	Christoph Hellwig <hch@lst.de>, Hannes Reinecke <hare@suse.de>
Subject: [linux-nvme:nvme-6.16 40/42] drivers/nvme/host/multipath.c:13:6:
 sparse: sparse: symbol 'multipath_always_on' was not declared. Should it be
 static?
Message-ID: <202505200655.rD3it4Yp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.infradead.org/nvme.git nvme-6.16
head:   fc9c5b746e651c57ea8b8d702659db8f2e9847b2
commit: 01e5e7a813c4deafdb4b18ce6623bd693c4d0a57 [40/42] nvme: introduce multipath_always_on module param
config: powerpc64-randconfig-r123-20250520 (https://download.01.org/0day-ci/archive/20250520/202505200655.rD3it4Yp-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 10.5.0
reproduce: (https://download.01.org/0day-ci/archive/20250520/202505200655.rD3it4Yp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505200655.rD3it4Yp-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/nvme/host/multipath.c:13:6: sparse: sparse: symbol 'multipath_always_on' was not declared. Should it be static?

vim +/multipath_always_on +13 drivers/nvme/host/multipath.c

    11	
    12	bool multipath = true;
  > 13	bool multipath_always_on;	/* default is flase */
    14	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
