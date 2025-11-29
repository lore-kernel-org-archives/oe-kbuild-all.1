Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5EAA36D4FA
	for <oe-kbuild-all@lists.linux.dev>; Sat, 29 Nov 2025 00:08:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764374926; cv=none; b=l+YiwauN068DkBrXJQv3ZPGGhJ/ZuP0+0FyuLn/kIdSB1eOfmnNNM+FWoZoCMtOva8LMX7Qg8jeKlgVUTpug71MFyZ0nXC66eyWKsCNZ8ZR6l58DXqlaxSqf6yIDAaZXVtfYFwschIk+ZxVPYSX5woj51KiblhbodSLoRnAzslI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764374926; c=relaxed/simple;
	bh=je98uInfgTT/8P3PdmSNnE2QqdfTcZK3+J3lQVbc6eg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KTyF6Qamu2agdTs+ZGiXUpYEvnTZ/dd7BKma0mcY5rfQlyykSxVjGSf5s0HtnFKbGnX9E5ipVMQcsMjXKos3w2fsmjLSjq59vvP5xj80pUZFUv2mQG6yWGrPyRGgclqqESofOiuSaDWWBITbTYW6kH0hRombbgwcevu5YLM/MRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=oK8uRjQD; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="oK8uRjQD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764374924; x=1795910924;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=je98uInfgTT/8P3PdmSNnE2QqdfTcZK3+J3lQVbc6eg=;
  b=oK8uRjQDHlJfZ+l3IC3aB1RZsCY81uUggEXI6hw666kKqXEAb3ODHn3k
   xrLbTta3pop9G45Mqjr1SQmdPnZd8YiTOdsGkKc1E715H2eXEguf8Z9VE
   lEElAHST4OPNtO4qC4hkj8l/8PpnKUQfiX5MG5ZaL716pyGHqp8N7rYec
   NiDb18TFLoSzhPlJIIuLugFYRsahaHK3Hq8eUMknNKapRTxNIRRSJfp/B
   Wx2OkLZzvu2fxod40wjXFGjP1YY70AHVWPIbJ12av4nElGQDDMlkzxoBz
   HeAmBzXYlSlbrs9m4LpVqcq/4uodt6yIVjRe70EYQ/e49OnTU1TZkjaAO
   Q==;
X-CSE-ConnectionGUID: c6JionamTVSDqvpJsCd0zw==
X-CSE-MsgGUID: MxfHEsgJS3+4jaofu2Q/OQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11627"; a="91873146"
X-IronPort-AV: E=Sophos;i="6.20,235,1758610800"; 
   d="scan'208";a="91873146"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2025 16:08:43 -0800
X-CSE-ConnectionGUID: Qpg7W5bOT96eyJryMFtRkw==
X-CSE-MsgGUID: hGi8pJX3TeqGm1J3etqILQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,235,1758610800"; 
   d="scan'208";a="230835844"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 28 Nov 2025 16:08:41 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vP8Vz-000000006pd-0FWC;
	Sat, 29 Nov 2025 00:08:39 +0000
Date: Sat, 29 Nov 2025 08:08:06 +0800
From: kernel test robot <lkp@intel.com>
To: Giovanni Cabiddu <giovanni.cabiddu@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 14/16] crypto: qat - add support for zstd
Message-ID: <202511290846.tcYRp0eG-lkp@intel.com>
References: <20251128191531.1703018-15-giovanni.cabiddu@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251128191531.1703018-15-giovanni.cabiddu@intel.com>

Hi Giovanni,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on ebbdf6466b30e3b37f3b360826efd21f0633fb9e]

