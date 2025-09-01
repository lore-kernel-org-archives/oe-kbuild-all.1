Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A544A4502A
	for <oe-kbuild-all@lists.linux.dev>; Mon,  1 Sep 2025 04:31:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756701112; cv=none; b=HM35Jp1i5qzEYDi9AJKnwCY6v/YNZbvHqY/6S/wviHsfAaD0FvOmRo7E7UBYmPtAUbawZBrAm86VZmfnsR9JPR+f0oDt47QuQQMnTu6Gyv3rLzhe2XDUVbq6RoPhNNgaCBXO3PhbaO7E14emUzesl0Fc9HpLBlDnRs4edCcrlyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756701112; c=relaxed/simple;
	bh=wRBT+lq4YJiy6IQgIZzKL3xA3Arh+lDChAlcYajdWG8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Byi9z4FVSKRgedaMkVK0a9z9te5WF+YYI5hMWT5/5Ej3prdLFPI65DjcS4/MMEn/nr6HlqhRpJG/2QANDmuiLqxuCwHHuoMaiqBg/ynFOFK9LWxsTU6/6D5sdy0ROnirfJeHo/QhUy7oBteRB0G8sQR01EU0X2ChklawijQV/Pw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KRt7i8O6; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KRt7i8O6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756701110; x=1788237110;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wRBT+lq4YJiy6IQgIZzKL3xA3Arh+lDChAlcYajdWG8=;
  b=KRt7i8O6aZXMyOK7g1Q9ey0a24R92PWOsqUHrW7bJlUVSSmqyU+SK3c4
   S4bY9nyHj3ghmG+ZjOX3YEa96EtYI094wnnPZz9QQroI3ss2uYJaq05cH
   ggrzpuVhk6cPiXZdUtJHEI/VkfX6szg+Z69A75NZsuOjkHDzsH7x09Xv4
   K1SPs2g2fLiqYGOQD77t1ZrPD/yrVFMCBZLy+nxanzAFIaGhqxhWVqCza
   4nfwkUIhxRWcKRcc/ODJ1HBVu7+um4jBv2Zd6gdEsACQwQTRKZhHoWHkW
   IMts6Ad4bhZRHJarfPCvOLSaYT8qJ2J8kA0CSyYSy3q6lWTdPZUeWeTub
   w==;
X-CSE-ConnectionGUID: k1ClUTBfT1qaFVH71WhrPA==
X-CSE-MsgGUID: mLsSbYmdTRCQkWdM8s942A==
X-IronPort-AV: E=McAfee;i="6800,10657,11539"; a="70325986"
X-IronPort-AV: E=Sophos;i="6.18,225,1751266800"; 
   d="scan'208";a="70325986"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2025 21:31:50 -0700
X-CSE-ConnectionGUID: oQB9wzbRTlWsWL5LqWmi1w==
X-CSE-MsgGUID: 8vbuBYoMSA+TjiipuPHFnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,225,1751266800"; 
   d="scan'208";a="201793388"
Received: from lkp-server02.sh.intel.com (HELO 06ba48ef64e9) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 31 Aug 2025 21:31:50 -0700
Received: from kbuild by 06ba48ef64e9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uswC5-0000DL-14;
	Mon, 01 Sep 2025 04:31:22 +0000
Date: Mon, 1 Sep 2025 12:26:52 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-kiwi-5.10 150/150]
 kernel/events/ring_buffer.c:22:9: sparse: sparse: incorrect type in
 assignment (different base types)
Message-ID: <202509011229.F49FqqMo-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android12-kiwi-5.10
head:   77354ed8fe97f2e66ce08870a5cd54e222a15c53
commit: ef0398cf5cf150364839ffea0b0dd7c71edf2e62 [150/150] perf/ring_buffer: Allow the EPOLLRDNORM flag for poll
config: arm-randconfig-r133-20250727 (https://download.01.org/0day-ci/archive/20250901/202509011229.F49FqqMo-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 7.5.0
reproduce: (https://download.01.org/0day-ci/archive/20250901/202509011229.F49FqqMo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509011229.F49FqqMo-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> kernel/events/ring_buffer.c:22:9: sparse: sparse: incorrect type in assignment (different base types) @@     expected int volatile @@     got restricted __poll_t @@
   kernel/events/ring_buffer.c:22:9: sparse:     expected int volatile
   kernel/events/ring_buffer.c:22:9: sparse:     got restricted __poll_t
   kernel/events/ring_buffer.c:170:14: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/ring_buffer.c:170:14: sparse:    struct perf_buffer [noderef] __rcu *
   kernel/events/ring_buffer.c:170:14: sparse:    struct perf_buffer *
   kernel/events/ring_buffer.c:170:14: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/ring_buffer.c:170:14: sparse:    struct perf_buffer [noderef] __rcu *
   kernel/events/ring_buffer.c:170:14: sparse:    struct perf_buffer *
   kernel/events/ring_buffer.c:170:14: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/ring_buffer.c:170:14: sparse:    struct perf_buffer [noderef] __rcu *
   kernel/events/ring_buffer.c:170:14: sparse:    struct perf_buffer *

vim +22 kernel/events/ring_buffer.c

    19	
    20	static void perf_output_wakeup(struct perf_output_handle *handle)
    21	{
  > 22		atomic_set(&handle->rb->poll, EPOLLIN | EPOLLRDNORM);
    23	
    24		handle->event->pending_wakeup = 1;
    25		irq_work_queue(&handle->event->pending);
    26	}
    27	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
