Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 021D01459E0
	for <oe-kbuild-all@lists.linux.dev>; Tue, 19 Nov 2024 02:58:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731985137; cv=none; b=O3oHX+MJNKfeZUB6cSAi2iMKojLk3NSuHEH0CbgxRbFFn6U5yXsgWxnsUbWnApGW/feWPTsUEdwthhiwWmldHOpbY6N7u9O64g8lslVqjbYK6J276HO2Z9claz85rjs2E6uEYp/Oi20oLT1dMsuTeUDYBlbyQ53bPsZIhbhPQzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731985137; c=relaxed/simple;
	bh=64En54uWTS5HNMoKdothIDU4gHy0LF/uFl+zWeaaymI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HwDXqmFbaV9PeHm5R9coYmxlY4HEejypxON07WHmz2fDvMtslamWM9rT0ilSBdDN4ZofQeIzBHBAWqCiDWIt96Skipht3+sg6pQ7lLRExI9PH2CU68smtuCudvQM6Q7MwBePx0krLZu9LfnVOZtgM0ZehZiexW+VWnEneLGB95M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iIkvWDCN; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iIkvWDCN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731985136; x=1763521136;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=64En54uWTS5HNMoKdothIDU4gHy0LF/uFl+zWeaaymI=;
  b=iIkvWDCNw5gMDD3UMNqQlyYgDPGPTCKAIhRK5YFqCH60JywMNwgENxZl
   btRW4n6PAM5QfJOttN32t5vaH6rWyAhfjj0H0AtA/X2pARAoss2Rq4VqJ
   I5p5tER99+2GmYWykQxFXg9dxnoJmsxzxWZz+nUs087HzL0z0omdi9rU5
   dg9A7DwlZlimSjwrAj+B5VRhGzm+HKhYAr6iZVwsmvh8qbuLHshKBTf2Q
   O0OwcPoTMABmU8tsOw79HXGOz+MEPFDMfP0TOJSK4l7HS0kMtl9mjThpl
   bRdYtgGEHHvHGB5d5/ktK7Xg3scOw5wA4fGgvj7HydVDZPxFrwmDDHqNt
   g==;
X-CSE-ConnectionGUID: S/CPfq2SSFKAP70758zt2Q==
X-CSE-MsgGUID: oym5JtqxQqKKk2VJj5lyFg==
X-IronPort-AV: E=McAfee;i="6700,10204,11260"; a="19577251"
X-IronPort-AV: E=Sophos;i="6.12,165,1728975600"; 
   d="scan'208";a="19577251"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2024 18:58:55 -0800
X-CSE-ConnectionGUID: XMy98sH7S1WcTmcSQOT+nA==
X-CSE-MsgGUID: aJ39TvK5RYSx3n7cMlmuUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,165,1728975600"; 
   d="scan'208";a="89840697"
Received: from lkp-server02.sh.intel.com (HELO 2cc4542d09d4) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 18 Nov 2024 18:58:54 -0800
Received: from kbuild by 2cc4542d09d4 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tDERl-00004C-2U;
	Tue, 19 Nov 2024 02:58:39 +0000
Date: Tue, 19 Nov 2024 10:57:06 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Huacai Chen <chenhuacai@loongson.cn>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 1484/1484] drivers/md/dm-cache-metadata.c:1729:9:
 warning: 'strncpy' specified bound 16 equals destination size
