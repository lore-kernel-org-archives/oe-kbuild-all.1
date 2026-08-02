Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E16911DB95E
	for <oe-kbuild-all@lists.linux.dev>; Sun,  2 Aug 2026 05:50:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785649807; cv=none; b=YrcUBZPaPQBn9pggPMgZAjiEKieJosFQwHefhs/kaC940TQAK4lSJ00fUeqSgAJj3hFg/djtHjP6bxXoyine2ctirAzoTHHi6zV+oQwEBiFETq5SY37WrciPGLNd11q6wd3cjetg7BW/xjhFEEmqE0QAditDDx3sE/kgkwf+Fak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785649807; c=relaxed/simple;
	bh=vQP1g3Us2pCxyL3FDGpIC9ffRPQYUdQ6Ki1uoBZuAOQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Kgj44lL4Hra4GO49U4W/87fzkVS9U8XcYGvN/fp8l98GO3dwJVQ3SQ0Z7lAegyWKJAZxGFFEjFgHMZNCrjoKN3aJSIuwbKwZpLlGaLOnW7F9ouQVOUsJvzc4mac6/5PdtoFUdT6ud9i68JqAWdA1MWDSvy3/YRh02i4bMzeV83c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hbcqn1/B; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hbcqn1/B"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785649805; x=1817185805;
  h=date:from:to:cc:subject:message-id;
  bh=vQP1g3Us2pCxyL3FDGpIC9ffRPQYUdQ6Ki1uoBZuAOQ=;
  b=hbcqn1/BPkp9K4Ad6Bkn5/dAYr7wqA9DdqnuapmsPVoPz7d3wcN2+kKl
   NKC0PpyuQjeiltWQDgGNgszJUvhon0up+h8ABBQA6IzPrFFrHDIVgBXYr
   PHB8S40JFPAs8eeprlFVwLA02ZlmgXPxCkCPrCIoU95MQyD/A82gYsBPR
   /iVHMVXKkPk4nkuLLPPxkG1SlupJiK2tNNhu1HeHi9zVjDBERUuzb5rMf
   oJ6vlDIyXl/jnAHJriO81NxUtFFQzzOpsdmYgWpSH5j9h3ukrpSxvGAeI
   mihK3sBbRqLPvKYTlN36BR5M12Tnam3TMfw0d6EvA2DmGgA8thS+1p7rd
   g==;
X-CSE-ConnectionGUID: KGTfTT2NT8KidIdDu21Yzw==
X-CSE-MsgGUID: F8P5TIkBTAiV8fRA/ltMig==
X-IronPort-AV: E=McAfee;i="6800,10657,11862"; a="86170855"
X-IronPort-AV: E=Sophos;i="6.25,199,1779174000"; 
   d="scan'208";a="86170855"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Aug 2026 22:50:05 -0700
X-CSE-ConnectionGUID: yKnE5IpcTxGBN7zjnUi9XQ==
X-CSE-MsgGUID: 1kNSSJEyRia/h9Mki/D6DA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,199,1779174000"; 
   d="scan'208";a="260361493"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 01 Aug 2026 22:50:03 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wqP5E-000000004XV-3sIE;
	Sun, 02 Aug 2026 05:50:00 +0000
Date: Sun, 02 Aug 2026 13:49:56 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-2026-06 1/1]
 include/linux/compiler.h:166:45: error: '__UNIQUE_ID_y_786' undeclared; did
 you mean '__UNIQUE_ID_x_785'?
