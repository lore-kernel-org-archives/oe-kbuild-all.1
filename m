Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA05414C5A4
	for <oe-kbuild-all@lists.linux.dev>; Fri, 30 Aug 2024 08:16:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725005762; cv=none; b=gx3KKjWzLYk69iNFyrBuGuNGck0ALXKi5iXUgLhrCI0S5der5tqs4wjbZnadxHEbvZYM/dnMgur25K1uZa/91PzXG5X0a4WOompDIv/lT4EtZoIGeR3kaeelKWr1XfKuiF6qLV4/nZOM4pYv/scVRDHT2tcM2Yp+0omue9v16ew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725005762; c=relaxed/simple;
	bh=ebkL8J4Oqx2ECRIQ+clOwgiJ8Rg06lXBtvlR7DYT7d0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EcZpSEt3CbCv43JR+IYYycHkz8kkpXFr44NL9B1OC5I7uOc8uoh0CSNS7nCk0lL9G1pyq739KewBswsAVSzYMrEHgjJ0TUjx3/5/nLBhP7yyV/LFzbHIJxGVhzP9F+Kt4fXV7O2TYuFJ8cUbwqe6BXzY6WGxFHqKE4o+ats1fMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nKm0gjnD; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nKm0gjnD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725005761; x=1756541761;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ebkL8J4Oqx2ECRIQ+clOwgiJ8Rg06lXBtvlR7DYT7d0=;
  b=nKm0gjnDr3hhQMOgHUC3df7enYXnnqeuOoedExBrRhJ0WNBUaamBP5o4
   zwzY5apkO89yF9K9fidGd7v1u6c8HcFYJyBzPwloridDL2gvpUKAfzAxE
   I1u5HeB/D4KNeBgrYlbz+EYYEr8MAu6D7s5eev+k2cx2iHpQRC03vKBE/
   HRlkgMAovptwNnTADOLZxLvMZACzwC68Sck4lrN3xQSXI+YYqtI+DbWJx
   tn249QPrDW2U/QU+qyuWYdZmZaaY7DNxeJfXlwpbuXaO+T0LFAJZTH0B7
   D03NJEIlMtW/rsJavF3+JN4y/pkMU5vNzrvSly00616o7BGggXc56MToi
   w==;
X-CSE-ConnectionGUID: 4JCkleC2RbuLTqNC9SWdbQ==
X-CSE-MsgGUID: OMLp2B9CSmKztmQFYQxNQA==
X-IronPort-AV: E=McAfee;i="6700,10204,11179"; a="26533344"
X-IronPort-AV: E=Sophos;i="6.10,188,1719903600"; 
   d="scan'208";a="26533344"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2024 01:16:00 -0700
X-CSE-ConnectionGUID: iZyU1dcoS/y3d+fFRI+DGw==
X-CSE-MsgGUID: EwJPAu0fRHO1fBBC1K9rNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,188,1719903600"; 
   d="scan'208";a="64568782"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 30 Aug 2024 01:16:00 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sjwnV-0001FG-04;
	Fri, 30 Aug 2024 08:15:57 +0000
Date: Fri, 30 Aug 2024 16:15:47 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Brauner <brauner@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH] [RFC] mm: add kmem_cache_create_rcu()
Message-ID: <202408301614.aLcb90z7-lkp@intel.com>
References: <20240826-okkupieren-nachdenken-d88ac627e9bc@brauner>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240826-okkupieren-nachdenken-d88ac627e9bc@brauner>

