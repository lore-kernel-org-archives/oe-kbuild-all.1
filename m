Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D40B119993F
	for <oe-kbuild-all@lists.linux.dev>; Fri, 25 Oct 2024 08:00:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729843251; cv=none; b=f8bTSGPV7cXWV8piyAhoQxpiutS576tl3wZyxVCfg4oJS7wgH5biaCaYHlyiZMNiA3EM7pI1TmcDshFa6o/JVoH/rkrhsAyq5KRXK5ufUwUOXr7tZ1RNHGkFxQ1RRiVLjDhriPewvCr8OWvlG0UqtLxHyJ+gYdYKmwAJG+nXnxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729843251; c=relaxed/simple;
	bh=rFAwolJMpJ1SwKwjYr1TiKR+ucT4qvtHaHzzebkgTX8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MUo4ZcEJiHj0JDgTxl/58FJuVD8KlbRsvI9mT9ZZiH4uIdT9/TzEidnDmQro231AKhKxD7VL2dPsApG9Ri9HcDbJUzEV6BviplrqFUM0enOGj45L6ynBwVT1fnh8Hgi7naqqMGX6XiFRgTe4HrR/zKtiShFa1W2x6O/oW6Y1+90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gDn+8Kqf; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gDn+8Kqf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729843250; x=1761379250;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rFAwolJMpJ1SwKwjYr1TiKR+ucT4qvtHaHzzebkgTX8=;
  b=gDn+8KqfmQKW0Anfpqn/32f0J1LIjgsEg4rSNW0zferpN7xP0b6tWWa8
   s7dYp/O1FzDBhVJp4JqetTIHkoizl66NOBio2/1l936+bp8OMCJi5TnC2
   e7vzYPVILaE/WqqJWFkHLarwWa0IqwqZZelrywI6HvW8oGLn9tXekOoYH
   0qacSEqDxlfHM/Xgqf2IrtFK4XxEEYS15oI80vamMCipPaa7uIsXPsbwV
   ZXv0FxqJnFdyvXem/rg5dCggZINgN2XRZw14yohOvlCjQDJveChqJ9Hmg
   +3ZOW1uEXmC44qfMIKWr846eUnv4YlbBDTdFuNTW4fHXhYmOsODXBi20r
   w==;
X-CSE-ConnectionGUID: dlHy7tJKQ0KGMRg3BLDZaA==
X-CSE-MsgGUID: QZGjre5+TZ2D7cQ5MONNSA==
X-IronPort-AV: E=McAfee;i="6700,10204,11235"; a="32365094"
X-IronPort-AV: E=Sophos;i="6.11,231,1725346800"; 
   d="scan'208";a="32365094"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2024 01:00:49 -0700
X-CSE-ConnectionGUID: R0WGeVnWSr68I6XKX+dP0A==
X-CSE-MsgGUID: 6mf3HSc+RaW96+bu2y9cZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,231,1725346800"; 
   d="scan'208";a="80760182"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 25 Oct 2024 01:00:48 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t4FFW-000XoJ-0n;
	Fri, 25 Oct 2024 08:00:46 +0000
Date: Fri, 25 Oct 2024 15:59:49 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hch-xfs:xfs-zoned-rebase 34/58] ERROR: modpost: "__umoddi3"
 [fs/xfs/xfs.ko] undefined!
Message-ID: <202410251534.CzHNSTd7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.infradead.org/users/hch/xfs xfs-zoned-rebase
head:   405a6c19506c51256fe1eafd41128b98ffe566b3
commit: 7d0ae5c0dcfc39db9e13893a83d1947d042b3d4a [34/58] xfs: support zoned RT devices
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20241025/202410251534.CzHNSTd7-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241025/202410251534.CzHNSTd7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410251534.CzHNSTd7-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "__umoddi3" [fs/xfs/xfs.ko] undefined!

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for GET_FREE_REGION
   Depends on [n]: SPARSEMEM [=n]
   Selected by [m]:
   - RESOURCE_KUNIT_TEST [=m] && RUNTIME_TESTING_MENU [=y] && KUNIT [=m]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
