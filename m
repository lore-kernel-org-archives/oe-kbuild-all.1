Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5C4C38DE9
	for <oe-kbuild-all@lists.linux.dev>; Sat, 18 Jan 2025 03:41:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737171679; cv=none; b=qxfGurkTdcMPrHlgyPJw4ZTUaqfnS4OFutfXFVKth642tvyATNUi74X7ZS943EyFZn5j2T804X2TFCBqf+W5kY11+DuE+9BiRAK+jfuvIakQpvSn2tE0XO7Zn2dlb6khjoZHYlD3ntrRqezoi0DpxFkNGw1C2HoIRrtj3ZovOFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737171679; c=relaxed/simple;
	bh=bjUOHnHV55PQ0mEq5R1kwfIlyIHl95JXUxJ7t4xQt/M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=eNwUL5l3Z272A8mlvvNa4tkDBmmHwBRgomhGx5j/Ao6fN9z/l3r37t9dAuieyWqQoFABfuAPTSMb8pgyPV0tfF9KCToAylsU+Vo2yVLhV99LbEnWizD0hDL129kUEo7XKgRJ0LMFBLYzSORXj1oCDw5KvF+SlD1/vSJn2noN5jg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SG1EnBQs; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SG1EnBQs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737171677; x=1768707677;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bjUOHnHV55PQ0mEq5R1kwfIlyIHl95JXUxJ7t4xQt/M=;
  b=SG1EnBQsYuzI6fox+jUy/2t2Di4pla/JmsdXRClcudnQesEqXohn2S8j
   OR6IWdILbV1cJdeWQgJTIX0ECfSEbxYf2p0+IxC+jpWMzalfTMFOxQ1AM
   wBKq49rI38BaxJxOrlrHfVF3swTIJDnqkPAHSMdYsevzkNvM+PwL9UxE+
   R87iQGEMNYPVllu0QPMlfgwYY9IpsDzTWrGCIXwOSqdo0r0UMs+ZobtqK
   1NbAJBsKDxx2lAU8S+xg5OdbXWYt570nuB5Cn0FeRrRw+UIjhb/AJr5IA
   0p+kOeNsWpTfpxJRtRmuw8u8FSwKXAa76FoV0S/Na8nvwPOWOD34EcHhA
   w==;
X-CSE-ConnectionGUID: H0xeHE0KTKmk2C5C75vnXw==
X-CSE-MsgGUID: g0518/WxQjSzCQjDQpiAHw==
X-IronPort-AV: E=McAfee;i="6700,10204,11318"; a="36894949"
X-IronPort-AV: E=Sophos;i="6.13,214,1732608000"; 
   d="scan'208";a="36894949"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jan 2025 19:41:16 -0800
X-CSE-ConnectionGUID: s99DdTogRjyAwW3yV5Iyvg==
X-CSE-MsgGUID: KIlc7/nYQ/6BR5c3KaEKcQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="110040690"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 17 Jan 2025 19:41:15 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tYzhx-000U3Z-0l;
	Sat, 18 Jan 2025 03:41:13 +0000
Date: Sat, 18 Jan 2025 11:40:16 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android11-5.4 0/1]
 drivers/crypto/ccree/cc_hash.c:49:9: sparse: sparse: cast truncates bits
 from constant value (47b5481dbefa4fa4 becomes befa4fa4)
