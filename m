Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 753D313FE7
	for <oe-kbuild-all@lists.linux.dev>; Sun, 25 Feb 2024 15:06:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708873596; cv=none; b=SEWR+NaWl7C2+2TtpZQco3AgiMPfcosnEFy4AqIpiKqPfQX6HjaY4yomy8/1SMqz/ewgjt5TPvGc86AJXsrHO8g0y1i656z1RMWy3jxRHxd/zV5wB7nQFvp8Kh/7UY9/rGMPPImKPoElB6Gv9LnxFar+0Q+kxtipgtyQjqHifgc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708873596; c=relaxed/simple;
	bh=IkOhBBsgjSh1vRP2G8wFx+j9s7WM639wy8tj8e813hM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JQwD6+POCNwHRzavmTXCA3PpbdvFO1FhIQYfMWJG7IP7vcOH5vexZ3/EWDc3TYuR4Hrs6V7Quk8ZiRJ4ywA1mT1MD8i2vcL89lPBgcUzlPYXqxo4JgLt910jUHUXUASHWUll9vB8/VpZiUre6FrYUSW71MnF5/hPA85dPlRgIJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=c7M86Apj; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="c7M86Apj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708873595; x=1740409595;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IkOhBBsgjSh1vRP2G8wFx+j9s7WM639wy8tj8e813hM=;
  b=c7M86ApjwTq6/vDuLelRvkZaxJA/5CXK3X/XaFDlmHSQ8EM6Q6NDlgn/
   HQafmoxMe0uX1gTtxK12bn/elTmBNlxcEesZ1m8tb6r75dMKNHPRsq6Ta
   gEM6WRHn9dYZk/ouN4Pbslffxfsnc2ffCkRhdRg14cJrNS//0UoLHx96Q
   YM1D4UM81UyJYGfmqGA7PM/WcsYcwTLWdjguQYtSPVzn52afKUKeCdwh4
   3USVU4iK9IqgphGjtQH4yf/15Un5pZMC2e/0qF0HUWVXBhju37JzxP6PP
   YZfZGL+6VrA6pnfcvaGysq1KX+cpygxeJUjuaq9Ysj2opHQZdPbCisj1K
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10995"; a="25628727"
X-IronPort-AV: E=Sophos;i="6.06,185,1705392000"; 
   d="scan'208";a="25628727"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Feb 2024 07:06:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,185,1705392000"; 
   d="scan'208";a="6291475"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 25 Feb 2024 07:06:32 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1reG5G-0009a4-21;
	Sun, 25 Feb 2024 15:06:30 +0000
Date: Sun, 25 Feb 2024 23:05:46 +0800
From: kernel test robot <lkp@intel.com>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [wens:mtk-wip 31/52] drivers/gpu/drm/drm_mipi_dsi.c:1421:56: error:
 'mipi_dsi_of_notifier' undeclared
Message-ID: <202402252241.NfdO6aWr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/wens/linux.git mtk-wip
head:   17556f9c0c99f9bc7a5217b15d9ac204301317e8
commit: f1ca288bbc7fd436be87f32f0c7863489d92b982 [31/52] drm/mipi-dsi: Add OF notifier handler
config: i386-randconfig-004-20240225 (https://download.01.org/0day-ci/archive/20240225/202402252241.NfdO6aWr-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240225/202402252241.NfdO6aWr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402252241.NfdO6aWr-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/x86/include/asm/bug.h:87,
                    from include/linux/bug.h:5,
                    from include/linux/jump_label.h:256,
                    from include/linux/static_key.h:1,
                    from arch/x86/include/asm/nospec-branch.h:6,
                    from arch/x86/include/asm/paravirt_types.h:12,
                    from arch/x86/include/asm/ptrace.h:175,
                    from arch/x86/include/asm/math_emu.h:5,
                    from arch/x86/include/asm/processor.h:13,
                    from include/linux/sched.h:13,
                    from include/linux/ratelimit.h:6,
                    from include/linux/dev_printk.h:16,
                    from include/linux/device.h:15,
                    from drivers/gpu/drm/drm_mipi_dsi.c:28:
   drivers/gpu/drm/drm_mipi_dsi.c: In function 'mipi_dsi_bus_init':
>> drivers/gpu/drm/drm_mipi_dsi.c:1421:56: error: 'mipi_dsi_of_notifier' undeclared (first use in this function)
    1421 |                 WARN_ON(of_reconfig_notifier_register(&mipi_dsi_of_notifier));
         |                                                        ^~~~~~~~~~~~~~~~~~~~
   include/asm-generic/bug.h:123:32: note: in definition of macro 'WARN_ON'
     123 |         int __ret_warn_on = !!(condition);                              \
         |                                ^~~~~~~~~
   drivers/gpu/drm/drm_mipi_dsi.c:1421:56: note: each undeclared identifier is reported only once for each function it appears in
    1421 |                 WARN_ON(of_reconfig_notifier_register(&mipi_dsi_of_notifier));
         |                                                        ^~~~~~~~~~~~~~~~~~~~
   include/asm-generic/bug.h:123:32: note: in definition of macro 'WARN_ON'
     123 |         int __ret_warn_on = !!(condition);                              \
         |                                ^~~~~~~~~


vim +/mipi_dsi_of_notifier +1421 drivers/gpu/drm/drm_mipi_dsi.c

  1417	
  1418	static int __init mipi_dsi_bus_init(void)
  1419	{
  1420		if (IS_ENABLED(CONFIG_OF_DYNAMIC))
> 1421			WARN_ON(of_reconfig_notifier_register(&mipi_dsi_of_notifier));
  1422		return bus_register(&mipi_dsi_bus_type);
  1423	}
  1424	postcore_initcall(mipi_dsi_bus_init);
  1425	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
