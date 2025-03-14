Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87A5B42AA6
	for <oe-kbuild-all@lists.linux.dev>; Fri, 14 Mar 2025 12:10:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741954248; cv=none; b=mivcRHFHz+ThTQpQc9FT0sZjMDBiholfM3PvxeLMbfUe0fYn4b3tQphWkm2Stcpdh1zuJX9CpP/CqVTnQU3SDvdAhDunzF2klVyQEMwmF3wtwJp5itvysJqzOx2+65dZPUFYGG2E6Ft3WZMG02BFz3mUZgmIVO+ZXeHTi7eU61c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741954248; c=relaxed/simple;
	bh=xyQ0AAMkwBynoGPDtrWiplFblZRy8u77NdfdRlvmbjk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=aRNARIOKPwBazYrJ4sqTdpZdYmpd49xpq7CfWT4NhQbFHZPmDjp//vwSWgjaUc02h/vjXrbc1uAJdueQwEMbwLdzEr9ETMtTePPRPX717aVrLaKe2QnOybVZCqCxk0XInLgQaxcbd0N7RoUxfd5NJadeCbxfdz0LgmnvhsPcsko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=F8IDDYCD; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="F8IDDYCD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741954247; x=1773490247;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xyQ0AAMkwBynoGPDtrWiplFblZRy8u77NdfdRlvmbjk=;
  b=F8IDDYCDkNHvxfi0V5x2OEErEu2X6Z9KzAiGtdXBDgMGCyVYIB7ujdaD
   miNJzV/MWwnTW3feAEeOSWjATkV1T10hc6mLfgn962ATWRdc2XZoiX/at
   jHqfbKU8CObrPjp/AdrZkKp9Ib8oenokCwNUgPdwHPCW6MfA80ShWaseA
   tZ8CH13Nxp9S+tmwMguWDnAF5RQYHfJRSnz1eZwHK9P+b1jOToGdrn3on
   bTnD7NETCG6jkhOa+0OffXtI5HDXC6BIqCjhRDTNoJTjQVsUcpjiXvXe8
   LD5f278KtZB7LlNJmiy1xW60sjVf6oGF251nV/K1k+Vjt3LZGW+NqxBf/
   w==;
X-CSE-ConnectionGUID: Jz6FcTvbQse5E4Cd2n/1DQ==
X-CSE-MsgGUID: qqUq0EfhSIaPtaY2G44FPg==
X-IronPort-AV: E=McAfee;i="6700,10204,11372"; a="53309642"
X-IronPort-AV: E=Sophos;i="6.14,246,1736841600"; 
   d="scan'208";a="53309642"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Mar 2025 05:10:46 -0700
X-CSE-ConnectionGUID: xZBo46Y1QiSE5OJQzRnU9w==
X-CSE-MsgGUID: qUyXMCe2Re29umFKRVmy9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,246,1736841600"; 
   d="scan'208";a="121975391"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 14 Mar 2025 05:10:45 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tt3sB-000AQS-0W;
	Fri, 14 Mar 2025 12:10:43 +0000
Date: Fri, 14 Mar 2025 20:10:31 +0800
From: kernel test robot <lkp@intel.com>
To: Vlastimil Babka <vbabka@suse.cz>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [vbabka:locking-bench 2/2] lib/locking-benchmark.c:6:10: fatal
 error: asm/tsc.h: No such file or directory
Message-ID: <202503142029.wXioEync-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vbabka/linux.git locking-bench
head:   df4891c13ee02fedadd66a990dd65c911f6b7ada
commit: df4891c13ee02fedadd66a990dd65c911f6b7ada [2/2] lib/test: add locking-benchmark module
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20250314/202503142029.wXioEync-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250314/202503142029.wXioEync-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503142029.wXioEync-lkp@intel.com/

All errors (new ones prefixed by >>):

>> lib/locking-benchmark.c:6:10: fatal error: asm/tsc.h: No such file or directory
       6 | #include <asm/tsc.h>
         |          ^~~~~~~~~~~
   compilation terminated.


vim +6 lib/locking-benchmark.c

   > 6	#include <asm/tsc.h>
     7	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
