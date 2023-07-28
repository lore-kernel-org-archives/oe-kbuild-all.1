Received: from mgamail.intel.com (unknown [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3490F23B8
	for <oe-kbuild-all@lists.linux.dev>; Fri, 28 Jul 2023 22:25:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690583133; x=1722119133;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=J4OFRxMfAv1cz792gWvU9NGsLPBq5DCRpXpqK+nWRD8=;
  b=QHyuM/UFso+3wDCM/RAUEG5e2be6fwnUkfXXnEieQTmwX0W77LxAxo+3
   ql6t6XzldXlwlDTjFNU1h8vv7IQeUJUU2FlYplvJVoF6BuPaqEsfZ+Nq7
   eRN0mK/ObzcjhhelU36uIdnyCh9l4FiD4IgyEsLNfdEsJz/a7AaRcZvYh
   FurSI0aUh52BypLdcz3CfIe0j83pwO9hLYC2hcidyZbvzYlDYzwNfJ1Nv
   QEZBDohunSmTMUzp1LpueB127RkSaOmpk5ZN0T0LsbYX3CYf4G6QTgOoy
   i/OFAb0SAfnzqSU9CP5x/Ur0AJTDvfn3Qknkk3J8J81NBraMvusqe2vgn
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10785"; a="434984531"
X-IronPort-AV: E=Sophos;i="6.01,238,1684825200"; 
   d="scan'208";a="434984531"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2023 15:25:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10785"; a="677649809"
X-IronPort-AV: E=Sophos;i="6.01,238,1684825200"; 
   d="scan'208";a="677649809"
Received: from lkp-server02.sh.intel.com (HELO 953e8cd98f7d) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 28 Jul 2023 15:25:31 -0700
Received: from kbuild by 953e8cd98f7d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qPVtq-0003d2-2Q;
	Fri, 28 Jul 2023 22:25:30 +0000
Date: Sat, 29 Jul 2023 06:24:43 +0800
From: kernel test robot <lkp@intel.com>
To: Christian =?iso-8859-1?Q?G=F6ttsche?= <cgzones@googlemail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH] selinux: optimize ebitmap_and()
Message-ID: <202307290638.KswmmmnP-lkp@intel.com>
References: <20230728155937.41580-1-cgzones@googlemail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230728155937.41580-1-cgzones@googlemail.com>

Hi Christian,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on pcmoore-selinux/next]
[also build test WARNING on linus/master v6.5-rc3 next-20230728]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Christian-G-ttsche/selinux-optimize-ebitmap_and/20230729-000029
base:   https://git.kernel.org/pub/scm/linux/kernel/git/pcmoore/selinux.git next
patch link:    https://lore.kernel.org/r/20230728155937.41580-1-cgzones%40googlemail.com
patch subject: [RFC PATCH] selinux: optimize ebitmap_and()
config: loongarch-defconfig (https://download.01.org/0day-ci/archive/20230729/202307290638.KswmmmnP-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230729/202307290638.KswmmmnP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307290638.KswmmmnP-lkp@intel.com/

All warnings (new ones prefixed by >>):

   security/selinux/ss/ebitmap.c: In function 'ebitmap_and':
>> security/selinux/ss/ebitmap.c:99:54: warning: iteration 6 invokes undefined behavior [-Waggressive-loop-optimizations]
      99 |                                 testmap[i] = n1->maps[i] & n2->maps[i];
         |                                              ~~~~~~~~^~~
   security/selinux/ss/ebitmap.c:98:39: note: within this loop
      98 |                         for (i = 0; i < sizeof(testmap); i++) {
         |                                     ~~^~~~~~~~~~~~~~~~~


vim +99 security/selinux/ss/ebitmap.c

    81	
    82	int ebitmap_and(struct ebitmap *dst, const struct ebitmap *e1, const struct ebitmap *e2)
    83	{
    84		const struct ebitmap_node *n1, *n2;
    85		struct ebitmap_node *new = NULL, **prev;
    86	
    87		ebitmap_init(dst);
    88	
    89		prev = &dst->node;
    90		n1 = e1->node;
    91		n2 = e2->node;
    92		while (n1 && n2) {
    93			if (n1->startbit == n2->startbit) {
    94				unsigned long testmap[EBITMAP_UNIT_NUMS];
    95				unsigned int i;
    96				bool match = false;
    97	
    98				for (i = 0; i < sizeof(testmap); i++) {
  > 99					testmap[i] = n1->maps[i] & n2->maps[i];
   100					if (testmap[i] != 0)
   101						match = true;
   102				}
   103	
   104				if (match) {
   105					new = kmem_cache_zalloc(ebitmap_node_cachep, GFP_ATOMIC);
   106					if (!new) {
   107						ebitmap_destroy(dst);
   108						return -ENOMEM;
   109					}
   110					new->startbit = n1->startbit;
   111					memcpy(new->maps, testmap, EBITMAP_SIZE / 8);
   112					new->next = NULL;
   113	
   114					*prev = new;
   115					prev = &(new->next);
   116				}
   117	
   118				n1 = n1->next;
   119				n2 = n2->next;
   120			} else if (n1->startbit > n2->startbit) {
   121				n2 = n2->next;
   122			} else {
   123				n1 = n1->next;
   124			}
   125		}
   126	
   127		if (new)
   128			dst->highbit = new->startbit + EBITMAP_SIZE;
   129	
   130		return 0;
   131	}
   132	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
