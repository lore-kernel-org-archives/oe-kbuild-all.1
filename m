Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BCE537C911
	for <oe-kbuild-all@lists.linux.dev>; Fri,  3 Apr 2026 08:41:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775205665; cv=none; b=nviGX6hXM3P2tJ76bvM5dj4cDHEoI8ZLoRqFecJVPLGmVXrJuIrX+egvKASgwo872xbnR5HuzUqZ4thJF2pSffPWUfO/uvC0uf16wLBG5NOCQmN01kb+RnDs8yHQKTfKJMoVA+hr746KG+V/kyxjdpG/umSkWaXpodLt77i4hyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775205665; c=relaxed/simple;
	bh=xXPGLnfCyZvfWonvz8MbpSF8Iaa69OhRTMW1YDQDxM8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=RQTocEMAtkbax7KO5WxvFnvw2IsrJU7/ZCNVgkVVk+YnPgutXeZFDcZs0qI9ppWtirOE+CwOTsTTuNkVmHazeLJYxF/qztSOH5hkLgx09JiixlzqLtjysHkJ7lhxIIe/AhaWSIcbzhEDlqTqHUUtt2n0X6CWQ+ABU2V9g4bKlVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Cv9rHvlX; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Cv9rHvlX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775205663; x=1806741663;
  h=date:from:to:cc:subject:message-id;
  bh=xXPGLnfCyZvfWonvz8MbpSF8Iaa69OhRTMW1YDQDxM8=;
  b=Cv9rHvlXOCJGnL1p7/DpAwVh2+Sxxkv0ZNTcG2AuZbjIKkgx8RXDSNqr
   7G+PUrna1kOVwFjPk/B8kP/tyg0U71R+Ko1OdffvVkg+TOo0J11bEvArw
   +Mc+4dqKE0PvsjXf/NB4BS9wCpkVx2Rwc3YYJc2sLvvTLmNNwaAXfjXnk
   +Z67MnidgyAzjK182wP5eRuay2YhngWb84MOEJUqOZ+4PjvEzbD4X7J82
   hxTPBBMxcGP70gMc7jPwns0KiHWkJ9NNFwbK7ZrrpcE11TPlVuhp167kM
   gbiuVL7dvFkh3hquQCOQB/ErmLQEwK+q+mh1fgBDF2Hn60JbYW8u+Vcl+
   g==;
X-CSE-ConnectionGUID: 2NSyNt0OSFe8iXF5+hs9WA==
X-CSE-MsgGUID: BYHdqRikR7etsPJI5S5OYA==
X-IronPort-AV: E=McAfee;i="6800,10657,11747"; a="76156635"
X-IronPort-AV: E=Sophos;i="6.23,157,1770624000"; 
   d="scan'208";a="76156635"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2026 01:40:59 -0700
X-CSE-ConnectionGUID: SnObC7gbTmCcWU0vY/igwg==
X-CSE-MsgGUID: H8aWz/AYRPab1OoCpzsz+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,157,1770624000"; 
   d="scan'208";a="224370760"
Received: from lkp-server01.sh.intel.com (HELO 064ad336901d) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 03 Apr 2026 01:40:56 -0700
Received: from kbuild by 064ad336901d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w8a5G-0000000012M-15ne;
	Fri, 03 Apr 2026 08:40:54 +0000
Date: Fri, 03 Apr 2026 16:40:08 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-desktop 32/32]
 include/linux/compiler.h:166:45: error: '__UNIQUE_ID_y_384' undeclared; did
 you mean '__UNIQUE_ID_x_383'?
Message-ID: <202604022017.KxPc9bpQ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android16-6.12-desktop
head:   6a23af1a3a1097e2d2040df1d50239349c4068cb
commit: 1d9d3192c3a2b90a68a3ebe4a9b5b0fa27af0b9e [32/32] BACKPORT: locking/local_lock, mm: replace localtry_ helpers with local_trylock_t type
config: arm-randconfig-003-20260402 (https://download.01.org/0day-ci/archive/20260402/202604022017.KxPc9bpQ-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260402/202604022017.KxPc9bpQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604022017.KxPc9bpQ-lkp@intel.com/

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
>> include/linux/compiler.h:166:45: error: '__UNIQUE_ID_y_384' undeclared (first use in this function); did you mean '__UNIQUE_ID_x_383'?
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
   include/linux/minmax.h:71:17: error: first argument to '__builtin_choose_expr' not a constant
      71 |         (typeof(__builtin_choose_expr(sizeof(ux) > 4, 1LL, 1L)))(ux) >= 0)
         |                 ^~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:528:23: note: in definition of macro '__compiletime_assert'
     528 |                 if (!(condition))                                       \


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
