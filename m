Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B5407F
	for <oe-kbuild-all@lists.linux.dev>; Fri, 21 Jul 2023 02:58:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689908287; x=1721444287;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=kAfnjUsMkeVOvOzOihPjEhY2+hkQ8lG+O+rh2M9hN3I=;
  b=JYwiGTgjJiHgTH9mGL9yKPdeGAE1al3kbxquMc9LAOPClC2t7rWUYYU5
   9bNRW+nvm1gylIo0EKdTnEUKqJj9MvORYsjggwhT4RxIB0xm23J4TxCDo
   eJVFBaV1bNzUHGUTEw3iUFrusMOGQpSOWfQ9Sun40Qh78Yz5sfFMB3jrG
   hqAui8OqrXIlrH7Qvf/fIKcJ9/buN9j2csUYp4QCIGqNn2eykRMYELTmA
   l9j60SBRf16L+tCpDjPe0btrawWSUdnc0rIKbIDQnvWjyOA/yJ4wZeUbG
   HRxn0+0j6cDllL2NJFzWg8PWQElFBKh+VbBzwIb9xV+CB71EIrGm4ijQl
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10777"; a="365817082"
X-IronPort-AV: E=Sophos;i="6.01,220,1684825200"; 
   d="scan'208";a="365817082"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jul 2023 19:58:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10777"; a="898560727"
X-IronPort-AV: E=Sophos;i="6.01,220,1684825200"; 
   d="scan'208";a="898560727"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 20 Jul 2023 19:57:57 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qMgKz-0006nV-0O;
	Fri, 21 Jul 2023 02:57:54 +0000
Date: Fri, 21 Jul 2023 10:56:51 +0800
From: kernel test robot <lkp@intel.com>
To: =?utf-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
	Muhammad Usama Anjum <usama.anjum@collabora.com>
Cc: oe-kbuild-all@lists.linux.dev, Alex Sierra <alex.sierra@amd.com>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Andrei Vagin <avagin@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>,
	Axel Rasmussen <axelrasmussen@google.com>,
	Christian Brauner <brauner@kernel.org>,
	Cyrill Gorcunov <gorcunov@gmail.com>,
	Dan Williams <dan.j.williams@intel.com>,
	Danylo Mocherniuk <mdanylo@google.com>,
	David Hildenbrand <david@redhat.com>, Greg KH <greg@kroah.com>,
	"Gustavo A . R . Silva" <gustavoars@kernel.org>,
	"Liam R . Howlett" <Liam.Howlett@oracle.com>,
	Matthew Wilcox <willy@infradead.org>,
	=?utf-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <emmir@google.com>,
	Mike Rapoport <rppt@kernel.org>, Nadav Amit <namit@vmware.com>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Paul Gofman <pgofman@codeweavers.com>, Peter Xu <peterx@redhat.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Vlastimil Babka <vbabka@suse.cz>, Yang Shi <shy828301@gmail.com>,
	Yun Zhou <yun.zhou@windriver.com>, linux-kernel@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: Re: fs/proc/task_mmu: Implement IOCTL for efficient page table
 scanning
Message-ID: <202307211030.2CJH6TkM-lkp@intel.com>
References: <a0b5c6776b2ed91f78a7575649f8b100e58bd3a9.1689881078.git.mirq-linux@rere.qmqm.pl>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a0b5c6776b2ed91f78a7575649f8b100e58bd3a9.1689881078.git.mirq-linux@rere.qmqm.pl>

Hi Michał,

kernel test robot noticed the following build errors:

[auto build test ERROR on akpm-mm/mm-everything]
[also build test ERROR on linus/master v6.5-rc2 next-20230720]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Micha-Miros-aw/Re-fs-proc-task_mmu-Implement-IOCTL-for-efficient-page-table-scanning/20230721-033050
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/a0b5c6776b2ed91f78a7575649f8b100e58bd3a9.1689881078.git.mirq-linux%40rere.qmqm.pl
patch subject: Re: fs/proc/task_mmu: Implement IOCTL for efficient page table scanning
config: arc-randconfig-r035-20230720 (https://download.01.org/0day-ci/archive/20230721/202307211030.2CJH6TkM-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230721/202307211030.2CJH6TkM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307211030.2CJH6TkM-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/proc/task_mmu.c: In function 'pagemap_scan_test_walk':
   fs/proc/task_mmu.c:1921:13: error: implicit declaration of function 'userfaultfd_wp_async'; did you mean 'userfaultfd_wp'? [-Werror=implicit-function-declaration]
    1921 |         if (userfaultfd_wp_async(vma) && userfaultfd_wp_use_markers(vma))
         |             ^~~~~~~~~~~~~~~~~~~~
         |             userfaultfd_wp
   fs/proc/task_mmu.c: In function 'pagemap_scan_pte_hole':
>> fs/proc/task_mmu.c:2200:19: error: implicit declaration of function 'uffd_wp_range' [-Werror=implicit-function-declaration]
    2200 |         int err = uffd_wp_range(vma, addr, end - addr, true);
         |                   ^~~~~~~~~~~~~
   fs/proc/task_mmu.c: In function 'pagemap_scan_init_bounce_buffer':
   fs/proc/task_mmu.c:2290:22: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
    2290 |         p->vec_out = (void __user *)p->arg.vec;
         |                      ^
   fs/proc/task_mmu.c: At top level:
   fs/proc/task_mmu.c:1967:13: warning: 'pagemap_scan_backout_range' defined but not used [-Wunused-function]
    1967 | static void pagemap_scan_backout_range(struct pagemap_scan_private *p,
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/uffd_wp_range +2200 fs/proc/task_mmu.c

  2182	
  2183	static int pagemap_scan_pte_hole(unsigned long addr, unsigned long end,
  2184					 int depth, struct mm_walk *walk)
  2185	{
  2186		struct pagemap_scan_private *p = walk->private;
  2187		struct vm_area_struct *vma = walk->vma;
  2188		int ret;
  2189	
  2190		if (!vma || !pagemap_scan_is_interesting_page(p->cur_vma_category, p))
  2191			return 0;
  2192	
  2193		ret = pagemap_scan_output(p->cur_vma_category, p, addr, &end);
  2194		if (addr == end)
  2195			return ret;
  2196	
  2197		if (~p->arg.flags & PM_SCAN_WP_MATCHING)
  2198			return ret;
  2199	
> 2200		int err = uffd_wp_range(vma, addr, end - addr, true);
  2201		if (err < 0)
  2202			ret = err;
  2203	
  2204		return ret;
  2205	}
  2206	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
