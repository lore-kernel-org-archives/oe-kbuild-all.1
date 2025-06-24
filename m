Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE1292E7645
	for <oe-kbuild-all@lists.linux.dev>; Tue, 24 Jun 2025 18:57:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750791478; cv=none; b=FClWIywXUHLqyBwGc8iQJorhuoYvu5SNmnZxpGn82F87jtAyd97+AWvSphY4Hp+X036iNKHUL0ni3lRuv2nGx3FTQy0nRXee7RbN+WCERWoI+CqgBYTq3Zr9skDkWe7Bai1plyOj/CQEluFO4xfKdlG71J8sUjOqeC52pqMddVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750791478; c=relaxed/simple;
	bh=HZVasFwEYj3Rd+ibezMEtEg4QsuHlny3ooQ06xlLYhg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nlQgjLWY0NvOuV1EEOJz3KW766F7kSAO3hOmhpFbFb1zZJVrniiaJ/BmWOffWhODQlb1iy2dfHbQNFG+PshFEIzyPwK/TiPA12QaLKtV5D9bLtbM9CaKjrj9zo5RzC5S6iDb/dA7n1uIaXETZ1+Yxgs8E0Sa29DCF/DDP+CRKL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BVLtOrCG; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BVLtOrCG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750791476; x=1782327476;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HZVasFwEYj3Rd+ibezMEtEg4QsuHlny3ooQ06xlLYhg=;
  b=BVLtOrCGnf5PYtWMHzTprsJSJsBZ7Qtzxf4PRcQudT2Niv2ajy3RODYi
   7GQ9qgD3voQb1wmZf0TBjjgxDC8XZGOjbnQ5Ot5X7qAvTn8ROrEDbRPV4
   z2FrwCtT5yD296ttlz0feBPcdCUOxixhcKGe3MehWZXcFGcwuJIF0G/IT
   Gt7zCoR0FhpkP2Xzq8ae6MP6t3bTLd9imgDt1yu4T81Grj60huDumkJ5J
   Zv/tEzHjUP6SLeXBPRMOGZXJG3D7zfkOMFP+tSKhcxEZFjorpwyWmANr6
   tGcXApQ/791619pVW6gF1Eoh5D4hD/DfY5J8pARdt3aqKq24DB+gsP7BJ
   w==;
X-CSE-ConnectionGUID: Rz60LqpLRWqZRCnrkViiXA==
X-CSE-MsgGUID: fA3noZxeS0OKjTRhlSvQNA==
X-IronPort-AV: E=McAfee;i="6800,10657,11474"; a="56851294"
X-IronPort-AV: E=Sophos;i="6.16,263,1744095600"; 
   d="scan'208";a="56851294"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2025 11:57:55 -0700
X-CSE-ConnectionGUID: gEXcanq3Rl6zcpD6isRe8g==
X-CSE-MsgGUID: 1tBw1KPiSgKCZp25lEo6Pg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,263,1744095600"; 
   d="scan'208";a="152287713"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 24 Jun 2025 11:57:54 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uU8q8-000SQQ-0R;
	Tue, 24 Jun 2025 18:57:52 +0000
Date: Wed, 25 Jun 2025 02:57:13 +0800
From: kernel test robot <lkp@intel.com>
To: Davidlohr Bueso <dave@stgolabs.net>
Cc: oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [akpm-mm:mm-new 203/215] memcontrol.c:undefined reference to
 `user_proactive_reclaim'
Message-ID: <202506250208.ZOcoZLb6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-new
head:   d1c90ab3cf156e6dcfb3b74bbb1fc26d99cea303
commit: 67cc9632fbf2d4095ced88c37130de79914140d6 [203/215] mm/memcg: make memory.reclaim interface generic
config: i386-buildonly-randconfig-003-20250625 (https://download.01.org/0day-ci/archive/20250625/202506250208.ZOcoZLb6-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250625/202506250208.ZOcoZLb6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506250208.ZOcoZLb6-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: mm/memcontrol.o: in function `memory_reclaim':
>> memcontrol.c:(.text+0xa06): undefined reference to `user_proactive_reclaim'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
