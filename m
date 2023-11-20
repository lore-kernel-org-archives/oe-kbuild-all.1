Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 209C636AFB
	for <oe-kbuild-all@lists.linux.dev>; Mon, 20 Nov 2023 19:55:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="f23bvVIv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700510111; x=1732046111;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=eIcnX1IfWE9lijtKlCzKbp0A86iGj84M8I59EZ2BXRk=;
  b=f23bvVIv5asgW/SGkwZH7/mqC00QitoKBfM8HLPzhUbWtTbpfAT4N9M/
   SYiqf5CTJ8X7tGiiiLOM5NWO0wsAnyl0WVbZlaJYBykoID3e+TXQQiEhu
   o2puWhO2qg58mlXFmcUG+xp3huwtyrxof7nrhWPJtNdE7slcfomAoA7qw
   DGeae9owmgchgqqK+iF/a8u9jVlCH0Fe1D9+55loBr/6w9OqWhAcuBz5q
   UB989+LUTXdbc/4DRwAXv+XwdXjBoDQHTrF9SouI59rXmIp/2kKQ4rDJr
   HYzHrtrtQ9e9QuabXaV06LlZtvijQCa8BT0Y98z6H18HKXzflAEowTXgA
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10900"; a="376730714"
X-IronPort-AV: E=Sophos;i="6.04,214,1695711600"; 
   d="scan'208";a="376730714"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2023 11:54:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10900"; a="716305427"
X-IronPort-AV: E=Sophos;i="6.04,214,1695711600"; 
   d="scan'208";a="716305427"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 20 Nov 2023 11:54:52 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r5AM5-0006p2-24;
	Mon, 20 Nov 2023 19:54:49 +0000
Date: Tue, 21 Nov 2023 03:52:44 +0800
From: kernel test robot <lkp@intel.com>
To: Oscar Salvador <osalvador@suse.de>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	linux-kernel@vger.kernel.org, Michal Hocko <mhocko@suse.com>,
	Vlastimil Babka <vbabka@suse.cz>, Waiman Long <longman@redhat.com>,
	Suren Baghdasaryan <surenb@google.com>,
	Marco Elver <elver@google.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Eric Dumazet <edumazet@google.com>,
	Alexander Potapenko <glider@google.com>,
	Oscar Salvador <osalvador@suse.de>
Subject: Re: [PATCH v6 4/4] mm,page_owner: Filter out stacks by a threshold
 counter
Message-ID: <202311210354.BwQoLzVO-lkp@intel.com>
References: <20231120084300.4368-5-osalvador@suse.de>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231120084300.4368-5-osalvador@suse.de>

Hi Oscar,

kernel test robot noticed the following build warnings:

[auto build test WARNING on akpm-mm/mm-everything]
[also build test WARNING on linus/master v6.7-rc2 next-20231120]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Oscar-Salvador/lib-stackdepot-Add-a-refcount-field-in-stack_record/20231120-164913
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20231120084300.4368-5-osalvador%40suse.de
patch subject: [PATCH v6 4/4] mm,page_owner: Filter out stacks by a threshold counter
config: arc-allmodconfig (https://download.01.org/0day-ci/archive/20231121/202311210354.BwQoLzVO-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231121/202311210354.BwQoLzVO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311210354.BwQoLzVO-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/page_owner.c:819:5: warning: no previous prototype for 'page_owner_threshold_get' [-Wmissing-prototypes]
     819 | int page_owner_threshold_get(void *data, u64 *val)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~
>> mm/page_owner.c:825:5: warning: no previous prototype for 'page_owner_threshold_set' [-Wmissing-prototypes]
     825 | int page_owner_threshold_set(void *data, u64 val)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~


vim +/page_owner_threshold_get +819 mm/page_owner.c

   818	
 > 819	int page_owner_threshold_get(void *data, u64 *val)
   820	{
   821		*val = page_owner_stack_threshold;
   822		return 0;
   823	}
   824	
 > 825	int page_owner_threshold_set(void *data, u64 val)
   826	{
   827		page_owner_stack_threshold = val;
   828		return 0;
   829	}
   830	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
