Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92593DF59
	for <oe-kbuild-all@lists.linux.dev>; Mon, 27 Jan 2025 18:51:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738003909; cv=none; b=iFA/o1RfeAvppjgzmVdjzbDm+wijY8hj9IJDjY1U40+tl9Ho8W7L1yIZR2IPgmPaHEnZ0g/4xkECkBcIKwJzBzHbLGI4+9oZOrucapP6+WSPh1ZPVcrGgxwX7nGdYPOclNEBxeqQ4eETW2cAr4kKNW4Bz/G2wkUnlPy54hd+64M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738003909; c=relaxed/simple;
	bh=BEU67Jkz3ucrAEQllixe1RsAKlKSc91WHtz43zYJWLo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JIjisfPnKce3y3Wp90MjL+LDzw+hKsTM2CXmKKN0bUfPLllpwp4R8WaTK9L+3JFWS1k34N8+UI5r68cTKrzl3AQW7lV9EJlTXQenwTGaAscJBcyfUeJizC6YCB7F1DP86e/gzyeq59VqzeZ/J6Me1+ajdnEGfCgePMguSeXBppw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mAeIX8XL; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mAeIX8XL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738003908; x=1769539908;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=BEU67Jkz3ucrAEQllixe1RsAKlKSc91WHtz43zYJWLo=;
  b=mAeIX8XLTIIIbF5yG/QkGNA1na9UBTyMpPBpDj1xoL5qz4j4S3fX3+RV
   3yEn+oc/E8ry4fmzmnWURg0hsNM9urZxBTUp7R2F78fWKA8nv8QHmroys
   eFeHNn5bZnGKOglZXCsPKLocpgocLy+/xxsWloSbLlHRbGhxh+SjIdgjw
   5j40izSdsvZ3sLY0siXVwl6oB9efRQISJJjyJjMqXTxCVK91J/eSU1FxK
   gPccgS+1aqqUGwuS85Fr2bMREHdpBDOxcBwG8KMqTiW2P+UMY0zTSVDjk
   yrPc+Yz8S4rF0L2JFmn6Ygg1FnjiB3PZ5MGG+/WByB5X57kBRuAlxcQiZ
   A==;
X-CSE-ConnectionGUID: uk3LtWiSQZS9AQDaO49mog==
X-CSE-MsgGUID: zmhL3bc5QhSautl40a/PAQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11328"; a="42143666"
X-IronPort-AV: E=Sophos;i="6.13,239,1732608000"; 
   d="scan'208";a="42143666"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2025 10:51:40 -0800
X-CSE-ConnectionGUID: GYwJxa2RQZi3hB2yOG5nRg==
X-CSE-MsgGUID: t4bxgcvKQlekElUQB2kg4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="113150935"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 27 Jan 2025 10:51:37 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tcUCs-000h4Z-32;
	Mon, 27 Jan 2025 18:51:34 +0000
Date: Tue, 28 Jan 2025 02:50:55 +0800
From: kernel test robot <lkp@intel.com>
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	"Liam R . Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/5] mm: completely abstract unnecessary adj_start
 calculation
Message-ID: <202501280232.qYHi6Rkt-lkp@intel.com>
References: <ef00aec42a892fe6ac9557b3a11f18f30a2e51b3.1737929364.git.lorenzo.stoakes@oracle.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ef00aec42a892fe6ac9557b3a11f18f30a2e51b3.1737929364.git.lorenzo.stoakes@oracle.com>

Hi Lorenzo,

kernel test robot noticed the following build warnings:

[auto build test WARNING on akpm-mm/mm-everything]

url:    https://github.com/intel-lab-lkp/linux/commits/Lorenzo-Stoakes/mm-simplify-vma-merge-structure-and-expand-comments/20250127-235322
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/ef00aec42a892fe6ac9557b3a11f18f30a2e51b3.1737929364.git.lorenzo.stoakes%40oracle.com
patch subject: [PATCH 5/5] mm: completely abstract unnecessary adj_start calculation
config: um-randconfig-001-20250128 (https://download.01.org/0day-ci/archive/20250128/202501280232.qYHi6Rkt-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250128/202501280232.qYHi6Rkt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501280232.qYHi6Rkt-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/uapi/linux/posix_types.h:5,
                    from include/uapi/linux/types.h:14,
                    from include/linux/types.h:6,
                    from include/linux/kasan-checks.h:5,
                    from include/asm-generic/rwonce.h:26,
                    from ./arch/x86/include/generated/asm/rwonce.h:1,
                    from include/linux/compiler.h:339,
                    from include/linux/array_size.h:5,
                    from include/linux/kernel.h:16,
                    from include/linux/backing-dev.h:12,
                    from mm/vma_internal.h:12,
                    from mm/vma.c:7:
   mm/vma.c: In function '__split_vma':
>> include/linux/stddef.h:8:14: warning: passing argument 4 of 'vma_adjust_trans_huge' makes integer from pointer without a cast [-Wint-conversion]
       8 | #define NULL ((void *)0)
         |              ^~~~~~~~~~~
         |              |
         |              void *
   mm/vma.c:518:57: note: in expansion of macro 'NULL'
     518 |         vma_adjust_trans_huge(vma, vma->vm_start, addr, NULL);
         |                                                         ^~~~
   In file included from include/linux/mm.h:1133,
                    from arch/um/include/asm/tlbflush.h:9,
                    from arch/um/include/asm/cacheflush.h:4,
                    from include/linux/cacheflush.h:5,
                    from include/linux/highmem.h:8,
                    from include/linux/bvec.h:10,
                    from include/linux/blk_types.h:10,
                    from include/linux/writeback.h:13,
                    from include/linux/backing-dev.h:16:
   include/linux/huge_mm.h:574:47: note: expected 'long int' but argument is of type 'void *'
     574 |                                          long adjust_next)
         |                                          ~~~~~^~~~~~~~~~~
   mm/vma.c: In function 'commit_merge':
>> mm/vma.c:704:56: warning: passing argument 4 of 'vma_adjust_trans_huge' makes integer from pointer without a cast [-Wint-conversion]
     704 |                               adj_middle ? vmg->middle : NULL);
   include/linux/huge_mm.h:574:47: note: expected 'long int' but argument is of type 'struct vm_area_struct *'
     574 |                                          long adjust_next)
         |                                          ~~~~~^~~~~~~~~~~
   mm/vma.c: In function 'vma_shrink':
>> include/linux/stddef.h:8:14: warning: passing argument 4 of 'vma_adjust_trans_huge' makes integer from pointer without a cast [-Wint-conversion]
       8 | #define NULL ((void *)0)
         |              ^~~~~~~~~~~
         |              |
         |              void *
   mm/vma.c:1141:48: note: in expansion of macro 'NULL'
    1141 |         vma_adjust_trans_huge(vma, start, end, NULL);
         |                                                ^~~~
   include/linux/huge_mm.h:574:47: note: expected 'long int' but argument is of type 'void *'
     574 |                                          long adjust_next)
         |                                          ~~~~~^~~~~~~~~~~


vim +/vma_adjust_trans_huge +8 include/linux/stddef.h

^1da177e4c3f41 Linus Torvalds   2005-04-16  6  
^1da177e4c3f41 Linus Torvalds   2005-04-16  7  #undef NULL
^1da177e4c3f41 Linus Torvalds   2005-04-16 @8  #define NULL ((void *)0)
6e218287432472 Richard Knutsson 2006-09-30  9  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
