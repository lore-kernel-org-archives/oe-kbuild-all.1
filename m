Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EC3A346AC0
	for <oe-kbuild-all@lists.linux.dev>; Thu, 27 Aug 2026 10:39:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787827187; cv=none; b=MGgXcIzl68Omc/7KW4Nn76MgiL8EwXHG7aABKWv9IceV7wsJUpdTA4hw1muaDbTF2J2gsjf9ycfYzqJujWNPrujVFggBkH+dkLS2dPncG99GTbG7MVmePM+PAuHYkKrgqdKgsu/tJdj1QiVqYUGOwHsWwsj0oVFwdKKdhxZ3v4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787827187; c=relaxed/simple;
	bh=U+s4dXOfVCRwTk9d2tgZ1ZjVPJNIWoS889r80L9xioY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=NcrsKkvLuqyejeZroBVw5SV2EZIry7N+wseFkYLZJCuGOXp6DJNOwrz24erXTw508LOnZFIgirAOF47n16jM+zAAXO44I+yP9Nlyv8LWZ4pZKDxe/FEf/aiu044uhvGP3cs/gf/poFVfdqWH1Es/yadmrYiq5O0ZfdrNQkcn4vM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=D9azV2xz; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="D9azV2xz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787827185; x=1819363185;
  h=date:from:to:cc:subject:message-id;
  bh=U+s4dXOfVCRwTk9d2tgZ1ZjVPJNIWoS889r80L9xioY=;
  b=D9azV2xzWlRYOgmgdZWg8L7dIZWC3eiE2ZQwVzOL/MUzbm00PPffMWgb
   iASb8rfin+bLCl1cMimLH4ibmGcF/Ih7TzrZ1mpRuGO13GiuVen+PHZPG
   m/aEf0fSUxSWDAmMPjS9usTPgSjjQHXRyNxzge+c24/aV+YyxoCBglpnK
   gOANal6TdNTXFWv13CfkUpaSSUWPEOP1yUSvpRJxGK9119JIOyMXQacgp
   GuHFdpZOMNQWm9Nx+NULXcDqfsCAL4VdKR6nbePzUiEUOr+ikf9r5gw3I
   yTvyQovwbGaZTvePxCLx4Q/brHQ/5ZqtACkDeAcoOwrKNXlk4yY0CqoSy
   Q==;
X-CSE-ConnectionGUID: mM05Q5hpR2Wr7IskLh3B1w==
X-CSE-MsgGUID: CP2k904DSpa0pjNb6FZQjg==
X-IronPort-AV: E=McAfee;i="6800,10657,11887"; a="75866472"
X-IronPort-AV: E=Sophos;i="6.25,246,1779174000"; 
   d="scan'208";a="75866472"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2026 03:39:44 -0700
X-CSE-ConnectionGUID: +45FkyK5S4Gu4DeZKa01/g==
X-CSE-MsgGUID: Iqb971mpQaiHt3wgHm3tMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,246,1779174000"; 
   d="scan'208";a="264596747"
Received: from igk-lkp-server01.igk.intel.com (HELO b2f8001b2633) ([10.211.93.152])
  by fmviesa007.fm.intel.com with ESMTP; 27 Aug 2026 03:39:43 -0700
Received: from kbuild by b2f8001b2633 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wzXWH-000000000ll-1MQX;
	Thu, 27 Aug 2026 10:39:41 +0000
Date: Thu, 27 Aug 2026 12:38:51 +0200
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18 6/6] kismet: WARNING: unmet
 direct dependencies detected for XFRM_OFFLOAD when selected by
 GKI_HIDDEN_XFRM_OFFLOAD_CONFIGS
Message-ID: <202608271225.50q5gWBr-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android17-6.18
head:   c72b6b60b7da737c1127d80431ac39b9e380e52f
commit: 3e1da3739d68558bacc60ea5f469fbddaf529c32 [6/6] ANDROID: GKI: Add GKI_HIDDEN_XFRM_OFFLOAD_CONFIGS
config: x86_64-kismet-CONFIG_XFRM_OFFLOAD-CONFIG_GKI_HIDDEN_XFRM_OFFLOAD_CONFIGS-0-0 (https://download.01.org/0day-ci/archive/20260827/202608271225.50q5gWBr-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20260827/202608271225.50q5gWBr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608271225.50q5gWBr-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for XFRM_OFFLOAD when selected by GKI_HIDDEN_XFRM_OFFLOAD_CONFIGS
   WARNING: unmet direct dependencies detected for XFRM_OFFLOAD
     Depends on [n]: NET [=n]
     Selected by [y]:
     - GKI_HIDDEN_XFRM_OFFLOAD_CONFIGS [=y]

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