url:    https://github.com/intel-lab-lkp/linux/commits/Giovanni-Cabiddu/crypto-zstd-fix-double-free-in-per-CPU-stream-cleanup/20251128-222112
base:   ebbdf6466b30e3b37f3b360826efd21f0633fb9e
patch link:    https://lore.kernel.org/r/20251128191531.1703018-15-giovanni.cabiddu%40intel.com
patch subject: [RFC PATCH 14/16] crypto: qat - add support for zstd
config: parisc-randconfig-002-20251129 (https://download.01.org/0day-ci/archive/20251129/202511290846.tcYRp0eG-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 13.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251129/202511290846.tcYRp0eG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511290846.tcYRp0eG-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/kernel.h:31,
                    from arch/parisc/include/asm/bug.h:5,
                    from include/linux/bug.h:5,
                    from include/linux/thread_info.h:13,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/parisc/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:79,
                    from include/linux/spinlock.h:56,
                    from include/linux/mmzone.h:8,
                    from include/linux/gfp.h:7,
                    from include/linux/umh.h:4,
                    from include/linux/kmod.h:9,
                    from include/linux/module.h:18,
                    from drivers/crypto/intel/qat/qat_common/qat_comp_zstd_utils.c:3:
   drivers/crypto/intel/qat/qat_common/qat_comp_zstd_utils.c: In function 'qat_alg_dec_lz4s':
>> drivers/crypto/intel/qat/qat_common/qat_comp_zstd_utils.c:103:42: warning: format '%lu' expects argument of type 'long unsigned int', but argument 4 has type 'size_t' {aka 'unsigned int'} [-Wformat=]
     103 |                                 pr_debug("[%s]: qat zstd sequence overflow (seqs_idx:%lu, out_seqs_capacity:%lu, lz4s_buff_size:%u)\n",
         |                                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/printk.h:402:21: note: in definition of macro 'pr_fmt'
     402 | #define pr_fmt(fmt) fmt
         |                     ^~~
   include/linux/dynamic_debug.h:248:9: note: in expansion of macro '__dynamic_func_call_cls'
     248 |         __dynamic_func_call_cls(__UNIQUE_ID(ddebug), cls, fmt, func, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:250:9: note: in expansion of macro '_dynamic_func_call_cls'
     250 |         _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:269:9: note: in expansion of macro '_dynamic_func_call'
     269 |         _dynamic_func_call(fmt, __dynamic_pr_debug,             \
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/printk.h:636:9: note: in expansion of macro 'dynamic_pr_debug'
     636 |         dynamic_pr_debug(fmt, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~
   drivers/crypto/intel/qat/qat_common/qat_comp_zstd_utils.c:103:33: note: in expansion of macro 'pr_debug'
     103 |                                 pr_debug("[%s]: qat zstd sequence overflow (seqs_idx:%lu, out_seqs_capacity:%lu, lz4s_buff_size:%u)\n",
         |                                 ^~~~~~~~
   drivers/crypto/intel/qat/qat_common/qat_comp_zstd_utils.c:103:88: note: format string is defined here
     103 |                                 pr_debug("[%s]: qat zstd sequence overflow (seqs_idx:%lu, out_seqs_capacity:%lu, lz4s_buff_size:%u)\n",
         |                                                                                      ~~^
         |                                                                                        |
         |                                                                                        long unsigned int
         |                                                                                      %u
   drivers/crypto/intel/qat/qat_common/qat_comp_zstd_utils.c:103:42: warning: format '%lu' expects argument of type 'long unsigned int', but argument 5 has type 'size_t' {aka 'unsigned int'} [-Wformat=]
     103 |                                 pr_debug("[%s]: qat zstd sequence overflow (seqs_idx:%lu, out_seqs_capacity:%lu, lz4s_buff_size:%u)\n",
         |                                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/printk.h:402:21: note: in definition of macro 'pr_fmt'
     402 | #define pr_fmt(fmt) fmt
         |                     ^~~
   include/linux/dynamic_debug.h:248:9: note: in expansion of macro '__dynamic_func_call_cls'
     248 |         __dynamic_func_call_cls(__UNIQUE_ID(ddebug), cls, fmt, func, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:250:9: note: in expansion of macro '_dynamic_func_call_cls'
     250 |         _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:269:9: note: in expansion of macro '_dynamic_func_call'
     269 |         _dynamic_func_call(fmt, __dynamic_pr_debug,             \
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/printk.h:636:9: note: in expansion of macro 'dynamic_pr_debug'
     636 |         dynamic_pr_debug(fmt, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~
   drivers/crypto/intel/qat/qat_common/qat_comp_zstd_utils.c:103:33: note: in expansion of macro 'pr_debug'
     103 |                                 pr_debug("[%s]: qat zstd sequence overflow (seqs_idx:%lu, out_seqs_capacity:%lu, lz4s_buff_size:%u)\n",
         |                                 ^~~~~~~~
   drivers/crypto/intel/qat/qat_common/qat_comp_zstd_utils.c:103:111: note: format string is defined here
     103 |                                 pr_debug("[%s]: qat zstd sequence overflow (seqs_idx:%lu, out_seqs_capacity:%lu, lz4s_buff_size:%u)\n",
         |                                                                                                             ~~^
         |                                                                                                               |
         |                                                                                                               long unsigned int
         |                                                                                                             %u

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for I2C_K1
   Depends on [n]: I2C [=y] && HAS_IOMEM [=y] && (ARCH_SPACEMIT || COMPILE_TEST [=y]) && OF [=n]
   Selected by [y]:
   - MFD_SPACEMIT_P1 [=y] && HAS_IOMEM [=y] && (ARCH_SPACEMIT || COMPILE_TEST [=y]) && I2C [=y]


vim +103 drivers/crypto/intel/qat/qat_common/qat_comp_zstd_utils.c

    14	
    15	/*
    16	 * Implement the same algorithm as the QAT ZSTD sequence producer plugin,
    17	 * to decode LZ4s formatted data into ZSTD_Sequence format.
    18	 */
    19	size_t qat_alg_dec_lz4s(ZSTD_Sequence *out_seqs, size_t out_seqs_capacity,
    20				unsigned char *lz4s_buff, unsigned int lz4s_buff_size,
    21				unsigned char *literals, unsigned int *lit_len)
    22	{
    23		unsigned char *end_ip = lz4s_buff + lz4s_buff_size;
    24		unsigned int hist_literal_len = 0;
    25		unsigned char *ip = lz4s_buff;
    26		size_t seqs_idx = 0;
    27	
    28		*lit_len = 0;
    29	
    30		if (!lz4s_buff_size)
    31			return 0;
    32	
    33		while (ip < end_ip) {
    34			size_t length = 0;
    35			size_t offset = 0;
    36			size_t literal_len = 0, match_len = 0;
    37	
    38			/* get literal length */
    39			unsigned const token = *ip++;
    40	
    41			length = token >> ML_BITS;
    42			if (length == RUN_MASK) {
    43				unsigned int s;
    44	
    45				do {
    46					s = *ip++;
    47					length += s;
    48				} while (s == 255);
    49			}
    50	
    51			literal_len = length;
    52	
    53			{
    54				u8 *start = ip;
    55				u8 *dest = literals;
    56				u8 *dest_end = literals + length;
    57	
    58				do {
    59					__builtin_memcpy(dest, start, QAT_ZSTD_LIT_COPY_LEN);
    60					dest += QAT_ZSTD_LIT_COPY_LEN;
    61					start += QAT_ZSTD_LIT_COPY_LEN;
    62				} while (dest < dest_end);
    63			}
    64	
    65			literals += length;
    66			*lit_len += length;
    67	
    68			ip += length;
    69			if (ip == end_ip) { /* Meet the end of the LZ4 sequence */
    70				literal_len += hist_literal_len;
    71				out_seqs[seqs_idx].litLength = literal_len;
    72				out_seqs[seqs_idx].offset = offset;
    73				out_seqs[seqs_idx].matchLength = match_len;
    74				break;
    75			}
    76	
    77			/* get matchPos */
    78			offset = le16_to_cpu(*(__le16 *)ip);
    79			ip += 2;
    80	
    81			/* get match length */
    82			length = token & ML_MASK;
    83			if (length == ML_MASK) {
    84				unsigned int s;
    85	
    86				do {
    87					s = *ip++;
    88					length += s;
    89				} while (s == 255);
    90			}
    91			if (length != 0) {
    92				length += LZ4MINMATCH;
    93				match_len = (unsigned short)length;
    94				literal_len += hist_literal_len;
    95	
    96				/* update ZSTD_Sequence */
    97				out_seqs[seqs_idx].offset = offset;
    98				out_seqs[seqs_idx].litLength = literal_len;
    99				out_seqs[seqs_idx].matchLength = match_len;
   100				hist_literal_len = 0;
   101				++seqs_idx;
   102				if (seqs_idx >= (out_seqs_capacity - 1)) {
 > 103					pr_debug("[%s]: qat zstd sequence overflow (seqs_idx:%lu, out_seqs_capacity:%lu, lz4s_buff_size:%u)\n",

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
