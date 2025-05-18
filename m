Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3EADBE49
	for <oe-kbuild-all@lists.linux.dev>; Sun, 18 May 2025 12:28:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747571311; cv=none; b=SJ5q8E15KPkZII/FtaEIfNQGQvY/EljZfNZkpnZSvq61SFW1wKBIv2ol477wtEzbmjyithaLqJrsOhnzx3tXwMJwW3KVnU2570D6R48F+4RbJMjWf7QT6Klp89vK1BlhxPOv5UVX+zFVOnhuwpyShFmqilDhMLagkfG72B2p664=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747571311; c=relaxed/simple;
	bh=5J0LCGPbqCCkyNRHELzwmnkrbe26dGiMfDwZBl+uC/c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VlsjSm2Ezqy1dBCSYRYuY1iJhXObnbJMDd7U31w7BEu3hIx1DUcHKOMwAqDxxBGK9WoWN2nmU5lPE3kMYM2J5E3Hg4EOZcpgdKe0oI6M9i0bAemvLHYpiCiLT2rwWaeWST+rauTr5T1poKUBFDNZ2eqTOmSR9hqTHFh3mHQ6rrc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=i9lAXcTG; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="i9lAXcTG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747571310; x=1779107310;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5J0LCGPbqCCkyNRHELzwmnkrbe26dGiMfDwZBl+uC/c=;
  b=i9lAXcTG306bCoyQY0CM0pXTF2DZriOmobnAuVJUafZ1YQ4BnPi0bM8g
   ys8f3xkUpCM0sX/V4T7twnVV01CCua9kvQpkHQg1dkZyztRD7zrI4Zdc3
   B1NHamhUFawYtn88E3QVpxRVDmwG89h/7i5v04t2pputraWcCrEq045qK
   wnFyoOF2kD4JS7b6FyKtAKfpSQog5d3VROAHoDOVu9Z14SgBMu62zR2yp
   V4RvYSP1MYEnn/+oJJrPEscdgVWjwyd8DoaMKFnZBD0gQ8rmF5ZPn+7mq
   AIw49SGysH8JoS5Of/dOa6CwjGXwEURoXyKQABGmDH7j8ABvIxed7dkPr
   w==;
X-CSE-ConnectionGUID: xL5IoGzIQlSNzYnsNUaUuA==
X-CSE-MsgGUID: 4SY5LcC0TleUYmbrT867Ng==
X-IronPort-AV: E=McAfee;i="6700,10204,11436"; a="71983612"
X-IronPort-AV: E=Sophos;i="6.15,298,1739865600"; 
   d="scan'208";a="71983612"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2025 05:28:29 -0700
X-CSE-ConnectionGUID: ARt5iqsUTaS+qRlzTe2YvA==
X-CSE-MsgGUID: l8Pr11wBQFmNCwf9u1xJyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,298,1739865600"; 
   d="scan'208";a="144246974"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 18 May 2025 05:28:27 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uGd7x-000KnH-0m;
	Sun, 18 May 2025 12:28:25 +0000
Date: Sun, 18 May 2025 20:27:49 +0800
From: kernel test robot <lkp@intel.com>
To: Sven Peter <sven@svenpeter.dev>
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev, Janne Grunau <j@jannau.net>,
	Hector Martin <marcan@marcan.st>
Subject: [asahilinux:sven/atcphy 31/31] kismet: WARNING: unmet direct
 dependencies detected for USB_COMMON when selected by PHY_ROCKCHIP_USBDP
Message-ID: <202505182021.UpdtJWqI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux sven/atcphy
head:   bb58cc6399a58218b8b5204a9fadf26f07c7f0f3
commit: bb58cc6399a58218b8b5204a9fadf26f07c7f0f3 [31/31] phy: apple: Add Apple Type-C PHY
config: arm64-kismet-CONFIG_USB_COMMON-CONFIG_PHY_ROCKCHIP_USBDP-0-0 (https://download.01.org/0day-ci/archive/20250518/202505182021.UpdtJWqI-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20250518/202505182021.UpdtJWqI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505182021.UpdtJWqI-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for USB_COMMON when selected by PHY_ROCKCHIP_USBDP
   WARNING: unmet direct dependencies detected for TYPEC
     Depends on [n]: USB_SUPPORT [=n]
     Selected by [y]:
     - PHY_APPLE_ATC [=y] && (ARM64 [=y] && ARCH_APPLE [=y] || COMPILE_TEST [=n] && !GENERIC_ATOMIC64 [=n])
   
   WARNING: unmet direct dependencies detected for USB_COMMON
     Depends on [n]: USB_SUPPORT [=n]
     Selected by [y]:
     - PHY_ROCKCHIP_USBDP [=y] && ARCH_ROCKCHIP [=y] && OF [=y] && TYPEC [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
