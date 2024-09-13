Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A4771D67AB
	for <oe-kbuild-all@lists.linux.dev>; Fri, 13 Sep 2024 10:56:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726225016; cv=none; b=BCZfzL5JR5NBmdaLcT2AK3UtOqEJVUxal82U1QrhvSpjwb3PTVKkN6HG2IereHFdsp7hWroLLOtD0285VjqPw4wd8ENb89BvYkBUO3hM3+6sDiYnHYKR2VSibEV/wyUcq9hYx22pcS6f5/Kz615UqyZmnJqbG+c4bTi//SxTOdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726225016; c=relaxed/simple;
	bh=ao6F0nrJpeyWoipYod87OPEWLXqD4ZApMUQsHrrEhSo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=O8ujMAwip9IV1TDisobiom1czQiu2+dpWLcwmWBAQWJ8o1Y0js9zCNweWcV0oB7l6nqcbPtNhhjFRPFal3m9X/ZapW7ifAZKmowMSSXX2ERjevyzWjM4jutvRXyO700pTm+0+8eaHT/L04L5SRkAtz1c0vMPg7UlCb/2+I5wchk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=G7cYNm84; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="G7cYNm84"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726225013; x=1757761013;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ao6F0nrJpeyWoipYod87OPEWLXqD4ZApMUQsHrrEhSo=;
  b=G7cYNm84QY3ZlDvPoZxSt6SBfqTxc3wuNZH42t+k8oO6xJPaGiOj6PPX
   p64TiWJXUVjM2/VtQP/DuJtDTXMLtR/2TeESWtFRVLKIFbrS7EXJJZaJX
   U6pSUxoF17xFl1nehWGGGeU0OwOyVY5D5aL+yRm08k61731M8YHrIXEgV
   DoFYYdEHDoot5X+hRPDkfLtA+VeDSiJRPXr73++cmPJhNmZAk04wjT1As
   o94yJymveNEpe2bup9wyhbcDaQoBdJTofUGUtCeMAYmyYqDc+wE+jxkTT
   sd1lmVyhNIsBNPWSNgAwRJ3dPQamZIFJBh8LGz94sNP4iXOIXbWd2TnQm
   w==;
X-CSE-ConnectionGUID: 6PHuLblOQsSVZOvUJOT/ug==
X-CSE-MsgGUID: 7iTy6tm9QAiGTL+QQigZ0Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11193"; a="35693320"
X-IronPort-AV: E=Sophos;i="6.10,225,1719903600"; 
   d="scan'208";a="35693320"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2024 03:56:53 -0700
X-CSE-ConnectionGUID: Weqb3GQeRuixItgE6i0nvw==
X-CSE-MsgGUID: 0ipaRhm7T8yoSHpSViOtXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,225,1719903600"; 
   d="scan'208";a="98707141"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 13 Sep 2024 03:56:52 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sp3yr-0006Qs-1m;
	Fri, 13 Sep 2024 10:56:49 +0000
Date: Fri, 13 Sep 2024 18:55:56 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, yangdepei <yangdepei@hygon.cn>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 13458/13930]
 drivers/crypto/ccp/ccp-crypto-sm2-hygon.c:127:25: sparse: sparse: cast to
 restricted __be64
Message-ID: <202409131819.BdjMPTsH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   13706c950ff941dc015e16f76812077f9861e378
commit: b0381d106c64a4e0d4e737badd78e7d15aa917f1 [13458/13930] crypto: ccp: Support SM2 algorithm for hygon ccp.
config: x86_64-randconfig-123-20240913 (https://download.01.org/0day-ci/archive/20240913/202409131819.BdjMPTsH-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240913/202409131819.BdjMPTsH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409131819.BdjMPTsH-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/crypto/ccp/ccp-crypto-sm2-hygon.c:127:25: sparse: sparse: cast to restricted __be64
   drivers/crypto/ccp/ccp-crypto-sm2-hygon.c:128:25: sparse: sparse: cast to restricted __be64
   drivers/crypto/ccp/ccp-crypto-sm2-hygon.c:146:25: sparse: sparse: cast to restricted __be64
   drivers/crypto/ccp/ccp-crypto-sm2-hygon.c:147:25: sparse: sparse: cast to restricted __be64
>> drivers/crypto/ccp/ccp-crypto-sm2-hygon.c:150:22: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long long [usertype] @@     got restricted __be64 [usertype] @@
   drivers/crypto/ccp/ccp-crypto-sm2-hygon.c:150:22: sparse:     expected unsigned long long [usertype]
   drivers/crypto/ccp/ccp-crypto-sm2-hygon.c:150:22: sparse:     got restricted __be64 [usertype]
   drivers/crypto/ccp/ccp-crypto-sm2-hygon.c:171:25: sparse: sparse: cast to restricted __be64
   drivers/crypto/ccp/ccp-crypto-sm2-hygon.c:173:22: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long long [usertype] @@     got restricted __be64 [usertype] @@
   drivers/crypto/ccp/ccp-crypto-sm2-hygon.c:173:22: sparse:     expected unsigned long long [usertype]
   drivers/crypto/ccp/ccp-crypto-sm2-hygon.c:173:22: sparse:     got restricted __be64 [usertype]
>> drivers/crypto/ccp/ccp-crypto-sm2-hygon.c:202:25: sparse: sparse: cast to restricted __be32
   drivers/crypto/ccp/ccp-crypto-sm2-hygon.c:208:33: sparse: sparse: cast to restricted __be32
>> drivers/crypto/ccp/ccp-crypto-sm2-hygon.c:212:32: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] @@     got restricted __be32 [usertype] @@
   drivers/crypto/ccp/ccp-crypto-sm2-hygon.c:212:32: sparse:     expected unsigned int [usertype]
   drivers/crypto/ccp/ccp-crypto-sm2-hygon.c:212:32: sparse:     got restricted __be32 [usertype]
   drivers/crypto/ccp/ccp-crypto-sm2-hygon.c:215:24: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] @@     got restricted __be32 [usertype] @@
   drivers/crypto/ccp/ccp-crypto-sm2-hygon.c:215:24: sparse:     expected unsigned int [usertype]
   drivers/crypto/ccp/ccp-crypto-sm2-hygon.c:215:24: sparse:     got restricted __be32 [usertype]
   drivers/crypto/ccp/ccp-crypto-sm2-hygon.c:296:28: sparse: sparse: cast to restricted __be64
   drivers/crypto/ccp/ccp-crypto-sm2-hygon.c:582:24: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] @@     got restricted __be32 [usertype] @@
   drivers/crypto/ccp/ccp-crypto-sm2-hygon.c:582:24: sparse:     expected unsigned int [usertype]
   drivers/crypto/ccp/ccp-crypto-sm2-hygon.c:582:24: sparse:     got restricted __be32 [usertype]
   drivers/crypto/ccp/ccp-crypto-sm2-hygon.c: note: in included file (through include/linux/module.h):
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true

