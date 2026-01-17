Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57B9A279324
	for <oe-kbuild-all@lists.linux.dev>; Sat, 17 Jan 2026 08:01:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768636909; cv=none; b=XuZHATWLloj6T3afbodo2O9zCFIqDy5YPgOOSY2brZ24I1Hf5fiGryhALXc1ocB4Xt1fUmNdUDw7MypIyl2DBGuKPR6rg2gpLe1A1HNqqzwHGkRXDcJusL556/DgHGStU4XzeaEp+F1tPnBNfuBpS8e8nLSL/uRXM5H+DRXye/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768636909; c=relaxed/simple;
	bh=onCLFuAlH5Kw8w2J5y5GWXP9BeagtYjytSkiwAaHKaY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=RYgKYONot1b0PA+be1hQSOe/wzmQScgYca1cMZhN7OYC3SIOx4QGlDGPlWdZaBRZKUNR5XKq5zOj/CXfUpqyHvnFG5GOi9QdMPkIcOwcpEm0KIdXS0jutSKqCY78GkUmRYET3XpUl+qWEgeAmHI86/7jL3tMQD9+YRtllp0GgxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XlKhMURV; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XlKhMURV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768636909; x=1800172909;
  h=date:from:to:cc:subject:message-id;
  bh=onCLFuAlH5Kw8w2J5y5GWXP9BeagtYjytSkiwAaHKaY=;
  b=XlKhMURVCrOWyZxTk0BvlIXvEPdoBFnN+1iCHTqsT/olH8lYBmmLsNUK
   mxDj5mIRCXJoPo+toNRsERFiTL1FAWdz6INyuHWFdnNB3cZk56vFus/M4
   h1fAzDOD+dk3Zs4UrMQiiYpmhPn6Wpind7goWLuSn5ilNxR+ICv54ZknT
   6nw2ujJrF+WMUxX7w+D8LWkBW9Vgg6LK81VxhGFZFU4t+ljWz32BLGdIH
   BlY70zLeM3+hk8Dt07gPNwPln2d0kv7N+vzwsGWG7fm/wKZ3duGqUlno/
   s+SRgred/T3ThFob315RvzH+5ct77x/DGl3gqHgyqy1Uom30psL9MtWlk
   Q==;
X-CSE-ConnectionGUID: qZyLoT4jRkGz8s9ITyGiTA==
X-CSE-MsgGUID: qfc9E9wLQMGY0FpxDHhS1w==
X-IronPort-AV: E=McAfee;i="6800,10657,11673"; a="81053667"
X-IronPort-AV: E=Sophos;i="6.21,233,1763452800"; 
   d="scan'208";a="81053667"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jan 2026 00:01:47 -0800
X-CSE-ConnectionGUID: GYBeK/rQSmyUkd19H+TCNg==
X-CSE-MsgGUID: cwiuNDhfS0y8bIWoj6UEkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,233,1763452800"; 
   d="scan'208";a="205043758"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 17 Jan 2026 00:01:45 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vh1Fe-00000000LfW-2R6Q;
	Sat, 17 Jan 2026 08:01:42 +0000
Date: Sat, 17 Jan 2026 16:00:50 +0800
From: kernel test robot <lkp@intel.com>
To: Brian Gerst <brgerst@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Ingo Molnar <mingo@kernel.org>
Subject: arch/x86/kernel/cpu/common.c:2083:1: sparse: sparse: symbol
 '__pcpu_scope___x86_call_depth' was not declared. Should it be static?
Message-ID: <202601171524.PAxAbxhr-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Brian,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   d3eeb99bbc99cc5eb94a4a75ed4415a0272254ef
commit: 839be1619fb897364b782997bc2c5d072d7a79f2 x86/retbleed: Move call depth to percpu hot section
date:   11 months ago
config: x86_64-randconfig-121-20260117 (https://download.01.org/0day-ci/archive/20260117/202601171524.PAxAbxhr-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260117/202601171524.PAxAbxhr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601171524.PAxAbxhr-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> arch/x86/kernel/cpu/common.c:2083:1: sparse: sparse: symbol '__pcpu_scope___x86_call_depth' was not declared. Should it be static?

vim +/__pcpu_scope___x86_call_depth +2083 arch/x86/kernel/cpu/common.c

  2076	
  2077	#ifdef CONFIG_X86_64
  2078	/*
  2079	 * Note: Do not make this dependant on CONFIG_MITIGATION_CALL_DEPTH_TRACKING
  2080	 * so that this space is reserved in the hot cache section even when the
  2081	 * mitigation is disabled.
  2082	 */
> 2083	DEFINE_PER_CPU_CACHE_HOT(u64, __x86_call_depth);
  2084	EXPORT_PER_CPU_SYMBOL(__x86_call_depth);
  2085	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
