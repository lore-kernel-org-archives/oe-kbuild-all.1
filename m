Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC88378F2F
	for <oe-kbuild-all@lists.linux.dev>; Tue, 19 May 2026 23:04:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779231868; cv=none; b=tHEhpoVWrTLW3R2/d19GbBRMUMwljCCP68sFAt81uC+s/049KLrOr07iAF6XJDzjyWFPuaUwG6J+0t8U+MYh0QR22GtQfd0RVG2ld69yNpV/uGo0REn0m4SfDjE8QFKuNHgf49z+KpuvQbbGk20Z8ReRM58UhuSixLNbfSrALO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779231868; c=relaxed/simple;
	bh=TgDqPDQtQT3n/xCOAdcxR/lkYlfiwSRYmNZDcDlLMrE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Qjq/UGr3Ui4GApb6wJ1YEX0d7wukN/Pk9btr80AF0SBN+FE+xtrQGbdvzS3a9vEjGi6bWaKTnlhNfcFNL9ZqdlTNE4jPkCfyC9kGxjzKylJalNkq9Oaj4qkROv2QUDVamEMRhFy9VmTk/G0QfLA3/GNKj+IFu8se1xinpuZ6dHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=E4aJoZ7Y; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="E4aJoZ7Y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779231867; x=1810767867;
  h=date:from:to:cc:subject:message-id;
  bh=TgDqPDQtQT3n/xCOAdcxR/lkYlfiwSRYmNZDcDlLMrE=;
  b=E4aJoZ7YqvAHGSVSjour/xhzL1igodxDFbOa0VijshSaI0zQYCUzZQal
   08wegcdtb7tx+tnin+QVfRSmHhAcnFZbzI10Ml0T86591MeoUt4t2eA4c
   FNI1j2wQFkD4quAJ2ZSjji/nd55rBuUo3TxCyNq6JOUf4fuc2G1wczhur
   5SfUFc4RxnZ02kzFB+sep5GqrWl+qXBR8BksOmWQ7JNHcLzAb2uB0jfjd
   Exp+hFXFBbpjmiGRCkcX2glcHaXabAnkgCZIu0/cLqYfVTyTlwsclMO9D
   e8tOOVfMhjeNZM6K3Gc/LKzU357fBYR3u+GN9uFVXTntpylfmXmiCGghi
   Q==;
X-CSE-ConnectionGUID: CdQZKT+kQjC1hrqiX4e/zQ==
X-CSE-MsgGUID: fQgDFXk4SGCJtcSejNDYxQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11791"; a="91590527"
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; 
   d="scan'208";a="91590527"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2026 16:04:27 -0700
X-CSE-ConnectionGUID: VMvOqSJ+TcGpkbOO+T4Hkw==
X-CSE-MsgGUID: F5rNgCU6TdeZZiq9PD3Qlg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; 
   d="scan'208";a="236936626"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa007.fm.intel.com with ESMTP; 19 May 2026 16:04:25 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wPTU6-00000000AM5-3kmx;
	Tue, 19 May 2026 23:04:22 +0000
Date: Wed, 20 May 2026 01:03:45 +0200
From: kernel test robot <lkp@intel.com>
To: Milan Tripkovic <Milan.Tripkovic@rt-rk.com>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>
Subject: lib/tests/string_kunit.c:938:15: warning: variable 'p2' set
 but not used
Message-ID: <202605200042.d5lzQnsV-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Milan-Tripkovic/riscv-lib-add-memcmp-implementation/20260519-221028
head:   f9332510d4c175fa8bdf907b77ba2f8d0e2735ce
commit: f9332510d4c175fa8bdf907b77ba2f8d0e2735ce lib/string_kunit: extend benchmarks and unit test to memcmp()
date:   9 hours ago
config: x86_64-rhel-9.4-kunit (https://download.01.org/0day-ci/archive/20260520/202605200042.d5lzQnsV-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260520/202605200042.d5lzQnsV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605200042.d5lzQnsV-lkp@intel.com/

All warnings (new ones prefixed by >>):

   lib/tests/string_kunit.c: In function 'do_string_bench_memcmp':
>> lib/tests/string_kunit.c:938:15: warning: variable 'p2' set but not used [-Wunused-but-set-variable]
     938 |         char *p2;
         |               ^~
>> lib/tests/string_kunit.c:937:15: warning: variable 'p1' set but not used [-Wunused-but-set-variable]
     937 |         char *p1;
         |               ^~


vim +/p2 +938 lib/tests/string_kunit.c

   926	
   927	static void do_string_bench_memcmp(struct kunit *test)
   928	{
   929		char *buf1 = NULL;
   930		char *buf2 = NULL;
   931		const u64 lengths[] = { 1, 7, 8, 16, 32, 64, 128, 512, 1024, 4096};
   932		const int offsets[] = { 0, 1, 3, 7};
   933		const u64 max_len = 4096 + 64;
   934		unsigned int o, i;
   935		unsigned int off;
   936		u64 len;
 > 937		char *p1;
 > 938		char *p2;
   939		u64 iterations;
   940		u64 elapsed;
   941		u64 ns_per_call;
   942		u64 mbps;
   943	
   944		buf1 = vmalloc(max_len);
   945		buf2 = vmalloc(max_len);
   946	
   947		if (!buf1 || !buf2) {
   948			vfree(buf1);
   949			vfree(buf2);
   950			kunit_err(test, "vmalloc failed\n");
   951			return;
   952		}
   953	
   954		memset(buf1, 'A', max_len);
   955		memset(buf2, 'A', max_len);
   956	
   957		for (o = 0; o < ARRAY_SIZE(offsets); o++) {
   958			off = offsets[o];
   959	
   960			for (i = 0; i < ARRAY_SIZE(lengths); i++) {
   961				len = lengths[i];
   962				p1 = buf1;
   963				p2 = buf2 + off;
   964				iterations = (len < 512) ? 100000ULL : 10000ULL;
   965				elapsed = STRING_BENCH(iterations, memcmp, p1, p2, len);
   966				ns_per_call = div_u64(elapsed, iterations);
   967				mbps = len ? div_u64(iterations * len * (NSEC_PER_SEC / MEGA), elapsed) : 0;
   968	
   969				if (off == 0) {
   970					kunit_info(test, "bench_memcmp_aligned: len=%-4llu: %llu MB/s (%llu ns/call)\n",
   971						   len, mbps, ns_per_call);
   972				} else {
   973					kunit_info(test, "bench_memcmp_unaligned(off=%u): len=%-4llu: %llu MB/s (%llu ns/call)\n",
   974						   off, len, mbps, ns_per_call);
   975				}
   976			}
   977		}
   978	
   979		vfree(buf1);
   980		vfree(buf2);
   981	}
   982	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
