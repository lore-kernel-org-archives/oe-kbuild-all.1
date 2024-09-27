Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42C6214A4E0
	for <oe-kbuild-all@lists.linux.dev>; Fri, 27 Sep 2024 06:01:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727416863; cv=none; b=Sq/Jo6qwijjG2wUe2/19AkEn+m0klT8hhUWN9L5r9tzYehE0zsWLryVlzzutVp/Uwlb/kZvqah4xBL1VKsn67IaFmoihnr4ou2tzV7qvhs6cpe+PToRxk31RO6+ZJ2QBaIVVFBb1IrOAMR6OADJ+0sSVKs3T7RieGyXG3gVYSvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727416863; c=relaxed/simple;
	bh=sDuKpwH0n+vsLCBT5J/JggmkSQqm9fk2U/k4T5qdGt8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FtIFbxxaqzNFSKVBScJHGJGoc+yz3sQgwR+M6cQLDmoZXfhu14UbW6eQXd36MLLvqiEA/ct+euREHEXzRmh9ZEvp2Zt3uBJ5vn6Z/aQK3t+PjSEq7+H0goseQwOIZ1Zrrqrww3Q86BGgT7pJKN/pzGhhsTzCwFevDsHOZ3BhChA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FSdhEHtl; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FSdhEHtl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727416862; x=1758952862;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sDuKpwH0n+vsLCBT5J/JggmkSQqm9fk2U/k4T5qdGt8=;
  b=FSdhEHtlKHzmBXpvBNjCM6jsehU+5k/kvgs+GZOv8hLNWhF10QXPhZus
   Mbxelj+rW8UY04wc0g/AudyZa+sEd354v4nzpZ58zdWJfxKR3dozSjwfM
   268VaZM74SrWXGDl3HF+JEJq7t5kNnlVjYK4J3LJ/24/CSJhllMywNWVW
   BKYlGIWz3ZgWrt7CK4eoj2AtuCJrA6um7+wuyXuOKnjPaxTUMBPhXK2Qb
   SIkVFrh9uJbf5nN0hiPQyKrB5GVyznh+7eT9Wy0SJwhwvx8xLkujDlEFi
   iy5W+ujV/cjr/hVPJLkeFFjENbbzKngU8qfTcV2FwfTD0gq/WPkleGW6/
   g==;
X-CSE-ConnectionGUID: aAM68dJbTmChpjp/rF/Y9A==
X-CSE-MsgGUID: l/1DDmwfSW+gp8JgrQoFEA==
X-IronPort-AV: E=McAfee;i="6700,10204,11207"; a="49077492"
X-IronPort-AV: E=Sophos;i="6.11,157,1725346800"; 
   d="scan'208";a="49077492"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2024 23:01:02 -0700
X-CSE-ConnectionGUID: ESw1BjsLTZyT/bO8S0Pn2A==
X-CSE-MsgGUID: llG1Z4HlRICUwAiAgVlfUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,157,1725346800"; 
   d="scan'208";a="103208735"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 26 Sep 2024 23:01:01 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1su42E-000Laf-11;
	Fri, 27 Sep 2024 06:00:58 +0000
Date: Fri, 27 Sep 2024 14:00:39 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:upstream-f2fs-stable-linux-4.19.y 289/1172]
 fs/crypto/hkdf.c:47:9: sparse: sparse: Variable length array is used.
Message-ID: <202409271313.cWCYAj6k-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common upstream-f2fs-stable-linux-4.19.y
head:   b9aeb147225616494256fcf913c559afd4088a05
commit: 6ad6af5912f72ad8c40baa072c3dabd321695dc1 [289/1172] fscrypt: add an HKDF-SHA512 implementation
config: x86_64-randconfig-122-20240919 (https://download.01.org/0day-ci/archive/20240927/202409271313.cWCYAj6k-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240927/202409271313.cWCYAj6k-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409271313.cWCYAj6k-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> fs/crypto/hkdf.c:47:9: sparse: sparse: Variable length array is used.
   fs/crypto/hkdf.c:120:9: sparse: sparse: Variable length array is used.
   fs/crypto/hkdf.o: warning: objtool: fscrypt_init_hkdf()+0x97: sibling call from callable instruction with modified stack frame

vim +47 fs/crypto/hkdf.c

    25	
    26	/*
    27	 * HKDF consists of two steps:
    28	 *
    29	 * 1. HKDF-Extract: extract a pseudorandom key of length HKDF_HASHLEN bytes from
    30	 *    the input keying material and optional salt.
    31	 * 2. HKDF-Expand: expand the pseudorandom key into output keying material of
    32	 *    any length, parameterized by an application-specific info string.
    33	 *
    34	 * HKDF-Extract can be skipped if the input is already a pseudorandom key of
    35	 * length HKDF_HASHLEN bytes.  However, cipher modes other than AES-256-XTS take
    36	 * shorter keys, and we don't want to force users of those modes to provide
    37	 * unnecessarily long master keys.  Thus fscrypt still does HKDF-Extract.  No
    38	 * salt is used, since fscrypt master keys should already be pseudorandom and
    39	 * there's no way to persist a random salt per master key from kernel mode.
    40	 */
    41	
    42	/* HKDF-Extract (RFC 5869 section 2.2), unsalted */
    43	static int hkdf_extract(struct crypto_shash *hmac_tfm, const u8 *ikm,
    44				unsigned int ikmlen, u8 prk[HKDF_HASHLEN])
    45	{
    46		static const u8 default_salt[HKDF_HASHLEN];
  > 47		SHASH_DESC_ON_STACK(desc, hmac_tfm);
    48		int err;
    49	
    50		err = crypto_shash_setkey(hmac_tfm, default_salt, HKDF_HASHLEN);
    51		if (err)
    52			return err;
    53	
    54		desc->tfm = hmac_tfm;
    55		desc->flags = 0;
    56		err = crypto_shash_digest(desc, ikm, ikmlen, prk);
    57		shash_desc_zero(desc);
    58		return err;
    59	}
    60	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
