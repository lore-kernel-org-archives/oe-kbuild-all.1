Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A60F816EC19
	for <oe-kbuild-all@lists.linux.dev>; Thu, 23 Jan 2025 21:41:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737668493; cv=none; b=JHHgwiAs3q6NNZ/6iqlo6dJk9aVfIufLIIsZ2PJ+YOE/e1DbF1a9E24/qlNm+d3houtgc7fbN3pHuImmEqros/+bgTa3s+6bct+Oa+B8idaFczIK6MupnqFNXyZhsD7nHtHXu/F6kC723h+C4dI8EZPrUibyUznESKkpvX/ohtc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737668493; c=relaxed/simple;
	bh=aMGYR/FdUze+v9odCYNuPNDqMR+s8PLygwAn8hYw/wU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NpC/7iOPuKCKqj3n/C0thrxzIRDvegW8kCEtbWfOY+6zcFG5EikRnZ2v1rVHI3uwJ2qzMnobFJ5U7yG+WHsg+Y0HmPnXhDUan5tYNf8nkWTvPsD8chuNIRGwA6xJ/Q2ozxMH38OL5wK6HTG5Vv8+gN43Qe5cowOVuWSirl/8BHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lwZkY1im; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lwZkY1im"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737668491; x=1769204491;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=aMGYR/FdUze+v9odCYNuPNDqMR+s8PLygwAn8hYw/wU=;
  b=lwZkY1imZyxT6Oxo3/hSpCyZukJXLbvkuhRwKyA2W1nYfSetXAoYPawy
   KNQnfh9iyPSFbniFn7IMi1d8CUO7vnVbKh5Gr9ukLsCwIh5cZbHR6ZrZi
   PRsomYXuipwrtVfXpXw7MF/Q5BnWyn14jFFGjMi9P0MPeQzT2PGWeW8re
   Ov10cBH0rFhnP/Tk6q4bP4pus3i6lFI4ttW3xBHNc0Rx5Qx9Hmi66HLRl
   n+Jn2JwHZdrWtT4WuUJd5aN9RAxE9M2D6bTBORN3NeVqpGxekXir7y7JU
   KIpxnWSr4G9EhJ861LWSqd8lB1RJkpjavSiybaaIVHmR7gHFUp+ZStYI3
   g==;
X-CSE-ConnectionGUID: sPr30LXFRe6gcbaPDbsMqQ==
X-CSE-MsgGUID: +N7RlZ33QGKtCI1/Fmm+jw==
X-IronPort-AV: E=McAfee;i="6700,10204,11324"; a="25797881"
X-IronPort-AV: E=Sophos;i="6.13,229,1732608000"; 
   d="scan'208";a="25797881"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2025 13:41:31 -0800
X-CSE-ConnectionGUID: Zk4/tNJdRdqoY2GGZofT5Q==
X-CSE-MsgGUID: h1CA1SPNSFKWTQ7TMAQKlw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="111617698"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 23 Jan 2025 13:41:30 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tb4x5-000bkF-3B;
	Thu, 23 Jan 2025 21:41:27 +0000
Date: Fri, 24 Jan 2025 05:41:21 +0800
From: kernel test robot <lkp@intel.com>
To: steven@liquorix.net
Cc: oe-kbuild-all@lists.linux.dev
Subject: [zen:6.13/bbr3 1/1] net/ipv4/tcp_bbr.c:1079:48: warning: use of
 logical '&&' with constant operand
Message-ID: <202501240535.sQaryhNN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/zen-kernel/zen-kernel 6.13/bbr3
head:   aa2658ab3fba8f0f16c6d9c838776502980974ed
commit: aa2658ab3fba8f0f16c6d9c838776502980974ed [1/1] tcp/bbr3: initial import
config: arm64-randconfig-004-20250124 (https://download.01.org/0day-ci/archive/20250124/202501240535.sQaryhNN-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 19306351a2c45e266fa11b41eb1362b20b6ca56d)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250124/202501240535.sQaryhNN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501240535.sQaryhNN-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from net/ipv4/tcp_bbr.c:60:
   In file included from include/linux/btf.h:8:
   In file included from include/linux/bpfptr.h:6:
   In file included from include/linux/mm.h:2224:
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
   include/linux/vmstat.h:524:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     524 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     525 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
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
   7 warnings generated.


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
