Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFB561369
	for <oe-kbuild-all@lists.linux.dev>; Fri,  3 Nov 2023 02:21:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Y7itCuMw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698978116; x=1730514116;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ZumkGyBybENqABl/D6Yws5gUnJevGw9jLJqJlSSfDjY=;
  b=Y7itCuMwAtptYTCNYAkVsjFUz7d1cnsH+K9/0o8+bS7tm4tKMEu+1dv8
   6x1ZWCLm3+Cs3NR1OI4xKmIIBkQgcarL+HsOovOsDilUecFbNq3NZvKYc
   wrevtSeR0GNwXpdhg13NJLtD86mp9EUz1vzQch3QOAnT1NUPo34s9Q6P2
   LdSzniWThWKRSFm9njVoES45eWBLfcBelZDXWykfDgxQmFaakfqwhjMq1
   B8mKpdkpyA1FV8tLZw+Eo+36HhlVKneBBD3XV1K/NG9mBuSPlzYlbt0UH
   0/1ACj6BvLOAR/gWtTKvOFc2AXd2nCfm6pW7ju7/YX2HBGqxRNr/zTebs
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10882"; a="388687746"
X-IronPort-AV: E=Sophos;i="6.03,272,1694761200"; 
   d="scan'208";a="388687746"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2023 19:21:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10882"; a="711367299"
X-IronPort-AV: E=Sophos;i="6.03,272,1694761200"; 
   d="scan'208";a="711367299"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 02 Nov 2023 19:21:53 -0700
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qyjok-00026u-2Y;
	Fri, 03 Nov 2023 02:21:50 +0000
Date: Fri, 3 Nov 2023 10:21:24 +0800
From: kernel test robot <lkp@intel.com>
To: Li Zhijian <lizhijian@fujitsu.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC 1/4] drivers/base/node: Add demotion_nodes sys
 infterface
Message-ID: <202311031052.cwUKB84l-lkp@intel.com>
References: <20231102025648.1285477-2-lizhijian@fujitsu.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231102025648.1285477-2-lizhijian@fujitsu.com>

Hi Li,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on driver-core/driver-core-testing]
[also build test ERROR on driver-core/driver-core-next driver-core/driver-core-linus staging/staging-testing staging/staging-next staging/staging-linus linus/master v6.6 next-20231102]
[cannot apply to akpm-mm/mm-everything]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Li-Zhijian/mm-vmstat-Move-pgdemote_-to-per-node-stats/20231102-135849
base:   driver-core/driver-core-testing
patch link:    https://lore.kernel.org/r/20231102025648.1285477-2-lizhijian%40fujitsu.com
patch subject: [PATCH RFC 1/4] drivers/base/node: Add demotion_nodes sys infterface
config: x86_64-buildonly-randconfig-005-20231103 (https://download.01.org/0day-ci/archive/20231103/202311031052.cwUKB84l-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231103/202311031052.cwUKB84l-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311031052.cwUKB84l-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/base/node.c:10:
>> include/linux/memory-tiers.h:50:15: error: unknown type name 'next_demotion_nodes'
      50 | static inline next_demotion_nodes next_demotion_nodes(int node)
         |               ^~~~~~~~~~~~~~~~~~~
   In file included from include/linux/mmzone.h:18,
                    from include/linux/gfp.h:7,
                    from include/linux/umh.h:4,
                    from include/linux/kmod.h:9,
                    from include/linux/module.h:17,
                    from drivers/base/node.c:6:
   include/linux/memory-tiers.h: In function 'next_demotion_nodes':
>> include/linux/nodemask.h:333:1: error: incompatible types when returning type 'nodemask_t' but 'int' was expected
     333 | ((nodemask_t) { {                                                       \
         | ^
   include/linux/memory-tiers.h:52:16: note: in expansion of macro 'NODE_MASK_NONE'
      52 |         return NODE_MASK_NONE;
         |                ^~~~~~~~~~~~~~
   drivers/base/node.c: In function 'demotion_nodes_show':
>> drivers/base/node.c:577:28: error: invalid initializer
     577 |         nodemask_t nmask = next_demotion_nodes(dev->id);
         |                            ^~~~~~~~~~~~~~~~~~~


vim +/next_demotion_nodes +50 include/linux/memory-tiers.h

    49	
  > 50	static inline next_demotion_nodes next_demotion_nodes(int node)
    51	{
    52		return NODE_MASK_NONE;
    53	}
    54	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
