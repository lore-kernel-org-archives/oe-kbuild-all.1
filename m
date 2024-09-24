Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C84F4437C
	for <oe-kbuild-all@lists.linux.dev>; Tue, 24 Sep 2024 09:49:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727171355; cv=none; b=Hrf3RmM7N6JBZxE9UIsVILMqyGkaWZalmiG+/bjTV37RC/ZE3BOYgeirX6RYVYuGJJWwpcmTvcA+20My3+wFDWz+jJP7OWbukLSon5Ubxu7343wrYziWwBCR+G8pcu6LBZne7sk1UwfNLuO/JWhgZm+IBEr8XmwzOrX+h9cXKFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727171355; c=relaxed/simple;
	bh=nPNfuJT38aGRHih1Ev1m270gW+4pv+kew6rLQXk5CdE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TA8wS09spxdSQ9lRy0grWf3CG5QnP53i9p7JJ5WMbBHgx6YL1jQw2l3uB7n3209lSgfatLZLjnE5TsfTbam/WIRGOxOHFRKUob7zxYi47pYes05hU1hq1POtfFCetOspl0hEBc3fLSQHwFov/UV0tdzg9WnREkXsJBJb/4tM40w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=epIwvLlZ; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="epIwvLlZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727171353; x=1758707353;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nPNfuJT38aGRHih1Ev1m270gW+4pv+kew6rLQXk5CdE=;
  b=epIwvLlZjWwYFI5NZOISeKBPcwLzAdH4jmSsQDWbBkrDd312Ns9XMEww
   go7/btcgj71zieFXcKSyP0ZUNx4izriqyO31ihxR6Yab0B2vNgZRS37Tg
   4sbQ1iQDfvpMqUYc4YLQzGeZheXQ3bJKItUgWFMpK78sDbPutSO6CAXyT
   QvJxU1Tw1sKTpjcZOetrxi/vxPuzXuzUeea+ldJi6HyKOQu+53h4MVGGZ
   gTspb0JRkL32U/rVlitn31hBQXRmACrJek6RANyq4/C4/SRXYKG/vFVNb
   8lbVK4LQtsSpB00qQ63EUSLr574YJDusF7XZE3bB6chrOK+Q4AxRrc7e7
   A==;
X-CSE-ConnectionGUID: ig/9x2oeSZiD0zfcBqH+Mg==
X-CSE-MsgGUID: NRj4C+AZSE+N5v7nblj3rw==
X-IronPort-AV: E=McAfee;i="6700,10204,11204"; a="37530865"
X-IronPort-AV: E=Sophos;i="6.10,254,1719903600"; 
   d="scan'208";a="37530865"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2024 02:49:12 -0700
X-CSE-ConnectionGUID: C5DjF86cSq+QTMWETvO+sA==
X-CSE-MsgGUID: l0RSbZFoTqWN6GMu0waFWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,254,1719903600"; 
   d="scan'208";a="71689097"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 24 Sep 2024 02:49:11 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1st2AP-000ICa-0L;
	Tue, 24 Sep 2024 09:49:09 +0000
Date: Tue, 24 Sep 2024 17:48:38 +0800
From: kernel test robot <lkp@intel.com>
To: Sven Peter <sven@svenpeter.dev>
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev, Janne Grunau <j@jannau.net>
Subject: [asahilinux:bits/170-atcphy 4/15] kismet: WARNING: unmet direct
 dependencies detected for TYPEC when selected by PHY_APPLE_ATC
Message-ID: <202409241751.rTk3xV6m-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux bits/170-atcphy
head:   7b0bef813938d897023b01980790fe7ea308a39f
commit: 4f5b8aa35e68a33a1d20b6ce62014794768af7ad [4/15] WIP: phy: apple: Add Apple Type-C PHY
config: arm64-kismet-CONFIG_TYPEC-CONFIG_PHY_APPLE_ATC-0-0 (https://download.01.org/0day-ci/archive/20240924/202409241751.rTk3xV6m-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20240924/202409241751.rTk3xV6m-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409241751.rTk3xV6m-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for TYPEC when selected by PHY_APPLE_ATC
   WARNING: unmet direct dependencies detected for TYPEC
     Depends on [n]: USB_SUPPORT [=n]
     Selected by [y]:
     - PHY_APPLE_ATC [=y] && (ARCH_APPLE [=y] || COMPILE_TEST [=y])

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
