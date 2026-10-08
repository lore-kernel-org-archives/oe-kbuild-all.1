Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0249E3B3C06
	for <oe-kbuild-all@lists.linux.dev>; Thu,  8 Oct 2026 17:23:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791480237; cv=none; b=q7eHnwnKkDeJDDLxmejvjWOTitRdN+kgFOfGjl6Vxz3X3TkbekBxPGuIjCFbC4fojzltmAtXaXmmO3hn/9pLNKYsA+6cVJkD1/3Vk+F6cK1NQ5WYy7sz6Xf9q4MFYtst+vRo1JiMidKcQ0MWQcQcsYpVPmCwlZzZU0sBOf6XeVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791480237; c=relaxed/simple;
	bh=q9mXtZ0rKen0UA32Q+eYADsb87+XgV6XYr3JUGm2SdA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Z7hJZZLWbVxKH91N59AOHlx7q4cORYC665c8r+eaFIgrQppZAlO42Z9dlyahgun++kKPLAWlZyRhWQo2dgnBLi7pft44/X7Hf3nZGHpVhDZTbtqEJqFZBbTvv1n1EA7UMRVYIMttw+vlDT6GAMumv4GPBzIHZcV+MVLp9za+mIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bPbFiHO4; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bPbFiHO4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791480236; x=1823016236;
  h=date:from:to:cc:subject:message-id;
  bh=q9mXtZ0rKen0UA32Q+eYADsb87+XgV6XYr3JUGm2SdA=;
  b=bPbFiHO4BiZdETaMMzLLiXLIDnaiD4UH165uAFCZBjuPK5X9jsThEAwF
   09qPN8X63ZPwPxEmVpJJWcnJe5S/9MykymuaNPBmqhYi/Bh8pDL2HBMhg
   ytEFGy4z/7WCHbajNIpCD6tspgUEBKMrcwf3g4Q4mtm1kLRq0tCIgWyIU
   4hxcruj8IiPIsuSx1OY5S0lsCMv5JRES7C2Sz3zYCjdOAu0ie3DG66+DD
   uTSpi5yD8peCCyucQYBWC4YQi9qVEXcC1teJ0DtNr7PlMzBdFDobxJdTI
   EtLZ3q/ziH6R6x6qj396fyeffVHJm7yMRkj4L/a30nCQq2tBhShCi7UBm
   w==;
X-CSE-ConnectionGUID: xeJddGG9Q3qHB/hljwoZqA==
X-CSE-MsgGUID: lkuNdoduQyiPgWZbLi8E9w==
X-IronPort-AV: E=McAfee;i="6800,10657,11928"; a="268905"
X-IronPort-AV: E=Sophos;i="6.27,146,1787036400"; 
   d="scan'208";a="268905"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2026 10:23:52 -0700
X-CSE-ConnectionGUID: FiLghYH9RfaTQwpub/N6nA==
X-CSE-MsgGUID: +bK3zE31SEmsvyoFQ8Wyrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,146,1787036400"; 
   d="scan'208";a="211894"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 08 Oct 2026 10:23:51 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xErqO-000000005nN-2BmR;
	Thu, 08 Oct 2026 17:23:48 +0000
Date: Thu, 08 Oct 2026 19:23:39 +0200
From: kernel test robot <lkp@intel.com>
To: Miklos Szeredi <mszeredi@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev, fuse-devel@lists.sourceforge.net
Subject: [mszeredi-fuse:extent-map-v4 24/29] dev.c:undefined
 reference to `fuse_backing_open'
Message-ID: <202610081951.Ien80kqY-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mszeredi/fuse.git extent-map-v4
head:   4b2887a36cd547c2e59952e0a202094c82d9c6a9
commit: 922208fbfd2948a12a6348cc34709e6d54e4fcef [24/29] fuse: support 64 bit, server allocated backing ID
config: s390-randconfig-2000-20261008 (https://download.01.org/0day-ci/archive/20261008/202610081951.Ien80kqY-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261008/202610081951.Ien80kqY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610081951.Ien80kqY-lkp@intel.com/

All errors (new ones prefixed by >>):

   s390-linux-ld: arch/s390/kernel/syscall.o: in function `__do_syscall':
   syscall.c:(.noinstr.text+0x164): undefined reference to `syscall_enter_audit'
   s390-linux-ld: fs/fuse/dev.o: in function `fuse_dev_ioctl':
>> dev.c:(.text+0x913c): undefined reference to `fuse_backing_open'
>> s390-linux-ld: dev.c:(.text+0x9182): undefined reference to `fuse_backing_open_64'
>> s390-linux-ld: dev.c:(.text+0x91be): undefined reference to `fuse_backing_close'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
