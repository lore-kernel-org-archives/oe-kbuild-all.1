Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3B5C2D061C
	for <oe-kbuild-all@lists.linux.dev>; Sun, 11 Jan 2026 21:32:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768167144; cv=none; b=kySWVC9O306SzY8HvKmnTmurY3CXSqE9eDrkwddCBLNyraKy1eg9GagkfCm90VOaCJVcgw1ASrRe82MU7TpNifJDUMqcof1z9ZBbSeh5y2chO9E8d6CRU98aiTsj40Kp2h39B+7U60PhjthfWPiUQZLNX90ee85lvDQcdnYb2cs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768167144; c=relaxed/simple;
	bh=a7nAIxj6OwShPEGkrGAmhpQKR5o03e5Vj+7TGqHkbN8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=YPh8YR2IOZS5bqGrq4OV2/BnZTtxJTN2LlqU7aubmV1HrgsnwYUFs98k7NTYCpX98Kk9Z4zyVVmtTk0vMJQlxSRmPbp3YQEBOVpCwP8mRoX7dRruJyfVAwZXI+QQl/7aAoKm0vBY+Sm/QNRk7vLRJuZPbIILBkqfefWq+fjtjBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LpP6UE2S; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LpP6UE2S"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768167142; x=1799703142;
  h=date:from:to:cc:subject:message-id;
  bh=a7nAIxj6OwShPEGkrGAmhpQKR5o03e5Vj+7TGqHkbN8=;
  b=LpP6UE2SkWDyLYEhFbLrirk8Nks389s2/HJYgmMfLuvtUZ3ptDXF3xfY
   /Jel4X5nlkukftFuzxnP/TZGer2T8kBEqCEqOW9lWX4Lu5/dXi31d7GgM
   peGi29/dv84kvzTqR3n1mJIG53zWdB1Y9gSwkMdCKZtVR7zKWUD1bOYf8
   vD5zjg9Q97MPEBqQE/DsWdAmd2H2whLWpRntjC0mjWPV7DHE2X1ffJ9/b
   25/WRSxB+0U3WpFiJTNAlTu9+dl/20ZfqdQ0ensQp0XbjVAW33d2PeQjm
   mhlf80Hv4TDSuLkvKoR0n2Ujd7WvPgIpcxkiSnY1yzVh3qqvz2n2/yqPf
   g==;
X-CSE-ConnectionGUID: cm7SagVlSqOeLDwVPjQ6LQ==
X-CSE-MsgGUID: SDgIYzNsSoaYw0mEHnf9oQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11668"; a="69183931"
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; 
   d="scan'208";a="69183931"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jan 2026 13:32:21 -0800
X-CSE-ConnectionGUID: oEmoVh8jSJq9hUoFiDI4Rg==
X-CSE-MsgGUID: iCBoQ94tTs2gwRVrPYfGhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; 
   d="scan'208";a="208993603"
Received: from igk-lkp-server01.igk.intel.com (HELO 8581b2e2a62c) ([10.211.93.152])
  by orviesa005.jf.intel.com with ESMTP; 11 Jan 2026 13:32:19 -0800
Received: from kbuild by 8581b2e2a62c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vf32m-000000000Uh-3oD6;
	Sun, 11 Jan 2026 21:32:16 +0000
Date: Sun, 11 Jan 2026 22:31:43 +0100
From: kernel test robot <lkp@intel.com>
To: Shanker Donthineni <sdonthineni@nvidia.com>
Cc: Paul Gazzillo <paul@pgazz.com>,
 Necip Fazil Yildiran <fazilyildiran@gmail.com>,
 oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Marc Zyngier <maz@kernel.org>, Vikram Sethi <vsethi@nvidia.com>
Subject: kismet: WARNING: unmet direct dependencies detected for
 HAVE_ARM_SMCCC_DISCOVERY when selected by ARM_GIC_V3
Message-ID: <202601112212.rP72HLyw-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   9c7ef209cd0f7c1a92ed61eed3e835d6e4abc66c
commit: 35727af2b15d98a2dd2811d631d3a3886111312e irqchip/gicv3: Workaround for NVIDIA erratum T241-FABRIC-4
date:   2 years, 9 months ago
config: arm-kismet-CONFIG_HAVE_ARM_SMCCC_DISCOVERY-CONFIG_ARM_GIC_V3-0-0 (https://download.01.org/0day-ci/archive/20260111/202601112212.rP72HLyw-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20260111/202601112212.rP72HLyw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601112212.rP72HLyw-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for HAVE_ARM_SMCCC_DISCOVERY when selected by ARM_GIC_V3
   WARNING: unmet direct dependencies detected for HAVE_ARM_SMCCC_DISCOVERY
     Depends on [n]: ARM_PSCI_FW [=n]
     Selected by [y]:
     - ARM_GIC_V3 [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
