Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F09D342173
	for <oe-kbuild-all@lists.linux.dev>; Thu, 13 Aug 2026 10:49:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786618145; cv=none; b=QPVDWYw0lWNLkIUfCVghi5mbDJ1NjuOccDmI7QDF/KIQsJvoM1BV0bxv0up32eNwdPBiIQsxk03LkAmykuDM+F+gMr6BS7f+a9lCFptNeM6swjIEurZpCkKOdZhREdKyf2R5C12ZaR5pfweWPEBgwHCfj70FW8ofKdujgp5jGso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786618145; c=relaxed/simple;
	bh=ynz7mE6KyIit+twcZygZXOt9YxucR8842hs0y0rBafU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UTNCS5E61VTVqCWAZ2Ll8xFYIOJ7bcHjmTzxQqy6siuQ7DdpegiqdnjHeYyQtNE++er53AglY6KCtdz4P8gxAZ0P0RQoWsqq0AysuHyM1qlleHJeOIP59kxbb/++pkkBTlwFVzlbjmtEqU0bN67DnWLv9EhKbAfCWMBBQTv9lVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RRYoDgnc; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RRYoDgnc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786618142; x=1818154142;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ynz7mE6KyIit+twcZygZXOt9YxucR8842hs0y0rBafU=;
  b=RRYoDgnco7hoAi4ofHdt+shNEpHqZZt2f2j15iMJDW4W5VZWIHbtdM3U
   i+bTACVCS1bcRdcaAdRd5T1aFTPtwam5Z/xPZutV6R6+mMbIqUnfD4Yr2
   AtgxrJiAhexaEobq05RpABU+SUpKllPVjtwDj0Yz5c6hJZN7R/3fYF6uR
   xY062i5DmBrNEAJdUHB6UX4qzfEf+WOV2jLdr4xQHpC4o9TD5UNEGRvzo
   YMocks1Eqlrj7dre+T6+MgGFoe+khbuzbSDVs9XB60l4HyQhlL6rgV5oI
   lc1J7ErbZ/8Ec24o7hur4l6NKaus5qJ3bCbryChTe93O3yYSmzL6HeBGe
   Q==;
X-CSE-ConnectionGUID: NOzl5gNIQGOE+LhgHXRv6w==
X-CSE-MsgGUID: B9faDT/tTS6Eq/eZi/5DFA==
X-IronPort-AV: E=McAfee;i="6800,10657,11873"; a="87207197"
X-IronPort-AV: E=Sophos;i="6.25,221,1779174000"; 
   d="scan'208";a="87207197"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2026 03:49:01 -0700
X-CSE-ConnectionGUID: Btbc9NRgQ2OSIo/hp27IDA==
X-CSE-MsgGUID: LvPcGklxT9qw7JCQXvt/qQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,221,1779174000"; 
   d="scan'208";a="260628033"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 13 Aug 2026 03:48:59 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wuSzY-00000000Tjq-1la0;
	Thu, 13 Aug 2026 10:48:56 +0000
Date: Thu, 13 Aug 2026 18:47:57 +0800
From: kernel test robot <lkp@intel.com>
To: wangyufei <wangyufei@vivo.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC 1/1] writeback: add sysfs to config the number of writeback
 contexts
Message-ID: <202608131809.2ZEzONCi-lkp@intel.com>
References: <20250825122931.13037-2-wangyufei@vivo.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250825122931.13037-2-wangyufei@vivo.com>

