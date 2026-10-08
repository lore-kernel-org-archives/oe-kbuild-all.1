Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76E0D19BB3
	for <oe-kbuild-all@lists.linux.dev>; Thu,  8 Oct 2026 00:41:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791420118; cv=none; b=lDdb9f+ewxH5uxH+dvum98q/xq95vG/mgJB3sSQxEDwuyAKfaCsyMTWMgz3BSRYRDBV++Gho6ZFS02wSZNf9pyf9uJwH5CfJWIcV4mpCDenDMX9nN78TNSkxjHKSENPJDLGBTm3o8CpF92Jp9SGteJOhp9tkspj9zxOUPl60o2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791420118; c=relaxed/simple;
	bh=tRBa/vyDi13IrL8ZoYDhynwkgX/hpXY8TJOpmIDs0ZA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=lLOsRw9VlI3jT+6vZe2PR4yK32p9lkdkIiB4g9ksOXWPyrXjSKol9IB6OeNUgqMVOVffF4BcBzJxHhrOMpv2LGhJYqSeS+y/bap8JpeaqtM4Z95J4NV8K6cZDTpFxEguyf+pJ+ST+P3WSupD3H+srrTVqgTg/Ks+6e3GDrxK6Xc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iqbKHPvk; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iqbKHPvk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791420116; x=1822956116;
  h=date:from:to:cc:subject:message-id;
  bh=tRBa/vyDi13IrL8ZoYDhynwkgX/hpXY8TJOpmIDs0ZA=;
  b=iqbKHPvkFlvCMnN0H8Z+9XRtSu8TXcrDbA6sEJwcP8yodLddUfM3MhJH
   cKbZlVmtPulO6iaJ3LaDEmJLeSotdJjCtOQSyhYrIQP+eg9bstxclAHTv
   t+g8ZfxY4CkGyfmS6pCPpv57iyaWIj1+MOV9xkYBmG1j+clTb5qGuyb0z
   h3I1O0rndo9zf2P3WEbdneG1f/kIlFlaAs/xFTnVoeQRsTxTUpDLWlvVQ
   DaCzGnmZ5CwEWA0bLGQicOZ5VLGn7gnIQUaM7wcqZdHcbWiCyBpYMtLRT
   ye8xekiFAnn+LrC3C5HGOSpk53yOEvzSgPOXJD5HIvLhoDgeXY0n122VA
   A==;
X-CSE-ConnectionGUID: R/7HmNlMTzSWuTc9GS0b8Q==
X-CSE-MsgGUID: lpiQdbjxSMOA54jZtTmk2w==
X-IronPort-AV: E=McAfee;i="6800,10657,11928"; a="191635"
X-IronPort-AV: E=Sophos;i="6.27,145,1787036400"; 
   d="scan'208";a="191635"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Oct 2026 17:41:55 -0700
X-CSE-ConnectionGUID: LW026VoQRpW2JJuJjB4XnQ==
X-CSE-MsgGUID: zc8UaLTRSUuaG4mBPHaaBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,145,1787036400"; 
   d="scan'208";a="307056625"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by orviesa002.jf.intel.com with ESMTP; 07 Oct 2026 17:41:52 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xEcCj-000000004QV-46cz;
	Thu, 08 Oct 2026 00:41:49 +0000
Date: Thu, 08 Oct 2026 02:41:10 +0200
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:netfs-next-4 7/9]
 include/linux/compiler_types.h:702:45: error: call to
 '__compiletime_assert_437' declared with attribute error: max(to, ret)
 signedness error
Message-ID: <202610080217.U3kveBFn-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git netfs-next-4
head:   780f214b12c4ec95d496daff545d27a824735f4f
commit: 4da074c3ab2ca3f97d9a1ac526d803a3bf2ef432 [7/9] netfs: Use bvecq_pos to hold the buffer positions
config: parisc-randconfig-r2103-20261006 (https://download.01.org/0day-ci/archive/20261008/202610080217.U3kveBFn-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 12.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261008/202610080217.U3kveBFn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610080217.U3kveBFn-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <command-line>:
   fs/netfs/buffered_read.c: In function 'netfs_read_gaps':
>> include/linux/compiler_types.h:702:45: error: call to '__compiletime_assert_437' declared with attribute error: max(to, ret) signedness error
     702 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                                             ^
   include/linux/compiler_types.h:683:25: note: in definition of macro '__compiletime_assert'
     683 |                         prefix ## suffix();                             \
         |                         ^~~~~~
   include/linux/compiler_types.h:702:9: note: in expansion of macro '_compiletime_assert'
     702 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:40:37: note: in expansion of macro 'compiletime_assert'
      40 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:93:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      93 |         BUILD_BUG_ON_MSG(!__types_ok(ux, uy),           \
         |         ^~~~~~~~~~~~~~~~
   include/linux/minmax.h:98:9: note: in expansion of macro '__careful_cmp_once'
      98 |         __careful_cmp_once(op, x, y, __UNIQUE_ID(x_), __UNIQUE_ID(y_))
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:112:25: note: in expansion of macro '__careful_cmp'
     112 | #define max(x, y)       __careful_cmp(max, x, y)
         |                         ^~~~~~~~~~~~~
   fs/netfs/buffered_read.c:626:59: note: in expansion of macro 'max'
     626 |                                 folio_zero_segment(folio, max(to, ret), flen);
         |                                                           ^~~


vim +/__compiletime_assert_437 +702 include/linux/compiler_types.h

eb5c2d4b45e3d2d Will Deacon 2020-07-21  688  
eb5c2d4b45e3d2d Will Deacon 2020-07-21  689  #define _compiletime_assert(condition, msg, prefix, suffix) \
eb5c2d4b45e3d2d Will Deacon 2020-07-21  690  	__compiletime_assert(condition, msg, prefix, suffix)
eb5c2d4b45e3d2d Will Deacon 2020-07-21  691  
eb5c2d4b45e3d2d Will Deacon 2020-07-21  692  /**
eb5c2d4b45e3d2d Will Deacon 2020-07-21  693   * compiletime_assert - break build and emit msg if condition is false
eb5c2d4b45e3d2d Will Deacon 2020-07-21  694   * @condition: a compile-time constant condition to check
eb5c2d4b45e3d2d Will Deacon 2020-07-21  695   * @msg:       a message to emit if condition is false
eb5c2d4b45e3d2d Will Deacon 2020-07-21  696   *
eb5c2d4b45e3d2d Will Deacon 2020-07-21  697   * In tradition of POSIX assert, this macro will break the build if the
eb5c2d4b45e3d2d Will Deacon 2020-07-21  698   * supplied condition is *false*, emitting the supplied error message if the
eb5c2d4b45e3d2d Will Deacon 2020-07-21  699   * compiler has support to do so.
eb5c2d4b45e3d2d Will Deacon 2020-07-21  700   */
eb5c2d4b45e3d2d Will Deacon 2020-07-21  701  #define compiletime_assert(condition, msg) \
eb5c2d4b45e3d2d Will Deacon 2020-07-21 @702  	_compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
eb5c2d4b45e3d2d Will Deacon 2020-07-21  703  

:::::: The code at line 702 was first introduced by commit
:::::: eb5c2d4b45e3d2d5d052ea6b8f1463976b1020d5 compiler.h: Move compiletime_assert() macros into compiler_types.h

:::::: TO: Will Deacon <will@kernel.org>
:::::: CC: Will Deacon <will@kernel.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
