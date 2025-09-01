Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0481EEC0
	for <oe-kbuild-all@lists.linux.dev>; Mon,  1 Sep 2025 20:50:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756759824; cv=none; b=Po+qPWilwqcHDu59+Nv4xafWvxfDB3qS06OTeuADzQlkyokgMLacYZVzyHOwTUSmx76nO6b7W0jpY55TkrM5KTFM77hCgjflBjWEDzUOtNhCU3v2Gm/JR18VIS7icd4TwCOmBRJb6V/CP9iUNjUByo106FWo8Q/CCDpKnmLPaZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756759824; c=relaxed/simple;
	bh=H4bP4l3N6TS6xNahtZCzR43APkkgBt314SVSLoYwJhw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LK82U+HqinoxDZYVYfDLDlKzsqn64yV6YG+szvpfLSrAtc/W6igjEEVdgE2SOhv3KoixgG+97ySXzVepU1GTIJIT4aJ8fFbBfyJDm3I2gQqCBJLKe29NW6DTQR+pYIi8H1SkmxWUn6ql7JNcmzG2VdzbIbiZ8Qa7s2fo/4OmN1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fEo4YpdX; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fEo4YpdX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756759823; x=1788295823;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=H4bP4l3N6TS6xNahtZCzR43APkkgBt314SVSLoYwJhw=;
  b=fEo4YpdXhL0jhLOunKLiMXENzWvXrfCHAXzpMGiRIlDYRMSEpLcp7oPS
   sHbv0VRDNdgVP5cOFokCYgpiZEsFrdeUIE+LswkGxdYKk5pMiybjsj50/
   /vdj79LJgMd4PtDfELbJsEX0ep6Z9rTL9zm2N3GH99w4o21zOXTLZ/Rv7
   SdR6BHP1wNSczH7XTsqX0Wydg8iv+d5ePRlG/imKJbhvQNeIVdfwlK8QQ
   N+dPVV28SgxAVEfdvtISdo3maezjOBUhUT+Dr1L/X8p5piXO/PftpBAB5
   wTmKokum73RjaqTOxSOzA3BOnmxXS4O1rPHMzyKh7HSf8Z9vG5Wzy4CLn
   g==;
X-CSE-ConnectionGUID: 66YyJwTGQsOUwDCOpQ3q4Q==
X-CSE-MsgGUID: ZEf7nuMvRzWiswo99FLocg==
X-IronPort-AV: E=McAfee;i="6800,10657,11540"; a="70395714"
X-IronPort-AV: E=Sophos;i="6.18,230,1751266800"; 
   d="scan'208";a="70395714"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2025 13:50:19 -0700
X-CSE-ConnectionGUID: NY4ezkI6Tj+sGEuo8gL/KQ==
X-CSE-MsgGUID: yjR6Pg1iRX23Ihk1saCDPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,230,1751266800"; 
   d="scan'208";a="202050971"
Received: from lkp-server02.sh.intel.com (HELO 06ba48ef64e9) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 01 Sep 2025 13:50:18 -0700
Received: from kbuild by 06ba48ef64e9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1utBTk-00011y-0a;
	Mon, 01 Sep 2025 20:50:16 +0000
Date: Tue, 2 Sep 2025 04:50:07 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [linux-next:master 3231/5291] include/linux/compiler_types.h:572:38:
 error: call to '__compiletime_assert_659' declared with attribute error:
 min(__x, __y) signedness error
Message-ID: <202509020426.WJtrdwOU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   33bcf93b9a6b028758105680f8b538a31bc563cf
commit: 429884ff35f75a8ac3e8f822f483e220e3ea6394 [3231/5291] io_uring/kbuf: use struct io_br_sel for multiple buffers picking
config: sparc-randconfig-002-20250902 (https://download.01.org/0day-ci/archive/20250902/202509020426.WJtrdwOU-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250902/202509020426.WJtrdwOU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509020426.WJtrdwOU-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <command-line>:
   In function 'io_recv_buf_select',
       inlined from 'io_recv' at io_uring/net.c:1199:9:
>> include/linux/compiler_types.h:572:38: error: call to '__compiletime_assert_659' declared with attribute error: min(__x, __y) signedness error
     _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
                                         ^
   include/linux/compiler_types.h:553:4: note: in definition of macro '__compiletime_assert'
       prefix ## suffix();    \
       ^~~~~~
   include/linux/compiler_types.h:572:2: note: in expansion of macro '_compiletime_assert'
     _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
     ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
    #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                        ^~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:93:2: note: in expansion of macro 'BUILD_BUG_ON_MSG'
     BUILD_BUG_ON_MSG(!__types_ok(ux, uy),  \
     ^~~~~~~~~~~~~~~~
   include/linux/minmax.h:98:2: note: in expansion of macro '__careful_cmp_once'
     __careful_cmp_once(op, x, y, __UNIQUE_ID(x_), __UNIQUE_ID(y_))
     ^~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:105:19: note: in expansion of macro '__careful_cmp'
    #define min(x, y) __careful_cmp(min, x, y)
                      ^~~~~~~~~~~~~
   include/linux/minmax.h:179:39: note: in expansion of macro 'min'
     __x == 0 ? __y : ((__y == 0) ? __x : min(__x, __y)); })
                                          ^~~
   io_uring/net.c:1130:18: note: in expansion of macro 'min_not_zero'
       arg.max_len = min_not_zero(sel->val, (size_t) kmsg->msg.msg_inq);
                     ^~~~~~~~~~~~


vim +/__compiletime_assert_659 +572 include/linux/compiler_types.h

eb5c2d4b45e3d2 Will Deacon 2020-07-21  558  
eb5c2d4b45e3d2 Will Deacon 2020-07-21  559  #define _compiletime_assert(condition, msg, prefix, suffix) \
eb5c2d4b45e3d2 Will Deacon 2020-07-21  560  	__compiletime_assert(condition, msg, prefix, suffix)
eb5c2d4b45e3d2 Will Deacon 2020-07-21  561  
eb5c2d4b45e3d2 Will Deacon 2020-07-21  562  /**
eb5c2d4b45e3d2 Will Deacon 2020-07-21  563   * compiletime_assert - break build and emit msg if condition is false
eb5c2d4b45e3d2 Will Deacon 2020-07-21  564   * @condition: a compile-time constant condition to check
eb5c2d4b45e3d2 Will Deacon 2020-07-21  565   * @msg:       a message to emit if condition is false
eb5c2d4b45e3d2 Will Deacon 2020-07-21  566   *
eb5c2d4b45e3d2 Will Deacon 2020-07-21  567   * In tradition of POSIX assert, this macro will break the build if the
eb5c2d4b45e3d2 Will Deacon 2020-07-21  568   * supplied condition is *false*, emitting the supplied error message if the
eb5c2d4b45e3d2 Will Deacon 2020-07-21  569   * compiler has support to do so.
eb5c2d4b45e3d2 Will Deacon 2020-07-21  570   */
eb5c2d4b45e3d2 Will Deacon 2020-07-21  571  #define compiletime_assert(condition, msg) \
eb5c2d4b45e3d2 Will Deacon 2020-07-21 @572  	_compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
eb5c2d4b45e3d2 Will Deacon 2020-07-21  573  

:::::: The code at line 572 was first introduced by commit
:::::: eb5c2d4b45e3d2d5d052ea6b8f1463976b1020d5 compiler.h: Move compiletime_assert() macros into compiler_types.h

:::::: TO: Will Deacon <will@kernel.org>
:::::: CC: Will Deacon <will@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
