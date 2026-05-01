Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C5A537FF54
	for <oe-kbuild-all@lists.linux.dev>; Fri,  1 May 2026 23:45:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777679113; cv=none; b=CS/SHVBdUdFIVvwEWQXaWLVF15/SCZRSyRWobuEclYX2LCR5HYzh/+ORGSx7Am9AArWS28Fx0Oaz3m+S4fvtThZ6+Tv0FlqnVfp0tFfTEIb/VAu/pCCEkUR9Bhi5ol4hf/EQd84ilQWyLlR/XwNu96igtRyikKEIKnUcROgD5gI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777679113; c=relaxed/simple;
	bh=YAVubpdqJTSqsk6UpIudNr2vAV6Ui2pIcLPZkseILyU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=RvnmIp1+GfYH48JkMKL52SuW8yfcYX/w7BBud26zoNhdjzG3jghxwqSqsjM85I5lNEHg6XAlleO1PxIVxgtiO+fWhGpc77blcGfKjzLFBrCj0bPFq+Pa9wl3PCAc02PJxx+Xz8yMTCnhZoPzYdDzV/IvQcFBnn9k43e6W0PRuBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NC7RDe/b; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NC7RDe/b"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777679110; x=1809215110;
  h=date:from:to:cc:subject:message-id;
  bh=YAVubpdqJTSqsk6UpIudNr2vAV6Ui2pIcLPZkseILyU=;
  b=NC7RDe/baUB3LBPR+uu7hYqWIPzAMzN33sAuR/0xsEoHY31qMed72Ol3
   lUBPPigHhU1DzsjwY/135mia3ggdQ27mlYJoDIWmaZM4/KtvDrElSB9ac
   y6P8lcgpzb6sV1I0o/T2e9ivDnWQKHmfGolNTuPHrvUMjo86+l6Zb47h+
   NOj4E5CBpn9xGZtc3pHss1mm+HU36aAv5ni7YnEQpPEmrUc8nPUFZe9Rv
   E1QLQvLh5zvCl5N1J4xtwAMV9Z6hDOfHFyMz8s0SLoqw+BM6zGKGe+tBY
   Q+sPG+fEEoeVU3E8wqxJliCTxdYaRf2s1JtJUUT7l3N5gIbBqBPL/+oLg
   g==;
X-CSE-ConnectionGUID: Fk5kjMGERki1sm1ivOihJg==
X-CSE-MsgGUID: EuDpjZBPRquXE2eXt+qsjA==
X-IronPort-AV: E=McAfee;i="6800,10657,11773"; a="82509748"
X-IronPort-AV: E=Sophos;i="6.23,210,1770624000"; 
   d="scan'208";a="82509748"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 May 2026 16:45:05 -0700
X-CSE-ConnectionGUID: ZK1nqZYzSlaxaL6pultnZw==
X-CSE-MsgGUID: gYuUf+N6S0izBuyj3lOqDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,210,1770624000"; 
   d="scan'208";a="236769902"
Received: from lkp-server01.sh.intel.com (HELO 781826d00641) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 01 May 2026 16:45:03 -0700
Received: from kbuild by 781826d00641 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wIxXY-000000000xZ-3qmu;
	Fri, 01 May 2026 23:45:00 +0000
Date: Sat, 02 May 2026 07:44:15 +0800
From: kernel test robot <lkp@intel.com>
To: Alexander Lobakin <aleksander.lobakin@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Tony Nguyen <anthony.l.nguyen@intel.com>
Subject: include/linux/build_bug.h:78:41: error: static assertion
 failed: "sizeof(struct idpf_xdp_rx_desc) == sizeof(struct
 virtchnl2_rx_flex_desc_adv_nic_3)"
Message-ID: <202605020707.9e3f2lTL-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Alexander,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   ef5f46b630235b75beec43174348c3d01d6fc49a
commit: 88ca0c738c4159ce87893782b6dd964b5aa01f6e idpf: add XDP RSS hash hint
date:   8 months ago
config: arm-randconfig-004-20260502 (https://download.01.org/0day-ci/archive/20260502/202605020707.9e3f2lTL-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260502/202605020707.9e3f2lTL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 88ca0c738c41 ("idpf: add XDP RSS hash hint")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605020707.9e3f2lTL-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/minmax.h:5,
                    from include/linux/jiffies.h:8,
                    from include/net/pkt_sched.h:5,
                    from drivers/net/ethernet/intel/idpf/idpf.h:12,
                    from drivers/net/ethernet/intel/idpf/xdp.c:4:
>> include/linux/build_bug.h:78:41: error: static assertion failed: "sizeof(struct idpf_xdp_rx_desc) == sizeof(struct virtchnl2_rx_flex_desc_adv_nic_3)"
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                         ^~~~~~~~~~~~~~
   include/linux/build_bug.h:77:34: note: in expansion of macro '__static_assert'
      77 | #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
         |                                  ^~~~~~~~~~~~~~~
   drivers/net/ethernet/intel/idpf/xdp.h:118:1: note: in expansion of macro 'static_assert'
     118 | static_assert(sizeof(struct idpf_xdp_rx_desc) ==
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
