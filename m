Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FD5A2DE6EE
	for <oe-kbuild-all@lists.linux.dev>; Thu,  3 Jul 2025 19:39:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751571570; cv=none; b=qP7RDcM5NkR7/EuJMqGAfqJgisll13KypS8AG8Gg1EzitFU1KzyS+5y7/pQCZzODPKUtycQIKQRmq6nWXV3CJCMywWk3sOEc0VjRCLxi8IfJtmO/vrIhcT7wGJUYCtmtQePu3y4GEMPRILDSVgflUQzCPSihgnS0tYEuFWKyqmc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751571570; c=relaxed/simple;
	bh=PZRRrIJH2eYpeCsqyyTxdlyibkGZck7mLRzKHGCWtcw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qvKPdCqtT3DjFTryJ0ra5BG43eumdyDcLxJVh/MaNtrZh44FvcRycNqBL9LF0AsP8dGwpA+fa8pC+ToU3GoxO8pIWdosD54LQ1mN6hqX0bZcUKKnh6EVoBLgt93w2X2XMDB+ACV5kLwUNiWQtuDcrgrgt40yNhydNQX2kfnxBqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UNbGb2mb; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UNbGb2mb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751571568; x=1783107568;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PZRRrIJH2eYpeCsqyyTxdlyibkGZck7mLRzKHGCWtcw=;
  b=UNbGb2mbMoBdM1I5lVg6vfv/6oZ85zCiMG1vlCDcry2lBo5UnDHPC5/x
   4pnjUizJEWOiRcRRTjnJTocp/17K/4JfVstRdAial3LWPS/brLryP2R5Z
   o74OOaOPIPplzH7vpLnhVGt0JK+w3YKixYj6YC/xONh/oNNoXO+nFagbt
   M/VKXuwd4oFczf5KRRz2zitnhCjAxZjZMGS+gx9EHuiYD8/PqmJl8wMvD
   tv5iezE3XnjLf6H7eTnAOb4SV+eVpemsxBm2YKD+2KXBGhNb23Q0eXTPy
   dOG4BUhHM89Mn5VncrXJGZmDJKJE0vvlInW+fznke0+ElNwmHiDRBCFeN
   w==;
X-CSE-ConnectionGUID: Bhqx6H0SS9ayGo9G6nViUA==
X-CSE-MsgGUID: IykCiYSSSMute+jsWa5UUQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11483"; a="57685325"
X-IronPort-AV: E=Sophos;i="6.16,285,1744095600"; 
   d="scan'208";a="57685325"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2025 12:39:28 -0700
X-CSE-ConnectionGUID: lTHwQb9NQp24pj1XZUqqeA==
X-CSE-MsgGUID: dNlE4BUER6y9ibv6iCli1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,285,1744095600"; 
   d="scan'208";a="153869325"
Received: from lkp-server01.sh.intel.com (HELO 0b2900756c14) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 03 Jul 2025 12:39:27 -0700
Received: from kbuild by 0b2900756c14 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uXPmG-0002wh-2e;
	Thu, 03 Jul 2025 19:39:24 +0000
Date: Fri, 4 Jul 2025 03:38:41 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android-mainline-desktop 4/4] kismet: WARNING: unmet
 direct dependencies detected for INTEL_TCC when selected by
 GKI_HIDDEN_X86_CONFIGS
Message-ID: <202507040312.MzOGhieA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android-mainline-desktop
head:   7b423b7f82f1447ab090e96318cc6ecb6121b23a
commit: 8f5b5565305bb4a90b9e398d224aa7a48af1c5bc [4/4] ANDROID: GKI: x86: Enable Intel TCC lib as x86 hidden
config: x86_64-kismet-CONFIG_INTEL_TCC-CONFIG_GKI_HIDDEN_X86_CONFIGS-0-0 (https://download.01.org/0day-ci/archive/20250704/202507040312.MzOGhieA-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20250704/202507040312.MzOGhieA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507040312.MzOGhieA-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for INTEL_TCC when selected by GKI_HIDDEN_X86_CONFIGS
   WARNING: unmet direct dependencies detected for INTEL_SCU
     Depends on [n]: X86_PLATFORM_DEVICES [=n]
     Selected by [y]:
     - GKI_HIDDEN_X86_CONFIGS [=y] && X86 [=y]
   
   WARNING: unmet direct dependencies detected for INTEL_TCC
     Depends on [n]: THERMAL [=n] && (X86 [=y] || X86_INTEL_QUARK [=n] || COMPILE_TEST [=n]) && X86 [=y]
     Selected by [y]:
     - GKI_HIDDEN_X86_CONFIGS [=y] && X86 [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
