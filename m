Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9C7C1531DB
	for <oe-kbuild-all@lists.linux.dev>; Sun, 18 May 2025 10:03:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747562601; cv=none; b=sAd9i/CKRgdD/DHKut6AWELfNMv8kFosl23K19ta0JHDEruaZSVwXe85Dsb1LZXO9daRgW9WfxmOM36CMp93J74YHgyO6s36HAS4c7hsSphGyIUb9+uBCu4F8wE+/K7Kt3uDn5vnq1swtSxvPRA5PSGKKGRJpbM0QqIfJ0Ew/jI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747562601; c=relaxed/simple;
	bh=F/1G9bH3rOCarVDZzPbmDG5wnnV+mcIs+n+1bPjX4U4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=C0CKP0E7pW3oxBDih6llXYXCJJCNCIy2d1OxV31rc5yogtnnA4s84KwIAFgmvF0pFyXCaW/C/wW79S5LRJ5P3c0FR4g3F0F/GqPhqkNLU6yVE/R7WCZMvmi3F+NrJWVkewoJ3q5a0H+NCqgJey4rt1NXVDvtGnEMmGJ5EK7HHAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jP0EtULg; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jP0EtULg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747562599; x=1779098599;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=F/1G9bH3rOCarVDZzPbmDG5wnnV+mcIs+n+1bPjX4U4=;
  b=jP0EtULg07s0X2pEwLOqJoKIGuVwbvaA63tp1kXCEC/vTu3Fm7i+VKNA
   W2cOOaVM6iw11ijIiSkMoRFINAd18up8pJe/3T5iE/rdx1pUPQbE002FB
   M4eFNnZh6+jtLHUQ5sMMN5QBKHDPyH6w4vCJ71uhHhPK1CLe1cwwJl3BI
   QQ8ihQdzT057AJe/bpzsGWGlD9IBoO0vofeFjP8hZNV4sw3Ql0MkU68WM
   +dsStcxbZYLhy9+yEfktQdk6ZF5T8lT1S5ynrAvZSktQUcVV0Q+xNvvOX
   fyeeo6hULnTfV0uOeSbr1h83M9nU44PfgWN+cjwqcAbNXLf8a9wP5uq50
   Q==;
X-CSE-ConnectionGUID: m4gS8HvmRIWlwGq4K49LWw==
X-CSE-MsgGUID: MkLdPc3ySZ6Rg8qKvvfuHQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11436"; a="48729094"
X-IronPort-AV: E=Sophos;i="6.15,298,1739865600"; 
   d="scan'208";a="48729094"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2025 03:03:19 -0700
X-CSE-ConnectionGUID: E7MqPICIRTeTvCABmUBhuw==
X-CSE-MsgGUID: QlIlfoHbTwuctWbs0/FhBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,298,1739865600"; 
   d="scan'208";a="143976038"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 18 May 2025 03:03:17 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uGarT-000Kjn-1U;
	Sun, 18 May 2025 10:03:15 +0000
Date: Sun, 18 May 2025 18:02:26 +0800
From: kernel test robot <lkp@intel.com>
To: Sven Peter <sven@svenpeter.dev>
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev, Janne Grunau <j@jannau.net>,
	Hector Martin <marcan@marcan.st>
Subject: [asahilinux:sven/atcphy 31/31] kismet: WARNING: unmet direct
 dependencies detected for USB_COMMON when selected by EXTCON_RTK_TYPE_C
Message-ID: <202505181750.fKD05AlF-lkp@intel.com>
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
config: alpha-kismet-CONFIG_USB_COMMON-CONFIG_EXTCON_RTK_TYPE_C-0-0 (https://download.01.org/0day-ci/archive/20250518/202505181750.fKD05AlF-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20250518/202505181750.fKD05AlF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505181750.fKD05AlF-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for USB_COMMON when selected by EXTCON_RTK_TYPE_C
   WARNING: unmet direct dependencies detected for TYPEC
     Depends on [n]: USB_SUPPORT [=n]
     Selected by [y]:
     - PHY_APPLE_ATC [=y] && (ARM64 && ARCH_APPLE || COMPILE_TEST [=y] && !GENERIC_ATOMIC64 [=n])
   
   WARNING: unmet direct dependencies detected for USB_COMMON
     Depends on [n]: USB_SUPPORT [=n]
     Selected by [y]:
     - EXTCON_RTK_TYPE_C [=y] && EXTCON [=y] && (ARCH_REALTEK || COMPILE_TEST [=y]) && TYPEC [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
