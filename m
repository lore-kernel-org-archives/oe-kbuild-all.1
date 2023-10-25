Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E39431369
	for <oe-kbuild-all@lists.linux.dev>; Wed, 25 Oct 2023 00:59:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dC6miXmn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698195590; x=1729731590;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=9lo1TOKya/7fnMRTGOVzKybgzv61sSnF0Sbry01J4V8=;
  b=dC6miXmn+sSZ09xaEf5Snqwck/czibuGFHfOhFLaBvLyOqU7FxTuaJpD
   DHxbYkODgAPuR3/W8TIQ/pZfyvvY2keawXLHiRXDrcI/MJXWR130haUNX
   U1FXhGzhyGiEzLaRDS5MirP0k9Sq+LgzFlq/Y/ewI8SRr77NWYKuG6SMX
   erXqLKmB63RjwsAsChHJLYrDeb7ykm4Q9fwXiLw6YXjs5P33/Eh4Jbu3v
   LQgDNfX/x3f3Pa3guf0NDX/J7ypJuZOqvwG/cmv0O8PuH2kYBhbiOHoU4
   TGePnYPar13QAkL26ULm9UtpgQVMGfrhnGVpuyno49lHL5jHYEUzsrKzQ
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10873"; a="453681158"
X-IronPort-AV: E=Sophos;i="6.03,249,1694761200"; 
   d="scan'208";a="453681158"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2023 17:59:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10873"; a="758693725"
X-IronPort-AV: E=Sophos;i="6.03,249,1694761200"; 
   d="scan'208";a="758693725"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 24 Oct 2023 17:59:38 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qvSFD-0008TH-1Z;
	Wed, 25 Oct 2023 00:59:35 +0000
Date: Wed, 25 Oct 2023 08:58:50 +0800
From: kernel test robot <lkp@intel.com>
To: Suren Baghdasaryan <surenb@google.com>, akpm@linux-foundation.org
Cc: oe-kbuild-all@lists.linux.dev, kent.overstreet@linux.dev,
	mhocko@suse.com, vbabka@suse.cz, hannes@cmpxchg.org,
	roman.gushchin@linux.dev, mgorman@suse.de, dave@stgolabs.net,
	willy@infradead.org, liam.howlett@oracle.com, corbet@lwn.net,
	void@manifault.com, peterz@infradead.org, juri.lelli@redhat.com,
	ldufour@linux.ibm.com, catalin.marinas@arm.com, will@kernel.org,
	arnd@arndb.de, tglx@linutronix.de, mingo@redhat.com,
	dave.hansen@linux.intel.com, x86@kernel.org, peterx@redhat.com,
	david@redhat.com, axboe@kernel.dk, mcgrof@kernel.org,
	masahiroy@kernel.org, nathan@kernel.org, dennis@kernel.org,
	tj@kernel.org
Subject: Re: [PATCH v2 33/39] mm: vmalloc: Enable memory allocation profiling
Message-ID: <202310250856.a18sorff-lkp@intel.com>
References: <20231024134637.3120277-34-surenb@google.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231024134637.3120277-34-surenb@google.com>

Hi Suren,

kernel test robot noticed the following build warnings:

[auto build test WARNING on vbabka-slab/for-next]
[also build test WARNING on kees/for-next/hardening linus/master v6.6-rc7]
[cannot apply to akpm-mm/mm-everything next-20231024]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Suren-Baghdasaryan/lib-string_helpers-Add-flags-param-to-string_get_size/20231024-215116
base:   git://git.kernel.org/pub/scm/linux/kernel/git/vbabka/slab.git for-next
patch link:    https://lore.kernel.org/r/20231024134637.3120277-34-surenb%40google.com
patch subject: [PATCH v2 33/39] mm: vmalloc: Enable memory allocation profiling
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20231025/202310250856.a18sorff-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231025/202310250856.a18sorff-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310250856.a18sorff-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/util.c:724: warning: expecting prototype for __vcalloc(). Prototype was for __vcalloc_noprof() instead
--
>> mm/vmalloc.c:3417: warning: expecting prototype for vmalloc(). Prototype was for vmalloc_noprof() instead
>> mm/vmalloc.c:3436: warning: expecting prototype for vmalloc_huge(). Prototype was for vmalloc_huge_noprof() instead
>> mm/vmalloc.c:3473: warning: expecting prototype for vmalloc_user(). Prototype was for vmalloc_user_noprof() instead


vim +724 mm/util.c

a8749a35c39903 Paolo Bonzini   2022-03-08  716  
a8749a35c39903 Paolo Bonzini   2022-03-08  717  /**
a8749a35c39903 Paolo Bonzini   2022-03-08  718   * __vcalloc - allocate and zero memory for a virtually contiguous array.
a8749a35c39903 Paolo Bonzini   2022-03-08  719   * @n: number of elements.
a8749a35c39903 Paolo Bonzini   2022-03-08  720   * @size: element size.
a8749a35c39903 Paolo Bonzini   2022-03-08  721   * @flags: the type of memory to allocate (see kmalloc).
a8749a35c39903 Paolo Bonzini   2022-03-08  722   */
d0e9eb4df906ad Kent Overstreet 2023-10-24  723  void *__vcalloc_noprof(size_t n, size_t size, gfp_t flags)
a8749a35c39903 Paolo Bonzini   2022-03-08 @724  {
a8749a35c39903 Paolo Bonzini   2022-03-08  725  	return __vmalloc_array(n, size, flags | __GFP_ZERO);
a8749a35c39903 Paolo Bonzini   2022-03-08  726  }
d0e9eb4df906ad Kent Overstreet 2023-10-24  727  EXPORT_SYMBOL(__vcalloc_noprof);
a8749a35c39903 Paolo Bonzini   2022-03-08  728  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
