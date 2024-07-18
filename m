Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A400241C7F
	for <oe-kbuild-all@lists.linux.dev>; Thu, 18 Jul 2024 07:05:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721286331; cv=none; b=uQsYYgnMv00zs6AdizGx4872bjfSZVRw3Tb4MUxdw/MPa3lpmjvLtsRk95jSGaW0ssLMwpg7Pf5/qVRVN0prGamtt/b5V0Za309Bml5xrM47Fed4749kqRneJN9x/hBIWLcv7a4QMNrKie9KhO5nJu0BR1ucTOfWEXpXKsTtyD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721286331; c=relaxed/simple;
	bh=GV1YocWI1Q6kjGiEK7ug1igRfjc3+MGbWB8XTEp7fG4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MRAMZZN7mjsvcczoDL1dm4NUG3axNx4sLrbYjN7q6mRcPcIzYq6J5eGr4qTAj3+rH7a5aimOjkEX8Rg7s00GrSwlBE8UE+omUtrdUMAa+j8p35EFOS+BHzDN8AYAYEQUQgFophCNtK3njRzBMHiGGppnY4nbFhoL7HDgEbjyYvY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SQwLVB7F; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SQwLVB7F"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721286329; x=1752822329;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GV1YocWI1Q6kjGiEK7ug1igRfjc3+MGbWB8XTEp7fG4=;
  b=SQwLVB7FK6/ZYJ6low0mtQIIgWu6FR+SJaC8UfpnXq3XlTdoYNYpxRYI
   VCABMt1mGrCKYT50BeLhX3weOrllc6+r83k2VYBZnQrlNb8Glmj4LRCnP
   3Z//jyBb9WvdcaaZfTAdQ5Ovk3B6N8bMvXgV4s72GUgZzkWekF2bzOPIt
   8kdJO/ibyBdXGOizXERK35T244PQS9saGZ+3+x62KxOfO8lYnJ4afLPaR
   7McJgDmnowt7E3/W04vebcFc49gmhUOHUf/hWea4DfuT5xUfObUvqSVQj
   8GT/j9RJdMApdqtQ8ofB5rFVQA3FaNbtOCD3pDOaKktx+zMierg2gfStO
   A==;
X-CSE-ConnectionGUID: VtdDGJPzRW2TQ2ewOF1pbw==
X-CSE-MsgGUID: f7rFfABLQVW0w3qrSdS17Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11136"; a="29987894"
X-IronPort-AV: E=Sophos;i="6.09,217,1716274800"; 
   d="scan'208";a="29987894"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jul 2024 00:05:29 -0700
X-CSE-ConnectionGUID: fAKc5vfMRfKS6rB0AAcb2w==
X-CSE-MsgGUID: VTAR59mIQO6rEkqI1a1dCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,217,1716274800"; 
   d="scan'208";a="50717559"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 18 Jul 2024 00:05:29 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sULCg-000h2U-0v;
	Thu, 18 Jul 2024 07:05:26 +0000
Date: Thu, 18 Jul 2024 15:05:11 +0800
From: kernel test robot <lkp@intel.com>
To: Hannes Reinecke <hare@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hare-nvme:secure-concat.v5 7/16] crypto/hkdf.c:95:25-31: ERROR:
 application of sizeof to pointer
Message-ID: <202407181407.8cpsulLb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/hare/nvme.git secure-concat.v5
head:   4d58e409712027c1084413a8c31e93af4d148650
commit: cab2f509de62d7a22f038537c2dcf86f029144b0 [7/16] crypto,fs: Separate out hkdf_extract() and hkdf_expand()
config: x86_64-randconfig-103-20240718 (https://download.01.org/0day-ci/archive/20240718/202407181407.8cpsulLb-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407181407.8cpsulLb-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> crypto/hkdf.c:95:25-31: ERROR: application of sizeof to pointer

vim +95 crypto/hkdf.c

    45	
    46	/*
    47	 * HKDF-Expand (RFC 5869 section 2.3).
    48	 * This expands the pseudorandom key, which was already keyed into @hmac_tfm,
    49	 * into @okmlen bytes of output keying material parameterized by the
    50	 * application-specific @info of length @infolen bytes.
    51	 * This is thread-safe and may be called by multiple threads in parallel.
    52	 */
    53	int hkdf_expand(struct crypto_shash *hmac_tfm,
    54			const u8 *info, unsigned int infolen,
    55			u8 *okm, unsigned int okmlen)
    56	{
    57		SHASH_DESC_ON_STACK(desc, hmac_tfm);
    58		unsigned int i, hashlen = crypto_shash_digestsize(hmac_tfm);
    59		int err;
    60		const u8 *prev = NULL;
    61		u8 counter = 1;
    62		u8 *tmp;
    63	
    64		if (WARN_ON(okmlen > 255 * hashlen))
    65			return -EINVAL;
    66	
    67		tmp = kzalloc(hashlen, GFP_KERNEL);
    68		if (!tmp)
    69			return -ENOMEM;
    70	
    71		desc->tfm = hmac_tfm;
    72	
    73		for (i = 0; i < okmlen; i += hashlen) {
    74	
    75			err = crypto_shash_init(desc);
    76			if (err)
    77				goto out;
    78	
    79			if (prev) {
    80				err = crypto_shash_update(desc, prev, hashlen);
    81				if (err)
    82					goto out;
    83			}
    84	
    85			err = crypto_shash_update(desc, info, infolen);
    86			if (err)
    87				goto out;
    88	
    89			BUILD_BUG_ON(sizeof(counter) != 1);
    90			if (okmlen - i < hashlen) {
    91				err = crypto_shash_finup(desc, &counter, 1, tmp);
    92				if (err)
    93					goto out;
    94				memcpy(&okm[i], tmp, okmlen - i);
  > 95				memzero_explicit(tmp, sizeof(tmp));

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
