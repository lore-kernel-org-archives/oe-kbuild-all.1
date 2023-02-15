Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AEE2D2F8
	for <oe-kbuild-all@lists.linux.dev>; Wed, 15 Feb 2023 22:00:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676498412; x=1708034412;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Pn1wo4cMuiU+mkbAMYLF6vPneOu2IKFvFL46dGalbes=;
  b=iWF+RxrkqTY0l03JyH90g0/09XgXFAKrkzl8kRmOQv1LhiC1ytV7o+Q2
   oMASWWW7HWvX3KtHVTcAn5GAIjVpyEGcm/qZVyAxD0fPPkPT/ON008fkd
   GGvdGUn18t1iLL94npx7PUheyPsV6aUrLa0wlGY0oE+7VcTxvipGOmNwh
   T0bNlwsXY9sUDzN6678HkXP8G8ZeyA5dAAaCbvbonTDtWAUvkeV5eKIrN
   muHQMXsvPp0eI+eZ4+KuTaLmAlCFcnKGC7MT7plM5LgzNmtzWbHp0igRl
   Z6KPA17gLE1GM/5SzUu3z8BvYimvCZUCwZOeHGcLDxWxYErqVf90Jwboe
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10622"; a="332871712"
X-IronPort-AV: E=Sophos;i="5.97,300,1669104000"; 
   d="scan'208";a="332871712"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Feb 2023 14:00:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10622"; a="758644677"
X-IronPort-AV: E=Sophos;i="5.97,300,1669104000"; 
   d="scan'208";a="758644677"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 15 Feb 2023 14:00:07 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pSPot-0009pZ-04;
	Wed, 15 Feb 2023 22:00:07 +0000
Date: Thu, 16 Feb 2023 06:00:04 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [Intel-gfx] [RFC PATCH 14/16] drm/ttm: Provide helpers for
 shrinking
Message-ID: <202302160558.LKUz5UOd-lkp@intel.com>
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
[cannot apply to drm-intel/for-linux-next-fixes linus/master v6.2-rc8 next-20230215]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Thomas-Hellstr-m/drm-ttm-Fix-a-NULL-pointer-dereference/20230216-001727
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20230215161405.187368-15-thomas.hellstrom%40linux.intel.com
patch subject: [Intel-gfx] [RFC PATCH 14/16] drm/ttm: Provide helpers for shrinking
config: parisc64-defconfig (https://download.01.org/0day-ci/archive/20230216/202302160558.LKUz5UOd-lkp@intel.com/config)
compiler: hppa64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/888719f1ca5b28696b77e89e4d365aba16053df3
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Thomas-Hellstr-m/drm-ttm-Fix-a-NULL-pointer-dereference/20230216-001727
        git checkout 888719f1ca5b28696b77e89e4d365aba16053df3
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=parisc64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=parisc64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302160558.LKUz5UOd-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/init.h:5,
                    from arch/parisc/include/asm/alternative.h:18,
                    from arch/parisc/include/asm/barrier.h:5,
                    from arch/parisc/include/asm/atomic.h:11,
                    from include/linux/atomic.h:7,
                    from include/linux/mm_types_task.h:13,
                    from include/linux/mm_types.h:5,
                    from mm/swap_backup_folio.c:3:
   mm/swap_backup_folio.c: In function 'swap_backup_folio':
>> include/linux/build_bug.h:30:33: error: void value not ignored as it ought to be
      30 | #define BUILD_BUG_ON_INVALID(e) ((void)(sizeof((__force long)(e))))
         |                                 ^
   include/linux/mmdebug.h:92:45: note: in expansion of macro 'BUILD_BUG_ON_INVALID'
      92 | #define VM_WARN_ON_ONCE_FOLIO(cond, folio)  BUILD_BUG_ON_INVALID(cond)
         |                                             ^~~~~~~~~~~~~~~~~~~~
   mm/swap_backup_folio.c:36:13: note: in expansion of macro 'VM_WARN_ON_ONCE_FOLIO'
      36 |         if (VM_WARN_ON_ONCE_FOLIO(folio_nr_pages(folio) != 1 &&
         |             ^~~~~~~~~~~~~~~~~~~~~
>> include/linux/build_bug.h:30:33: error: void value not ignored as it ought to be
      30 | #define BUILD_BUG_ON_INVALID(e) ((void)(sizeof((__force long)(e))))
         |                                 ^
   include/linux/mmdebug.h:92:45: note: in expansion of macro 'BUILD_BUG_ON_INVALID'
      92 | #define VM_WARN_ON_ONCE_FOLIO(cond, folio)  BUILD_BUG_ON_INVALID(cond)
         |                                             ^~~~~~~~~~~~~~~~~~~~
   mm/swap_backup_folio.c:42:13: note: in expansion of macro 'VM_WARN_ON_ONCE_FOLIO'
      42 |         if (VM_WARN_ON_ONCE_FOLIO(folio_ref_count(folio) != 1 ||
         |             ^~~~~~~~~~~~~~~~~~~~~


vim +30 include/linux/build_bug.h

527edbc18a70e7 Masahiro Yamada 2019-01-03  18  
527edbc18a70e7 Masahiro Yamada 2019-01-03  19  /* Force a compilation error if a constant expression is not a power of 2 */
527edbc18a70e7 Masahiro Yamada 2019-01-03  20  #define __BUILD_BUG_ON_NOT_POWER_OF_2(n)	\
527edbc18a70e7 Masahiro Yamada 2019-01-03  21  	BUILD_BUG_ON(((n) & ((n) - 1)) != 0)
527edbc18a70e7 Masahiro Yamada 2019-01-03  22  #define BUILD_BUG_ON_NOT_POWER_OF_2(n)			\
527edbc18a70e7 Masahiro Yamada 2019-01-03  23  	BUILD_BUG_ON((n) == 0 || (((n) & ((n) - 1)) != 0))
bc6245e5efd70c Ian Abbott      2017-07-10  24  
bc6245e5efd70c Ian Abbott      2017-07-10  25  /*
bc6245e5efd70c Ian Abbott      2017-07-10  26   * BUILD_BUG_ON_INVALID() permits the compiler to check the validity of the
bc6245e5efd70c Ian Abbott      2017-07-10  27   * expression but avoids the generation of any code, even if that expression
bc6245e5efd70c Ian Abbott      2017-07-10  28   * has side-effects.
bc6245e5efd70c Ian Abbott      2017-07-10  29   */
bc6245e5efd70c Ian Abbott      2017-07-10 @30  #define BUILD_BUG_ON_INVALID(e) ((void)(sizeof((__force long)(e))))
bc6245e5efd70c Ian Abbott      2017-07-10  31  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
