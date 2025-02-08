Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79A981F2BA4
	for <oe-kbuild-all@lists.linux.dev>; Sat,  8 Feb 2025 22:51:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739055077; cv=none; b=ejcVALBcysMaxY7SLxfqMpQtGKASFYf9f+m57HnQ6HvDiJlzQvbjxOTn1TuX7PkT5yVDPQR+2lTmY8FejhSNAWIAmBTO+qo9GHQlJ9bBomNQoH6uTVGJWk41ZCrdtSHNMDNPbc+jFAEN+hFdqO3ztghoR7uImhndysKZMcpW/YA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739055077; c=relaxed/simple;
	bh=luDwOawD0UWzWHoEwQ4WFyT6uS61a+srfiC2A1ktTxo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SH+TcbDHBa1RiJy98q5/QDcYWQJnq1vQPDYL3SPSiQ6dIAK/k6Ot5dYmTFIJa0z4DNE2eWIje5jd2/60PsY/cEGBfY7OL6LDqCLnwLr5+Ymcx56xHITV+Jy7UBESeVWMY6Ct9al3arb74e8v5XclpS9mOf2wP9FLTIITISBroAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WrxjDWAL; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WrxjDWAL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739055075; x=1770591075;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=luDwOawD0UWzWHoEwQ4WFyT6uS61a+srfiC2A1ktTxo=;
  b=WrxjDWAL8EYnqEXqvgcfOUpHjPEeJKiFPbc3SFflLHqYD9UZHB3H7cBH
   fKRpM4szkm0WHaf8QXVJ4WhX6RYz6tCnb+C5ApBEDpmGvMZKFgNNTdfiq
   /pDyLKMRBox0xqU2O6teioUcLNbQX0OQ7hBUbibze4jibOaDc+7kmEEJ7
   9zAS00AqRU0VsrcG0exWasmfWxP5qP/lqktwp/c4hgpp6/lzn/FuicDoG
   teCuOdz0aeJQ9g1dd9mHMJnJDSbyEVJcEL4/75yHWC261coD60c0aJoy2
   btsHF5CVufx1P9DoCJf22cDyvtobH0t5v0UULv0586KK1JCTYlNHpjm//
   w==;
X-CSE-ConnectionGUID: bOI4c2igQCqHM5Iu926bLw==
X-CSE-MsgGUID: Scseo6cHRhKRsoPrzCFzJA==
X-IronPort-AV: E=McAfee;i="6700,10204,11339"; a="51059880"
X-IronPort-AV: E=Sophos;i="6.13,271,1732608000"; 
   d="scan'208";a="51059880"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Feb 2025 14:51:15 -0800
X-CSE-ConnectionGUID: cfgJCnRRTNSRl7/HqDovQg==
X-CSE-MsgGUID: W1lvqMhJRb+gLe/6fXV2gA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,271,1732608000"; 
   d="scan'208";a="116850201"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 08 Feb 2025 14:51:14 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tgtfL-0010k9-1g;
	Sat, 08 Feb 2025 22:51:11 +0000
Date: Sun, 9 Feb 2025 06:50:12 +0800
From: kernel test robot <lkp@intel.com>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: arm-linux-gnueabi-ld: error: .tmp_vmlinux1.btf.o is already in final
 BE8 format
Message-ID: <202502090631.tNxh8SfC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Masahiro,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   493f3f38da21cf61b25254f7a3dc817179b497c8
commit: b1a9a5e04767e2a78783e19c9e55c25812ceccc3 kbuild: merge temporary vmlinux for BTF and kallsyms
date:   7 months ago
config: arm-randconfig-r053-20250207 (https://download.01.org/0day-ci/archive/20250209/202502090631.tNxh8SfC-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250209/202502090631.tNxh8SfC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502090631.tNxh8SfC-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arm-linux-gnueabi-ld: error: .tmp_vmlinux1.btf.o is already in final BE8 format
   arm-linux-gnueabi-ld: failed to merge target specific data of file .tmp_vmlinux1.btf.o

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
