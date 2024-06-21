Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D31CF16EB59
	for <oe-kbuild-all@lists.linux.dev>; Fri, 21 Jun 2024 09:54:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718963643; cv=none; b=aBTntv/siuhD7AtC9em6uDVVH3HHhLels+NVaWvpSlSnjIhDz2At+Yl4OZuudaIWdJjf3BYMaKMDhK+K09hzdjtRqXQA/IlFRIn+5/scuNRGFcdGxPNE6oPhlakxbJjye8+LZqzy//gg50DY2W3RMqx28p7C0eoqUzy+rwJrbgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718963643; c=relaxed/simple;
	bh=irezp0dtuEzLTK9BJax+ZN0XBsXDQf+zt2E3G9G+hbY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=B/qnlFWepnomqrR+PjuGecxPQI3M8MZhoaiCn/EvjtaYes7ajCtbWy0rBhtkGOSpKA61HvlyIjpMqNXsnRV0ea0qCBGiSZFwBk1SGvFRS02dEBslIpQCnOOfpeclkFvEuxgOIVUl/eApYQpsmo3yjFo5c6RQmTDM06TMBhxGJBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BL8mEZ+K; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BL8mEZ+K"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718963641; x=1750499641;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=irezp0dtuEzLTK9BJax+ZN0XBsXDQf+zt2E3G9G+hbY=;
  b=BL8mEZ+Kwx1tbNSaXICwX9BHR47pIHOCaVtRDdetpLILMnug0HuUtdTv
   v9lHmZvTnuSu38ZnbQpLFy0HiDSwhcJVPvNE/m4BagNisOx0KCH4rz9sj
   UAROHgMz9/9NhL8Z6NTblu9XoMFVa4r/d6FZqeJ6uTWwSv1DZj1GPU1mm
   OUO0R8VFjI2sbLbZL5EtaHbdX7cEGX2aItmL4x8T2oDJxXYasrMKwaGzr
   svG7iNRbOk1HvQQmKX7jVecURxoE7sgp9wcgxl3YI+I+AiRhzD0gG+DHY
   ZxBVDHQIRNkVw9HUdRibyzH17iWQQI8PSoUeWMtum73s0n4cO6I+YJZu1
   A==;
X-CSE-ConnectionGUID: f+M61hAGSeiDs1z1l2q4Hg==
X-CSE-MsgGUID: b08bHW3qRH222drs5yJLwg==
X-IronPort-AV: E=McAfee;i="6700,10204,11109"; a="15746675"
X-IronPort-AV: E=Sophos;i="6.08,254,1712646000"; 
   d="scan'208";a="15746675"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jun 2024 02:54:00 -0700
X-CSE-ConnectionGUID: 7I78hnJ2TJ+ESAPCqJR63Q==
X-CSE-MsgGUID: +SGQvG2pS42jrulSahTphA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,254,1712646000"; 
   d="scan'208";a="47062990"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 21 Jun 2024 02:53:58 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sKaxw-0008RS-0N;
	Fri, 21 Jun 2024 09:53:56 +0000
Date: Fri, 21 Jun 2024 17:53:00 +0800
From: kernel test robot <lkp@intel.com>
To: Kairui Song <kasong@tencent.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	"Huang, Ying" <ying.huang@intel.com>
Subject: [linux-next:master 6386/7397] mm/swap_state.c:256:46: error:
 'SWAP_ADDRESS_SPACE_MASK' undeclared
