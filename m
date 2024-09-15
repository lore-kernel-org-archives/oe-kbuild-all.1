Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B598433AD
	for <oe-kbuild-all@lists.linux.dev>; Sun, 15 Sep 2024 11:43:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726400624; cv=none; b=FKw8GZPW05S+9DdVcBsMslIP53HpqKp6qDH0SfmDOTPhU3DnIfa1x/mmRQz5sBoyc7PI3M/VsZTHOVkqHZ89dDvRqEuY/Nl1dk+sJcY10j8krK3s0bmi9xrzPbtJjovPT0jI6CqWBZTk+nSwklC1LE6SMcbX4Hqi3BiwJnA9C3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726400624; c=relaxed/simple;
	bh=zOBybbpmH00+mlVUlqDdMmAKRIXrursTKeZY5gBoZZs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WNmVIEUty7CRpQZeJz7GY/btSPvchSybuahwk3dOP92QlE3HdauorkVqN/0m3/LmsgcK858DYGmzoSzd4QkYkdCez63ecBa6f2YTSrUAKTUZbX1QUqN5OUIw9OeVSssLvyIYQfq0OUd01mCfaGvWIN7NHFQ6o3aFTHgkyF1K1KU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YW79V8rg; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YW79V8rg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726400623; x=1757936623;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zOBybbpmH00+mlVUlqDdMmAKRIXrursTKeZY5gBoZZs=;
  b=YW79V8rgPnVwOp2zrzGkuVCW/fCxaj5FI6ycWbXUokOe2CnQa5FF9UqL
   F9qbcQI3/eb9Mdb5B+eydTVifiRbhF+2yvEgIi8GKmPiW7arRb6bZYrJJ
   goqfSU4uarCk2FrnQnp63c/PhqsqltRizs7tb6MNrBKIUdARMoK6kU22m
   zErUpb8xIkCgN5L9VC4RiYKfJ3u6aHfwGm0Uvyf8rCyDg39KZmdjliZ72
   jkMtS5GxpcZtIwPrC6f2UTb+jGB4J15RbNQKyXpmmAoW1hNgkYAa6yBae
   2qLHcAkkNO/lE3ROGsqAQsGf+lkAySF3uCKizH1UE8ZlrLUTuKUo89zoy
   Q==;
X-CSE-ConnectionGUID: FPvYK7ByR1WXgnxIOIBv2g==
X-CSE-MsgGUID: 3s/o03+cTVGFdHmnD97iIA==
X-IronPort-AV: E=McAfee;i="6700,10204,11195"; a="24734294"
X-IronPort-AV: E=Sophos;i="6.10,231,1719903600"; 
   d="scan'208";a="24734294"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2024 04:43:42 -0700
X-CSE-ConnectionGUID: Bt6Wj713Rp+Izyq1CciBQQ==
X-CSE-MsgGUID: cMKoKWmgTGOewvhDRRKiiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,231,1719903600"; 
   d="scan'208";a="72999165"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 15 Sep 2024 04:43:40 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1spnfG-0008du-2r;
	Sun, 15 Sep 2024 11:43:38 +0000
