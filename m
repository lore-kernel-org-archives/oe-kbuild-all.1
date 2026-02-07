Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25EE3256C84
	for <oe-kbuild-all@lists.linux.dev>; Sat,  7 Feb 2026 11:47:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770464864; cv=none; b=SV7gATmVzxThH4iIAvlslLu4XhgErpMseuUi87qc7lYgZrNnKaGEz19aY1h5LBZAZoajrTZAWStQIk7FMLrAqjmqu2tVs10aghJIldTvX9HjpMYF4S36iqhkkN+6ZvDW/IWNKIWVgGPwmwjA0hOYjHmVFcO+BtKlkgj00G850js=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770464864; c=relaxed/simple;
	bh=66ln6RYmbjDwR4YFVmqzR67eb2opxSABfI6Ej8bbXvA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=nPMr/FPJ4pMZ+FdycCoECV3lFpLFSKfjxSf3ihvEMcyFmPhzpUPfQ2TRZXDNqVZnnugb8R9aZOsEcm2nvN93Rr8O+jnf5Sc0U5EHAiJez1mHpM2ADfjJiOiQfalb9yA5z3Cm2cOjv073u8hO1sXGXU4hgQXjC58nhwl+83JxKJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DfcaXfd1; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DfcaXfd1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770464864; x=1802000864;
  h=date:from:to:cc:subject:message-id;
  bh=66ln6RYmbjDwR4YFVmqzR67eb2opxSABfI6Ej8bbXvA=;
  b=DfcaXfd1x9R68T657jkYz2KjWrrjZx6WCSDrjgDl/n5Ywf9ZulTlPfqk
   FGRu6VRKyukHEvcj8iPymmCBj+fswl8pl10NcGS+W4boBC5pfm3DKKJ+K
   gBbITjljsfWUK4LXQXZ3Pm4rKmoRjaACib0xrnPojbBhsoZi4ShyZ4Ayw
   E2/+v8mxmy7G6byHl62elqGGwv0GnZ/DPpz3sGA8xCu2jeqzhBn+CJsBk
   oBW+ORDqPwn5ioVGskiHGCYEHStGyK4OzrVBh1NrLsCvw8+bmsImgUUYV
   7Qct5z6OhPFMspfsJLIUydxXOjYuLTFJIk/kk3Nb6sktiwcVd9ZfylCD0
   w==;
X-CSE-ConnectionGUID: eB0qVo2uRECymkt5BtlR2w==
X-CSE-MsgGUID: 0fYm0JH+Q5+f7VMd8qqXig==
X-IronPort-AV: E=McAfee;i="6800,10657,11693"; a="71553507"
X-IronPort-AV: E=Sophos;i="6.21,278,1763452800"; 
   d="scan'208";a="71553507"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2026 03:47:43 -0800
X-CSE-ConnectionGUID: UNoBt+XCT/6IiPg4YAolzg==
X-CSE-MsgGUID: vys6BUuTT5q1sg6P1yt1hA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,278,1763452800"; 
   d="scan'208";a="210417638"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 07 Feb 2026 03:47:42 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vogmp-00000000lcc-2sLt;
	Sat, 07 Feb 2026 11:47:39 +0000
Date: Sat, 07 Feb 2026 19:47:24 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 1/1]
 include/trace/hooks/reboot.h:12:1: sparse: sparse: incorrect type in
 assignment (different address spaces)
Message-ID: <202602071917.xEdEodx0-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   eeee2f3cb9b462b9954fc31022a42fe014fbdc24
commit: 70e95a10a553c0c530694b8939d25fbb984647d0 [1/1] ANDROID: vendor_hooks: add hook to record reboot reason
config: i386-randconfig-r111-20260207 (https://download.01.org/0day-ci/archive/20260207/202602071917.xEdEodx0-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260207/202602071917.xEdEodx0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602071917.xEdEodx0-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/reboot.c: note: in included file:
>> include/trace/hooks/reboot.h:12:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/reboot.h:12:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/reboot.h:12:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs

vim +12 include/trace/hooks/reboot.h

    11	
  > 12	DECLARE_RESTRICTED_HOOK(android_rvh_hw_protection_shutdown,
    13		TP_PROTO(const char *reason),
    14		TP_ARGS(reason), 1);
    15	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
