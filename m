Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65AA713A261
	for <oe-kbuild-all@lists.linux.dev>; Sun,  8 Sep 2024 22:36:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725835021; cv=none; b=YevsrB6203If5bBaedbIAMhggthOJTIFR/lSkU5ro0lOB5NCZApnmb5XEnjge3K0HkyZLiGw0ek97zixafrOOpnywpzR5Wk7zwbBzyLAJc200j5aNOCNu7/yWcXQilBYpp6hK+ZmkFhFEZaltD12GMLvzc6LXyeCEf2xKBi7HjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725835021; c=relaxed/simple;
	bh=F5TVvHUx7zoriXqpn/BD6MCVwD7y5Ziw0jblH4FdOeU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K1urLUO7omvz+uRGqSki3B5gL3aaM469JBRDeclkZZyGe150M+uKg+7gOP6ToFs7NpPJxeJbM+yqZMmBeYRc9BgQE4bEVBV9bvqHhsQ7qwF2k+m5qFf0jbiuZHvIPzdOaJTbIPhmFGJG3i/VRU9NCYnJ7pV/gOff7gusvNfeWEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=es5bWOtU; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="es5bWOtU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725835020; x=1757371020;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=F5TVvHUx7zoriXqpn/BD6MCVwD7y5Ziw0jblH4FdOeU=;
  b=es5bWOtUWvZMSwYZYyKpiLOyC7rNSKOJHynMA8Phq2o7xbJw8F84VDk8
   7Xc1g+IhTA4aUT5oXJxrH8bpVBVXCN2SNyd6WAjeXhQz24+TcR2LjIk5t
   8MZ6h0HTrfj0BZWUR0Kzs0rWbKveCwQ699HUdmNSmalQmqJFYlNNyrQ3y
   /ZIVn2Bn0vMS/c4UPU9GBDNtpvmL+tF/BWTrcJlQ62TZ7SUV99k4Jrcaw
   FIz62mdIrMUze7+SL/IET14o7Xuoe3aoXi6F8JYsya+OVWCt+lCqoskd4
   yt2XtOy3EkApY77ED7Q3fV0uKAKWQBSq9uMNAY8p8pUeJgU7UXvoEFNWG
   A==;
X-CSE-ConnectionGUID: iN3G2sHKSTOyA0p44ZG9Xg==
X-CSE-MsgGUID: 0rVit4KDSmGYmbjFSRP/+w==
X-IronPort-AV: E=McAfee;i="6700,10204,11189"; a="28296335"
X-IronPort-AV: E=Sophos;i="6.10,213,1719903600"; 
   d="scan'208";a="28296335"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2024 15:36:59 -0700
X-CSE-ConnectionGUID: vpbGgcrtSWW16EeUKEFMMQ==
X-CSE-MsgGUID: WvvD8HiRSwuTrRwmLJ3Q9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,213,1719903600"; 
   d="scan'208";a="97273515"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 08 Sep 2024 15:36:58 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1snQWd-000E2t-16;
	Sun, 08 Sep 2024 22:36:55 +0000
Date: Mon, 9 Sep 2024 06:36:21 +0800
From: kernel test robot <lkp@intel.com>
To: Cedric Xing <cedric.xing@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC 2/3] tsm: Add RTMR event logging
Message-ID: <202409090621.osV2pgtW-lkp@intel.com>
References: <20240907-tsm-rtmr-v1-2-12fc4d43d4e7@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240907-tsm-rtmr-v1-2-12fc4d43d4e7@intel.com>

Hi Cedric,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on 431c1646e1f86b949fa3685efc50b660a364c2b6]

