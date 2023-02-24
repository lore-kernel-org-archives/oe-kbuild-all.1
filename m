Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6087D6FBB
	for <oe-kbuild-all@lists.linux.dev>; Fri, 24 Feb 2023 16:27:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677256026; x=1708792026;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=vtFjZDmPLPxtTSQVYru6QowiAzLoJNAikJQrTApB+Jc=;
  b=oJDwrLlE3/1hMjJp243sqixbEeP428r0w016Oxh6tTAbopKfZjZg7P79
   /Ka5OJC6Ia00RJNrZckcKrg9zPcyU0wdH3cPGhJQgJQUcJGw+r3wVSmPE
   ofzjyeaHwuDfKJdFuDD7rVh1777DzYcAjblbTM/5/abh/Ur6rAnDW1f1l
   EUzFmryHg3pIONte26y/ewQsR1JcIA71h1qfG69FM+R+Md1FYiBSblXwd
   wb9VdJ6OI+MFdWb9mujoHcC5NRYTDizt6FYeBOYxHUPvanoluZNfT6p/V
   PEqc/ePkyskRe8OydF7xjFKgOE4OkFyj9nrsPBVXhKLIV4RTI2VUXXnbc
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10631"; a="317273631"
X-IronPort-AV: E=Sophos;i="5.97,325,1669104000"; 
   d="scan'208";a="317273631"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2023 08:27:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10631"; a="705322966"
X-IronPort-AV: E=Sophos;i="5.97,325,1669104000"; 
   d="scan'208";a="705322966"
Received: from lkp-server01.sh.intel.com (HELO 3895f5c55ead) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 24 Feb 2023 08:26:58 -0800
Received: from kbuild by 3895f5c55ead with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pVauO-0002Xf-3B;
	Fri, 24 Feb 2023 16:26:56 +0000
Date: Sat, 25 Feb 2023 00:26:06 +0800
From: kernel test robot <lkp@intel.com>
To: Chen Zhongjin <chenzhongjin@huawei.com>, linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, chenzhongjin@huawei.com,
	akpm@linux-foudation.org, wuchi.zero@gmail.com, ben-linux@fluff.org,
	rusty@rustcorp.com.au
Subject: Re: [PATCH] x86: profiling: Set prof_cpu_mask to NULL after free
Message-ID: <202302250053.73MumSNs-lkp@intel.com>
References: <20230224084945.134038-1-chenzhongjin@huawei.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230224084945.134038-1-chenzhongjin@huawei.com>

Hi Chen,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on linus/master]
[also build test ERROR on next-20230224]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Chen-Zhongjin/x86-profiling-Set-prof_cpu_mask-to-NULL-after-free/20230224-165419
patch link:    https://lore.kernel.org/r/20230224084945.134038-1-chenzhongjin%40huawei.com
patch subject: [PATCH] x86: profiling: Set prof_cpu_mask to NULL after free
config: openrisc-randconfig-r012-20230222 (https://download.01.org/0day-ci/archive/20230225/202302250053.73MumSNs-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/ed9b4879e816862f4f6210b1c429bcbebac6d317
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Chen-Zhongjin/x86-profiling-Set-prof_cpu_mask-to-NULL-after-free/20230224-165419
        git checkout ed9b4879e816862f4f6210b1c429bcbebac6d317
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=openrisc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=openrisc SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302250053.73MumSNs-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/profile.c: In function 'profile_init':
>> kernel/profile.c:136:23: error: assignment to expression with array type
     136 |         prof_cpu_mask = NULL;
         |                       ^


vim +136 kernel/profile.c

    98	
    99	
   100	int __ref profile_init(void)
   101	{
   102		int buffer_bytes;
   103		if (!prof_on)
   104			return 0;
   105	
   106		/* only text is profiled */
   107		prof_len = (_etext - _stext) >> prof_shift;
   108	
   109		if (!prof_len) {
   110			pr_warn("profiling shift: %u too large\n", prof_shift);
   111			prof_on = 0;
   112			return -EINVAL;
   113		}
   114	
   115		buffer_bytes = prof_len*sizeof(atomic_t);
   116	
   117		if (!alloc_cpumask_var(&prof_cpu_mask, GFP_KERNEL))
   118			return -ENOMEM;
   119	
   120		cpumask_copy(prof_cpu_mask, cpu_possible_mask);
   121	
   122		prof_buffer = kzalloc(buffer_bytes, GFP_KERNEL|__GFP_NOWARN);
   123		if (prof_buffer)
   124			return 0;
   125	
   126		prof_buffer = alloc_pages_exact(buffer_bytes,
   127						GFP_KERNEL|__GFP_ZERO|__GFP_NOWARN);
   128		if (prof_buffer)
   129			return 0;
   130	
   131		prof_buffer = vzalloc(buffer_bytes);
   132		if (prof_buffer)
   133			return 0;
   134	
   135		free_cpumask_var(prof_cpu_mask);
 > 136		prof_cpu_mask = NULL;
   137		return -ENOMEM;
   138	}
   139	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
