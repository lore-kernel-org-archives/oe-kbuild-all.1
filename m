Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3966E3BAD8B
	for <oe-kbuild-all@lists.linux.dev>; Wed, 25 Mar 2026 10:37:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774435045; cv=none; b=Y5HGnrD15sBnkcpCnQ8VZ1S6irU3m5BCv2i5fekLvJkgbN7r7mSHF7qF+y2IU1HXS3J7jUa/bP6tiUK0M9kOClwbz85OUrqdAwVl/+P2cICwUpsD4/7U1wdlYq1/WiAPcexXqqgahrMSYpVIa62OjW9P6cWE6DiA0nlWS64yUx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774435045; c=relaxed/simple;
	bh=gq8jJnww/HA1Ni6JyfP3K5BPKhssYQow+zdV6n/8zDo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=kNmUw/RR1yJGrzsgeTJiPKWd13xW/Axo4Z66zZqlEuvAsm+aiw5EF93aVZfBSoNfFP1bx/xioHY9haiPS6Q/BqVPydybqPwD9LD6dvU9IwFNJd9f5EVYhzzHkMnmCiOR7GGA6+sI/SkIFtoULwMLVcUuXf2rrDtHygogOwZTuyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HFi6oX7z; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HFi6oX7z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774435043; x=1805971043;
  h=date:from:to:cc:subject:message-id;
  bh=gq8jJnww/HA1Ni6JyfP3K5BPKhssYQow+zdV6n/8zDo=;
  b=HFi6oX7zNuZZJGZoy8zyOSC9Q+jXOmerQJ+lOOEqZox5BXlL6tgywtxt
   mj/Yj9FxOwwohaHv1rZW6+s0AgKEuHOQsfCFWE76K34lJIZrW1DhLuJaw
   XhA9NKW3Bq6jA2qOveEQ56V/Y/LTFSU0nmMjSVmJe8AtG5ZQIHlr7AcV0
   Bl7eKA1d6uLVYNh+jNHHyWPa9d1kCH9Rpbf7TkQIBU+MeYJGEomYAiBD0
   ETSW4DwPC9MoofJxu/GyywMI4pLBCU2PjW9eweWjqxqhZVaVdmaSFDnls
   quhR3+Z/pvZEy1y2MBvYsmj3BhtuME4lVDe3b9y4ALmMf4NuQwJWRv/tB
   w==;
X-CSE-ConnectionGUID: Tjp2+BLSTgikELDcOoO7NA==
X-CSE-MsgGUID: kvv3TUGaRi+1vBa7KggBcw==
X-IronPort-AV: E=McAfee;i="6800,10657,11739"; a="86945171"
X-IronPort-AV: E=Sophos;i="6.23,139,1770624000"; 
   d="scan'208";a="86945171"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2026 03:37:22 -0700
X-CSE-ConnectionGUID: 6mZZ+A9iTPWpSEScOkR0LQ==
X-CSE-MsgGUID: +TNAOaGoToG2P2lLNRudQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,139,1770624000"; 
   d="scan'208";a="219790447"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 25 Mar 2026 03:37:20 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w5Lbx-000000006eA-37oC;
	Wed, 25 Mar 2026 10:37:17 +0000
Date: Wed, 25 Mar 2026 18:36:27 +0800
From: kernel test robot <lkp@intel.com>
To: "Xin Li (Intel)" <xin3.li@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Ingo Molnar <mingo@kernel.org>
Subject: arch/x86/include/asm/msr.h:132:9: sparse: sparse: cast
 truncates bits from constant value (1000000ff becomes ff)
Message-ID: <202603251800.lgPYqV2b-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Xin,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   bbeb83d3182abe0d245318e274e8531e5dd7a948
commit: 519be7da37b955164c59aacaee6d6ac89f4bbe15 x86/msr: Convert __wrmsr() uses to native_wrmsr{,q}() uses
date:   11 months ago
config: x86_64-randconfig-r122-20260325 (https://download.01.org/0day-ci/archive/20260325/202603251800.lgPYqV2b-lkp@intel.com/config)
compiler: gcc-13 (Debian 13.3.0-16) 13.3.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260325/202603251800.lgPYqV2b-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603251800.lgPYqV2b-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   arch/x86/events/intel/uncore_snb.c: note: in included file:
>> arch/x86/include/asm/msr.h:132:9: sparse: sparse: cast truncates bits from constant value (1000000ff becomes ff)

vim +132 arch/x86/include/asm/msr.h

   125	
   126	/* Can be uninlined because referenced by paravirt */
   127	static inline void notrace
   128	native_write_msr(u32 msr, u32 low, u32 high)
   129	{
   130		u64 val = (u64)high << 32 | low;
   131	
 > 132		native_wrmsrq(msr, val);
   133	
   134		if (tracepoint_enabled(write_msr))
   135			do_trace_write_msr(msr, val, 0);
   136	}
   137	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
