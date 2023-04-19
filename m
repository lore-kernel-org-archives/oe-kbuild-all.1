Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E99423A2
	for <oe-kbuild-all@lists.linux.dev>; Wed, 19 Apr 2023 15:23:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681917782; x=1713453782;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=FyoNEuewRSZF8EIv9CVEenpq/Tgf8iahWbqzpdIszVs=;
  b=JNcImFgqGMXRPfS1NKSSc4h4Zo/4imzncxAr53ug7I+FOvNGbdiCm1mB
   CKdvOUhYDRQ/uXZ8a9F7mfDFNFBuyLSkYN9IGCY5MY9VdFT7HONw3mgQZ
   hjataC/8woD97HT7fhaIgLhp4VLbQiYX8OurF7nTcatDZaZjoTr+rHFNc
   yPk4aWS2t3meo9z7WxJ9oRHLjQcWBUT61W73iEH5i10iCpfy9kaBzc5Do
   rw/35xWPJzY/pTRg4zZhrNK4crmRqcZGIgXltJZlvK+/tZSEahnWGbffT
   16+4kvNZ78oXaw3GyIKYyk3Kfc4JKhcYl1IqVEy1WL33nzXTxuDq56B1q
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10685"; a="329652264"
X-IronPort-AV: E=Sophos;i="5.99,208,1677571200"; 
   d="scan'208";a="329652264"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Apr 2023 08:23:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10685"; a="641814765"
X-IronPort-AV: E=Sophos;i="5.99,208,1677571200"; 
   d="scan'208";a="641814765"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 19 Apr 2023 08:22:54 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pp9e0-000ewp-2j;
	Wed, 19 Apr 2023 15:22:52 +0000
Date: Wed, 19 Apr 2023 23:21:55 +0800
From: kernel test robot <lkp@intel.com>
To: Muhammad Usama Anjum <usama.anjum@collabora.com>,
	Peter Xu <peterx@redhat.com>, David Hildenbrand <david@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	=?utf-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <emmir@google.com>,
	Andrei Vagin <avagin@gmail.com>,
	Danylo Mocherniuk <mdanylo@google.com>,
	Paul Gofman <pgofman@codeweavers.com>,
	Cyrill Gorcunov <gorcunov@gmail.com>,
	Mike Rapoport <rppt@kernel.org>, Nadav Amit <namit@vmware.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Christian Brauner <brauner@kernel.org>,
	Yang Shi <shy828301@gmail.com>, Vlastimil Babka <vbabka@suse.cz>,
	"Liam R . Howlett" <Liam.Howlett@oracle.com>,
	Yun Zhou <yun.zhou@windriver.com>,
	Suren Baghdasaryan <surenb@google.com>,
	Alex Sierra <alex.sierra@amd.com>,
	Muhammad Usama Anjum <usama.anjum@collabora.com>,
	Matthew Wilcox <willy@infradead.org>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Axel Rasmussen <axelrasmussen@google.com>,
	"Gustavo A . R . Silva" <gustavoars@kernel.org>,
	Dan Williams <dan.j.williams@intel.com>,
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	linux-kselftest@vger.kernel.org, Greg KH <greg@kroah.com>
Subject: Re: [PATCH v15 2/5] fs/proc/task_mmu: Implement IOCTL to get and
 optionally clear info about PTEs
Message-ID: <202304192347.QsBHpCUb-lkp@intel.com>
References: <20230419110716.4113627-3-usama.anjum@collabora.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230419110716.4113627-3-usama.anjum@collabora.com>

Hi Muhammad,

kernel test robot noticed the following build errors:

[auto build test ERROR on next-20230418]
[cannot apply to akpm-mm/mm-everything linus/master v6.3-rc7 v6.3-rc6 v6.3-rc5 v6.3-rc7]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Muhammad-Usama-Anjum/userfaultfd-UFFD_FEATURE_WP_ASYNC/20230419-190920
patch link:    https://lore.kernel.org/r/20230419110716.4113627-3-usama.anjum%40collabora.com
patch subject: [PATCH v15 2/5] fs/proc/task_mmu: Implement IOCTL to get and optionally clear info about PTEs
config: s390-randconfig-r044-20230416 (https://download.01.org/0day-ci/archive/20230419/202304192347.QsBHpCUb-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/b4a176ae0c875b07b49d2e3539699065438be9b1
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Muhammad-Usama-Anjum/userfaultfd-UFFD_FEATURE_WP_ASYNC/20230419-190920
        git checkout b4a176ae0c875b07b49d2e3539699065438be9b1
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=s390 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=s390 SHELL=/bin/bash fs/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304192347.QsBHpCUb-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/proc/task_mmu.c: In function 'do_pagemap_scan':
>> fs/proc/task_mmu.c:2177:41: error: 'vma' undeclared (first use in this function)
    2177 |                                         vma->vm_mm, start, end);
         |                                         ^~~
   fs/proc/task_mmu.c:2177:41: note: each undeclared identifier is reported only once for each function it appears in


