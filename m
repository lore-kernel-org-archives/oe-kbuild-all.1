Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23D5D38B14F
	for <oe-kbuild-all@lists.linux.dev>; Tue,  9 Jun 2026 13:14:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781010892; cv=none; b=ddV+O4nqQ3zAxpIgc8ra/sHLYQGotf8cz108NBa5+cQYlSO0B+nAN4UkX+gcbyZlr4fkv7DuiMYioBpo04/kbWsrlBoG5OzCo55vikmbBHoETpdGzF4t3549j97yk8xTtb3hOM6F32LPDHk896R2Z1MM7dqmahbtbgwZJOGGfHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781010892; c=relaxed/simple;
	bh=bQ9zHT+ZaysNdqe63rH8Ighqpa2ZGYSw4KQCIKhdk4c=;
	h=Date:From:To:Cc:Subject:Message-ID; b=EtyQdvB9+2lxGIGYkWELOB0vHrFretVmsDFVGVKUeh3WXfkO98huP00e+tzmWU3ffF/HrZzMClNAJc1LDSZiWmgrxJH/GTItlbs4SFURpI6Aqrh8SZQT5EYMQ3YUgFBrQCsIWIOGN3BjQADmfEsLmUbfcKqOmbhy5peQXJb2+08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VGeAP329; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VGeAP329"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781010891; x=1812546891;
  h=date:from:to:cc:subject:message-id;
  bh=bQ9zHT+ZaysNdqe63rH8Ighqpa2ZGYSw4KQCIKhdk4c=;
  b=VGeAP329h2+nAPJkQwT1dYKrSWJUe/sy+RBQs2U3RhDL97wgi2GaYUa3
   2qrZHR3QmnobWVxdI16DP9LohpRqEzjtKgZpkp4CBw0ZmR+b20Q1h58po
   v0K3ilVF7YfoO3SkNX1c2qWBRnEFRLSk6I4FNSk+FKde82ds7ezi1yBjf
   0Bgq/k1PJ2fQ37t/UghZwXem++zurFjR5eTINlvtCKYgVQu/bunSUiPuq
   gwE6JESK2S4LZzAr+XrHIXbE9yjk2STNsBYpVrtxEZT5pxDzlcRcpWqrT
   XdoCFfz6mSFC1OYPqHoHgUN+dIwuLSwgrAIOqq1MYMQ+x26R6k13W475n
   A==;
X-CSE-ConnectionGUID: WIVIymFCQrmBYh9WmP0EGw==
X-CSE-MsgGUID: t68PAVmrQxCR5pxpWcMp5Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11811"; a="107206080"
X-IronPort-AV: E=Sophos;i="6.24,196,1774335600"; 
   d="scan'208";a="107206080"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2026 06:14:51 -0700
X-CSE-ConnectionGUID: 935an6K7TdCVY3n9y4c6/Q==
X-CSE-MsgGUID: Anf0xV0dQVWQPA1FXZI/oA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,196,1774335600"; 
   d="scan'208";a="241702664"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 09 Jun 2026 06:14:49 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wWwI2-00000000K2U-3KZD;
	Tue, 09 Jun 2026 13:14:46 +0000
Date: Tue, 09 Jun 2026 21:14:19 +0800
From: kernel test robot <lkp@intel.com>
To: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [kkdwivedi:verifier/errors/v1 5/17]
 kernel/bpf/diagnostics.c:937:13: warning: stack frame size (1576) exceeds
 limit (1280) in 'bpf_diag_format_reg_snapshot'
