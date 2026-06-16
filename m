Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E0423EAC65
	for <oe-kbuild-all@lists.linux.dev>; Tue, 16 Jun 2026 06:34:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781591688; cv=none; b=hZHqMmJRRF8e3PaXFQ54o2ErifF0ZYj2EA2ESvcxLccPyuivhBKE04Wm7LV/eh+yjYxkO7hv4AxOMQMHUvror0Dq9grKKPLIbasSRb0Qopu/KCNoFg5qw7W10aE/RPhRuVXk5brH/1h3CH+AYRBok+RFm+puZ/GuI4JQLB9w0zk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781591688; c=relaxed/simple;
	bh=sHzpMcZaCgVHkg5llPtPmfPdPmYnzfSp18tpEqJRUEo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=EEna1gKKclLXIZqSStJDDeSEoUD7ZMjfXAze83ZmS0qfOqRU2hi/oUFmzHNe6E0OR8pKnCLCH8pk/OgC7GTsJ55nWz3rLPllRAnb5DrhWvGb73rslHotj+2t10AGwO6NbbxpzPqexYzcSoCezTxtOGsADGQMWEAC1xZwmKbAEjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hopEXOL8; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hopEXOL8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781591685; x=1813127685;
  h=date:from:to:cc:subject:message-id;
  bh=sHzpMcZaCgVHkg5llPtPmfPdPmYnzfSp18tpEqJRUEo=;
  b=hopEXOL8mDouv+Niw5dRV2/S7LX9nZxGkmb2Ba3mdS9+IA2J/Z4lPXw0
   HvDAN1NzTZIZrvlvo1rsdSXJqQG8lUAukEiE3++fojARhz/IRvIgK6Vqg
   zlTkfzD/xn29c0IW3u/i8z+UXPXuPHdCsF4yY60/SW4d/wTeQi8hol205
   YMYqY/wCV5f6fkwaYN6KyOkQ3zMCEMYf+th3auqiB1+Rgt0R2a8iq1LeD
   FdbRgy1ghUa1KGycDrMFnNcitVFzZdvB9SA6ABWG/ezXQ2/nqS4RG6of5
   gQNaiDORvVRoFx36jpyqTGUuFFPSestnrn2ASNRM9w57nBs2b7m87r4I+
   Q==;
X-CSE-ConnectionGUID: X0PYGF+oQ9mPwEyvpDDnUQ==
X-CSE-MsgGUID: LBP/8PrhTGuyGNdzRr6rwQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11818"; a="93463554"
X-IronPort-AV: E=Sophos;i="6.24,207,1774335600"; 
   d="scan'208";a="93463554"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2026 23:34:44 -0700
X-CSE-ConnectionGUID: zIHdkkAtTgOHZXND9Hh+ug==
X-CSE-MsgGUID: SyL638UVRm+3a7tP20/vpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,207,1774335600"; 
   d="scan'208";a="271749721"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 15 Jun 2026 23:34:43 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wZNNg-00000000SoE-3ROk;
	Tue, 16 Jun 2026 06:34:40 +0000
Date: Tue, 16 Jun 2026 14:34:27 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:7.0-main 162/162]
 drivers/net/dsa/yt921x.c:2158:1: error: redefinition of 'dsa_bridge_ports'
Message-ID: <202606161424.ihEwSbaE-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/frank-w/BPI-R2-4.14 7.0-main
head:   5c1d29f589046df832c7a303b9df3afd038366df
commit: fb921d0bfad9b0ad308fb21eee08296f334dbd0d [162/162] net: dsa: add bridge member iteration macro
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20260616/202606161424.ihEwSbaE-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260616/202606161424.ihEwSbaE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606161424.ihEwSbaE-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/net/dsa/yt921x.c:2158:1: error: redefinition of 'dsa_bridge_ports'
    2158 | dsa_bridge_ports(struct dsa_switch *ds, const struct net_device *bdev)
         | ^~~~~~~~~~~~~~~~
   In file included from drivers/net/dsa/yt921x.c:24:
   include/net/dsa.h:841:1: note: previous definition of 'dsa_bridge_ports' with type 'u32(struct dsa_switch *, const struct net_device *)' {aka 'unsigned int(struct dsa_switch *, const struct net_device *)'}
     841 | dsa_bridge_ports(struct dsa_switch *ds, const struct net_device *bdev)
         | ^~~~~~~~~~~~~~~~


vim +/dsa_bridge_ports +2158 drivers/net/dsa/yt921x.c

186623f4aa724c David Yang 2025-10-17  2156  
186623f4aa724c David Yang 2025-10-17  2157  static u32
186623f4aa724c David Yang 2025-10-17 @2158  dsa_bridge_ports(struct dsa_switch *ds, const struct net_device *bdev)
186623f4aa724c David Yang 2025-10-17  2159  {
186623f4aa724c David Yang 2025-10-17  2160  	struct dsa_port *dp;
186623f4aa724c David Yang 2025-10-17  2161  	u32 mask = 0;
186623f4aa724c David Yang 2025-10-17  2162  
186623f4aa724c David Yang 2025-10-17  2163  	dsa_switch_for_each_user_port(dp, ds)
186623f4aa724c David Yang 2025-10-17  2164  		if (dsa_port_offloads_bridge_dev(dp, bdev))
186623f4aa724c David Yang 2025-10-17  2165  			mask |= BIT(dp->index);
186623f4aa724c David Yang 2025-10-17  2166  
186623f4aa724c David Yang 2025-10-17  2167  	return mask;
186623f4aa724c David Yang 2025-10-17  2168  }
186623f4aa724c David Yang 2025-10-17  2169  

:::::: The code at line 2158 was first introduced by commit
:::::: 186623f4aa724c46cbb4dbd5235cf6942215f5b5 net: dsa: yt921x: Add support for Motorcomm YT921x

:::::: TO: David Yang <mmyangfl@gmail.com>
:::::: CC: Jakub Kicinski <kuba@kernel.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
