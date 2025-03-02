Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60B871E4A9
	for <oe-kbuild-all@lists.linux.dev>; Sun,  2 Mar 2025 22:13:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740953612; cv=none; b=fu/Qc7ao3S3ou4r6qKcc3IWZfV9jMPb3NJocKxwn1Wzmg+PSQbYrC/tIiO/iWBekUO8gm1cvA5JEuOv6aB2LXPkeps4ASUgAh6Bw5FS1dq0k0CTedER6wHdCoAm8CV0K847XWhcO4+E92ahH5wPrBTWjF2/F8lgS68bREGMOQ80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740953612; c=relaxed/simple;
	bh=KdtmMnWj9wDsuuAWQKLIYRCbpSrQhjXktecit3fnr+U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rh32hQAosyiW1HoJkj7eVSYKQr8x7PaUgi1Bhe0+8PowhmGkufegSEUgiKHZ9z2V6/E2a0k5+vHCU4UxObRis5kRiobqcAf4KRUOSHxz6AfMQCTV5BEnNfIbvK2rMHC9j5JMLbu+MCpCt70iM1Hyla6VIvBbmCF4Z2zToVT4dSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AeRMD2Xr; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AeRMD2Xr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740953611; x=1772489611;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KdtmMnWj9wDsuuAWQKLIYRCbpSrQhjXktecit3fnr+U=;
  b=AeRMD2Xr1ZCRnT6iZxrPmT3vviR3G6H1CpAHeyCc0xaCclwLmfD8n9O+
   rUJfms6+dIB0ClAKO6AjC1nD83AJnWnwsKxxhNt/Lsl0xAVmmH//8DwTg
   uZUwlKcuHIfwMbc0ptcPcgbe7dsd6vVKrJBl8n/mDDUa/w/74HGNraZ17
   yUkCwDvzDQmjgFHwcIY6e+gDmt4jxul4t492gMDa5HnsUYWQ3KK+pMlB3
   BXmNzHrtJgcz3M+WPHuBMDVmGJX3sYxOG2oeihWG5lts9CXZi7VRdSAeD
   R+T0esBuAeArDQVRC4TSHydzNc8OraOzWIUK9HoEgHy8krwJ/P9KI87Dz
   A==;
X-CSE-ConnectionGUID: 2PVpWgxYR3GK3NoK1Dzpow==
X-CSE-MsgGUID: GG/LkToaS+2JMP2VYX5QUw==
X-IronPort-AV: E=McAfee;i="6700,10204,11361"; a="64278401"
X-IronPort-AV: E=Sophos;i="6.13,328,1732608000"; 
   d="scan'208";a="64278401"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Mar 2025 14:13:30 -0800
X-CSE-ConnectionGUID: JStixVH2TjSNBxHxRwqjOA==
X-CSE-MsgGUID: LEIdxmAFRXWGKvwObiB8GQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,328,1732608000"; 
   d="scan'208";a="122433879"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 02 Mar 2025 14:13:28 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1torYs-000Hg6-1X;
	Sun, 02 Mar 2025 22:13:26 +0000
Date: Mon, 3 Mar 2025 06:12:52 +0800
From: kernel test robot <lkp@intel.com>
To: Jiri Olsa <jolsa@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jolsa-perf:bpf/optimized_usdt_6 10/19]
 arch/x86/kernel/uprobes.c:797:5-26: WARNING: atomic_dec_and_test variation
 before object free at line 798.
Message-ID: <202503030629.Yx6ukR6F-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git bpf/optimized_usdt_6
head:   803241e40f9cc1123e8ea3c206caa2321853e456
commit: 5e326c47ceeb2f2e3a2db16f7cffea77ea1cc1a2 [10/19] uprobes/x86: Add mapping for optimized uprobe trampolines
config: x86_64-randconfig-102-20250303 (https://download.01.org/0day-ci/archive/20250303/202503030629.Yx6ukR6F-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503030629.Yx6ukR6F-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> arch/x86/kernel/uprobes.c:797:5-26: WARNING: atomic_dec_and_test variation before object free at line 798.

vim +797 arch/x86/kernel/uprobes.c

   791	
   792	static __maybe_unused void uprobe_trampoline_put(struct uprobe_trampoline *tramp)
   793	{
   794		if (tramp == NULL)
   795			return;
   796	
 > 797		if (atomic64_dec_and_test(&tramp->ref))
 > 798			destroy_uprobe_trampoline(tramp);
   799	}
   800	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
