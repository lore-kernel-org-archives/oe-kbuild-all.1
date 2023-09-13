Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ADF5EB8
	for <oe-kbuild-all@lists.linux.dev>; Wed, 13 Sep 2023 03:53:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694577186; x=1726113186;
  h=date:from:to:cc:subject:message-id;
  bh=wHl4c60SGCxrHflqXWAFFOudb1a6u2VnTY3DVPyUgaE=;
  b=PyRf2bN84L+9zQA/tR3MCeIy4gOPYX9j5eJguuN+g70feQXdcITJ/bYf
   M6PLkOQYm+BhYnSXRy4+Ksch0qniNV+r5IwLW3mC3w4zF9wBAwB3A4Mzz
   O/KYdtAhIaR7IhqvsPYftfvZXTsIryh5huADmPViV04rBwJEz8rX3BeJ6
   mkITajGQQxowKr1L5mRv15ndvKfvyLPb8LG2s4Yr0PWaM6PsQ8DHAntnH
   xpRHF0UOquIF/a+68fp4sffLTwZP3BOOxeSEVMpS0YIw8YfznVcic1H2e
   hWB3wIryfw8hQZf1aT12yBdXUf9gIm6bM/3AL3mq8jsGeZ7zrUOezWyNB
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="444995776"
X-IronPort-AV: E=Sophos;i="6.02,142,1688454000"; 
   d="scan'208";a="444995776"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Sep 2023 20:53:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="1074798159"
X-IronPort-AV: E=Sophos;i="6.02,142,1688454000"; 
   d="scan'208";a="1074798159"
Received: from lkp-server02.sh.intel.com (HELO e6439d5ea182) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 12 Sep 2023 20:53:02 -0700
Received: from kbuild by e6439d5ea182 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qgGvz-00003D-31;
	Wed, 13 Sep 2023 03:52:59 +0000
Date: Wed, 13 Sep 2023 11:52:02 +0800
From: kernel test robot <lkp@intel.com>
To: Qi Zheng <zhengqi.arch@bytedance.com>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: oe-kbuild-all@lists.linux.dev, lkp@intel.com,
 Josh Triplett <josh@joshtriplett.org>
Subject: [lkp] [+254 bytes kernel size regression] [i386-tinyconfig]
 [1487bcf83f] mm: shrinker: add infrastructure for dynamically allocating
 shrinker
Message-ID: <20230913035202.Nadls%lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>


FYI, we noticed a +254 bytes kernel size regression due to commit:

commit: 1487bcf83f874f0ff246e380e543dc61b80c8307 (mm: shrinker: add infrastructure for dynamically allocating shrinker)
https://git.kernel.org/cgit/linux/kernel/git/akpm/mm.git mm-unstable


Details as below (size data is obtained by `nm --size-sort vmlinux`):

533809aa: drm/ttm: introduce pool_shrink_rwsem
1487bcf8: mm: shrinker: add infrastructure for dynamically allocating shrinker

+---------------------------------+----------+----------+-------+
|             symbol              | 533809aa | 1487bcf8 | delta |
+---------------------------------+----------+----------+-------+
| bzImage                         | 522336   | 522464   | 128   |
| nm.T.shrinker_alloc             | 0        | 105      | 105   |
| nm.T.shrinker_free              | 0        | 84       | 84    |
| nm.T.shrinker_register          | 0        | 61       | 61    |
| nm.d.workingset_shadow_shrinker | 32       | 36       | 4     |
+---------------------------------+----------+----------+-------+



Thanks

