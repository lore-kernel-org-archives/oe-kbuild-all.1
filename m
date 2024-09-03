Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28CAE195
	for <oe-kbuild-all@lists.linux.dev>; Tue,  3 Sep 2024 11:29:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725362949; cv=none; b=csBxw38j74pMpDU4pwDmDjK+FvMdXOAyaxlkk+oR021x4aX6YW7ueX2lfpy1Bh/pKL0qWqA48CmpigLcEHqvfCbXQniraJdtTKo+gkHrWhz3zi2MnPTIgk2G9aEICUr3vDUahps4tiddYaxid+UntT8Ktj1sG+hO2s5GsLHoow4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725362949; c=relaxed/simple;
	bh=bi6h5SylwUO2iArB0eAQ7jh3H4qvqEZDTEmd2FGZpgE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hmJJ26cPIEer1ud/SrGmoA3MMYjahuixiz2+FITsfBPDjo3OcrBNRB4tjK/O7uKiN6spzSgF9Ra6rCHni2lGjvvgd3G8gKhR76G2fXaOAtwDPEt/FkxRSFgumS15uvJB4QOYHO/jQqzGVIqAZsLWorjLSxZh86illzyPwwQLTWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Yb7e+m4Z; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Yb7e+m4Z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725362947; x=1756898947;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=bi6h5SylwUO2iArB0eAQ7jh3H4qvqEZDTEmd2FGZpgE=;
  b=Yb7e+m4ZyO3hIvqqWV5SfJOSsqFF1/urfXm86spW0UgqZK5WrmE1yAeZ
   TKhDPHCXkYlUm+LeRTnx390LMHOIaMDUDL8egeRlrBtKsyhOOCuLvy3X1
   8kZpOOZ4ft2JKL03rDP6rmhQcghzWhjcj4zSvsuIhtVtVEogC4hbbOVWP
   DUR/y7K2gD4yTOKY9uwYcheFv3BCiPkqzSB1T+ekKHjkPS29ZjPswNxOx
   Ez18ntrwDOJAUQvocIoBqjc/9F53loHdvX7GOZFav9rfH0idptQZ38inU
   A+IjzN6RCgNdRDzedzY4G2bcamvxgKTSITU43ORdGV5pgdrp7F0e+t8Z0
   w==;
X-CSE-ConnectionGUID: HctfwEHeSJ+Z5vdfnMFbfQ==
X-CSE-MsgGUID: uauEWVhbQVms84/VxclGwg==
X-IronPort-AV: E=McAfee;i="6700,10204,11183"; a="35112146"
X-IronPort-AV: E=Sophos;i="6.10,198,1719903600"; 
   d="scan'208";a="35112146"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2024 04:29:06 -0700
X-CSE-ConnectionGUID: I5yJZ+kRS2OCZd4q6DzHMw==
X-CSE-MsgGUID: MlCa4hRDRGaEnSbLOwPHGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,198,1719903600"; 
   d="scan'208";a="69669365"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 03 Sep 2024 04:29:00 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1slRiT-0006ZO-1X;
	Tue, 03 Sep 2024 11:28:57 +0000
Date: Tue, 3 Sep 2024 19:28:14 +0800
From: kernel test robot <lkp@intel.com>
To: Suren Baghdasaryan <surenb@google.com>, akpm@linux-foundation.org
Cc: oe-kbuild-all@lists.linux.dev, kent.overstreet@linux.dev,
	corbet@lwn.net, arnd@arndb.de, mcgrof@kernel.org, rppt@kernel.org,
	paulmck@kernel.org, thuth@redhat.com, tglx@linutronix.de,
	bp@alien8.de, xiongwei.song@windriver.com, ardb@kernel.org,
	david@redhat.com, vbabka@suse.cz, mhocko@suse.com,
	hannes@cmpxchg.org, roman.gushchin@linux.dev, dave@stgolabs.net,
	willy@infradead.org, liam.howlett@oracle.com,
	pasha.tatashin@soleen.com, souravpanda@google.com,
	keescook@chromium.org, dennis@kernel.org, jhubbard@nvidia.com,
	yuzhao@google.com, vvvvvv@google.com, rostedt@goodmis.org,
	iamjoonsoo.kim@lge.com, rientjes@google.com
Subject: Re: [PATCH v2 6/6] alloc_tag: config to store page allocation tag
 refs in page flags
Message-ID: <202409031928.8Eb27aSp-lkp@intel.com>
References: <20240902044128.664075-7-surenb@google.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240902044128.664075-7-surenb@google.com>

Hi Suren,

kernel test robot noticed the following build errors:

[auto build test ERROR on 18d35b7e30d5a217ff1cc976bb819e1aa2873301]

url:    https://github.com/intel-lab-lkp/linux/commits/Suren-Baghdasaryan/maple_tree-add-mas_for_each_rev-helper/20240902-124322
base:   18d35b7e30d5a217ff1cc976bb819e1aa2873301
patch link:    https://lore.kernel.org/r/20240902044128.664075-7-surenb%40google.com
patch subject: [PATCH v2 6/6] alloc_tag: config to store page allocation tag refs in page flags
config: m68k-randconfig-r131-20240903 (https://download.01.org/0day-ci/archive/20240903/202409031928.8Eb27aSp-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 14.1.0
reproduce: (https://download.01.org/0day-ci/archive/20240903/202409031928.8Eb27aSp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409031928.8Eb27aSp-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/mmzone.h:20,
                    from include/linux/topology.h:33,
                    from include/linux/irq.h:19,
                    from include/asm-generic/hardirq.h:17,
                    from ./arch/m68k/include/generated/asm/hardirq.h:1,
                    from include/linux/hardirq.h:11,
                    from include/linux/interrupt.h:11,
                    from include/linux/kernel_stat.h:8,
                    from arch/m68k/kernel/asm-offsets.c:16:
>> include/linux/page-flags-layout.h:112:2: error: #error "Not enough bits in page flags"
     112 | #error "Not enough bits in page flags"
         |  ^~~~~
   make[3]: *** [scripts/Makefile.build:117: arch/m68k/kernel/asm-offsets.s] Error 1
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1193: prepare0] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:224: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:224: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +112 include/linux/page-flags-layout.h

bbeae5b05ef6e4 Peter Zijlstra     2013-02-22  109  
ec1c86b25f4bdd Yu Zhao            2022-09-18  110  #if ZONES_WIDTH + LRU_GEN_WIDTH + SECTIONS_WIDTH + NODES_WIDTH + \
11f61468666eee Suren Baghdasaryan 2024-09-01  111  	KASAN_TAG_WIDTH + ALLOC_TAG_REF_WIDTH + LAST_CPUPID_WIDTH > BITS_PER_LONG - NR_PAGEFLAGS
1587db62d8c0db Yu Zhao            2021-04-29 @112  #error "Not enough bits in page flags"
75980e97daccfc Peter Zijlstra     2013-02-22  113  #endif
75980e97daccfc Peter Zijlstra     2013-02-22  114  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
