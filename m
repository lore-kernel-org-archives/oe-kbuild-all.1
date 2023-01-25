Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 204DD1102
	for <oe-kbuild-all@lists.linux.dev>; Wed, 25 Jan 2023 05:01:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674622908; x=1706158908;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Pnw/Du6dDdTJQGXv/s1BJN9XqssA7Jj72f5Nyn9ik6Y=;
  b=KrMWY/mJPwwQ/wu84R4ak25XXh38HlkiYUIfN7Gp1VlQrrOPCzmo/kGC
   9hpU/xRsD7F5EeWYgnL0RKCCYnarYeQgEA7xjSQhu8njCiIz7vztYIZx4
   HKm2eKgE1mpnjB02mOwmhmTxTm9+Tnf80OePUmKJ5rVFybctDFvadk7vZ
   YNdnRD3Reo+aKVZGSZ4cje0KdEK/vLL/5BmnBLT9BYkAjVX4SNSEwYlYS
   y4NX+2jXeNVQ4eEXyf3KwrR1EWIsqvFPXrewcyUy5wgQNuRiZJ8pR/jtV
   9QSnD4itsmn/G+nibpuucLGiz6GFuPIe/VOCxW/wY6Ky8jew7WURJRwKs
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10600"; a="324182220"
X-IronPort-AV: E=Sophos;i="5.97,244,1669104000"; 
   d="scan'208";a="324182220"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2023 21:01:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10600"; a="836237917"
X-IronPort-AV: E=Sophos;i="5.97,244,1669104000"; 
   d="scan'208";a="836237917"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 24 Jan 2023 21:01:42 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pKXuo-00072m-02;
	Wed, 25 Jan 2023 05:01:42 +0000
Date: Wed, 25 Jan 2023 13:01:41 +0800
From: kernel test robot <lkp@intel.com>
To: Ammar Faizi <ammarfaizi2@gnuweeb.org>,
	GNU/Weeb Mailing List <gwml@vger.gnuweeb.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ammarfaizi2-block:google/android/kernel/common/android-4.14-stable
 640/9999] kernel/bpf/core.c:1500:31: sparse: sparse: incorrect type in
 return expression (different address spaces)
Message-ID: <202301251216.KTzgw6PH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/ammarfaizi2/linux-block google/android/kernel/common/android-4.14-stable
head:   2021317cc8a9d505844f4fb12e28bbcd9a554e0d
commit: 9e61c87b1f47b4dc3d48de83d85e9f17c320f91e [640/9999] UPSTREAM: bpf: multi program support for cgroup+bpf
config: i386-randconfig-s002-20230123 (https://download.01.org/0day-ci/archive/20230125/202301251216.KTzgw6PH-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://github.com/ammarfaizi2/linux-block/commit/9e61c87b1f47b4dc3d48de83d85e9f17c320f91e
        git remote add ammarfaizi2-block https://github.com/ammarfaizi2/linux-block
        git fetch --no-tags ammarfaizi2-block google/android/kernel/common/android-4.14-stable
        git checkout 9e61c87b1f47b4dc3d48de83d85e9f17c320f91e
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=i386 olddefconfig
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=i386 SHELL=/bin/bash kernel/bpf/ kernel/trace/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

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
https://github.com/intel/lkp-tests
