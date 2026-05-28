Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8B7B41C62
	for <oe-kbuild-all@lists.linux.dev>; Thu, 28 May 2026 16:20:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779985243; cv=none; b=YWJp6cQjAo5H4NLcxKLNzMi9R7HeczJ/DJb3bUBl1kQKDD/d7FFIW0zUbU5pdjPZlM1X8VFN+Hib61L+QoUp3xQDeEdC7mjawnoA8Aq2oj+BvJ/HRPoSIxqOwNvSDe1Suy4wf4aRb0x1ZTV1Jc91nJRuSVO2xl3H1KLGpzKZsXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779985243; c=relaxed/simple;
	bh=mABu8me3h+HybNdbafUAW4KJQsXOhDPZrgKkQ71nHqA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=hmQmPlzeTmFxGkfxoFsbf7NhhuCKsz86VPoIRTsUR0bE8Pt8xJOrNgvhxTGCg6XHglBlwgQOGF0ulqSkXLOlzBYFBd7bLoatI2LK3rUcTIiKGEH+uBQmpXuKQKmWspIKHyLMJTu5mnFWfV8EbcY6yeGPR/hLQe7wewC9pk4FGIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CiuLiebF; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CiuLiebF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779985241; x=1811521241;
  h=date:from:to:cc:subject:message-id;
  bh=mABu8me3h+HybNdbafUAW4KJQsXOhDPZrgKkQ71nHqA=;
  b=CiuLiebFFfY2wmdKIkqRFF+vki+XrmdyanSkXt2WwyNpVsE7bxIVn81c
   GNCj6yoXPMJmHW39g56m2L1dO/bfNTLBo2UadmmCumrjAn38Hnc1/LO3H
   2o3PPGD7HVig3rJ6QNwmM1CrprX3gxpCV6LsludHgvLa/Owu1XIYX3yPe
   bhSPWJKlsRh0YBuZPUywDpF9iip68W4gnXl658gywEpxub42yE/a/eelH
   Xu51ODHQFwQFAQv/+d80Rq2fIpqlQPX7NuFKawUk5GaVY17O+9n4Mky+l
   yFBCsjnWvUatxIeb61qCDrk/MsSmj4r9UpENdgaDvBrlVlsLjRquiDxwq
   A==;
X-CSE-ConnectionGUID: GUlTYM8KQMSCqJYzI8bLpQ==
X-CSE-MsgGUID: aSub6D4IQMGKKLpPL8r2tA==
X-IronPort-AV: E=McAfee;i="6800,10657,11800"; a="68367465"
X-IronPort-AV: E=Sophos;i="6.24,173,1774335600"; 
   d="scan'208";a="68367465"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2026 09:20:41 -0700
X-CSE-ConnectionGUID: y+jFB+3/S5ixypvnIbXL/Q==
X-CSE-MsgGUID: 9/4McT2+S8KalNChNHxBOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,173,1774335600"; 
   d="scan'208";a="280704433"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 28 May 2026 09:20:40 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wSdTJ-00000000694-0gvA;
	Thu, 28 May 2026 16:20:37 +0000
Date: Fri, 29 May 2026 00:20:31 +0800
From: kernel test robot <lkp@intel.com>
To: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [kkdwivedi:verifier/errors/v1 1/8]
 kernel/bpf/diagnostics.c:48:40: warning: diagnostic behavior may be improved
 by adding the 'format(printf, 2, 0)' attribute to the declaration of
 'bpf_diag_vprint_indented'
