Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C75371BF322
	for <oe-kbuild-all@lists.linux.dev>; Thu, 10 Oct 2024 11:00:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728558010; cv=none; b=LiofjdyCJVsNh5W54KnGTAwiST7myuEQk4J07n5IGjJp+M1LFjRvJVuk2O9HBmE2MXbSqXvWD+64XJkN3brKsfrrgpNK0ogsTUcgw4nBGkL3rXsrhNTIPw+gUsPZDjAhf9AMpwq2BIvSyEoYboCwCedebRbBgEpUuUAgm5ubj/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728558010; c=relaxed/simple;
	bh=zquIOnuKpnKbwHn31wjBembZ0kLgojn9LLuI+2LrRrY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oxgTPFgZnn6TMVX5+jOgpRg79fJQvy7vPF+de5SVrHCzS4huymlBMFthn3lB+Hkjoox1zFlrSoVaXS5iV1I4enBsuaAjOxpjcdmHr+Uymyw9BLE+GbAUxPR+wx7/Z1ZWlvXQsgc4ZAKiLVrm1YvVWUw6FtuVmxS+hcrdI+4qjJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NTXHCKR0; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NTXHCKR0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728558009; x=1760094009;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zquIOnuKpnKbwHn31wjBembZ0kLgojn9LLuI+2LrRrY=;
  b=NTXHCKR0f6+RDcOsO78tkh9xDm6hF5Hllh3OuVFA69Jd7M1ZLRpm6fuk
   EDmu8Gn0CuvP6ZoZuVfBR1KMZKrEErYy6XjyTp4k+0XdpqSv/tDK9s2kX
   Gqzj1/G+Ni1ndX8vIDByNivmF0VkZZi3mnB1p8HDNYPTmobvNd979LJCK
   Y0F8OFbuXYQepdr4BpjF7WWMm4YzlGz94ltwVp5mRCZG8eRgnO5Ai09E3
   YAfkawGjar0sMkBPl2evZDpmbsG2LQQ8ftv7qOBrGzuKBKmu2Nd0TgQF9
   dEl4L1LvZCsttrk+bFhsTG2DVgGK42SubuQ5f9/7XmQIBY1QGjMWYM5wu
   g==;
X-CSE-ConnectionGUID: NyLwDHE8TEynk5Y0sSEBdw==
X-CSE-MsgGUID: f3DljNW/T/WFaz9cMbZuZA==
X-IronPort-AV: E=McAfee;i="6700,10204,11220"; a="39298334"
X-IronPort-AV: E=Sophos;i="6.11,192,1725346800"; 
   d="scan'208";a="39298334"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2024 04:00:08 -0700
X-CSE-ConnectionGUID: bCTWHR6yTiWtyKph+320XA==
X-CSE-MsgGUID: HY6qpy2tQSO8KkCiHlisiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,192,1725346800"; 
   d="scan'208";a="114024523"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 10 Oct 2024 04:00:08 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1syqto-000AfN-2D;
	Thu, 10 Oct 2024 11:00:04 +0000
Date: Thu, 10 Oct 2024 18:59:53 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Jinjie Ruan <ruanjinjie@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 691/14344] ld.lld: error: undefined symbol:
 arch_elf_adjust_prot
Message-ID: <202410101809.HFdpybos-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Yury,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   f7c1291d7c3f15bc448cd93e29fa539386fe85fe
commit: 7de3ab4c3dd938fae3626a6344830b018eb7ba4f [691/14344] arm64: introduce binfmt_elf32.c
config: arm64-randconfig-004-20241010 (https://download.01.org/0day-ci/archive/20241010/202410101809.HFdpybos-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 70e0a7e7e6a8541bcc46908c592eed561850e416)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241010/202410101809.HFdpybos-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410101809.HFdpybos-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: arch_elf_adjust_prot
   >>> referenced by binfmt_elf.c:583 (arch/arm64/kernel/../../../fs/binfmt_elf.c:583)
   >>>               arch/arm64/kernel/binfmt_elf32.o:(load_elf_binary) in archive vmlinux.a
   >>> referenced by binfmt_elf.c:583 (arch/arm64/kernel/../../../fs/binfmt_elf.c:583)
   >>>               arch/arm64/kernel/binfmt_elf32.o:(load_elf_interp) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
