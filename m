Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 809C01FDA
	for <oe-kbuild-all@lists.linux.dev>; Sun, 23 Feb 2025 02:18:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740277106; cv=none; b=oHXhHo9GkvRus7Ti8YpAFmH5S41GocDxn7bQZ27T0G9/AsP3aVGnTiRHlJvbHkVlHGCh7ZLT2sASqacd6nCWqHXD3Wk2eXPEEw5pD2MKCmLTL+ddyFLIPSXAxz8X+W/DZjaIE6ZQcYjlhpp9lMcvD6gCifnxOvu+cr0pJe8XJko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740277106; c=relaxed/simple;
	bh=wn4dsiQDuZ4wDO3+pqXZpc+4kXeidMG9qH5nKZpGBbc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h+dtuyHWdQlcGAOvJf45S6gC7M2e83xt83ybCoAuqv7D0JT3E3a/GW58SvdZwUddhZatV1xPNzvih8ubBimHSr0RxApReMaxoL2ez4IuLXOa5ddttUM+TM3FT1eQUSnq60FGgV4P1Ispn1XgabqdZieQ7Ogc7gh4C3tYWG7VbEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UROa18nU; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UROa18nU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740277104; x=1771813104;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=wn4dsiQDuZ4wDO3+pqXZpc+4kXeidMG9qH5nKZpGBbc=;
  b=UROa18nUa3u+9tJ4L7JMBnztN3Hdqyt9ZGHHXZM1STWyBKQeKWg0l0EG
   0UgSqWCN5R1cb6gbRq0AmtPOewCsY1v6SeX/wyQxE4l3Z3ewYaYsA/vEE
   /cSct7rWCUXv2eH1S35EY6W4VGd/v3m6RqLt96zB1wZdjjG0QVI2u3F3d
   otSzmcb3GLpmkRlYwCJNsnje4kGkb9FwQqtQS5biGsMPhnRCdLbrEPPbx
   SalxPSBxZNe/PnteguaIFMO7NVNO8vZEK6FbYuDQL/l6DQEpB32kXnObE
   AACVTu0sp/TThN1FoFjBgKPmZfYRpYPT0Ukw6t50l9wvLTfdzgTCv8vGU
   Q==;
X-CSE-ConnectionGUID: kBCK8k5fRyutX6wHuJGTaQ==
X-CSE-MsgGUID: D2Kj0lWcQCSb4tcVWLsckQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11353"; a="51701285"
X-IronPort-AV: E=Sophos;i="6.13,308,1732608000"; 
   d="scan'208";a="51701285"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Feb 2025 18:18:24 -0800
X-CSE-ConnectionGUID: hxZzzr7GQHub4X5ep94xQw==
X-CSE-MsgGUID: ymsm1AnnRfW9zG4wdXdguQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,308,1732608000"; 
   d="scan'208";a="146571617"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 22 Feb 2025 18:18:22 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tm1ZU-00073f-1A;
	Sun, 23 Feb 2025 02:18:20 +0000
Date: Sun, 23 Feb 2025 10:17:27 +0800
From: kernel test robot <lkp@intel.com>
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH bpf-next v9 2/6] mm, bpf: Introduce try_alloc_pages() for
 opportunistic page allocation
Message-ID: <202502230935.fqsCRt0F-lkp@intel.com>
References: <20250222024427.30294-3-alexei.starovoitov@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250222024427.30294-3-alexei.starovoitov@gmail.com>

Hi Alexei,

kernel test robot noticed the following build warnings:

[auto build test WARNING on bpf-next/master]

url:    https://github.com/intel-lab-lkp/linux/commits/Alexei-Starovoitov/locking-local_lock-Introduce-localtry_lock_t/20250222-104619
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
patch link:    https://lore.kernel.org/r/20250222024427.30294-3-alexei.starovoitov%40gmail.com
patch subject: [PATCH bpf-next v9 2/6] mm, bpf: Introduce try_alloc_pages() for opportunistic page allocation
config: x86_64-buildonly-randconfig-003-20250223 (https://download.01.org/0day-ci/archive/20250223/202502230935.fqsCRt0F-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250223/202502230935.fqsCRt0F-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502230935.fqsCRt0F-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/page_alloc.c:7103: warning: Function parameter or struct member 'nid' not described in 'try_alloc_pages'
>> mm/page_alloc.c:7103: warning: Function parameter or struct member 'order' not described in 'try_alloc_pages'


vim +7103 mm/page_alloc.c

  7087	
  7088	/**
  7089	 * try_alloc_pages - opportunistic reentrant allocation from any context
  7090	 * @nid - node to allocate from
  7091	 * @order - allocation order size
  7092	 *
  7093	 * Allocates pages of a given order from the given node. This is safe to
  7094	 * call from any context (from atomic, NMI, and also reentrant
  7095	 * allocator -> tracepoint -> try_alloc_pages_noprof).
  7096	 * Allocation is best effort and to be expected to fail easily so nobody should
  7097	 * rely on the success. Failures are not reported via warn_alloc().
  7098	 * See always fail conditions below.
  7099	 *
  7100	 * Return: allocated page or NULL on failure.
  7101	 */
  7102	struct page *try_alloc_pages_noprof(int nid, unsigned int order)
> 7103	{
  7104		/*
  7105		 * Do not specify __GFP_DIRECT_RECLAIM, since direct claim is not allowed.
  7106		 * Do not specify __GFP_KSWAPD_RECLAIM either, since wake up of kswapd
  7107		 * is not safe in arbitrary context.
  7108		 *
  7109		 * These two are the conditions for gfpflags_allow_spinning() being true.
  7110		 *
  7111		 * Specify __GFP_NOWARN since failing try_alloc_pages() is not a reason
  7112		 * to warn. Also warn would trigger printk() which is unsafe from
  7113		 * various contexts. We cannot use printk_deferred_enter() to mitigate,
  7114		 * since the running context is unknown.
  7115		 *
  7116		 * Specify __GFP_ZERO to make sure that call to kmsan_alloc_page() below
  7117		 * is safe in any context. Also zeroing the page is mandatory for
  7118		 * BPF use cases.
  7119		 *
  7120		 * Though __GFP_NOMEMALLOC is not checked in the code path below,
  7121		 * specify it here to highlight that try_alloc_pages()
  7122		 * doesn't want to deplete reserves.
  7123		 */
  7124		gfp_t alloc_gfp = __GFP_NOWARN | __GFP_ZERO | __GFP_NOMEMALLOC;
  7125		unsigned int alloc_flags = ALLOC_TRYLOCK;
  7126		struct alloc_context ac = { };
  7127		struct page *page;
  7128	
  7129		/*
  7130		 * In PREEMPT_RT spin_trylock() will call raw_spin_lock() which is
  7131		 * unsafe in NMI. If spin_trylock() is called from hard IRQ the current
  7132		 * task may be waiting for one rt_spin_lock, but rt_spin_trylock() will
  7133		 * mark the task as the owner of another rt_spin_lock which will
  7134		 * confuse PI logic, so return immediately if called form hard IRQ or
  7135		 * NMI.
  7136		 *
  7137		 * Note, irqs_disabled() case is ok. This function can be called
  7138		 * from raw_spin_lock_irqsave region.
  7139		 */
  7140		if (IS_ENABLED(CONFIG_PREEMPT_RT) && (in_nmi() || in_hardirq()))
  7141			return NULL;
  7142		if (!pcp_allowed_order(order))
  7143			return NULL;
  7144	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
