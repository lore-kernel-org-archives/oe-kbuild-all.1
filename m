Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 953436FD6
	for <oe-kbuild-all@lists.linux.dev>; Thu, 16 Feb 2023 16:38:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676565518; x=1708101518;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=dVfjWaI8lTx+2Zgoy9PramJr8fbwccV0IrxaIKtAzJ0=;
  b=CG/GFWCCM8Y3bsrx0rFQUZ96gAhdv0vu+x+zLuNpXTKAWho/tHqjXOz5
   F8KBd6e5R/D+ZcXVRWyMKMME2ih22HCdA3RSwTsRkrsyW72OK4WhF5TZ9
   G7VufO+fC1uJaJ7X852TIuJIB5YOC8ScjkN2d+JXU3neo8Ap4fwhvFXuH
   U8QdrR2YARnlC102BAvzlqwx9BAvu/128YrBvo8krLAF9TGZMzPFVTjdH
   4tqmvO6KSSNHYtWLtZGCQIw3zSFWZ6Mq6f1LYOLX4fNm6MtaZJCnRQgWm
   RSu4GCedwyAkRqFzvmHfXUO/1spuratZgzVql4X3/+IKhEEvFAm/qA/5A
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10623"; a="333952365"
X-IronPort-AV: E=Sophos;i="5.97,302,1669104000"; 
   d="scan'208";a="333952365"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2023 08:23:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10623"; a="620041631"
X-IronPort-AV: E=Sophos;i="5.97,302,1669104000"; 
   d="scan'208";a="620041631"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 16 Feb 2023 08:23:31 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pSh2g-000ALN-0Z;
	Thu, 16 Feb 2023 16:23:30 +0000
Date: Fri, 17 Feb 2023 00:23:07 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [Intel-gfx] [RFC PATCH 14/16] drm/ttm: Provide helpers for
 shrinking
Message-ID: <202302170051.Lqleb8u1-lkp@intel.com>
References: <20230215161405.187368-15-thomas.hellstrom@linux.intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230215161405.187368-15-thomas.hellstrom@linux.intel.com>

Hi Thomas,

