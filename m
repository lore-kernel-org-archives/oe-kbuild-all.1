Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E24B5199A1
	for <oe-kbuild-all@lists.linux.dev>; Thu, 21 Sep 2023 14:52:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695307948; x=1726843948;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=t1DmLvMn6dFVEQcc85boZaVWA8Yg0ZPtAJv1TacX2fU=;
  b=LW2tSJOw+1hc2qpyU0ucu2VoqOESzoZPsWDaySTIem8DZe862RLvMlTN
   KKw6BAo9EU+q/ezutj1LsDiN+GL8IBK7S8x2yJ9/d4hTsADjiK1iMBQqL
   nmaAgudWHUR2nJEFNzfAec+DQgOQYKJxL3CgLoa2zksHGyPozqCz6n7R/
   gj8yAcsMvwyawBG2Jath2IrhBCTtp+CpcAERXP/BsT2SCFBwJr37IJG2U
   xWs9/1vgyxoFUZ3VXLnUu/jWGgu1u1GtCKAvj8Zv3TVaxrx6hWlyXoQE8
   ZYTISltw3/ZSC8aePKfKPsKtF5mwwW6KOZELifiiHOS1yJuW3ni+qrYT+
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10840"; a="384397056"
X-IronPort-AV: E=Sophos;i="6.03,165,1694761200"; 
   d="scan'208";a="384397056"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2023 07:52:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10840"; a="723792522"
X-IronPort-AV: E=Sophos;i="6.03,165,1694761200"; 
   d="scan'208";a="723792522"
Received: from lkp-server02.sh.intel.com (HELO b77866e22201) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 21 Sep 2023 07:52:21 -0700
Received: from kbuild by b77866e22201 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qjL2P-00003R-1x;
	Thu, 21 Sep 2023 14:52:17 +0000
Date: Thu, 21 Sep 2023 22:52:05 +0800
From: kernel test robot <lkp@intel.com>
To: Kairui Song <ryncsn@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH v3 1/6] workingset: simplify and use a more intuitive
 model
Message-ID: <202309212210.4Gj7YMG6-lkp@intel.com>
References: <20230920190244.16839-2-ryncsn@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230920190244.16839-2-ryncsn@gmail.com>

Hi Kairui,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on v6.6-rc2 next-20230921]
[cannot apply to akpm-mm/mm-everything]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Kairui-Song/workingset-simplify-and-use-a-more-intuitive-model/20230921-030515
base:   linus/master
patch link:    https://lore.kernel.org/r/20230920190244.16839-2-ryncsn%40gmail.com
patch subject: [RFC PATCH v3 1/6] workingset: simplify and use a more intuitive model
config: x86_64-randconfig-074-20230921 (https://download.01.org/0day-ci/archive/20230921/202309212210.4Gj7YMG6-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230921/202309212210.4Gj7YMG6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309212210.4Gj7YMG6-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/workingset.c:345:6: warning: no previous declaration for 'workingset_age_nonresident' [-Wmissing-declarations]
    void workingset_age_nonresident(struct lruvec *lruvec, unsigned long nr_pages)
         ^~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/workingset_age_nonresident +345 mm/workingset.c

ac35a490237446 Yu Zhao         2022-09-18  334  
31d8fcac00fcf4 Johannes Weiner 2020-06-25  335  /**
31d8fcac00fcf4 Johannes Weiner 2020-06-25  336   * workingset_age_nonresident - age non-resident entries as LRU ages
e755f4af08b74e Xiaofei Tan     2020-10-15  337   * @lruvec: the lruvec that was aged
31d8fcac00fcf4 Johannes Weiner 2020-06-25  338   * @nr_pages: the number of pages to count
31d8fcac00fcf4 Johannes Weiner 2020-06-25  339   *
31d8fcac00fcf4 Johannes Weiner 2020-06-25  340   * As in-memory pages are aged, non-resident pages need to be aged as
31d8fcac00fcf4 Johannes Weiner 2020-06-25  341   * well, in order for the refault distances later on to be comparable
31d8fcac00fcf4 Johannes Weiner 2020-06-25  342   * to the in-memory dimensions. This function allows reclaim and LRU
31d8fcac00fcf4 Johannes Weiner 2020-06-25  343   * operations to drive the non-resident aging along in parallel.
31d8fcac00fcf4 Johannes Weiner 2020-06-25  344   */
31d8fcac00fcf4 Johannes Weiner 2020-06-25 @345  void workingset_age_nonresident(struct lruvec *lruvec, unsigned long nr_pages)
b910718a948a91 Johannes Weiner 2019-11-30  346  {
b910718a948a91 Johannes Weiner 2019-11-30  347  	/*
b910718a948a91 Johannes Weiner 2019-11-30  348  	 * Reclaiming a cgroup means reclaiming all its children in a
b910718a948a91 Johannes Weiner 2019-11-30  349  	 * round-robin fashion. That means that each cgroup has an LRU
b910718a948a91 Johannes Weiner 2019-11-30  350  	 * order that is composed of the LRU orders of its child
b910718a948a91 Johannes Weiner 2019-11-30  351  	 * cgroups; and every page has an LRU position not just in the
b910718a948a91 Johannes Weiner 2019-11-30  352  	 * cgroup that owns it, but in all of that group's ancestors.
b910718a948a91 Johannes Weiner 2019-11-30  353  	 *
b910718a948a91 Johannes Weiner 2019-11-30  354  	 * So when the physical inactive list of a leaf cgroup ages,
b910718a948a91 Johannes Weiner 2019-11-30  355  	 * the virtual inactive lists of all its parents, including
b910718a948a91 Johannes Weiner 2019-11-30  356  	 * the root cgroup's, age as well.
b910718a948a91 Johannes Weiner 2019-11-30  357  	 */
b910718a948a91 Johannes Weiner 2019-11-30  358  	do {
31d8fcac00fcf4 Johannes Weiner 2020-06-25  359  		atomic_long_add(nr_pages, &lruvec->nonresident_age);
31d8fcac00fcf4 Johannes Weiner 2020-06-25  360  	} while ((lruvec = parent_lruvec(lruvec)));
b910718a948a91 Johannes Weiner 2019-11-30  361  }
b910718a948a91 Johannes Weiner 2019-11-30  362  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
