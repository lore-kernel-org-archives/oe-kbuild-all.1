Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E7AA1E493
	for <oe-kbuild-all@lists.linux.dev>; Mon, 13 May 2024 05:04:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715576701; cv=none; b=Ff1jheRjx2Ta22LAV9EICuKje30lVzHCSw6l7dzcl0fhhJUp0G6fQVLdEam6bvqu1VGLuXFbr3rRe5/fdaOrYQFP5AQKe7LfaclKf04bzPa+UgsOndAxEmPzsJc96xsruwWFBqUaIzqae6YdA1kX04Yvm3e7bWQGRpUZFz391W8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715576701; c=relaxed/simple;
	bh=mWdYiIxAsD/ctnkVDDJ2lk2EfECMlRM2mUFTPSLRnGc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qrXWhden+YXWnFe/dmU97IGnFgot7KJI1buAlPe/8EE/brkdU67yvd6Ta4l5c3+mTCVFFsoBY+Mn+dck7E9DsRaWclaINXn/SPHU7NZhME404ShVyK3HcRbP1K2JRGdcARihWRyBk1+vn6Abt6rG+iGBhDJ+C8OgppwOsiRbWAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nW5klho4; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nW5klho4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715576700; x=1747112700;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mWdYiIxAsD/ctnkVDDJ2lk2EfECMlRM2mUFTPSLRnGc=;
  b=nW5klho4AaYGsUrkj+nlZj0wY5p0gBAZN+BGR+RUknDdaMY8cSTk44h0
   hxw45Y9zpN8aKm3KiDW9ydchMNNLyPHC+ZB0QSmei91HtbtOTDR5vIckp
   GsJAG6niEpiTCXiWFQOTvlRB8LBOKvIETD8RfN5V8wqb79I94UR0z6csO
   4PhHM7RtpgyycjX0/QZ03tTxp3PdFwiGYR/a74qqO0UINQjZv0kIMCVut
   EVaP7MkfmVCSEqIBIAa1N6p6KLGtQ5uNxfqF/9NnuIZ3fGh2IvYg0mZV4
   Y0U2ko4eW6PIthgwZdJx2D8WIMHbiQuyegZp3Dy9mrVt3d4/ausbc/r0t
   g==;
X-CSE-ConnectionGUID: 4rw5KVpESZKZpxkZ0Q3OFg==
X-CSE-MsgGUID: PXtq+rl/RW+tx33hajPKHg==
X-IronPort-AV: E=McAfee;i="6600,9927,11071"; a="15303756"
X-IronPort-AV: E=Sophos;i="6.08,157,1712646000"; 
   d="scan'208";a="15303756"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2024 22:04:59 -0700
X-CSE-ConnectionGUID: GGxcW+7cQK6hPBM5h3TZsw==
X-CSE-MsgGUID: SUjFBu+uR/mF6Tv+f0ubDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,157,1712646000"; 
   d="scan'208";a="34774698"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 12 May 2024 22:04:58 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s6Nrs-0009Z9-0T;
	Mon, 13 May 2024 05:04:56 +0000
Date: Mon, 13 May 2024 13:04:50 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com,
	Guenter Roeck <groeck@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.1 101/106] kismet: WARNING: unmet direct
 dependencies detected for VIDEO_V4L2_SUBDEV_API when selected by
 VIDEO_MTK_ISP_71_IMGSYS
Message-ID: <202405131257.4SaGrQze-lkp@intel.com>
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
commit: 35d65c4423bf525d557b423789c0c3f3c41fa92c [101/106] CHROMIUM: media: platform: mediatek: isp: add IMGSYS driver
config: i386-kismet-CONFIG_VIDEO_V4L2_SUBDEV_API-CONFIG_VIDEO_MTK_ISP_71_IMGSYS-0-0 (https://download.01.org/0day-ci/archive/20240513/202405131257.4SaGrQze-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20240513/202405131257.4SaGrQze-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405131257.4SaGrQze-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for VIDEO_V4L2_SUBDEV_API when selected by VIDEO_MTK_ISP_71_IMGSYS
   WARNING: unmet direct dependencies detected for VIDEO_V4L2_SUBDEV_API
     Depends on [n]: MEDIA_SUPPORT [=y] && VIDEO_DEV [=n] && MEDIA_CONTROLLER [=y]
     Selected by [y]:
     - VIDEO_MTK_ISP_71_IMGSYS [=y] && MEDIA_SUPPORT [=y] && MEDIA_PLATFORM_SUPPORT [=y] && MEDIA_PLATFORM_DRIVERS [=y] && MTK_CMDQ [=y] && REMOTEPROC [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
