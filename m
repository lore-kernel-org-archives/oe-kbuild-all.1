Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D1AA1EDA0E
	for <oe-kbuild-all@lists.linux.dev>; Wed, 30 Apr 2025 07:11:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745997082; cv=none; b=la8Dx69b9KFSESM4sSllYc03rBJxlLEfE+gf6aKQKWjCOe04pGTViZrHanDycDYaPwIz7u9PZ846BtT5aO5HxxLmT5LcmWqysEH3P+KeAHn7uPvjld2dLJ30r3JPyKTUkIpaYqQ2n+1EW4bqGnt5qql7qL5/J7vm8Ib4yT0kAj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745997082; c=relaxed/simple;
	bh=vXRsqoQd1dqbm/BOrhibaZ8JngwF3XcTNYp+0Tl8xPo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kNPpJeWkVgxZRD9L3HIk8zw2XAQOYP4b2UIU3eHb9HQwkyFOf04rTfyGDx8VQSCpdB42hLofJegq1+D6OxCAIxLFlnu+QvF444j27PyKtyeLFmDL9na9QiWdTIWN17/rJaME6uK+MYcXlKrFFzJ+bpME61T+7LpKicPkOj4A/6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=I8AuFZKk; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I8AuFZKk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745997080; x=1777533080;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vXRsqoQd1dqbm/BOrhibaZ8JngwF3XcTNYp+0Tl8xPo=;
  b=I8AuFZKkURBQtaOak+RWjqsll6/QiULIwZXQmDjfNGdExaDLOW1c2gxq
   qjLLPdHWfx1NeJKgDZ/jCJ/ErTwVMkbn1gx//kq7oZEBvYnwDSjTxF8GV
   pCVRend99JJhf9OexJWesr4k9qLjnAj5kNyJITrKDYCEqkyOEj0Fg2YRn
   PWh4ZutXfhCaSDC0iIJIY4YNr89zeCpvHOdlLc6/PybY+5kRrar18HKXx
   zV7wSK1IB2RxODN4rRIqGFzlflVDsK8yY+OJ3NwWAupJw+84lXqirGeu3
   CNrVzcleMUcurp/xfZdMReng5WBk7qhA9K2zOKuJ8R+2+Abp9I1DZwL+H
   A==;
X-CSE-ConnectionGUID: Ld+tamUNTcGqUoMz/OFM7Q==
X-CSE-MsgGUID: +6l7ivXjQhKGcMCh2wRAhQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11418"; a="47525976"
X-IronPort-AV: E=Sophos;i="6.15,251,1739865600"; 
   d="scan'208";a="47525976"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2025 00:11:20 -0700
X-CSE-ConnectionGUID: eNyvk5cyR32bfk8RHGRBMA==
X-CSE-MsgGUID: iQe0scwkQ4SYY8mffpBA8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,251,1739865600"; 
   d="scan'208";a="139019786"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 30 Apr 2025 00:11:18 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uA1b9-0003Fb-2u;
	Wed, 30 Apr 2025 07:11:15 +0000
Date: Wed, 30 Apr 2025 15:10:30 +0800
From: kernel test robot <lkp@intel.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Igor Belousov <igor.b@beldev.am>
Subject: [akpm-mm:mm-new 272/300] mm/zblock.h:24:2: warning: #warning This
 PAGE_SIZE is not quite supported yet
Message-ID: <202504301414.rk250nPa-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-new
head:   f227084b1b7b3367578e989479a874af2c064c96
commit: 46ef148f198a9144df5e1ccf3a378d193c779f10 [272/300] mm-zblock-avoid-failing-the-build-fix
config: sparc64-randconfig-002-20250430 (https://download.01.org/0day-ci/archive/20250430/202504301414.rk250nPa-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250430/202504301414.rk250nPa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504301414.rk250nPa-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from mm/zblock.c:28:
>> mm/zblock.h:24:2: warning: #warning This PAGE_SIZE is not quite supported yet [-Wcpp]
      24 | #warning This PAGE_SIZE is not quite supported yet
         |  ^~~~~~~


vim +24 mm/zblock.h

    16	
    17	#if PAGE_SIZE == 0x1000
    18	/* max 128 slots per block, max table size 32 */
    19	#define SLOT_BITS 7
    20	#elif PAGE_SIZE == 0x4000
    21	/* max 256 slots per block, max table size 64 */
    22	#define SLOT_BITS 8
    23	#else
  > 24	#warning This PAGE_SIZE is not quite supported yet
    25	#define SLOT_BITS 8
    26	#endif
    27	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