Message-ID: <202606092121.sEoj3JP6-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/kkdwivedi/linux verifier/errors/v1
head:   bd319f349f948035a4c5b93b96b109695d7eb130
commit: 8393536416e3def4210db8d71dfe6e94f7a7a251 [5/17] bpf: Track verifier register diagnostic history
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20260609/202606092121.sEoj3JP6-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 7917772d7d61384696c61102c08c2ea158e610fa)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260609/202606092121.sEoj3JP6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606092121.sEoj3JP6-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/bpf/diagnostics.c:126:40: warning: diagnostic behavior may be improved by adding the 'format(printf, 2, 0)' attribute to the declaration of 'bpf_diag_vprint_indented' [-Wmissing-format-attribute]
     118 | static void bpf_diag_vprint_indented(struct bpf_verifier_env *env,
         | __attribute__((format(printf, 2, 0))) 
     119 |                                      const char *fmt, va_list args)
     120 | {
     121 |         char buf[1024];
     122 | 
     123 |         if (!bpf_verifier_log_needed(&env->log))
     124 |                 return;
     125 | 
     126 |         vscnprintf(buf, sizeof(buf), fmt, args);
         |                                               ^
   kernel/bpf/diagnostics.c:118:13: note: 'bpf_diag_vprint_indented' declared here
     118 | static void bpf_diag_vprint_indented(struct bpf_verifier_env *env,
         |             ^
   kernel/bpf/diagnostics.c:267:20: warning: diagnostic behavior may be improved by adding the 'format(printf, 2, 3)' attribute to the declaration of 'bpf_diag_insn_print' [-Wmissing-format-attribute]
     257 | static void bpf_diag_insn_print(void *private_data, const char *fmt, ...)
         | __attribute__((format(printf, 2, 3))) 
     258 | {
     259 |         struct bpf_diag_insn_buf *buf = private_data;
     260 |         va_list args;
     261 | 
     262 |         if (buf->len >= buf->size)
     263 |                 return;
     264 | 
     265 |         va_start(args, fmt);
     266 |         buf->len += vscnprintf(buf->buf + buf->len, buf->size - buf->len,
     267 |                                fmt, args);
         |                                         ^
   kernel/bpf/diagnostics.c:257:13: note: 'bpf_diag_insn_print' declared here
     257 | static void bpf_diag_insn_print(void *private_data, const char *fmt, ...)
         |             ^
   kernel/bpf/diagnostics.c:570:6: warning: stack frame size (1568) exceeds limit (1280) in 'bpf_diag_report_source' [-Wframe-larger-than]
     570 | void bpf_diag_report_source(struct bpf_verifier_env *env, u32 insn_idx,
         |      ^
>> kernel/bpf/diagnostics.c:937:13: warning: stack frame size (1576) exceeds limit (1280) in 'bpf_diag_format_reg_snapshot' [-Wframe-larger-than]
     937 | static void bpf_diag_format_reg_snapshot(struct bpf_verifier_env *env, char *buf,
         |             ^
   4 warnings generated.


vim +/bpf_diag_format_reg_snapshot +937 kernel/bpf/diagnostics.c

   936	
 > 937	static void bpf_diag_format_reg_snapshot(struct bpf_verifier_env *env, char *buf,
   938						 size_t size,
   939						 const struct bpf_diag_reg_snapshot *snapshot)
   940	{
   941		const char *type_name = reg_type_str(env, snapshot->type);
   942		char offset_desc[BPF_DIAG_REG_DESC_LEN];
   943		char btf_type[BPF_DIAG_REG_DESC_LEN];
   944		const char *map_name;
   945		bool has_btf_type;
   946	
   947		bpf_diag_format_var_offset(offset_desc, sizeof(offset_desc), snapshot);
   948		has_btf_type = bpf_diag_format_snapshot_btf_type(btf_type,
   949								 sizeof(btf_type),
   950								 snapshot);
   951	
   952		if (snapshot->type == SCALAR_VALUE) {
   953			char range[BPF_DIAG_REG_DESC_LEN];
   954	
   955			if (snapshot->var_off_known) {
   956				scnprintf(buf, size, "integer scalar value %lld",
   957					  snapshot->var_off_value);
   958				return;
   959			}
   960	
   961			if (bpf_diag_snapshot_unknown(snapshot)) {
   962				scnprintf(buf, size, "integer scalar with unknown value");
   963				return;
   964			}
   965	
   966			if (snapshot->smin_value == snapshot->smax_value &&
   967			    snapshot->umin_value == snapshot->umax_value) {
   968				scnprintf(buf, size, "integer scalar value %lld",
   969					  snapshot->smin_value);
   970				return;
   971			}
   972	
   973			bpf_diag_format_scalar_range(range, sizeof(range),
   974						     snapshot->smin_value,
   975						     snapshot->smax_value,
   976						     snapshot->umin_value,
   977						     snapshot->umax_value);
   978			scnprintf(buf, size,
   979				  "integer scalar with %s", range);
   980			return;
   981		}
   982	
   983		if (snapshot->type == NOT_INIT) {
   984			scnprintf(buf, size, "uninitialized value");
   985			return;
   986		}
   987	
   988		if (base_type(snapshot->type) == PTR_TO_CTX) {
   989			scnprintf(buf, size, "context pointer %s", offset_desc);
   990			return;
   991		}
   992	
   993		if (base_type(snapshot->type) == PTR_TO_STACK) {
   994			scnprintf(buf, size, "stack pointer %s", offset_desc);
   995			return;
   996		}
   997	
   998		if (base_type(snapshot->type) == PTR_TO_MAP_VALUE) {
   999			map_name = bpf_diag_reg_map_name(snapshot->map_ptr);
  1000			if (map_name) {
  1001				scnprintf(buf, size, "%s from %s %s",
  1002					  type_may_be_null(snapshot->type) ?
  1003					  "nullable map value" : "map value",
  1004					  map_name, offset_desc);
  1005				return;
  1006			}
  1007			scnprintf(buf, size, "%s %s",
  1008				  type_may_be_null(snapshot->type) ?
  1009				  "nullable map value" : "map value",
  1010				  offset_desc);
  1011			return;
  1012		}
  1013	
  1014		if (base_type(snapshot->type) == CONST_PTR_TO_MAP) {
  1015			map_name = bpf_diag_reg_map_name(snapshot->map_ptr);
  1016			if (map_name)
  1017				scnprintf(buf, size, "map pointer for map %s", map_name);
  1018			else
  1019				scnprintf(buf, size, "map pointer");
  1020			return;
  1021		}
  1022	
  1023		if (type_is_non_owning_ref(snapshot->type)) {
  1024			if (has_btf_type)
  1025				scnprintf(buf, size,
  1026					  "borrowed allocated object pointer type=%s",
  1027					  btf_type);
  1028			else
  1029				scnprintf(buf, size, "borrowed allocated object pointer");
  1030			return;
  1031		}
  1032	
  1033		if (type_is_ptr_alloc_obj(snapshot->type)) {
  1034			if (has_btf_type)
  1035				scnprintf(buf, size,
  1036					  "owned allocated object pointer type=%s",
  1037					  btf_type);
  1038			else
  1039				scnprintf(buf, size, "owned allocated object pointer");
  1040			return;
  1041		}
  1042	
  1043		if (base_type(snapshot->type) == PTR_TO_BTF_ID && has_btf_type) {
  1044			scnprintf(buf, size, "%s type=%s %s", type_name, btf_type,
  1045				  offset_desc);
  1046			return;
  1047		}
  1048	
  1049		scnprintf(buf, size, "%s %s", type_name, offset_desc);
  1050	}
  1051	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
