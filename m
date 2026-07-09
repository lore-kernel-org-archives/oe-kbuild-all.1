Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A68153FF1B9
	for <oe-kbuild-all@lists.linux.dev>; Thu,  9 Jul 2026 09:23:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783589013; cv=none; b=JR2XX9c0ttrxGMMaStmGcg0tiXqnJMbFoX2zjMRpxUJlUgZHoESHusi83SgVsdO/KeU4h83QkrSrWdjPmDzEckjXX1tdOZ60eVM1ddoM+43ui/aBxuCXPVw9vYwNVCJXEDjk//hamaOOgmCii501Q6k7OeayeACqVjTBCWpm5rk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783589013; c=relaxed/simple;
	bh=/gLbpp91qve9HDDXSfKpVBGC9qzJoQxtJJlTndOXwOI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=KzFpCfyVTh9PiGgTG7kmJByoDrSlx4BvqsSfwk8TURfBB76I1P0BP3yh61F3GHSiwinQjD3Vz6MMxVOcsJPAQ+iLlYEAq98QrLjzp7hZeqy/Z4wDVHqyf+OQBOwxA7aXyxw8GeCfbFmfbkqdmNwovviJoSO05MokRwt1Pi+JGKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iWwIEfun; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iWwIEfun"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783589011; x=1815125011;
  h=date:from:to:cc:subject:message-id;
  bh=/gLbpp91qve9HDDXSfKpVBGC9qzJoQxtJJlTndOXwOI=;
  b=iWwIEfun35fH3fJ86CZbEUSmRja2GAIkXn6S5K5e3iJd3gbV/OXqizuG
   C9P87/Q4asKTzy3K1mW4DzhucRlENQQDbBY2P1yvTKpS6Zs+cHsdAsYG4
   veFoEP9gkMsWqevx5ZOmEDQDr2Z4v3eLnydyygy90ssk5/cDGmhfeUBYP
   SOVi7JmdTQH0L0NU+bNFHuYNofRd7bXtC1jhR06vBMpuXD95kXuF5HGwG
   Ipyq1sWM6uryy3kASdcQkZeIwfC/p3+NF+WfRXirhRFbNuKQJa77sD+Ln
   Q7DA92Q8B5vpS8AfLd9wZTxTDVBeog3fL2e9TdN3hbmqTUAeATEaPMxFC
   w==;
X-CSE-ConnectionGUID: dOelqHp9T+KKjZ3zToOKMA==
X-CSE-MsgGUID: SHEMqYJaQ8Sx2FcBbPqtXA==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="94618014"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="94618014"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2026 02:23:31 -0700
X-CSE-ConnectionGUID: rH6eMHj1QfGMbytIXG31MQ==
X-CSE-MsgGUID: 6Y9qJWECQvadxrxUc2N4bw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="259436148"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 09 Jul 2026 02:23:29 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1whkyc-00000000HV2-2OYg;
	Thu, 09 Jul 2026 09:23:26 +0000
Date: Thu, 09 Jul 2026 17:23:23 +0800
From: kernel test robot <lkp@intel.com>
To: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [vbabka:objext_split 12/14] mm/slab.h:720:46: error:
 'slabobj_ext_idx_ctref' undeclared; did you mean 'slabobj_ext_idx_objcg'?
