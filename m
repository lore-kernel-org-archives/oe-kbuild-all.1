Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA8D218452B
	for <oe-kbuild-all@lists.linux.dev>; Thu,  1 Aug 2024 11:04:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722510273; cv=none; b=YKTZrDZWWHfHaQmh0CfgAP8Zst+WTHOyN5jXr+UvaTXnjkMoWNy4Wj3jbCsGjTxQQUCvRryUdsOjOamHaafq5EpNfAyITATb4TobPuCmPH6XtRfRtXIUftCkGfBkk8jKN0Ui2B/Gvauy71K2tc7AdHP+NRwb1ZSupmqW9VKFil0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722510273; c=relaxed/simple;
	bh=7i7ifXul4m5QUvvFnu0M2IuiBLJQahJmu5jQnpkNNDY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=suilm/upYBahqx8FM4MyQPFJy6iQOlZpfsvKqfjX6Tx3GuhqV9K4UHsUzDcVHS48bViaf+TrAEkJN4Eg1FF102tXDlyzsfp+PFDv6XCkTpU/RnYpBELIdXIu62YD8jrAEZS5mp3giFacD4m86UAxt7QWF82g37PWriIojsrByD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CzvozZPX; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CzvozZPX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722510272; x=1754046272;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7i7ifXul4m5QUvvFnu0M2IuiBLJQahJmu5jQnpkNNDY=;
  b=CzvozZPXqAyPOVRfzdGhXaySGR4ZWMJMira4eN74PH4hFfunGxa2mz0a
   EZLr3RfUwTUH9yW347KI5faWkxi1AfiEk7v36k898dq7BLcVZS/+LdbO6
   SP0+jiCwb0KM9530sMHn0zkcL/0LpBuDjHVvpUu0cff8z/3wcjR/oQSwE
   uIgrESvJiLB8JQ8PZmdmb3I0QbyH2PhVotxMgPz+f961kfwLzgpZFn/Px
   8gD0AwsoUA0P7+tKXU7qcy6fUCVHB00/DQagYya8i85hYjrftDZ5hNCYq
   v+GnE49++kcWjWx47GGg9c8vKEdiudkPIDbhysrJuj1McyIU/0SGF1JdX
   g==;
X-CSE-ConnectionGUID: Kt8F4qxkTZSl3XdViqg21w==
X-CSE-MsgGUID: fvCrsVpvQ4W9bkHiPAAMIQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11150"; a="31107133"
X-IronPort-AV: E=Sophos;i="6.09,254,1716274800"; 
   d="scan'208";a="31107133"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Aug 2024 04:04:30 -0700
X-CSE-ConnectionGUID: 6o7AzIe+QrSPszoXL6ThdA==
X-CSE-MsgGUID: tfcv6w0kTl2kjJtbMs01Ng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,254,1716274800"; 
   d="scan'208";a="54907704"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 01 Aug 2024 04:04:29 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sZTbe-000vVy-09;
	Thu, 01 Aug 2024 11:04:26 +0000
Date: Thu, 1 Aug 2024 19:04:21 +0800
From: kernel test robot <lkp@intel.com>
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	"Gustavo A. R. Silva" <gustavo@embeddedor.com>,
	LKML <linux-kernel@vger.kernel.org>
Subject: [gustavoars:testing/wfamnae-next20240729-cbc-2 11/18]
 include/linux/build_bug.h:78:41: error: static assertion failed: "struct
 member likely outside of struct_group_tagged()"
Message-ID: <202408011909.EVuco9oo-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gustavoars/linux.git testing/wfamnae-next20240729-cbc-2
head:   df15c862c1b93b6e1f6c90b0d7971f7a6ad66751
commit: e7cd9f429a852fb7e37a706c7d08fc36e7863e06 [11/18] RDMA/uverbs: Use static_assert() to check struct sizes
config: xtensa-allyesconfig (https://download.01.org/0day-ci/archive/20240801/202408011909.EVuco9oo-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240801/202408011909.EVuco9oo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408011909.EVuco9oo-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/container_of.h:5,
                    from include/linux/list.h:5,
                    from include/linux/module.h:12,
                    from drivers/infiniband/core/nldev.c:33:
>> include/linux/build_bug.h:78:41: error: static assertion failed: "struct member likely outside of struct_group_tagged()"
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                         ^~~~~~~~~~~~~~
   include/linux/build_bug.h:77:34: note: in expansion of macro '__static_assert'
      77 | #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
         |                                  ^~~~~~~~~~~~~~~
   include/rdma/uverbs_ioctl.h:643:1: note: in expansion of macro 'static_assert'
     643 | static_assert(offsetof(struct uverbs_attr_bundle, attrs) == sizeof(struct uverbs_attr_bundle_hdr),
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

:::::: The code at line 78 was first introduced by commit
:::::: 6bab69c65013bed5fce9f101a64a84d0385b3946 build_bug.h: add wrapper for _Static_assert

:::::: TO: Rasmus Villemoes <linux@rasmusvillemoes.dk>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
