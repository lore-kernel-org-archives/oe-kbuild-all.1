Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1266713DBBD
	for <oe-kbuild-all@lists.linux.dev>; Thu, 13 Jun 2024 08:37:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718267869; cv=none; b=Gk4CP5U44Tg4F2HIhyrKduSgtrUa4UMiwU3CMXxj873x6haJbB0vvOvMvXYZlkHc0vU/1qL9JYPljfqmvn9aRNJ7GG0uUQPOgN6UBfmXnEVymwbfo4l8GQU5vigqAkQAyXDI7aectIIS1UGYQLnhvICaP6EEXF6TDVg42N8l0NQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718267869; c=relaxed/simple;
	bh=pbiICk1NvUbx1opHd31gHEACpi5Wu+kiJhrXvU47t/Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fpH7NhVPPoml1Q8u5sPamIWzpo7WEPjwEVn/BUAGM9L4qfmY3BhleQw4ryd31aCe5MQtrRmccD9Oawzt672XJLtJnFtTh2qndvR6VAulRYZxwGr4LAs0YcE9GyJSokgNhSTOtEMtIu3oR4QFzPeaNRLeaXtUGBbRjEUreEZ9iy0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Xh55lX9t; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Xh55lX9t"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718267868; x=1749803868;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pbiICk1NvUbx1opHd31gHEACpi5Wu+kiJhrXvU47t/Y=;
  b=Xh55lX9ty03ESLn3OnByIYilKXGyQ4b8cOuDjSGHbRCRIpKWy/Ne2lKb
   N9JC2m2GIcxu6uBeznEOYedf7l91Ew20CMJWqM1bFlkrkHOw/1PK7Qu72
   WcI1+VcSsN62SzPYSj53XWHHrAed2mIjwA2gF6Vpc5fpXace/RycjM7jA
   jmL0vG+Uw5Ss/SVjpAe2PNtGMbVg+sKGNYal2Q5XykMxmCkc4H5+m/q1q
   OsRRNNOPP+iFxseOhSCAUwoFeKya418oqED2tmw72bjLj4utWIA7gXJ2H
   V+yn8GKHoAwS7AruyqxmjT1NL38292ppUJm179EjA6ooQzMS/idI/5JeO
   g==;
X-CSE-ConnectionGUID: NhTJOSNLR6O4cSJS0zB1uA==
X-CSE-MsgGUID: YIAamoOYTOWaxowsprHtSA==
X-IronPort-AV: E=McAfee;i="6700,10204,11101"; a="14911315"
X-IronPort-AV: E=Sophos;i="6.08,234,1712646000"; 
   d="scan'208";a="14911315"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2024 01:37:47 -0700
X-CSE-ConnectionGUID: ppmNYU/fQXelLIEucJe/Xg==
X-CSE-MsgGUID: Xjrf+IA8R96KuiWHZeRNdg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,234,1712646000"; 
   d="scan'208";a="44517411"
Received: from lkp-server01.sh.intel.com (HELO 628d7d8b9fc6) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 13 Jun 2024 01:37:46 -0700
Received: from kbuild by 628d7d8b9fc6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sHfxo-0002Pu-2C;
	Thu, 13 Jun 2024 08:37:44 +0000
Date: Thu, 13 Jun 2024 16:37:07 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Layton <jlayton@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jlayton:kdevops 10/10] fs/inode.c:71:23: sparse: sparse: symbol
 'mg_fine_ts' was not declared. Should it be static?
Message-ID: <202406131650.mVbtshYd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git kdevops
head:   48f5457ddd3d877e03ae701eb215dc28f6d04fe3
commit: 48f5457ddd3d877e03ae701eb215dc28f6d04fe3 [10/10] fs: add percpu counters to count fine vs. coarse timestamps
config: x86_64-randconfig-122-20240613 (https://download.01.org/0day-ci/archive/20240613/202406131650.mVbtshYd-lkp@intel.com/config)
compiler: gcc-10 (Ubuntu 10.5.0-1ubuntu1) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240613/202406131650.mVbtshYd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406131650.mVbtshYd-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> fs/inode.c:71:23: sparse: sparse: symbol 'mg_fine_ts' was not declared. Should it be static?
>> fs/inode.c:72:23: sparse: sparse: symbol 'mg_coarse_ts' was not declared. Should it be static?
   fs/inode.c: note: in included file (through include/linux/wait.h, include/linux/wait_bit.h, include/linux/fs.h):
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   fs/inode.c:856:17: sparse: sparse: context imbalance in 'inode_lru_isolate' - unexpected unlock
   fs/inode.c:911:9: sparse: sparse: context imbalance in 'find_inode' - different lock contexts for basic block
   fs/inode.c:942:9: sparse: sparse: context imbalance in 'find_inode_fast' - different lock contexts for basic block
   fs/inode.c:1631:5: sparse: sparse: context imbalance in 'insert_inode_locked' - wrong count at exit
   fs/inode.c:1749:20: sparse: sparse: context imbalance in 'iput_final' - unexpected unlock
   fs/inode.c:1763:6: sparse: sparse: context imbalance in 'iput' - wrong count at exit
   fs/inode.c:2306:13: sparse: sparse: context imbalance in '__wait_on_freeing_inode' - unexpected unlock

vim +/mg_fine_ts +71 fs/inode.c

    69	
    70	/* Keep track of the number of fine vs. coarse timestamp fetches */
  > 71	struct percpu_counter mg_fine_ts;
  > 72	struct percpu_counter mg_coarse_ts;
    73	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
