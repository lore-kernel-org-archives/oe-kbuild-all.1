Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2372530C101
	for <oe-kbuild-all@lists.linux.dev>; Fri, 26 Sep 2025 18:32:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758911566; cv=none; b=Vjyn/lnGyMR9JilOtD0v8GoTt/txDDwfzi1SrQciqlly1AZAWy/5X458tp5FE6oKvLqMwtyC88CzL1MRlF0Q1W2r/aESxirWV9cTPskS5NuuYnKNEZYBB76BlpbDkE+4TP7umZ/M3OVWGOZWyZiq5V0MXnJxuNqz4fmjk7v3i94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758911566; c=relaxed/simple;
	bh=VuLexOjfz/ZC0AB59SeAotntjOtYy7mFSk0ddFsEsfM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AWPL5xjEYfCSJtDdbH+oCyvFWzAWqWJmV0cNW9ftKq1AUQ8FkRPJ7qSCROADjdlfB9pZSBfXsjyoLF0FkT023JlVxdakdbmQCrTREfA8bsVwWtWdQuAdtwzBfuxllH/Gs2kGuPHFCMFjWynRd3VIRSb5wY8dkA4kM3we2p92y4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=l3kNWTSQ; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="l3kNWTSQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758911566; x=1790447566;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VuLexOjfz/ZC0AB59SeAotntjOtYy7mFSk0ddFsEsfM=;
  b=l3kNWTSQ71Z9CcBylUFRKkL0cfuTBQ23HO1TwCKg5GAJnMHRbPYy4ER5
   fz5WmrvPPcuV1dKlWE7ssBgHqqQLByVOFSEvL74Jlpl2UiE3VfnZiUhnB
   uhpEQEc4t4YCyKevH1NxXGTuTVx2jIrhuwvhiuTUuvaHb4ZpGgaZKdlI0
   T73iQxg7RgPZ+cdJpTZZugAK0C++uWSZgM//L5T3GvxbUWCI14C5xIFw2
   OZM3tZYs8/+/pH54SNXOkVgkNDrUxltDFcATm1ANI0k3MnGmUgM+TNquS
   Ty5yUUZOrCfUJwCe3nSDevaXE7l5AFseqGMSJ13+Sa12RS+yn/pALZx07
   g==;
X-CSE-ConnectionGUID: wtfjPNSqThWmaRgdnWmKeA==
X-CSE-MsgGUID: vWwOdPf2TX2MQHAoemF3dg==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="61204391"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="61204391"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2025 11:32:45 -0700
X-CSE-ConnectionGUID: qHgIHNr1Szq+Ib7eLBAZFQ==
X-CSE-MsgGUID: YJ73Axq6QESrxxh43siWkg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,295,1751266800"; 
   d="scan'208";a="208431184"
Received: from lkp-server02.sh.intel.com (HELO 84c55410ccf6) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 26 Sep 2025 11:32:44 -0700
Received: from kbuild by 84c55410ccf6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v2DFJ-0006Vf-11;
	Fri, 26 Sep 2025 18:32:41 +0000
Date: Sat, 27 Sep 2025 02:32:35 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:keys-pqc 6/8] arch/arm64/crypto/sha3-ce-glue.c:55:30:
 error: 'struct sha3_ctx' has no member named 'state'
Message-ID: <202509270244.3ym0D5dk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git keys-pqc
head:   e623bce62b0197fce10bf035258ffa2692c4dfb0
commit: fe57c66da840d93bceb6c3c629b7841cd2033f61 [6/8] crypto/sha3: Use lib/crypto/sha3
config: arm64-randconfig-003-20250926 (https://download.01.org/0day-ci/archive/20250927/202509270244.3ym0D5dk-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 9.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250927/202509270244.3ym0D5dk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509270244.3ym0D5dk-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   arch/arm64/crypto/sha3-ce-glue.c: In function 'arm64_sha3_update':
>> arch/arm64/crypto/sha3-ce-glue.c:55:30: error: 'struct sha3_ctx' has no member named 'state'
      55 |   rem = sha3_ce_transform(ctx->state.st, data, blocks, ds);
         |                              ^~
   arch/arm64/crypto/sha3-ce-glue.c: In function 'arm64_sha3_finup':
>> arch/arm64/crypto/sha3-ce-glue.c:82:20: error: 'sctx' undeclared (first use in this function); did you mean 'ctx'?
      82 |  sha3_ce_transform(sctx->state.st, block, 1, ds);
         |                    ^~~~
         |                    ctx
   arch/arm64/crypto/sha3-ce-glue.c:82:20: note: each undeclared identifier is reported only once for each function it appears in
>> arch/arm64/crypto/sha3-ce-glue.c:66:19: warning: unused variable 'ctx' [-Wunused-variable]
      66 |  struct sha3_ctx *ctx = crypto_sha3_desc(desc);
         |                   ^~~


vim +55 arch/arm64/crypto/sha3-ce-glue.c

    35	
    36	asmlinkage int sha3_ce_transform(u64 *st, const u8 *data, int blocks,
    37					 int md_len);
    38	
    39	static int arm64_sha3_update(struct shash_desc *desc, const u8 *data,
    40			       unsigned int len)
    41	{
    42		struct sha3_ctx *ctx = crypto_sha3_desc(desc);
    43		struct crypto_shash *tfm = desc->tfm;
    44		unsigned int bs, ds;
    45		int blocks;
    46	
    47		ds = crypto_shash_digestsize(tfm);
    48		bs = crypto_shash_blocksize(tfm);
    49		blocks = len / bs;
    50		len -= blocks * bs;
    51		do {
    52			int rem;
    53	
    54			kernel_neon_begin();
  > 55			rem = sha3_ce_transform(ctx->state.st, data, blocks, ds);
    56			kernel_neon_end();
    57			data += (blocks - rem) * bs;
    58			blocks = rem;
    59		} while (blocks);
    60		return len;
    61	}
    62	
    63	static int arm64_sha3_finup(struct shash_desc *desc, const u8 *src, unsigned int len,
    64				    u8 *out)
    65	{
  > 66		struct sha3_ctx *ctx = crypto_sha3_desc(desc);
    67		struct crypto_shash *tfm = desc->tfm;
    68		__le64 *digest = (__le64 *)out;
    69		u8 block[SHA3_224_BLOCK_SIZE];
    70		unsigned int bs, ds;
    71		int i;
    72	
    73		ds = crypto_shash_digestsize(tfm);
    74		bs = crypto_shash_blocksize(tfm);
    75		memcpy(block, src, len);
    76	
    77		block[len++] = 0x06;
    78		memset(block + len, 0, bs - len);
    79		block[bs - 1] |= 0x80;
    80	
    81		kernel_neon_begin();
  > 82		sha3_ce_transform(sctx->state.st, block, 1, ds);
    83		kernel_neon_end();
    84		memzero_explicit(block , sizeof(block));
    85	
    86		for (i = 0; i < ds / 8; i++)
    87			put_unaligned_le64(sctx->state.st[i], digest++);
    88	
    89		if (ds & 4)
    90			put_unaligned_le32(sctx->state.st[i], (__le32 *)digest);
    91	
    92		return 0;
    93	}
    94	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
