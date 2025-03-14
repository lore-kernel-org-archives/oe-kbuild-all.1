Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D42842E3389
	for <oe-kbuild-all@lists.linux.dev>; Fri, 14 Mar 2025 13:17:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741958263; cv=none; b=kqoCvKNXQyc3KE3P6ux5ZF5LABMYY5jasU2rFuQj5Z1sE7WxTgxlfgx+9is3QGI3nlcdnxudLIXcieV9T/PiUKOfvctD7J/skeblV+0ULC9r3jk5l4e9DnrPjLsVIo7Gswdg2jXkXV/3bEiIMwIU4JXy60FpVBQpoHc5zVz0IRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741958263; c=relaxed/simple;
	bh=bV/UMa2n1APBoI0Kbaki7Zm3ly8EWeCTAt5eutH31oE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ajYRkw0oJs+tJ3os9Bfz4YZ6g9ssahiTS6ZaUlC/WrhfebsNX54h4xrv67o26DmHoiCZPnCbSmaTjx4VjFxOjPx3F/VK7+pDNL2pKgjs1tcVFx703TciyHh5UEcQZ1vVfG4zfEhNWi8dmZ5i3tAIbkeaKh47O8VQ2ZmmverQe1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RgFk2C1K; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RgFk2C1K"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741958261; x=1773494261;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bV/UMa2n1APBoI0Kbaki7Zm3ly8EWeCTAt5eutH31oE=;
  b=RgFk2C1K3J6kiQDVPhyeubDHNznD/26QV1A/dJ9z6gLzpLeMQbMTWPUC
   LeiF2WWpoyaNN6KsmdjtaqbHYD6Gr5dP83/JOjdkXDqAFZeRRSzJ9bYFc
   69zujTFLde73agR+VnyAY5FeBAEKOHfHp/tAODoT1dM/8I35jUChbaBEC
   vGLrHeQ8FrKK4FrJgR/6EklG5D71nUb5JDOytwsG1PJtErRcAhr0vG+f2
   lbwv+Cj8FQqBxpNiycP0lRJ2LLPOP1NEYAV4azSPHnoGze+6SsNjuYDAf
   1At+MA6QfiMqdBDH8Jff6tbfSAiX2rEb+XcxnSY7tGuyDcy6LS4M9/dfQ
   A==;
X-CSE-ConnectionGUID: eSDobnkFSmKjLJxTzDWGFA==
X-CSE-MsgGUID: 7Qt1F/tKS660yE4t61IMDw==
X-IronPort-AV: E=McAfee;i="6700,10204,11373"; a="47005037"
X-IronPort-AV: E=Sophos;i="6.14,246,1736841600"; 
   d="scan'208";a="47005037"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Mar 2025 06:17:36 -0700
X-CSE-ConnectionGUID: ENH5bdbVQYSSXOYkDgifYA==
X-CSE-MsgGUID: TgOQSuuHSH+MtbO/xZuHKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,246,1736841600"; 
   d="scan'208";a="121994942"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 14 Mar 2025 06:17:35 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tt4uq-000ATp-2T;
	Fri, 14 Mar 2025 13:17:32 +0000
Date: Fri, 14 Mar 2025 21:17:20 +0800
From: kernel test robot <lkp@intel.com>
To: Qu Wenruo <wqu@suse.com>
Cc: oe-kbuild-all@lists.linux.dev, David Sterba <dsterba@suse.com>
Subject: [linux-next:master 9972/11207]
 include/linux/compiler_types.h:542:45: error: call to
 '__compiletime_assert_533' declared with attribute error:
 min(folio_pos(folio) + folio_size(folio) - 1, end) signedness error
Message-ID: <202503142109.MMRhG9Wv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   da920b7df701770e006928053672147075587fb2
commit: f286b1c72175686e9bece7c8eebbcb0b824fbe1f [9972/11207] btrfs: prepare extent_io.c for future larger folio support
config: parisc-randconfig-002-20250314 (https://download.01.org/0day-ci/archive/20250314/202503142109.MMRhG9Wv-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250314/202503142109.MMRhG9Wv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503142109.MMRhG9Wv-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <command-line>:
   fs/btrfs/extent_io.c: In function 'extent_write_locked_range':
>> include/linux/compiler_types.h:542:45: error: call to '__compiletime_assert_533' declared with attribute error: min(folio_pos(folio) + folio_size(folio) - 1, end) signedness error
     542 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                                             ^
   include/linux/compiler_types.h:523:25: note: in definition of macro '__compiletime_assert'
     523 |                         prefix ## suffix();                             \
         |                         ^~~~~~
   include/linux/compiler_types.h:542:9: note: in expansion of macro '_compiletime_assert'
     542 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:93:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      93 |         BUILD_BUG_ON_MSG(!__types_ok(ux, uy),           \
         |         ^~~~~~~~~~~~~~~~
   include/linux/minmax.h:98:9: note: in expansion of macro '__careful_cmp_once'
      98 |         __careful_cmp_once(op, x, y, __UNIQUE_ID(x_), __UNIQUE_ID(y_))
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:105:25: note: in expansion of macro '__careful_cmp'
     105 | #define min(x, y)       __careful_cmp(min, x, y)
         |                         ^~~~~~~~~~~~~
   fs/btrfs/extent_io.c:2515:27: note: in expansion of macro 'min'
    2515 |                 cur_end = min(folio_pos(folio) + folio_size(folio) - 1, end);
         |                           ^~~


vim +/__compiletime_assert_533 +542 include/linux/compiler_types.h

eb5c2d4b45e3d2d Will Deacon 2020-07-21  528  
eb5c2d4b45e3d2d Will Deacon 2020-07-21  529  #define _compiletime_assert(condition, msg, prefix, suffix) \
eb5c2d4b45e3d2d Will Deacon 2020-07-21  530  	__compiletime_assert(condition, msg, prefix, suffix)
eb5c2d4b45e3d2d Will Deacon 2020-07-21  531  
eb5c2d4b45e3d2d Will Deacon 2020-07-21  532  /**
eb5c2d4b45e3d2d Will Deacon 2020-07-21  533   * compiletime_assert - break build and emit msg if condition is false
eb5c2d4b45e3d2d Will Deacon 2020-07-21  534   * @condition: a compile-time constant condition to check
eb5c2d4b45e3d2d Will Deacon 2020-07-21  535   * @msg:       a message to emit if condition is false
eb5c2d4b45e3d2d Will Deacon 2020-07-21  536   *
eb5c2d4b45e3d2d Will Deacon 2020-07-21  537   * In tradition of POSIX assert, this macro will break the build if the
eb5c2d4b45e3d2d Will Deacon 2020-07-21  538   * supplied condition is *false*, emitting the supplied error message if the
eb5c2d4b45e3d2d Will Deacon 2020-07-21  539   * compiler has support to do so.
eb5c2d4b45e3d2d Will Deacon 2020-07-21  540   */
eb5c2d4b45e3d2d Will Deacon 2020-07-21  541  #define compiletime_assert(condition, msg) \
eb5c2d4b45e3d2d Will Deacon 2020-07-21 @542  	_compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
eb5c2d4b45e3d2d Will Deacon 2020-07-21  543  

:::::: The code at line 542 was first introduced by commit
:::::: eb5c2d4b45e3d2d5d052ea6b8f1463976b1020d5 compiler.h: Move compiletime_assert() macros into compiler_types.h

:::::: TO: Will Deacon <will@kernel.org>
:::::: CC: Will Deacon <will@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
