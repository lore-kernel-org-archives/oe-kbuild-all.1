Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50E13EAD7
	for <oe-kbuild-all@lists.linux.dev>; Sun, 18 Feb 2024 21:41:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708292478; cv=none; b=ZVbv32jd4mmu10tUoTGwzRvBnwp2eEhJgXRlQmO5PDZ5soXcfbOZT/2M/jqj7njRWcuOJTs30fZhJbvS5Ls8/JUWmBRywfpBEAM4MoWQ2UnwRe9Ch+7g3XkAFPop8QAthU+0JUyoPxzkdlBXmwuWKkwF4mcsWMt1mlAh7JVyaLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708292478; c=relaxed/simple;
	bh=lmN2odfu1VUcObCXBlSxr2eBaTVA0LgKj2aEcgp15dY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YjlcDyPhb038d8/D+AztSXe4vlIbUk5FLRF53KwYYUt/zGWm2Jxp34tVgYc7437z88VnMrEDmkPy5pUyqry7grxLxjTEtsL+z6hJ5+AEuoLHI4nibxLXyTG6cPbA2RJU9oO++Ly4+hnZRvMzQU8WQiaGbHvBJtSlqb5MkjcVp7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=d8d4HvwV; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d8d4HvwV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708292476; x=1739828476;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lmN2odfu1VUcObCXBlSxr2eBaTVA0LgKj2aEcgp15dY=;
  b=d8d4HvwVV19EZ0vRW71+DjGUQkSIBWkowWrqe1eCKe0ZuaBl+5TkSScU
   UK1upJk/ySr/AcbyvyvicQ3MGTLdvwesIKBCQsSAkTwAGVX98bVXPV1Bo
   SpkyYtq0H1I7Q18mArzrl6K0K93dDdPFofI0/sri+QeWDpT58QuZPIrBd
   fKA+eiAsxttt23eZ0tnP5sM/MnVGYp25ez40s0OTshr4yC3dKNIm5mx+8
   5H+sUlRl3N1F/igUwO9YbEK/zDfMkhHYPgFTImjJxzaYQBmM3H4utMP/o
   nmQWt1WYIzlpJfGCnYYFgwejvTefyLS8I5XQlS+mfZaj4LVSGAYmUPPvx
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10988"; a="2226147"
X-IronPort-AV: E=Sophos;i="6.06,169,1705392000"; 
   d="scan'208";a="2226147"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Feb 2024 13:41:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,169,1705392000"; 
   d="scan'208";a="9006365"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 18 Feb 2024 13:41:15 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rbouD-0003Ji-1c;
	Sun, 18 Feb 2024 21:41:03 +0000
Date: Mon, 19 Feb 2024 05:40:47 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:5.15-r2pro 30/100]
 drivers/net/dsa/rtl8367s_mdio.c:2407:36: warning: 'rtl8367c_switch_ops'
 defined but not used
Message-ID: <202402190512.KVeBiULc-lkp@intel.com>
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
config: i386-randconfig-011-20240218 (https://download.01.org/0day-ci/archive/20240219/202402190512.KVeBiULc-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240219/202402190512.KVeBiULc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402190512.KVeBiULc-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/dsa/rtl8367s_mdio.c:2407:36: warning: 'rtl8367c_switch_ops' defined but not used [-Wunused-const-variable=]
    2407 | static const struct dsa_switch_ops rtl8367c_switch_ops = {
         |                                    ^~~~~~~~~~~~~~~~~~~


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
