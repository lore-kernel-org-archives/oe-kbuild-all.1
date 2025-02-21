Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 246621FC105
	for <oe-kbuild-all@lists.linux.dev>; Fri, 21 Feb 2025 22:43:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740177844; cv=none; b=AlNITH5bdvsC0usLKpTn7VUJk/BnguCtG49LyvowOVDUsjBSM4Ve8Gj84hfOaxyxr7fp2pLVBTZIpIQ3g9F6G+88PKCGGKRVcGYZvwYiAN3hepnuDVVrOZKbinuBQrW9bRczM6XGRBKTvQusrnAVPUQeRKX7VZiaq1DeFfLLwJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740177844; c=relaxed/simple;
	bh=UrIX9U0kZNaUXA8R1E0qd9j3j7FrbB/hugUUtu47uvo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tWveuSXCNodYxtP1+olFwLhfHECgKjVmv4fDVXw8XLE3SLC01uo2c8zMV2aMwBm0wdVDMlQ5Nnq6QBTVnaV/7uWsCHJMfnsneq7sprO6ncYRXZiyVXnK3DUlmqxScV451Y7ew9XFnQIPvtyUB8oSMVVNM19W7yBDh2rRPjO3t+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DNxxoHRL; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DNxxoHRL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740177841; x=1771713841;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UrIX9U0kZNaUXA8R1E0qd9j3j7FrbB/hugUUtu47uvo=;
  b=DNxxoHRLZRk9oW0u6J8Yan8UPvkNGI4x6Q1BNGWs+kZcpernOihHw5Rg
   IbCxzDjVeGei1JflWWUyNHpwP88F2z8Y20H9nKIXvh3mfK4s13Iel2qIP
   JcUj6jZnwCTt7T1LBQ44t1B2F7JvJ+OD0IDCXSyLGqDUESIRPyzrLyMJ0
   9I3636Xj5n4lARwmxaiGOzC0Sor4c/jYgV4f1YzLk0UszvSnqTVmoayJC
   7waLitNk0U6vdudkdJXo5TaB1fbSsY4p57R910nZsqHplmmHYgOVs4FQg
   DQwu7Sul+026sc3sgWF0Oh9mEvtS6rJe9I0VCWi13PruttV1J/rD5GiAB
   A==;
X-CSE-ConnectionGUID: xjeQoRl/R1y547riHrLz+g==
X-CSE-MsgGUID: 0dLhgy0NSFeDFgjGbd0lbQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11352"; a="51999077"
X-IronPort-AV: E=Sophos;i="6.13,306,1732608000"; 
   d="scan'208";a="51999077"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2025 14:44:00 -0800
X-CSE-ConnectionGUID: k7PUxD2pRsqgB0Kr1mNKqA==
X-CSE-MsgGUID: irZvWRghTayZKw2LlDBHEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,306,1732608000"; 
   d="scan'208";a="138722179"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 21 Feb 2025 14:43:57 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tlbkR-00066F-2m;
	Fri, 21 Feb 2025 22:43:55 +0000
Date: Sat, 22 Feb 2025 06:43:02 +0800
From: kernel test robot <lkp@intel.com>
To: Mario Limonciello <mario.limonciello@amd.com>
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev, Mark Brown <broonie@kernel.org>
Subject: [linux-next:master 4334/5524] kismet: WARNING: unmet direct
 dependencies detected for SND_SOC_SOF_AMD_COMMON when selected by
 SND_SOC_SOF_AMD_VANGOGH
Message-ID: <202502220653.w2ClojtK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   d4b0fd87ff0d4338b259dc79b2b3c6f7e70e8afa
commit: f120cf33d2325fd95d063eccbff2e86ffc7f493a [4334/5524] ASoC: SOF: amd: Use AMD_NODE
config: um-kismet-CONFIG_SND_SOC_SOF_AMD_COMMON-CONFIG_SND_SOC_SOF_AMD_VANGOGH-0-0 (https://download.01.org/0day-ci/archive/20250222/202502220653.w2ClojtK-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20250222/202502220653.w2ClojtK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502220653.w2ClojtK-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for SND_SOC_SOF_AMD_COMMON when selected by SND_SOC_SOF_AMD_VANGOGH
   WARNING: unmet direct dependencies detected for SND_SOC_SOF_AMD_COMMON
     Depends on [n]: SOUND [=y] && SND [=y] && SND_SOC [=y] && SND_SOC_SOF_TOPLEVEL [=y] && SND_SOC_SOF_AMD_TOPLEVEL [=y] && AMD_NODE
     Selected by [y]:
     - SND_SOC_SOF_AMD_VANGOGH [=y] && SOUND [=y] && SND [=y] && SND_SOC [=y] && SND_SOC_SOF_TOPLEVEL [=y] && SND_SOC_SOF_AMD_TOPLEVEL [=y] && SND_SOC_SOF_PCI [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
