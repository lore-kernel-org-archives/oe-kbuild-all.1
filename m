Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2A93B673
	for <oe-kbuild-all@lists.linux.dev>; Tue, 12 Sep 2023 21:49:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694555388; x=1726091388;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=dRJ/BppWeK2b4YuGJ58995TUdun77Mcuj8xjw5J9zVc=;
  b=HHXrQUL96dtDvbhZ67aRma46XHTWEMwrSPNBQaZSGr6y0F0ZuBQOamYc
   tnf62lLwAQObmKggLJ69WsxxzsADA+5NUJcc5nUrRseWcAVu9GVIzai4z
   Jywjpf4uNfAnzM+envns4qHhTRmOcpbb8nXvSeCCtUmsjNFRyHwK+tUCS
   j4O+f5a72TGlGF0cdXb/MtepJnyQtAmsLBUdHJ7u7M9zgtrHbUapmggTg
   RkcqlPw0u7mH9L4V6INuqaYyeMU1hw3wrfCXGmyPs9bXfujja2la92bYa
   JTGLkMx6jLs2fl7IRl3mRjYwznatsoxzuMTM4gD3S6RS6D0J9qmmRfauN
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="378409759"
X-IronPort-AV: E=Sophos;i="6.02,141,1688454000"; 
   d="scan'208";a="378409759"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Sep 2023 14:49:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="720565238"
X-IronPort-AV: E=Sophos;i="6.02,141,1688454000"; 
   d="scan'208";a="720565238"
Received: from lkp-server02.sh.intel.com (HELO 47e905db7d2b) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 12 Sep 2023 14:49:45 -0700
Received: from kbuild by 47e905db7d2b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qgBGR-0000JH-0u;
	Tue, 12 Sep 2023 21:49:43 +0000
Date: Wed, 13 Sep 2023 05:49:33 +0800
From: kernel test robot <lkp@intel.com>
To: Kairui Song <ryncsn@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH v2 5/5] workingset, lru_gen: apply refault-distance
 based re-activation
Message-ID: <202309130559.6HuCQV2g-lkp@intel.com>
References: <20230912184511.49333-6-ryncsn@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230912184511.49333-6-ryncsn@gmail.com>

Hi Kairui,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on v6.6-rc1]
[cannot apply to akpm-mm/mm-everything next-20230912]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Kairui-Song/workingset-simplify-and-use-a-more-intuitive-model/20230913-024648
base:   linus/master
patch link:    https://lore.kernel.org/r/20230912184511.49333-6-ryncsn%40gmail.com
patch subject: [RFC PATCH v2 5/5] workingset, lru_gen: apply refault-distance based re-activation
config: i386-tinyconfig (https://download.01.org/0day-ci/archive/20230913/202309130559.6HuCQV2g-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230913/202309130559.6HuCQV2g-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309130559.6HuCQV2g-lkp@intel.com/

All warnings (new ones prefixed by >>):

   mm/workingset.c: In function 'workingset_test_recent':
   mm/workingset.c:525:67: warning: passing argument 3 of 'lru_gen_test_recent' makes pointer from integer without a cast [-Wint-conversion]
     525 |                 return lru_gen_test_recent(eviction_lruvec, file, eviction);
         |                                                                   ^~~~~~~~
         |                                                                   |
         |                                                                   long unsigned int
   mm/workingset.c:437:74: note: expected 'struct lruvec **' but argument is of type 'long unsigned int'
     437 | static bool lru_gen_test_recent(void *shadow, bool file, struct lruvec **lruvec,
         |                                                          ~~~~~~~~~~~~~~~~^~~~~~
   mm/workingset.c:525:24: error: too few arguments to function 'lru_gen_test_recent'
     525 |                 return lru_gen_test_recent(eviction_lruvec, file, eviction);
         |                        ^~~~~~~~~~~~~~~~~~~
   mm/workingset.c:437:13: note: declared here
     437 | static bool lru_gen_test_recent(void *shadow, bool file, struct lruvec **lruvec,
         |             ^~~~~~~~~~~~~~~~~~~
   mm/workingset.c: At top level:
>> mm/workingset.c:189:21: warning: 'lru_gen_bucket_order' defined but not used [-Wunused-variable]
     189 | static unsigned int lru_gen_bucket_order __read_mostly;
         |                     ^~~~~~~~~~~~~~~~~~~~


vim +/lru_gen_bucket_order +189 mm/workingset.c

   179	
   180	/*
   181	 * Eviction timestamps need to be able to cover the full range of
   182	 * actionable refaults. However, bits are tight in the xarray
   183	 * entry, and after storing the identifier for the lruvec there might
   184	 * not be enough left to represent every single actionable refault. In
   185	 * that case, we have to sacrifice granularity for distance, and group
   186	 * evictions into coarser buckets by shaving off lower timestamp bits.
   187	 */
   188	static unsigned int bucket_order __read_mostly;
 > 189	static unsigned int lru_gen_bucket_order __read_mostly;
   190	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
