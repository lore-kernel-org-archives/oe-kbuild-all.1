Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 193CC631
	for <oe-kbuild-all@lists.linux.dev>; Thu, 20 Jul 2023 01:49:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689817789; x=1721353789;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=aZoGw4GphAQSxXoLIILhcgpHbr/NB7+P72bndTTVxNc=;
  b=i+rNRhrg1iht7MPofmlbQrzfAgMRnwO9aesW8kTr6tRA0E3RN7zzJ99y
   5TZ4EQuon9Ie0HeijxFgqYleedzESEcfblvXEsWentm/eQSyPzKKM/HEa
   geVwij1ezcWB6c/uBeSwES5L2Ptsxc31vLKwdFrbmXqxbfBWHrlkLtRy0
   f2wNCornrnRXgsIixQQ3/w/hoiqSDJQCHc02MqZmbBWprdr/lhjGdNlbX
   P59hLQXD33EBqcRAYE8am4/EHWNm2DCecv29hPkIRE0IJRlYL4XIfkOBV
   MxiMMWqgn6/F72SGpGrY82wQqIhYOiYvBgfQHnJa46b3oTYSmxEef7lqc
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10776"; a="365494352"
X-IronPort-AV: E=Sophos;i="6.01,216,1684825200"; 
   d="scan'208";a="365494352"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jul 2023 18:49:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10776"; a="794251937"
X-IronPort-AV: E=Sophos;i="6.01,216,1684825200"; 
   d="scan'208";a="794251937"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 19 Jul 2023 18:49:44 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qMInX-0005fp-2V;
	Thu, 20 Jul 2023 01:49:43 +0000
Date: Thu, 20 Jul 2023 09:49:07 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [peterz-queue:locking/futex 10/13] kernel/futex/core.c:1210:33:
 error: implicit declaration of function 'vmalloc_huge_node'; did you mean
 'kmalloc_large_node'?
Message-ID: <202307200934.lrYE0yfh-lkp@intel.com>
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
config: mips-allyesconfig (https://download.01.org/0day-ci/archive/20230720/202307200934.lrYE0yfh-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230720/202307200934.lrYE0yfh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307200934.lrYE0yfh-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/futex/core.c: In function 'futex_init':
>> kernel/futex/core.c:1210:33: error: implicit declaration of function 'vmalloc_huge_node'; did you mean 'kmalloc_large_node'? [-Werror=implicit-function-declaration]
    1210 |                         table = vmalloc_huge_node(size, GFP_KERNEL, n);
         |                                 ^~~~~~~~~~~~~~~~~
         |                                 kmalloc_large_node
   kernel/futex/core.c:1210:31: warning: assignment to 'struct futex_hash_bucket *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
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
