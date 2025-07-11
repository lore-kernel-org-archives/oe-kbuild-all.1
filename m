Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E77B71C245C
	for <oe-kbuild-all@lists.linux.dev>; Fri, 11 Jul 2025 21:01:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752267680; cv=none; b=YDw2uIYBVGhhrwq3f+4hYE8urccUt25aZp5gal8DLQaJNhDj2Flirqy8nS2ahwZ0dznBhOCa0pQEcAibtrnDPVuhEiXgiAqaNB4beVxHkbRPXJS6RIkctu87RJGyRuyI1z83s0ywZbH48Cs3m1EKMuEL8b6XcDZf1anB/lfAKzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752267680; c=relaxed/simple;
	bh=LRjqnNUn3Lp/u3WuN65PL5o1vqiRlhmwOYJ6lzQs9p0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mPKKpb5QgeEPjQHL1pPWFzyMGveXiEt3Uw/ez9xwUGFWkRzaP9jfBKiuYAnZR2wiW4pvZAlSpo4ADkORVzszWslMmEEsJOLJfvXivWbhrtXiUmWeie2oJl4M/hgl1bq9GJ60ZFP4UQMi66G7b+xJsbtn1UiTQWtCctPKgBWBFC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=h2yKUZeD; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="h2yKUZeD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752267679; x=1783803679;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LRjqnNUn3Lp/u3WuN65PL5o1vqiRlhmwOYJ6lzQs9p0=;
  b=h2yKUZeD32EmjX+j3eWq3pp5+xaojRRxVcaeylx1stM2za8a+MGohLtW
   g/527pIRweE184EDMrG8t2NYf35P6esCfUUtjcI4F05tbwa/nTa4WB6zo
   K9fd/INnDCkntLIWEUxkRboks8zHN11SPsAcRPXA+ANpYHrqZn/R8gtXa
   i3r3gK9jIHjbwUh7cH+hZtlw6cN2qCkXWXBg3P3AZqvryQd+gJvvTdDto
   aKRi3/X0Y7EE3VsyyKyPswGpH10fuh3tCumkfWJryCDTzNJyEOm6qGWWR
   LSJBWKYZ4YRQZkKCmYeYlbIIIGDE6u9ZSWloqVogmEDK0zGXcIPB2hIk6
   g==;
X-CSE-ConnectionGUID: yyEK7bI3R8y3N7nvlW/kRg==
X-CSE-MsgGUID: 6RB/XTImSdeeeQCMfv+A0w==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="58379246"
X-IronPort-AV: E=Sophos;i="6.16,304,1744095600"; 
   d="scan'208";a="58379246"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jul 2025 14:01:17 -0700
X-CSE-ConnectionGUID: HGKux1KnSROApiqJP25fBw==
X-CSE-MsgGUID: lneIBGBlR0qEIZIZLMDGuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,304,1744095600"; 
   d="scan'208";a="180139918"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 11 Jul 2025 14:01:16 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uaKrq-0006nP-10;
	Fri, 11 Jul 2025 21:01:14 +0000
Date: Sat, 12 Jul 2025 05:00:36 +0800
From: kernel test robot <lkp@intel.com>
To: Yury Norov <yury.norov@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [norov:fnb 16/37] arch/powerpc/kvm/mpic.c:296:26: error: 'irq'
 undeclared; did you mean 'rq'?
Message-ID: <202507120418.vAX30xSH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/norov/linux fnb
head:   870b9f6edf53871a5cc4aaf858054d8362c49989
commit: 0b41d6e7a357f08fd23dec2bc204af5af38d7072 [16/37] power: kvm: use for_each_set_bit() in IRQ_check()
config: powerpc-randconfig-001-20250712 (https://download.01.org/0day-ci/archive/20250712/202507120418.vAX30xSH-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250712/202507120418.vAX30xSH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507120418.vAX30xSH-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/bitmap.h:11,
                    from include/linux/cpumask.h:12,
                    from include/linux/smp.h:13,
                    from include/linux/lockdep.h:14,
                    from include/linux/spinlock.h:63,
                    from include/linux/mmzone.h:8,
                    from include/linux/gfp.h:7,
                    from include/linux/slab.h:16,
                    from arch/powerpc/kvm/mpic.c:26:
   arch/powerpc/kvm/mpic.c: In function 'IRQ_check':
>> arch/powerpc/kvm/mpic.c:296:26: error: 'irq' undeclared (first use in this function); did you mean 'rq'?
     296 |         for_each_set_bit(irq, q->queue, opp->max_irq) {
         |                          ^~~
   include/linux/find.h:586:15: note: in definition of macro 'for_each_set_bit'
     586 |         for ((bit) = 0; (bit) = find_next_bit((addr), (size), (bit)), (bit) < (size); (bit)++)
         |               ^~~
   arch/powerpc/kvm/mpic.c:296:26: note: each undeclared identifier is reported only once for each function it appears in
     296 |         for_each_set_bit(irq, q->queue, opp->max_irq) {
         |                          ^~~
   include/linux/find.h:586:15: note: in definition of macro 'for_each_set_bit'
     586 |         for ((bit) = 0; (bit) = find_next_bit((addr), (size), (bit)), (bit) < (size); (bit)++)
         |               ^~~
   include/linux/find.h:586:69: warning: left-hand operand of comma expression has no effect [-Wunused-value]
     586 |         for ((bit) = 0; (bit) = find_next_bit((addr), (size), (bit)), (bit) < (size); (bit)++)
         |                                                                     ^
   arch/powerpc/kvm/mpic.c:296:9: note: in expansion of macro 'for_each_set_bit'
     296 |         for_each_set_bit(irq, q->queue, opp->max_irq) {
         |         ^~~~~~~~~~~~~~~~


vim +296 arch/powerpc/kvm/mpic.c

   290	
   291	static void IRQ_check(struct openpic *opp, struct irq_queue *q)
   292	{
   293		int next = -1;
   294		int priority = -1;
   295	
 > 296		for_each_set_bit(irq, q->queue, opp->max_irq) {
   297			pr_debug("IRQ_check: irq %d set ivpr_pr=%d pr=%d\n",
   298				irq, IVPR_PRIORITY(opp->src[irq].ivpr), priority);
   299	
   300			if (IVPR_PRIORITY(opp->src[irq].ivpr) > priority) {
   301				next = irq;
   302				priority = IVPR_PRIORITY(opp->src[irq].ivpr);
   303			}
   304		}
   305	
   306		q->next = next;
   307		q->priority = priority;
   308	}
   309	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
