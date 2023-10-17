Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 224F12D784
	for <oe-kbuild-all@lists.linux.dev>; Tue, 17 Oct 2023 17:52:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UIUqGqPU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697565147; x=1729101147;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=oBlAEAlQnqM2HupB6eBPTsHDcX23BgihJF8jSF6GIqU=;
  b=UIUqGqPUlHSiVlMmwhgnuBLtD4Zjg8Gf4Uw8p0dZzK0ihUTT5wQlbMZ8
   69dPvaLq/ygasG9YQhXNyoCGNNSy+pbgUXUzMQF0pvEhLzPlc2isjHSAJ
   CX3C4lIV9W0CbHjJz/+DiNg1ZhIg/UxqQobHIw338zXyLuC/Q/HN9Z729
   vL5CV4bvs0SKXTotXCVjXEgplwIOzxf0ZxnytWoEie+CQ+Kjr2UwIKlwT
   0ZPttqbgtTro/xvbOZ1Atk3qH+cg1jqO5X6htYI18U6oEK0Mm7RPl6tYu
   DAJpcKzrSOUg/QiZQJWiwMW9DvXCYwziBCtPLdJJfIE46eZGUFQmcFPR8
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10866"; a="385684042"
X-IronPort-AV: E=Sophos;i="6.03,232,1694761200"; 
   d="scan'208";a="385684042"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Oct 2023 10:52:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,232,1694761200"; 
   d="scan'208";a="4026829"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 17 Oct 2023 10:51:18 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qsoEw-0009uh-1F;
	Tue, 17 Oct 2023 17:52:22 +0000
Date: Wed, 18 Oct 2023 01:52:13 +0800
From: kernel test robot <lkp@intel.com>
To: "Darrick J. Wong" <darrick.wong@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [djwong-xfs:xfs-merge-6.7 47/51] mm/shmem_quota.c:252:51: warning:
 'bhardlimit' may be used uninitialized
Message-ID: <202310180113.3onTDQsU-lkp@intel.com>
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
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20231018/202310180113.3onTDQsU-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231018/202310180113.3onTDQsU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310180113.3onTDQsU-lkp@intel.com/

Note: it may well be a FALSE warning. FWIW you are at least aware of it now.
http://gcc.gnu.org/wiki/Better_Uninitialized_Warnings

All warnings (new ones prefixed by >>):

   In function 'shmem_is_empty_dquot',
       inlined from 'shmem_release_dquot' at mm/shmem_quota.c:296:6:
>> mm/shmem_quota.c:252:51: warning: 'bhardlimit' may be used uninitialized [-Wmaybe-uninitialized]
     251 |                 (dquot->dq_dqb.dqb_curspace == 0 &&
         |                  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     252 |                  dquot->dq_dqb.dqb_curinodes == 0 &&
         |                  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~
     253 |                  dquot->dq_dqb.dqb_bhardlimit == bhardlimit &&
         |                  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/shmem_quota.c: In function 'shmem_release_dquot':
   mm/shmem_quota.c:239:17: note: 'bhardlimit' was declared here
     239 |         qsize_t bhardlimit;
         |                 ^~~~~~~~~~
   In function 'shmem_is_empty_dquot',
       inlined from 'shmem_release_dquot' at mm/shmem_quota.c:296:6:
>> mm/shmem_quota.c:253:61: warning: 'ihardlimit' may be used uninitialized [-Wmaybe-uninitialized]
     251 |                 (dquot->dq_dqb.dqb_curspace == 0 &&
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~          
     252 |                  dquot->dq_dqb.dqb_curinodes == 0 &&
         |                  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~         
     253 |                  dquot->dq_dqb.dqb_bhardlimit == bhardlimit &&
         |                  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~
     254 |                  dquot->dq_dqb.dqb_ihardlimit == ihardlimit))
         |                  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ 
   mm/shmem_quota.c: In function 'shmem_release_dquot':
   mm/shmem_quota.c:240:17: note: 'ihardlimit' was declared here
     240 |         qsize_t ihardlimit;
         |                 ^~~~~~~~~~
--
   mm/mmap.c: In function 'vma_merge':
