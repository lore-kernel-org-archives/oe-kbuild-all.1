Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8920A1B12E9
	for <oe-kbuild-all@lists.linux.dev>; Tue,  3 Sep 2024 11:18:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725362288; cv=none; b=fJZfAThHGCQgaxCtpyPO6YmmEEVy2OeIToNseF6CRTE2cH03/1XdDQTIW7tMVfYfdDNZuO/YVYTshjc9MjCFdTmoz+E6k3hodXUKwpNZb1FXMLGJ+gd7QU7xwq8rHccxjzfSy3LvxSjoBXwS7Hl2QQWWlE5Jm2GWpmDdWDTM9K8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725362288; c=relaxed/simple;
	bh=K4Yrq/tuu9ykDRnblS45Hz/vYndsr9+Aaw9mdKSa/Tc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A3cMacuIKb5TfghPENXP2UJTJkcatobhNfld7KaTVpEz/wvwXocLaHb3mR4R6rYL8sgwyFs5zuMC+ojWqKoAw3fv5DmfmDQTonqZzflCrlJgsgsDYzegOED/yFeaD2q0uPo8uRwLOJT6y1YaWQcK5p/Hky0vsNXH3lQRsA9fVkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AJ/qtJFS; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AJ/qtJFS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725362286; x=1756898286;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=K4Yrq/tuu9ykDRnblS45Hz/vYndsr9+Aaw9mdKSa/Tc=;
  b=AJ/qtJFSKCGuwrsgyJxvVIXsu/C2Hg09a7riy6lpiewSlt/aTYPMR/AH
   w6ClZMHoIVBPEcT/Jpt6E/IsaXj/8xURh3tbq6lwadjHi7mFhQS31HxD1
   2vbpyUJs4rB2ZGzz/Bd6sTDxTuJy7EKNC8vkd1mgVUenrn14Khgnk08Rx
   PCyEYK8+mMsUQnucBLuhFb3TUzlnnpVr8b3i+GhIFAShA+4zQ0CtITd2q
   e3JnjVoTvb+h/q4TcLBKVpj2M8G1mvlTn2pYU/69XiLzXGOs1aoW6MSY/
   5wwZA+t3ySYe1cmrOdGMH6dy8U6AMUi1QNsvypodSYWu1AZkPbUXdDaGx
   g==;
X-CSE-ConnectionGUID: r0hzKy/eR9K75knczHE+3g==
X-CSE-MsgGUID: ixjYdRsMSPylXbxzWljs+Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11183"; a="24106766"
X-IronPort-AV: E=Sophos;i="6.10,198,1719903600"; 
   d="scan'208";a="24106766"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2024 04:18:05 -0700
X-CSE-ConnectionGUID: ykD7Ig2gSnO9opK+NPbsaA==
X-CSE-MsgGUID: nuAC8lAEToGp443l/kUXwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,198,1719903600"; 
   d="scan'208";a="88118253"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 03 Sep 2024 04:17:58 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1slRXo-0006Xw-2D;
	Tue, 03 Sep 2024 11:17:56 +0000
Date: Tue, 3 Sep 2024 19:17:55 +0800
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
Message-ID: <202409031840.8bM58SRg-lkp@intel.com>
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
config: hexagon-randconfig-r113-20240903 (https://download.01.org/0day-ci/archive/20240903/202409031840.8bM58SRg-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project dc19b59ea2502193c0e7bc16bb7d711c8053edcf)
reproduce: (https://download.01.org/0day-ci/archive/20240903/202409031840.8bM58SRg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409031840.8bM58SRg-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/hexagon/kernel/asm-offsets.c:12:
   In file included from include/linux/compat.h:15:
   In file included from include/linux/socket.h:8:
   In file included from include/linux/uio.h:10:
   In file included from include/linux/mm_types.h:18:
>> include/linux/page-flags-layout.h:112:2: error: "Not enough bits in page flags"
     112 | #error "Not enough bits in page flags"
         |  ^
   In file included from arch/hexagon/kernel/asm-offsets.c:12:
   In file included from include/linux/compat.h:17:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:98:11: warning: array index 3 is past the end of the array (that has type 'unsigned long[2]') [-Warray-bounds]
      98 |                 return (set->sig[3] | set->sig[2] |
         |                         ^        ~
   include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
      62 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/hexagon/kernel/asm-offsets.c:12:
   In file included from include/linux/compat.h:17:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:98:25: warning: array index 2 is past the end of the array (that has type 'unsigned long[2]') [-Warray-bounds]
      98 |                 return (set->sig[3] | set->sig[2] |
         |                                       ^        ~
   include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
      62 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/hexagon/kernel/asm-offsets.c:12:
   In file included from include/linux/compat.h:17:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:114:11: warning: array index 3 is past the end of the array (that has type 'const unsigned long[2]') [-Warray-bounds]
     114 |                 return  (set1->sig[3] == set2->sig[3]) &&
         |                          ^         ~
   include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
      62 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/hexagon/kernel/asm-offsets.c:12:
   In file included from include/linux/compat.h:17:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:114:27: warning: array index 3 is past the end of the array (that has type 'const unsigned long[2]') [-Warray-bounds]
     114 |                 return  (set1->sig[3] == set2->sig[3]) &&
         |                                          ^         ~
   include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
      62 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/hexagon/kernel/asm-offsets.c:12:
   In file included from include/linux/compat.h:17:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:115:5: warning: array index 2 is past the end of the array (that has type 'const unsigned long[2]') [-Warray-bounds]
     115 |                         (set1->sig[2] == set2->sig[2]) &&
         |                          ^         ~
   include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
      62 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/hexagon/kernel/asm-offsets.c:12:
   In file included from include/linux/compat.h:17:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:115:21: warning: array index 2 is past the end of the array (that has type 'const unsigned long[2]') [-Warray-bounds]
     115 |                         (set1->sig[2] == set2->sig[2]) &&
         |                                          ^         ~
   include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
      62 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/hexagon/kernel/asm-offsets.c:12:
   In file included from include/linux/compat.h:17:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:157:1: warning: array index 3 is past the end of the array (that has type 'const unsigned long[2]') [-Warray-bounds]
     157 | _SIG_SET_BINOP(sigorsets, _sig_or)
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/signal.h:138:8: note: expanded from macro '_SIG_SET_BINOP'
     138 |                 a3 = a->sig[3]; a2 = a->sig[2];                         \
         |                      ^      ~
   include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
      62 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/hexagon/kernel/asm-offsets.c:12:
   In file included from include/linux/compat.h:17:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:157:1: warning: array index 2 is past the end of the array (that has type 'const unsigned long[2]') [-Warray-bounds]
     157 | _SIG_SET_BINOP(sigorsets, _sig_or)
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/signal.h:138:24: note: expanded from macro '_SIG_SET_BINOP'
     138 |                 a3 = a->sig[3]; a2 = a->sig[2];                         \


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
