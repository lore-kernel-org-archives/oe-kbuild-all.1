Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B86B28E09
	for <oe-kbuild-all@lists.linux.dev>; Mon, 19 Feb 2024 11:29:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708342148; cv=none; b=rOqpq4+G1Mi+Hnn3OpvsC83XUYA6SjJNv9+N2eyC4soFfsJhJIAko8tB0bGm7ris0/YzrCmpp6Fh34uFrPwbbd3pb/+rRA9tqEFUH7GsdmRIDmwGtqlzCH4KdNnNMUmdxDYH3DTuX38WIGOGYHxPrI5bHjsstln6kRQd/DfCnfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708342148; c=relaxed/simple;
	bh=feTIqTaQ3FXhm/+4gZSfAa81TYgNPqo+lXKxzysdnwI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uj06XCop7M1v10+jhrGrG6g3a+/M52bwf3LQOYVdoy79GQjgxfBcr1uHMHSZOcWov5WRCjXm+O2bLton7EKYijsbDELRxZL1vPQESxI31X+I6pyL2E6Ge/uc8TmiaDI/zEP2vEHHnW2w3rdQVpUT765yxhOqIj8rexZpymul9d8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hbF+o/Td; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hbF+o/Td"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708342143; x=1739878143;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=feTIqTaQ3FXhm/+4gZSfAa81TYgNPqo+lXKxzysdnwI=;
  b=hbF+o/TdsewiEAB/FdMpWR+l4zcB7daZx+fPx8lYFGI2GXllLaXhf2Y1
   LrU1RIMmgksiCh04XfmpVGhHau5FKm0A7GRYMiVAcEcLZJ4K5tluuJ85o
   yWJ/KFHx75XyQoSjiCkRe6uscVKC2Oe3KW4fm5CYcDNQ9aFpBdN/G0Kw0
   3zVwfpRofMszxM6lVb8F2SpFuFRtikg6M42JskMly3xORaE2LnCTqO64D
   ST/vxepHkGWoMoBs22fcT5gSY0mGGj19+CMZtJnbdQjJeue0bCZil81nC
   TZ6es84f2GnnAhFRrovfGLBXzrZ8bk5C5GJxFpP/r088d5YKyOen5NsVG
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10988"; a="2559737"
X-IronPort-AV: E=Sophos;i="6.06,170,1705392000"; 
   d="scan'208";a="2559737"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Feb 2024 03:29:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,170,1705392000"; 
   d="scan'208";a="4429168"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 19 Feb 2024 03:27:11 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rc1nh-0003jy-1k;
	Mon, 19 Feb 2024 11:27:09 +0000
Date: Mon, 19 Feb 2024 19:26:28 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:5.15-r2pro 30/100]
 drivers/net/dsa/rtl8367s_mdio.c:2407:36: warning: unused variable
 'rtl8367c_switch_ops'
Message-ID: <202402191955.W5p4gBYK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/frank-w/BPI-R2-4.14 5.15-r2pro
head:   b603f40b85f7cd8e92ed3ceefef5a0a3c4dec34b
commit: 61c9127c534ea93de8efcc65c109cf3ecf6c6415 [30/100] net: add rtl8367 driver prepared for dsa
config: hexagon-allyesconfig (https://download.01.org/0day-ci/archive/20240219/202402191955.W5p4gBYK-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 36adfec155de366d722f2bac8ff9162289dcf06c)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240219/202402191955.W5p4gBYK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402191955.W5p4gBYK-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/dsa/rtl8367s_mdio.c:2407:36: warning: unused variable 'rtl8367c_switch_ops' [-Wunused-const-variable]
    2407 | static const struct dsa_switch_ops rtl8367c_switch_ops = {
         |                                    ^~~~~~~~~~~~~~~~~~~
   1 warning generated.


vim +/rtl8367c_switch_ops +2407 drivers/net/dsa/rtl8367s_mdio.c

  2406	
> 2407	static const struct dsa_switch_ops rtl8367c_switch_ops = {
  2408		.get_tag_protocol = rtl8367c_get_tag_protocol,
  2409		.setup = rtl8367c_setup,
  2410	/*	.phylink_mac_link_up = rtl8367c_mac_link_up,
  2411		.phylink_mac_link_down = rtl8367c_mac_link_down,
  2412		.get_strings = rtl8367c_get_strings,
  2413		.get_ethtool_stats = rtl8367c_get_ethtool_stats,
  2414		.get_sset_count = rtl8367c_get_sset_count,
  2415		.port_vlan_filtering = rtl8367c_vlan_filtering,
  2416		.port_vlan_add = rtl8367c_vlan_add,
  2417		.port_vlan_del = rtl8367c_vlan_del,
  2418		.port_enable = rtl8367c_port_enable,
  2419		.port_disable = rtl8367c_port_disable,
  2420		.port_change_mtu = rtl8367c_change_mtu,
  2421		.port_max_mtu = rtl8367c_max_mtu,*/
  2422	};
  2423	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
