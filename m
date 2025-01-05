Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DF2212BF24
	for <oe-kbuild-all@lists.linux.dev>; Sun,  5 Jan 2025 18:53:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736103194; cv=none; b=uBsSRpGjNHJSk2/fz0eHs1Nw4mQOTS8VsC4YhXmwErsgeZCQwys33HGX6AET14yKh5prMZha9UZaVx/53GgMDG3BfNVcIdq8mX31CM4KFHnctfKBPaYewtt4ZIbLaS5z01pSJpVc6JIwsXWu2ZjlidrhD/pU/xlaTzy+zYupVPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736103194; c=relaxed/simple;
	bh=5f/So5wDYUMVebC6m9OTOMhl5ehCE3p/DW6i9bx/Xu8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DH0S4Z9M1qJbw8cRSj44Q5RAT7+NTy+upIph1M9Xbr0NHfOtfmMZWV3IsiQy0I1u5OMjJY3aTU7gO9hnIEhRZ7tq07KpEq1dRjDc31n7tIDrSyM/14dm2lNUWYqMmFg6b534UhEUt1r0ksXD34s6XkfIDdeNSb0nA5BZPKU3T2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QLyhL9Dk; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QLyhL9Dk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736103193; x=1767639193;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5f/So5wDYUMVebC6m9OTOMhl5ehCE3p/DW6i9bx/Xu8=;
  b=QLyhL9DkuokXC7+iH/JVNdoUoqD6Ir1sXKwAq6HIVMWw/Xm68fMnIiiH
   LaJNxjzUNdLysuNdckKoZbdPA/XbreKFPhLh239FjCoy3bid9geIJTCU3
   OCEpgMWyJC8L5Iv1EHfDQvv9LNn6B3gCS20fsAXGAcLOGs+qA8Yhuty11
   H/f4arL+GWV61YcHamrJNYY17HsEodRqziaywCtJ1Q35MYhbEYSRbtzF0
   e6F5AnxnIblBMBGampwXBDFJZ7e3BorU7D+3mK/nkzHKoBCbQA84cM9mk
   QrjWLmc4uLJ/M5K4XQbq/4NRqTQhza2oraznLXvCYN2c708Oynvxpktvk
   A==;
X-CSE-ConnectionGUID: Nl5XfDHgR42r8mrsOvfAZA==
X-CSE-MsgGUID: pIO9LvY9TjucBlH2nxzwZQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11306"; a="36278874"
X-IronPort-AV: E=Sophos;i="6.12,291,1728975600"; 
   d="scan'208";a="36278874"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jan 2025 10:53:12 -0800
X-CSE-ConnectionGUID: s/JH0X7HTHKuyhpA5KyNWQ==
X-CSE-MsgGUID: xGqItWCNQ9qt/FLdWE4WfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,291,1728975600"; 
   d="scan'208";a="102434379"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 05 Jan 2025 10:53:11 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tUVkK-000BvX-1c;
	Sun, 05 Jan 2025 18:53:08 +0000
Date: Mon, 6 Jan 2025 02:52:19 +0800
From: kernel test robot <lkp@intel.com>
To: Hongzhen Luo <hongzhen@linux.alibaba.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH v5 4/4] erofs: introduce .fadvise for page cache share
Message-ID: <202501060221.LPQZaeA4-lkp@intel.com>
References: <20250105151208.3797385-5-hongzhen@linux.alibaba.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250105151208.3797385-5-hongzhen@linux.alibaba.com>

