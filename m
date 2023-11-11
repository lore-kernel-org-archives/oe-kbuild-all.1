Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54EAB3C15
	for <oe-kbuild-all@lists.linux.dev>; Sat, 11 Nov 2023 01:51:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SKLAznDb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699667464; x=1731203464;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qvrlefclfm/I1DIlTcWCJNzEOueyvaNoE3PCAjS2Zzw=;
  b=SKLAznDbn7ci94Xw7xC2qyQKUqdWPoJohHHX+JsarCBDiEdsJpQjfed8
   A2lt6aVwo4hdTqVrBtAeC5CNbxXr/0ePv4Qae9TiEht20clFUCCNXxyIT
   AewR0PDirbNQdukcRF1kXz94aMrAgTPiFgyR46fsLA1Zt/N0V0ihqvoKs
   wrSiHGH41JO0Ty/9kp0p0UNWZ7ahUgRPAi01yYrx5xvRGNeXXKyeNm/+w
   3GejQ3g5PBPFrGxH84njaZ2Zr3IsaK4hlI//i/HOlbLS9i5qglTP0Dl9o
   jSCHFrFGzRa3cPl/M/iwT0xBYQ/3/QMxbMQHWi6d+gw1uhGH7ddkVo9CA
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10890"; a="370452938"
X-IronPort-AV: E=Sophos;i="6.03,293,1694761200"; 
   d="scan'208";a="370452938"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2023 17:51:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10890"; a="881098926"
X-IronPort-AV: E=Sophos;i="6.03,293,1694761200"; 
   d="scan'208";a="881098926"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 10 Nov 2023 17:51:02 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r1d9I-000A8U-1m;
	Sat, 11 Nov 2023 01:51:00 +0000
Date: Sat, 11 Nov 2023 09:50:14 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.15 1934/24081]
 include/trace/hooks/preemptirq.h:28:1: sparse: sparse: incorrect type in
 assignment (different address spaces)
Message-ID: <202311110925.jtDV8q8F-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android13-5.15
head:   d8156345d8c56a2b082c1877eaee48a22c33014f
commit: 2e14f01dc4abfa95ab6192deea9b99c235f53ca3 [1934/24081] ANDROID: tracing: Add restricted vendor hooks for preemptirq events
config: i386-randconfig-061-20230915 (https://download.01.org/0day-ci/archive/20231111/202311110925.jtDV8q8F-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231111/202311110925.jtDV8q8F-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311110925.jtDV8q8F-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/trace/trace_preemptirq.c: note: in included file:
>> include/trace/hooks/preemptirq.h:28:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/preemptirq.h:28:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/preemptirq.h:28:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
>> include/trace/hooks/preemptirq.h:28:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/preemptirq.h:28:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/preemptirq.h:28:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/preemptirq.h:24:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/preemptirq.h:24:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/preemptirq.h:24:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/preemptirq.h:24:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/preemptirq.h:24:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/preemptirq.h:24:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
>> include/trace/hooks/preemptirq.h:28:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/preemptirq.h:28:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/preemptirq.h:28:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
>> include/trace/hooks/preemptirq.h:28:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/preemptirq.h:28:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/preemptirq.h:28:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs

vim +28 include/trace/hooks/preemptirq.h

    15	
    16	DECLARE_RESTRICTED_HOOK(android_rvh_preempt_disable,
    17		TP_PROTO(unsigned long ip, unsigned long parent_ip),
    18		TP_ARGS(ip, parent_ip), 1);
    19	
    20	DECLARE_RESTRICTED_HOOK(android_rvh_preempt_enable,
    21		TP_PROTO(unsigned long ip, unsigned long parent_ip),
    22		TP_ARGS(ip, parent_ip), 1);
    23	
    24	DECLARE_RESTRICTED_HOOK(android_rvh_irqs_disable,
    25		TP_PROTO(unsigned long ip, unsigned long parent_ip),
    26		TP_ARGS(ip, parent_ip), 1);
    27	
  > 28	DECLARE_RESTRICTED_HOOK(android_rvh_irqs_enable,
    29		TP_PROTO(unsigned long ip, unsigned long parent_ip),
    30		TP_ARGS(ip, parent_ip), 1);
    31	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
