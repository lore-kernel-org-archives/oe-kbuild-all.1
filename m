Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B42A1158543
	for <oe-kbuild-all@lists.linux.dev>; Sun,  6 Oct 2024 10:53:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728211995; cv=none; b=cIDg70P18HGrcfIKE2sRGWHjKKGhDRFYMFcgnBDDxvFlea9NjMbXGTOzIGbK9YQJQeCVd5AvvDKZII9xCA8giitUtnic3fJ19egUQ3MDVYq+OJUuXMpDCstatVYvxouZh9/cqhqid07ctC7GtetToAnBN3fdVOm9sHVsXgCpdoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728211995; c=relaxed/simple;
	bh=HE2dCWm99n2P3XV2sgmx7AClD8MFm/QBgt3bub30E9I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZsE8FvFWDvkc87L6A3b8mwXP4cOzJ+aRwT0y0XDSXhJGRT9m1S34vrpo1T3tKmWe0e8pohWR4KYBJlHNiO4kO0B3uLEa/Cr7gEDp6iwphLobiFSR3onzxRU9PZ7TpLstn9/uJ5QJj3c2iSLjSGrjfUbeiNg6MfqfeRGF9vuWlq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BUNo/yLF; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BUNo/yLF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728211994; x=1759747994;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HE2dCWm99n2P3XV2sgmx7AClD8MFm/QBgt3bub30E9I=;
  b=BUNo/yLFdW/WJgNgRk7P7gJh41eW326a9PMVxD/jaRZXx1aO+hNJ9SQa
   CyyvkI7Uw9MYsdHo/+xgnBItPAuaofTb4G44FtQXVAm0LBodJbRymtSgI
   USvhPnWXm9H+75SWpz1wHoWrMXEYZUZJmERpDgAsAJdzOQYvBEG2rU0aR
   MzQZqmFpMC+5nokpgg3JHfk/2R9P3t09VAiKAaaDbL+CqcH3IgsQPiKrK
   BGwgNDOxG+4Q682X1p2VbSO7TkPhEMqprWcfxNH9gCsfx2ENBsOmTJd6R
   l6fHElFsrvCEB5dM2h7wW6spNR1jOZlX3D4YbNOgT19MUsmIy6AsB/Bdc
   w==;
X-CSE-ConnectionGUID: vaeroE0gQtmDAlniqwypWQ==
X-CSE-MsgGUID: RuUrjDTPQzWzLTH2eZDLFA==
X-IronPort-AV: E=McAfee;i="6700,10204,11216"; a="27320082"
X-IronPort-AV: E=Sophos;i="6.11,182,1725346800"; 
   d="scan'208";a="27320082"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Oct 2024 03:53:13 -0700
X-CSE-ConnectionGUID: LsQhzAymQiaAdi36pEfR4w==
X-CSE-MsgGUID: u46s9cOKQRieEomyv0TRkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,182,1725346800"; 
   d="scan'208";a="79957328"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 06 Oct 2024 03:53:12 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sxOsw-0003nY-0o;
	Sun, 06 Oct 2024 10:53:10 +0000
Date: Sun, 6 Oct 2024 18:52:13 +0800
From: kernel test robot <lkp@intel.com>
To: Leon Romanovsky <leonro@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [leon-rdma:dma-split-wip 16/25] ERROR: modpost: "iommu_can_use_iova"
 [drivers/infiniband/core/ib_uverbs.ko] undefined!
Message-ID: <202410061812.6sUEKNd2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/leon/linux-rdma.git dma-split-wip
head:   f34f7476669cb7b5b7f88e3ea219362965e133f8
commit: 488bee668b46205b8e7bc1b2136796e60d019d56 [16/25] RDMA/umem: Prevent UMEM ODP creation with SWIOTLB
config: i386-randconfig-014-20241006 (https://download.01.org/0day-ci/archive/20241006/202410061812.6sUEKNd2-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241006/202410061812.6sUEKNd2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410061812.6sUEKNd2-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "iommu_can_use_iova" [drivers/infiniband/core/ib_uverbs.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
