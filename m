Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D6223939A3
	for <oe-kbuild-all@lists.linux.dev>; Sat,  4 Jul 2026 08:30:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783153836; cv=none; b=K5LBJ1tn+lVzNzfkVGFYZGSk2X8bXpTc+I4H5HVy1bCW3ndn4ULk2tDyZ4x435K1BALJDCTN8n38VVOy1Tm1EUMJErl+Iljvgwa2OAdutnAIm985RFGeccp3RQELV9JKWkxwgJwDApD8jK9Hz+7J4SdnxfshtAFDhqNbyNq5O6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783153836; c=relaxed/simple;
	bh=t8Wve+zCGKQ9qOCHG69zYigboHkp3m6KJ8RSx4VkhPE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i7D8lW8k4CEHRxVMAJ2ysz6Yul+ef8IlpPD7vZPx0n0TQojFfGTx8fTa3zqWl1D+wMnAv2GQakWSc1n2vqRWw+W1Lx2ybaLqf6Va+6Df+xjorkoLdDmVzTS+vwv96fr64E+tJ73+B7kfZyXUS+LaIiVytsfH7iRIofMVLjlFbmg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YtcTCRxd; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YtcTCRxd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783153833; x=1814689833;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=t8Wve+zCGKQ9qOCHG69zYigboHkp3m6KJ8RSx4VkhPE=;
  b=YtcTCRxd+Ab2VUnv4PH3JlCeYdyMVpUni0h0k4PX7i6UTM5m6+lEf84p
   Bwayi/WXVzoW7q3XWnGLB+lh4MUfRFdRJa0w7O+XCFAgTlFIB/lEqTvuY
   hs+ormrIWL9Tlxk2mFhJzd/3SQGfys0PbpgNvyQgd7TtguBzytSb1ZDs1
   RF8rk+zSnUivHuMXCWrBGc3qoOHfcSRgc+yoUIHq1QabwMgck18RCseGN
   9x6ht/v+9ClV1Uno5kB5xh+a/uIunNjqbjIwPyiv21KJLy15eclH/RQ1F
   KYTYNMr2nO1YQ+GF2QzQHH3z3I75x3SUAPY/6WHFIUduKLn+16vxeSeij
   Q==;
X-CSE-ConnectionGUID: vAbkofEeQLGIL528SE25rw==
X-CSE-MsgGUID: nLgisgqBSIqFv6DGlp4+CQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11836"; a="83857652"
X-IronPort-AV: E=Sophos;i="6.25,147,1779174000"; 
   d="scan'208";a="83857652"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2026 01:30:31 -0700
X-CSE-ConnectionGUID: bReUGsfpSlSm2vOZCAt6Tw==
X-CSE-MsgGUID: WP+DAjrSSTG+XLB+CbU9rg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,147,1779174000"; 
   d="scan'208";a="246889760"
Received: from igk-lkp-server01.igk.intel.com (HELO e5a8ed462067) ([10.211.93.152])
  by fmviesa009.fm.intel.com with ESMTP; 04 Jul 2026 01:30:26 -0700
Received: from kbuild by e5a8ed462067 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wfvlX-000000001iZ-3y0d;
	Sat, 04 Jul 2026 08:30:23 +0000
Date: Sat, 4 Jul 2026 10:30:05 +0200
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
Message-ID: <202607041039.WHXO0OYv-lkp@intel.com>
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
config: i386-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260704/202607041039.WHXO0OYv-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260704/202607041039.WHXO0OYv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607041039.WHXO0OYv-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from ./include/linux/mm.h:31,
                    from ./include/linux/memcontrol.h:21,
                    from ./include/linux/swap.h:9,
                    from ./include/linux/suspend.h:5,
                    from arch/x86/kernel/asm-offsets.c:14:
>> ./include/linux/pgtable.h:1921:21: error: redefinition of 'pmd_swp_mkexclusive'
    1921 | static inline pmd_t pmd_swp_mkexclusive(pmd_t pmd)
         |                     ^~~~~~~~~~~~~~~~~~~
   In file included from ./arch/x86/include/asm/tlbflush.h:17,
                    from ./arch/x86/include/asm/uaccess.h:17,
                    from ./include/linux/uaccess.h:13,
                    from ./include/linux/sched/task.h:13,
                    from ./include/linux/sched/signal.h:9,
                    from ./include/linux/rcuwait.h:6,
                    from ./include/linux/percpu-rwsem.h:7,
                    from ./include/linux/fs/super_types.h:13,
                    from ./include/linux/fs/super.h:5,
                    from ./include/linux/fs.h:5,
                    from ./include/linux/cgroup.h:17,
                    from ./include/linux/memcontrol.h:13:
   ./arch/x86/include/asm/pgtable.h:1532:21: note: previous definition of 'pmd_swp_mkexclusive' with type 'pmd_t(pmd_t)'
    1532 | static inline pmd_t pmd_swp_mkexclusive(pmd_t pmd)
         |                     ^~~~~~~~~~~~~~~~~~~
>> ./include/linux/pgtable.h:1926:20: error: conflicting types for 'pmd_swp_exclusive'; have 'bool(pmd_t)' {aka '_Bool(pmd_t)'}
    1926 | static inline bool pmd_swp_exclusive(pmd_t pmd)
         |                    ^~~~~~~~~~~~~~~~~
   ./arch/x86/include/asm/pgtable.h:1537:19: note: previous definition of 'pmd_swp_exclusive' with type 'int(pmd_t)'
    1537 | static inline int pmd_swp_exclusive(pmd_t pmd)
         |                   ^~~~~~~~~~~~~~~~~
>> ./include/linux/pgtable.h:1931:21: error: redefinition of 'pmd_swp_clear_exclusive'
    1931 | static inline pmd_t pmd_swp_clear_exclusive(pmd_t pmd)
         |                     ^~~~~~~~~~~~~~~~~~~~~~~
   ./arch/x86/include/asm/pgtable.h:1542:21: note: previous definition of 'pmd_swp_clear_exclusive' with type 'pmd_t(pmd_t)'
    1542 | static inline pmd_t pmd_swp_clear_exclusive(pmd_t pmd)
         |                     ^~~~~~~~~~~~~~~~~~~~~~~


vim +/pmd_swp_mkexclusive +1921 ./include/linux/pgtable.h

  1919	
  1920	#ifndef CONFIG_ARCH_SUPPORTS_PMD_SOFTLEAF
> 1921	static inline pmd_t pmd_swp_mkexclusive(pmd_t pmd)
  1922	{
  1923		return pmd;
  1924	}
  1925	
> 1926	static inline bool pmd_swp_exclusive(pmd_t pmd)
  1927	{
  1928		return false;
  1929	}
  1930	
> 1931	static inline pmd_t pmd_swp_clear_exclusive(pmd_t pmd)
  1932	{
  1933		return pmd;
  1934	}
  1935	#endif
  1936	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
