Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96F662F12CE
	for <oe-kbuild-all@lists.linux.dev>; Thu, 28 May 2026 14:36:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779978995; cv=none; b=lA/6Eegqpknt5ttPbIv3i4habTtdThpijh0eCR/DbGtjalrpNcLR3Oqp0JxmkzOdJQewRR4u69T+lDMBp0rsPyWBFYe1bnVgO3Cb8BliFFV1fL9KTWCCV2JK0M4QTg4JC1aSeH6u9/IhEI0vZ2JRP2NPgEroeG15pnX4xsWZuz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779978995; c=relaxed/simple;
	bh=lcv0iWNp0KO4v+zukxV255T6zbhQXKbASUUFAuINL6c=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Y1sB5pllPMWuDy0hChzhlVggR7MEeKeq0P1DvTKivNpalwamG61xF7eqSOwu4gPzln11YCBk41ZHPW03jlUGftTe3zrRN3TNT19hqmLyoHd/By39YCLfLOsalMcOTUhSbUj9poZBwZK8KG7fEkXvCScdcYy6mOOHSSZINM79OWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Gx0J6rLb; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Gx0J6rLb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779978993; x=1811514993;
  h=date:from:to:cc:subject:message-id;
  bh=lcv0iWNp0KO4v+zukxV255T6zbhQXKbASUUFAuINL6c=;
  b=Gx0J6rLbiadx+2R2UU/X7+vR6I6+Ga4GfIK7yXCYmCKkNlNLLEh9l1JR
   AK9NYnfMYCSCLaljbEDZHGwMUk+NWTn4sAlyhvgMKVUSUFT738MgrDeHH
   Om5utu4tbZxugSzpeAbjNz5HKwo0ZQa+PcHh4jPV2neMnwNZsvXNlTlMo
   gE4pq+wggadHNCVHnaZRsDUbOui0dbQzMwBtJqL9BnC5YA4N3Rrk/huJl
   PgMC+ZhBhQULXR9Vci0Eq6MKUdLyiWOW18PBCsxH5sVIXc8uvA9Q8lWZb
   f4OppB+uHf7PTwCtHKBhBg8+dpdxibQU4HPQKdIf2ud7PtD9Vxu3SFFd/
   g==;
X-CSE-ConnectionGUID: +AUpy7X3QjOIiqslvbqxTQ==
X-CSE-MsgGUID: 4vXpP5HbRpW0kyBmGpBbXw==
X-IronPort-AV: E=McAfee;i="6800,10657,11800"; a="80674367"
X-IronPort-AV: E=Sophos;i="6.24,173,1774335600"; 
   d="scan'208";a="80674367"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2026 07:36:33 -0700
X-CSE-ConnectionGUID: ZWKzIpKrRm+ii69RFlvydg==
X-CSE-MsgGUID: 6g4+CDuERxq1SakpxCrr6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,173,1774335600"; 
   d="scan'208";a="242420469"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 28 May 2026 07:36:31 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wSbqW-0000000063K-31M2;
	Thu, 28 May 2026 14:36:28 +0000
Date: Thu, 28 May 2026 22:36:20 +0800
From: kernel test robot <lkp@intel.com>
To: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [kkdwivedi:verifier/errors/v1 1/8]
 kernel/bpf/diagnostics.c:421:1: warning: the frame size of 1720 bytes is
 larger than 1280 bytes
Message-ID: <202605282259.G6ZfoviW-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/kkdwivedi/linux verifier/errors/v1
head:   f45bdd9075553322231b6e3e0672cea109e9444c
commit: 372d32df41903795a59768fa6acfb4ca11b4ed14 [1/8] bpf: Add verifier diagnostics renderer
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20260528/202605282259.G6ZfoviW-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260528/202605282259.G6ZfoviW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605282259.G6ZfoviW-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/bpf/diagnostics.c: In function 'bpf_diag_vprint_indented':
   kernel/bpf/diagnostics.c:48:9: warning: function 'bpf_diag_vprint_indented' might be a candidate for 'gnu_printf' format attribute [-Wsuggest-attribute=format]
      48 |         bpf_verifier_vlog(&env->log, fmt, args);
         |         ^~~~~~~~~~~~~~~~~
   kernel/bpf/diagnostics.c: In function 'bpf_diag_insn_print':
   kernel/bpf/diagnostics.c:179:32: warning: function 'bpf_diag_insn_print' might be a candidate for 'gnu_printf' format attribute [-Wsuggest-attribute=format]
     179 |                                fmt, args);
         |                                ^~~
   kernel/bpf/diagnostics.c: In function 'bpf_diag_report_source':
>> kernel/bpf/diagnostics.c:421:1: warning: the frame size of 1720 bytes is larger than 1280 bytes [-Wframe-larger-than=]
     421 | }
         | ^


vim +421 kernel/bpf/diagnostics.c

   360	
   361	void bpf_diag_report_source(struct bpf_verifier_env *env, u32 insn_idx,
   362				    char marker, const char *fmt, ...)
   363	{
   364		struct bpf_diag_source src;
   365		struct bpf_diag_insn diag_insn[1 + BPF_DIAG_INSN_CONTEXT * 2];
   366		char msg[160];
   367		const char *func, *label;
   368		int start_line, end_line, line_num, indent, width;
   369		int insn_width, i;
   370		va_list args;
   371	
   372		va_start(args, fmt);
   373		vscnprintf(msg, sizeof(msg), fmt, args);
   374		va_end(args);
   375		label = bpf_diag_marker_label(marker);
   376	
   377		if (!bpf_diag_get_source(env, insn_idx, &src)) {
   378			verbose(env, "  insn %u\n", insn_idx);
   379			verbose(env, "      | ^-- %s: %s\n", label, msg);
   380			return;
   381		}
   382	
   383		func = bpf_diag_func_name(env, insn_idx);
   384		if (func && *func)
   385			verbose(env, "  %s @ %s:%d:%d\n", func, src.file,
   386				src.line_num, src.line_col);
   387		else
   388			verbose(env, "  %s:%d:%d\n", src.file, src.line_num,
   389				src.line_col);
   390	
   391		start_line = max_t(int, 1, src.line_num - BPF_DIAG_SOURCE_CONTEXT);
   392		end_line = src.line_num + BPF_DIAG_SOURCE_CONTEXT;
   393		width = bpf_diag_line_width(end_line);
   394		indent = bpf_diag_line_indent(src.line);
   395		insn_width = bpf_diag_line_width(env->prog->len ? env->prog->len - 1 : 0);
   396	
   397		for (i = 0; i < ARRAY_SIZE(diag_insn); i++) {
   398			int row = i - BPF_DIAG_INSN_CONTEXT;
   399	
   400			bpf_diag_format_insn(env, insn_idx + row, &diag_insn[i]);
   401		}
   402	
   403		for (line_num = start_line; line_num <= end_line; line_num++) {
   404			const char *line;
   405			int row = line_num - src.line_num;
   406	
   407			line = line_num == src.line_num ?
   408			       src.line :
   409			       bpf_diag_find_source_line(env, src.file_name_off, line_num);
   410	
   411			bpf_diag_print_source_insn_line(env,
   412							line_num == src.line_num ?
   413							">>> " : "    ",
   414							width, line_num, line,
   415							&diag_insn[row + BPF_DIAG_INSN_CONTEXT],
   416							insn_idx, insn_width);
   417			if (line_num == src.line_num)
   418				verbose(env, "  %*s | %*s^-- %s: %s\n",
   419					width + 4, "", indent, "", label, msg);
   420		}
 > 421	}

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
