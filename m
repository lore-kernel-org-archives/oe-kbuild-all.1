Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 437885733F
	for <oe-kbuild-all@lists.linux.dev>; Mon, 18 Mar 2024 22:31:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710801080; cv=none; b=qD94bAME4JIggO/oLgVisYdq7s1dzZWQFxErk1jQFhkeTWzuoeCFGqb1HR5nYYe0UryDR97IT3ffg9X3ES5RrZmFga1GTU3rQJ1e79motu4ofg9BbVTtR1OGP1wZOWogb/WdsUfS5UloCQ7KuS1yHUVgL8RrGnfna+AyNNQTem8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710801080; c=relaxed/simple;
	bh=/7txIkoN4LVrjAFPGxOWm5hpgmFQVe+nGNIQ/0CkJBk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GFLDSrVTlnk6hQ9gsfjZ4n4XpmIOLh2dCpdDi8FdnIMdlH0bNdvvtNVbElzZzMI3RkGNyirb1OM23UFhCHSRGDOduCSaL7TBBUhdpljZtf3W4fDN2dHYuGgU7pG7Kyam3cvtGgls+MJKAYLVbL6kKoHW9R5PpnJZv+p/yaw1dxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QC3CgOYw; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QC3CgOYw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710801079; x=1742337079;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/7txIkoN4LVrjAFPGxOWm5hpgmFQVe+nGNIQ/0CkJBk=;
  b=QC3CgOYwp9B+/rJzb3eNoBmMQ8N3Ql9yAjBOdcffdn2ZMxbQ8QVLhpgY
   2H/UaDZggTUKRDhvl+yDq56uWFo3ktdguBoCd8cMr+vRD+8kdc82R+C2x
   osiviCsVz2xwawh2Ii5KIg0xJL5sfAqolUPieWnPdJGK2L8IuAlew2nwQ
   utZ44+1L3Mm4ZGka+wekzPYSK+wJspSb0em+sogzMD6dNaGNw6egjaCzJ
   pql7RehcVKluWpmExZXi7uwV6B8iZJMGkKj2z32PQ38KYK3FRe1/KyBAo
   JKtxLe0NXsRygsTzUXfboBtNA97hvFxK4vQSFzn1x6WsX2Z1BToLS9DQJ
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11017"; a="8586845"
X-IronPort-AV: E=Sophos;i="6.07,135,1708416000"; 
   d="scan'208";a="8586845"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2024 15:31:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,135,1708416000"; 
   d="scan'208";a="13987553"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 18 Mar 2024 15:31:16 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rmLVh-000HHR-0L;
	Mon, 18 Mar 2024 22:31:13 +0000
Date: Tue, 19 Mar 2024 06:30:56 +0800
From: kernel test robot <lkp@intel.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [lunn:v6.8.0-net-next-mv88e6xxx-leds-v4 3/8] undefined reference to
 `devm_led_classdev_register_ext'
Message-ID: <202403190635.OvpaFh1Y-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/lunn/linux.git v6.8.0-net-next-mv88e6xxx-leds-v4
head:   c85ce1c8e3761fc366533410f0318b01314ba819
commit: c4ae49b10529d66ed1aa9bf7c6e10ef95dfe7f75 [3/8] net: Add helpers for netdev LEDs
config: csky-allmodconfig (https://download.01.org/0day-ci/archive/20240319/202403190635.OvpaFh1Y-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240319/202403190635.OvpaFh1Y-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403190635.OvpaFh1Y-lkp@intel.com/

All errors (new ones prefixed by >>):

   csky-linux-ld: net/core/netdev-leds.o: in function `netdev_leds_setup':
>> (.text+0x1d6): undefined reference to `devm_led_classdev_register_ext'
>> csky-linux-ld: (.text+0x264): undefined reference to `devm_led_classdev_register_ext'
   csky-linux-ld: net/core/netdev-leds.o: in function `netdev_leds_teardown':
>> (.text+0x2be): undefined reference to `devm_led_classdev_unregister'
>> csky-linux-ld: (.text+0x2e0): undefined reference to `devm_led_classdev_unregister'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
