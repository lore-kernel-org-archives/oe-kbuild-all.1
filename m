Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90A2C63B6
	for <oe-kbuild-all@lists.linux.dev>; Sat,  9 Sep 2023 14:09:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694268572; x=1725804572;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Czqq/j81Dtm6nwP2yz4qKe8IqZZ5MMkNOTJX5VOKxD0=;
  b=JYgkQeBLczRMmkiDFPbOvFnVHqBu1rvyk4mo307jh0lITEAQVT9Keh3L
   dWPQI/XECExYkNwXHHa6f/hBVclalOWiAmp0O14RujMLUVfFcx1i2UMeM
   7SNLRSEX3xyWcMNLW73qEQ0I2lyC2b/pu4WEvrHTXxNxeHoOi8P8TLHSn
   W1vmz+rUdwjnLpfUfJKCY9XnD8QCEpFFSTIpd88beWVMHlAjB0wccWlsR
   XwGYVQCtOZ2SjPMI/Z+QaRosrCwlrye22NGX2anQ/NbuKWD5Gbj2ot4c/
   wKnf9tTtj2dC5DIfHfCIJR3B1K70AWrCb5XMXDqVpkZmyYiqRLeSXvuiH
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10827"; a="357290067"
X-IronPort-AV: E=Sophos;i="6.02,239,1688454000"; 
   d="scan'208";a="357290067"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2023 07:09:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10827"; a="745903290"
X-IronPort-AV: E=Sophos;i="6.02,239,1688454000"; 
   d="scan'208";a="745903290"
Received: from lkp-server01.sh.intel.com (HELO 59b3c6e06877) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 09 Sep 2023 07:09:25 -0700
Received: from kbuild by 59b3c6e06877 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qeyeI-0003aY-1X;
	Sat, 09 Sep 2023 14:09:22 +0000
Date: Sat, 9 Sep 2023 22:08:27 +0800
From: kernel test robot <lkp@intel.com>
To: David Thompson <davthompson@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Hans de Goede <hdegoede@redhat.com>,
	Shravan Kumar Ramani <shravankr@nvidia.com>
Subject: mlxbf-bootctl.c:undefined reference to `sysfs_format_mac'
Message-ID: <202309092107.yUYdtSR9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   6099776f9f268e61fe5ecd721f994a8cfce5306f
commit: 7e38a7422f128e7d7ba24b444e957d585dbb272f mlxbf-bootctl: Support sysfs entries for MFG fields
date:   2 weeks ago
config: arm64-randconfig-r032-20210928 (https://download.01.org/0day-ci/archive/20230909/202309092107.yUYdtSR9-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230909/202309092107.yUYdtSR9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309092107.yUYdtSR9-lkp@intel.com/

All errors (new ones prefixed by >>):

   aarch64-linux-ld: drivers/platform/mellanox/mlxbf-bootctl.o: in function `oob_mac_show':
>> mlxbf-bootctl.c:(.text+0x12c8): undefined reference to `sysfs_format_mac'
   mlxbf-bootctl.c:(.text+0x12c8): relocation truncated to fit: R_AARCH64_CALL26 against undefined symbol `sysfs_format_mac'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
