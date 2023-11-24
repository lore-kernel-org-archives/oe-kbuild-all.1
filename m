Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A5852FC21
	for <oe-kbuild-all@lists.linux.dev>; Fri, 24 Nov 2023 15:41:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IJEmpg0G"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700840485; x=1732376485;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=c2Vqe3x33aE9kTCdbYkqqP9jPVzZrJzKmfGmmqpORXA=;
  b=IJEmpg0G5S6coN0TUHcYBdfV66u0UY6wsLKOJ0xYv0fE5HbvGELCOrrQ
   vhte0BVp/LFNvpapo8oYzh9jbb2YWTjyoM5Tgk5dBz/KHYr/sZ0NS2ADy
   CWhpVqNvS2h0eWuaVvo79P1dV1/ds5sq5H2W3XrsDFbx9uAdIHaiJhlF7
   fT8eg7Geh69gMyQv6+jZUtB1FyoEdqdPgQBYlNtHOQ5UUK1CqQ2Ar6SfJ
   /NmGa8OPTXpy5/Dldki6c9NvcfYrIs8qJBCyW9D43T46gzimZ4Sb4uL+s
   gXKdoftXekN6Q2LGxSGnmqaK6rFGFd2L5aZtNbnC4aJe4laMCVHzcIJrQ
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10904"; a="423577098"
X-IronPort-AV: E=Sophos;i="6.04,224,1695711600"; 
   d="scan'208";a="423577098"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2023 07:41:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10904"; a="833714362"
X-IronPort-AV: E=Sophos;i="6.04,224,1695711600"; 
   d="scan'208";a="833714362"
Received: from lkp-server01.sh.intel.com (HELO d584ee6ebdcc) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 24 Nov 2023 07:41:21 -0800
Received: from kbuild by d584ee6ebdcc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r6YIx-0002xm-2k;
	Fri, 24 Nov 2023 15:41:19 +0000
Date: Fri, 24 Nov 2023 23:40:57 +0800
From: kernel test robot <lkp@intel.com>
To: "Masami Hiramatsu (Google)" <mhiramat@kernel.org>,
	linux-trace-kernel@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, JP Kobryn <inwardvessel@gmail.com>,
	bpf@vger.kernel.org, kernel-team@meta.com, rostedt@goodmis.org,
	peterz@infradead.org
Subject: Re: [PATCH] rethook: Use __rcu pointer for rethook::handler
Message-ID: <202311241808.rv9ceuAh-lkp@intel.com>
References: <170078778632.209874.7893551840863388753.stgit@devnote2>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <170078778632.209874.7893551840863388753.stgit@devnote2>

Hi Masami,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on v6.7-rc2 next-20231124]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Masami-Hiramatsu-Google/rethook-Use-__rcu-pointer-for-rethook-handler/20231124-090634
base:   linus/master
patch link:    https://lore.kernel.org/r/170078778632.209874.7893551840863388753.stgit%40devnote2
patch subject: [PATCH] rethook: Use __rcu pointer for rethook::handler
config: x86_64-randconfig-r113-20231124 (https://download.01.org/0day-ci/archive/20231124/202311241808.rv9ceuAh-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231124/202311241808.rv9ceuAh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311241808.rv9ceuAh-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> kernel/trace/rethook.c:51:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
>> kernel/trace/rethook.c:51:9: sparse:    void ( [noderef] __rcu * )( ... )
>> kernel/trace/rethook.c:51:9: sparse:    void ( * )( ... )
   kernel/trace/rethook.c:66:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/trace/rethook.c:66:9: sparse:    void ( [noderef] __rcu * )( ... )
   kernel/trace/rethook.c:66:9: sparse:    void ( * )( ... )
   kernel/trace/rethook.c:110:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/trace/rethook.c:110:9: sparse:    void ( [noderef] __rcu * )( ... )
   kernel/trace/rethook.c:110:9: sparse:    void ( * )( ... )
   kernel/trace/rethook.c:140:19: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/trace/rethook.c:140:19: sparse:    void ( [noderef] __rcu * )( ... )
   kernel/trace/rethook.c:140:19: sparse:    void ( * )( ... )
   kernel/trace/rethook.c:161:19: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/trace/rethook.c:161:19: sparse:    void ( [noderef] __rcu * )( ... )
   kernel/trace/rethook.c:161:19: sparse:    void ( * )( ... )
   kernel/trace/rethook.c:305:27: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/trace/rethook.c:305:27: sparse:    void ( [noderef] __rcu * )( ... )
   kernel/trace/rethook.c:305:27: sparse:    void ( * )( ... )

vim +51 kernel/trace/rethook.c

    40	
    41	/**
    42	 * rethook_stop() - Stop using a rethook.
    43	 * @rh: the struct rethook to stop.
    44	 *
    45	 * Stop using a rethook to prepare for freeing it. If you want to wait for
    46	 * all running rethook handler before calling rethook_free(), you need to
    47	 * call this first and wait RCU, and call rethook_free().
    48	 */
    49	void rethook_stop(struct rethook *rh)
    50	{
  > 51		rcu_assign_pointer(rh->handler, NULL);
    52	}
    53	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
