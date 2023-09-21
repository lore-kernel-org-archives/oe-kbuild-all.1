Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66E431947B
	for <oe-kbuild-all@lists.linux.dev>; Thu, 21 Sep 2023 21:43:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695332587; x=1726868587;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=9xjQ/Bm9dQGZSHv6qNNuTwUBSdSU1lkrE5hXszWoIIw=;
  b=gKgf55/faPeWu5caVr7GvV8+QUS6vKAM+iTS5P25fJ5+YNnaIXDr8yWL
   i7RagBG6zDa32xCEM7N8BRjj4c/NdiH+PMkBOWYTwaUHu1HZFzoh7kXSU
   Uy++Z2K1HHz4maN1SOIA2+Hrh4RUIKZqhn5JBNYiEFmgQs+kL8OD+goGI
   0R4C0gqQBw+hCS/BgJ1hmorzh03ZthBzsm8zKhI2WI31ncwr1U0PaJcaP
   vUjIskwCb8Qd4aUwNrrJgiHRfGrEi5MCGJwMLZbP/FxVgRm4EOUyLor3s
   8+aWUG3RBz18OHo+i8C3jPoDjlWDwh+xBkqBfNxl1oEne/ceSIJUV7Nyy
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10840"; a="447153452"
X-IronPort-AV: E=Sophos;i="6.03,166,1694761200"; 
   d="scan'208";a="447153452"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2023 14:43:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10840"; a="740847709"
X-IronPort-AV: E=Sophos;i="6.03,166,1694761200"; 
   d="scan'208";a="740847709"
Received: from lkp-server02.sh.intel.com (HELO b77866e22201) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 21 Sep 2023 14:43:01 -0700
Received: from kbuild by b77866e22201 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qjRRr-0000RH-0E;
	Thu, 21 Sep 2023 21:42:59 +0000
Date: Fri, 22 Sep 2023 05:42:47 +0800
From: kernel test robot <lkp@intel.com>
To: Kairui Song <ryncsn@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH v3 1/6] workingset: simplify and use a more intuitive
 model
Message-ID: <202309220558.JSUOlHbi-lkp@intel.com>
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
config: x86_64-randconfig-123-20230921 (https://download.01.org/0day-ci/archive/20230922/202309220558.JSUOlHbi-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230922/202309220558.JSUOlHbi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309220558.JSUOlHbi-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> mm/workingset.c:345:6: sparse: sparse: symbol 'workingset_age_nonresident' was not declared. Should it be static?
   mm/workingset.c:724:9: sparse: sparse: context imbalance in 'shadow_lru_isolate' - different lock contexts for basic block

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
