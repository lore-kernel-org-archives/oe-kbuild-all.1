Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77ABB10A3E
	for <oe-kbuild-all@lists.linux.dev>; Wed, 20 Nov 2024 01:11:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732065091; cv=none; b=hJsCKXXgIMhQHzF1xTxlbiFpetkTko/8tWnFtyQM88eeRa5cUkuSP5ZRmHhJSTLkn3e99NU6e2JBJzrUbJIyNK5YmVpYfnj7V66cpBLfHAnnbp3bkCSPltDlZubOU2fLYNX7RNHqvKVqkTNzv9uXdsnEAtPB4knxMHl7vP6mh30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732065091; c=relaxed/simple;
	bh=61z09YJkEcOfXRzySoUXI2n8ps0ZBaaV5RQ1MmiLo1U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TOmswKCLBo/KXHs43zq0bykUkfS1w5HWbX9tqGDWmpTy+FOp7zm60/VnCcqVlFup+3CsOy2lxittrpd/hs+M/UAl2Wr9IqsWQ0WSKrYfMs2CNTui27Zw92E9QJ34lsUylvF4rzY88uCVblexbcwSnKOgUxAwzROyiVj2pcTQY0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BlHSeUo0; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BlHSeUo0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732065090; x=1763601090;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=61z09YJkEcOfXRzySoUXI2n8ps0ZBaaV5RQ1MmiLo1U=;
  b=BlHSeUo0kZCu4JypXzf/YaRQPLo1+xcqulwqxA1lXk1rdHUDu2C/JV4Y
   5B0bnjDDit+DNvwfi4bC2cwKWEqI6Tg8z/ojR7x7EJ+02DBCJhkZDmJuK
   kzDvPwWoyHZOFVbAnAqdHC0Uq/sxBVIYtr33XsqcG1woZY+Su4DJVPys3
   1crBbv9/MZ4Bz0gGuM67jg5p5WbYjLW/h8cEbQFaSm3yRPzEcw7DaNfHN
   fm7YiyQV0yEzkCfAO69E05LsveswsH4totAjX4H1BsLDDN0bIicfvDdIu
   yfHa0dCILZ4UNUv8e6t8HsBrc5SAMFAxOGgEvnFcO4aooGpolV9fHn5rF
   w==;
X-CSE-ConnectionGUID: nGGSe9KIQFKZ8Zz1Cf/H4w==
X-CSE-MsgGUID: 7ALZ/VcrSDOKp2ukQPBScg==
X-IronPort-AV: E=McAfee;i="6700,10204,11261"; a="42612938"
X-IronPort-AV: E=Sophos;i="6.12,168,1728975600"; 
   d="scan'208";a="42612938"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2024 17:11:29 -0800
X-CSE-ConnectionGUID: p5j6Bh1HSdu4XucxKRZaAg==
X-CSE-MsgGUID: A0+Ms42KQPKzqsVoepPc7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,168,1728975600"; 
   d="scan'208";a="93813506"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 19 Nov 2024 17:11:27 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tDZFd-0000O5-1e;
	Wed, 20 Nov 2024 01:11:25 +0000
Date: Wed, 20 Nov 2024 09:11:14 +0800
From: kernel test robot <lkp@intel.com>
To: steven@liquorix.net
Cc: oe-kbuild-all@lists.linux.dev
Subject: [zen:6.12/bbr3 1/1] net/ipv4/tcp_bbr.c:1079:48: warning: use of
 logical '&&' with constant operand