Hi wangyufei,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on akpm-mm/mm-everything]
[also build test ERROR on linus/master v7.2-rc7 next-20260812]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/wangyufei/writeback-add-sysfs-to-config-the-number-of-writeback-contexts/20260813-143259
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20250825122931.13037-2-wangyufei%40vivo.com
patch subject: [RFC 1/1] writeback: add sysfs to config the number of writeback contexts
config: powerpc-allmodconfig (https://download.01.org/0day-ci/archive/20260813/202608131809.2ZEzONCi-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260813/202608131809.2ZEzONCi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608131809.2ZEzONCi-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from mm/filemap.c:33:
>> include/linux/backing-dev.h:118:58: warning: 'struct bdi_writeback_ctx' declared inside parameter list will not be visible outside of this definition or declaration
     118 | int bdi_wb_ctx_init(struct backing_dev_info *bdi, struct bdi_writeback_ctx *bdi_wb_ctx);
         |                                                          ^~~~~~~~~~~~~~~~~
   include/linux/backing-dev.h:119:59: warning: 'struct bdi_writeback_ctx' declared inside parameter list will not be visible outside of this definition or declaration
     119 | void bdi_wb_ctx_exit(struct backing_dev_info *bdi, struct bdi_writeback_ctx *bdi_wb_ctx);
         |                                                           ^~~~~~~~~~~~~~~~~
--
   In file included from mm/page-writeback.c:26:
>> include/linux/backing-dev.h:118:58: warning: 'struct bdi_writeback_ctx' declared inside parameter list will not be visible outside of this definition or declaration
     118 | int bdi_wb_ctx_init(struct backing_dev_info *bdi, struct bdi_writeback_ctx *bdi_wb_ctx);
         |                                                          ^~~~~~~~~~~~~~~~~
   include/linux/backing-dev.h:119:59: warning: 'struct bdi_writeback_ctx' declared inside parameter list will not be visible outside of this definition or declaration
     119 | void bdi_wb_ctx_exit(struct backing_dev_info *bdi, struct bdi_writeback_ctx *bdi_wb_ctx);
         |                                                           ^~~~~~~~~~~~~~~~~
   In file included from include/linux/kernel.h:27,
                    from mm/page-writeback.c:15:
   mm/page-writeback.c: In function '__bdi_set_wb_ctx':
>> mm/page-writeback.c:734:32: error: 'struct backing_dev_info' has no member named 'nr_wb_ctx'
     734 |         for (i = 0; i < min(bdi->nr_wb_ctx, nwritebacks); i++)
         |                                ^~
   include/linux/minmax.h:92:20: note: in definition of macro '__careful_cmp_once'
      92 |         auto ux = (x); auto uy = (y);                   \
         |                    ^
   include/linux/minmax.h:105:25: note: in expansion of macro '__careful_cmp'
     105 | #define min(x, y)       __careful_cmp(min, x, y)
         |                         ^~~~~~~~~~~~~
   mm/page-writeback.c:734:25: note: in expansion of macro 'min'
     734 |         for (i = 0; i < min(bdi->nr_wb_ctx, nwritebacks); i++)
         |                         ^~~
   In file included from <command-line>:
>> include/linux/compiler.h:165:17: error: '__UNIQUE_ID_x__697' undeclared (first use in this function); did you mean '__UNIQUE_ID_y__698'?
     165 |         __PASTE(__UNIQUE_ID_,                                   \
         |                 ^~~~~~~~~~~~
   include/linux/compiler_types.h:682:23: note: in definition of macro '__compiletime_assert'
     682 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:702:9: note: in expansion of macro '_compiletime_assert'
     702 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:40:37: note: in expansion of macro 'compiletime_assert'
      40 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:93:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      93 |         BUILD_BUG_ON_MSG(!__types_ok(ux, uy),           \
         |         ^~~~~~~~~~~~~~~~
   include/linux/minmax.h:49:25: note: in expansion of macro 'is_signed_type'
      49 | #define __sign_use(ux) (is_signed_type(typeof(ux)) ? \
         |                         ^~~~~~~~~~~~~~
   include/linux/minmax.h:75:10: note: in expansion of macro '__sign_use'
      75 |         (__sign_use(ux) & __sign_use(uy))
         |          ^~~~~~~~~~
   include/linux/minmax.h:93:27: note: in expansion of macro '__types_ok'
      93 |         BUILD_BUG_ON_MSG(!__types_ok(ux, uy),           \
         |                           ^~~~~~~~~~
   include/linux/minmax.h:98:9: note: in expansion of macro '__careful_cmp_once'
      98 |         __careful_cmp_once(op, x, y, __UNIQUE_ID(x_), __UNIQUE_ID(y_))
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:16:23: note: in expansion of macro '___PASTE'
      16 | #define __PASTE(a, b) ___PASTE(a, b)
         |                       ^~~~~~~~
   include/linux/compiler.h:165:9: note: in expansion of macro '__PASTE'
     165 |         __PASTE(__UNIQUE_ID_,                                   \
         |         ^~~~~~~
   include/linux/minmax.h:98:38: note: in expansion of macro '__UNIQUE_ID'
      98 |         __careful_cmp_once(op, x, y, __UNIQUE_ID(x_), __UNIQUE_ID(y_))
         |                                      ^~~~~~~~~~~
   include/linux/minmax.h:105:25: note: in expansion of macro '__careful_cmp'
     105 | #define min(x, y)       __careful_cmp(min, x, y)
         |                         ^~~~~~~~~~~~~
   mm/page-writeback.c:734:25: note: in expansion of macro 'min'
     734 |         for (i = 0; i < min(bdi->nr_wb_ctx, nwritebacks); i++)
         |                         ^~~
   include/linux/compiler.h:165:17: note: each undeclared identifier is reported only once for each function it appears in
   include/linux/compiler_types.h:682:23: note: in definition of macro '__compiletime_assert'
     682 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:702:9: note: in expansion of macro '_compiletime_assert'
     702 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:40:37: note: in expansion of macro 'compiletime_assert'
      40 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:93:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      93 |         BUILD_BUG_ON_MSG(!__types_ok(ux, uy),           \
         |         ^~~~~~~~~~~~~~~~
   include/linux/minmax.h:49:25: note: in expansion of macro 'is_signed_type'
      49 | #define __sign_use(ux) (is_signed_type(typeof(ux)) ? \
         |                         ^~~~~~~~~~~~~~
   include/linux/minmax.h:75:10: note: in expansion of macro '__sign_use'
      75 |         (__sign_use(ux) & __sign_use(uy))
         |          ^~~~~~~~~~
   include/linux/minmax.h:93:27: note: in expansion of macro '__types_ok'
      93 |         BUILD_BUG_ON_MSG(!__types_ok(ux, uy),           \
         |                           ^~~~~~~~~~
   include/linux/minmax.h:98:9: note: in expansion of macro '__careful_cmp_once'
      98 |         __careful_cmp_once(op, x, y, __UNIQUE_ID(x_), __UNIQUE_ID(y_))
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:16:23: note: in expansion of macro '___PASTE'
      16 | #define __PASTE(a, b) ___PASTE(a, b)
         |                       ^~~~~~~~
   include/linux/compiler.h:165:9: note: in expansion of macro '__PASTE'
     165 |         __PASTE(__UNIQUE_ID_,                                   \
         |         ^~~~~~~
   include/linux/minmax.h:98:38: note: in expansion of macro '__UNIQUE_ID'
      98 |         __careful_cmp_once(op, x, y, __UNIQUE_ID(x_), __UNIQUE_ID(y_))
         |                                      ^~~~~~~~~~~
   include/linux/minmax.h:105:25: note: in expansion of macro '__careful_cmp'
     105 | #define min(x, y)       __careful_cmp(min, x, y)
         |                         ^~~~~~~~~~~~~
   mm/page-writeback.c:734:25: note: in expansion of macro 'min'
     734 |         for (i = 0; i < min(bdi->nr_wb_ctx, nwritebacks); i++)
         |                         ^~~
>> mm/page-writeback.c:735:37: error: 'struct backing_dev_info' has no member named 'wb_ctx_arr'
     735 |                 new_ctx_arr[i] = bdi->wb_ctx_arr[i];
         |                                     ^~
   mm/page-writeback.c:737:21: error: 'struct backing_dev_info' has no member named 'nr_wb_ctx'
     737 |         for (i = bdi->nr_wb_ctx; i < nwritebacks; i++) {
         |                     ^~
   In file included from include/linux/workqueue.h:9,
                    from include/linux/srcu.h:21,
                    from include/linux/notifier.h:16,
                    from arch/powerpc/include/asm/uprobes.h:12,
                    from include/linux/uprobes.h:66,
                    from include/linux/mm_types.h:16,
                    from include/linux/mmzone.h:22,
                    from include/linux/gfp.h:7,
                    from include/linux/xarray.h:16,
                    from include/linux/list_lru.h:14,
                    from include/linux/fs/super_types.h:7,
                    from include/linux/fs/super.h:5,
                    from include/linux/fs.h:5,
                    from mm/page-writeback.c:19:
>> mm/page-writeback.c:739:40: error: invalid application of 'sizeof' to incomplete type 'struct bdi_writeback_ctx'
     739 |                         kzalloc(sizeof(struct bdi_writeback_ctx), GFP_KERNEL);
         |                                        ^~~~~~
   include/linux/alloc_tag.h:256:16: note: in definition of macro 'alloc_hooks_tag'
     256 |         typeof(_do_alloc) _res;                                         \
         |                ^~~~~~~~~
   include/linux/slab.h:1320:49: note: in expansion of macro 'alloc_hooks'
    1320 | #define kzalloc(size, flags)                    alloc_hooks(kzalloc_noprof(size, flags))
         |                                                 ^~~~~~~~~~~
   include/linux/slab.h:1320:61: note: in expansion of macro 'kzalloc_noprof'
    1320 | #define kzalloc(size, flags)                    alloc_hooks(kzalloc_noprof(size, flags))
         |                                                             ^~~~~~~~~~~~~~
   mm/page-writeback.c:739:25: note: in expansion of macro 'kzalloc'
     739 |                         kzalloc(sizeof(struct bdi_writeback_ctx), GFP_KERNEL);
         |                         ^~~~~~~
>> mm/page-writeback.c:739:40: error: invalid application of 'sizeof' to incomplete type 'struct bdi_writeback_ctx'
     739 |                         kzalloc(sizeof(struct bdi_writeback_ctx), GFP_KERNEL);
         |                                        ^~~~~~
   include/linux/alloc_tag.h:260:24: note: in definition of macro 'alloc_hooks_tag'
     260 |                 _res = _do_alloc;                                       \
         |                        ^~~~~~~~~
   include/linux/slab.h:1320:49: note: in expansion of macro 'alloc_hooks'
    1320 | #define kzalloc(size, flags)                    alloc_hooks(kzalloc_noprof(size, flags))
         |                                                 ^~~~~~~~~~~
   include/linux/slab.h:1320:61: note: in expansion of macro 'kzalloc_noprof'
    1320 | #define kzalloc(size, flags)                    alloc_hooks(kzalloc_noprof(size, flags))
         |                                                             ^~~~~~~~~~~~~~
   mm/page-writeback.c:739:25: note: in expansion of macro 'kzalloc'
     739 |                         kzalloc(sizeof(struct bdi_writeback_ctx), GFP_KERNEL);
         |                         ^~~~~~~
>> mm/page-writeback.c:739:40: error: invalid application of 'sizeof' to incomplete type 'struct bdi_writeback_ctx'
     739 |                         kzalloc(sizeof(struct bdi_writeback_ctx), GFP_KERNEL);
         |                                        ^~~~~~
   include/linux/alloc_tag.h:263:24: note: in definition of macro 'alloc_hooks_tag'
     263 |                 _res = _do_alloc;                                       \
         |                        ^~~~~~~~~
   include/linux/slab.h:1320:49: note: in expansion of macro 'alloc_hooks'
    1320 | #define kzalloc(size, flags)                    alloc_hooks(kzalloc_noprof(size, flags))
         |                                                 ^~~~~~~~~~~
   include/linux/slab.h:1320:61: note: in expansion of macro 'kzalloc_noprof'
    1320 | #define kzalloc(size, flags)                    alloc_hooks(kzalloc_noprof(size, flags))
         |                                                             ^~~~~~~~~~~~~~
   mm/page-writeback.c:739:25: note: in expansion of macro 'kzalloc'
     739 |                         kzalloc(sizeof(struct bdi_writeback_ctx), GFP_KERNEL);
         |                         ^~~~~~~
>> mm/page-writeback.c:738:34: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
     738 |                 new_ctx_arr[i] = (struct bdi_writeback_ctx *)
         |                                  ^
   mm/page-writeback.c:742:42: error: 'struct backing_dev_info' has no member named 'nr_wb_ctx'
     742 |                         while (--i >= bdi->nr_wb_ctx)
         |                                          ^~
>> mm/page-writeback.c:747:47: error: invalid use of undefined type 'struct bdi_writeback_ctx'
     747 |                 INIT_LIST_HEAD(&new_ctx_arr[i]->wb_list);
         |                                               ^~
   In file included from include/linux/swait.h:8,
                    from include/linux/completion.h:12,
                    from include/linux/shrinker.h:8,
                    from include/linux/list_lru.h:13:
   mm/page-writeback.c:748:52: error: invalid use of undefined type 'struct bdi_writeback_ctx'
     748 |                 init_waitqueue_head(&new_ctx_arr[i]->wb_waitq);
         |                                                    ^~
   include/linux/wait.h:68:40: note: in definition of macro 'init_waitqueue_head'
      68 |                 __init_waitqueue_head((wq_head), #wq_head, &__key);             \
         |                                        ^~~~~~~
   mm/page-writeback.c:751:21: error: 'struct backing_dev_info' has no member named 'nr_wb_ctx'
     751 |         for (i = bdi->nr_wb_ctx; i < nwritebacks; i++) {
         |                     ^~
>> mm/page-writeback.c:752:55: error: passing argument 2 of 'bdi_wb_ctx_init' from incompatible pointer type [-Wincompatible-pointer-types]
     752 |                 ret = bdi_wb_ctx_init(bdi, new_ctx_arr[i]);
         |                                            ~~~~~~~~~~~^~~
         |                                                       |
         |                                                       struct bdi_writeback_ctx *
   include/linux/backing-dev.h:118:77: note: expected 'struct bdi_writeback_ctx *' but argument is of type 'struct bdi_writeback_ctx *'
     118 | int bdi_wb_ctx_init(struct backing_dev_info *bdi, struct bdi_writeback_ctx *bdi_wb_ctx);
         |                                                   ~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~
   mm/page-writeback.c:754:42: error: 'struct backing_dev_info' has no member named 'nr_wb_ctx'
     754 |                         while (--i >= bdi->nr_wb_ctx) {
         |                                          ^~
>> mm/page-writeback.c:755:65: error: passing argument 2 of 'bdi_wb_ctx_exit' from incompatible pointer type [-Wincompatible-pointer-types]
     755 |                                 bdi_wb_ctx_exit(bdi, new_ctx_arr[i]);
         |                                                      ~~~~~~~~~~~^~~
         |                                                                 |
         |                                                                 struct bdi_writeback_ctx *
   include/linux/backing-dev.h:119:78: note: expected 'struct bdi_writeback_ctx *' but argument is of type 'struct bdi_writeback_ctx *'
     119 | void bdi_wb_ctx_exit(struct backing_dev_info *bdi, struct bdi_writeback_ctx *bdi_wb_ctx);
         |                                                    ~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~
   mm/page-writeback.c:761:50: error: invalid use of undefined type 'struct bdi_writeback_ctx'
     761 |                 list_add_tail_rcu(&new_ctx_arr[i]->wb.bdi_node, &new_ctx_arr[i]->wb_list);
         |                                                  ^~
   mm/page-writeback.c:761:80: error: invalid use of undefined type 'struct bdi_writeback_ctx'
     761 |                 list_add_tail_rcu(&new_ctx_arr[i]->wb.bdi_node, &new_ctx_arr[i]->wb_list);
         |                                                                                ^~
   mm/page-writeback.c:762:55: error: invalid use of undefined type 'struct bdi_writeback_ctx'
     762 |                 set_bit(WB_registered, &new_ctx_arr[i]->wb.state);
         |                                                       ^~
   mm/page-writeback.c:768:26: error: 'struct backing_dev_info' has no member named 'wb_ctx_arr'
     768 |         old_ctx_arr = bdi->wb_ctx_arr;
         |                          ^~
   mm/page-writeback.c:770:12: error: 'struct backing_dev_info' has no member named 'wb_ctx_arr'
     770 |         bdi->wb_ctx_arr = new_ctx_arr;
         |            ^~
   mm/page-writeback.c:771:12: error: 'struct backing_dev_info' has no member named 'nr_wb_ctx'
     771 |         bdi->nr_wb_ctx = nwritebacks;
         |            ^~
   mm/page-writeback.c: In function 'bdi_set_nwritebacks':
   mm/page-writeback.c:858:30: error: 'struct backing_dev_info' has no member named 'nr_wb_ctx'
     858 |         if (nwritebacks < bdi->nr_wb_ctx)
         |                              ^~
--
   In file included from mm/backing-dev.c:7:
>> include/linux/backing-dev.h:118:58: warning: 'struct bdi_writeback_ctx' declared inside parameter list will not be visible outside of this definition or declaration
     118 | int bdi_wb_ctx_init(struct backing_dev_info *bdi, struct bdi_writeback_ctx *bdi_wb_ctx);
         |                                                          ^~~~~~~~~~~~~~~~~
   include/linux/backing-dev.h:119:59: warning: 'struct bdi_writeback_ctx' declared inside parameter list will not be visible outside of this definition or declaration
     119 | void bdi_wb_ctx_exit(struct backing_dev_info *bdi, struct bdi_writeback_ctx *bdi_wb_ctx);
         |                                                           ^~~~~~~~~~~~~~~~~
   mm/backing-dev.c: In function 'nwritebacks_show':
>> mm/backing-dev.c:465:43: error: 'struct backing_dev_info' has no member named 'nr_wb_ctx'
     465 |         return sysfs_emit(buf, "%d\n", bdi->nr_wb_ctx);
         |                                           ^~
   mm/backing-dev.c: At top level:
>> mm/backing-dev.c:1015:58: warning: 'struct bdi_writeback_ctx' declared inside parameter list will not be visible outside of this definition or declaration
    1015 | int bdi_wb_ctx_init(struct backing_dev_info *bdi, struct bdi_writeback_ctx *bdi_wb_ctx)
         |                                                          ^~~~~~~~~~~~~~~~~
>> mm/backing-dev.c:1015:5: error: conflicting types for 'bdi_wb_ctx_init'; have 'int(struct backing_dev_info *, struct bdi_writeback_ctx *)'
    1015 | int bdi_wb_ctx_init(struct backing_dev_info *bdi, struct bdi_writeback_ctx *bdi_wb_ctx)
         |     ^~~~~~~~~~~~~~~
   include/linux/backing-dev.h:118:5: note: previous declaration of 'bdi_wb_ctx_init' with type 'int(struct backing_dev_info *, struct bdi_writeback_ctx *)'
     118 | int bdi_wb_ctx_init(struct backing_dev_info *bdi, struct bdi_writeback_ctx *bdi_wb_ctx);
         |     ^~~~~~~~~~~~~~~
   In file included from include/linux/fs.h:16,
                    from include/linux/highmem.h:5,
                    from include/linux/bvec.h:10,
                    from include/linux/blk_types.h:10,
                    from include/linux/blkdev.h:9,
                    from mm/backing-dev.c:3:
   mm/backing-dev.c: In function 'bdi_wb_ctx_init':
>> mm/backing-dev.c:1019:36: error: invalid use of undefined type 'struct bdi_writeback_ctx'
    1019 |         INIT_RADIX_TREE(&bdi_wb_ctx->cgwb_tree, GFP_ATOMIC);
         |                                    ^~
   include/linux/radix-tree.h:84:51: note: in definition of macro 'INIT_RADIX_TREE'
      84 | #define INIT_RADIX_TREE(root, mask) xa_init_flags(root, mask)
         |                                                   ^~~~
   In file included from include/linux/mm_types.h:13,
                    from include/linux/mmzone.h:22,
                    from include/linux/gfp.h:7,
                    from include/linux/xarray.h:16,
                    from include/linux/list_lru.h:14,
                    from include/linux/fs/super_types.h:7,
                    from include/linux/fs/super.h:5,
                    from include/linux/fs.h:5:
   mm/backing-dev.c:1021:31: error: invalid use of undefined type 'struct bdi_writeback_ctx'
    1021 |         init_rwsem(&bdi_wb_ctx->wb_switch_rwsem);
         |                               ^~
   include/linux/rwsem.h:123:23: note: in definition of macro 'init_rwsem'
     123 |         __init_rwsem((sem), #sem, &__key);                      \
         |                       ^~~
   mm/backing-dev.c:1023:34: error: invalid use of undefined type 'struct bdi_writeback_ctx'
    1023 |         ret = wb_init(&bdi_wb_ctx->wb, bdi_wb_ctx, bdi, GFP_KERNEL);
         |                                  ^~
>> mm/backing-dev.c:1023:40: error: passing argument 2 of 'wb_init' from incompatible pointer type [-Wincompatible-pointer-types]
    1023 |         ret = wb_init(&bdi_wb_ctx->wb, bdi_wb_ctx, bdi, GFP_KERNEL);
         |                                        ^~~~~~~~~~
         |                                        |
         |                                        struct bdi_writeback_ctx *
   mm/backing-dev.c:544:71: note: expected 'struct backing_dev_info *' but argument is of type 'struct bdi_writeback_ctx *'
     544 | static int wb_init(struct bdi_writeback *wb, struct backing_dev_info *bdi,
         |                                              ~~~~~~~~~~~~~~~~~~~~~~~~~^~~
>> mm/backing-dev.c:1023:52: error: passing argument 3 of 'wb_init' makes integer from pointer without a cast [-Wint-conversion]
    1023 |         ret = wb_init(&bdi_wb_ctx->wb, bdi_wb_ctx, bdi, GFP_KERNEL);
         |                                                    ^~~
         |                                                    |
         |                                                    struct backing_dev_info *
   mm/backing-dev.c:545:26: note: expected 'gfp_t' {aka 'unsigned int'} but argument is of type 'struct backing_dev_info *'
     545 |                    gfp_t gfp)
         |                    ~~~~~~^~~
>> mm/backing-dev.c:1023:15: error: too many arguments to function 'wb_init'; expected 3, have 4
    1023 |         ret = wb_init(&bdi_wb_ctx->wb, bdi_wb_ctx, bdi, GFP_KERNEL);
         |               ^~~~~~~
   mm/backing-dev.c:544:12: note: declared here
     544 | static int wb_init(struct bdi_writeback *wb, struct backing_dev_info *bdi,
         |            ^~~~~~~
   mm/backing-dev.c:1025:27: error: invalid use of undefined type 'struct bdi_writeback_ctx'
    1025 |                 bdi_wb_ctx->wb.memcg_css = &root_mem_cgroup->css;
         |                           ^~
   mm/backing-dev.c:1026:27: error: invalid use of undefined type 'struct bdi_writeback_ctx'
    1026 |                 bdi_wb_ctx->wb.blkcg_css = blkcg_root_css;
         |                           ^~
   mm/backing-dev.c: At top level:
   mm/backing-dev.c:1270:58: warning: 'struct bdi_writeback_ctx' declared inside parameter list will not be visible outside of this definition or declaration
    1270 | int bdi_wb_ctx_init(struct backing_dev_info *bdi, struct bdi_writeback_ctx *bdi_wb_ctx)
         |                                                          ^~~~~~~~~~~~~~~~~
   mm/backing-dev.c:1270:5: error: conflicting types for 'bdi_wb_ctx_init'; have 'int(struct backing_dev_info *, struct bdi_writeback_ctx *)'
    1270 | int bdi_wb_ctx_init(struct backing_dev_info *bdi, struct bdi_writeback_ctx *bdi_wb_ctx)
         |     ^~~~~~~~~~~~~~~
   include/linux/backing-dev.h:118:5: note: previous declaration of 'bdi_wb_ctx_init' with type 'int(struct backing_dev_info *, struct bdi_writeback_ctx *)'
     118 | int bdi_wb_ctx_init(struct backing_dev_info *bdi, struct bdi_writeback_ctx *bdi_wb_ctx);
         |     ^~~~~~~~~~~~~~~
   mm/backing-dev.c: In function 'bdi_wb_ctx_init':
   mm/backing-dev.c:1272:35: error: invalid use of undefined type 'struct bdi_writeback_ctx'
    1272 |         return wb_init(&bdi_wb_ctx->wb, bdi_wb_ctx, bdi, GFP_KERNEL);
         |                                   ^~
   mm/backing-dev.c:1272:41: error: passing argument 2 of 'wb_init' from incompatible pointer type [-Wincompatible-pointer-types]
    1272 |         return wb_init(&bdi_wb_ctx->wb, bdi_wb_ctx, bdi, GFP_KERNEL);
         |                                         ^~~~~~~~~~
         |                                         |
         |                                         struct bdi_writeback_ctx *
   mm/backing-dev.c:544:71: note: expected 'struct backing_dev_info *' but argument is of type 'struct bdi_writeback_ctx *'
     544 | static int wb_init(struct bdi_writeback *wb, struct backing_dev_info *bdi,
         |                                              ~~~~~~~~~~~~~~~~~~~~~~~~~^~~
   mm/backing-dev.c:1272:53: error: passing argument 3 of 'wb_init' makes integer from pointer without a cast [-Wint-conversion]
    1272 |         return wb_init(&bdi_wb_ctx->wb, bdi_wb_ctx, bdi, GFP_KERNEL);
         |                                                     ^~~
         |                                                     |
         |                                                     struct backing_dev_info *
   mm/backing-dev.c:545:26: note: expected 'gfp_t' {aka 'unsigned int'} but argument is of type 'struct backing_dev_info *'
     545 |                    gfp_t gfp)
         |                    ~~~~~~^~~
   mm/backing-dev.c:1272:16: error: too many arguments to function 'wb_init'; expected 3, have 4
    1272 |         return wb_init(&bdi_wb_ctx->wb, bdi_wb_ctx, bdi, GFP_KERNEL);
         |                ^~~~~~~
   mm/backing-dev.c:544:12: note: declared here
     544 | static int wb_init(struct bdi_writeback *wb, struct backing_dev_info *bdi,
         |            ^~~~~~~
   mm/backing-dev.c: At top level:
   mm/backing-dev.c:1275:59: warning: 'struct bdi_writeback_ctx' declared inside parameter list will not be visible outside of this definition or declaration
    1275 | void bdi_wb_ctx_exit(struct backing_dev_info *bdi, struct bdi_writeback_ctx *bdi_wb_ctx)
         |                                                           ^~~~~~~~~~~~~~~~~
>> mm/backing-dev.c:1275:6: error: conflicting types for 'bdi_wb_ctx_exit'; have 'void(struct backing_dev_info *, struct bdi_writeback_ctx *)'
    1275 | void bdi_wb_ctx_exit(struct backing_dev_info *bdi, struct bdi_writeback_ctx *bdi_wb_ctx)
         |      ^~~~~~~~~~~~~~~
   include/linux/backing-dev.h:119:6: note: previous declaration of 'bdi_wb_ctx_exit' with type 'void(struct backing_dev_info *, struct bdi_writeback_ctx *)'
     119 | void bdi_wb_ctx_exit(struct backing_dev_info *bdi, struct bdi_writeback_ctx *bdi_wb_ctx);
         |      ^~~~~~~~~~~~~~~
   mm/backing-dev.c: In function 'bdi_wb_ctx_exit':
   mm/backing-dev.c:1277:32: error: invalid use of undefined type 'struct bdi_writeback_ctx'
    1277 |         wb_shutdown(&bdi_wb_ctx->wb);
         |                                ^~
>> mm/backing-dev.c:1278:9: error: too many arguments to function 'cgwb_bdi_unregister'; expected 1, have 2
    1278 |         cgwb_bdi_unregister(bdi, bdi_wb_ctx);
         |         ^~~~~~~~~~~~~~~~~~~      ~~~~~~~~~~
   mm/backing-dev.c:881:13: note: declared here
     881 | static void cgwb_bdi_unregister(struct backing_dev_info *bdi)
         |             ^~~~~~~~~~~~~~~~~~~
   In file included from arch/powerpc/include/asm/bug.h:116,
                    from include/linux/bug.h:5,
                    from include/linux/instrumented.h:10,
                    from include/asm-generic/bitops/instrumented-atomic.h:14,
                    from arch/powerpc/include/asm/bitops.h:321,
                    from include/linux/bitops.h:67,
                    from include/linux/bitmap.h:8,
                    from include/linux/nodemask.h:91,
                    from include/linux/list_lru.h:12:
   mm/backing-dev.c:1280:57: error: invalid use of undefined type 'struct bdi_writeback_ctx'
    1280 |         WARN_ON_ONCE(test_bit(WB_registered, &bdi_wb_ctx->wb.state));
         |                                                         ^~
   include/asm-generic/bug.h:120:32: note: in definition of macro 'WARN_ON_ONCE'
     120 |         int __ret_warn_on = !!(condition);                              \
         |                                ^~~~~~~~~
   include/linux/bitops.h:60:41: note: in expansion of macro 'bitop'
      60 | #define test_bit(nr, addr)              bitop(_test_bit, nr, addr)
         |                                         ^~~~~
   mm/backing-dev.c:1280:22: note: in expansion of macro 'test_bit'
    1280 |         WARN_ON_ONCE(test_bit(WB_registered, &bdi_wb_ctx->wb.state));
         |                      ^~~~~~~~
   mm/backing-dev.c:1280:57: error: invalid use of undefined type 'struct bdi_writeback_ctx'
    1280 |         WARN_ON_ONCE(test_bit(WB_registered, &bdi_wb_ctx->wb.state));
         |                                                         ^~
   include/asm-generic/bug.h:120:32: note: in definition of macro 'WARN_ON_ONCE'
     120 |         int __ret_warn_on = !!(condition);                              \
         |                                ^~~~~~~~~
   include/linux/bitops.h:60:41: note: in expansion of macro 'bitop'
      60 | #define test_bit(nr, addr)              bitop(_test_bit, nr, addr)
         |                                         ^~~~~
   mm/backing-dev.c:1280:22: note: in expansion of macro 'test_bit'
    1280 |         WARN_ON_ONCE(test_bit(WB_registered, &bdi_wb_ctx->wb.state));
         |                      ^~~~~~~~
   mm/backing-dev.c:1280:57: error: invalid use of undefined type 'struct bdi_writeback_ctx'
    1280 |         WARN_ON_ONCE(test_bit(WB_registered, &bdi_wb_ctx->wb.state));
         |                                                         ^~
   include/asm-generic/bug.h:120:32: note: in definition of macro 'WARN_ON_ONCE'
     120 |         int __ret_warn_on = !!(condition);                              \
         |                                ^~~~~~~~~
   include/linux/bitops.h:60:41: note: in expansion of macro 'bitop'
      60 | #define test_bit(nr, addr)              bitop(_test_bit, nr, addr)
         |                                         ^~~~~
   mm/backing-dev.c:1280:22: note: in expansion of macro 'test_bit'
    1280 |         WARN_ON_ONCE(test_bit(WB_registered, &bdi_wb_ctx->wb.state));
         |                      ^~~~~~~~
   mm/backing-dev.c:1280:57: error: invalid use of undefined type 'struct bdi_writeback_ctx'
    1280 |         WARN_ON_ONCE(test_bit(WB_registered, &bdi_wb_ctx->wb.state));
         |                                                         ^~
   include/asm-generic/bug.h:120:32: note: in definition of macro 'WARN_ON_ONCE'
     120 |         int __ret_warn_on = !!(condition);                              \
         |                                ^~~~~~~~~
   include/linux/bitops.h:60:41: note: in expansion of macro 'bitop'
      60 | #define test_bit(nr, addr)              bitop(_test_bit, nr, addr)
         |                                         ^~~~~
   mm/backing-dev.c:1280:22: note: in expansion of macro 'test_bit'
    1280 |         WARN_ON_ONCE(test_bit(WB_registered, &bdi_wb_ctx->wb.state));
         |                      ^~~~~~~~
   mm/backing-dev.c:1280:57: error: invalid use of undefined type 'struct bdi_writeback_ctx'
    1280 |         WARN_ON_ONCE(test_bit(WB_registered, &bdi_wb_ctx->wb.state));
         |                                                         ^~
   include/asm-generic/bug.h:120:32: note: in definition of macro 'WARN_ON_ONCE'
     120 |         int __ret_warn_on = !!(condition);                              \
         |                                ^~~~~~~~~
   include/linux/bitops.h:60:41: note: in expansion of macro 'bitop'
      60 | #define test_bit(nr, addr)              bitop(_test_bit, nr, addr)
         |                                         ^~~~~
   mm/backing-dev.c:1280:22: note: in expansion of macro 'test_bit'
    1280 |         WARN_ON_ONCE(test_bit(WB_registered, &bdi_wb_ctx->wb.state));
         |                      ^~~~~~~~
   mm/backing-dev.c:1281:28: error: invalid use of undefined type 'struct bdi_writeback_ctx'
    1281 |         wb_exit(&bdi_wb_ctx->wb);
         |                            ^~


vim +734 mm/page-writeback.c

   724	
   725	static int __bdi_set_wb_ctx(struct backing_dev_info *bdi, int nwritebacks)
   726	{
   727		struct bdi_writeback_ctx **new_ctx_arr, **old_ctx_arr;
   728		int i, ret;
   729	
   730		new_ctx_arr = kcalloc(nwritebacks, sizeof(struct bdi_writeback_ctx *), GFP_KERNEL);
   731		if (!new_ctx_arr)
   732			return -ENOMEM;
   733	
 > 734		for (i = 0; i < min(bdi->nr_wb_ctx, nwritebacks); i++)
 > 735			new_ctx_arr[i] = bdi->wb_ctx_arr[i];
   736	
   737		for (i = bdi->nr_wb_ctx; i < nwritebacks; i++) {
 > 738			new_ctx_arr[i] = (struct bdi_writeback_ctx *)
 > 739				kzalloc(sizeof(struct bdi_writeback_ctx), GFP_KERNEL);
   740			if (!new_ctx_arr[i]) {
   741				pr_err("Failed to allocate %d", i);
   742				while (--i >= bdi->nr_wb_ctx)
   743					kfree(new_ctx_arr[i]);
   744				kfree(new_ctx_arr);
   745				return -ENOMEM;
   746			}
 > 747			INIT_LIST_HEAD(&new_ctx_arr[i]->wb_list);
   748			init_waitqueue_head(&new_ctx_arr[i]->wb_waitq);
   749		}
   750	
   751		for (i = bdi->nr_wb_ctx; i < nwritebacks; i++) {
 > 752			ret = bdi_wb_ctx_init(bdi, new_ctx_arr[i]);
   753			if (ret) {
   754				while (--i >= bdi->nr_wb_ctx) {
 > 755					bdi_wb_ctx_exit(bdi, new_ctx_arr[i]);
   756					kfree(new_ctx_arr[i]);
   757				}
   758				kfree(new_ctx_arr);
   759				return ret;
   760			}
   761			list_add_tail_rcu(&new_ctx_arr[i]->wb.bdi_node, &new_ctx_arr[i]->wb_list);
   762			set_bit(WB_registered, &new_ctx_arr[i]->wb.state);
   763		}
   764	
   765		// Make sure the initialization is done before assignment
   766		smp_wmb();
   767	
   768		old_ctx_arr = bdi->wb_ctx_arr;
   769		spin_lock_bh(&bdi_lock);
   770		bdi->wb_ctx_arr = new_ctx_arr;
   771		bdi->nr_wb_ctx = nwritebacks;
   772		spin_unlock_bh(&bdi_lock);
   773	
   774		kfree(old_ctx_arr);
   775		return 0;
   776	}
   777	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
