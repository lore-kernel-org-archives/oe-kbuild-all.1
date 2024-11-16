Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56DC015E97
	for <oe-kbuild-all@lists.linux.dev>; Sat, 16 Nov 2024 21:37:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731793034; cv=none; b=m80pg7jHYrO3KFMNotrRtLDAfm86A9EJDn3i/scdVS71fWUYIIaPQc+WslC+VIcXUR8SDQiOOjjgLNCA53OWkjQQuLuGD5oknT2f+fTLZNiXB0z0lZnR5qi+10FrJQ9wAwaP5k3TKnebDCsXc7aMGM0TrTTtQFCV3wHexBbmYi4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731793034; c=relaxed/simple;
	bh=JxgGYR3MIbXDjyOCc18iCTSZqBPgzZWHG+GqWUWET8A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HtI0LXcSMMPwVo11l5I4pNyaxucCGmD8+s9AMOl7rAKi7KmL2AttKlx++Dc0PRt3PCBzjkOOsJtwt2Ia6if83WktCnAb0/ozKRzqdBpSxGhcUl/kPqOlW8ym/145Kd9fDBjLEy+9gGZ+GavdvscVDhNtyzaeqwHAs2UqrJcgEIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BDlsVKXC; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BDlsVKXC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731793032; x=1763329032;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JxgGYR3MIbXDjyOCc18iCTSZqBPgzZWHG+GqWUWET8A=;
  b=BDlsVKXCyVC8rGOaxT+9wM0Sd4yL1b1di6PDVifq6tv3hjtOzjmERSse
   6KIZle5UOKE6Sp+BJqohYyvMIUVkaOmHD4lRNnyPP9rp5pGLEpXTZfHPv
   Icf9b629T33Q3lDr921JnzlkTNUkbugD63c1v/wxGvh+GJUrQz3bPICcl
   lBDwzlT+kDhnzR12elopY86h5DjttK673Cv+Hew8gJthEM8PbDPZxaLX8
   /9KTxgS9GqF448mMEbVulAtGebf1Ddc1/dPLHAnAedR0rH8V3uzghG+9m
   LnYpgVNFJKWtEbVNZM/brh4Ye1Zf40ouyb1SG9Pk0VFdld+QBJxViWPur
   g==;
X-CSE-ConnectionGUID: wqiuGZLYRxG3KyOo9RYSqA==
X-CSE-MsgGUID: YCVncPj5R9m0JmZpX/v9Tw==
X-IronPort-AV: E=McAfee;i="6700,10204,11258"; a="19385229"
X-IronPort-AV: E=Sophos;i="6.12,160,1728975600"; 
   d="scan'208";a="19385229"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2024 13:37:11 -0800
X-CSE-ConnectionGUID: V0ZyLbkgTfORGcy7IbZDmw==
X-CSE-MsgGUID: 3+L43RkpSa+DBjFR0IP6Rw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,160,1728975600"; 
   d="scan'208";a="119803233"
Received: from lkp-server01.sh.intel.com (HELO 1e3cc1889ffb) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 16 Nov 2024 13:37:11 -0800
Received: from kbuild by 1e3cc1889ffb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tCQTc-00018H-1u;
	Sat, 16 Nov 2024 21:37:08 +0000
Date: Sun, 17 Nov 2024 05:36:37 +0800
From: kernel test robot <lkp@intel.com>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [paulmckrcu:dev.2024.11.11a 57/57] ERROR: modpost:
 "rcutorture_gather_gp_seqs" [kernel/rcu/rcutorture.ko] undefined!
Message-ID: <202411170515.xn5afSbv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/paulmckrcu/linux dev.2024.11.11a
head:   b97695352d2b790045081e2c9afe32736f5ae3d6
commit: b97695352d2b790045081e2c9afe32736f5ae3d6 [57/57] rcutorture: Include grace-period sequence numbers in failure/close-call
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20241117/202411170515.xn5afSbv-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241117/202411170515.xn5afSbv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411170515.xn5afSbv-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "rcutorture_gather_gp_seqs" [kernel/rcu/rcutorture.ko] undefined!
>> ERROR: modpost: "rcutorture_format_gp_seqs" [kernel/rcu/rcutorture.ko] undefined!
ERROR: modpost: "__clk_get_name" [drivers/phy/rockchip/phy-rockchip-samsung-hdptx.ko] undefined!
ERROR: modpost: "devm_of_clk_add_hw_provider" [drivers/phy/rockchip/phy-rockchip-samsung-hdptx.ko] undefined!
ERROR: modpost: "devm_clk_hw_register" [drivers/phy/rockchip/phy-rockchip-samsung-hdptx.ko] undefined!
ERROR: modpost: "of_clk_hw_simple_get" [drivers/phy/rockchip/phy-rockchip-samsung-hdptx.ko] undefined!
ERROR: modpost: "__delay" [drivers/net/mdio/mdio-cavium.ko] undefined!
ERROR: modpost: "devm_of_clk_add_hw_provider" [drivers/media/i2c/tc358746.ko] undefined!
ERROR: modpost: "devm_clk_hw_register" [drivers/media/i2c/tc358746.ko] undefined!
ERROR: modpost: "of_clk_hw_simple_get" [drivers/media/i2c/tc358746.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
