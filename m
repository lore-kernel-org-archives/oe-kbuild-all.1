Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99BFE62A0F
	for <oe-kbuild-all@lists.linux.dev>; Tue, 13 Feb 2024 23:20:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707866430; cv=none; b=VcxyBqzwambtDdH2kX/CU8hCCUGyIeYMTYaXlumhpC6398tT6tUB58x1bnsEBJpippR/Ilm5/yYdSVwh4VunTxXULCZCzlJxaisNxCIOB7JMpJTvzyivkVBNtuogQ9oHs8Bski0OLStdf5rsnH830WZVxkt7CZX4hAEDwJAF2rE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707866430; c=relaxed/simple;
	bh=QPB5qGFWEwH61QCfWukMUjQE5Kh/ajMDfVj2Y593nX8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Bmw/mt0MXhIwPntyC5TEpE93Y5b1Zpju/YmCntfJNWicTYYsn4Cdyh3iNCDfBiR7FhhSI/FAVI1xOPUTC6vvL8vlULjc6KgMfakIyqWMOgmEt4XXvGYbStsZ9UvdN13ZwtR3JcBZfvsrKW6+hspcjX3HWl3LY5GaJ0uxO0gGVIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QbUfOLbZ; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QbUfOLbZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707866429; x=1739402429;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=QPB5qGFWEwH61QCfWukMUjQE5Kh/ajMDfVj2Y593nX8=;
  b=QbUfOLbZ/64JVXENiLe8Nc6vjbBye8uqTD5nK3hPYw0EHpj/uIl7cFHo
   AM9tjb9KYxIwD0qwoZ9QF6f06oEgipKkQgT1wTS64pBBWsMEjIyycvsBN
   WEmeZvjGfCBfobWy4FvdrfI6rmihfM48NSsT+xHpuvwSXJPpc5w5DCq8k
   53V/hqMtfZDFXHdH1oYzmBIEkDhujP12+RLXFzbnsV27qyfxpb5w+hNpW
   qPThcR0upQFe5gNkZQggoqZ/KJFydIB4wIXADywriGsA5WIfiAjsZFq2S
   ssAsBvwD3b8F95KK+E8n+V4UbPesitodQgYhT1S6+sdC/2j6k+Fp/Rvpy
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10982"; a="5732857"
X-IronPort-AV: E=Sophos;i="6.06,158,1705392000"; 
   d="scan'208";a="5732857"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2024 15:20:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,158,1705392000"; 
   d="scan'208";a="3389605"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 13 Feb 2024 15:20:20 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ra24X-00089M-3B;
	Tue, 13 Feb 2024 23:20:17 +0000
Date: Wed, 14 Feb 2024 07:19:54 +0800
From: kernel test robot <lkp@intel.com>
To: Suren Baghdasaryan <surenb@google.com>, akpm@linux-foundation.org
Cc: oe-kbuild-all@lists.linux.dev, kent.overstreet@linux.dev,
	mhocko@suse.com, vbabka@suse.cz, hannes@cmpxchg.org,
	roman.gushchin@linux.dev, mgorman@suse.de, dave@stgolabs.net,
	willy@infradead.org, liam.howlett@oracle.com, corbet@lwn.net,
	void@manifault.com, peterz@infradead.org, juri.lelli@redhat.com,
	catalin.marinas@arm.com, will@kernel.org, arnd@arndb.de,
	tglx@linutronix.de, mingo@redhat.com, dave.hansen@linux.intel.com,
	x86@kernel.org, peterx@redhat.com, david@redhat.com,
	axboe@kernel.dk, mcgrof@kernel.org, masahiroy@kernel.org,
	nathan@kernel.org, dennis@kernel.org, tj@kernel.org,
	muchun.song@linux.dev
Subject: Re: [PATCH v3 29/35] mm: vmalloc: Enable memory allocation profiling
Message-ID: <202402140627.bTjAMZBc-lkp@intel.com>
References: <20240212213922.783301-30-surenb@google.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240212213922.783301-30-surenb@google.com>

Hi Suren,

kernel test robot noticed the following build errors:

[auto build test ERROR on akpm-mm/mm-nonmm-unstable]
[also build test ERROR on linus/master v6.8-rc4]
[cannot apply to akpm-mm/mm-everything vbabka-slab/for-next next-20240213]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Suren-Baghdasaryan/lib-string_helpers-Add-flags-param-to-string_get_size/20240213-054335
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-nonmm-unstable
patch link:    https://lore.kernel.org/r/20240212213922.783301-30-surenb%40google.com
patch subject: [PATCH v3 29/35] mm: vmalloc: Enable memory allocation profiling
config: mips-allmodconfig (https://download.01.org/0day-ci/archive/20240214/202402140627.bTjAMZBc-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240214/202402140627.bTjAMZBc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402140627.bTjAMZBc-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/vmalloc.h:6,
                    from include/asm-generic/io.h:994,
                    from arch/mips/include/asm/io.h:563,
                    from arch/mips/include/asm/page.h:200,
                    from include/linux/mm_types_task.h:13,
                    from include/linux/mm_types.h:5,
                    from include/linux/uio.h:10,
                    from include/linux/socket.h:8,
                    from include/linux/compat.h:15,
                    from arch/mips/kernel/asm-offsets.c:12:
>> include/linux/sched.h:1338:41: error: field 'tlb_ubc' has incomplete type
    1338 |         struct tlbflush_unmap_batch     tlb_ubc;
         |                                         ^~~~~~~
>> include/linux/sched.h:1343:41: error: field 'task_frag' has incomplete type
    1343 |         struct page_frag                task_frag;
         |                                         ^~~~~~~~~
   make[3]: *** [scripts/Makefile.build:116: arch/mips/kernel/asm-offsets.s] Error 1
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1191: prepare0] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:240: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:240: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +/tlb_ubc +1338 include/linux/sched.h

af7f588d8f7355 Mathieu Desnoyers 2022-11-22  1337  
72b252aed506b8 Mel Gorman        2015-09-04 @1338  	struct tlbflush_unmap_batch	tlb_ubc;
72b252aed506b8 Mel Gorman        2015-09-04  1339  
5eca1c10cbaa9c Ingo Molnar       2017-02-06  1340  	/* Cache last used pipe for splice(): */
b92ce55893745e Jens Axboe        2006-04-11  1341  	struct pipe_inode_info		*splice_pipe;
5640f7685831e0 Eric Dumazet      2012-09-23  1342  
5640f7685831e0 Eric Dumazet      2012-09-23 @1343  	struct page_frag		task_frag;
5640f7685831e0 Eric Dumazet      2012-09-23  1344  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
