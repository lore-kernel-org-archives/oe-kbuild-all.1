Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 897AE13A3F0
	for <oe-kbuild-all@lists.linux.dev>; Sat, 14 Sep 2024 07:40:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726299654; cv=none; b=gwm+WhOybPrVwk4wqRcp1XVPU6ZYwEGPZVOtACa4st68EfaTTC+Chxc/j2mIRbyDyWDZYh/VhIWjpW0qbNkRI7KhuU8DB9BFOpSwsqFuJxC9hEkCqi/z95RvPL8UwyEjmlVD+GZ1Y3Ylxp+ln4zvC1zdy+QPjGkOHg4ssk4MT5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726299654; c=relaxed/simple;
	bh=6TVOCPKXL+yI9IFKhOfOruHrpAAgXmmkSzo9JZQpyUY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YwJhPo1wTmg63PCCrW/pF6hELtLiCr17FOwczOKcSnLYI9ADdwe2N0O68qtg996PHS42XllGWujFVgFW2brGfgjdFe2cWMdeLvvM4SyZYfdG3BqQFi7B4Aiz5YrY0NhRTmdWGSV2pWf5KKjysY0EYKcfXUysB1YB05lJsRQ2BzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GRT6RXO0; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GRT6RXO0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726299653; x=1757835653;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6TVOCPKXL+yI9IFKhOfOruHrpAAgXmmkSzo9JZQpyUY=;
  b=GRT6RXO0yFnI0HJmFKLn2yyk2La43qeQsp3yTs6oglDcyifQYU3C2CIa
   yaSrW7iVnIBlDalZD0qzEvi8aRtWZYvBjFitNF71A9lTZ14Ov4M0ShnVG
   uqzXCJwck6+TG6iMZgA00TxyF1m1JnW+nBNK+yaq5fA5PyKlc/CgEYPFY
   pw5ackRvZk7WexbU9qYdKMJmSTNzguJ5OCypNcDVrqnEImlFkglsyHFbv
   AWgGV1wN5HixC2ht0TQdsO4T7BZiWJqvgSAFjSVXbgyJXO404MAanUKEC
   07fKpYHqYaPml2tgKJ5IdX4ArWwQtYUZJWDDCYZw0X4q70zF5U3MbNuWN
   w==;
X-CSE-ConnectionGUID: NNMgq7GdSrO3j6omuh8s1g==
X-CSE-MsgGUID: 9Nli7rsYSS2yX139OZdx7w==
X-IronPort-AV: E=McAfee;i="6700,10204,11194"; a="25300233"
X-IronPort-AV: E=Sophos;i="6.10,228,1719903600"; 
   d="scan'208";a="25300233"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2024 00:40:50 -0700
X-CSE-ConnectionGUID: qjNTC4IMT0acK6d6Wzh93A==
X-CSE-MsgGUID: rcYbopStRSujERRtNNKj/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,228,1719903600"; 
   d="scan'208";a="68038030"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 14 Sep 2024 00:40:48 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1spNOg-0007VS-1Q;
	Sat, 14 Sep 2024 07:40:46 +0000
Date: Sat, 14 Sep 2024 15:40:38 +0800
From: kernel test robot <lkp@intel.com>
To: Raju Rangoju <Raju.Rangoju@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Mark Brown <broonie@kernel.org>,
	Krishnamoorthi M <krishnamoorthi.m@amd.com>,
	Akshata MukundShetty <akshata.mukundshetty@amd.com>
Subject: drivers/spi/spi-amd.o: warning: objtool: .text.amd_set_spi_freq:
 unexpected end of section
Message-ID: <202409141539.2uAlMu2x-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   b7718454f937f50f44f98c1222f5135eaef29132
commit: 6defadbe6cbc3a87dc39c119a6748d19bfba0544 spi: spi_amd: Add support for SPI MEM framework
date:   6 months ago
config: x86_64-randconfig-r052-20240913 (https://download.01.org/0day-ci/archive/20240914/202409141539.2uAlMu2x-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240914/202409141539.2uAlMu2x-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409141539.2uAlMu2x-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/spi/spi-amd.o: warning: objtool: .text.amd_set_spi_freq: unexpected end of section

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
