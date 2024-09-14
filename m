Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2817AC133
	for <oe-kbuild-all@lists.linux.dev>; Sat, 14 Sep 2024 07:40:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726299652; cv=none; b=MGikgEeZAbVgQWCNkijoDlsHI/pXLf2zy7ZvD1MP+qlVb/LceNSNnkl950W6LNAmaoKftzJMQLxPq1qG7brlHy4wP3sYdVbzB+XWoi/+mkLUxxaAU/rxg/sQWWckU8yvDwHJtt0tdlfjqDGEgbiZK3lq/jOkEsZTpK29RtQBsuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726299652; c=relaxed/simple;
	bh=Ht8cmc8cCbaz2kpkC2GEHfzVv1jnhpkt6M+PnqaO2XU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FUQczbf7nQT46vwNiRSYYcKP5rrWzWkFLJsGaqFf9npgf2G5RrqIGnXISYtfh/ftuE+65j2Mw3MsZWEOitJ60fnfyP3miu9ClhjQeK5OST1Jcy0xSF+yQCESi5duNAV8sSulU2chXFCWEzhRdl7PNme/97RoC5p7I4WyElYJPRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NYXb8E7N; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NYXb8E7N"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726299650; x=1757835650;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Ht8cmc8cCbaz2kpkC2GEHfzVv1jnhpkt6M+PnqaO2XU=;
  b=NYXb8E7NPP0c7tHrVBQg2qhMsfWzgnErprVg+H3KbUxQTXOBFH2EPLVH
   cgYQcA92efPu5HXjYeGYaI/po3ADcA2iBYA0DMxwuUvNWgabgFtXEVfa8
   ieOxBhl2f0rOMsknPMwalA+Smc4S6uG/nTiqfssdYgVoNSPygGYVjnR/o
   Tue7no4+r4a/hdMQgiNbLJYzwkG4yEkWQwtRxwdgvQaEL8NztT1rV9Lkn
   xFHRgq/Hl8/XU71BFpaNCciDixzQudpFM351JaJgTyyk/MgyhKSWGD04F
   L9h3qZNNcNIhLR4JfM6sIqNgOn4+1vkdHlNgR0j2yJbhpuY2YBTnupBVu
   w==;
X-CSE-ConnectionGUID: BwcRc5w9SfyPLDhch7iYbA==
X-CSE-MsgGUID: MdTKmxvVQAe1BoI2fTQvZg==
X-IronPort-AV: E=McAfee;i="6700,10204,11194"; a="25300228"
X-IronPort-AV: E=Sophos;i="6.10,228,1719903600"; 
   d="scan'208";a="25300228"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2024 00:40:50 -0700
X-CSE-ConnectionGUID: 2D/9ZqpDRFeNZsKsLSPwMg==
X-CSE-MsgGUID: pv766GQQRn2AdPgDPot+Fg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,228,1719903600"; 
   d="scan'208";a="68038027"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 14 Sep 2024 00:40:48 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1spNOg-0007VP-1L;
	Sat, 14 Sep 2024 07:40:46 +0000
Date: Sat, 14 Sep 2024 15:40:38 +0800
From: kernel test robot <lkp@intel.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v2 03/11] unwind: Introduce SFrame user space unwinding
Message-ID: <202409141501.yaoIVdSI-lkp@intel.com>
References: <ca2e603ae3dcfa3e836162ed8c301fd4d9fd4058.1726268190.git.jpoimboe@kernel.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ca2e603ae3dcfa3e836162ed8c301fd4d9fd4058.1726268190.git.jpoimboe@kernel.org>

Hi Josh,

kernel test robot noticed the following build errors:

[auto build test ERROR on perf-tools-next/perf-tools-next]
[also build test ERROR on tip/perf/core perf-tools/perf-tools linus/master v6.11-rc7 next-20240913]
[cannot apply to acme/perf/core]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Josh-Poimboeuf/unwind-Introduce-generic-user-space-unwinding-interface/20240914-070619
base:   https://git.kernel.org/pub/scm/linux/kernel/git/perf/perf-tools-next.git perf-tools-next
patch link:    https://lore.kernel.org/r/ca2e603ae3dcfa3e836162ed8c301fd4d9fd4058.1726268190.git.jpoimboe%40kernel.org
patch subject: [PATCH v2 03/11] unwind: Introduce SFrame user space unwinding
config: alpha-allnoconfig (https://download.01.org/0day-ci/archive/20240914/202409141501.yaoIVdSI-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240914/202409141501.yaoIVdSI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409141501.yaoIVdSI-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> mm/init-mm.c:48:33: error: expected expression before ',' token
      48 |         INIT_MM_CONTEXT(init_mm),
         |                                 ^
>> mm/init-mm.c:48:33: warning: excess elements in struct initializer
   mm/init-mm.c:48:33: note: (near initialization for 'init_mm')


vim +48 mm/init-mm.c

    22	
    23	/*
    24	 * For dynamically allocated mm_structs, there is a dynamically sized cpumask
    25	 * at the end of the structure, the size of which depends on the maximum CPU
    26	 * number the system can see. That way we allocate only as much memory for
    27	 * mm_cpumask() as needed for the hundreds, or thousands of processes that
    28	 * a system typically runs.
    29	 *
    30	 * Since there is only one init_mm in the entire system, keep it simple
    31	 * and size this cpu_bitmask to NR_CPUS.
    32	 */
    33	struct mm_struct init_mm = {
    34		.mm_mt		= MTREE_INIT_EXT(mm_mt, MM_MT_FLAGS, init_mm.mmap_lock),
    35		.pgd		= swapper_pg_dir,
    36		.mm_users	= ATOMIC_INIT(2),
    37		.mm_count	= ATOMIC_INIT(1),
    38		.write_protect_seq = SEQCNT_ZERO(init_mm.write_protect_seq),
    39		MMAP_LOCK_INITIALIZER(init_mm)
    40		.page_table_lock =  __SPIN_LOCK_UNLOCKED(init_mm.page_table_lock),
    41		.arg_lock	=  __SPIN_LOCK_UNLOCKED(init_mm.arg_lock),
    42		.mmlist		= LIST_HEAD_INIT(init_mm.mmlist),
    43	#ifdef CONFIG_PER_VMA_LOCK
    44		.mm_lock_seq	= 0,
    45	#endif
    46		.user_ns	= &init_user_ns,
    47		.cpu_bitmap	= CPU_BITS_NONE,
  > 48		INIT_MM_CONTEXT(init_mm),
    49		INIT_MM_SFRAME,
    50	};
    51	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
