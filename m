Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0956D3F8248
	for <oe-kbuild-all@lists.linux.dev>; Wed,  8 Jul 2026 21:48:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783547333; cv=none; b=RJrUpNgW9ANlmkH0E5esNL/XzcCQhgrRH4cqV3mHPZZ5AUc2LhBEzUzZERhbadSGVVNAO4HDiyqYFpHbKvfcVAqoiiKL/lXwmRVYjpMjgEsf7ItR/x3lcymuwTpurYqty6ah0lp8a+sbZCpzXlxjAibghFZYHgMXe+TpcZuG3IA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783547333; c=relaxed/simple;
	bh=NBv2+d2E9dSssZGd7GU+xppUw0lAkurVNhSFw0Yrd/0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=MSwPFEbm4dg6GKP6oNQEVWQZ/7WnwDXktPJF0J+0P9WoxOAWgUlaJAN3qbPoWkWpotUPPTSCPMdrFdpEUgqTAT7JA3Xhk+7pH+NCcKkP2kYCvIXe0nQ/PegmTHVt/T8PBO2jhdEBOfjMkJICDgxBc33RmshYZCJfH+gebeaSN/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=d54jXhFK; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d54jXhFK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783547331; x=1815083331;
  h=date:from:to:cc:subject:message-id;
  bh=NBv2+d2E9dSssZGd7GU+xppUw0lAkurVNhSFw0Yrd/0=;
  b=d54jXhFK/KTYcwY/DNkpbyRzdxByjTV8VSRaHYDnJ/N/JZsDr2Ml3Eo/
   p7Q1QuNtaxDSiVAS4IzOc/7wq8zVeQiC3Bld5spia06Q7n5gUG9vARIcB
   tYige+79rpRzqJuHAU4CDZsmaFX139Pqo/8KeQAR3DY3BfQnyVEN0BR3H
   t1RSuNKW5G/TIaoeUWzhZh+lXD28WZPdg5RTXzZBQgkRLmyTjLaI2t8gn
   N9/47+EmIP7E1htDkyfd4zSg7Uw5qBOnoaQK9nc5VyXpwMKcOdm6xn5Ay
   GwMSS1YSrrI+0aptwz9gmmuwUmTmSsX0q3Pvw2Lo2HwAGHVnyEYx10Kbs
   w==;
X-CSE-ConnectionGUID: rfHYu7JuR82uKjGYNz/xAA==
X-CSE-MsgGUID: yHC8m5qxSvqip/8L3N9JHQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="84319801"
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; 
   d="scan'208";a="84319801"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2026 14:48:37 -0700
X-CSE-ConnectionGUID: EU+2HRlcSqOvUU/takOwwA==
X-CSE-MsgGUID: ZrBZFmRZSm6kCCVt9gV3mg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; 
   d="scan'208";a="255047414"
Received: from igk-lkp-server01.igk.intel.com (HELO e5a8ed462067) ([10.211.93.152])
  by orviesa009.jf.intel.com with ESMTP; 08 Jul 2026 14:48:34 -0700
Received: from kbuild by e5a8ed462067 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wha88-000000002nh-1oM8;
	Wed, 08 Jul 2026 21:48:32 +0000
Date: Wed, 08 Jul 2026 23:48:06 +0200
From: kernel test robot <lkp@intel.com>
To: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [vbabka:objext_split 12/14] mm/kasan/../slab.h:720:53:
 error: 'slabobj_ext_idx_ctref' undeclared; did you mean
 'slabobj_ext_idx_objcg'?
Message-ID: <202607082341.NlRjraUn-lkp@intel.com>
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
config: x86_64-rhel-9.4-func (https://download.01.org/0day-ci/archive/20260708/202607082341.NlRjraUn-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260708/202607082341.NlRjraUn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607082341.NlRjraUn-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from mm/kasan/common.c:34:
   mm/kasan/../slab.h: In function 'slab_obj_ext_codetag_ref':
>> mm/kasan/../slab.h:720:53: error: 'slabobj_ext_idx_ctref' undeclared (first use in this function); did you mean 'slabobj_ext_idx_objcg'?
     720 |         return &slab_obj_ext(slab, obj_exts, index, slabobj_ext_idx_ctref)->_ctref;
         |                                                     ^~~~~~~~~~~~~~~~~~~~~
         |                                                     slabobj_ext_idx_objcg
   mm/kasan/../slab.h:720:53: note: each undeclared identifier is reported only once for each function it appears in
   mm/kasan/../slab.h: In function 'obj_ext_codetag_ref_start':
   mm/kasan/../slab.h:731:26: error: 'slabobj_ext_idx_ctref' undeclared (first use in this function); did you mean 'slabobj_ext_idx_objcg'?
     731 |         return obj_ext + slabobj_ext_idx_ctref * slab->objects;
         |                          ^~~~~~~~~~~~~~~~~~~~~
         |                          slabobj_ext_idx_objcg


vim +720 mm/kasan/../slab.h

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

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
