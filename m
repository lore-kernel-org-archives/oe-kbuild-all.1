Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42778110B
	for <oe-kbuild-all@lists.linux.dev>; Wed, 23 Aug 2023 12:47:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692794828; x=1724330828;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IK5g8/Woc0JNP0B2sXmvsgiCt+Bs7XXRiS7azlDZs4s=;
  b=hQZhVoUomXoKuaK8syKzbgZ+EQ611rXhhUBbKttqIqYnRj0L8+87B+rA
   9/1VR7lAQvEunz+KEGTI3vTsQQ671E1r4Gg28O84YY8soCtPYT6ri1X64
   iUHp+Bgl3QI1i4yoMLkWwoPKCLl6GYvccqzLPdu6MXGbhYDKzgb17ssTP
   BCI1lLgexGRpSC0H3fKyFk4YdFuSxthfVKJ3PD2Wxe6FOUXlStATvlMF7
   xH+4Ii4RvNzwkcpNq4SrmA7/GX6kpQorzVRwiwJolUnyKVxXU5HyozIw2
   JbEfeB6evtCf4DuPlvYVA9GMgiGj/syXrv8CY6bX+MB+kw4B7WnKusYLX
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10810"; a="377908687"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; 
   d="scan'208";a="377908687"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2023 05:47:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10810"; a="1067465855"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; 
   d="scan'208";a="1067465855"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 23 Aug 2023 05:47:04 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qYnGJ-0001Cj-30;
	Wed, 23 Aug 2023 12:47:03 +0000
Date: Wed, 23 Aug 2023 20:46:06 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android-4.14-stable 16583/29943]
 kernel/bpf/core.c:1500:31: sparse: sparse: incorrect type in return
 expression (different address spaces)
Message-ID: <202308232047.tGXEvJhN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android-4.14-stable
head:   6904826e1ac9739626b937fd85e37cf539fec91b
commit: 9e61c87b1f47b4dc3d48de83d85e9f17c320f91e [16583/29943] UPSTREAM: bpf: multi program support for cgroup+bpf
config: i386-randconfig-r112-20230823 (https://download.01.org/0day-ci/archive/20230823/202308232047.tGXEvJhN-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce: (https://download.01.org/0day-ci/archive/20230823/202308232047.tGXEvJhN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308232047.tGXEvJhN-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/bpf/core.c:1095:43: sparse: sparse: arithmetics on pointers to functions
>> kernel/bpf/core.c:1500:31: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected struct bpf_prog_array [noderef] <asn:4> * @@     got void * @@
   kernel/bpf/core.c:1500:31: sparse:     expected struct bpf_prog_array [noderef] <asn:4> *
   kernel/bpf/core.c:1500:31: sparse:     got void *
>> kernel/bpf/core.c:1504:17: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected struct bpf_prog_array [noderef] <asn:4> * @@     got struct bpf_prog_array * @@
   kernel/bpf/core.c:1504:17: sparse:     expected struct bpf_prog_array [noderef] <asn:4> *
   kernel/bpf/core.c:1504:17: sparse:     got struct bpf_prog_array *
   kernel/bpf/core.c:1512:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct callback_head *head @@     got struct callback_head [noderef] <asn:4> * @@
   kernel/bpf/core.c:1512:9: sparse:     expected struct callback_head *head
   kernel/bpf/core.c:1512:9: sparse:     got struct callback_head [noderef] <asn:4> *
   kernel/bpf/core.c: note: in included file (through include/trace/trace_events.h, include/trace/define_trace.h, include/trace/events/bpf.h, ...):
   include/trace/events/bpf.h:56:1: sparse: sparse: Using plain integer as NULL pointer
   include/trace/events/bpf.h:92:1: sparse: sparse: Using plain integer as NULL pointer
   include/trace/events/bpf.h:117:1: sparse: sparse: Using plain integer as NULL pointer
   include/trace/events/bpf.h:188:1: sparse: sparse: Using plain integer as NULL pointer
   include/trace/events/bpf.h:228:1: sparse: sparse: Using plain integer as NULL pointer
   include/trace/events/bpf.h:282:1: sparse: sparse: Using plain integer as NULL pointer
   include/trace/events/bpf.h:312:1: sparse: sparse: Using plain integer as NULL pointer
   kernel/bpf/core.c: note: in included file (through include/trace/trace_events.h, include/trace/define_trace.h, include/trace/events/xdp.h, ...):
   include/trace/events/xdp.h:28:1: sparse: sparse: Using plain integer as NULL pointer
   include/trace/events/xdp.h:53:1: sparse: sparse: Using plain integer as NULL pointer
   include/trace/events/xdp.h:111:1: sparse: sparse: Using plain integer as NULL pointer
   include/trace/events/xdp.h:126:1: sparse: sparse: Using plain integer as NULL pointer

vim +1500 kernel/bpf/core.c

  1496	
  1497	struct bpf_prog_array __rcu *bpf_prog_array_alloc(u32 prog_cnt, gfp_t flags)
  1498	{
  1499		if (prog_cnt)
> 1500			return kzalloc(sizeof(struct bpf_prog_array) +
  1501				       sizeof(struct bpf_prog *) * (prog_cnt + 1),
  1502				       flags);
  1503	
> 1504		return &empty_prog_array.hdr;
  1505	}
  1506	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
