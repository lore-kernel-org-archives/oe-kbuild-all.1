Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B99E0280CDC
	for <oe-kbuild-all@lists.linux.dev>; Tue, 27 May 2025 17:58:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748368697; cv=none; b=mmdZZByhCeH5Gr3IFdT8waW1ydAH//awh+Cs9oFhrY1tLB+pJSuWVWRZ0Ya4APSahoMzEfflLOvYsPcgzxXsIFYt5BDYxcYJAK+w0M9izF5rGOPQkQQMo15JTPDV77XXT0Fb/cLxYxGWl1HqGB3wljAo8qnCPBAWkKKNUhnSe/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748368697; c=relaxed/simple;
	bh=67F8WhrKKu8zppfcVaWp1zZS0mpMBMhKf7JuqYMzugc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SzRUjSiBZWa6bNJhHmO+Ei/AubJOWv1bobMHzarXm3ZxNb1pD2ogvvN1Sbo9KpRpTR6TTrdyO0XduWd3Hi71f+8bTcPweewrtRxYBBWgir9+QJfT0DYBJtrqou00TVMKrm7VcW3/iu1QI5fmbyQdGmpRuGuB+JcjZNdtHXhMh5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Wigl16jf; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Wigl16jf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748368696; x=1779904696;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=67F8WhrKKu8zppfcVaWp1zZS0mpMBMhKf7JuqYMzugc=;
  b=Wigl16jfOBHkvneMct0T/REdyqXlnM4eoUefbLaV4Ls6w6BSm8P9tcDi
   amdfpg0mBHEdgIq78Fuk1IBPQwjiZ9dSiqWJBk4TC8lSmqwihQ7N9uP6v
   5cZJDRUklU1Go4rID8VfVUSSY5Rot/LaK59eAyvdw1aQ18OivBHriClSg
   Kwi9RxUwHa/wWb0dkiswuQCG8MbNMGwVYi7WuqRJigbjzB4zLTL8lZzQS
   ZlwzMEWhkxEKAJMR6OVIMNml1yhtRF+Gw/wyHxY/RTM++uSvvisdp6YSg
   5b9tdr47XLPZwWxZlxswmtHCqL2vcIixR9A4z63aJgOFw1lP5N2vezejU
   A==;
X-CSE-ConnectionGUID: uBMX1v/4SniACsWP3wr7yg==
X-CSE-MsgGUID: 9Dqd6XaEQAmBqVmEiUFQ6g==
X-IronPort-AV: E=McAfee;i="6700,10204,11446"; a="50429289"
X-IronPort-AV: E=Sophos;i="6.15,319,1739865600"; 
   d="scan'208";a="50429289"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2025 10:58:15 -0700
X-CSE-ConnectionGUID: vjFbv+AUQPaPBmeVo5HqnA==
X-CSE-MsgGUID: r5xzi2zeT5GDDIkSGXNnMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,319,1739865600"; 
   d="scan'208";a="142747889"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 27 May 2025 10:58:13 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uJyZ1-000Up0-2j;
	Tue, 27 May 2025 17:58:11 +0000
Date: Wed, 28 May 2025 01:57:53 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, =?utf-8?B?6Zer5rW35rab?= <yanhaitao2@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2300/2300] fs/nfs/dir.c:1498:6: warning: no
 previous prototype for 'nfs_check_have_lookup_cache_flag'
Message-ID: <202505280148.N1Nt6ytB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   35c5792a71f249ce79eba3cbb546d1ece7c4f3ee
commit: 18e360871c3f648ecb0d8cc9b23fd4268a64c17f [2300/2300] add enfs feature
config: loongarch-allmodconfig (https://download.01.org/0day-ci/archive/20250528/202505280148.N1Nt6ytB-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250528/202505280148.N1Nt6ytB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505280148.N1Nt6ytB-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/nfs/dir.c:1498:6: warning: no previous prototype for 'nfs_check_have_lookup_cache_flag' [-Wmissing-prototypes]
    1498 | bool nfs_check_have_lookup_cache_flag(struct nfs_server *server, int flag)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/nfs_check_have_lookup_cache_flag +1498 fs/nfs/dir.c

  1497	
> 1498	bool nfs_check_have_lookup_cache_flag(struct nfs_server *server, int flag)
  1499	{
  1500	#if IS_ENABLED(CONFIG_ENFS)
  1501		return enfs_check_have_lookup_cache_flag(server, flag);
  1502	#else
  1503		return (server->flags & NFS_MOUNT_LOOKUP_CACHE_NONE);
  1504	#endif
  1505	}
  1506	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
