Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3E39193090
	for <oe-kbuild-all@lists.linux.dev>; Tue,  1 Oct 2024 02:45:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727750751; cv=none; b=IavujlZ3MyyXXiEdvK9m0J5Rz6QipAVvhkV99NrsduN59lKpXSpbQ/4yQsZ4H8nzBi5Rt5TcNhDocIR+PCB7ggEnLZ0Apb+ejRayCYH57A5WhSmqT+keqCD47/C006leWWqy8LFhDdviooUJE+J8Sg++WkaTcTFG72DEoEJkxMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727750751; c=relaxed/simple;
	bh=F5u3AkCYjxxpavoO6PXzgFyWUZglM6vzia+n5O3pT8g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sL21R4Bz1A9bPli0v4eB46A6qF4fPp5QKG+BtQNTdzsLK9Th6Pu62v8+FvuP8COl2nyvr/4d99AZhY5rl6fg6KcJtOdGVZr5ViORD08d5KMN9UFO/UImHfc9u9sgY8YKNzVUG9nmeqhdvrvxpTc/nMFSyE1z2VtHY3YtkmSttnY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QHiAs/YZ; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QHiAs/YZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727750750; x=1759286750;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=F5u3AkCYjxxpavoO6PXzgFyWUZglM6vzia+n5O3pT8g=;
  b=QHiAs/YZSA7VmiL+Q4aSSg+q0ewP0xBwv7yZugf4XPzcUDjJ0Ge7jSmQ
   7RsslJXimOri7F6ejwrrdtsKD+1arACR9fVtSdPgdKg5sS2oJjoueqgT+
   3Eu3T6Uz6AD72+kOPhfZlSR/0BeMresiymJonWbhVEp1XQWW9EIpA1bu1
   I88+4XsocgmJAgnX87P2+kY5zfFJgYEZeXPyc5LrxU8f9tuln7V1pGXwy
   rYTe/DJgzSkpZFmnDyzI4xQdYuuRT30+Z+FSLHKm+fGXdJc9CHJf0P1fj
   aSlELYEFeMqEfLj0OjoP4y7ioNa6u4tn/ntqJBefhjuTgF5epXH+27UkJ
   w==;
X-CSE-ConnectionGUID: /WouMIIWQmerHGVYXyLxhQ==
X-CSE-MsgGUID: jHoC78cYQe+wGsnGiahODg==
X-IronPort-AV: E=McAfee;i="6700,10204,11211"; a="26672831"
X-IronPort-AV: E=Sophos;i="6.11,167,1725346800"; 
   d="scan'208";a="26672831"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2024 19:45:49 -0700
X-CSE-ConnectionGUID: RXJqDYFsSkGOsxQog31FIg==
X-CSE-MsgGUID: KoUKr65zSH+S43Jo4SpzeA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,167,1725346800"; 
   d="scan'208";a="73922331"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 30 Sep 2024 19:45:48 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1svStW-000QAb-1D;
	Tue, 01 Oct 2024 02:45:46 +0000
Date: Tue, 1 Oct 2024 10:45:13 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yongqiang Liu <duanzi@zju.edu.cn>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 20444/23811]
 arch/arm64/kernel/cpufeature.c:1287:9: error: 'a32_elf_hwcap2' undeclared;
 did you mean 'elf_hwcap'?
Message-ID: <202410011231.Vgh2PQm5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi James,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   5c63bd0fa5e86474d30ecd06d67f2393de081434
commit: 6dfc76f160cb5e8bf25cb85d4763cdc3144bfda8 [20444/23811] arm64: errata: Remove AES hwcap for COMPAT tasks
config: arm64-randconfig-002-20240930 (https://download.01.org/0day-ci/archive/20241001/202410011231.Vgh2PQm5-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241001/202410011231.Vgh2PQm5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410011231.Vgh2PQm5-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/arm64/kernel/cpufeature.c: In function 'elf_hwcap_fixup':
>> arch/arm64/kernel/cpufeature.c:1287:9: error: 'a32_elf_hwcap2' undeclared (first use in this function); did you mean 'elf_hwcap'?
    1287 |         a32_elf_hwcap2 &= ~COMPAT_HWCAP2_AES;
         |         ^~~~~~~~~~~~~~
         |         elf_hwcap
   arch/arm64/kernel/cpufeature.c:1287:9: note: each undeclared identifier is reported only once for each function it appears in


vim +1287 arch/arm64/kernel/cpufeature.c

  1282	
  1283	static void elf_hwcap_fixup(void)
  1284	{
  1285	#ifdef CONFIG_ARM64_ERRATUM_1742098
  1286	    if (cpus_have_const_cap(ARM64_WORKAROUND_1742098))
> 1287	        a32_elf_hwcap2 &= ~COMPAT_HWCAP2_AES;
  1288	#endif /* ARM64_ERRATUM_1742098 */
  1289	}
  1290	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
