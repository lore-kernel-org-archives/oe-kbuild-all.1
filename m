Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA5441DED42
	for <oe-kbuild-all@lists.linux.dev>; Mon, 23 Jun 2025 06:42:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750660950; cv=none; b=s3jOS8p9Tu7p3ZnXAtv9Rq+Zu8hU87vYEi0q9lAcVfHKxzr9bPQWF5VfKiqDhvkaumsrGtpsoPnIQ+Wte1FP7Ijma9tWwOcGHvpyspBGMW7+f1axEgz++HOVHOmGLxQ38foYhbFCAFaR0joWdQ+Q2D38oNuALMlkG3VzbVo0ULA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750660950; c=relaxed/simple;
	bh=jqiuoALI/EzBKM0SIgu3jn1pqJoL3nL5381Jvl7z/us=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sIe7oNtu0TdknZ3y4XNVDE0YA+oRxrSFsVim1QonOkFaljbtT15cWfPJqXwB4EKhuWkK0ieaznoOg4Yw8Y+3uQhdIxr772QyonnVgc9mTKcRk/ADYr2hvUyIxH++MxOjTuV8E0kmdIrgxU5riLouCctg4P4bCeHYZ0ZS7HqGmAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=c11ZHYyV; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="c11ZHYyV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750660949; x=1782196949;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jqiuoALI/EzBKM0SIgu3jn1pqJoL3nL5381Jvl7z/us=;
  b=c11ZHYyV6Rm98C8u4rNpHFhQBMgsEhyikgWGrxeApGnWFF6OJCZut0T5
   ZN6gAnzM0INM/UeNtUk6EgmN4AtPCHFIoBBd7wkra86QuL6Qt+mCoBIeP
   DaHN945mV7iGMwLMvtdP8i0p7pXzXYlmtr139qN27NwKYsDLd/Uh+ORVp
   di/wG6VopELco9YdWeiFBt4GekRU+m4AfNM5mCKm+m9UeC/ONLh6DMa00
   G7z9JjFxarYYDXk5xVLBSyuytBJkMX0A4/Lj8dpZ3PbkKTj8gkf+8I7uG
   KgZbLwb4W3dQk7aWTdjb5MvrZa027IiYUATFaZ9mjhiI5pLIJFn1WZPSp
   g==;
X-CSE-ConnectionGUID: Vh3DEflSSWKojNAbFAX9sw==
X-CSE-MsgGUID: qk9Hm2+ISp+ngezgy6TVDQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11472"; a="56664031"
X-IronPort-AV: E=Sophos;i="6.16,258,1744095600"; 
   d="scan'208";a="56664031"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2025 23:42:28 -0700
X-CSE-ConnectionGUID: wYaqUNs3R4uXNjzfJE0ezQ==
X-CSE-MsgGUID: W+y7AtweRRigWApKSfd1fw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,258,1744095600"; 
   d="scan'208";a="152024444"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 22 Jun 2025 23:42:28 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uTasq-000NlG-2W;
	Mon, 23 Jun 2025 06:42:24 +0000
Date: Mon, 23 Jun 2025 14:42:12 +0800
From: kernel test robot <lkp@intel.com>
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [akpm-mm:mm-nonmm-unstable 73/79] lib/raid6/recov_rvv.c:168:31:
 error: 'raid6_empty_zero_page' undeclared; did you mean
 'raid6_get_zero_page'?
