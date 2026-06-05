Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F61A3A9D84
	for <oe-kbuild-all@lists.linux.dev>; Fri,  5 Jun 2026 15:26:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780673181; cv=none; b=HB9zu6GwFuS0E7UdS73BHvRZH0+jMagwLD57F2YcKKyeF2GD2iUYYicGOhNArr0gifRxysA8O62aZzGUUUi2r0YgkyfqVWcKnG4iAVc3eFF9nz6QHu9iVoyW+m1Z3dJqx3CVvS8jVELuS3wgpEvdf/nziEP0DOVEBeTVfZt6jHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780673181; c=relaxed/simple;
	bh=gvow33/ukA8IKQiLNF5sIimgwm8CzlLGSPPMZpmkOHA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=T77X9g2WEmNl3wEVosyowZ7awfszBMIIIv89BWV8yufbPtCOOKes0HwkuekkuWtMEd38BHDYkBigsdM1LwUxMkc47jmtCJUdHQFtSXIgkC9K5OUz7hZnnuEEPsSk8rJMyHXmd7Oi4+JeRtmctEeOtKrui6xGdzEGVbfbiHE70cA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DeuI+0Vq; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DeuI+0Vq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780673180; x=1812209180;
  h=date:from:to:cc:subject:message-id;
  bh=gvow33/ukA8IKQiLNF5sIimgwm8CzlLGSPPMZpmkOHA=;
  b=DeuI+0VqTm3Z+QBiWCP4hDhF4DVPKfOaWpHEy1TXYTo2h+LPObeID1gO
   knsg/g8FOXkoD2fQD5Gyt4VWpO/o158crg1hIzhaLiqHczFBii0CFuCAR
   qbfIYTmFZdBaqBWlCpIl0LVLblIVSQSIWrmMn0yNkNDFqRsu13Vw3spZx
   gzCmrEA/P7iailVwdy6NNpYbClu2sYdPIpmwSWBaCcDblwb8LtVvvFTBA
   oMouxuPQDY947sGtoRgQNzUQPHyP71jk9FQBgkZFNAEA0lQtcUVMqqrqq
   8m0nVMUd0WftBxuOwjDQuXsi5yvg8IhocKpQMEY5hi0/8bcr6EncNYcVu
   g==;
X-CSE-ConnectionGUID: VCTk8Se+Txaai9IyID2aIg==
X-CSE-MsgGUID: qeFt0tKJSrmWGMMr1rXe3A==
X-IronPort-AV: E=McAfee;i="6800,10657,11807"; a="81541791"
X-IronPort-AV: E=Sophos;i="6.24,189,1774335600"; 
   d="scan'208";a="81541791"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2026 08:26:19 -0700
X-CSE-ConnectionGUID: nlAfDY1LR+ismDy2SOZX4Q==
X-CSE-MsgGUID: lzoUUb4mR6ucTkjqR9c0nQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,189,1774335600"; 
   d="scan'208";a="244931336"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by orviesa009.jf.intel.com with ESMTP; 05 Jun 2026 08:26:18 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wVWR4-000000002bB-45uu;
	Fri, 05 Jun 2026 15:26:14 +0000
Date: Fri, 05 Jun 2026 17:25:57 +0200
From: kernel test robot <lkp@intel.com>
To: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [kkdwivedi:verifier/errors/v1 3/17]
 kernel/bpf/diagnostics.c:460:6: warning: stack frame size (2360) exceeds
 limit (2048) in 'bpf_diag_report_source'
Message-ID: <202606051715.x6KZZZLM-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/kkdwivedi/linux verifier/errors/v1
head:   bd319f349f948035a4c5b93b96b109695d7eb130
commit: 8bd874a4c3f5883e1cb73c95ea735d2cfdf8f792 [3/17] bpf: Add source and instruction diagnostic context
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20260605/202606051715.x6KZZZLM-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project f43d6834093b19baf79beda8c0337ab020ac5f17)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260605/202606051715.x6KZZZLM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606051715.x6KZZZLM-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/bpf/diagnostics.c:96:40: warning: diagnostic behavior may be improved by adding the 'format(printf, 2, 0)' attribute to the declaration of 'bpf_diag_vprint_indented' [-Wmissing-format-attribute]
      88 | static void bpf_diag_vprint_indented(struct bpf_verifier_env *env,
         | __attribute__((format(printf, 2, 0))) 
      89 |                                      const char *fmt, va_list args)
      90 | {
      91 |         char buf[1024];
      92 | 
      93 |         if (!bpf_verifier_log_needed(&env->log))
      94 |                 return;
      95 | 
      96 |         vscnprintf(buf, sizeof(buf), fmt, args);
         |                                               ^
   kernel/bpf/diagnostics.c:88:13: note: 'bpf_diag_vprint_indented' declared here
      88 | static void bpf_diag_vprint_indented(struct bpf_verifier_env *env,
         |             ^
   kernel/bpf/diagnostics.c:227:20: warning: diagnostic behavior may be improved by adding the 'format(printf, 2, 3)' attribute to the declaration of 'bpf_diag_insn_print' [-Wmissing-format-attribute]
     217 | static void bpf_diag_insn_print(void *private_data, const char *fmt, ...)
         | __attribute__((format(printf, 2, 3))) 
     218 | {
     219 |         struct bpf_diag_insn_buf *buf = private_data;
     220 |         va_list args;
     221 | 
     222 |         if (buf->len >= buf->size)
     223 |                 return;
     224 | 
     225 |         va_start(args, fmt);
     226 |         buf->len += vscnprintf(buf->buf + buf->len, buf->size - buf->len,
     227 |                                fmt, args);
         |                                         ^
   kernel/bpf/diagnostics.c:217:13: note: 'bpf_diag_insn_print' declared here
     217 | static void bpf_diag_insn_print(void *private_data, const char *fmt, ...)
         |             ^
>> kernel/bpf/diagnostics.c:460:6: warning: stack frame size (2360) exceeds limit (2048) in 'bpf_diag_report_source' [-Wframe-larger-than]
     460 | void bpf_diag_report_source(struct bpf_verifier_env *env, u32 insn_idx,
         |      ^
   3 warnings generated.


vim +/bpf_diag_report_source +460 kernel/bpf/diagnostics.c

   459	
 > 460	void bpf_diag_report_source(struct bpf_verifier_env *env, u32 insn_idx,

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
