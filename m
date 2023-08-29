Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DA1914F75
	for <oe-kbuild-all@lists.linux.dev>; Tue, 29 Aug 2023 09:38:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693301905; x=1724837905;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=M4t3hQTiC5vwpABmBl+73lUgnAzS7iYtWIEEYQROIq4=;
  b=NjrVmHlXKpa0ZfjbM+i0Z5B8Lnii0hs87sATPwF3xZMeVfGM99Wg0a9d
   +YPCebJ1I1opx4Gh7f9l5Ni0HlUDjK6Ya8/XwSteTogauQVC9hqtW8hLP
   YJDRjfjVvz570ACluijki7iPEJL50JEtzGLYtud/OMwIX536DNTseNPdG
   nUO7Qiqjp2U0E1BtrGp8m7geXFjx2GNdA5SJrRGG2h7y6eutI7T+ADVkX
   BUmkYnBByeU7Aas2N6UNa9FG1mnZP2YpmtSK2flwqNSB58VXrgpjGRVvi
   7NybsVqOXCzBA6EVcrUC3orUz91i2LC1uB0RP3VqmsgWSVDW39yCb/Vg3
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10816"; a="378044669"
X-IronPort-AV: E=Sophos;i="6.02,210,1688454000"; 
   d="scan'208";a="378044669"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Aug 2023 02:38:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10816"; a="688431514"
X-IronPort-AV: E=Sophos;i="6.02,210,1688454000"; 
   d="scan'208";a="688431514"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 29 Aug 2023 02:38:22 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qavAo-0008cp-0s;
	Tue, 29 Aug 2023 09:38:11 +0000
Date: Tue, 29 Aug 2023 17:37:20 +0800
From: kernel test robot <lkp@intel.com>
To: steven@liquorix.net
Cc: oe-kbuild-all@lists.linux.dev
Subject: [zen:6.5/bbr3 1/1] net/ipv4/tcp_bbr.c:1079:48: warning: use of
 logical '&&' with constant operand
