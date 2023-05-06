Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 033CF259C
	for <oe-kbuild-all@lists.linux.dev>; Sat,  6 May 2023 14:48:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683384499; x=1714920499;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YiRt9HzcKigJrXwfjLRvH40eH/Lojap0oE0jQXiR5Uw=;
  b=KVwvon6V7/Gu3JhBnU3gtBfl0VsRYJrTphQdl2huXdX6yD7n1WahhfEE
   79/q1h0Kc2riZQ2WFslznAuGZO/pszit4qiZbUgIlQ/UzdsAAlth4cRTB
   c4k9mC8HmXBaFGqnM1A0H7L0KXqfIF4KhPZy8Hy/Cqc1M8dsPt73o4a73
   og8yhjhssXNyAqSsy7todXdrvib+3p73I35s7LFrWsOZy5VkReMd5tSiO
   VtaSBxPOS8h9TM4Vc3XOBZoBjGlEpqFavqtQZEZ2dfmDFL9OQyFQlTVit
   D0Qs7pmCcgIAm4L5aC4hsGtNKDB7Ro/yYHrOjjVHQKZiVHtamAiX12YDv
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10702"; a="414937356"
X-IronPort-AV: E=Sophos;i="5.99,255,1677571200"; 
   d="scan'208";a="414937356"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2023 07:48:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10702"; a="767507609"
X-IronPort-AV: E=Sophos;i="5.99,255,1677571200"; 
   d="scan'208";a="767507609"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 06 May 2023 07:48:17 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pvJCr-0000MX-0b;
	Sat, 06 May 2023 14:48:17 +0000
Date: Sat, 6 May 2023 22:47:39 +0800
From: kernel test robot <lkp@intel.com>
To: "Liam R. Howlett" <Liam.Howlett@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [akpm-mm:mm-unstable 73/80] lib/maple_tree.c:6251:7: warning: no
 previous prototype for 'mas_find_range_rev'
Message-ID: <202305062247.va92Dm6P-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-unstable
head:   f96b65aa15baec616fffdb8f1d4fa3222aa56467
commit: 93bb3be05691973459b9e23f7b9667137528df0f [73/80] maple_tree: add mas_prev_range() and mas_find_range_rev interface
config: arc-randconfig-r043-20230502 (https://download.01.org/0day-ci/archive/20230506/202305062247.va92Dm6P-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git/commit/?id=93bb3be05691973459b9e23f7b9667137528df0f
        git remote add akpm-mm https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git
        git fetch --no-tags akpm-mm mm-unstable
        git checkout 93bb3be05691973459b9e23f7b9667137528df0f
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arc SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305062247.va92Dm6P-lkp@intel.com/

All warnings (new ones prefixed by >>):

   lib/maple_tree.c:4606:7: warning: no previous prototype for 'mas_prev_slot' [-Wmissing-prototypes]
    4606 | void *mas_prev_slot(struct ma_state *mas, unsigned long min, bool empty)
         |       ^~~~~~~~~~~~~
   lib/maple_tree.c:4758:7: warning: no previous prototype for 'mas_next_slot' [-Wmissing-prototypes]
    4758 | void *mas_next_slot(struct ma_state *mas, unsigned long max, bool empty)
         |       ^~~~~~~~~~~~~
>> lib/maple_tree.c:6251:7: warning: no previous prototype for 'mas_find_range_rev' [-Wmissing-prototypes]
    6251 | void *mas_find_range_rev(struct ma_state *mas, unsigned long min)
         |       ^~~~~~~~~~~~~~~~~~


vim +/mas_find_range_rev +6251 lib/maple_tree.c

  6237	
  6238	/**
  6239	 * mas_find_range_rev: On the first call, find the first non-null entry at or
  6240	 * below mas->index down to %min.  Otherwise advance to the previous slot after
  6241	 * mas->index down to %min.
  6242	 * @mas: The maple state
  6243	 * @min: The minimum value to check.
  6244	 *
  6245	 * Must hold rcu_read_lock or the write lock.
  6246	 * If an entry exists, last and index are updated accordingly.
  6247	 * May set @mas->node to MAS_NONE.
  6248	 *
  6249	 * Return: The entry or %NULL.
  6250	 */
> 6251	void *mas_find_range_rev(struct ma_state *mas, unsigned long min)
  6252	{
  6253		void *entry;
  6254	
  6255		if (mas_find_rev_setup(mas, min, &entry))
  6256			return entry;
  6257	
  6258		/* Retries on dead nodes handled by mas_prev_slot */
  6259		return mas_prev_slot(mas, min, true);
  6260	}
  6261	EXPORT_SYMBOL_GPL(mas_find_range_rev);
  6262	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
