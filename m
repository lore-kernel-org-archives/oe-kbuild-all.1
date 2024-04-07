Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5774F38F91
	for <oe-kbuild-all@lists.linux.dev>; Sun,  7 Apr 2024 14:07:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712498834; cv=none; b=MdOQIoJHgyon9mJhEBjpUqF+8wKJiNO1hsTGRNoAUG6YlOsxRgEH+jpbwQvk+EWh1+AdZ3Xpj3J6teqqPXyehlMhNeAsD7Iq1FA/8mrRXAtYe4vBYcxeJk6Wq+nLDepH/+h3VyBjGFrU3jHIaWencWg8DobttuhYYgVEAFs2o6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712498834; c=relaxed/simple;
	bh=zmHZijsXoW0UeIu9w55qYFnGEmkGaQ02GkVBia0qGFs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=deJ11ZuTQe1ekIijmcIgA8uTT6EbbQpBlZQbQ5PwH3dQa2vpLzTlnrSVXaOQrowVKdqKG/RgFF1y4QTllRgKdaMsUpr7pn1L56Hnq/fKdxLFQUGUPXw23izn9Almhceo/shm+z9y/CC2XfrC8XtHJa62PjBl+4xthw7exQiAZJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UCMahcae; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UCMahcae"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712498832; x=1744034832;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zmHZijsXoW0UeIu9w55qYFnGEmkGaQ02GkVBia0qGFs=;
  b=UCMahcaeXaG6k2Du3hQxhjJ3JMB40jcZ3Trl79EG5/vzrxy9Z3H2E7Tg
   6sXuXiAzLVbx3X615FADmRG82TLMRThbc0BAqzgYx+vCmbpNgg7S2ZtEk
   nSW5ET7HLl2OvX5Hvd50qJhqDlGyCPWzWigg7Msd2d0INnbdh1BbPExCh
   7vo2DsE+rBaupejchahxBpoSXyrx9f4DcUTeT3krJZajxIb+gxnsQCnXB
   W/0EnKFge8gwSJuWSEfZ6+m6NZGDt0lVy48zTEs6R/Vdcm04OrXTR3SdO
   O288R+47rcs6OPlQpKAg0Ri6qkuz3yiqXj1Ub71cyCqd/itcutCMvrdbG
   g==;
X-CSE-ConnectionGUID: ipWcyg2KRpez2tmiDypNoA==
X-CSE-MsgGUID: YXvHRxO+TiahHc48kXrf+w==
X-IronPort-AV: E=McAfee;i="6600,9927,11037"; a="18918756"
X-IronPort-AV: E=Sophos;i="6.07,185,1708416000"; 
   d="scan'208";a="18918756"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2024 07:07:11 -0700
X-CSE-ConnectionGUID: Hu2jYbZCSPynutrBkYt+WA==
X-CSE-MsgGUID: vLm5mpFPThuQtWhbsu4VFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,185,1708416000"; 
   d="scan'208";a="24372880"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 07 Apr 2024 07:07:10 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rtTAq-0004Og-0m;
	Sun, 07 Apr 2024 14:07:08 +0000
Date: Sun, 7 Apr 2024 22:07:03 +0800
From: kernel test robot <lkp@intel.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev
Subject: [lunn:v6.8.0-net-next-mv88e6xxx-leds-v5 5/9] kismet: WARNING: unmet
 direct dependencies detected for LEDS_CLASS when selected by NETDEV_LEDS
Message-ID: <202404072205.vQzv9vZu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/lunn/linux.git v6.8.0-net-next-mv88e6xxx-leds-v5
head:   db5976dcfcee45b460fc59b10fc29abcfd9adb3d
commit: 9d7e7e8493bc0393f85b88e2b3b49d4b7cd02407 [5/9] net: Add helpers for netdev LEDs
config: alpha-kismet-CONFIG_LEDS_CLASS-CONFIG_NETDEV_LEDS-0-0 (https://download.01.org/0day-ci/archive/20240407/202404072205.vQzv9vZu-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20240407/202404072205.vQzv9vZu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404072205.vQzv9vZu-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for LEDS_CLASS when selected by NETDEV_LEDS
   
   WARNING: unmet direct dependencies detected for LEDS_CLASS
     Depends on [n]: NEW_LEDS [=n]
     Selected by [y]:
     - NETDEV_LEDS [=y] && NET [=y]
   
   WARNING: unmet direct dependencies detected for LEDS_TRIGGERS
     Depends on [n]: NEW_LEDS [=n] && LEDS_CLASS [=y]
     Selected by [y]:
     - NETDEV_LEDS [=y] && NET [=y]
     - MAC80211_LEDS [=y] && NET [=y] && WIRELESS [=y] && MAC80211 [=y] && (LEDS_CLASS [=y]=y || LEDS_CLASS [=y]=MAC80211 [=y])
   
   WARNING: unmet direct dependencies detected for LEDS_TRIGGER_NETDEV
     Depends on [n]: NEW_LEDS [=n] && LEDS_TRIGGERS [=y] && NET [=y]
     Selected by [y]:
     - NETDEV_LEDS [=y] && NET [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