Message-ID: <202605290049.T2qg0tAH-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/kkdwivedi/linux verifier/errors/v1
head:   f45bdd9075553322231b6e3e0672cea109e9444c
commit: 372d32df41903795a59768fa6acfb4ca11b4ed14 [1/8] bpf: Add verifier diagnostics renderer
config: mips-randconfig-r073-20260528 (https://download.01.org/0day-ci/archive/20260529/202605290049.T2qg0tAH-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 9409c07de6378507397ecdb6f05f628f58110112)
smatch: v0.5.0-9185-gbcc58b9c
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260529/202605290049.T2qg0tAH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605290049.T2qg0tAH-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/bpf/diagnostics.c:48:40: warning: diagnostic behavior may be improved by adding the 'format(printf, 2, 0)' attribute to the declaration of 'bpf_diag_vprint_indented' [-Wmissing-format-attribute]
      41 | static void bpf_diag_vprint_indented(struct bpf_verifier_env *env,
         | __attribute__((format(printf, 2, 0))) 
      42 |                                      const char *fmt, va_list args)
      43 | {
      44 |         if (!bpf_verifier_log_needed(&env->log))
      45 |                 return;
      46 | 
      47 |         verbose(env, "  ");
      48 |         bpf_verifier_vlog(&env->log, fmt, args);
         |                                               ^
   kernel/bpf/diagnostics.c:41:13: note: 'bpf_diag_vprint_indented' declared here
      41 | static void bpf_diag_vprint_indented(struct bpf_verifier_env *env,
         |             ^
>> kernel/bpf/diagnostics.c:179:20: warning: diagnostic behavior may be improved by adding the 'format(printf, 2, 3)' attribute to the declaration of 'bpf_diag_insn_print' [-Wmissing-format-attribute]
     169 | static void bpf_diag_insn_print(void *private_data, const char *fmt, ...)
         | __attribute__((format(printf, 2, 3))) 
     170 | {
     171 |         struct bpf_diag_insn_buf *buf = private_data;
     172 |         va_list args;
     173 | 
     174 |         if (buf->len >= buf->size)
     175 |                 return;
     176 | 
     177 |         va_start(args, fmt);
     178 |         buf->len += vscnprintf(buf->buf + buf->len, buf->size - buf->len,
     179 |                                fmt, args);
         |                                         ^
   kernel/bpf/diagnostics.c:169:13: note: 'bpf_diag_insn_print' declared here
     169 | static void bpf_diag_insn_print(void *private_data, const char *fmt, ...)
         |             ^
   2 warnings generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for MFD_STMFX
   Depends on [n]: HAS_IOMEM [=y] && I2C [=y] && OF [=n]
   Selected by [m]:
   - PINCTRL_STMFX [=m] && PINCTRL [=y] && I2C [=y] && HAS_IOMEM [=y]


vim +48 kernel/bpf/diagnostics.c

    40	
    41	static void bpf_diag_vprint_indented(struct bpf_verifier_env *env,
    42					     const char *fmt, va_list args)
    43	{
    44		if (!bpf_verifier_log_needed(&env->log))
    45			return;
    46	
    47		verbose(env, "  ");
  > 48		bpf_verifier_vlog(&env->log, fmt, args);
    49		verbose(env, "\n");
    50	}
    51	
    52	static int bpf_diag_line_width(unsigned int line)
    53	{
    54		int width = 1;
    55	
    56		while (line >= 10) {
    57			line /= 10;
    58			width++;
    59		}
    60	
    61		return width;
    62	}
    63	
    64	static const char *bpf_diag_func_name(struct bpf_verifier_env *env, u32 insn_idx)
    65	{
    66		const struct bpf_subprog_info *subprog;
    67		const struct bpf_func_info *info;
    68		const struct btf_type *type;
    69		int subprogno;
    70	
    71		if (!env->prog->aux->func_info || !env->prog->aux->btf)
    72			return NULL;
    73	
    74		subprog = bpf_find_containing_subprog(env, insn_idx);
    75		if (!subprog)
    76			return NULL;
    77	
    78		subprogno = subprog - env->subprog_info;
    79		info = &env->prog->aux->func_info[subprogno];
    80		type = btf_type_by_id(env->prog->aux->btf, info->type_id);
    81		if (!type)
    82			return NULL;
    83	
    84		return btf_name_by_offset(env->prog->aux->btf, type->name_off);
    85	}
    86	
    87	static bool bpf_diag_fill_source(struct bpf_verifier_env *env,
    88					 const struct bpf_line_info *linfo,
    89					 struct bpf_diag_source *src)
    90	{
    91		const char *file, *line;
    92	
    93		file = btf_name_by_offset(env->prog->aux->btf, linfo->file_name_off);
    94		line = btf_name_by_offset(env->prog->aux->btf, linfo->line_off);
    95		if (!file || !*file || !line || !*line)
    96			return false;
    97	
    98		src->file = kbasename(file);
    99		src->line = line;
   100		src->file_name_off = linfo->file_name_off;
   101		src->line_num = BPF_LINE_INFO_LINE_NUM(linfo->line_col);
   102		src->line_col = BPF_LINE_INFO_LINE_COL(linfo->line_col);
   103		return true;
   104	}
   105	
   106	static bool bpf_diag_get_source(struct bpf_verifier_env *env, u32 insn_idx,
   107					struct bpf_diag_source *src)
   108	{
   109		const struct bpf_line_info *linfo;
   110	
   111		linfo = bpf_find_linfo(env->prog, insn_idx);
   112		if (!linfo)
   113			return false;
   114	
   115		return bpf_diag_fill_source(env, linfo, src);
   116	}
   117	
   118	static const char *bpf_diag_find_source_line(struct bpf_verifier_env *env,
   119						     u32 file_name_off, int line_num)
   120	{
   121		const struct bpf_line_info *linfo = env->prog->aux->linfo;
   122		struct bpf_diag_source src;
   123		u32 i;
   124	
   125		for (i = 0; i < env->prog->aux->nr_linfo; i++) {
   126			if (linfo[i].file_name_off != file_name_off ||
   127			    BPF_LINE_INFO_LINE_NUM(linfo[i].line_col) != line_num)
   128				continue;
   129			if (bpf_diag_fill_source(env, &linfo[i], &src))
   130				return src.line;
   131		}
   132	
   133		return NULL;
   134	}
   135	
   136	static int bpf_diag_line_indent(const char *line)
   137	{
   138		int indent = 0;
   139	
   140		while (*line == ' ' || *line == '\t') {
   141			if (*line == '\t')
   142				indent = round_up(indent + 1, BPF_DIAG_TAB_WIDTH);
   143			else
   144				indent++;
   145			line++;
   146		}
   147	
   148		return indent;
   149	}
   150	
   151	static const char *bpf_diag_marker_label(char marker)
   152	{
   153		switch (marker) {
   154		case '!':
   155			return "error";
   156		case '?':
   157			return "branch";
   158		case '~':
   159			return "update";
   160		case '+':
   161			return "acquired";
   162		case '-':
   163			return "released";
   164		default:
   165			return "note";
   166		}
   167	}
   168	
   169	static void bpf_diag_insn_print(void *private_data, const char *fmt, ...)
   170	{
   171		struct bpf_diag_insn_buf *buf = private_data;
   172		va_list args;
   173	
   174		if (buf->len >= buf->size)
   175			return;
   176	
   177		va_start(args, fmt);
   178		buf->len += vscnprintf(buf->buf + buf->len, buf->size - buf->len,
 > 179				       fmt, args);
   180		va_end(args);
   181	}
   182	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
