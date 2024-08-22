Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1EB119DF8E
	for <oe-kbuild-all@lists.linux.dev>; Thu, 22 Aug 2024 11:30:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724326205; cv=none; b=P2KcbssZnAXbuoGzILUI1MHX2gVMk6o8JMPcj3glWjpDgMztabiTz4fgmhzJCbpcddLETkWwWIFrSFFyrROrmK7mzpGc3m0pXBmKZbkx+oWFLs+GsA6rNCPHUU70mzjHj8XyHJZycBrXVbKPcp1yKN64vvWSjtxGsvd7VqI0c/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724326205; c=relaxed/simple;
	bh=FKOKzaVPhMStI7DDBcZ/1YagVEpEaZ8x1xml3t4Anqg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=c9WbrMzt2YUxLY8xgeaxHAdYVmbCDRmWF3CfghnRhQhEeADUlP/O0wy7Uy/fncqhR+GBQieAlE+YX3qsSK2RhCIal09N33/d32VnTrpgmxAiMrIVZFDd79nkPhImhU4YNE7fdI0IpOgxAXF0Lg0A3Bot97nHlIuQ6ntmuWCcXA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IFKy8KV6; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IFKy8KV6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724326203; x=1755862203;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FKOKzaVPhMStI7DDBcZ/1YagVEpEaZ8x1xml3t4Anqg=;
  b=IFKy8KV61b7QbYqR8/ayce9exjGT6vtT4V5XH6vyo0LC6URMol+lQ1vS
   9vugJQlhpJGiVWzo6H5ANWbrxA84oieP0DBPwkGpECAGMkK3m3FdH4nsR
   uOk+dUBWWMkOOpBcXJiuFpZjYz4Ij5lzZiBi0qsZvmWjjuMgrg/xjoXZk
   jV6hYAjglyD8PlFtI1q0G1qB4HGyyI9uaQefVoI8oe071R0xzvQoAk60i
   ypqmUU2W9iOJihKlNTgMNjt4eyQOqFYE2xQ4BjamDj8Ic3OnvYNgakzKd
   40seW/O3Vh5tcENrtrkCf8EMytEeVMp/bcRxIYXVZnc0VyCuxFg17qXwv
   A==;
X-CSE-ConnectionGUID: 5zwTlD1CSo2soR9RS1daDQ==
X-CSE-MsgGUID: czgzhUCDSD63SJfu8Dpphg==
X-IronPort-AV: E=McAfee;i="6700,10204,11171"; a="22546949"
X-IronPort-AV: E=Sophos;i="6.10,166,1719903600"; 
   d="scan'208";a="22546949"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2024 04:30:03 -0700
X-CSE-ConnectionGUID: XUsPOcM0T1abrU9wEHFxAA==
X-CSE-MsgGUID: RrTAJ4aVSraAFAA2dezLIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,166,1719903600"; 
   d="scan'208";a="98921977"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 22 Aug 2024 04:30:02 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sh60u-000ChU-1m;
	Thu, 22 Aug 2024 11:30:00 +0000
Date: Thu, 22 Aug 2024 19:29:49 +0800
From: kernel test robot <lkp@intel.com>
To: Mike Snitzer <snitzer@hammerspace.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [snitzer:nfs-localio-for-next.v12 21/24]
 fs/nfs_common/nfslocalio.c:82:1: sparse: sparse: symbol 'nfs_to_nfsd_mutex'
 was not declared. Should it be static?
Message-ID: <202408221903.rwuX1E5R-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/snitzer/linux.git nfs-localio-for-next.v12
head:   4933ed11e9877e1f5a730d284dad423cff707c21
commit: 54c66f3390653371736fd2a6ff0adce6cccf714b [21/24] nfs_common: expose localio's required nfsd symbols to nfs client
config: s390-randconfig-r111-20240821 (https://download.01.org/0day-ci/archive/20240822/202408221903.rwuX1E5R-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 14.1.0
reproduce: (https://download.01.org/0day-ci/archive/20240822/202408221903.rwuX1E5R-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408221903.rwuX1E5R-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   fs/nfs_common/nfslocalio.c:13:1: sparse: sparse: symbol 'nfs_uuid_mutex' was not declared. Should it be static?
>> fs/nfs_common/nfslocalio.c:82:1: sparse: sparse: symbol 'nfs_to_nfsd_mutex' was not declared. Should it be static?

vim +/nfs_to_nfsd_mutex +82 fs/nfs_common/nfslocalio.c

    72	
    73	/*
    74	 * The nfs localio code needs to call into nfsd using various symbols (below),
    75	 * but cannot be statically linked, because that will make the nfs module
    76	 * depend on the nfsd module.
    77	 *
    78	 * Instead, do dynamic linking to the nfsd module (via nfs_common module). The
    79	 * nfs_common module will only hold a reference on nfsd when localio is in use.
    80	 * This allows some sanity checking, like giving up on localio if nfsd isn't loaded.
    81	 */
  > 82	DEFINE_MUTEX(nfs_to_nfsd_mutex);
    83	nfs_to_nfsd_t nfs_to;
    84	EXPORT_SYMBOL_GPL(nfs_to);
    85	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
