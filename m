Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5134C24C065
	for <oe-kbuild-all@lists.linux.dev>; Thu,  3 Apr 2025 14:30:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743690620; cv=none; b=MGXAybrdtmWFitZ9gVgwKFWi6QA5kAl0viQM+T+gzcrpCszz4YS5d66xHTjmjiz6PC97t7+PGUttCyz8reAAVkuC/XVhsDCBc1jwsy0rrSV3RoMHh8zL/uhmG7V1Ee03OeumvGaoKffJALmlxivgcrw7/cNWHU2fH2fNwlVC1rQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743690620; c=relaxed/simple;
	bh=BzqDbzL3N2JTY1YdRxYA/lxfHuNfU1vjDhwxUymR8QQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kWPNXYog70OuueMte/d9QCXCWPjL9FnJ0V7kOs9i5Ca3EuwjdWo4mMsUCNS97lSmtzHuaIyIhawJigE9Oa9kZ2nZFplA7eSlQRozY+/IHHNeon03yIPA7jz3lAxyVGssdFxD3yfcFJGXF2vTQ6PYYpmwF95d3vCSe2f48RdBw4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jFuPBmRA; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jFuPBmRA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743690619; x=1775226619;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BzqDbzL3N2JTY1YdRxYA/lxfHuNfU1vjDhwxUymR8QQ=;
  b=jFuPBmRAE5B3WQ8bNXDuqIUqBQYxQUlWg0kpsQcEUBqFCv3D0cZ2/xe2
   y+mNKbJqwypp3E87ezQbgZ2lDhBzSe9tLkgqrmTwBQ3qDKf2/E2HA+WI+
   q0HXb542bNmb1f8s0sUxvfvJRQaMyvNSyWEBlexBRZlwzZ4pw3Jf3F36p
   8AfbNMuv7xqz6JCfEOIi0xdJdispKowTmn2yD7aNvWriYrWZV6uL63BcU
   MhdqDI645qmNCXSoPRSCrLeiSmhdTcLwvk0nZksmhm7BPmdxi/knKrdWs
   FfrsZyVfG0TtgHKel24ybP9swlS6Tl/NGf8ZjY8VfXAsg6wy5Ovv23tF4
   A==;
X-CSE-ConnectionGUID: hZXr3nzIRmyec6y9gkPK2Q==
X-CSE-MsgGUID: Gk2ed6x1Rlen7zWOZNKtvw==
X-IronPort-AV: E=McAfee;i="6700,10204,11393"; a="45015236"
X-IronPort-AV: E=Sophos;i="6.15,184,1739865600"; 
   d="scan'208";a="45015236"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2025 07:30:18 -0700
X-CSE-ConnectionGUID: CgwFmXZuQKavCZ8UnihXXQ==
X-CSE-MsgGUID: delFO/jvQ+yumMxTJHrQ1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,184,1739865600"; 
   d="scan'208";a="131738205"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 03 Apr 2025 07:30:17 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u0LaA-0000Sl-2K;
	Thu, 03 Apr 2025 14:30:14 +0000
Date: Thu, 3 Apr 2025 22:29:28 +0800
From: kernel test robot <lkp@intel.com>
To: Lukas Wunner <lukas@wunner.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [l1k:pci-for-6.16 1/5] pciehp_hpc.o:undefined reference to
 `pciehp_device_replaced'
Message-ID: <202504032255.N6ptuCNG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/l1k/linux pci-for-6.16
head:   4f83ba128195bb7ed76b77242d5a7ab4ff67df6c
commit: f810838c4b0d9ecd141d7d739003bfab6d8b4661 [1/5] PCI: pciehp: Ignore Presence Detect Changed caused by DPC
config: microblaze-allyesconfig (https://download.01.org/0day-ci/archive/20250403/202504032255.N6ptuCNG-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250403/202504032255.N6ptuCNG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504032255.N6ptuCNG-lkp@intel.com/

All errors (new ones prefixed by >>):

   microblaze-linux-ld: drivers/gpu/drm/xe/xe_migrate.o: in function `xe_migrate_vram':
   .tmp_gl_xe_migrate.o:(.text+0x3cb8): undefined reference to `__udivdi3'
   microblaze-linux-ld: drivers/pci/hotplug/pciehp_hpc.o: in function `pciehp_ist':
>> pciehp_hpc.o:(.text+0x16a0): undefined reference to `pciehp_device_replaced'
   microblaze-linux-ld: drivers/net/wireless/intel/iwlwifi/mld/mac80211.o: in function `iwl_mld_mac80211_stop':
   mac80211.o:(.text+0x2de8): undefined reference to `iwl_mld_no_wowlan_suspend'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
