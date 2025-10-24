Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6213343D7A
	for <oe-kbuild-all@lists.linux.dev>; Fri, 24 Oct 2025 17:39:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761327571; cv=none; b=CqoeRve6Qq80WjUtxokmU3vnxyo1Jc4paRt1tNwoHi+EHq/Q19PUi/VTPhdEE7lGV4JVF9frs1CPEjbAOXw2JdsJUBDDRh++6x5HioM0SJkgdsZ3VqHrZUnPRrcCOHd3imnOsNBcHIuyDBItLRDKnC8qX5UJrYPnhCQD1H0pHcw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761327571; c=relaxed/simple;
	bh=aA1P/O0CiouyWPUhZ4vMbRmyjMvNxDqQc1djCWK4UAg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YFPm5u4zN/51U22RmariSYS2DEhWsbhZ461PP6vD8t5i6Uf7zvXzTNr3j10sDPwjO0esjemaiPASnFxwi+VYKmplz1MoyhdClmtNZWB3VL/8KBrTZh8rk+mHMuJ2Rlxu8J0POtAl08YhQsARGOIZEzrv2MICJGRjJpS9JvHjUBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WrAAasQ2; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WrAAasQ2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761327570; x=1792863570;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=aA1P/O0CiouyWPUhZ4vMbRmyjMvNxDqQc1djCWK4UAg=;
  b=WrAAasQ2l74yafahignqlo8pHBKUnAU1yBBeJiMCeO7ZoFz8+674lki/
   1EUKWB2bvcEIypRQor72JZSX31p2W9oD0d3sybXWCeyAg+OnYrmFXAV5c
   zgmeaaX0DyxlQ89CxeEdUvWmHFut6p3UUl7GPICI5z1rCQSZIypB2QmPM
   H1Ln659viu5OFCtOC8MewKfiYKFZHuqq0DVvCkI8pvc1A5rvU5djQxgS+
   VfhYdGBApOpjnmQstCb91lVgArT1nkrzUh0B6B6ZRSaB4BYsyIkN5WcUk
   A4m3QYczlQ6dyXcuOtQ4k7Se7puO28AsuGnY3IpBtF31s9ooWMMFnA/kZ
   w==;
X-CSE-ConnectionGUID: hn8GfRh6S8eH4eXJKSo3FQ==
X-CSE-MsgGUID: pEUncbPxTTihgoc0uUO5Xw==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="66128551"
X-IronPort-AV: E=Sophos;i="6.19,253,1754982000"; 
   d="scan'208";a="66128551"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2025 10:39:28 -0700
X-CSE-ConnectionGUID: xUeZ594eRquSGjvS/BUwPw==
X-CSE-MsgGUID: Iynq0q7CTh+3EOjdqK97og==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,253,1754982000"; 
   d="scan'208";a="185250857"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 24 Oct 2025 10:39:27 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vCLl6-000EkB-2u;
	Fri, 24 Oct 2025 17:39:24 +0000
Date: Sat, 25 Oct 2025 01:38:39 +0800
From: kernel test robot <lkp@intel.com>
To: Yury Norov <yury.norov@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [norov:BITS4 11/20] lib/test_bitmap.c:695:56: error: expected ')'
Message-ID: <202510250103.aXAkF7Zc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/norov/linux BITS4
head:   22fd29c3a5d22b95c18297011f3211ef621537c2
commit: 84bee1ee550645aac22646868ec31dd4bb92686f [11/20] bitmap: don't use GENMASK()
config: s390-randconfig-002-20251024 (https://download.01.org/0day-ci/archive/20251025/202510250103.aXAkF7Zc-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project e1ae12640102fd2b05bc567243580f90acb1135f)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251025/202510250103.aXAkF7Zc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510250103.aXAkF7Zc-lkp@intel.com/

All errors (new ones prefixed by >>):

>> lib/test_bitmap.c:695:56: error: expected ')'
     695 |                     (arr[(nbits - 1) / 64] & ~FIRST_BITS_ULL(nbits)) {
         |                                                                      ^
   lib/test_bitmap.c:694:6: note: to match this '('
     694 |                 if ((nbits % 64) &&
         |                    ^
   1 error generated.


vim +695 lib/test_bitmap.c

   672	
   673	static void __init test_bitmap_arr64(void)
   674	{
   675		unsigned int nbits, next_bit;
   676		u64 arr[EXP1_IN_BITS / 64];
   677		DECLARE_BITMAP(bmap2, EXP1_IN_BITS);
   678	
   679		memset(arr, 0xa5, sizeof(arr));
   680	
   681		for (nbits = 0; nbits < EXP1_IN_BITS; ++nbits) {
   682			memset(bmap2, 0xff, sizeof(arr));
   683			bitmap_to_arr64(arr, exp1, nbits);
   684			bitmap_from_arr64(bmap2, arr, nbits);
   685			expect_eq_bitmap(bmap2, exp1, nbits);
   686	
   687			next_bit = find_next_bit(bmap2, round_up(nbits, BITS_PER_LONG), nbits);
   688			if (next_bit < round_up(nbits, BITS_PER_LONG)) {
   689				pr_err("bitmap_copy_arr64(nbits == %d:"
   690					" tail is not safely cleared: %d\n", nbits, next_bit);
   691				failed_tests++;
   692			}
   693	
   694			if ((nbits % 64) &&
 > 695			    (arr[(nbits - 1) / 64] & ~FIRST_BITS_ULL(nbits)) {
   696				pr_err("bitmap_to_arr64(nbits == %d): tail is not safely cleared: 0x%016llx (must be 0x%016llx)\n",
   697				       nbits, arr[(nbits - 1) / 64],
   698				       FIRST_BITS_ULL(nbits));
   699				failed_tests++;
   700			}
   701	
   702			if (nbits < EXP1_IN_BITS - 64)
   703				expect_eq_uint(arr[DIV_ROUND_UP(nbits, 64)], 0xa5a5a5a5);
   704		}
   705	}
   706	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