>> mm/mmap.c:1002:23: warning: 'vma_pgoff' may be used uninitialized [-Wmaybe-uninitialized]
    1002 |         vma->vm_pgoff = vma_pgoff;
         |         ~~~~~~~~~~~~~~^~~~~~~~~~~
   mm/mmap.c:864:17: note: 'vma_pgoff' was declared here
     864 |         pgoff_t vma_pgoff;
         |                 ^~~~~~~~~
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
>> arch/m68k/include/asm/string.h:53:25: warning: 'tmp' may be used uninitialized [-Wmaybe-uninitialized]
      53 | #define memcpy(d, s, n) __builtin_memcpy(d, s, n)
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~
   mm/zswap.c:1439:17: note: in expansion of macro 'memcpy'
    1439 |                 memcpy(tmp, src, entry->length);
         |                 ^~~~~~
   mm/zswap.c:1401:25: note: 'tmp' was declared here
    1401 |         u8 *src, *dst, *tmp;
         |                         ^~~
--
   In file included from ./arch/m68k/include/generated/asm/rwonce.h:1,
                    from include/linux/compiler.h:246,
                    from include/linux/cleanup.h:5,
                    from include/linux/irqflags.h:16,
                    from arch/m68k/include/asm/atomic.h:6,
                    from include/linux/atomic.h:7,
                    from include/linux/page_counter.h:5,
                    from mm/memcontrol.c:28:
   In function '__ref_is_percpu',
       inlined from 'percpu_ref_put_many' at include/linux/percpu-refcount.h:332:6,
       inlined from 'percpu_ref_put' at include/linux/percpu-refcount.h:351:2,
       inlined from 'obj_cgroup_put' at include/linux/memcontrol.h:809:2,
       inlined from 'uncharge_folio' at mm/memcontrol.c:7173:3:
>> include/asm-generic/rwonce.h:44:26: warning: 'objcg' may be used uninitialized [-Wmaybe-uninitialized]
      44 | #define __READ_ONCE(x)  (*(const volatile __unqual_scalar_typeof(x) *)&(x))
         |                         ~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:50:9: note: in expansion of macro '__READ_ONCE'
      50 |         __READ_ONCE(x);                                                 \
         |         ^~~~~~~~~~~
   include/linux/percpu-refcount.h:174:22: note: in expansion of macro 'READ_ONCE'
     174 |         percpu_ptr = READ_ONCE(ref->percpu_count_ptr);
         |                      ^~~~~~~~~
   mm/memcontrol.c: In function 'uncharge_folio':
   mm/memcontrol.c:7131:28: note: 'objcg' was declared here
    7131 |         struct obj_cgroup *objcg;
         |                            ^~~~~
   In file included from include/linux/atomic.h:82:
   mm/memcontrol.c: In function 'mem_cgroup_iter':
>> include/linux/atomic/atomic-instrumented.h:4743:21: warning: 'iter' may be used uninitialized [-Wmaybe-uninitialized]
    4743 |         typeof(ptr) __ai_ptr = (ptr); \
         |                     ^~~~~~~~
   mm/memcontrol.c:1185:23: note: in expansion of macro 'cmpxchg'
    1185 |                 (void)cmpxchg(&iter->position, pos, memcg);
         |                       ^~~~~~~
   mm/memcontrol.c:1105:41: note: 'iter' was declared here
    1105 |         struct mem_cgroup_reclaim_iter *iter;
         |                                         ^~~~


vim +/bhardlimit +252 mm/shmem_quota.c

