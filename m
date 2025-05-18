Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90B223FC7
	for <oe-kbuild-all@lists.linux.dev>; Sun, 18 May 2025 09:01:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747558877; cv=none; b=av6IvneWSuv7sRhJSijy2fy/PUGa3oChlffQYrELe+WkRXb/6w51q/QNzaUHRX+ugOFRZsaN78Qy2BXjSnI7Uad45xsfzu3oZ+XluyHY1TKpczBInQ3SM5TNv20/EDZWCU1fvxAbThqVSq7y1P5i9p5/2gfvdnGopzo89obnp/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747558877; c=relaxed/simple;
	bh=gtRKWT0zweYeqx0aEB0dbYc18n01id9x7l/SZ2m/jag=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fhEN+20rmDITKRiWGHlJfq30XWmuxNm+BDI9qPpEKi/kiZdCB9rHQaRixTShp9vF1xs+oelBWg+GOnZJTvmNu5Cuhsr+OUivU38K8xRWFIuVILaj5KqgzS7XHBImTjMJme5N+Cx0MT4nfT4OE/pT/m8RTBkIcsJdoB4rtKPYdTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Pwj8A4mG; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Pwj8A4mG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747558876; x=1779094876;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gtRKWT0zweYeqx0aEB0dbYc18n01id9x7l/SZ2m/jag=;
  b=Pwj8A4mGFy1cfyxvSIm43zfX+66JUmVpjf7NXlkqKb7tMdt4o0/djbQe
   HwuMiTzrhQrRM9+VPY+nJtFBfaGbdGa3VIfqX0jvlfISusnUh9BPEzBgE
   DT26c9g52t5NkApEhNdxBkhPZU3aJa83I97TAIqXfsjbbMHyStV+IS2uO
   nyp3H2W4SiJQPyJ9vX3SMeobylVvN3E8ROsfoLvOcvV8YALqPk4KJHYCD
   V/eykH9BGaViF5aGVD3NCrJqUNOIEz2Zp2zqNyDZozTb5ECr+xOjeNc9/
   sQdXTS69CerdNBYbSwvpPaCewi150oYZ6iM6SdCl6p00g/ccB3m4tuGX/
   g==;
X-CSE-ConnectionGUID: s5wcwXceTDe7JThNZDHnaQ==
X-CSE-MsgGUID: yS1JmRCBSfyYYS/aicl5pg==
X-IronPort-AV: E=McAfee;i="6700,10204,11436"; a="49614764"
X-IronPort-AV: E=Sophos;i="6.15,298,1739865600"; 
   d="scan'208";a="49614764"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2025 02:01:15 -0700
X-CSE-ConnectionGUID: sgc0SVDRRH+WAkezeIEQAw==
X-CSE-MsgGUID: 9MeGAi5TRySnANgW9/cZLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,298,1739865600"; 
   d="scan'208";a="139984358"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 18 May 2025 02:01:13 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uGZtO-000Ki3-2A;
	Sun, 18 May 2025 09:01:10 +0000
Date: Sun, 18 May 2025 17:00:24 +0800
From: kernel test robot <lkp@intel.com>
To: Sven Peter <sven@svenpeter.dev>
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev, Janne Grunau <j@jannau.net>,
	Hector Martin <marcan@marcan.st>
Subject: [asahilinux:sven/atcphy 31/31] kismet: WARNING: unmet direct
 dependencies detected for TYPEC when selected by PHY_APPLE_ATC
Message-ID: <202505181636.TUP5o2Hi-lkp@intel.com>
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
config: alpha-kismet-CONFIG_TYPEC-CONFIG_PHY_APPLE_ATC-0-0 (https://download.01.org/0day-ci/archive/20250518/202505181636.TUP5o2Hi-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20250518/202505181636.TUP5o2Hi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505181636.TUP5o2Hi-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for TYPEC when selected by PHY_APPLE_ATC
   WARNING: unmet direct dependencies detected for TYPEC
     Depends on [n]: USB_SUPPORT [=n]
     Selected by [y]:
     - PHY_APPLE_ATC [=y] && (ARM64 && ARCH_APPLE || COMPILE_TEST [=y] && !GENERIC_ATOMIC64 [=n])
   
   WARNING: unmet direct dependencies detected for LEDS_EXPRESSWIRE
     Depends on [n]: GPIOLIB [=n] || NEW_LEDS [=n] && GPIOLIB [=n]
     Selected by [y]:
     - BACKLIGHT_KTD2801 [=y] && HAS_IOMEM [=y] && BACKLIGHT_CLASS_DEVICE [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
