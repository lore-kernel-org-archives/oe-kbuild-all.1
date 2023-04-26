Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 981A81FC6
	for <oe-kbuild-all@lists.linux.dev>; Wed, 26 Apr 2023 13:17:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682515057; x=1714051057;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=na0mCiO1atKxQSUe8j7aDXae7W7wNTiiaa9o4b49YtU=;
  b=cIGsXIC8dFbuqaUS897JpBwgj2HJpuAUU8OagQ4ea6/RSQqOiqPCaLsg
   XzjBLi7Zf1jydF7dk+DFFKJKrEkzR285pgOyEIez5wUNyUVfvYDLG1QT8
   oLBGCpG/tzVKIC6CId7vFnGfqXxeuf/3H59t43X2FbO5mp5Szq8GcMJ06
   fsxK0uqWEfLJwxIxma69qHUrqXuUXCSk6hERNs7QUINudQMD6UZhL7jqz
   0jGE/Km28QiDY+eZiT7Bk+OI0NoDMrK5CFWL+NbGuRgnUnNclwBJbJ1e8
   y5HGAJis/Jtza2B8IRlapYaYyP5ftyGXOmk3oiepmDib9FbSx0TwTMfnt
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10691"; a="410096551"
X-IronPort-AV: E=Sophos;i="5.99,228,1677571200"; 
   d="scan'208";a="410096551"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2023 06:17:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10691"; a="818119604"
X-IronPort-AV: E=Sophos;i="5.99,228,1677571200"; 
   d="scan'208";a="818119604"
Received: from lkp-server01.sh.intel.com (HELO 041f065c1b1b) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 26 Apr 2023 06:17:34 -0700
Received: from kbuild by 041f065c1b1b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1prf1Z-0000BK-2H;
	Wed, 26 Apr 2023 13:17:33 +0000
Date: Wed, 26 Apr 2023 21:16:36 +0800
From: kernel test robot <lkp@intel.com>
To: "Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	linux-kernel@vger.kernel.org, maple-tree@lists.infradead.org,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>
Subject: Re: [PATCH 27/34] maple_tree: Introduce mas_next_slot() interface
Message-ID: <202304262143.kjXZTgwU-lkp@intel.com>
References: <20230425140955.3834476-28-Liam.Howlett@oracle.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230425140955.3834476-28-Liam.Howlett@oracle.com>

Hi Liam,

kernel test robot noticed the following build errors:

[auto build test ERROR on akpm-mm/mm-everything]
[also build test ERROR on linus/master v6.3 next-20230425]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Liam-R-Howlett/maple_tree-Fix-static-analyser-cppcheck-issue/20230425-233958
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20230425140955.3834476-28-Liam.Howlett%40oracle.com
patch subject: [PATCH 27/34] maple_tree: Introduce mas_next_slot() interface
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20230426/202304262143.kjXZTgwU-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/intel-lab-lkp/linux/commit/0e736b8a8054e7f0b216320d2458a00b54fcd2b0
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Liam-R-Howlett/maple_tree-Fix-static-analyser-cppcheck-issue/20230425-233958
        git checkout 0e736b8a8054e7f0b216320d2458a00b54fcd2b0
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304262143.kjXZTgwU-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   lib/maple_tree.c:4710:7: warning: no previous prototype for 'mas_next_slot' [-Wmissing-prototypes]
    4710 | void *mas_next_slot(struct ma_state *mas, unsigned long max)
         |       ^~~~~~~~~~~~~
   lib/maple_tree.c: In function 'mas_next_entry':
>> lib/maple_tree.c:4780:17: error: implicit declaration of function 'mas_next_slot_limit'; did you mean 'mas_next_slot'? [-Werror=implicit-function-declaration]
    4780 |         entry = mas_next_slot_limit(mas, limit);
         |                 ^~~~~~~~~~~~~~~~~~~
         |                 mas_next_slot
>> lib/maple_tree.c:4780:15: warning: assignment to 'void *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
    4780 |         entry = mas_next_slot_limit(mas, limit);
         |               ^
>> lib/maple_tree.c:4787:16: warning: returning 'int' from a function with return type 'void *' makes pointer from integer without a cast [-Wint-conversion]
    4787 |         return mas_next_slot_limit(mas, limit);
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +4780 lib/maple_tree.c

  4760	
  4761	/*
  4762	 * mas_next_entry() - Internal function to get the next entry.
  4763	 * @mas: The maple state
  4764	 * @limit: The maximum range start.
  4765	 *
  4766	 * Set the @mas->node to the next entry and the range_start to
  4767	 * the beginning value for the entry.  Does not check beyond @limit.
  4768	 * Sets @mas->index and @mas->last to the limit if it is hit.
  4769	 * Restarts on dead nodes.
  4770	 *
  4771	 * Return: the next entry or %NULL.
  4772	 */
  4773	static inline void *mas_next_entry(struct ma_state *mas, unsigned long limit)
  4774	{
  4775		void *entry = NULL;
  4776	
  4777		if (mas->last >= limit)
  4778			return NULL;
  4779	
> 4780		entry = mas_next_slot_limit(mas, limit);
  4781		if (entry)
  4782			return entry;
  4783	
  4784		if (mas_is_none(mas))
  4785			return NULL;
  4786	
> 4787		return mas_next_slot_limit(mas, limit);
  4788	}
  4789	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
