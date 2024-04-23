Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6803E1419B0
	for <oe-kbuild-all@lists.linux.dev>; Tue, 23 Apr 2024 19:45:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713901546; cv=none; b=FeNCi+WP5xz4o1u6X3CeVImfK1IN97R4pOdxWjvhdcv4Ky6u2lSibLtIAqndysQS4o7lSIbkNCckwgF/OcYBQbljXUDgay0czPTyXqeU7nsAHm480TpT0+KI5k6jM5RRJ8JwZvmrKsTpd81pD45288NSJm2oi2mQAC2sU4vCFCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713901546; c=relaxed/simple;
	bh=iKU1jCGWzyxZD4Qwzjlm4Hj0zesRkYx1r55kEBK9ZJc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SeSD3s4G1PWqzxiPJYmd0jhBVWjGaUU5VW4dbnQNUj9h9XBTnLN01pTedNaBBfNjtTIXQ8GhZJ1re4G8r/f8yh8ZdJ2TwS9JrI6bzTphf/1zJtvSMp0OhJL9O4Jpiw7cKXr4jwl1BImCeUN2UdUDI30wK2ZcFzCLH8aDEPeAOMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ys6+5+9w; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ys6+5+9w"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713901544; x=1745437544;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=iKU1jCGWzyxZD4Qwzjlm4Hj0zesRkYx1r55kEBK9ZJc=;
  b=Ys6+5+9wQcdsu3h0fWV40lgJsFOfajSjKaDpyEWONHW0Cj1ZruuB/GQt
   Xe3gisSqhSp8oJeGjlDKdZQ95sxmon2PEXoo5uQM3w0/kDMADz6Fvt0HF
   Hs3dA1tWd4QrZ4G2NVApmxOd+EgX8oyTXVc7i1PyrDbPQWfUTxT8DZrJM
   7cVYorL2uUN+tSRBSY+4IR2D8Yie5aM7Ck3WWpWv+XpGM0I6t/FJMrVAD
   zvY5b9oXad0LbW0LjRn9k1GEWGkXiIdV2OzGBxLzby46Fp9zKRMxEj+eW
   GtY+1eMhNU/6t3E8RSSP9arMuapDlsr/SpwWH5AjvHXXyxq+G0DDlV9vQ
   Q==;
X-CSE-ConnectionGUID: eyaU9bHqRaayMNxEwPzxjQ==
X-CSE-MsgGUID: q4S04oswRYKDNAokMqZXqw==
X-IronPort-AV: E=McAfee;i="6600,9927,11053"; a="20202043"
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; 
   d="scan'208";a="20202043"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2024 12:45:43 -0700
X-CSE-ConnectionGUID: NHEwvWRcTlWdl/D2P0ljow==
X-CSE-MsgGUID: o8WTCVHPRaip+J+MT/RB0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; 
   d="scan'208";a="25093867"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 23 Apr 2024 12:45:43 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rzM5E-0000Tc-1g;
	Tue, 23 Apr 2024 19:45:40 +0000
Date: Wed, 24 Apr 2024 03:45:33 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:6.9-net-next 6/7] drivers/net/phy/sfp.c:439:13:
 warning: 'sfp_quirk_oem_2_5g' defined but not used
Message-ID: <202404240321.V19g4DzY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/frank-w/BPI-R2-4.14 6.9-net-next
head:   aa0cee4614335bd18acf94e4624fcff4fbcda01e
commit: 85c3a9acf7e23178a11528e435026d28913a5ed0 [6/7] add phy detection for oem 2g5 sfp
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20240424/202404240321.V19g4DzY-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240424/202404240321.V19g4DzY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404240321.V19g4DzY-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/phy/sfp.c:439:13: warning: 'sfp_quirk_oem_2_5g' defined but not used [-Wunused-function]
     439 | static void sfp_quirk_oem_2_5g(const struct sfp_eeprom_id *id,
         |             ^~~~~~~~~~~~~~~~~~


vim +/sfp_quirk_oem_2_5g +439 drivers/net/phy/sfp.c

50e96acbe11667 Russell King (Oracle  2023-03-21  438) 
50e96acbe11667 Russell King (Oracle  2023-03-21 @439) static void sfp_quirk_oem_2_5g(const struct sfp_eeprom_id *id,
50e96acbe11667 Russell King (Oracle  2023-03-21  440) 			       unsigned long *modes,
50e96acbe11667 Russell King (Oracle  2023-03-21  441) 			       unsigned long *interfaces)
50e96acbe11667 Russell King (Oracle  2023-03-21  442) {
50e96acbe11667 Russell King (Oracle  2023-03-21  443) 	/* Copper 2.5G SFP */
50e96acbe11667 Russell King (Oracle  2023-03-21  444) 	linkmode_set_bit(ETHTOOL_LINK_MODE_2500baseT_Full_BIT, modes);
50e96acbe11667 Russell King (Oracle  2023-03-21  445) 	__set_bit(PHY_INTERFACE_MODE_2500BASEX, interfaces);
50e96acbe11667 Russell King (Oracle  2023-03-21  446) 	sfp_quirk_disable_autoneg(id, modes, interfaces);
50e96acbe11667 Russell King (Oracle  2023-03-21  447) }
50e96acbe11667 Russell King (Oracle  2023-03-21  448) 

:::::: The code at line 439 was first introduced by commit
:::::: 50e96acbe11667b6fe9d99e1348c6c224b2f11dd net: sfp: add quirk for 2.5G copper SFP

:::::: TO: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
:::::: CC: Jakub Kicinski <kuba@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
