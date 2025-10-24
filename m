Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 582A382899
	for <oe-kbuild-all@lists.linux.dev>; Fri, 24 Oct 2025 17:28:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761326909; cv=none; b=poRFsriOwWHXK3CyyPpyogzKLG+C3d8SvykwdpjLPekK/QUh0iXGCG5hRo2HOdIZ0N/Pgq1jrZJIinXN6VDy3Z8k6/3lNLtZWKgwsbxNulbIf5gcKzT1PnKISqhCg5TrT3K5vMtyY/SApDKF4Mp0oIQsT4YX2Bpubo+XxMWHQ68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761326909; c=relaxed/simple;
	bh=e2XPqubJdqeNXXWd4QFlQfaDc1ZyOaFZBdeCFK1y4Z4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iftRX417ngoSghweTeSBXaVLw+TiY1Lad0qboXZfLL7EJFgkrl20buQVXbjIIW5+g99OaHF05AIjOHcFAEfTSN/PHNBoYSGSCYnTPtF/Nm+dRdq2oRDWTUNmshFbW+FVSJZrDWvFpNibT17yxTEvVGhLbBgdw/ycXQxzsuFVezE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jPfXIL1j; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jPfXIL1j"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761326909; x=1792862909;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=e2XPqubJdqeNXXWd4QFlQfaDc1ZyOaFZBdeCFK1y4Z4=;
  b=jPfXIL1j123rdfv/8LhET/rLWnCmHM6xHcv171T+jh9bIQM6MnoNgXIX
   6/6xR+Jf1tI15WsA7BzIH7P0pXbC+ZDlgF3fwh/soKR6Y6SFPcl/VUU/C
   TDl9jonxKh2fw3SHhF99mrZCDd68I/8pNkxYk5sUyh+OYCCiiLtnSVROB
   bN1C571Se+ysSRJ3B3Q8LSL4g4V+RPHakionDSKRyfEr6dgbaVvxgbQrq
   bB1M5bzDg/UJu4v2cZMTNSJ1YZsVS3zmHD4VyKUsYMWAqMC7AA9OxaL8v
   1Eu+btitj17bPpyqMvr49j7KydwWkgCPOXHay3EaiybwzG1U6sPN85a8j
   g==;
X-CSE-ConnectionGUID: v0g7igGQQLqLGP6E88yJ3Q==
X-CSE-MsgGUID: 6CHFyyuCSX+yqiYABgEMkw==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="67156432"
X-IronPort-AV: E=Sophos;i="6.19,253,1754982000"; 
   d="scan'208";a="67156432"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2025 10:28:27 -0700
X-CSE-ConnectionGUID: pLubN/DcTgGlyXeWbPcXdA==
X-CSE-MsgGUID: 5jyhJv6lTeCFlfLHAiri3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,253,1754982000"; 
   d="scan'208";a="184090925"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 24 Oct 2025 10:28:25 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vCLaR-000Ejn-16;
	Fri, 24 Oct 2025 17:28:23 +0000
Date: Sat, 25 Oct 2025 01:28:08 +0800
From: kernel test robot <lkp@intel.com>
To: Yury Norov <yury.norov@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [norov:BITS4 11/20] lib/test_bitmap.c:695:55: error: expected ')'
 before '{' token
Message-ID: <202510250136.H54ZwK9s-lkp@intel.com>
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
config: arc-randconfig-001-20251024 (https://download.01.org/0day-ci/archive/20251025/202510250136.H54ZwK9s-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251025/202510250136.H54ZwK9s-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510250136.H54ZwK9s-lkp@intel.com/

All errors (new ones prefixed by >>):

   lib/test_bitmap.c: In function 'test_bitmap_arr64':
>> lib/test_bitmap.c:695:55: error: expected ')' before '{' token
          (arr[(nbits - 1) / 64] & ~FIRST_BITS_ULL(nbits)) {
                                                          ^~
                                                          )
   lib/test_bitmap.c:694:6: note: to match this '('
      if ((nbits % 64) &&
         ^
>> lib/test_bitmap.c:704:2: error: expected expression before '}' token
     }
     ^


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
 > 704		}
   705	}
   706	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
