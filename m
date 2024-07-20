Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E336537169
	for <oe-kbuild-all@lists.linux.dev>; Sat, 20 Jul 2024 15:16:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721488589; cv=none; b=eVeo8oTrwOoovHUZPc0/6DPAvAfICQtwTAEV8M3GiSKd9ma/v2p0J4q+m/WwWAL0lLdF8HJc3n8KurXsnnLVvlEgpSxhnLZq0ujfcTk++MZ75W4WpBojqN2JAvjGhYb+2TgDsveGbCQt49pqXtFVIQeei+t0rB06/lyrPkd4SqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721488589; c=relaxed/simple;
	bh=2hevDY3HFH2KQUrJWAtmJTEVxefY2xocm91U6c+lZyQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=eYJNjbRtw4qZ4pJZBCubNmBiWU3uEUbMIXfThcc9eV/f51ebiDFK7KTzl6KPWs7nQplqCl7oV1XX5WW57NwxY4GeUwi6geHvd2xS1Tl4m9LctIXKBZNXd8Fdyel/MyBJdt+dhgW7+xYxk6Eiraaep2bdAlMzrxBZbBh3S9SbYKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=G5cquxR+; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="G5cquxR+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721488588; x=1753024588;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2hevDY3HFH2KQUrJWAtmJTEVxefY2xocm91U6c+lZyQ=;
  b=G5cquxR+hCXq9zNIAz4zwoAlbCANSvqUf1NDe2SznVr8lrZM5uP0kXbl
   E42S0V2QEV6VMmuLOzNhLUWJW9uXggjFIo5kOtn5oLjSxu1qy926WoFb2
   7r6nRYqffcTUVg7d58FjKLqBzz5IWoCDBZX7kXGXy/ME7N9wzdQByrqE+
   Z/kNhfFu2K6U6DHtNWraC0Mg6UM7fRARpsIUMryDy3JFZP8yHJSIsCFDl
   ooibH3waAZIA76AYEU1wW5ldtn/ZI+DxqtpGmVvhmlf3m4AKFwMICUgac
   5XuJl6DGOE7tlDdnu/qXiMSMjCeQCOzt3nh6KSbJITeSO1HOLOnYR6KeG
   g==;
X-CSE-ConnectionGUID: LJRd8tS9RnepEetthhsYTA==
X-CSE-MsgGUID: BRE6P1ewQP2ovJRsSNU41g==
X-IronPort-AV: E=McAfee;i="6700,10204,11139"; a="19063709"
X-IronPort-AV: E=Sophos;i="6.09,224,1716274800"; 
   d="scan'208";a="19063709"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jul 2024 08:16:28 -0700
X-CSE-ConnectionGUID: ejqnNS94Tj6P12vrzxjhlw==
X-CSE-MsgGUID: cwAavoBYTK2RVBLoqBVKVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,224,1716274800"; 
   d="scan'208";a="56531461"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 20 Jul 2024 08:16:27 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sVBou-000jKa-1M;
	Sat, 20 Jul 2024 15:16:24 +0000
Date: Sat, 20 Jul 2024 23:16:06 +0800
From: kernel test robot <lkp@intel.com>
To: "Alex Shi (Tencent)" <alexs@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [alexshi:mmunstable2 41/42] mm/memory.c:192:32: error: implicit
 declaration of function 'pmd_ptdesc'; did you mean 'pfn_ptdesc'?
Message-ID: <202407202316.Dq95UIrT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/alexshi/linux.git mmunstable2
head:   17ce8ec8001d3efaa81c659d6ec565025c3f42b0
commit: 934c05f8c50fed91942a8aa9db46a0feae38594c [41/42] use ptdesc in free_pte_range and pte_free_tlb series functions
config: parisc-allnoconfig (https://download.01.org/0day-ci/archive/20240720/202407202316.Dq95UIrT-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240720/202407202316.Dq95UIrT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407202316.Dq95UIrT-lkp@intel.com/

All errors (new ones prefixed by >>):

   mm/memory.c: In function 'free_pte_range':
>> mm/memory.c:192:32: error: implicit declaration of function 'pmd_ptdesc'; did you mean 'pfn_ptdesc'? [-Wimplicit-function-declaration]
     192 |         struct ptdesc *token = pmd_ptdesc(pmd);
         |                                ^~~~~~~~~~
         |                                pfn_ptdesc
>> mm/memory.c:192:32: error: initialization of 'struct ptdesc *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
   In file included from mm/memory.c:44:
   mm/memory.c: In function 'pmd_install':
   mm/memory.c:440:39: error: passing argument 1 of 'lowmem_page_address' from incompatible pointer type [-Wincompatible-pointer-types]
     440 |                 pmd_populate(mm, pmd, *pte);
         |                                       ^~~~
         |                                       |
         |                                       struct ptdesc *
   include/linux/mm.h:2251:48: note: in definition of macro 'page_address'
    2251 | #define page_address(page) lowmem_page_address(page)
         |                                                ^~~~
   mm/memory.c:440:17: note: in expansion of macro 'pmd_populate'
     440 |                 pmd_populate(mm, pmd, *pte);
         |                 ^~~~~~~~~~~~
   include/linux/mm.h:2245:69: note: expected 'const struct page *' but argument is of type 'struct ptdesc *'
    2245 | static __always_inline void *lowmem_page_address(const struct page *page)
         |                                                  ~~~~~~~~~~~~~~~~~~~^~~~


vim +192 mm/memory.c

   184	
   185	/*
   186	 * Note: this doesn't free the actual pages themselves. That
   187	 * has been handled earlier when unmapping all the memory regions.
   188	 */
   189	static void free_pte_range(struct mmu_gather *tlb, pmd_t *pmd,
   190				   unsigned long addr)
   191	{
 > 192		struct ptdesc *token = pmd_ptdesc(pmd);
   193		pmd_clear(pmd);
   194		pte_free_tlb(tlb, token, addr);
   195		mm_dec_nr_ptes(tlb->mm);
   196	}
   197	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
