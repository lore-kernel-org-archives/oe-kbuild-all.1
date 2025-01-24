Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F8BB1CEADF
	for <oe-kbuild-all@lists.linux.dev>; Fri, 24 Jan 2025 19:10:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737745824; cv=none; b=gLXQuyOR8rKGRizyEunDjDLa6u9y/RoaJQY+BMo6HedkZfVqAr+n9COMu7HuLpvq7zex0KaeNbI/wsN2MGZ+RKWjVszzDWa9YoU6IRjFQYoCmyez200+DoSEQboiVnXu0RNjUm64A1+yaKIArejp2WBuJm40fTsVz3lFbJpxO5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737745824; c=relaxed/simple;
	bh=yDAYEs0k5RqIdVjEHM510TYYiyQCgOpxFeNXmUE9SyI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WeLTTtOFdro9r4UzsL52l+pvuJ7A8dlVmAnf+oB6XyGGk4u6RNczx2XcXK6Hw/o3J8jVX8/YI0qY7UGbbefbwnZAUM1cwnM50yKrI5poed9S6bAs/AUPPgZiHhzfanLhd6tp0Rm2RprKn39Ycw9OJTFjTwG9TrLqMe4Vq8gYtS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Xnsnwzya; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Xnsnwzya"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737745822; x=1769281822;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yDAYEs0k5RqIdVjEHM510TYYiyQCgOpxFeNXmUE9SyI=;
  b=Xnsnwzyaz0G3UAsOQGCzMbZIj15tTuRqaoPtyQJFqxtHraL5ku6Q7GmB
   Ic+PnHawfcSbfF1sV7zT4Cazv8hh/3T8SWzM4OqqaqTgAjLBTSuXu5ngP
   ApT9Xlggxisn8QrxY/XE5DzpnTBGavxyYH7tT0X7e5S1kKEf6pHOa03gu
   VlCzv5SZxPgjIStenxz+yGu68My3pDlfuwflkEhCpDmwoLtVGtplSPuzx
   ZPUH6R9CAN2x+kkxw0qDuHiTmL9+LGeSGnmk5w6Q+LoDc2Pt5lijWqqPj
   8ztM2TZJOW0IwlBIrBLwNnTrfJ7UdAhpYYYGZ9FOY0WMkC/GPOGlVPMGk
   g==;
X-CSE-ConnectionGUID: nqM2Dn/aSpeEsdcKCDYjcQ==
X-CSE-MsgGUID: HXgprT+1S326kxBPtwLtyg==
X-IronPort-AV: E=McAfee;i="6700,10204,11325"; a="41954677"
X-IronPort-AV: E=Sophos;i="6.13,232,1732608000"; 
   d="scan'208";a="41954677"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2025 11:10:20 -0800
X-CSE-ConnectionGUID: ASQ+WxfVQ0GAvkobNsR1aw==
X-CSE-MsgGUID: 2q7644kYQH2HCE+GsvkLQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,232,1732608000"; 
   d="scan'208";a="138720153"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 24 Jan 2025 11:10:20 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tbP4L-000d2b-1i;
	Fri, 24 Jan 2025 19:10:17 +0000
Date: Sat, 25 Jan 2025 03:09:20 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 1/1] kismet: WARNING: unmet direct
 dependencies detected for SND_VMASTER when selected by
 GKI_HIDDEN_SND_CONFIGS
Message-ID: <202501250358.VBEQVPDg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   b49cbb857a1754d0e5a7bca1d63701a32da0500f
commit: 77002c324012cf3931a613f828b37abe7ab4392a [1/1] ANDROID: gki_defconfig: Enable req modules in GKI
config: arm64-kismet-CONFIG_SND_VMASTER-CONFIG_GKI_HIDDEN_SND_CONFIGS-0-0 (https://download.01.org/0day-ci/archive/20250125/202501250358.VBEQVPDg-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20250125/202501250358.VBEQVPDg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501250358.VBEQVPDg-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for SND_VMASTER when selected by GKI_HIDDEN_SND_CONFIGS
   WARNING: unmet direct dependencies detected for SND_VMASTER
     Depends on [n]: SOUND [=n] && !UML && SND [=n]
     Selected by [y]:
     - GKI_HIDDEN_SND_CONFIGS [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
