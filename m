Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1970224F3
	for <oe-kbuild-all@lists.linux.dev>; Sat, 16 May 2026 02:58:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778900306; cv=none; b=PgNJtlccp97R2RnX1G14GvNQva4Q2JFRe8Z1mlmT3l1cv70bnQh91qecZQ5vFAyo/nA8WOzw0HI1TeqI8k+tkGZLn1TNzEfCyZscxiS6UuHzF9JY6Ao/ONJdaT6bLagwP5TS2rnNYFfv51Bl1kKt7ZlyNxYSXPNLPjBJuzxB+bQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778900306; c=relaxed/simple;
	bh=k0R7IE2cjS0ww+n7SWpxEGiBtzvcvagORAODXnShuNw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=aZhq19/tEeuSr69PxDiv6p1UADX8SqeMrMY7EttY1ng02tBkM/ZEoNKqys1xGr9wUHGBPLvKhhmMwWU3imnR4Cp1i0h3UU/YJTmXPw4XPOsemZFWTArJn99j3cHTAw5yGdkMDikiKHNFCgjmXX4FGNZi5WcnwTh/cv5Mub6UEaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UA53+kru; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UA53+kru"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778900304; x=1810436304;
  h=date:from:to:cc:subject:message-id;
  bh=k0R7IE2cjS0ww+n7SWpxEGiBtzvcvagORAODXnShuNw=;
  b=UA53+kruZ7g0o99YoK3N2Cw9Y2HFrY3RGcMFm0bTVj2mL+7qzbjPmt5F
   L7Ns9FiOdoTeaUnhipLUDEsoPEuVPxn9EL+O94tqqy7MftzLC/mqL9PIL
   Dzr50n9kRw1Nvxg2KoVLC6iA6IlxX2J0UvA8KgYtbEVwxTQMSgnXZ2bgs
   K5yR/aG+K0doFMXrDBYkBY5uKxy2Y/mNn0hk/+ZX1hVbuNDQG9/RrvEKp
   +weCrKyFsMutYOt5bW9XSVxcRYidiwt+Z9fF2K4hideMVikpuqI/t6h5S
   YH+zBh9N4NFxn4j/xlMH8+kNZ+fyHvFM2Bks/lZPBE4pnqsYNahaRt7vE
   A==;
X-CSE-ConnectionGUID: BnAXdFU4RCGTiLwNCcX66g==
X-CSE-MsgGUID: rR6/MnJySIKMcvsHdtRlBg==
X-IronPort-AV: E=McAfee;i="6800,10657,11787"; a="90958151"
X-IronPort-AV: E=Sophos;i="6.23,237,1770624000"; 
   d="scan'208";a="90958151"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2026 19:58:24 -0700
X-CSE-ConnectionGUID: jwNMNUjSRgaxEbqVZllNRw==
X-CSE-MsgGUID: a/7U47fDQR60k5857DbYCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,237,1770624000"; 
   d="scan'208";a="238751188"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by orviesa008.jf.intel.com with ESMTP; 15 May 2026 19:58:22 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wO5EJ-000000009CL-3Kl5;
	Sat, 16 May 2026 02:58:19 +0000
Date: Sat, 16 May 2026 04:57:51 +0200
From: kernel test robot <lkp@intel.com>
To: Milan Tripkovic <Milan.Tripkovic@rt-rk.com>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>
Subject: lib/tests/string_kunit.c:971:35: error: implicit declaration
 of function 'STRING_BENCH'; did you mean 'STRING_BENCH_BUF'?
Message-ID: <202605160457.GWCx3Syv-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Milan-Tripkovic/riscv-lib-add-memcmp-implementation/20260515-232425
head:   cc47ab1edeaa33a740769c02047c4c601941ae9c
commit: cc47ab1edeaa33a740769c02047c4c601941ae9c lib/string_kunit: extend benchmarks and unit test to memcmp()
date:   12 hours ago
config: x86_64-rhel-9.4-kunit (https://download.01.org/0day-ci/archive/20260516/202605160457.GWCx3Syv-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260516/202605160457.GWCx3Syv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605160457.GWCx3Syv-lkp@intel.com/

All errors (new ones prefixed by >>):

   lib/tests/string_kunit.c: In function 'do_string_bench_memcmp':
>> lib/tests/string_kunit.c:971:35: error: implicit declaration of function 'STRING_BENCH'; did you mean 'STRING_BENCH_BUF'? [-Wimplicit-function-declaration]
     971 |                         elapsed = STRING_BENCH(iterations, memcmp, p1, p2, len);
         |                                   ^~~~~~~~~~~~
         |                                   STRING_BENCH_BUF


vim +971 lib/tests/string_kunit.c

   922	
   923	static void do_string_bench_memcmp(struct kunit *test)
   924	{
   925		char *buf1 = NULL;
   926		char *buf2 = NULL;
   927		const u64 lengths[] = { 1, 7, 8, 16, 32, 64, 128, 512, 1024, 4096 };
   928		const int offsets[] = { 0, 1, 3, 7 };
   929		const u64 max_len = 4096 + 64;
   930		unsigned int w, o, i;
   931		unsigned int off;
   932		u64 len;
   933		char *p1;
   934		char *p2;
   935		u64 iterations;
   936		u64 elapsed;
   937		u64 ns_per_call;
   938		u64 mbps;
   939		u64 j;
   940	
   941		buf1 = vmalloc(max_len);
   942		buf2 = vmalloc(max_len);
   943	
   944		if (!buf1 || !buf2) {
   945			vfree(buf1);
   946			vfree(buf2);
   947			kunit_err(test, "vmalloc failed\n");
   948			return;
   949		}
   950	
   951		memset(buf1, 'A', max_len);
   952		memset(buf2, 'A', max_len);
   953	
   954		for (w = 0; w < 100000U; w++)
   955			(void)memcmp(buf1, buf2, 4096);
   956	
   957		for (o = 0; o < ARRAY_SIZE(offsets); o++) {
   958			off = offsets[o];
   959	
   960			for (i = 0; i < ARRAY_SIZE(lengths); i++) {
   961				len = lengths[i];
   962				p1 = buf1;
   963				p2 = buf2 + off;
   964				iterations = (len < 512) ? 100000ULL : 10000ULL;
   965	
   966				for (j = 0; j < iterations; j++) {
   967					(void)memcmp(p1, p2, len);
   968					barrier();
   969				}
   970	
 > 971				elapsed = STRING_BENCH(iterations, memcmp, p1, p2, len);
   972				ns_per_call = div_u64(elapsed, iterations);
   973				mbps = len ? div_u64(iterations * len * (NSEC_PER_SEC / MEGA), elapsed) : 0;
   974	
   975				if (off == 0) {
   976					kunit_info(test, "bench_memcmp_aligned: len=%-4llu: %llu MB/s (%llu ns/call)\n",
   977						   len, mbps, ns_per_call);
   978				} else {
   979					kunit_info(test, "bench_memcmp_unaligned(off=%u): len=%-4llu: %llu MB/s (%llu ns/call)\n",
   980						   off, len, mbps, ns_per_call);
   981				}
   982			}
   983		}
   984	
   985		vfree(buf1);
   986		vfree(buf2);
   987	}
   988	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