Hi Hongzhen,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on xiang-erofs/dev-test]
[also build test ERROR on xiang-erofs/dev xiang-erofs/fixes linus/master v6.13-rc5 next-20241220]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Hongzhen-Luo/erofs-move-struct-erofs_anon_fs_type-to-super-c/20250105-231438
base:   https://git.kernel.org/pub/scm/linux/kernel/git/xiang/erofs.git dev-test
patch link:    https://lore.kernel.org/r/20250105151208.3797385-5-hongzhen%40linux.alibaba.com
patch subject: [RFC PATCH v5 4/4] erofs: introduce .fadvise for page cache share
config: loongarch-randconfig-001-20250106 (https://download.01.org/0day-ci/archive/20250106/202501060221.LPQZaeA4-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250106/202501060221.LPQZaeA4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501060221.LPQZaeA4-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from fs/erofs/pagecache_share.c:10:
   fs/erofs/pagecache_share.c: In function 'erofs_pcshr_init_mnt':
>> fs/erofs/pagecache_share.c:66:32: error: invalid application of 'sizeof' to incomplete type 'struct interval_tree_node'
      66 |                         sizeof(struct interval_tree_node), 0,
         |                                ^~~~~~
   include/linux/slab.h:430:55: note: in definition of macro 'kmem_cache_create'
     430 |                 default: __kmem_cache_create)(__name, __object_size, __args, __VA_ARGS__)
         |                                                       ^~~~~~~~~~~~~
   fs/erofs/pagecache_share.c: In function 'erofs_pcshr_free_inode':
>> fs/erofs/pagecache_share.c:163:15: error: implicit declaration of function 'interval_tree_iter_first'; did you mean 'vma_interval_tree_iter_first'? [-Wimplicit-function-declaration]
     163 |         seg = interval_tree_iter_first(&vi->segs, 0, LLONG_MAX);
         |               ^~~~~~~~~~~~~~~~~~~~~~~~
         |               vma_interval_tree_iter_first
>> fs/erofs/pagecache_share.c:163:13: error: assignment to 'struct interval_tree_node *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     163 |         seg = interval_tree_iter_first(&vi->segs, 0, LLONG_MAX);
         |             ^
>> fs/erofs/pagecache_share.c:165:28: error: implicit declaration of function 'interval_tree_iter_next'; did you mean 'vma_interval_tree_iter_next'? [-Wimplicit-function-declaration]
     165 |                 next_seg = interval_tree_iter_next(seg, 0, LLONG_MAX);
         |                            ^~~~~~~~~~~~~~~~~~~~~~~
         |                            vma_interval_tree_iter_next
   fs/erofs/pagecache_share.c:165:26: error: assignment to 'struct interval_tree_node *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     165 |                 next_seg = interval_tree_iter_next(seg, 0, LLONG_MAX);
         |                          ^
>> fs/erofs/pagecache_share.c:166:17: error: implicit declaration of function 'interval_tree_remove'; did you mean 'vma_interval_tree_remove'? [-Wimplicit-function-declaration]
     166 |                 interval_tree_remove(seg, &vi->segs);
         |                 ^~~~~~~~~~~~~~~~~~~~
         |                 vma_interval_tree_remove
   fs/erofs/pagecache_share.c: In function 'erofs_pcshr_fadvise':
   fs/erofs/pagecache_share.c:276:13: error: assignment to 'struct interval_tree_node *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     276 |         seg = interval_tree_iter_first(&vi->segs, start, end);
         |             ^
   fs/erofs/pagecache_share.c:278:26: error: assignment to 'struct interval_tree_node *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     278 |                 next_seg = interval_tree_iter_next(seg, start, end);
         |                          ^
   In file included from include/linux/kernel.h:28,
                    from include/linux/cpumask.h:11,
                    from arch/loongarch/include/asm/processor.h:9,
                    from arch/loongarch/include/asm/thread_info.h:15,
                    from include/linux/thread_info.h:60,
                    from include/asm-generic/current.h:6,
                    from ./arch/loongarch/include/generated/asm/current.h:1,
                    from include/linux/mutex.h:14,
                    from fs/erofs/pagecache_share.c:8:
