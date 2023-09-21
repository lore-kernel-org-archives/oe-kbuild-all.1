Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F20C8800
	for <oe-kbuild-all@lists.linux.dev>; Thu, 21 Sep 2023 01:29:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695259789; x=1726795789;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ThURM1hQTNRI1hWu5vSSeP32CrGAoHRrmPOdyM9K4SI=;
  b=Q3KtsB+is25bSFM0K3nz9LkO7Prb7jHqcvqWWfX0BLPTnNmCjjNXZ4X+
   n7SEh1TKBSGTUn6bufPLMhD1SJIbOuWf+Cj74qbSA++46idcyKOw5wJIC
   NrWXxJr4iDrssiKIeVgPxl4kpRMaB+Obot79zrPQjSMV/mQlBf2pli9Id
   oeNW8Gt1KEoBrBguso2R73x3ZNrHndV+SuRr+FtFugT/H0Qt6FtCXFFTD
   uXZ38VNBGo9xPc1MOVGoOXqN1hFZcIKKmrClXwOxCF9XAsG1X1hKWe3ui
   YYvF94IYjMaS/lgkAPZDvhirMGgNv/GriYLbiAQWKREWeBHrg5wWl2tzU
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="365450940"
X-IronPort-AV: E=Sophos;i="6.03,162,1694761200"; 
   d="scan'208";a="365450940"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Sep 2023 18:29:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="1077697737"
X-IronPort-AV: E=Sophos;i="6.03,162,1694761200"; 
   d="scan'208";a="1077697737"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 20 Sep 2023 18:29:47 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qj8Vl-0009NE-1X;
	Thu, 21 Sep 2023 01:29:45 +0000
Date: Thu, 21 Sep 2023 09:29:06 +0800
From: kernel test robot <lkp@intel.com>
To: Kairui Song <ryncsn@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH v3 4/6] workingset: simplify lru_gen_test_recent
Message-ID: <202309210911.zXFPniQ2-lkp@intel.com>
References: <20230920190244.16839-5-ryncsn@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230920190244.16839-5-ryncsn@gmail.com>

Hi Kairui,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on v6.6-rc2]
[cannot apply to akpm-mm/mm-everything next-20230920]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Kairui-Song/workingset-simplify-and-use-a-more-intuitive-model/20230921-030515
base:   linus/master
patch link:    https://lore.kernel.org/r/20230920190244.16839-5-ryncsn%40gmail.com
patch subject: [RFC PATCH v3 4/6] workingset: simplify lru_gen_test_recent
config: powerpc-allnoconfig (https://download.01.org/0day-ci/archive/20230921/202309210911.zXFPniQ2-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230921/202309210911.zXFPniQ2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309210911.zXFPniQ2-lkp@intel.com/

All errors (new ones prefixed by >>):

   mm/workingset.c:415:6: warning: no previous prototype for 'workingset_age_nonresident' [-Wmissing-prototypes]
     415 | void workingset_age_nonresident(struct lruvec *lruvec, unsigned long nr_pages)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/workingset.c: In function 'workingset_test_recent':
   mm/workingset.c:508:67: warning: passing argument 3 of 'lru_gen_test_recent' makes pointer from integer without a cast [-Wint-conversion]
     508 |                 return lru_gen_test_recent(eviction_lruvec, file, eviction);
         |                                                                   ^~~~~~~~
         |                                                                   |
         |                                                                   long unsigned int
   mm/workingset.c:393:74: note: expected 'struct lruvec **' but argument is of type 'long unsigned int'
     393 | static bool lru_gen_test_recent(void *shadow, bool file, struct lruvec **lruvec,
         |                                                          ~~~~~~~~~~~~~~~~^~~~~~
>> mm/workingset.c:508:24: error: too few arguments to function 'lru_gen_test_recent'
     508 |                 return lru_gen_test_recent(eviction_lruvec, file, eviction);
         |                        ^~~~~~~~~~~~~~~~~~~
   mm/workingset.c:393:13: note: declared here
     393 | static bool lru_gen_test_recent(void *shadow, bool file, struct lruvec **lruvec,
         |             ^~~~~~~~~~~~~~~~~~~


vim +/lru_gen_test_recent +508 mm/workingset.c

   464	
   465	/**
   466	 * workingset_test_recent - tests if the shadow entry is for a folio that was
   467	 * recently evicted. Also fills in @workingset with the value unpacked from
   468	 * shadow.
   469	 * @shadow: the shadow entry to be tested.
   470	 * @file: whether the corresponding folio is from the file lru.
   471	 * @workingset: where the workingset value unpacked from shadow should
   472	 * be stored.
   473	 *
   474	 * Return: true if the shadow is for a recently evicted folio; false otherwise.
   475	 */
   476	bool workingset_test_recent(void *shadow, bool file, bool *workingset)
   477	{
   478		struct mem_cgroup *eviction_memcg;
   479		struct lruvec *eviction_lruvec;
   480		int memcgid;
   481		struct pglist_data *pgdat;
   482		unsigned long eviction;
   483	
   484		unpack_shadow(shadow, &memcgid, &pgdat, &eviction, workingset);
   485	
   486		/*
   487		 * Look up the memcg associated with the stored ID. It might
   488		 * have been deleted since the folio's eviction.
   489		 *
   490		 * Note that in rare events the ID could have been recycled
   491		 * for a new cgroup that refaults a shared folio. This is
   492		 * impossible to tell from the available data. However, this
   493		 * should be a rare and limited disturbance, and activations
   494		 * are always speculative anyway. Ultimately, it's the aging
   495		 * algorithm's job to shake out the minimum access frequency
   496		 * for the active cache.
   497		 *
   498		 * XXX: On !CONFIG_MEMCG, this will always return NULL; it
   499		 * would be better if the root_mem_cgroup existed in all
   500		 * configurations instead.
   501		 */
   502		eviction_memcg = mem_cgroup_from_id(memcgid);
   503		if (!mem_cgroup_disabled() && !eviction_memcg)
   504			return false;
   505		eviction_lruvec = mem_cgroup_lruvec(eviction_memcg, pgdat);
   506	
   507		if (lru_gen_enabled())
 > 508			return lru_gen_test_recent(eviction_lruvec, file, eviction);
   509	
   510		return lru_test_refault(eviction_memcg, eviction_lruvec, eviction,
   511					file, EVICTION_BITS, bucket_order);
   512	}
   513	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
