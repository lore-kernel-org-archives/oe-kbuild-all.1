Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 388A51D6DB6
	for <oe-kbuild-all@lists.linux.dev>; Wed, 10 Sep 2025 01:04:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757466257; cv=none; b=p1IoL5FN8loAG4i5RC0RhL72/6qcC5BotloXVTwiPuFZwrxap26dHnwyXp1UzQcaAeNxwuI8nZaLi1aCA3tIxtkqxSzgUd0k2AIToUUJglEve5Fi6rjAgKB1rTaKzvzaJouejf5On/q5ab2TRdehP6WMgfVHozNx/0AkjOcIjz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757466257; c=relaxed/simple;
	bh=A1BlUG55iKtHXfVtgSDET3y9YYq8KCF0/RgYyEv5djg=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=TE0fAxCD8tP6GYsUrM+k/iNBsnfOHhl56i5t77b1jaYPwjnUBk0/gerPmzxwsdgH3uXyyRW1DLdjCuyBtOpV3xvzLiwyokLQ8AZmvyrC/koN14A/e43kBJ9Gh+l6brgwX27iMXsTI19cbQ51YVxPKQSvduGwZMrHGuObhJrVTfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ku0026Yj; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ku0026Yj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 508A1C4CEF4;
	Wed, 10 Sep 2025 01:04:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757466254;
	bh=A1BlUG55iKtHXfVtgSDET3y9YYq8KCF0/RgYyEv5djg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Ku0026YjCF4YwGj9KLO6olcBSeCpzlejQM5wRskhIXoXiN2mMNg67BRTjOdzu4Wox
	 6FUr95+RPSgvYraLr0J1uvVom9TFDgsUrmqmTuTP/Bf51cqP+n2o0gi2KZzRrqSMeZ
	 WuSl/xRLlcsUZqcwRgjdzZByun7L5C6R1a7JTtC4GtdUvS2ZnTHAf7U5W9K0n9GATp
	 n3Yh1JGnQ680whC/zjQIoiMxcRf+zjfmDBZHidSRjVUy1urnyE+HIpnQGiFhlewi0Z
	 F1/EFeDBwloN5C4C3DH9xCr+/GLVgJ7J2QQn1ENwHaG5DHU1u5M3BpY2UKpS5oU3GD
	 7FOuzyfiZl9Mg==
Date: Wed, 10 Sep 2025 10:04:10 +0900
From: Masami Hiramatsu (Google) <mhiramat@kernel.org>
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v2 1/6] tracing: wprobe: Add watchpoint probe event
 based on hardware breakpoint
Message-Id: <20250910100410.c221994d83cba3e33eec9b5d@kernel.org>
In-Reply-To: <202509092034.5ZFS18vn-lkp@intel.com>
References: <175708429018.64001.14265428106568623070.stgit@devnote2>
	<202509092034.5ZFS18vn-lkp@intel.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 9 Sep 2025 21:11:26 +0800
kernel test robot <lkp@intel.com> wrote:

