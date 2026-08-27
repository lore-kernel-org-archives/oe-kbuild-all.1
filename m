Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A04FA3B7742
	for <oe-kbuild-all@lists.linux.dev>; Thu, 27 Aug 2026 12:00:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787832047; cv=none; b=LFbM3edqcBXH8FR45l5lroyfvfSvn38lRcJ3Mixk/xCiXTk+S95GSa80aJtfbBuxvhlWcPC4yH8ps0o3PS6EEC9Tu7/oDFI0U3XOzEIZzgwdyFNhPodHrf/XNAQBCjCpnCILb5wqPEYWUvnyKtaNI+09yMJ6ExYJZAjGaGkWk2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787832047; c=relaxed/simple;
	bh=XrXvH8OkEgL9VYQNPsBPuSBUME8tweH8bI0SRSpyqhk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=csygzocJS/pkdwBtsES3T9EJVhxOm51IQMRpdMyFyE0qfPmvJQjWvQZdPBwjCnubD5XQ5NBi4TPt3zn3lUZCMHKkSd2blUPx8Zw761NAOzL3fYKlFGzhkk0p9HBzuBaAVTE8iKu8ma8ktK7uGldh6yZmBW5sGkWJ/cY98Ee3Ss8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WxJ+UQhU; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WxJ+UQhU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787832046; x=1819368046;
  h=date:from:to:cc:subject:message-id;
  bh=XrXvH8OkEgL9VYQNPsBPuSBUME8tweH8bI0SRSpyqhk=;
  b=WxJ+UQhUfT5I42kyMtYx6D/15XWwJfK7XfNmpPWHBYyH5PbY9coGIT0/
   tR6etDqrSoo7Uy3CTXaEImqvk7s31f4Nh0trHIEaJ64djm/U69qVz1y6t
   z/5YrbEoBvKB40rMNcI/bu9qKXryLDsQ88IKUxkUdW2Xw07+iPNlRseQm
   hbf1tBATfC7gWoRsmxISwd/dkx9MNUbXKb6bKIVq0JzBeNUvSKlL9TIuT
   bp+8sCtmJ5TNQoK2ZbPeM+q5YxlHjQbPChO9aN2OG8hfy9904lr3GM1Gz
   QbPmYNKNWDP1hrv7AdNa2omkQrAe0C9c+D4aPdUYRjjmR9skUdVRKI6BZ
   A==;
X-CSE-ConnectionGUID: xZXMPCsiSJ+HbIEhBPAifg==
X-CSE-MsgGUID: Dj5YIFwYSUmPm+b5UUnaaQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11887"; a="88382494"
X-IronPort-AV: E=Sophos;i="6.25,246,1779174000"; 
   d="scan'208";a="88382494"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2026 05:00:45 -0700
X-CSE-ConnectionGUID: bVuma/DjTm+Ldp6ZDZwDRA==
X-CSE-MsgGUID: QVqpUm/3RFquB2m2en2MHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,246,1779174000"; 
   d="scan'208";a="297738810"
Received: from igk-lkp-server01.igk.intel.com (HELO b2f8001b2633) ([10.211.93.152])
  by orviesa002.jf.intel.com with ESMTP; 27 Aug 2026 05:00:44 -0700
Received: from kbuild by b2f8001b2633 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wzYmf-000000000mP-44Gb;
	Thu, 27 Aug 2026 12:00:41 +0000
Date: Thu, 27 Aug 2026 14:00:22 +0200
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18 6/6] kismet: WARNING: unmet
 direct dependencies detected for DIMLIB when selected by
 GKI_HIDDEN_VIRTUAL_CONFIGS
Message-ID: <202608271346.iK9FFQhx-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android17-6.18
head:   c72b6b60b7da737c1127d80431ac39b9e380e52f
commit: 1dfbe413d21f18f714cca818435299947bf5649a [6/6] Merge 6706415bf9f3 ("Merge tag 'gfs2-v6.10-rc1-fixes' of git://git.kernel.org/pub/scm/linux/kernel/git/gfs2/linux-gfs2") into android-mainline
config: x86_64-kismet-CONFIG_DIMLIB-CONFIG_GKI_HIDDEN_VIRTUAL_CONFIGS-0-0 (https://download.01.org/0day-ci/archive/20260827/202608271346.iK9FFQhx-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20260827/202608271346.iK9FFQhx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608271346.iK9FFQhx-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for DIMLIB when selected by GKI_HIDDEN_VIRTUAL_CONFIGS
   WARNING: unmet direct dependencies detected for USB_PHY
     Depends on [n]: USB_SUPPORT [=n]
     Selected by [y]:
     - GKI_HIDDEN_USB_CONFIGS [=y]
   
   WARNING: unmet direct dependencies detected for DIMLIB
     Depends on [n]: NET [=n]
     Selected by [y]:
     - GKI_HIDDEN_VIRTUAL_CONFIGS [=y]

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
