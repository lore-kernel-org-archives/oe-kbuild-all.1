Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 089D518E1D
	for <oe-kbuild-all@lists.linux.dev>; Tue, 23 Apr 2024 02:31:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713839515; cv=none; b=qVoY6As/c+p3BiuSYtVRqVqiPb0jux42J1cMlNmOpHgzAA1F+B28wGocLa4TtgavLx+/dBcW8Bn2ZSfEMP2nWdZX04t5lMJG4gm7FewCuwRoR2uGrud8q9mEizPDXmFiBOe3vI2qYsFV3o19MYSnPTWqCz/pKCcKum2ou0d9NiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713839515; c=relaxed/simple;
	bh=T6qxMYEZzKnFTdCPbvQG64gCnR4r4NrqYc6iJqKOLzg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qNYuw1OYljvFGE6B0a1UR3Ry4Y1WuUbuNnTgww2ZJjIqYTFvnpO3WJ3ZstaYXPBKY3+lvF+9o0V3HQAZgp0Mb3UDZaSOMXdZgU/2kE72onVWxB2dYYi5S0YnNROZX62B7z4Evl+odNAJnwmdDyi3jvxKLv5QS2gFRv7F22Va/dY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FRNmBszR; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FRNmBszR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713839514; x=1745375514;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=T6qxMYEZzKnFTdCPbvQG64gCnR4r4NrqYc6iJqKOLzg=;
  b=FRNmBszRVRJFoC4Y0JAI1Qb0p35wa15cMrqQRPFNzXhAgn+IQRMeBbY8
   C5jshDsIqeA6Novx97W4zOdx5GyS42QaN05cam8I3q8CXu2bVYoxU6T82
   ID8bARkD92OssL8n6P7cBa/ReGbJiCJ0Kz76d4rQ4pnhH9um5SZxj6SHm
   cZ/egs+i519SDK7OupjpOF7ulTO/bdXGti3kfJvrXyBNgWIhrk8xh2rle
   1fx6WlRM1fqb5hei5iw3ijs0Hj3+CgBHWxLBYGevm7YcxpQnnN3XR9I6U
   Lz8FIPW5m7E/YZbG+YhBcMMt9DvBTLjyT0jJB7cvWiGGObnRLzAzE8+pO
   Q==;
X-CSE-ConnectionGUID: /hYWgZcmSUOJxgFgg/JAYg==
X-CSE-MsgGUID: PnKaKV7hR9u4JFrB7pXykA==
X-IronPort-AV: E=McAfee;i="6600,9927,11052"; a="9280998"
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; 
   d="scan'208";a="9280998"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2024 19:31:53 -0700
X-CSE-ConnectionGUID: wuUV/NxjRTSZXj8JRql7YQ==
X-CSE-MsgGUID: hTEMx5BUSa2CLvC2z+F6Tg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; 
   d="scan'208";a="24822624"
Received: from lkp-server01.sh.intel.com (HELO 01437695816f) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 22 Apr 2024 19:31:52 -0700
Received: from kbuild by 01437695816f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rz5wj-0000Pe-2N;
	Tue, 23 Apr 2024 02:31:49 +0000
Date: Tue, 23 Apr 2024 10:31:31 +0800
From: kernel test robot <lkp@intel.com>
To: Jianfeng Wang <jianfeng.w.wang@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-mm@kvack.org,
	Vlastimil Babka <vbabka@suse.cz>
Subject: [vbabka-slab:slab/for-next 11/12] mm/slub.c:3227:22: warning:
 'count_partial_free_approx' defined but not used
Message-ID: <202404231048.ucsxSmAS-lkp@intel.com>
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
config: arc-randconfig-001-20240423 (https://download.01.org/0day-ci/archive/20240423/202404231048.ucsxSmAS-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240423/202404231048.ucsxSmAS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404231048.ucsxSmAS-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/arc/include/asm/ptrace.h:11,
                    from arch/arc/include/asm/bug.h:11,
                    from include/linux/bug.h:5,
                    from include/linux/mmdebug.h:5,
                    from include/linux/mm.h:6,
                    from mm/slub.c:13:
   mm/slub.c: In function 'count_partial_free_approx':
   mm/slub.c:3256:28: error: implicit declaration of function 'node_nr_objs'; did you mean 'node_nr_slabs'? [-Werror=implicit-function-declaration]
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
   include/linux/build_bug.h:78:41: error: static assertion failed: "min(x, node_nr_objs(n)) signedness error, fix types or consider umin() before min_t()"
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
>> mm/slub.c:3227:22: warning: 'count_partial_free_approx' defined but not used [-Wunused-function]
    3227 | static unsigned long count_partial_free_approx(struct kmem_cache_node *n)
         |                      ^~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/count_partial_free_approx +3227 mm/slub.c

  3226	
> 3227	static unsigned long count_partial_free_approx(struct kmem_cache_node *n)
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
  3256			x = min(x, node_nr_objs(n));
  3257		}
  3258		spin_unlock_irqrestore(&n->list_lock, flags);
  3259		return x;
  3260	}
  3261	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
