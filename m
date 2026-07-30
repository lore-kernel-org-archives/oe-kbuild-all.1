Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5DDF3A254B
	for <oe-kbuild-all@lists.linux.dev>; Thu, 30 Jul 2026 14:35:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785422138; cv=none; b=bWHafbgAnI3eNe2JRbn9Dld7nbfax3OzyBGd/TeNAxrHHKTMfYmwVjJLZbDJpYQtXCku+5ZQVnPC+p3s05iKgp8G6rZjZLHiyy+RbD+nayP61uLyqB/6lkm11iCfEKD+3+YNTnFYHP8dvnQJTP/cfx5AxjXoLv5PmAmHLiq/9hs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785422138; c=relaxed/simple;
	bh=PCBtxcTKvRjoAzuO6owPkhoVtLLboiVCp+S+45LxquU=;
	h=Date:From:Cc:Subject:Message-ID; b=g6xOmpPsbNfEYrhAr08gxVPl9dpZV5PMWCnFm0hFI69koT85GqvdApn/kDUDQqtp3GkRTqXObw9LrDVe2NIesqIBR4ZVXIca6L3w66wliURUBKxmbMqQv4as8kREmGnhg6sX8beE0/y9Okee0Q9dIrsrL0QH/sSH9XD7557CgDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gGQZvtwI; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gGQZvtwI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785422137; x=1816958137;
  h=date:from:cc:subject:message-id;
  bh=PCBtxcTKvRjoAzuO6owPkhoVtLLboiVCp+S+45LxquU=;
  b=gGQZvtwI2N0kDgZ1/qeSL+xA/LnVSPYd0dy6qtIqG4vo0rCzrEixzuzt
   Z4o5r2dm/RIWUm0+0Mks61Qe67YB4lx7bccvQ5ACL8CsMwMviPprPvesC
   ru5/SZXxEJC978gibLXNXF2mWx6uI988+7s/Tp9BF7yxgtnebxRL7b7nC
   BhiT9ucjRI8lhKDQRsIqPh7RjNtbPCLIDGvLzeP+R2381PfUZInII43sS
   LXZTRAY38HHgVqACTXs87DhL7O5lTCfoBExM46nBj24CuTm3GF2hFI422
   dggfWB42SaCIV2mZmtQdbqik4SWGOR1BxxkCgNHnewSH8XJaPNzzw4F88
   g==;
X-CSE-ConnectionGUID: 1DbSPKXETKC0GKkTDuEEOA==
X-CSE-MsgGUID: 7Ft/fa0OTj6VyJUaLn6psA==
X-IronPort-AV: E=McAfee;i="6800,10657,11860"; a="103449435"
X-IronPort-AV: E=Sophos;i="6.25,194,1779174000"; 
   d="scan'208";a="103449435"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2026 07:35:36 -0700
X-CSE-ConnectionGUID: Ii19+blaSjKnwQJHCvhADw==
X-CSE-MsgGUID: qzEk3SDoQmm9/lNJEwP4Xw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,194,1779174000"; 
   d="scan'208";a="256390831"
Received: from igk-lkp-server01.igk.intel.com (HELO 3cba2a188a06) ([10.211.93.152])
  by fmviesa010.fm.intel.com with ESMTP; 30 Jul 2026 07:35:35 -0700
Received: from kbuild by 3cba2a188a06 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wpRrA-000000002OY-2JQ3;
	Thu, 30 Jul 2026 14:35:32 +0000
Date: Thu, 30 Jul 2026 16:35:19 +0200
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [intel-lts:5.15/android_t 1/1] kismet: WARNING: unmet direct
 dependencies detected for ASYNC_TX_ENABLE_CHANNEL_SWITCH when selected by
 GKI_HIDDEN_DMA_CONFIGS
Message-ID: <202607301620.d5krIkZr-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel/linux-intel-lts.git 5.15/android_t
head:   cae1f18703f8b6ecf8a9d232c494bdd5130e6992
commit: 194fc9ea8a50fa11e9b03bf04449614fc79be59a [1/1] ANDROID: GKI: enable hidden configs for DMA
config: hexagon-kismet-CONFIG_ASYNC_TX_ENABLE_CHANNEL_SWITCH-CONFIG_GKI_HIDDEN_DMA_CONFIGS-0-0 (https://download.01.org/0day-ci/archive/20260730/202607301620.d5krIkZr-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20260730/202607301620.d5krIkZr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607301620.d5krIkZr-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for ASYNC_TX_ENABLE_CHANNEL_SWITCH when selected by GKI_HIDDEN_DMA_CONFIGS
   WARNING: unmet direct dependencies detected for ASYNC_TX_ENABLE_CHANNEL_SWITCH
     Depends on [n]: DMADEVICES [=n]
     Selected by [y]:
     - GKI_HIDDEN_DMA_CONFIGS [=y]

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
