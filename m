Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55AC61B85DD
	for <oe-kbuild-all@lists.linux.dev>; Tue, 24 Sep 2024 13:04:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727183062; cv=none; b=GSzro6pylJXAzc/Sy8HtK0w7gAjOF5BBHqIi/gu2Q0wB/CE5RzQfGpx8bM5x9dCBZVFRwjbrwR/JctcHFtuNPidXsAQ137ziuOKXqy+WKen1b6ouSHOE74gjaoCiWPaXfiuQvp3ubmEntglKvK4V0JahBaM7R5gMQwt6jVFhTqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727183062; c=relaxed/simple;
	bh=MDGOwmRxe+BKh5k0ZTZxHqVfgm69c/6hW9gXgal1Ytk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kL+C2mGz77u/O9min+HbXWzoYh//xeoGGOJH5p+QDgYXG/Zx8eH0s4F0bx0wsryhggCvxHxaCSYCPf2w9TNIpSGQ4krLoWCReGFdRXMQJMNlyul190xycFeoNVWB2INmH7To3qP0/WJJQUAqgLs7uDxEvjg63UIF2JxC51CyNUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=a5fHilww; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="a5fHilww"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727183061; x=1758719061;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MDGOwmRxe+BKh5k0ZTZxHqVfgm69c/6hW9gXgal1Ytk=;
  b=a5fHilww4BIjFidBcawbaS1sjbZVRnuveWtpTbUl1VL227WSAG6C/B1q
   aggR4Eyq3TBKcDPyr3wqCLCkJ693S1kHW85zVMSWZXwrQBm54FHltCEO0
   t7/h/iMJiQsJeJK1bAOifGsNL96Wu0YM+SvDzW/ACMDyr0CnOShhWAHED
   eTTOhbCAZvZ8JVuuenVbcca+JaMoeAE+VBi55sxSuSt1OL+6ML5MMRIJj
   KLtvnuZ369yo8CRL532WbwJINWh0QjZbr2NNOVyECN4v4GBzQr+vgQroY
   1Z1UCrV8Tx3+AnfUez92I6DGGmZeZ9fiX7aFZkBXHFBhMoyTjlOSIDshT
   w==;
X-CSE-ConnectionGUID: SgWLfSTOQc+8jS0NYKAyCg==
X-CSE-MsgGUID: /N8jpaPoS6KV3juNtcmMUg==
X-IronPort-AV: E=McAfee;i="6700,10204,11205"; a="26270433"
X-IronPort-AV: E=Sophos;i="6.10,254,1719903600"; 
   d="scan'208";a="26270433"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2024 06:04:20 -0700
X-CSE-ConnectionGUID: qVctR/hoSIyIXg9xtUO7SQ==
X-CSE-MsgGUID: SFg6fpxvRQijgtOtg92rNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,254,1719903600"; 
   d="scan'208";a="75513150"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 24 Sep 2024 06:04:18 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1st5DE-000IO5-0G;
	Tue, 24 Sep 2024 13:04:16 +0000
Date: Tue, 24 Sep 2024 21:03:22 +0800
From: kernel test robot <lkp@intel.com>
To: Sven Peter <sven@svenpeter.dev>
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev, Janne Grunau <j@jannau.net>
Subject: [asahilinux:bits/170-atcphy 4/15] kismet: WARNING: unmet direct
 dependencies detected for USB_COMMON when selected by EXTCON_RTK_TYPE_C
Message-ID: <202409242031.Lht32IGc-lkp@intel.com>
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
config: arm64-kismet-CONFIG_USB_COMMON-CONFIG_EXTCON_RTK_TYPE_C-0-0 (https://download.01.org/0day-ci/archive/20240924/202409242031.Lht32IGc-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20240924/202409242031.Lht32IGc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409242031.Lht32IGc-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for USB_COMMON when selected by EXTCON_RTK_TYPE_C
   WARNING: unmet direct dependencies detected for TYPEC
     Depends on [n]: USB_SUPPORT [=n]
     Selected by [y]:
     - PHY_APPLE_ATC [=y] && (ARCH_APPLE [=y] || COMPILE_TEST [=n])
   
   WARNING: unmet direct dependencies detected for USB_COMMON
     Depends on [n]: USB_SUPPORT [=n]
     Selected by [y]:
     - EXTCON_RTK_TYPE_C [=y] && EXTCON [=y] && (ARCH_REALTEK [=y] || COMPILE_TEST [=n]) && TYPEC [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
