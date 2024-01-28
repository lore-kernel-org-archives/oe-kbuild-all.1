Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77F2038B
	for <oe-kbuild-all@lists.linux.dev>; Sun, 28 Jan 2024 00:36:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706402175; cv=none; b=QDs5CMSGduAN0mHflGvpS6PVS4bMv+Me635l4xXLBHTVoILzBCO6ZYVHSm311TXBLdrgwAxGKZ5jfvAR1Aosk0BZ4vFZ3hhZxLHxdeJcFiN6IljNhOuu7VYcBFoGjMev3KyETYigQbE3bEx19n9TrjtyxX7FJsl3bA70iHyrRtA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706402175; c=relaxed/simple;
	bh=rFzocNDeFil74JW+1vfenJQKQPl42uFEMD0/FZjA30Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mE2vU+M85nhjgihZgoTd9Pr3NMotoTLS8AL3O9UE0gGdD42geV+adkckVXn15vjMSYerk87rOhZZjtcTp9AIV0ZfjAzysCbjo8ie31i0n7r7duakOZgBxTne5nH5Qf69kLecKSBnHQgY1w6GlEZX9gYulXi510xslhWPH8CW0Cg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Oe3fMJ07; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Oe3fMJ07"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706402170; x=1737938170;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rFzocNDeFil74JW+1vfenJQKQPl42uFEMD0/FZjA30Q=;
  b=Oe3fMJ07HCc2UAw0OiBizKfLbkvNxS9dhf+OGqvpaH92fdXG5I6yMuY4
   1A/WezR3bFO1u5vNnDV4DGVvKUcFK5Ry4hoeO0IVmNjmWOIazJAOiGePJ
   QsfMQ+xeHF7oXCwvlmnPFyNHBm7D7pqpYb+P3pfaDdV8HHrW7vltbrro7
   sCXANYRUvSnG+RwPXURFb81bXv13UbG3u/2F1OZE6hHcc7uASVcp0JRUz
   CkDhs0KMgzm7Or7n3HJxluUXc3D2jjh4MHqLlj0a7L0OgSFjkHqyakif9
   6zhZ+xYKotO+GBxgrJlXdT+ZwEhcT7YVGecmWzIbNd/mrri2YvYh99Ugt
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10966"; a="9835858"
X-IronPort-AV: E=Sophos;i="6.05,220,1701158400"; 
   d="scan'208";a="9835858"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2024 16:36:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,220,1701158400"; 
   d="scan'208";a="3097721"
Received: from lkp-server01.sh.intel.com (HELO 370188f8dc87) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 27 Jan 2024 16:36:09 -0800
Received: from kbuild by 370188f8dc87 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rTt9a-0002uc-0u;
	Sun, 28 Jan 2024 00:36:06 +0000
Date: Sun, 28 Jan 2024 08:36:00 +0800
From: kernel test robot <lkp@intel.com>
To: "Darrick J. Wong" <darrick.wong@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [djwong-xfs:report-refcounts 401/512] /usr/bin/ld:
 xfs_rmap.c:undefined reference to `xfs_rmapbt_mem_ops'
Message-ID: <202401280854.sclOyS9B-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git report-refcounts
head:   e9a152561dfd80561830f5da06d5a6d281883956
commit: 04fb2fd4d5f6ddd34013874642f1ed2cc36ceaad [401/512] xfs: prepare rmap functions to deal with rtrmapbt
config: um-randconfig-002-20240127 (https://download.01.org/0day-ci/archive/20240128/202401280854.sclOyS9B-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240128/202401280854.sclOyS9B-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401280854.sclOyS9B-lkp@intel.com/

All errors (new ones prefixed by >>):

   /usr/bin/ld: fs/xfs/libxfs/xfs_rmap.o: in function `xfs_rmap_query_range_helper':
   xfs_rmap.c:(.text+0xdbe): undefined reference to `xfs_rmapbt_mem_ops'
>> /usr/bin/ld: xfs_rmap.c:(.text+0xeaa): undefined reference to `xfs_rmapbt_mem_ops'
   /usr/bin/ld: fs/xfs/libxfs/xfs_rmap.o: in function `xfs_rmap_get_rec':
   xfs_rmap.c:(.text+0xff1): undefined reference to `xfs_rmapbt_mem_ops'
   /usr/bin/ld: xfs_rmap.c:(.text+0x10b9): undefined reference to `xfs_rmapbt_mem_ops'
   collect2: error: ld returned 1 exit status

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
