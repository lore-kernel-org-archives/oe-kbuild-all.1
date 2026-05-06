Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE2243EF648
	for <oe-kbuild-all@lists.linux.dev>; Wed,  6 May 2026 15:40:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778082015; cv=none; b=T5tMz7CaqHLO4z5+FJhXsSC5d0KkQNU8xNyYpsHO2w9R249hON0+07XJxOU4CbA1hTNhROwOYpf/WGIiOOcG64PhTREZFL+WMe8+Ndgs/61aGaSl2E7aooQwCVocGO5h/JWDghfqOyzvKF+ku175ZH6JUbHlRvNmlOpVEcj/dQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778082015; c=relaxed/simple;
	bh=sQc2kok19+SDXqc+BkWIkw+/Qoi3l0Z8sXh3ybYQJ1I=;
	h=Date:From:To:Cc:Subject:Message-ID; b=hys+spKfvh2tAYkvDPg7QpZ4KYG6eIOF27N4/upUNVrSZjaPGqEYGQ1kztv/Dftyh3Gew5sBQSOncJukXxcHv3WQhr9a565XDUUqT24oUFRo+uN9NxIhNnzr26cdlB9r0k1UkeMOmg6Ej/L9clIUhupopqZUk7d//HOtvKguQII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VpMg9Fh9; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VpMg9Fh9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778082013; x=1809618013;
  h=date:from:to:cc:subject:message-id;
  bh=sQc2kok19+SDXqc+BkWIkw+/Qoi3l0Z8sXh3ybYQJ1I=;
  b=VpMg9Fh9vG3h7FRBMCmzAfxkvnQjnGBWuoJHFc+luyLVuApTmpAaUDmQ
   Wcf/wc3NU9xi2v9UUr0+Nd7B1CTxahWY6ndrY/gmZwKcAMQu2i1nadnUb
   BiPXDHS4x2Kb+qlGPbsbospCm97qPfaOBbTVZXS87GlnOP5fF4NGjVtYM
   WgaktJKh94pPidS8jMim3Ul2NEaWSS6kQ/n7Wg/0SyzJIO1TcErjDQ3W7
   3TER23N/9WXZffZfjvGET3a/v+JHZyMOJjhhInk8oLfyVCuOEQoYccerN
   SMQU2zTc5EnR6RwHveMD3MEaR9bmv4uwkDDIIsEwnE2cqHGC2SZVA31Mt
   Q==;
X-CSE-ConnectionGUID: 2ebqgc1mTSejJsnpV6QPVg==
X-CSE-MsgGUID: Sl/CznZgSoGfoODkiiaiKg==
X-IronPort-AV: E=McAfee;i="6800,10657,11778"; a="89604324"
X-IronPort-AV: E=Sophos;i="6.23,219,1770624000"; 
   d="scan'208";a="89604324"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2026 08:40:12 -0700
X-CSE-ConnectionGUID: 7X5VPGJWQiW0aDCP/JMfyw==
X-CSE-MsgGUID: tXNkkDiyQZuqzIG2vYiNbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,219,1770624000"; 
   d="scan'208";a="240161519"
Received: from lkp-server01.sh.intel.com (HELO 9ec114424ce8) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 06 May 2026 08:40:11 -0700
Received: from kbuild by 9ec114424ce8 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wKeM4-0000000011R-1PeU;
	Wed, 06 May 2026 15:40:08 +0000
Date: Wed, 06 May 2026 23:39:51 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18 0/1] WARNING: modpost:
 "inet_csk_get_port" [net/wireless/cfg80211.ko] has no CRC!
Message-ID: <202605062311.lEilax41-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi jiangxinpei,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android17-6.18
head:   7b7db2df054fe9a97461f5f8ec3f28e1390fe3f1
commit: 5ce1842cd12dbf6fb8c0373e4b727073ef0d2e3b [0/1] ANDROID: GKI: net: add vendor hook for network quality estimation
config: i386-randconfig-005-20260506 (https://download.01.org/0day-ci/archive/20260506/202605062311.lEilax41-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260506/202605062311.lEilax41-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605062311.lEilax41-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: vmlinux: memblock_end_of_DRAM: EXPORT_SYMBOL used for init symbol. Remove __init or EXPORT_SYMBOL.
WARNING: modpost: EXPORT symbol "inet_rcv_saddr_equal" [vmlinux] version generation failed, symbol will not be versioned.
Is "inet_rcv_saddr_equal" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "inet_sk_get_local_port_range" [vmlinux] version generation failed, symbol will not be versioned.
Is "inet_sk_get_local_port_range" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "inet_csk_get_port" [vmlinux] version generation failed, symbol will not be versioned.
Is "inet_csk_get_port" prototyped in <asm/asm-prototypes.h>?
>> WARNING: modpost: "inet_csk_get_port" [net/wireless/cfg80211.ko] has no CRC!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