Message-ID: <202608021325.pMEaTrSm-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android16-6.12-2026-06
head:   82a2ca6cbee492b7812547877238bc89e4968da4
commit: 1d9d3192c3a2b90a68a3ebe4a9b5b0fa27af0b9e [1/1] BACKPORT: locking/local_lock, mm: replace localtry_ helpers with local_trylock_t type
config: arm64-randconfig-003-20260802 (https://download.01.org/0day-ci/archive/20260802/202608021325.pMEaTrSm-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260802/202608021325.pMEaTrSm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608021325.pMEaTrSm-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/blk-crypto.h:127,
                    from include/linux/blk-crypto-profile.h:10,
                    from include/linux/mmc/host.h:19,
                    from drivers/mmc/host/mmci.c:23:
   include/linux/blkdev.h:1830:24: error: field 'req_list' has incomplete type
    1830 |         struct rq_list req_list;
         |                        ^~~~~~~~
   In file included from <command-line>:
   drivers/mmc/host/mmci.c: In function 'mmci_probe':
>> include/linux/compiler.h:166:45: error: '__UNIQUE_ID_y_786' undeclared (first use in this function); did you mean '__UNIQUE_ID_x_785'?
     166 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
         |                                             ^~~~~~~~~~~~
   include/linux/compiler_types.h:528:23: note: in definition of macro '__compiletime_assert'
     528 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:548:9: note: in expansion of macro '_compiletime_assert'
     548 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:93:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      93 |         BUILD_BUG_ON_MSG(!__types_ok(ux, uy),           \
         |         ^~~~~~~~~~~~~~~~
   include/linux/minmax.h:49:25: note: in expansion of macro 'is_signed_type'
      49 | #define __sign_use(ux) (is_signed_type(typeof(ux)) ? \
         |                         ^~~~~~~~~~~~~~
   include/linux/minmax.h:75:27: note: in expansion of macro '__sign_use'
      75 |         (__sign_use(ux) & __sign_use(uy))
         |                           ^~~~~~~~~~
   include/linux/minmax.h:93:27: note: in expansion of macro '__types_ok'
      93 |         BUILD_BUG_ON_MSG(!__types_ok(ux, uy),           \
         |                           ^~~~~~~~~~
   include/linux/minmax.h:98:9: note: in expansion of macro '__careful_cmp_once'
      98 |         __careful_cmp_once(op, x, y, __UNIQUE_ID(x_), __UNIQUE_ID(y_))
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:97:22: note: in expansion of macro '___PASTE'
      97 | #define __PASTE(a,b) ___PASTE(a,b)
         |                      ^~~~~~~~
   include/linux/compiler.h:166:29: note: in expansion of macro '__PASTE'
     166 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
         |                             ^~~~~~~
   include/linux/compiler_types.h:97:22: note: in expansion of macro '___PASTE'
      97 | #define __PASTE(a,b) ___PASTE(a,b)
         |                      ^~~~~~~~
   include/linux/compiler.h:166:37: note: in expansion of macro '__PASTE'
     166 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
         |                                     ^~~~~~~
   include/linux/minmax.h:98:55: note: in expansion of macro '__UNIQUE_ID'
      98 |         __careful_cmp_once(op, x, y, __UNIQUE_ID(x_), __UNIQUE_ID(y_))
         |                                                       ^~~~~~~~~~~
   include/linux/minmax.h:105:25: note: in expansion of macro '__careful_cmp'
     105 | #define min(x, y)       __careful_cmp(min, x, y)
         |                         ^~~~~~~~~~~~~
   drivers/mmc/host/mmci.c:2333:40: note: in expansion of macro 'min'
    2333 |                                 fmax : min(host->mclk, fmax);
         |                                        ^~~
   include/linux/compiler.h:166:45: note: each undeclared identifier is reported only once for each function it appears in
     166 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
         |                                             ^~~~~~~~~~~~
   include/linux/compiler_types.h:528:23: note: in definition of macro '__compiletime_assert'
     528 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:548:9: note: in expansion of macro '_compiletime_assert'
     548 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:93:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      93 |         BUILD_BUG_ON_MSG(!__types_ok(ux, uy),           \
         |         ^~~~~~~~~~~~~~~~
   include/linux/minmax.h:49:25: note: in expansion of macro 'is_signed_type'
      49 | #define __sign_use(ux) (is_signed_type(typeof(ux)) ? \
         |                         ^~~~~~~~~~~~~~
   include/linux/minmax.h:75:27: note: in expansion of macro '__sign_use'
      75 |         (__sign_use(ux) & __sign_use(uy))
         |                           ^~~~~~~~~~
   include/linux/minmax.h:93:27: note: in expansion of macro '__types_ok'
      93 |         BUILD_BUG_ON_MSG(!__types_ok(ux, uy),           \
         |                           ^~~~~~~~~~
   include/linux/minmax.h:98:9: note: in expansion of macro '__careful_cmp_once'
      98 |         __careful_cmp_once(op, x, y, __UNIQUE_ID(x_), __UNIQUE_ID(y_))
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:97:22: note: in expansion of macro '___PASTE'
      97 | #define __PASTE(a,b) ___PASTE(a,b)
         |                      ^~~~~~~~
   include/linux/compiler.h:166:29: note: in expansion of macro '__PASTE'
     166 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
         |                             ^~~~~~~
   include/linux/compiler_types.h:97:22: note: in expansion of macro '___PASTE'
      97 | #define __PASTE(a,b) ___PASTE(a,b)
         |                      ^~~~~~~~
   include/linux/compiler.h:166:37: note: in expansion of macro '__PASTE'
     166 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
         |                                     ^~~~~~~
   include/linux/minmax.h:98:55: note: in expansion of macro '__UNIQUE_ID'
      98 |         __careful_cmp_once(op, x, y, __UNIQUE_ID(x_), __UNIQUE_ID(y_))
         |                                                       ^~~~~~~~~~~
   include/linux/minmax.h:105:25: note: in expansion of macro '__careful_cmp'
     105 | #define min(x, y)       __careful_cmp(min, x, y)
         |                         ^~~~~~~~~~~~~
   drivers/mmc/host/mmci.c:2333:40: note: in expansion of macro 'min'
    2333 |                                 fmax : min(host->mclk, fmax);
         |                                        ^~~
   drivers/mmc/host/mmci.c: At top level:
   drivers/mmc/host/mmci.c:53:21: warning: 'fmax' defined but not used [-Wunused-variable]
      53 | static unsigned int fmax = 515633;
         |                     ^~~~


vim +166 include/linux/compiler.h

fe8c8a126806fe Cesar Eduardo Barros 2013-11-25  165  
a8306f2d4dcea0 Nick Desaulniers     2023-08-31 @166  #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
6f33d58794ef4c Rusty Russell        2012-11-22  167  

:::::: The code at line 166 was first introduced by commit
:::::: a8306f2d4dcea03538c70c26d2948483f70254ff compiler.h: unify __UNIQUE_ID

:::::: TO: Nick Desaulniers <ndesaulniers@google.com>
:::::: CC: Andrew Morton <akpm@linux-foundation.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
