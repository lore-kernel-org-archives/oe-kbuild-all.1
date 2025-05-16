Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CFED19CC3D
	for <oe-kbuild-all@lists.linux.dev>; Fri, 16 May 2025 22:16:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747433796; cv=none; b=H+VT80NkzWMtDfDS0SeVYBBXGtHjcbKyk5tvPr+OHimkdqdeAvJWmhV94c5U8MVmxjIlRa6Jdavg3Ry44r59PmZEMZiWzL3jsESLxDiYUX8q0LU79+mQb0JSUyLAK8inZAWZnVxe9bvbrl28VP5hbISzgHfx6LxdtQWcU0A2EOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747433796; c=relaxed/simple;
	bh=tRmqu7Ns6U7Yvo+JsueGRKSe3EzFsB2BkcGN7nASgcI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=a/qaXB6+DYk3/5BY0+1fAvBPH/Z5xVMQrnx5+yS/idGnZrnDlUwpE8w2u+9C2Zh/zI2W5XqzrYtUJj3iBuazaSj7eLrDAKLCPX79q160le3T6YopuCF3kssXVbnZtZGZatoRQcVeLIt9cs4B1QpwcoYIytlzm2mlnMTykfARmG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Be9SCVHY; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Be9SCVHY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747433795; x=1778969795;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tRmqu7Ns6U7Yvo+JsueGRKSe3EzFsB2BkcGN7nASgcI=;
  b=Be9SCVHYNyUaoMLmELbct1gf27IQbR/cOGZGML1e47WoIs4xhZc4I/dg
   JtbT34q00EdZNYx/fYLK0v4V++svD/oPZwen6Afx9ms3KBLMgkv3RJUiS
   D1Rm1wftNBKtdx4I+QbhzD0nH3/TZynM1/a1KwZhSAtFeX1CX/2IMXvDv
   7JSrbDf9sb8gwdpLnp9Bztu1iviots9YqmjWJ5ElPtUixy0QL6skUigqN
   xx9lfs7qB3pBnHT+3Gc3rS0xy4kKGt2i5EqnJZwn1hq6/OyZvGvXloq+D
   9pR9ofLTuUCcu6JU2SZZUWX4iaW8aewxrwEjK8aQytn80yHa0TVZE900r
   w==;
X-CSE-ConnectionGUID: GezjrmsxRLCJ+REr7Wi/ZQ==
X-CSE-MsgGUID: r+i3MX6dQ/asNer9egJQqg==
X-IronPort-AV: E=McAfee;i="6700,10204,11435"; a="49557416"
X-IronPort-AV: E=Sophos;i="6.15,295,1739865600"; 
   d="scan'208";a="49557416"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2025 15:16:34 -0700
X-CSE-ConnectionGUID: EoTrXbndRZKI587FDLjPJw==
X-CSE-MsgGUID: ijKEwBtjROWTG1qhz1okCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,295,1739865600"; 
   d="scan'208";a="169848267"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 16 May 2025 15:16:32 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uG3Ly-000Jkt-1s;
	Fri, 16 May 2025 22:16:30 +0000
Date: Sat, 17 May 2025 06:15:46 +0800
From: kernel test robot <lkp@intel.com>
To: Yury Norov <yury.norov@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [norov:cpumask_next 25/33] kernel/padata.c:184:9: warning: unused
 variable 'cpu'
