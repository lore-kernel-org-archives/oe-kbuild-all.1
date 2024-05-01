Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 317194E1A2
	for <oe-kbuild-all@lists.linux.dev>; Wed,  1 May 2024 09:12:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714554752; cv=none; b=roVYdS8ZurjwKR9/QORmQX+OeKplqtVp9j1yr6VMAdwWeofByzmLtjFZUN4yXwVrVrU2A4xfq5mVIBtjSvHOGWIRYXFN7OWROodCM6F3sUGDBlfSJe5uvr6ZVG/QFJ2a3y0UffT7ekSj2ofmbRqT7KZZujNButGh/83HdEYAx6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714554752; c=relaxed/simple;
	bh=IOmx16T8+EP39lsZqneaRZb9HdMZZlbP4sXAWBaKI2Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PD1fxqYv1Jve10yZFHMflKOuSjxX52tA6PgdG2ZkjJFw7qmbxe3wFW+iCkyviz4mDU6j1D878Gb9ppDgZ327AVUfSTMcIm1Aqc/pBhAwfvdZ5+LkY7VI+zvdGhjK87u6Q2OjPxz0YqOU6Y3Be36UTl9OeXLsR8kC6WZiqwRUbyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JT6+nQi2; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JT6+nQi2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714554750; x=1746090750;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IOmx16T8+EP39lsZqneaRZb9HdMZZlbP4sXAWBaKI2Q=;
  b=JT6+nQi2PLRm1mNwURk+//PqVSYd6JSYx701Xpmp5RxtV05F4RPkYCM8
   1Oy1GE54E8H3PeM5FA+ArUgfqLLsXE1ExCLmlqDiPyCmsrnaXnEClDSKy
   7oqzlMJYBYb+TQZdUp/nxRT9LqNx6Z/yrFZM9MOysIngeboN4Dae6BQeo
   sLNgOT3+3dLidcaO1iNDdVC2DQKlzluabcSAUuBPbPL1MFH/0uZlMn0tk
   D6rHhL5Bpz07ViIB1MaawEA25oqMbhF15evs9DhPQQS/r7x8yajGCgFYS
   S3Cwji1TOBShZjjNmJPnRgespJHXd7xbHuZPIz4xXdUKXAniwWv3w8HBj
   w==;
X-CSE-ConnectionGUID: 2wbatPzSTcqgJmO8xTwGVw==
X-CSE-MsgGUID: NTh0ZSSMSkavnC/3SAmOaw==
X-IronPort-AV: E=McAfee;i="6600,9927,11060"; a="10499997"
X-IronPort-AV: E=Sophos;i="6.07,244,1708416000"; 
   d="scan'208";a="10499997"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 May 2024 02:12:29 -0700
X-CSE-ConnectionGUID: 6E6UElIYTq+hegvZ92yNdA==
X-CSE-MsgGUID: Y5u/xAdjSDeN2mgjzzMXtQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,244,1708416000"; 
   d="scan'208";a="27144411"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 01 May 2024 02:12:28 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s260n-0009JS-2K;
	Wed, 01 May 2024 09:12:25 +0000
Date: Wed, 1 May 2024 17:11:26 +0800
From: kernel test robot <lkp@intel.com>
To: Lance Yang <ioworker0@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: [linux-next:master 9312/9709] sh4-linux-ld: rmap.c:undefined
 reference to `split_huge_pmd_locked'
Message-ID: <202405011728.yuc8zquM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   d04466706db5e241ee026f17b5f920e50dee26b5
commit: 6ae76ae5b2e07d4eb6b3e4fc594856d6500ade54 [9312/9709] mm/vmscan: avoid split lazyfree THP during shrink_folio_list()
config: sh-defconfig (https://download.01.org/0day-ci/archive/20240501/202405011728.yuc8zquM-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240501/202405011728.yuc8zquM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405011728.yuc8zquM-lkp@intel.com/

Note: the linux-next/master HEAD d04466706db5e241ee026f17b5f920e50dee26b5 builds fine.
      It may have been fixed somewhere.

All errors (new ones prefixed by >>):

   sh4-linux-ld: mm/rmap.o: in function `try_to_unmap_one':
   rmap.c:(.text+0x2468): undefined reference to `unmap_huge_pmd_locked'
>> sh4-linux-ld: rmap.c:(.text+0x246c): undefined reference to `split_huge_pmd_locked'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
