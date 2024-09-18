Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E50D23B0
	for <oe-kbuild-all@lists.linux.dev>; Wed, 18 Sep 2024 07:12:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726643524; cv=none; b=DdOj4BWHqMN7wMNQ+VaqGIXM3z6ZHcA0l/oXWRjHTSgUmhp128R+UmzLoX3VZFY19ZuFHUctorMTxBoZv93bIfo5gNykAf60ko5uG81B7+Tsve0gSmLarqvRuGt+Y/Twf5iCNuHicX9QxVZ4TJrwD/C1Cat9WTRR4A1qE7mM1jY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726643524; c=relaxed/simple;
	bh=fcN0EU12c41G+/4ifmWpyJ3QguD+P4ppsPcFlPufLcw=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=stmvtpioB/Yw/YmhPYLCt6+LJVSxfoXSBcQjU1WIrrxK6ZrQZbo59yXFIv2ADADtTtoa4qDStkiMak0JU04Kxlt+RoyHiWxZXwbfgLKDTI8cathVPAg4e+VMflXDF7Fieo48ahY3il76L6N9+Ef15EsCQJxpKJ9oZPziXA1yA+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=H8tMWJph; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H8tMWJph"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726643523; x=1758179523;
  h=date:from:cc:subject:message-id:mime-version;
  bh=fcN0EU12c41G+/4ifmWpyJ3QguD+P4ppsPcFlPufLcw=;
  b=H8tMWJpho75LdVtLYrLg04pLOfgJnx+EDaoHLfVP3WKKmSFQi/JjjUL6
   H1mXMzNM9RVzNjgLEudJsTwAdkQyi8XxSO1Tx4iYLkvwbkySfsYclfxYP
   /mJlZOyqtsuGYiOrkmk9JLRy8sU47muozJoRCSEQPTxI91JqrZ5DG25nH
   Ys8iuASKlBO23Hp8EfBc8bmPZWrGWZ4fUWqd+ZOHUFZ6/b1rxqt/fLkMc
   ti/RXbRhGN3OXQwuNZj1ZMcMSCiVGkCO//xJguJOQwogVl8VYFXv9neC8
   920RC8nUMWN4m9/JfckouAsiX+P3rMsl6tm1/RRsM9k4YwjXwgjBjnt0B
   A==;
X-CSE-ConnectionGUID: IOwSjTQtRpegzAN7IMyt/Q==
X-CSE-MsgGUID: gREbo32sTxOfGyCIjAdTbQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11198"; a="43057977"
X-IronPort-AV: E=Sophos;i="6.10,238,1719903600"; 
   d="scan'208";a="43057977"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2024 00:12:02 -0700
X-CSE-ConnectionGUID: xN+IvopqTDW7IhbN5EF7RQ==
X-CSE-MsgGUID: W+Yh5ooIRnWl+jO+v47yPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,238,1719903600"; 
   d="scan'208";a="69547362"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 18 Sep 2024 00:12:01 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sqor0-000BxO-1b;
	Wed, 18 Sep 2024 07:11:58 +0000
Date: Wed, 18 Sep 2024 15:10:58 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, vigneshr@ti.com, nm@ti.com,
	Jai Luthra <j-luthra@ti.com>
Subject: [ti:ti-rt-linux-6.1.y 47/107] kismet: WARNING: unmet direct
 dependencies detected for OF_GPIO when selected by VIDEO_DS90UB953
Message-ID: <202409181532.8651punV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git ti-rt-linux-6.1.y
head:   96b0ebd82722d16e9ab646cd3a73080e6f790747
commit: d1a221d48b45bc73a80c3e86a028dfe60f8a34b2 [47/107] media: i2c: add DS90UB953 driver
config: nios2-kismet-CONFIG_OF_GPIO-CONFIG_VIDEO_DS90UB953-0-0 (https://download.01.org/0day-ci/archive/20240918/202409181532.8651punV-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20240918/202409181532.8651punV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409181532.8651punV-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for OF_GPIO when selected by VIDEO_DS90UB953
   WARNING: unmet direct dependencies detected for OF_GPIO
     Depends on [n]: GPIOLIB [=n] && OF [=y] && HAS_IOMEM [=y]
     Selected by [y]:
     - VIDEO_DS90UB953 [=y] && MEDIA_SUPPORT [=y] && OF [=y] && I2C [=y] && VIDEO_DEV [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