Message-ID: <202505170653.mp2rLzb6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/norov/linux cpumask_next
head:   0577ced82818590ec7abe2f40119b340c1124a55
commit: f41cdcd3d78b67054ae6af5a2152157f99183880 [25/33] padata: fix opencoded cpumask_nth()
config: arc-randconfig-001-20250517 (https://download.01.org/0day-ci/archive/20250517/202505170653.mp2rLzb6-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250517/202505170653.mp2rLzb6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505170653.mp2rLzb6-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/padata.c: In function 'padata_do_parallel':
>> kernel/padata.c:184:9: warning: unused variable 'cpu' [-Wunused-variable]
     184 |  int i, cpu, cpu_index, err;
         |         ^~~
>> kernel/padata.c:184:6: warning: unused variable 'i' [-Wunused-variable]
     184 |  int i, cpu, cpu_index, err;
         |      ^


vim +/cpu +184 kernel/padata.c

16295bec6398a3 Steffen Klassert 2010-01-06  163  
0198ffd135f51d Steffen Klassert 2010-05-19  164  /**
16295bec6398a3 Steffen Klassert 2010-01-06  165   * padata_do_parallel - padata parallelization function
16295bec6398a3 Steffen Klassert 2010-01-06  166   *
bbefa1dd6a6d53 Herbert Xu       2019-11-26  167   * @ps: padatashell
16295bec6398a3 Steffen Klassert 2010-01-06  168   * @padata: object to be parallelized
e6ce0e0807e90d Daniel Jordan    2019-09-05  169   * @cb_cpu: pointer to the CPU that the serialization callback function should
e6ce0e0807e90d Daniel Jordan    2019-09-05  170   *          run on.  If it's not in the serial cpumask of @pinst
e6ce0e0807e90d Daniel Jordan    2019-09-05  171   *          (i.e. cpumask.cbcpu), this function selects a fallback CPU and if
e6ce0e0807e90d Daniel Jordan    2019-09-05  172   *          none found, returns -EINVAL.
16295bec6398a3 Steffen Klassert 2010-01-06  173   *
16295bec6398a3 Steffen Klassert 2010-01-06  174   * The parallelization callback function will run with BHs off.
16295bec6398a3 Steffen Klassert 2010-01-06  175   * Note: Every object which is parallelized by padata_do_parallel
16295bec6398a3 Steffen Klassert 2010-01-06  176   * must be seen by padata_do_serial.
bfcdcef8c8e346 Daniel Jordan    2019-12-03  177   *
bfcdcef8c8e346 Daniel Jordan    2019-12-03  178   * Return: 0 on success or else negative error code.
16295bec6398a3 Steffen Klassert 2010-01-06  179   */
bbefa1dd6a6d53 Herbert Xu       2019-11-26  180  int padata_do_parallel(struct padata_shell *ps,
e6ce0e0807e90d Daniel Jordan    2019-09-05  181  		       struct padata_priv *padata, int *cb_cpu)
16295bec6398a3 Steffen Klassert 2010-01-06  182  {
bbefa1dd6a6d53 Herbert Xu       2019-11-26  183  	struct padata_instance *pinst = ps->pinst;
4611ce22468895 Daniel Jordan    2020-06-03 @184  	int i, cpu, cpu_index, err;
16295bec6398a3 Steffen Klassert 2010-01-06  185  	struct parallel_data *pd;
4611ce22468895 Daniel Jordan    2020-06-03  186  	struct padata_work *pw;
16295bec6398a3 Steffen Klassert 2010-01-06  187  
16295bec6398a3 Steffen Klassert 2010-01-06  188  	rcu_read_lock_bh();
16295bec6398a3 Steffen Klassert 2010-01-06  189  
bbefa1dd6a6d53 Herbert Xu       2019-11-26  190  	pd = rcu_dereference_bh(ps->pd);
16295bec6398a3 Steffen Klassert 2010-01-06  191  
83f619f3c8abb8 Steffen Klassert 2010-07-07  192  	err = -EINVAL;
7424713b835870 Steffen Klassert 2010-07-20  193  	if (!(pinst->flags & PADATA_INIT) || pinst->flags & PADATA_INVALID)
16295bec6398a3 Steffen Klassert 2010-01-06  194  		goto out;
16295bec6398a3 Steffen Klassert 2010-01-06  195  
e6ce0e0807e90d Daniel Jordan    2019-09-05  196  	if (!cpumask_test_cpu(*cb_cpu, pd->cpumask.cbcpu)) {
1c4cafd11599ab Yury Norov       2022-01-23  197  		if (cpumask_empty(pd->cpumask.cbcpu))
16295bec6398a3 Steffen Klassert 2010-01-06  198  			goto out;
16295bec6398a3 Steffen Klassert 2010-01-06  199  
e6ce0e0807e90d Daniel Jordan    2019-09-05  200  		/* Select an alternate fallback CPU and notify the caller. */
e6ce0e0807e90d Daniel Jordan    2019-09-05  201  		cpu_index = *cb_cpu % cpumask_weight(pd->cpumask.cbcpu);
f41cdcd3d78b67 Yury Norov       2025-05-15  202  		*cb_cpu = cpumask_nth(cpu_index,pd->cpumask.cbcpu) ;
e6ce0e0807e90d Daniel Jordan    2019-09-05  203  	}
e6ce0e0807e90d Daniel Jordan    2019-09-05  204  
16295bec6398a3 Steffen Klassert 2010-01-06  205  	err = -EBUSY;
16295bec6398a3 Steffen Klassert 2010-01-06  206  	if ((pinst->flags & PADATA_RESET))
16295bec6398a3 Steffen Klassert 2010-01-06  207  		goto out;
16295bec6398a3 Steffen Klassert 2010-01-06  208  
ae154202cc6a18 Chen Ridong      2025-01-10  209  	padata_get_pd(pd);
16295bec6398a3 Steffen Klassert 2010-01-06  210  	padata->pd = pd;
e6ce0e0807e90d Daniel Jordan    2019-09-05  211  	padata->cb_cpu = *cb_cpu;
16295bec6398a3 Steffen Klassert 2010-01-06  212  
4611ce22468895 Daniel Jordan    2020-06-03  213  	spin_lock(&padata_works_lock);
4611ce22468895 Daniel Jordan    2020-06-03  214  	padata->seq_nr = ++pd->seq_nr;
4611ce22468895 Daniel Jordan    2020-06-03  215  	pw = padata_work_alloc();
4611ce22468895 Daniel Jordan    2020-06-03  216  	spin_unlock(&padata_works_lock);
1b0df11fde0f14 Daniel Jordan    2020-09-02  217  
34c3a47d20ae55 Daniel Jordan    2022-11-16  218  	if (!pw) {
34c3a47d20ae55 Daniel Jordan    2022-11-16  219  		/* Maximum works limit exceeded, run in the current task. */
34c3a47d20ae55 Daniel Jordan    2022-11-16  220  		padata->parallel(padata);
34c3a47d20ae55 Daniel Jordan    2022-11-16  221  	}
34c3a47d20ae55 Daniel Jordan    2022-11-16  222  
1b0df11fde0f14 Daniel Jordan    2020-09-02  223  	rcu_read_unlock_bh();
1b0df11fde0f14 Daniel Jordan    2020-09-02  224  
4611ce22468895 Daniel Jordan    2020-06-03  225  	if (pw) {
004ed42638f442 Daniel Jordan    2020-06-03  226  		padata_work_init(pw, padata_parallel_worker, padata, 0);
4611ce22468895 Daniel Jordan    2020-06-03  227  		queue_work(pinst->parallel_wq, &pw->pw_work);
4611ce22468895 Daniel Jordan    2020-06-03  228  	}
16295bec6398a3 Steffen Klassert 2010-01-06  229  
4611ce22468895 Daniel Jordan    2020-06-03  230  	return 0;
16295bec6398a3 Steffen Klassert 2010-01-06  231  out:
16295bec6398a3 Steffen Klassert 2010-01-06  232  	rcu_read_unlock_bh();
16295bec6398a3 Steffen Klassert 2010-01-06  233  
16295bec6398a3 Steffen Klassert 2010-01-06  234  	return err;
16295bec6398a3 Steffen Klassert 2010-01-06  235  }
16295bec6398a3 Steffen Klassert 2010-01-06  236  EXPORT_SYMBOL(padata_do_parallel);
16295bec6398a3 Steffen Klassert 2010-01-06  237  

:::::: The code at line 184 was first introduced by commit
:::::: 4611ce22468895acd61fee9ac1da810d60617d9a padata: allocate work structures for parallel jobs from a pool

:::::: TO: Daniel Jordan <daniel.m.jordan@oracle.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
