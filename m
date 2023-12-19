Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53E371BDC4
	for <oe-kbuild-all@lists.linux.dev>; Tue, 19 Dec 2023 14:15:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Vpyo3d/H"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702995346; x=1734531346;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dAYH3pIpR638FI/zYj6roDlScNnBep9M0B0SDWPesw8=;
  b=Vpyo3d/HbnJ1hqTuYIglmTkCSpiuD80Wld47Vsb3oaRQD5chzXuQE7F/
   CEKL6bBNMvmxAzBFM+RFhcEfcQZ2sdyQvsbwcsp5N8FOHEaFAFBciLKRp
   vzv8dL+ds6kBCIbktC83Jk6nMKLz9CDuxkpGMyFBtkzj45htBsVULx7JS
   TL/uR/XbjFp1AJTfTL4oMl6h3HMou1IaLIPwSM7FX7esJEJPKZ6Nplrtx
   +XdzGd+ovTPLE+t03Ul9FJqQVlAuAek0/siI53eXuSnGOhkorAYjAz9yx
   L1/62qrYmMKsu60WO97xKUAzNT1KDU+Xb01GUyQ3uapLnlBZw2/Hy+s8G
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10929"; a="375153275"
X-IronPort-AV: E=Sophos;i="6.04,288,1695711600"; 
   d="scan'208";a="375153275"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2023 06:15:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10929"; a="752173369"
X-IronPort-AV: E=Sophos;i="6.04,288,1695711600"; 
   d="scan'208";a="752173369"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 19 Dec 2023 06:15:44 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rFaso-0005Q5-0T;
	Tue, 19 Dec 2023 14:15:42 +0000
Date: Tue, 19 Dec 2023 22:15:38 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hch-xfs:xfs-zoned 63/63] fs/xfs/xfs_zone_alloc.c:1024:1: warning:
 no previous prototype for 'xfs_pick_open_zone_for_gc'
Message-ID: <202312192226.JiT2tbr3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.infradead.org/users/hch/xfs xfs-zoned
head:   7de9cbf1b22c57cd561e83659fef081f21412e69
commit: 7de9cbf1b22c57cd561e83659fef081f21412e69 [63/63] xfs: respect the open limit when allocating gc zones
config: i386-randconfig-014-20231219 (https://download.01.org/0day-ci/archive/20231219/202312192226.JiT2tbr3-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231219/202312192226.JiT2tbr3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312192226.JiT2tbr3-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/xfs/xfs_zone_alloc.c:1024:1: warning: no previous prototype for 'xfs_pick_open_zone_for_gc' [-Wmissing-prototypes]
    1024 | xfs_pick_open_zone_for_gc(
         | ^~~~~~~~~~~~~~~~~~~~~~~~~


vim +/xfs_pick_open_zone_for_gc +1024 fs/xfs/xfs_zone_alloc.c

  1022	
  1023	struct xfs_rtgroup *
> 1024	xfs_pick_open_zone_for_gc(
  1025		struct xfs_mount	*mp)
  1026	{
  1027		struct xfs_rtgroup	*rtg, *found = NULL;
  1028	
  1029		list_for_each_entry(rtg, &mp->m_open_zones, rtg_entry) {
  1030			if (!found)
  1031				found = rtg;
  1032			else if (rtg->rtg_write_pointer < found->rtg_write_pointer)
  1033				found = rtg;
  1034		}
  1035	
  1036		return found;
  1037	}
  1038	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
