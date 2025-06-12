Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F0122F430B
	for <oe-kbuild-all@lists.linux.dev>; Thu, 12 Jun 2025 12:03:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749729790; cv=none; b=hhYVG11xdZ3hVwwtTnlGGa5ve9yfKFIeYTzv7/hNbbrUt3zxLt5O91CKpO8W5X4+vjCytGqrRqT//5d4lfe6v8If7lcEPn60sAGlgfl99/O30v2BjIOuHLJ6yVlhKLBwLHMf6zomimeBZnUa3hnouCzntsurGy8+WUhN8R6pu2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749729790; c=relaxed/simple;
	bh=T9mndGIjqcYAvU9+k3vjZh0R63oNscvCpel57qbswLk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Q3xdSfiTs6aGMuGec9wtWNlYJC4BmYPK/9f6ZN8ZW+OXI8ikS3IEzjHV2Z813+bo+5PIzmU94emAtInDLWL+0at6TeJ/vgSEASCrK/CVfENBXe0IO+PNjsiW6L/gSGTZ9sePys5EgM8W1AxbebzDZO5ArUTajXJlK8jk53q1c6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NfY7yT0i; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NfY7yT0i"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749729788; x=1781265788;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=T9mndGIjqcYAvU9+k3vjZh0R63oNscvCpel57qbswLk=;
  b=NfY7yT0iYxxtHzktROTyulFW+L4teJ/CN5p2fqMJMF5Xpgg9V6o5gTxv
   sjN2aITQxxqojBDcH1/Pi9sxasBPAWrtLHOzjqGEK1L86eG6s4ZwSMRVH
   T+M/GxteIJzOZc8qUuvHLdp+6NzGCsURJOJIaFMHSzgsj75kQ7ffBCrEo
   iE2nWJmeS8nj76uSl8wDWsJx4n8gJ3b29NKt1sgPQ6mAKLucLZfKDL6xf
   NCvYAGZyiEL08eLvalPNpAzS+pYP3mB3F8SSJ9FlkEozRfOamb20yhXtv
   R3BTFkkmxzvxec8iQtHfj0lbhzxKiSy0HgZZkn47UkDIWKumv1w6xEH+g
   g==;
X-CSE-ConnectionGUID: nq3hnUAWSdqiqLNkkZ2arg==
X-CSE-MsgGUID: B6LOe6nVQfqjh4VSmagx5g==
X-IronPort-AV: E=McAfee;i="6800,10657,11461"; a="55577530"
X-IronPort-AV: E=Sophos;i="6.16,230,1744095600"; 
   d="scan'208";a="55577530"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2025 05:03:08 -0700
X-CSE-ConnectionGUID: eh50Kf6tRkW/Boj8emlfug==
X-CSE-MsgGUID: PRi/WEayRHamaSnwtNesww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,230,1744095600"; 
   d="scan'208";a="148408151"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 12 Jun 2025 05:03:07 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uPge8-000BVG-1M;
	Thu, 12 Jun 2025 12:03:04 +0000
Date: Thu, 12 Jun 2025 20:02:14 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.10 2/2]
 drivers/tty/serial/msm_geni_serial_earlycon.c:360:8: warning:
 initializer-string for array of 'char' truncates NUL terminator but
 destination lacks 'nonstring' attribute (16 chars into 15 available)
Message-ID: <202506121926.xyHruTyC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android13-5.10
head:   b1e1191e4148f0d416f66e9db038ec4cb3b1017c
commit: e1be87019fc97f736f2729a2a4198d250d28633b [2/2] ANDROID: serial: msm_geni_serial_earlycon: Add Earlycon support
config: arm-allmodconfig (https://download.01.org/0day-ci/archive/20250612/202506121926.xyHruTyC-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250612/202506121926.xyHruTyC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506121926.xyHruTyC-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/tty/serial/msm_geni_serial_earlycon.c: In function 'msm_geni_serial_earlycon_setup':
   drivers/tty/serial/msm_geni_serial_earlycon.c:307:13: warning: variable 'rx_stale' set but not used [-Wunused-but-set-variable]
     307 |         u32 rx_stale = 0;
         |             ^~~~~~~~
   drivers/tty/serial/msm_geni_serial_earlycon.c:305:13: warning: variable 'rx_parity_cfg' set but not used [-Wunused-but-set-variable]
     305 |         u32 rx_parity_cfg = 0;
         |             ^~~~~~~~~~~~~
   drivers/tty/serial/msm_geni_serial_earlycon.c:304:13: warning: variable 'rx_trans_cfg' set but not used [-Wunused-but-set-variable]
     304 |         u32 rx_trans_cfg = 0;
         |             ^~~~~~~~~~~~
   In file included from include/linux/linkage.h:6,
                    from include/linux/kernel.h:8,
                    from include/linux/delay.h:22,
                    from drivers/tty/serial/msm_geni_serial_earlycon.c:6:
   drivers/tty/serial/msm_geni_serial_earlycon.c: At top level:
>> drivers/tty/serial/msm_geni_serial_earlycon.c:360:8: warning: initializer-string for array of 'char' truncates NUL terminator but destination lacks 'nonstring' attribute (16 chars into 15 available) [-Wunterminated-string-initialization]
     360 |                         msm_geni_serial_earlycon_setup);
         | ^                       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~      
   include/linux/stringify.h:9:34: note: in definition of macro '__stringify_1'
       9 | #define __stringify_1(x...)     #x
         |                                  ^
   include/linux/serial_core.h:372:29: note: in expansion of macro '__stringify'
     372 |                 = { .name = __stringify(_name),                         \
         |                             ^~~~~~~~~~~
   include/linux/serial_core.h:380:9: note: in expansion of macro '_OF_EARLYCON_DECLARE'
     380 |         _OF_EARLYCON_DECLARE(_name, compat, fn,                         \
         |         ^~~~~~~~~~~~~~~~~~~~
   drivers/tty/serial/msm_geni_serial_earlycon.c:359:1: note: in expansion of macro 'OF_EARLYCON_DECLARE'
     359 | OF_EARLYCON_DECLARE(msm_geni_serial, "qcom,msm-geni-console",
         | ^~~~~~~~~~~~~~~~~~~


vim +360 drivers/tty/serial/msm_geni_serial_earlycon.c

   358	
   359	OF_EARLYCON_DECLARE(msm_geni_serial, "qcom,msm-geni-console",
 > 360				msm_geni_serial_earlycon_setup);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
