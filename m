Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FA845254
	for <oe-kbuild-all@lists.linux.dev>; Fri,  8 Sep 2023 12:49:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694177349; x=1725713349;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jZ4w+U76L5+rNSBa0Nw187zNiZjz1ktsVN15w+KJ+dE=;
  b=gwhVZi0XRU6/0NDP5QCwNHNSb2q8fF4ySJhaUQi2WqRuKV0CkmWDvNAQ
   KZCUzh5/2uKw2o4ca+IXH5C1ICUZDZBAOu/6oKhSMd7qhmlJZcDIdes7y
   vD231+wQSTFtDN9uZwnYClC3yj1+Her7+sl3cSa3o13a+I8kjfOwgTZEN
   K5Eh/hUGZQskGmSMdtlxgLQogLcRdT4jzV5QoXv5JTmDleyUg9nn/T04Z
   BtWESBFOJC6gvTnF6OUq8XW4LA4bNUuTxOfU76TTpQON0OGDATcH0EEYg
   iN6sxj1zzKMnIhO+NQBRYPJXKKMvk3gTBHt5Rn1AuhSoNk9Wa4Kxr9vpT
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10827"; a="357941697"
X-IronPort-AV: E=Sophos;i="6.02,237,1688454000"; 
   d="scan'208";a="357941697"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2023 05:49:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10827"; a="745603423"
X-IronPort-AV: E=Sophos;i="6.02,237,1688454000"; 
   d="scan'208";a="745603423"
Received: from lkp-server01.sh.intel.com (HELO 59b3c6e06877) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 08 Sep 2023 05:49:07 -0700
Received: from kbuild by 59b3c6e06877 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qeav2-0002Gt-32;
	Fri, 08 Sep 2023 12:49:04 +0000
Date: Fri, 8 Sep 2023 20:48:09 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [axboe-block:io_uring-exit-cancel 2/4] io_uring/refs.h:72:45:
 sparse: sparse: incorrect type in initializer (different address spaces)
