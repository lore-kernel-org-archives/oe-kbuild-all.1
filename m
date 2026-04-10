Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACCB934751E
	for <oe-kbuild-all@lists.linux.dev>; Fri, 10 Apr 2026 11:25:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775820337; cv=none; b=cbiQGUuhsjIexyW1EluiY7k/2TOcN0JlnS3yoOteXvViNXRPCc+Z0G3PyCukyuYPL7uyTiOdwTBn9JRbytu6fG6ui45Ji10M884ipV0Ftwey7ItRoQESL+xAgOtBnURjHLvNDFhkMwHIJ6Utd0/X8OYmq1m/pXCKxlePC8wkUJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775820337; c=relaxed/simple;
	bh=4tOh0mcm33SxTxmxDcH+b16YXvPAHXAjON5uJuG5xic=;
	h=Date:From:To:Cc:Subject:Message-ID; b=arDyr4eGAlb3AMY7JLZunEAfifUL/St206faw2bLv+HssTlgd5Kw4ojYE/KCwe3/4ZLYXnv6Ohdw6z4Cyf0EIihD5hOm16N1InnUS9jvdG+JhNX6EmJ+7FoVJWrBTxGvCIdxI0WlRCVT80mgCVXwvqy116OU9mB3wGupTm4nDiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gxSQNCE8; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gxSQNCE8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775820336; x=1807356336;
  h=date:from:to:cc:subject:message-id;
  bh=4tOh0mcm33SxTxmxDcH+b16YXvPAHXAjON5uJuG5xic=;
  b=gxSQNCE8OnkwyUWznmU+XqGCi7lEQNQI9zJaHS1HAWPoBeftUFPtF0eu
   O2Tq9LK+oktcpBshKFI7mJMiSS3QIWoAWsKTn27WOmsPCU6Y6s12OFTRI
   eI+8hrLcI1hOWfjp6D7j9I5bVBr4rVBLU4F2AbHtHjJloiRfBrQlH/FyH
   st5ehRGYSP41J4/Z/WeAN+zX3yTJgKbMy3JdKbLkHMjRqcyQTiRqefB1C
   uophuLz32uxsCJLsnIcoKgMV2z3+TrrWPtg4nmsAnIGFnd8yFLT2fITmG
   9dRv/ZkRIQ5p3BqFmFw3LV+9/NGUcqLj8NZK9GokpdxfeDE1bcc4D5i/M
   g==;
X-CSE-ConnectionGUID: OyBLNKpJS5ijJtlq1FFYFg==
X-CSE-MsgGUID: rPuDTLHiQ0mFvFKMimM0aw==
X-IronPort-AV: E=McAfee;i="6800,10657,11754"; a="76855776"
X-IronPort-AV: E=Sophos;i="6.23,171,1770624000"; 
   d="scan'208";a="76855776"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2026 04:25:34 -0700
X-CSE-ConnectionGUID: zx/c4BIvTUSD6iJuGoi2Lw==
X-CSE-MsgGUID: wgFOJOIzSMWtFBDXm/dbIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,171,1770624000"; 
   d="scan'208";a="252221592"
Received: from lkp-server01.sh.intel.com (HELO 6449335cace3) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 10 Apr 2026 04:25:31 -0700
Received: from kbuild by 6449335cace3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wB9zN-000000003ec-3758;
	Fri, 10 Apr 2026 11:25:29 +0000
Date: Fri, 10 Apr 2026 19:24:55 +0800
From: kernel test robot <lkp@intel.com>
To: Alexander Lobakin <aleksander.lobakin@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Tony Nguyen <anthony.l.nguyen@intel.com>
Subject: include/linux/build_bug.h:78:41: error: static assertion
 failed: "sizeof(struct idpf_xdp_rx_desc) == sizeof(struct
 virtchnl2_rx_flex_desc_adv_nic_3)"
Message-ID: <202604101931.fN8gVxZI-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   9a9c8ce300cd3859cc87b408ef552cd697cc2ab7
commit: 88ca0c738c4159ce87893782b6dd964b5aa01f6e idpf: add XDP RSS hash hint
date:   7 months ago
config: arm-randconfig-001-20260410 (https://download.01.org/0day-ci/archive/20260410/202604101931.fN8gVxZI-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260410/202604101931.fN8gVxZI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 88ca0c738c41 ("idpf: add XDP RSS hash hint")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604101931.fN8gVxZI-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/minmax.h:5,
                    from include/linux/jiffies.h:8,
                    from include/net/pkt_sched.h:5,
                    from drivers/net/ethernet/intel/idpf/idpf.h:12,
                    from drivers/net/ethernet/intel/idpf/idpf_txrx.c:4:
>> include/linux/build_bug.h:78:41: error: static assertion failed: "sizeof(struct idpf_xdp_rx_desc) == sizeof(struct virtchnl2_rx_flex_desc_adv_nic_3)"
    #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
                                            ^~~~~~~~~~~~~~
   include/linux/build_bug.h:77:34: note: in expansion of macro '__static_assert'
    #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
                                     ^~~~~~~~~~~~~~~
   drivers/net/ethernet/intel/idpf/xdp.h:118:1: note: in expansion of macro 'static_assert'
    static_assert(sizeof(struct idpf_xdp_rx_desc) ==
    ^~~~~~~~~~~~~
--
   In file included from include/linux/minmax.h:5,
                    from include/linux/jiffies.h:8,
                    from include/net/pkt_sched.h:5,
                    from idpf.h:12,
                    from idpf_txrx.c:4:
>> include/linux/build_bug.h:78:41: error: static assertion failed: "sizeof(struct idpf_xdp_rx_desc) == sizeof(struct virtchnl2_rx_flex_desc_adv_nic_3)"
    #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
                                            ^~~~~~~~~~~~~~
   include/linux/build_bug.h:77:34: note: in expansion of macro '__static_assert'
    #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
                                     ^~~~~~~~~~~~~~~
   xdp.h:118:1: note: in expansion of macro 'static_assert'
    static_assert(sizeof(struct idpf_xdp_rx_desc) ==
    ^~~~~~~~~~~~~


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
