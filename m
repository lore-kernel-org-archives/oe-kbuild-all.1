Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 880DF16BE0B
	for <oe-kbuild-all@lists.linux.dev>; Sun,  3 Nov 2024 10:37:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730630245; cv=none; b=r7vcFo22jR2rXzl6AO8klbMg6nzFOQf3nL4Xwogd7yaU1jfBfOSVosXLwSghoCKg2qbx5igRqI4uEUvJSfITdVZsUIx+5VFJ8qCbVp7CytjtnDU7pbrouoVs/7xApHxVzx9k58cyKN5tA00RFezIR7/xh6F6Vy9VvKcaAQZSSxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730630245; c=relaxed/simple;
	bh=d6n3SjFiYxHl0UGRvHRoiHTNmm0NAOLf+AJuYXfg0yY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=D6YUdhgkdgen/cM5ADq1TqM9pvgx1l3sJ2b+L2Am1bpZwkiy5lk8Qw/B/htmGub0IWEOWhchuIlJiOQXlttR77o4T9ZHhDj2D6x59R6rrSbt/Ea6ltKT4F3qBsTB5JiXoNXKVj1JY3BkrQGzN22yscFNOhSvs6//EXSdK4CqnLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bI2ReT3W; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bI2ReT3W"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730630243; x=1762166243;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=d6n3SjFiYxHl0UGRvHRoiHTNmm0NAOLf+AJuYXfg0yY=;
  b=bI2ReT3WiE4d/e8aindLO9H8WVjCsUaM1Q9sGx/1fHp7X4y2Jfa+kYMI
   BEtAIMnmE8dVhc4ieSsr8u4vMz8WagCnvoBij14iegugPppo0cdD+0lgI
   HhJJLQ6+q2Kt6Ew2t6MzbhiDYsY9jAlWqNPh8h86NmO2zgRhsfaeGUFD+
   EJUAc9VHwr+/5zm4HcIKfAxb5PLgJhBe2rIyQ9Ue8K5TpRew0GoL800Wi
   IQDyyGVOTfhIrzPnAQezSap4E306Jsc0fS2YMXvNZl4+Pmnnx4xb6nS9B
   WY2GNF1dhDxyB3J+OmLNeqqncwOE/E8beNptbTNVAEo0p9TMH31pkaseR
   g==;
X-CSE-ConnectionGUID: 8hLSBLXdRNqyJOefycp9wA==
X-CSE-MsgGUID: uEEx75HDRTewX3ZQahpGlA==
X-IronPort-AV: E=McAfee;i="6700,10204,11244"; a="55735433"
X-IronPort-AV: E=Sophos;i="6.11,255,1725346800"; 
   d="scan'208";a="55735433"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2024 02:37:23 -0800
X-CSE-ConnectionGUID: buXug6qMSWGnRdjVmTya1A==
X-CSE-MsgGUID: FDD92fZXQFWEWhB+o35omQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,255,1725346800"; 
   d="scan'208";a="83052323"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 03 Nov 2024 02:37:22 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t7Xyx-000jtV-2e;
	Sun, 03 Nov 2024 10:37:19 +0000
Date: Sun, 3 Nov 2024 18:36:33 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Xiongfeng Wang <wangxiongfeng2@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1245/1245] kernel/time/.tmp_hrtimer.o:
 warning: objtool: hrtimer_start_range_ns()+0x2b3: unreachable instruction
Message-ID: <202411031810.7yoZknlT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   e833cceaa63f729c44be494d90d6ee3bfaf22faf
commit: 40ecfb28732cefd0c5658f7c10543bbc4cd41cb8 [1245/1245] hrtimer: Prevent queuing of hrtimer without a function callback
config: x86_64-buildonly-randconfig-003-20241031 (https://download.01.org/0day-ci/archive/20241103/202411031810.7yoZknlT-lkp@intel.com/config)
compiler: clang version 19.1.2 (https://github.com/llvm/llvm-project 7ba7d8e2f7b6445b60679da826210cdde29eaf8b)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241103/202411031810.7yoZknlT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411031810.7yoZknlT-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/time/hrtimer.c:130:21: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
     130 |         [CLOCK_REALTIME]        = HRTIMER_BASE_REALTIME,
         |                                   ^~~~~~~~~~~~~~~~~~~~~
   kernel/time/hrtimer.c:128:27: note: previous initialization is here
     128 |         [0 ... MAX_CLOCKS - 1]  = HRTIMER_MAX_CLOCK_BASES,
         |                                   ^~~~~~~~~~~~~~~~~~~~~~~
   kernel/time/hrtimer.c:131:22: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
     131 |         [CLOCK_MONOTONIC]       = HRTIMER_BASE_MONOTONIC,
         |                                   ^~~~~~~~~~~~~~~~~~~~~~
   kernel/time/hrtimer.c:128:27: note: previous initialization is here
     128 |         [0 ... MAX_CLOCKS - 1]  = HRTIMER_MAX_CLOCK_BASES,
         |                                   ^~~~~~~~~~~~~~~~~~~~~~~
   kernel/time/hrtimer.c:132:21: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
     132 |         [CLOCK_BOOTTIME]        = HRTIMER_BASE_BOOTTIME,
         |                                   ^~~~~~~~~~~~~~~~~~~~~
   kernel/time/hrtimer.c:128:27: note: previous initialization is here
     128 |         [0 ... MAX_CLOCKS - 1]  = HRTIMER_MAX_CLOCK_BASES,
         |                                   ^~~~~~~~~~~~~~~~~~~~~~~
   kernel/time/hrtimer.c:133:17: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
     133 |         [CLOCK_TAI]             = HRTIMER_BASE_TAI,
         |                                   ^~~~~~~~~~~~~~~~
   kernel/time/hrtimer.c:128:27: note: previous initialization is here
     128 |         [0 ... MAX_CLOCKS - 1]  = HRTIMER_MAX_CLOCK_BASES,
         |                                   ^~~~~~~~~~~~~~~~~~~~~~~
   4 warnings generated.
>> kernel/time/.tmp_hrtimer.o: warning: objtool: hrtimer_start_range_ns()+0x2b3: unreachable instruction

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