Hi Christian,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on next-20240826]
[cannot apply to akpm-mm/mm-everything linus/master vbabka-slab/for-next v6.11-rc5 v6.11-rc4 v6.11-rc3 v6.11-rc5]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Christian-Brauner/mm-add-kmem_cache_create_rcu/20240827-001335
base:   next-20240826
patch link:    https://lore.kernel.org/r/20240826-okkupieren-nachdenken-d88ac627e9bc%40brauner
patch subject: [PATCH] [RFC] mm: add kmem_cache_create_rcu()
config: openrisc-allnoconfig (https://download.01.org/0day-ci/archive/20240830/202408301614.aLcb90z7-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240830/202408301614.aLcb90z7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408301614.aLcb90z7-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/slab_common.c:299: warning: Function parameter or struct member 'offset' not described in 'do_kmem_cache_create_usercopy'
>> mm/slab_common.c:299: warning: expecting prototype for kmem_cache_create_usercopy(). Prototype was for do_kmem_cache_create_usercopy() instead


vim +299 mm/slab_common.c

4590685546a374 Christoph Lameter 2012-11-28  264  
f496990f1f4b1d Mike Rapoport     2018-12-06  265  /**
f496990f1f4b1d Mike Rapoport     2018-12-06  266   * kmem_cache_create_usercopy - Create a cache with a region suitable
f496990f1f4b1d Mike Rapoport     2018-12-06  267   * for copying to userspace
039363f38bfe5f Christoph Lameter 2012-07-06  268   * @name: A string which is used in /proc/slabinfo to identify this cache.
039363f38bfe5f Christoph Lameter 2012-07-06  269   * @size: The size of objects to be created in this cache.
039363f38bfe5f Christoph Lameter 2012-07-06  270   * @align: The required alignment for the objects.
039363f38bfe5f Christoph Lameter 2012-07-06  271   * @flags: SLAB flags
8eb8284b412906 David Windsor     2017-06-10  272   * @useroffset: Usercopy region offset
8eb8284b412906 David Windsor     2017-06-10  273   * @usersize: Usercopy region size
039363f38bfe5f Christoph Lameter 2012-07-06  274   * @ctor: A constructor for the objects.
039363f38bfe5f Christoph Lameter 2012-07-06  275   *
039363f38bfe5f Christoph Lameter 2012-07-06  276   * Cannot be called within a interrupt, but can be interrupted.
039363f38bfe5f Christoph Lameter 2012-07-06  277   * The @ctor is run when new pages are allocated by the cache.
039363f38bfe5f Christoph Lameter 2012-07-06  278   *
039363f38bfe5f Christoph Lameter 2012-07-06  279   * The flags are
039363f38bfe5f Christoph Lameter 2012-07-06  280   *
039363f38bfe5f Christoph Lameter 2012-07-06  281   * %SLAB_POISON - Poison the slab with a known test pattern (a5a5a5a5)
039363f38bfe5f Christoph Lameter 2012-07-06  282   * to catch references to uninitialised memory.
039363f38bfe5f Christoph Lameter 2012-07-06  283   *
f496990f1f4b1d Mike Rapoport     2018-12-06  284   * %SLAB_RED_ZONE - Insert `Red` zones around the allocated memory to check
039363f38bfe5f Christoph Lameter 2012-07-06  285   * for buffer overruns.
039363f38bfe5f Christoph Lameter 2012-07-06  286   *
039363f38bfe5f Christoph Lameter 2012-07-06  287   * %SLAB_HWCACHE_ALIGN - Align the objects in this cache to a hardware
039363f38bfe5f Christoph Lameter 2012-07-06  288   * cacheline.  This can be beneficial if you're counting cycles as closely
039363f38bfe5f Christoph Lameter 2012-07-06  289   * as davem.
f496990f1f4b1d Mike Rapoport     2018-12-06  290   *
f496990f1f4b1d Mike Rapoport     2018-12-06  291   * Return: a pointer to the cache on success, NULL on failure.
039363f38bfe5f Christoph Lameter 2012-07-06  292   */
e09e2ae041c2e3 Christian Brauner 2024-08-26  293  static struct kmem_cache *
e09e2ae041c2e3 Christian Brauner 2024-08-26  294  do_kmem_cache_create_usercopy(const char *name,
e09e2ae041c2e3 Christian Brauner 2024-08-26  295  		  unsigned int size, unsigned int offset,
e09e2ae041c2e3 Christian Brauner 2024-08-26  296  		  unsigned int align, slab_flags_t flags,
7bbdb81ee3de73 Alexey Dobriyan   2018-04-05  297  		  unsigned int useroffset, unsigned int usersize,
8eb8284b412906 David Windsor     2017-06-10  298  		  void (*ctor)(void *))
039363f38bfe5f Christoph Lameter 2012-07-06 @299  {
40911a798b5abb Alexandru Moise   2015-11-05  300  	struct kmem_cache *s = NULL;
3dec16ea38afce Andrzej Hajda     2015-02-13  301  	const char *cache_name;
3965fc36522446 Vladimir Davydov  2014-01-23  302  	int err;
039363f38bfe5f Christoph Lameter 2012-07-06  303  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
