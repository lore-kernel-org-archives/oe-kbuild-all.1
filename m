Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F14C2BEC3F
	for <oe-kbuild-all@lists.linux.dev>; Tue,  9 Jun 2026 10:55:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781002532; cv=none; b=TIcnkpf7BO+khnSQb9KcoeKQXkiSTxFwZR2+rEN807MYL8h2Sv9UxTBiPPUgnral3RhHHD7J4EPc4a2pJ6m6VXpvXCR+dXdulmG1TTnj8tLRJnId/eIo4YDVqB5hXa7eifzdf23ODxJRJsIT2ruzMgsZksQXTuainoB0h0/YLqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781002532; c=relaxed/simple;
	bh=wxQIrzwAdBvmPbNInXInTN0Qt36nNLg+UZC+iCzyNso=;
	h=Date:From:To:Cc:Subject:Message-ID; b=PPazC2XQsv/GyFwpeXnyuK8rU2oilXUCWMvG1H9wg0YcQhffHc7kcdpVMmBbHHIP669+rA18Anf5At4yAhFVCGFhNoV0aZxP+xwok/TNBGXChufK/R0MHtcPq/i26BuyJLoEPs+5dNEuKlw/yzfIwPKEGztNViSfV1/vd9lsHbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AMKU7b+8; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AMKU7b+8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781002531; x=1812538531;
  h=date:from:to:cc:subject:message-id;
  bh=wxQIrzwAdBvmPbNInXInTN0Qt36nNLg+UZC+iCzyNso=;
  b=AMKU7b+8lETUiWgRcJMsvc/Pa5EwPUFGRr1cOXvWQBLfVWmq1CmYVgFv
   qrFCALdv7zkG7e79cc7X97qEkdI8tVBmBEQPaa0Pnnk2YtwyuG5e/HzDr
   ew28bzSCzrSuYi3K6ReaCOYvYgmjaK4BEJZ4cnczWWVaI2FwqapiRIEA6
   s2m9PsDDlC7JyiBkSPnUjBEMK8l5/+EMyoNw3VXqUeeuQIl9cwGZY7JWd
   F51/m+RtWBzUjYmXawlxHVSNakPxH8zl1/wclQjmyE65bxNVe5G113qFF
   Q4hmjmWDzhsUY7vfBX4SebJrpI9+f789vjbqOIS2tek0t/ZTqKjfJ49KR
   g==;
X-CSE-ConnectionGUID: av6tdybtQJCQjRprsrd4qQ==
X-CSE-MsgGUID: xSQqBjUYQRueoYNi1IUF9A==
X-IronPort-AV: E=McAfee;i="6800,10657,11811"; a="85609588"
X-IronPort-AV: E=Sophos;i="6.24,196,1774335600"; 
   d="scan'208";a="85609588"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2026 03:55:30 -0700
X-CSE-ConnectionGUID: zO+OitMmQx+znd7Ca+TfEA==
X-CSE-MsgGUID: zRjuHYw6QXCh4E4mG9dYQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,196,1774335600"; 
   d="scan'208";a="241666713"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 09 Jun 2026 03:55:29 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wWu7C-00000000JvW-2Gs2;
	Tue, 09 Jun 2026 10:55:26 +0000
Date: Tue, 09 Jun 2026 18:55:14 +0800
From: kernel test robot <lkp@intel.com>
To: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [kkdwivedi:verifier/errors/v1 3/17]
 kernel/bpf/diagnostics.c:460:6: warning: stack frame size (1568) exceeds
 limit (1280) in 'bpf_diag_report_source'
Message-ID: <202606091810.k52hEnGe-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/kkdwivedi/linux verifier/errors/v1
head:   bd319f349f948035a4c5b93b96b109695d7eb130
commit: 8bd874a4c3f5883e1cb73c95ea735d2cfdf8f792 [3/17] bpf: Add source and instruction diagnostic context
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20260609/202606091810.k52hEnGe-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 7917772d7d61384696c61102c08c2ea158e610fa)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260609/202606091810.k52hEnGe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606091810.k52hEnGe-lkp@intel.com/

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
>> kernel/bpf/diagnostics.c:460:6: warning: stack frame size (1568) exceeds limit (1280) in 'bpf_diag_report_source' [-Wframe-larger-than]
     460 | void bpf_diag_report_source(struct bpf_verifier_env *env, u32 insn_idx,
         |      ^
   3 warnings generated.


vim +/bpf_diag_report_source +460 kernel/bpf/diagnostics.c

   459	
 > 460	void bpf_diag_report_source(struct bpf_verifier_env *env, u32 insn_idx,

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
