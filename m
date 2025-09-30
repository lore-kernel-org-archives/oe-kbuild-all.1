Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFCF5239581
	for <oe-kbuild-all@lists.linux.dev>; Tue, 30 Sep 2025 19:34:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759260876; cv=none; b=A9EzTpVeE9Uc2R0VMWGzOj+GFFMA6Vv/0pdP73Skzo3PahXoIedywNj8/GGmyEdDBWus/jAy/26osreiq1xWv6x/Tzcw3XRN75LHuqn6SghH/D13f8yATjMRDoWkd8cSH79RMvA8g2mgFkddl8DA6rUW5wY8X2fF9h4Ksf2CbFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759260876; c=relaxed/simple;
	bh=frp0oTN9DzF3Kh33LhMhu26O5OLwD2crUnF6t0l/OLo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=m0f3eUQcbgYOoPqZMUQQCVsT+wKvt30QQu/A6PAgAk3t33Nwvx0ZZtYDLY8BVePe9SPxnoYLYkuLEynmjqHD1jPC8c8ftx/czdYXAM9KRlpRJIM6kBDfYseKOgAIRhvg/j7Djy2OlzJV31RNUXEJpiBalgSXbLiy3kGp7mOWk48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=W4vb0tnz; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="W4vb0tnz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1759260875; x=1790796875;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=frp0oTN9DzF3Kh33LhMhu26O5OLwD2crUnF6t0l/OLo=;
  b=W4vb0tnzDLheBU0kL4GF3pehaI3eNdVRBJUNnArdqBEG+K26C7Vnmhi9
   2bZuRjlZ9bfHCFfc+xxUyeoZ7+NFnnhc87V12r4g/MZOl4YmFsuELLAFT
   ZPtAvs+z3j/qKKf9xbjeJY2YdN0ZQevFId8Z55nRNBrCBJlDjlGkVR/o/
   zUIvDEQCYkajQzAxBCKBVhiWneDokqsogdMO4i3RyiyC+zc27cIh0Igf4
   M5h1nvMXSUSQWJABlc5MLLJbbjM5+VabXj8pD32/6EB2xSWLD88vhTDuX
   sFiutGIr0zoHDSD5jRtk0b15XoSQXoBa5vZu24+m9MoAuRpgk7RnITcge
   Q==;
X-CSE-ConnectionGUID: hVEgcS7JRtW9gQGSzcDa9A==
X-CSE-MsgGUID: MyE2rQurRZKwsac5ZQbbZg==
X-IronPort-AV: E=McAfee;i="6800,10657,11569"; a="60739985"
X-IronPort-AV: E=Sophos;i="6.18,304,1751266800"; 
   d="scan'208";a="60739985"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2025 12:34:34 -0700
X-CSE-ConnectionGUID: KMQikOMgSBiJUX+QTxs5Dg==
X-CSE-MsgGUID: r0boUdUyQbCobr4XtrVH+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,304,1751266800"; 
   d="scan'208";a="183798177"
Received: from lkp-server01.sh.intel.com (HELO 2f2a1232a4e4) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 30 Sep 2025 12:34:33 -0700
Received: from kbuild by 2f2a1232a4e4 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v3g7K-0002R1-2G;
	Tue, 30 Sep 2025 19:34:30 +0000
Date: Wed, 1 Oct 2025 03:33:42 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-5.10 2/2] mm/memcg_zombie_reaper.c:47:6:
 warning: no previous prototype for function 'memcg_reap_background_set'
Message-ID: <202510010312.eJBN7msR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Xu,

FYI, the error/warning still remains.

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-5.10
head:   6e46858a22077fce652e4757d5624bf5816c6639
commit: 33bbe281782b11cc34512292d2957e86a0b2cc21 [2/2] ck: mm, memcg: introduce per memcg switch to reap zombie background
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20251001/202510010312.eJBN7msR-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 39f292ffa13d7ca0d1edff27ac8fd55024bb4d19)
rustc: rustc 1.58.0 (02072b482 2022-01-11)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251001/202510010312.eJBN7msR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510010312.eJBN7msR-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/memcg_zombie_reaper.c:47:6: warning: no previous prototype for function 'memcg_reap_background_set' [-Wmissing-prototypes]
      47 | void memcg_reap_background_set(void)
         |      ^
   mm/memcg_zombie_reaper.c:47:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      47 | void memcg_reap_background_set(void)
         | ^
         | static 
>> mm/memcg_zombie_reaper.c:53:6: warning: no previous prototype for function 'memcg_reap_background_clear' [-Wmissing-prototypes]
      53 | void memcg_reap_background_clear(void)
         |      ^
   mm/memcg_zombie_reaper.c:53:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      53 | void memcg_reap_background_clear(void)
         | ^
         | static 
   2 warnings generated.


vim +/memcg_reap_background_set +47 mm/memcg_zombie_reaper.c

    46	
  > 47	void memcg_reap_background_set(void)
    48	{
    49		reaper_kthread_on |= REAP_BACKGROUND_MEMCG;
    50		wake_up_interruptible(&reaper_waitq);
    51	}
    52	
  > 53	void memcg_reap_background_clear(void)
    54	{
    55		reaper_kthread_on &= ~REAP_BACKGROUND_MEMCG;
    56	}
    57	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
