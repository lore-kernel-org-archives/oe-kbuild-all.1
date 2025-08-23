Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DAF71A9B24
	for <oe-kbuild-all@lists.linux.dev>; Sat, 23 Aug 2025 15:38:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755963533; cv=none; b=hTY9AoksUkd7d4drc0DgesBRMWXwsv+vbT0BcnXKo5UOys+hkm6pZVl7vBIMij/r8YBEf3LxStgF446fwLKCRssL1cFUT1Qjsfw4AhCaQdm1p93c5PbPU/89JD2KjkKZeQCHSLoQiFOBtfziTyW6z7igPT9OYQVSQIPfVGUm/jo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755963533; c=relaxed/simple;
	bh=IAfoWe5TUw8xIsQ3mD5uZqql+WHxou2TQLONHdhoM2U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Gw9tud6jSWTPXV/JA4VWYiECn1DBON7zCPyyLKoKx05DxzFc5wNimhZBbzeGzy7u0jIXqKA6vBv4pzNGdi1uBGByO7Md/MnuWUrdw8ZHefmajWpk4shcHxn5VoC8Fr3XFBWoKIQo7W2BtTRXhVjH3BnIvgjSg9XjXd3gt/clcd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FjafWlia; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FjafWlia"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755963531; x=1787499531;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IAfoWe5TUw8xIsQ3mD5uZqql+WHxou2TQLONHdhoM2U=;
  b=FjafWlia3i8RMp0RPGJWPkqfnyE0W+SK6jCmhAiQlOEs9D7qNiPh4zHM
   VOS8To9WE+teRx6Ft9gOG1+1PCM9TH6i68eFPgFHUcs5v4SGnCQBuk7pG
   5Rwe+XxxCmXs88kAznQHojLf4AJFVOoFP1KAAHTSP2RnSGMcz6tnzFnw3
   XS8/qWZVpueU6KUSuQwYe7r4mLrpGAAKAufzZ6ZualKC/jjwtURuYy9yT
   ZIwdBTgBIvQF15fd0op9mAtpP8jRR9UbieYWS1k1GN5LKbXvqp/7B2s6D
   E8KH2Q+1yJq372W7ptGHXkqRDow0EO9nOkY74GPxAjsNSpPlWrO/R2sMV
   A==;
X-CSE-ConnectionGUID: Oi2BQRVjRo+/AenBZJyljQ==
X-CSE-MsgGUID: Ive0nrl5Sj2tXnWS1Cqb5A==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="68947451"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="68947451"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2025 08:38:51 -0700
X-CSE-ConnectionGUID: LqAJrxNlShyATQ08uJTIUg==
X-CSE-MsgGUID: a8emHETaQ0++zRDJuslqQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="199815078"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 23 Aug 2025 08:38:48 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1upqKM-000MNp-0t;
	Sat, 23 Aug 2025 15:38:46 +0000
Date: Sat, 23 Aug 2025 23:38:05 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:intel-5.10-GNR-perf-uncore-ANBZ24140 0/2]
 mm/memcg_zombie_reaper.c:47:6: warning: no previous prototype for function
 'memcg_reap_background_set'
Message-ID: <202508232329.V5s1Afgb-lkp@intel.com>
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

tree:   https://gitee.com/anolis/intel-cloud-kernel.git intel-5.10-GNR-perf-uncore-ANBZ24140
head:   5b97140220e2f9196fa5de48f6be468691f8b43b
commit: 33bbe281782b11cc34512292d2957e86a0b2cc21 [0/2] ck: mm, memcg: introduce per memcg switch to reap zombie background
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20250823/202508232329.V5s1Afgb-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project d26ea02060b1c9db751d188b2edb0059a9eb273d)
rustc: rustc 1.58.0 (02072b482 2022-01-11)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250823/202508232329.V5s1Afgb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508232329.V5s1Afgb-lkp@intel.com/

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
