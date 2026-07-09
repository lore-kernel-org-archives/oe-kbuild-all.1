Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 772C9409115
	for <oe-kbuild-all@lists.linux.dev>; Thu,  9 Jul 2026 10:00:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783591240; cv=none; b=EPUKdslAbpHbFGaUVOlFconNH0n1vTfWvQu5n86hopL6GWMlxGhrlLqWBa8qO1MWA/YmSQNLjyLUYDie5Ub3nxovd0Jp9Ir8nq4PWViMtk0bN7/KVUwsUkJbYS+VTeFCsLFy1YaNYO66C3PQG5bR3FcSLkzWtXyoJqpAFkmM8G0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783591240; c=relaxed/simple;
	bh=LSn4Jvf1BWjtzBzSbTe++o7RcJR/+ZFZoKSJ6zEyF+E=;
	h=Date:From:To:Cc:Subject:Message-ID; b=hGC6ABfiGCurORf/yau2jroOSG5ZRGlCx4mamnX4GDSXKBT+qYMvPgLXPE9F1NyCWVveGH3C+sUPnWF00QC+I9rkBkfPkyW0dgjUp/c/jQ7m9MAwA13xyDzmfT9aeUWAZYpOOpdcAhE/sSUsbJmr6WkQ22TV0YnFjmgd2cWKGPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TGfYgwlo; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TGfYgwlo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783591240; x=1815127240;
  h=date:from:to:cc:subject:message-id;
  bh=LSn4Jvf1BWjtzBzSbTe++o7RcJR/+ZFZoKSJ6zEyF+E=;
  b=TGfYgwloH50f/vef/xNmOnzcEtBAZyFJeJoOzarCQ+Znr9tWjTR4VUUP
   W7bysJy1qodv3Pwhr5RLkIX7Hko69NB2nrJZAXXUvUvejqO1Km2n6tYbY
   g65AkkI9D7Gj3WCi3Du3QUbu155BQG/7f3RZaOzJ+BxpDzU09CAoTI+I7
   XiZ6KdhTA9rvuWHo6j1vXQEjSYGtyMAZkWc33T8bj7FHbJUY4QnqhZNCL
   q5+r6tKHbmHnmaat0Pigq23y/YOoktnbQ8GbMm3seLfRPMnR+/jnJvfsq
   HDV5Hrw/DYAASlWw5iqOyykDJQBbObZk1d8clmjmmHj+z531mSnAbjAnd
   w==;
X-CSE-ConnectionGUID: ivUH7keLQOiJGCKdhSfuPA==
X-CSE-MsgGUID: 1Jc2zL5fTaK9miKiNbrxsA==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="71787457"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="71787457"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2026 03:00:36 -0700
X-CSE-ConnectionGUID: h49q/NC/QeOQQcBev36T/w==
X-CSE-MsgGUID: njPCmPbqSt+HIsyAj5HCbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="258845033"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 09 Jul 2026 03:00:34 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1whlYV-00000000HXD-0IEx;
	Thu, 09 Jul 2026 10:00:31 +0000
Date: Thu, 09 Jul 2026 17:59:50 +0800
From: kernel test robot <lkp@intel.com>
To: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [vbabka:objext_split 12/14] mm/kasan/../slab.h:682:46:
 error: incompatible pointer to integer conversion passing 'struct obj_cgroup
 *(struct slab *, unsigned long, void *)' to parameter of type 'enum
 slabobj_ext_idx'
Message-ID: <202607091730.YK6isCtp-lkp@intel.com>
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
config: powerpc64-randconfig-r062-20260709 (https://download.01.org/0day-ci/archive/20260709/202607091730.YK6isCtp-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project b3e6e6dabdc02153552a64fc74ff5c7532447eed)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260709/202607091730.YK6isCtp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607091730.YK6isCtp-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from mm/kasan/common.c:34:
   mm/kasan/../slab.h:682:46: error: use of undeclared identifier 'slabobj_ext_idx_objcg'; did you mean 'slab_obj_ext_get_objcg'?
     682 |         objcg = slab_obj_ext(slab, obj_exts, index, slabobj_ext_idx_objcg)->_objcg;
         |                                                     ^~~~~~~~~~~~~~~~~~~~~
         |                                                     slab_obj_ext_get_objcg
   mm/kasan/../slab.h:673:34: note: 'slab_obj_ext_get_objcg' declared here
     673 | static inline struct obj_cgroup *slab_obj_ext_get_objcg(struct slab *slab,
         |                                  ^
>> mm/kasan/../slab.h:682:46: error: incompatible pointer to integer conversion passing 'struct obj_cgroup *(struct slab *, unsigned long, void *)' to parameter of type 'enum slabobj_ext_idx' [-Wint-conversion]
     682 |         objcg = slab_obj_ext(slab, obj_exts, index, slabobj_ext_idx_objcg)->_objcg;
         |                                                     ^~~~~~~~~~~~~~~~~~~~~
   mm/kasan/../slab.h:655:34: note: passing argument to parameter 'ext_idx' here
     655 |                                                enum slabobj_ext_idx ext_idx)
         |                                                                     ^
   mm/kasan/../slab.h:682:70: error: no member named '_objcg' in 'struct slabobj_ext'
     682 |         objcg = slab_obj_ext(slab, obj_exts, index, slabobj_ext_idx_objcg)->_objcg;
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  ^
   mm/kasan/../slab.h:702:48: error: use of undeclared identifier 'slabobj_ext_idx_objcg'
     702 |         obj_ext = slab_obj_ext(slab, obj_exts, index, slabobj_ext_idx_objcg);
         |                                                       ^~~~~~~~~~~~~~~~~~~~~
   mm/kasan/../slab.h:703:23: error: no member named '_objcg' in 'struct slabobj_ext'
     703 |         objcg_old = obj_ext->_objcg;
         |                     ~~~~~~~  ^
   mm/kasan/../slab.h:706:12: error: no member named '_objcg' in 'struct slabobj_ext'
     706 |                 obj_ext->_objcg = objcg_new;
         |                 ~~~~~~~  ^
   6 errors generated.


vim +682 mm/kasan/../slab.h

   672	
   673	static inline struct obj_cgroup *slab_obj_ext_get_objcg(struct slab *slab,
   674						unsigned long obj_exts, void *obj)
   675	{
   676		struct obj_cgroup *objcg;
   677		unsigned int index;
   678	
   679		index = obj_to_index(slab->slab_cache, slab, obj);
   680	
   681		get_slab_obj_exts(obj_exts);
 > 682		objcg = slab_obj_ext(slab, obj_exts, index, slabobj_ext_idx_objcg)->_objcg;
   683		put_slab_obj_exts(obj_exts);
   684	
   685		return objcg;
   686	}
   687	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