>> fs/erofs/pagecache_share.c:283:35: error: invalid use of undefined type 'struct interval_tree_node'
     283 |                 l = max_t(u64, seg->start | 0ULL, start);
         |                                   ^~
   include/linux/minmax.h:93:23: note: in definition of macro '__cmp_once_unique'
      93 |         ({ type ux = (x); type uy = (y); __cmp(op, ux, uy); })
         |                       ^
   include/linux/minmax.h:221:27: note: in expansion of macro '__cmp_once'
     221 | #define max_t(type, x, y) __cmp_once(max, type, x, y)
         |                           ^~~~~~~~~~
   fs/erofs/pagecache_share.c:283:21: note: in expansion of macro 'max_t'
     283 |                 l = max_t(u64, seg->start | 0ULL, start);
         |                     ^~~~~
   fs/erofs/pagecache_share.c:284:35: error: invalid use of undefined type 'struct interval_tree_node'
     284 |                 r = min_t(u64, seg->last | 0ULL, end);
         |                                   ^~
   include/linux/minmax.h:93:23: note: in definition of macro '__cmp_once_unique'
      93 |         ({ type ux = (x); type uy = (y); __cmp(op, ux, uy); })
         |                       ^
   include/linux/minmax.h:213:27: note: in expansion of macro '__cmp_once'
     213 | #define min_t(type, x, y) __cmp_once(min, type, x, y)
         |                           ^~~~~~~~~~
   fs/erofs/pagecache_share.c:284:21: note: in expansion of macro 'min_t'
     284 |                 r = min_t(u64, seg->last | 0ULL, end);
         |                     ^~~~~
   fs/erofs/pagecache_share.c:289:24: error: invalid use of undefined type 'struct interval_tree_node'
     289 |                 if (seg->start < l) {
         |                        ^~
   fs/erofs/pagecache_share.c:291:32: error: invalid use of undefined type 'struct interval_tree_node'
     291 |                         new_seg->start = seg->start;
         |                                ^~
   fs/erofs/pagecache_share.c:291:45: error: invalid use of undefined type 'struct interval_tree_node'
     291 |                         new_seg->start = seg->start;
         |                                             ^~
   fs/erofs/pagecache_share.c:292:32: error: invalid use of undefined type 'struct interval_tree_node'
     292 |                         new_seg->last = l;
         |                                ^~
>> fs/erofs/pagecache_share.c:293:25: error: implicit declaration of function 'interval_tree_insert'; did you mean 'vma_interval_tree_insert'? [-Wimplicit-function-declaration]
     293 |                         interval_tree_insert(new_seg, &vi->segs);
         |                         ^~~~~~~~~~~~~~~~~~~~
         |                         vma_interval_tree_insert
   fs/erofs/pagecache_share.c:297:28: error: invalid use of undefined type 'struct interval_tree_node'
     297 |                 if (r < seg->last) {
         |                            ^~
   fs/erofs/pagecache_share.c:299:32: error: invalid use of undefined type 'struct interval_tree_node'
     299 |                         new_seg->start = r;
         |                                ^~
   fs/erofs/pagecache_share.c:300:32: error: invalid use of undefined type 'struct interval_tree_node'
     300 |                         new_seg->last = seg->last;
         |                                ^~
   fs/erofs/pagecache_share.c:300:44: error: invalid use of undefined type 'struct interval_tree_node'
     300 |                         new_seg->last = seg->last;
         |                                            ^~
   fs/erofs/pagecache_share.c: In function 'erofs_pcshr_read_end':
   fs/erofs/pagecache_share.c:367:12: error: invalid use of undefined type 'struct interval_tree_node'
     367 |         seg->start = folio_index(folio);
         |            ^~
   fs/erofs/pagecache_share.c:368:12: error: invalid use of undefined type 'struct interval_tree_node'
     368 |         seg->last = seg->start + (folio_size(folio) >> PAGE_SHIFT);
         |            ^~
   fs/erofs/pagecache_share.c:368:24: error: invalid use of undefined type 'struct interval_tree_node'
     368 |         seg->last = seg->start + (folio_size(folio) >> PAGE_SHIFT);
         |                        ^~
   fs/erofs/pagecache_share.c:369:16: error: invalid use of undefined type 'struct interval_tree_node'
     369 |         if (seg->last > (vi->vfs_inode.i_size >> PAGE_SHIFT))
         |                ^~
   fs/erofs/pagecache_share.c:370:20: error: invalid use of undefined type 'struct interval_tree_node'
     370 |                 seg->last = vi->vfs_inode.i_size >> PAGE_SHIFT;
         |                    ^~
   In file included from fs/erofs/pagecache_share.c:13:
   fs/erofs/pagecache_share.c:371:22: error: invalid use of undefined type 'struct interval_tree_node'
     371 |         DBG_BUGON(seg->last < seg->start);
         |                      ^~
   fs/erofs/internal.h:32:41: note: in definition of macro 'DBG_BUGON'
      32 | #define DBG_BUGON(x)            ((void)(x))
         |                                         ^
   fs/erofs/pagecache_share.c:371:34: error: invalid use of undefined type 'struct interval_tree_node'
     371 |         DBG_BUGON(seg->last < seg->start);
         |                                  ^~
   fs/erofs/internal.h:32:41: note: in definition of macro 'DBG_BUGON'
      32 | #define DBG_BUGON(x)            ((void)(x))
         |                                         ^
   fs/erofs/pagecache_share.c: In function 'erofs_pcshr_readahead_end':
   fs/erofs/pagecache_share.c:422:12: error: invalid use of undefined type 'struct interval_tree_node'
     422 |         seg->start = start;
         |            ^~
   fs/erofs/pagecache_share.c:423:12: error: invalid use of undefined type 'struct interval_tree_node'
     423 |         seg->last = readahead_pos(rac) >> PAGE_SHIFT;
         |            ^~
   fs/erofs/pagecache_share.c:424:16: error: invalid use of undefined type 'struct interval_tree_node'
     424 |         if (seg->last > (vi->vfs_inode.i_size >> PAGE_SHIFT))
         |                ^~
   fs/erofs/pagecache_share.c:425:20: error: invalid use of undefined type 'struct interval_tree_node'
     425 |                 seg->last = vi->vfs_inode.i_size >> PAGE_SHIFT;
         |                    ^~


vim +66 fs/erofs/pagecache_share.c

   > 8	#include <linux/mutex.h>
     9	#include <uapi/linux/fadvise.h>
  > 10	#include <linux/slab.h>
    11	#include <linux/pagemap.h>
    12	#include "pagecache_share.h"
    13	#include "internal.h"
    14	#include "xattr.h"
    15	
    16	#define PCSHR_FPRT_IDX	4
    17	#define PCSHR_FPRT_NAME	"erofs.fingerprint"
    18	#define PCSHR_FPRT_MAXLEN (sizeof(size_t) + 1024)
    19	
    20	struct erofs_pcshr_counter {
    21		struct mutex mutex;
    22		struct kref ref;
    23		struct vfsmount *mnt;
    24		/* kmem cache for each inode's first-read segments */
    25		struct kmem_cache *segsp;
    26	};
    27	
    28	struct erofs_pcshr_private {
    29		char fprt[PCSHR_FPRT_MAXLEN];
    30		struct mutex mutex;
    31	};
    32	
    33	static struct erofs_pcshr_counter mnt_counter = {
    34		.mutex = __MUTEX_INITIALIZER(mnt_counter.mutex),
    35		.mnt = NULL,
    36	};
    37	
    38	static void erofs_pcshr_counter_release(struct kref *ref)
    39	{
    40		struct erofs_pcshr_counter *counter = container_of(ref,
    41				struct erofs_pcshr_counter, ref);
    42	
    43		DBG_BUGON(!counter->mnt);
    44		kern_unmount(counter->mnt);
    45		counter->mnt = NULL;
    46		kmem_cache_destroy(counter->segsp);
    47		counter->segsp = NULL;
    48	}
    49	
    50	int erofs_pcshr_init_mnt(void)
    51	{
    52		int ret;
    53		struct vfsmount *tmp;
    54	
    55		mutex_lock(&mnt_counter.mutex);
    56		if (!mnt_counter.mnt) {
    57			tmp = kern_mount(&erofs_anon_fs_type);
    58			if (IS_ERR(tmp)) {
    59				ret = PTR_ERR(tmp);
    60				goto out;
    61			}
    62			mnt_counter.mnt = tmp;
    63			kref_init(&mnt_counter.ref);
    64	
    65			mnt_counter.segsp = kmem_cache_create("erofs_segs",
  > 66				sizeof(struct interval_tree_node), 0,
    67				SLAB_RECLAIM_ACCOUNT | SLAB_ACCOUNT, NULL);
    68			if (!mnt_counter.segsp) {
    69				ret = -ENOMEM;
    70				goto out;
    71			}
    72		} else
    73			kref_get(&mnt_counter.ref);
    74		ret = 0;
    75	out:
    76		mutex_unlock(&mnt_counter.mutex);
    77		return ret;
    78	}
    79	
    80	void erofs_pcshr_free_mnt(void)
    81	{
    82		mutex_lock(&mnt_counter.mutex);
    83		kref_put(&mnt_counter.ref, erofs_pcshr_counter_release);
    84		mutex_unlock(&mnt_counter.mutex);
    85	}
    86	
    87	static struct interval_tree_node *erofs_pcshr_alloc_seg(void)
    88	{
    89		return kmem_cache_alloc(mnt_counter.segsp, GFP_KERNEL);
    90	}
    91	
    92	static void erofs_pcshr_free_seg(struct interval_tree_node *seg)
    93	{
    94		kmem_cache_free(mnt_counter.segsp, seg);
    95	}
    96	
    97	static int erofs_fprt_eq(struct inode *inode, void *data)
    98	{
    99		struct erofs_pcshr_private *ano_private = inode->i_private;
   100	
   101		return ano_private && memcmp(ano_private->fprt, data,
   102				sizeof(size_t) + *(size_t *)data) == 0 ? 1 : 0;
   103	}
   104	
   105	static int erofs_fprt_set(struct inode *inode, void *data)
   106	{
   107		struct erofs_pcshr_private *ano_private;
   108	
   109		ano_private = kmalloc(sizeof(struct erofs_pcshr_private), GFP_KERNEL);
   110		if (!ano_private)
   111			return -ENOMEM;
   112		memcpy(ano_private, data, sizeof(size_t) + *(size_t *)data);
   113		mutex_init(&ano_private->mutex);
   114		inode->i_private = ano_private;
   115		return 0;
   116	}
   117	
   118	int erofs_pcshr_fill_inode(struct inode *inode)
   119	{
   120		struct erofs_inode *vi = EROFS_I(inode);
   121		/* | fingerprint length | fingerprint content | */
   122		char fprt[PCSHR_FPRT_MAXLEN];
   123		struct inode *ano_inode;
   124		unsigned long fprt_hash;
   125		size_t fprt_len;
   126		int ret = -1;
   127	
   128		vi->ano_inode = NULL;
   129		memset(fprt, 0, sizeof(fprt));
   130		fprt_len = erofs_getxattr(inode, PCSHR_FPRT_IDX, PCSHR_FPRT_NAME,
   131				fprt + sizeof(size_t), PCSHR_FPRT_MAXLEN);
   132		if (fprt_len > 0 && fprt_len <= PCSHR_FPRT_MAXLEN) {
   133			*(size_t *)fprt = fprt_len;
   134			fprt_hash = xxh32(fprt + sizeof(size_t), fprt_len, 0);
   135			ano_inode = iget5_locked(mnt_counter.mnt->mnt_sb, fprt_hash,
   136						 erofs_fprt_eq, erofs_fprt_set, fprt);
   137			DBG_BUGON(!ano_inode);
   138			vi->ano_inode = ano_inode;
   139			vi->segs = RB_ROOT_CACHED;
   140			mutex_init(&vi->segs_mutex);
   141			if (ano_inode->i_state & I_NEW) {
   142				if (erofs_inode_is_data_compressed(vi->datalayout))
   143					ano_inode->i_mapping->a_ops = &z_erofs_aops;
   144				else
   145					ano_inode->i_mapping->a_ops = &erofs_aops;
   146				ano_inode->i_size = inode->i_size;
   147				unlock_new_inode(ano_inode);
   148			}
   149			ret = 0;
   150		}
   151		return ret;
   152	}
   153	
   154	void erofs_pcshr_free_inode(struct inode *inode)
   155	{
   156		struct interval_tree_node *seg, *next_seg;
   157		struct erofs_inode *vi = EROFS_I(inode);
   158	
   159		if (S_ISREG(inode->i_mode) &&  vi->ano_inode) {
   160			iput(vi->ano_inode);
   161			vi->ano_inode = NULL;
   162		}
 > 163		seg = interval_tree_iter_first(&vi->segs, 0, LLONG_MAX);
   164		while (seg) {
 > 165			next_seg = interval_tree_iter_next(seg, 0, LLONG_MAX);
 > 166			interval_tree_remove(seg, &vi->segs);
   167			erofs_pcshr_free_seg(seg);
   168			seg = next_seg;
   169		}
   170	}
   171	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
