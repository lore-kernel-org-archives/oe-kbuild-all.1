Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E92FB3DB80
	for <oe-kbuild-all@lists.linux.dev>; Fri, 24 Nov 2023 23:40:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QZStoXWT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700869201; x=1732405201;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=0hj1+3v21Fv39Eam6DFssLEv/b4E+azszZdBCgSxoZo=;
  b=QZStoXWTs+0lf3Lj6PveucQibsAgZPmy/q0lHPiXCOqutmBXASt83IOi
   NvyHkczeGnKzmp3BCNOYaOKPpZaf+pT0xPcU447S7ivY03itRALl51ELi
   wkK5C5x1i7wZ4Mei+ESwed2zWGbZpstFTBji48Ofudb1Dk2kLdQ40XILu
   kWN+th2q5Ei8Ex/CsbeiRZ4FdHNLeRIeK62PgwGtuy4ndGyQkBhZxHqG6
   ZwPyOkZzSj+c9qS/YOVo2Cvw0JEBrWhKzb6ckIliQ7wPNmG7KDBd2gQfC
   l0VonVVy1evariKv8Tollb0eJheZQArkTxAner62dUg3avc0scP3pBAon
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10904"; a="396383130"
X-IronPort-AV: E=Sophos;i="6.04,224,1695711600"; 
   d="scan'208";a="396383130"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2023 15:40:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10904"; a="1015007949"
X-IronPort-AV: E=Sophos;i="6.04,224,1695711600"; 
   d="scan'208";a="1015007949"
Received: from lkp-server01.sh.intel.com (HELO d584ee6ebdcc) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 24 Nov 2023 15:40:00 -0800
Received: from kbuild by d584ee6ebdcc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r6fmA-0003OH-0O;
	Fri, 24 Nov 2023 23:39:58 +0000
Date: Sat, 25 Nov 2023 07:39:00 +0800
From: kernel test robot <lkp@intel.com>
To: David Hildenbrand <david@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH WIP v1 17/20] mm/rmap_id: reduce atomic RMW operations
 when we are the exclusive writer
Message-ID: <202311250405.RJLLR5GA-lkp@intel.com>
References: <20231124132626.235350-18-david@redhat.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231124132626.235350-18-david@redhat.com>

Hi David,

kernel test robot noticed the following build errors:

[auto build test ERROR on b85ea95d086471afb4ad062012a4d73cd328fa86]

url:    https://github.com/intel-lab-lkp/linux/commits/David-Hildenbrand/mm-rmap-factor-out-adding-folio-range-into-__folio_add_rmap_range/20231124-213038
base:   b85ea95d086471afb4ad062012a4d73cd328fa86
patch link:    https://lore.kernel.org/r/20231124132626.235350-18-david%40redhat.com
patch subject: [PATCH WIP v1 17/20] mm/rmap_id: reduce atomic RMW operations when we are the exclusive writer
config: riscv-randconfig-r071-20231125 (https://download.01.org/0day-ci/archive/20231125/202311250405.RJLLR5GA-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231125/202311250405.RJLLR5GA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311250405.RJLLR5GA-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from mm/filemap.c:40:
>> include/linux/rmap.h:304:3: error: call to undeclared function 'prefetchw'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     304 |                 prefetchw(&folio->_rmap_val0);
         |                 ^
   1 error generated.
--
   In file included from mm/mremap.c:15:
   In file included from include/linux/ksm.h:14:
>> include/linux/rmap.h:304:3: error: call to undeclared function 'prefetchw'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     304 |                 prefetchw(&folio->_rmap_val0);
         |                 ^
   In file included from mm/mremap.c:16:
   include/linux/mman.h:158:9: warning: division by zero is undefined [-Wdivision-by-zero]
     158 |                _calc_vm_trans(flags, MAP_SYNC,       VM_SYNC      ) |
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/mman.h:136:21: note: expanded from macro '_calc_vm_trans'
     136 |    : ((x) & (bit1)) / ((bit1) / (bit2))))
         |                     ^ ~~~~~~~~~~~~~~~~~
   1 warning and 1 error generated.


vim +/prefetchw +304 include/linux/rmap.h

   293	
   294	static inline bool __folio_write_large_rmap_begin(struct folio *folio)
   295	{
   296		bool exclusive;
   297	
   298		VM_WARN_ON_FOLIO(!folio_test_large_rmappable(folio), folio);
   299		VM_WARN_ON_FOLIO(folio_test_hugetlb(folio), folio);
   300	
   301		exclusive = raw_write_atomic_seqcount_begin(&folio->_rmap_atomic_seqcount,
   302							    true);
   303		if (likely(exclusive)) {
 > 304			prefetchw(&folio->_rmap_val0);
   305			if (unlikely(folio_order(folio) > RMAP_SUBID_4_MAX_ORDER))
   306				prefetchw(&folio->_rmap_val4);
   307		}
   308		return exclusive;
   309	}
   310	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
