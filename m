Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D40C47BB15
	for <oe-kbuild-all@lists.linux.dev>; Tue, 17 Sep 2024 07:41:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726558862; cv=none; b=QLbC2Omf2+SMEMDq1HP6aC/Ugb7QGEO0wz7gUqcajI7hRdiZY8t9CJZVYkJqHrussaQg1fivN4EaXatTj90ZvWaUeeYR3cPtqUByr5M0QU+9K8K7JStCmugOJsRQJm+N/+n3UgeUy+7sE5xIzhGZQ/tcW6G05xuUhCWQ6vyLHaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726558862; c=relaxed/simple;
	bh=6EXyYp/QDGEcxrpibjyDNxUqKUhnN5v+wKYGqO9nzAk=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uS9Bu4j9jfEbX1SVI9WJX75zGRJiWNiQxruojDCdOQrwvkmSs8xueXUq2vRYteUnHglDqs1J3s0XO9OdD9/kKUUw3T4k5rppOJIjAQ4+zANYQeHS4ZkINsNeks/gXT5pUmavlV6tAipyWdP7czjXs0GioQJ0Mg1slz4YkqnNgVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VxcFSV1o; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VxcFSV1o"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726558862; x=1758094862;
  h=date:from:cc:subject:message-id:mime-version;
  bh=6EXyYp/QDGEcxrpibjyDNxUqKUhnN5v+wKYGqO9nzAk=;
  b=VxcFSV1owCyweKQTShQssCLiElJ9DqjVk25dEkJnB0D8WiQpQG0ast6H
   0phjaoU82SNe0vpfb3ePIPPcfIHI2m5kjU63ZOJggnJYsD8uL4olPsecy
   qMPomgRXN9YFk1wd+PGypQUOptUCeXkLw2OZggwIatDeC9f8PO5hdIUby
   qzvFZce6v3+h8ZEUghBbsuJ8J0y3iD0/MHCOGIj5sS/s5hSWrfHiZ/sp0
   +RGCzI2tZlKQQke58nMzLO2aWCcWr6IMYM8YG5Y25LLQFt/Z5B7abpLWT
   RWiix91hhgSFShKDNhNAopa6Y/QpbjdgDeEpy+Lw51kOS+n1gVmoEKwkP
   w==;
X-CSE-ConnectionGUID: uld4vZsnS72y86oLZCLauQ==
X-CSE-MsgGUID: QFOM86aKQIO/i6AceLhHhQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11197"; a="36754315"
X-IronPort-AV: E=Sophos;i="6.10,235,1719903600"; 
   d="scan'208";a="36754315"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2024 00:40:58 -0700
X-CSE-ConnectionGUID: z86rSEq3SWK067834oIEWQ==
X-CSE-MsgGUID: PjLmbRp8STyoyMORKZiObw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,235,1719903600"; 
   d="scan'208";a="68775759"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 17 Sep 2024 00:40:56 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sqSpS-000AwI-1i;
	Tue, 17 Sep 2024 07:40:54 +0000
Date: Tue, 17 Sep 2024 15:39:59 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, vigneshr@ti.com, nm@ti.com,
	Jai Luthra <j-luthra@ti.com>
Subject: [ti:ti-rt-linux-6.1.y 47/107] kismet: WARNING: unmet direct
 dependencies detected for OF_GPIO when selected by VIDEO_DS90UB953
Message-ID: <202409171543.zgyIg3j4-lkp@intel.com>
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
config: nios2-kismet-CONFIG_OF_GPIO-CONFIG_VIDEO_DS90UB953-0-0 (https://download.01.org/0day-ci/archive/20240917/202409171543.zgyIg3j4-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20240917/202409171543.zgyIg3j4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409171543.zgyIg3j4-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for OF_GPIO when selected by VIDEO_DS90UB953
   WARNING: unmet direct dependencies detected for OF_GPIO
     Depends on [n]: GPIOLIB [=n] && OF [=y] && HAS_IOMEM [=y]
     Selected by [y]:
     - VIDEO_DS90UB953 [=y] && MEDIA_SUPPORT [=y] && OF [=y] && I2C [=y] && VIDEO_DEV [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
