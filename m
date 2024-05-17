Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DF9F1E86F
	for <oe-kbuild-all@lists.linux.dev>; Fri, 17 May 2024 22:57:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715986660; cv=none; b=LsomUhaO9J2AgRSJZAZpQvllfs9I1OzU5/Id4xw951iOoTokBNjRxYWMSi8sY52aTEHC4BaQj+volbyCC4Xt86hUJu6NhRpp9js3cjgZVSZSTT1XEtvxB7oGXNXe2/wNz/ea1/s31KFEMK9TOP8ttTLahEg04YsKuDdh4A9yGJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715986660; c=relaxed/simple;
	bh=v2uY/qMAW1zSd9XBknQg8bjGgF05+Rji6P5/hRmjcEk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XY01DZ3k9HyLkMRTfOelwNd779S05VnO0j7Ptp3eEGxhWFbDeTVKTLY5mS+SFqDoPb2+TXIyghy4GSuNgq3eKKkQRNNW7xp8L0uwQI5hTRa9tFnHJHJokTMatsRwBvtSP8Q6mDGN04v01TmBfQDOKkC5n7jHkrkvYepnIfJDF0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UXUFwbI6; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UXUFwbI6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715986658; x=1747522658;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=v2uY/qMAW1zSd9XBknQg8bjGgF05+Rji6P5/hRmjcEk=;
  b=UXUFwbI696l7op0Ubzc89ueKRX8pboHOyIDfTaQzJ7viYU+tPyud/ZEw
   1yyoYbh8Ny93D25+pgYU5gIbB6OeIcFqO9ewD+xKspU2/MjT1z8+U4Tuo
   nWGq1M+O55kITzw+14puQ+hzLv0R+3VGM5GTE2W7OtjuYhxqLqrQEiV6P
   4T9DTEefnugFBG9cJxG/qdiXiBlbznzvNNA4VQP3bfRwOtd5BkkMVUU28
   fboBDtsGo+jSw3xhREZV/643Kr1QggA3MlHypc0tmU1NQTQ81rtdQzswK
   dRl27+K1sdfomjYCXjZmkdkpchNcTqF+tmTYGgfTBcxqhcCw1UrqBV9oI
   A==;
X-CSE-ConnectionGUID: 90ncxZAtTrKs0gHH0uuXjQ==
X-CSE-MsgGUID: Dts61EJhTNiNCNH0ioTF2w==
X-IronPort-AV: E=McAfee;i="6600,9927,11075"; a="12311796"
X-IronPort-AV: E=Sophos;i="6.08,169,1712646000"; 
   d="scan'208";a="12311796"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 May 2024 15:57:38 -0700
X-CSE-ConnectionGUID: VSrUAv41R06Lg+Hw/xiC4A==
X-CSE-MsgGUID: KKbHMgYsSO2C52qKTwyqTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,169,1712646000"; 
   d="scan'208";a="36345494"
Received: from unknown (HELO 108735ec233b) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 17 May 2024 15:57:36 -0700
Received: from kbuild by 108735ec233b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s86Vl-0001D6-1r;
	Fri, 17 May 2024 22:57:15 +0000
Date: Sat, 18 May 2024 06:57:13 +0800
From: kernel test robot <lkp@intel.com>
To: steven@liquorix.net
Cc: oe-kbuild-all@lists.linux.dev
Subject: [zen:6.9/prjc 1/2] kernel/sched/alt_core.c:97:2: error: unterminated
 conditional directive
Message-ID: <202405180643.aTjY6Byv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/zen-kernel/zen-kernel 6.9/prjc
head:   90e00625dbe63d991978337198b3c43a1df585c9
commit: a5cf192fb67a06d43cb21229a16b58aaf671fba6 [1/2] ZEN: sched/alt: Set default timeslice to 2ms
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20240518/202405180643.aTjY6Byv-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240518/202405180643.aTjY6Byv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405180643.aTjY6Byv-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/sched/alt_core.c:97:2: error: unterminated conditional directive
      97 | #ifdef CONFIG_ZEN_INTERACTIVE
         |  ^
   1 error generated.


vim +97 kernel/sched/alt_core.c

    92	
    93	/*
    94	 * Time slice
    95	 * (default: 4 msec, units: nanoseconds)
    96	 */
  > 97	#ifdef CONFIG_ZEN_INTERACTIVE
    98	unsigned int sysctl_sched_base_slice __read_mostly	= (2 << 20);
    99	#else
   100	unsigned int sysctl_sched_base_slice __read_mostly	= (4 << 20);
   101	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
