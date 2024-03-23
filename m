Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92A221A38C9
	for <oe-kbuild-all@lists.linux.dev>; Sat, 23 Mar 2024 08:46:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711183617; cv=none; b=a4P2fwtozruwnPDdgbUJne6wrVEhBEJuDucefGiVExz4rAQjSxry88wWc3GqP2ippJJ5xMqOUVZMoJOeu0IH6KpbWBuj1mDf2y4SRxPcZ//1tpJN/H/1Y5xyozr4PVQYSVZPTEPmgtLbqh15GmHUmocHgF7Q5gQVV93qaEUpu5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711183617; c=relaxed/simple;
	bh=yXFHV8AuyQpr/ZWgmyoXHsBNpFBsdOVIsWjXs9gjiqw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MTf6mlKSEffBsbrdT5sUwOZM36kuo4tveIDS7j3I/5tJrkU/Hx48k4os4R+UVmXNC55YrSrTLFq7u7W0DTnWtsfXW1KTVq2P9wOm9Zw3RPLCUXxr/mqDgVQuIoOAtyZiO7bUzOLlFLWEqe5KDdM3CEiqCvOI1PP70PoV8PbXvyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DJrJ9doI; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DJrJ9doI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711183614; x=1742719614;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yXFHV8AuyQpr/ZWgmyoXHsBNpFBsdOVIsWjXs9gjiqw=;
  b=DJrJ9doInl81489X2tCVP39s8qJBFqnPsc2QArQh/aUmNXEdeDgO6yhS
   +2oSkZS/4DVxAf48RAegg7PeQIVnJtClNno6qdC9ReIcKG2jjh5vTvgJb
   VtDhsWB9e7XHbqqvsx6/ZLhXj2aKFPH95e98Ik4AYigDi58xea9GYBZ0c
   tVue3JpxJyfT0P/d2K8cOPWBvAbjwlfYSRO0PqXJNN7mGtesXEUdblpzd
   iu3Qe6FWcmEEqjVMKKSA3FyGsXL2UgximyFajKTen3Lqxc44Iww4jfxz6
   P1tJZfXqUxMPhe57XHjS/XTujqSWfbpZPiDX/ekt8RBZfG+DVTZcMzVlg
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11021"; a="10039967"
X-IronPort-AV: E=Sophos;i="6.07,148,1708416000"; 
   d="scan'208";a="10039967"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2024 01:46:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,148,1708416000"; 
   d="scan'208";a="19617379"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 23 Mar 2024 01:46:53 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rnx1e-000Kzx-2L;
	Sat, 23 Mar 2024 08:46:50 +0000
Date: Sat, 23 Mar 2024 16:46:30 +0800
From: kernel test robot <lkp@intel.com>
To: Alexander Lobakin <aleksander.lobakin@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [alobakin:idpf-libie-new 57/70] include/net/libeth/xsk.h:12:15:
 error: 'XDP_TXMD_FLAGS_VALID' undeclared here (not in a function)
Message-ID: <202403231606.uhDBly8Q-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/alobakin/linux idpf-libie-new
head:   b336f2db592517d25e745924c92e8604eeea0502
commit: 4cb3adaa6309f17ea6ecdce4b902f20bf315edf2 [57/70] libie: add a couple of XDP helpers
config: arm64-randconfig-001-20240323 (https://download.01.org/0day-ci/archive/20240323/202403231606.uhDBly8Q-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240323/202403231606.uhDBly8Q-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403231606.uhDBly8Q-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/container_of.h:5,
                    from include/linux/list.h:5,
                    from include/linux/timer.h:5,
                    from include/linux/netdevice.h:24,
                    from include/trace/events/xdp.h:8,
                    from include/linux/bpf_trace.h:5,
                    from include/net/libeth/xdp.h:7,
                    from include/net/libeth/xsk.h:7,
                    from drivers/net/ethernet/intel/libeth/xsk.c:4:
>> include/net/libeth/xsk.h:12:15: error: 'XDP_TXMD_FLAGS_VALID' undeclared here (not in a function)
      12 | static_assert(XDP_TXMD_FLAGS_VALID << __LIBETH_XDP_TX_XSKMD ==
         |               ^~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   include/net/libeth/xsk.h:12:1: note: in expansion of macro 'static_assert'
      12 | static_assert(XDP_TXMD_FLAGS_VALID << __LIBETH_XDP_TX_XSKMD ==
         | ^~~~~~~~~~~~~
>> include/net/libeth/xsk.h:12:15: error: expression in static assertion is not an integer
      12 | static_assert(XDP_TXMD_FLAGS_VALID << __LIBETH_XDP_TX_XSKMD ==
         |               ^~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   include/net/libeth/xsk.h:12:1: note: in expansion of macro 'static_assert'
      12 | static_assert(XDP_TXMD_FLAGS_VALID << __LIBETH_XDP_TX_XSKMD ==
         | ^~~~~~~~~~~~~


vim +/XDP_TXMD_FLAGS_VALID +12 include/net/libeth/xsk.h

    11	
  > 12	static_assert(XDP_TXMD_FLAGS_VALID << __LIBETH_XDP_TX_XSKMD ==
    13		      (LIBETH_XDP_TX_TSTAMP | LIBETH_XDP_TX_CSUM));
    14	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
