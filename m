Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09A5E1B283
	for <oe-kbuild-all@lists.linux.dev>; Tue, 24 Oct 2023 22:40:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LW2LIf47"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698187242; x=1729723242;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=q3Ok4428bbOveyJ+wKgLVB2cJLfK2vPLdI3UCmvgUhM=;
  b=LW2LIf47xjdnjJxltR9qRLplq+rbXeuUq8Nw2jIyi7ndbK9R7nFagfcQ
   i38BQhHKIUm5BwfUfnKBCOEUoeZ4SIU3YXexhX+KqyCi7lSlFULFDaxXd
   9sID/SR4KtTzBJCYXaF/eZpZw4PxxekV/bWjWAco1o+Ldja3tJrkPk6BP
   SiaWJC8pBiHttpaIfY7TyZQZmTzDloVAQ8W/8JPUn5ndN+aFrxJ3SlqLz
   YPQeZUppZHoJImBUH1wGlJdM3Yh79/rdh/sTVY5R8TK/gVqUOSq5jI6mI
   QsLuWG8zyqMtdr+PoiNT5I+WIxhKOCdyJurjrgaN5apfBioTlP2Mc/qqN
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10873"; a="366537255"
X-IronPort-AV: E=Sophos;i="6.03,248,1694761200"; 
   d="scan'208";a="366537255"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2023 15:40:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10873"; a="932184988"
X-IronPort-AV: E=Sophos;i="6.03,248,1694761200"; 
   d="scan'208";a="932184988"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 24 Oct 2023 15:40:33 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qvQ4c-0008MX-2D;
	Tue, 24 Oct 2023 22:40:30 +0000
Date: Wed, 25 Oct 2023 06:40:09 +0800
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
Subject: Re: [PATCH v2 24/39] mm/slab: enable slab allocation tagging for
 kmalloc and friends
Message-ID: <202310250626.vQee6gZh-lkp@intel.com>
References: <20231024134637.3120277-25-surenb@google.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231024134637.3120277-25-surenb@google.com>

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
patch link:    https://lore.kernel.org/r/20231024134637.3120277-25-surenb%40google.com
patch subject: [PATCH v2 24/39] mm/slab: enable slab allocation tagging for kmalloc and friends
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20231025/202310250626.vQee6gZh-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231025/202310250626.vQee6gZh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310250626.vQee6gZh-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/slab_common.c:1488: warning: expecting prototype for krealloc(). Prototype was for krealloc_noprof() instead


vim +1488 mm/slab_common.c

928cec9cd6db53 Andrey Ryabinin     2014-08-06  1473  
928cec9cd6db53 Andrey Ryabinin     2014-08-06  1474  /**
928cec9cd6db53 Andrey Ryabinin     2014-08-06  1475   * krealloc - reallocate memory. The contents will remain unchanged.
928cec9cd6db53 Andrey Ryabinin     2014-08-06  1476   * @p: object to reallocate memory for.
928cec9cd6db53 Andrey Ryabinin     2014-08-06  1477   * @new_size: how many bytes of memory are required.
928cec9cd6db53 Andrey Ryabinin     2014-08-06  1478   * @flags: the type of memory to allocate.
928cec9cd6db53 Andrey Ryabinin     2014-08-06  1479   *
928cec9cd6db53 Andrey Ryabinin     2014-08-06  1480   * The contents of the object pointed to are preserved up to the
15d5de496bebfd Bartosz Golaszewski 2020-12-14  1481   * lesser of the new and old sizes (__GFP_ZERO flag is effectively ignored).
15d5de496bebfd Bartosz Golaszewski 2020-12-14  1482   * If @p is %NULL, krealloc() behaves exactly like kmalloc().  If @new_size
15d5de496bebfd Bartosz Golaszewski 2020-12-14  1483   * is 0 and @p is not a %NULL pointer, the object pointed to is freed.
a862f68a8b3600 Mike Rapoport       2019-03-05  1484   *
a862f68a8b3600 Mike Rapoport       2019-03-05  1485   * Return: pointer to the allocated memory or %NULL in case of error
928cec9cd6db53 Andrey Ryabinin     2014-08-06  1486   */
8f61679532ae15 Suren Baghdasaryan  2023-10-24  1487  void *krealloc_noprof(const void *p, size_t new_size, gfp_t flags)
928cec9cd6db53 Andrey Ryabinin     2014-08-06 @1488  {
928cec9cd6db53 Andrey Ryabinin     2014-08-06  1489  	void *ret;
928cec9cd6db53 Andrey Ryabinin     2014-08-06  1490  
928cec9cd6db53 Andrey Ryabinin     2014-08-06  1491  	if (unlikely(!new_size)) {
928cec9cd6db53 Andrey Ryabinin     2014-08-06  1492  		kfree(p);
928cec9cd6db53 Andrey Ryabinin     2014-08-06  1493  		return ZERO_SIZE_PTR;
928cec9cd6db53 Andrey Ryabinin     2014-08-06  1494  	}
928cec9cd6db53 Andrey Ryabinin     2014-08-06  1495  
928cec9cd6db53 Andrey Ryabinin     2014-08-06  1496  	ret = __do_krealloc(p, new_size, flags);
772a2fa50ffb2f Andrey Konovalov    2018-12-28  1497  	if (ret && kasan_reset_tag(p) != kasan_reset_tag(ret))
928cec9cd6db53 Andrey Ryabinin     2014-08-06  1498  		kfree(p);
928cec9cd6db53 Andrey Ryabinin     2014-08-06  1499  
928cec9cd6db53 Andrey Ryabinin     2014-08-06  1500  	return ret;
928cec9cd6db53 Andrey Ryabinin     2014-08-06  1501  }
8f61679532ae15 Suren Baghdasaryan  2023-10-24  1502  EXPORT_SYMBOL(krealloc_noprof);
928cec9cd6db53 Andrey Ryabinin     2014-08-06  1503  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