eafc474e202978 Carlos Maiolino 2023-07-25  235  
de4c0e7ca8b526 Lukas Czerner   2023-07-25  236  static bool shmem_is_empty_dquot(struct dquot *dquot)
de4c0e7ca8b526 Lukas Czerner   2023-07-25  237  {
de4c0e7ca8b526 Lukas Czerner   2023-07-25  238  	struct shmem_sb_info *sbinfo = dquot->dq_sb->s_fs_info;
de4c0e7ca8b526 Lukas Czerner   2023-07-25  239  	qsize_t bhardlimit;
de4c0e7ca8b526 Lukas Czerner   2023-07-25  240  	qsize_t ihardlimit;
de4c0e7ca8b526 Lukas Czerner   2023-07-25  241  
de4c0e7ca8b526 Lukas Czerner   2023-07-25  242  	if (dquot->dq_id.type == USRQUOTA) {
de4c0e7ca8b526 Lukas Czerner   2023-07-25  243  		bhardlimit = sbinfo->qlimits.usrquota_bhardlimit;
de4c0e7ca8b526 Lukas Czerner   2023-07-25  244  		ihardlimit = sbinfo->qlimits.usrquota_ihardlimit;
de4c0e7ca8b526 Lukas Czerner   2023-07-25  245  	} else if (dquot->dq_id.type == GRPQUOTA) {
de4c0e7ca8b526 Lukas Czerner   2023-07-25  246  		bhardlimit = sbinfo->qlimits.grpquota_bhardlimit;
de4c0e7ca8b526 Lukas Czerner   2023-07-25  247  		ihardlimit = sbinfo->qlimits.grpquota_ihardlimit;
de4c0e7ca8b526 Lukas Czerner   2023-07-25  248  	}
de4c0e7ca8b526 Lukas Czerner   2023-07-25  249  
de4c0e7ca8b526 Lukas Czerner   2023-07-25  250  	if (test_bit(DQ_FAKE_B, &dquot->dq_flags) ||
de4c0e7ca8b526 Lukas Czerner   2023-07-25  251  		(dquot->dq_dqb.dqb_curspace == 0 &&
de4c0e7ca8b526 Lukas Czerner   2023-07-25 @252  		 dquot->dq_dqb.dqb_curinodes == 0 &&
de4c0e7ca8b526 Lukas Czerner   2023-07-25 @253  		 dquot->dq_dqb.dqb_bhardlimit == bhardlimit &&
de4c0e7ca8b526 Lukas Czerner   2023-07-25  254  		 dquot->dq_dqb.dqb_ihardlimit == ihardlimit))
de4c0e7ca8b526 Lukas Czerner   2023-07-25  255  		return true;
de4c0e7ca8b526 Lukas Czerner   2023-07-25  256  
de4c0e7ca8b526 Lukas Czerner   2023-07-25  257  	return false;
de4c0e7ca8b526 Lukas Czerner   2023-07-25  258  }
eafc474e202978 Carlos Maiolino 2023-07-25  259  /*
eafc474e202978 Carlos Maiolino 2023-07-25  260   * Store limits from dquot in the tree unless it's fake. If it is fake
eafc474e202978 Carlos Maiolino 2023-07-25  261   * remove the id from the tree since there is no useful information in
eafc474e202978 Carlos Maiolino 2023-07-25  262   * there.
eafc474e202978 Carlos Maiolino 2023-07-25  263   */
eafc474e202978 Carlos Maiolino 2023-07-25  264  static int shmem_release_dquot(struct dquot *dquot)
eafc474e202978 Carlos Maiolino 2023-07-25  265  {
eafc474e202978 Carlos Maiolino 2023-07-25  266  	struct mem_dqinfo *info = sb_dqinfo(dquot->dq_sb, dquot->dq_id.type);
eafc474e202978 Carlos Maiolino 2023-07-25  267  	struct rb_node *node = ((struct rb_root *)info->dqi_priv)->rb_node;
eafc474e202978 Carlos Maiolino 2023-07-25  268  	qid_t id = from_kqid(&init_user_ns, dquot->dq_id);
eafc474e202978 Carlos Maiolino 2023-07-25  269  	struct quota_info *dqopt = sb_dqopt(dquot->dq_sb);
eafc474e202978 Carlos Maiolino 2023-07-25  270  	struct quota_id *entry = NULL;
eafc474e202978 Carlos Maiolino 2023-07-25  271  
eafc474e202978 Carlos Maiolino 2023-07-25  272  	mutex_lock(&dquot->dq_lock);
eafc474e202978 Carlos Maiolino 2023-07-25  273  	/* Check whether we are not racing with some other dqget() */
eafc474e202978 Carlos Maiolino 2023-07-25  274  	if (dquot_is_busy(dquot))
eafc474e202978 Carlos Maiolino 2023-07-25  275  		goto out_dqlock;
eafc474e202978 Carlos Maiolino 2023-07-25  276  
eafc474e202978 Carlos Maiolino 2023-07-25  277  	down_write(&dqopt->dqio_sem);
eafc474e202978 Carlos Maiolino 2023-07-25  278  	while (node) {
eafc474e202978 Carlos Maiolino 2023-07-25  279  		entry = rb_entry(node, struct quota_id, node);
eafc474e202978 Carlos Maiolino 2023-07-25  280  
eafc474e202978 Carlos Maiolino 2023-07-25  281  		if (id < entry->id)
eafc474e202978 Carlos Maiolino 2023-07-25  282  			node = node->rb_left;
eafc474e202978 Carlos Maiolino 2023-07-25  283  		else if (id > entry->id)
eafc474e202978 Carlos Maiolino 2023-07-25  284  			node = node->rb_right;
eafc474e202978 Carlos Maiolino 2023-07-25  285  		else
eafc474e202978 Carlos Maiolino 2023-07-25  286  			goto found;
eafc474e202978 Carlos Maiolino 2023-07-25  287  	}
eafc474e202978 Carlos Maiolino 2023-07-25  288  
eafc474e202978 Carlos Maiolino 2023-07-25  289  	/* We should always find the entry in the rb tree */
eafc474e202978 Carlos Maiolino 2023-07-25  290  	WARN_ONCE(1, "quota id %u from dquot %p, not in rb tree!\n", id, dquot);
eafc474e202978 Carlos Maiolino 2023-07-25  291  	up_write(&dqopt->dqio_sem);
eafc474e202978 Carlos Maiolino 2023-07-25  292  	mutex_unlock(&dquot->dq_lock);
eafc474e202978 Carlos Maiolino 2023-07-25  293  	return -ENOENT;
eafc474e202978 Carlos Maiolino 2023-07-25  294  
eafc474e202978 Carlos Maiolino 2023-07-25  295  found:
de4c0e7ca8b526 Lukas Czerner   2023-07-25  296  	if (shmem_is_empty_dquot(dquot)) {
eafc474e202978 Carlos Maiolino 2023-07-25  297  		/* Remove entry from the tree */
eafc474e202978 Carlos Maiolino 2023-07-25  298  		rb_erase(&entry->node, info->dqi_priv);
eafc474e202978 Carlos Maiolino 2023-07-25  299  		kfree(entry);
eafc474e202978 Carlos Maiolino 2023-07-25  300  	} else {
eafc474e202978 Carlos Maiolino 2023-07-25  301  		/* Store the limits in the tree */
eafc474e202978 Carlos Maiolino 2023-07-25  302  		spin_lock(&dquot->dq_dqb_lock);
eafc474e202978 Carlos Maiolino 2023-07-25  303  		entry->bhardlimit = dquot->dq_dqb.dqb_bhardlimit;
eafc474e202978 Carlos Maiolino 2023-07-25  304  		entry->bsoftlimit = dquot->dq_dqb.dqb_bsoftlimit;
eafc474e202978 Carlos Maiolino 2023-07-25  305  		entry->ihardlimit = dquot->dq_dqb.dqb_ihardlimit;
eafc474e202978 Carlos Maiolino 2023-07-25  306  		entry->isoftlimit = dquot->dq_dqb.dqb_isoftlimit;
eafc474e202978 Carlos Maiolino 2023-07-25  307  		spin_unlock(&dquot->dq_dqb_lock);
eafc474e202978 Carlos Maiolino 2023-07-25  308  	}
eafc474e202978 Carlos Maiolino 2023-07-25  309  
eafc474e202978 Carlos Maiolino 2023-07-25  310  	clear_bit(DQ_ACTIVE_B, &dquot->dq_flags);
eafc474e202978 Carlos Maiolino 2023-07-25  311  	up_write(&dqopt->dqio_sem);
eafc474e202978 Carlos Maiolino 2023-07-25  312  
eafc474e202978 Carlos Maiolino 2023-07-25  313  out_dqlock:
eafc474e202978 Carlos Maiolino 2023-07-25  314  	mutex_unlock(&dquot->dq_lock);
eafc474e202978 Carlos Maiolino 2023-07-25  315  	return 0;
eafc474e202978 Carlos Maiolino 2023-07-25  316  }
eafc474e202978 Carlos Maiolino 2023-07-25  317  

:::::: The code at line 252 was first introduced by commit
:::::: de4c0e7ca8b526a82ff7e5ee5533787bb6d01724 shmem: Add default quota limit mount options

:::::: TO: Lukas Czerner <lczerner@redhat.com>
:::::: CC: Christian Brauner <brauner@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
