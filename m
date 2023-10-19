Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDC664292A
	for <oe-kbuild-all@lists.linux.dev>; Thu, 19 Oct 2023 23:03:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DFcYjpE+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697756617; x=1729292617;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IZabuOj/uRulC11iIDlWcbs61ho6sGrN5yIzkzgAyVY=;
  b=DFcYjpE+UIJt+uOtkce5ZL6dHRaKkCMOSGgU91SAeJeTn9JE3j35mvj4
   u4wPVmQ22xtvH0j5eJPHYorIRqR4ZsXyHEVS7VIMQ19Zzuuo2XW6YLcfh
   mwnjt8+e8ZTEGQBMGVYU1AoPYqQmdIYsFw4vrUa5xcFET/R8KcAUHkVeB
   bfseISzzsnRBLZNDrgSisnt3mzFQmQyhrwgpGH/dM4qzL3GFJCeO82XD+
   9tsRaFo1SNDSq+yVwxNFf5dM/ZNsbrgKkZQ1G8Vq/J2si8M1syAx5lCHq
   TaAcswIoHz0nJygd2IOGKYE7wzknCO/9AkjxGvDQmAOKEu+YFpDN/CGLL
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10868"; a="7948911"
X-IronPort-AV: E=Sophos;i="6.03,238,1694761200"; 
   d="scan'208";a="7948911"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2023 16:03:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10868"; a="880876982"
X-IronPort-AV: E=Sophos;i="6.03,238,1694761200"; 
   d="scan'208";a="880876982"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 19 Oct 2023 16:03:34 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qtc3A-0002hS-14;
	Thu, 19 Oct 2023 23:03:32 +0000
Date: Fri, 20 Oct 2023 07:02:51 +0800
From: kernel test robot <lkp@intel.com>
To: SeongJae Park <sj@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sj:damon/next 32/32] mm/damon/core-test.h:301:57: warning: unsigned
 conversion from 'long long int' to 'long unsigned int' changes value from
 '42949672960' to '0'
Message-ID: <202310200731.cnqhTnSF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sj/linux.git damon/next
head:   7b84b41c360c23460ff3a4329c001bd3e4c15827
commit: 782fb3d94a3c29b3411d09a9a601750e132b731f [32/32] mm/damon/core-test: test overflow-causing divide-by-zero
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20231020/202310200731.cnqhTnSF-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231020/202310200731.cnqhTnSF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310200731.cnqhTnSF-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from mm/damon/core.c:1749:
   mm/damon/core-test.h: In function 'damon_test_nr_accesses_to_accesses_bp':
>> mm/damon/core-test.h:301:57: warning: unsigned conversion from 'long long int' to 'long unsigned int' changes value from '42949672960' to '0' [-Woverflow]
     301 |                 .sample_interval = 10, .aggr_interval = 42949672960,};
         |                                                         ^~~~~~~~~~~


vim +301 mm/damon/core-test.h

   297	
   298	static void damon_test_nr_accesses_to_accesses_bp(struct kunit *test)
   299	{
   300		struct damon_attrs attrs = {
 > 301			.sample_interval = 10, .aggr_interval = 42949672960,};
   302	
   303		KUNIT_EXPECT_EQ(test, damon_nr_accesses_to_accesses_bp(123, &attrs), 0);
   304	}
   305	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
