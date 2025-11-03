Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EE0A2F2E
	for <oe-kbuild-all@lists.linux.dev>; Mon,  3 Nov 2025 22:02:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762207333; cv=none; b=Da4PdWMMB2MA0urcqRgm5yjVKbAExYYIXbE4xXXnri00pFv+TBgNqIL8TQ09oFP+A0qhQwLI7P8Lz1hM5fRqll5UoBjmxzZ53NlFARvNpZtTxRJA6bDV+lrxgwyxj5rSMVwVryArQ3U858ic08HKiJh4FHzObr8rwJM866wAMcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762207333; c=relaxed/simple;
	bh=S95hbzAip16ujDMzM+vNnCcgsIFhJ3vlcqmO+W11zeI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=B+MSLB9hkMTUPYuQPcv4bd0bBKRn5HMX/GZpYMXRHRdvTT/E3luypnAV85xKVqi1qv3OxASTGhce49qOQ73eHmmL/EKE/vCppToQ2Xk1gS3HG/krgNmgu62r+GRmExTU6xblmleGG9MGaUwtmN4ZBR5f1Cw6pEQIC6WUbTL8Dds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=awEq9SMS; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="awEq9SMS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762207332; x=1793743332;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=S95hbzAip16ujDMzM+vNnCcgsIFhJ3vlcqmO+W11zeI=;
  b=awEq9SMSiA184XNcgZjLWolP/0fTG0rubwxi6mwVY3HT8qWD/gQJGQmd
   KCXQOPA6s1DZtlA991N5kHAUsgHv9d7YHxs9wdFRU1/wwCsKwLB6swvv6
   m0EcbtbBS2yLXNpbje3rko1R5U0h3Lii7HwOwIIDPNEIRvA1pJUYppXt1
   p5PGD8K8GB6XBaPM9nlKiJaxp0+M4Xy1K52EuztBySHSjcvS1OVdHQjIx
   KWD0VCmpl+yM0Uom7WAeX8Ax6G4UFAAEBKPW39iFn7QNAifj9nQPYSE7O
   +MLZS/5s9Cwk2Lxii1RaAnDKnWlNln7o9bYLsi+JkiP2Jpb8qDL0NsgQa
   w==;
X-CSE-ConnectionGUID: fmVl8lnwQ1yj6wD0d+efEw==
X-CSE-MsgGUID: ED22v5VSSY60krNgxmpADQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11602"; a="86919289"
X-IronPort-AV: E=Sophos;i="6.19,277,1754982000"; 
   d="scan'208";a="86919289"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2025 14:02:11 -0800
X-CSE-ConnectionGUID: D4Aid9GaTrG1RKCZe6vCzQ==
X-CSE-MsgGUID: 1BwHe84rQTSk3w2aN6lQ1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,277,1754982000"; 
   d="scan'208";a="186930122"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 03 Nov 2025 14:02:10 -0800
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vG2cp-000QZi-1p;
	Mon, 03 Nov 2025 22:02:07 +0000
Date: Tue, 4 Nov 2025 06:01:52 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Wang Liang <wangliang74@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3098/3098] net/oenetcls/oenetcls_main.c:990:13:
 warning: 'set_netdev_xps_queue' defined but not used
Message-ID: <202511040552.16dcWFcA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Wang,

