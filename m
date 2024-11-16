Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 882ADB666
	for <oe-kbuild-all@lists.linux.dev>; Sat, 16 Nov 2024 17:46:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731779215; cv=none; b=P5fwy4N2NiwHtO5dOsNatpl7sT7SjcnEllSThSTGD3F8/28NnKgX7ifABTZ6sDOKr4emOM2e+KdssmJt02py2v7Jf07lwE5vGSBO5ZtFtAHDKpBn8jYEk59LR6+sLF4YEVw6VWm/0pkMn7JbBlxj2SbALgrxCBAxc40WtGLDHlQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731779215; c=relaxed/simple;
	bh=zXn0678akDLPMcCVKO1+FvdYvmCLI1qFDlZr+mSq0CA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cnFUqwvj8GGIowOPDOIeSp37jiNJqDdak6k/4UxNXWBRaCic0+7402qv9VTI9xNLXu7jzbWt94nH8LAB6LoXMYGeFMk77rQH4JkHAfcvZKHvP3DIIjHmZmBMqTdiIvn9p3vJkixOHzbQz6ZiOnVZKWAAyQB9Vt/thex/UAS1oeE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=a3xyvJiB; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="a3xyvJiB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731779214; x=1763315214;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zXn0678akDLPMcCVKO1+FvdYvmCLI1qFDlZr+mSq0CA=;
  b=a3xyvJiBF24m6MpimunGKsUKG4gVppRuR365ex4veVRN4FMtHtnrtPgr
   iIjBA/IFgXIUXZIa1Uf7HjHAuuN6wyjWJTuEpR6nsZHfobwg61P1ntxiJ
   8/ks5fre5DiBtQ9zxAmrOShp3fX09X49jZXqyhnViyJzo7aim6boDLDRB
   Ht1TQ3D7iKWYKfwVCugL+dwbNtoIZlMWGKOZlwkUDurjkKSvs4v8iGWon
   IVOq53MbRQCcDcipSd8hgZKMZDSDoxribSfWgDAPsiLrsRIQYXXUVpcCO
   BSFntoIWoJ1z953XTq+Qt7BQ2/r7+llwywrfoPaSrCS4WBlpLj49Eux++
   A==;
X-CSE-ConnectionGUID: 1fEEBmpgTXWqngrjrqtwEQ==
X-CSE-MsgGUID: kNRrfqL8ScixqAArdspQBQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11258"; a="31928608"
X-IronPort-AV: E=Sophos;i="6.12,160,1728975600"; 
   d="scan'208";a="31928608"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2024 09:46:53 -0800
X-CSE-ConnectionGUID: LCnqxGNCS1GVcIepEOQuIg==
X-CSE-MsgGUID: h/h6iE96TbWU1rz6DqPXyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,160,1728975600"; 
   d="scan'208";a="93932088"
Received: from lkp-server01.sh.intel.com (HELO 1e3cc1889ffb) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 16 Nov 2024 09:46:52 -0800
Received: from kbuild by 1e3cc1889ffb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tCMsj-00010j-2L;
	Sat, 16 Nov 2024 17:46:49 +0000
Date: Sun, 17 Nov 2024 01:46:45 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6-desktop 15/67] mm/swap.c:722:9: error:
 implicit declaration of function 'folio_update_drain'; did you mean
 'folio_activate_drain'?
Message-ID: <202411170103.PPdWSFlT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6-desktop
head:   e2b6daceb83c9b9ae90fca4b78fc265484ded662
commit: 502d91a72b9c5bef5d3ae1b7b2b3a9901a8a4e2f [15/67] CHROMIUM: mm/mglru: slow down promotion through page tables
config: arm-vf610m4_defconfig (https://download.01.org/0day-ci/archive/20241117/202411170103.PPdWSFlT-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241117/202411170103.PPdWSFlT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411170103.PPdWSFlT-lkp@intel.com/

All errors (new ones prefixed by >>):

   mm/swap.c: In function 'lru_add_drain_cpu':
>> mm/swap.c:722:9: error: implicit declaration of function 'folio_update_drain'; did you mean 'folio_activate_drain'? [-Wimplicit-function-declaration]
     722 |         folio_update_drain(cpu);
         |         ^~~~~~~~~~~~~~~~~~
         |         folio_activate_drain


vim +722 mm/swap.c

   685	
   686	/*
   687	 * Drain pages out of the cpu's folio_batch.
   688	 * Either "cpu" is the current CPU, and preemption has already been
   689	 * disabled; or "cpu" is being hot-unplugged, and is already dead.
   690	 */
   691	void lru_add_drain_cpu(int cpu)
   692	{
   693		struct cpu_fbatches *fbatches = &per_cpu(cpu_fbatches, cpu);
   694		struct folio_batch *fbatch = &fbatches->lru_add;
   695	
   696		if (folio_batch_count(fbatch))
   697			folio_batch_move_lru(fbatch, lru_add_fn);
   698	
   699		fbatch = &per_cpu(lru_rotate.fbatch, cpu);
   700		/* Disabling interrupts below acts as a compiler barrier. */
   701		if (data_race(folio_batch_count(fbatch))) {
   702			unsigned long flags;
   703	
   704			/* No harm done if a racing interrupt already did this */
   705			local_lock_irqsave(&lru_rotate.lock, flags);
   706			folio_batch_move_lru(fbatch, lru_move_tail_fn);
   707			local_unlock_irqrestore(&lru_rotate.lock, flags);
   708		}
   709	
   710		fbatch = &fbatches->lru_deactivate_file;
   711		if (folio_batch_count(fbatch))
   712			folio_batch_move_lru(fbatch, lru_deactivate_file_fn);
   713	
   714		fbatch = &fbatches->lru_deactivate;
   715		if (folio_batch_count(fbatch))
   716			folio_batch_move_lru(fbatch, lru_deactivate_fn);
   717	
   718		fbatch = &fbatches->lru_lazyfree;
   719		if (folio_batch_count(fbatch))
   720			folio_batch_move_lru(fbatch, lru_lazyfree_fn);
   721	
 > 722		folio_update_drain(cpu);
   723	}
   724	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
