Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793143248;
	b=c7pBYcVsiGodk+3qhfvIGYRg0t/fzcsZQKADSSEXn3ByoSFpUb94aohrDU6YPHqEB4xr
	 aS4AKcILw8cnpbDr7hU8LNRqttWEivuVZfS7NGUKB3Tjwa/yx+7BTEeNwcgCHCCAKu+IA
	 d4ZhG38p6qH23IycGAJxStDpKuO5wWBrKsc/hTq/vSSZcIkPnRhDvr9Yk7AiHzoTAeiv6
	 j3YHLWBG+a6iD7kTxi4njCmUwr42Sk/q1OCleqBRcFcgRA1rr5DzOn5PZqy92g3krVOLI
	 OuiAhixqEQa0Sbc3YFHtumxM+J4qL2fR0SjTdvW2lsU9GpUl97Alfn8zo8alzQ2p9ZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793143248;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=JfQ2Yv9Pkb2CRMJpmeTfW4o81Par2ht01hmukBFtrt8=;
	b=UZrbQZDOE2H8dlN1ODsQAaVJQGtZ1C7vcb6xg3U2R9177NSZggFY3ewKMc2x2qXdS/aj
	 li4vRyXcbvbYUIkFXFHlCBZeGHfU34T9tRADp7wmKR5RdlLGWa57JG9VE7LueuoZcpE1V
	 OQvE3WiwIhaB826zicxhB69DajrFutX427fR4YGDr/l0klB6/WXSJT5wKr9wHbBKwRleA
	 +UoBs7DOdiFPJokFMX2gG4e2tduZ3ug+kKwo6SXI02j6yy0l37/V9TS9Hc4XEyH1BGJbY
	 X7qAgHYg2eEMll+4xff/AFunrFaVZ2kx7JXaKTJHg/3w/8WtwET+Kyj7HHD/LKX19tw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=bYTe0b78;
	arc=none smtp.remote-ip=198.175.65.12
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51679606A31A
	for <oe-kbuild-all@lists.linux.dev>; Tue, 27 Oct 2026 23:20:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 51679606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=bYTe0b78
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793143248; x=1824679248;
  h=date:from:to:cc:subject:message-id;
  bh=yDNmX9BstSrFl1JxPM8gmDtDRXB/MUCDae8DuwEGdL8=;
  b=bYTe0b78gkJVW8GCn1+SOXPkW+ll1YxsSjO3d+6tTEU995+3MZ9DkWM8
   XJL2Ao3b97V84Muav2uoO8aCP0QHm61I4RDPLHPL3+o/UFoglfxWFk9cx
   MwpMysIa91oXJjC4vZCxwp12I9fWVRHTpyAjQY+7svN8aOB7nfRdYtFp4
   +/oZ14oUgQr1cc+EgrNAs+Zhzuuh9GAdOHSbALVwXQVz0C/HXIe1ETY4h
   /2Dwke8fgYA1dHubq2w/snEhXDremcyGAmaGEdiMaHRbabghqXbD5d3Ja
   A7u6DQaEz/h24GOHFMZb/hZ6DTXX9Kdh5KpWBW35ef3gpjeMu8OeCsxn5
   Q==;
X-CSE-ConnectionGUID: HnHfNAzIS8SD4hTICaTRug==
X-CSE-MsgGUID: /i6CBCK4R/eikfG+rBR09g==
X-IronPort-AV: E=McAfee;i="6800,10657,11948"; a="1739416"
X-IronPort-AV: E=Sophos;i="6.27,181,1787036400"; 
   d="scan'208";a="1739416"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2026 16:20:47 -0700
X-CSE-ConnectionGUID: vAsGpAkBQQevr6enuLB5SQ==
X-CSE-MsgGUID: TEm8FvGGRzSz5c4FOigOEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,181,1787036400"; 
   d="scan'208";a="5036103"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 27 Oct 2026 16:20:46 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xLqTD-00000000XtE-2CYh;
	Tue, 27 Oct 2026 23:20:43 +0000
Date: Wed, 28 Oct 2026 07:19:46 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-6.1-2025-09 1/1]
 mm/oom_kill.c:753: warning: Function parameter or member 'tsk' not described
 in '__mark_oom_victim'
Message-ID: <202610280714.rpCULGnn-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

Hi zhengtangquan,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android14-6.1-2025-09
head:   a073a28b52027a9429f3865ea0ee88856ad1ed96
commit: 6e5f1821281fd8b67e7033f3a07d14d4d18588f9 [1/1] ANDROID: signal: Add vendor hook for memory reap
config: i386-allnoconfig (https://download.01.org/0day-ci/archive/20261028/202610280714.rpCULGnn-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261028/202610280714.rpCULGnn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610280714.rpCULGnn-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/oom_kill.c:753: warning: Function parameter or member 'tsk' not described in '__mark_oom_victim'
>> mm/oom_kill.c:753: warning: expecting prototype for tsk(). Prototype was for __mark_oom_victim() instead


vim +753 mm/oom_kill.c

   747	
   748	/**
   749	 * tsk->mm has to be non NULL and caller has to guarantee it is stable (either
   750	 * under task_lock or operate on the current).
   751	 */
   752	static void __mark_oom_victim(struct task_struct *tsk)
 > 753	{
   754		struct mm_struct *mm = tsk->mm;
   755	
   756		if (!cmpxchg(&tsk->signal->oom_mm, NULL, mm)) {
   757			mmgrab(tsk->signal->oom_mm);
   758		}
   759	}
   760	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
