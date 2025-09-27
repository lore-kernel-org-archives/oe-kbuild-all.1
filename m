Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AB2514B06C
	for <oe-kbuild-all@lists.linux.dev>; Sat, 27 Sep 2025 19:27:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759001276; cv=none; b=sB8o1dRj5BQEj63PDt4sswD+jbRNscrBiRIfGJ88xjHilGvIbypNl/xNjZgvlqZKvL6uSzecc/Ud5G8EpUS5HSEXKl0WenG/2jpzfiYxXa0Azw+46DHnBEYfXViXZ6d23vmhSz8LPYFKx6KPnwDQOFHfOQxNQAgXutBzr5KJ8qE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759001276; c=relaxed/simple;
	bh=Jot6TPs7U86Keju1fH0pUBlklvwg2cPyiUN/j4cqCGk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cb7T3qOQCjHpPsrPKG9AraQSDiq4GsYE6GnYYM+ptzFx02UATLb3sau3P/HBJQ/+Szn2F6vx2RK2Ufm5deEhWa4ikx7SAU9GLz4NES+CiVAfwgS/KUsXztnnY5A4M60p/B3XHuJhiebg4SOpEbz/EuKXOc7xkCFaNLlIK7KLByo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bT1JYBnQ; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bT1JYBnQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1759001274; x=1790537274;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Jot6TPs7U86Keju1fH0pUBlklvwg2cPyiUN/j4cqCGk=;
  b=bT1JYBnQ0lygSfnC3H2vJY/h14boUWPyY/VbPAxrW0e8MvowI1pldXVC
   5d3oENLr4dVezgRhCndKg6uORihfvmKZGfXh/QvqrxxV53rTsTcyxTVE1
   8WVQHEnxnIpcwRgeF8yFkVErnwF+K+OxuEVuc2qRkVcitvs+N0PK0zkEb
   FKUH11ySMBT1FpA06enNrO0RQPCQrVfd0ZgmZseIT/b+ge4wCMc4RN7Fu
   gdbCyCwpy+hgTmFdj+Wmj91B1Yq1gYBAVBbpY/LrdhrYI+VfWJcF1lCGz
   N5eyVbEkFDJ/fzvXHJSPMILQnRBZx3tFXqdchujgnRW25T73KqKhF02bU
   g==;
X-CSE-ConnectionGUID: nYVs3f9aQa+l/TfoCv1i8w==
X-CSE-MsgGUID: e4xNHO89T+CUXTMFxDpOUw==
X-IronPort-AV: E=McAfee;i="6800,10657,11566"; a="61217694"
X-IronPort-AV: E=Sophos;i="6.18,298,1751266800"; 
   d="scan'208";a="61217694"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2025 12:27:54 -0700
X-CSE-ConnectionGUID: xFAF8LFTTlqhB3Ks4KbF9Q==
X-CSE-MsgGUID: absa7nMZQfa8vH1qqZrulQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,298,1751266800"; 
   d="scan'208";a="201554526"
Received: from lkp-server02.sh.intel.com (HELO 84c55410ccf6) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 27 Sep 2025 12:27:53 -0700
Received: from kbuild by 84c55410ccf6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v2aaE-0007I3-38;
	Sat, 27 Sep 2025 19:27:50 +0000
Date: Sun, 28 Sep 2025 03:27:25 +0800
From: kernel test robot <lkp@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jgunthorpe:iommufd_dmabuf 2/7] WARNING: modpost: module iommufd
 uses symbol dma_buf_unpin from namespace DMA_BUF, but does not import it.
Message-ID: <202509280328.VhDV1bx5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jgunthorpe/linux iommufd_dmabuf
head:   529f06c16cad5243825e488f9bc555be09e924eb
commit: 2edad14f2cea09830a4fbaf4352834f474ce4394 [2/7] iommufd: Add dmabuf to iopt_pages
config: i386-randconfig-007-20250927 (https://download.01.org/0day-ci/archive/20250928/202509280328.VhDV1bx5-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250928/202509280328.VhDV1bx5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509280328.VhDV1bx5-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

>> WARNING: modpost: module iommufd uses symbol dma_buf_unpin from namespace DMA_BUF, but does not import it.
>> WARNING: modpost: module iommufd uses symbol dma_buf_dynamic_attach from namespace DMA_BUF, but does not import it.
>> WARNING: modpost: module iommufd uses symbol dma_buf_map_attachment from namespace DMA_BUF, but does not import it.
>> WARNING: modpost: module iommufd uses symbol dma_buf_put from namespace DMA_BUF, but does not import it.
>> WARNING: modpost: module iommufd uses symbol dma_buf_pin from namespace DMA_BUF, but does not import it.
>> WARNING: modpost: module iommufd uses symbol dma_buf_detach from namespace DMA_BUF, but does not import it.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
