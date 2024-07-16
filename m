Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 649C51A0AEE
	for <oe-kbuild-all@lists.linux.dev>; Tue, 16 Jul 2024 19:39:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721158758; cv=none; b=ijK5CKGELDaPiu0GbMdiHt60YXPOzVvfNKhDthayBeusrzsrLoBulGWH3f4DtrSuJFn9VGMc2AyCU0REnxPz3vi8V3EHAS1HsKp+tt0zX1c+q+wg0wmd7eysyMQt3H/Q/9Wcu2SbwJuQB2bazbUiTO1/6WDf1wcscYaZ+Ca+PQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721158758; c=relaxed/simple;
	bh=G3TiG7nD3HCu9mwQV3lZQZznkSyfdpXQbavRP9YI+TQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nRJoVlF+DHW/xzIR3z8vwU40iKZaL7CBlWKdq8ZV6gzopZbLrThrJFz+C7WVV07RSeYeCUXMm6MIjQVMx7Yefh/DmC2ZrUHbNvwuPI4FzuM45vWTU7eul4CRI0BbiP/W+2sMBOWa9ZoRSXpq4DBQQVhcpAFgRqMRQh6LHZB+zCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=g5zHag9g; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="g5zHag9g"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721158756; x=1752694756;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=G3TiG7nD3HCu9mwQV3lZQZznkSyfdpXQbavRP9YI+TQ=;
  b=g5zHag9gcEj4u1p8xoUAgdbCes7v1eBL42FNgUp/Ronm5RK6GoL8s5lw
   r/l1wzGv68AxMj+P69aAuiQZBuT4LBPeuCydgceYFB/PcuIy6mMI2WsYC
   vSGnBGkaqRsraDz5PAJ0IMmxF3ECJbIlZDu5FAMhI5szRfJwnGn92NXxo
   0Ok2xj1jqdBAOq7taTPQt1zKWBEJw9uDpLCKyGZqUS+WNccWu0ZPNHdoO
   1YPXC+6eVs6ipadtGrOiNtoR5lYgltS2Wygka4AHX+Z3TlBbiU9QWbV55
   ZhMbrkLke2AytvoZnpKIRyDj6WbFwJhe0SWNBFb3vrBUhZY6WuJ7v3i4i
   Q==;
X-CSE-ConnectionGUID: UaujrfKaTcSPxaX5xjXEkg==
X-CSE-MsgGUID: MnVCUafCSoWNT7k51Ot/Vw==
X-IronPort-AV: E=McAfee;i="6700,10204,11135"; a="18471772"
X-IronPort-AV: E=Sophos;i="6.09,212,1716274800"; 
   d="scan'208";a="18471772"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jul 2024 12:39:16 -0700
X-CSE-ConnectionGUID: y+91+2P6Q92W7axeu8C3xQ==
X-CSE-MsgGUID: J7lra/XMTH+FXvJRgVzeqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,212,1716274800"; 
   d="scan'208";a="55016001"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 16 Jul 2024 12:39:15 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sTo12-000fbo-1K;
	Tue, 16 Jul 2024 19:39:12 +0000
Date: Wed, 17 Jul 2024 03:38:22 +0800
From: kernel test robot <lkp@intel.com>
To: Alexander Duyck <alexanderduyck@fb.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Jakub Kicinski <kuba@kernel.org>
Subject: [linux-next:master 12947/13217]
 include/linux/compiler_types.h:510:45: error: call to
 '__compiletime_assert_749' declared with attribute error: FIELD_PREP: value
 too large for the field
Message-ID: <202407170307.2YOkPevZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   4f40be61af99a67d5580c1448acd9b74c0376389
commit: 0cb4c0a13723ef6dd06be8f913443897a0ffccb5 [12947/13217] eth: fbnic: Implement Rx queue alloc/start/stop/free
config: s390-allyesconfig (https://download.01.org/0day-ci/archive/20240717/202407170307.2YOkPevZ-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240717/202407170307.2YOkPevZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407170307.2YOkPevZ-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <command-line>:
   In function 'fbnic_config_drop_mode_rcq',
       inlined from 'fbnic_enable' at drivers/net/ethernet/meta/fbnic/fbnic_txrx.c:1151:4:
>> include/linux/compiler_types.h:510:45: error: call to '__compiletime_assert_749' declared with attribute error: FIELD_PREP: value too large for the field
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
   include/linux/bitfield.h:68:17: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      68 |                 BUILD_BUG_ON_MSG(__builtin_constant_p(_val) ?           \
         |                 ^~~~~~~~~~~~~~~~
   include/linux/bitfield.h:115:17: note: in expansion of macro '__BF_FIELD_CHECK'
     115 |                 __BF_FIELD_CHECK(_mask, 0ULL, _val, "FIELD_PREP: ");    \
         |                 ^~~~~~~~~~~~~~~~
   drivers/net/ethernet/meta/fbnic/fbnic_txrx.c:1088:13: note: in expansion of macro 'FIELD_PREP'
    1088 |             FIELD_PREP(FBNIC_QUEUE_RDE_CTL0_MIN_TROOM_MASK, FBNIC_RX_TROOM);
         |             ^~~~~~~~~~


vim +/__compiletime_assert_749 +510 include/linux/compiler_types.h

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

:::::: The code at line 510 was first introduced by commit
:::::: eb5c2d4b45e3d2d5d052ea6b8f1463976b1020d5 compiler.h: Move compiletime_assert() macros into compiler_types.h

:::::: TO: Will Deacon <will@kernel.org>
:::::: CC: Will Deacon <will@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
