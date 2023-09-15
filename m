Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 933DF101C7
	for <oe-kbuild-all@lists.linux.dev>; Fri, 15 Sep 2023 11:10:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694776254; x=1726312254;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=213BQgD6HZ6kld3evghxCn51soCq6jLr7WfCh+bABfE=;
  b=LoBFDcJIghjAezZD6+1b5QVM7BrW2BjV15ITsOsrV1YnakPd80ZU+AqS
   Y7Qo7T/qQb/k11rTTJXK0+FRQQcdovkpt0lxJ8vtt9d0CcFTLoa64VuUD
   4iUUT8v2/v5aIxY9RtYmmVM8B6tcqkV9ddsyBWSSNEH1Mic+kspVs/qax
   3c5JjX/p+qATErVgnVfP1Slsy6QuYX8arzyw9FUj09INVavUCNgsF+ubL
   1i40ZvvzLXZ2GDULrWklxW47mXuv+4x/VLis6WloQekfofRonio7IH5w0
   bzwsO+HairKwdKB+RepqPOpCdpMN/XhBxI1yPWS0y5oVyLGyDtoODeaz0
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10833"; a="379142911"
X-IronPort-AV: E=Sophos;i="6.02,149,1688454000"; 
   d="scan'208";a="379142911"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2023 04:10:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10833"; a="835173979"
X-IronPort-AV: E=Sophos;i="6.02,149,1688454000"; 
   d="scan'208";a="835173979"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 15 Sep 2023 04:10:52 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qh6io-0002tQ-0c;
	Fri, 15 Sep 2023 11:10:50 +0000
Date: Fri, 15 Sep 2023 19:10:25 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-kiwi-5.10 12341/29478]
 include/trace/hooks/ipv4.h:20:1: sparse: sparse: incorrect type in
 assignment (different address spaces)
Message-ID: <202309151926.2vDURDm1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android12-kiwi-5.10
head:   6d437ab24c6334aa48e2397e15e88e366c184da0
commit: 81c8161bed77ae0da88c78ff822220ba1a2a7a8a [12341/29478] ANDROID: vendor_hooks: Add hooks to tcp/udp send/recv msg functions.
config: i386-randconfig-061-20230915 (https://download.01.org/0day-ci/archive/20230915/202309151926.2vDURDm1-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230915/202309151926.2vDURDm1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309151926.2vDURDm1-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   net/ipv4/udp.c: note: in included file:
>> include/trace/hooks/ipv4.h:20:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/ipv4.h:20:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/ipv4.h:20:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   net/ipv4/udp.c:1459:28: sparse: sparse: context imbalance in 'udp_rmem_release' - unexpected unlock
   net/ipv4/udp.c:1491:19: sparse: sparse: context imbalance in 'busylock_acquire' - wrong count at exit
   net/ipv4/udp.c:1503:28: sparse: sparse: context imbalance in 'busylock_release' - unexpected unlock
   net/ipv4/udp.c: note: in included file (through include/net/inet_sock.h, include/net/icmp.h):
   include/net/sock.h:1621:31: sparse: sparse: context imbalance in 'skb_consume_udp' - unexpected unlock
   net/ipv4/udp.c: note: in included file:
   include/trace/hooks/ipv4.h:24:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/ipv4.h:24:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/ipv4.h:24:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   net/ipv4/udp.c: note: in included file (through include/net/inet_sock.h, include/net/icmp.h):
   include/net/sock.h:1621:31: sparse: sparse: context imbalance in 'udp_destroy_sock' - unexpected unlock
   net/ipv4/udp.c:2899:9: sparse: sparse: context imbalance in 'udp_get_first' - wrong count at exit
   net/ipv4/udp.c:2921:39: sparse: sparse: context imbalance in 'udp_get_next' - unexpected unlock
   net/ipv4/udp.c:2971:31: sparse: sparse: context imbalance in 'udp_seq_stop' - unexpected unlock

vim +20 include/trace/hooks/ipv4.h

    11	
    12	DECLARE_RESTRICTED_HOOK(android_rvh_tcp_sendmsg_locked,
    13		TP_PROTO(struct sock *sk, int size),
    14		TP_ARGS(sk, size), 1);
    15	
    16	DECLARE_RESTRICTED_HOOK(android_rvh_tcp_recvmsg,
    17		TP_PROTO(struct sock *sk),
    18		TP_ARGS(sk), 1);
    19	
  > 20	DECLARE_RESTRICTED_HOOK(android_rvh_udp_sendmsg,
    21		TP_PROTO(struct sock *sk),
    22		TP_ARGS(sk), 1);
    23	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