> Hi Masami,
> 
> kernel test robot noticed the following build errors:
> 
> [auto build test ERROR on trace/for-next]
> [also build test ERROR on tip/x86/core perf-tools-next/perf-tools-next tip/perf/core perf-tools/perf-tools peterz-queue/sched/core linus/master v6.17-rc5 next-20250909]
> [cannot apply to acme/perf/core]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Masami-Hiramatsu-Google/tracing-wprobe-Add-watchpoint-probe-event-based-on-hardware-breakpoint/20250905-230532
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace for-next
> patch link:    https://lore.kernel.org/r/175708429018.64001.14265428106568623070.stgit%40devnote2
> patch subject: [PATCH v2 1/6] tracing: wprobe: Add watchpoint probe event based on hardware breakpoint
> config: xtensa-allyesconfig (https://download.01.org/0day-ci/archive/20250909/202509092034.5ZFS18vn-lkp@intel.com/config)
> compiler: xtensa-linux-gcc (GCC) 15.1.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250909/202509092034.5ZFS18vn-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202509092034.5ZFS18vn-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>    kernel/trace/trace_probe.c: In function 'parse_probe_arg':
> >> kernel/trace/trace_probe.c:1124:23: error: implicit declaration of function 'regs_query_register_offset'; did you mean 'ftrace_regs_query_register_offset'? [-Wimplicit-function-declaration]
>     1124 |                 ret = regs_query_register_offset(arg + 1);
>          |                       ^~~~~~~~~~~~~~~~~~~~~~~~~~
>          |                       ftrace_regs_query_register_offset

This is a bug, and maybe activated by this patch because 

+config WPROBE_EVENTS
+	bool "Enable wprobe-based dynamic events"
+	depends on TRACING
+	depends on HAVE_HW_BREAKPOINT
+	select PROBE_EVENTS
+	select DYNAMIC_EVENTS

if xtensa has no register access API but HAVE_HW_BREAKPOINT, it will
select PROBE_EVENT.

I think this part (%regs support) should be enclosed by #ifdef
CONFIG_HAVE_REGS_AND_STACK_ACCESS_API. (Note that fprobe event
and eprobe event do not support it too.)

Thank you,

> 
> 
> vim +1124 kernel/trace/trace_probe.c
> 
> a42e3c4de9642d5 Masami Hiramatsu          2019-06-20  1099  
> 8ab83f56475ec91 Srikar Dronamraju         2012-04-09  1100  /* Recursive argument parser */
> 533059281ee594f Masami Hiramatsu          2018-04-25  1101  static int
> 533059281ee594f Masami Hiramatsu          2018-04-25  1102  parse_probe_arg(char *arg, const struct fetch_type *type,
> 533059281ee594f Masami Hiramatsu          2018-04-25  1103  		struct fetch_insn **pcode, struct fetch_insn *end,
> 1b8b0cd754cdbb5 Masami Hiramatsu (Google  2023-06-06  1104) 		struct traceprobe_parse_context *ctx)
> 8ab83f56475ec91 Srikar Dronamraju         2012-04-09  1105  {
> 533059281ee594f Masami Hiramatsu          2018-04-25  1106  	struct fetch_insn *code = *pcode;
> 8ab83f56475ec91 Srikar Dronamraju         2012-04-09  1107  	unsigned long param;
> e65f7ae7f4da566 Masami Hiramatsu          2019-05-15  1108  	int deref = FETCH_OP_DEREF;
> bf173ca92da9786 Steven Rostedt (VMware    2018-10-12  1109) 	long offset = 0;
> 8ab83f56475ec91 Srikar Dronamraju         2012-04-09  1110  	char *tmp;
> 34fee3a104cea1c Namhyung Kim              2013-11-26  1111  	int ret = 0;
> 8ab83f56475ec91 Srikar Dronamraju         2012-04-09  1112  
> 8ab83f56475ec91 Srikar Dronamraju         2012-04-09  1113  	switch (arg[0]) {
> 8ab83f56475ec91 Srikar Dronamraju         2012-04-09  1114  	case '$':
> d157d7694460b9a Masami Hiramatsu (Google  2023-08-23  1115) 		ret = parse_probe_vars(arg, type, pcode, end, ctx);
> 8ab83f56475ec91 Srikar Dronamraju         2012-04-09  1116  		break;
> 8ab83f56475ec91 Srikar Dronamraju         2012-04-09  1117  
> 8ab83f56475ec91 Srikar Dronamraju         2012-04-09  1118  	case '%':	/* named register */
> 57cb2426dbf36f2 Masami Hiramatsu (Google  2025-09-05  1119) 		if (ctx->flags & (TPARG_FL_TEVENT | TPARG_FL_FPROBE | TPARG_FL_WPROBE)) {
> 334e5519c375701 Masami Hiramatsu (Google  2023-06-06  1120) 			/* eprobe and fprobe do not handle registers */
> 1b8b0cd754cdbb5 Masami Hiramatsu (Google  2023-06-06  1121) 			trace_probe_log_err(ctx->offset, BAD_VAR);
> 2673c60ee67e71f Steven Rostedt (Google    2022-08-20  1122) 			break;
> 2673c60ee67e71f Steven Rostedt (Google    2022-08-20  1123) 		}
> 8ab83f56475ec91 Srikar Dronamraju         2012-04-09 @1124  		ret = regs_query_register_offset(arg + 1);
> 8ab83f56475ec91 Srikar Dronamraju         2012-04-09  1125  		if (ret >= 0) {
> 533059281ee594f Masami Hiramatsu          2018-04-25  1126  			code->op = FETCH_OP_REG;
> 533059281ee594f Masami Hiramatsu          2018-04-25  1127  			code->param = (unsigned int)ret;
> 8ab83f56475ec91 Srikar Dronamraju         2012-04-09  1128  			ret = 0;
> ab105a4fb89496c Masami Hiramatsu          2019-03-31  1129  		} else
> 1b8b0cd754cdbb5 Masami Hiramatsu (Google  2023-06-06  1130) 			trace_probe_log_err(ctx->offset, BAD_REG_NAME);
> 8ab83f56475ec91 Srikar Dronamraju         2012-04-09  1131  		break;
> 8ab83f56475ec91 Srikar Dronamraju         2012-04-09  1132  
> b7e0bf341f6cfa9 Namhyung Kim              2013-11-25  1133  	case '@':	/* memory, file-offset or symbol */
> 8ab83f56475ec91 Srikar Dronamraju         2012-04-09  1134  		if (isdigit(arg[1])) {
> bcd83ea6cbfee54 Daniel Walter             2012-09-26  1135  			ret = kstrtoul(arg + 1, 0, &param);
> ab105a4fb89496c Masami Hiramatsu          2019-03-31  1136  			if (ret) {
> 1b8b0cd754cdbb5 Masami Hiramatsu (Google  2023-06-06  1137) 				trace_probe_log_err(ctx->offset, BAD_MEM_ADDR);
> 8ab83f56475ec91 Srikar Dronamraju         2012-04-09  1138  				break;
> ab105a4fb89496c Masami Hiramatsu          2019-03-31  1139  			}
> 533059281ee594f Masami Hiramatsu          2018-04-25  1140  			/* load address */
> 533059281ee594f Masami Hiramatsu          2018-04-25  1141  			code->op = FETCH_OP_IMM;
> 533059281ee594f Masami Hiramatsu          2018-04-25  1142  			code->immediate = param;
> b7e0bf341f6cfa9 Namhyung Kim              2013-11-25  1143  		} else if (arg[1] == '+') {
> b7e0bf341f6cfa9 Namhyung Kim              2013-11-25  1144  			/* kprobes don't support file offsets */
> 1b8b0cd754cdbb5 Masami Hiramatsu (Google  2023-06-06  1145) 			if (ctx->flags & TPARG_FL_KERNEL) {
> 1b8b0cd754cdbb5 Masami Hiramatsu (Google  2023-06-06  1146) 				trace_probe_log_err(ctx->offset, FILE_ON_KPROBE);
> b7e0bf341f6cfa9 Namhyung Kim              2013-11-25  1147  				return -EINVAL;
> ab105a4fb89496c Masami Hiramatsu          2019-03-31  1148  			}
> b7e0bf341f6cfa9 Namhyung Kim              2013-11-25  1149  			ret = kstrtol(arg + 2, 0, &offset);
> ab105a4fb89496c Masami Hiramatsu          2019-03-31  1150  			if (ret) {
> 1b8b0cd754cdbb5 Masami Hiramatsu (Google  2023-06-06  1151) 				trace_probe_log_err(ctx->offset, BAD_FILE_OFFS);
> b7e0bf341f6cfa9 Namhyung Kim              2013-11-25  1152  				break;
> ab105a4fb89496c Masami Hiramatsu          2019-03-31  1153  			}
> b7e0bf341f6cfa9 Namhyung Kim              2013-11-25  1154  
> 533059281ee594f Masami Hiramatsu          2018-04-25  1155  			code->op = FETCH_OP_FOFFS;
> 533059281ee594f Masami Hiramatsu          2018-04-25  1156  			code->immediate = (unsigned long)offset;  // imm64?
> 8ab83f56475ec91 Srikar Dronamraju         2012-04-09  1157  		} else {
> b079d374fd84637 Namhyung Kim              2013-07-03  1158  			/* uprobes don't support symbols */
> 1b8b0cd754cdbb5 Masami Hiramatsu (Google  2023-06-06  1159) 			if (!(ctx->flags & TPARG_FL_KERNEL)) {
> 1b8b0cd754cdbb5 Masami Hiramatsu (Google  2023-06-06  1160) 				trace_probe_log_err(ctx->offset, SYM_ON_UPROBE);
> b079d374fd84637 Namhyung Kim              2013-07-03  1161  				return -EINVAL;
> ab105a4fb89496c Masami Hiramatsu          2019-03-31  1162  			}
> a6682814f37124e Masami Hiramatsu          2018-08-29  1163  			/* Preserve symbol for updating */
> a6682814f37124e Masami Hiramatsu          2018-08-29  1164  			code->op = FETCH_NOP_SYMBOL;
> a6682814f37124e Masami Hiramatsu          2018-08-29  1165  			code->data = kstrdup(arg + 1, GFP_KERNEL);
> a6682814f37124e Masami Hiramatsu          2018-08-29  1166  			if (!code->data)
> a6682814f37124e Masami Hiramatsu          2018-08-29  1167  				return -ENOMEM;
> ab105a4fb89496c Masami Hiramatsu          2019-03-31  1168  			if (++code == end) {
> 1b8b0cd754cdbb5 Masami Hiramatsu (Google  2023-06-06  1169) 				trace_probe_log_err(ctx->offset, TOO_MANY_OPS);
> ab105a4fb89496c Masami Hiramatsu          2019-03-31  1170  				return -EINVAL;
> ab105a4fb89496c Masami Hiramatsu          2019-03-31  1171  			}
> 533059281ee594f Masami Hiramatsu          2018-04-25  1172  			code->op = FETCH_OP_IMM;
> a6682814f37124e Masami Hiramatsu          2018-08-29  1173  			code->immediate = 0;
> 533059281ee594f Masami Hiramatsu          2018-04-25  1174  		}
> 533059281ee594f Masami Hiramatsu          2018-04-25  1175  		/* These are fetching from memory */
> ab105a4fb89496c Masami Hiramatsu          2019-03-31  1176  		if (++code == end) {
> 1b8b0cd754cdbb5 Masami Hiramatsu (Google  2023-06-06  1177) 			trace_probe_log_err(ctx->offset, TOO_MANY_OPS);
> ab105a4fb89496c Masami Hiramatsu          2019-03-31  1178  			return -EINVAL;
> ab105a4fb89496c Masami Hiramatsu          2019-03-31  1179  		}
> 533059281ee594f Masami Hiramatsu          2018-04-25  1180  		*pcode = code;
> 533059281ee594f Masami Hiramatsu          2018-04-25  1181  		code->op = FETCH_OP_DEREF;
> 533059281ee594f Masami Hiramatsu          2018-04-25  1182  		code->offset = offset;
> 8ab83f56475ec91 Srikar Dronamraju         2012-04-09  1183  		break;
> 8ab83f56475ec91 Srikar Dronamraju         2012-04-09  1184  
> 8ab83f56475ec91 Srikar Dronamraju         2012-04-09  1185  	case '+':	/* deref memory */
> 8ab83f56475ec91 Srikar Dronamraju         2012-04-09  1186  	case '-':
> e65f7ae7f4da566 Masami Hiramatsu          2019-05-15  1187  		if (arg[1] == 'u') {
> e65f7ae7f4da566 Masami Hiramatsu          2019-05-15  1188  			deref = FETCH_OP_UDEREF;
> e65f7ae7f4da566 Masami Hiramatsu          2019-05-15  1189  			arg[1] = arg[0];
> e65f7ae7f4da566 Masami Hiramatsu          2019-05-15  1190  			arg++;
> e65f7ae7f4da566 Masami Hiramatsu          2019-05-15  1191  		}
> e65f7ae7f4da566 Masami Hiramatsu          2019-05-15  1192  		if (arg[0] == '+')
> e65f7ae7f4da566 Masami Hiramatsu          2019-05-15  1193  			arg++;	/* Skip '+', because kstrtol() rejects it. */
> 8ab83f56475ec91 Srikar Dronamraju         2012-04-09  1194  		tmp = strchr(arg, '(');
> ab105a4fb89496c Masami Hiramatsu          2019-03-31  1195  		if (!tmp) {
> 1b8b0cd754cdbb5 Masami Hiramatsu (Google  2023-06-06  1196) 			trace_probe_log_err(ctx->offset, DEREF_NEED_BRACE);
> 533059281ee594f Masami Hiramatsu          2018-04-25  1197  			return -EINVAL;
> ab105a4fb89496c Masami Hiramatsu          2019-03-31  1198  		}
> 8ab83f56475ec91 Srikar Dronamraju         2012-04-09  1199  		*tmp = '\0';
> bcd83ea6cbfee54 Daniel Walter             2012-09-26  1200  		ret = kstrtol(arg, 0, &offset);
> ab105a4fb89496c Masami Hiramatsu          2019-03-31  1201  		if (ret) {
> 1b8b0cd754cdbb5 Masami Hiramatsu (Google  2023-06-06  1202) 			trace_probe_log_err(ctx->offset, BAD_DEREF_OFFS);
> 8ab83f56475ec91 Srikar Dronamraju         2012-04-09  1203  			break;
> ab105a4fb89496c Masami Hiramatsu          2019-03-31  1204  		}
> 1b8b0cd754cdbb5 Masami Hiramatsu (Google  2023-06-06  1205) 		ctx->offset += (tmp + 1 - arg) + (arg[0] != '-' ? 1 : 0);
> 8ab83f56475ec91 Srikar Dronamraju         2012-04-09  1206  		arg = tmp + 1;
> 8ab83f56475ec91 Srikar Dronamraju         2012-04-09  1207  		tmp = strrchr(arg, ')');
> ab105a4fb89496c Masami Hiramatsu          2019-03-31  1208  		if (!tmp) {
> 1b8b0cd754cdbb5 Masami Hiramatsu (Google  2023-06-06  1209) 			trace_probe_log_err(ctx->offset + strlen(arg),
> ab105a4fb89496c Masami Hiramatsu          2019-03-31  1210  					    DEREF_OPEN_BRACE);
> ab105a4fb89496c Masami Hiramatsu          2019-03-31  1211  			return -EINVAL;
> ab105a4fb89496c Masami Hiramatsu          2019-03-31  1212  		} else {
> 1b8b0cd754cdbb5 Masami Hiramatsu (Google  2023-06-06  1213) 			const struct fetch_type *t2 = find_fetch_type(NULL, ctx->flags);
> 1b8b0cd754cdbb5 Masami Hiramatsu (Google  2023-06-06  1214) 			int cur_offs = ctx->offset;
> 8ab83f56475ec91 Srikar Dronamraju         2012-04-09  1215  
> 8ab83f56475ec91 Srikar Dronamraju         2012-04-09  1216  			*tmp = '\0';
> 1b8b0cd754cdbb5 Masami Hiramatsu (Google  2023-06-06  1217) 			ret = parse_probe_arg(arg, t2, &code, end, ctx);
> 8ab83f56475ec91 Srikar Dronamraju         2012-04-09  1218  			if (ret)
> 533059281ee594f Masami Hiramatsu          2018-04-25  1219  				break;
> 1b8b0cd754cdbb5 Masami Hiramatsu (Google  2023-06-06  1220) 			ctx->offset = cur_offs;
> a42e3c4de9642d5 Masami Hiramatsu          2019-06-20  1221  			if (code->op == FETCH_OP_COMM ||
> a42e3c4de9642d5 Masami Hiramatsu          2019-06-20  1222  			    code->op == FETCH_OP_DATA) {
> 1b8b0cd754cdbb5 Masami Hiramatsu (Google  2023-06-06  1223) 				trace_probe_log_err(ctx->offset, COMM_CANT_DEREF);
> 533059281ee594f Masami Hiramatsu          2018-04-25  1224  				return -EINVAL;
> ab105a4fb89496c Masami Hiramatsu          2019-03-31  1225  			}
> ab105a4fb89496c Masami Hiramatsu          2019-03-31  1226  			if (++code == end) {
> 1b8b0cd754cdbb5 Masami Hiramatsu (Google  2023-06-06  1227) 				trace_probe_log_err(ctx->offset, TOO_MANY_OPS);
> ab105a4fb89496c Masami Hiramatsu          2019-03-31  1228  				return -EINVAL;
> ab105a4fb89496c Masami Hiramatsu          2019-03-31  1229  			}
> 533059281ee594f Masami Hiramatsu          2018-04-25  1230  			*pcode = code;
> 533059281ee594f Masami Hiramatsu          2018-04-25  1231  
> e65f7ae7f4da566 Masami Hiramatsu          2019-05-15  1232  			code->op = deref;
> 533059281ee594f Masami Hiramatsu          2018-04-25  1233  			code->offset = offset;
> c440adfbe30257d Masami Hiramatsu (Google  2023-08-23  1234) 			/* Reset the last type if used */
> c440adfbe30257d Masami Hiramatsu (Google  2023-08-23  1235) 			ctx->last_type = NULL;
> 8ab83f56475ec91 Srikar Dronamraju         2012-04-09  1236  		}
> 8ab83f56475ec91 Srikar Dronamraju         2012-04-09  1237  		break;
> 6218bf9f4d2942e Masami Hiramatsu          2019-06-20  1238  	case '\\':	/* Immediate value */
> a42e3c4de9642d5 Masami Hiramatsu          2019-06-20  1239  		if (arg[1] == '"') {	/* Immediate string */
> 1b8b0cd754cdbb5 Masami Hiramatsu (Google  2023-06-06  1240) 			ret = __parse_imm_string(arg + 2, &tmp, ctx->offset + 2);
> a42e3c4de9642d5 Masami Hiramatsu          2019-06-20  1241  			if (ret)
> a42e3c4de9642d5 Masami Hiramatsu          2019-06-20  1242  				break;
> a42e3c4de9642d5 Masami Hiramatsu          2019-06-20  1243  			code->op = FETCH_OP_DATA;
> a42e3c4de9642d5 Masami Hiramatsu          2019-06-20  1244  			code->data = tmp;
> a42e3c4de9642d5 Masami Hiramatsu          2019-06-20  1245  		} else {
> 6218bf9f4d2942e Masami Hiramatsu          2019-06-20  1246  			ret = str_to_immediate(arg + 1, &code->immediate);
> 6218bf9f4d2942e Masami Hiramatsu          2019-06-20  1247  			if (ret)
> 1b8b0cd754cdbb5 Masami Hiramatsu (Google  2023-06-06  1248) 				trace_probe_log_err(ctx->offset + 1, BAD_IMM);
> 6218bf9f4d2942e Masami Hiramatsu          2019-06-20  1249  			else
> 6218bf9f4d2942e Masami Hiramatsu          2019-06-20  1250  				code->op = FETCH_OP_IMM;
> a42e3c4de9642d5 Masami Hiramatsu          2019-06-20  1251  		}
> 6218bf9f4d2942e Masami Hiramatsu          2019-06-20  1252  		break;
> b576e09701c7d04 Masami Hiramatsu (Google  2023-06-06  1253) 	default:
> b576e09701c7d04 Masami Hiramatsu (Google  2023-06-06  1254) 		if (isalpha(arg[0]) || arg[0] == '_') {	/* BTF variable */
> 25f00e40ce7953d Masami Hiramatsu (Google  2024-03-04  1255) 			if (!tparg_is_function_entry(ctx->flags) &&
> 25f00e40ce7953d Masami Hiramatsu (Google  2024-03-04  1256) 			    !tparg_is_function_return(ctx->flags)) {
> b576e09701c7d04 Masami Hiramatsu (Google  2023-06-06  1257) 				trace_probe_log_err(ctx->offset, NOSUP_BTFARG);
> b576e09701c7d04 Masami Hiramatsu (Google  2023-06-06  1258) 				return -EINVAL;
> b576e09701c7d04 Masami Hiramatsu (Google  2023-06-06  1259) 			}
> c440adfbe30257d Masami Hiramatsu (Google  2023-08-23  1260) 			ret = parse_btf_arg(arg, pcode, end, ctx);
> b576e09701c7d04 Masami Hiramatsu (Google  2023-06-06  1261) 			break;
> b576e09701c7d04 Masami Hiramatsu (Google  2023-06-06  1262) 		}
> 8ab83f56475ec91 Srikar Dronamraju         2012-04-09  1263  	}
> 533059281ee594f Masami Hiramatsu          2018-04-25  1264  	if (!ret && code->op == FETCH_OP_NOP) {
> 533059281ee594f Masami Hiramatsu          2018-04-25  1265  		/* Parsed, but do not find fetch method */
> 1b8b0cd754cdbb5 Masami Hiramatsu (Google  2023-06-06  1266) 		trace_probe_log_err(ctx->offset, BAD_FETCH_ARG);
> 8ab83f56475ec91 Srikar Dronamraju         2012-04-09  1267  		ret = -EINVAL;
> 8ab83f56475ec91 Srikar Dronamraju         2012-04-09  1268  	}
> 8ab83f56475ec91 Srikar Dronamraju         2012-04-09  1269  	return ret;
> 8ab83f56475ec91 Srikar Dronamraju         2012-04-09  1270  }
> 8ab83f56475ec91 Srikar Dronamraju         2012-04-09  1271  
> 
> -- 
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki


-- 
Masami Hiramatsu (Google) <mhiramat@kernel.org>