vim +127 drivers/crypto/ccp/ccp-crypto-sm2-hygon.c

   115	
   116	/* Return:
   117	 *  1: a > b
   118	 * -1: a < b
   119	 *  0: a = b
   120	 */
   121	static int ccp_sm2_fp_cmp(const u64 *a, const u64 *b, u32 count)
   122	{
   123		u64 a_cpu, b_cpu;
   124		u32 i;
   125	
   126		for (i = 0; i < count; i++) {
 > 127			a_cpu = be64_to_cpu(a[i]);
   128			b_cpu = be64_to_cpu(b[i]);
   129			if (a_cpu > b_cpu)
   130				return 1;
   131			else if (a_cpu < b_cpu)
   132				return -1;
   133		}
   134	
   135		return 0;
   136	}
   137	
   138	/* a = a + b */
   139	static void ccp_sm2_fp_add(u64 *a, const u64 *b, u32 count)
   140	{
   141		u64 a_cpu, b_cpu, c_cpu, d_cpu;
   142		u32 carry = 0;
   143		s32 i;
   144	
   145		for (i = count - 1; i >= 0; i--) {
 > 146			a_cpu = be64_to_cpu(a[i]);
   147			b_cpu = be64_to_cpu(b[i]);
   148			c_cpu = a_cpu + b_cpu;
   149			d_cpu = c_cpu + carry;
 > 150			a[i] = cpu_to_be64(d_cpu);
   151	
   152			if (c_cpu < a_cpu)
   153				carry = 1;
   154			else if (carry && !d_cpu)
   155				carry = 1;
   156			else
   157				carry = 0;
   158		}
   159	}
   160	
   161	/* a = -a */
   162	static void ccp_sm2_fp_neg(u64 *a, u32 count)
   163	{
   164		u64 a_cpu, c_cpu;
   165		s32 i;
   166	
   167		for (i = 0; i <= count - 1; i++)
   168			a[i] = ~a[i];
   169	
   170		for (i = count - 1; i >= 0; i--) {
   171			a_cpu = be64_to_cpu(a[i]);
   172			c_cpu = a_cpu + 1;
   173			a[i] = cpu_to_be64(c_cpu);
   174	
   175			if (a_cpu < c_cpu)
   176				break;
   177		}
   178	}
   179	
   180	/* a = a - b */
   181	static void ccp_sm2_fp_sub(u64 *a, u64 *b, u32 count)
   182	{
   183		ccp_sm2_fp_neg(b, count);
   184		ccp_sm2_fp_add(a, b, count);
   185	}
   186	
   187	/* a and tmp must be 64B, b and c must be 32B
   188	 * a = b * c
   189	 */
   190	static void ccp_sm2_fp_mmul32(u8 *a, const u32 *b, const u32 *c, u8 *tmp)
   191	{
   192		u64 b_cpu, c_cpu, m_cpu;
   193		u32 rem_cpu;
   194		u32 *base, *m_cur;
   195		int i, j, iter;
   196	
   197		memset(a, 0, CCP_SM2_MMUL_LEN);
   198	
   199		iter = 7;
   200		base = (u32 *)(tmp + CCP_SM2_MMUL_LEN - sizeof(u32));
   201		for (i = iter; i >= 0; i--) {
 > 202			b_cpu = be32_to_cpu(b[i]);
   203			memset(tmp, 0, CCP_SM2_MMUL_LEN);
   204	
   205			rem_cpu = 0;
   206			m_cur = base;
   207			for (j = iter; j >= 0; j--) {
   208				c_cpu = be32_to_cpu(c[j]);
   209	
   210				m_cpu = b_cpu * c_cpu + rem_cpu;
   211				rem_cpu = (u32)(m_cpu >> 32);
 > 212				*m_cur = cpu_to_be32((u32)(m_cpu));
   213				m_cur--;
   214			}
   215			*m_cur = cpu_to_be32(rem_cpu);
   216			ccp_sm2_fp_add((u64 *)a, (u64 *)tmp,
   217					CCP_SM2_MMUL_LEN / sizeof(u64));
   218	
   219			base--;
   220		}
   221	}
   222	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
