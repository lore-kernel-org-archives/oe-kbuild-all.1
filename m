Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDD9323B8
	for <oe-kbuild-all@lists.linux.dev>; Sat, 21 Jan 2023 13:05:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674306329; x=1705842329;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=hQqpAboKcp0CU8eDrws4JPIasl3/c8rUFWjk4p58ebE=;
  b=MROmCaa9QZ/mduhszsuYRIb1MFejNQxO9Ewf772/wtRabt3L1XyzUUY5
   ztjjCmzv40yh7WeKZe4qBfK6f882Abr3GL8vE4sZduZSwqxrf5lnwS6Yb
   fM+M0ExS+CEwu+N6GXIIAlYWOEcgwNcgtnI/CW2t4JWLhSXoMzPq22q67
   X2BgdGr5N6m7NSSpLKypnZKZmJ7Z/WxdtRGgthcfxCQe2eCAptSICNpDH
   eqbimbzttTVatHBDHqCnIMHoqOj1fu8Kzj2233LxLrh3AA74Q2B2Mf7Qd
   5LifKTUyacSQmwYqcrdsuSu0wyWAbBcgCX3r79dakFc0iBd3sj2LFMksf
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10596"; a="412015632"
X-IronPort-AV: E=Sophos;i="5.97,235,1669104000"; 
   d="scan'208";a="412015632"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2023 05:05:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10596"; a="654087127"
X-IronPort-AV: E=Sophos;i="5.97,235,1669104000"; 
   d="scan'208";a="654087127"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 21 Jan 2023 05:05:22 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pJDYf-00045G-0s;
	Sat, 21 Jan 2023 13:05:21 +0000
Date: Sat, 21 Jan 2023 21:04:29 +0800
From: kernel test robot <lkp@intel.com>
To: Gregory Price <gourry.memverge@gmail.com>, linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, linux-fsdevel@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org,
	krisman@collabora.com, tglx@linutronix.de, luto@kernel.org,
	oleg@redhat.com, peterz@infradead.org, ebiederm@xmission.com,
	akpm@linux-foundation.org, adobriyan@gmail.com, corbet@lwn.net,
	shuah@kernel.org, Gregory Price <gregory.price@memverge.com>
Subject: Re: [PATCH v4 2/3] fs/proc/array: Add Syscall User Dispatch to proc
 status
Message-ID: <202301212030.oAj9QJnD-lkp@intel.com>
References: <20230121102316.331935-3-gregory.price@memverge.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230121102316.331935-3-gregory.price@memverge.com>

Hi Gregory,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on linus/master]
[also build test ERROR on v6.2-rc4 next-20230120]
[cannot apply to tip/core/entry]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Gregory-Price/ptrace-syscall_user_dispatch-Implement-Syscall-User-Dispatch-Suspension/20230121-182401
patch link:    https://lore.kernel.org/r/20230121102316.331935-3-gregory.price%40memverge.com
patch subject: [PATCH v4 2/3] fs/proc/array: Add Syscall User Dispatch to proc status
config: arc-randconfig-r043-20230119 (https://download.01.org/0day-ci/archive/20230121/202301212030.oAj9QJnD-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/a2cb8440d45e7d3030e7349c7c598971a951e5f2
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Gregory-Price/ptrace-syscall_user_dispatch-Implement-Syscall-User-Dispatch-Suspension/20230121-182401
        git checkout a2cb8440d45e7d3030e7349c7c598971a951e5f2
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arc SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from include/asm-generic/current.h:5,
                    from arch/arc/include/asm/current.h:20,
                    from include/linux/sched.h:12,
                    from include/linux/time_namespace.h:6,
                    from fs/proc/array.c:59:
   fs/proc/array.c: In function 'task_syscall_user_dispatch':
>> include/linux/thread_info.h:168:52: error: 'TIF_SYSCALL_USER_DISPATCH' undeclared (first use in this function); did you mean 'PR_SET_SYSCALL_USER_DISPATCH'?
     168 |         test_ti_thread_flag(current_thread_info(), TIF_##fl)
         |                                                    ^~~~
   fs/proc/array.c:435:29: note: in expansion of macro 'test_syscall_work'
     435 |                             test_syscall_work(SYSCALL_USER_DISPATCH));
         |                             ^~~~~~~~~~~~~~~~~
   include/linux/thread_info.h:168:52: note: each undeclared identifier is reported only once for each function it appears in
     168 |         test_ti_thread_flag(current_thread_info(), TIF_##fl)
         |                                                    ^~~~
   fs/proc/array.c:435:29: note: in expansion of macro 'test_syscall_work'
     435 |                             test_syscall_work(SYSCALL_USER_DISPATCH));
         |                             ^~~~~~~~~~~~~~~~~


vim +168 include/linux/thread_info.h

3136b93c3fb2b7 Gabriel Krisman Bertazi 2020-11-16  164  
3136b93c3fb2b7 Gabriel Krisman Bertazi 2020-11-16  165  #define set_syscall_work(fl)						\
5903f61e035320 Gabriel Krisman Bertazi 2020-11-23  166  	set_ti_thread_flag(current_thread_info(), TIF_##fl)
3136b93c3fb2b7 Gabriel Krisman Bertazi 2020-11-16  167  #define test_syscall_work(fl) \
5903f61e035320 Gabriel Krisman Bertazi 2020-11-23 @168  	test_ti_thread_flag(current_thread_info(), TIF_##fl)
3136b93c3fb2b7 Gabriel Krisman Bertazi 2020-11-16  169  #define clear_syscall_work(fl) \
5903f61e035320 Gabriel Krisman Bertazi 2020-11-23  170  	clear_ti_thread_flag(current_thread_info(), TIF_##fl)
3136b93c3fb2b7 Gabriel Krisman Bertazi 2020-11-16  171  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
