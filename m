Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B6DA1E522
	for <oe-kbuild-all@lists.linux.dev>; Thu,  9 Nov 2023 14:04:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K2hO8QlK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699538650; x=1731074650;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=k87ZTt1ghj418i5KR43MELCVMD441PLvRcGqQ9RBwYk=;
  b=K2hO8QlKRpvAaJ1c+1X1O/l50u2qYEkfv5ber/iz55SNvU77iDKsARTb
   aoxW/BqjgxUbVoxMxcdrVa2yYmNRoOP0vhuqmDJw4oNPNeV/kzsBK/3iB
   0ywK2wUfZ2q+7mHKdL6lvKGS5QEp+6h4ZWTTc9U+63VoDJyhC7Y2qU9D3
   sa3RkzJjy6M+rdFuUEKV8CvqpfiYsRuwDEdYLKI1m1KVBJGd6PXpX6FkA
   uvWJMEy3ce2IXGbopMx799hukHY0I5+cpYWSSV702vTJ9BF0WBW1RyWCQ
   sLpELh3W3rKGmLlWixh9BGCljaExK86Ajlf50+jleQiA9ixrH2A/tuCH0
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10888"; a="456479232"
X-IronPort-AV: E=Sophos;i="6.03,289,1694761200"; 
   d="scan'208";a="456479232"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2023 06:04:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10888"; a="887000234"
X-IronPort-AV: E=Sophos;i="6.03,289,1694761200"; 
   d="scan'208";a="887000234"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 09 Nov 2023 06:04:08 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r15dd-0008m0-2i;
	Thu, 09 Nov 2023 14:04:05 +0000
Date: Thu, 9 Nov 2023 22:02:35 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.15 1934/24078]
 include/trace/hooks/preemptirq.h:28:1: sparse: sparse: incorrect type in
 assignment (different address spaces)
Message-ID: <202311092106.GR97Zrn8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android13-5.15
head:   6dcfedcb7cf5ac7ddd3c71ee1500d0e33384a489
commit: 2e14f01dc4abfa95ab6192deea9b99c235f53ca3 [1934/24078] ANDROID: tracing: Add restricted vendor hooks for preemptirq events
config: i386-randconfig-061-20230915 (https://download.01.org/0day-ci/archive/20231109/202311092106.GR97Zrn8-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231109/202311092106.GR97Zrn8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311092106.GR97Zrn8-lkp@intel.com/

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