Message-ID: <202309082048.MZhKiG18-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git io_uring-exit-cancel
head:   c0a3f52f61f920a57f8e753b7717d19955d1557e
commit: 30c0179847ab8428d7ac3d916ef1d8add585a07a [2/4] io_uring: move to using private ring references
config: i386-randconfig-062-20230908 (https://download.01.org/0day-ci/archive/20230908/202309082048.MZhKiG18-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230908/202309082048.MZhKiG18-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309082048.MZhKiG18-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   io_uring/io_uring.c: note: in included file (through include/trace/events/io_uring.h):
   include/linux/io_uring_types.h:304:48: sparse: sparse: array of flexible structures
   include/linux/io_uring_types.h:151:37: sparse: sparse: array of flexible structures
   io_uring/io_uring.c:650:36: sparse: sparse: context imbalance in 'io_fill_cqe_req_aux' - unexpected unlock
   io_uring/io_uring.c: note: in included file:
>> io_uring/refs.h:72:45: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct local_t [noderef] [usertype] __percpu *refs @@     got struct local_t [usertype] * @@
   io_uring/refs.h:72:45: sparse:     expected struct local_t [noderef] [usertype] __percpu *refs
   io_uring/refs.h:72:45: sparse:     got struct local_t [usertype] *
>> io_uring/refs.h:89:23: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct local_t [usertype] * @@
   io_uring/refs.h:89:23: sparse:     expected void const [noderef] __percpu *__vpp_verify
   io_uring/refs.h:89:23: sparse:     got struct local_t [usertype] *
>> io_uring/refs.h:72:45: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct local_t [noderef] [usertype] __percpu *refs @@     got struct local_t [usertype] * @@
   io_uring/refs.h:72:45: sparse:     expected struct local_t [noderef] [usertype] __percpu *refs
   io_uring/refs.h:72:45: sparse:     got struct local_t [usertype] *
>> io_uring/refs.h:89:23: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct local_t [usertype] * @@
   io_uring/refs.h:89:23: sparse:     expected void const [noderef] __percpu *__vpp_verify
   io_uring/refs.h:89:23: sparse:     got struct local_t [usertype] *
>> io_uring/refs.h:72:45: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct local_t [noderef] [usertype] __percpu *refs @@     got struct local_t [usertype] * @@
   io_uring/refs.h:72:45: sparse:     expected struct local_t [noderef] [usertype] __percpu *refs
   io_uring/refs.h:72:45: sparse:     got struct local_t [usertype] *
>> io_uring/refs.h:89:23: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct local_t [usertype] * @@
   io_uring/refs.h:89:23: sparse:     expected void const [noderef] __percpu *__vpp_verify
   io_uring/refs.h:89:23: sparse:     got struct local_t [usertype] *
   io_uring/io_uring.c:652:17: sparse: sparse: context imbalance in '__io_submit_flush_completions' - different lock contexts for basic block
>> io_uring/refs.h:89:23: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct local_t [usertype] * @@
   io_uring/refs.h:89:23: sparse:     expected void const [noderef] __percpu *__vpp_verify
   io_uring/refs.h:89:23: sparse:     got struct local_t [usertype] *
>> io_uring/refs.h:89:23: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct local_t [usertype] * @@
   io_uring/refs.h:89:23: sparse:     expected void const [noderef] __percpu *__vpp_verify
   io_uring/refs.h:89:23: sparse:     got struct local_t [usertype] *
>> io_uring/refs.h:72:45: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct local_t [noderef] [usertype] __percpu *refs @@     got struct local_t [usertype] * @@
   io_uring/refs.h:72:45: sparse:     expected struct local_t [noderef] [usertype] __percpu *refs
   io_uring/refs.h:72:45: sparse:     got struct local_t [usertype] *
>> io_uring/refs.h:89:23: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct local_t [usertype] * @@
   io_uring/refs.h:89:23: sparse:     expected void const [noderef] __percpu *__vpp_verify
   io_uring/refs.h:89:23: sparse:     got struct local_t [usertype] *
>> io_uring/refs.h:89:23: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct local_t [usertype] * @@
   io_uring/refs.h:89:23: sparse:     expected void const [noderef] __percpu *__vpp_verify
   io_uring/refs.h:89:23: sparse:     got struct local_t [usertype] *
--
   io_uring/refs.c: note: in included file (through io_uring/refs.h):
   include/linux/io_uring_types.h:304:48: sparse: sparse: array of flexible structures
>> io_uring/refs.c:27:21: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void [noderef] __percpu *__pdata @@     got struct local_t [usertype] *refs @@
   io_uring/refs.c:27:21: sparse:     expected void [noderef] __percpu *__pdata
   io_uring/refs.c:27:21: sparse:     got struct local_t [usertype] *refs
>> io_uring/refs.c:42:24: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct local_t [usertype] * @@
   io_uring/refs.c:42:24: sparse:     expected void const [noderef] __percpu *__vpp_verify
   io_uring/refs.c:42:24: sparse:     got struct local_t [usertype] *
   io_uring/refs.c: note: in included file:
>> io_uring/refs.h:72:45: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct local_t [noderef] [usertype] __percpu *refs @@     got struct local_t [usertype] * @@
   io_uring/refs.h:72:45: sparse:     expected struct local_t [noderef] [usertype] __percpu *refs
   io_uring/refs.h:72:45: sparse:     got struct local_t [usertype] *

vim +72 io_uring/refs.h

    69	
    70	static inline void io_ring_ref_get_many(struct io_ring_ctx *ctx, unsigned long nr)
    71	{
  > 72		local_t __percpu *refs = io_ring_ref(ctx);
    73	
    74		preempt_disable();
    75		local_add(nr, this_cpu_ptr(refs));
    76		preempt_enable();
    77	}
    78	
    79	static inline void io_ring_ref_get(struct io_ring_ctx *ctx)
    80	{
    81		io_ring_ref_get_many(ctx, 1);
    82	}
    83	
    84	static inline void io_ring_ref_put_many(struct io_ring_ctx *ctx, unsigned long nr)
    85	{
    86		local_t *refs = io_ring_ref(ctx);
    87	
    88		preempt_disable();
  > 89		local_sub(nr, this_cpu_ptr(refs));
    90		preempt_enable();
    91	
    92		if (unlikely(io_ring_ref_is_dying(ctx)))
    93			io_ring_ref_maybe_done(ctx);
    94	}
    95	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
