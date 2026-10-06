Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F0D1280309
	for <oe-kbuild-all@lists.linux.dev>; Tue,  6 Oct 2026 16:54:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791305657; cv=none; b=F4X9lZxCJzlop9pwGIUK9lVodRM1VLtJusxNPqva1QDgePX8gUu37WLBJcsNmiCfMcpB09q7i497LsJ49l6EH6CII3AC5uHOIDSxI6DVnM031Zx05BX5Zx/WvhiZ7pFG8THMvzgS4dEE8dVS7mQUA+u3oPPKSBuIweb+Jv2O2oc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791305657; c=relaxed/simple;
	bh=3Pj4QpH3GEHoVADAYPUK8XawHfIBu6tg8TuecBvKmRo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=L5h+YuEgu+NcKwyfbQrvuJmuslWpxjbsn9SHcDABCII0k8Oi6xIpWR/Lva1/9tYhiLHvcTW9c5kQ4nuADfLsd+xi+z4TG/gzp41MuAX7aHiz97hzixPBCw0fm9r6hzkL1OVEtkGm50oenRFtmRuWMxC/2PQpN8l/mM7KTPMDWMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VaLjX1aa; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VaLjX1aa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791305655; x=1822841655;
  h=date:from:to:cc:subject:message-id;
  bh=3Pj4QpH3GEHoVADAYPUK8XawHfIBu6tg8TuecBvKmRo=;
  b=VaLjX1aa6xsmniYX6B8+wV5DDKWoGOA7HQqgy/j7NnUsWWl6hBgk95nl
   F552sYGJREb+c9lWA/zPMytu5lwgkwX3dSk76vBQ620f1HYVoa9Jq35NT
   XsdvjKIb42IYs/kcdVRKEiHBahwQbajKjzlXbFV80m8g420mAb9UepXGo
   LqYirmTiMkCtQF60NWob1jo1mf4WdQOIp1AaPNmiE8KGRNgI1VmPgDQWi
   RHfUI+6EgkZK/CiFYsA9j269xvLpIeJKCTEQEhlXm/4gHJBQgXltLBMDk
   xK4V5JAEY6gJmSg42JOGGM4x4VH2QgxsErrssARRil32+950Adzf5S1vc
   g==;
X-CSE-ConnectionGUID: WlPaeBcpTWqAS19Tob0ifQ==
X-CSE-MsgGUID: VXpbPKjISVSoNxagmoH4uA==
X-IronPort-AV: E=McAfee;i="6800,10657,11927"; a="102581514"
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; 
   d="scan'208";a="102581514"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Oct 2026 09:54:15 -0700
X-CSE-ConnectionGUID: KQxtLMKrQ1SarYfk46W/LA==
X-CSE-MsgGUID: prTv7prQRh+qlOgHRRFSOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; 
   d="scan'208";a="280440303"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by orviesa003.jf.intel.com with ESMTP; 06 Oct 2026 09:54:13 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xE8Qd-000000001WV-1InZ;
	Tue, 06 Oct 2026 16:54:11 +0000
Date: Tue, 06 Oct 2026 18:53:55 +0200
From: kernel test robot <lkp@intel.com>
To: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [kkdwivedi:xdp-tcp 28/41]
 include/linux/compiler_types.h:702:38: error: call to
 '__compiletime_assert_858' declared with attribute error: min(len,
 pfrag->size - pfrag->offset) signedness error