Message-ID: <202406211750.Ks4k82Gi-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   b992b79ca8bc336fa8e2c80990b5af80ed8f36fd
commit: 23c593d8220af52504cff1d99fbd39ab56a02c82 [6386/7397] mm/swap: reduce swap cache search space
config: x86_64-randconfig-014-20240202 (https://download.01.org/0day-ci/archive/20240621/202406211750.Ks4k82Gi-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240621/202406211750.Ks4k82Gi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406211750.Ks4k82Gi-lkp@intel.com/

All errors (new ones prefixed by >>):

   mm/swap_state.c:65:6: error: redefinition of 'show_swap_cache_info'
      65 | void show_swap_cache_info(void)
         |      ^~~~~~~~~~~~~~~~~~~~
   In file included from mm/swap_state.c:27:
   mm/swap.h:104:20: note: previous definition of 'show_swap_cache_info' with type 'void(void)'
     104 | static inline void show_swap_cache_info(void)
         |                    ^~~~~~~~~~~~~~~~~~~~
   mm/swap_state.c:72:7: error: redefinition of 'get_shadow_from_swap_cache'
      72 | void *get_shadow_from_swap_cache(swp_entry_t entry)
         |       ^~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/swap.h:147:21: note: previous definition of 'get_shadow_from_swap_cache' with type 'void *(swp_entry_t)'
     147 | static inline void *get_shadow_from_swap_cache(swp_entry_t entry)
         |                     ^~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/swap_state.c:88:5: error: redefinition of 'add_to_swap_cache'
      88 | int add_to_swap_cache(struct folio *folio, swp_entry_t entry,
         |     ^~~~~~~~~~~~~~~~~
   mm/swap.h:152:19: note: previous definition of 'add_to_swap_cache' with type 'int(struct folio *, swp_entry_t,  gfp_t,  void **)' {aka 'int(struct folio *, swp_entry_t,  unsigned int,  void **)'}
     152 | static inline int add_to_swap_cache(struct folio *folio, swp_entry_t entry,
         |                   ^~~~~~~~~~~~~~~~~
   mm/swap_state.c: In function 'add_to_swap_cache':
   mm/swap_state.c:124:48: error: 'NR_SWAPCACHE' undeclared (first use in this function)
     124 |                 __lruvec_stat_mod_folio(folio, NR_SWAPCACHE, nr);
         |                                                ^~~~~~~~~~~~
   mm/swap_state.c:124:48: note: each undeclared identifier is reported only once for each function it appears in
   mm/swap_state.c: At top level:
   mm/swap_state.c:141:6: error: redefinition of '__delete_from_swap_cache'
     141 | void __delete_from_swap_cache(struct folio *folio,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~
   mm/swap.h:158:20: note: previous definition of '__delete_from_swap_cache' with type 'void(struct folio *, swp_entry_t,  void *)'
     158 | static inline void __delete_from_swap_cache(struct folio *folio,
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~
   mm/swap_state.c: In function '__delete_from_swap_cache':
   mm/swap_state.c:165:40: error: 'NR_SWAPCACHE' undeclared (first use in this function)
     165 |         __lruvec_stat_mod_folio(folio, NR_SWAPCACHE, -nr);
         |                                        ^~~~~~~~~~~~
   mm/swap_state.c: At top level:
   mm/swap_state.c:178:6: error: redefinition of 'add_to_swap'
     178 | bool add_to_swap(struct folio *folio)
         |      ^~~~~~~~~~~
   mm/swap.h:142:20: note: previous definition of 'add_to_swap' with type 'bool(struct folio *)' {aka '_Bool(struct folio *)'}
     142 | static inline bool add_to_swap(struct folio *folio)
         |                    ^~~~~~~~~~~
   mm/swap_state.c:235:6: error: redefinition of 'delete_from_swap_cache'
     235 | void delete_from_swap_cache(struct folio *folio)
         |      ^~~~~~~~~~~~~~~~~~~~~~
   mm/swap.h:163:20: note: previous definition of 'delete_from_swap_cache' with type 'void(struct folio *)'
     163 | static inline void delete_from_swap_cache(struct folio *folio)
         |                    ^~~~~~~~~~~~~~~~~~~~~~
   mm/swap_state.c:248:6: error: redefinition of 'clear_shadow_from_swap_cache'
     248 | void clear_shadow_from_swap_cache(int type, unsigned long begin,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/swap.h:167:20: note: previous definition of 'clear_shadow_from_swap_cache' with type 'void(int,  long unsigned int,  long unsigned int)'
     167 | static inline void clear_shadow_from_swap_cache(int type, unsigned long begin,
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/swap_state.c: In function 'clear_shadow_from_swap_cache':
>> mm/swap_state.c:256:46: error: 'SWAP_ADDRESS_SPACE_MASK' undeclared (first use in this function)
     256 |                 unsigned long index = curr & SWAP_ADDRESS_SPACE_MASK;
         |                                              ^~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/list_lru.h:14,
                    from include/linux/fs.h:13,
                    from include/linux/huge_mm.h:8,
                    from include/linux/mm.h:1120,
                    from mm/swap_state.c:10:
   mm/swap_state.c:263:67: error: 'SWAP_ADDRESS_SPACE_PAGES' undeclared (first use in this function)
     263 |                 xas_for_each(&xas, old, min(index + (end - curr), SWAP_ADDRESS_SPACE_PAGES)) {
         |                                                                   ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/xarray.h:1799:36: note: in definition of macro 'xas_for_each'
    1799 |         for (entry = xas_find(xas, max); entry; \
         |                                    ^~~
   include/linux/minmax.h:56:31: note: in expansion of macro '__is_constexpr'
      56 |         __builtin_choose_expr(__is_constexpr((x) - (y)),        \
         |                               ^~~~~~~~~~~~~~
   include/linux/minmax.h:85:25: note: in expansion of macro '__careful_cmp'
      85 | #define min(x, y)       __careful_cmp(min, x, y)
         |                         ^~~~~~~~~~~~~
   mm/swap_state.c:263:41: note: in expansion of macro 'min'
     263 |                 xas_for_each(&xas, old, min(index + (end - curr), SWAP_ADDRESS_SPACE_PAGES)) {
         |                                         ^~~
   include/linux/minmax.h:31:9: error: first argument to '__builtin_choose_expr' not a constant
      31 |         __builtin_choose_expr(__is_constexpr(is_signed_type(typeof(x))),        \
         |         ^~~~~~~~~~~~~~~~~~~~~
   include/linux/xarray.h:1799:36: note: in definition of macro 'xas_for_each'
    1799 |         for (entry = xas_find(xas, max); entry; \
         |                                    ^~~
   include/linux/build_bug.h:77:34: note: in expansion of macro '__static_assert'
      77 | #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
         |                                  ^~~~~~~~~~~~~~~
   include/linux/minmax.h:51:9: note: in expansion of macro 'static_assert'
      51 |         static_assert(__types_ok(x, y),                 \
         |         ^~~~~~~~~~~~~
   include/linux/minmax.h:39:28: note: in expansion of macro '__is_signed'
      39 |         (__is_signed(x) == __is_signed(y) ||                    \
         |                            ^~~~~~~~~~~
   include/linux/minmax.h:51:23: note: in expansion of macro '__types_ok'
      51 |         static_assert(__types_ok(x, y),                 \
         |                       ^~~~~~~~~~
   include/linux/minmax.h:58:17: note: in expansion of macro '__cmp_once'
      58 |                 __cmp_once(op, x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y)))
         |                 ^~~~~~~~~~
   include/linux/minmax.h:85:25: note: in expansion of macro '__careful_cmp'
      85 | #define min(x, y)       __careful_cmp(min, x, y)
         |                         ^~~~~~~~~~~~~
   mm/swap_state.c:263:41: note: in expansion of macro 'min'
     263 |                 xas_for_each(&xas, old, min(index + (end - curr), SWAP_ADDRESS_SPACE_PAGES)) {
         |                                         ^~~
   include/linux/minmax.h:31:9: error: first argument to '__builtin_choose_expr' not a constant
      31 |         __builtin_choose_expr(__is_constexpr(is_signed_type(typeof(x))),        \
         |         ^~~~~~~~~~~~~~~~~~~~~
   include/linux/xarray.h:1799:36: note: in definition of macro 'xas_for_each'
    1799 |         for (entry = xas_find(xas, max); entry; \
         |                                    ^~~
   include/linux/build_bug.h:77:34: note: in expansion of macro '__static_assert'
      77 | #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
         |                                  ^~~~~~~~~~~~~~~
   include/linux/minmax.h:51:9: note: in expansion of macro 'static_assert'
      51 |         static_assert(__types_ok(x, y),                 \
         |         ^~~~~~~~~~~~~
   include/linux/minmax.h:40:41: note: in expansion of macro '__is_signed'
      40 |                 __is_signed((x) + 0) == __is_signed((y) + 0) || \
         |                                         ^~~~~~~~~~~
   include/linux/minmax.h:51:23: note: in expansion of macro '__types_ok'
      51 |         static_assert(__types_ok(x, y),                 \
         |                       ^~~~~~~~~~
   include/linux/minmax.h:58:17: note: in expansion of macro '__cmp_once'
      58 |                 __cmp_once(op, x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y)))
         |                 ^~~~~~~~~~
   include/linux/minmax.h:85:25: note: in expansion of macro '__careful_cmp'
      85 | #define min(x, y)       __careful_cmp(min, x, y)
         |                         ^~~~~~~~~~~~~
   mm/swap_state.c:263:41: note: in expansion of macro 'min'
     263 |                 xas_for_each(&xas, old, min(index + (end - curr), SWAP_ADDRESS_SPACE_PAGES)) {
         |                                         ^~~
   include/linux/minmax.h:31:9: error: first argument to '__builtin_choose_expr' not a constant
      31 |         __builtin_choose_expr(__is_constexpr(is_signed_type(typeof(x))),        \
         |         ^~~~~~~~~~~~~~~~~~~~~
   include/linux/xarray.h:1799:36: note: in definition of macro 'xas_for_each'
    1799 |         for (entry = xas_find(xas, max); entry; \
         |                                    ^~~
   include/linux/build_bug.h:77:34: note: in expansion of macro '__static_assert'
      77 | #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
         |                                  ^~~~~~~~~~~~~~~
   include/linux/minmax.h:51:9: note: in expansion of macro 'static_assert'
      51 |         static_assert(__types_ok(x, y),                 \
         |         ^~~~~~~~~~~~~
   include/linux/minmax.h:36:53: note: in expansion of macro '__is_signed'
      36 |         (__builtin_choose_expr(__is_constexpr(x) && __is_signed(x), x, -1) >= 0)
         |                                                     ^~~~~~~~~~~
   include/linux/minmax.h:41:38: note: in expansion of macro '__is_noneg_int'
      41 |                 __is_noneg_int(x) || __is_noneg_int(y))
         |                                      ^~~~~~~~~~~~~~
   include/linux/minmax.h:51:23: note: in expansion of macro '__types_ok'
      51 |         static_assert(__types_ok(x, y),                 \
         |                       ^~~~~~~~~~
   include/linux/minmax.h:58:17: note: in expansion of macro '__cmp_once'
      58 |                 __cmp_once(op, x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y)))
         |                 ^~~~~~~~~~


vim +/SWAP_ADDRESS_SPACE_MASK +256 mm/swap_state.c

   247	
   248	void clear_shadow_from_swap_cache(int type, unsigned long begin,
   249					unsigned long end)
   250	{
   251		unsigned long curr = begin;
   252		void *old;
   253	
   254		for (;;) {
   255			swp_entry_t entry = swp_entry(type, curr);
 > 256			unsigned long index = curr & SWAP_ADDRESS_SPACE_MASK;
   257			struct address_space *address_space = swap_address_space(entry);
   258			XA_STATE(xas, &address_space->i_pages, index);
   259	
   260			xas_set_update(&xas, workingset_update_node);
   261	
   262			xa_lock_irq(&address_space->i_pages);
   263			xas_for_each(&xas, old, min(index + (end - curr), SWAP_ADDRESS_SPACE_PAGES)) {
   264				if (!xa_is_value(old))
   265					continue;
   266				xas_store(&xas, NULL);
   267			}
   268			xa_unlock_irq(&address_space->i_pages);
   269	
   270			/* search the next swapcache until we meet end */
   271			curr >>= SWAP_ADDRESS_SPACE_SHIFT;
   272			curr++;
   273			curr <<= SWAP_ADDRESS_SPACE_SHIFT;
   274			if (curr > end)
   275				break;
   276		}
   277	}
   278	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
