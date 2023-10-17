Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D184541E54
	for <oe-kbuild-all@lists.linux.dev>; Tue, 17 Oct 2023 18:47:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UhBWulC6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697568452; x=1729104452;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9tkGT+oOcctyXjvWYiwLWvPw/lkkqWsX6qkZn+ImB+0=;
  b=UhBWulC6zsJUpi5VK3M2CAo3vjSISdkzbB7hojnK4mhKN6dpQIMresna
   zuGhp6+YjkbBtc9F2q4y0PpkC2pl8NxtEEepBBCDi5WqEt1TmANRFOdfk
   X6Dci3Id/2doaUQPjLvWqvmWkZ57YwLpOMKiuLcYBwX3ViqEFS34gLvoA
   mReq5hGgRbCzOL7d+tWGBVeGSCdPZiXYwswkxDcJ44BZvLKtDBYb4YsPZ
   WKfE0/nYymmnU89C6kgISjYHcclrSSdq1DHr6McwY2hOOTXcsTM2x9EVP
   Va97MyncZ0Z/+NWt8qqCLf9QoteTcEjA+ZMPLZk+ZPS1FxBZEU77NY9M8
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10866"; a="376227537"
X-IronPort-AV: E=Sophos;i="6.03,232,1694761200"; 
   d="scan'208";a="376227537"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Oct 2023 11:47:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10866"; a="749782248"
X-IronPort-AV: E=Sophos;i="6.03,232,1694761200"; 
   d="scan'208";a="749782248"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 17 Oct 2023 11:47:27 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qsp6D-0009yG-2V;
	Tue, 17 Oct 2023 18:47:25 +0000
Date: Wed, 18 Oct 2023 02:46:59 +0800
From: kernel test robot <lkp@intel.com>
To: "Darrick J. Wong" <darrick.wong@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [djwong-xfs:xfs-merge-6.7 47/51] mm/gup.c:1990:9: warning: 'c' may
 be used uninitialized
Message-ID: <202310180248.G4ZAdaTl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git xfs-merge-6.7
head:   eee9645e1bf5f060c24ab0f52b2fc55a3ff68ec6
commit: 5ae98786123bf094d32671f561362d74160288a5 [47/51] fs: turn on more warnings for the filesystem code we modify most
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20231018/202310180248.G4ZAdaTl-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231018/202310180248.G4ZAdaTl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310180248.G4ZAdaTl-lkp@intel.com/

Note: it may well be a FALSE warning. FWIW you are at least aware of it now.
http://gcc.gnu.org/wiki/Better_Uninitialized_Warnings

All warnings (new ones prefixed by >>):

   mm/gup.c: In function 'fault_in_readable':
>> mm/gup.c:1990:9: warning: 'c' may be used uninitialized [-Wmaybe-uninitialized]
    1990 |         (void)c;
         |         ^~~~~~~
   mm/gup.c:1970:23: note: 'c' declared here
    1970 |         volatile char c;
         |                       ^
--
   In file included from include/linux/string.h:20,
                    from include/linux/bitmap.h:11,
                    from include/linux/cpumask.h:12,
                    from include/linux/mm_types_task.h:14,
                    from include/linux/mm_types.h:5,
                    from include/linux/buildid.h:5,
                    from include/linux/module.h:14,
                    from mm/zswap.c:16:
   mm/zswap.c: In function 'zswap_load':
>> arch/alpha/include/asm/string.h:22:16: warning: 'tmp' may be used uninitialized [-Wmaybe-uninitialized]
      22 | #define memcpy __builtin_memcpy
   mm/zswap.c:1439:17: note: in expansion of macro 'memcpy'
    1439 |                 memcpy(tmp, src, entry->length);
         |                 ^~~~~~
   mm/zswap.c:1401:25: note: 'tmp' was declared here
    1401 |         u8 *src, *dst, *tmp;
         |                         ^~~
--
   In file included from mm/memcontrol.c:29:
   In function 'obj_cgroup_put',
       inlined from 'uncharge_folio' at mm/memcontrol.c:7173:3:
>> include/linux/memcontrol.h:809:9: warning: 'objcg' may be used uninitialized [-Wmaybe-uninitialized]
     809 |         percpu_ref_put(&objcg->refcnt);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/memcontrol.c: In function 'uncharge_folio':
   mm/memcontrol.c:7131:28: note: 'objcg' was declared here
    7131 |         struct obj_cgroup *objcg;
         |                            ^~~~~
   In file included from include/linux/atomic.h:82,
                    from include/linux/page_counter.h:5,
                    from mm/memcontrol.c:28:
   mm/memcontrol.c: In function 'mem_cgroup_iter':
   include/linux/atomic/atomic-instrumented.h:4743:21: warning: 'iter' may be used uninitialized [-Wmaybe-uninitialized]
    4743 |         typeof(ptr) __ai_ptr = (ptr); \
         |                     ^~~~~~~~
   mm/memcontrol.c:1185:23: note: in expansion of macro 'cmpxchg'
    1185 |                 (void)cmpxchg(&iter->position, pos, memcg);
         |                       ^~~~~~~
   mm/memcontrol.c:1105:41: note: 'iter' was declared here
    1105 |         struct mem_cgroup_reclaim_iter *iter;
         |                                         ^~~~


