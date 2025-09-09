Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A94129BD90
	for <oe-kbuild-all@lists.linux.dev>; Tue,  9 Sep 2025 13:12:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757423533; cv=none; b=FgoX4HcMK5ticGGBnvnVRwhlHFY1u/RNlANEmyQ6lvKupff66jEiEuCbaY+k8GoSNnGztWrLHIyjJDeZOX1y4EyZRx6Kg9cxj3MGEriewJFBYDQdArmfb8kA4FOaHKG1LmyQmlec06kgkxfb36kqi2XxKlMUl1zAI9Bm4oiZJAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757423533; c=relaxed/simple;
	bh=OZH6mjWNcGekZn3Cn3hla6Q09pb5Gb0nhg7t8Qr+C80=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dMo7jNye3dL7QtyTbA2wAu5pXmYsL3r66pzWqPEfxnha8vpmS3jXU1iYpk+yjo+lXuspDhtEjq6ZTyAIevdHY5LDE1wFBB82gkb6Ip/BraMAxBrqGf+BH4yhpTnB4WEMRxW0cvHr+xmHwT9xxwZhl+nffGUercer5Vr7uSdC9rE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aLimg2il; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aLimg2il"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757423530; x=1788959530;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=OZH6mjWNcGekZn3Cn3hla6Q09pb5Gb0nhg7t8Qr+C80=;
  b=aLimg2ilI6YV17MPOepMRmVu1dtEfc4exVGhEv5UcmWR7s4TZrpwVSu0
   jTxfZxi7Mi0I2HwBHcPFHa49xRmOy7CCVCrRfljMkunfFYGzCzEHWKC+L
   MmBY5LqYhNw6H4lcto1pgdErwj+KgV5+hv9VMn3zcBATG04fESoaJZzk5
   Q0Zltt4NbfoHPfZvusFm5n7JcmfFxM+/F8sL/WNkm2RHotFVjfbLsYlkZ
   m8yVR+nuQG3moR+o9i2MCezcywrCRKG7uuRROoRjJIXd9z2Meun+cARPL
   lpx4imeXmpl/DFcFheh/btdL+6Z97FBKske3NL1Iv7CePnSrxVFQk6sLz
   A==;
X-CSE-ConnectionGUID: milK9LMxS2iLlhWMyWIVRw==
X-CSE-MsgGUID: epLLfthuRIqCrKnWvkO+Bg==
X-IronPort-AV: E=McAfee;i="6800,10657,11548"; a="59645234"
X-IronPort-AV: E=Sophos;i="6.18,251,1751266800"; 
   d="scan'208";a="59645234"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2025 06:12:02 -0700
X-CSE-ConnectionGUID: sfLACDoURUuzGUGvmTFUuQ==
X-CSE-MsgGUID: POsOU7TtRDOofzjmAM+4Tg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,251,1751266800"; 
   d="scan'208";a="172998817"
Received: from lkp-server01.sh.intel.com (HELO 114d98da2b6c) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 09 Sep 2025 06:12:01 -0700
Received: from kbuild by 114d98da2b6c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uvy8d-0004sF-0m;
	Tue, 09 Sep 2025 13:11:59 +0000
Date: Tue, 9 Sep 2025 21:11:26 +0800
From: kernel test robot <lkp@intel.com>
To: "Masami Hiramatsu (Google)" <mhiramat@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v2 1/6] tracing: wprobe: Add watchpoint probe event based
 on hardware breakpoint
Message-ID: <202509092034.5ZFS18vn-lkp@intel.com>
References: <175708429018.64001.14265428106568623070.stgit@devnote2>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <175708429018.64001.14265428106568623070.stgit@devnote2>

Hi Masami,

kernel test robot noticed the following build errors:

[auto build test ERROR on trace/for-next]
[also build test ERROR on tip/x86/core perf-tools-next/perf-tools-next tip/perf/core perf-tools/perf-tools peterz-queue/sched/core linus/master v6.17-rc5 next-20250909]
[cannot apply to acme/perf/core]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Masami-Hiramatsu-Google/tracing-wprobe-Add-watchpoint-probe-event-based-on-hardware-breakpoint/20250905-230532
base:   https://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace for-next
patch link:    https://lore.kernel.org/r/175708429018.64001.14265428106568623070.stgit%40devnote2
patch subject: [PATCH v2 1/6] tracing: wprobe: Add watchpoint probe event based on hardware breakpoint
config: xtensa-allyesconfig (https://download.01.org/0day-ci/archive/20250909/202509092034.5ZFS18vn-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250909/202509092034.5ZFS18vn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509092034.5ZFS18vn-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/trace/trace_probe.c: In function 'parse_probe_arg':
>> kernel/trace/trace_probe.c:1124:23: error: implicit declaration of function 'regs_query_register_offset'; did you mean 'ftrace_regs_query_register_offset'? [-Wimplicit-function-declaration]
    1124 |                 ret = regs_query_register_offset(arg + 1);
         |                       ^~~~~~~~~~~~~~~~~~~~~~~~~~
         |                       ftrace_regs_query_register_offset


vim +1124 kernel/trace/trace_probe.c

a42e3c4de9642d5 Masami Hiramatsu          2019-06-20  1099  
8ab83f56475ec91 Srikar Dronamraju         2012-04-09  1100  /* Recursive argument parser */
533059281ee594f Masami Hiramatsu          2018-04-25  1101  static int
533059281ee594f Masami Hiramatsu          2018-04-25  1102  parse_probe_arg(char *arg, const struct fetch_type *type,
533059281ee594f Masami Hiramatsu          2018-04-25  1103  		struct fetch_insn **pcode, struct fetch_insn *end,
1b8b0cd754cdbb5 Masami Hiramatsu (Google  2023-06-06  1104) 		struct traceprobe_parse_context *ctx)
8ab83f56475ec91 Srikar Dronamraju         2012-04-09  1105  {
533059281ee594f Masami Hiramatsu          2018-04-25  1106  	struct fetch_insn *code = *pcode;
8ab83f56475ec91 Srikar Dronamraju         2012-04-09  1107  	unsigned long param;
e65f7ae7f4da566 Masami Hiramatsu          2019-05-15  1108  	int deref = FETCH_OP_DEREF;
bf173ca92da9786 Steven Rostedt (VMware    2018-10-12  1109) 	long offset = 0;
8ab83f56475ec91 Srikar Dronamraju         2012-04-09  1110  	char *tmp;
34fee3a104cea1c Namhyung Kim              2013-11-26  1111  	int ret = 0;
8ab83f56475ec91 Srikar Dronamraju         2012-04-09  1112  
8ab83f56475ec91 Srikar Dronamraju         2012-04-09  1113  	switch (arg[0]) {
8ab83f56475ec91 Srikar Dronamraju         2012-04-09  1114  	case '$':
d157d7694460b9a Masami Hiramatsu (Google  2023-08-23  1115) 		ret = parse_probe_vars(arg, type, pcode, end, ctx);
8ab83f56475ec91 Srikar Dronamraju         2012-04-09  1116  		break;
8ab83f56475ec91 Srikar Dronamraju         2012-04-09  1117  
8ab83f56475ec91 Srikar Dronamraju         2012-04-09  1118  	case '%':	/* named register */
57cb2426dbf36f2 Masami Hiramatsu (Google  2025-09-05  1119) 		if (ctx->flags & (TPARG_FL_TEVENT | TPARG_FL_FPROBE | TPARG_FL_WPROBE)) {
334e5519c375701 Masami Hiramatsu (Google  2023-06-06  1120) 			/* eprobe and fprobe do not handle registers */
1b8b0cd754cdbb5 Masami Hiramatsu (Google  2023-06-06  1121) 			trace_probe_log_err(ctx->offset, BAD_VAR);
2673c60ee67e71f Steven Rostedt (Google    2022-08-20  1122) 			break;
2673c60ee67e71f Steven Rostedt (Google    2022-08-20  1123) 		}
8ab83f56475ec91 Srikar Dronamraju         2012-04-09 @1124  		ret = regs_query_register_offset(arg + 1);
8ab83f56475ec91 Srikar Dronamraju         2012-04-09  1125  		if (ret >= 0) {
533059281ee594f Masami Hiramatsu          2018-04-25  1126  			code->op = FETCH_OP_REG;
533059281ee594f Masami Hiramatsu          2018-04-25  1127  			code->param = (unsigned int)ret;
8ab83f56475ec91 Srikar Dronamraju         2012-04-09  1128  			ret = 0;
ab105a4fb89496c Masami Hiramatsu          2019-03-31  1129  		} else
1b8b0cd754cdbb5 Masami Hiramatsu (Google  2023-06-06  1130) 			trace_probe_log_err(ctx->offset, BAD_REG_NAME);
8ab83f56475ec91 Srikar Dronamraju         2012-04-09  1131  		break;
8ab83f56475ec91 Srikar Dronamraju         2012-04-09  1132  
b7e0bf341f6cfa9 Namhyung Kim              2013-11-25  1133  	case '@':	/* memory, file-offset or symbol */
8ab83f56475ec91 Srikar Dronamraju         2012-04-09  1134  		if (isdigit(arg[1])) {
bcd83ea6cbfee54 Daniel Walter             2012-09-26  1135  			ret = kstrtoul(arg + 1, 0, &param);
ab105a4fb89496c Masami Hiramatsu          2019-03-31  1136  			if (ret) {
1b8b0cd754cdbb5 Masami Hiramatsu (Google  2023-06-06  1137) 				trace_probe_log_err(ctx->offset, BAD_MEM_ADDR);
8ab83f56475ec91 Srikar Dronamraju         2012-04-09  1138  				break;
ab105a4fb89496c Masami Hiramatsu          2019-03-31  1139  			}
533059281ee594f Masami Hiramatsu          2018-04-25  1140  			/* load address */
533059281ee594f Masami Hiramatsu          2018-04-25  1141  			code->op = FETCH_OP_IMM;
533059281ee594f Masami Hiramatsu          2018-04-25  1142  			code->immediate = param;
b7e0bf341f6cfa9 Namhyung Kim              2013-11-25  1143  		} else if (arg[1] == '+') {
b7e0bf341f6cfa9 Namhyung Kim              2013-11-25  1144  			/* kprobes don't support file offsets */
1b8b0cd754cdbb5 Masami Hiramatsu (Google  2023-06-06  1145) 			if (ctx->flags & TPARG_FL_KERNEL) {
1b8b0cd754cdbb5 Masami Hiramatsu (Google  2023-06-06  1146) 				trace_probe_log_err(ctx->offset, FILE_ON_KPROBE);
b7e0bf341f6cfa9 Namhyung Kim              2013-11-25  1147  				return -EINVAL;
ab105a4fb89496c Masami Hiramatsu          2019-03-31  1148  			}
b7e0bf341f6cfa9 Namhyung Kim              2013-11-25  1149  			ret = kstrtol(arg + 2, 0, &offset);
ab105a4fb89496c Masami Hiramatsu          2019-03-31  1150  			if (ret) {
1b8b0cd754cdbb5 Masami Hiramatsu (Google  2023-06-06  1151) 				trace_probe_log_err(ctx->offset, BAD_FILE_OFFS);
b7e0bf341f6cfa9 Namhyung Kim              2013-11-25  1152  				break;
ab105a4fb89496c Masami Hiramatsu          2019-03-31  1153  			}
b7e0bf341f6cfa9 Namhyung Kim              2013-11-25  1154  
533059281ee594f Masami Hiramatsu          2018-04-25  1155  			code->op = FETCH_OP_FOFFS;
533059281ee594f Masami Hiramatsu          2018-04-25  1156  			code->immediate = (unsigned long)offset;  // imm64?
8ab83f56475ec91 Srikar Dronamraju         2012-04-09  1157  		} else {
b079d374fd84637 Namhyung Kim              2013-07-03  1158  			/* uprobes don't support symbols */
1b8b0cd754cdbb5 Masami Hiramatsu (Google  2023-06-06  1159) 			if (!(ctx->flags & TPARG_FL_KERNEL)) {
1b8b0cd754cdbb5 Masami Hiramatsu (Google  2023-06-06  1160) 				trace_probe_log_err(ctx->offset, SYM_ON_UPROBE);
b079d374fd84637 Namhyung Kim              2013-07-03  1161  				return -EINVAL;
ab105a4fb89496c Masami Hiramatsu          2019-03-31  1162  			}
a6682814f37124e Masami Hiramatsu          2018-08-29  1163  			/* Preserve symbol for updating */
a6682814f37124e Masami Hiramatsu          2018-08-29  1164  			code->op = FETCH_NOP_SYMBOL;
a6682814f37124e Masami Hiramatsu          2018-08-29  1165  			code->data = kstrdup(arg + 1, GFP_KERNEL);
a6682814f37124e Masami Hiramatsu          2018-08-29  1166  			if (!code->data)
a6682814f37124e Masami Hiramatsu          2018-08-29  1167  				return -ENOMEM;
ab105a4fb89496c Masami Hiramatsu          2019-03-31  1168  			if (++code == end) {
1b8b0cd754cdbb5 Masami Hiramatsu (Google  2023-06-06  1169) 				trace_probe_log_err(ctx->offset, TOO_MANY_OPS);
ab105a4fb89496c Masami Hiramatsu          2019-03-31  1170  				return -EINVAL;
ab105a4fb89496c Masami Hiramatsu          2019-03-31  1171  			}
533059281ee594f Masami Hiramatsu          2018-04-25  1172  			code->op = FETCH_OP_IMM;
a6682814f37124e Masami Hiramatsu          2018-08-29  1173  			code->immediate = 0;
533059281ee594f Masami Hiramatsu          2018-04-25  1174  		}
533059281ee594f Masami Hiramatsu          2018-04-25  1175  		/* These are fetching from memory */
ab105a4fb89496c Masami Hiramatsu          2019-03-31  1176  		if (++code == end) {
1b8b0cd754cdbb5 Masami Hiramatsu (Google  2023-06-06  1177) 			trace_probe_log_err(ctx->offset, TOO_MANY_OPS);
ab105a4fb89496c Masami Hiramatsu          2019-03-31  1178  			return -EINVAL;
ab105a4fb89496c Masami Hiramatsu          2019-03-31  1179  		}
533059281ee594f Masami Hiramatsu          2018-04-25  1180  		*pcode = code;
533059281ee594f Masami Hiramatsu          2018-04-25  1181  		code->op = FETCH_OP_DEREF;
533059281ee594f Masami Hiramatsu          2018-04-25  1182  		code->offset = offset;
8ab83f56475ec91 Srikar Dronamraju         2012-04-09  1183  		break;
8ab83f56475ec91 Srikar Dronamraju         2012-04-09  1184  
8ab83f56475ec91 Srikar Dronamraju         2012-04-09  1185  	case '+':	/* deref memory */
8ab83f56475ec91 Srikar Dronamraju         2012-04-09  1186  	case '-':
e65f7ae7f4da566 Masami Hiramatsu          2019-05-15  1187  		if (arg[1] == 'u') {
e65f7ae7f4da566 Masami Hiramatsu          2019-05-15  1188  			deref = FETCH_OP_UDEREF;
e65f7ae7f4da566 Masami Hiramatsu          2019-05-15  1189  			arg[1] = arg[0];
e65f7ae7f4da566 Masami Hiramatsu          2019-05-15  1190  			arg++;
e65f7ae7f4da566 Masami Hiramatsu          2019-05-15  1191  		}
e65f7ae7f4da566 Masami Hiramatsu          2019-05-15  1192  		if (arg[0] == '+')
e65f7ae7f4da566 Masami Hiramatsu          2019-05-15  1193  			arg++;	/* Skip '+', because kstrtol() rejects it. */
8ab83f56475ec91 Srikar Dronamraju         2012-04-09  1194  		tmp = strchr(arg, '(');
ab105a4fb89496c Masami Hiramatsu          2019-03-31  1195  		if (!tmp) {
1b8b0cd754cdbb5 Masami Hiramatsu (Google  2023-06-06  1196) 			trace_probe_log_err(ctx->offset, DEREF_NEED_BRACE);
533059281ee594f Masami Hiramatsu          2018-04-25  1197  			return -EINVAL;
ab105a4fb89496c Masami Hiramatsu          2019-03-31  1198  		}
8ab83f56475ec91 Srikar Dronamraju         2012-04-09  1199  		*tmp = '\0';
bcd83ea6cbfee54 Daniel Walter             2012-09-26  1200  		ret = kstrtol(arg, 0, &offset);
ab105a4fb89496c Masami Hiramatsu          2019-03-31  1201  		if (ret) {
1b8b0cd754cdbb5 Masami Hiramatsu (Google  2023-06-06  1202) 			trace_probe_log_err(ctx->offset, BAD_DEREF_OFFS);
8ab83f56475ec91 Srikar Dronamraju         2012-04-09  1203  			break;
ab105a4fb89496c Masami Hiramatsu          2019-03-31  1204  		}
1b8b0cd754cdbb5 Masami Hiramatsu (Google  2023-06-06  1205) 		ctx->offset += (tmp + 1 - arg) + (arg[0] != '-' ? 1 : 0);
8ab83f56475ec91 Srikar Dronamraju         2012-04-09  1206  		arg = tmp + 1;
8ab83f56475ec91 Srikar Dronamraju         2012-04-09  1207  		tmp = strrchr(arg, ')');
ab105a4fb89496c Masami Hiramatsu          2019-03-31  1208  		if (!tmp) {
1b8b0cd754cdbb5 Masami Hiramatsu (Google  2023-06-06  1209) 			trace_probe_log_err(ctx->offset + strlen(arg),
ab105a4fb89496c Masami Hiramatsu          2019-03-31  1210  					    DEREF_OPEN_BRACE);
ab105a4fb89496c Masami Hiramatsu          2019-03-31  1211  			return -EINVAL;
ab105a4fb89496c Masami Hiramatsu          2019-03-31  1212  		} else {
1b8b0cd754cdbb5 Masami Hiramatsu (Google  2023-06-06  1213) 			const struct fetch_type *t2 = find_fetch_type(NULL, ctx->flags);
1b8b0cd754cdbb5 Masami Hiramatsu (Google  2023-06-06  1214) 			int cur_offs = ctx->offset;
8ab83f56475ec91 Srikar Dronamraju         2012-04-09  1215  
8ab83f56475ec91 Srikar Dronamraju         2012-04-09  1216  			*tmp = '\0';
1b8b0cd754cdbb5 Masami Hiramatsu (Google  2023-06-06  1217) 			ret = parse_probe_arg(arg, t2, &code, end, ctx);
8ab83f56475ec91 Srikar Dronamraju         2012-04-09  1218  			if (ret)
533059281ee594f Masami Hiramatsu          2018-04-25  1219  				break;
1b8b0cd754cdbb5 Masami Hiramatsu (Google  2023-06-06  1220) 			ctx->offset = cur_offs;
a42e3c4de9642d5 Masami Hiramatsu          2019-06-20  1221  			if (code->op == FETCH_OP_COMM ||
a42e3c4de9642d5 Masami Hiramatsu          2019-06-20  1222  			    code->op == FETCH_OP_DATA) {
1b8b0cd754cdbb5 Masami Hiramatsu (Google  2023-06-06  1223) 				trace_probe_log_err(ctx->offset, COMM_CANT_DEREF);
533059281ee594f Masami Hiramatsu          2018-04-25  1224  				return -EINVAL;
ab105a4fb89496c Masami Hiramatsu          2019-03-31  1225  			}
ab105a4fb89496c Masami Hiramatsu          2019-03-31  1226  			if (++code == end) {
1b8b0cd754cdbb5 Masami Hiramatsu (Google  2023-06-06  1227) 				trace_probe_log_err(ctx->offset, TOO_MANY_OPS);
ab105a4fb89496c Masami Hiramatsu          2019-03-31  1228  				return -EINVAL;
ab105a4fb89496c Masami Hiramatsu          2019-03-31  1229  			}
533059281ee594f Masami Hiramatsu          2018-04-25  1230  			*pcode = code;
533059281ee594f Masami Hiramatsu          2018-04-25  1231  
e65f7ae7f4da566 Masami Hiramatsu          2019-05-15  1232  			code->op = deref;
533059281ee594f Masami Hiramatsu          2018-04-25  1233  			code->offset = offset;
c440adfbe30257d Masami Hiramatsu (Google  2023-08-23  1234) 			/* Reset the last type if used */
c440adfbe30257d Masami Hiramatsu (Google  2023-08-23  1235) 			ctx->last_type = NULL;
8ab83f56475ec91 Srikar Dronamraju         2012-04-09  1236  		}
8ab83f56475ec91 Srikar Dronamraju         2012-04-09  1237  		break;
6218bf9f4d2942e Masami Hiramatsu          2019-06-20  1238  	case '\\':	/* Immediate value */
a42e3c4de9642d5 Masami Hiramatsu          2019-06-20  1239  		if (arg[1] == '"') {	/* Immediate string */
1b8b0cd754cdbb5 Masami Hiramatsu (Google  2023-06-06  1240) 			ret = __parse_imm_string(arg + 2, &tmp, ctx->offset + 2);
a42e3c4de9642d5 Masami Hiramatsu          2019-06-20  1241  			if (ret)
a42e3c4de9642d5 Masami Hiramatsu          2019-06-20  1242  				break;
a42e3c4de9642d5 Masami Hiramatsu          2019-06-20  1243  			code->op = FETCH_OP_DATA;
a42e3c4de9642d5 Masami Hiramatsu          2019-06-20  1244  			code->data = tmp;
a42e3c4de9642d5 Masami Hiramatsu          2019-06-20  1245  		} else {
6218bf9f4d2942e Masami Hiramatsu          2019-06-20  1246  			ret = str_to_immediate(arg + 1, &code->immediate);
6218bf9f4d2942e Masami Hiramatsu          2019-06-20  1247  			if (ret)
1b8b0cd754cdbb5 Masami Hiramatsu (Google  2023-06-06  1248) 				trace_probe_log_err(ctx->offset + 1, BAD_IMM);
6218bf9f4d2942e Masami Hiramatsu          2019-06-20  1249  			else
6218bf9f4d2942e Masami Hiramatsu          2019-06-20  1250  				code->op = FETCH_OP_IMM;
a42e3c4de9642d5 Masami Hiramatsu          2019-06-20  1251  		}
6218bf9f4d2942e Masami Hiramatsu          2019-06-20  1252  		break;
b576e09701c7d04 Masami Hiramatsu (Google  2023-06-06  1253) 	default:
b576e09701c7d04 Masami Hiramatsu (Google  2023-06-06  1254) 		if (isalpha(arg[0]) || arg[0] == '_') {	/* BTF variable */
25f00e40ce7953d Masami Hiramatsu (Google  2024-03-04  1255) 			if (!tparg_is_function_entry(ctx->flags) &&
25f00e40ce7953d Masami Hiramatsu (Google  2024-03-04  1256) 			    !tparg_is_function_return(ctx->flags)) {
b576e09701c7d04 Masami Hiramatsu (Google  2023-06-06  1257) 				trace_probe_log_err(ctx->offset, NOSUP_BTFARG);
b576e09701c7d04 Masami Hiramatsu (Google  2023-06-06  1258) 				return -EINVAL;
b576e09701c7d04 Masami Hiramatsu (Google  2023-06-06  1259) 			}
c440adfbe30257d Masami Hiramatsu (Google  2023-08-23  1260) 			ret = parse_btf_arg(arg, pcode, end, ctx);
b576e09701c7d04 Masami Hiramatsu (Google  2023-06-06  1261) 			break;
b576e09701c7d04 Masami Hiramatsu (Google  2023-06-06  1262) 		}
8ab83f56475ec91 Srikar Dronamraju         2012-04-09  1263  	}
533059281ee594f Masami Hiramatsu          2018-04-25  1264  	if (!ret && code->op == FETCH_OP_NOP) {
533059281ee594f Masami Hiramatsu          2018-04-25  1265  		/* Parsed, but do not find fetch method */
1b8b0cd754cdbb5 Masami Hiramatsu (Google  2023-06-06  1266) 		trace_probe_log_err(ctx->offset, BAD_FETCH_ARG);
8ab83f56475ec91 Srikar Dronamraju         2012-04-09  1267  		ret = -EINVAL;
8ab83f56475ec91 Srikar Dronamraju         2012-04-09  1268  	}
8ab83f56475ec91 Srikar Dronamraju         2012-04-09  1269  	return ret;
8ab83f56475ec91 Srikar Dronamraju         2012-04-09  1270  }
8ab83f56475ec91 Srikar Dronamraju         2012-04-09  1271  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