Message-ID: <202506231457.Q4ZX8bx9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-nonmm-unstable
head:   4a817909eb2f8319250eb504f24337a45e43d351
commit: 44add101db9e53ebdb8f5971c9cfcb491ec2d0a3 [73/79] lib/raid6: replace custom zero page with ZERO_PAGE
config: riscv-randconfig-002-20250623 (https://download.01.org/0day-ci/archive/20250623/202506231457.Q4ZX8bx9-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250623/202506231457.Q4ZX8bx9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506231457.Q4ZX8bx9-lkp@intel.com/

All errors (new ones prefixed by >>):

   lib/raid6/recov_rvv.c: In function 'raid6_2data_recov_rvv':
>> lib/raid6/recov_rvv.c:168:31: error: 'raid6_empty_zero_page' undeclared (first use in this function); did you mean 'raid6_get_zero_page'?
     168 |         ptrs[faila] = (void *)raid6_empty_zero_page;
         |                               ^~~~~~~~~~~~~~~~~~~~~
         |                               raid6_get_zero_page
   lib/raid6/recov_rvv.c:168:31: note: each undeclared identifier is reported only once for each function it appears in
   lib/raid6/recov_rvv.c: In function 'raid6_datap_recov_rvv':
   lib/raid6/recov_rvv.c:206:31: error: 'raid6_empty_zero_page' undeclared (first use in this function); did you mean 'raid6_get_zero_page'?
     206 |         ptrs[faila] = (void *)raid6_empty_zero_page;
         |                               ^~~~~~~~~~~~~~~~~~~~~
         |                               raid6_get_zero_page


vim +168 lib/raid6/recov_rvv.c

6093faaf9593fca Chunyan Zhang 2025-03-05  151  
6093faaf9593fca Chunyan Zhang 2025-03-05  152  static void raid6_2data_recov_rvv(int disks, size_t bytes, int faila,
6093faaf9593fca Chunyan Zhang 2025-03-05  153  				  int failb, void **ptrs)
6093faaf9593fca Chunyan Zhang 2025-03-05  154  {
6093faaf9593fca Chunyan Zhang 2025-03-05  155  	u8 *p, *q, *dp, *dq;
6093faaf9593fca Chunyan Zhang 2025-03-05  156  	const u8 *pbmul;	/* P multiplier table for B data */
6093faaf9593fca Chunyan Zhang 2025-03-05  157  	const u8 *qmul;		/* Q multiplier table (for both) */
6093faaf9593fca Chunyan Zhang 2025-03-05  158  
6093faaf9593fca Chunyan Zhang 2025-03-05  159  	p = (u8 *)ptrs[disks - 2];
6093faaf9593fca Chunyan Zhang 2025-03-05  160  	q = (u8 *)ptrs[disks - 1];
6093faaf9593fca Chunyan Zhang 2025-03-05  161  
6093faaf9593fca Chunyan Zhang 2025-03-05  162  	/*
6093faaf9593fca Chunyan Zhang 2025-03-05  163  	 * Compute syndrome with zero for the missing data pages
6093faaf9593fca Chunyan Zhang 2025-03-05  164  	 * Use the dead data pages as temporary storage for
6093faaf9593fca Chunyan Zhang 2025-03-05  165  	 * delta p and delta q
6093faaf9593fca Chunyan Zhang 2025-03-05  166  	 */
6093faaf9593fca Chunyan Zhang 2025-03-05  167  	dp = (u8 *)ptrs[faila];
6093faaf9593fca Chunyan Zhang 2025-03-05 @168  	ptrs[faila] = (void *)raid6_empty_zero_page;
6093faaf9593fca Chunyan Zhang 2025-03-05  169  	ptrs[disks - 2] = dp;
6093faaf9593fca Chunyan Zhang 2025-03-05  170  	dq = (u8 *)ptrs[failb];
6093faaf9593fca Chunyan Zhang 2025-03-05  171  	ptrs[failb] = (void *)raid6_empty_zero_page;
6093faaf9593fca Chunyan Zhang 2025-03-05  172  	ptrs[disks - 1] = dq;
6093faaf9593fca Chunyan Zhang 2025-03-05  173  
6093faaf9593fca Chunyan Zhang 2025-03-05  174  	raid6_call.gen_syndrome(disks, bytes, ptrs);
6093faaf9593fca Chunyan Zhang 2025-03-05  175  
6093faaf9593fca Chunyan Zhang 2025-03-05  176  	/* Restore pointer table */
6093faaf9593fca Chunyan Zhang 2025-03-05  177  	ptrs[faila]     = dp;
6093faaf9593fca Chunyan Zhang 2025-03-05  178  	ptrs[failb]     = dq;
6093faaf9593fca Chunyan Zhang 2025-03-05  179  	ptrs[disks - 2] = p;
6093faaf9593fca Chunyan Zhang 2025-03-05  180  	ptrs[disks - 1] = q;
6093faaf9593fca Chunyan Zhang 2025-03-05  181  
6093faaf9593fca Chunyan Zhang 2025-03-05  182  	/* Now, pick the proper data tables */
6093faaf9593fca Chunyan Zhang 2025-03-05  183  	pbmul = raid6_vgfmul[raid6_gfexi[failb - faila]];
6093faaf9593fca Chunyan Zhang 2025-03-05  184  	qmul  = raid6_vgfmul[raid6_gfinv[raid6_gfexp[faila] ^
6093faaf9593fca Chunyan Zhang 2025-03-05  185  					 raid6_gfexp[failb]]];
6093faaf9593fca Chunyan Zhang 2025-03-05  186  
6093faaf9593fca Chunyan Zhang 2025-03-05  187  	kernel_vector_begin();
6093faaf9593fca Chunyan Zhang 2025-03-05  188  	__raid6_2data_recov_rvv(bytes, p, q, dp, dq, pbmul, qmul);
6093faaf9593fca Chunyan Zhang 2025-03-05  189  	kernel_vector_end();
6093faaf9593fca Chunyan Zhang 2025-03-05  190  }
6093faaf9593fca Chunyan Zhang 2025-03-05  191  

:::::: The code at line 168 was first introduced by commit
:::::: 6093faaf9593fca92f96f165c95ff4b53353b1f4 raid6: Add RISC-V SIMD syndrome and recovery calculations

:::::: TO: Chunyan Zhang <zhangchunyan@iscas.ac.cn>
:::::: CC: Palmer Dabbelt <palmer@dabbelt.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
