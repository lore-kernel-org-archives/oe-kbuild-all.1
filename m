Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4468763C7
	for <oe-kbuild-all@lists.linux.dev>; Mon, 13 May 2024 03:11:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715569919; cv=none; b=YJCYKgU97bILABkGfalU0FPNpRVReCK4G3HSMrWDvWsTKz+EHgWFojXeb9a1et7OGl7ZGSOtcYLYKYLvv05gBFIJNMGF+xwKluGKh96iWSMNbzYYbKWgV8UMBJBhbB5X+ZPbl3/j2A5h8m1X2Xo2L3Ajtg+0+665lSTLr3JVUnw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715569919; c=relaxed/simple;
	bh=o5bHHOAD3ysurrsJ6FSxunZ1IjBWWXH+8BUTXt3vroU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=h1G3ExMFNXiWBve3WcM/VmbCCM6FPpRY/06cwJdJ8G+dFmvDdpOx2Qgp/XVkZQZ7vIYFuuUyDbpo6cc4MbNHAJZRnKdru7rpmz+d0RrI4MfZygZQF8JlSOv0Pn8SMaQ50xaWQxFTcVnB+rTFKJcjZQEU2htKTqKsvARyp2qIAxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Jb4rUdNe; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Jb4rUdNe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715569917; x=1747105917;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=o5bHHOAD3ysurrsJ6FSxunZ1IjBWWXH+8BUTXt3vroU=;
  b=Jb4rUdNeEIasNJvrvP62nDxF9uNSPAUQrsIP9og9wB1r/YjNpFgVRv8w
   kY7WGk4QFo9VAoNiRzF6znsJu4n2jpEfd1BBYoq9jQu7GcjvXpIlBmA0E
   DsBd04AuMl4so0pOO5gOKzOzXSC49prhhPnKrZSVzTfAT9SUWcebeyQ2r
   DxZ5g8RW3h6f+f7Kl4U5QIyk5jZE7PZ4IV+kMeNRzX48GETm2MjvWLarb
   v02L3bC6et+Nzn4yDBtYsUWWFmSfdCoFYl6T5Ho+l93AvvFJX+zC+jR3b
   WSaZzRVdFK7/3drMU2kMxdnQlwbKOfU230tfRVNie81lxCL5mTnCSJIgW
   Q==;
X-CSE-ConnectionGUID: WFmWOBziTIOt2VlloE6tpQ==
X-CSE-MsgGUID: kCXEfEsHQPqUvilU6URKig==
X-IronPort-AV: E=McAfee;i="6600,9927,11071"; a="11349817"
X-IronPort-AV: E=Sophos;i="6.08,157,1712646000"; 
   d="scan'208";a="11349817"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2024 20:11:56 -0700
X-CSE-ConnectionGUID: g8BaUMTmTeaVb9nvB+m0Gg==
X-CSE-MsgGUID: XpHbnXZGSqiec1MjxfEuMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,157,1712646000"; 
   d="scan'208";a="30224526"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 12 May 2024 20:11:55 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s6M6T-0009TL-0Q;
	Mon, 13 May 2024 03:11:53 +0000
Date: Mon, 13 May 2024 11:11:21 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com,
	Guenter Roeck <groeck@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.1 99/106] kismet: WARNING: unmet direct
 dependencies detected for MTK_SCP when selected by VIDEO_MTK_ISP_71_CAMSYS
Message-ID: <202405131122.m2E0p9OR-lkp@intel.com>
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
config: arm64-kismet-CONFIG_MTK_SCP-CONFIG_VIDEO_MTK_ISP_71_CAMSYS-0-0 (https://download.01.org/0day-ci/archive/20240513/202405131122.m2E0p9OR-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20240513/202405131122.m2E0p9OR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405131122.m2E0p9OR-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for MTK_SCP when selected by VIDEO_MTK_ISP_71_CAMSYS
   WARNING: unmet direct dependencies detected for MTK_SCP
     Depends on [n]: REMOTEPROC [=n] && (ARCH_MEDIATEK [=y] || COMPILE_TEST [=y])
     Selected by [y]:
     - VIDEO_MTK_ISP_71_CAMSYS [=y] && MEDIA_SUPPORT [=y] && MEDIA_PLATFORM_SUPPORT [=y] && MEDIA_PLATFORM_DRIVERS [=y] && ARCH_MEDIATEK [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
