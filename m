Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CA19BE5D
	for <oe-kbuild-all@lists.linux.dev>; Mon, 11 Sep 2023 09:19:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694423996; x=1725959996;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=D9NRrbZWBt/U3p3h9xdC01pEHXqPKr+IwUOHXQlyJN0=;
  b=B0DX6+iKoLjr6LdFQq3eelHYMzkVfvkPIlHjxBCHLlNYqzq4YGPEDbwf
   Smyi3M0EC9ne5AjPPUl1mfAw2xJ6J8y7ls+fQToEtlCn/xQNNwsiFNn9p
   xh4trxPn9UpXHQ6dAp8QJBm1P/F/p3NvDt/8b09l/gg6Kx0dwMy2aKGHJ
   NcoI1aUoeIk5CA9ak8TBoD9WA/7ebHyyMTCGLJGDyb/8ZIkDyCKP/e+xE
   Rbm6H6EkLe/mgqZO+hoq61BwmC46OJiSVYNcG8eJVeHQV40Uca3m05waP
   eNSJ4xO67PXaTUV6V2JGyLCMzqfjzsu6WZ6luFLOhj44nr5yxL/C/ZuUD
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10829"; a="357477111"
X-IronPort-AV: E=Sophos;i="6.02,243,1688454000"; 
   d="scan'208";a="357477111"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2023 02:19:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10829"; a="1074071634"
X-IronPort-AV: E=Sophos;i="6.02,243,1688454000"; 
   d="scan'208";a="1074071634"
Received: from lkp-server01.sh.intel.com (HELO 59b3c6e06877) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 11 Sep 2023 02:19:54 -0700
Received: from kbuild by 59b3c6e06877 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qfd5E-00062V-21;
	Mon, 11 Sep 2023 09:19:52 +0000
Date: Mon, 11 Sep 2023 17:19:38 +0800
From: kernel test robot <lkp@intel.com>
To: "Yakunin, Dmitry (Nebius)" <zeil@nebius.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 1/3] cgroup: list all subsystem states in debugfs
 files
Message-ID: <202309111708.jWJ74nh9-lkp@intel.com>
References: <20230911075437.74027-2-zeil@nebius.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230911075437.74027-2-zeil@nebius.com>

Hi Dmitry,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on akpm-mm/mm-everything]
[also build test WARNING on linus/master v6.6-rc1 next-20230911]
[cannot apply to tj-cgroup/for-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Yakunin-Dmitry-Nebius/cgroup-list-all-subsystem-states-in-debugfs-files/20230911-155716
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20230911075437.74027-2-zeil%40nebius.com
patch subject: [RFC PATCH 1/3] cgroup: list all subsystem states in debugfs files
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20230911/202309111708.jWJ74nh9-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230911/202309111708.jWJ74nh9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309111708.jWJ74nh9-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/memcontrol.c:5669:13: warning: 'mem_cgroup_css_dump' defined but not used [-Wunused-function]
    5669 | static void mem_cgroup_css_dump(struct cgroup_subsys_state *css,
         |             ^~~~~~~~~~~~~~~~~~~
--
>> kernel/cgroup/cgroup.c:7078:7: warning: no previous prototype for 'css_debugfs_seqfile_start' [-Wmissing-prototypes]
    7078 | void *css_debugfs_seqfile_start(struct seq_file *m, loff_t *pos)
         |       ^~~~~~~~~~~~~~~~~~~~~~~~~
>> kernel/cgroup/cgroup.c:7090:7: warning: no previous prototype for 'css_debugfs_seqfile_next' [-Wmissing-prototypes]
    7090 | void *css_debugfs_seqfile_next(struct seq_file *m, void *v, loff_t *pos)
         |       ^~~~~~~~~~~~~~~~~~~~~~~~
>> kernel/cgroup/cgroup.c:7101:6: warning: no previous prototype for 'css_debugfs_seqfile_stop' [-Wmissing-prototypes]
    7101 | void css_debugfs_seqfile_stop(struct seq_file *m, void *v)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~
>> kernel/cgroup/cgroup.c:7106:5: warning: no previous prototype for 'css_debugfs_seqfile_show' [-Wmissing-prototypes]
    7106 | int css_debugfs_seqfile_show(struct seq_file *m, void *v)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~


vim +/mem_cgroup_css_dump +5669 mm/memcontrol.c

  5668	
> 5669	static void mem_cgroup_css_dump(struct cgroup_subsys_state *css,
  5670					struct seq_file *m)
  5671	{
  5672		struct mem_cgroup *memcg = mem_cgroup_from_css(css);
  5673	
  5674		seq_printf(m, "mem_id=%u memory=%lu memsw=%lu kmem=%lu tcpmem=%lu shmem=%lu",
  5675			   mem_cgroup_id(memcg),
  5676			   page_counter_read(&memcg->memory),
  5677			   page_counter_read(&memcg->memsw),
  5678			   page_counter_read(&memcg->kmem),
  5679			   page_counter_read(&memcg->tcpmem),
  5680			   memcg_page_state(memcg, NR_SHMEM));
  5681	}
  5682	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
