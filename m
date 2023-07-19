Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2DE817F6
	for <oe-kbuild-all@lists.linux.dev>; Wed, 19 Jul 2023 17:22:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689787361; x=1721323361;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0YplUun0LXsh/q+rWYDJsnjkhgsL+vXZCzDIzlcnDJA=;
  b=HpsEDrQ487kZH8/1FdpMoU1oj8ctbFH6+w3csTw/MUSp0KSg6qWnGcOs
   GxpltSKuLN7+WFDXEPisxyLYsIM5bgqbD13TZshZVXBo/T36WKGnfCSaz
   ghraiLCOEDp5ZO4seLEVxn1ZUI7bpKsh41/ZCKNuxeR0lSuixcdVtESMa
   9upCO1xvrhm4eHwYz9yc/ZtrF7ukiUD/hBHYgx+fbhpKw8/+6ALizFKTE
   yhj0GoCGGIF3mOyDSCrSt8xDcHfo7cBo72yja8veGJibMrleG87a3Wc3g
   og/RCNl+3z9VlibM7fmKObl14hrYX8itCkVDH7vpY0grHPt6zl5OX0O/2
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10776"; a="366569082"
X-IronPort-AV: E=Sophos;i="6.01,216,1684825200"; 
   d="scan'208";a="366569082"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jul 2023 10:22:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10776"; a="759259175"
X-IronPort-AV: E=Sophos;i="6.01,216,1684825200"; 
   d="scan'208";a="759259175"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 19 Jul 2023 10:22:39 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qMAsp-0005KX-0H;
	Wed, 19 Jul 2023 17:22:39 +0000
Date: Thu, 20 Jul 2023 01:22:23 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [peterz-queue:locking/futex 10/13] kernel/futex/core.c:1210:31:
 warning: assignment to 'struct futex_hash_bucket *' from 'int' makes pointer
 from integer without a cast
Message-ID: <202307200159.WdZr35bA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git locking/futex
head:   b70d7a00de0dc4c0525ce8226eb903695114f8ab
commit: fc3fb6ec05deb628dc03d0e747c55a075a27cadd [10/13] futex: Implement FUTEX2_NUMA
config: mips-allyesconfig (https://download.01.org/0day-ci/archive/20230720/202307200159.WdZr35bA-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230720/202307200159.WdZr35bA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307200159.WdZr35bA-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/futex/core.c: In function 'futex_init':
   kernel/futex/core.c:1210:33: error: implicit declaration of function 'vmalloc_huge_node'; did you mean 'kmalloc_large_node'? [-Werror=implicit-function-declaration]
    1210 |                         table = vmalloc_huge_node(size, GFP_KERNEL, n);
         |                                 ^~~~~~~~~~~~~~~~~
         |                                 kmalloc_large_node
>> kernel/futex/core.c:1210:31: warning: assignment to 'struct futex_hash_bucket *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
    1210 |                         table = vmalloc_huge_node(size, GFP_KERNEL, n);
         |                               ^
   cc1: some warnings being treated as errors


vim +1210 kernel/futex/core.c

  1189	
  1190	static int __init futex_init(void)
  1191	{
  1192		unsigned int order, n;
  1193		unsigned long size, i;
  1194	
  1195	#if CONFIG_BASE_SMALL
  1196		futex_hashsize = 16;
  1197	#else
  1198		futex_hashsize = 256 * num_possible_cpus();
  1199		futex_hashsize /= num_possible_nodes();
  1200		futex_hashsize = roundup_pow_of_two(futex_hashsize);
  1201	#endif
  1202		futex_hashshift = ilog2(futex_hashsize);
  1203		size = sizeof(struct futex_hash_bucket) * futex_hashsize;
  1204		order = get_order(size);
  1205	
  1206		for_each_node(n) {
  1207			struct futex_hash_bucket *table;
  1208	
  1209			if (order > MAX_ORDER)
> 1210				table = vmalloc_huge_node(size, GFP_KERNEL, n);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