url:    https://github.com/intel-lab-lkp/linux/commits/Cedric-Xing/tsm-Add-TVM-Measurement-Register-Support/20240908-142434
base:   431c1646e1f86b949fa3685efc50b660a364c2b6
patch link:    https://lore.kernel.org/r/20240907-tsm-rtmr-v1-2-12fc4d43d4e7%40intel.com
patch subject: [PATCH RFC 2/3] tsm: Add RTMR event logging
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20240909/202409090621.osV2pgtW-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240909/202409090621.osV2pgtW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409090621.osV2pgtW-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/asm-generic/bug.h:22,
                    from arch/x86/include/asm/bug.h:87,
                    from include/linux/bug.h:5,
                    from include/linux/fortify-string.h:6,
                    from include/linux/string.h:374,
                    from include/linux/uuid.h:11,
                    from include/linux/tsm.h:7,
                    from drivers/virt/coco/tsm.c:4:
   drivers/virt/coco/tsm.c: In function '_mr_write':
   include/linux/kern_levels.h:5:25: warning: format '%ld' expects argument of type 'long int', but argument 4 has type 'ssize_t' {aka 'int'} [-Wformat=]
       5 | #define KERN_SOH        "\001"          /* ASCII Start Of Header */
         |                         ^~~~~~
   include/linux/printk.h:437:25: note: in definition of macro 'printk_index_wrap'
     437 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ^~~~
   include/linux/printk.h:518:9: note: in expansion of macro 'printk'
     518 |         printk(KERN_WARNING pr_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~
   include/linux/kern_levels.h:12:25: note: in expansion of macro 'KERN_SOH'
      12 | #define KERN_WARNING    KERN_SOH "4"    /* warning conditions */
         |                         ^~~~~~~~
   include/linux/printk.h:518:16: note: in expansion of macro 'KERN_WARNING'
     518 |         printk(KERN_WARNING pr_fmt(fmt), ##__VA_ARGS__)
         |                ^~~~~~~~~~~~
   drivers/virt/coco/tsm.c:735:17: note: in expansion of macro 'pr_warn'
     735 |                 pr_warn(KBUILD_MODNAME ": extending %s/%s failed with %ld\n",
         |                 ^~~~~~~
   In file included from <command-line>:
   drivers/virt/coco/tsm.c: In function '_log_read':
>> include/linux/compiler_types.h:510:45: error: call to '__compiletime_assert_363' declared with attribute error: min(count, attr->size - off) signedness error
     510 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                                             ^
   include/linux/compiler_types.h:491:25: note: in definition of macro '__compiletime_assert'
     491 |                         prefix ## suffix();                             \
         |                         ^~~~~~
   include/linux/compiler_types.h:510:9: note: in expansion of macro '_compiletime_assert'
     510 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:100:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
     100 |         BUILD_BUG_ON_MSG(!__types_ok(x,y,ux,uy),        \
         |         ^~~~~~~~~~~~~~~~
   include/linux/minmax.h:105:9: note: in expansion of macro '__careful_cmp_once'
     105 |         __careful_cmp_once(op, x, y, __UNIQUE_ID(x_), __UNIQUE_ID(y_))
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:129:25: note: in expansion of macro '__careful_cmp'
     129 | #define min(x, y)       __careful_cmp(min, x, y)
         |                         ^~~~~~~~~~~~~
   drivers/virt/coco/tsm.c:755:17: note: in expansion of macro 'min'
     755 |         count = min(count, attr->size - off);
         |                 ^~~


vim +/__compiletime_assert_363 +510 include/linux/compiler_types.h

eb5c2d4b45e3d2 Will Deacon 2020-07-21  496  
eb5c2d4b45e3d2 Will Deacon 2020-07-21  497  #define _compiletime_assert(condition, msg, prefix, suffix) \
eb5c2d4b45e3d2 Will Deacon 2020-07-21  498  	__compiletime_assert(condition, msg, prefix, suffix)
eb5c2d4b45e3d2 Will Deacon 2020-07-21  499  
eb5c2d4b45e3d2 Will Deacon 2020-07-21  500  /**
eb5c2d4b45e3d2 Will Deacon 2020-07-21  501   * compiletime_assert - break build and emit msg if condition is false
eb5c2d4b45e3d2 Will Deacon 2020-07-21  502   * @condition: a compile-time constant condition to check
eb5c2d4b45e3d2 Will Deacon 2020-07-21  503   * @msg:       a message to emit if condition is false
eb5c2d4b45e3d2 Will Deacon 2020-07-21  504   *
eb5c2d4b45e3d2 Will Deacon 2020-07-21  505   * In tradition of POSIX assert, this macro will break the build if the
eb5c2d4b45e3d2 Will Deacon 2020-07-21  506   * supplied condition is *false*, emitting the supplied error message if the
eb5c2d4b45e3d2 Will Deacon 2020-07-21  507   * compiler has support to do so.
eb5c2d4b45e3d2 Will Deacon 2020-07-21  508   */
eb5c2d4b45e3d2 Will Deacon 2020-07-21  509  #define compiletime_assert(condition, msg) \
eb5c2d4b45e3d2 Will Deacon 2020-07-21 @510  	_compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
eb5c2d4b45e3d2 Will Deacon 2020-07-21  511  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
