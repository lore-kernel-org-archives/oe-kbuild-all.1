Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F0E1386578
	for <oe-kbuild-all@lists.linux.dev>; Sat,  4 Jul 2026 06:28:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783146488; cv=none; b=G49+vu81q2USsB+vN7S7ZOAx7ITKvfRdbUjOWc+SE7x3qW6njSQQ/4VU+MxwlVtdnkz5R4p0GHEOuyH6kcMwulGX0YO+9/qixC2wq3/lPgLFv1Og60BAeiJ0J3Rqx8hBlhDz+mBZnNd147SkNHZO2e/wyYLbg+vft0+R1RpeY/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783146488; c=relaxed/simple;
	bh=SYuftC8uB1rNBHxV7MO5Hs3pXpuRV7EDdT04JM2y5bY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YDGBIVXDchJOiNoBIqcXEg7ZhdIDxCzP8W8NpOEaF6k18iCH1cdFupm9W8zfTa+ESCj9t72EXs+CIYgkNwERbiUOcEtE5MFqFAUK1oB8XTWtd1zVTXbsOK2D1xUhS7gntvmny3f323pTo8gzbe3CoUz7zRCTt+SfAlp4WsrPhYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hbI2evSJ; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hbI2evSJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783146486; x=1814682486;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=SYuftC8uB1rNBHxV7MO5Hs3pXpuRV7EDdT04JM2y5bY=;
  b=hbI2evSJP7agWDqPA3FCcPclnoHScg8anclIq1dRIpSCk7wPZxYPHWCM
   LWzCNh/EOx9ADib5umtf8VXRgGmRrztt60FBz782jREro+Cn5kmoxh60C
   L1HDy+jq3ZiS7wWejXsE+8JmMO5zeG4PiIqORU+BXGmcSgjFMgVYpORzq
   LrCp/ZbDKlEl+xn2jfnuHLdW9REhmcg9sdRJ4Dva/u4MZ2SatvEAIy0Uh
   BrV4W3dxRwYxt7h91WagXRe+K86Kun2yPHJbwcqUufh4aXpF/zj5tqA5+
   uWVvsoyc6qQT8/jj/o4Twfs7P7Sl8gckNtZ10T4ozhjvYTcFGCNQV1wd/
   Q==;
X-CSE-ConnectionGUID: rOaexzzGT0CQqAyD0AIdMQ==
X-CSE-MsgGUID: QtMHNDJjRQ2WIotc2RL85w==
X-IronPort-AV: E=McAfee;i="6800,10657,11836"; a="87784795"
X-IronPort-AV: E=Sophos;i="6.25,147,1779174000"; 
   d="scan'208";a="87784795"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2026 23:28:05 -0700
X-CSE-ConnectionGUID: zmKUGmO6QxOr/eQyxd19ew==
X-CSE-MsgGUID: W3j9GpVtQQ6Qj8ZBkSEB0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,147,1779174000"; 
   d="scan'208";a="251525268"
Received: from igk-lkp-server01.igk.intel.com (HELO e5a8ed462067) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 03 Jul 2026 23:27:59 -0700
Received: from kbuild by e5a8ed462067 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wftr2-000000001h7-20Is;
	Sat, 04 Jul 2026 06:27:56 +0000
Date: Sat, 4 Jul 2026 08:27:55 +0200
From: kernel test robot <lkp@intel.com>
To: Usama Arif <usama.arif@linux.dev>,
	Andrew Morton <akpm@linux-foundation.org>, david@kernel.org,
	chrisl@kernel.org, kasong@tencent.com, ljs@kernel.org,
	ziy@nvidia.com
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	ying.huang@linux.alibaba.com, Baoquan He <baoquan.he@linux.dev>,
	willy@infradead.org, youngjun.park@lge.com, hannes@cmpxchg.org,
	riel@surriel.com, shakeel.butt@linux.dev, alex@ghiti.fr,
	kas@kernel.org, baohua@kernel.org, dev.jain@arm.com,
	baolin.wang@linux.alibaba.com, npache@redhat.com,
	"Liam R. Howlett" <liam@infradead.org>, ryan.roberts@arm.com,
	Vlastimil Babka <vbabka@kernel.org>, lance.yang@linux.dev,
	linux-kernel@vger.kernel.org, nphamcs@gmail.com,
	shikemeng@huaweicloud.com, kernel-team@meta.com,
	Usama Arif <usama.arif@linux.dev>
Subject: Re: [PATCH v3 11/11] selftests/mm: add PMD swap entry tests
Message-ID: <202607040838.eEdmRDmU-lkp@intel.com>
References: <20260703173903.3789516-12-usama.arif@linux.dev>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260703173903.3789516-12-usama.arif@linux.dev>

Hi Usama,

kernel test robot noticed the following build errors:

[auto build test ERROR on akpm-mm/mm-everything]