Message-ID: <202308291750.aRFnXTdu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/zen-kernel/zen-kernel 6.5/bbr3
head:   bcb27e4adacda606c76349bfba3305db6ea83887
commit: bcb27e4adacda606c76349bfba3305db6ea83887 [1/1] bbr3-6.5: initial import
config: powerpc-randconfig-r033-20230829 (https://download.01.org/0day-ci/archive/20230829/202308291750.aRFnXTdu-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230829/202308291750.aRFnXTdu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308291750.aRFnXTdu-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from net/ipv4/tcp_bbr.c:63:
   In file included from include/net/tcp.h:20:
   In file included from include/linux/tcp.h:17:
   In file included from include/linux/skbuff.h:17:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/powerpc/include/asm/hardirq.h:6:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/powerpc/include/asm/io.h:677:
   arch/powerpc/include/asm/io-defs.h:47:1: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
      47 | DEF_PCI_AC_NORET(insl, (unsigned long p, void *b, unsigned long c),
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      48 |                  (p, b, c), pio, p)
         |                  ~~~~~~~~~~~~~~~~~~
   arch/powerpc/include/asm/io.h:674:3: note: expanded from macro 'DEF_PCI_AC_NORET'
     674 |                 __do_##name al;                                 \
         |                 ^~~~~~~~~~~~~~
   <scratch space>:53:1: note: expanded from here
      53 | __do_insl
         | ^
   arch/powerpc/include/asm/io.h:616:56: note: expanded from macro '__do_insl'
     616 | #define __do_insl(p, b, n)      readsl((PCI_IO_ADDR)_IO_BASE+(p), (b), (n))
         |                                        ~~~~~~~~~~~~~~~~~~~~~^
   In file included from net/ipv4/tcp_bbr.c:63:
   In file included from include/net/tcp.h:20:
   In file included from include/linux/tcp.h:17:
   In file included from include/linux/skbuff.h:17:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/powerpc/include/asm/hardirq.h:6:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/powerpc/include/asm/io.h:677:
   arch/powerpc/include/asm/io-defs.h:49:1: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
      49 | DEF_PCI_AC_NORET(outsb, (unsigned long p, const void *b, unsigned long c),
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      50 |                  (p, b, c), pio, p)
         |                  ~~~~~~~~~~~~~~~~~~
   arch/powerpc/include/asm/io.h:674:3: note: expanded from macro 'DEF_PCI_AC_NORET'
     674 |                 __do_##name al;                                 \
         |                 ^~~~~~~~~~~~~~
   <scratch space>:55:1: note: expanded from here
      55 | __do_outsb
         | ^
   arch/powerpc/include/asm/io.h:617:58: note: expanded from macro '__do_outsb'
     617 | #define __do_outsb(p, b, n)     writesb((PCI_IO_ADDR)_IO_BASE+(p),(b),(n))
         |                                         ~~~~~~~~~~~~~~~~~~~~~^
   In file included from net/ipv4/tcp_bbr.c:63:
   In file included from include/net/tcp.h:20:
   In file included from include/linux/tcp.h:17:
   In file included from include/linux/skbuff.h:17:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/powerpc/include/asm/hardirq.h:6:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/powerpc/include/asm/io.h:677:
   arch/powerpc/include/asm/io-defs.h:51:1: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
      51 | DEF_PCI_AC_NORET(outsw, (unsigned long p, const void *b, unsigned long c),
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      52 |                  (p, b, c), pio, p)
         |                  ~~~~~~~~~~~~~~~~~~
   arch/powerpc/include/asm/io.h:674:3: note: expanded from macro 'DEF_PCI_AC_NORET'
     674 |                 __do_##name al;                                 \
         |                 ^~~~~~~~~~~~~~
   <scratch space>:57:1: note: expanded from here
      57 | __do_outsw
         | ^
   arch/powerpc/include/asm/io.h:618:58: note: expanded from macro '__do_outsw'
     618 | #define __do_outsw(p, b, n)     writesw((PCI_IO_ADDR)_IO_BASE+(p),(b),(n))
         |                                         ~~~~~~~~~~~~~~~~~~~~~^
   In file included from net/ipv4/tcp_bbr.c:63:
   In file included from include/net/tcp.h:20:
   In file included from include/linux/tcp.h:17:
   In file included from include/linux/skbuff.h:17:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/powerpc/include/asm/hardirq.h:6:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/powerpc/include/asm/io.h:677:
   arch/powerpc/include/asm/io-defs.h:53:1: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
      53 | DEF_PCI_AC_NORET(outsl, (unsigned long p, const void *b, unsigned long c),
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      54 |                  (p, b, c), pio, p)
         |                  ~~~~~~~~~~~~~~~~~~
   arch/powerpc/include/asm/io.h:674:3: note: expanded from macro 'DEF_PCI_AC_NORET'
     674 |                 __do_##name al;                                 \
         |                 ^~~~~~~~~~~~~~
   <scratch space>:59:1: note: expanded from here
      59 | __do_outsl
         | ^
   arch/powerpc/include/asm/io.h:619:58: note: expanded from macro '__do_outsl'
     619 | #define __do_outsl(p, b, n)     writesl((PCI_IO_ADDR)_IO_BASE+(p),(b),(n))
         |                                         ~~~~~~~~~~~~~~~~~~~~~^
>> net/ipv4/tcp_bbr.c:1079:48: warning: use of logical '&&' with constant operand [-Wconstant-logical-operand]
    1079 |         if (!bbr->ecn_eligible && bbr_can_use_ecn(sk) &&
         |                                                       ^
    1080 |             bbr_param(sk, ecn_factor) &&
         |             ~~~~~~~~~~~~~~~~~~~~~~~~~
   net/ipv4/tcp_bbr.c:1079:48: note: use '&' for a bitwise operation
    1079 |         if (!bbr->ecn_eligible && bbr_can_use_ecn(sk) &&
         |                                                       ^~
         |                                                       &
   net/ipv4/tcp_bbr.c:1079:48: note: remove constant to silence this warning
    1079 |         if (!bbr->ecn_eligible && bbr_can_use_ecn(sk) &&
         |                                                      ~^~
    1080 |             bbr_param(sk, ecn_factor) &&
         | ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/ipv4/tcp_bbr.c:1187:24: warning: use of logical '&&' with constant operand [-Wconstant-logical-operand]
    1187 |             bbr->ecn_eligible && bbr_param(sk, ecn_thresh)) {
         |                               ^  ~~~~~~~~~~~~~~~~~~~~~~~~~
   net/ipv4/tcp_bbr.c:1187:24: note: use '&' for a bitwise operation
    1187 |             bbr->ecn_eligible && bbr_param(sk, ecn_thresh)) {
         |                               ^~
         |                               &
   net/ipv4/tcp_bbr.c:1187:24: note: remove constant to silence this warning
    1187 |             bbr->ecn_eligible && bbr_param(sk, ecn_thresh)) {
         |                              ~^~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> net/ipv4/tcp_bbr.c:1315:5: warning: no previous prototype for function 'bbr_ecn_cut' [-Wmissing-prototypes]
    1315 | u32 bbr_ecn_cut(struct sock *sk)
         |     ^
   net/ipv4/tcp_bbr.c:1315:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1315 | u32 bbr_ecn_cut(struct sock *sk)
         | ^
         | static 
   net/ipv4/tcp_bbr.c:1385:24: warning: use of logical '&&' with constant operand [-Wconstant-logical-operand]
    1385 |         if (bbr->ecn_in_round && bbr_param(sk, ecn_factor)) {
         |                               ^  ~~~~~~~~~~~~~~~~~~~~~~~~~
   net/ipv4/tcp_bbr.c:1385:24: note: use '&' for a bitwise operation
    1385 |         if (bbr->ecn_in_round && bbr_param(sk, ecn_factor)) {
         |                               ^~
         |                               &
   net/ipv4/tcp_bbr.c:1385:24: note: remove constant to silence this warning
    1385 |         if (bbr->ecn_in_round && bbr_param(sk, ecn_factor)) {
         |                              ~^~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> net/ipv4/tcp_bbr.c:2042:10: warning: variable 'round_delivered' set but not used [-Wunused-but-set-variable]
    2042 |         u32 bw, round_delivered;
         |                 ^
>> net/ipv4/tcp_bbr.c:2036:18: warning: no previous prototype for function 'bbr_main' [-Wmissing-prototypes]
    2036 | __bpf_kfunc void bbr_main(struct sock *sk, const struct rate_sample *rs)
         |                  ^
   net/ipv4/tcp_bbr.c:2036:13: note: declare 'static' if the function is not intended to be used outside of this translation unit
    2036 | __bpf_kfunc void bbr_main(struct sock *sk, const struct rate_sample *rs)
         |             ^
         |             static 
   12 warnings generated.


vim +1079 net/ipv4/tcp_bbr.c

  1066	
  1067	/* Updates ecn_alpha and returns ce_ratio. -1 if not available. */
  1068	static int bbr_update_ecn_alpha(struct sock *sk)
  1069	{
  1070		struct tcp_sock *tp = tcp_sk(sk);
  1071		struct net *net = sock_net(sk);
  1072		struct bbr *bbr = inet_csk_ca(sk);
  1073		s32 delivered, delivered_ce;
  1074		u64 alpha, ce_ratio;
  1075		u32 gain;
  1076		bool want_ecn_alpha;
  1077	
  1078		/* See if we should use ECN sender logic for this connection. */
> 1079		if (!bbr->ecn_eligible && bbr_can_use_ecn(sk) &&
  1080		    bbr_param(sk, ecn_factor) &&
  1081		    (bbr->min_rtt_us <= bbr_ecn_max_rtt_us ||
  1082		     !bbr_ecn_max_rtt_us))
  1083			bbr->ecn_eligible = 1;
  1084	
  1085		/* Skip updating alpha only if not ECN-eligible and PLB is disabled. */
  1086		want_ecn_alpha = (bbr->ecn_eligible ||
  1087				  (bbr_can_use_ecn(sk) &&
  1088				   READ_ONCE(net->ipv4.sysctl_tcp_plb_enabled)));
  1089		if (!want_ecn_alpha)
  1090			return -1;
  1091	
  1092		delivered = tp->delivered - bbr->alpha_last_delivered;
  1093		delivered_ce = tp->delivered_ce - bbr->alpha_last_delivered_ce;
  1094	
  1095		if (delivered == 0 ||		/* avoid divide by zero */
  1096		    WARN_ON_ONCE(delivered < 0 || delivered_ce < 0))  /* backwards? */
  1097			return -1;
  1098	
  1099		BUILD_BUG_ON(BBR_SCALE != TCP_PLB_SCALE);
  1100		ce_ratio = (u64)delivered_ce << BBR_SCALE;
  1101		do_div(ce_ratio, delivered);
  1102	
  1103		gain = bbr_param(sk, ecn_alpha_gain);
  1104		alpha = ((BBR_UNIT - gain) * bbr->ecn_alpha) >> BBR_SCALE;
  1105		alpha += (gain * ce_ratio) >> BBR_SCALE;
  1106		bbr->ecn_alpha = min_t(u32, alpha, BBR_UNIT);
  1107	
  1108		bbr->alpha_last_delivered = tp->delivered;
  1109		bbr->alpha_last_delivered_ce = tp->delivered_ce;
  1110	
  1111		bbr_check_ecn_too_high_in_startup(sk, ce_ratio);
  1112		return (int)ce_ratio;
  1113	}
  1114	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