First bad commit (maybe != root cause):

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   a29fc03bd0ddaf7388cf31604ef5bd9807585109
commit: 22d4075bf5ef29ba4b329f954ac28a7de1d69a65 [3098/3098] net/oenetcls: remove oenetcls trace hook
config: x86_64-randconfig-121-20251104 (https://download.01.org/0day-ci/archive/20251104/202511040552.16dcWFcA-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251104/202511040552.16dcWFcA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511040552.16dcWFcA-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> net/oenetcls/oenetcls_main.c:990:13: warning: 'set_netdev_xps_queue' defined but not used [-Wunused-function]
     990 | static void set_netdev_xps_queue(bool enable)
         |             ^~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/string.h:294,
                    from include/linux/bitmap.h:11,
                    from include/linux/cpumask.h:12,
                    from arch/x86/include/asm/cpumask.h:5,
                    from arch/x86/include/asm/msr.h:11,
                    from arch/x86/include/asm/processor.h:23,
                    from arch/x86/include/asm/timex.h:5,
                    from include/linux/timex.h:67,
                    from include/linux/time32.h:13,
                    from include/linux/time.h:60,
                    from include/linux/stat.h:19,
                    from include/linux/module.h:13,
                    from net/oenetcls/oenetcls_main.c:2:
   In function 'strncpy',
       inlined from 'oecls_filter_restore' at net/oenetcls/oenetcls_main.c:459:2:
   include/linux/fortify-string.h:81:33: warning: '__builtin_strncpy' specified bound 16 equals destination size [-Wstringop-truncation]
      81 | #define __underlying_strncpy    __builtin_strncpy
         |                                 ^
   include/linux/fortify-string.h:165:16: note: in expansion of macro '__underlying_strncpy'
     165 |         return __underlying_strncpy(p, q, size);
         |                ^~~~~~~~~~~~~~~~~~~~
   In function 'strncpy',
       inlined from 'oecls_filter_enable.constprop' at net/oenetcls/oenetcls_main.c:413:2:
   include/linux/fortify-string.h:81:33: warning: '__builtin_strncpy' specified bound 16 equals destination size [-Wstringop-truncation]
      81 | #define __underlying_strncpy    __builtin_strncpy
         |                                 ^
   include/linux/fortify-string.h:165:16: note: in expansion of macro '__underlying_strncpy'
     165 |         return __underlying_strncpy(p, q, size);
         |                ^~~~~~~~~~~~~~~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for PTP_1588_CLOCK
   Depends on [n]: NET [=y] && POSIX_TIMERS [=n]
   Selected by [m]:
   - SXE [=m] && NETDEVICES [=y] && ETHERNET [=y] && NET_VENDOR_LINKDATA [=y] && (X86 [=y] || ARM64) && PCI [=y]
   - SXE_VF [=m] && NETDEVICES [=y] && ETHERNET [=y] && NET_VENDOR_LINKDATA [=y] && (X86 [=y] || ARM64) && PCI [=y]


vim +/set_netdev_xps_queue +990 net/oenetcls/oenetcls_main.c

4bed6ba0e88f50 Wang Liang 2025-08-26   989  
4bed6ba0e88f50 Wang Liang 2025-08-26  @990  static void set_netdev_xps_queue(bool enable)
4bed6ba0e88f50 Wang Liang 2025-08-26   991  {
4bed6ba0e88f50 Wang Liang 2025-08-26   992  	const struct cpumask clear_mask = { 0 };
4bed6ba0e88f50 Wang Liang 2025-08-26   993  	struct oecls_netdev_info *oecls_dev;
4bed6ba0e88f50 Wang Liang 2025-08-26   994  	const struct cpumask *cpu_mask;
4bed6ba0e88f50 Wang Liang 2025-08-26   995  	int rxq_id, devid, cpu, nid;
4bed6ba0e88f50 Wang Liang 2025-08-26   996  
4bed6ba0e88f50 Wang Liang 2025-08-26   997  	for_each_oecls_netdev(devid, oecls_dev) {
4bed6ba0e88f50 Wang Liang 2025-08-26   998  		for (rxq_id = 0; rxq_id < oecls_dev->rxq_num; rxq_id++) {
4bed6ba0e88f50 Wang Liang 2025-08-26   999  			cpu = oecls_dev->rxq[rxq_id].affinity_cpu;
4bed6ba0e88f50 Wang Liang 2025-08-26  1000  			nid = cpu_to_node(cpu);
4bed6ba0e88f50 Wang Liang 2025-08-26  1001  			if (enable)
4bed6ba0e88f50 Wang Liang 2025-08-26  1002  				cpu_mask = cpumask_of_node(nid);
4bed6ba0e88f50 Wang Liang 2025-08-26  1003  			else
4bed6ba0e88f50 Wang Liang 2025-08-26  1004  				cpu_mask = &clear_mask;
4bed6ba0e88f50 Wang Liang 2025-08-26  1005  
4bed6ba0e88f50 Wang Liang 2025-08-26  1006  			netif_set_xps_queue_wrapper(oecls_dev->netdev, rxq_id, cpu_mask);
4bed6ba0e88f50 Wang Liang 2025-08-26  1007  		}
4bed6ba0e88f50 Wang Liang 2025-08-26  1008  	}
4bed6ba0e88f50 Wang Liang 2025-08-26  1009  }
4bed6ba0e88f50 Wang Liang 2025-08-26  1010  

:::::: The code at line 990 was first introduced by commit
:::::: 4bed6ba0e88f50484fd5fb06bd993727b981b718 net/oenetcls: introduce oenetcls for network optimization

:::::: TO: Wang Liang <wangliang74@huawei.com>
:::::: CC: Wang Liang <wangliang74@huawei.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