vim +/c +1990 mm/gup.c

cdd591fc86e38a Andreas Gruenbacher 2021-07-05  1958  
bb523b406c849e Andreas Gruenbacher 2021-08-02  1959  /**
bb523b406c849e Andreas Gruenbacher 2021-08-02  1960   * fault_in_readable - fault in userspace address range for reading
bb523b406c849e Andreas Gruenbacher 2021-08-02  1961   * @uaddr: start of user address range
bb523b406c849e Andreas Gruenbacher 2021-08-02  1962   * @size: size of user address range
bb523b406c849e Andreas Gruenbacher 2021-08-02  1963   *
bb523b406c849e Andreas Gruenbacher 2021-08-02  1964   * Returns the number of bytes not faulted in (like copy_to_user() and
bb523b406c849e Andreas Gruenbacher 2021-08-02  1965   * copy_from_user()).
bb523b406c849e Andreas Gruenbacher 2021-08-02  1966   */
bb523b406c849e Andreas Gruenbacher 2021-08-02  1967  size_t fault_in_readable(const char __user *uaddr, size_t size)
bb523b406c849e Andreas Gruenbacher 2021-08-02  1968  {
bb523b406c849e Andreas Gruenbacher 2021-08-02  1969  	const char __user *start = uaddr, *end;
bb523b406c849e Andreas Gruenbacher 2021-08-02  1970  	volatile char c;
bb523b406c849e Andreas Gruenbacher 2021-08-02  1971  
bb523b406c849e Andreas Gruenbacher 2021-08-02  1972  	if (unlikely(size == 0))
bb523b406c849e Andreas Gruenbacher 2021-08-02  1973  		return 0;
677b2a8c1f25db Christophe Leroy    2022-01-14  1974  	if (!user_read_access_begin(uaddr, size))
bb523b406c849e Andreas Gruenbacher 2021-08-02  1975  		return size;
677b2a8c1f25db Christophe Leroy    2022-01-14  1976  	if (!PAGE_ALIGNED(uaddr)) {
677b2a8c1f25db Christophe Leroy    2022-01-14  1977  		unsafe_get_user(c, uaddr, out);
bb523b406c849e Andreas Gruenbacher 2021-08-02  1978  		uaddr = (const char __user *)PAGE_ALIGN((unsigned long)uaddr);
bb523b406c849e Andreas Gruenbacher 2021-08-02  1979  	}
bb523b406c849e Andreas Gruenbacher 2021-08-02  1980  	end = (const char __user *)PAGE_ALIGN((unsigned long)start + size);
bb523b406c849e Andreas Gruenbacher 2021-08-02  1981  	if (unlikely(end < start))
bb523b406c849e Andreas Gruenbacher 2021-08-02  1982  		end = NULL;
bb523b406c849e Andreas Gruenbacher 2021-08-02  1983  	while (uaddr != end) {
677b2a8c1f25db Christophe Leroy    2022-01-14  1984  		unsafe_get_user(c, uaddr, out);
bb523b406c849e Andreas Gruenbacher 2021-08-02  1985  		uaddr += PAGE_SIZE;
bb523b406c849e Andreas Gruenbacher 2021-08-02  1986  	}
bb523b406c849e Andreas Gruenbacher 2021-08-02  1987  
bb523b406c849e Andreas Gruenbacher 2021-08-02  1988  out:
677b2a8c1f25db Christophe Leroy    2022-01-14  1989  	user_read_access_end();
bb523b406c849e Andreas Gruenbacher 2021-08-02 @1990  	(void)c;
bb523b406c849e Andreas Gruenbacher 2021-08-02  1991  	if (size > uaddr - start)
bb523b406c849e Andreas Gruenbacher 2021-08-02  1992  		return size - (uaddr - start);
bb523b406c849e Andreas Gruenbacher 2021-08-02  1993  	return 0;
bb523b406c849e Andreas Gruenbacher 2021-08-02  1994  }
bb523b406c849e Andreas Gruenbacher 2021-08-02  1995  EXPORT_SYMBOL(fault_in_readable);
bb523b406c849e Andreas Gruenbacher 2021-08-02  1996  

:::::: The code at line 1990 was first introduced by commit
:::::: bb523b406c849eef8f265a07cd7f320f1f177743 gup: Turn fault_in_pages_{readable,writeable} into fault_in_{readable,writeable}

:::::: TO: Andreas Gruenbacher <agruenba@redhat.com>
:::::: CC: Andreas Gruenbacher <agruenba@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
