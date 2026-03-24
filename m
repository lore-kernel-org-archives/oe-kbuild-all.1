Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA3EA3A3811
	for <oe-kbuild-all@lists.linux.dev>; Tue, 24 Mar 2026 03:56:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774324617; cv=none; b=HuEOri6++xWNnzGIrp5U38xEx0SpO3GZW5jKUNWeZ8KICF2GVdzMFxcgc4NGr/b4L6nJ2P7K4kNOhCErMM5p6t38LR4kmH4An5kvEqrvkpnOz43fRk+VBGWEv29zBUMuyQRU9qG98Z7HNolzkuXsXhxTh7C9iWKF3nciaahTG3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774324617; c=relaxed/simple;
	bh=CqF4yHhUWunsPT83AMzXy6/MFEVAeXdwtJOMK6KU9Iw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=S8sDQgo4rJDobVnXsd91k4IvTxJ1TDPDayq5o1BVJexhBzBDcrziZimoLro8jVRVtxoQyIkfjLYh9xrubBwEYV/JUTprmOjVlvXHggaX9aBljQzv7nGG/QUsJmLSY+oQd1yOGEIBNb+gb2JCb+44n2bk3daExkS0OnQBdz5fhUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Z2wg9XPH; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Z2wg9XPH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774324616; x=1805860616;
  h=date:from:to:cc:subject:message-id;
  bh=CqF4yHhUWunsPT83AMzXy6/MFEVAeXdwtJOMK6KU9Iw=;
  b=Z2wg9XPHUTffSnCFI2fKgE+pdVymCyjMN8elwNk0eaS6LOUoD5GiW0YX
   R7mhSK1AJq3kX/9NtclCzuPFd6IEvc5IsH5ANg4NnY5Bn1UatSpXOYCMC
   rRrx6Gl7xF4JzfzCFNLL27sClK99uv0Z8CQVZL16Nj+fHDy51R97CXkEP
   xBeuKLDuM12WoDnPZvfh6fOLaOdqef9DX7LGhm2dBfdwZvbm1okKXROCC
   HUw7Mn9+mzOw4z3dbJYvEP/kTyPkjMszNWFw7FvLqylH6YrbHUGRyOq8D
   HlfjI/80A+i15CfKN5o1rf5c+b2wruZkuVcmKjCggTfkErAvQmK7MgfRx
   g==;
X-CSE-ConnectionGUID: J0c9siNxR+OgiXHQCD102Q==
X-CSE-MsgGUID: xNDtr8vHTIavMW5pbIuQig==
X-IronPort-AV: E=McAfee;i="6800,10657,11738"; a="74354650"
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; 
   d="scan'208";a="74354650"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2026 20:56:52 -0700
X-CSE-ConnectionGUID: cdPmeU5TSlyMdYIo/lgUnw==
X-CSE-MsgGUID: BuomHXiBTLGseKHI6eIsUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; 
   d="scan'208";a="223304108"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 23 Mar 2026 20:56:50 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w4sso-000000003kT-3svX;
	Tue, 24 Mar 2026 03:56:46 +0000
Date: Tue, 24 Mar 2026 11:56:26 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Hans Holmberg <hans.holmberg@wdc.com>,
 "Darrick J. Wong" <djwong@kernel.org>
Subject: fs/xfs/xfs_zone_alloc.c:32:5-24: WARNING:
 atomic_dec_and_test variation before object free at line 34.
Message-ID: <202603241132.Rh4KPNr6-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   c369299895a591d96745d6492d4888259b004a9e
commit: 4e4d52075577707f8393e3fc74c1ef79ca1d3ce6 xfs: add the zoned space allocator
date:   1 year, 1 month ago
config: s390-randconfig-r052-20260323 (https://download.01.org/0day-ci/archive/20260324/202603241132.Rh4KPNr6-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project c911b8492374942bf4cfe35411e90a35d3837f6a)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603241132.Rh4KPNr6-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> fs/xfs/xfs_zone_alloc.c:32:5-24: WARNING: atomic_dec_and_test variation before object free at line 34.

vim +32 fs/xfs/xfs_zone_alloc.c

    27	
    28	void
    29	xfs_open_zone_put(
    30		struct xfs_open_zone	*oz)
    31	{
  > 32		if (atomic_dec_and_test(&oz->oz_ref)) {
    33			xfs_rtgroup_rele(oz->oz_rtg);
  > 34			kfree(oz);
    35		}
    36	}
    37	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