Message-ID: <202411191927.lUtzcbGH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/zen-kernel/zen-kernel 6.12/bbr3
head:   a1f04ded36fb527bc23efdb969b1893c82e61a6e
commit: a1f04ded36fb527bc23efdb969b1893c82e61a6e [1/1] tcp/bbr3: initial import
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20241119/202411191927.lUtzcbGH-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 592c0fe55f6d9a811028b5f3507be91458ab2713)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241119/202411191927.lUtzcbGH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411191927.lUtzcbGH-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from net/ipv4/tcp_bbr.c:60:
   In file included from include/linux/btf.h:8:
   In file included from include/linux/bpfptr.h:6:
   In file included from include/linux/mm.h:2213:
   include/linux/vmstat.h:504:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     504 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     505 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:511:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     511 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     512 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:524:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     524 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     525 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   In file included from net/ipv4/tcp_bbr.c:63:
   In file included from include/net/tcp.h:20:
   In file included from include/linux/tcp.h:17:
   In file included from include/linux/skbuff.h:28:
   In file included from include/linux/dma-mapping.h:11:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/s390/include/asm/io.h:95:
   include/asm-generic/io.h:548:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     548 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:561:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     561 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:37:59: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) __swab16((__force __u16)(__le16)(x))
         |                                                           ^
   include/uapi/linux/swab.h:102:54: note: expanded from macro '__swab16'
     102 | #define __swab16(x) (__u16)__builtin_bswap16((__u16)(x))
         |                                                      ^
   In file included from net/ipv4/tcp_bbr.c:63:
   In file included from include/net/tcp.h:20:
   In file included from include/linux/tcp.h:17:
   In file included from include/linux/skbuff.h:28:
   In file included from include/linux/dma-mapping.h:11:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/s390/include/asm/io.h:95:
   include/asm-generic/io.h:574:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     574 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:35:59: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
         |                                                           ^
   include/uapi/linux/swab.h:115:54: note: expanded from macro '__swab32'
     115 | #define __swab32(x) (__u32)__builtin_bswap32((__u32)(x))
         |                                                      ^
   In file included from net/ipv4/tcp_bbr.c:63:
   In file included from include/net/tcp.h:20:
   In file included from include/linux/tcp.h:17:
   In file included from include/linux/skbuff.h:28:
   In file included from include/linux/dma-mapping.h:11:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/s390/include/asm/io.h:95:
   include/asm-generic/io.h:585:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     585 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:595:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     595 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:605:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     605 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:693:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     693 |         readsb(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:701:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     701 |         readsw(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:709:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     709 |         readsl(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:718:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     718 |         writesb(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:727:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     727 |         writesw(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:736:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     736 |         writesl(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
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
         |                                                       ^~
    1080 |             bbr_param(sk, ecn_factor) &&
         |             ~~~~~~~~~~~~~~~~~~~~~~~~~
   net/ipv4/tcp_bbr.c:1187:24: warning: use of logical '&&' with constant operand [-Wconstant-logical-operand]
    1187 |             bbr->ecn_eligible && bbr_param(sk, ecn_thresh)) {
         |                               ^  ~~~~~~~~~~~~~~~~~~~~~~~~~
   net/ipv4/tcp_bbr.c:1187:24: note: use '&' for a bitwise operation
    1187 |             bbr->ecn_eligible && bbr_param(sk, ecn_thresh)) {
         |                               ^~
         |                               &
   net/ipv4/tcp_bbr.c:1187:24: note: remove constant to silence this warning
    1187 |             bbr->ecn_eligible && bbr_param(sk, ecn_thresh)) {
         |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/ipv4/tcp_bbr.c:1385:24: warning: use of logical '&&' with constant operand [-Wconstant-logical-operand]
    1385 |         if (bbr->ecn_in_round && bbr_param(sk, ecn_factor)) {
         |                               ^  ~~~~~~~~~~~~~~~~~~~~~~~~~
   net/ipv4/tcp_bbr.c:1385:24: note: use '&' for a bitwise operation
    1385 |         if (bbr->ecn_in_round && bbr_param(sk, ecn_factor)) {
         |                               ^~
         |                               &
   net/ipv4/tcp_bbr.c:1385:24: note: remove constant to silence this warning
    1385 |         if (bbr->ecn_in_round && bbr_param(sk, ecn_factor)) {
         |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/ipv4/tcp_bbr.c:2042:10: warning: variable 'round_delivered' set but not used [-Wunused-but-set-variable]
    2042 |         u32 bw, round_delivered;
         |                 ^
   20 warnings generated.


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
