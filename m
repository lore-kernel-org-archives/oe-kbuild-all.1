Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEB8B2D23B6
	for <oe-kbuild-all@lists.linux.dev>; Wed, 17 Dec 2025 09:26:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765963592; cv=none; b=lLsWa2nZgV5ZfTFlIrz0Yp9JpR/hNN/1wh79AQ72uJiKMUnwxx+OJ3qZKc1z7ZaY+vSimJN7/CtPbMEnMPt+jDERsqaPaQZkMqmp8v+2RqXZp6asKUyhVqbc9xLHRSbp+OKlA0jIpeqTTukStb02j42Qy4AYwEvqyra0iXtOkQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765963592; c=relaxed/simple;
	bh=+L9SecVXbUeus1TPSJM+U2QTim99UT5678DMvgtajRA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IGOOSpseggmDXIT8QLOf9urfwIKoqwLwgs/MA1BIqq7db6Q/9qVQ/G5oG4tZ+YRNYGx1SDzh4kb5+iIvjZvvZg0xp2IQCw6MQXYf3IYLGhwdEv+4GnDA8Qd8CTu2/srYWK8H8fEQf5TZiROCBylmO/TdnSAUXJhLmFY20aHG0TQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=fail smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Rnj7tOiv; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Rnj7tOiv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765963588; x=1797499588;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+L9SecVXbUeus1TPSJM+U2QTim99UT5678DMvgtajRA=;
  b=Rnj7tOivhcVgBKSWuioflCoS0EMtlkcteDvSuH6egfzCS2sbw+TDALZY
   DLp1tRfGCwsEWRbFFRBvfufkMjkLqzxQcOHsUgppbAvHEV2Y8O36kw49X
   ZbQnFZiWZ4uhi2JJ9F0nXDcAuEVMl+z3u2i6/xM1V6wA+RMXsDGzwK+Qo
   quBYPER7zm8QtOzBj38SJELRZV3NxA/SI66KyWnNsLaHX4ZpErbAyTayu
   pxcWvjDCzi+6hGjDZY1qgvw3OKQcd+/WnStfmN7spXVfF+GZOaSTgyAOB
   2TARqGBF4sxO54e0VKNmJEWwTycRbOP8yc1YM5g0snyMKYL1lc2K8LJMD
   Q==;
X-CSE-ConnectionGUID: A9Tm8luVSZGvY+KGKzhUMw==
X-CSE-MsgGUID: 2K+GpLokTkiftHsMM91rYA==
X-IronPort-AV: E=McAfee;i="6800,10657,11644"; a="79014243"
X-IronPort-AV: E=Sophos;i="6.21,155,1763452800"; 
   d="scan'208";a="79014243"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2025 01:26:27 -0800
X-CSE-ConnectionGUID: q9rOA0q+TpyFdxuHstRibw==
X-CSE-MsgGUID: /LYbOAU2RXusMrbhC9DfeA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,155,1763452800"; 
   d="scan'208";a="198751864"
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 17 Dec 2025 01:26:25 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vVnnb-000000000Kr-2yo0;
	Wed, 17 Dec 2025 09:26:23 +0000
Date: Wed, 17 Dec 2025 17:25:25 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-2025-09 1/1]
 arch/arm64/kvm/hyp/nvhe/trace.c:136:49: warning: variable 'new_head' set but
 not used
Message-ID: <202512171742.0R8MRuSr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android16-6.12-2025-09
head:   0f301e42a52b36441f6d6aa25cc84247a140889c
commit: 1e1a0f8ef58c0f6c4b6a091a786db123cf5c4610 [1/1] FROMLIST: KVM: arm64: Add tracing support for the pKVM hyp
config: arm64-randconfig-003-20251216 (https://download.01.org/0day-ci/archive/20251217/202512171742.0R8MRuSr-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251217/202512171742.0R8MRuSr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512171742.0R8MRuSr-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/arm64/kvm/hyp/nvhe/trace.c: In function 'rb_move_tail':
>> arch/arm64/kvm/hyp/nvhe/trace.c:136:49: warning: variable 'new_head' set but not used [-Wunused-but-set-variable]
     136 |  struct hyp_buffer_page *tail_page, *new_tail, *new_head;
         |                                                 ^~~~~~~~


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
