Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95AC038DDB
	for <oe-kbuild-all@lists.linux.dev>; Fri, 10 Nov 2023 18:10:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Pxz0WsEU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699639826; x=1731175826;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ffswlVxX3Tb0N6fwMUfnP1kWgA6aE/pzU8XOuXS035s=;
  b=Pxz0WsEUJbsr2oAhweqCM++G+rChVLvbDDhbQYWY9wJunhujV/tn78qf
   IwgEIu7FF6+NWzgJNzCfP05sR81qLE3N0MpHoUziYCmfuEyYhLZYhnvsS
   w6CL0QVQc3V3CYSHqw65W5WML8U7ez2c5UP4iDy1PvKiuNJnd4oaUmc/Y
   wE+kn9eZMccPGTpQ9RDYJA+i9g8SBNZUAvB0gI5oV9vghOOxmjqDlmFAB
   PqnHjIgpu9+htxfdPfmuraPIGrG6/alIW3GT8XyJtxLAre3jj+3PD8ZDd
   HP67JPwTOdzHBa2gCmP646DOeLJFpMwAPu51SuSCXhSSilzGrbTpUhVZi
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10890"; a="387381053"
X-IronPort-AV: E=Sophos;i="6.03,291,1694761200"; 
   d="scan'208";a="387381053"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2023 10:10:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10890"; a="881024267"
X-IronPort-AV: E=Sophos;i="6.03,291,1694761200"; 
   d="scan'208";a="881024267"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 10 Nov 2023 10:10:24 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r1VxW-0009o6-1i;
	Fri, 10 Nov 2023 18:10:22 +0000
Date: Sat, 11 Nov 2023 02:09:16 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Hopps <chopps@chopps.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC ipsec-next 5/8] iptfs: netlink: add config (netlink) options
Message-ID: <202311110118.MvEGQstw-lkp@intel.com>
References: <20231110113719.3055788-6-chopps@chopps.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231110113719.3055788-6-chopps@chopps.org>

Hi Christian,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on klassert-ipsec-next/master]
[also build test ERROR on klassert-ipsec/master netfilter-nf/main linus/master v6.6 next-20231110]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Christian-Hopps/iptfs-uapi-ip-add-ip_tfs_-_hdr-packet-formats/20231110-203822
base:   https://git.kernel.org/pub/scm/linux/kernel/git/klassert/ipsec-next.git master
patch link:    https://lore.kernel.org/r/20231110113719.3055788-6-chopps%40chopps.org
patch subject: [RFC ipsec-next 5/8] iptfs: netlink: add config (netlink) options
config: x86_64-buildonly-randconfig-004-20231110 (https://download.01.org/0day-ci/archive/20231111/202311110118.MvEGQstw-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231111/202311110118.MvEGQstw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311110118.MvEGQstw-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <command-line>:
   In function 'xfrm_xlate32_attr',
       inlined from 'xfrm_xlate32' at net/xfrm/xfrm_compat.c:575:9:
>> include/linux/compiler_types.h:425:45: error: call to '__compiletime_assert_709' declared with attribute error: BUILD_BUG_ON failed: XFRMA_MAX != XFRMA_MTIMER_THRESH
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
   net/xfrm/xfrm_compat.c:437:17: note: in expansion of macro 'BUILD_BUG_ON'
     437 |                 BUILD_BUG_ON(XFRMA_MAX != XFRMA_MTIMER_THRESH);
         |                 ^~~~~~~~~~~~
   net/xfrm/xfrm_compat.c: In function 'xfrm_xlate64_attr':
   include/linux/compiler_types.h:425:45: error: call to '__compiletime_assert_708' declared with attribute error: BUILD_BUG_ON failed: XFRMA_MAX != XFRMA_MTIMER_THRESH
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
   net/xfrm/xfrm_compat.c:282:17: note: in expansion of macro 'BUILD_BUG_ON'
     282 |                 BUILD_BUG_ON(XFRMA_MAX != XFRMA_MTIMER_THRESH);
         |                 ^~~~~~~~~~~~


vim +/__compiletime_assert_709 +425 include/linux/compiler_types.h

eb5c2d4b45e3d2 Will Deacon 2020-07-21  411  
eb5c2d4b45e3d2 Will Deacon 2020-07-21  412  #define _compiletime_assert(condition, msg, prefix, suffix) \
eb5c2d4b45e3d2 Will Deacon 2020-07-21  413  	__compiletime_assert(condition, msg, prefix, suffix)
eb5c2d4b45e3d2 Will Deacon 2020-07-21  414  
eb5c2d4b45e3d2 Will Deacon 2020-07-21  415  /**
eb5c2d4b45e3d2 Will Deacon 2020-07-21  416   * compiletime_assert - break build and emit msg if condition is false
eb5c2d4b45e3d2 Will Deacon 2020-07-21  417   * @condition: a compile-time constant condition to check
eb5c2d4b45e3d2 Will Deacon 2020-07-21  418   * @msg:       a message to emit if condition is false
eb5c2d4b45e3d2 Will Deacon 2020-07-21  419   *
eb5c2d4b45e3d2 Will Deacon 2020-07-21  420   * In tradition of POSIX assert, this macro will break the build if the
eb5c2d4b45e3d2 Will Deacon 2020-07-21  421   * supplied condition is *false*, emitting the supplied error message if the
eb5c2d4b45e3d2 Will Deacon 2020-07-21  422   * compiler has support to do so.
eb5c2d4b45e3d2 Will Deacon 2020-07-21  423   */
eb5c2d4b45e3d2 Will Deacon 2020-07-21  424  #define compiletime_assert(condition, msg) \
eb5c2d4b45e3d2 Will Deacon 2020-07-21 @425  	_compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
eb5c2d4b45e3d2 Will Deacon 2020-07-21  426  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
