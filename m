Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26B4D30FB6
	for <oe-kbuild-all@lists.linux.dev>; Sat,  7 Oct 2023 16:06:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MUzOinDA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696694774; x=1728230774;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=n5AFnPXEzN+QKzdl9114Nc4MT/H4AlQFbFyb9f0tsJE=;
  b=MUzOinDAsStCP8Ftq2H2K5/vbyM3ecbr0CWRwqX2wDM+20UZ7zOfHhmj
   IZ3xnQz3VhW5H+/Xs6vFPPTvIX9VXTKD5NX2q2vPscvkjo10xpN6XUH1p
   OzKDBRwkT5fbnxfTiFShwZrh2OQhTrVjUUZUBJvWzxYmfQoOjg8PJstLW
   7F//YXpZuUdAW4hwGvDbyvCuFAi77UssR2Q6a6sscVOWh8TY5gmrPxU7W
   q/bvTDM7D5GphiY30uL+CcaB6b/FrdjCsGmnxKuQ42IkJChwcy3RANFHJ
   4eI5rsywKBOjn8CFQWQJisKzQ/A5m3aVNCznin0+2l8p0OF9XGmlJ8Seq
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10856"; a="387806743"
X-IronPort-AV: E=Sophos;i="6.03,206,1694761200"; 
   d="scan'208";a="387806743"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Oct 2023 09:06:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10856"; a="702413998"
X-IronPort-AV: E=Sophos;i="6.03,206,1694761200"; 
   d="scan'208";a="702413998"
Received: from lkp-server01.sh.intel.com (HELO 8a3a91ad4240) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 07 Oct 2023 09:06:10 -0700
Received: from kbuild by 8a3a91ad4240 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qp9oe-0004XN-0m;
	Sat, 07 Oct 2023 16:06:08 +0000
Date: Sun, 8 Oct 2023 00:05:40 +0800
From: kernel test robot <lkp@intel.com>
To: Chuyi Zhou <zhouchuyi@bytedance.com>, bpf@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, ast@kernel.org, daniel@iogearbox.net,
	andrii@kernel.org, martin.lau@kernel.org, tj@kernel.org,
	linux-kernel@vger.kernel.org, Chuyi Zhou <zhouchuyi@bytedance.com>
Subject: Re: [PATCH bpf-next v4 4/8] bpf: Introduce css open-coded iterator
 kfuncs
Message-ID: <202310072337.CzRlbffm-lkp@intel.com>
References: <20231007124522.34834-5-zhouchuyi@bytedance.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231007124522.34834-5-zhouchuyi@bytedance.com>

Hi Chuyi,

kernel test robot noticed the following build warnings:

[auto build test WARNING on bpf-next/master]

url:    https://github.com/intel-lab-lkp/linux/commits/Chuyi-Zhou/cgroup-Prepare-for-using-css_task_iter_-in-BPF/20231007-204750
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
patch link:    https://lore.kernel.org/r/20231007124522.34834-5-zhouchuyi%40bytedance.com
patch subject: [PATCH bpf-next v4 4/8] bpf: Introduce css open-coded iterator kfuncs
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20231007/202310072337.CzRlbffm-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231007/202310072337.CzRlbffm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310072337.CzRlbffm-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/bpf/cgroup_iter.c:308:17: warning: no previous prototype for 'bpf_iter_css_new' [-Wmissing-prototypes]
     308 | __bpf_kfunc int bpf_iter_css_new(struct bpf_iter_css *it,
         |                 ^~~~~~~~~~~~~~~~
>> kernel/bpf/cgroup_iter.c:332:41: warning: no previous prototype for 'bpf_iter_css_next' [-Wmissing-prototypes]
     332 | __bpf_kfunc struct cgroup_subsys_state *bpf_iter_css_next(struct bpf_iter_css *it)
         |                                         ^~~~~~~~~~~~~~~~~
>> kernel/bpf/cgroup_iter.c:353:18: warning: no previous prototype for 'bpf_iter_css_destroy' [-Wmissing-prototypes]
     353 | __bpf_kfunc void bpf_iter_css_destroy(struct bpf_iter_css *it)
         |                  ^~~~~~~~~~~~~~~~~~~~
   In file included from <command-line>:
   kernel/bpf/cgroup_iter.c: In function 'bpf_iter_css_new':
   include/linux/compiler_types.h:425:45: error: call to '__compiletime_assert_320' declared with attribute error: BUILD_BUG_ON failed: sizeof(struct bpf_iter_css_kern) != sizeof(struct bpf_iter_css)
     425 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                                             ^
   include/linux/compiler_types.h:406:25: note: in definition of macro '__compiletime_assert'
     406 |                         prefix ## suffix();                             \
         |                         ^~~~~~
   include/linux/compiler_types.h:425:9: note: in expansion of macro '_compiletime_assert'
     425 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:50:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      50 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^~~~~~~~~~~~~~~~
   kernel/bpf/cgroup_iter.c:313:9: note: in expansion of macro 'BUILD_BUG_ON'
     313 |         BUILD_BUG_ON(sizeof(struct bpf_iter_css_kern) != sizeof(struct bpf_iter_css));
         |         ^~~~~~~~~~~~


vim +/bpf_iter_css_new +308 kernel/bpf/cgroup_iter.c

   307	
 > 308	__bpf_kfunc int bpf_iter_css_new(struct bpf_iter_css *it,
   309			struct cgroup_subsys_state *start, unsigned int flags)
   310	{
   311		struct bpf_iter_css_kern *kit = (void *)it;
   312	
   313		BUILD_BUG_ON(sizeof(struct bpf_iter_css_kern) != sizeof(struct bpf_iter_css));
   314		BUILD_BUG_ON(__alignof__(struct bpf_iter_css_kern) != __alignof__(struct bpf_iter_css));
   315	
   316		kit->start = NULL;
   317		switch (flags) {
   318		case BPF_CGROUP_ITER_DESCENDANTS_PRE:
   319		case BPF_CGROUP_ITER_DESCENDANTS_POST:
   320		case BPF_CGROUP_ITER_ANCESTORS_UP:
   321			break;
   322		default:
   323			return -EINVAL;
   324		}
   325	
   326		kit->start = start;
   327		kit->pos = NULL;
   328		kit->flags = flags;
   329		return 0;
   330	}
   331	
 > 332	__bpf_kfunc struct cgroup_subsys_state *bpf_iter_css_next(struct bpf_iter_css *it)
   333	{
   334		struct bpf_iter_css_kern *kit = (void *)it;
   335	
   336		if (!kit->start)
   337			return NULL;
   338	
   339		switch (kit->flags) {
   340		case BPF_CGROUP_ITER_DESCENDANTS_PRE:
   341			kit->pos = css_next_descendant_pre(kit->pos, kit->start);
   342			break;
   343		case BPF_CGROUP_ITER_DESCENDANTS_POST:
   344			kit->pos = css_next_descendant_post(kit->pos, kit->start);
   345			break;
   346		case BPF_CGROUP_ITER_ANCESTORS_UP:
   347			kit->pos = kit->pos ? kit->pos->parent : kit->start;
   348		}
   349	
   350		return kit->pos;
   351	}
   352	
 > 353	__bpf_kfunc void bpf_iter_css_destroy(struct bpf_iter_css *it)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
