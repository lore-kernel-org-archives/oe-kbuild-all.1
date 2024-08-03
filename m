Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C03210A03
	for <oe-kbuild-all@lists.linux.dev>; Sat,  3 Aug 2024 03:38:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722656291; cv=none; b=JI7KG996uSL582lD7gt+sP1OiibQrrJXTbEmAIUjfEY3Yzk+fNy667M8yIAVdD9p3ADzfYB2/ye7oiuWzRuGrW31qdnTnDfzS2gJtZkT0eBWREWsBm7MNqaMIVaJjlcqu9yrE68KPESRHWv0qMKRuW7DeUSVrO6ILHQZdT6LGtw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722656291; c=relaxed/simple;
	bh=uQmly+aduvYGZD+Hy6WfD8uHBSscy1RfRi1kZz+Gyzo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Q27seheWIDqvJtM+nitEW6+clKCv/Wc/s7Z36njxAQlDKQ5aTENyxWYB/IkfBfU67kvxrDgN5+8Rmu0Zbv24KNj7QGrReGweXYh0d795OEq6zRkpDyMfBlvE+reDbt9LFWa2fF/WNCLZ9jauqZ8rEEXLNjsOTusUdVcigGP0+n0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kBu69Hkv; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kBu69Hkv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722656290; x=1754192290;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uQmly+aduvYGZD+Hy6WfD8uHBSscy1RfRi1kZz+Gyzo=;
  b=kBu69HkvZiqf1QvgEdY6WgJzohANwrGqPqy7W4UppJiPQkoOuHeRqQtX
   G+ik5g4MFZI+xhIYdRw2dmGpXB9phu9NbtNhSU6LNHJ78RMC72bBqAJ/r
   LiKVew6tzYg0GWLWzVzYl/Vbd7D/NBpCaRV2EQGOr+ds7QPtmdnK/GWL0
   gmIx0CHvF7UBUa4QudTBk9piyFE5x5xm0LWecYIh9OEeFKe1IQm9g7DH6
   UalxnIhJpIXcihT3TcgRmMdxMHpIYweffoNQHnVUG8rIEP+OGOpGa14YZ
   fwOLrAVqnZ6RXlHc/ImhQupWvgpyH5zicAlcjawU7CjbIT64v5RlFYu7C
   Q==;
X-CSE-ConnectionGUID: XbOW8eQpQK29ritU1tUZKw==
X-CSE-MsgGUID: 0fi9NMeeRdSr3jkgKljrNw==
X-IronPort-AV: E=McAfee;i="6700,10204,11152"; a="20858647"
X-IronPort-AV: E=Sophos;i="6.09,259,1716274800"; 
   d="scan'208";a="20858647"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Aug 2024 20:38:09 -0700
X-CSE-ConnectionGUID: /dTWIEcfTye2XlXfg70hYw==
X-CSE-MsgGUID: G4LhJ4EaTluhFjHKiLdBLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,259,1716274800"; 
   d="scan'208";a="60451169"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 02 Aug 2024 20:38:08 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sa5an-000xxc-36;
	Sat, 03 Aug 2024 03:38:05 +0000
Date: Sat, 3 Aug 2024 11:37:26 +0800
From: kernel test robot <lkp@intel.com>
To: alexs@kernel.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [alexshi:ptdesc 10/17] arch/sparc/mm/init_64.c:2929:6: error:
 conflicting types for 'pte_free'; have 'void(struct mm_struct *, pte_t *)'
Message-ID: <202408031110.EOzBrWZv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/alexshi/linux.git ptdesc
head:   3735e634f8feb67c941d17222b53906ace2fd2b8
commit: d748ee9b31c9b19e632c16c5ed9dc28e530f44af [10/17] mm/pgtable: pass ptdesc to pte_free()
config: sparc-allmodconfig (https://download.01.org/0day-ci/archive/20240803/202408031110.EOzBrWZv-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240803/202408031110.EOzBrWZv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408031110.EOzBrWZv-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/sparc/mm/init_64.c: In function 'arch_hugetlb_valid_size':
   arch/sparc/mm/init_64.c:361:24: warning: variable 'hv_pgsz_idx' set but not used [-Wunused-but-set-variable]
     361 |         unsigned short hv_pgsz_idx;
         |                        ^~~~~~~~~~~
   arch/sparc/mm/init_64.c: At top level:
>> arch/sparc/mm/init_64.c:2929:6: error: conflicting types for 'pte_free'; have 'void(struct mm_struct *, pte_t *)'
    2929 | void pte_free(struct mm_struct *mm, pgtable_t pte)
         |      ^~~~~~~~
   In file included from arch/sparc/include/asm/pgalloc.h:5,
                    from arch/sparc/mm/init_64.c:34:
   arch/sparc/include/asm/pgalloc_64.h:66:6: note: previous declaration of 'pte_free' with type 'void(struct mm_struct *, struct ptdesc *)'
      66 | void pte_free(struct mm_struct *mm, struct ptdesc *ptepage);
         |      ^~~~~~~~


vim +2929 arch/sparc/mm/init_64.c

c460bec78d9257 David Miller 2012-10-08  2928  
c460bec78d9257 David Miller 2012-10-08 @2929  void pte_free(struct mm_struct *mm, pgtable_t pte)
c460bec78d9257 David Miller 2012-10-08  2930  {
c460bec78d9257 David Miller 2012-10-08  2931  	__pte_free(pte);
c460bec78d9257 David Miller 2012-10-08  2932  }
c460bec78d9257 David Miller 2012-10-08  2933  

:::::: The code at line 2929 was first introduced by commit
:::::: c460bec78d9257a54bcc5f9d5fadf89f8c70dbd1 sparc64: Eliminate PTE table memory wastage.

:::::: TO: David Miller <davem@davemloft.net>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
