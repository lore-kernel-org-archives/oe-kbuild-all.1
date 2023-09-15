Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A94581094C
	for <oe-kbuild-all@lists.linux.dev>; Fri, 15 Sep 2023 19:29:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694806149; x=1726342149;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GWQYM3b7stH24wADI/w2n9ADTCVDOtU8CYA0kQchk8k=;
  b=fI2vGaAtHypXluZr4hDz/RVj+jUyjes5YE19FERAs0sLXYAxIXZx/pQH
   QDaHkEYa7wSGgTxtVzITPAoOuC0fwB8WhHWgp9TGn9o1Jjdy8G1q0c0gx
   XnbZeKRV1DLeLMkNg6LTntrGzx0hm196VgboCT7rGufxHVbTsLeuJK+RW
   L7TX7j8XTER50TH2T3QgoyQdT6GjRDF5r7/btGrkXEDcWDX8vfo1UuQxN
   LbU51241C9xKHLR7Ksdcx2mdrPNl4Abz6fqtms6GaEC2FVWAtlRtLWcIa
   +G8VvtwtgSS+itIhP+xkvtJ5PtSGacCXxF0LD8hFjgtzWcBkrMejN8Obh
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10834"; a="382061054"
X-IronPort-AV: E=Sophos;i="6.02,149,1688454000"; 
   d="scan'208";a="382061054"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2023 12:29:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10834"; a="780210312"
X-IronPort-AV: E=Sophos;i="6.02,150,1688454000"; 
   d="scan'208";a="780210312"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 15 Sep 2023 12:28:59 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qhEUp-0003Ka-02;
	Fri, 15 Sep 2023 19:28:56 +0000
Date: Sat, 16 Sep 2023 03:27:50 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.15 1934/23341]
 include/trace/hooks/preemptirq.h:28:1: sparse: sparse: incorrect type in
 assignment (different address spaces)
Message-ID: <202309160317.R2RIdCJb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android13-5.15
head:   f9a1230327dc4d4a5a2b9e519e7bbe4289f660ad
commit: 2e14f01dc4abfa95ab6192deea9b99c235f53ca3 [1934/23341] ANDROID: tracing: Add restricted vendor hooks for preemptirq events
config: i386-randconfig-061-20230915 (https://download.01.org/0day-ci/archive/20230916/202309160317.R2RIdCJb-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230916/202309160317.R2RIdCJb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309160317.R2RIdCJb-lkp@intel.com/

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
