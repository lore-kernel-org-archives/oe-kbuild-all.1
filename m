Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C32B472F72
	for <oe-kbuild-all@lists.linux.dev>; Fri, 14 Aug 2026 16:26:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786724769; cv=none; b=pwY1eySZUO1oWJQS1uRnU67nlQQS4+geG63iUGvmvNZDM+uPb6jbjOd9zrwBg4V8et8POXwRgu1ZL3rJReaQ2/TU4upVm+P8FYrc2E7BGTzqb5T430sfFAwqcPdy8bxWBm5h6ObgwTp7HZ+vrIMvi9PnE91AQUg/VRvt3uLhMxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786724769; c=relaxed/simple;
	bh=WlqvKcAYQI7oVwczUqzyXJvDKXSPCzY4wt+dOMgKPRI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=iprtFji4GqFYV6oYkhJI1DjCMSMgIpc+Ds8vwGj7qAqjtpaPWI6FzfyL/a6Byu4Wy1QjbDiUdjT3ZLrweFAAWsy0o+JRro+lGoWRpoB1easUHo0GOGt6o4KWoeyJ7BwwOLDN+5xZR7qsBC8RXVm0I2r1buQWovxASsMU1vDLFBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MJ8FJTVH; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MJ8FJTVH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786724767; x=1818260767;
  h=date:from:to:cc:subject:message-id;
  bh=WlqvKcAYQI7oVwczUqzyXJvDKXSPCzY4wt+dOMgKPRI=;
  b=MJ8FJTVHo3k5xHc6VzTOUZ9bFRD9PMdlrFWUsgJ3hV7hK/LLizEzBc69
   kq3IZMiCm8PUZr8eJDv6eBP75udIJKap38XLDQMi1g6/Mg3siq54ofROH
   9KgC9Y+badp2pHng1k3aBCS7KamislV6oR8lH6sP2kC/nLdqVJf3moXkA
   wSdo52F02MLiDwwb+WoHh5k7FpmRS23Oq9oAhNKG2wJjXS5luu+eS5FZp
   UACHJ2QBeV3Y3SKJiCjotD2fKNxsNayn4UR49vgxCYrlTeRCa58ToJTrK
   JgWljC8P9Gxe42sZlB22PoZkl3XUZTSRj0D7Y6UhioSKs359JifQ8wXqj
   g==;
X-CSE-ConnectionGUID: bnylRXJ1SvmXuOEtqu2nug==
X-CSE-MsgGUID: zhCN/ASsTdOZydHtnPs+Lg==
X-IronPort-AV: E=McAfee;i="6800,10657,11875"; a="98819572"
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; 
   d="scan'208";a="98819572"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2026 09:26:03 -0700
X-CSE-ConnectionGUID: LigxT+aWQXCXiZVc4DWftQ==
X-CSE-MsgGUID: LVVE5r7XQnON2zw6Vd5C0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; 
   d="scan'208";a="261622739"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 14 Aug 2026 09:26:01 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wuujG-00000000ZWg-3TZH;
	Fri, 14 Aug 2026 16:25:58 +0000
Date: Sat, 15 Aug 2026 00:24:59 +0800
From: kernel test robot <lkp@intel.com>
To: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [kkdwivedi:verifier/errors/v5 11/21]
 kernel/bpf/diagnostics.c:809:36: warning: diagnostic behavior may be improved
 by adding the 'format(printf, 4, 5)' attribute to the declaration of
 'bpf_diag_source'
