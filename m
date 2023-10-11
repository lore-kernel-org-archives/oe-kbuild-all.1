Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAF4639C
	for <oe-kbuild-all@lists.linux.dev>; Wed, 11 Oct 2023 22:37:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QZiEeBg3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697063875; x=1728599875;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cGWTBZ9fidJHXcSEV4W0TqfMLjPS7GTWzVr9j+CBHgo=;
  b=QZiEeBg3fGg6sYSv18PRjcbaFKR3x2b5eyIxjzKaLp7PI7bTeo0y5Az4
   DbsS0tpIloUZeNzN4TIc+KePxiOfSL7WbUtwccO+TPDgZZSNJmEs914KM
   6ftgHZ00qzntDLaAd3IjeouU7WqP+zYNBBkzQYM7qg1+Yl5NCG+l7O/L3
   P8eYAGwNys+ZT3HgdCREHFPaOIdXKKyLOzGYQGF4rstmBiD6LPOCXadcK
   aqL5Ks1/l91sLJGTCzn7BOEVnoqYjXI2KCY4WwGIDRwOGmi/FUTzAWZlr
   EcSbqKQA7PE0kr0lGBIAR4YjfTml2IsoG4/bFY9w82kM1c9Ow7pGqtbO4
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="451274786"
X-IronPort-AV: E=Sophos;i="6.03,217,1694761200"; 
   d="scan'208";a="451274786"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Oct 2023 15:37:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="783430868"
X-IronPort-AV: E=Sophos;i="6.03,217,1694761200"; 
   d="scan'208";a="783430868"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 11 Oct 2023 15:37:50 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qqhps-0002nW-05;
	Wed, 11 Oct 2023 22:37:48 +0000
Date: Thu, 12 Oct 2023 06:37:44 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.15 1934/24020]
 include/trace/hooks/preemptirq.h:28:1: sparse: sparse: incorrect type in
 assignment (different address spaces)
Message-ID: <202310120600.FwAU5MvG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android13-5.15
head:   082a5bf28b5fd8c6fe51fb60dddabf7d617b7914
commit: 2e14f01dc4abfa95ab6192deea9b99c235f53ca3 [1934/24020] ANDROID: tracing: Add restricted vendor hooks for preemptirq events
config: i386-randconfig-061-20230915 (https://download.01.org/0day-ci/archive/20231012/202310120600.FwAU5MvG-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231012/202310120600.FwAU5MvG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310120600.FwAU5MvG-lkp@intel.com/

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
