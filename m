Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BB25399
	for <oe-kbuild-all@lists.linux.dev>; Wed, 26 Jul 2023 00:26:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690331176; x=1721867176;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=HLZfU5NeKmALn+vvM0xFCVLultOajdwC5aDex8Jjtig=;
  b=HV4ukh3CxVbphnYZ7aLsMILXwUVe6N15nF1bWB1cvP9tzfXxKYBRabvB
   aq5/P2E5j+Z02kTfoobno/iEALmlt0ZZFjRrJyEMV3e9Smf/jxs40sTwQ
   wl3p99QI/G33xZ0JWiohyXBbIMpFzL+xzW6+yZ3DNs33vTZZW/7EdR6xg
   Rex0wfVoliX5Hryal54RxbVIUKZQDvLhx/M3p+qedB9rMoqB3/GuugPUG
   yR+0T/z8KymykRr7X965oJxEK7Q7Esh67msKieVxjDkrvP8TO0AQN7496
   tN9gdyw6x64I5QanB1D5BV/i1cCAdDt91d+IQ5Ls4BtmaPESfDosmobrh
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10782"; a="398797953"
X-IronPort-AV: E=Sophos;i="6.01,231,1684825200"; 
   d="scan'208";a="398797953"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jul 2023 17:26:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10782"; a="816463469"
X-IronPort-AV: E=Sophos;i="6.01,231,1684825200"; 
   d="scan'208";a="816463469"
Received: from lkp-server02.sh.intel.com (HELO 953e8cd98f7d) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 25 Jul 2023 17:26:14 -0700
Received: from kbuild by 953e8cd98f7d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qOSLp-0000SN-1Y;
	Wed, 26 Jul 2023 00:26:05 +0000
Date: Wed, 26 Jul 2023 08:25:43 +0800
From: kernel test robot <lkp@intel.com>
To: Kairui Song <ryncsn@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 2/4] workingset: simplify lru_gen_test_recent
Message-ID: <202307260842.wzdPQg6o-lkp@intel.com>
References: <20230725185733.43929-3-ryncsn@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230725185733.43929-3-ryncsn@gmail.com>

Hi Kairui,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on akpm-mm/mm-everything]
[also build test ERROR on linus/master v6.5-rc3 next-20230725]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Kairui-Song/workingset-simplify-and-use-a-more-intuitive-model/20230726-025946
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20230725185733.43929-3-ryncsn%40gmail.com
patch subject: [RFC PATCH 2/4] workingset: simplify lru_gen_test_recent
config: microblaze-randconfig-r012-20230725 (https://download.01.org/0day-ci/archive/20230726/202307260842.wzdPQg6o-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230726/202307260842.wzdPQg6o-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307260842.wzdPQg6o-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   mm/workingset.c: In function 'workingset_test_recent':
>> mm/workingset.c:515:67: warning: passing argument 3 of 'lru_gen_test_recent' makes pointer from integer without a cast [-Wint-conversion]
     515 |                 return lru_gen_test_recent(eviction_lruvec, file, eviction);
         |                                                                   ^~~~~~~~
         |                                                                   |
         |                                                                   long unsigned int
   mm/workingset.c:427:74: note: expected 'struct lruvec **' but argument is of type 'long unsigned int'
     427 | static bool lru_gen_test_recent(void *shadow, bool file, struct lruvec **lruvec,
         |                                                          ~~~~~~~~~~~~~~~~^~~~~~
>> mm/workingset.c:515:24: error: too few arguments to function 'lru_gen_test_recent'
     515 |                 return lru_gen_test_recent(eviction_lruvec, file, eviction);
         |                        ^~~~~~~~~~~~~~~~~~~
   mm/workingset.c:427:13: note: declared here
     427 | static bool lru_gen_test_recent(void *shadow, bool file, struct lruvec **lruvec,
         |             ^~~~~~~~~~~~~~~~~~~


vim +/lru_gen_test_recent +515 mm/workingset.c

   471	
   472	/**
   473	 * workingset_test_recent - tests if the shadow entry is for a folio that was
   474	 * recently evicted. Also fills in @workingset with the value unpacked from
   475	 * shadow.
   476	 * @shadow: the shadow entry to be tested.
   477	 * @file: whether the corresponding folio is from the file lru.
   478	 * @workingset: where the workingset value unpacked from shadow should
   479	 * be stored.
   480	 *
   481	 * Return: true if the shadow is for a recently evicted folio; false otherwise.
   482	 */
   483	bool workingset_test_recent(void *shadow, bool file, bool *workingset)
   484	{
   485		struct mem_cgroup *eviction_memcg;
   486		struct lruvec *eviction_lruvec;
   487		int memcgid;
   488		struct pglist_data *pgdat;
   489		unsigned long eviction;
   490	
   491		unpack_shadow(shadow, &memcgid, &pgdat, &eviction, workingset);
   492	
   493		/*
   494		 * Look up the memcg associated with the stored ID. It might
   495		 * have been deleted since the folio's eviction.
   496		 *
   497		 * Note that in rare events the ID could have been recycled
   498		 * for a new cgroup that refaults a shared folio. This is
   499		 * impossible to tell from the available data. However, this
   500		 * should be a rare and limited disturbance, and activations
   501		 * are always speculative anyway. Ultimately, it's the aging
   502		 * algorithm's job to shake out the minimum access frequency
   503		 * for the active cache.
   504		 *
   505		 * XXX: On !CONFIG_MEMCG, this will always return NULL; it
   506		 * would be better if the root_mem_cgroup existed in all
   507		 * configurations instead.
   508		 */
   509		eviction_memcg = mem_cgroup_from_id(memcgid);
   510		if (!mem_cgroup_disabled() && !eviction_memcg)
   511			return false;
   512		eviction_lruvec = mem_cgroup_lruvec(eviction_memcg, pgdat);
   513	
   514		if (lru_gen_enabled())
 > 515			return lru_gen_test_recent(eviction_lruvec, file, eviction);
   516	
   517		return lru_refault(eviction_memcg, eviction_lruvec, eviction,
   518				      EVICTION_BITS, bucket_order);
   519	}
   520	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