url:    https://github.com/intel-lab-lkp/linux/commits/Usama-Arif/mm-add-PMD-swap-entry-detection-support/20260704-014151
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20260703173903.3789516-12-usama.arif%40linux.dev
patch subject: [PATCH v3 11/11] selftests/mm: add PMD swap entry tests
config: riscv-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260704/202607040838.eEdmRDmU-lkp@intel.com/config)
compiler: riscv64-linux-gnu-gcc (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260704/202607040838.eEdmRDmU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607040838.eEdmRDmU-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from ./include/linux/pgtable.h:6,
                    from ./include/linux/mm.h:31,
                    from arch/riscv/kernel/asm-offsets.c:9:
   ./arch/riscv/include/asm/pgtable.h: In function 'pmd_swp_exclusive':
>> ./arch/riscv/include/asm/pgtable.h:935:16: error: implicit declaration of function 'pte_swp_exclusive'; did you mean 'pmd_swp_exclusive'? [-Wimplicit-function-declaration]
     935 |         return pte_swp_exclusive(pmd_pte(pmd));
         |                ^~~~~~~~~~~~~~~~~
         |                pmd_swp_exclusive
   ./arch/riscv/include/asm/pgtable.h: In function 'pmd_swp_mkexclusive':
>> ./arch/riscv/include/asm/pgtable.h:940:24: error: implicit declaration of function 'pte_swp_mkexclusive'; did you mean 'pmd_swp_mkexclusive'? [-Wimplicit-function-declaration]
     940 |         return pte_pmd(pte_swp_mkexclusive(pmd_pte(pmd)));
         |                        ^~~~~~~~~~~~~~~~~~~
         |                        pmd_swp_mkexclusive
>> ./arch/riscv/include/asm/pgtable.h:940:24: error: incompatible type for argument 1 of 'pte_pmd'
     940 |         return pte_pmd(pte_swp_mkexclusive(pmd_pte(pmd)));
         |                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                        |
         |                        int
   ./arch/riscv/include/asm/pgtable.h:758:35: note: expected 'pte_t' but argument is of type 'int'
     758 | static inline pmd_t pte_pmd(pte_t pte)
         |                             ~~~~~~^~~
   ./arch/riscv/include/asm/pgtable.h: In function 'pmd_swp_clear_exclusive':
>> ./arch/riscv/include/asm/pgtable.h:945:24: error: implicit declaration of function 'pte_swp_clear_exclusive'; did you mean 'pmd_swp_clear_exclusive'? [-Wimplicit-function-declaration]
     945 |         return pte_pmd(pte_swp_clear_exclusive(pmd_pte(pmd)));
         |                        ^~~~~~~~~~~~~~~~~~~~~~~
         |                        pmd_swp_clear_exclusive
   ./arch/riscv/include/asm/pgtable.h:945:24: error: incompatible type for argument 1 of 'pte_pmd'
     945 |         return pte_pmd(pte_swp_clear_exclusive(pmd_pte(pmd)));
         |                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                        |
         |                        int
   ./arch/riscv/include/asm/pgtable.h:758:35: note: expected 'pte_t' but argument is of type 'int'
     758 | static inline pmd_t pte_pmd(pte_t pte)
         |                             ~~~~~~^~~
   ./arch/riscv/include/asm/pgtable.h: At top level:
>> ./arch/riscv/include/asm/pgtable.h:1218:20: error: conflicting types for 'pte_swp_exclusive'; have 'bool(pte_t)' {aka '_Bool(pte_t)'}
    1218 | static inline bool pte_swp_exclusive(pte_t pte)
         |                    ^~~~~~~~~~~~~~~~~
   ./arch/riscv/include/asm/pgtable.h:935:16: note: previous implicit declaration of 'pte_swp_exclusive' with type 'int()'
     935 |         return pte_swp_exclusive(pmd_pte(pmd));
         |                ^~~~~~~~~~~~~~~~~
>> ./arch/riscv/include/asm/pgtable.h:1223:21: error: conflicting types for 'pte_swp_mkexclusive'; have 'pte_t(pte_t)'
    1223 | static inline pte_t pte_swp_mkexclusive(pte_t pte)
         |                     ^~~~~~~~~~~~~~~~~~~
   ./arch/riscv/include/asm/pgtable.h:940:24: note: previous implicit declaration of 'pte_swp_mkexclusive' with type 'int()'
     940 |         return pte_pmd(pte_swp_mkexclusive(pmd_pte(pmd)));
         |                        ^~~~~~~~~~~~~~~~~~~
>> ./arch/riscv/include/asm/pgtable.h:1228:21: error: conflicting types for 'pte_swp_clear_exclusive'; have 'pte_t(pte_t)'
    1228 | static inline pte_t pte_swp_clear_exclusive(pte_t pte)
         |                     ^~~~~~~~~~~~~~~~~~~~~~~
   ./arch/riscv/include/asm/pgtable.h:945:24: note: previous implicit declaration of 'pte_swp_clear_exclusive' with type 'int()'
     945 |         return pte_pmd(pte_swp_clear_exclusive(pmd_pte(pmd)));
         |                        ^~~~~~~~~~~~~~~~~~~~~~~


vim +935 ./arch/riscv/include/asm/pgtable.h

   932	
   933	static inline bool pmd_swp_exclusive(pmd_t pmd)
   934	{
 > 935		return pte_swp_exclusive(pmd_pte(pmd));
   936	}
   937	
   938	static inline pmd_t pmd_swp_mkexclusive(pmd_t pmd)
   939	{
 > 940		return pte_pmd(pte_swp_mkexclusive(pmd_pte(pmd)));
   941	}
   942	
   943	static inline pmd_t pmd_swp_clear_exclusive(pmd_t pmd)
   944	{
 > 945		return pte_pmd(pte_swp_clear_exclusive(pmd_pte(pmd)));
   946	}
   947	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
