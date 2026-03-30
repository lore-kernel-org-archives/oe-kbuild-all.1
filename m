Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADDBE33CE92
	for <oe-kbuild-all@lists.linux.dev>; Mon, 30 Mar 2026 05:29:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774848572; cv=none; b=ONMlEHy6/BWdWb4hjOcLrAQmGJR8SCVx+8xmrISmRDUb6tcmt7+iMyXJZWXBxoqhkLYQldrJxrrfcsgUul9VyddXmB+nfXVB37eAOBObnyovEmTh7CcgplAOekrux+F+buM5joEMMB7wuneu4Q2cSnGwjj52RghCrVHilOrwS18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774848572; c=relaxed/simple;
	bh=k3nkkLda9ydcUb+cnd6WK351axGcgrf914tD5120c4M=;
	h=Date:From:To:Cc:Subject:Message-ID; b=DTdgKHaftQO1waPWDG9+411XYsloeEfzjxeUBVsIxNCxRDZ92gTP3at5wAX2S6/78P/lTep06ZpJYKD4eMVDxOA+rXfdBQYVYCL72K/zM8Na8azTRbUH2wjlB+CcIVoCKG/1X1woYpbYwk7xsvIC7Cl/aW+5Pto911OxwLpuraY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HdwFpnsR; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HdwFpnsR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774848570; x=1806384570;
  h=date:from:to:cc:subject:message-id;
  bh=k3nkkLda9ydcUb+cnd6WK351axGcgrf914tD5120c4M=;
  b=HdwFpnsRRsTT32UVSQN0GOXLbwZ2miQmBYAOSP4UGkFLsf3CbiIBUK4N
   OQka3iPUduxM0LwbtAyejtV+BSr3/NBwsQ3b0zp38zSb1WKgoWEtc/vBu
   PmvkakJ73anX3Mr5M73mC//V4lnbODer7S8ukQFVsnAq5xmWksVeLFE0y
   rGSKvaJh5M9Rc5gsYBauBXvI+xFnE4OvDyd8mDmikwoMRksO9TR+r3mz+
   QeXh42L6hgoHjTQfIX2/R8rvN7tLoO8K/odKRUT+8haLENpQhCfEAIIXU
   7uGpIm5Q4TAqme8E3CjMlDoXp/Szn/B/6QGSMudHVzk7fh+JHrhvIsSZW
   Q==;
X-CSE-ConnectionGUID: JUhJWSeLShmwa92PkBo3Eg==
X-CSE-MsgGUID: NVyuQ/E5Q/iiA/7RNfTTFw==
X-IronPort-AV: E=McAfee;i="6800,10657,11743"; a="79695628"
X-IronPort-AV: E=Sophos;i="6.23,149,1770624000"; 
   d="scan'208";a="79695628"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Mar 2026 22:29:30 -0700
X-CSE-ConnectionGUID: Xybth9eLSmSVx444q0a7xw==
X-CSE-MsgGUID: s5DxojNTRnmAph/YUBcSFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,149,1770624000"; 
   d="scan'208";a="263879403"
Received: from lkp-server01.sh.intel.com (HELO 283bf2e1b94a) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 29 Mar 2026 22:29:30 -0700
Received: from kbuild by 283bf2e1b94a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w75Bm-000000000iT-2qIC;
	Mon, 30 Mar 2026 05:29:26 +0000
Date: Mon, 30 Mar 2026 13:29:12 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:mirror-poly-aosp-pixel-lajolla-staging 1/1]
 arch/arm64/kvm/hyp/nvhe/trace.c:136:49: warning: variable 'new_head' set but
 not used
Message-ID: <202603301329.W7ikwdB9-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common mirror-poly-aosp-pixel-lajolla-staging
head:   b050398b89b00b305b45dd70b8ab91470c42f155
commit: 9fca73b21dda02bad2a97f8911768923f03ce302 [1/1] FROMLIST: KVM: arm64: Add tracing support for the pKVM hyp
config: arm64-randconfig-001-20260330 (https://download.01.org/0day-ci/archive/20260330/202603301329.W7ikwdB9-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 2cd67b8b69f78e3f95918204320c3075a74ba16c)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260330/202603301329.W7ikwdB9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603301329.W7ikwdB9-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/arm64/kvm/hyp/nvhe/trace.c:136:49: warning: variable 'new_head' set but not used [-Wunused-but-set-variable]
     136 |         struct hyp_buffer_page *tail_page, *new_tail, *new_head;
         |                                                        ^
   1 warning generated.


vim +/new_head +136 arch/arm64/kvm/hyp/nvhe/trace.c

   132	
   133	static struct hyp_buffer_page *
   134	rb_move_tail(struct hyp_rb_per_cpu *cpu_buffer)
   135	{
 > 136		struct hyp_buffer_page *tail_page, *new_tail, *new_head;
   137	
   138		tail_page = cpu_buffer->tail_page;
   139		new_tail = rb_next_page(tail_page);
   140	
   141	again:
   142		/*
   143		 * We caught the reader ... Let's try to move the head page.
   144		 * The writer can only rely on ->next links to check if this is head.
   145		 */
   146		if ((unsigned long)tail_page->list.next & HYP_RB_PAGE_HEAD) {
   147			/* The reader moved the head in between */
   148			if (!rb_set_flag(tail_page, HYP_RB_PAGE_UPDATE))
   149				goto again;
   150	
   151			WRITE_ONCE(cpu_buffer->meta->overrun,
   152				   cpu_buffer->meta->overrun + new_tail->entries);
   153			WRITE_ONCE(meta_pages_lost(cpu_buffer->meta),
   154				   meta_pages_lost(cpu_buffer->meta) + 1);
   155	
   156			/* Move the head */
   157			rb_set_flag(new_tail, HYP_RB_PAGE_HEAD);
   158	
   159			/* The new head is in place, reset the update flag */
   160			rb_set_flag(tail_page, 0);
   161	
   162			new_head = rb_next_page(new_tail);
   163		}
   164	
   165		local_set(&new_tail->page->commit, 0);
   166	
   167		new_tail->write = 0;
   168		new_tail->entries = 0;
   169	
   170		WRITE_ONCE(meta_pages_touched(cpu_buffer->meta),
   171			   meta_pages_touched(cpu_buffer->meta) + 1);
   172		cpu_buffer->tail_page = new_tail;
   173	
   174		return new_tail;
   175	}
   176	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
