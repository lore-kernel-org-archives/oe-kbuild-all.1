Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6B2A2F53
	for <oe-kbuild-all@lists.linux.dev>; Sun, 15 Oct 2023 15:05:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bf0X1+qx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697382313; x=1728918313;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=9EH7iuzOclOT3jc8//Jy/QNww4qiNPl6/LLoVKeUYC8=;
  b=bf0X1+qxpoV0LfPxCeZn4A6k77hHQrEYmnQkmHDNDHEAlbcohbY0uzRT
   ngTt4pbeoJav7SNaL3SOSzbeFGoC4MJSsLzKA4ofYKUHKZNtbrgoZvHUq
   o8Z8+rt5ywyTY3ZThQo+ujXtqoHRcuNaUrOnBDX4Ur2CjQK3jOCSAsHEM
   OaW6KDKI5f5eYZvGG8HTkOEH4WSTRZ0nplgXX8t7MLdHagREC2FL7H0BN
   C578xtaFjxFFJ9O91TbFobKGw3hKRPDJOrCld85GIuF9HTMHUDKqLPd+C
   Ih7KysbrP5sjbmkh2dg6st4+aMXRpf2/7qsT4qP51BcDUTUumtSzRc5vv
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="4008707"
X-IronPort-AV: E=Sophos;i="6.03,226,1694761200"; 
   d="scan'208";a="4008707"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2023 08:05:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="899190248"
X-IronPort-AV: E=Sophos;i="6.03,226,1694761200"; 
   d="scan'208";a="899190248"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 15 Oct 2023 08:03:14 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qs2g0-0007Vn-1i;
	Sun, 15 Oct 2023 15:05:08 +0000
Date: Sun, 15 Oct 2023 23:04:11 +0800
From: kernel test robot <lkp@intel.com>
To: Akihiko Odaki <akihiko.odaki@daynix.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 3/7] net: sched: Add members to qdisc_skb_cb
Message-ID: <202310152238.M5Ed14YC-lkp@intel.com>
References: <20231008052101.144422-4-akihiko.odaki@daynix.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231008052101.144422-4-akihiko.odaki@daynix.com>

Hi Akihiko,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on shuah-kselftest/next]
[also build test ERROR on shuah-kselftest/fixes mst-vhost/linux-next linus/master v6.6-rc5 next-20231013]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Akihiko-Odaki/net-skbuff-Add-tun_vnet_hash-flag/20231008-133245
base:   https://git.kernel.org/pub/scm/linux/kernel/git/shuah/linux-kselftest.git next
patch link:    https://lore.kernel.org/r/20231008052101.144422-4-akihiko.odaki%40daynix.com
patch subject: [RFC PATCH 3/7] net: sched: Add members to qdisc_skb_cb
config: arm-footbridge_defconfig (https://download.01.org/0day-ci/archive/20231015/202310152238.M5Ed14YC-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231015/202310152238.M5Ed14YC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310152238.M5Ed14YC-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <command-line>:
   net/core/dev.c: In function 'validate_xmit_skb':
>> include/linux/compiler_types.h:425:45: error: call to '__compiletime_assert_713' declared with attribute error: BUILD_BUG_ON failed: sizeof(struct qdisc_skb_cb) > SKB_GSO_CB_OFFSET
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
   net/core/dev.c:3625:17: note: in expansion of macro 'BUILD_BUG_ON'
    3625 |                 BUILD_BUG_ON(sizeof(struct qdisc_skb_cb) > SKB_GSO_CB_OFFSET);
         |                 ^~~~~~~~~~~~


vim +/__compiletime_assert_713 +425 include/linux/compiler_types.h

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
