Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 063EC15E80
	for <oe-kbuild-all@lists.linux.dev>; Fri, 22 Mar 2024 08:03:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711094601; cv=none; b=poqzWyGKpmnBXroP3a4X46BlW83JXvIpx8kly11PpxcBOcFd1fm2kpB+RNR0Ad+Y936adYvDQbqMo95nxacK26P9ZIe/L3IicZo1d4OTKpz++atPVbiaQapiKLGe7bh8iJySjAB1usFLstkr0j0iHd/6CyPTrV2RRG+PGqKQupA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711094601; c=relaxed/simple;
	bh=MGUBrY0K06ywutcnNC5FRnZL1/iIQ8IZ3gNJdr17gT0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Ne7o4SORJeavY6j0tdiBF8qtr8rft2hEtX3ZWzcCt1TI08sX1LldJrO191kwjNenQYMHFQ8PBwB+FetpHEbfsRTLOTQqSzestC66QwdGOkTwbMMJNOeH/WJOVfKbfMBnPjyBPZMsFfVorK2ywVQBkTrYwkHq5p0yG47kUiICczY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CVE3IByo; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CVE3IByo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711094599; x=1742630599;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MGUBrY0K06ywutcnNC5FRnZL1/iIQ8IZ3gNJdr17gT0=;
  b=CVE3IByoVc3ZxG4hAmhjo6cAdyBfkCuzDh2a0Q7vPZj/fKrw/4g+v/dv
   pnszDFLZjjlcP6UWQ6Oz8eJW//AgvoHuVhIO7dlcPyU6NcDrgCVGljsb5
   v80/eP2l46bH1lWBqxKS0RYQ2kpPAFBXqJLoTUR9K/Dvamj0fxTeczAwU
   K+X8cK7WGT7bHyYjWTfPa5fO8EwK+FvgllKvl1LlU5oPWPlQa8FLvo3qP
   NdwuLEod+EwU70hYVsTF3xiwzF429zd1kP9Ze9zrilecENQFm8anzm3QI
   oaTlBvp3NZg++/Xa+ZdjVF1xDRsD2FWmgeg0muFJ+BPPiRrtCkmZ3J0rZ
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11020"; a="6315414"
X-IronPort-AV: E=Sophos;i="6.07,145,1708416000"; 
   d="scan'208";a="6315414"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Mar 2024 01:03:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,145,1708416000"; 
   d="scan'208";a="14689782"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 22 Mar 2024 01:03:17 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rnZru-000K93-18;
	Fri, 22 Mar 2024 08:03:14 +0000
Date: Fri, 22 Mar 2024 16:02:17 +0800
From: kernel test robot <lkp@intel.com>
To: Michal Kubiak <michal.kubiak@intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Alexander Lobakin <aleksander.lobakin@intel.com>
Subject: [alobakin:idpf-libie-new 57/67] include/linux/build_bug.h:78:41:
 error: static assertion failed: "offsetof(struct idpf_rx_queue,
 __cacheline_group_end__read_mostly) - offsetofend(struct idpf_rx_queue,
 __cacheline_group_begin__read_mostly) <= (128)"
Message-ID: <202403221544.emnBPp8w-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/alobakin/linux idpf-libie-new
head:   733856e38d3f5de803b52f9d7d52ba5bd2cd0127
commit: f68393db7d0e6e4353c7a62d119bbdda3912406a [57/67] idpf: prepare structures to support xdp
config: s390-allyesconfig (https://download.01.org/0day-ci/archive/20240322/202403221544.emnBPp8w-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240322/202403221544.emnBPp8w-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403221544.emnBPp8w-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/container_of.h:5,
                    from include/linux/list.h:5,
                    from include/linux/timer.h:5,
                    from include/linux/netdevice.h:24,
                    from include/trace/events/xdp.h:8,
                    from include/linux/bpf_trace.h:5,
                    from include/net/libeth/xdp.h:7,
                    from drivers/net/ethernet/intel/idpf/idpf_xdp.c:4:
   include/linux/build_bug.h:78:41: error: static assertion failed: "offsetof(struct idpf_q_vector, __cacheline_group_end__read_write) - offsetofend(struct idpf_q_vector, __cacheline_group_begin__read_write) <= (672)"
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                         ^~~~~~~~~~~~~~
   include/linux/build_bug.h:77:34: note: in expansion of macro '__static_assert'
      77 | #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
         |                                  ^~~~~~~~~~~~~~~
   drivers/net/ethernet/intel/idpf/idpf_txrx.h:353:9: note: in expansion of macro 'static_assert'
     353 |         static_assert(offsetof(type, __cacheline_group_end__##grp) -        \
         |         ^~~~~~~~~~~~~
   drivers/net/ethernet/intel/idpf/idpf_txrx.h:471:1: note: in expansion of macro '__idpf_cacheline_group_assert'
     471 | __idpf_cacheline_group_assert(struct idpf_q_vector, read_write, 672);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> include/linux/build_bug.h:78:41: error: static assertion failed: "offsetof(struct idpf_rx_queue, __cacheline_group_end__read_mostly) - offsetofend(struct idpf_rx_queue, __cacheline_group_begin__read_mostly) <= (128)"
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                         ^~~~~~~~~~~~~~
   include/linux/build_bug.h:77:34: note: in expansion of macro '__static_assert'
      77 | #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
         |                                  ^~~~~~~~~~~~~~~
   drivers/net/ethernet/intel/idpf/idpf_txrx.h:353:9: note: in expansion of macro 'static_assert'
     353 |         static_assert(offsetof(type, __cacheline_group_end__##grp) -        \
         |         ^~~~~~~~~~~~~
   drivers/net/ethernet/intel/idpf/idpf_txrx.h:360:9: note: in expansion of macro '__idpf_cacheline_group_assert'
     360 |         __idpf_cacheline_group_assert(type, read_mostly, ro);               \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/intel/idpf/idpf_txrx.h:616:1: note: in expansion of macro '__idpf_cacheline_queue_assert'
     616 | __idpf_cacheline_queue_assert(struct idpf_rx_queue, 128, 80, 32, 320);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:78:41: error: static assertion failed: "offsetof(struct idpf_tx_queue, __cacheline_group_end__read_write) - offsetofend(struct idpf_tx_queue, __cacheline_group_begin__read_write) <= (96)"
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                         ^~~~~~~~~~~~~~
   include/linux/build_bug.h:77:34: note: in expansion of macro '__static_assert'
      77 | #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
         |                                  ^~~~~~~~~~~~~~~
   drivers/net/ethernet/intel/idpf/idpf_txrx.h:353:9: note: in expansion of macro 'static_assert'
     353 |         static_assert(offsetof(type, __cacheline_group_end__##grp) -        \
         |         ^~~~~~~~~~~~~
   drivers/net/ethernet/intel/idpf/idpf_txrx.h:361:9: note: in expansion of macro '__idpf_cacheline_group_assert'
     361 |         __idpf_cacheline_group_assert(type, read_write, rw);                \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/intel/idpf/idpf_txrx.h:758:1: note: in expansion of macro '__idpf_cacheline_queue_assert'
     758 | __idpf_cacheline_queue_assert(struct idpf_tx_queue, 64, 96, 32, 256);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~


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
