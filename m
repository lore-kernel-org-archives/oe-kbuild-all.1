Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3ECF19755B
	for <oe-kbuild-all@lists.linux.dev>; Sun,  3 Aug 2025 23:05:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754262333; cv=none; b=icCzZF/2vGPIgmS8hVrSmroSx7yqar+YvH6W3NEawsPTcE/Stv2iOndIj5+nCk/nlSFlJNqiyhtb74udl2MM2W+dS24YaYUzmYB2OJ1eEYOOhVN39w5pepQwL6k7aHsHGKtZ/h7aFyJmMYFE5CIvjLKXaYkgQwuc7oLiaDBNkjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754262333; c=relaxed/simple;
	bh=fuawrNeEjmXb7zmzCwIYF01mtuCDGAEfTD7v+ob/Yio=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VE16pMO5XW937wJ2MxXrbupTp+wpIcwWJWf1KZYp/R/XmVS62o+HmcPJeywu+XcYAIntA3O4EVA6pjRf4NcKkbp7V0tVcH2BTZf+GVevxRoIRk+Nlr9hP+eI+eqZSPxjniQtddVixrGJB1HYyskCzd6YxR0Iis3rqt98dnO6EpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WIHh5NM5; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WIHh5NM5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754262332; x=1785798332;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=fuawrNeEjmXb7zmzCwIYF01mtuCDGAEfTD7v+ob/Yio=;
  b=WIHh5NM5f+oPkc41IcCPXKprUjR0zr5YfeItxG98OJa+3qZIjYofc7kO
   621YlUZRYC6FwBtU8V4i7FBmX2n6KCd8c1bDD5mTs46I8yeXvtMnJRDH7
   Ct980MzIiA5KgWnF8wjR7Yji70uC39UTYfN+axyY5uYSZHYsrM7mHqVj3
   jsjgfPd27pV5K+U3HHLKzs4av3uLC5xoTKvvXzspULV6oMk2D8kdAFTjm
   bmkPQqbkkdXS4KadODK7/3+UYloi1UEuiDt9SIitvj9SNu5rsrbnDISTg
   RCvJCQSlSIxnGDiQUnZrZSiAruC+WnzVkg8DDZV4k1vV6AvRnXigNYa4x
   A==;
X-CSE-ConnectionGUID: OM7k7xTqRi+DoApQ7SnmcA==
X-CSE-MsgGUID: IarZHBmfQCyTR195J1m5Lg==
X-IronPort-AV: E=McAfee;i="6800,10657,11511"; a="79071811"
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="79071811"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Aug 2025 16:05:31 -0700
X-CSE-ConnectionGUID: JFiBHQO+T3GIFfuOi/NyhA==
X-CSE-MsgGUID: hsJBoeqrShaRQCWNj2MuFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="168261588"
Received: from lkp-server01.sh.intel.com (HELO 160750d4a34c) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 03 Aug 2025 16:05:30 -0700
Received: from kbuild by 160750d4a34c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uihlf-0006fQ-2v;
	Sun, 03 Aug 2025 23:05:27 +0000
Date: Mon, 4 Aug 2025 07:04:46 +0800
From: kernel test robot <lkp@intel.com>
To: Chaitanya Kulkarni <kch@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 2/4] nvme: add live migration TP 4159 definitions
Message-ID: <202508040631.ujWU9xow-lkp@intel.com>
References: <20250803024705.10256-3-kch@nvidia.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250803024705.10256-3-kch@nvidia.com>

Hi Chaitanya,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on awilliam-vfio/next]
[also build test ERROR on axboe-block/for-next linus/master v6.16 next-20250801]
[cannot apply to linux-nvme/for-next awilliam-vfio/for-linus]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Chaitanya-Kulkarni/vfio-nvme-add-vfio-nvme-lm-driver-infrastructure/20250803-105056
base:   https://github.com/awilliam/linux-vfio.git next
patch link:    https://lore.kernel.org/r/20250803024705.10256-3-kch%40nvidia.com
patch subject: [RFC PATCH 2/4] nvme: add live migration TP 4159 definitions
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20250804/202508040631.ujWU9xow-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250804/202508040631.ujWU9xow-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508040631.ujWU9xow-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <command-line>:
   In function '_nvme_check_size',
       inlined from 'nvme_core_init' at drivers/nvme/host/core.c:5342:2:
>> include/linux/compiler_types.h:568:45: error: call to '__compiletime_assert_586' declared with attribute error: BUILD_BUG_ON failed: sizeof(struct nvme_id_ctrl) != NVME_IDENTIFY_DATA_SIZE
     568 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                                             ^
   include/linux/compiler_types.h:549:25: note: in definition of macro '__compiletime_assert'
     549 |                         prefix ## suffix();                             \
         |                         ^~~~~~
   include/linux/compiler_types.h:568:9: note: in expansion of macro '_compiletime_assert'
     568 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:50:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      50 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^~~~~~~~~~~~~~~~
   drivers/nvme/host/core.c:5317:9: note: in expansion of macro 'BUILD_BUG_ON'
    5317 |         BUILD_BUG_ON(sizeof(struct nvme_id_ctrl) != NVME_IDENTIFY_DATA_SIZE);
         |         ^~~~~~~~~~~~
--
   In file included from <command-line>:
   In function '_nvme_check_size',
       inlined from 'nvme_core_init' at core.c:5342:2:
>> include/linux/compiler_types.h:568:45: error: call to '__compiletime_assert_586' declared with attribute error: BUILD_BUG_ON failed: sizeof(struct nvme_id_ctrl) != NVME_IDENTIFY_DATA_SIZE
     568 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                                             ^
   include/linux/compiler_types.h:549:25: note: in definition of macro '__compiletime_assert'
     549 |                         prefix ## suffix();                             \
         |                         ^~~~~~
   include/linux/compiler_types.h:568:9: note: in expansion of macro '_compiletime_assert'
     568 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:50:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      50 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^~~~~~~~~~~~~~~~
   core.c:5317:9: note: in expansion of macro 'BUILD_BUG_ON'
    5317 |         BUILD_BUG_ON(sizeof(struct nvme_id_ctrl) != NVME_IDENTIFY_DATA_SIZE);
         |         ^~~~~~~~~~~~


vim +/__compiletime_assert_586 +568 include/linux/compiler_types.h

eb5c2d4b45e3d2 Will Deacon 2020-07-21  554  
eb5c2d4b45e3d2 Will Deacon 2020-07-21  555  #define _compiletime_assert(condition, msg, prefix, suffix) \
eb5c2d4b45e3d2 Will Deacon 2020-07-21  556  	__compiletime_assert(condition, msg, prefix, suffix)
eb5c2d4b45e3d2 Will Deacon 2020-07-21  557  
eb5c2d4b45e3d2 Will Deacon 2020-07-21  558  /**
eb5c2d4b45e3d2 Will Deacon 2020-07-21  559   * compiletime_assert - break build and emit msg if condition is false
eb5c2d4b45e3d2 Will Deacon 2020-07-21  560   * @condition: a compile-time constant condition to check
eb5c2d4b45e3d2 Will Deacon 2020-07-21  561   * @msg:       a message to emit if condition is false
eb5c2d4b45e3d2 Will Deacon 2020-07-21  562   *
eb5c2d4b45e3d2 Will Deacon 2020-07-21  563   * In tradition of POSIX assert, this macro will break the build if the
eb5c2d4b45e3d2 Will Deacon 2020-07-21  564   * supplied condition is *false*, emitting the supplied error message if the
eb5c2d4b45e3d2 Will Deacon 2020-07-21  565   * compiler has support to do so.
eb5c2d4b45e3d2 Will Deacon 2020-07-21  566   */
eb5c2d4b45e3d2 Will Deacon 2020-07-21  567  #define compiletime_assert(condition, msg) \
eb5c2d4b45e3d2 Will Deacon 2020-07-21 @568  	_compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
eb5c2d4b45e3d2 Will Deacon 2020-07-21  569  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
