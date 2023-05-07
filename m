Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C450156EB
	for <oe-kbuild-all@lists.linux.dev>; Sun,  7 May 2023 04:48:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683434910; x=1714970910;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=NKiSSwVp+1+v7gdMsln6+FsnqEFwSO33fsnX4Nwl2vY=;
  b=mfukFb8gmff4NxBz8HaJpryr85Ix4OKx/2fGWIM/vLICgMqg0JYpXKxs
   2hmOjK+V7fopyDeTB+ANuXDdjHPEX16YfrFDN1aamDSkjrcMOHI5IAF7A
   dO4Z5fB4lIz3ysw2hlXbDa9821eKQqWCglZ+KUhK2JSaqOOAjQJycURbH
   VkrsmHiAUK1C70KTnFJ+Td3T+CZ0Bgmkz8guUsVuHAo9GOHdT5j7mq6Pw
   wEA03mlehVpzNnleuS7CLhrdf0HDXl4kvGAHlv4A6Q3AOM7dchiobjrBd
   KI6b0dXAxGUOeIfyI3oJiHsZeyHgK+0OCCMJnvvntYbj010GdpxHS/mtj
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10702"; a="435767175"
X-IronPort-AV: E=Sophos;i="5.99,256,1677571200"; 
   d="scan'208";a="435767175"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2023 21:48:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10702"; a="692204452"
X-IronPort-AV: E=Sophos;i="5.99,256,1677571200"; 
   d="scan'208";a="692204452"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 06 May 2023 21:48:28 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pvWJv-0000c9-1B;
	Sun, 07 May 2023 04:48:27 +0000
Date: Sun, 7 May 2023 12:48:00 +0800
From: kernel test robot <lkp@intel.com>
To: Hou Tao <houtao@huaweicloud.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH bpf-next 2/4] bpf: Add three kfunc helpers for bpf fs
 inode iterator
Message-ID: <202305071210.FhEJCQaU-lkp@intel.com>
References: <20230507040107.3755166-3-houtao@huaweicloud.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230507040107.3755166-3-houtao@huaweicloud.com>

Hi Hou,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on bpf/master]
[also build test WARNING on linus/master]
[cannot apply to bpf-next/master akpm-mm/mm-everything v6.3 next-20230505]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Hou-Tao/bpf-Introduce-bpf-iterator-for-file-system-inode/20230507-113114
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf.git master
patch link:    https://lore.kernel.org/r/20230507040107.3755166-3-houtao%40huaweicloud.com
patch subject: [RFC PATCH bpf-next 2/4] bpf: Add three kfunc helpers for bpf fs inode iterator
config: i386-defconfig (https://download.01.org/0day-ci/archive/20230507/202305071210.FhEJCQaU-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/intel-lab-lkp/linux/commit/93ea1c2e394182d3547673f69a808b8c1fa994e3
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Hou-Tao/bpf-Introduce-bpf-iterator-for-file-system-inode/20230507-113114
        git checkout 93ea1c2e394182d3547673f69a808b8c1fa994e3
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=i386 olddefconfig
        make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305071210.FhEJCQaU-lkp@intel.com/

All warnings (new ones prefixed by >>):

   mm/filemap.c: In function 'filemap_cachestat':
>> mm/filemap.c:4155:30: warning: unused variable 'workingset' [-Wunused-variable]
    4155 |                         bool workingset; /* not used */
         |                              ^~~~~~~~~~
>> mm/filemap.c:4154:31: warning: unused variable 'shadow' [-Wunused-variable]
    4154 |                         void *shadow = (void *)folio;
         |                               ^~~~~~


vim +/workingset +4155 mm/filemap.c

  4125	
  4126	/**
  4127	 * filemap_cachestat() - compute the page cache statistics of a mapping
  4128	 * @mapping:	The mapping to compute the statistics for.
  4129	 * @first_index:	The starting page cache index.
  4130	 * @last_index:	The final page index (inclusive).
  4131	 * @cs:	the cachestat struct to write the result to.
  4132	 *
  4133	 * This will query the page cache statistics of a mapping in the
  4134	 * page range of [first_index, last_index] (inclusive). The statistics
  4135	 * queried include: number of dirty pages, number of pages marked for
  4136	 * writeback, and the number of (recently) evicted pages.
  4137	 */
  4138	void filemap_cachestat(struct address_space *mapping, pgoff_t first_index,
  4139			       pgoff_t last_index, struct cachestat *cs)
  4140	{
  4141		XA_STATE(xas, &mapping->i_pages, first_index);
  4142		struct folio *folio;
  4143	
  4144		rcu_read_lock();
  4145		xas_for_each(&xas, folio, last_index) {
  4146			unsigned long nr_pages;
  4147			pgoff_t folio_first_index, folio_last_index;
  4148	
  4149			if (xas_retry(&xas, folio))
  4150				continue;
  4151	
  4152			if (xa_is_value(folio)) {
  4153				/* page is evicted */
> 4154				void *shadow = (void *)folio;
> 4155				bool workingset; /* not used */

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
