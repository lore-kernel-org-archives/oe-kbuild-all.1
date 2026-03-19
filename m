Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F243E3BA236
	for <oe-kbuild-all@lists.linux.dev>; Thu, 19 Mar 2026 10:01:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773914493; cv=none; b=fXabOe9ddyjmouYdPTDLGEp3wLELnJshCVIQSlU0IszS0i4np7dauPn1RfQW/GBlD02R6Ob195No6PJCR1kH9lEMbtXAXM2f0ZMCyEkS6S6+Ojg+QQqG9veqVZe+fnOIAIVnCfvAvx7Yvjl//j4NGmnpczAfYkeT6UPSYP68Hic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773914493; c=relaxed/simple;
	bh=XaYdM/upAhR1u1b5TQGI2crQlXAgUoCImG4Z6CvMxpc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=em12UG/B0k512s/jFQEfw6vzUQKsBWmRIciLW6GRx3LV7XIdrNACHq6bIHAp3QmqtrnVK8I5jzmRWQvHA8ujO11Vyd/pa5YcURhuiGQv4qnURspQhCOSqF4fryMCv9qHWuB/zTQ6sjapGKHuY0WZ5s32FmeVGAiI8j13wckvbnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Y/MUYgBf; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Y/MUYgBf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773914490; x=1805450490;
  h=date:from:to:cc:subject:message-id;
  bh=XaYdM/upAhR1u1b5TQGI2crQlXAgUoCImG4Z6CvMxpc=;
  b=Y/MUYgBf88x8AKvitdmYexfyNu5yimSJvbsVWdTYvwyuQJMH4NkYK/uX
   Os2BGY8e6xGo12KfiEZIlQdrYzMNsry6MjA3KurAUXNwcRdlc3iI+T6zY
   iL6vkukst/hXBObUn3eZ/X/yEMlfaTa4d3eUP6aCweEhdmTCkdikRtgBF
   sFXhoYjeRiksuRS4DFGDqJkEi3w+j42uPE3aAr9xSkomTE7Vm+OUN1zLb
   vJoxH1wmfLSFf7mrpKxqi7Wb6K36heYwAsteMLTqXSutgPGdGwAXUr5GE
   b2LFm0QU+K0kEz+8X04tJkxwk70iMFoQ+ZFZmpPvmfrzFNIh3J/Lq/Xr9
   A==;
X-CSE-ConnectionGUID: srnhx/vRQLyz8JIRkqdrHw==
X-CSE-MsgGUID: 61hVjvRnQc2DVbFV3xbxnQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11733"; a="75167187"
X-IronPort-AV: E=Sophos;i="6.23,129,1770624000"; 
   d="scan'208";a="75167187"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2026 03:01:30 -0700
X-CSE-ConnectionGUID: J86XOgTETpm9tQ9ZtHMuVw==
X-CSE-MsgGUID: ct/kHE3OSii4A6Wg83SE6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,129,1770624000"; 
   d="scan'208";a="227397364"
Received: from lkp-server02.sh.intel.com (HELO a51c2a36b9df) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 19 Mar 2026 03:01:28 -0700
Received: from kbuild by a51c2a36b9df with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w3ABC-000000000jz-0lSp;
	Thu, 19 Mar 2026 10:00:43 +0000
Date: Thu, 19 Mar 2026 17:59:42 +0800
From: kernel test robot <lkp@intel.com>
To: Benjamin Berg <benjamin.berg@intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Miri Korenblit <miriam.rachel.korenblit@intel.com>,
 Johannes Berg <johannes.berg@intel.com>
Subject: [iwlwifi-next:nan_mac80211_phase2 29/58]
 mac80211_hwsim_nan.c:(.text.mac80211_hwsim_nan_discovery_beacon_timer+0x1c8):
 undefined reference to `__aeabi_uldivmod'
Message-ID: <202603191706.9KQG5n8o-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/iwlwifi-next.git nan_mac80211_phase2
head:   8a7956fb02f984ce9f2e0d7787407d3d8e8eef55
commit: 9a7232f08574d3b26a00ce0bfa905843a2f89229 [29/58] wifi: mac80211_hwsim: implement NAN synchronization
config: arm-randconfig-002-20260319 (https://download.01.org/0day-ci/archive/20260319/202603191706.9KQG5n8o-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260319/202603191706.9KQG5n8o-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603191706.9KQG5n8o-lkp@intel.com/

All errors (new ones prefixed by >>):

   arm-linux-gnueabi-ld: drivers/net/wireless/virtual/mac80211_hwsim_main.o: in function `mac80211_hwsim_beacon':
   mac80211_hwsim_main.c:(.text.mac80211_hwsim_beacon+0x84): undefined reference to `__aeabi_uldivmod'
   arm-linux-gnueabi-ld: drivers/net/wireless/virtual/mac80211_hwsim_nan.o: in function `mac80211_hwsim_nan_discovery_beacon_timer':
>> mac80211_hwsim_nan.c:(.text.mac80211_hwsim_nan_discovery_beacon_timer+0x1c8): undefined reference to `__aeabi_uldivmod'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
