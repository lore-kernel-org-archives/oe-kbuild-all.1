Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13FF470837
	for <oe-kbuild-all@lists.linux.dev>; Mon,  4 Nov 2024 20:18:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730751518; cv=none; b=GJGB5XpoJFPWYnh57G03MCQBYlbxzmnM4+F2eR+7J/LJhoa+8/rHr1XQmrbhpRTrDx9YW5CxXSbF182owP0Lzyd/ZgTLmln7UFlRzyQXMKDC7R1o4CUTNpAvfNDNSTG1uQrLQ/AscQwV4YkhtKyYtkasmZdpTHySaKePVISG1jk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730751518; c=relaxed/simple;
	bh=YoX2SDRKplDinlEUV/XbAFaaL7XMEAqMWnB7nXkHIoc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hXh1zlPCOzpmWC1YJxxTKm7g/dRXZwWmlU331We67Givu1bgUijtmzOkCtU+5RlJH7MYQGuWeR8B1mjUiZHKnxoIunqdWmq54o4fQpiRNJI9RurhYc2rW7ihWgNY3xw4p3viyqxrsT+dLu7dlX5Lc6GE9Hu+4M3iG3IFf4c2/yw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EhcOr6gb; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EhcOr6gb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730751517; x=1762287517;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YoX2SDRKplDinlEUV/XbAFaaL7XMEAqMWnB7nXkHIoc=;
  b=EhcOr6gbmGIUVRg7/K+K2I7+7cb735Az9KFXtIM9CF2FOF8Spl0XSNyU
   bHWX75EjfKrBbwhHqdHIWvUwaXrHKZYmoUwtyXXw+GYOkCoMOT2moEQ2+
   t24IA1ONsgMnM2JYEEqGKzPMuVaTUwA71xWT78FzuOBkhP6d5Akljsxtd
   rQbzNQyynq+rCQOhmufSvwv/xTMN9JrK/R8tSf90a4AeWCtoEuXh6q/Xt
   m17QirhkqcR5k26v7bTYcwiNo4tdD2H/JbZfnixjpwj7Fcl18tyIH11+3
   KNWf+Noemw8O9aCUxv7ugNVQH6nRzBX3u/5YGpl2Uj9SqKTs4z0oCoYpT
   Q==;
X-CSE-ConnectionGUID: dAPUrONBS56jojebi3Jmng==
X-CSE-MsgGUID: q9lBTusgS0eIuZywv9GJaA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="47932246"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="47932246"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2024 12:18:37 -0800
X-CSE-ConnectionGUID: oIPM6zLuSR266LnToabEJg==
X-CSE-MsgGUID: 3+CEGoSxQo65G+02ikgs+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,258,1725346800"; 
   d="scan'208";a="87699358"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 04 Nov 2024 12:18:36 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t83Wz-000lFd-1w;
	Mon, 04 Nov 2024 20:18:33 +0000
Date: Tue, 5 Nov 2024 04:17:38 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, leoliu-oc <leoliu-oc@zhaoxin.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 9864/16090]
 arch/x86/kernel/early-quirks.c:727:34: warning: no previous prototype for
 'kh40000_get_direct_dma_ops'
Message-ID: <202411050406.Ec1bzJ2a-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   ab4fcabb7d813ddd7a455c85557f8d0891df4c41
commit: 11557c1ae4529f133483879b7ee00b7d8c653be7 [9864/16090] x86/cpu/zhaoxin: Encapsulate access to kh40000_dma_direct_ops within function
config: x86_64-buildonly-randconfig-003-20241104 (https://download.01.org/0day-ci/archive/20241105/202411050406.Ec1bzJ2a-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241105/202411050406.Ec1bzJ2a-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411050406.Ec1bzJ2a-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/x86/kernel/early-quirks.c:722:6: warning: no previous prototype for 'is_zhaoxin_kh40000' [-Wmissing-prototypes]
     722 | bool is_zhaoxin_kh40000(void)
         |      ^~~~~~~~~~~~~~~~~~
>> arch/x86/kernel/early-quirks.c:727:34: warning: no previous prototype for 'kh40000_get_direct_dma_ops' [-Wmissing-prototypes]
     727 | __weak const struct dma_map_ops *kh40000_get_direct_dma_ops(void)
         |                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/kh40000_get_direct_dma_ops +727 arch/x86/kernel/early-quirks.c

   726	
 > 727	__weak const struct dma_map_ops *kh40000_get_direct_dma_ops(void)
   728	{
   729		return dma_ops;
   730	}
   731	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
