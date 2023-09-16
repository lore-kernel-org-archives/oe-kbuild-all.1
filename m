Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3EC210F1
	for <oe-kbuild-all@lists.linux.dev>; Sat, 16 Sep 2023 00:22:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694823770; x=1726359770;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=OAJoXRpLWIJ0ZW1gEurh1Ryi/QaYjHylSLez52f4b9s=;
  b=ZSWRG/+WuL3wYIbqWP+cNy9U/RmEm/iEYLyuUudofZthN/6FjfuGiZcS
   RWQGUWOEAAYzzXhf3Wjoxc5I1/YpwLL/cyDxXUBn8IkOYLwB7XXalvn2I
   yMMso7KBemAnotJ95cqQ3T4ggBEFF4InWiPuka5QUbiIwkkT5z8/XvTDQ
   d1oFh1ZK98ZVPG8247fEFiJK7gimlbP1aiW+N4uy0Trlvz+8biQ/O1SKx
   HQ+B90TAaPSetcaoxxTx2wpyplFJlKzI7F/N1CxLQByH7yjjh2hEkxKNf
   pQn4wFexmUHD/91kI4k2ZkTAwe9atdCPPu22/tfEGWnQZ603afXXXFuQS
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10834"; a="379281551"
X-IronPort-AV: E=Sophos;i="6.02,150,1688454000"; 
   d="scan'208";a="379281551"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2023 17:22:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10834"; a="745177616"
X-IronPort-AV: E=Sophos;i="6.02,150,1688454000"; 
   d="scan'208";a="745177616"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 15 Sep 2023 17:22:47 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qhJ5B-0003eC-0U;
	Sat, 16 Sep 2023 00:22:45 +0000
Date: Sat, 16 Sep 2023 08:21:58 +0800
From: kernel test robot <lkp@intel.com>
To: Daniel Bristot de Oliveira <bristot@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-trace-kernel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] tracing/timerlat: Hotplug support for the user-space
 interface
Message-ID: <202309160854.SAw0rIUm-lkp@intel.com>
References: <b619d9fd08a3bb47018cf40afa95783844a3c1fd.1694789910.git.bristot@kernel.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b619d9fd08a3bb47018cf40afa95783844a3c1fd.1694789910.git.bristot@kernel.org>

Hi Daniel,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on v6.6-rc1 next-20230915]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Daniel-Bristot-de-Oliveira/tracing-timerlat-Hotplug-support-for-the-user-space-interface/20230915-230157
base:   linus/master
patch link:    https://lore.kernel.org/r/b619d9fd08a3bb47018cf40afa95783844a3c1fd.1694789910.git.bristot%40kernel.org
patch subject: [PATCH] tracing/timerlat: Hotplug support for the user-space interface
config: um-randconfig-002-20230916 (https://download.01.org/0day-ci/archive/20230916/202309160854.SAw0rIUm-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230916/202309160854.SAw0rIUm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309160854.SAw0rIUm-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/trace/trace_osnoise.c:2125:13: warning: 'timerlat_rm_per_cpu_interface' defined but not used [-Wunused-function]
    2125 | static void timerlat_rm_per_cpu_interface(long cpu) {};
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> kernel/trace/trace_osnoise.c:2124:12: warning: 'timerlat_add_per_cpu_interface' defined but not used [-Wunused-function]
    2124 | static int timerlat_add_per_cpu_interface(long cpu) { return 0; };
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/timerlat_rm_per_cpu_interface +2125 kernel/trace/trace_osnoise.c

  2112	
  2113	static void timerlat_rm_per_cpu_interface(long cpu)
  2114	{
  2115		struct dentry *cpu_dir = per_cpu_ptr(&osnoise_per_cpu_dir, cpu)->root;
  2116	
  2117		if (cpu_dir) {
  2118			tracefs_remove(cpu_dir);
  2119			per_cpu_ptr(&osnoise_per_cpu_dir, cpu)->root = NULL;
  2120			per_cpu_ptr(&osnoise_per_cpu_dir, cpu)->timerlat_fd = NULL;
  2121		}
  2122	}
  2123	#else
> 2124	static int timerlat_add_per_cpu_interface(long cpu) { return 0; };
> 2125	static void timerlat_rm_per_cpu_interface(long cpu) {};
  2126	#endif
  2127	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