Date: Sun, 15 Sep 2024 19:43:33 +0800
From: kernel test robot <lkp@intel.com>
To: "Masami Hiramatsu (Google)" <mhiramat@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [mhiramat:topic/fprobe-on-fgraph 9/22]
 kernel/trace/trace_fprobe.c:1140:38: error: assignment to 'fprobe_entry_cb'
 {aka 'int (*)(struct fprobe *, long unsigned int,  long unsigned int,
  struct ftrace_regs *, void *)'} from incompatible pointer type 'int
 (*)(struct fprobe *, long unsigned int, ...
Message-ID: <202409151937.6FDiKZyQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mhiramat/linux.git topic/fprobe-on-fgraph
head:   57602abd7b7ad38e8a133c1d23bb5b4969a2daa4
commit: cc9194fde2133f928cc0bdf25bb2929948f9da89 [9/22] fprobe: Use ftrace_regs in fprobe entry handler
config: x86_64-rhel-8.3-bpf (https://download.01.org/0day-ci/archive/20240915/202409151937.6FDiKZyQ-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240915/202409151937.6FDiKZyQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409151937.6FDiKZyQ-lkp@intel.com/

Note: the mhiramat/topic/fprobe-on-fgraph HEAD 57602abd7b7ad38e8a133c1d23bb5b4969a2daa4 builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

   kernel/trace/trace_fprobe.c: In function '__trace_fprobe_create':
>> kernel/trace/trace_fprobe.c:1140:38: error: assignment to 'fprobe_entry_cb' {aka 'int (*)(struct fprobe *, long unsigned int,  long unsigned int,  struct ftrace_regs *, void *)'} from incompatible pointer type 'int (*)(struct fprobe *, long unsigned int,  long unsigned int,  struct pt_regs *, void *)' [-Werror=incompatible-pointer-types]
    1140 |                 tf->fp.entry_handler = trace_fprobe_entry_handler;
         |                                      ^
   cc1: some warnings being treated as errors


vim +1140 kernel/trace/trace_fprobe.c

08c9306fc2e32b Masami Hiramatsu (Google  2023-08-23   963) 
334e5519c37570 Masami Hiramatsu (Google  2023-06-06   964) static int __trace_fprobe_create(int argc, const char *argv[])
334e5519c37570 Masami Hiramatsu (Google  2023-06-06   965) {
334e5519c37570 Masami Hiramatsu (Google  2023-06-06   966) 	/*
334e5519c37570 Masami Hiramatsu (Google  2023-06-06   967) 	 * Argument syntax:
334e5519c37570 Masami Hiramatsu (Google  2023-06-06   968) 	 *  - Add fentry probe:
334e5519c37570 Masami Hiramatsu (Google  2023-06-06   969) 	 *      f[:[GRP/][EVENT]] [MOD:]KSYM [FETCHARGS]
334e5519c37570 Masami Hiramatsu (Google  2023-06-06   970) 	 *  - Add fexit probe:
334e5519c37570 Masami Hiramatsu (Google  2023-06-06   971) 	 *      f[N][:[GRP/][EVENT]] [MOD:]KSYM%return [FETCHARGS]
e2d0d7b2f42dca Masami Hiramatsu (Google  2023-06-06   972) 	 *  - Add tracepoint probe:
e2d0d7b2f42dca Masami Hiramatsu (Google  2023-06-06   973) 	 *      t[:[GRP/][EVENT]] TRACEPOINT [FETCHARGS]
334e5519c37570 Masami Hiramatsu (Google  2023-06-06   974) 	 *
334e5519c37570 Masami Hiramatsu (Google  2023-06-06   975) 	 * Fetch args:
334e5519c37570 Masami Hiramatsu (Google  2023-06-06   976) 	 *  $retval	: fetch return value
334e5519c37570 Masami Hiramatsu (Google  2023-06-06   977) 	 *  $stack	: fetch stack address
334e5519c37570 Masami Hiramatsu (Google  2023-06-06   978) 	 *  $stackN	: fetch Nth entry of stack (N:0-)
334e5519c37570 Masami Hiramatsu (Google  2023-06-06   979) 	 *  $argN	: fetch Nth argument (N:1-)
334e5519c37570 Masami Hiramatsu (Google  2023-06-06   980) 	 *  $comm       : fetch current task comm
334e5519c37570 Masami Hiramatsu (Google  2023-06-06   981) 	 *  @ADDR	: fetch memory at ADDR (ADDR should be in kernel)
334e5519c37570 Masami Hiramatsu (Google  2023-06-06   982) 	 *  @SYM[+|-offs] : fetch memory at SYM +|- offs (SYM is a data symbol)
334e5519c37570 Masami Hiramatsu (Google  2023-06-06   983) 	 * Dereferencing memory fetch:
334e5519c37570 Masami Hiramatsu (Google  2023-06-06   984) 	 *  +|-offs(ARG) : fetch memory at ARG +|- offs address.
334e5519c37570 Masami Hiramatsu (Google  2023-06-06   985) 	 * Alias name of args:
334e5519c37570 Masami Hiramatsu (Google  2023-06-06   986) 	 *  NAME=FETCHARG : set NAME as alias of FETCHARG.
334e5519c37570 Masami Hiramatsu (Google  2023-06-06   987) 	 * Type of args:
334e5519c37570 Masami Hiramatsu (Google  2023-06-06   988) 	 *  FETCHARG:TYPE : use TYPE instead of unsigned long.
334e5519c37570 Masami Hiramatsu (Google  2023-06-06   989) 	 */
334e5519c37570 Masami Hiramatsu (Google  2023-06-06   990) 	struct trace_fprobe *tf = NULL;
18b1e870a49671 Masami Hiramatsu (Google  2023-06-06   991) 	int i, len, new_argc = 0, ret = 0;
334e5519c37570 Masami Hiramatsu (Google  2023-06-06   992) 	bool is_return = false;
08c9306fc2e32b Masami Hiramatsu (Google  2023-08-23   993) 	char *symbol = NULL;
334e5519c37570 Masami Hiramatsu (Google  2023-06-06   994) 	const char *event = NULL, *group = FPROBE_EVENT_SYSTEM;
18b1e870a49671 Masami Hiramatsu (Google  2023-06-06   995) 	const char **new_argv = NULL;
334e5519c37570 Masami Hiramatsu (Google  2023-06-06   996) 	int maxactive = 0;
334e5519c37570 Masami Hiramatsu (Google  2023-06-06   997) 	char buf[MAX_EVENT_NAME_LEN];
334e5519c37570 Masami Hiramatsu (Google  2023-06-06   998) 	char gbuf[MAX_EVENT_NAME_LEN];
b576e09701c7d0 Masami Hiramatsu (Google  2023-06-06   999) 	char sbuf[KSYM_NAME_LEN];
18b1e870a49671 Masami Hiramatsu (Google  2023-06-06  1000) 	char abuf[MAX_BTF_ARGS_LEN];
d9b15224dd8ff8 Ye Bin                    2024-03-22  1001  	char *dbuf = NULL;
e2d0d7b2f42dca Masami Hiramatsu (Google  2023-06-06  1002) 	bool is_tracepoint = false;
b576e09701c7d0 Masami Hiramatsu (Google  2023-06-06  1003) 	struct tracepoint *tpoint = NULL;
b576e09701c7d0 Masami Hiramatsu (Google  2023-06-06  1004) 	struct traceprobe_parse_context ctx = {
b576e09701c7d0 Masami Hiramatsu (Google  2023-06-06  1005) 		.flags = TPARG_FL_KERNEL | TPARG_FL_FPROBE,
b576e09701c7d0 Masami Hiramatsu (Google  2023-06-06  1006) 	};
334e5519c37570 Masami Hiramatsu (Google  2023-06-06  1007) 
e2d0d7b2f42dca Masami Hiramatsu (Google  2023-06-06  1008) 	if ((argv[0][0] != 'f' && argv[0][0] != 't') || argc < 2)
334e5519c37570 Masami Hiramatsu (Google  2023-06-06  1009) 		return -ECANCELED;
334e5519c37570 Masami Hiramatsu (Google  2023-06-06  1010) 
e2d0d7b2f42dca Masami Hiramatsu (Google  2023-06-06  1011) 	if (argv[0][0] == 't') {
e2d0d7b2f42dca Masami Hiramatsu (Google  2023-06-06  1012) 		is_tracepoint = true;
e2d0d7b2f42dca Masami Hiramatsu (Google  2023-06-06  1013) 		group = TRACEPOINT_EVENT_SYSTEM;
e2d0d7b2f42dca Masami Hiramatsu (Google  2023-06-06  1014) 	}
e2d0d7b2f42dca Masami Hiramatsu (Google  2023-06-06  1015) 
334e5519c37570 Masami Hiramatsu (Google  2023-06-06  1016) 	trace_probe_log_init("trace_fprobe", argc, argv);
334e5519c37570 Masami Hiramatsu (Google  2023-06-06  1017) 
334e5519c37570 Masami Hiramatsu (Google  2023-06-06  1018) 	event = strchr(&argv[0][1], ':');
334e5519c37570 Masami Hiramatsu (Google  2023-06-06  1019) 	if (event)
334e5519c37570 Masami Hiramatsu (Google  2023-06-06  1020) 		event++;
334e5519c37570 Masami Hiramatsu (Google  2023-06-06  1021) 
334e5519c37570 Masami Hiramatsu (Google  2023-06-06  1022) 	if (isdigit(argv[0][1])) {
334e5519c37570 Masami Hiramatsu (Google  2023-06-06  1023) 		if (event)
334e5519c37570 Masami Hiramatsu (Google  2023-06-06  1024) 			len = event - &argv[0][1] - 1;
334e5519c37570 Masami Hiramatsu (Google  2023-06-06  1025) 		else
334e5519c37570 Masami Hiramatsu (Google  2023-06-06  1026) 			len = strlen(&argv[0][1]);
334e5519c37570 Masami Hiramatsu (Google  2023-06-06  1027) 		if (len > MAX_EVENT_NAME_LEN - 1) {
334e5519c37570 Masami Hiramatsu (Google  2023-06-06  1028) 			trace_probe_log_err(1, BAD_MAXACT);
334e5519c37570 Masami Hiramatsu (Google  2023-06-06  1029) 			goto parse_error;
334e5519c37570 Masami Hiramatsu (Google  2023-06-06  1030) 		}
334e5519c37570 Masami Hiramatsu (Google  2023-06-06  1031) 		memcpy(buf, &argv[0][1], len);
334e5519c37570 Masami Hiramatsu (Google  2023-06-06  1032) 		buf[len] = '\0';
334e5519c37570 Masami Hiramatsu (Google  2023-06-06  1033) 		ret = kstrtouint(buf, 0, &maxactive);
334e5519c37570 Masami Hiramatsu (Google  2023-06-06  1034) 		if (ret || !maxactive) {
334e5519c37570 Masami Hiramatsu (Google  2023-06-06  1035) 			trace_probe_log_err(1, BAD_MAXACT);
334e5519c37570 Masami Hiramatsu (Google  2023-06-06  1036) 			goto parse_error;
334e5519c37570 Masami Hiramatsu (Google  2023-06-06  1037) 		}
334e5519c37570 Masami Hiramatsu (Google  2023-06-06  1038) 		/* fprobe rethook instances are iterated over via a list. The
334e5519c37570 Masami Hiramatsu (Google  2023-06-06  1039) 		 * maximum should stay reasonable.
334e5519c37570 Masami Hiramatsu (Google  2023-06-06  1040) 		 */
334e5519c37570 Masami Hiramatsu (Google  2023-06-06  1041) 		if (maxactive > RETHOOK_MAXACTIVE_MAX) {
334e5519c37570 Masami Hiramatsu (Google  2023-06-06  1042) 			trace_probe_log_err(1, MAXACT_TOO_BIG);
334e5519c37570 Masami Hiramatsu (Google  2023-06-06  1043) 			goto parse_error;
334e5519c37570 Masami Hiramatsu (Google  2023-06-06  1044) 		}
334e5519c37570 Masami Hiramatsu (Google  2023-06-06  1045) 	}
334e5519c37570 Masami Hiramatsu (Google  2023-06-06  1046) 
334e5519c37570 Masami Hiramatsu (Google  2023-06-06  1047) 	trace_probe_log_set_index(1);
334e5519c37570 Masami Hiramatsu (Google  2023-06-06  1048) 
e2d0d7b2f42dca Masami Hiramatsu (Google  2023-06-06  1049) 	/* a symbol(or tracepoint) must be specified */
08c9306fc2e32b Masami Hiramatsu (Google  2023-08-23  1050) 	ret = parse_symbol_and_return(argc, argv, &symbol, &is_return, is_tracepoint);
08c9306fc2e32b Masami Hiramatsu (Google  2023-08-23  1051) 	if (ret < 0)
334e5519c37570 Masami Hiramatsu (Google  2023-06-06  1052) 		goto parse_error;
08c9306fc2e32b Masami Hiramatsu (Google  2023-08-23  1053) 
334e5519c37570 Masami Hiramatsu (Google  2023-06-06  1054) 	if (!is_return && maxactive) {
334e5519c37570 Masami Hiramatsu (Google  2023-06-06  1055) 		trace_probe_log_set_index(0);
334e5519c37570 Masami Hiramatsu (Google  2023-06-06  1056) 		trace_probe_log_err(1, BAD_MAXACT_TYPE);
334e5519c37570 Masami Hiramatsu (Google  2023-06-06  1057) 		goto parse_error;
334e5519c37570 Masami Hiramatsu (Google  2023-06-06  1058) 	}
334e5519c37570 Masami Hiramatsu (Google  2023-06-06  1059) 
334e5519c37570 Masami Hiramatsu (Google  2023-06-06  1060) 	trace_probe_log_set_index(0);
334e5519c37570 Masami Hiramatsu (Google  2023-06-06  1061) 	if (event) {
334e5519c37570 Masami Hiramatsu (Google  2023-06-06  1062) 		ret = traceprobe_parse_event_name(&event, &group, gbuf,
334e5519c37570 Masami Hiramatsu (Google  2023-06-06  1063) 						  event - argv[0]);
334e5519c37570 Masami Hiramatsu (Google  2023-06-06  1064) 		if (ret)
334e5519c37570 Masami Hiramatsu (Google  2023-06-06  1065) 			goto parse_error;
334e5519c37570 Masami Hiramatsu (Google  2023-06-06  1066) 	}
334e5519c37570 Masami Hiramatsu (Google  2023-06-06  1067) 
334e5519c37570 Masami Hiramatsu (Google  2023-06-06  1068) 	if (!event) {
334e5519c37570 Masami Hiramatsu (Google  2023-06-06  1069) 		/* Make a new event name */
e2d0d7b2f42dca Masami Hiramatsu (Google  2023-06-06  1070) 		if (is_tracepoint)
b576e09701c7d0 Masami Hiramatsu (Google  2023-06-06  1071) 			snprintf(buf, MAX_EVENT_NAME_LEN, "%s%s",
b576e09701c7d0 Masami Hiramatsu (Google  2023-06-06  1072) 				 isdigit(*symbol) ? "_" : "", symbol);
e2d0d7b2f42dca Masami Hiramatsu (Google  2023-06-06  1073) 		else
334e5519c37570 Masami Hiramatsu (Google  2023-06-06  1074) 			snprintf(buf, MAX_EVENT_NAME_LEN, "%s__%s", symbol,
334e5519c37570 Masami Hiramatsu (Google  2023-06-06  1075) 				 is_return ? "exit" : "entry");
334e5519c37570 Masami Hiramatsu (Google  2023-06-06  1076) 		sanitize_event_name(buf);
334e5519c37570 Masami Hiramatsu (Google  2023-06-06  1077) 		event = buf;
334e5519c37570 Masami Hiramatsu (Google  2023-06-06  1078) 	}
334e5519c37570 Masami Hiramatsu (Google  2023-06-06  1079) 
b576e09701c7d0 Masami Hiramatsu (Google  2023-06-06  1080) 	if (is_return)
b576e09701c7d0 Masami Hiramatsu (Google  2023-06-06  1081) 		ctx.flags |= TPARG_FL_RETURN;
b576e09701c7d0 Masami Hiramatsu (Google  2023-06-06  1082) 	else
b576e09701c7d0 Masami Hiramatsu (Google  2023-06-06  1083) 		ctx.flags |= TPARG_FL_FENTRY;
b576e09701c7d0 Masami Hiramatsu (Google  2023-06-06  1084) 
b576e09701c7d0 Masami Hiramatsu (Google  2023-06-06  1085) 	if (is_tracepoint) {
b576e09701c7d0 Masami Hiramatsu (Google  2023-06-06  1086) 		ctx.flags |= TPARG_FL_TPOINT;
b576e09701c7d0 Masami Hiramatsu (Google  2023-06-06  1087) 		tpoint = find_tracepoint(symbol);
b576e09701c7d0 Masami Hiramatsu (Google  2023-06-06  1088) 		if (!tpoint) {
b576e09701c7d0 Masami Hiramatsu (Google  2023-06-06  1089) 			trace_probe_log_set_index(1);
b576e09701c7d0 Masami Hiramatsu (Google  2023-06-06  1090) 			trace_probe_log_err(0, NO_TRACEPOINT);
b576e09701c7d0 Masami Hiramatsu (Google  2023-06-06  1091) 			goto parse_error;
b576e09701c7d0 Masami Hiramatsu (Google  2023-06-06  1092) 		}
b576e09701c7d0 Masami Hiramatsu (Google  2023-06-06  1093) 		ctx.funcname = kallsyms_lookup(
b576e09701c7d0 Masami Hiramatsu (Google  2023-06-06  1094) 				(unsigned long)tpoint->probestub,
b576e09701c7d0 Masami Hiramatsu (Google  2023-06-06  1095) 				NULL, NULL, NULL, sbuf);
b576e09701c7d0 Masami Hiramatsu (Google  2023-06-06  1096) 	} else
b576e09701c7d0 Masami Hiramatsu (Google  2023-06-06  1097) 		ctx.funcname = symbol;
b576e09701c7d0 Masami Hiramatsu (Google  2023-06-06  1098) 
18b1e870a49671 Masami Hiramatsu (Google  2023-06-06  1099) 	argc -= 2; argv += 2;
18b1e870a49671 Masami Hiramatsu (Google  2023-06-06  1100) 	new_argv = traceprobe_expand_meta_args(argc, argv, &new_argc,
18b1e870a49671 Masami Hiramatsu (Google  2023-06-06  1101) 					       abuf, MAX_BTF_ARGS_LEN, &ctx);
18b1e870a49671 Masami Hiramatsu (Google  2023-06-06  1102) 	if (IS_ERR(new_argv)) {
18b1e870a49671 Masami Hiramatsu (Google  2023-06-06  1103) 		ret = PTR_ERR(new_argv);
18b1e870a49671 Masami Hiramatsu (Google  2023-06-06  1104) 		new_argv = NULL;
18b1e870a49671 Masami Hiramatsu (Google  2023-06-06  1105) 		goto out;
18b1e870a49671 Masami Hiramatsu (Google  2023-06-06  1106) 	}
18b1e870a49671 Masami Hiramatsu (Google  2023-06-06  1107) 	if (new_argv) {
18b1e870a49671 Masami Hiramatsu (Google  2023-06-06  1108) 		argc = new_argc;
18b1e870a49671 Masami Hiramatsu (Google  2023-06-06  1109) 		argv = new_argv;
18b1e870a49671 Masami Hiramatsu (Google  2023-06-06  1110) 	}
18b1e870a49671 Masami Hiramatsu (Google  2023-06-06  1111) 
d9b15224dd8ff8 Ye Bin                    2024-03-22  1112  	ret = traceprobe_expand_dentry_args(argc, argv, &dbuf);
d9b15224dd8ff8 Ye Bin                    2024-03-22  1113  	if (ret)
d9b15224dd8ff8 Ye Bin                    2024-03-22  1114  		goto out;
d9b15224dd8ff8 Ye Bin                    2024-03-22  1115  
334e5519c37570 Masami Hiramatsu (Google  2023-06-06  1116) 	/* setup a probe */
b576e09701c7d0 Masami Hiramatsu (Google  2023-06-06  1117) 	tf = alloc_trace_fprobe(group, event, symbol, tpoint, maxactive,
18b1e870a49671 Masami Hiramatsu (Google  2023-06-06  1118) 				argc, is_return);
334e5519c37570 Masami Hiramatsu (Google  2023-06-06  1119) 	if (IS_ERR(tf)) {
334e5519c37570 Masami Hiramatsu (Google  2023-06-06  1120) 		ret = PTR_ERR(tf);
334e5519c37570 Masami Hiramatsu (Google  2023-06-06  1121) 		/* This must return -ENOMEM, else there is a bug */
334e5519c37570 Masami Hiramatsu (Google  2023-06-06  1122) 		WARN_ON_ONCE(ret != -ENOMEM);
334e5519c37570 Masami Hiramatsu (Google  2023-06-06  1123) 		goto out;	/* We know tf is not allocated */
334e5519c37570 Masami Hiramatsu (Google  2023-06-06  1124) 	}
e2d0d7b2f42dca Masami Hiramatsu (Google  2023-06-06  1125) 
b576e09701c7d0 Masami Hiramatsu (Google  2023-06-06  1126) 	if (is_tracepoint)
e2d0d7b2f42dca Masami Hiramatsu (Google  2023-06-06  1127) 		tf->mod = __module_text_address(
e2d0d7b2f42dca Masami Hiramatsu (Google  2023-06-06  1128) 				(unsigned long)tf->tpoint->probestub);
e2d0d7b2f42dca Masami Hiramatsu (Google  2023-06-06  1129) 
334e5519c37570 Masami Hiramatsu (Google  2023-06-06  1130) 	/* parse arguments */
334e5519c37570 Masami Hiramatsu (Google  2023-06-06  1131) 	for (i = 0; i < argc && i < MAX_TRACE_ARGS; i++) {
334e5519c37570 Masami Hiramatsu (Google  2023-06-06  1132) 		trace_probe_log_set_index(i + 2);
b576e09701c7d0 Masami Hiramatsu (Google  2023-06-06  1133) 		ctx.offset = 0;
1b8b0cd754cdbb Masami Hiramatsu (Google  2023-06-06  1134) 		ret = traceprobe_parse_probe_arg(&tf->tp, i, argv[i], &ctx);
334e5519c37570 Masami Hiramatsu (Google  2023-06-06  1135) 		if (ret)
334e5519c37570 Masami Hiramatsu (Google  2023-06-06  1136) 			goto error;	/* This can be -ENOMEM */
334e5519c37570 Masami Hiramatsu (Google  2023-06-06  1137) 	}
334e5519c37570 Masami Hiramatsu (Google  2023-06-06  1138) 
25f00e40ce7953 Masami Hiramatsu (Google  2024-03-04  1139) 	if (is_return && tf->tp.entry_arg) {
25f00e40ce7953 Masami Hiramatsu (Google  2024-03-04 @1140) 		tf->fp.entry_handler = trace_fprobe_entry_handler;
25f00e40ce7953 Masami Hiramatsu (Google  2024-03-04  1141) 		tf->fp.entry_data_size = traceprobe_get_entry_data_size(&tf->tp);
25f00e40ce7953 Masami Hiramatsu (Google  2024-03-04  1142) 	}
25f00e40ce7953 Masami Hiramatsu (Google  2024-03-04  1143) 
334e5519c37570 Masami Hiramatsu (Google  2023-06-06  1144) 	ret = traceprobe_set_print_fmt(&tf->tp,
334e5519c37570 Masami Hiramatsu (Google  2023-06-06  1145) 			is_return ? PROBE_PRINT_RETURN : PROBE_PRINT_NORMAL);
334e5519c37570 Masami Hiramatsu (Google  2023-06-06  1146) 	if (ret < 0)
334e5519c37570 Masami Hiramatsu (Google  2023-06-06  1147) 		goto error;
334e5519c37570 Masami Hiramatsu (Google  2023-06-06  1148) 
334e5519c37570 Masami Hiramatsu (Google  2023-06-06  1149) 	ret = register_trace_fprobe(tf);
334e5519c37570 Masami Hiramatsu (Google  2023-06-06  1150) 	if (ret) {
334e5519c37570 Masami Hiramatsu (Google  2023-06-06  1151) 		trace_probe_log_set_index(1);
334e5519c37570 Masami Hiramatsu (Google  2023-06-06  1152) 		if (ret == -EILSEQ)
334e5519c37570 Masami Hiramatsu (Google  2023-06-06  1153) 			trace_probe_log_err(0, BAD_INSN_BNDRY);
334e5519c37570 Masami Hiramatsu (Google  2023-06-06  1154) 		else if (ret == -ENOENT)
334e5519c37570 Masami Hiramatsu (Google  2023-06-06  1155) 			trace_probe_log_err(0, BAD_PROBE_ADDR);
334e5519c37570 Masami Hiramatsu (Google  2023-06-06  1156) 		else if (ret != -ENOMEM && ret != -EEXIST)
334e5519c37570 Masami Hiramatsu (Google  2023-06-06  1157) 			trace_probe_log_err(0, FAIL_REG_PROBE);
334e5519c37570 Masami Hiramatsu (Google  2023-06-06  1158) 		goto error;
334e5519c37570 Masami Hiramatsu (Google  2023-06-06  1159) 	}
334e5519c37570 Masami Hiramatsu (Google  2023-06-06  1160) 
334e5519c37570 Masami Hiramatsu (Google  2023-06-06  1161) out:
b1d1e90490b671 Masami Hiramatsu (Google  2023-08-23  1162) 	traceprobe_finish_parse(&ctx);
334e5519c37570 Masami Hiramatsu (Google  2023-06-06  1163) 	trace_probe_log_clear();
18b1e870a49671 Masami Hiramatsu (Google  2023-06-06  1164) 	kfree(new_argv);
334e5519c37570 Masami Hiramatsu (Google  2023-06-06  1165) 	kfree(symbol);
d9b15224dd8ff8 Ye Bin                    2024-03-22  1166  	kfree(dbuf);
334e5519c37570 Masami Hiramatsu (Google  2023-06-06  1167) 	return ret;
334e5519c37570 Masami Hiramatsu (Google  2023-06-06  1168) 
334e5519c37570 Masami Hiramatsu (Google  2023-06-06  1169) parse_error:
334e5519c37570 Masami Hiramatsu (Google  2023-06-06  1170) 	ret = -EINVAL;
334e5519c37570 Masami Hiramatsu (Google  2023-06-06  1171) error:
334e5519c37570 Masami Hiramatsu (Google  2023-06-06  1172) 	free_trace_fprobe(tf);
334e5519c37570 Masami Hiramatsu (Google  2023-06-06  1173) 	goto out;
334e5519c37570 Masami Hiramatsu (Google  2023-06-06  1174) }
334e5519c37570 Masami Hiramatsu (Google  2023-06-06  1175) 

:::::: The code at line 1140 was first introduced by commit
:::::: 25f00e40ce7953db197af3a59233711d154c9d80 tracing/probes: Support $argN in return probe (kprobe and fprobe)

:::::: TO: Masami Hiramatsu (Google) <mhiramat@kernel.org>
:::::: CC: Masami Hiramatsu (Google) <mhiramat@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
