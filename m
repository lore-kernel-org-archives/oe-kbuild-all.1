Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C1B223A9
	for <oe-kbuild-all@lists.linux.dev>; Mon, 20 Jan 2025 21:45:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737409552; cv=none; b=ihDLi7qadgFM8MNMXmyVhtl1t4cAFAZs+8O/NOQxCiu2mBCeB6gD9gpbajEaUqsF5fFtR+3NfSRhnVf84sVhIxTic96lkeaBnL0+GYR/FcyJ63YukKy9aAJzyGl2+ltn0fRNBgAY+aPSI3VeJZRIvtpe3Dahr5y9McbxdFleWKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737409552; c=relaxed/simple;
	bh=NDP5a54O7REUaDj5VLJ0s1/UqSeheP0HyOGAD9F9RF4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PxE4jmZAgpODMW8zo0GwxFl6UAKU0r3q6HCS/pCdSN091h+w6XukYR2ljxF+5zpWHSe1JgME+4f9XOPVEL9dHEv3Tk7sLAh4nLyf5C/RFa8esbeA11YNcAsMlOGwZh2dvSvjU4zXhUXUiQnB01CsGx6xnOBojyhsCAasxYaY87o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NasUhsFH; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NasUhsFH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737409551; x=1768945551;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NDP5a54O7REUaDj5VLJ0s1/UqSeheP0HyOGAD9F9RF4=;
  b=NasUhsFHXgMLruppXt0JkhM419K3cbNA1tHtgd8399I7s8K0UZ47Maq4
   d5CFAt7BJZBU0GswQkJpLSrctJIoY9Ogb1tnPVyKZWF/0NFpnhYuVRXGC
   XsHMWJfgzsuYrX0auEsus3uVUvFpbY63PhAHFweA83d4+KJTAWI+IxTLk
   Ml90FfASRjO8QtB+JO127QIbPPxUPhwzrAJ4FoO6IqBe5jGX1RQeQInqQ
   Et38r8cTLpS6UNAH3sVBdfJInlDpdKJlregemj+rTzy8/RmfqH3JsoTk1
   bQKrX/bmP44uNIzVl/yUC+cagwvRFwfcblmbbLrtvAU6Sn7ckRCQyPqXx
   Q==;
X-CSE-ConnectionGUID: CByCk29kTAa1zF5boeOygQ==
X-CSE-MsgGUID: issQRvPRQ5SwQFLgIbTrZA==
X-IronPort-AV: E=McAfee;i="6700,10204,11321"; a="48477511"
X-IronPort-AV: E=Sophos;i="6.13,220,1732608000"; 
   d="scan'208";a="48477511"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2025 13:45:50 -0800
X-CSE-ConnectionGUID: V1ezzcA5RCuJc1j87YdWIg==
X-CSE-MsgGUID: iKeVZQZwRnisEZsKcbxetw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="111714742"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 20 Jan 2025 13:45:49 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tZzac-000XCF-2c;
	Mon, 20 Jan 2025 21:45:46 +0000
Date: Tue, 21 Jan 2025 05:44:58 +0800
From: kernel test robot <lkp@intel.com>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [linux-next:master 9182/10024] kernel/trace/trace_events.c:3583:13:
 error: conflicting types for 'update_cache'; have 'void(struct trace_array
 *, struct module *)'
Message-ID: <202501210550.Ufrj5CRn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   1573c8d4cb206a2d1454ff711e79f8df2353290b
commit: b355247df104ef6644288884afd2c08b7bf49897 [9182/10024] tracing: Cache ":mod:" events for modules not loaded yet
config: openrisc-allyesconfig (https://download.01.org/0day-ci/archive/20250121/202501210550.Ufrj5CRn-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250121/202501210550.Ufrj5CRn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501210550.Ufrj5CRn-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/trace/trace_events.c:3583:13: error: conflicting types for 'update_cache'; have 'void(struct trace_array *, struct module *)'
    3583 | static void update_cache(struct trace_array *tr, struct module *mod)
         |             ^~~~~~~~~~~~
   In file included from include/linux/pgtable.h:6,
                    from include/linux/mm.h:30,
                    from include/linux/security.h:33,
                    from kernel/trace/trace_events.c:15:
   arch/openrisc/include/asm/pgtable.h:380:13: note: previous declaration of 'update_cache' with type 'void(struct vm_area_struct *, long unsigned int,  pte_t *)'
     380 | extern void update_cache(struct vm_area_struct *vma,
         |             ^~~~~~~~~~~~


vim +3583 kernel/trace/trace_events.c

  3576	
  3577	#define for_each_event(event, start, end)			\
  3578		for (event = start;					\
  3579		     (unsigned long)event < (unsigned long)end;		\
  3580		     event++)
  3581	
  3582	#ifdef CONFIG_MODULES
> 3583	static void update_cache(struct trace_array *tr, struct module *mod)
  3584	{
  3585		struct event_mod_load *event_mod, *n;
  3586	
  3587		list_for_each_entry_safe(event_mod, n, &tr->mod_events, list) {
  3588			if (strcmp(event_mod->module, mod->name) != 0)
  3589				continue;
  3590	
  3591			__ftrace_set_clr_event_nolock(tr, event_mod->match,
  3592						      event_mod->system,
  3593						      event_mod->event, 1, mod->name);
  3594			free_event_mod(event_mod);
  3595		}
  3596	}
  3597	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
