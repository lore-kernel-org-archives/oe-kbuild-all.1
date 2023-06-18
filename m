Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 486301102
	for <oe-kbuild-all@lists.linux.dev>; Sun, 18 Jun 2023 05:56:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687067769; x=1718603769;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1krBRm2EhX7T/2Im/3VjCma002N66vVvm1xmCseV9wA=;
  b=Y5ZWRGCBgbgule0an8ZZO3sAcsEpPcLkutyPTeeh+PWKwdMhYAyM2MNb
   quPG7LIVkf2VnpUIeoYw5fsEigAcjJAzY8wv9DJu8KgL6g36fcTF+PY7L
   w3DOWre97cdJQrq/P90MaRHIJVMZZTh3nQS+dswzRpX6p2Ypk/ntzTKoq
   UFCJ58Ve/inkVMqNenHyMlvpsCdNIMV7cSbpkiNN9wdAUaBuNaD45r/Tb
   KvJdZnzUR823JeLp4fs2RqvFwQUT5TLaHIGieApHp2B9DPk9sGM2KfAW6
   LV1uQY0dB9Vr8nGN9r1Q11PVcdff+8ITijF6fFFLRN5nIBia/mFmDDuCU
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10744"; a="423109955"
X-IronPort-AV: E=Sophos;i="6.00,251,1681196400"; 
   d="scan'208";a="423109955"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2023 22:56:08 -0700
X-IronPort-AV: E=McAfee;i="6600,9927,10744"; a="746996853"
X-IronPort-AV: E=Sophos;i="6.00,251,1681196400"; 
   d="scan'208";a="746996853"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 17 Jun 2023 22:56:06 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qAlOP-0003U2-2Y;
	Sun, 18 Jun 2023 05:56:05 +0000
Date: Sun, 18 Jun 2023 13:55:14 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:mirror-chromeos-5.10-arcvm 1934/27674]
 include/trace/hooks/preemptirq.h:28:1: sparse: sparse: incorrect type in
 assignment (different address spaces)
Message-ID: <202306181343.DND6BmZF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common mirror-chromeos-5.10-arcvm
head:   31e1367ff78eb68e54a2025e9c6601e3fa6c6312
commit: 2e14f01dc4abfa95ab6192deea9b99c235f53ca3 [1934/27674] ANDROID: tracing: Add restricted vendor hooks for preemptirq events
config: x86_64-randconfig-s021-20230614 (https://download.01.org/0day-ci/archive/20230618/202306181343.DND6BmZF-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230618/202306181343.DND6BmZF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306181343.DND6BmZF-lkp@intel.com/

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
