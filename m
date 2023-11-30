Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B64F0524C2
	for <oe-kbuild-all@lists.linux.dev>; Thu, 30 Nov 2023 16:25:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YzrScC9O"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701361547; x=1732897547;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=x5pgsWdGiD6G7Jv0D2O1jlpnGGKqT8tM3G7Vdqr2uac=;
  b=YzrScC9OZitQGn+1Z9O23wZxEFlD1iC9I9NFLS1dCcnzQ4kmzILrDseT
   HA43fAZhcB/CMJeN84azTGbG7JPUDbm9UtZIHpj1cviGZhGSi7XnborWz
   zbqTj6xnd0uQSJ0v32lfDZJ4mg4y8Ww7JhknSy8x19cpWCEyfNXKy2tnQ
   gUj0UHRfXpF0xz4aV+EWRW02YujM/uv1rz7PBXXi6apYRvLZJtuKo50m9
   /+rMP9furAiquW4v4tG5+hJuwb3RBjWwSzapoONMbAHMho6arpOf2Jvzd
   HXanBWsdMuvuc3y7PlHdr0ugjSlAcqqD0Cjz/lvifNI32LDwBIcIQ9et/
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="378377036"
X-IronPort-AV: E=Sophos;i="6.04,239,1695711600"; 
   d="scan'208";a="378377036"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2023 08:25:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="745692557"
X-IronPort-AV: E=Sophos;i="6.04,239,1695711600"; 
   d="scan'208";a="745692557"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 30 Nov 2023 08:25:43 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r8jrA-0002LX-2V;
	Thu, 30 Nov 2023 16:25:40 +0000
Date: Fri, 1 Dec 2023 00:25:10 +0800
From: kernel test robot <lkp@intel.com>
To: Vincent Mailhol <mailhol.vincent@wanadoo.fr>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-kernel@vger.kernel.org, Yury Norov <yury.norov@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Vincent Mailhol <mailhol.vincent@wanadoo.fr>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Douglas Anderson <dianders@chromium.org>,
	Kees Cook <keescook@chromium.org>, Petr Mladek <pmladek@suse.com>,
	Randy Dunlap <rdunlap@infradead.org>,
	Zhaoyang Huang <zhaoyang.huang@unisoc.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Marco Elver <elver@google.com>
Subject: Re: [PATCH v2] lib: test_bitops: add compile-time
 optimization/evaluations assertions
Message-ID: <202312010058.JJKeeqvE-lkp@intel.com>
References: <20231130102717.1297492-1-mailhol.vincent@wanadoo.fr>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231130102717.1297492-1-mailhol.vincent@wanadoo.fr>

Hi Vincent,

kernel test robot noticed the following build errors:

[auto build test ERROR on akpm-mm/mm-everything]
[also build test ERROR on linus/master v6.7-rc3 next-20231130]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Vincent-Mailhol/lib-test_bitops-add-compile-time-optimization-evaluations-assertions/20231130-182837
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20231130102717.1297492-1-mailhol.vincent%40wanadoo.fr
patch subject: [PATCH v2] lib: test_bitops: add compile-time optimization/evaluations assertions
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20231201/202312010058.JJKeeqvE-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231201/202312010058.JJKeeqvE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312010058.JJKeeqvE-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <command-line>:
   In function 'test_bitops_const_eval',
       inlined from 'test_bitops_startup' at lib/test_bitops.c:126:2:
>> include/linux/compiler_types.h:435:45: error: call to '__compiletime_assert_183' declared with attribute error: BUILD_BUG_ON failed: !__builtin_constant_p(__test_expr)
     435 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                                             ^
   include/linux/compiler_types.h:416:25: note: in definition of macro '__compiletime_assert'
     416 |                         prefix ## suffix();                             \
         |                         ^~~~~~
   include/linux/compiler_types.h:435:9: note: in expansion of macro '_compiletime_assert'
     435 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:50:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      50 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^~~~~~~~~~~~~~~~
   lib/test_bitops.c:59:9: note: in expansion of macro 'BUILD_BUG_ON'
      59 |         BUILD_BUG_ON(!__builtin_constant_p(__test_expr));       \
         |         ^~~~~~~~~~~~
   lib/test_bitops.c:74:9: note: in expansion of macro 'test_const_eval'
      74 |         test_const_eval(__ffs(BIT(n)) == n);
         |         ^~~~~~~~~~~~~~~


vim +/__compiletime_assert_183 +435 include/linux/compiler_types.h

eb5c2d4b45e3d2 Will Deacon 2020-07-21  421  
eb5c2d4b45e3d2 Will Deacon 2020-07-21  422  #define _compiletime_assert(condition, msg, prefix, suffix) \
eb5c2d4b45e3d2 Will Deacon 2020-07-21  423  	__compiletime_assert(condition, msg, prefix, suffix)
eb5c2d4b45e3d2 Will Deacon 2020-07-21  424  
eb5c2d4b45e3d2 Will Deacon 2020-07-21  425  /**
eb5c2d4b45e3d2 Will Deacon 2020-07-21  426   * compiletime_assert - break build and emit msg if condition is false
eb5c2d4b45e3d2 Will Deacon 2020-07-21  427   * @condition: a compile-time constant condition to check
eb5c2d4b45e3d2 Will Deacon 2020-07-21  428   * @msg:       a message to emit if condition is false
eb5c2d4b45e3d2 Will Deacon 2020-07-21  429   *
eb5c2d4b45e3d2 Will Deacon 2020-07-21  430   * In tradition of POSIX assert, this macro will break the build if the
eb5c2d4b45e3d2 Will Deacon 2020-07-21  431   * supplied condition is *false*, emitting the supplied error message if the
eb5c2d4b45e3d2 Will Deacon 2020-07-21  432   * compiler has support to do so.
eb5c2d4b45e3d2 Will Deacon 2020-07-21  433   */
eb5c2d4b45e3d2 Will Deacon 2020-07-21  434  #define compiletime_assert(condition, msg) \
eb5c2d4b45e3d2 Will Deacon 2020-07-21 @435  	_compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
eb5c2d4b45e3d2 Will Deacon 2020-07-21  436  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
