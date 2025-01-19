Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F06841B0413
	for <oe-kbuild-all@lists.linux.dev>; Sun, 19 Jan 2025 14:37:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737297473; cv=none; b=eernXTfvn3d+gvC8no+Pfa34PYS9AaGM1YwU3DqjVqayalnjT8p5clB5DT45uO+Rk10t1ufaDe8HhwkCcHMfw3tHyWKlFJIEWolBBqnuTvmYAnAtJimuIYIXTh+GVUss0jLC+P+PHSmSGsTnLD4mgrSsRSrI2d/XCC79ELUWNCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737297473; c=relaxed/simple;
	bh=mgNEcDbTaawy7qbjOGMtAqXVf4R69HHoq/dNIJCdA0Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TvKkCq+K63etq1zIKegJTUaV45G1Az7xycOKZ7WJAi9CAG8LMG+KP8vgiQrtxYKk+5RQXrQA/Zibaf5M/fLGizXsCFZxhYffP3kTTYIqh3+Q62aF0vE/10KSUUsojqycs86MGMMMIU1aLU7BGthM7IMVinL9Ul6OirR6qDoU2ZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FeKo4shr; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FeKo4shr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737297472; x=1768833472;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mgNEcDbTaawy7qbjOGMtAqXVf4R69HHoq/dNIJCdA0Y=;
  b=FeKo4shrD8kF0JjXRz3PTO3Bk6PkCxEGQQUN7jaE/d6X8/RxcXQoulvR
   LWkzWpGLg3FP5hQIrWO1/cIcraDS0G5GWLd/RD3SuEG2IEXfHBaJjT+oq
   YZerXrjb0xqyHklZDh/YY7pW4X8EK/JJJYsucgDnp9Ho5Kz73tU+UOKpV
   JSCS5ZS8OaSqqx3lD6iylOEJnw6JqnNRAItknThY16RHU5GA3z3G03/Ku
   ptLHXhUOXI6TovQdMPxNfLXkXJWo2NRteOv4WBbeD6tgoGhID3zfpJl0K
   F5qgBsgYj/i5XJKjz7iqdpcXUj2uORsIadoHNuyy6TACkd9+Mq3KTUAfd
   w==;
X-CSE-ConnectionGUID: /j0QWEuWSsms97C8cVIhWg==
X-CSE-MsgGUID: P5llvD1fTLGLm3QZNVhMAg==
X-IronPort-AV: E=McAfee;i="6700,10204,11320"; a="41346354"
X-IronPort-AV: E=Sophos;i="6.13,217,1732608000"; 
   d="scan'208";a="41346354"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2025 06:37:52 -0800
X-CSE-ConnectionGUID: 8B3oGLPoRsaDY4X3kUq5oQ==
X-CSE-MsgGUID: /CepHU/jSFSHHVEoppNufg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="143520544"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 19 Jan 2025 06:37:50 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tZWQt-000VWh-2j;
	Sun, 19 Jan 2025 14:37:47 +0000
Date: Sun, 19 Jan 2025 22:37:41 +0800
From: kernel test robot <lkp@intel.com>
To: Noah Goldstein <goldstein.w.n@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Dave Hansen <dave.hansen@linux.intel.com>
Subject: WARNING: modpost: "csum_partial" [lib/checksum_kunit.ko] has no CRC!
Message-ID: <202501192246.9Jy3L3Gy-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Noah,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   fda5e3f284002ea55dac1c98c1498d6dd684046e
commit: 688eb8191b475db5acfd48634600b04fd3dda9ad x86/csum: Improve performance of `csum_partial`
date:   1 year, 8 months ago
config: um-randconfig-r053-20231219 (https://download.01.org/0day-ci/archive/20250119/202501192246.9Jy3L3Gy-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250119/202501192246.9Jy3L3Gy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501192246.9Jy3L3Gy-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: EXPORT symbol "cmpxchg8b_emu" [vmlinux] version generation failed, symbol will not be versioned.
Is "cmpxchg8b_emu" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "csum_partial" [vmlinux] version generation failed, symbol will not be versioned.
Is "csum_partial" prototyped in <asm/asm-prototypes.h>?
>> WARNING: modpost: "csum_partial" [lib/checksum_kunit.ko] has no CRC!
WARNING: modpost: "csum_partial" [net/netfilter/nf_tables.ko] has no CRC!
WARNING: modpost: "csum_partial" [net/netfilter/ipvs/ip_vs.ko] has no CRC!
WARNING: modpost: "csum_partial" [net/ipv4/netfilter/nf_nat_snmp_basic.ko] has no CRC!
WARNING: modpost: "csum_partial" [net/ipv6/netfilter/nf_defrag_ipv6.ko] has no CRC!
WARNING: modpost: "csum_partial" [net/ipv6/netfilter/nf_reject_ipv6.ko] has no CRC!
WARNING: modpost: "csum_partial" [net/ipv6/netfilter/ip6t_NPT.ko] has no CRC!
WARNING: modpost: "csum_partial" [net/wireless/cfg80211.ko] has no CRC!
WARNING: modpost: "csum_partial" [net/bridge/bridge.ko] has no CRC!
WARNING: modpost: "csum_partial" [net/mac80211/mac80211.ko] has no CRC!
WARNING: modpost: "csum_partial" [net/openvswitch/openvswitch.ko] has no CRC!
WARNING: modpost: "csum_partial" [net/nsh/nsh.ko] has no CRC!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
