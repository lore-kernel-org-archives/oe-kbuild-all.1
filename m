Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E6891386DA
	for <oe-kbuild-all@lists.linux.dev>; Fri, 29 Nov 2024 02:56:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732849022; cv=none; b=kgbSHaLkhqrcRpfpCRtgtDSjnLcAOHH/GxLYIulZUUa8LoRNHHLt0CYpRWrkBJzqjJFiCYvMhiGLKrZT5wJmOPBU+39SpNP9Ggm+oi360udKMcxvBPN+8J5ccAHWbQorzRkojfmW3iakNrhczBAP/WPBqGfvuxrHsBDLDi/o8v0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732849022; c=relaxed/simple;
	bh=iDkXfsivk8etMQv0ta4yTp3rk2Y61TnkjPm7woXGiww=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fk4q87eMTJ8Bsr/4WMtDyL61HImtAtsSVYfKTZS4MxUNHnv8yrNexQzIWq77fRCROsV6OPzoUzNppt38Sts8yJvKMo4hNl3xtyGkXEiaRGs5S3wjyILL1JGNtNlixGqRy9Z58yPQgEVxUi/I9kFEWCv12vHHrzK3YVB8bRWye60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fMkI8V9E; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fMkI8V9E"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732849021; x=1764385021;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=iDkXfsivk8etMQv0ta4yTp3rk2Y61TnkjPm7woXGiww=;
  b=fMkI8V9Ed6tYVM/c1DWl3KXIilpilIvCa83Y80gmUClCv03wQuqlk4QO
   zpVwqdPaL1gLqEgUDIAlXwlembgCTnZ/M3pROHudu+V8gdltc77hbsT4e
   QnnD/cb/LsObJ/KfzS0PeoDDpO8+oYun0uxLdNKoSqHhBuQvWtTD7vEm+
   On0UYuyxiALFPMxzSRcjIwooUhFMa8j9Lbb6uNf/2btz5+7djzU+kv5iU
   fGKEMm3CdLGZfCc+zlWbGfXvkNwAR2uqZZ029ykwlTpThsoVkoiMhwfD9
   Jds5NM4WFRynENjTWX0Asb9DnHKOCd6xOM7nfRZlGVzFBMfMHgsD3KCDJ
   A==;
X-CSE-ConnectionGUID: NQJy3X3xTGGWSKDn6/6gFA==
X-CSE-MsgGUID: jpbF3F6uRg2OviyK6MirAQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11270"; a="36869002"
X-IronPort-AV: E=Sophos;i="6.12,194,1728975600"; 
   d="scan'208";a="36869002"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2024 18:57:00 -0800
X-CSE-ConnectionGUID: PBzt42mnQlmWY+mpZwhcQg==
X-CSE-MsgGUID: dzAqC/JQQTGOL9OLeg9EcQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,194,1728975600"; 
   d="scan'208";a="97137006"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 28 Nov 2024 18:56:58 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tGrBf-000AGl-2P;
	Fri, 29 Nov 2024 02:56:55 +0000
Date: Fri, 29 Nov 2024 10:56:38 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Huacai Chen <chenhuacai@loongson.cn>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 1484/1484] drivers/md/dm-cache-metadata.c:1729:9:
 warning: 'strncpy' specified bound 16 equals destination size
Message-ID: <202411291031.9VhI0eVO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Feiyang,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   95bc69473a373c2e578d4fc39734e5811a03ead3
commit: 2363088eba2ecccfb643725e4864af73c4226a04 [1484/1484] LoongArch: Allow building with kcov coverage
config: loongarch-randconfig-001-20241119 (https://download.01.org/0day-ci/archive/20241129/202411291031.9VhI0eVO-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241129/202411291031.9VhI0eVO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411291031.9VhI0eVO-lkp@intel.com/

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
