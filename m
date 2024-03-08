Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FE663217
	for <oe-kbuild-all@lists.linux.dev>; Fri,  8 Mar 2024 22:27:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709936827; cv=none; b=oNvfze8CeyycuRkEzwYfVHxjrlC34nFUlwbsKsudpGeWZWX3ndSi5UBWcTe4QXhm2dK2J+TB0j9TEnQ32ShTM17PnsFjFClo3DztSfEdgrfYnjJgE7r878NgU4h0VzFnsSPgFAdYj99W6HCilsjHllLwcyIM0BOClq8C7KeN7PU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709936827; c=relaxed/simple;
	bh=WbLKRb3S5dO1GbmWnO8wG6kz7kSsZk7s0HXIY2o4xHo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=D0e8O/yekEKxzj0dJTeEQNNaJlOiEjQHh9oK6EfzEjENwQkh0tskBDe0S9Ds1ISEaI14a/s9o03kFG3YgTE3oiurGnBarYsWR+M9GFaBqHm+LQGY7HjDfLGIcl+5SmaxQW013bBxFcuC9nOVMdn+4eY0Dice24gjq8rkagvnVUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Tn2yjXgF; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Tn2yjXgF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709936825; x=1741472825;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WbLKRb3S5dO1GbmWnO8wG6kz7kSsZk7s0HXIY2o4xHo=;
  b=Tn2yjXgFfJGj3uC2GLDYC69c394JoC+4uhAK7jUZd/37HBIBTLfqDE2H
   6rwub1zStVCSQEgB411vleJ1/ERJu1gxSQPw5ucG1Hoc5Yf2g5pVUSFcM
   aScLmt3n/gjoOxLV/uaf9P2d/BYfqNncDokMPIWRMRkFNBjl6IPRc+qj2
   V2un0uKNS5a3WFPBd89YQXjffdfMEYvYCRf8hyFi7zlbrduX50/GWzhy/
   IrtJ8jvUTt3rf377RrUEjt+ROREkfKoBNIG4Zn+JDtLkpPXJK2Hx3FogC
   7GPDmffrZi67EgwotsbjwFjlNlevDC9DTZd+K/mMHDGMz+CCg2rRn31/o
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11007"; a="7627116"
X-IronPort-AV: E=Sophos;i="6.07,110,1708416000"; 
   d="scan'208";a="7627116"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2024 14:27:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,110,1708416000"; 
   d="scan'208";a="33742129"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 08 Mar 2024 14:27:04 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1riig9-0006lL-1K;
	Fri, 08 Mar 2024 22:27:01 +0000
Date: Sat, 9 Mar 2024 06:26:23 +0800
From: kernel test robot <lkp@intel.com>
To: "Darrick J. Wong" <darrick.wong@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [djwong-xfs:fsverity-cleanups-6.9 28/37] xfs_buf_mem.c:undefined
 reference to `shmem_get_folio'
Message-ID: <202403090636.ToGbcXWD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git fsverity-cleanups-6.9
head:   0dbdaafd38ae4f4af18c8650ff875d6a39f50bc4
commit: 6265f5ef0aeb4b08acac17ad6e0b1a1293bfd36d [28/37] xfs: cache merkle tree blocks for fsverity via a blobcache
config: powerpc-randconfig-r132-20240308 (https://download.01.org/0day-ci/archive/20240309/202403090636.ToGbcXWD-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20240309/202403090636.ToGbcXWD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403090636.ToGbcXWD-lkp@intel.com/

All errors (new ones prefixed by >>):

   powerpc-linux-ld: fs/xfs/xfs_buf_mem.o: in function `xmbuf_map_page':
>> xfs_buf_mem.c:(.text+0x3bc): undefined reference to `shmem_get_folio'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
