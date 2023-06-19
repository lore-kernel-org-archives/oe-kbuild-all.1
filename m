Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AE92125C3
	for <oe-kbuild-all@lists.linux.dev>; Mon, 19 Jun 2023 19:36:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687203362; x=1718739362;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JklrcNdDQDQG8mawVWSu+xYD0/18YolNivqgUZtBRMk=;
  b=b+JbOqLLWUDtX9DNs5lF/S0GpCJYxA/x6vGKkFoVrlG6kYQObOl0cQzH
   kN2xII7CqaqJjV/MRQjp7hTx/15S3uS9rRDzNKlyeSORBreHCRIklsH96
   +jx4otIoxJNpIGtIeTMeY0Ot01vSo0Qh7FiRMaobyPbudGGBonh9LTk1y
   i63y6L54NqykRdFjAvDKheR13Im80i4GMJstxasemyKHOTkVdpVKP6B0j
   LefTk4dJIA5CBT06pIkGUJDV/6nbg5ExhgkHO5z80fIWtg+fSdmdCP9ad
   ViFAFZqmLV9TKMRapehoNgqY4ybXQEDbcgH5L9iY158A/jA/J+twA/x6l
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10746"; a="344448495"
X-IronPort-AV: E=Sophos;i="6.00,255,1681196400"; 
   d="scan'208";a="344448495"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2023 12:36:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10746"; a="716982544"
X-IronPort-AV: E=Sophos;i="6.00,255,1681196400"; 
   d="scan'208";a="716982544"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 19 Jun 2023 12:36:00 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qBKfP-00053k-34;
	Mon, 19 Jun 2023 19:35:59 +0000
Date: Tue, 20 Jun 2023 03:35:24 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:mirror-chromeos-5.10-arcvm 12440/27674]
 include/trace/hooks/ipv4.h:20:1: sparse: sparse: incorrect type in
 assignment (different address spaces)
Message-ID: <202306200325.UxW5RvmG-lkp@intel.com>
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
commit: 81c8161bed77ae0da88c78ff822220ba1a2a7a8a [12440/27674] ANDROID: vendor_hooks: Add hooks to tcp/udp send/recv msg functions.
config: x86_64-randconfig-s021-20230614 (https://download.01.org/0day-ci/archive/20230620/202306200325.UxW5RvmG-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230620/202306200325.UxW5RvmG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306200325.UxW5RvmG-lkp@intel.com/

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
