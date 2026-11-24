Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795484309;
	b=lDSOCDpF2L+smAn2/UREEKy93nHNj+b7ankf0Jw1Kby3K/pytvh+zMIipkvLMtfguqvt
	 OIZX/gPl3PFD+Yk+YwNTnvUSwbHgRY1kBd8DdJf3fZUkvin7b5nfK75bKRG3r0kNoIiEc
	 DOpV9j5jsywB2lEWR26pcc0nC/MuErPltz85pitgsMAmTrDSYkAY3ksVqS9WRb+dWl6QZ
	 xAPuLdbREf+ZHxlEpBzMWL3D294231ifJame/EinGy6XCxfzec9ipLbL2wK1bD1UrQ2Nh
	 /jGut727JfqluD6ahVJz1Tr8zi7EDzU7kF2DsdgaKtqE6V0ztCJMy15TQaCSetQYy3w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795484309;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=2lIpc6oT2AqeAnbfS8ogqkdNZCEYOtGRlHBAV5ojJoU=;
	b=deB9KRm9nyehXFT45p4E0NZk020oZCekExmQQ3FSyh14gvwl05ctEPCUEMa0QTdph2IQ
	 /u0+9IxkGCwOy31VgvMmN82wCZXzfU1BPfKMcHTEYO1A8O3rFP769xdI3aZMQ8xfbKHeh
	 0Zu+5hsr2AoNBgBc78TAbN7r9Eh5F05Bp9GWRYYtylZwctMuCtKXB6iBqXWu+IH/Pnk37
	 WTqDopMtUZuFMhp0bs3hQZXEIjB0QVHyW06mF5uwoVLMenvS/yPl4LiuUuGLLC5zJalB6
	 vTF41ojXbWg0Y7hHBYNE2F/E4w42f6JVYNqzCb7xy4uvRGRghC7yGSjFiRf3wvAe51A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=nUkUKJ3V;
	arc=none smtp.remote-ip=198.175.65.13
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24800606A327
	for <oe-kbuild-all@lists.linux.dev>; Tue, 24 Nov 2026 01:38:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 24800606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=nUkUKJ3V
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795484307; x=1827020307;
  h=date:from:to:cc:subject:message-id;
  bh=2npVogKnNBo0Qe3JE1PSkjoFPIiuR4rzuKR/aiiGGRg=;
  b=nUkUKJ3VHEHm1Mb5tbGtoGdH8bCTCMoLAC+IRE9n0+aS39nJ2zNog0Zp
   OmJXTf0soLA0qhWeXlQwpSOem6Qa8BFEVz6j+hvmoNwaZEhpPcuP/kbqt
   ruVGxdA1NhKFUQnXduKcURQTU1CzFvQtk854Tb5u/EPPNjLpeippOUmZD
   D1Udufl90Rit2zgUYXamGLfdMhEcvT4M1GNLA5MxKFuzsHTFa2gyWWum8
   O/1PsaQHoXei6aPfGSl+M/Lv147lvM7SZHfqBbi/gvZ+7eS0Nx7Ce7rVD
   X8/rWz3t4PGtPcTGILtLit48u16LARgp7aGLmrFSijAzc2CH0Rl+myqJv
   g==;
X-CSE-ConnectionGUID: 1nRNaG0NTDiJQYeC7X12mg==
X-CSE-MsgGUID: xLENj+/JSjiqX01jqXAOeQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11975"; a="4204531"
X-IronPort-AV: E=Sophos;i="6.27,229,1787036400"; 
   d="scan'208";a="4204531"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2026 17:38:26 -0800
X-CSE-ConnectionGUID: q3zk3nrmRGi6m4fuS+aDOA==
X-CSE-MsgGUID: EcomvjswQ5GY5GhrcHyp5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,229,1787036400"; 
   d="scan'208";a="13234236"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa011.fm.intel.com with ESMTP; 23 Nov 2026 17:38:25 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xVfUF-0000000052P-0ig2;
	Tue, 24 Nov 2026 01:38:23 +0000
Date: Tue, 24 Nov 2026 02:37:47 +0100
From: kernel test robot <lkp@intel.com>
To: Fil Dunsky <filipp.dunsky@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, Guenter Roeck <linux@roeck-us.net>
Subject: [groeck-staging:watchdog-next 50/53]
 drivers/watchdog/arm_twd_wdt.c:225 twd_wdt_cpu_calibrate() warn: always true
 condition '(rate <= (~0)) => (0-u64max <= u64max)'
Message-ID: <20261124022938.ofTZpKti-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git watchdog-next
head:   43495d289b7cc30f95791fb7cd7999d766b659b8
commit: a7b21ffebc557efea0311b9be1b01a92611e88a8 [50/53] watchdog: Add ARM TWD (MPCore private) watchdog driver
config: sparc-randconfig-2200-20261124 (https://download.01.org/0day-ci/archive/20261124/20261124022938.ofTZpKti-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 11.5.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/20261124022938.ofTZpKti-lkp@intel.com/

smatch warnings:
drivers/watchdog/arm_twd_wdt.c:225 twd_wdt_cpu_calibrate() warn: always true condition '(rate <= (~0)) => (0-u64max <= u64max)'

vim +225 drivers/watchdog/arm_twd_wdt.c

   180	
   181	/*
   182	 * Measure PERIPHCLK rather than assuming a particular CPU clock divider.
   183	 * An active watchdog is only observed, never stopped or reloaded here.
   184	 * Otherwise temporarily use timer mode without interrupts, restoring the
   185	 * original registers afterwards. This runs on CPU0 with interrupts disabled.
   186	 */
   187	static void twd_wdt_cpu_calibrate(void *data)
   188	{
   189		struct twd_wdt *wdt = data;
   190		u32 ctrl = readl(wdt->base + TWD_WDT_CONTROL);
   191		u32 load = 0, counter = 0, first, last;
   192		bool enabled = ctrl & TWD_WDT_CTRL_ENABLE;
   193		u64 start, elapsed, rate;
   194		unsigned int divisor = FIELD_GET(TWD_WDT_CTRL_PRESCALER, ctrl) + 1;
   195	
   196		wdt->sampled_rate = 0;
   197		if (!enabled) {
   198			load = readl(wdt->base + TWD_WDT_LOAD);
   199			counter = readl(wdt->base + TWD_WDT_COUNTER);
   200			twd_wdt_cpu_stop(wdt);
   201			writel(U32_MAX, wdt->base + TWD_WDT_COUNTER);
   202			writel(TWD_WDT_CTRL_ENABLE, wdt->base + TWD_WDT_CONTROL);
   203			divisor = 1;
   204		}
   205	
   206		start = ktime_get_ns();
   207		first = readl(wdt->base + TWD_WDT_COUNTER);
   208		mdelay(2);
   209		last = readl(wdt->base + TWD_WDT_COUNTER);
   210		elapsed = ktime_get_ns() - start;
   211	
   212		if (!enabled) {
   213			twd_wdt_cpu_stop(wdt);
   214			writel(load, wdt->base + TWD_WDT_LOAD);
   215			writel(counter, wdt->base + TWD_WDT_COUNTER);
   216			writel(ctrl, wdt->base + TWD_WDT_CONTROL);
   217		}
   218	
   219		/* Reject a stopped counter, expiration or wrap during measurement. */
   220		if (!elapsed || !last || last >= first)
   221			return;
   222	
   223		rate = mul_u64_u64_div_u64((u64)(first - last) * divisor,
   224					   NSEC_PER_SEC, elapsed);
 > 225		if (rate <= ULONG_MAX)
   226			wdt->sampled_rate = rate;
   227	}
   228	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