Message-ID: <202411191039.9EY0Nxk9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   8a039651010897592567f5751c4e706ab794e9c0
commit: 2363088eba2ecccfb643725e4864af73c4226a04 [1484/1484] LoongArch: Allow building with kcov coverage
config: loongarch-randconfig-001-20241119 (https://download.01.org/0day-ci/archive/20241119/202411191039.9EY0Nxk9-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241119/202411191039.9EY0Nxk9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411191039.9EY0Nxk9-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In function 'write_hints',
       inlined from 'dm_cache_write_hints' at drivers/md/dm-cache-metadata.c:1753:6:
>> drivers/md/dm-cache-metadata.c:1729:9: warning: 'strncpy' specified bound 16 equals destination size [-Wstringop-truncation]
    1729 |         strncpy(cmd->policy_name, policy_name, sizeof(cmd->policy_name));
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/strncpy +1729 drivers/md/dm-cache-metadata.c

4e781b498ee500 Joe Thornber      2016-09-15  1713  
4e781b498ee500 Joe Thornber      2016-09-15  1714  /*
4e781b498ee500 Joe Thornber      2016-09-15  1715   * It's quicker to always delete the hint array, and recreate with
4e781b498ee500 Joe Thornber      2016-09-15  1716   * dm_array_new().
4e781b498ee500 Joe Thornber      2016-09-15  1717   */
4e781b498ee500 Joe Thornber      2016-09-15  1718  static int write_hints(struct dm_cache_metadata *cmd, struct dm_cache_policy *policy)
c6b4fcbad044e6 Joe Thornber      2013-03-01  1719  {
c6b4fcbad044e6 Joe Thornber      2013-03-01  1720  	int r;
c6b4fcbad044e6 Joe Thornber      2013-03-01  1721  	size_t hint_size;
c6b4fcbad044e6 Joe Thornber      2013-03-01  1722  	const char *policy_name = dm_cache_policy_get_name(policy);
86a3238c7b9b75 Heinz Mauelshagen 2023-01-25  1723  	const unsigned int *policy_version = dm_cache_policy_get_version(policy);
c6b4fcbad044e6 Joe Thornber      2013-03-01  1724  
c6b4fcbad044e6 Joe Thornber      2013-03-01  1725  	if (!policy_name[0] ||
c6b4fcbad044e6 Joe Thornber      2013-03-01  1726  	    (strlen(policy_name) > sizeof(cmd->policy_name) - 1))
c6b4fcbad044e6 Joe Thornber      2013-03-01  1727  		return -EINVAL;
c6b4fcbad044e6 Joe Thornber      2013-03-01  1728  
c6b4fcbad044e6 Joe Thornber      2013-03-01 @1729  	strncpy(cmd->policy_name, policy_name, sizeof(cmd->policy_name));
4e7f506f642963 Mike Snitzer      2013-03-20  1730  	memcpy(cmd->policy_version, policy_version, sizeof(cmd->policy_version));
c6b4fcbad044e6 Joe Thornber      2013-03-01  1731  
c6b4fcbad044e6 Joe Thornber      2013-03-01  1732  	hint_size = dm_cache_policy_get_hint_size(policy);
c6b4fcbad044e6 Joe Thornber      2013-03-01  1733  	if (!hint_size)
c6b4fcbad044e6 Joe Thornber      2013-03-01  1734  		return 0; /* short-circuit hints initialization */
c6b4fcbad044e6 Joe Thornber      2013-03-01  1735  	cmd->policy_hint_size = hint_size;
c6b4fcbad044e6 Joe Thornber      2013-03-01  1736  
c6b4fcbad044e6 Joe Thornber      2013-03-01  1737  	if (cmd->hint_root) {
c6b4fcbad044e6 Joe Thornber      2013-03-01  1738  		r = dm_array_del(&cmd->hint_info, cmd->hint_root);
c6b4fcbad044e6 Joe Thornber      2013-03-01  1739  		if (r)
c6b4fcbad044e6 Joe Thornber      2013-03-01  1740  			return r;
c6b4fcbad044e6 Joe Thornber      2013-03-01  1741  	}
c6b4fcbad044e6 Joe Thornber      2013-03-01  1742  
4e781b498ee500 Joe Thornber      2016-09-15  1743  	return dm_array_new(&cmd->hint_info, &cmd->hint_root,
c6b4fcbad044e6 Joe Thornber      2013-03-01  1744  			    from_cblock(cmd->cache_blocks),
4e781b498ee500 Joe Thornber      2016-09-15  1745  			    get_hint, policy);
0596661f0a16d9 Joe Thornber      2014-04-03  1746  }
0596661f0a16d9 Joe Thornber      2014-04-03  1747  

:::::: The code at line 1729 was first introduced by commit
:::::: c6b4fcbad044e6fffcc75bba160e720eb8d67d17 dm: add cache target

:::::: TO: Joe Thornber <ejt@redhat.com>
:::::: CC: Alasdair G Kergon <agk@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
