Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8F631946B
	for <oe-kbuild-all@lists.linux.dev>; Tue, 23 Apr 2024 04:02:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713844924; cv=none; b=S70RaCuz8D9QCbiDWaqioN7JskkdyFDMJ3YVRei4EPqiDKxWELnj2h5cxh+F3h2ARyw+47PXhhw/zzri5ZSfEhxdcEbh9LeqWHRTsPqnhw06NPSUWIYsQsEu0MY0GehgcKvoxNhWxoFknAvvNIqwGNa+XMY/AKDDOzQz1k2i3CU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713844924; c=relaxed/simple;
	bh=AspgxCx28sU+DdKKPJBYygxyvYgVCMLUwkDVX1WIRA8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LxWAU62RgJm4yMk1Od/YhAn/zEllRPSrESO73RaZgicax4MdXsbGio3J45hyUnSy4RMERII2aWfg9zGtjm1e5uKo1A8J128Jk4wzx1spmIoxdOiB6XmWC0XbIR0ZxFDCOzZ+CKNgp+SwtAwv+AWe5a1RMRpfhZ+I0Ixp4x+cfUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EAsxmr03; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EAsxmr03"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713844923; x=1745380923;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=AspgxCx28sU+DdKKPJBYygxyvYgVCMLUwkDVX1WIRA8=;
  b=EAsxmr03vV/pcDkzIOmtdgE9g1FP/Osb9YOgYh1MbZDrQG8Z91e2jE6k
   uIsPVaFUbdPrG1iIvFfzgoS3KH4tRjqfrkAMfc6D2FTfMdV7ixoWmzFwL
   kXfx11PJ2mmy365t8h+Qw7leTAdpLciiP+HRee05qLtXUIl60ULATaGFd
   Zdo2UnV/OtbaoFeOEEwl6k23FB9gsBawN7rx27CuYbEQfMWqnrKW+ebci
   Ife6/vJjEFFY69gICoRfjQTL5jWmGgOdKLessjsABTVGXU27KKVQNU6v6
   OVwhvSUKgIQXB10uKdT7Jg0dbpdZXe7q9NvF9FHU4PRNvSs5LysquqV0J
   w==;
X-CSE-ConnectionGUID: sAt1FZs4Ruqo92IxKFEfXA==
X-CSE-MsgGUID: cNFpqh+DQpi0xWDkP+Q4Dw==
X-IronPort-AV: E=McAfee;i="6600,9927,11052"; a="26927297"
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; 
   d="scan'208";a="26927297"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2024 21:02:02 -0700
X-CSE-ConnectionGUID: zsfdQmvXTeSw7gxdE+5UYQ==
X-CSE-MsgGUID: ARLGgZZFTECoXLcCg2JsfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; 
   d="scan'208";a="24677544"
Received: from lkp-server01.sh.intel.com (HELO 01437695816f) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 22 Apr 2024 21:02:00 -0700
Received: from kbuild by 01437695816f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rz7Lx-0000Sy-2x;
	Tue, 23 Apr 2024 04:01:57 +0000
Date: Tue, 23 Apr 2024 12:01:09 +0800
From: kernel test robot <lkp@intel.com>
To: Jianfeng Wang <jianfeng.w.wang@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-mm@kvack.org,
	Vlastimil Babka <vbabka@suse.cz>
Subject: [vbabka-slab:slab/for-next 11/12] mm/slub.c:3256:28: error: implicit
 declaration of function 'node_nr_objs'; did you mean 'node_nr_slabs'?
