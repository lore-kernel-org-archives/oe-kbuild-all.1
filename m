Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795039070;
	b=vtM0QOtRFYXGWvNoo0r2pj0A2+Vuvo6nkVHJPXpTBzvawyMZntUV3a+BScx3JJQa8z80
	 6hoOwbvcPcLs2yQjDry2EhIrMwVQ5Kkk+xwaWaa0koWKutGOvtS6kxfEpTgT04y06bEuV
	 4WdIeEYuWQ9ibAxwuYe6bmzzDIz+Eb9lKuY9sud/p3+jb3bfcoB/UlYYqOtvkedDvac6D
	 HlKePBLFCtf50aMUFfT6NLTdl9aQxlGLCONtY3YYPz9k02wbx7AxMS66J8wsjQZe953vF
	 Ow8fWv4r/GUI4V5CS3bMZMTJjcpvEQkmij9vAJPjpfx8W0mlvbEnNMrwb7syOP6HgUQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795039070;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=4wzU8MiSrCQx5FDXdYWHBWEVLA7CEiGWIUqxy7xZdCE=;
	b=iqrAknOX2a6dZ0HR+eIia8nhVMUga15rCJ4BlDooDyhSXoWZrLWNah+kieqhK0gQ+EcZ
	 MOznLYTVg1Y9WWqWgCCUcCM4w9Q/KN52V7PujrEVy6ltEib3ShBnJoInMWZvr8BgQv4s/
	 NxDkuaNr4YbJ8wij0WuuLK8ka1T1/gyKXW2n8wsjTTd6cWmTm7z2Gw0/nhoope8VzyUg3
	 KsCgM/vy2xoRJEqKomeycfzx2vJgNx931ReeP417ky94lX9JcNIH/+5grwcwAGbvGvAp4
	 6j23mj3ZSH54Seu7hokiBVtX8CcobpMRB9L7Sc90MPXu0AogpNGhYSfXIFoSjOSSW9w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=J0etxtzc;
	arc=none smtp.remote-ip=198.175.65.18
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A579606A338
	for <oe-kbuild-all@lists.linux.dev>; Wed, 18 Nov 2026 21:57:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6A579606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=J0etxtzc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795039070; x=1826575070;
  h=date:from:to:cc:subject:message-id;
  bh=Jy2lBgAwSryV18Q022S+29meawayo2bmVhgw3uts3wk=;
  b=J0etxtzcDObx0a90tbH3nHiKLSFG7en/y+xVWm9THD4Pc7HBwfB/nqAV
   kmJ85N33dhXQ+cUh3nSGn5VEQzWtO8k1wz0B5e+2qcu8Chw82UcTnGmMe
   9D0edMMh2vB/bPo7Nd1sA4ry/kid2fTYDwoVdDXAA6FVfd6RtXpt/aMTQ
   WT2x71nDWumBslnlkb79D7danNpHy0nlizSgJuz1VexUyGyMvVrV9TdAB
   4WW0fwEZbrNt7r/G3BtGE5Rt8pdCqWc85BIO6ZAHsu0+3+14nVnhnBuzO
   9S63BOsSElQ9w/iN/cqc4UoSOKdv623srUP60XzGuhaWgi9Av2iNVBO6L
   w==;
X-CSE-ConnectionGUID: OMIftPfgRrOf0gSWshGxfQ==
X-CSE-MsgGUID: MdSQZFDCTw6+YcgPzmFiqA==
X-IronPort-AV: E=McAfee;i="6800,10657,11970"; a="3887614"
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="3887614"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2026 13:57:49 -0800
X-CSE-ConnectionGUID: 0OjnPqXaRWaux6xzRJptsw==
X-CSE-MsgGUID: Hn7ZY0s3TEOGmuc2ggMFIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="10158808"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by orviesa003.jf.intel.com with ESMTP; 18 Nov 2026 13:57:48 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xTnez-000000003UH-1q4S;
	Wed, 18 Nov 2026 21:57:45 +0000
Date: Wed, 18 Nov 2026 22:57:40 +0100
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-6.1-lts 200/200]
 kernel/trace/trace_osnoise.c:62:15: sparse: sparse: symbol 'osnoise_options'
 was not declared. Should it be static?
Message-ID: <20261118225518.pssZ4K4q-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://android.googlesource.com/kernel/common android14-6.1-lts
head:   32c8e7bb8f634f61dd3c764ccd86ac57794bb9f5
commit: 87465e52eefcd532f22ae8b81865e3818d508e54 [200/200] tracing/osnoise: Add osnoise/options file
config: i386-randconfig-2302-20261118 (https://download.01.org/0day-ci/archive/20261118/20261118225518.pssZ4K4q-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
sparse: v0.6.5-rc1-21-g84ec0658
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261118/20261118225518.pssZ4K4q-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/20261118225518.pssZ4K4q-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> kernel/trace/trace_osnoise.c:62:15: sparse: sparse: symbol 'osnoise_options' was not declared. Should it be static?
   kernel/trace/trace_osnoise.c:328:14: sparse: sparse: symbol 'interface_lock' was not declared. Should it be static?
   kernel/trace/trace_osnoise.c:2191:5: sparse: sparse: symbol 'timerlat_min_period' was not declared. Should it be static?
   kernel/trace/trace_osnoise.c:2192:5: sparse: sparse: symbol 'timerlat_max_period' was not declared. Should it be static?

vim +/osnoise_options +62 kernel/trace/trace_osnoise.c

    60	
    61	#define OSN_DEFAULT_OPTIONS	0
  > 62	unsigned long osnoise_options	= OSN_DEFAULT_OPTIONS;
    63	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
