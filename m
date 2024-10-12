Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49C1E1482F5
	for <oe-kbuild-all@lists.linux.dev>; Sat, 12 Oct 2024 14:11:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728742268; cv=none; b=bHBBhzzpoyKGRFnGmD+jcyiy9UE4tlUS84HZaTSH91p0fk0So5D0S/9jzW/a05uVj6EWpx0sZp3QrigRWWmZ2JI6hzDg4e0wUZWcyx7cW3zMBT+AI4/WfjYWEtnX0A8tzRG0FLW6qT9gHgl3QZSA2wazubNv5uXVc3V1uyABwuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728742268; c=relaxed/simple;
	bh=EmPv7dU+c1sUfem2LAaxI/R2mdClYWKv9LQYF1CYHOM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=u2W5PbXW6pM1JUE0vWNzXUXXZmW1mFLHHpwpos3nq5qlzFjX7cPjeOrira/u5TUiRCojoIoQVQk1VvvoGaT7YDv6PCHZzikuAt1pj1dXPSVyunJMna6tvc7vilvX+F5MNSec2ruemlz6o/3JeiBVIG4bhN9Cna+LDnLTche83tQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cFASkl/I; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cFASkl/I"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728742266; x=1760278266;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EmPv7dU+c1sUfem2LAaxI/R2mdClYWKv9LQYF1CYHOM=;
  b=cFASkl/It82Gd0KBiyrvLdJsJW0SeTBi4nk44+RkmmbWjQ3LYynGJdOR
   9/g2V9U9cUX9dx6MmJuQ4RC009u9z53EVUc3EM2x25JjIwawniN1FryZl
   Le8kXiqJRwoEjiJIiPKe+URI4vfaXY32RWo0D6pAlTZFfMkySwWHOMMhb
   /5HjTdOpB7jBXsBrwXw3Kei5Q0LOHHtFF7DxFUQE8yK2q7WM397bAyGPn
   CF+cApDL94EPHwj4UkCvRp4w5TzO02q6OjkcJ6WNSkKO2z0B+7iaKW9Cq
   sMaGorC2zKMMtPWtVeRnyxmZRdV7BNaIJi4Gl2wvt7J91tPpK2FdJi+LP
   w==;
X-CSE-ConnectionGUID: 4YuVrED5QdSf6qmxDmH7xw==
X-CSE-MsgGUID: OJB9VFGlTnS0ee96yyDrzQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="38773358"
X-IronPort-AV: E=Sophos;i="6.11,198,1725346800"; 
   d="scan'208";a="38773358"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2024 07:11:05 -0700
X-CSE-ConnectionGUID: BHNj+hT6T4WVquNscJOS9A==
X-CSE-MsgGUID: WmHx8jPvRSCxWZlvp6bJVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,198,1725346800"; 
   d="scan'208";a="77257522"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 12 Oct 2024 07:11:04 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1szcpi-000DPH-2P;
	Sat, 12 Oct 2024 14:11:02 +0000
Date: Sat, 12 Oct 2024 22:10:41 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.6 4/5] mm/swap.c:718:9: error: implicit
 declaration of function 'folio_update_drain'; did you mean
 'folio_activate_drain'?
Message-ID: <202410122203.ECPntR5X-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.6
head:   dc34775004416cce5b19d0d38d0b0988891cb80b
commit: f57164f428fb8ac2d5fa64a5717c8fff1f24bc21 [4/5] CHROMIUM: mm/mglru: slow down promotion through page tables
config: arm-moxart_defconfig (https://download.01.org/0day-ci/archive/20241012/202410122203.ECPntR5X-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241012/202410122203.ECPntR5X-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410122203.ECPntR5X-lkp@intel.com/

All errors (new ones prefixed by >>):

   mm/swap.c: In function 'lru_add_drain_cpu':
>> mm/swap.c:718:9: error: implicit declaration of function 'folio_update_drain'; did you mean 'folio_activate_drain'? [-Wimplicit-function-declaration]
     718 |         folio_update_drain(cpu);
         |         ^~~~~~~~~~~~~~~~~~
         |         folio_activate_drain


vim +718 mm/swap.c

   681	
   682	/*
   683	 * Drain pages out of the cpu's folio_batch.
   684	 * Either "cpu" is the current CPU, and preemption has already been
   685	 * disabled; or "cpu" is being hot-unplugged, and is already dead.
   686	 */
   687	void lru_add_drain_cpu(int cpu)
   688	{
   689		struct cpu_fbatches *fbatches = &per_cpu(cpu_fbatches, cpu);
   690		struct folio_batch *fbatch = &fbatches->lru_add;
   691	
   692		if (folio_batch_count(fbatch))
   693			folio_batch_move_lru(fbatch, lru_add_fn);
   694	
   695		fbatch = &per_cpu(lru_rotate.fbatch, cpu);
   696		/* Disabling interrupts below acts as a compiler barrier. */
   697		if (data_race(folio_batch_count(fbatch))) {
   698			unsigned long flags;
   699	
   700			/* No harm done if a racing interrupt already did this */
   701			local_lock_irqsave(&lru_rotate.lock, flags);
   702			folio_batch_move_lru(fbatch, lru_move_tail_fn);
   703			local_unlock_irqrestore(&lru_rotate.lock, flags);
   704		}
   705	
   706		fbatch = &fbatches->lru_deactivate_file;
   707		if (folio_batch_count(fbatch))
   708			folio_batch_move_lru(fbatch, lru_deactivate_file_fn);
   709	
   710		fbatch = &fbatches->lru_deactivate;
   711		if (folio_batch_count(fbatch))
   712			folio_batch_move_lru(fbatch, lru_deactivate_fn);
   713	
   714		fbatch = &fbatches->lru_lazyfree;
   715		if (folio_batch_count(fbatch))
   716			folio_batch_move_lru(fbatch, lru_lazyfree_fn);
   717	
 > 718		folio_update_drain(cpu);
   719	}
   720	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
