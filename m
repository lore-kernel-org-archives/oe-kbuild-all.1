Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8ED7208C6
	for <oe-kbuild-all@lists.linux.dev>; Thu,  4 Jan 2024 09:46:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lXGXO0xu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704361603; x=1735897603;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Hy5VNIljX57FtywRfU56lVHmbBh8apcb4SNy/ym+vVQ=;
  b=lXGXO0xu5eqRhskpOFH+phJrwhShLaYmUldh9f4D88WypJ8xPIu/6007
   k6i3NUZDDTtMeAGHCykDcKfxpOPTX5hfebJJ0NU5AegY5JkAkt4r8PDKS
   OTm2QNoBjbIzeriEUR6w+q0acvFr+MY3ZL6lgm0kmp67uPTQn1O/LVD65
   335nxxWZpaQLHJHNHEeyRQ+rxDGIix1t7hDpbUbkF6d5muIi3ZH95z1lF
   TsTpkFODoWFSVmV1+M+sQiE/09Lnpu1+TXRQoV8L++26sGku0rb9imj/P
   IxxlKsFmlqDxBelJzdd8yi2KrHYpFvt0sddxGBMTAtq9VPvffzF8Jl1Yi
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10942"; a="3958472"
X-IronPort-AV: E=Sophos;i="6.04,330,1695711600"; 
   d="scan'208";a="3958472"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jan 2024 01:46:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10942"; a="1111670403"
X-IronPort-AV: E=Sophos;i="6.04,330,1695711600"; 
   d="scan'208";a="1111670403"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 04 Jan 2024 01:46:39 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rLKJA-000N8k-2b;
	Thu, 04 Jan 2024 09:46:37 +0000
Date: Thu, 4 Jan 2024 17:46:07 +0800
From: kernel test robot <lkp@intel.com>
To: Gregory Price <gregory.price@memverge.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Gregory Price <gourry.memverge@gmail.com>,
	Rakie Kim <rakie.kim@sk.com>, Hyeongtak Ji <hyeongtak.ji@sk.com>,
	Honggyu Kim <honggyu.kim@sk.com>,
	Vinicius Tavares Petrucci <vtavarespetr@micron.com>
Subject: [gmprice:mempolicy2_mbind2 12/12] mm/mempolicy.c:3236:58: warning:
 argument to 'sizeof' in '__builtin_memcpy' call is the same expression as
 the destination; did you mean to provide an explicit length?
Message-ID: <202401041726.GgFM3E4E-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/gmprice/linux mempolicy2_mbind2
head:   6778fe256977719295e155d049454870c0f0c743
commit: 6778fe256977719295e155d049454870c0f0c743 [12/12] mm/mempolicy: extend mempolicy2 and mbind2 to support weighted interleave
config: sparc-allmodconfig (https://download.01.org/0day-ci/archive/20240104/202401041726.GgFM3E4E-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240104/202401041726.GgFM3E4E-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401041726.GgFM3E4E-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/string.h:61,
                    from include/linux/bitmap.h:12,
                    from include/linux/cpumask.h:12,
                    from include/linux/smp.h:13,
                    from include/linux/lockdep.h:14,
                    from include/linux/rcupdate.h:29,
                    from include/linux/rculist.h:11,
                    from include/linux/pid.h:5,
                    from include/linux/sched.h:14,
                    from include/linux/mempolicy.h:9,
                    from mm/mempolicy.c:73:
   mm/mempolicy.c: In function 'mpol_shared_policy_init':
>> mm/mempolicy.c:3236:58: warning: argument to 'sizeof' in '__builtin_memcpy' call is the same expression as the destination; did you mean to provide an explicit length? [-Wsizeof-pointer-memaccess]
    3236 |                 memcpy(weights, mpol->wil.weights, sizeof(weights));
         |                                                          ^
   arch/sparc/include/asm/string.h:15:48: note: in definition of macro 'memcpy'
      15 | #define memcpy(t, f, n) __builtin_memcpy(t, f, n)
         |                                                ^


vim +3236 mm/mempolicy.c

  3205	
  3206	/**
  3207	 * mpol_shared_policy_init - initialize shared policy for inode
  3208	 * @sp: pointer to inode shared policy
  3209	 * @mpol:  struct mempolicy to install
  3210	 *
  3211	 * Install non-NULL @mpol in inode's shared policy rb-tree.
  3212	 * On entry, the current task has a reference on a non-NULL @mpol.
  3213	 * This must be released on exit.
  3214	 * This is called at get_inode() calls and we can use GFP_KERNEL.
  3215	 */
  3216	void mpol_shared_policy_init(struct shared_policy *sp, struct mempolicy *mpol)
  3217	{
  3218		int ret;
  3219		struct mempolicy_param mparam;
  3220	
  3221		sp->root = RB_ROOT;		/* empty tree == default mempolicy */
  3222		rwlock_init(&sp->lock);
  3223	
  3224		if (mpol) {
  3225			struct sp_node *sn;
  3226			struct mempolicy *npol;
  3227			u8 *weights = NULL;
  3228			NODEMASK_SCRATCH(scratch);
  3229	
  3230			if (!scratch)
  3231				goto put_mpol;
  3232	
  3233			weights = kzalloc(MAX_NUMNODES, GFP_KERNEL | __GFP_NORETRY);
  3234			if (!weights)
  3235				goto free_scratch;
> 3236			memcpy(weights, mpol->wil.weights, sizeof(weights));
  3237	
  3238			memset(&mparam, 0, sizeof(mparam));
  3239			mparam.mode = mpol->mode;
  3240			mparam.mode_flags = mpol->flags;
  3241			mparam.policy_nodes = &mpol->w.user_nodemask;
  3242			mparam.home_node = NUMA_NO_NODE;
  3243			mparam.il_weights = weights;
  3244	
  3245			/* contextualize the tmpfs mount point mempolicy to this file */
  3246			npol = mpol_new(&mparam);
  3247			if (IS_ERR(npol))
  3248				goto free_weights; /* no valid nodemask intersection */
  3249	
  3250			task_lock(current);
  3251			ret = mpol_set_nodemask(npol, &mpol->w.user_nodemask, scratch);
  3252			task_unlock(current);
  3253			if (ret)
  3254				goto put_npol;
  3255	
  3256			/* alloc node covering entire file; adds ref to file's npol */
  3257			sn = sp_alloc(0, MAX_LFS_FILESIZE >> PAGE_SHIFT, npol);
  3258			if (sn)
  3259				sp_insert(sp, sn);
  3260	put_npol:
  3261			mpol_put(npol);	/* drop initial ref on file's npol */
  3262	free_weights:
  3263			kfree(weights);
  3264	free_scratch:
  3265			NODEMASK_SCRATCH_FREE(scratch);
  3266	put_mpol:
  3267			mpol_put(mpol);	/* drop our incoming ref on sb mpol */
  3268		}
  3269	}
  3270	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