[FYI, it's a private test report for your RFC patch.]
[auto build test ERROR on drm-misc/drm-misc-next]
[also build test ERROR on drm-intel/for-linux-next drm-tip/drm-tip]
[cannot apply to drm-intel/for-linux-next-fixes linus/master v6.2-rc8 next-20230216]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Thomas-Hellstr-m/drm-ttm-Fix-a-NULL-pointer-dereference/20230216-001727
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20230215161405.187368-15-thomas.hellstrom%40linux.intel.com
patch subject: [Intel-gfx] [RFC PATCH 14/16] drm/ttm: Provide helpers for shrinking
config: sparc-randconfig-r011-20230213 (https://download.01.org/0day-ci/archive/20230217/202302170051.Lqleb8u1-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/888719f1ca5b28696b77e89e4d365aba16053df3
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Thomas-Hellstr-m/drm-ttm-Fix-a-NULL-pointer-dereference/20230216-001727
        git checkout 888719f1ca5b28696b77e89e4d365aba16053df3
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sparc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sparc SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302170051.Lqleb8u1-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/sparc/include/asm/percpu_64.h:5,
                    from arch/sparc/include/asm/percpu.h:5,
                    from include/linux/irqflags.h:17,
                    from include/asm-generic/cmpxchg-local.h:6,
                    from arch/sparc/include/asm/cmpxchg_64.h:111,
                    from arch/sparc/include/asm/cmpxchg.h:5,
                    from arch/sparc/include/asm/atomic_64.h:12,
                    from arch/sparc/include/asm/atomic.h:5,
                    from include/linux/atomic.h:7,
                    from include/linux/mm_types_task.h:13,
                    from include/linux/mm_types.h:5,
                    from mm/swap_backup_folio.c:3:
   mm/swap_backup_folio.c: In function 'swap_backup_folio':
>> include/linux/compiler.h:56:45: error: invalid use of void expression
      56 | #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
         |                                             ^
   include/linux/compiler.h:58:52: note: in definition of macro '__trace_if_var'
      58 | #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
         |                                                    ^~~~
   mm/swap_backup_folio.c:36:9: note: in expansion of macro 'if'
      36 |         if (VM_WARN_ON_ONCE_FOLIO(folio_nr_pages(folio) != 1 &&
         |         ^~
>> include/linux/compiler.h:56:45: error: invalid use of void expression
      56 | #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
         |                                             ^
   include/linux/compiler.h:58:61: note: in definition of macro '__trace_if_var'
      58 | #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
         |                                                             ^~~~
   mm/swap_backup_folio.c:36:9: note: in expansion of macro 'if'
      36 |         if (VM_WARN_ON_ONCE_FOLIO(folio_nr_pages(folio) != 1 &&
         |         ^~
>> include/linux/compiler.h:56:45: error: invalid use of void expression
      56 | #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
         |                                             ^
   include/linux/compiler.h:69:10: note: in definition of macro '__trace_if_value'
      69 |         (cond) ?                                        \
         |          ^~~~
   include/linux/compiler.h:56:28: note: in expansion of macro '__trace_if_var'
      56 | #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
         |                            ^~~~~~~~~~~~~~
   mm/swap_backup_folio.c:36:9: note: in expansion of macro 'if'
      36 |         if (VM_WARN_ON_ONCE_FOLIO(folio_nr_pages(folio) != 1 &&
         |         ^~
>> include/linux/compiler.h:56:45: error: invalid use of void expression
      56 | #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
         |                                             ^
   include/linux/compiler.h:58:52: note: in definition of macro '__trace_if_var'
      58 | #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
         |                                                    ^~~~
   mm/swap_backup_folio.c:42:9: note: in expansion of macro 'if'
      42 |         if (VM_WARN_ON_ONCE_FOLIO(folio_ref_count(folio) != 1 ||
         |         ^~
>> include/linux/compiler.h:56:45: error: invalid use of void expression
      56 | #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
         |                                             ^
   include/linux/compiler.h:58:61: note: in definition of macro '__trace_if_var'
      58 | #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
         |                                                             ^~~~
   mm/swap_backup_folio.c:42:9: note: in expansion of macro 'if'
      42 |         if (VM_WARN_ON_ONCE_FOLIO(folio_ref_count(folio) != 1 ||
         |         ^~
>> include/linux/compiler.h:56:45: error: invalid use of void expression
      56 | #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
         |                                             ^
   include/linux/compiler.h:69:10: note: in definition of macro '__trace_if_value'
      69 |         (cond) ?                                        \
         |          ^~~~
   include/linux/compiler.h:56:28: note: in expansion of macro '__trace_if_var'
      56 | #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
         |                            ^~~~~~~~~~~~~~
   mm/swap_backup_folio.c:42:9: note: in expansion of macro 'if'
      42 |         if (VM_WARN_ON_ONCE_FOLIO(folio_ref_count(folio) != 1 ||
         |         ^~


vim +56 include/linux/compiler.h

2bcd521a684cc9 Steven Rostedt 2008-11-21  50  
2bcd521a684cc9 Steven Rostedt 2008-11-21  51  #ifdef CONFIG_PROFILE_ALL_BRANCHES
2bcd521a684cc9 Steven Rostedt 2008-11-21  52  /*
2bcd521a684cc9 Steven Rostedt 2008-11-21  53   * "Define 'is'", Bill Clinton
2bcd521a684cc9 Steven Rostedt 2008-11-21  54   * "Define 'if'", Steven Rostedt
2bcd521a684cc9 Steven Rostedt 2008-11-21  55   */
a15fd609ad53a6 Linus Torvalds 2019-03-20 @56  #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
a15fd609ad53a6 Linus Torvalds 2019-03-20  57  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
