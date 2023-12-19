Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4486940BE9
	for <oe-kbuild-all@lists.linux.dev>; Tue, 19 Dec 2023 22:31:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bCquReO+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703025089; x=1734561089;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2wneZe4OdEUQ/w/fkPqc9zP06x9IGnZ6BEKmFNt8UDg=;
  b=bCquReO+fakl9fiD5+aybS+/jDLfOVllsGqRW7W6aGq1SZrdRAHpNHpE
   5rIVu3sb8ju7UnaoCNOdTtO+5cs3ldbtKuieIVuoYPQN8D6Ml6B7hTZja
   oKIHJOvmcGSlaNEFZ+K06wuYIngUO+X07MvE2mjGRaqYNFLNZz8medtY9
   +xrEa8d5MCB5Eo6j2tvPkqHRm/nz3PR8R67kcbQSyL6v25VuNYoZlLAxB
   vAlf1rAvt55UOCHPLq81VBWY8HHXn4htMIH5Qkxgy2rGNNsXgaOMYaB5A
   dFbbkHUzi9Zh6BcNqYR08Y7GOnSO6CC2Pqtc/xQfw2P4YDiWYIluve/g0
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10929"; a="394612782"
X-IronPort-AV: E=Sophos;i="6.04,289,1695711600"; 
   d="scan'208";a="394612782"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2023 14:31:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10929"; a="842032901"
X-IronPort-AV: E=Sophos;i="6.04,289,1695711600"; 
   d="scan'208";a="842032901"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 19 Dec 2023 14:31:27 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rFicX-000629-0d;
	Tue, 19 Dec 2023 22:31:25 +0000
Date: Wed, 20 Dec 2023 06:30:29 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hch-xfs:xfs-zoned 63/63] fs/xfs/xfs_zone_alloc.c:1023:20: sparse:
 sparse: symbol 'xfs_pick_open_zone_for_gc' was not declared. Should it be
 static?
Message-ID: <202312200647.LUOmr9KG-lkp@intel.com>
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
config: x86_64-randconfig-122-20231220 (https://download.01.org/0day-ci/archive/20231220/202312200647.LUOmr9KG-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231220/202312200647.LUOmr9KG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312200647.LUOmr9KG-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> fs/xfs/xfs_zone_alloc.c:1023:20: sparse: sparse: symbol 'xfs_pick_open_zone_for_gc' was not declared. Should it be static?
   fs/xfs/xfs_zone_alloc.c: note: in included file (through include/linux/preempt.h, include/linux/spinlock.h, include/linux/mmzone.h, ...):
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true

vim +/xfs_pick_open_zone_for_gc +1023 fs/xfs/xfs_zone_alloc.c

  1022	
> 1023	struct xfs_rtgroup *
  1024	xfs_pick_open_zone_for_gc(
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
