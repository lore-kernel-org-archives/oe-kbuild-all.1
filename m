Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 935EF1993A9
	for <oe-kbuild-all@lists.linux.dev>; Sat, 12 Oct 2024 15:13:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728745990; cv=none; b=TX3T24PTJGkkWMVhoRHkJyEa3ajarSNG11UWwc/uTa9a9JlNQFHb6lVYMaULYc798tfJvV2NJ80kmJKbt66vdBwnQCYnqMkiQGm+0JiErJxHOyiY+oKiWfMeRcTxTo6tSUwDzY0x2ZlAQGAAfmd4OBcu8yHGwnYMpI4lMld5df0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728745990; c=relaxed/simple;
	bh=slk9YIMrwx4QFSHXS0SwHjH3GZbEyCvhv95kOyjQJPU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HInB3LTkkOUD4e2GgButc4jdGDXlxD3Q4LdbD8dJnR+Pj4hJD66DIYezg3vleszDsZPDtG0kA2qTj4IqTPdW2Bo+9f6GSTlEd9i7QVRJYcZpZgcKAI0oIxqvYeR86GK05Conc6NaPJuVSNvPjSeroV9JFg6l59Pjc3lGn6K8aME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PzNtZDFQ; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PzNtZDFQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728745989; x=1760281989;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=slk9YIMrwx4QFSHXS0SwHjH3GZbEyCvhv95kOyjQJPU=;
  b=PzNtZDFQIT/W0xFv+3N0y2+PTU1Kp7egv06Jevfvwj4WOR2fnSj4VL2u
   FbeSvBZ7v2iRU8UPzlLnoQMess1GOUosz9CFMlyCa9PgH1e/42uGfYbYL
   S7ymGzbOhvcn1oPDo0RfeG9nz4pHHCP21TqzL6ykKBM4N9UuW57xznnuM
   xfQyfdnwRQjvDCtufc+ZBLZttlt7+1NQjcR4xEAH2USOvisUwwocJBok3
   +jNBOUqH3v5J5ZHHNb9H0JHOqMGljF9sO6xPYir2GmfKw/qmJ19ixUcTW
   NPeTk+MU9pu37y90kMNzPymou05tGPDrUPrffb6kgn9WnBk0kbGt6kbu9
   A==;
X-CSE-ConnectionGUID: /NWxdvQaTa2vPSmpR3PUlw==
X-CSE-MsgGUID: lUGEUOWOSm+fsmQQwgH+Pg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="28010986"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="28010986"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2024 08:13:08 -0700
X-CSE-ConnectionGUID: KsZTSsCFRvq5xYa0qAKVFA==
X-CSE-MsgGUID: /8dF2DAAR4e9LxIzOijhwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="81729321"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 12 Oct 2024 08:13:07 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1szdnl-000DSl-0F;
	Sat, 12 Oct 2024 15:13:05 +0000
Date: Sat, 12 Oct 2024 23:12:16 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.6 4/5] mm/swap.c:718:2: error: call to
 undeclared function 'folio_update_drain'; ISO C99 and later do not support
 implicit function declarations
Message-ID: <202410122305.60IQb4cw-lkp@intel.com>
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
config: arm-allnoconfig (https://download.01.org/0day-ci/archive/20241012/202410122305.60IQb4cw-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 70e0a7e7e6a8541bcc46908c592eed561850e416)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241012/202410122305.60IQb4cw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410122305.60IQb4cw-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from mm/swap.c:17:
   In file included from include/linux/mm.h:2194:
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from mm/swap.c:26:
   include/linux/mm_inline.h:46:41: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
      46 |         __mod_lruvec_state(lruvec, NR_LRU_BASE + lru, nr_pages);
         |                                    ~~~~~~~~~~~ ^ ~~~
   include/linux/mm_inline.h:48:22: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
      48 |                                 NR_ZONE_LRU_BASE + lru, nr_pages);
         |                                 ~~~~~~~~~~~~~~~~ ^ ~~~
>> mm/swap.c:718:2: error: call to undeclared function 'folio_update_drain'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     718 |         folio_update_drain(cpu);
         |         ^
   mm/swap.c:718:2: note: did you mean 'folio_activate_drain'?
   mm/swap.c:394:20: note: 'folio_activate_drain' declared here
     394 | static inline void folio_activate_drain(int cpu)
         |                    ^
   3 warnings and 1 error generated.


vim +/folio_update_drain +718 mm/swap.c

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