Message-ID: <202608150026.iFj2jwxW-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/kkdwivedi/linux verifier/errors/v5
head:   78d1e78c2d172fa18fd95fd189144b9a08332762
commit: ff77e445a19d72054f5fae24ab986d4753e0c117 [11/21] fixup! bpf: Report Register Type Safety errors
config: loongarch-defconfig (https://download.01.org/0day-ci/archive/20260815/202608150026.iFj2jwxW-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 844a18e753e822736c9805ab779144b647a2c186)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260815/202608150026.iFj2jwxW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608150026.iFj2jwxW-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/bpf/diagnostics.c:809:36: warning: diagnostic behavior may be improved by adding the 'format(printf, 4, 5)' attribute to the declaration of 'bpf_diag_source' [-Wmissing-format-attribute]
     780 |         msg = bpf_diag_vfmt(env, fmt, args);
         |                                           ^
   kernel/bpf/diagnostics.c:780:13: note: 'bpf_diag_source' declared here
     780 | static void bpf_diag_source(struct bpf_verifier_env *env, u32 insn_idx, const char *label,
         |             ^
   1 warning generated.


vim +809 kernel/bpf/diagnostics.c

845093db76e594 Kumar Kartikeya Dwivedi 2026-08-14  779  
ff77e445a19d72 Kumar Kartikeya Dwivedi 2026-08-14  780  static void bpf_diag_source(struct bpf_verifier_env *env, u32 insn_idx, const char *label,
85635593d0d7f2 Kumar Kartikeya Dwivedi 2026-07-13  781  			    const char *fmt, ...)
85635593d0d7f2 Kumar Kartikeya Dwivedi 2026-07-13  782  {
85635593d0d7f2 Kumar Kartikeya Dwivedi 2026-07-13  783  	struct bpf_diag_scratch *scratch;
85635593d0d7f2 Kumar Kartikeya Dwivedi 2026-07-13  784  	struct bpf_linfo_source *source_lines;
85635593d0d7f2 Kumar Kartikeya Dwivedi 2026-07-13  785  	struct disasm_line *disasm_lines;
85635593d0d7f2 Kumar Kartikeya Dwivedi 2026-07-13  786  	struct bpf_linfo_source src;
85635593d0d7f2 Kumar Kartikeya Dwivedi 2026-07-13  787  	struct diag_fmt_mark mark;
85635593d0d7f2 Kumar Kartikeya Dwivedi 2026-07-13  788  	const struct bpf_line_info *linfo;
85635593d0d7f2 Kumar Kartikeya Dwivedi 2026-07-13  789  	const struct bpf_subprog_info *subprog;
85635593d0d7f2 Kumar Kartikeya Dwivedi 2026-07-13  790  	struct btf *btf = env->prog->aux->btf;
85635593d0d7f2 Kumar Kartikeya Dwivedi 2026-07-13  791  	char *source_lane;
85635593d0d7f2 Kumar Kartikeya Dwivedi 2026-07-13  792  	const char *msg;
85635593d0d7f2 Kumar Kartikeya Dwivedi 2026-07-13  793  	const char *func;
845093db76e594 Kumar Kartikeya Dwivedi 2026-08-14  794  	int start_line, end_line, width, indent, subprogno, i;
85635593d0d7f2 Kumar Kartikeya Dwivedi 2026-07-13  795  	va_list args;
85635593d0d7f2 Kumar Kartikeya Dwivedi 2026-07-13  796  
85635593d0d7f2 Kumar Kartikeya Dwivedi 2026-07-13  797  	if (!bpf_diag_enabled(env))
85635593d0d7f2 Kumar Kartikeya Dwivedi 2026-07-13  798  		return;
85635593d0d7f2 Kumar Kartikeya Dwivedi 2026-07-13  799  
85635593d0d7f2 Kumar Kartikeya Dwivedi 2026-07-13  800  	mark = diag_fmt_save(env);
85635593d0d7f2 Kumar Kartikeya Dwivedi 2026-07-13  801  	label = label ?: "note";
85635593d0d7f2 Kumar Kartikeya Dwivedi 2026-07-13  802  	scratch = diag_scratch(env);
85635593d0d7f2 Kumar Kartikeya Dwivedi 2026-07-13  803  	source_lines = scratch->source_lines;
85635593d0d7f2 Kumar Kartikeya Dwivedi 2026-07-13  804  	disasm_lines = scratch->disasm_lines;
85635593d0d7f2 Kumar Kartikeya Dwivedi 2026-07-13  805  	memset(source_lines, 0, sizeof(scratch->source_lines));
85635593d0d7f2 Kumar Kartikeya Dwivedi 2026-07-13  806  	memset(disasm_lines, 0, sizeof(scratch->disasm_lines));
85635593d0d7f2 Kumar Kartikeya Dwivedi 2026-07-13  807  
85635593d0d7f2 Kumar Kartikeya Dwivedi 2026-07-13  808  	va_start(args, fmt);
85635593d0d7f2 Kumar Kartikeya Dwivedi 2026-07-13 @809  	msg = bpf_diag_vfmt(env, fmt, args);
85635593d0d7f2 Kumar Kartikeya Dwivedi 2026-07-13  810  	va_end(args);
85635593d0d7f2 Kumar Kartikeya Dwivedi 2026-07-13  811  	if (!*msg)
85635593d0d7f2 Kumar Kartikeya Dwivedi 2026-07-13  812  		msg = "<failed to allocate diagnostic text>";
85635593d0d7f2 Kumar Kartikeya Dwivedi 2026-07-13  813  
85635593d0d7f2 Kumar Kartikeya Dwivedi 2026-07-13  814  	linfo = bpf_find_linfo(env->prog, insn_idx);
85635593d0d7f2 Kumar Kartikeya Dwivedi 2026-07-13  815  	if (!btf || !linfo) {
85635593d0d7f2 Kumar Kartikeya Dwivedi 2026-07-13  816  		diag_write(env, "  insn %u\n", insn_idx);
85635593d0d7f2 Kumar Kartikeya Dwivedi 2026-07-13  817  		diag_print_source_annotation(env, 0, 0, label, msg);
845093db76e594 Kumar Kartikeya Dwivedi 2026-08-14  818  		diag_print_insn_context(env, insn_idx, disasm_lines);
85635593d0d7f2 Kumar Kartikeya Dwivedi 2026-07-13  819  		goto out_restore;
85635593d0d7f2 Kumar Kartikeya Dwivedi 2026-07-13  820  	}
845093db76e594 Kumar Kartikeya Dwivedi 2026-08-14  821  	bpf_get_linfo_source(btf, linfo, &src);
85635593d0d7f2 Kumar Kartikeya Dwivedi 2026-07-13  822  	if (!src.file || !*src.file || !src.line || !*src.line) {
85635593d0d7f2 Kumar Kartikeya Dwivedi 2026-07-13  823  		diag_write(env, "  insn %u\n", insn_idx);
85635593d0d7f2 Kumar Kartikeya Dwivedi 2026-07-13  824  		diag_print_source_annotation(env, 0, 0, label, msg);
845093db76e594 Kumar Kartikeya Dwivedi 2026-08-14  825  		diag_print_insn_context(env, insn_idx, disasm_lines);
85635593d0d7f2 Kumar Kartikeya Dwivedi 2026-07-13  826  		goto out_restore;
85635593d0d7f2 Kumar Kartikeya Dwivedi 2026-07-13  827  	}
85635593d0d7f2 Kumar Kartikeya Dwivedi 2026-07-13  828  
85635593d0d7f2 Kumar Kartikeya Dwivedi 2026-07-13  829  	subprog = bpf_find_containing_subprog(env, insn_idx);
85635593d0d7f2 Kumar Kartikeya Dwivedi 2026-07-13  830  	subprogno = subprog ? bpf_find_subprog(env, subprog->start) : -ENOENT;
85635593d0d7f2 Kumar Kartikeya Dwivedi 2026-07-13  831  	func = subprogno >= 0 ? bpf_subprog_name(env, subprogno) : NULL;
85635593d0d7f2 Kumar Kartikeya Dwivedi 2026-07-13  832  	if (func && *func)
85635593d0d7f2 Kumar Kartikeya Dwivedi 2026-07-13  833  		diag_write(env, "  %s @ %s:%d:%d\n", func, src.file, src.line_num, src.line_col);
85635593d0d7f2 Kumar Kartikeya Dwivedi 2026-07-13  834  	else
85635593d0d7f2 Kumar Kartikeya Dwivedi 2026-07-13  835  		diag_write(env, "  %s:%d:%d\n", src.file, src.line_num, src.line_col);
85635593d0d7f2 Kumar Kartikeya Dwivedi 2026-07-13  836  
85635593d0d7f2 Kumar Kartikeya Dwivedi 2026-07-13  837  	start_line = src.line_num - BPF_DIAG_CONTEXT;
85635593d0d7f2 Kumar Kartikeya Dwivedi 2026-07-13  838  	end_line = src.line_num + BPF_DIAG_CONTEXT;
85635593d0d7f2 Kumar Kartikeya Dwivedi 2026-07-13  839  	width = diag_line_width(end_line);
85635593d0d7f2 Kumar Kartikeya Dwivedi 2026-07-13  840  	indent = diag_line_indent(src.line);
85635593d0d7f2 Kumar Kartikeya Dwivedi 2026-07-13  841  	for (i = 0; i < BPF_DIAG_CONTEXT_CNT; i++)
85635593d0d7f2 Kumar Kartikeya Dwivedi 2026-07-13  842  		source_lines[i].line_num = start_line + i;
85635593d0d7f2 Kumar Kartikeya Dwivedi 2026-07-13  843  
85635593d0d7f2 Kumar Kartikeya Dwivedi 2026-07-13  844  	linfo = env->prog->aux->linfo;
85635593d0d7f2 Kumar Kartikeya Dwivedi 2026-07-13  845  	for (i = 0; i < env->prog->aux->nr_linfo; i++) {
85635593d0d7f2 Kumar Kartikeya Dwivedi 2026-07-13  846  		struct bpf_linfo_source line_src;
85635593d0d7f2 Kumar Kartikeya Dwivedi 2026-07-13  847  		int idx;
85635593d0d7f2 Kumar Kartikeya Dwivedi 2026-07-13  848  
845093db76e594 Kumar Kartikeya Dwivedi 2026-08-14  849  		bpf_get_linfo_source(btf, &linfo[i], &line_src);
85635593d0d7f2 Kumar Kartikeya Dwivedi 2026-07-13  850  		if (line_src.file_name_off != src.file_name_off ||
85635593d0d7f2 Kumar Kartikeya Dwivedi 2026-07-13  851  		    line_src.line_num < start_line || line_src.line_num > end_line ||
85635593d0d7f2 Kumar Kartikeya Dwivedi 2026-07-13  852  		    !line_src.line || !*line_src.line)
85635593d0d7f2 Kumar Kartikeya Dwivedi 2026-07-13  853  			continue;
85635593d0d7f2 Kumar Kartikeya Dwivedi 2026-07-13  854  
85635593d0d7f2 Kumar Kartikeya Dwivedi 2026-07-13  855  		idx = line_src.line_num - start_line;
85635593d0d7f2 Kumar Kartikeya Dwivedi 2026-07-13  856  		if (!source_lines[idx].line)
85635593d0d7f2 Kumar Kartikeya Dwivedi 2026-07-13  857  			source_lines[idx] = line_src;
85635593d0d7f2 Kumar Kartikeya Dwivedi 2026-07-13  858  	}
85635593d0d7f2 Kumar Kartikeya Dwivedi 2026-07-13  859  
85635593d0d7f2 Kumar Kartikeya Dwivedi 2026-07-13  860  	diag_write(env, "  Source context:\n");
85635593d0d7f2 Kumar Kartikeya Dwivedi 2026-07-13  861  	source_lane = bpf_diag_fmt_buf(env, BPF_DIAG_FMT_BUF_SIZE);
85635593d0d7f2 Kumar Kartikeya Dwivedi 2026-07-13  862  	if (!source_lane)
85635593d0d7f2 Kumar Kartikeya Dwivedi 2026-07-13  863  		goto out_restore;
85635593d0d7f2 Kumar Kartikeya Dwivedi 2026-07-13  864  	for (i = 0; i < BPF_DIAG_CONTEXT_CNT; i++) {
85635593d0d7f2 Kumar Kartikeya Dwivedi 2026-07-13  865  		const char *source_prefix;
85635593d0d7f2 Kumar Kartikeya Dwivedi 2026-07-13  866  
85635593d0d7f2 Kumar Kartikeya Dwivedi 2026-07-13  867  		source_prefix = source_lines[i].line_num == src.line_num ? ">>> " : "    ";
85635593d0d7f2 Kumar Kartikeya Dwivedi 2026-07-13  868  		diag_format_source_lane(source_lane, BPF_DIAG_FMT_BUF_SIZE, source_prefix, width,
85635593d0d7f2 Kumar Kartikeya Dwivedi 2026-07-13  869  					source_lines[i].line_num, source_lines[i].line);
85635593d0d7f2 Kumar Kartikeya Dwivedi 2026-07-13  870  		diag_write(env, "  %s\n", source_lane);
85635593d0d7f2 Kumar Kartikeya Dwivedi 2026-07-13  871  		if (source_lines[i].line_num == src.line_num)
85635593d0d7f2 Kumar Kartikeya Dwivedi 2026-07-13  872  			diag_print_source_annotation(env, width, indent, label, msg);
85635593d0d7f2 Kumar Kartikeya Dwivedi 2026-07-13  873  	}
845093db76e594 Kumar Kartikeya Dwivedi 2026-08-14  874  	diag_print_insn_context(env, insn_idx, disasm_lines);
85635593d0d7f2 Kumar Kartikeya Dwivedi 2026-07-13  875  
85635593d0d7f2 Kumar Kartikeya Dwivedi 2026-07-13  876  out_restore:
85635593d0d7f2 Kumar Kartikeya Dwivedi 2026-07-13  877  	diag_fmt_restore(env, mark);
85635593d0d7f2 Kumar Kartikeya Dwivedi 2026-07-13  878  }
93068acddf1e58 Kumar Kartikeya Dwivedi 2026-07-13  879  

:::::: The code at line 809 was first introduced by commit
:::::: 85635593d0d7f2ed239a245743676d9443e0c0a6 bpf: Add source and instruction diagnostic context

:::::: TO: Kumar Kartikeya Dwivedi <memxor@gmail.com>
:::::: CC: Kumar Kartikeya Dwivedi <memxor@gmail.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