Message-ID: <202607091729.PhhcpvSA-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Vlastimil,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vbabka/linux.git objext_split
head:   8bd682e28958694beba958e2a3af94c6e1789819
commit: ac7896437e39eb47ba7cbf00c39915e87e04398f [12/14] mm/slab: change layout of struct slabobj_ext arrays
config: arm64-randconfig-002-20260709 (https://download.01.org/0day-ci/archive/20260709/202607091729.PhhcpvSA-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260709/202607091729.PhhcpvSA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607091729.PhhcpvSA-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from mm/slab_common.c:35:
   mm/slab.h: In function 'slab_obj_ext_codetag_ref':
>> mm/slab.h:720:46: error: 'slabobj_ext_idx_ctref' undeclared (first use in this function); did you mean 'slabobj_ext_idx_objcg'?
     return &slab_obj_ext(slab, obj_exts, index, slabobj_ext_idx_ctref)->_ctref;
                                                 ^~~~~~~~~~~~~~~~~~~~~
                                                 slabobj_ext_idx_objcg
   mm/slab.h:720:46: note: each undeclared identifier is reported only once for each function it appears in
   mm/slab.h: In function 'obj_ext_codetag_ref_start':
   mm/slab.h:731:19: error: 'slabobj_ext_idx_ctref' undeclared (first use in this function); did you mean 'slabobj_ext_idx_objcg'?
     return obj_ext + slabobj_ext_idx_ctref * slab->objects;
                      ^~~~~~~~~~~~~~~~~~~~~
                      slabobj_ext_idx_objcg
--
   In file included from mm/slub.c:23:
   mm/slab.h: In function 'slab_obj_ext_codetag_ref':
>> mm/slab.h:720:46: error: 'slabobj_ext_idx_ctref' undeclared (first use in this function); did you mean 'slabobj_ext_idx_objcg'?
     return &slab_obj_ext(slab, obj_exts, index, slabobj_ext_idx_ctref)->_ctref;
                                                 ^~~~~~~~~~~~~~~~~~~~~
                                                 slabobj_ext_idx_objcg
   mm/slab.h:720:46: note: each undeclared identifier is reported only once for each function it appears in
   mm/slab.h: In function 'obj_ext_codetag_ref_start':
   mm/slab.h:731:19: error: 'slabobj_ext_idx_ctref' undeclared (first use in this function); did you mean 'slabobj_ext_idx_objcg'?
     return obj_ext + slabobj_ext_idx_ctref * slab->objects;
                      ^~~~~~~~~~~~~~~~~~~~~
                      slabobj_ext_idx_objcg
>> mm/slab.h:732:1: warning: control reaches end of non-void function [-Wreturn-type]
    }
    ^
--
   In file included from mm/kasan/generic.c:37:
   mm/kasan/../slab.h: In function 'slab_obj_ext_codetag_ref':
>> mm/kasan/../slab.h:720:46: error: 'slabobj_ext_idx_ctref' undeclared (first use in this function); did you mean 'slabobj_ext_idx_objcg'?
     return &slab_obj_ext(slab, obj_exts, index, slabobj_ext_idx_ctref)->_ctref;
                                                 ^~~~~~~~~~~~~~~~~~~~~
                                                 slabobj_ext_idx_objcg
   mm/kasan/../slab.h:720:46: note: each undeclared identifier is reported only once for each function it appears in
   mm/kasan/../slab.h: In function 'obj_ext_codetag_ref_start':
   mm/kasan/../slab.h:731:19: error: 'slabobj_ext_idx_ctref' undeclared (first use in this function); did you mean 'slabobj_ext_idx_objcg'?
     return obj_ext + slabobj_ext_idx_ctref * slab->objects;
                      ^~~~~~~~~~~~~~~~~~~~~
                      slabobj_ext_idx_objcg
--
   In file included from mm/kfence/kfence.h:17,
                    from mm/kfence/core.c:39:
   mm/kfence/../slab.h: In function 'slab_obj_ext_codetag_ref':
>> mm/kfence/../slab.h:720:46: error: 'slabobj_ext_idx_ctref' undeclared (first use in this function); did you mean 'slabobj_ext_idx_objcg'?
     return &slab_obj_ext(slab, obj_exts, index, slabobj_ext_idx_ctref)->_ctref;
                                                 ^~~~~~~~~~~~~~~~~~~~~
                                                 slabobj_ext_idx_objcg
   mm/kfence/../slab.h:720:46: note: each undeclared identifier is reported only once for each function it appears in
   mm/kfence/../slab.h: In function 'obj_ext_codetag_ref_start':
   mm/kfence/../slab.h:731:19: error: 'slabobj_ext_idx_ctref' undeclared (first use in this function); did you mean 'slabobj_ext_idx_objcg'?
     return obj_ext + slabobj_ext_idx_ctref * slab->objects;
                      ^~~~~~~~~~~~~~~~~~~~~
                      slabobj_ext_idx_objcg


vim +720 mm/slab.h

   712	
   713	static inline union codetag_ref *slab_obj_ext_codetag_ref(struct slab *slab,
   714						unsigned long obj_exts, const void *obj)
   715	{
   716		unsigned int index;
   717	
   718		index = obj_to_index(slab->slab_cache, slab, obj);
   719	
 > 720		return &slab_obj_ext(slab, obj_exts, index, slabobj_ext_idx_ctref)->_ctref;
   721	}
   722	
   723	/*
   724	 * Given slabobj_ext, return the first entry where codetag entries start.
   725	 *
   726	 * Can only be used on slabobj_ext allocated by kmalloc, not in-obj.
   727	 */
   728	static inline struct slabobj_ext *obj_ext_codetag_ref_start(struct slab *slab,
   729							struct slabobj_ext *obj_ext)
   730	{
   731		return obj_ext + slabobj_ext_idx_ctref * slab->objects;
 > 732	}
   733	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
