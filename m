Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B0C9172773
	for <oe-kbuild-all@lists.linux.dev>; Tue, 10 Sep 2024 07:37:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725953881; cv=none; b=VnuatX8PNSl1w6C0gTdIADlFEN5vWTv3hHAa8ckCr8Zab4GeThjCULIyYay0D2w1GjkQI1BqY/BCwfV01flzwMTgF7KxcsZ1pqBkGvXFaxvfuJdkP3qLtb8IFDlFIm8DKFexujnVMGla/Zz2MMxYXB/80rL7wc7rqJ2YkIVEqw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725953881; c=relaxed/simple;
	bh=cIm4EG22ri2kg4QUXBXAzEfd86m9qdsB/JRvcnRff+0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NnW5tfGhkiHTL023220gPgLtCjABzPFgbOFweH9pJtkwkL2WEptHl7ENldGWOFaOAyek1gOun900NCiVEecc8GT1PN6hJhwtllzhmw6F0fgM1P8gqWItEgO+zChvyTJ4dcofxow+82cEApc3WLEfm8Fj/10dpvpMCFdTyjCDVsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WFiSss6X; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WFiSss6X"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725953880; x=1757489880;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cIm4EG22ri2kg4QUXBXAzEfd86m9qdsB/JRvcnRff+0=;
  b=WFiSss6XDUQ9fBA3+Oew3GwGQ6wjsn4mHq0FSPRYi70BE5Uhpuw5t4pb
   Hl3OjieugTLlBWzTSQQklm+80ClutPB/uXY9UeR6hjinvumigP6bE1Yi+
   66lpeUnN5W1eGt2ESiI3WebgdK0pGPEpdTqtP75CBPFrav8/5v+go1Map
   LnU7Gd+F7MEl6IMjvxsAb/N6sSQ1ZVLPykSRB52USg6x4FlxVsZe/Kkq1
   sNJVyRQ5fmX6EfOA4iqvi5MHeOHmXenNVh+Wg6y/fwMXFPoVhAYEO3RrP
   tZ/TYjtGhhzQc8pxkBkvlJ4MXo100Yf5SK+SDBjTaQWJeFU4PbG1wrfIE
   w==;
X-CSE-ConnectionGUID: QuMsitpjSi6f2W4XijtuZA==
X-CSE-MsgGUID: hNh/dQCASh2qT4tsSB4/7Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11190"; a="24184238"
X-IronPort-AV: E=Sophos;i="6.10,216,1719903600"; 
   d="scan'208";a="24184238"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2024 00:37:55 -0700
X-CSE-ConnectionGUID: Xy4LcKMvSt++5aZYXHPUhQ==
X-CSE-MsgGUID: fhSHQewWSLSOLiT13YEBvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,216,1719903600"; 
   d="scan'208";a="97758705"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 10 Sep 2024 00:37:55 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1snvRg-0000Eg-20;
	Tue, 10 Sep 2024 07:37:52 +0000
Date: Tue, 10 Sep 2024 15:37:20 +0800
From: kernel test robot <lkp@intel.com>
To: Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
	Pavel Machek <pavel@denx.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [cip:linux-5.10.y-cip 35/40] kismet: WARNING: unmet direct
 dependencies detected for VIDEO_RENESAS_VSP1 when selected by DRM_RZG2L_DU
Message-ID: <202409101559.6CtEve2D-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cip/linux-cip.git linux-5.10.y-cip
head:   a73978e16f87d704893e4b3a637be257420d43f3
commit: 92672773016c4c2910dabcba5ccba00c7dfdf789 [35/40] drm: renesas: Add RZ/G2L DU Support
config: nios2-kismet-CONFIG_VIDEO_RENESAS_VSP1-CONFIG_DRM_RZG2L_DU-0-0 (https://download.01.org/0day-ci/archive/20240910/202409101559.6CtEve2D-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20240910/202409101559.6CtEve2D-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409101559.6CtEve2D-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for VIDEO_RENESAS_VSP1 when selected by DRM_RZG2L_DU
   WARNING: unmet direct dependencies detected for VIDEO_RENESAS_VSP1
     Depends on [n]: MEDIA_SUPPORT [=n] && MEDIA_PLATFORM_SUPPORT [=n] && V4L_MEM2MEM_DRIVERS [=n] && VIDEO_V4L2 [=n] && (ARCH_RENESAS || COMPILE_TEST [=y]) && (!ARM64 && !VIDEO_RENESAS_FCP [=n] || VIDEO_RENESAS_FCP [=n])
     Selected by [y]:
     - DRM_RZG2L_DU [=y] && HAS_IOMEM [=y] && (ARCH_RZG2L [=n] || COMPILE_TEST [=y]) && DRM [=y] && OF [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
