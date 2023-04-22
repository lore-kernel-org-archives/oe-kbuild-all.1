Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E5757F
	for <oe-kbuild-all@lists.linux.dev>; Sat, 22 Apr 2023 11:19:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682162387; x=1713698387;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+EVsdeVWlcugnqDpDcwqF5ABdA1G/6ft2d3YeGRsGVk=;
  b=a46PO9OmoCtQ260RawT5RFpzQ21CX6nPfOWEMsyrJQaRsMAGcXZRKvUt
   RY5GkuICfZmd3y/qggGdpxLBysfTT2CBJQ10LNf+LG3duGE5SzDsodnXU
   bBfXsrUoRbUXqeS4EUFNT603bFoqXnk2Ln4ZxDF24fXdzKZ4QXoOK99Jw
   VsTYZFp5Q6G+Jfvjhbk0+v/Voh77Ce6BuL9VKKM8a9uwxl+AgUzcikYHd
   GrEdn6rcPkiyV25f8ZbeB55DBXSTULlXV1GyIjz/QNbLZkudjUnOvlx03
   CH7ZDPfwlTdTyASUnsxXtaVEmzevwFPR+kMIkRFQiD4ExPFn7/g6EIptp
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10687"; a="343633987"
X-IronPort-AV: E=Sophos;i="5.99,218,1677571200"; 
   d="scan'208";a="343633987"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2023 04:19:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10687"; a="816704438"
X-IronPort-AV: E=Sophos;i="5.99,218,1677571200"; 
   d="scan'208";a="816704438"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 22 Apr 2023 04:19:43 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pqBHK-000hGO-1B;
	Sat, 22 Apr 2023 11:19:42 +0000
Date: Sat, 22 Apr 2023 19:18:55 +0800
From: kernel test robot <lkp@intel.com>
To: Oscar Salvador <osalvador@suse.de>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	linux-kernel@vger.kernel.org, Michal Hocko <mhocko@suse.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Eric Dumazet <edumazet@google.com>,
	Waiman Long <longman@redhat.com>,
	Suren Baghdasaryan <surenb@google.com>,
	Marco Elver <elver@google.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Alexander Potapenko <glider@google.com>,
	Oscar Salvador <osalvador@suse.de>
Subject: Re: [PATCH v4 2/3] mm, page_owner: Add page_owner_stacks file to
 print out only stacks and their counte
Message-ID: <202304221906.CKlcyd2r-lkp@intel.com>
References: <20230421101415.5734-3-osalvador@suse.de>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230421101415.5734-3-osalvador@suse.de>

Hi Oscar,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on v6.3-rc7]
[cannot apply to akpm-mm/mm-everything next-20230421]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Oscar-Salvador/lib-stackdepot-Add-a-refcount-field-in-stack_record/20230421-181709
base:   linus/master
patch link:    https://lore.kernel.org/r/20230421101415.5734-3-osalvador%40suse.de
patch subject: [PATCH v4 2/3] mm, page_owner: Add page_owner_stacks file to print out only stacks and their counte
config: x86_64-randconfig-m001 (https://download.01.org/0day-ci/archive/20230422/202304221906.CKlcyd2r-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304221906.CKlcyd2r-lkp@intel.com/

smatch warnings:
lib/stackdepot.c:558 stack_print() warn: unsigned 'stack->size' is never less than zero.

vim +558 lib/stackdepot.c

   551	
   552	int stack_print(struct seq_file *m, void *v)
   553	{
   554		char *buf;
   555		int ret = 0;
   556		struct stack_record *stack =v;
   557	
 > 558		if (!stack->size || stack->size < 0 ||
   559		    stack->size > PAGE_SIZE || stack->handle.valid != 1 ||
   560		    refcount_read(&stack->count) < 1)
   561			return 0;
   562	
   563		buf = kzalloc(PAGE_SIZE, GFP_KERNEL);
   564		ret += stack_trace_snprint(buf, PAGE_SIZE, stack->entries, stack->size, 0);
   565		scnprintf(buf + ret, PAGE_SIZE - ret, "stack count: %d\n\n",
   566			  refcount_read(&stack->count));
   567		seq_printf(m, buf);
   568		seq_puts(m, "\n\n");
   569		kfree(buf);
   570	
   571	        return 0;
   572	}
   573	#endif
   574	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