Message-ID: <202610061807.IZHYfydD-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/kkdwivedi/linux xdp-tcp
head:   98ba2e45e6a3e93f19f6579031bd9e6995b9ca4c
commit: b7c41d3f731d7d54b9989b4c6f765c26635e7e50 [28/41] tcp: Put the payload of XDP responses in page fragments
config: arm-randconfig-r2200-20261006 (https://download.01.org/0day-ci/archive/20261006/202610061807.IZHYfydD-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 8.5.0
smatch: v0.5.0-9187-g5189e3fb
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261006/202610061807.IZHYfydD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610061807.IZHYfydD-lkp@intel.com/

All errors (new ones prefixed by >>):

   net/ipv4/tcp_xdp.c: In function 'bpf_xdp_tcp_consume':
   net/ipv4/tcp_xdp.c:262:11: warning: assignment to 'sk_buff_data_t' {aka 'unsigned char *'} from 'unsigned int' makes pointer from integer without a cast [-Wint-conversion]
     skb->end = offsetof(typeof(fake), shinfo) - offsetof(typeof(fake), hdr);
              ^
   net/ipv4/tcp_xdp.c:263:12: warning: assignment to 'sk_buff_data_t' {aka 'unsigned char *'} from 'u32' {aka 'unsigned int'} makes pointer from integer without a cast [-Wint-conversion]
     skb->tail = hlen;
               ^
   In file included from <command-line>:
   In function 'xdp_tcp_alloc_segment',
       inlined from 'bpf_xdp_tcp_send' at net/ipv4/tcp_xdp.c:416:8:
>> include/linux/compiler_types.h:702:38: error: call to '__compiletime_assert_858' declared with attribute error: min(len, pfrag->size - pfrag->offset) signedness error
     _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
                                         ^
   include/linux/compiler_types.h:683:4: note: in definition of macro '__compiletime_assert'
       prefix ## suffix();    \
       ^~~~~~
   include/linux/compiler_types.h:702:2: note: in expansion of macro '_compiletime_assert'
     _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
     ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:40:37: note: in expansion of macro 'compiletime_assert'
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
   net/ipv4/tcp_xdp.c:354:10: note: in expansion of macro 'min'
      copy = min(len, pfrag->size - pfrag->offset);
             ^~~


vim +/__compiletime_assert_858 +702 include/linux/compiler_types.h

eb5c2d4b45e3d2 Will Deacon 2020-07-21  688  
eb5c2d4b45e3d2 Will Deacon 2020-07-21  689  #define _compiletime_assert(condition, msg, prefix, suffix) \
eb5c2d4b45e3d2 Will Deacon 2020-07-21  690  	__compiletime_assert(condition, msg, prefix, suffix)
eb5c2d4b45e3d2 Will Deacon 2020-07-21  691  
eb5c2d4b45e3d2 Will Deacon 2020-07-21  692  /**
eb5c2d4b45e3d2 Will Deacon 2020-07-21  693   * compiletime_assert - break build and emit msg if condition is false
eb5c2d4b45e3d2 Will Deacon 2020-07-21  694   * @condition: a compile-time constant condition to check
eb5c2d4b45e3d2 Will Deacon 2020-07-21  695   * @msg:       a message to emit if condition is false
eb5c2d4b45e3d2 Will Deacon 2020-07-21  696   *
eb5c2d4b45e3d2 Will Deacon 2020-07-21  697   * In tradition of POSIX assert, this macro will break the build if the
eb5c2d4b45e3d2 Will Deacon 2020-07-21  698   * supplied condition is *false*, emitting the supplied error message if the
eb5c2d4b45e3d2 Will Deacon 2020-07-21  699   * compiler has support to do so.
eb5c2d4b45e3d2 Will Deacon 2020-07-21  700   */
eb5c2d4b45e3d2 Will Deacon 2020-07-21  701  #define compiletime_assert(condition, msg) \
eb5c2d4b45e3d2 Will Deacon 2020-07-21 @702  	_compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
eb5c2d4b45e3d2 Will Deacon 2020-07-21  703  

:::::: The code at line 702 was first introduced by commit
:::::: eb5c2d4b45e3d2d5d052ea6b8f1463976b1020d5 compiler.h: Move compiletime_assert() macros into compiler_types.h

:::::: TO: Will Deacon <will@kernel.org>
:::::: CC: Will Deacon <will@kernel.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