Message-ID: <202404231141.pPX8ZI0d-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/vbabka/slab.git slab/for-next
head:   b6f00c4ef02065161c09fdf560e492cfbb1fec0a
commit: 1c5610f451be71ca2f8b9c6b86ef4712aeed6437 [11/12] slub: introduce count_partial_free_approx()
config: arc-randconfig-001-20240423 (https://download.01.org/0day-ci/archive/20240423/202404231141.pPX8ZI0d-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240423/202404231141.pPX8ZI0d-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404231141.pPX8ZI0d-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/arc/include/asm/ptrace.h:11,
                    from arch/arc/include/asm/bug.h:11,
                    from include/linux/bug.h:5,
                    from include/linux/mmdebug.h:5,
                    from include/linux/mm.h:6,
                    from mm/slub.c:13:
   mm/slub.c: In function 'count_partial_free_approx':
>> mm/slub.c:3256:28: error: implicit declaration of function 'node_nr_objs'; did you mean 'node_nr_slabs'? [-Werror=implicit-function-declaration]
    3256 |                 x = min(x, node_nr_objs(n));
         |                            ^~~~~~~~~~~~
   include/linux/compiler.h:284:55: note: in definition of macro '__is_constexpr'
     284 |         (sizeof(int) == sizeof(*(8 ? ((void *)((long)(x) * 0l)) : (int *)8)))
         |                                                       ^
   include/linux/minmax.h:85:25: note: in expansion of macro '__careful_cmp'
      85 | #define min(x, y)       __careful_cmp(min, x, y)
         |                         ^~~~~~~~~~~~~
   mm/slub.c:3256:21: note: in expansion of macro 'min'
    3256 |                 x = min(x, node_nr_objs(n));
         |                     ^~~
   In file included from include/linux/init.h:5,
                    from include/linux/printk.h:6,
                    from include/asm-generic/bug.h:22,
                    from arch/arc/include/asm/bug.h:30:
>> include/linux/build_bug.h:78:41: error: static assertion failed: "min(x, node_nr_objs(n)) signedness error, fix types or consider umin() before min_t()"
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                         ^~~~~~~~~~~~~~
   include/linux/build_bug.h:77:34: note: in expansion of macro '__static_assert'
      77 | #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
         |                                  ^~~~~~~~~~~~~~~
   include/linux/minmax.h:51:9: note: in expansion of macro 'static_assert'
      51 |         static_assert(__types_ok(x, y),                 \
         |         ^~~~~~~~~~~~~
   include/linux/minmax.h:58:17: note: in expansion of macro '__cmp_once'
      58 |                 __cmp_once(op, x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y)))
         |                 ^~~~~~~~~~
   include/linux/minmax.h:85:25: note: in expansion of macro '__careful_cmp'
      85 | #define min(x, y)       __careful_cmp(min, x, y)
         |                         ^~~~~~~~~~~~~
   mm/slub.c:3256:21: note: in expansion of macro 'min'
    3256 |                 x = min(x, node_nr_objs(n));
         |                     ^~~
   mm/slub.c: At top level:
   mm/slub.c:3227:22: warning: 'count_partial_free_approx' defined but not used [-Wunused-function]
    3227 | static unsigned long count_partial_free_approx(struct kmem_cache_node *n)
         |                      ^~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +3256 mm/slub.c

  3226	
  3227	static unsigned long count_partial_free_approx(struct kmem_cache_node *n)
  3228	{
  3229		unsigned long flags;
  3230		unsigned long x = 0;
  3231		struct slab *slab;
  3232	
  3233		spin_lock_irqsave(&n->list_lock, flags);
  3234		if (n->nr_partial <= MAX_PARTIAL_TO_SCAN) {
  3235			list_for_each_entry(slab, &n->partial, slab_list)
  3236				x += slab->objects - slab->inuse;
  3237		} else {
  3238			/*
  3239			 * For a long list, approximate the total count of objects in
  3240			 * it to meet the limit on the number of slabs to scan.
  3241			 * Scan from both the list's head and tail for better accuracy.
  3242			 */
  3243			unsigned long scanned = 0;
  3244	
  3245			list_for_each_entry(slab, &n->partial, slab_list) {
  3246				x += slab->objects - slab->inuse;
  3247				if (++scanned == MAX_PARTIAL_TO_SCAN / 2)
  3248					break;
  3249			}
  3250			list_for_each_entry_reverse(slab, &n->partial, slab_list) {
  3251				x += slab->objects - slab->inuse;
  3252				if (++scanned == MAX_PARTIAL_TO_SCAN)
  3253					break;
  3254			}
  3255			x = mult_frac(x, n->nr_partial, scanned);
> 3256			x = min(x, node_nr_objs(n));
  3257		}
  3258		spin_unlock_irqrestore(&n->list_lock, flags);
  3259		return x;
  3260	}
  3261	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
