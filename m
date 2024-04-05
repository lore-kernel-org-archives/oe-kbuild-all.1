Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FB1F1E87C
	for <oe-kbuild-all@lists.linux.dev>; Fri,  5 Apr 2024 21:39:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712353145; cv=none; b=DMjaZNL7+GEklFkmhJzjd1qgG2lgjTVTiLAaESuyLxQzvMLssqrbzNijs3VDnCL7Jq2MBSJEfDF3poD6n9SeCJ3pdq9alEDifZzD/o6zSWxhqqbRhscbPkFLjoAM3Ngaike1ctfQg7F1mZwmeo5krdae1AdurMttppmBzxHB12c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712353145; c=relaxed/simple;
	bh=Xt/T53ghX94IcNx1unlVDUGbYp4JpUHcmQjuH24fElM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FKScEwcgT9xU2hSkjVsDn9ZHXLdiL4nTpGk3eA3S/lljgmYGEYBThBuCJ+ue9BUXyMkuMssSM0GdYvBslkm9DOH/vUXPGCguuc3dFXj5cmyyBiMxOoDPhdvE2iElW0p5js6WKM/rGlikL+ai7zkundIQ+68BtNdFW6JgK+0R9uU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CgIe1LL1; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CgIe1LL1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712353143; x=1743889143;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Xt/T53ghX94IcNx1unlVDUGbYp4JpUHcmQjuH24fElM=;
  b=CgIe1LL15vFi05jW9ABIBLEuXptAHhTekDM/xhX3cTWQfB9yvUg0jFCQ
   a7b/99++xH5+U+UM1+pRgselg48yxSIkJug+XIUYZDcYIMIwE9s8Q9ZtU
   72lMUbBxLMCU/T6DbYiQFQUevpb+00ry9Gh4y3mI/L8BvV1ulw/kj6cPf
   X6X/v9szxZf21oOj/4uqa8uzvVH/Vf6IhGvXZ65vWqDICEZxHDGFTGO+N
   GYa71DMDDxsClsjVpkdLSjV4j/BXPrNaO+48xp/vrRbIaRGG4erU9VKoT
   fUwpUF2JXAoDwUd+jODmYQGUOMM0znwvwRIpGP47oDDlacv+D/kl1BBHy
   g==;
X-CSE-ConnectionGUID: +RmMnJ8CQH+Vw6tZtRtlGg==
X-CSE-MsgGUID: K4TyC1BBRWu9coCN2twrzQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11035"; a="7603799"
X-IronPort-AV: E=Sophos;i="6.07,182,1708416000"; 
   d="scan'208";a="7603799"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Apr 2024 14:39:03 -0700
X-CSE-ConnectionGUID: Ec6cTuZKR8O4udgOfbsPWw==
X-CSE-MsgGUID: xnkrF6XYQQOEcw311lMPqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,182,1708416000"; 
   d="scan'208";a="23778348"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 05 Apr 2024 14:39:01 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rsrH1-0002jc-1q;
	Fri, 05 Apr 2024 21:38:59 +0000
Date: Sat, 6 Apr 2024 05:38:33 +0800
From: kernel test robot <lkp@intel.com>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 12/13] ASoC: Intel: avs: Add assert_static to guarantee
 ABI sizes
Message-ID: <202404060502.1lutajCW-lkp@intel.com>
References: <20240405090929.1184068-13-cezary.rojewski@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240405090929.1184068-13-cezary.rojewski@intel.com>

Hi Cezary,

kernel test robot noticed the following build errors:

[auto build test ERROR on broonie-sound/for-next]
[also build test ERROR on tiwai-sound/for-next tiwai-sound/for-linus linus/master v6.9-rc2 next-20240405]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Cezary-Rojewski/ASoC-Intel-avs-Restore-stream-decoupling-on-prepare/20240405-171544
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
patch link:    https://lore.kernel.org/r/20240405090929.1184068-13-cezary.rojewski%40intel.com
patch subject: [PATCH 12/13] ASoC: Intel: avs: Add assert_static to guarantee ABI sizes
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20240406/202404060502.1lutajCW-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240406/202404060502.1lutajCW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404060502.1lutajCW-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/init.h:5,
                    from include/linux/printk.h:6,
                    from include/asm-generic/bug.h:22,
                    from arch/alpha/include/asm/bug.h:23,
                    from include/linux/bug.h:5,
                    from include/linux/thread_info.h:13,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/alpha/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:79,
                    from include/linux/spinlock.h:56,
                    from include/linux/mmzone.h:8,
                    from include/linux/gfp.h:7,
                    from include/linux/slab.h:16,
                    from sound/soc/intel/avs/icl.c:9:
>> include/linux/build_bug.h:78:41: error: static assertion failed: "sizeof(struct avs_icl_memwnd2) == 65536"
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                         ^~~~~~~~~~~~~~
   include/linux/build_bug.h:77:34: note: in expansion of macro '__static_assert'
      77 | #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
         |                                  ^~~~~~~~~~~~~~~
   sound/soc/intel/avs/icl.c:73:1: note: in expansion of macro 'static_assert'
      73 | static_assert(sizeof(struct avs_icl_memwnd2) == 65536);
         | ^~~~~~~~~~~~~


vim +78 include/linux/build_bug.h

bc6245e5efd70c Ian Abbott       2017-07-10  60  
6bab69c65013be Rasmus Villemoes 2019-03-07  61  /**
6bab69c65013be Rasmus Villemoes 2019-03-07  62   * static_assert - check integer constant expression at build time
6bab69c65013be Rasmus Villemoes 2019-03-07  63   *
6bab69c65013be Rasmus Villemoes 2019-03-07  64   * static_assert() is a wrapper for the C11 _Static_assert, with a
6bab69c65013be Rasmus Villemoes 2019-03-07  65   * little macro magic to make the message optional (defaulting to the
6bab69c65013be Rasmus Villemoes 2019-03-07  66   * stringification of the tested expression).
6bab69c65013be Rasmus Villemoes 2019-03-07  67   *
6bab69c65013be Rasmus Villemoes 2019-03-07  68   * Contrary to BUILD_BUG_ON(), static_assert() can be used at global
6bab69c65013be Rasmus Villemoes 2019-03-07  69   * scope, but requires the expression to be an integer constant
6bab69c65013be Rasmus Villemoes 2019-03-07  70   * expression (i.e., it is not enough that __builtin_constant_p() is
6bab69c65013be Rasmus Villemoes 2019-03-07  71   * true for expr).
6bab69c65013be Rasmus Villemoes 2019-03-07  72   *
6bab69c65013be Rasmus Villemoes 2019-03-07  73   * Also note that BUILD_BUG_ON() fails the build if the condition is
6bab69c65013be Rasmus Villemoes 2019-03-07  74   * true, while static_assert() fails the build if the expression is
6bab69c65013be Rasmus Villemoes 2019-03-07  75   * false.
6bab69c65013be Rasmus Villemoes 2019-03-07  76   */
6bab69c65013be Rasmus Villemoes 2019-03-07  77  #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
6bab69c65013be Rasmus Villemoes 2019-03-07 @78  #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
6bab69c65013be Rasmus Villemoes 2019-03-07  79  
07a368b3f55a79 Maxim Levitsky   2022-10-25  80  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
