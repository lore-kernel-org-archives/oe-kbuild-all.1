Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E90063FE667
	for <oe-kbuild-all@lists.linux.dev>; Wed,  8 Jul 2026 22:39:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783550379; cv=none; b=N362Djq2oFYObHkq8cYb3YOZFc4P7fQdqrRAuELDaa6morP5VkF4PVca9IDvEv9JI1QC+NJHCBvY83xhmobGrY7siEPQUIvH9DMtN0y9Vl2iN6vkVaq7NosC1JsHYNSPrYk/aMB5Oru4Cd9N7DzCVheW4HkL1NrHol97l5RS/mY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783550379; c=relaxed/simple;
	bh=wADXUEpR2ugvObMMvmUyVa4FOyTwlbJTa4vXdceW+pY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=mZAy3yvXRnZfJ3zaKlQ8MPAO8i4I7wkxwr5W4FvR93VGAnqU/nOpnWl/8Ka3NAO3vyHvfKcFP/MANIRwhTzDdu4o3wj1FYRRtrBHoI4dxtbOEUrsBJ6+1prDofp5zs7vbQfv9XWXlfX9BW4iRMObLVRnAArPaLKVGqhugVHNqzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TmJcyn4L; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TmJcyn4L"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783550378; x=1815086378;
  h=date:from:to:cc:subject:message-id;
  bh=wADXUEpR2ugvObMMvmUyVa4FOyTwlbJTa4vXdceW+pY=;
  b=TmJcyn4LzPvULXZ517ZEcxY7jTFxstniznFxNq9BDfgnbGMtcAxJTsTc
   HtGmTULO3ksiXWOxhkOKuK4tbaO3FZk0ikgF5jGne5taACTiz0hKzc4aJ
   GYqS5RjpBX65Rbp1R4G67wJGk1DScRR7wQk6NHxekVBmNKLgyIsuTe+Ok
   fDHTZNaohwKE9NgDmZP68kJ4yQFG6W6O/oFktVPiv5u1KnUv2zFGYlPf9
   qFGPg4DxFdBO8jHBGu5ryvFRPleigpQM4BMEyeXDQv+gW4NfjsVHO0UXG
   SLAsQEsNC6ZIJoug/Z8ZXeXUkM2+g67UhXek5MGFQq0GD41IbNN3PTvw6
   Q==;
X-CSE-ConnectionGUID: bol1QlmiS6CGm2BbB6aP3Q==
X-CSE-MsgGUID: s8qnLGeOQxeHoizTAItNDA==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="101652974"
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; 
   d="scan'208";a="101652974"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2026 15:39:37 -0700
X-CSE-ConnectionGUID: v8kijb8MStCdzCUXHmzYPQ==
X-CSE-MsgGUID: xpUU4X3sSNyVTJCUHbs64Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; 
   d="scan'208";a="253322118"
Received: from igk-lkp-server01.igk.intel.com (HELO e5a8ed462067) ([10.211.93.152])
  by orviesa010.jf.intel.com with ESMTP; 08 Jul 2026 15:39:36 -0700
Received: from kbuild by e5a8ed462067 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1whavV-000000002ov-3UtS;
	Wed, 08 Jul 2026 22:39:33 +0000
Date: Thu, 09 Jul 2026 00:39:27 +0200
From: kernel test robot <lkp@intel.com>
To: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [vbabka:objext_split 12/14] mm/slab.h:720:53: error:
 'slabobj_ext_idx_ctref' undeclared; did you mean 'slabobj_ext_idx_objcg'?
Message-ID: <202607090000.mMtXeCpL-lkp@intel.com>
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
config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20260709/202607090000.mMtXeCpL-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260709/202607090000.mMtXeCpL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607090000.mMtXeCpL-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from mm/mempool.c:21:
   mm/slab.h: In function 'slab_obj_ext_codetag_ref':
>> mm/slab.h:720:53: error: 'slabobj_ext_idx_ctref' undeclared (first use in this function); did you mean 'slabobj_ext_idx_objcg'?
     720 |         return &slab_obj_ext(slab, obj_exts, index, slabobj_ext_idx_ctref)->_ctref;
         |                                                     ^~~~~~~~~~~~~~~~~~~~~
         |                                                     slabobj_ext_idx_objcg
   mm/slab.h:720:53: note: each undeclared identifier is reported only once for each function it appears in
   mm/slab.h: In function 'obj_ext_codetag_ref_start':
   mm/slab.h:731:26: error: 'slabobj_ext_idx_ctref' undeclared (first use in this function); did you mean 'slabobj_ext_idx_objcg'?
     731 |         return obj_ext + slabobj_ext_idx_ctref * slab->objects;
         |                          ^~~~~~~~~~~~~~~~~~~~~
         |                          slabobj_ext_idx_objcg
--
   In file included from mm/slub.c:23:
   mm/slab.h: In function 'slab_obj_ext_codetag_ref':
>> mm/slab.h:720:53: error: 'slabobj_ext_idx_ctref' undeclared (first use in this function); did you mean 'slabobj_ext_idx_objcg'?
     720 |         return &slab_obj_ext(slab, obj_exts, index, slabobj_ext_idx_ctref)->_ctref;
         |                                                     ^~~~~~~~~~~~~~~~~~~~~
         |                                                     slabobj_ext_idx_objcg
   mm/slab.h:720:53: note: each undeclared identifier is reported only once for each function it appears in
   mm/slab.h: In function 'obj_ext_codetag_ref_start':
   mm/slab.h:731:26: error: 'slabobj_ext_idx_ctref' undeclared (first use in this function); did you mean 'slabobj_ext_idx_objcg'?
     731 |         return obj_ext + slabobj_ext_idx_ctref * slab->objects;
         |                          ^~~~~~~~~~~~~~~~~~~~~
         |                          slabobj_ext_idx_objcg
>> mm/slab.h:732:1: warning: control reaches end of non-void function [-Wreturn-type]
     732 | }
         | ^


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