Message-ID: <202501181152.8qA5nHOk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android11-5.4
head:   bf5b85fe246873efa65a9dc0631ad70c59eece6c
commit: ca438aa466b8e5010219d3300f65bc8a984c4b0a [0/1] crypto: ccree - swap SHA384 and SHA512 larval hashes at build time
config: i386-randconfig-063-20250116 (https://download.01.org/0day-ci/archive/20250118/202501181152.8qA5nHOk-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250118/202501181152.8qA5nHOk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501181152.8qA5nHOk-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/crypto/ccree/cc_hash.c:49:9: sparse: sparse: cast truncates bits from constant value (47b5481dbefa4fa4 becomes befa4fa4)
>> drivers/crypto/ccree/cc_hash.c:49:26: sparse: sparse: cast truncates bits from constant value (db0c2e0d64f98fa7 becomes 64f98fa7)
   drivers/crypto/ccree/cc_hash.c:49:43: sparse: sparse: cast truncates bits from constant value (8eb44a8768581511 becomes 68581511)
>> drivers/crypto/ccree/cc_hash.c:49:60: sparse: sparse: cast truncates bits from constant value (67332667ffc00b31 becomes ffc00b31)
   drivers/crypto/ccree/cc_hash.c:50:9: sparse: sparse: cast truncates bits from constant value (152fecd8f70e5939 becomes f70e5939)
>> drivers/crypto/ccree/cc_hash.c:50:26: sparse: sparse: cast truncates bits from constant value (9159015a3070dd17 becomes 3070dd17)
>> drivers/crypto/ccree/cc_hash.c:50:43: sparse: sparse: cast truncates bits from constant value (629a292a367cd507 becomes 367cd507)
   drivers/crypto/ccree/cc_hash.c:50:60: sparse: sparse: cast truncates bits from constant value (cbbb9d5dc1059ed8 becomes c1059ed8)
   drivers/crypto/ccree/cc_hash.c:52:9: sparse: sparse: cast truncates bits from constant value (5be0cd19137e2179 becomes 137e2179)
>> drivers/crypto/ccree/cc_hash.c:52:26: sparse: sparse: cast truncates bits from constant value (1f83d9abfb41bd6b becomes fb41bd6b)
   drivers/crypto/ccree/cc_hash.c:52:43: sparse: sparse: cast truncates bits from constant value (9b05688c2b3e6c1f becomes 2b3e6c1f)
   drivers/crypto/ccree/cc_hash.c:52:60: sparse: sparse: cast truncates bits from constant value (510e527fade682d1 becomes ade682d1)
   drivers/crypto/ccree/cc_hash.c:53:9: sparse: sparse: cast truncates bits from constant value (a54ff53a5f1d36f1 becomes 5f1d36f1)
   drivers/crypto/ccree/cc_hash.c:53:26: sparse: sparse: cast truncates bits from constant value (3c6ef372fe94f82b becomes fe94f82b)
   drivers/crypto/ccree/cc_hash.c:53:43: sparse: sparse: cast truncates bits from constant value (bb67ae8584caa73b becomes 84caa73b)
   drivers/crypto/ccree/cc_hash.c:53:60: sparse: sparse: cast truncates bits from constant value (6a09e667f3bcc908 becomes f3bcc908)

vim +49 drivers/crypto/ccree/cc_hash.c

    27	
    28	static const u32 cc_digest_len_init[] = {
    29		0x00000040, 0x00000000, 0x00000000, 0x00000000 };
    30	static const u32 cc_md5_init[] = {
    31		SHA1_H3, SHA1_H2, SHA1_H1, SHA1_H0 };
    32	static const u32 cc_sha1_init[] = {
    33		SHA1_H4, SHA1_H3, SHA1_H2, SHA1_H1, SHA1_H0 };
    34	static const u32 cc_sha224_init[] = {
    35		SHA224_H7, SHA224_H6, SHA224_H5, SHA224_H4,
    36		SHA224_H3, SHA224_H2, SHA224_H1, SHA224_H0 };
    37	static const u32 cc_sha256_init[] = {
    38		SHA256_H7, SHA256_H6, SHA256_H5, SHA256_H4,
    39		SHA256_H3, SHA256_H2, SHA256_H1, SHA256_H0 };
    40	static const u32 cc_digest_len_sha512_init[] = {
    41		0x00000080, 0x00000000, 0x00000000, 0x00000000 };
    42	
    43	/*
    44	 * Due to the way the HW works, every double word in the SHA384 and SHA512
    45	 * larval hashes must be stored in hi/lo order
    46	 */
    47	#define hilo(x)	upper_32_bits(x), lower_32_bits(x)
    48	static const u32 cc_sha384_init[] = {
  > 49		hilo(SHA384_H7), hilo(SHA384_H6), hilo(SHA384_H5), hilo(SHA384_H4),
  > 50		hilo(SHA384_H3), hilo(SHA384_H2), hilo(SHA384_H1), hilo(SHA384_H0) };
    51	static const u32 cc_sha512_init[] = {
  > 52		hilo(SHA512_H7), hilo(SHA512_H6), hilo(SHA512_H5), hilo(SHA512_H4),
    53		hilo(SHA512_H3), hilo(SHA512_H2), hilo(SHA512_H1), hilo(SHA512_H0) };
    54	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
