Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A55917C81
	for <oe-kbuild-all@lists.linux.dev>; Fri, 12 Jan 2024 17:40:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CoLLvq5Q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705081228; x=1736617228;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/ScxmxtJgaLvVFJsecBTXW/1sffxuWxJxwdjpH4SZ50=;
  b=CoLLvq5QOhVLkbwDTYS02caa8moF5kp+NF6xnxnXy8nfuVmfg8S1oxb0
   M9PiHaSSCLVNvYvvK/MPImf5lUf3SkkqGmIyGdWK9GiC5G/j0fDG4qKuv
   BUrLHA2usctZ5KXBYcpFGHdkd312gPnKZFbI5woUi0iVF4qeY5nwpBzkF
   LubFu94IEKU01OG+tjZAw1h21+yCzeRoo4nbw1n2WyG7mfT6/hbOlF4Mx
   1h5KzqgIEwLTwR9YAaXs7/gc+ktNw6aPKbV0MaX3LctCCLHTG2vTomdDq
   UGJDIocnjmEUd9I4PqpDdEocT1eCfBzOeFyeHL+vPlkJUvFR41GD/M1Aw
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10951"; a="5995843"
X-IronPort-AV: E=Sophos;i="6.04,190,1695711600"; 
   d="scan'208";a="5995843"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2024 09:40:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10951"; a="776064910"
X-IronPort-AV: E=Sophos;i="6.04,190,1695711600"; 
   d="scan'208";a="776064910"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 12 Jan 2024 09:40:16 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rOLVu-0009jA-2Q;
	Fri, 12 Jan 2024 17:40:14 +0000
Date: Sat, 13 Jan 2024 01:39:39 +0800
From: kernel test robot <lkp@intel.com>
To: steven@liquorix.net
Cc: oe-kbuild-all@lists.linux.dev
Subject: [zen:6.7/bbr3 1/1] net/ipv4/tcp_bbr.c:1079:48: warning: use of
 logical '&&' with constant operand
Message-ID: <202401130148.K31fLEvV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/zen-kernel/zen-kernel 6.7/bbr3
head:   2a5d0f70029ff84422ee9e01e0eb7bf17f16d981
commit: 2a5d0f70029ff84422ee9e01e0eb7bf17f16d981 [1/1] tcp/bbr3: initial import
config: i386-buildonly-randconfig-001-20240112 (https://download.01.org/0day-ci/archive/20240113/202401130148.K31fLEvV-lkp@intel.com/config)
compiler: ClangBuiltLinux clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240113/202401130148.K31fLEvV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401130148.K31fLEvV-lkp@intel.com/

All warnings (new ones prefixed by >>):

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
         |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/ipv4/tcp_bbr.c:2042:10: warning: variable 'round_delivered' set but not used [-Wunused-but-set-variable]
    2042 |         u32 bw, round_delivered;
         |                 ^
>> net/ipv4/tcp_bbr.c:2036:18: warning: no previous prototype for function 'bbr_main' [-Wmissing-prototypes]
    2036 | __bpf_kfunc void bbr_main(struct sock *sk, const struct rate_sample *rs)
         |                  ^
   net/ipv4/tcp_bbr.c:2036:13: note: declare 'static' if the function is not intended to be used outside of this translation unit
    2036 | __bpf_kfunc void bbr_main(struct sock *sk, const struct rate_sample *rs)
         |             ^
         |             static 
   6 warnings generated.


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
