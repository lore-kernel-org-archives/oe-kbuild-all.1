Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F236D1474B0
	for <oe-kbuild-all@lists.linux.dev>; Mon, 13 May 2024 08:29:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715588958; cv=none; b=W1EmenX2jAxSs159ns4owPsVqfECf+vMzDvpsx+Vzh37SKmS1RI3N8IS7w7hHpqyuFfgVNx1arituwwhVfurFDg8vK/ezhaVnC5YsphFvW9FDKjsDtcCvwxe4BFt61AlJ/ZZXyspMsC/x78JP5LLet5lc2agdl/vnIBrAwGsIeI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715588958; c=relaxed/simple;
	bh=y13pr3dTl/fE5gpDqEzqXfpoOA1X56B8193Qog8D+0I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=c4lbKxjA4HDLsInhaDg3I0Nw8ij/ZdKXMtnLYSnovOB+dBun23byoLxwq1UsIrnruSt+5+bsu/P6jKOWr+UyeGcsZ4kJWv9tQ3EIw8W2rKNW2xAdaBAXAAHy+U5UACH8o25W8JYD+yHU7ruJLOphlNw0SVZot2pS8keICjlsM9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IY6QVY7/; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IY6QVY7/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715588958; x=1747124958;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=y13pr3dTl/fE5gpDqEzqXfpoOA1X56B8193Qog8D+0I=;
  b=IY6QVY7/fqSY+urACaseq+AjiO9EbFQkttJFimkHvnH0iAHoqly0/4vG
   qiUwtlDr1PXmr++JmQ241ylOKPrG3ZvR6mqB6AYlgtKUQ0l5AoimbS6r9
   GcAl3moUDwFR+1p+FkNRCHCe6Oi2V6Iiq2Yi4LtTKEwOWeTrtPdgOIqxr
   LNiqkWG0lz+Hhjztop6OGJxelgj0xqePzkYCI1RFFcxc57rIKr1O8i+T1
   /+qquHCM/PO6DRKRXi8EIzyHfhbNzV0MSDUQ2V83oVIIP6SZvMRjoKLqc
   B6BW2tgRy+kXJEAnDftGXUKZ7c6tXu7hggysmC4n2/Ui594Z9DvStUyPE
   g==;
X-CSE-ConnectionGUID: qjOhz8gqTG2lUyDNAe4y0g==
X-CSE-MsgGUID: AyyPfHnHSuaPVoUh1TNiAQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11071"; a="34021562"
X-IronPort-AV: E=Sophos;i="6.08,157,1712646000"; 
   d="scan'208";a="34021562"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2024 01:29:15 -0700
X-CSE-ConnectionGUID: H9QnbfksQsyQeKNdCbLIJw==
X-CSE-MsgGUID: ghYLyMbsQCOZEg+8BjOWMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,157,1712646000"; 
   d="scan'208";a="34959737"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 13 May 2024 01:29:14 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s6R3X-0009nL-1j;
	Mon, 13 May 2024 08:29:11 +0000
Date: Mon, 13 May 2024 16:29:05 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com,
	Guenter Roeck <groeck@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.1 99/106] kismet: WARNING: unmet direct
 dependencies detected for VIDEO_V4L2_SUBDEV_API when selected by
 VIDEO_MTK_ISP_71_CAMSYS
Message-ID: <202405131653.RN6VMl7N-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.1
head:   4caca2e86338fb0028244f751f859824629b3f21
commit: 3d4651aa212e1a671e15a4a8411b748bb70a8585 [99/106] CHROMIUM: media: platform: mediatek: isp: isp_7x camsys driver migration
config: arm64-kismet-CONFIG_VIDEO_V4L2_SUBDEV_API-CONFIG_VIDEO_MTK_ISP_71_CAMSYS-0-0 (https://download.01.org/0day-ci/archive/20240513/202405131653.RN6VMl7N-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20240513/202405131653.RN6VMl7N-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405131653.RN6VMl7N-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for VIDEO_V4L2_SUBDEV_API when selected by VIDEO_MTK_ISP_71_CAMSYS
   WARNING: unmet direct dependencies detected for MTK_SCP
     Depends on [n]: REMOTEPROC [=n] && (ARCH_MEDIATEK [=y] || COMPILE_TEST [=n])
     Selected by [y]:
     - VIDEO_MTK_ISP_71_CAMSYS [=y] && MEDIA_SUPPORT [=y] && MEDIA_PLATFORM_SUPPORT [=y] && MEDIA_PLATFORM_DRIVERS [=y] && ARCH_MEDIATEK [=y]
   
   WARNING: unmet direct dependencies detected for VIDEO_V4L2_SUBDEV_API
     Depends on [n]: MEDIA_SUPPORT [=y] && VIDEO_DEV [=n] && MEDIA_CONTROLLER [=n]
     Selected by [y]:
     - VIDEO_MTK_ISP_71_CAMSYS [=y] && MEDIA_SUPPORT [=y] && MEDIA_PLATFORM_SUPPORT [=y] && MEDIA_PLATFORM_DRIVERS [=y] && ARCH_MEDIATEK [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
