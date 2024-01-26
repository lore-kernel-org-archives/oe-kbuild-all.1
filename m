Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60784BE4E
	for <oe-kbuild-all@lists.linux.dev>; Fri, 26 Jan 2024 05:57:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706248657; cv=none; b=Edp5EeIz9iqkAlMcs47vkkW2ai2og23RnudUjWWqznt9lMl9AcboRSkYqLAlpisYlvhMRG/E+Vv2kFbjHZcquRJLS1bX8VfUhM0epAKUCauR1sKPhCfQPtMuKkfsrsh8ExqmwkbLNepBMuogNKAxgACnr/rZPb0B7AoWfF8PXdA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706248657; c=relaxed/simple;
	bh=bAIENMnB5UUbxsc2j0cYORxxwg//ZLm2D3mkXKsm6tw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oHCmLU1mZYG1E1CS7sR47CIrujjZ3fuL8FpyUJn9JZqMbjuqRp2lE9/gX573bDROSddV5KrpAsq5yU8/5F0qpIcjK+4+pDEesvQ7wYqXfw8IDYt4cL/FELHQQhAv1KHuI1QXwPFgX6u24XKHLE7x9FHRY85vfhMzEsluvhkSq6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IhYogelk; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IhYogelk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706248655; x=1737784655;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bAIENMnB5UUbxsc2j0cYORxxwg//ZLm2D3mkXKsm6tw=;
  b=IhYogelkifU6UgAoMO/zgG5uQYqBXN2TPUVLY1P2FZ1XpedIkfABxd3i
   dkT3QMw9rU3vrPXCZNwHFapU+b3aBQYSvJSjq8eytXMnqZSJoM16/tE+4
   EkryPCiWL+omN6qZqI9YkGsjCjb0ol5svC1o14w1bwJVWW7bS/RGztDJk
   fKeNGb7I0k/i9PQeGOvFvtfWpN95HZ5Fbs3X+sjN7OBWmkbKUx9hIW7xv
   /xI+t6dQ/wXHaL4Pc12tdIZLjWFQsk6upoAp3d9nubGe0LTTbAVk79pkD
   11JZKGi94J/hPgzyxQXiobhmO2q9tOecrxeFbewLY/cFLhY/dLV+eghSA
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10964"; a="9077531"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="9077531"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jan 2024 21:57:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10964"; a="1118172426"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="1118172426"
Received: from lkp-server01.sh.intel.com (HELO 370188f8dc87) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 25 Jan 2024 21:57:33 -0800
Received: from kbuild by 370188f8dc87 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rTFDX-0000kE-2X;
	Fri, 26 Jan 2024 05:57:31 +0000
Date: Fri, 26 Jan 2024 13:57:09 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hch-xfs:xfs-zoned 79/80] ld.lld: error: undefined symbol:
 xfs_zone_record_blocks
Message-ID: <202401261341.C5TRbVtz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.infradead.org/users/hch/xfs xfs-zoned
head:   9fc0addd2e44d48f96a00113084dfcab9b9df8f8
commit: 2fa0f6f5ec6e51a9507fe67dfe98cdd1b89958cd [79/80] xfs: add a "defrag" mode to xfs_zoned_end_cow
config: i386-buildonly-randconfig-004-20240126 (https://download.01.org/0day-ci/archive/20240126/202401261341.C5TRbVtz-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240126/202401261341.C5TRbVtz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401261341.C5TRbVtz-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: xfs_zone_record_blocks
   >>> referenced by xfs_reflink.c
   >>>               fs/xfs/xfs_reflink.o:(__xfs_reflink_end_cow_extent) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