vim +/vma +2177 fs/proc/task_mmu.c

  2128	
  2129	static long do_pagemap_scan(struct mm_struct *mm,
  2130				   struct pm_scan_arg __user *uarg)
  2131	{
  2132		unsigned long start, end, walk_start, walk_end;
  2133		unsigned long empty_slots, vec_index = 0;
  2134		struct mmu_notifier_range range;
  2135		struct page_region __user *vec;
  2136		struct pagemap_scan_private p;
  2137		struct pm_scan_arg arg;
  2138		int ret = 0;
  2139	
  2140		if (copy_from_user(&arg, uarg, sizeof(arg)))
  2141			return -EFAULT;
  2142	
  2143		start = untagged_addr((unsigned long)arg.start);
  2144		vec = (struct page_region *)untagged_addr((unsigned long)arg.vec);
  2145	
  2146		ret = pagemap_scan_args_valid(&arg, start, vec);
  2147		if (ret)
  2148			return ret;
  2149	
  2150		end = start + arg.len;
  2151		p.max_pages = arg.max_pages;
  2152		p.found_pages = 0;
  2153		p.flags = arg.flags;
  2154		p.required_mask = arg.required_mask;
  2155		p.anyof_mask = arg.anyof_mask;
  2156		p.excluded_mask = arg.excluded_mask;
  2157		p.return_mask = arg.return_mask;
  2158		p.cur.len = 0;
  2159		p.cur.start = 0;
  2160		p.vec = NULL;
  2161		p.vec_len = PAGEMAP_WALK_SIZE >> PAGE_SHIFT;
  2162	
  2163		/*
  2164		 * Allocate smaller buffer to get output from inside the page walk
  2165		 * functions and walk page range in PAGEMAP_WALK_SIZE size chunks. As
  2166		 * we want to return output to user in compact form where no two
  2167		 * consecutive regions should be continuous and have the same flags.
  2168		 * So store the latest element in p.cur between different walks and
  2169		 * store the p.cur at the end of the walk to the user buffer.
  2170		 */
  2171		p.vec = kmalloc_array(p.vec_len, sizeof(*p.vec), GFP_KERNEL);
  2172		if (!p.vec)
  2173			return -ENOMEM;
  2174	
  2175		if (p.flags & PM_SCAN_OP_WP) {
  2176			mmu_notifier_range_init(&range, MMU_NOTIFY_PROTECTION_VMA, 0,
> 2177						vma->vm_mm, start, end);
  2178			mmu_notifier_invalidate_range_start(&range);
  2179		}
  2180	
  2181		walk_start = walk_end = start;
  2182		while (walk_end < end && !ret) {
  2183			p.vec_index = 0;
  2184	
  2185			empty_slots = arg.vec_len - vec_index;
  2186			p.vec_len = min(p.vec_len, empty_slots);
  2187	
  2188			walk_end = (walk_start + PAGEMAP_WALK_SIZE) & PAGEMAP_WALK_MASK;
  2189			if (walk_end > end)
  2190				walk_end = end;
  2191	
  2192			ret = mmap_read_lock_killable(mm);
  2193			if (ret)
  2194				goto free_data;
  2195			ret = walk_page_range(mm, walk_start, walk_end,
  2196					      &pagemap_scan_ops, &p);
  2197			mmap_read_unlock(mm);
  2198	
  2199			if (ret && ret != -ENOSPC && ret != PM_SCAN_FOUND_MAX_PAGES)
  2200				goto free_data;
  2201	
  2202			walk_start = walk_end;
  2203			if (p.vec_index) {
  2204				if (copy_to_user(&vec[vec_index], p.vec,
  2205						 p.vec_index * sizeof(*p.vec))) {
  2206					/*
  2207					 * Return error even though the OP succeeded
  2208					 */
  2209					ret = -EFAULT;
  2210					goto free_data;
  2211				}
  2212				vec_index += p.vec_index;
  2213			}
  2214		}
  2215	
  2216		if (p.flags & PM_SCAN_OP_WP)
  2217			mmu_notifier_invalidate_range_end(&range);
  2218	
  2219		if (p.cur.len) {
  2220			if (copy_to_user(&vec[vec_index], &p.cur, sizeof(*p.vec))) {
  2221				ret = -EFAULT;
  2222				goto free_data;
  2223			}
  2224			vec_index++;
  2225		}
  2226	
  2227		ret = vec_index;
  2228	
  2229	free_data:
  2230		kfree(p.vec);
  2231		return ret;
  2232	}
  2233	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
